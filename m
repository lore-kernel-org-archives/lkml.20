Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792901023;
	b=rkTeAki/9YWnSzMD8vnDDdD60UENn6Y9/t48PPYDnBRpyokun7PcmMJCvpcY8+kCUZor
	 3QQpiojQcOb0gTe2Ur9PGYVyLgfAVz5vus6xjk4ophO41jXGa7pVgPq43/g+HWarsoLUQ
	 xp3uxbxvmeA+tcDENTBu1GlVnfRi1pt3poTDYPc/3WKGyeQw+LpFpWdSgnjsycqa1hAQm
	 GqhSkQ3wQuwHAneM7xjSKUNmKeH4X0vpbwrkX95q5QWhVy2K+I5vCp+xFv86txNUJPcCx
	 aAbwZs+DrywS3ioxocgN7z6G03HfBq0IxdDOiUgEusdWJeLQFvOZJy2WSVw10usPymQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792901023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iig0z0KMkzGM7EBZYC3zYQ+uH8lNfEJyczCziU7pfIM=;
	b=LeydYAGHoh6zQbx9pLztmUUo0qxVvvDpZ1EUjPxghxZN2oPaSDYP8N8AZ0GD2t6EPNGu
	 tpa6BUs3A+5Fd6gOEAUxByhUMgy0nlp5ZCi/cBpx5orlycSHXZ511af8UkTglTaqf/kc8
	 GRMsja4aYY7e3k3yv9bj6co+/K31dgi1Jnqz279EyoD80FBflpWcvQXVkRmvOPii9dEIg
	 zwO+9CBu62sNSpgwUurvz2EU/S5aos9w4sjv0UWuUOgL0+LVD9X4ufgkNrxF0ng0NC3BN
	 YBDOZrwSTN6DySItRDpL4sCrnKr7U4A84JTxj/vk5akq0yODLY/QOXfFA3RSBoiVSxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PJtxf6Nk;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07294606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 04:03:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07294606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PJtxf6Nk
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-14fc585291cso716542c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 21:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792901022; x=1793505822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iig0z0KMkzGM7EBZYC3zYQ+uH8lNfEJyczCziU7pfIM=;
        b=PJtxf6NkKfEOOHQLs4zYC2Hznepq2CsdFd24+OGx88t7IlFyrpiRpm0fCWe30C9LU/
         0IhNvRfSkw/Y+LMgxZ2yvRQVK4wtjnkKiZb0obEZnW/B+9wGVz4n0zmBZKLLg5fEXrlE
         cF+dPDQhvmaui3Ptk6UkusVRH4mz1Szol5Rkz7JIOw2EzXcq3uagbkoeIsIqvPEXWF76
         eNrrnqcy+zuPdSukRf81k6LSGF0J8GcRcNn7C+xkPkD4e6JlqRJ8vCyV2tYGTSM7Crwe
         1VovFpoIHbUKrsCAXU57jex2hh2Pa4XkL+TqDDnP+t2FQKmKcAh7LnwXQ6/5KXvWzDkM
         +FmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792901022; x=1793505822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iig0z0KMkzGM7EBZYC3zYQ+uH8lNfEJyczCziU7pfIM=;
        b=lSzLZQCOsGrfkiXqaW9hAONPAPKuLm0q1R92OL8DKX8elFwA4M4XKHzvkoLwPBHJuH
         5zL9XSmV4qhiOjOjQ6SW12UzFhZCdLGX3Dw3o6ixbuxkVNDWmyXdwOQZmVXBQZdYPSe4
         NW5+nRi1y1ScXM4zkJvnH8T+GH/Gx3cMvajiEoooyOxPifZLGC6WU1PcvVUrO6SmfbiG
         BvSY7rnB8NN7HX+ipQr1G3mtOZPxskUhjRdnH+id8E3mzioxtky2oB9LFcgUwyMYS0u9
         2flnH3zzqYJaICxMP9DP9rxLp2V8cVm7iihELoRe2AdvKAHzHQSXLUD4VkYD60dCstTV
         dt+g==
X-Forwarded-Encrypted: i=1; AKwUvBwfqnjV12JpHxJGQ9o0HgU49aq9sx7AeuX/TOlo4yzQNxwPMWaTkJLszmMh6dZ2+gIY/F3c6/4txEGSo/A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHQ5tfHsTnNMzq69psBPRCpZMl75KtUAW25QZYMYmus4J4fntR
	XUQur6ipDGGY4sRVcYLCkpPPE0m/0MAo5RvilFXruvfxy/ySxS/u1ko=
