Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793133380;
	b=GnSfICZB4Upplcrbey7itxMH1ZiY6G3WNNehPKnpC9UykLxmCu5oW19znmyAmD5hQQCy
	 2htGbIZMPcdbIOIeq5at0y4zheKk+6fFKmQVKBL95JmtHl0Ad0N6Jf31Ot4/+59drYxb3
	 TihguaN5NHufGd7xtT3ezKPRK7qIRcqFYPvTEQX5EO9GfFu6FL6Fmd8Jgja4qBQztxjXo
	 JXL2iW0V9isxrPT9FS7LDbQZzI7E1UpjdkaIYMDiIXLQTZwKV6lQhVFXGS7Xx9AjjoaVX
	 f/ymisKoHAFhbNo5ToHiF5KBCvTCaM37oJz+a28gHqj/d/F6f+Ejj76z0+kb+EFvGqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793133380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=n/kXFw9Qj82REiZi7BMptrUs1FkkIpA4DyKMU4QAqcI=;
	b=ZRmmHeC/wAz7YUBBE5Vp/3UCZTqbM1DUZqFLucW5OYkq+zdAU4epiO9LGj9Z0MPgZuSB
	 3Rbwpcgb9sWR0GiI+HvTfaxMEnz/qAdZ2Q0B3bKz6gfXkhN8dkT0NdnMReyvCQuOWPeqC
	 0tNCO79TVhpAc9pCLH3ywLqCtBjcnG+uR1boncO2gzpMfQ71Xj+fKlau80OMlAbOGjbEG
	 OMX1xgh/9ImHp7Lxm0zQcibMoY+DA4kNpi3Os2M8wqpCA5wzFM+Z0danckamctCzt+vI7
	 2zk73IZ3YH87mA0DVYdbd+jEZvKAX/WzAbeK4Wo7XG3I4M6jwI7o7NLM2fQMCn6Ngew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wbinvd.org;
	spf=pass smtp.mailfrom=wbinvd.org;
	dkim=pass header.d=wbinvd.org header.i=@wbinvd.org header.a=rsa-sha256 header.s=wbinvd header.b=BZ6rZaSQ;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF216606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:36:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF216606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wbinvd.org header.i=@wbinvd.org header.a=rsa-sha256 header.s=wbinvd header.b=BZ6rZaSQ
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35c76e9614aso438795eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1793133379; x=1793738179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n/kXFw9Qj82REiZi7BMptrUs1FkkIpA4DyKMU4QAqcI=;
        b=BZ6rZaSQl3E8pw/qItRtqepfc3coKZCVkM6tZKlzKClpZbarNwIcvrtwXKlY4Sdix+
         cU0hANXn8zRF4lYP3TZw1RVaJjpvu826tUuR/jGmaGp2ck32u98lHgqRq3ZooqOcb4JI
         HJ+7ebbqnE3CjKGZi/22y3zoVLVOQIDAJUgpOCKViD0d+uxx8M5BNrmyEvdjGrhhrjMO
         bLH4h7ubfAA8987iRjZvu6sdGomdC7xxE0XSbuImRTHIYDKqd42Doao8DBjS+kR+Hz12
         ZJ5ucPLukQZfR0IZbUostioDeeEXYXcs/Je3zAbn9UKqNtOFSG0C6pIEnrGnuSlJKLyB
         ki4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793133379; x=1793738179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n/kXFw9Qj82REiZi7BMptrUs1FkkIpA4DyKMU4QAqcI=;
        b=tnSJOaMQu1W1cohucm77BFmtSlZBHSeUtwAe5g1i9TgPI9U4y+hWpGKfztu/uf00wO
         AaWjTKg++Z8oR690g3IQYU+lpBFr2+fAsehhIgLwOg2nYA0Wi4sYs0YN5QXFEVCTlTD3
         aKxGzu9dqp6wjGJoVPTn5JIwKAA+D59ryxmNRgRf0s2nM8ujXUzfcnP6GJWfxb0hBt3Q
         1xxD1Z6blsDQxUCZKhoDWnX/uTrjPnnWalEDwdvLKBjV5oLX+etgCANpgUM1GMMLLkpr
         hSbK2WWDP3nOPFUTvmOerjDCMo6haXm4n4sHt6UeIXKlCHhMulqgQqgMhuIU9XcgxsYx
         kglQ==
