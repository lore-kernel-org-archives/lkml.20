Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794469951;
	b=atpP8aux1PZqBjZ6YSwpzbrXcKFlZdAWY8W9JpveN5wXdl6vLqAu3TQ2mpZsh5gdTA0G
	 yNym5b8kX/5uLkwFE826xe3E90ufV4TM10HqvkgUSlPxL++4qd8zf0zUY2LIU3SDnjq2d
	 FkbVWLwhckcR38MwjAuVLRMjfvApYoYACtAnyOGpDixzAETeYDjW1J7XI7qmZFUrFGDR2
	 c0+sbR0czYxriSt/LBZdzdZpxAItr0lHjDMue408F1yJc+TvJnynC0Ab/4prBZGb3mVdf
	 MJgIIMysiDAct9hofyIZzrMYc8+yfzaNnm5MIcgXXJGqJX3aYIjKvf9+F3Ae9skghnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794469951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=qVNYeCbCbAXxmLLdlIMU9oCrRe4PBlONcsIqJq1mQ30=;
	b=WcnkroczTi61anW0pXa4egN8MfvNOl3d1HnFM4TtuV4E6NBlLqKvELonmpiyQQSCHmnK
	 OPAft2kAI8BxtKAC1hffZDHoy08l7Wu7PNuHJPX9mZF8c7hJn9f7W7uQvVonsC7F/QwV2
	 73hhb3jZ9xeMo9IVuVW0Qgn2QFPPBLVAuCvIoT3ji/4W+1zvfdUvJrtIBa7B5fuwlUX7x
	 VOG0FsPT7GYMmv3RO+MnoN/HYM0Sj32xqXVGcN2IpQ5T0Pzcbd23bDncWEfe4pEQwglbb
	 +wRUFq+jS3Qnd9Hl3e1/2Y4MCo7pTdXmK7tj/7nzoRNLqe700PlXUbudiB7tHYK/E2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=W8w8QZw2;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B3C606A8A2
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:52:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1B3C606A8A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=W8w8QZw2
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a058315c79so2085916b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794469950; x=1795074750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qVNYeCbCbAXxmLLdlIMU9oCrRe4PBlONcsIqJq1mQ30=;
        b=W8w8QZw2IRkbztOp3R9wwg/Z2c12illDRT/XSU3wrNofve18je2aIWKZIX6DWYSfo1
         F+qn+b/r8nn8bh6RpHH7L+L9v272TxG5JrgX9Zzggls6Pud8V9PX1UxoSeaN/nxC+QMu
         bdzrb72BnzNYw4jjMJFVCO/QMcFMxwAtrZyF6TmkmY6g33nRz6PMgn27jw0FMvYyZYda
         T8niFFoUUh9tF0nppPb2hek+UySyoIvNrrGRj7RT7+OsvDmeS6sYJvyAq4vMHI6UdTxn
         wIhYe1mH3M23a4ZADCfJe7T+3V9ZVmdUCxdPX1vh2mjqx33fVVLSL6DPn8Jlq0Q2WaPj
         MjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794469950; x=1795074750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qVNYeCbCbAXxmLLdlIMU9oCrRe4PBlONcsIqJq1mQ30=;
        b=M0/yG4n/e+o0CdcxuoWxkDJTTiH1G97LH+2xHsLXLwwKZ6AbsbclZmVafyVbsw6SsS
         Y2cJFz26UTsG8XCy8a1LPfRVGBETakgPtn5O3cliTNh0DzBdJmz4olhFqVddT8Eo1lEj
         w9dUnlWqP5L7U2wt+WX/uUUOTbHTxlu2xN1d0u0Ai1NVa8xa9P7O9jGJwd+sd8Yfi46z
         /NyH4sjnHMmOdo7HtnywSTmwfh9ODlJgfT6PqfoZFoPK9FHL4nSU3nDDnU0gNJJLsFHA
         KDYXq73lykmuwlUt2ZEyynW5fqaGbyP2NZ40nx7VyrdYdKSEq71alBMqtO2PuISZPFhr
         vJzQ==