X-Gm-Gg: AYBFou0sGT4zZwWtyjKkeQ+MnoLkHxNXEyyx/4BB6/86Ium/3eJlO8OlTRA0WpTgJyt
	vjR22ehSBCcYU7OPWFRNtq48qyBz6mDqr9s2dpd+1S7sU3YiTDOpTBztj8dkyzEra1may/OEuWF
	4Emcn6cHX0If3Kbv7yByUpS94a2gJzXWGLbroVbSp/kEXoyDYWfn0/d2yX316bObcHt7qw7JkQ6
	RTuiPvp73nYoL5imfgpm5zYTOe09KDnmgOodZ4T8JmfMfI/vMRHdrRSNtnAtxMHcwNUT1VFmqUG
	yP7ElBskk+OJ+PmesRxssW5nJuS/UFWZ/wOhSSlsK7KUrKSr5U8YJMtEiw8FKmBs0CRjJFx9Ug4
	Xzwc+yc5cwoGoctcQprkAufmGAQjynQr6vEaHhMb3N6ujm/4aivCGy0zyrGucQDaotUYbFw+t2i
	oWQT5x6c9Xw6kQ5W4bLcd64vLPwy1KdfqxFE+Rx7ippJWXnkJpQm/v4KkoSiyS1CHxprd5xQcP6
	0x9fpl4v0r7mLcqPqXrO+K7e9ZkQukDXH2nNinf3scpkL9FXcjlRc5si+MICdOTVoxTmjDsrihk
	H/IgGSGa6ezUCnvm
X-Received: by 2002:a05:7022:7f12:b0:176:2095:1ac4 with SMTP id a92af1059eb24-19935be809dmr5230234c88.18.1792901022034;
        Sat, 24 Oct 2026 21:03:42 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.221.76.40])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a32ff780sm11635283c88.22.2026.10.24.21.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 21:03:41 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Andre Eikmeyer <dev@deq.rocks>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Kenneth Feng <kenneth.feng@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	platform-driver-x86@vger.kernel.org (open list:X86 PLATFORM DRIVERS)
Subject: [PATCH 10/13] drm/amdgpu: Catch register access while GMUX keeps the GPU off
Date: Sat, 24 Oct 2026 23:59:46 -0400
Message-ID: <20261025040046.1602-11-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261025040046.1602-1-atharvatiwarilinuxdev@gmail.com>
References: <20261025040046.1602-1-atharvatiwarilinuxdev@gmail.com>
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

From: Andre Eikmeyer <dev@deq.rocks>