X-Gm-Message-State: AFq9FYLMo1aI/DG8upMtP4r77sCzzZTJUEeR5FbOjsKT39TtQtBNXEPY
	LlhiCJU3kQhquWFb0t8eLK9345A//9UzbvBmTCXEQn5sB7gvJQPVq1lxNuDH+A0jA0PwcS+WQpP
	EaVCf24Y=
X-Gm-Gg: AYBFou23CBaVT7op8Lz7S3sbfRQakzdTlR7P/KSbm48UTUR8DxNwI0Ls62lF4Oay625
	yXyNikbYaBxuWG2UxbDXtIyOGQthAaS3Q8+F1I2TXHWsuUk9Q4O5fA4wWaj5i9UWhrj+D0tzXbC
	RHgnRerbffXdNvvUhi34cDizWI/McY9ck3sLZ0SeMaeWtZhKE0wq4T7hNucD6EpYwiX5tT3F6x/
	QAyU3/uIy+heMgaZbMr4IYfrLCRIsMAIVq8VZ6uSyGOgHLdqj+5o+jLsoyCAb3eYvjXDgTaE6VZ
	4MXhSknSrgZH8B5X9H6cAsjf7ipg6Id8ocbj64bDgIgeibNAojkLgecdyv+Gnnigx7KBwvtLNb0
	S8BFnsGSdW1mkShVEqHSjHHb3xspBqnUFPdtJ7P4jA4aY9d4HlwNrtRFDMCHCrbYxBKt68WPS4s
	veR7TzSB6pM9jaRBaXH5yC9AqW4/M+qnneJbN0PcRzaJ841WjhVImjjVatVTSTLI5m/Z8F7xSav
	0SmdEKoMkaXhFBd0EVEiCyAF5CIW6c88gVBFl+u+O/IhF1uQF7EaKGnc0A=
X-Received: by 2002:a05:693c:41d4:10b0:369:f64e:7feb with SMTP id 5a478bee46e88-36a202d5efcmr770087eec.2.1793133378769;
        Tue, 27 Oct 2026 13:36:18 -0700 (PDT)
