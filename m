Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672667;
	b=IRE9oqnfwOXnjBKYh7WoAY2Je2nFtNxanXY7z5uvRyuOEoBn6MQi61y/gWg+RgCnUB0u
	 s6vqfksxGxa4NSGFLIH4j1+8rwC8raT+kpk471GK1V3LJp3RNzNP4NA8L3SjV7eTBt9r/
	 gCU3j3jkmHGvoF1txjm5BApDnJigpEsW5Ysyv+pteUMsBvA1VEZrF1cxnbWHSbOxKGs5O
	 awsAmlIuM6FnmWk5n1BwLL/DLHsiXbKQ0hDp7mkbNPkdKYRNa8CLUcZiCU6D3tp0uHq6E
	 DIgMqexbzD9F4jzWJ6Qp/3+9qPG/ELziu0rf61mBSXRGWQmAEq2cUlYPWNc1TznAMOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MmSYBT0oM+9e7OOhRP6rlPjvDndoWmXiY3l/U4zXmz0=;
	b=baLHiBZh6KlrEGUAWnxt3bCyu8HMvueMo/bU/SKpYNeqAVMR1xZDSwrVRCrQbJdcL2Df
	 hoT2kREk9bNYA7Ax40lZ2GA6omvylZWOrXkSiuTCfAXqdYktV6esIoGl4niai5ruC0D2+
	 UCIBrtOl1RcfkBgPTu1at8IKuS9GuNveRAlFai17tFxQR4IyfNBcgn1HpizILRb9M4jmE
	 1H5CDry0hJ32Or49fvbhjYHPx3qH2NAC+x6vDqe8RncxOkbfCZAncdD0mgSLmQdAuzzl3
	 tYkRdgs5WSwb/9QmBpBJ5UoWEi74B19DNPcsuZN8+GxwdeBW1RU1lcKxsQm2Se/lc/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qUiTkYMN;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C6B606A336
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:11:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06C6B606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qUiTkYMN
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-37000e7234bso95218eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794672666; x=1795277466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MmSYBT0oM+9e7OOhRP6rlPjvDndoWmXiY3l/U4zXmz0=;
        b=qUiTkYMNIBLLP6fruNVmymNOken5TH+ZMKj5c5qKCKzeNVQPk+UaK2+j3L+Tsv6ICm
         iUKuZU3aJlISkT/LuB0cFXQrpedRFoopgVw6y89nfkdBmJleyM/yS1fXDhyzXYtwFJuc
         7rsC+8GPtcECcw8RNmn8s4e2Mn0wQNQL0xYzsVic78lR6/bNISZKbpLiuIGDvQRCw7Ok
         ONfNaklfm5jAMQq95jt5HLSQih5LyF7q51PHZTucnSBsklZbFZGhLrcriSClBAIFbY5h
         ZYIp5MBvgIrznXz9Z7r8myawp1pmbK7u4khIfnRegOFkmWsBgXWk3/ejyhfyRPWYhGZd
         sScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672666; x=1795277466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MmSYBT0oM+9e7OOhRP6rlPjvDndoWmXiY3l/U4zXmz0=;
        b=Ty5KItjiJVAgnj95EowP1orNQUtNqxXFX0FBupULqxqqM+P1ydDeK5jLbf1NILzgmW
         wdV7t96R8P2aGg+psDvbZzDyxxy5spmSD15+s/6+m9CEGt9AnBTEVPrTLnFPUUtKErIc
         mta0+zr4XApOGalLzp+PH9amtjo5J73TogqfC8BkWS11AmMd96EcVnWVMFzdOWELYtmv
         Gaqqm1IvjuTC9hYfJN9bye6RXbK6X2f7mvS4YfHdTZhyGoBKe/Iz+6wiV5FK0K5RXcNo
         YrX/yrmKpK9x6Zz1OHoM0Sg/O6hgtft3l7uk+V6DKaJ6yYh3tV2ugLsNHPonMrOifdFU
         qwfg==
X-Forwarded-Encrypted: i=1; AL+hErGCgk5acq90iXHlZ9aGE+gfpZ0ZfmIUjD9pJ1DgbvaHEAwx5huLzORFNb57ku892/oGye1aIe+Tak3b89k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kI1h8iELOTlLKX/1GqA4iLnDEt+kM7X17/35UqKAm2Y5uyF2X
	AdhqbFbOvhjLUU2DDI6hrPc+ZMITE6wGewb4BLdbc26wNXqJsM2ldx0=
