Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B533E5EF7
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790968514; cv=none; b=BVR9s5rJ0v/3OcwgMUvSz0Uod/1oxQUp77YAc44iXjaE96Xuy4Jk3Z6krdbiwaiIABVXfcWEU1Mxr31Tw3z5jU9VROtQg6FDhG6qL9o2nebVZpAqzWs0Q/OLZNJuO2EEqfoVcSVGLDh0Tz2qTNZOpYtDrVXANTg7+DNfksXcwrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790968514; c=relaxed/simple;
	bh=sNrM9JNYurmnU2j2C+GnCb0f+NAvtRnOB2X+iTI/DO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EwsbNL5PHAyGye3WOU/H3DUGAzO7AKj7M3RCzI5j0V9saNgXDiQkcr6vxjRAKRpZhaUT7qmbc8XxQXHFTqSnbivMQbVQpI6B0rndPy4YEockaf+Wyw8k6kvYtFR0ZsP8fqjAH2NA/hZwK6e0w+3DVgMVZa44ZqZpaEwdyt/w50U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CRVUEJ4t; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CRVUEJ4t"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so1559675e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790968510; x=1791573310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6HrdlYlMCSCW8XF9JagParMEQEfvUPQkj8VTEtDRKxI=;
        b=CRVUEJ4tkOPojwu7GOPspl7KASD7LvJqS7Du30wOvV+nA7bSFqvGbx724jgpvyB0I0
         wRGsZVt+hLVgy+lUY7oWlNHIwE2bM/LVw0oX8AHULff+/5Em6QDByScmjsJluEWIlfEb
         0dNCUgJew/uRo9ngfKWm2BBRDIopzs91YbSDUklWbvXq8mofT0nN9cncNjsjbL6rcbEJ
         oO8ag07oQ6EqLJkzp0Y3r+hu8LTulgLhjB7rQlFwKWb+KGnFJIdcr0DztpPBkMZ9+b95
         VnH0CGPLBjnLFajLJp4UTKUxLrhIPpOSdswYlKIeAouLJOIzTGdiZWvlz6cQ9rH2sdRr
         +Lwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790968510; x=1791573310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6HrdlYlMCSCW8XF9JagParMEQEfvUPQkj8VTEtDRKxI=;
        b=GE3LeA6j6V7YC51V4q6EcCtxZVP2P+skJsXfnwd7PzQt72x20mplKXIoSUGH6xowxR
         +D36aGnvV7WjXKXjoiWa8HbfSanrsXFiKvYC8iaZSc7aNh506HT5GWJKLZ7sEu71ULGB
         PTSF+l5a4xwk4e90871NlpBi5YXJFO7Qe6X+/bumKJ8QNb4ww2K97UDA3jFoTv4Uhs6Q
         Y+KOHmHz1+D3GOQ9+KJmJFS76Rgn7o0Xr8tKQut9nSJSuEvRzKMfZeyiB42QROgpjI6S
         tf6BWvNC89SdXeXp8pLAgnnx1Cn2OhYDA/5yeuCYxLEd1CViMnS2Zf5qFSxcGc8dyVjP
         ZsoQ==
X-Forwarded-Encrypted: i=1; AKwUvBzrgKZVt3Zg8EH16ugNB9inJsbTJTcmdcxSIgKMT8u7TvZj8CsTLK7y5iJ7k6zu5XgdmvT6o80iGY0PP4I=@vger.kernel.org
X-Gm-Message-State: AFuF++kWz4TkI5AjN8Z34+I3r+W83aVM3/MsuK7g+XIXiOSpp23UtoF2
	2xlxevN7Lx6LmhRopArxCFuy7n+p0EpEdNG8SjF4fiKKjQxdk7dYFY99
X-Gm-Gg: AYBFou1b18Mg/YNvzVZ70AqHadnU3xY2dzZGqMDcdagE+avpT8rNSX45K1E+eNhfYr0
	kz70NHgoaiJUM9arRRoJTcO0xJnazY2MpvTtJENDXDBjvBzXA/K7qUq0g7EKGC/JdkfHaqK5T4g
	PYmhlBPik9evcKUICzAJekWMqUNvFmQo36H4W3MQsz+qnMmLsEgXXC5A89/qqp3ykXaK0ddzNpZ
	f50iJIAZMU2/A+BqpBA4bj9RfDyObwHFgOUBmyZublQeqjbtczhIgBNIPsDjx8bMsUID4Crpu0Z
	q9rMrIofxSZAoGUAA1Gyk49ep92CvfXo2p6MBqUWIqaTr/P5hOu7LLL+9VtYgT9yD4HrnrzvZvW
	dVYd3gPqAStdQXVwKhwU7/MIXsuTvBtxa/IPQmFtyyxEpo6Se0VCnrqlEhtxVVZhEn82IHDoY3t
	gPJDXK2foZ0jl6xlpPjkKs6U8iJhODGuz+3ydkr9T9sZz68vWBrAcHS9EfYAIUkvl6UmYusxRSe
	GS2a+l3378tbQShmAR0WIyq1qfNyARTA/xM6qs8pBqCA6Wv97yA
X-Received: by 2002:a05:600c:5303:b0:4a0:1c10:1419 with SMTP id 5b1f17b1804b1-4a027597b34mr60410315e9.26.1790968509994;
        Fri, 02 Oct 2026 12:15:09 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0e1afbc44sm81151145e9.4.2026.10.02.12.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:15:09 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v4 5/9] platform/x86: hp-bioscfg: fix off-by-one in password length check
Date: Sat,  3 Oct 2026 00:14:30 +0500
Message-ID: <20261002191434.58529-6-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002191434.58529-1-meatuni001@gmail.com>
References: <20261002191434.58529-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

current_password and new_password hold MAX_PASSWD_SIZE bytes including
the NUL, but validate_password_input() accepts a password of exactly
MAX_PASSWD_SIZE characters when the firmware limits allow it.
strscpy() then truncates it and fails with -E2BIG, which
store_password_instance() ignores, so the write reports success with a
truncated password stored.

For example, with a max_password_length of 64 or more, writing 64
characters succeeds but only 63 are stored.

Reject lengths of MAX_PASSWD_SIZE or more.

Compile tested only.

Fixes: 8646a3b5ee3a ("platform/x86: hp-bioscfg: passwdobj-attributes")
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v4:
 - New patch

 drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
index f0551b455..a2f50ecbe 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
@@ -74,7 +74,7 @@ static int validate_password_input(int instance_id, const char *buf,
 	if (is_current && !length)
 		return 0;
 
-	if (length > MAX_PASSWD_SIZE)
+	if (length >= MAX_PASSWD_SIZE)
 		return -E2BIG;
 
 	if (password_data->min_password_length > length ||
-- 
2.43.0