Received: from mozart.vkv.me ([2001:5a8:468b:d015:a9d7:ed20:8d1b:4227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a14383b02sm9457218eec.14.2026.10.27.13.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 13:36:18 -0700 (PDT)
From: Calvin Owens <calvin@wbinvd.org>
To: linux-kernel@vger.kernel.org
Cc: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Alex Hung <alex.hung@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	Fangzhi Zuo <Jerry.Zuo@amd.com>,
	George Zhang <george.zhang@amd.com>,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [PATCH] Revert "drm/amd/display: Allocate DCN32/1 dmub memory to GTT"
Date: Tue, 27 Oct 2026 13:35:26 -0700
Message-ID: <25995707c39c0c191e3ac46c4813f55a7f928403.1793131583.git.calvin@wbinvd.org>
X-Mailer: git-send-email 2.47.3
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

After commit a637a140ab860310 ("drm/amd/display: Allocate DCN32/1 dmub
memory to GTT"), a machine with a Radeon RX 7900 shows random garbage on
the screen. It reproduces sporadically, but at times it is so bad the
machine is more or less unusable.

The garbage is always horizontal bars extending across the entire
screen, always approximately 200 pixels tall on a 3840x2160 screen,
for what looks like a single frame. The bars are mostly black, but will
sometimes exhibit striping and periodic artifacts which smell like
non-framebuffer data is being rendered to the screen.

It took some patience on the "good" side, but I was able to nail it down
to commit a637a140ab860310818a14fb4d37e39e51a06be4 with this bisect:

  bad: [cee9395acd8043be0644b25c34bfa86623f2b935] Linux 7.3-rc1
  good: [8d3ae59288f1e7d58d76558a6ee96d533bc5019f] Linux 7.2
  good: [55ab7e14222e5f0b0fd9f7711ca391d2924b35e3] Merge tag 'for-7.3/block-20260819' of git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux
  bad: [df51bdc5e80dae43cab81f6cc641e98638303c88] Merge tag 'mtd/for-7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux
  bad: [29daacacf4cd84e6917f09de6a99fb170071c14c] Merge tag 'drm-rust-next-2026-08-08' of https://gitlab.freedesktop.org/drm/rust/kernel into drm-next
  good: [fff648aec5e2790d117a0ec5c849a284d9d33d70] drm/amdgpu: include amdgpu_video_codecs.h only where needed
  bad: [336e0cd576817ac64a4b394ca2b3680029f3e37f] Revert "drm/amdgpu: fix aperture mapping leak"
  bad: [789f7486a384ca58b9d7a76abba5efa0e80e8dab] drm/amd/display: Test plane colorop helper walkers
  good: [e0e426f10ad653c5e9dd33fb4a76d55f06101992] drm/amd/display: Test helper_check_state rejects
  bad: [982b2a43682b55e7d9800000f2592832ff2865ba] drm/amdgpu: Fix IP block NULL check during soft reset
  bad: [9102b39fa924dcc3dc75a3137bfa9633c40b88c0] drm/amdgpu/userq: fix indefinite fence wait during GPU reset
  bad: [b23470a026afe64de5c1df4ad181587b49c22923] drm/amd/display: Exit LS for ISHARP before coefficient write
  bad: [f02b2e47355e9d381a7f34acc997e1c47879ca21] drm/amd/display: Add KUnit test for wb jobs
  bad: [c6a13d145cc811b19c8a0620f25868cf7d5700c0] drm/amd/display: remove unused dcn42 socbb values
  good: [1d8327353de6f1f34063840f362c208c84064f54] drm/amd/display: Fix VABC Init and OLED Support
  bad: [a637a140ab860310818a14fb4d37e39e51a06be4] drm/amd/display: Allocate DCN32/1 dmub memory to GTT
  first 'bad' commit: [a637a140ab860310818a14fb4d37e39e51a06be4] drm/amd/display: Allocate DCN32/1 dmub memory to GTT

Sure enough, reverting a637a140ab860310818a14fb4d37e39e51a06be4 on top
of v7.3 completely and totally eliminates the problem for me.

Mikhail has separately reported this regression:

  https://lore.kernel.org/all/20260829010525.29935-1-mikhail.v.gavrilov@gmail.com/

...but it seems to be much more consistent for me than for Mikhail, it's
never taken more than 30 minutes even when the machine is completely
idle. I've also never been able to reproduce any artifact one single
time without commit a637a140, despite a lot of effort.

I'm not sure reverting this is the right way forward, since presumably
this would re-regress the timing issue Fangzhi alluded to in the
original commit. But nobody has proposed anything concrete yet... so
let's start the discussion here.

I'm happy to help test other better ideas as well :)

Signed-off-by: Calvin Owens <calvin@wbinvd.org>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_dmub.c    | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_dmub.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_dmub.c
index 9ff25bc8ee5ae..870534b7cf46d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_dmub.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_dmub.c
@@ -511,7 +511,6 @@ int dm_dmub_sw_init(struct amdgpu_device *adev)
 		DMUB_WINDOW_MEMORY_TYPE_FB,		/* DMUB_WINDOW_CURSOR_OFFLOAD */
 	};
 	int r;
-	int mem_domain = AMDGPU_GEM_DOMAIN_GTT;
 
 	switch (amdgpu_ip_version(adev, DCE_HWIP, 0)) {
 	case IP_VERSION(2, 1, 0):
@@ -648,19 +647,13 @@ int dm_dmub_sw_init(struct amdgpu_device *adev)
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
 	r = amdgpu_bo_create_kernel(adev, region_info.fb_size, PAGE_SIZE,
-				    mem_domain,
+				    AMDGPU_GEM_DOMAIN_VRAM |
+				    AMDGPU_GEM_DOMAIN_GTT,
 				    &adev->dm.dmub_bo,
 				    &adev->dm.dmub_bo_gpu_addr,
 				    &adev->dm.dmub_bo_cpu_addr);
-- 
2.47.3

