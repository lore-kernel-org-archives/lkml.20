Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793332555;
	b=YrP3yXAgOiw9cybTctaQvksm9W97fu5WQrprKm4FUf58scMj+aonfAeBYZXuPi6p7K5x
	 hW6kjwjmEdIpSnqlrJQqX6bLRIwMdugr2r1HBB57CGOEQNqxO6idr+7/TE3r0UIzb+r2r
	 RvOd2szQ1mGImzsAEZOHTwiadKtZexySHCdzTQBz+tuTQ2Nk7RfPZX4aHFJV/mWKz89e/
	 Mwh9/Cq9FKixeT4iBtMHDF8aCHT6xxGgM5w0Jk2MfoaoTwr7tRsjVj1yYUnvGVFET9gzp
	 4+syQFbgPstB6DoGzZCUdcgiLdlg387iUgCxJgaxCdxmUY4SFLc8BmgOAyVWqFXqJIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793332555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=5zugQx4flv62Sdzk9Wl3acRuLP/zK3sGN6owEqXiGh0=;
	b=PKvL5sZ/IlkPEV1G1zaeIu4rnIsZnZNaP9NPPU/HjnaPeTM2Gn24f3fI8oqW6sx9TNaI
	 pla482pZoI9pWG8V5TAJWYp3vGfupgyHoW2iEUy5nHpact5o4TQl+W414H8Wk2D0FzC4Y
	 2vmphp5lei1d0X40pzGeT+LHOes8G+hO5o4dZfv0kmcOU/PoUoTm+B5Nr9QkcFcG1WVBh
	 rRA7NMVodL8iWUV30WfvrL96fsC04zaZxi5BgfIN2fhbUPhNSCnag62O5vJfnsgxR14ho
	 4FgTh6lF69BsRn2r1cU++fj5He7vpt6yGwmlBHAy+sONbtoZHfRVWrrMnS0JNlWOgpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t5Ui1rro;
	arc=none smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AAA606A333
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1AAA606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t5Ui1rro
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67a79750749so143300d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793332554; x=1793937354; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5zugQx4flv62Sdzk9Wl3acRuLP/zK3sGN6owEqXiGh0=;
        b=t5Ui1rroa2f68mTGWFToB8+XjEj0thG1CdW6LQkCVmHvnuwKQplXZqslr0K3qz4wkR
         qh+ljZgv+SORg8Ji1IJBBO2E6y9TFKjHakhzpzZ1WNWjBhr81HWfS45V7RFnjalR9ob/
         U7m6haYRt50adBecklGpaeowIcr48DkDPo5fuU3mtaatNjNj/gSQuEy4FtIraXAXZCCX
         EFHWWLvnebKm04qQCiIwy21qrUDcvywhGSvwvyhXkh8mAuLRv3qR/fTn/IR28dsPfpqG
         ITS+LaA1MS0IvV2FkqYnyd70hGP00kvOl/SuKzw6ordtMcbSXPTC+IvnOllcbBh5gLIB
         pe6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793332554; x=1793937354;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5zugQx4flv62Sdzk9Wl3acRuLP/zK3sGN6owEqXiGh0=;
        b=SJIbsvkhb08DTh0eanQQ0vSXsUlt/IbZWpFVvpkZGLLdlDjyarupUeySPxjCTvJSJW
         yTZVZsFfvHwLeD8XjwdkEn6DNgw4+13W2KdU8zdEAM65GHdWEZHlcefF+/EV2zQm7/np
         pQcbnOMjV9bBIfvQbKaGAU3CUhFHR3co83X5jVCIHOpiPsrtnH8lsoMc2Hs++vY+nsiY
         j/2rgSYi6MJrktuwcQcpzQ6cZNPtwJVqjabOPA8gV04i82hAoYprc8QrReoXAYm4/peK
         JuhE4JeUy1OJLLwLPQhA5FG/PZxGWJx4xyJB76ZMfk3QFA7wEu3F1WCf6znlBljLla/r
         xpDA==
