Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792541092;
	b=rghlRggsGLL1fcl7s/byD0t/t9XJD4Hpxk7UEJ1mwJKJLpJD3z2l6vz9+DFpyrIKZa1m
	 K3neyj0P9JhP8xMQFqta2DkzQg/KWjO6zdLrqJmkU+xTonfMFf7ajf1yMXYfJo+6+H5OB
	 0aV7fcn5bN6WInaYVwJnChg/SSFGTlWRCEdo86KOtj/+D7OK5YQr6CsA0mKr90L224gYM
	 oNQiou3czdDanbpg+bYuIuOcQugrzwiVL2Ngb8iXD0pcluXh81A4RZLD5a76rJlY0X6sh
	 R4nkVvtRF/IXd8XZ66zuo6pAO2A6o8UiT9OE5xlOMsreg47Tv84ocPoD+oQ7yCOdaXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792541092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:To:Cc;
	bh=xUa6JaJZNycf/k/4rdNTJ5HfB0iwYIh1C+vAcX8S0EM=;
	b=IjvoBulSFqcSiKW5W1fLHA2PpeREgsqXRXruFtlmDCK2tuEFy9GInVIFAsTOiqAz+40q
	 tbBP053YS3NxO3y3t0o34Lc3KMASv15YnrtZ+hwjTg9uEZ+VNYgBiVL5J7/8jTgoMSaC5
	 EgVpIa6hArR9cR4Nsf/0nYCghIXBfcGNz/Gsrht2dITD2y9m0ygGZptV9MQ2BdBEDqYbn
	 jU2gAwfdYwxMljnf38lhTDrw//AAHeNsqcVKaOD8fcnsF4q++7QXbpAiWcbh1T4vJ9n3X
	 MDMGV5UvbkReHUw9PDjKvmm3c5C3SLO0MHc/R4hilu3Yw/W0uVDdOv6fdDwIC9ZIUrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RWHYEyHj;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC4A606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:04:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EC4A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RWHYEyHj
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1dec056ddso704415e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792541091; x=1793145891; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version:subject
         :date:from:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xUa6JaJZNycf/k/4rdNTJ5HfB0iwYIh1C+vAcX8S0EM=;
        b=RWHYEyHjGpdFczWWrkavawDH0N4jvigmgtftBFmrbFoGdPLg9RnJqiic+Zc3IXVJEo
         aV+cznzEXyrevWxUQfucmfl1rIP9JMUdW28xkNkl6I+UgQAFPrIZ6jLNA6U+KW7AqxyD
         Q5h5Un6iYIpVQ3mlh7V5YTOWHs7sPrf4H5EV+Yi7SRWHiosFuKx0c5oO9oIHNXSIAhfQ
         1R3bNFrZr1FIPC0FXZ6YYipKirHkBOAkWfJQaWvr9dM/p0eHXou3dmv/bsoSAF9AQRqV
         xHK4A4bvJJ690hht+LDcYE2D4/cyirjWdwcW/ITRCrQb/PhkOHjU5x+2z3bqncPyineN
         ZvEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792541091; x=1793145891;
        h=cc:to:content-transfer-encoding:content-type:mime-version:subject
         :date:from:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xUa6JaJZNycf/k/4rdNTJ5HfB0iwYIh1C+vAcX8S0EM=;
        b=CC5O6o6e02HvQQTFYDaDFaQbMZIZwVgfL1mvIUZnpFq/kY9F7A1Oie93FAjsDJ6yrP
         tA1SGDew94NEMKJAHSEnn4NxNr4QrUOZsW6Ion+UMHzvHIb2btAXsjBwFkKAA7a4FKcy
         10RNitFqnA5eyhfSkvYnQqyycdI1RtdAdBcA7uEC9sV7DC21ogftfnrpJ7ayql+raqo2
         Fr2XNbaCj+6Flat4BOFuqW6GbqOVhmhb3Ds9Cs1A/BQLcPpoEvMy9vG0cf/bRjSKYWoE
         +zZ+BexK4i1KzANkEsEIltxuKcZQN/FWHjXa8Jr4NkI2Qt8tjA9cjDfdmmUqZMNCXKns
         UmtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsHMVSf97ueIp0nPGpc7BFEm4iwjXPZlLC+xL39iEPY/amBn6FY+ROWnnpDh4KXkT7W00BC3bV0H5TGww=@vger.kernel.org