X-Forwarded-Encrypted: i=1; AL+hErENZPNpE+NUIA5eZSLaENc1wnOYry8WQMgrkcIk0cEWe6d2SlGSQHdmSJmW4U+6T/DPk/R5vdSQzZ1Qs8w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZcQRaFFKOjQlOIN8PUjuW6p+XIDQe9gkz+i4OGclNzt8BrE70
	YmoWOxZavaw6MeMEqHVynyG+HReVwTWezU3kJzJDUhhoDwa/L5ATMRGydNb1FZPnBTYUGhPpZAI
	UP+dX
X-Gm-Gg: AYBFou09Fkng9VSN1uRfYXGWMSpVYhcb7yuWOUOjtxvkKPbMYYCnyD2tBBmndAIW3hU
	swpX8QAjqEO68745u8S77k/ZGowuSi5W+rOZSrt5LW7sy8Qoa1aGXY6TAQ2UtM8vZJ6d9yzmbD7
	BhH6Zs7cDPiS64GHmnPZFMZgQRPNvkskXOtZqWk2cuQ/ZSsoieMYspRjqjsfrY4sBROIJ0gjuNt
	etoO8ZJe3/NnaUKrtAKyVaUsCQThNwqrB/figLCgIeF0+lL1SJmKox5XXsdXH7JfD1amOCuwTeA
	offIkaneoJT4S4iM/X0e7P+iQdiH9ecJyK7ApaUuOsgEAmqvZIVyazNRNw5GuqJeE0GFZOzglkJ
	fBvYXHu48sdhtOfxAfldrOGqbyQm4e3Ts4+3RWfq612ACfFvNAxR41VSeGreTtBQFKdH2rEyjEu
	Eyw44d1xBSsbvcN+b3uk4kIJS71bgrLgOwwqFfqrXkY9cET2Rwqf8k0lcbXiMpbxRcr2eNfxMyP
	ReuLfV6n0ScbRx1cSxX9AjIJHVVeWRnLvUuBdhDE3EKDdURgXvOLeaSdbUoKlp0ln4Y72AE4BS0
	CMYpm+bmrnFqarRw3KpnY7SlhDhcqg==
X-Received: by 2002:a05:6a00:3d47:b0:88d:8074:1a9e with SMTP id d2e1a72fcca58-8bc1a39e51amr4637834b3a.3.1794469950174;
        Wed, 11 Nov 2026 23:52:30 -0800 (PST)
