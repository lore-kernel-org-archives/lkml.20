Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793575561;
	b=2guYqropLu7VTLZ+Ufm7GGGdNPRYIFFYpWnTzvB0vtdFgewkvgF7QDhHKgfpDSmtvk+L
	 mqR/N6p/95V28IeNtiYk9MlRh6uFnD/SVHDZiB1suyW5Nt6U1YxAf3m3aTcuhvNf+o8CT
	 m0QXliORzXO06sWVnfvQZ2Ci++I5zU1S5qQZD4yV0UrDxWO1rCstQi6EfYmYEPbQkGSi9
	 zLkUloDtIlDakPuEjc3B8Iq/5NN2AWI+j1jUAtL2+d0qwlff1AXnyClEmbJpYbgyV19wc
	 D847GUj0Xzui0BjlJnDp/UIRxbGvjpEIIPLuiW0WzFQqEp94XsCiJlevVS81iCz8dAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Content-Language:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=2fmwcgE6DPFC2W7yOeJbjLdJRykazNfLohJWxFt/Qfw=;
	b=PJPXLf8J7hGLGAH2B381E4hsYbILprGdvcDxZ3+HUfjE4qmay9vw8Vs6DyHpg9TPN7Ai
	 hkcYa2ZoPr1x+A9lUL6zLb1HeFfeLqm2mbX8tq6i4ADSjoEDHLA0P2c26avJbH7RqFTmj
	 KqDViknczVvdDKEo8bCjZTjRKezYbtTo/wRoxra1L0eG/VJjNSuHpATcfiZkK4bFHPKJz
	 Vyu4ZGSif/m60PAZ1ZyWlE2iT+aAoSJ5jIBN8PclcsYCYqt7U6m4DODuC9i9qlKpxebkg
	 3fsR+DG/w3IWyVRDmZgZSYQ93le12u67zzKh8JCt581HMO+pzB+XsyMHDGOoIGGKGgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zCabuO4s;
	arc=none smtp.remote-ip=74.125.225.74
Received: from mail-wr2-f10.google.com (mail-wr2-f10.google.com [74.125.225.74])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D760606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 23:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D760606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zCabuO4s
Received: by mail-wr2-f10.google.com with SMTP id ffacd0b85a97d-48dea979eb9so1238212f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 15:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793575555; x=1794180355; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2fmwcgE6DPFC2W7yOeJbjLdJRykazNfLohJWxFt/Qfw=;
        b=zCabuO4sVEMVmSLojPQMtinCZMirmlr7wqbtDUmPWa8PT5lr15+brSFW2PtqFeSDTH
         jrFLJBX7vDzOCHUYljI59qW9haGMpMlc4VGwZasoufJxSkKwdDW6kadPl9oPI7Lj9Wdv
         hIqvNaYNqJjvyaoEWYm9lwGHxA1blGcsh+Ha4LoMDGqBVZHH7eoabla3+V+k5fY/dtN+
         ye490jtU1GpUYXaAWLxrQDw3/0oyhTPpviMycKNIJWQ3HArHFhROxD40SgrvQEyO48OC
         Akz6bjt1acv/3Ye+xIKTYyq+zfvabVAxQgdcmi7Gi6ZI7yWfyREcj9i2fee8zEcqHUgK
         fV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793575555; x=1794180355;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2fmwcgE6DPFC2W7yOeJbjLdJRykazNfLohJWxFt/Qfw=;
        b=NvsYL8cjKG02J5GFLm1TEOly4wKaCl9/hre10EOg7dQ7oEMQfbp7DCFE70jwDNtO4b
         u7o0wmzfbW6znzDnhVhIL6T6E7J5rk39ZI73iTQkCFYiTlMMIJOQ4zNiOrtiuRx0odrU
         Fx6V1KAA3A/QMZIrIa6RgBnmqm2IRkG3SmrIwgeUSVJkXA33SiU/3FVPDz+rzdVC+PZm
         34MrihLr5CLlpHIk+ZDhpu94iplsKPFEYRyvCO6d2zu1vK/cSyRfulGJkr5E7OGumyF3
         oLY31RxbXLezHluimkoiHP5ain66nVGpsT1tXuKvkDi7tACZ5lcDntDBIgvKdaWvmkyx
         6WIQ==
