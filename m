Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B1B4BD36E
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981353; cv=none; b=ppzUFyLE+TA/f8Le+HCdDwyHdXWlqteMShzXNjS/1H+gwkNibSCI3fos3iTzbbtT/1PPymZzCYrpLi3MAx0tT+UAyVolCEE16B1NPGBvN7aV/Ca92O/JRJnqbUaNjugMqJQnQAfL35emt2R+2Uw1Y5oL2SPIcC30VCt4pYwHx7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981353; c=relaxed/simple;
	bh=AEeG/YNcximlFUYFtR533gtgDzMfPi0BG6W3Rm8MG7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GE3Y365S8tOSCh6OYRDZ4LEBoKOuNvK+OYn/uCL8eR3rEyQ/ufkgvD7zTvqL3yBjjGGcx7CSl3noOgV9VEF5BexKWnh7qORu+fSJ7sNQDsnxz/FgipCgAprGhQXCNB+3dQBiFzshDcAZterH8gISVRQOjRLevaxxbQYjE5GytWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jDDu/tP8; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jDDu/tP8"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c411d6615so2954849f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791981350; x=1792586150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GKgGfNoWXQV4tpIVxLenRclK7vXKxa8R7Z63ZilMkDY=;
        b=jDDu/tP8/2iSgLN1cNqke1ArVNsv/4U3BVa7My/xduOAKTKbnT/jAp/ulksNBpgAbP
         sz061GPhy3omRUikl2se5DDBOgPXZ0h5T7nTtM82Y+TNa1r9vXGI/Zx40E3/6z/AWafL
         TxCAeXNktTrVaOiBE2XJkGmV0Ea3Cd/M2Xn8g45GLD75QMOGX86kLFfPK+CCPtTZMl8Q
         4TdShLFh8MAS3CNP9gs/GFNN0uDaCMEg34dwadLkiYcjukPN6pSrl7UoEPape2CL+7OP
         +jr5TgNpfcgTPd9UcwUEceN/Me5ZVGQw+dy510dlj1LpxCe8bBTjH4zSHbbSpb4esKNW
         B5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791981350; x=1792586150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GKgGfNoWXQV4tpIVxLenRclK7vXKxa8R7Z63ZilMkDY=;
        b=L+P1w/UtPHWu4gU58pslBvQWW2iCeKVTXP7Etke8TsoI8CuW5N/dp6GW01eRxJ//p1
         +YSgPiRZOPzo+L1ZsnWeLEBD30U+LqGzs86nKuNbvHmkAouDt3L3Dl1m+MM0Hk5a+YWp
         hGMAyxZ9HJOigIC7ocCqSoKChKvT99zIARhvalb7IMtVzsyuYM/9yCt4VvLXiZrH6vps
         WIHlFsLUJp6ICgNWUaPE3Ww1b5CXOtQkTfaRUEe8QUqJY65f4eda58AdjsiC15JHIxK4
         K3mUywfw1OLz2n35jl57IUZmZIeTku8+RIKndL+KtNpizd6eq9LoaT5JoZCzcSDqbB9m
         a2eQ==
X-Forwarded-Encrypted: i=1; AKwUvBw87QeJpymLdeJ38ei4wHpnTO6LQPyX/ZV1lKRDuyzeGMewoEQLNW8sroy9v4I93ZJjA8kNDC4zOGMIjt0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrOIKpnZu7pBxcfixoZF/kj7fcVEfKgoTBfiozwlN+zghByYm7
	YcTFGIOcP+kDRUAzbqvFPYWfz/19npm9BJr+Irm4UwaVf4bvj5YDz/ta
