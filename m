Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06544B129D
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 13:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791380884; cv=none; b=nbWAH+lkmvATEOpbyn58bSKy8S1OkdIxTuWwtGcXkcqkOLUERJNREPQuKPDJjXwftlmXwidX9AmVE/582qSfwTEd/hFiNc5KTEBkKLD5mBEnDqSzsR8wufLNoZrHqUjVBz/g2lx6jnifSRmpPtWbFY3QcMQ/2hEt2aYSmIJjiCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791380884; c=relaxed/simple;
	bh=onzGCFTh+2rNXII7iXfF1revtsH+T4ZuDUAmpOR8U0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tXV7P75TKsLaoZv+4EQ8hycberDhxqD+qwkOWj9/6qQ2PjrI2BwFFeNiCFaUycfJXK6eAX53lQ7ddw0BJT4i2zAJCBrxWjzlww2UahJpLaIG+pfhemvlmC5H27jjmtFv3JmF29dgWNiqKUEkZfuzGcPJNTjh5TJVi84+PqSvSDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+aIvdJx; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+aIvdJx"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35171047ac8so18314eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 06:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791380872; x=1791985672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sui9Al/keQRn9LzsJhep5PKyFrhoL0LEL3YQX5XZ59A=;
        b=B+aIvdJxw0B7pPyEQAT8Ii4hOkyralIs9Zx+j6asPBAYpckl2n1vost6S+3VS6j37j
         cpqtOEQVZzgM/3aqBZd6Ekk0yfP/MRkqQTNlpn7FLnj7VtOXaCbnN255MCh8ystFcKHV
         P3kD6So7R0aTn9k00rtSw/je8POxJLwdbKYTuxt7aNpZ2ncvskTdcaAAmvLogfczOQPB
         4upeKAFoDFwWaffT5k1wzjTcUBc61RhyitaLgBoz7w8o8BkfBnUOP4jffVfr1+WOu2mr
         Q2d6E4Yz5JgEprlZ/yaL5xWeTcGFU6sL15m9GAGYWytHXPHtHS8VH3I7DH+Jo3Fz6cAs
         520w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791380872; x=1791985672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sui9Al/keQRn9LzsJhep5PKyFrhoL0LEL3YQX5XZ59A=;
        b=aCTN4wwEj/3jYARGIMQmvDtmJ//H6aJjquRHN3vnfU11LBxinlVeagxT/lZLdbZ6Fp
         k92Ed8L76EUA8Q9nRfzbNH0zpBy4tJm9BHMLM1sYpGBTrird0Gd6wl6gwqOsYu3vDZZs
         Ar1u/gUMYy1+G7N/QEL5HTxAJbJrv9LcZZJTAsun3k64xQyhHZTFZUe2hNTnkrbysrUE
         ySPYjR3d1kMysD1YXVcAaE6Pzl8jnQCVOJTevIqPuJJkK48Ih4ZR7Ho6zv9oES7VRSjW
         x4qqcASD7jf0PwVzX+CeEfff+VWYepG3VmeENKuGWBUY/IZl0z8zYC4/UPChdiFOAnnd
         qs8A==
X-Forwarded-Encrypted: i=1; AKwUvByz1h2m+Yan9ZDt4gyPw0JfOpFhg0r66Z3WWLFHXjoXC/g9ysG+PUxG6oINlpWQukvIQfoCZqVDII3GZy4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvjue1Wf1XNKX5qa6DGw21qlVjM0wALQuUHZ5lMkj1CujUt2DQ
	uH+TdKQ19/XCztq2xjsWsdDxJzAJ3YlmUg6vm1lMYaqs+ayzsJJ0MGlO
X-Gm-Gg: AYBFou2gIYbfvBPOBDGJw2AVYLJElvm/NESseqdCR0cFoftbU40pfJVQB8/25gXhYq4
	ujmXzrueX0ZWOx/H0KaYRMm7yCv3ZoxaPLiGJIyYumJ43c5FO90qN26O9onxdjaxw5R6VWKF01r
	IDxaZGURza7sCk3vRefHgzN/KRIlr/gy4YQlHbP6QFpfQqMJAtwfSMzkr80vntrrtoDfcd7hr2f
	iNLOkWtmpQZIqrp+L9PqLpfuMVZM4G/WXkjt2bjjHIrBTqDw/4s9eOusujUmt6870gl+QfzUbI5
	ZPObkqWSi2Df9o3uTjTJKJIW2I3yJRRqflM5SUgFi5EJGdNiiuXaodLeQGaOJ6EhHFpJ8icSf2P
	fdQrOR3inoLXBEyt5KKw6X2fyumcIMZxK6YDr5TtRhpcLORF0tqv1xKrUlbOk5ZARkHUWJ2xlE6
	pygn8NgYysGcIZ7iUSQwy6Fk5SvliO+uEDnp31THTUumbSlwmYVD5Bp7+C32Y7JESfq384jslQn
	12tiX3v+txqt0COv3JB1c0LxNIq4ykssnK6
X-Received: by 2002:a05:693c:6089:b0:351:4746:49d7 with SMTP id 5a478bee46e88-3515de434dfmr2404250eec.5.1791380872216;
        Wed, 07 Oct 2026 06:47:52 -0700 (PDT)
Received: from fedora ([2a02:6ea0:c803:3091::12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aeb5c2esm7304472eec.10.2026.10.07.06.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:47:51 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 4/9] platform/x86: hp-bioscfg: allow clearing current_password
Date: Wed,  7 Oct 2026 18:47:06 +0500
Message-ID: <20261007134711.473857-5-meatuni001@gmail.com>
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

The ABI documents echo "" > current_password as the way to end a
session, but validate_password_input() rejects an empty string when
min_password_length is nonzero, so the password stays cached.

Skip the length check for an empty current_password so the write
clears it.

Compile tested only.

Fixes: 8646a3b5ee3a ("platform/x86: hp-bioscfg: passwdobj-attributes")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v5:
 .../platform/x86/hp/hp-bioscfg/passwdobj-attributes.c    | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
index 8018ccb2b439..96172342d4a0 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
@@ -60,7 +60,8 @@ int hp_get_password_instance_for_type(const char *name)
 	return -EINVAL;
 }
 
-static int validate_password_input(int instance_id, const char *buf)
+static int validate_password_input(int instance_id, const char *buf,
+				   bool is_current)
 {
 	int length;
 	struct password_data *password_data = &bioscfg_drv.password_data[instance_id];
@@ -69,6 +70,10 @@ static int validate_password_input(int instance_id, const char *buf)
 	if (length > 0 && buf[length - 1] == '\n')
 		length--;
 
+	/* An empty current_password clears the session password */
+	if (is_current && !length)
+		return 0;
+
 	if (length > MAX_PASSWD_SIZE)
 		return -E2BIG;
 
@@ -97,7 +102,7 @@ static int store_password_instance(struct kobject *kobj, const char *buf,
 		id = get_password_instance_id(kobj);
 
 		if (id >= 0)
-			ret = validate_password_input(id, buf_cp);
+			ret = validate_password_input(id, buf_cp, is_current);
 	}
 
 	if (!ret) {
-- 
2.55.0

