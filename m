Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0152647143A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519025; cv=none; b=DJVXNNNBf6K7GXU/iSkA2FDkx+zzdyV1C06fUVnDwdCsW8HrEDqwcWUNV4PivwKVnaV7Tesa18/VTwZXaOPLK+xItcBc6fduFPSPitqBZlrXJCrKK6EVkFFoFPBokKOo50b6OhC2S6/KSn5JWyE/2vUibbl41QfrJ4D4zRw3utM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519025; c=relaxed/simple;
	bh=cns+cFeR45F7QjQxLtzp9V9ghZwVMWKETKWU6WYz1WQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jeb5I17LF5GzeIAZMFG/2t9W8rNSmbEUZetRgQeuzjFqOymHFWmKqTVjbln23Eu07T6tYjvolmfrYZlU3m0acyBNqmZwZkl89AhdbsiqIqE5h+qJh729bK+ETHu+xKDXWLDpH+MQ9vLOrQn9TlOXNGZxi9oC+zWhd9OjHJ2XXjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HWwn0QyM; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HWwn0QyM"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-39b2ad862bdso597300a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519023; x=1789123823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JVe3j7HRHHIhbvIbEK+C2SoCEY61/0kcnS4nfccAWlM=;
        b=HWwn0QyMlbfCOWLi/UhulGU1ZM8UyEmQgtUt9vz0TVTgyAyWBjJp2WHlENuiceDjKK
         NsWAaDbV0euMphyg6G4FV7Qyc1URCiRbQnBbJcQ6noWXRgS6hI9p58hG4/JXClnBAvID
         dsIL+c+zf5dWAktW91A9rFUQkcM+TRHuZNW+s8tgaww8vYZHMgbFPtd7QHQDLU7pByxy
         bKQj8vDkJ5QcKN0JlvxDF+ebmDkYV7fL3avlTwlmMO+B8U+BvWaQdhSG3ZyUKSPH1lB5
         5dOK0RTG9vy3Tj95z4ltYpUDeqgwaA1BG+cA6DG+sLanDe6jrsf/OtiJrJOufZhW8vQm
         E0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519023; x=1789123823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JVe3j7HRHHIhbvIbEK+C2SoCEY61/0kcnS4nfccAWlM=;
        b=oOUSA6tr53EjjDVhgRV1NaUsy2RJWRCtnPpJc7ueXkQBy7SC/kCW2jj9wrT5ah1vkR
         V6RqbWkDIIh6f1jEeFwgQWPFkrBiUG2vjGYYag+iHQ7Xb5MMVGLBn5N93umLHBHOezt8
         9h0COXE04/d8ozpi66cZhejrw09lgsm/TuZMThYmy4cioFWUynCPjMyueR0ruv8lCfzF
         pRdTPvlwLfEwCiLj1+spKU2lj6SCZf4XoFARI4Tw1bB3LRZaGhnkTKvOixtwTXgtYmXH
         UuzFDLYf5Ly2g4J/9CCoS8u2kfwteSxHriMejKnPq3Z2UTrSOGUbb+Ox30wPITaNGmLs
         v6Cg==
X-Gm-Message-State: AFuF++n1jyU1/dA6j59azit0U7/CClZTgBR1iLFaPZvNO0uxqamN1Ujk
	2XdveXgNkeyR5mxWtdRv0PyvcNmAnPYH8DwcWF/lgYAFj5HC6q9qRYAb
X-Gm-Gg: AYBFou3HO2hX9dwXjcGIAnYmnFsbx9BXXGjMdVc+v6HLSkMa7wcWoXyeOV6QOXqDua6
	6LveIlRTs2+7ogPf6q9yvgsSFPqqcc/jORgJm/aTXTqjxHv8e/eZj3qtvLso6dXNFbv2haDGuOD
	BJFD8HzSynPt69xups64w63CcYxstvn2H5MQwYTSRkxWUBUKjUM2uEPLWh641YxBQFa6iGbeA00
	lCAbRkYMZiDCzuwVZL3CIkNKKW84eLVf9Udbf8PeELJ6MyBzzdxzXUYmoDaSvWVrdlE3oiqU/Ik
	ZXT6N+FRooZxTPMmGDmvA/XUo1Ftwjlx2LXAiW7H5WNQzMLIJvX4ec9brAgdBNBpXgscqHUUz1U
	mIxG2+XlKhWi13q1RZxqL5g+CWcfFcmloWfXZ0AzPf2/dWx3ibRVilVosrY9BwZ86p48d7hfavh
	2giASy2pnv37TBH/XWhg8c6xWmIN+/Dp3a87bkvgMKxzMc5TWyWWuyL1jLkFrdmCh0zR3aX6EM3
	oK0L2nhV6HcjCM=
