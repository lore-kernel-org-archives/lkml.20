Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585B949DBAC
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436535; cv=none; b=bK1c+lEULAAxps1iOtGTpwFX7Ncuu/3ZLQFjE09zwekFEu5cQE5nwph2KOTwZGpwHVqTBhLaPmlFabTF6+jnC7CtIgF1M2eOAsyhkLlFu5FDNDFCOjM7Y9I4q1zykr8X6XkLKFdwCxmcWkWL4NIjyLuYBPohEArgGw+QxqUaoCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436535; c=relaxed/simple;
	bh=FojhlWYqZBUufn1BDdSyLeFd57efx070/xbYbRX7cvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I/2S6+Wl1hHyxf96eUpzORwE2QLt2XYA8eMQpu8kohr5sv0wRMlAQ9fmLum187gbZBVggNyarR68SnpWH+0CjfSeZSKlI/Mj0DSPRlQigOCQ93FIv+iriZt9YdA8uqIEHDoCqMoTWfEjMBpekDwDM7SdemMs4hJnJbn+XxSX5yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ppgLvic9; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ppgLvic9"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-851cbd64814so984821b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 04:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788436530; x=1789041330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VxhvUoRpE34FtOEmH0TWBdjdbN3XpRSicUZUPCPzp8E=;
        b=ppgLvic9KGRNS6apV0bwD7lKd+TzVAvwEfztSjB0QkfPX60Fw0r1N2T7Pg/+cBpzt0
         OiWngV6wKv7ccwyVH2CuKBU+WgdyaHC+1YfJ5sHTWq9M2m3s1xOH+5LY1xQ1E8KcwxO0
         fBRSOnu/BxB8e2icVO4etaDVxmjBMA4/KAOwaMqhYCiDZ1CpSIXjCrThZHHLzoCLpcj6
         JKMdqQykS479N9eWdLQ7QVWBTkjooaRxxREM1tIkSrFgrQJn7/g+fCBE6uFH03wqy3OP
         +OoFMAJw9rjHUPot4dxDZqfrZ9MVqOmUvRGWLpph3nZIO21gRE63x0sWmk1+Q1JGzLm4
         et5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436530; x=1789041330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VxhvUoRpE34FtOEmH0TWBdjdbN3XpRSicUZUPCPzp8E=;
        b=EMT+Me/OKHRYTGPfMLmVvhRFcTQzzglT2B16vpFiEEIOGandcWtmJ06C1vUE6+cWH7
         yMtZUsgzkoTPuboX+btAmTPzCjpKaAweL/jzYVA2Wrd2vQXfRdquTE0X/jscveGS136m
         to7rQCm6rpXnxMj6ITESy6sjA+KoBQo4w/VjZdMoBmPRNRQ7D0kDxHqhrqPH3OdpKHTd
         6n3tic0mVTVtbyqDDbOXhNQdiX4SRYVdgh1V16+y7IzgWPDtmZV7YKepdUitMh5d74A8
         dmg6BuqQfUVXDw4oKmyNLr/nDnVn1XR+X2cDe1iyN5/G4B9xe36b6G9dJ6XoG3wA+Rqe
         KZMg==
X-Forwarded-Encrypted: i=1; AKwUvBwuTdslwhiKyECLBAZwakoa0+g2k0f9SEdBPY+4ZA12hpiJHOqzH7SITbNXVSutG+jcUoYsMa+Bo8H6FBo=@vger.kernel.org
X-Gm-Message-State: AFuF++m+13h07qiLxVl/enNkk9bWU3Mx3sAkIY2oB5AdC563wwqHS9hw
	k8jideTvqWxslxSBK+RQj+k4IVTNNonYEl44j3/COZNAxPLqH1UYdGkyXT5v4PA1jPI=
X-Gm-Gg: AYBFou1VFbx/soQxI42FKtc7LbmoweJOH7aBkVoUMnTVexMPP0lBm8ZH0Oh5syQRg6w
	2ndX/ldwgHNchuNZbbhyhC2AXIVsE+Y11IU+hFBOc7vTDqHC0wZwdZxgC8KOtvulnG/oTa2I3h4
	7oI1JDbEzh3pNQJRZbLkSUGoZjgZkfb3COVYBZRGaw0P2OjnsDc9zBBVy0IhxG7yAHYLE2vePZU
	2JwBMSugn1rwB1IYsctYkE5qtZ8v3/9TswAT2EtvZC6wYjpGyhzG6yWsFe3n+l5HYbsGQuANeYD
	1WAiPQ5/+AkW3F7zbFDQw3b+n/rTpgO/5mCxyjgpWO/pqbeUUfG/rtRiQtoEuPnypVb+xi/ZK2t
	fhW8NhwDlQNIuFy3XOZZ4tjnBowN7lKZ7CMAfpSPqT7HCyQ42K19rd5VTMYAsNzGOheccxo1xjr
	s4lICD/q/1e5nFiVg5V2Nnb9xgfWmmnxCE/9UJOtrDufu+ZiHYW1dX299BL7ISyMZ6QdBo+EjrC
	3m9BprBH13y
