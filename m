Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672649;
	b=BeZCHgN0cF3OQ2KhKUMwPv22rHgmNnaAWK8Zv/mErqjpaom8AEQLwUayqrVH/er5Z0ny
	 SBzMGRJHzCkGip065mj3EjdCozcDi83iDhBBtnk3TNfiuXw9o6Hy4wzVG6m7p2aFjCVKw
	 5eJwInV8Z5ZdOnb/LoH6zXJLcAk/NcrtnbjAV8KimJS8vvQpSkw5p6DdrWo/S2RlDqXUH
	 J8Uj0U3DUz4wBMds104pl0Kr3DIG6o1aQkim9+IKnfKJtO6AYAI2UqGo0X8PjSRBvBAGW
	 wqyHgPgMt/xUikUvidwaN9+8YGPTr53DxlXcSSlHg8iszSW2aSOw9wksxnIl/QUDgLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KPSDYqCooXPcCbLVRB9OOYzMNaTmNZPbW1+34+f9KRM=;
	b=ZrzQFovPi8TB/CUBoaihEtPT3mQT6abPI3p1AFRIx9VUVGFZ3UZrMHIXmJ6fyjYnMcEg
	 RYiUM6jbEtdY8hQWJDSVIhYVGoNZuXrQm7BCGh2Duvv8pazB/hZAa/sPt5+BsIyc6nXP8
	 XlRHGiUjWJAMmFr3UEY9ztNmKs6ROhn8sWZtW6k4ayiQt/vqhVVp49qsCJhGzTiUcH37c
	 FskLJyuxhigvOu9XlFJp/McwiKOlYLzhqyQKjbFKuzYMEqL+Dl1tgr9ymrcImv1j3fiSU
	 L4zMkDlZM+Szslxrl+xvngy5a34ruywAcC67bkiHjTv0l6b2dzCvHuS4tVRIbxOQq8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UI+8X9u1;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD7F606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:10:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFD7F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UI+8X9u1
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3712b6d9843so1744194eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794672648; x=1795277448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KPSDYqCooXPcCbLVRB9OOYzMNaTmNZPbW1+34+f9KRM=;
        b=UI+8X9u1K6VpjHdMnY8BtVFWuMOw2NqNYUAUYXDVrOZUKQ/I2nEt+VAnyc5dX+W5d1
         Mddl/IIWkuZh9WdnaqzgenfUuwuCVp/CE1Mef5Pc1hSXmHS9hzNnikBReI0hM8WiKEzM
         Oe5mC78RbP/wKBnN2j+dUxHEvzG9wI/NPe2fh56u22u9KazAlkYyNcE6kEWROzlFv2P1
         P8JNWjX58l8eFhjHw/VwzrliLLCXZwm8KmXeo+KhRMBfTgdcsbLauCnnVypp5FzpRjT8
         gBg99LDPl8pMsgK6CW6AVxP2aDI3T7PjJLaqtYuVD75JLwCRLwWIRYnOc+7S2iJ4FzpC
         dL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672648; x=1795277448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KPSDYqCooXPcCbLVRB9OOYzMNaTmNZPbW1+34+f9KRM=;
        b=Wyvetbo/RUIqfLelSMp5Dit/Fkb7QYQvc1MqrNI9vMuU6eFdL2xJRRSvLm8yJnt9vY
         ENI5EOSYzidmTIZ73xTzjz/SyjRZ+EXIsXIRk7sGZJsMIwSdIveUHScS9/gOQRxIxCq6
         1TFxX//1PsPXNv6FgBc3VfMzvWRoKW+2MvO3yn13brGNdJ2O3FBOs76ZSzV/a3eQwfXq
         LpcZaP0iGcu84aM5W5sIZSIEYePikekR1+Dgwe+B22WqnEe5pUFnp/hynxtykOnB+z8J
         hGLvxNlR/LEPVlij6LMkfbfneh/Jle1Yzn0koWmJCk98kkfHl+yMbEPQpWK03YUSSN32
         xhpg==
X-Forwarded-Encrypted: i=1; AL+hErFgkpFjfuOFQ18grrPH3pT/okWVjtUytaMDoKoE0PheFNFG46ccx3aRSrPEiqlFbEyVwWoJqn2C9YryayU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cz8Gp9G610tzJqdezvkn+if7f6rqkO7QJHxeT2997BhPPDuqg
	ssLhdAzL4uBy8PFrfmC2uto8DsRjcolv+0dj8jlEdoxiyQKZ6nJqcBM=