X-Forwarded-Encrypted: i=1; AKwUvByFvuIS9wv77Cv2hxlconBnE8VCQlj12qlxcyYJgB64qQJWH02yGa1ufLoKSwqVz2lk97BG8NeWvsu0quY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOzPiwmV7jaGVEVup7iufJmrn43j5q20FGfQCtUgUivQNwZzUA
	1PqHeaNIV7LumINTxDd7euvI2Efgh1FQlEuB08EEr2wR6Vqyi8EFF/2M
X-Gm-Gg: AYBFou1TJaIVTNSAsVjlRbvT9UAc9A99LniQWgrHzdDLcQOlJfv+FJk0fc98tBcVge0
	sGbHfnu49k4JJfTgFwQz9PU0MAxIDQhUxwyQW8t0m9gJjVSEseHmj8f5AeyMQaygAjn0Nzfvl2N
	GjCZMIk5YuloIbUNA/0R971orjX11Zafu7APkl5LKMNJCER28lZDkVhfoxVW6kf0C3NLvQKEOvu
	Xyp9eqseyggflkoDrQtpGYpBKsXCV97RomyJevyKn4V2TJ0NehwgCoLp7XhAmxzzwsWJ4dN0sVf
	O8IgZk6Py8lkfz56G9Mfjvi9MorUIIgb1IKDWRuON43anK97UDMA9nyj113rQ/McgKqcAy2mXMp
	EFbCovgGU40hsOq1Z+/AP4VeEpv2wjgJtWb/KCVa3/EuDJsfW+3ICupVV7SZjz8PwpDYj/nsLg4
	kQqaXOBYG6xJcdamcfzObX5JOCpX3ECNHe7PlgagLHyQKOOfmBKav6ue6PmJTRbCzgyotdk+Why
	vx/S+zaRfp2y0pmFMbjw9/XaUhFDUeOAL2TDc54xpeiYSPg6JrjunVg4mxO2uCNFYLtmVqaJsBE
	X+1F9snTkfxB6gO6NRpKgOj210QjywMwkCNzSDyCox9C7VwwPynDtt0i
X-Received: by 2002:a05:600c:190f:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4ac1275c26emr179844595e9.0.1793575555586;
        Sun, 01 Nov 2026 15:25:55 -0800 (PST)
Received: from [192.168.1.7] ([31.94.68.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9b54dsm16274246f8f.47.2026.11.01.15.25.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 15:25:54 -0800 (PST)
Message-ID: <8eb61179-c5b8-41df-a466-8b5c388b6b41@gmail.com>
Date: Sun, 1 Nov 2026 23:25:52 +0000
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
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Richard Lane <richardlanedev@gmail.com>
From: Richard Lane <richardlanedev@gmail.com>
Subject: [PATCH v2 3/3] drm/amd/display: report synced displays to PowerPlay
 for MCLK switch
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

When driving multiple displays or tiled panels with identical timings
(such as the two 2560x2880 tiles of an Apple 5K iMac panel), Display
Core's program_timing_sync() aligns the CRTCs into a timing sync group
in hardware during dc_commit_streams().

However, on DCE < 12, Display Core leaves
pp_display_cfg.all_displays_in_sync unset. Because PowerPlay is not
informed that the streams have synchronized vertical blanking intervals,
SMU7 prevents MCLK switching at idle or causes modeset underflows.

If all active streams belong to the same timing sync group
(timing_sync_info.group_size == params.stream_count), report
all_displays_in_sync = true to PowerPlay after committing the streams so
SMU7 can safely downclock MCLK at idle.

Signed-off-by: Richard Lane <richardlanedev@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 74cd88d8d580..b4531383437e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4777,6 +4777,16 @@ static void amdgpu_dm_commit_streams(struct drm_atomic_commit *state,
 	dc_exit_ips_for_hw_access(dm->dc);
 	WARN_ON(!dc_commit_streams(dm->dc, &params));
 
+	if (params.stream_count > 1 &&
+	    dm->dc->current_state->stream_status[0].timing_sync_info.group_size ==
+	    params.stream_count) {
+		struct dm_pp_display_configuration *pp_cfg =
+			&dm->dc->current_state->pp_display_cfg;
+
+		pp_cfg->all_displays_in_sync = true;
+		dm_pp_apply_display_requirements(dm->dc->ctx, pp_cfg);
+	}
+
 	bool frl_stream_found = false;
 
 	for (i = 0; i < params.stream_count; i++) {
-- 
2.55.0