X-Gm-Gg: AYBFou23POB9uGAPWP2j59nWcYltvk6uL8hSlqLuep6XMlE1rj8MLlGyioVGCkryba9
	OzNo9ULIilUEMTsS5rPRC3ePOLqX79ew+AmtHGjhev73a05Kv2FP+qlU8VJiC/bs5MOE08gSLDr
	zsTnCiMYBylQppkRVIHZPl6uiPV4BqeYUrcfhhMVT8qeYiP+oWFrUU7dIgqY7p8BkIhPFK3JmOT
	J8Eb2bEPap3pGmmSWB75swLVbnd4XUYiAVLUpDueJp7zeB/fAb0Mh+9gOKVTHbToZbSCXkrHPLQ
	37L4VC2cgzQ3YQnLQDbWdDAHv+sxnKBXX29WrQm+5UjpQ8SXe2550dhC5tPi1p7GHfBE8ZzdT+9
	fx+ZTWGEe525b5VSOyZrbWI3hUCt/kkvWxhIvMId14dx72zFkiLLRidvj4HArXiMDr1/aiNgZvl
	pVlz9U5vijnxefLBYyKl+2ig5ZLg7k/LKl+9JNoUqQmFNrEyf51/vm7Sl0kjsQIIwKTH3EOAUE0
	tMLwtdqraS6VlhaqCiKIG8yvIOX15+zNPFXCN7Gt1a8hWAOv7AOR3bFZdWryWl2XMuKezXvudHO
	tiqzXKwP1hbqYdlRjsRKy029DtKpK0cgFiC1t4fbmfxmFHennAHV/Zrx4qTqfffDAA==
X-Received: by 2002:a05:7300:cc9e:b0:372:2ed7:8f89 with SMTP id 5a478bee46e88-3796702a36amr5694460eec.34.1794672665837;
        Sat, 14 Nov 2026 08:11:05 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.202.127.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0919sm17567582eec.29.2026.11.14.08.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:11:05 -0800 (PST)
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
Subject: [PATCH v2 11/12] drm/amdgpu: Skip AC/DC notification while the GPU is runtime suspended
Date: Sat, 14 Nov 2026 11:06:35 -0500
Message-ID: <20261114160731.3756-12-atharvatiwarilinuxdev@gmail.com>
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

Plugging or unplugging the charger raises an ACPI AC event. The handler
sent the new power source to the SMU without a runtime PM reference, so
with GMUX keeping the GPU off every SMU message spun on skipped register
reads for seconds. A runtime resume racing with that left the SMU
firmware unable to start on MacBookPro15,1 and the GPU in runtime PM
error state. Record the power source only and let the resume apply it.

Tested-by: Sebastian Zygadlo <szgit@icloud.com>
Tested-by: Yossef Osman <yossef.osman@proton.me>
Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/amdgpu_dpm.c b/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
index 808be6c42..3c6dde386 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
@@ -30,6 +30,7 @@
 #include "amd_pcie.h"
 #include "amdgpu_display.h"
 #include "hwmgr.h"
+#include <linux/pm_runtime.h>
 #include <linux/power_supply.h>
 #include "amdgpu_smu.h"
 
@@ -498,19 +499,27 @@ int amdgpu_dpm_smu_i2c_bus_access(struct amdgpu_device *adev,
 
 void amdgpu_pm_acpi_event_handler(struct amdgpu_device *adev)
 {
+	int active = 0;
+
 	if (adev->pm.dpm_enabled) {
 		mutex_lock(&adev->pm.mutex);
+		active = pm_runtime_get_if_active(adev->dev);
+
 		if (power_supply_is_system_supplied() > 0)
 			adev->pm.ac_power = true;
 		else
 			adev->pm.ac_power = false;
 
-		if (adev->powerplay.pp_funcs &&
-		    adev->powerplay.pp_funcs->notify_ac_dc)
-			amdgpu_dpm_notify_ac_dc(adev);
+		if (active > 0) {
+			if (adev->powerplay.pp_funcs &&
+			    adev->powerplay.pp_funcs->notify_ac_dc)
+				amdgpu_dpm_notify_ac_dc(adev);
 
-		if (is_support_sw_smu(adev))
-			smu_set_ac_dc(adev->powerplay.pp_handle, true);
+			if (is_support_sw_smu(adev))
+				smu_set_ac_dc(adev->powerplay.pp_handle, true);
+
+			pm_runtime_put(adev->dev);
+		}
 
 		mutex_unlock(&adev->pm.mutex);
 	}
-- 
2.55.0