X-Gm-Gg: AYBFou0K7i1VhowOyxmb2uVfOT8iB2VomxHWT5pk0F4a2dag6up59u2cyVu2W65bLkm
	uYvRI/8xOaGIGn1yS092hJz7EOqMEm++qEgQwI2VolamNpKe3/cMjjy6ML+oHW6FW2W62CPytcs
	kU8MXwDLgae66L42ZJ/3jIvpBU7yP3CAOcSPdC8ROytVcY8ntkKF6BpD46t/C+V8ZwjOxSG1ueZ
	1Tb9JfXXJScHUziMDpz1JH/upmGvXwrg1i6zAVaBHHqAz9pNQUmw/SkXNViqvuewrlpucRUVpJI
	9sOApT5dsBJyoBIjLVvKpmom4a5QGEKNTAM2YOGAxnoEf+8qbsNGNoYDiBkTTVE+lj+oi72Qp5R
	GcHmvUzmw71kegwqg0wbwDSiWfwI1tkCoimag2n7hN5uTrTZqVDKtUEj3ZDzXjfWJ+/xKKopvAT
	1C05G92mSh+Pn7/5q5XP5w1dSfML/5r5In+m23L+QDCf3l5w5yJyrzq5gHu8bWPWQ/EksKXCR1i
	LbFHN298ryA5d5syZWBd9H9JYfyNxIh1VZtu7injXj2gNLOfSE12ZWn5LrDMxYvjupfaXueHzbm
	RatBbTgZ9LRnUNSprN12qMm+2t5M/NhjO0rz+71/awj90MAeXP45yyt43bTYeTIbog==
X-Received: by 2002:a05:7301:5401:b0:35c:8b96:94d9 with SMTP id 5a478bee46e88-37966f31fddmr5041718eec.19.1794672647666;
        Sat, 14 Nov 2026 08:10:47 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.202.127.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0919sm17567582eec.29.2026.11.14.08.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:10:47 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Andre Eikmeyer <dev@deq.rocks>,
	Sebastian Zygadlo <szgit@icloud.com>,
	Yossef Osman <yossef.osman@proton.me>,
	Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
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
	linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	platform-driver-x86@vger.kernel.org (open list:X86 PLATFORM DRIVERS)
Subject: [PATCH v2 10/12] drm/amd/display: Refuse DP AUX while GMUX keeps the GPU off
Date: Sat, 14 Nov 2026 11:06:34 -0500
Message-ID: <20261114160731.3756-11-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114160731.3756-1-atharvatiwarilinuxdev@gmail.com>
References: <20261114160731.3756-1-atharvatiwarilinuxdev@gmail.com>
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

fwupd reads /dev/drm_dp_aux* while the GPU is runtime suspended. The AUX
device holds no runtime PM reference, so the transfer touched registers of
the powered off GPU and caused a CPU CATTER.

Tested-by: Sebastian Zygadlo <szgit@icloud.com>
Tested-by: Yossef Osman <yossef.osman@proton.me>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 7261317d4..0d11a9443 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -24,6 +24,7 @@
  *
  */
 
+#include <linux/pm_runtime.h>
 #include <linux/vmalloc.h>
 #include <drm/display/drm_dp_helper.h>
 #include <drm/display/drm_dp_mst_helper.h>
@@ -111,6 +112,20 @@ STATIC_IFN_KUNIT ssize_t dm_dp_aux_transfer(struct drm_dp_aux *aux,
 	if (WARN_ON(msg->size > 16))
 		return -E2BIG;
 
+	ddc = TO_DM_AUX(aux)->ddc_service;
+	adev = ddc->ctx->driver_context;
+
+	/*
+	 * User space reaches this through the drm_dp_aux_dev character device
+	 * check if the gpu is active or not.
+	 */
+	if (adev->dev) {
+		pm_runtime_get_noresume(adev->dev);
+		if (!READ_ONCE(adev->runpm_active)) {
+			pm_runtime_put_noidle(adev->dev);
+			return -EBUSY;
+		}
+	}
 	payload.address = msg->address;
 	payload.data = msg->buffer;
 	payload.length = msg->size;
@@ -126,13 +141,13 @@ STATIC_IFN_KUNIT ssize_t dm_dp_aux_transfer(struct drm_dp_aux *aux,
 	result = dc_link_aux_transfer_raw(TO_DM_AUX(aux)->ddc_service, &payload,
 				      &operation_result);
 
+	if (adev->dev)
+		pm_runtime_put_autosuspend(adev->dev);
 	/*
 	 * w/a on certain intel platform where hpd is unexpected to pull low during
 	 * 1st sideband message transaction by return AUX_RET_ERROR_HPD_DISCON
 	 * aux transaction is succuess in such case, therefore bypass the error
 	 */
-	ddc = TO_DM_AUX(aux)->ddc_service;
-	adev = ddc->ctx->driver_context;
 	if (adev->dm.aux_hpd_discon_quirk) {
 		if (msg->address == DP_SIDEBAND_MSG_DOWN_REQ_BASE &&
 			operation_result == AUX_RET_ERROR_HPD_DISCON) {
-- 
2.55.0

