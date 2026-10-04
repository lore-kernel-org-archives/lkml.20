Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCDD3B9DA5
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 10:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791109682; cv=none; b=FRJ4R8ZvhVJbxc8XWAoE41bM8LsNlHTclnCwtFU8U6MYq/anckiGwqgrEcMJFD5sM89hABKwHDJSVzOrLco//gaWlHn2TXJW9mpzm5l/ZgvqraBx55b5K2SiffeUhTwjbsJj2xJ5QbLSdf7FXvOWHGNB62iL5cWoml3s9CQw6dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791109682; c=relaxed/simple;
	bh=vWVgNkZiX8R3FefvvDRzUfTtoyujwvKaxxxwA4Shnvk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=opPooSKgPP5fdRLZjDsiy3vlUUcb6PywwsYkFb+opRZrl290bFFfQCQO7eExkUszxW900e35Eg4yE6QV1PV/0YmO9thE2Rl1KmWB7pXHYzZ4yYfTz9ih5oKxrFmgpQSJx/MC+einSZxQtTulQQRZBhcVOCBCGOdn+l2YjiPfiu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QlcV9qDp; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QlcV9qDp"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so517687a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 03:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791109680; x=1791714480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aOHR60kWFiiTF2Paz1Sgg2dVxODMmAsE+5qedw3hT08=;
        b=QlcV9qDp+8LdYEgGU9MU5RWK0ZX2EKHWj0lR782gRzKamMotWAC1Kpar5FxSDPELDQ
         us8uIb6ft6CdpEaN3r8XmeNRoLLK5VUp5o3s/wg6bfB6UWKitIr+YNFmfec2Gt4y+4qe
         ATf6D84e254bs0oEKhBbhskCJidv7G5N4wON1rEG1ubCiH8eP4fLLp4MNc7UuWaBA951
         FudWiDSb5lfYrqfgBlw0iEUW9Mp6f++7s4BlxeLUpsdgpi2G4SVOlk2XsQTjT65u8zRk
         UMM64jyl+vIjtXPKimIBWS5HHC2X6cmuB6QFP8COd7BNxZiF3aZg0y99VAeoxebl9EN8
         pyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791109680; x=1791714480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aOHR60kWFiiTF2Paz1Sgg2dVxODMmAsE+5qedw3hT08=;
        b=jZO0/hD0ino2a11GFOepwW+tGrqpvyRtJGivzVRuZ04+XuGfbKgsM22XaGtF+OFM+b
         6WCvn7PgjTcEJoLzzZP4cIMPOqlYzqTm4H5znCiv+mF6lZFDIm33o98arvztOwNdT/AC
         L6JsGFlot+ics+c3y2TxmBwQFS2Jap7tZZlYr7vFyrx+gYZUL6BYYbFyuAD6IYpa8C2Q
         SpIVzL3J9kpVVWs2S1tv9Yxj/0f90m4mc/ixAvf4qBN4HDxb5YSfqq2r/v4ppB1XLrZB
         rXg6AYDZsQ+v/a7WKVWDY8T7IT8wZlkdtyNpEvgbni0E5GbY5Zh4nGIiKbnYGeGJ0o1F
         Un3g==
X-Forwarded-Encrypted: i=1; AKwUvBy5/wT2dNzhp1UMSm9XdnxLkonAab7cmnV6H3l2B3l64JPKkzduogZ1DGiB2r1oSRJdSqKPe/zn3w51Vio=@vger.kernel.org
X-Gm-Message-State: AFq9FYKo499TuGViQnHkbx4Ia/MiAKXymMyzjilSQcysNVgUtR7d6U8I
	T4Vv+/MpCd2d5Hr37/VZDKQ68thA6aD4/cNO1R0tv2Sg32M8vGfQ406F