X-Received: by 2002:a17:90b:3912:b0:398:c724:1bb1 with SMTP id 98e67ed59e1d1-39b26101524mr6786890a91.8.1788519021437;
        Fri, 04 Sep 2026 03:50:21 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm6421454eec.21.2026.09.04.03.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:50:20 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jochen Friedrich <jochen@scram.de>,
	Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] i2c: busses: fix typos in comments
Date: Fri,  4 Sep 2026 16:20:07 +0530
Message-ID: <20260904105010.27405-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904105010.27405-1-hemanth.selam@gmail.com>
References: <20260904105010.27405-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/i2c/busses/i2c-axxia.c    | 2 +-
 drivers/i2c/busses/i2c-bcm-kona.c | 2 +-
 drivers/i2c/busses/i2c-cpm.c      | 2 +-
 drivers/i2c/busses/i2c-st.c       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-axxia.c b/drivers/i2c/busses/i2c-axxia.c
index 0555eeb6903a..62dc55c146f0 100644
--- a/drivers/i2c/busses/i2c-axxia.c
+++ b/drivers/i2c/busses/i2c-axxia.c
@@ -60,7 +60,7 @@
 #define MST_RX_FIFO		0x44
 #define MST_INT_ENABLE		0x48
 #define MST_INT_STATUS		0x4c
-#define   MST_STATUS_RFL	(1 << 13) /* RX FIFO serivce */
+#define   MST_STATUS_RFL	(1 << 13) /* RX FIFO service */
 #define   MST_STATUS_TFL	(1 << 12) /* TX FIFO service */
 #define   MST_STATUS_SNS	(1 << 11) /* Manual mode done */
 #define   MST_STATUS_SS		(1 << 10) /* Automatic mode done */
diff --git a/drivers/i2c/busses/i2c-bcm-kona.c b/drivers/i2c/busses/i2c-bcm-kona.c
index d4f287b31fd7..0c30821e7b0a 100644
--- a/drivers/i2c/busses/i2c-bcm-kona.c
+++ b/drivers/i2c/busses/i2c-bcm-kona.c
@@ -12,7 +12,7 @@
 #include <linux/io.h>
 #include <linux/slab.h>
 
-/* Hardware register offsets and field defintions */
+/* Hardware register offsets and field definitions */
 #define CS_OFFSET				0x00000020
 #define CS_ACK_SHIFT				3
 #define CS_ACK_MASK				0x00000008
diff --git a/drivers/i2c/busses/i2c-cpm.c b/drivers/i2c/busses/i2c-cpm.c
index 2cb6a233d313..c8b72f14d179 100644
--- a/drivers/i2c/busses/i2c-cpm.c
+++ b/drivers/i2c/busses/i2c-cpm.c
@@ -334,7 +334,7 @@ static int cpm_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 		tptr++;
 	}
 	/* Start transfer now */
-	/* Enable RX/TX/Error interupts */
+	/* Enable RX/TX/Error interrupts */
 	out_8(&i2c_reg->i2cmr, I2CER_TXE | I2CER_TXB | I2CER_RXB);
 	out_8(&i2c_reg->i2cer, 0xff);	/* Clear interrupt status */
 	/* Chip bug, set enable here */
diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
index 0a2b43b5577b..873ce2f5a406 100644
--- a/drivers/i2c/busses/i2c-st.c
+++ b/drivers/i2c/busses/i2c-st.c
@@ -256,7 +256,7 @@ static void st_i2c_flush_rx_fifo(struct st_i2c_dev *i2c_dev)
 static void st_i2c_soft_reset(struct st_i2c_dev *i2c_dev)
 {
 	/*
-	 * FIFO needs to be emptied before reseting the IP,
+	 * FIFO needs to be emptied before resetting the IP,
 	 * else the controller raises a BUSY error.
 	 */
 	st_i2c_flush_rx_fifo(i2c_dev);
-- 
2.48.1

