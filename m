Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AF3519913
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750061; cv=none; b=WzTJBJvGjnN+bWfGEm/4ytr09pvKz0Gr2lthycYWMWpOjLYTTjY0KxhTE1vImlHgm9R/xZdV0NYNm+/a5INKcSyt+08AJKVCOSRxqGkBZJpTjNFjKBnwsLMGb4pGYXCTrBOAaFQCvEygF4OySiwNH0lZZ7URS+K9Edn4/5uz0Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750061; c=relaxed/simple;
	bh=T5ePlaPWKKBlTLSmPKKBLXleGmVB5tFWU+61peT575U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dkyxfvWPv6ISdm2L+Z4UfcidKz5PpQU5pjswJgC2wGkng8BuupBE2mq4qmmEtJ0XGcI99WLo2ce0s2cfmoRwl8f3GAvBiczQmkto+252a1ku1raPUErM3/D/8P2SV0XSnXwPjECgyTXJ03zteB/KtMDdkhkr5tEIk+F3/tzglLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H3113EhX; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H3113EhX"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so807937a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789750059; x=1790354859; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EXzJLAY9j5odxKClr8BsLGTEU4HkCb/vEygnN5tSKcI=;
        b=H3113EhXzcENHLK7Qv7TyU8yGMMKPmQXvZqDhUnTJHn0KwonXQN1z69NOEXqO3D/JS
         8EqWL1fbyY+XoT2a63uSOxrWdiB7Xn6+idEuB92k3z7ZQix/iPhTOs7DLcYCNqgjwJid
         LhvcAhRVwDPR/W3kCiGiuh0Yt8bC4EJn/Cf9oRMsmTqASn1AwgSeglKqvNdG0H5Zvkn5
         BXkQNwbmn8Q6sDmqlAqY9c310sS3JeR4dsLIVous/PmM9EtRAO2DwpsUeY3iHiSnREax
         k4DKnwqs47mVwXEbgzMTdXxMATTIiCZtxPCAcFczL2mhdRSN1K6fN/i7KQXbmRHt57YZ
         v4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750059; x=1790354859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EXzJLAY9j5odxKClr8BsLGTEU4HkCb/vEygnN5tSKcI=;
        b=fSLF0EIV3/sPVY6NnTMJlOHbis4QehTrQ+EhGBrgqmk5nGw7kHr6WXPmpty8SaBir3
         flnmikH9rBmtpeyrR8bwgEFDKM+oVlBt960CzhN+yPpqhyp1wiiOAmcamWkn2Y/MQQFh
         1Nig68/kYp9o1thdm2qqXjbTT8Zgj+3flQARfWFC7Yzmh4kwDIHxK3rigi2HpTM1gYKB
         EgmzNJ6kuKYzFd6A00p7t0trkqkqs5yuKQNTHvn3PxPhvN4GEjfcw5VxIhMEzbls1h5f
         2LN0zAErWTGjkQZ6ZFiW+1h5MQoFMlpkCRLAadT6UDP1i+SykM+D70pkGrMRGvvNx/ww
         Of0A==
X-Forwarded-Encrypted: i=1; AKwUvBxVqI8+TGJ9D15s4AYOsn4Td4EKnhjdLbTsdZGkzeg4duJL5Ji2HbJOjouBxOpnxljg9IHF/ynSli1945M=@vger.kernel.org
X-Gm-Message-State: AFuF++m0MPQ4PWzG4FiyRXD3WXbEmWCG+voWXGQi1lHnt//Xgw56/k1D
	DzxaJ8CoeJLlEGFngTNR0YxLPS9FFcder5RFD8MQS/SR2pZiXteQtG8yJ/W91Q==
X-Gm-Gg: AYBFou3ZkPH4xf2pLXI1yUl69WGFqFhpF/zHw275rGMucDrjt6htrgQw8FGr4Ii5c5E
	eJ9R32B8a0v/i1aZFrmpeGrOI/9NQzXZrOGrQ5MwYytxb2L5zBejseCSBi35ch7yxCve53Px37U
	W/EZ70vpGTypoGp9Hfqr+tgeQTuL2Q61csngfWc5Y7TxZ0jXtHBRjW3vmpFOKOHfZRYgojZIm43
	RvzI1WLOqrZ3P54z1raxw0/BUp7wsLe1HvxoTx0wi0QU1hgfMHivxzrsjunaB4fD0L/tXQbvGwQ
	rn3ahW8OB/9G5jQPuCKSl3f7/kF5sYwzFHtLqGSGABKnuckTgjg5gYXprea+atpprMrCpVzIqoF
	KSQXj/RAfWadQ5Pw6/ncPP2ao94ZgQdIfIB0Aw96Bms18dJnVsIAWuFKnnPAPb+ww3ecGrR6ecD
	FCoeM/nTdZTmnZ0UHBc66rptHS8Mff3G0CbCju9eNaQ3xzDrfP5Ky/QwdGXb0NgsZktYhqcz/2
