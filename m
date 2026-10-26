Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793054952;
	b=TmqC7akPnM94WJsmNA5a+nKEF6G+yaJ5MHRDj729crFPWM7bNQFd8hslnxcCKVXd3JjF
	 9wTKhZZwxQuFUdabqMSSxV2g+/IxrRsAS4+OxNUEywvRLqBPtvZny71fNeW4+U5BcN78N
	 x1NtffWhkq67Ysiwjz5q0IRHQtHMnW9oPNzyIdMuhpnV0F8oo25fIUgtezY7hbRbiyZ3D
	 TJixFDhrZduw4GwdbPJ1zxo/LDcOwUCzurn/llTMkzEUFYMr5b5UP6Iqjsr80bJ2rzEK8
	 r1It7XgpBoJmyi8vHcIfRDr56M1G3dvr/F+bGmoBxN9fkQ2hkNMfXRgnf08dRMgWz7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793054952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Content-Language:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=kKstMhy7XYdWlOxfLVVB+n9yotypUq8kAPAlGnHm/EA=;
	b=Zeq/x6DnHPLRTUxnrxVeh4ZkfCk1yjRhGwFxJ4w2M21N8Hewy03LMywhtuwq6yVyXtsN
	 VPL/2Dl2ZB8cRkhUyjkmjaqskrcAA6Z8x2uLb4XL2jMDnnsr8k54X9RhyCtG15/oL+R8O
	 C7uJI1c3afojFAxKkeU5EuN9Vhf2A9KLPFOnxJMRW0zdgDV0pIK4gPRoF0qrTJGo8pXXu
	 CmOQ+x316ThuE01uQy5TEr4v6glm6sv96yaaqGFskLj2T2J9RWT7NdXjPhjQhw8JH5OaI
	 3Oyr8IuqIz6OL9VYLy3ViirwAbHTZiRmttTAznrFlZrlc/u+gg62PP/oyPOu6CekGXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JUl54lfZ;
	arc=none smtp.remote-ip=74.125.225.138
Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA7F606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFA7F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JUl54lfZ
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-4a16dfb8fa6so17660565e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793054950; x=1793659750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kKstMhy7XYdWlOxfLVVB+n9yotypUq8kAPAlGnHm/EA=;
        b=JUl54lfZ03do/o1WzYrXyfyxFPeY12CZBdH1hUhFEEhVPMVzDT6uQ7Iggpx8MCgYuC
         uEhF5Vk4QcNuHWXw4c1EgrUkFNTwx86LwsDp0VkNXYIyfCQjwcY4iNyIF2N4ciW6iCLQ
         b1kX2s/MRvU9PO+GiGw7yKipZrdQyxOltpo+N7MRSlaJxvAowcCS/ko5e9HxIbKfCpMr
         n9HFcCQoOcwmsX/WZX/ETMbAoe/J8rFcAxOa/xUteWjQhXr/S3baKh32TjDv+4/lTc1B
         ztjXun+5S7SuFGDwE+uvPSJC+ykF10v5+RqFVpohp7NlzAkRkAo/eE2Q3FcYjA64ie7x
         zVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793054950; x=1793659750;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kKstMhy7XYdWlOxfLVVB+n9yotypUq8kAPAlGnHm/EA=;
        b=MRK1LC6sDjwSCTMnB+nXtINGc3LZVTG1NTfOXgEyUeBiwg1qSNYZDydh47amc/UE8W
         URZ/WmUz6DOEC82k07DtrObqTDlnhGSSMzBesSVGa2V0d4YeQrwrlfvJCk/wooJuIDU8
         qGdWhmzBmsCpOKn6L06fN6GZS/gcM/Nd7TLvn3LREzLCLWiMXhHY9Spf1syWnUS4usMM
         IIl76fI8gtpBkKtX1xz3P1Job2yGnNthiykM70kc7UVK3jTFDdRJ9hSAxRDBZMY6rRRE
         5gjDWdAOrtv0aPElmtf/SUkAFnME4ZZiFHLWqRVUs2c7WX2WwyVfdrS5togTbTvoQDKY
         nnwA==
