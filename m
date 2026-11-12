Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794469946;
	b=IAdkP9h7hel4vQXrInj4+mKDkpjJV+cMT2nGzMZBnACVHwIRVj9lfONzmZ091RD8j8Iu
	 pF44w80JHwbTRo2Ahy9tDedmX1MypKfXfmHSqr56wWc5bl2M7J+Grse44f0FV+AMEzmtC
	 8ndOlnj7lKHCs2BtPTCRg2qBamIXG90WRjy0aiQihZhBiyg02XzLUAE6RX7CfamwJAsg/
	 82adPEmTJCTfylolUn8i7PTN3x20iwmiej+jQfyy6HYCRUkrIg+1XM/2mkJX1KQb6dU0O
	 srVHDmAZgZACHqZfRHvYzdUgUW5jJxNaT2TdzuCKgKSE9bCcl+AW6EDgW9NSOYJL5OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794469946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=MeMBAMo08wUuxPAalzAqVHvt8LiRWsl/qLA1LJ6ugek=;
	b=aGagluARghRknMgxUV/Fa6KXuG7S03A6LIuH6LD+xWCqC/KYzeClr4Y1qcx/moY8E5K5
	 NYj4mhqXU8JshZIN0O1wpsOA/A43eTXrLQEOmB0NbM8sJSatADowXqdlsZ5G68F2Yj5fh
	 0UdDQ4GSoSzglOJLt1o0vwf51MsC6r0QfqecXZomKOmA1vYwThaS3pG5bPJpTnXN8T0AY
	 l5JODFI0+5yo2aZZN+uRjSPPq7lMmhqCG/gSvUUrJmZMWVbeL/fWppri+BTNeU1ilaavE
	 Fl35/+wJtvDGTeayUiVIej0dcEh5veFNb2i5JC3a+J2WESegxEnJKBPZvtVEqiq1KpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UBogsQ3f;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84FF606A332
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E84FF606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UBogsQ3f
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a9f9473029so3243175b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794469945; x=1795074745; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MeMBAMo08wUuxPAalzAqVHvt8LiRWsl/qLA1LJ6ugek=;
        b=UBogsQ3fw/cqvqtoKAvJlqGEJUrT2itHn8Af4zANdJo8MoF0/opJKQp1XQTWANstDD
         1Q/jDDORIAoitLul2Vxm2qNciEXMM0BOznAlIznUIYbTzJrP0i+uqFHH/1R6RzV2FFeV
         EmYCxsmE5DpSjO6fCRnVSOMrazqb8xRNOyqJ6WQjK3EbVRMg8WvFzjgUK4MZq1uH4ttb
         LK/EbgOJ0T/wn/efzm/m0QQ+NZriEQQ84CaCk6ZqhNoN4C0yoQuCFvipyorLzkaAsEGg
         ltOaE4VhPWDnk1jBrazmT78qoXPE6HqDn9ShbF6N5QOnq5TiCWeI0i46MY0UJKg91h0D
         oriA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794469945; x=1795074745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MeMBAMo08wUuxPAalzAqVHvt8LiRWsl/qLA1LJ6ugek=;
        b=mfdsSrqlb78l81ZlyOI5EA/KepyFlYgD/BceQSWWspcZ/wbHIYmf9mNHc2CXKhO4DU
         PR7lx/n+ah7HbowNx7Wg2j6dGU6ri1atZq/XZwk2gw5JAT7Ypr/X/WQv5P73wuZLVjwl
         y0FjolbL6Xde5SHQcjlPfP6uinOP5+Qy4e7J1U1uU1QhwN5KmEy58ygwifPsy/j/BZJK
         6dftCo7SkPyNrCt7ninDzeLpn2ynz05JUjBFH8UFd1Do/QQUYNFxVAhOvgiU3DuuDWkl
         rh+WPRysYrXsc2+wfxXi7g7mUcvylzYKrnViTVi34M2mym27JrWKS+kt/X97i3FZetOh
         32mA==