As mentioned previous any access to the GPU when the GMUX has
shut off the rails results in a CPU CATTER, skip and report
any register access after the GPU was runtime suspended for GMUX power-off.

Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  5 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  5 ++++
 .../gpu/drm/amd/amdgpu/amdgpu_reg_access.c    | 24 +++++++++++++++++++
 4 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 6fd607587..ac8dfc3ab 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -881,6 +881,8 @@ struct amdgpu_device {
 	/* enable runtime pm on the device */
 	bool                            in_runpm;
 	bool                            has_pr3;
+	/* GMUX has cut power, any register access would hang the PEG link */
+	bool                            gmux_off;
 
 	bool                            ucode_sysfs_en;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index c1f196242..8185934b4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -946,6 +946,11 @@ bool amdgpu_device_skip_hw_access(struct amdgpu_device *adev)
 	if (adev->no_hw_access)
 		return true;
 
+	if (unlikely(READ_ONCE(adev->gmux_off))) {
+		WARN_RATELIMIT(1, "%s: register access while powered off by GMUX\n",
+					dev_name(adev->dev));
+		return true;
+	}
 #ifdef CONFIG_LOCKDEP
 	/*
 	 * This is a bit complicated to understand, so worth a comment. What we assert
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 5ad7b6dd8..135798c76 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2932,6 +2932,9 @@ static int amdgpu_pmops_runtime_suspend(struct device *dev)
 		amdgpu_device_baco_enter(adev);
 	}
 
+	if (adev->pm.rpm_mode == AMDGPU_RUNPM_GMUX)
+		WRITE_ONCE(adev->gmux_off, true);
+
 	dev_dbg(&pdev->dev, "asic/device is runtime suspended\n");
 
 	return 0;
@@ -2960,6 +2963,8 @@ static int amdgpu_pmops_runtime_resume(struct device *dev)
 	if (adev->pm.rpm_mode == AMDGPU_RUNPM_NONE)
 		return -EINVAL;
 
+	WRITE_ONCE(adev->gmux_off, false);
+
 	/* Avoids registers access if device is physically gone */
 	if (!pci_device_is_present(adev->pdev))
 		adev->no_hw_access = true;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reg_access.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reg_access.c
index 7468855c1..bb5dbeb7f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reg_access.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reg_access.c
@@ -594,6 +594,9 @@ u32 amdgpu_device_indirect_rreg(struct amdgpu_device *adev, u32 reg_addr)
 	void __iomem *pcie_data_offset;
 	u32 r;
 
+	if (amdgpu_device_skip_hw_access(adev))
+		return 0;
+
 	pcie_index = adev->nbio.funcs->get_pcie_index_offset(adev);
 	pcie_data = adev->nbio.funcs->get_pcie_data_offset(adev);
 
@@ -677,6 +680,12 @@ u64 amdgpu_device_indirect_rreg64(struct amdgpu_device *adev, u32 reg_addr)
 	void __iomem *pcie_data_offset;
 	u64 r;
 
+	if (amdgpu_device_skip_hw_access(adev))
+		return 0;
+
+	if (amdgpu_device_skip_hw_access(adev))
+		return 0;
+
 	pcie_index = adev->nbio.funcs->get_pcie_index_offset(adev);
 	pcie_data = adev->nbio.funcs->get_pcie_data_offset(adev);
 
@@ -706,6 +715,9 @@ u64 amdgpu_device_indirect_rreg64_ext(struct amdgpu_device *adev, u64 reg_addr)
 	void __iomem *pcie_data_offset;
 	u64 r;
 
+	if (amdgpu_device_skip_hw_access(adev))
+		return 0;
+
 	pcie_index = adev->nbio.funcs->get_pcie_index_offset(adev);
 	pcie_data = adev->nbio.funcs->get_pcie_data_offset(adev);
 	if ((reg_addr >> 32) && (adev->nbio.funcs->get_pcie_index_hi_offset))
@@ -762,6 +774,9 @@ void amdgpu_device_indirect_wreg(struct amdgpu_device *adev, u32 reg_addr,
 	void __iomem *pcie_index_offset;
 	void __iomem *pcie_data_offset;
 
+	if (amdgpu_device_skip_hw_access(adev))
+		return;
+
 	pcie_index = adev->nbio.funcs->get_pcie_index_offset(adev);
 	pcie_data = adev->nbio.funcs->get_pcie_data_offset(adev);
 
@@ -784,6 +799,9 @@ void amdgpu_device_indirect_wreg_ext(struct amdgpu_device *adev, u64 reg_addr,
 	void __iomem *pcie_index_hi_offset;
 	void __iomem *pcie_data_offset;
 
+	if (amdgpu_device_skip_hw_access(adev))
+		return;
+
 	pcie_index = adev->nbio.funcs->get_pcie_index_offset(adev);
 	pcie_data = adev->nbio.funcs->get_pcie_data_offset(adev);
 	if ((reg_addr >> 32) && (adev->nbio.funcs->get_pcie_index_hi_offset))
@@ -832,6 +850,9 @@ void amdgpu_device_indirect_wreg64(struct amdgpu_device *adev, u32 reg_addr,
 	void __iomem *pcie_index_offset;
 	void __iomem *pcie_data_offset;
 
+	if (amdgpu_device_skip_hw_access(adev))
+		return;
+
 	pcie_index = adev->nbio.funcs->get_pcie_index_offset(adev);
 	pcie_data = adev->nbio.funcs->get_pcie_data_offset(adev);
 
@@ -861,6 +882,9 @@ void amdgpu_device_indirect_wreg64_ext(struct amdgpu_device *adev, u64 reg_addr,
 	void __iomem *pcie_index_hi_offset;
 	void __iomem *pcie_data_offset;
 
+	if (amdgpu_device_skip_hw_access(adev))
+		return;
+
 	pcie_index = adev->nbio.funcs->get_pcie_index_offset(adev);
 	pcie_data = adev->nbio.funcs->get_pcie_data_offset(adev);
 	if ((reg_addr >> 32) && (adev->nbio.funcs->get_pcie_index_hi_offset))
-- 
2.55.0