X-Gm-Message-State: AFq9FYJszTac2weVNHluFo8I2Hvb1R37Mrsy4VVMiuz40wfknjSOhCuI
	dVU6e1IVRRGLNW5MWL/7zA8Q92dHAE5FxDzV03Dz+tyYLN6BUbK5oqpc
X-Gm-Gg: AYBFou2esrYx2hspbBhbMnStMbKXL/wsN5LaPo6FgEwTWXkw+jDqDyetYc9usmYS+O/
	/vEWjk8qR43s9SMbrOyhSBJ7K3RVqnBQrwUKDET/jhQsnCxLhfVL3RTHq9DzZNmZtU4ydTC4X9m
	KbhK9SiT0bWkkkJL+kpWq97/h0s/iHebVruab4xfE7/znFRQT1A7OxT68C8bJ+hDOsrnlWfXGX3
	2ZLNw4Ojcs2hIOU7tGHPZ+jzUrhKxNZoBLBDFdmdRWzn4q8s0GQEfXetc0nbj0JIzWmbqj1R9gS
	M+8YNbq1QjsuU/WwxMLgbSXq54UszWyxe5CqWJwtQT0b+DQRefhp4ckanCm+Gr9ivY/YS2/hVag
	AM0suKlz+5GnARjXmrQtiVQxhT/jHeG700ZtybI1JB3OmoDR7cUx/tkRuk7IjRV8OqWoxma2ur2
	gy6OsqIkbxxFd4j3+chfw7veq4XwUfY3jQ/G9NMzN3EHqJfffGwT86lwvCwLj6HKQJh8ZlVCTUa
	ETQgxiZCuNHgiubPY/CDqW53kWPAHa5r2bNxZwrS4zqGD1vyvOaoAls2UDVUXVmKtaSsg==
X-Received: by 2002:a05:600c:5252:b0:4a1:d52e:c2d9 with SMTP id 5b1f17b1804b1-4a1fdb1c387mr5049285e9.23.1792541090451;
        Tue, 20 Oct 2026 17:04:50 -0700 (PDT)
Received: from btrfs-unify.eml ([171.22.87.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd234fasm10213285e9.3.2026.10.20.17.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 17:04:49 -0700 (PDT)
Message-ID: <6ad801a1.7e3d83f3.3d770c.7180@mx.google.com>
From: =?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?=
 <adriangarciacasado42@gmail.com>
Date: Wed, 21 Oct 2026 01:35:30 +0200
Subject: [PATCH] btrfs: unify __printf and __cold annotations on error
 reporting definitions
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: David Sterba <dsterba@suse.com>
Cc: Filipe Manana <fdmanana@suse.com>,
    Chris Mason <mason@kernel.org>,
    linux-btrfs@vger.kernel.org,
    linux-kernel@vger.kernel.org

In fs/btrfs/messages.h, _btrfs_printk(), __btrfs_handle_fs_error(), and
__btrfs_panic() are all declared with both __printf() and __cold
attributes.

However, in fs/btrfs/messages.c, only _btrfs_printk() has both
__printf(3, 4) and __cold on its definition, while
__btrfs_handle_fs_error() and __btrfs_panic() only have __cold.

Add __printf(5, 6) to the definitions of __btrfs_handle_fs_error() and
__btrfs_panic() in fs/btrfs/messages.c so that all three functions have
consistent __printf() and __cold annotations on both their declarations
and definitions.

Suggested-by: David Sterba <dsterba@suse.com>
Signed-off-by: Adrián García Casado <adriangarciacasado42@gmail.com>
---
 fs/btrfs/messages.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/btrfs/messages.c b/fs/btrfs/messages.c
index 0704be7be..73acb69c3 100644
--- a/fs/btrfs/messages.c
+++ b/fs/btrfs/messages.c
@@ -116,7 +116,7 @@ const char * __attribute_const__ btrfs_decode_error(int error)
  * Decodes expected errors from the caller and invokes the appropriate error
  * response.
  */
-__cold
+__printf(5, 6) __cold
 void __btrfs_handle_fs_error(struct btrfs_fs_info *fs_info, const char *function,
 		       unsigned int line, int error, const char *fmt, ...)
 {
@@ -276,7 +276,7 @@ void __cold btrfs_err_32bit_limit(struct btrfs_fs_info *fs_info)
  * Decode unexpected, fatal errors from the caller, issue an alert, and either
  * panic or BUGs, depending on mount options.
  */
-__cold
+__printf(5, 6) __cold
 void __btrfs_panic(const struct btrfs_fs_info *fs_info, const char *function,
 		   unsigned int line, int error, const char *fmt, ...)
 {
-- 
2.56.0


