Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792535304;
	b=n9RGFwoOSqimbSnbdSDTW5PxqvJmJLAanYFu9CIOBe0ptGhNu5ebD9GYh6Y1KOXuffjl
	 Wk1hkBdOuOAkLSF75S94Gk+LYYftsQnOlh6um+2FEmrvveWU5SHrXBxTgVwwCE3XFohFx
	 J0W1DhUEZC8f+gN6r1b89NtIE1SJ4CZEqHDVEB4h8U25c6b1MilfNzMzNb26MXQlq1Yeg
	 1q5hxiFDHDSqEwQrlh8fFawNHwiBSUna0o4Igs8itlqS6KQvRgDi8WUwjX+mSPusCz1pR
	 hVana7U1Dr2yhOFHRoAJHD48cjaCm7mDq1pViI71yvXpQ2da3fNooIh5l4659m/kHqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792535304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=vAt+N+CfwxGGqH/GXlVvLN2X8FJUBl27+lXcZ69Smo4=;
	b=uZ6vrhu8OXcvtXqwZufw3lwdge8EFFXY0vRo2opNoIBfvyv1c3OasyIlZfc3+curd7ZX
	 K3Qs7A9VkOTbR3P6NMhCy5GIFcRV9k9BrEtcTUTFT/jTERl8i+NtLCo7xgOzVYkrSAY4I
	 xK6Q+soRO1aoEsRqvKgQM+nHdWzQNgSuwruiUjGpJYiAIGX9oQTKd0Gu5+V5G+SoldWtk
	 k0qXYrzdQA/nqEAok5n5D2G+SWOuczjaomIA6XOqkxWJBUtfjh2BXdNC3i3WelGkPuZlu
	 iAj6qxiA1KpaX5zUCQYBt+t/Wi9m7ouTFGLXqb++WQqlRz6vKb/GN257iE5TWjrvgFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a0AW2vmg;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DF5606A323
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:28:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65DF5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a0AW2vmg
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso8113715e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792535303; x=1793140103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vAt+N+CfwxGGqH/GXlVvLN2X8FJUBl27+lXcZ69Smo4=;
        b=a0AW2vmg/vZerNlERTSQU5OMx1BRAhiBBDPECXYKGobYrzWOsj/hewI5flOfMX0fQT
         YBWU0nreBzNW1Swbe5/xF0bpX6Bpx/dKSnFvaDr+k1kJxPLK9w2sfg0Rk4hMOuQ+d+qo
         lLAXjXbSyk3icyPYDAEqKjdm5GuRIvks/1ul7MAKnVR2bVvd1lyRZ8iDhom8MSvCQvt0
         wQZVCGxT+mj2+uFueQdoZNbch/SDybVW42qNXk+upputlqFzDa6l1dvobK4ludHD0GR6
         yzgfJVlL1mdRJTlVoT+G6MCfRrO6uU2N8bxRg6m3zy27BZiiqV5sGL+sWaBvMA/ktwkw
         zPTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792535303; x=1793140103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vAt+N+CfwxGGqH/GXlVvLN2X8FJUBl27+lXcZ69Smo4=;
        b=UYjSNK8VPY68ZbJhmG9uHAwDbF/b9hT76pRYlLe5r9B6wAmhIxhaha0Ssuij/Zny2V
         tJhGb6Uw3r1sluStnSLzzojseMpJ3DTVzvPACkjqUHSGn7Npwxvy/nA1g1KQkddJVHS0
         JXnilJSXzc71aeSFoGnbpWWLW3CyRSEr6bLXPV7noDRu7nHFoneBHwXU6P5T6NrOR775
         5PR/Rg37OGgZl+FZuByR68KRhOaVPrI8CfkZrA63Jc5p/cQxr3t0pRSMeKq2iRmWJzSW
         kIJciYidlrB/4EXpWm0/NMrm6CrR1lFBGTlUDntL0f0DTSJThQwXwR7L30kl6Gow+WMG
         IlBQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0NbWxOyaD3LEAtPvD/ruvmkRXgeaesp7h1RNrF2Kkhs4YOWtJ3hn62pfW0Xy+BVSp9X4CP+CltCZ4354=@vger.kernel.org
X-Gm-Message-State: AFq9FYKubWjNiBJ1UMjv6jbpJecPCdLfoC+8OiaCppKAYQmmc2QcGydx
	Ll0LRvt9MIVVktr7tLJJuOFuXCNqV19o1lPZ1tYUmJdKTqhOn0WUQhwT
X-Gm-Gg: AYBFou0ziqusdPFQtaK0Ptdsh7xgShx7wMLXEPhFbK0Jms4GGK9rURXQPSeuoxnzevp
	Cu7IRdaT6C2PGDtGdktLFs/j/s18l74CCe9LrQGzicXAFWpAnRb9oNPYVITGvFKIoYmu2oQL+6K
	2KCKuHn7y2CjCwl1UDRjua9S7dq7DhXje1UT/lWKps/8s6cOWOgcmiMDw3AeyF/92sdXOsmjAj3
	nau4t6+GAYhJSr4LpEmLus/D9/1h+ShwZV2zAqE+c/NB88SoTOVlmyUccXWoiXwJCTmFZpxOij9
	WO7L3Ta6pbsW7klSBSfTtSC5uX06UB5m6sveYabUEPzIK0dIGvNixBTfst+cASTZ+gWY9Gw+9en
	TLu1jqV+ZzeL/5gQLCQKdvgyfV8FrncmA+YuPVYsQEa6Bs5SZSdV12/1vgBYSHCUmt0yR3v5AKm
	ms9E89O5gEvJG5AnJmUjgZGV7SAdU+4eo2b6I7Y+u7YbBGEnDxxI/5ySZcCWUqYy+JEAjwh2/lB
	V1ixDD6MyR10JkIaHqsu8RtOqkV/tqgf+nZ7FqO0G6Db1jJurpXIU+r0U8y5Uo=
X-Received: by 2002:a05:600c:4f91:b0:4a1:a7f8:c124 with SMTP id 5b1f17b1804b1-4a1fdd0c00bmr1857655e9.7.1792535302752;
        Tue, 20 Oct 2026 15:28:22 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd629bbsm9661935e9.5.2026.10.20.15.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:28:22 -0700 (PDT)
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
Subject: [PATCH v4 1/2] firmware: smccc: provide stubs when discovery is disabled
Date: Tue, 20 Oct 2026 23:28:16 +0100
Message-ID: <20261020222817.1231643-2-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020222817.1231643-1-julianbraha@gmail.com>
References: <20261020222817.1231643-1-julianbraha@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add fallbacks for callers to avoid needing #ifdef guards when
HAVE_ARM_SMCCC_DISCOVERY is disabled (32-bit arm).

Fixes: 35727af2b15d ("irqchip/gicv3: Workaround for NVIDIA erratum T241-FABRIC-4")
Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Julian Braha <julianbraha@gmail.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
---
Changes since v3:
- reorder patches to prevent build failure for 32bit ARM without PSCI

Link to v3:
https://lore.kernel.org/all/20261014123539.2259230-1-julianbraha@gmail.com/

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