X-Received: by 2002:a05:6a00:4099:b0:842:3c77:5996 with SMTP id d2e1a72fcca58-87341085fd4mr10175647b3a.1.1789750059163;
        Fri, 18 Sep 2026 09:47:39 -0700 (PDT)
Received: from [127.0.1.1] ([223.122.38.120])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-877a8dfe201sm50514b3a.18.2026.09.18.09.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:47:37 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Sat, 19 Sep 2026 00:47:03 +0800
Subject: [PATCH 1/2] soc: apple: rtkit-crashlog: rename 'Crg8' section from
 regs to aarch64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260919-rtkit-armv7-crashlog-v1-1-f4a671ea453c@gmail.com>
References: <20260919-rtkit-armv7-crashlog-v1-0-f4a671ea453c@gmail.com>
In-Reply-To: <20260919-rtkit-armv7-crashlog-v1-0-f4a671ea453c@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4600; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=T5ePlaPWKKBlTLSmPKKBLXleGmVB5tFWU+61peT575U=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBqrWskADcmCOtokPCqj1yGNH6q8CXYa2yckF60P
 9FNoYp3liiJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaq1rJAAKCRABygi3psUI
 JE/OD/9Fop6CLfJ+FGs1WPvP0YASFDiEJBUsmpWiWlsK1im1oxn7BYgcc2POZWxDKIp79qhz6YL
 U/CXIDQrU7agwe/cHOJRGXCBW5VgfUkxkgIfIX3DTg5UPPZ1c5uXTYE8l4HRm+/WRXLsRVS6f/Y
 27Oog1lG/01iZtYCsrtTV3AA82LxWldSykRyuVvPdqTCZdZjR9SYS2mWU7lsAvyU1KRjFab/vaB
 qthXOQSIihlpyVv3c5b8pLOnx0boPZ1zR36FgEpYJuS5DfxuqLBFTEaCalWpjdZo+m+Y38lHM3y
 ol08sA27qnwsK3EjduTpllJjDb/YzodiMlBUsAAj2U7UYoUPff0v2G8N+BInwTs1jkTuhZtFaZi
 Fef9+cjD0m0hT+IjC4mE4zpqRZl+1aT6RS6xXZo3HMbwgdVPwIQmrcBnFpozNvwYxP+fiaPKpiF
 Bs06tSqQ/PETttfAjFgKt59qxkx2K6TlK1O0EgLibTytDnwmY+YzrPUhBRkNlr0d0iGeO5oSKlc
 eTjNHjH5B9M3lRJdE2HVwIKc6zM1mZJqvCYzl7aQDkmsIGn0phgpHiQgb2PW+7JojlzfZGxy2NV
 g6SAHeu8NWlULXW6X36e2WWTGZtBxCMHXGpHDYA8b69OzeNQlpCMPIK7NJ81RkmsgFklgUIQtiQ
 0+TOUrIY/+70KIg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

This section contains AArch64 CPU state of the IOP when the exception
occurred, including register information. Rename this section to be clear
about the CPU architecture as support for crashlog section with AArch32
CPU state will be added.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/soc/apple/rtkit-crashlog.c | 43 +++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/soc/apple/rtkit-crashlog.c b/drivers/soc/apple/rtkit-crashlog.c
index 8319e365110b..6a8273e81e61 100644
--- a/drivers/soc/apple/rtkit-crashlog.c
+++ b/drivers/soc/apple/rtkit-crashlog.c
@@ -13,7 +13,7 @@
 #define APPLE_RTKIT_CRASHLOG_VERSION FOURCC('C', 'v', 'e', 'r')
 #define APPLE_RTKIT_CRASHLOG_MBOX FOURCC('C', 'm', 'b', 'x')
 #define APPLE_RTKIT_CRASHLOG_TIME FOURCC('C', 't', 'i', 'm')
-#define APPLE_RTKIT_CRASHLOG_REGS FOURCC('C', 'r', 'g', '8')
+#define APPLE_RTKIT_CRASHLOG_AARCH64 FOURCC('C', 'r', 'g', '8')
 
 /* For COMPILE_TEST on non-ARM64 architectures */
 #ifndef PSR_MODE_EL0t
@@ -42,7 +42,7 @@ struct apple_rtkit_crashlog_mbox_entry {
 };
 static_assert(sizeof(struct apple_rtkit_crashlog_mbox_entry) == 0x18);
 
