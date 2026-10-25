Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792901049;
	b=UBa/MZV41RCe8aulRM953Nxq3znkQ/KZ8sd1G4v5D/l8UXBFFp4/LzSTzgxAuJbkElLj
	 6t+nQ6ZqvvC5f3yJzyJioakI4ZbZKJJyA/Y3+j/GMJz5hUGm+uzaIGniT2zx0bzwtVIAB
	 cphRvqzfxzfmyaaMdKRWIvCCFbIJImsF3qC+t+TxjuAeOZTsqnv4k7AwtXm5mc6FVfiSI
	 g2k+FIQZObiN4nxCgxJh7yi2IaN7pyhdBJEhKvH1sRZbtZf92Br9Bbavy53QawaumIE1i
	 qNZafh9lisQFyt+KADJlmyKzi1QIu4DJ2S0vyHZIhkThNmTfgmaigRqriqCHE8Sv6hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792901049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HlYNTG1YeavwC+hNZqZ9gnXD5hsIPEAX4XNijQPWf9E=;
	b=4JNVZexTX2K0kyytslPLbK/kRHJVG18JBxCIcoIdMS/jK3JOAtsBZkOlAR7qvpOXoPBT
	 mzYifjn5K8I7tR0fZmv3V63k5oLhPGksmyrFY+aN53SroCPDw8duFrcWZ7JG8SAW0jqCC
	 s5c9kPR5aEb7PgI/ejgnysrDpyKngo9bpoWCbVNQQ6R1PeXQzRcS2qaAxXtH++X4CrmM/
	 JMxi6w/JvgchZsBNZ1xqZr2ThQcHcCvNxuz1p9FLzCbj0WhOskJK0Iby7zTpTHmCrXldF
	 ixO8NOJYXhNxquk5GBNchN6Iocukme0tReEpQ/nkMA0/HnNSvg8iz3W+H5W1hx3AWaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L9SKuc6l;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106F7606A337
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 04:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 106F7606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L9SKuc6l
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35829219da8so3698654eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 21:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792901048; x=1793505848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HlYNTG1YeavwC+hNZqZ9gnXD5hsIPEAX4XNijQPWf9E=;
        b=L9SKuc6l7H2xpZ1V5KZNPlLweEJXM4cfELyqf0EUFa6eSqOjr+QKnsRdDfoyqAgqA2
         rdQcY6UPG1T2QMg6w6WpbXAlsoN8kWZykxClLarrfczhRYFUntL/t8I/giAXuzP2Cf1o
         R6W5/UB9mWrShso0fhqK/jnmBWsRHv1YUiT++MzGr3aT8hVanXIprRbcwlEUv6u376So
         KLJpOiQcPsyxLQ0JCcaKzIFEpLeM6UVYIN4EZpyjm0v/BPinXiXplRQTMBFFz40UjkTP
         i6R04EZZ9aVIgsbQ9nbrobfT1tFwoLFObp6+b/Ml61aJmmthENEB0CpO2Re2o7hZDKq8
         vIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792901048; x=1793505848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HlYNTG1YeavwC+hNZqZ9gnXD5hsIPEAX4XNijQPWf9E=;
        b=GI6/VbbaHrV0+q5BVCLjWCyCJL+eivC2mb10hpOhw1DWEzJ417vN7rmP+qe9QofpkY
         LfrWZ9gtOknPIFPPcat5tUyDG9Y2EQxT8f4dWOoiw3oShrF6IzAFUeNUoOiSl/zYxgsv
         HgcNv+YJI7gKHbFoqXIPpLypugK45Kz7wY+/tO0WPcfT1DP0NyvNSab94FolIwjwwVlq
         ACq5uOCZ7uR/pzYdrWq+SfeLhfVJsc3Ic9WvEXZb7iQtH13Fa5fI8jT0nFER5j1tEjWd
         1Kua158N16VuKD/d3bWCQsUibmZf5apHl7NK7zN8eUjkTbmFVv9pML69z1gkoH5WIBD7
         ti9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwBzD710MJub+nykEsNzom9pKn4YSS5/ZzHnSEUl7dokGaNw6takfamglYDOpmKGl2uaOXmRPvB2ZgIgA4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuOztPWOhPD0oVW5ZQfMFd01+VrMn8PAtyLEhZcfIMFPmnt+fY
	MA4QMfkhy2sA4TyQf5ha4iFwq1WmoKUpKRB2F2HqEvQ2anCEzw4Inxc=