Received: from [127.0.1.1] ([116.237.168.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab5f3f99sm3131256b3a.51.2026.11.11.23.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:52:29 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 12 Nov 2026 15:52:04 +0800
Subject: [PATCH 3/8] drm/msm/dpu: support mapping framebuffer to 2 physical
 WB
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-cwb-upstream-v1-3-a6a88d928aa4@linaro.org>
References: <20261112-cwb-upstream-v1-0-a6a88d928aa4@linaro.org>
In-Reply-To: <20261112-cwb-upstream-v1-0-a6a88d928aa4@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794469928; l=3088;
 i=jun.nie@linaro.org; h=from:subject:message-id;
 bh=n92yISLOg7FxejPirqGSQZt1WBDSmToFc68ZG69Z3/c=;
 b=mws8i9pwyAQijwBNy8Z8yQ+mt7XdSqf5wyM9PZaWS1yq6P0SNsYZMNFdVdkUnMWPN+tJAYQAo
 x+R/Jac9QhhBo8GGUWT1LBG0EODqgus7nnM1BOZcMvK2FPuXtIF+vcZ
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=O9aRQ3+xXWihQiRRgStCET+eFXx1EZs43Fh0Xh+8Bu4=

Only single WB interface is supported in writeback use case currently.
Dual WB interfaces are required in quad-pipe topology. Map framebuffer
to 2 physical WBs in low level, with master physical encoder to handle
high level communication.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 29 ++++++++++++++++++----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 22433bfbea1e..7d3528907670 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -188,9 +188,18 @@ static void dpu_encoder_phys_wb_setup_fb(struct dpu_encoder_phys *phys_enc,
 		cdp_usage = DPU_PERF_CDP_USAGE_NRT;
 
 	wb_cfg->intf_mode = phys_enc->intf_mode;
-	wb_cfg->roi.x1 = 0;
-	wb_cfg->roi.x2 = phys_enc->cached_mode.hdisplay;
+
+	if (phys_enc->split_role == ENC_ROLE_SLAVE)
+		wb_cfg->roi.x1 = phys_enc->cached_mode.hdisplay / 2;
+	else
+		wb_cfg->roi.x1 = 0;
 	wb_cfg->roi.y1 = 0;
+
+	if (phys_enc->split_role == ENC_ROLE_MASTER)
+		wb_cfg->roi.x2 = phys_enc->cached_mode.hdisplay / 2;
+	else
+		wb_cfg->roi.x2 = phys_enc->cached_mode.hdisplay;
+
 	wb_cfg->roi.y2 = phys_enc->cached_mode.vdisplay;
 
 	if (hw_wb->ops.setup_roi)
@@ -206,6 +215,9 @@ static void dpu_encoder_phys_wb_setup_fb(struct dpu_encoder_phys *phys_enc,
 				     perf->cdp_cfg[cdp_usage].wr_enable);
 	}
 
+	if (phys_enc->split_role == ENC_ROLE_SLAVE)
+		wb_cfg->dest.plane_addr[0] +=
+			phys_enc->cached_mode.hdisplay * format->bpp / 2;
 	if (hw_wb->ops.setup_outaddress)
 		hw_wb->ops.setup_outaddress(hw_wb, wb_cfg);
 }
@@ -369,7 +381,12 @@ static void dpu_encoder_phys_wb_done_irq(void *arg)
 	atomic_add_unless(&phys_enc->pending_kickoff_cnt, -1, 0);
 	spin_unlock_irqrestore(phys_enc->enc_spinlock, lock_flags);
 
-	if (wb_enc->wb_conn)
+	/*
+	 * For writeback with dual HW WB, only master WB is needed to handle
+	 * high level task.
+	 */
+	if (wb_enc->wb_conn &&
+	    phys_enc->split_role != ENC_ROLE_SLAVE)
 		drm_writeback_signal_completion(wb_enc->wb_conn, 0);
 
 	/* Signal any waiting atomic commit thread */
@@ -430,7 +447,8 @@ static void _dpu_encoder_phys_wb_handle_wbdone_timeout(
 	/* request a ctl reset before the next kickoff */
 	phys_enc->enable_state = DPU_ENC_ERR_NEEDS_HW_RESET;
 
-	if (wb_enc->wb_conn)
+	if (wb_enc->wb_conn &&
+	    phys_enc->split_role != ENC_ROLE_SLAVE)
 		drm_writeback_signal_completion(wb_enc->wb_conn, 0);
 
 	dpu_encoder_frame_done_callback(phys_enc->parent, phys_enc, frame_event);
@@ -484,7 +502,8 @@ static void dpu_encoder_phys_wb_prepare_for_kickoff(
 	drm_conn = &wb_enc->wb_conn->base;
 	state = drm_conn->state;
 
-	if (wb_enc->wb_conn && wb_enc->wb_job)
+	if (wb_enc->wb_conn && wb_enc->wb_job &&
+	    phys_enc->split_role != ENC_ROLE_SLAVE)
 		drm_writeback_queue_job(wb_enc->wb_conn, state);
 
 	dpu_encoder_phys_wb_setup(phys_enc);

-- 
2.53.0

