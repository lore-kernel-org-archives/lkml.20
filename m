Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793374023;
	b=Er2i9ueeOf6aNDSlSWh73+dp8yVKKU7hPNMQJXBily6Ov68VsO31Y2mN14T3se0ietwz
	 dDYUA03cQYuZ5iZuLcx15uxatsI2J2HJTHiRsKO/PFhU84i2XVGwLyMcIQlz4PtJZwlaX
	 L0EtBybTFa1KeaqQpTJEDc7NbJ5M9+vC6ahFdOSbWR+ezkKPca9dIUmCLbRwpO2XBSXpo
	 9HUJ57S5r3Pf+mwsKaAJbdytqL6czFeS+Aalf+KWMbMERtxROxmNWtE+Pu7LujNKoWfe7
	 UUOHLiyEsfSo5U15K3LospIT08uP11E6tv68VETlzFu45flLvjKTPdgF2g1IhagMpGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793374023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=rUR59C26+fvlbiQB0TxzW5qGZeRM/5x6JJF3AdPnsXA=;
	b=jFjzQO7e1XrRQwMeA/EmxdIXqANNunFZOkggTBAq6rHoVz6YjsdslrZnvJfb8pr/aisc
	 W5Vmbyr3yPRnXXH8R9vlWJBK0iy5l9MVWgk7GWUlYJ5ggn83RvgowvbeY4D0JALFnJwUc
	 Hm69yB4/kWn1SsvwQ3+7cEJ2/HjpNEwIPAznxu3Uc7sRNsLfQjGSgbwTPOOKQ6ohi4y/+
	 Ldg+P1FVnKHW23561zZiNnALZbtImDAC3mgJFJlJaQwBdh9n1PcfhVdAlEpwR1GviPlTY
	 brEIJPeHWmy6r/LSopW1ZI5TXOMS/l2+OYPNzaH2xD32qeAjzeMdtOYgMJhb62P2Yvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wbinvd.org;
	spf=pass smtp.mailfrom=wbinvd.org;
	dkim=pass header.d=wbinvd.org header.i=@wbinvd.org header.a=rsa-sha256 header.s=wbinvd header.b=Y0283yud;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08819606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08819606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wbinvd.org header.i=@wbinvd.org header.a=rsa-sha256 header.s=wbinvd header.b=Y0283yud
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e5378b281aso4836225ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1793374022; x=1793978822; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rUR59C26+fvlbiQB0TxzW5qGZeRM/5x6JJF3AdPnsXA=;
        b=Y0283yudLOizowYWuawcW6ld5Hcrb1Ut+1y1GRk72G9K286nAlt2ZeT03U27PfolkN
         bbbUkNArZjzzw38yq0i6b56zuH6goGmSoi6fJeMcWb/F8ETWvuGNCtc9zlVL6cBBetUH
         yJD7cud2ZHVv+9pvwLry7VIWY5b7k91SH8cSlwWEA8G2vd9jhFy4DvCGBfeAaM4YZZgs
         wwaC02GGNvaAOmw7eX6J9J/gYEjGDJmWaL9HLP15cDGi8K6e+SaJ5SbQ7lye1jFtkA5j
         VyMXLAmvoaYwqBM7Qzyi61D94iSMRPJ9KpHhXu/tY4Kh2HfaDGPsn/w0RZjrNfbrzUIg
         Xwhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793374022; x=1793978822;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rUR59C26+fvlbiQB0TxzW5qGZeRM/5x6JJF3AdPnsXA=;
        b=Oyr8eS00uelIM+LI8+HsucA5Yajjl3mdYOe+Y8PwdfWxAWRhRIoJsBdIoUyiHZb2wn
         i9lMed3TJdlQw4T/tAEifr/dDPdXMPUFosnMdCw0MpQa1xEF7Ma658fra6U9wEtMNGLt
         w+NAMvVuBSUUQAzeiN9vGVc3k4VmF9JMIZ6rAGDpk51J1NzbwDor8NVqtr4mJZQdpozN
         bU2MmQGlqFYsHelQEf5GyubhCD7A0TvIq+3oIUdqX7TnYAO9YimC+gcFKI/SgRziYjfe
         jU2FAH/mGIYdYX4+lJ9I1hvFIydSQMmB4ucZez62kUFW0HhdyySnjvMmnBTYmR3+aDQd
         R+gA==