-struct apple_rtkit_crashlog_regs {
+struct apple_rtkit_crashlog_aarch64 {
 	u32 unk_0;
 	u32 unk_4;
 	u64 regs[31];
@@ -58,7 +58,7 @@ struct apple_rtkit_crashlog_regs {
 	u64 esr;
 	u64 unk_Z;
 } __packed;
-static_assert(sizeof(struct apple_rtkit_crashlog_regs) == 0x350);
+static_assert(sizeof(struct apple_rtkit_crashlog_aarch64) == 0x350);
 
 static void apple_rtkit_crashlog_dump_str(struct apple_rtkit *rtk, u8 *bfr,
 					  size_t size)
@@ -123,21 +123,22 @@ static void apple_rtkit_crashlog_dump_mailbox(struct apple_rtkit *rtk, u8 *bfr,
 	}
 }
 
-static void apple_rtkit_crashlog_dump_regs(struct apple_rtkit *rtk, u8 *bfr,
-					   size_t size)
+static void apple_rtkit_crashlog_dump_aarch64(struct apple_rtkit *rtk, u8 *bfr,
+					      size_t size)
 {
-	struct apple_rtkit_crashlog_regs *regs;
+	struct apple_rtkit_crashlog_aarch64 *state;
 	const char *el;
 	int i;
 
-	if (size < sizeof(*regs)) {
-		dev_warn(rtk->dev, "RTKit: Regs section too small: 0x%zx", size);
+	if (size < sizeof(*state)) {
+		dev_warn(rtk->dev, "RTKit: AArch64 section too small: 0x%zx",
+			 size);
 		return;
 	}
 
-	regs = (struct apple_rtkit_crashlog_regs *)bfr;
+	state = (struct apple_rtkit_crashlog_aarch64 *)bfr;
 
-	switch (regs->psr & PSR_MODE_MASK) {
+	switch (state->psr & PSR_MODE_MASK) {
 	case PSR_MODE_EL0t:
 		el = "EL0t";
 		break;
@@ -160,11 +161,11 @@ static void apple_rtkit_crashlog_dump_regs(struct apple_rtkit *rtk, u8 *bfr,
 
 	dev_warn(rtk->dev, "RTKit: Exception dump:");
 	dev_warn(rtk->dev, "  == Exception taken from %s ==", el);
-	dev_warn(rtk->dev, "  PSR    = 0x%llx", regs->psr);
-	dev_warn(rtk->dev, "  PC     = 0x%llx\n", regs->pc);
-	dev_warn(rtk->dev, "  ESR    = 0x%llx\n", regs->esr);
-	dev_warn(rtk->dev, "  FAR    = 0x%llx\n", regs->far);
-	dev_warn(rtk->dev, "  SP     = 0x%llx\n", regs->sp);
+	dev_warn(rtk->dev, "  PSR    = 0x%llx", state->psr);
+	dev_warn(rtk->dev, "  PC     = 0x%llx\n", state->pc);
+	dev_warn(rtk->dev, "  ESR    = 0x%llx\n", state->esr);
+	dev_warn(rtk->dev, "  FAR    = 0x%llx\n", state->far);
+	dev_warn(rtk->dev, "  SP     = 0x%llx\n", state->sp);
 	dev_warn(rtk->dev, "\n");
 
 	for (i = 0; i < 31; i += 4) {
@@ -172,12 +173,12 @@ static void apple_rtkit_crashlog_dump_regs(struct apple_rtkit *rtk, u8 *bfr,
 			dev_warn(rtk->dev,
 					 "  x%02d-x%02d = %016llx %016llx %016llx %016llx\n",
 					 i, i + 3,
-					 regs->regs[i], regs->regs[i + 1],
-					 regs->regs[i + 2], regs->regs[i + 3]);
+					 state->regs[i], state->regs[i + 1],
+					 state->regs[i + 2], state->regs[i + 3]);
 		else
 			dev_warn(rtk->dev,
 					 "  x%02d-x%02d = %016llx %016llx %016llx\n", i, i + 3,
-					 regs->regs[i], regs->regs[i + 1], regs->regs[i + 2]);
+					 state->regs[i], state->regs[i + 1], state->regs[i + 2]);
 	}
 
 	dev_warn(rtk->dev, "\n");
@@ -229,9 +230,9 @@ void apple_rtkit_crashlog_dump(struct apple_rtkit *rtk, u8 *bfr, size_t size)
 			apple_rtkit_crashlog_dump_time(rtk, bfr + offset + 16,
 						       section_size);
 			break;
-		case APPLE_RTKIT_CRASHLOG_REGS:
-			apple_rtkit_crashlog_dump_regs(rtk, bfr + offset + 16,
-						       section_size);
+		case APPLE_RTKIT_CRASHLOG_AARCH64:
+			apple_rtkit_crashlog_dump_aarch64(rtk, bfr + offset + 16,
+							  section_size);
 			break;
 		default:
 			dev_warn(rtk->dev,

-- 
2.55.0

