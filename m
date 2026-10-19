Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F51E4FFA5E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792418252; cv=none; b=jImFznBTOypa40mVLU83p280oLwsfCucOB5AdTyodQXngpH82YkiKKVONHor1qG8MvAndTAzDrDpNr53m4dOT6YuVbmB1eJwKyI5pnCes0Zn8gyVWZVjUtzqONuPPnukyc3qzHcNwq+ekgocRCGKyTLJfHMnGzjAWrCgh7DjUmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792418252; c=relaxed/simple;
	bh=fjvAi9gBmKMfVEEh1GwhVjdVvjqeXeo/SssrFZSAIlk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l/P55P3XZANGatvKZgIItsQu26eoRVgfLoRkyexZpYJ5+XVufp21OjQhATV+oFNnsuxEh13WltRwH8jSMX6/9VRx1wXyII8hXJhWUAvSJFLpQi3ARw491HDZeIUsk+GrkSUJqZlkFEJIr/wF4HJmt/+BZeWPTTKh1k2jQFRBQCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SwIILAQ+; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SwIILAQ+"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1517bda04a0so1482012c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792418249; x=1793023049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qHmwVRXgo6cTlOspH9FWDod09fxFDoidqai/OyNIW7c=;
        b=SwIILAQ+d6JifB6wzUagiIIZKH7rVVDFSGJCZe8j1aMr15/jKkPd7/2s1vv6TS4eJS
         N6YrGFacL2yvwb0vAxK4gFVpAgnCpp/iMjwuV283RC7nHpmhBa5iZxVMsaoNAEwYrPK2
         C6Ntyg+JwhTbz/UwoUMKt7Pf4tl+Wf6hBA3Imfr7g89fhGLp4Kxh26PFe6ZyBK2dY1UY
         buEouQDo/DHXqzDkMw0brnF9tyBg+ZmBIxk40uEEWb6maVHegu34CKrhju81uMlmes9G
         JLeytCoMpSd4ykkiHvZdC6aZeznsrqkWQ5dtQ6lyzkOFDioI+vNbcYdsNpAQJ3NbvJUq
         puIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792418249; x=1793023049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qHmwVRXgo6cTlOspH9FWDod09fxFDoidqai/OyNIW7c=;
        b=AtRbZYV+zbEiDNOCu3ZtDTRHRI+C5VDvoGeOGFGbSfdXDBn0ETheHepD/G43j5Tq48
         Gxz1qrXqKUz4B2L77JD5bIxiZMvQHaSP5BTy0qA1mtrit76VEX8T0aKN39ouoVufnWXJ
         FHvMGA3Y3jetX2uSN6SvYD7KFTLCciumdpX+rT4bMc8+IlI9JW/DBij1M4Jmubvyk+6t
         RkHjhM3qkYnLj74jCCqEf0Y6f9wlx3wNesO3BfGBdQzgf0xMjNsSM6cnX3ig2MxhDsww
         Q7PsKEcqBfCJbjbskpVeTKe3fEZJI7JQGWx5opLgcOoEUUGH7n0odAoDeSU2gfiaVLX0
         6rmw==
X-Forwarded-Encrypted: i=1; AKwUvByOwYuTaHgubtHNDT6Kbsc07OlEAccYOUcSm09mJDVlBdJ2IZYpHwgwhaHWwZDhpiphhYQmK1Xr+xeum6U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4KB/SJPLrP5G160z0fAlzqO43gZKmIfdg2S7FMNKE5zY2tjhs
	Xb6aB0YVAaNAtnO1/WGJQT60nbHg2eIMDYC+fgfyyWzyLB0mrdGK7XMHmONv3Hjg
X-Gm-Gg: AYBFou0neGBk4OIfcTMAOXY9bSL7ITF7qzCL2h4k9ZYBBAk0ko6Gchh8kEgz+ng7HNU
	lt5fk/MR5vtWx0yYfhkI0W6zSxpuO2bhOEBhh2LmxEW1+UA71EhtJqECc9SXGHArtX9UNaUj0Ae
	nFSBVQYLuJVY+wg7sA6SFe2bHH/x+dNfmpdn1X3EKCMeRctLsdqDutpmmMfKAQF+b82j/VnCnBU
	u0qLw5E3nSfvnX1R5uUhuEKbMSbWtx1rxryxZijGLdYFHRqz7yxOBvNDJFtVtBeYuI0tuBXDOeI
	GAwSdJYB8yPu8K2ZBpbsa6G5EDlTCYLzt5iZc2hgdSLNk21dKiEvUuYKhiec0eAplWvcuU0Coui
	sHlz2KzJQ5M7f656gCxRJPE+EROgIG7Fjg49LD/8kVsVBg7Xt1DPXifGKNc/50+ojKiD2JtJVjv
	+DegPo6LfjXbk1cKYMop3MojP3GamM0Lz23LHaaiGht+OxAPXqNYioRCQj9c0Zef8kPjwnHC6k/
	LXFTRE=
X-Received: by 2002:a05:701b:4559:20b0:144:eb46:c31 with SMTP id a92af1059eb24-185120abebbmr10668293c88.17.1792418249139;
        Mon, 19 Oct 2026 06:57:29 -0700 (PDT)
Received: from user.. ([2405:201:c052:b00b:5c3b:b91a:15d0:4481])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831acba710sm39831494c88.13.2026.10.19.06.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:57:27 -0700 (PDT)
From: pavankumaryalagada@gmail.com
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: dtwlin@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>,
	Alex Elder <elder@riscstar.com>
Subject: [PATCH v6] staging: greybus: remove redundant error message
Date: Mon, 19 Oct 2026 19:27:17 +0530
Message-ID: <20261019135717.40979-1-pavankumaryalagada@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

Remove the error message, as tty_alloc_driver() returns -ENOMEM
when it fails, so printing the message is unnecessary.

Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
Reviewed-by: Alex Elder <elder@riscstar.com>
---
v6:
- Remove the redundant error message, as suggested by Johan Hovold

v5:
- Drop arche-apb-ctrl.c and arche-platform.c changes because the
  files were removed.
- keep only the uart.c change, as the fw-core.c changes are already
  present in staging/staging-next.

v4:
- Return error codes directly instead of storing them in ret,
  as suggested by Julia Lawall.
- Remove the unused ret variable.

v3:
- Extend the %pe conversion throughout Greybus, as suggested by Alex Elder.

v2:
- Use %pe in the firmware management case, as suggested by Jeremy Clifton,
  to match the other cases.

v1: https://lore.kernel.org/outreachy/as0nhVbagZa8Birm@user/T/#t
---
 drivers/staging/greybus/uart.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index d47f00751e7a..4de61fca6725 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -956,7 +956,6 @@ static int gb_tty_init(void)
 	gb_tty_driver = tty_alloc_driver(GB_NUM_MINORS, TTY_DRIVER_REAL_RAW |
 					 TTY_DRIVER_DYNAMIC_DEV);
 	if (IS_ERR(gb_tty_driver)) {
-		pr_err("Can not allocate tty driver\n");
 		retval = PTR_ERR(gb_tty_driver);
 		goto fail_unregister_dev;
 	}
-- 
2.43.0