X-Forwarded-Encrypted: i=1; AKwUvBxquBm3yH+/MuodrBcjXRqV554k5ODayJCeVzzkX6ii/j9DnSsPSG6ODZ84JG9DzBnn1d7sKcFdufrZlvM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIir+pHBYuJvd3MLBjrajETs4FdB0CKkSVdnepeNDpo+HCFp0wT
	QJd4WLlm5F6DKEFhLAj7j5WGCUNmZPn9vKZrB8U4NoXj5yxFc7V9/WGv
X-Gm-Gg: AYBFou2KUZsNXKb3LD2ofYkJKDcC+wgSphEhtnMXHZW4EjBL5uZWDMRRb2hQn5Xp4cn
	wCkBbBbqz4cxns9d2Y8tY51HknH1aEdlxle1p+xKXi1bURnUGgqdFqtBGFYUpLOLF354c7yg8du
	24n1INvXNE7T4+tz7ePu9ZFkppwn1GD1Qht+uGa62WCw0bDUDDxT3azZOVEXVUXyl2yzsgfmGx2
	13cnRW9oZ2ilQgqfXm9H0D6t6ykOEbHilwJkzj6h0yRC2tROXG/OS+bscBbyhaSOj+xyf7TaiCp
	+85rwn2Rgo5XBbPWOshXjz/VGU2lLHhINEF1e8Pz+IM3fv2Fkuz6UzbOZ2Sb/k2msMBHxeTdVb4
	nyClUDUnd88dcl145Fdjq1tHY3v7Q8ugReU5+hyaeegPLLdr/RqqXrPOvSSse/1aMRbhbDQlxqg
	ca5su/6I93nkv/oLBeb7tFbGKi92RlqcgjpwUI9Cb/e2Rzw+j/kN2Vy1u4eRHElJSiHe6JV4pv8
	WDBrZcpGXByKmH1f5s/8B6eRxLZCXDCuPt9vqIG4XTZy8lgGYsEoLC8HiZOjlnOWAJkrMk0J54k
	/9zJfWXk6poSJMAVeqowgbUk53uNUFhQMQbhQQ4qiwvXdmW3+Jca25PZn+Kxg7dMLjvb3CoLp3U
	bfyh7HIh2XOE=
X-Received: by 2002:a53:c08f:0:b0:679:b98d:9b65 with SMTP id 956f58d0204a3-67ba4ff16damr696189d50.35.1793332553574;
        Thu, 29 Oct 2026 20:55:53 -0700 (PDT)
Received: from KastenNixOS7700x.lan (h191.160.142.40.dynamic.ip.windstream.net. [40.142.160.191])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67ba73addf8sm309599d50.3.2026.10.29.20.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 20:55:53 -0700 (PDT)
From: Josh Kasten <jkasten@gmail.com>
To: calvin@wbinvd.org
Cc: Jerry.Zuo@amd.com,
	airlied@gmail.com,
	alex.hung@amd.com,
	alexander.deucher@amd.com,
	amd-gfx@lists.freedesktop.org,
	aurabindo.pillai@amd.com,
	christian.koenig@amd.com,
	dri-devel@lists.freedesktop.org,
	george.zhang@amd.com,
	harry.wentland@amd.com,
	linux-kernel@vger.kernel.org,
	mikhail.v.gavrilov@gmail.com,
	simona@ffwll.ch,
	siqueira@igalia.com,
	sunpeng.li@amd.com,
	Josh Kasten <jkasten@gmail.com>
Subject: Re: [PATCH] Revert "drm/amd/display: Allocate DCN32/1 dmub memory to GTT"
Date: Thu, 29 Oct 2026 23:54:18 -0400
Message-ID: <20261030035423.37193-1-jkasten@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <25995707c39c0c191e3ac46c4813f55a7f928403.1793131583.git.calvin@wbinvd.org>
References: <25995707c39c0c191e3ac46c4813f55a7f928403.1793131583.git.calvin@wbinvd.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I am able to reproduce this issue on kernel 7.3 on the AMD RX 7900 XT GPU.
* XT is not a typo, however both XT & XTX variants are Navi 31 anyway.
Never seen this issue on 7.2.8, 7.2.11, or 6.18.54.

