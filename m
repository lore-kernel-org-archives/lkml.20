Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449343EDAB3
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790143831; cv=none; b=VA2VY51m5RswzwuYzRkIV6At0nNBOpGVU0XLwFgHYScG9hhOl9iKcL08NwTRQ5+K+BXxLrVdGR4Jf8GXW7/sRsR5tvimSYzVoYXQJttt1obP5ATBPct3f0IaLbRATI5VqskzXeyHwF/hgHWCalIXrGNgam8deYOLOV5gXdk550c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790143831; c=relaxed/simple;
	bh=Up3ZIHSEDaIBrMIFPLazLYKJZ8oSLCIb4EWYTIp3x6A=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=X+8hfzbA0KIWLy2a0FTcmK6fjjf1JALmY6WyMNQKQ2phLXp96WvuW+uvx0FoWy9HHNxeJ9IKQhLXL71W1LaPR7HcaqW7fB8Xnlgh8BP3kAmM9g9WfE2HhZMZyvHV6gTaVUzheL+EqzPeQVbGoBVXBdu3nMKXUd/9gYHdmtwMAKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dTSTk06+; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dTSTk06+"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dc7337e2a7so5844145ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790143830; x=1790748630; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2NJLY26Tlw5C/ujVQMbXtmFKIsHXJJUk04BO2IFW5X4=;
        b=dTSTk06+Mc0arFDngd+N35IEatXimNhfOtZjpoEevvALR5oe+39VylCbruIVNuKEi2
         QKruI4UTu3zvufhlN3IKn8ox81/X0dpl3YgjsLbumz20qFLcb/XaZeXAMdpibpfPaOwQ
         5lflbw1rIrE0WJyGDuZxtBHNDWt44dD0gajme+DRGjibNemqwfp3dtR7K/L6DFPK7srV
         Hv0Mq8QLpZ/K5/DDxrzOitLXN8DCY5LZTdgv1kRnxi60E84aoWorN00QCsgL05oOlQym
         wD63guUpzTVwSueE6WWGjxqM81sS1VN+X1NH4/YV9P8qVfToQutENEiMXd4nPuxsWh7Z
         C33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790143830; x=1790748630;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2NJLY26Tlw5C/ujVQMbXtmFKIsHXJJUk04BO2IFW5X4=;
        b=poouV6ru3NpTE/HJvVRxmhgKxIXWMPhWQJbSamMKZj4j9HFX/zTm1dgLm2VQgfEzgs
         VgPsyzMTDSM57LMrUN2uB0mCIAhT97JZWxF8LrHq5Ku7TZJwh8qyMYLREZU8s/0wBe4b
         FZXLkSxGwDkmwviKnUMr3HFmjNT1OnqzpZYQ0u6XaCT7zjzNVWySL9CLyxY18BDDdAbS
         WNuXaOEgj2p59mp3NPq4LjqQWm5UCnjV+RTOq05Qi71kkRSgV+2ZC0hfUwxcvymLzann
         1w7YO9+7vcOTYfcsFZVH5WwidD+TqrC3Jej3QYZs7T5BNnR8ccZJIzWBb/tjLVztpCs2
         rD7Q==
X-Forwarded-Encrypted: i=1; AKwUvBz/4F5dTIhyz74tbSlsYzejeOh1Gpjg2H9O5JnMHPMXwcGu//FXyRkn8IXU+1JumEdgWlR+w/bBJMzPyUg=@vger.kernel.org
X-Gm-Message-State: AFuF++mHUPeEQXTCtMkqR/jB/F1f98dCTK7e4pCgZxuXGIs8EFDi8gVP
	YNxPcm9Ql8W2SROv/RWejjLKX8TroN2ixz7p62JAfOC1+YVIjIS4LtEEI+/fjPoA3dACQAUT8Xp
	N
X-Received: from plad20.prod.google.com ([2002:a17:902:e154:b0:2db:7978:1b17])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ec84:b0:2df:434f:5f50
 with SMTP id d9443c01a7336-2df69de2662mr13543765ad.36.1790143829058; Tue, 22
 Sep 2026 23:10:29 -0700 (PDT)
Date: Wed, 23 Sep 2026 06:10:27 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260923061027.2650324-1-morbo@google.com>
Subject: [PATCH] crypto: hisilicon/qm - add __counted_by_ptr to dfx_diff_registers
From: Bill Wendling <morbo@google.com>
To: Weili Qian <qianweili@huawei.com>, Zhou Wang <wangzhou1@hisilicon.com>
Cc: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Bill Wendling <morbo@google.com>, codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"

Annotate the pointer field 'regs' in 'struct dfx_diff_registers' with
the '__counted_by_ptr' attribute, referencing the 'reg_len' member
which holds the element count of the allocated memory.

In 'drivers/crypto/hisilicon/debugfs.c', the 'dfx_regs_init' function
allocates the 'diff_regs' array and initializes each element's 'regs'
pointer after setting its 'reg_len'.

Since 'reg_len' is set before 'regs' is assigned, the compiler's bounds
sanitizer can correctly associate the pointer with its allocated size.

Cc: codemender-patching+linux@google.com
Assisted-by: LLM
Signed-off-by: Bill Wendling <morbo@google.com>
---
 include/linux/hisi_acc_qm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/hisi_acc_qm.h b/include/linux/hisi_acc_qm.h
index 8dc49fa2123b..f2885d60b468 100644
--- a/include/linux/hisi_acc_qm.h
+++ b/include/linux/hisi_acc_qm.h
@@ -196,7 +196,7 @@ struct qm_dev_dfx {
 };
 
 struct dfx_diff_registers {
-	u32 *regs;
+	u32 *regs __counted_by_ptr(reg_len);
 	u32 reg_offset;
 	u32 reg_len;
 };
-- 
2.55.0.1082.g2b9226bbc0-goog