X-Gm-Gg: AYBFou1D4CXbZhJefYoCYbnGlNIO3XBnvutQRhhX4TLL97IhRbhfTV5E9a9wHdMAOVY
	alUBAd9WeDgshy7bHb0pGInbitlkVhxJJVmLtrU+/gvY0fAity9GqJiUCz9b7dfjy/ToGin9bMA
	Gnfb6jtc4gqTM0R/DH2Rg4YpUuawmqOYR5WG6gUOUFrZ9MT9rpY4tHjDAEkSlk46UL8C6OkMBCS
	xJ3wgfAo87xk7Pu03+0S/uRL0k7cP8+8/V/sfDl09Y7pqjTXzHuCYLSa0vv/0YoMoYFFZHl0ARe
	b01dyvv7BaCYVCgfbsngS5qZ9TQOPlh5FAw/n7cqv5eTEzMw3if6enKRWALAH07e161ZI9GaxA5
	5jYrRipzDSD3ASsdLH9WkKvkbqpfOrNfy3qkkHj+QzqJa4jcRV5UXtGJj/p+CLHN6qEIdWwgflp
	18euoc8ucZC/Dkeg5vbZbxSp+uJw6AJ8bHg+LJSDhW/1kcO7jCnSSwmUbqX2o+fWHXebCbqdAou
	s5603FWFyzFCAG0Lk29ffPAnwoa42zNRDq2EGdnoPo3Xg2JnVJHWRtj2zVAcCfUX5ModhkvzezH
	aTzc6qXAa0lv6TxGRbEJ5lnM7PwotUB6jSbqgIEQQ2H+rzm3bl39LAQxvZiw3qdl5Q==
X-Received: by 2002:a05:7022:5f14:b0:146:5f73:d45b with SMTP id a92af1059eb24-1994cb430a1mr4374141c88.3.1792901048032;
        Sat, 24 Oct 2026 21:04:08 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.221.76.40])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a32ff780sm11635283c88.22.2026.10.24.21.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 21:04:07 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Andre Eikmeyer <dev@deq.rocks>,
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
Subject: [PATCH 12/13] drm/amdgpu: Skip AC/DC notification while the GPU is runtime suspended
Date: Sat, 24 Oct 2026 23:59:48 -0400
Message-ID: <20261025040046.1602-13-atharvatiwarilinuxdev@gmail.com>
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

Plugging or unplugging the charger raises an ACPI AC event. The handler
sent the new power source to the SMU without a runtime PM reference, so
with GMUX keeping the GPU off every SMU message spun on skipped register
reads for seconds. A runtime resume racing with that left the SMU
firmware unable to start on MacBookPro15,1 and the GPU in runtime PM
error state. Record the power source only and let the resume apply it.

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/amdgpu_dpm.c b/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
index 808be6c42..b64f0b681 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
@@ -30,6 +30,7 @@
 #include "amd_pcie.h"
 #include "amdgpu_display.h"
 #include "hwmgr.h"
+#include <linux/pm_runtime.h>
 #include <linux/power_supply.h>
 #include "amdgpu_smu.h"
 
@@ -498,20 +499,26 @@ int amdgpu_dpm_smu_i2c_bus_access(struct amdgpu_device *adev,
 
 void amdgpu_pm_acpi_event_handler(struct amdgpu_device *adev)
 {
+	int active = 0;
+
 	if (adev->pm.dpm_enabled) {
 		mutex_lock(&adev->pm.mutex);
+		active = adev->pm.rpm_mode == AMDGPU_RUNPM_GMUX ?
+				pm_runtime_get_if_active(adev->dev) : 1;
+
 		if (power_supply_is_system_supplied() > 0)
 			adev->pm.ac_power = true;
 		else
 			adev->pm.ac_power = false;
 
-		if (adev->powerplay.pp_funcs &&
-		    adev->powerplay.pp_funcs->notify_ac_dc)
-			amdgpu_dpm_notify_ac_dc(adev);
-
-		if (is_support_sw_smu(adev))
-			smu_set_ac_dc(adev->powerplay.pp_handle, true);
+		if (active) {
+			if (adev->powerplay.pp_funcs &&
+			    adev->powerplay.pp_funcs->notify_ac_dc)
+				amdgpu_dpm_notify_ac_dc(adev);
 
+			if (is_support_sw_smu(adev))
+				smu_set_ac_dc(adev->powerplay.pp_handle, true);
+		}
 		mutex_unlock(&adev->pm.mutex);
 	}
 }
-- 
2.55.0