X-Gm-Message-State: AFq9FYKkQAWcleyvGq7phGZiYYmxmWCuhpL46Fj2/lFdW01EBiR5OR1+
	qO4UThD7W7RmEEFJTU3uAA3c/V5LWv4x5RqUe7QbLbFq/2pZO5G7qYw2SZRHQdGXxvakllBc1Q7
	A7in4sOE=
X-Gm-Gg: AYBFou2NltjWuZamdphdo16f2R49zxJEKVHNZxX5iFDE2AK075AHV8oUiVpPVyWHBH5
	2SODaX5qVbtkxIE36mkRXD8X0Z6BrZr2esJlTQ7IDzeUXFEkVfGCybic2VwwcpgJNzm8M3R841s
	C9SLOU4H909K9P+SxVeARukLlHB7Kl/aoTQ9aYrmQnK9NXbMQVg5A48ej+9Cc9Nte4V6YUHl1Tg
	08h2NySLeoIgGpb6+r1bnuA4FnuMftFh/04hQRWLAj+PQlb3Qy3Azfl3mfdEBhbWK4sq4FLzwW9
	jgWGHlxDE4zOKUsCRe3/Tj128XA0GHnc7dGI3a11DpuAgomTeLXNBsnxvW1TLLZuxriQ0zR/YUt
	+YAXJRoiXdb5p29MesSmc19HWJH2OOmwqPjQRuY04K20cyCQWQs8JaSofPgoCNrvI3LcAX3Vioa
	aTSWUg1etbbmWLMT9HWTYKSYxH7OG3MXQosHdCdhUkDtvRGdoCWzHuqktQtJdWxNXu1epKLsi6A
	sR3LaQkYSEOZzs537XTXIJ54lGUjQns7XV08gPu3UiwNDW2bFPywXmtaW6c5nOy2Z8YImfHi0NO
	5AQ6Fj7m8ad8XT/hmWPojQq+OLlGWzd/
X-Received: by 2002:a17:903:948:b0:2e9:9522:ed3a with SMTP id d9443c01a7336-2eb364b8b8dmr28518335ad.22.1793374022240;
        Fri, 30 Oct 2026 08:27:02 -0700 (PDT)
Received: from mozart.vkv.me ([2001:5a8:468b:d015:25ca:cbda:d0bd:f452])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3927e856sm8905135ad.50.2026.10.30.08.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:27:01 -0700 (PDT)
Date: Fri, 30 Oct 2026 08:26:59 -0700
From: Calvin Owens <calvin@wbinvd.org>
To: linux-kernel@vger.kernel.org
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Alex Hung <alex.hung@amd.com>, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	Fangzhi Zuo <Jerry.Zuo@amd.com>,
	George Zhang <george.zhang@amd.com>,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: Re: [PATCH] Revert "drm/amd/display: Allocate DCN32/1 dmub memory to
 GTT"
Message-ID: <auS3QzinEAmV-mtk@mozart.vkv.me>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <25995707c39c0c191e3ac46c4813f55a7f928403.1793131583.git.calvin@wbinvd.org>