X-Forwarded-Encrypted: i=1; AL+hErH5TlJ3g7u6tR3kljQcbGfKIDfLbEdp1EpUFXZ2EPJCeYN6hHncOjeUNRGDNEWsNBfdfAUpPqlbTWoPtuE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8APquKkPnnMtaPAwlcP++W/lBPnePCA/HjrGixW1hFh36743Z9
	X6htV81tE9Jcf1qEbdaxv3AqALZ7hteouFmesWE8FjzCldO4ZtM0KOVdpoRwoOhlVoMfhWHXKuY
	XMA4N
X-Gm-Gg: AYBFou0rKa0uEW9h+Pf9TnKjCAa91guW+Vp8c+oNUJj183TIzOfVjDi83j8zRPnW1Sb
	8me2c/LRuWDbdF1RX04E3uNei2t1X+DEv5kBL4rIpZsIuCbc++kbpz70eDfzIC9avX5Jc3gUiit
	zMD600uYr2Jn/rojGK9Rb6F+A5qGzZK3b8dZbJukcLgN9z8aC/6cLXSOORt+yg8omLPY3gciiQn
	hBOURfaMw1k8yXU8+i5r/2Ia1sgV4NhuEjAiQonOE88wEJpdhJQg0iRYSH5qS6b7uJaX76IYJL8
	q35laZl2oMjWvlnSqSJvXI5LVdw4LmDQSNH+PwR1VySaMjL2YN/6EWbt3MFYHEq2T7EWqVq2+Za
	qz0f2OyAzRsBgIElIAq482oizQ9+FZj5xAVJbniif/Xcpe+Haqvgd+uZOeE4fX9NpGRE0f6+bF5
	XgVeMjkRQpFTtG6LCWt9jJqF8usWgCGUNGERUFMD91AWV7g6IMG1TlF9T9UGC/A15XoGWm9vTFy
	372r6JWxY38DpvN1OKJ4ZWDE3CMJM7bLQKiPi9LG9KRk5aGuSG3iGlzcUSXcQVOIJOifGyuS9Cz
	ib6iyfm2yObDvkG6fWaOjbnSQSBr4w==
X-Received: by 2002:a05:6a00:a27:b0:8a0:76ea:36e1 with SMTP id d2e1a72fcca58-8bc1887692emr4823477b3a.7.1794469945271;
        Wed, 11 Nov 2026 23:52:25 -0800 (PST)
Received: from [127.0.1.1] ([116.237.168.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab5f3f99sm3131256b3a.51.2026.11.11.23.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:52:24 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 12 Nov 2026 15:52:03 +0800
Subject: [PATCH 2/8] drm/msm/dpu: do not use DSC merge_3d for writeback
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
Message-Id: <20261112-cwb-upstream-v1-2-a6a88d928aa4@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794469928; l=893;
 i=jun.nie@linaro.org; h=from:subject:message-id;
 bh=JycUzHXZbsiOgnzk6rE/otCXrlxkOXnmr2QsNNi2O6I=;
 b=LQqbXTQ2wMNTqJqqSec4r2cPKc+hwkaUa6aAoVc9FArjsp/chYhwbrHeYXtQunux8vdhNvuWb
 4/TnnWFTb2xDJQ1E2wtc7Zn5+LoI+PVV74D/zYkWWH7p6jg8JhO/6iV
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=O9aRQ3+xXWihQiRRgStCET+eFXx1EZs43Fh0Xh+8Bu4=

Writeback does not output DSC-compressed data as it is meaning less.
So reject to use DSC merge_3d for writeback encoder.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 53d0ece792f5..d455845ba14b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -624,6 +624,9 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
 	int i, intf_count = 0, num_dsc = 0;
 
+	if (dpu_enc->disp_info.intf_type == INTF_WB)
+		return false;
+
 	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
 		if (dpu_enc->phys_encs[i])
 			intf_count++;

-- 
2.53.0