### Conditions to reproduce banding issue
#### 1. When sub-viewport (AKA SubVP) is enabled
Check if it is enabled with the following command:
`sudo sh -c 'head -v /sys/kernel/debug/dri/0000:*/amdgpu_dm_capabilities'`

I think the amdgpu driver is in control when SubVP is enabled. In my testing
with a single active display this gets enabled when at 4K and it's frequency
is 100hz to 120 hz, inclusive.
Mikhail Gavrilov gave me this description for additional conditions if SubVP
get enabled:
> On DCN 3.2, SubVP itself is limited to:

> * refresh below 120 Hz; or 120–175 Hz for 3840x2160, 3440x1440, 2560x1440
> and 1920x1080 without scaling, and then, on a single display, only with
> FreeSync off;
> * pixel rate up to 1800 MHz;
> * no overlay planes and no rotation.

#### 2. Memory clock changes
Make sure the video memory clocks are not locked as the banding only happens
when the GPU changes it's memory frequency when the frame is being outputted.

This happens more often if the GPU is mostly idle and you move a window or
resize it in a desktop environment like KDE. I see it as often as a few times
a second, but sometimes it takes up to 10 seconds of doing this.

#### 3. 10x more often if amdgpu overdrive is enabled
While I know AMD overdrive needs to be disabled before reporting a bug enabling
it will allow you to reproduce the bug more often and faster. When 
`amdgpu.ppfeaturemask=0xfffd7fff` is set I see this bug about 10x more often.

### Confirmed revert of a637a140 fully fixes this
I confirm on next-20261023 by reverting a637a140 I am no longer seeing this
issue.

The revert didn't go clean on kernel next-20261023, as there was some changes
on top, so attached is the patch I generated for the revert of commit a637a140.

### Summary

I don't understand the optimization done in commit a637a140, or if there is
another related commit that should also be reverted. However what I can say
is I haven't notice any side effects after running with this revert for a few
days so far. It might be worth considering reverting commit a637a140 in a 7.3.x
patch release until a new fix can be tested in next.

Hoping this gets resolved in a future kernel release soon, the banding gets
to me sometimes and won't want this happing on other AMD GPUs. :(
Let me know if I can help at all with any additional testing or information!

Signed-off-by: Josh Kasten <jkasten@gmail.com>
---
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_dmub.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_dmub.c
@@ -538,7 +538,6 @@ int dm_dmub_sw_init(struct amdgpu_device *adev)
 		DMUB_WINDOW_MEMORY_TYPE_FB,		/* DMUB_WINDOW_CURSOR_OFFLOAD */
 	};
 	int r;
-	int mem_domain = AMDGPU_GEM_DOMAIN_GTT;
 
 	switch (amdgpu_ip_version(adev, DCE_HWIP, 0)) {
 	case IP_VERSION(2, 1, 0):
@@ -675,19 +674,13 @@ int dm_dmub_sw_init(struct amdgpu_device *adev)
 		return -EINVAL;
 	}
 
-	/* Limit to allocate dmub to GTT on DCN32/1
-	 * TODO: Other asics with GDDR7 may have worse latency
-	 */
-	if (dmub_asic != DMUB_ASIC_DCN32 &&
-	    dmub_asic != DMUB_ASIC_DCN321)
-		mem_domain |= AMDGPU_GEM_DOMAIN_VRAM;
-
 	/*
 	 * Allocate a framebuffer based on the total size of all the regions.
 	 * TODO: Move this into GART.
 	 */
 	r = dmub_bo_create_kernel(adev, region_info.fb_size, PAGE_SIZE,
-				  mem_domain,
+				  AMDGPU_GEM_DOMAIN_VRAM |
+				  AMDGPU_GEM_DOMAIN_GTT,
 				  &adev->dm.dmub_bo,
 				  &adev->dm.dmub_bo_gpu_addr,
 				  &adev->dm.dmub_bo_cpu_addr);
---