X-Received: by 2002:a05:6a00:4f92:b0:857:73e2:9105 with SMTP id d2e1a72fcca58-85ed94bb426mr15557084b3a.21.1788436530206;
        Thu, 03 Sep 2026 04:55:30 -0700 (PDT)
Received: from DESKTOP-M1337NB.localdomain ([211.241.115.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc071836bsm2750914b3a.44.2026.09.03.04.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 04:55:29 -0700 (PDT)
From: Jonggeun Park <jakejgpark@gmail.com>
To: ardb@kernel.org,
	jk@ozlabs.org
Cc: kees@kernel.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com,
	ilias.apalodimas@linaro.org,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jakejgpark@gmail.com
Subject: [PATCH v2] efi: vars: commonize the 512-byte name buffer quirk
Date: Thu,  3 Sep 2026 20:55:16 +0900
Message-ID: <20260903115516.32495-1-jakejgpark@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815074844.1330-1-jakejgpark@gmail.com>
References: <20260815074844.1330-1-jakejgpark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some old UEFI implementations reject GetNextVariableName() calls with
a name buffer size larger than 512 bytes. Both efivar_init() and
efi_pstore_read() open-code the same workaround of resetting the size
to 512 on every iteration.

Move this workaround into efivar_get_next_variable(), which keeps this
quirk in one place, resolving the TODO in efi-pstore.c.

No functional change intended.

Signed-off-by: Jonggeun Park <jakejgpark@gmail.com>
---
v2:
- Move the workaround into the existing efivar_get_next_variable().
---
 drivers/firmware/efi/efi-pstore.c | 10 ----------
 drivers/firmware/efi/vars.c       |  7 +++++++
 fs/efivarfs/vars.c                | 12 +-----------
 3 files changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/firmware/efi/efi-pstore.c b/drivers/firmware/efi/efi-pstore.c
index a5db3534f..4f2594d08 100644
--- a/drivers/firmware/efi/efi-pstore.c
+++ b/drivers/firmware/efi/efi-pstore.c
@@ -164,16 +164,6 @@ static ssize_t efi_pstore_read(struct pstore_record *record)
 	efi_status_t status;
 
 	for (;;) {
-		/*
-		 * A small set of old UEFI implementations reject sizes
-		 * above a certain threshold, the lowest seen in the wild
-		 * is 512.
-		 *
-		 * TODO: Commonize with the iteration implementation in
-		 *       fs/efivarfs to keep all the quirks in one place.
-		 */
-		varname_size = 512;
-
 		/*
 		 * If this is the first read() call in the pstore enumeration,
 		 * varname will be the empty string, and the GetNextVariable()
diff --git a/drivers/firmware/efi/vars.c b/drivers/firmware/efi/vars.c
index 3700e9869..0f95fc60d 100644
--- a/drivers/firmware/efi/vars.c
+++ b/drivers/firmware/efi/vars.c
@@ -191,11 +191,18 @@ EXPORT_SYMBOL_NS_GPL(efivar_get_variable, "EFIVAR");
 /*
  * efivar_get_next_variable() - enumerate the next name/vendor pair
  *
+ * A small set of old UEFI implementations reject sizes above a certain
+ * threshold, the lowest seen in the wild is 512. Set the name buffer size
+ * to 512 on each call.
+ *
  * Must be called with efivars_lock held.
  */
 efi_status_t efivar_get_next_variable(unsigned long *name_size,
 				      efi_char16_t *name, efi_guid_t *vendor)
 {
+	BUILD_BUG_ON(EFI_VAR_NAME_LEN < 512);
+	*name_size = 512;
+
 	return __efivars->ops->get_next_variable(name_size, name, vendor);
 }
 EXPORT_SYMBOL_NS_GPL(efivar_get_next_variable, "EFIVAR");
diff --git a/fs/efivarfs/vars.c b/fs/efivarfs/vars.c
index 6833c3d24..5a01833a6 100644
--- a/fs/efivarfs/vars.c
+++ b/fs/efivarfs/vars.c
@@ -391,18 +391,8 @@ int efivar_init(int (*func)(efi_char16_t *, efi_guid_t, unsigned long, void *),
 	if (err)
 		goto free;
 
-	/*
-	 * A small set of old UEFI implementations reject sizes
-	 * above a certain threshold, the lowest seen in the wild
-	 * is 512.
-	 */
-
 	do {
-		variable_name_size = 512;
-		BUILD_BUG_ON(EFI_VAR_NAME_LEN < 512);
-
-		status = efivar_get_next_variable(&variable_name_size,
-						  variable_name,
+		status = efivar_get_next_variable(&variable_name_size, variable_name,
 						  &vendor_guid);
 		switch (status) {
 		case EFI_SUCCESS:
-- 
2.43.0