X-Forwarded-Encrypted: i=1; AKwUvBykk2YKvEJIE5sbdWxZ/iRga/lAaSwVBs8xj+Gp5bo4eHq7s1p0YfasNN7jFlGHembJdVjnNyBApnoTRNU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJT0xYbhhygr2JuKgfpepftoiEKdINGULRENcEaHhN5szQTLeEw
	8Q5RYsprTz8g7+PUQ52aCGtEjPH/7Q1rAoN20KHeOS+sbMZDTP6Ab68K
X-Gm-Gg: AYBFou1ZNkfAmwIseO05kMe1fS9oXYt2CJ1HgChbaxOtVvRZGM3qiUpwzhXaZRRTYIn
	Ui14duBQPA0NnSM45FPUuFcynK8R4GJFLfDIfiIpADLCYvbGBsHVDkhONOcUTfp8VGkuX/p+oYH
	qxbppxoip4ttTyEmnmbkRp7P0JJzMfQMMzLS7ZU6q6UDBVtjYI3uZjaYvWUp30YVTU3fQ0o1scq
	ZzbVAA71o6fDP7KKHFRthb2vKuC+U53KUGeEkV1YEQIWSKjMEXBbd0i9BUMf7f3cdvm1rQ/NYGd
	K+jpPP/UhgKaoQmkXlWyd7ldMYQYCKZ6wfwm5cXfRUDdPV+csogiBvZSZ1JBaG9gRLkjrEvaSBO
	C4uOTYJ4eLRkqjUGbwYdKUr+fKez5nFRhHs9s/iq7h//xyp9OQweuiVItUMSWPCJxqVASY4Qieh
	cl3u15mddiOxq6wiM+ZZZB9eBYWJeqsK9vC8hrCbLbNuNniUqJUrwua7emYi6xEnYBFLNa2cfE8
	RRcS2l4kCaoSs1Lg8/XPWkWJSCGeWeLJ7fNOixH7ngyG0oe
X-Received: by 2002:a05:600c:8114:b0:4a1:dec1:4e1 with SMTP id 5b1f17b1804b1-4a35aca4ab5mr129489045e9.22.1793054950146;
        Mon, 26 Oct 2026 15:49:10 -0700 (PDT)
Received: from [192.168.1.12] ([31.94.68.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm587066755e9.1.2026.10.26.15.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 15:49:09 -0700 (PDT)
Message-ID: <3ff4ef96-9c59-4e8d-a0da-92a1ac6f5ba1@gmail.com>
Date: Mon, 26 Oct 2026 22:49:08 +0000
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
Subject: [PATCH 3/3] drm/amd/display: report synced Apple 5K tiles to
 PowerPlay for MCLK switch
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

When driving both 2560x2880 tiles of an Apple 5K iMac panel, Display
Core's program_timing_sync() already aligns both CRTCs in hardware
during dc_commit_streams() because the two streams share identical
timings.

However, on DCE < 12 (iMac15,1 through Polaris-based iMac19,1), Display
Core leaves pp_display_cfg.all_displays_in_sync unset. Because PowerPlay
is not informed that the two streams have synchronized vertical blanking
intervals, SMU7 prevents MCLK switching at idle or causes modeset
underflows.

Report all_displays_in_sync = true to PowerPlay after committing both
tiled streams so SMU7 knows the tiles blank simultaneously and can
safely downclock MCLK at idle.

Signed-off-by: Richard Lane <richardlanedev@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 548f975c7324..384a81371f80 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4788,6 +4788,19 @@ static void amdgpu_dm_commit_streams(struct drm_atomic_commit *state,
 	mutex_lock(&dm->dc_lock);
 	dc_exit_ips_for_hw_access(dm->dc);
 	WARN_ON(!dc_commit_streams(dm->dc, &params));
+	/*
+	 * DCE < 12 leaves all_displays_in_sync unset; report synchronized
+	 * Apple 5K tiles to PowerPlay after commit so SMU7 can downclock MCLK
+	 * at idle without modeset underflows.
+	 */
+	if (params.stream_count == 2 &&
+	    params.streams[0]->link->tiled_peer == params.streams[1]->link) {
+		struct dm_pp_display_configuration *pp_cfg =
+			&dm->dc->current_state->pp_display_cfg;
+
+		pp_cfg->all_displays_in_sync = true;
+		dm_pp_apply_display_requirements(dm->dc->ctx, pp_cfg);
+	}
 
 	bool frl_stream_found = false;
 
-- 
2.55.0
