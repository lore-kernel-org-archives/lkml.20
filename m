Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5BC4AF175
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 13:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791380889; cv=none; b=sIwXLFynSDbiD6xI44L1s9pMnD3WcJrKL/lWD+ncRSzNKt4o5KZ2fSrHlmsXTpHapkscxGQOYrYnzipDZZlrUw5mvBpvLIfjgNqCyRRKTlB+uyRjpQq5pqD0wOhVYEEG+qEp9NyJoBKI2MA86Z2ShQ7rivgaq45Rqfq6TDOWL5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791380889; c=relaxed/simple;
	bh=/HD88MhnKFAMDzoq9RntCSwhmhVSuHWz7WXu39Hvt54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K+jmpiRwGm4cFWBjZhgrxYYwjPYSf+XT9Rj+ffrd+jP4f6vz55gOrP/CEh0sVvpNSTByEeX+Valwv2UsFCow5KXeoc+2djfmuxvMChJOCGGLoSsLud16ZNssZlNdbKnt4hJjl1UjEZ5m4/tPMVqwVxI2fBjZ29ECIRmEijjnWrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IuAZYJUa; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IuAZYJUa"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35120d43ecaso6046853eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 06:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791380877; x=1791985677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sAKtW8GEm7vf+UvpgbiBVs6c9YCpJRP/yFtIzclq04Y=;
        b=IuAZYJUarA50eAcBi2+IAYJfNyZqeCZJK5bDNoc8exp+DHWdBAtyvlnzGI9qpuOSnf
         HTFmzjdDwxcnlNwwCkJWlAURbYaXuSMHQlFFJlkhbhyjxfCoblcCCGKJlBQ7ynqXU/ak
         ps3UUJkrvHG/5b07YEPmu6qIsywiB/5BuO2pdJYn8LNAvRFDJsgKPsRT0ETQmxuOGwlo
         ok3pFZDBjSQjCNdf3oRwI+RPy8J0zcxjAzoee6c5D85Ec38ycfJXTBlqS+q0nT4tolD8
         5edlxvuEJxHCrHRey48z4DK8mjc8JXc03n+blhcyK8AHRIBgPuSMFyDpJb7qodNrx88d
         fBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791380877; x=1791985677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sAKtW8GEm7vf+UvpgbiBVs6c9YCpJRP/yFtIzclq04Y=;
        b=CLExqu0VI48qWywWXrcfGE7aPTBrtIQZQxq+PVWm7zTH6eXk63DF52GN/Oy/ojzVZx
         b3ktTv+W5MKx+rEcOle4KE4XJdkPqTf8zef2t6FMndJ6r9U5valh4BFpGQsW3PG6b2A7
         0SA1RCWu5rY2Jjt/9ka4BvRYWHuSjBN5X+FoM9FHPjB1H4W3OauCdSqi2F8HiqcGrv/u
         eb597pV+sUBMuAC54Te+iibJ478m+yK+P/IUD7bY7aWFcesij3XjZHmOB6tfFpY/HvW3
         Wat8pV/IMycvxdmb/DIURTfE+wDMWMORJRo5BDMKFFyFrV7HC47jXsIRlILkYloL+ln/
         AFtw==
X-Forwarded-Encrypted: i=1; AKwUvBxw4rD2QanRraB3DaBr6mHpSy72xBkIl+3qiloksE0InnjvNU/ijLluoIFLAEA8IJoOR2ZMa9ILFOK2k24=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmqO0uZziexr8mkAvNKM348poIRfubdIuATiAmR1gahf250mLH
	gX1lGA65OQfwSp8vSom79OHaXAqxFCRwM8q4aTkF5e9gEVsi+8Ap3lRC
X-Gm-Gg: AYBFou1Z6ShBWMUVp4NU3SGGXwy/l7A9eRT3FqTarOKV8LM6HVg0aVOz223VttrOqrJ
	IfJHqyCC0kkV40CxrmzpSZi9vvR6h4j6DdATq35m+ofpnAUh10OfmyK6GYZ58D6KFdkQEpizaN6
	C2a/NCqeVeoUFZ3fzRfe1BymK3AV8O+vTCSO8xmEP1cHtJI2Gw7jy5OU24RAfuoGX9jhQ1ltQbv
	zmf6Ptv8bfResZqd167gP3t4LivOybwrC9c4MMczGVY35zI0/UXzo0cb65nxl1VfU1yvIQuuyVN
	3V2lCUPLYY/fAED9EQPi84qcMSSxlHzs7Itl70/5vtl22RmXMx4v0rVlKoouLgtqkp5LLOZDS7Q
	N+sfmuJhZB5kTHotSsBXyQpGIh/gHEpu+KZ8Tu4jZsZgumUwnKPe8BuRdzp0EKKusGh1k8lhyBt
	rrw/zzhTyr1fZJ9nSDW3e13FvK5epef3yL2gi3vvdyQoj9bc8qf1PhD+Fq/Xfgs+51yNJCvJQ2j
	ncRNJZtc5YyMB0YbkAQcD76ikDwwWJ31vINhF97aeL9xR8=
X-Received: by 2002:a05:7300:2728:b0:351:1222:7189 with SMTP id 5a478bee46e88-3515deffe63mr2519697eec.25.1791380876688;
        Wed, 07 Oct 2026 06:47:56 -0700 (PDT)
Received: from fedora ([2a02:6ea0:c803:3091::12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aeb5c2esm7304472eec.10.2026.10.07.06.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:47:56 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v5 5/9] platform/x86: hp-bioscfg: fix off-by-one in password length check
Date: Wed,  7 Oct 2026 18:47:07 +0500
Message-ID: <20261007134711.473857-6-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007134711.473857-1-meatuni001@gmail.com>
References: <20261007134711.473857-1-meatuni001@gmail.com>
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
 drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
index 96172342d4a0..af2635e31c0b 100644
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
2.55.0

