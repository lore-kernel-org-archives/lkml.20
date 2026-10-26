Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793054801;
	b=Q3Td/9sEjxuAIXWgHwu2g22uzZo0yRe0hOi8h0WnSVIQ21bNilRTcbxVz2PuLotKgmkb
	 WTw/Nm5WGpDoL5ggDCVy3cvtOFZ+Rk3nHylSp/f/+q7xd3rQ3+0K0VHFLeet75BPK2F+i
	 Cz4zCa1Y6pDPEcJhl3dLJ8/q79c5c12tPyYmaK64jU1f/9M9HxBHizVb4yS/Ds7MlCcM1
	 thc2KL+/Hvpz+AEVWtGKc0euh51Ch49yr1ot6iYAF4rqlE83oJN/aMsk2uOo+3TrKJ6/Y
	 /eiHKAtMJkQryJWUq8gwIVZz8BsiX4i65059Q1/nboefdhdoWchjRN+JTVpvKl3uf2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793054801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Content-Language:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=uLTFgSWVH5PgtNiCYE4Ye5g7oFVHKv8jMWdCl4mPxv0=;
	b=LEUlYHHDJMdASmC3B5KXtmCUxeQfpKuEmqf0DHByUaPwkJSchHaMmYTCmzPiLYWf0B7l
	 ZU3InHEtUcYiqlMjKq9/3MJlaF2TWsCcvL+t73kTr7XtVVuj/a/koZz1RchJ+ALe/YTO5
	 LUI7ZKukOybapSP+5K02476hwQ60zVPed5rPzdD0uHMHV/S0PVw/5UzMRpKS1ojH1Au9J
	 29QhlyFtgJ3fj0Ft8QoDPJrYDEA26bs4tZriwL1ERWSbT7XmB3Uf4qYJWiywuYs3RCiE5
	 G18b+3Bx8ZirqwGPkiGR2u8KO9dhJBuCAqf2PmDnz42DsoEgUV/v1Iz/NThpz1Nqk8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CBsRmJ36;
	arc=none smtp.remote-ip=74.125.225.130