On Tuesday 10/27 at 13:35 -0700, Calvin Owens wrote:
> After commit a637a140ab860310 ("drm/amd/display: Allocate DCN32/1 dmub
> memory to GTT"), a machine with a Radeon RX 7900 shows random garbage on
> the screen. It reproduces sporadically, but at times it is so bad the
> machine is more or less unusable.
> 
> The garbage is always horizontal bars extending across the entire
> screen, always approximately 200 pixels tall on a 3840x2160 screen,
> for what looks like a single frame. The bars are mostly black, but will
> sometimes exhibit striping and periodic artifacts which smell like
> non-framebuffer data is being rendered to the screen.
> 
> It took some patience on the "good" side, but I was able to nail it down
> to commit a637a140ab860310818a14fb4d37e39e51a06be4 with this bisect:
> 
>   bad: [cee9395acd8043be0644b25c34bfa86623f2b935] Linux 7.3-rc1
>   good: [8d3ae59288f1e7d58d76558a6ee96d533bc5019f] Linux 7.2
>   good: [55ab7e14222e5f0b0fd9f7711ca391d2924b35e3] Merge tag 'for-7.3/block-20260819' of git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux
>   bad: [df51bdc5e80dae43cab81f6cc641e98638303c88] Merge tag 'mtd/for-7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux
>   bad: [29daacacf4cd84e6917f09de6a99fb170071c14c] Merge tag 'drm-rust-next-2026-08-08' of https://gitlab.freedesktop.org/drm/rust/kernel into drm-next
>   good: [fff648aec5e2790d117a0ec5c849a284d9d33d70] drm/amdgpu: include amdgpu_video_codecs.h only where needed
>   bad: [336e0cd576817ac64a4b394ca2b3680029f3e37f] Revert "drm/amdgpu: fix aperture mapping leak"
>   bad: [789f7486a384ca58b9d7a76abba5efa0e80e8dab] drm/amd/display: Test plane colorop helper walkers
>   good: [e0e426f10ad653c5e9dd33fb4a76d55f06101992] drm/amd/display: Test helper_check_state rejects
>   bad: [982b2a43682b55e7d9800000f2592832ff2865ba] drm/amdgpu: Fix IP block NULL check during soft reset
>   bad: [9102b39fa924dcc3dc75a3137bfa9633c40b88c0] drm/amdgpu/userq: fix indefinite fence wait during GPU reset
>   bad: [b23470a026afe64de5c1df4ad181587b49c22923] drm/amd/display: Exit LS for ISHARP before coefficient write
>   bad: [f02b2e47355e9d381a7f34acc997e1c47879ca21] drm/amd/display: Add KUnit test for wb jobs
>   bad: [c6a13d145cc811b19c8a0620f25868cf7d5700c0] drm/amd/display: remove unused dcn42 socbb values
>   good: [1d8327353de6f1f34063840f362c208c84064f54] drm/amd/display: Fix VABC Init and OLED Support
>   bad: [a637a140ab860310818a14fb4d37e39e51a06be4] drm/amd/display: Allocate DCN32/1 dmub memory to GTT
>   first 'bad' commit: [a637a140ab860310818a14fb4d37e39e51a06be4] drm/amd/display: Allocate DCN32/1 dmub memory to GTT
> 
> Sure enough, reverting a637a140ab860310818a14fb4d37e39e51a06be4 on top
> of v7.3 completely and totally eliminates the problem for me.
> 
> Mikhail has separately reported this regression:
> 
>   https://lore.kernel.org/all/20260829010525.29935-1-mikhail.v.gavrilov@gmail.com/
> 
> ...but it seems to be much more consistent for me than for Mikhail, it's
> never taken more than 30 minutes even when the machine is completely
> idle. I've also never been able to reproduce any artifact one single
> time without commit a637a140, despite a lot of effort.
> 
> I'm not sure reverting this is the right way forward, since presumably
> this would re-regress the timing issue Fangzhi alluded to in the
> original commit. But nobody has proposed anything concrete yet... so
> let's start the discussion here.
> 
> I'm happy to help test other better ideas as well :)

Friendly ping.

> Signed-off-by: Calvin Owens <calvin@wbinvd.org>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_dmub.c    | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_dmub.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_dmub.c
> index 9ff25bc8ee5ae..870534b7cf46d 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_dmub.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_dmub.c
> @@ -511,7 +511,6 @@ int dm_dmub_sw_init(struct amdgpu_device *adev)
>  		DMUB_WINDOW_MEMORY_TYPE_FB,		/* DMUB_WINDOW_CURSOR_OFFLOAD */
>  	};
>  	int r;
> -	int mem_domain = AMDGPU_GEM_DOMAIN_GTT;
>  
>  	switch (amdgpu_ip_version(adev, DCE_HWIP, 0)) {
>  	case IP_VERSION(2, 1, 0):
> @@ -648,19 +647,13 @@ int dm_dmub_sw_init(struct amdgpu_device *adev)
>  		return -EINVAL;
>  	}
>  
> -	/* Limit to allocate dmub to GTT on DCN32/1
> -	 * TODO: Other asics with GDDR7 may have worse latency
> -	 */
> -	if (dmub_asic != DMUB_ASIC_DCN32 &&
> -	    dmub_asic != DMUB_ASIC_DCN321)
> -		mem_domain |= AMDGPU_GEM_DOMAIN_VRAM;
> -
>  	/*
>  	 * Allocate a framebuffer based on the total size of all the regions.
>  	 * TODO: Move this into GART.
>  	 */
>  	r = amdgpu_bo_create_kernel(adev, region_info.fb_size, PAGE_SIZE,
> -				    mem_domain,
> +				    AMDGPU_GEM_DOMAIN_VRAM |
> +				    AMDGPU_GEM_DOMAIN_GTT,
>  				    &adev->dm.dmub_bo,
>  				    &adev->dm.dmub_bo_gpu_addr,
>  				    &adev->dm.dmub_bo_cpu_addr);
> -- 
> 2.47.3
> 