X-Gm-Gg: AYBFou10UIGj2j5UOAnbmXNizUBPVjoO4ai2TePkik53dt0I4z5gK+rTNt1guIfOh1s
	O/SYiCvJjLNVEIeiT6dh8q9FG3C3vXbKi1A21F1GReVlMUrQayXhNjlbWMV6OHT5p9QSj1F1Ii8
	Vtgi0ohrIrABivXJYqZFC7EL2d50XQ0zO9UQ7G0NopAxErNW+HpcWMNazCoWy2Bu6th9JIaWovc
	5wqWYeZSY9fIMeFtnA8NhgNTGRe40lkF/3quqiKotU7SNKlHjorXvfEajJJ8qym8iI2ZiE4rjeo
	PfRawH89tG0Q9rQ+hzZfmG3TmE063JkS3RTaUS1jKHGtxm+haQgh+uKkJJK4861a9alyBRlTv86
	IhLwyLyYEtkS2cFsB3yOV5D8DRBIVV3e5t7d9OXGb/5DQPQGdVF5wB2NSlu+0bbWNar9GpmN2wT
	w5FgEnzzeDEV7YXXgwOuGcfnP+/5NklqKgHMlnx0RiPYyrb8HWW0gUhGB8xkHRYQKzkuw5bQ0T6
	rQ1HlzId7ANMKefnHnvg+ooN17+MoKPB/Afd4uuqraFH0ZhsUdhVEWEFbw60/c=
X-Received: by 2002:a05:6000:12c7:b0:48b:28e:2f13 with SMTP id ffacd0b85a97d-48dbacffdfdmr22882377f8f.52.1791981349373;
        Wed, 14 Oct 2026 05:35:49 -0700 (PDT)
Received: from nixos-office (29.pool92-59-2.dynamic.orange.es. [92.59.2.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48ded3874c6sm3003353f8f.18.2026.10.14.05.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:35:48 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: mark.rutland@arm.com,
	lpieralisi@kernel.org,
	sudeep.holla@kernel.org,
	tglx@kernel.org
Cc: radu@rendec.net,
	vsethi@nvidia.com,
	maz@kernel.org,
	sdonthineni@nvidia.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v3 2/2] firmware: smccc: provide stubs when discovery is disabled
Date: Wed, 14 Oct 2026 13:35:39 +0100
Message-ID: <20261014123539.2259230-3-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014123539.2259230-1-julianbraha@gmail.com>
References: <20261014123539.2259230-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add fallbacks for callers to avoid needing #ifdef guards when
HAVE_ARM_SMCCC_DISCOVERY is disabled (32-bit arm).

Fixes: 35727af2b15d ("irqchip/gicv3: Workaround for NVIDIA erratum T241-FABRIC-4")
Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
Changes since v2:
- split out changes into two patches

Link to v2:
https://lore.kernel.org/all/20260823180832.1246363-1-julianbraha@gmail.com/

Changes since v1:
- remove select and dependency on ARM_PSCI_FW,
- make the HAVE_ARM_SMCCC_DISCOVERY 'select' conditional on arm64

Link to v1: https://lore.kernel.org/all/20260801212235.2692694-1-julianbraha@gmail.com/
---
 include/linux/arm-smccc.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index 4de81848fe2e..75f9d3f1723b 100644
--- a/include/linux/arm-smccc.h
+++ b/include/linux/arm-smccc.h
@@ -324,6 +324,7 @@ enum arm_smccc_conduit {
 	SMCCC_CONDUIT_HVC,
 };
 
+#ifdef CONFIG_HAVE_ARM_SMCCC_DISCOVERY
 /**
  * arm_smccc_1_1_get_conduit()
  *
@@ -363,6 +364,12 @@ s32 arm_smccc_get_soc_id_version(void);
  * When ARM_SMCCC_ARCH_SOC_ID is not present, returns SMCCC_RET_NOT_SUPPORTED.
  */
 s32 arm_smccc_get_soc_id_revision(void);
+#else   /* CONFIG_HAVE_ARM_SMCCC_DISCOVERY */
+#define arm_smccc_1_1_get_conduit()	SMCCC_CONDUIT_NONE
+#define arm_smccc_get_version()		0
+#define arm_smccc_get_soc_id_version()	SMCCC_RET_NOT_SUPPORTED
+#define arm_smccc_get_soc_id_revision()	SMCCC_RET_NOT_SUPPORTED
+#endif	/* CONFIG_HAVE_ARM_SMCCC_DISCOVERY */
 
 #ifndef __ASSEMBLY__
 
-- 
2.55.0