Received: from mail-wm2-f2.google.com (mail-wm2-f2.google.com [74.125.225.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EFF606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:46:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9EFF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CBsRmJ36
Received: by mail-wm2-f2.google.com with SMTP id 5b1f17b1804b1-4a210b0d5c3so12639065e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793054799; x=1793659599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uLTFgSWVH5PgtNiCYE4Ye5g7oFVHKv8jMWdCl4mPxv0=;
        b=CBsRmJ36uknqEKvoCOeONNfH0DkZgR1pCwT6D2uyLgwRnIkHKiAvpbQ4kSG9H7ZsZ9
         Z56JOFUu++8WBfSHNFnKhRzUl88fixGf6MRxpMojKj8QNTQCusRUGFfiikHB0bnYyoCM
         bYOl7cVyprIvLNZGzyw0M51hWur/CMTge6KFfgUL0KJbQAlouBPdHrDzlDlgohZ1BCW0
         WR1deShtz2URKUXnKGc2KZ7VdBy1L5VkZ9qfDYumHmj3O3wipQEWrx8909xtzMfmjqk6
         efeNSo9ZXHKcadP1jDf+rlwlVej2WQZbDpoo6zZUzqwhu2aiAEhH+Ku+8JuHDUoYDQpB
         SYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793054799; x=1793659599;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uLTFgSWVH5PgtNiCYE4Ye5g7oFVHKv8jMWdCl4mPxv0=;
        b=MYCreY1Sbq5nxQ1Zc9++onuko44R/lcPV1py9DdeHNrYjrfWTs6wHf9dfQP6yTr2Xy
         b0potqFNvj358At35r3Yj8r4QrN74sixjmToGp1vYR14r3NzQMnIePfSWc4CckM1f5Qw
         zQPXkPo/h+9WltOIpN393rR1YZX9Qys5UOdWLet0JpL5D1K8yCwK4o1glJlh/hxCPt3X
         +sW8N8JDsVTHHtZJqkSRYSbKl8Hm98VuNiuNYY3f33rPnbNokFd5DVCPa1c5PXWj5vMT
         cCCAT9IAXDUjh0IbAoUhc50NSaeMGZR1ZdChDXJ9hXBIJj0on02nX4dWYh/9Nv6DW51q
         tNUQ==
X-Forwarded-Encrypted: i=1; AKwUvByJxDoM5T9W5IcxlrecWyAq72r9Jw6xP25NRxlYk72qDhm6Zjc5MAeCNfAi/6rcVstGB4Lwo0I3Qj/AqoE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKFvMTjaFHp2v9XyJEBl6PqskO4SrZOgSYSZh0tNXD0iGtYoGd
	2CzSd4YbrMp4KiyzhmtSpAkKpnzU09nwbluQDUwkOfMFsnhnnDXK6SHY
X-Gm-Gg: AYBFou1Gaak5sdION6s+gHgUUyAhz65eQvCjFHEWLPRzT79ogqZckdXJHJKV5kIB/tW
	rmUTS+W+2IbvNE3PNFM6YvLs6upPw8Y5V5oWGumxtFAIx1x2MoyZoH9Ib1b1oDiTnyeY6bEUq+U
	j1E+7Qw0v6EbiGOdFymKX2Tm1yXlA1GHzniM4wPfJhI8czzxLQubD1D/+XTfFdEaLFS3X50iLcZ
	5eaYZ4Y5LMC/mkXYv2AmSgs9G2IbdkcGgkmzIvkqKQrIMg6pOuImYuioyW0RhG4tfLam3N/rpio
	ccTSfXiaZ2mu2PD99bfeN0wEv4++VpPQAHEwErUI8p1uDkg4buIxkHdhMiLDiTU3Ck45g+F34ay
	cDzuWWO3bTThndkooQbQlgGoo9N7csBmNq6r+slhlW5POPag+H5BnLHbItqXwV5wzKLQ+KuYMvK
	ZONIC+rqhMXyK2SZO56V06eHZCM1GGK/HI4kJMkaq6mxveyoMvlPyAVHGEKyOW6aYla8VGnR2YH
	sM0Nyq/IDb85oZec10Pd/c34eccnVx8tZdl7qCVMj5X3pKAsCIkIQNAQN5Bxt/ZmbYWoDg=
X-Received: by 2002:a05:600c:524c:b0:4a2:105f:ab88 with SMTP id 5b1f17b1804b1-4a35ac963f8mr148226215e9.18.1793054799133;
        Mon, 26 Oct 2026 15:46:39 -0700 (PDT)
Received: from [192.168.1.12] ([31.94.68.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359f3e00asm390740105e9.0.2026.10.26.15.46.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 15:46:38 -0700 (PDT)
Message-ID: <a826b32d-597a-4c01-8b30-218cbca8627a@gmail.com>
Date: Mon, 26 Oct 2026 22:46:37 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Richard Lane <richardlanedev@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
From: Richard Lane <richardlanedev@gmail.com>
Subject: [PATCH 1/3] drm/amdgpu: reserve 64M stolen memory for Apple 5K iMac
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Apple 27" 5K iMacs report a single 2560x2880 tile (28.125 MiB) in
VIEWPORT_SIZE while scanning out up to 64 MiB across the relocated EFI
framebuffer.

Override the stolen VGA memory allocation size to 64 MiB when matching
PCI_VENDOR_ID_APPLE with a 2560x2880x4 viewport size to prevent
framebuffer corruption during boot handover.

Signed-off-by: Richard Lane <richardlanedev@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index 4204c3c750a8..8b196fbfa724 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -1232,7 +1232,15 @@ void amdgpu_gmc_init_vga_resv_regions(struct amdgpu_device *adev)
 	} else {
 		size = amdgpu_gmc_get_vbios_fb_size(adev);
 
-		if (adev->mman.keep_stolen_vga_memory)
+		/*
+		 * Apple 5K iMacs report one 2560x2880 tile in VIEWPORT_SIZE
+		 * while scanning out up to 64M across the relocated EFI
+		 * framebuffer.
+		 */
+		if (adev->pdev->subsystem_vendor == PCI_VENDOR_ID_APPLE &&
+		    size == (2560 * 2880 * 4))
+			size = 64U * 1024 * 1024;
+		else if (adev->mman.keep_stolen_vga_memory)
 			size = max(size, (unsigned)AMDGPU_VBIOS_VGA_ALLOCATION);
 	}
 
-- 
2.55.0