X-Gm-Gg: AYBFou13wxyoPF3nfvuBfxZLXaUMUfPJxRRBduYuxUxtsNvLinHjDWcbR893oJn2x7f
	vhW0pJWcuDGCUOVz5jNPDejfSRqB/RWxXJJ/31S7kzCurWSiJu0mYAfBUL0iV8hA4voUFgtpfSH
	zg7o53zHorEmvV39cPSjRLs+mVpawW8T3pt389UXGRun8HPR9ffLbsEbcVUdn0UMImCPFnVxChf
	4vOZ04fJsL+9keZfGtSlsdityTHsWXVh9IaC6pr9OkCgLe0Cd1REI22pRANEFLN852787vh8EkG
	xbM7ccapn70Sia8w4KUxE28fGCVt/yILUuHirWdRFmjF4q8a+FTZJsBTubNLrAziKCw54OuYt9Y
	Q39jsWuSFrJbxpnW1I9o+Ywwychxhi/uNbI2/8GKbHyeF8YzkYTGjmAQhZeiX2hLqYFBni78FPP
	fZwKyI8wcK6cqql2vTo2kmjsvv2jS7jvsChdvd8cdXjcp122epje1cKlKioDQwuGN9ujlGUEsYW
	3gBeZSYyruPCw==
X-Received: by 2002:a17:90b:4a4a:b0:3a6:f90b:20cd with SMTP id 98e67ed59e1d1-3a6f90b2630mr5714179a91.6.1791109680484;
        Sun, 04 Oct 2026 03:28:00 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4262cfsm6192927a91.6.2026.10.04.03.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 03:27:59 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jun Nie <jun.nie@linaro.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Alexander Koskovich <akoskovich@pm.me>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dpu: round up the compressed INTF width
Date: Sun,  4 Oct 2026 19:27:58 +0900
Message-ID: <20261004102758.84436-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For DSI with DSC, drm_mode_to_intf_timing_params() scales the INTF
active width by bpp / (3 * bits_per_component) and rounds down. The DSI
host computes the same width with DIV_ROUND_UP, both for the pixel clock
(dsi_adjust_pclk_for_compression()) and for the active width it programs
(dsi_timing_setup(), from bytes per line). When the division is not
exact the INTF line is one pclk shorter than the DSI line, and the DSI
FIFO overflows.

Example: a bonded DSI video-mode panel, 952 pixels per link, DSC 8 bpp at
10 bpc: 952 * 8 / 30 = 253.87, so the INTF uses 253 and the DSI 254.

Round up, as the DSI host does. Qualcomm's downstream SDE driver also
rounds this width up, and Pengyu Luo needed the same rounding on the
Legion Y700 gen 4 [1].

Tested on a Lenovo Legion Tab Y700 gen 5 (SM8850) with that panel, with a
module parameter selecting the rounding: rounding down, DPMS off/on gives
no vblank and 14000-17000 DSI FIFO error interrupts per second
(dsi_err_worker: status=4); rounding up, the picture comes back and there
are no errors. Only tested on this device.

Link: https://lore.kernel.org/all/CAH2e8h6oinKxN1ndcvHCSc+=bFLXVVDZVAVF0cQHoiaMvEwhPQ@mail.gmail.com/ [1]
Fixes: f9ce482d7dc0 ("drm/msm/dpu: fix video mode DSC for DSI")
Assisted-by: LLM
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
This does not touch the divisor discussed in the RGB101010 thread
(bits_per_component * 3 vs 24, with and without widebus); that patch
was dropped from the series pending that discussion [2]. This one only
makes the rounding match the DSI host. The panel here uses widebus.

[2] https://lore.kernel.org/all/20260321-dsi-rgb101010-support-v4-0-eb28ecebbfe8@pm.me/

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index ba810f26ea30..2ac517db50fc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -134,8 +134,8 @@ static void drm_mode_to_intf_timing_params(
 		 * TODO: replace drm_dsc_get_bpp_int with logic to handle
 		 * fractional part if there is fraction
 		 */
-		timing->width = timing->width * drm_dsc_get_bpp_int(dsc) /
-				(dsc->bits_per_component * 3);
+		timing->width = DIV_ROUND_UP(timing->width * drm_dsc_get_bpp_int(dsc),
+					     dsc->bits_per_component * 3);
 		timing->xres = timing->width;
 		timing->dce_bytes_per_line = msm_dsc_get_bytes_per_line(dsc);
 	}
-- 
2.43.0

