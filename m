Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793536196;
	b=tgAK3NrZULGva85efARUJ1aaAr1arLxsXEtOG7Dxk22CkjmEID2aSYRjke9n1Sp7tPNZ
	 gehfG6iY4XWXio/7rZbmO2CwSjshxrmOWFLBS/d7E+GuCQpqAPU5QN5vcazYigJT6yf01
	 HZE2NALH0jtLN0EYgxmqU/TEGmvmKYk168fbLi3AWIhpY42a7GWye90mEWjsBrOHJMsns
	 0KPomHSoAd6yCfs+19DcZuHV5nrkcJYVjpawPPFI0tM2/4Qvv9ek2CIeeqqhXvRBBEL8z
	 Wm4XDg661bqQVsQepKwcrCuIJyE+pRZV7+6jiyDHd9xhpkfqGUpEzGwzddSt8gJDRQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793536196;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5CNWPC3f4Y7cj+kyGwcKKMi29wAdC6p/pBOZZ28e0cY=;
	b=RocNiyL0MpTsz6GTT9kgyqm8M6M0HSMIVUIDmaM6wTeHGbXkDxaF8utwK0WaFxBsJusg
	 2rSxJd7NcblJmyECnA8ZWV6WLP0/LM87+Sj6hrQVoiXf/QVr5zR9XXEbwIiK1iHUgckGr
	 kCAJzJXqLaVPfqCMhSkIaLo38EfwbPVI8ej0xRa2/KsayonesRR9Y/EUtuyNgSjNLy6l9
	 78qfXg7In93QmXVGqESmbOTEg8oRHG2OGRPxzwx9sG2fdIKGP45zHyA1MEpFUBfWir7M3
	 B4+evHiJFp6MXyLr+yL6p366GMTjHEwEvP+yXOpaGrIGe724ej7/S3QzQzyCEpUBYQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=softbase.tech;
	spf=pass smtp.mailfrom=softbase.tech;
	dkim=pass header.d=softbase.tech header.i=@softbase.tech header.a=rsa-sha256 header.s=protonmail3 header.b=EBcTXb9w;
	arc=none smtp.remote-ip=79.135.106.113
Received: from mail-106113.protonmail.ch (mail-106113.protonmail.ch [79.135.106.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFE1606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 12:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CFE1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=softbase.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=softbase.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=softbase.tech header.i=@softbase.tech header.a=rsa-sha256 header.s=protonmail3 header.b=EBcTXb9w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=softbase.tech;
	s=protonmail3; t=1793536191; x=1793795391;
	bh=5CNWPC3f4Y7cj+kyGwcKKMi29wAdC6p/pBOZZ28e0cY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=EBcTXb9wZy9SYEH41vt7FqHbLnqf7GvXMvWPm9jYNy8wn/Nr1Mk49MazGTWd4z7d5
	 hJEyKn0q713yBFOgiSSnarWuPJkoMa7e5R0c+e7QMYJ8FH7gomrXpu9ffVt6vgLkmE
	 aX0bV1llgwgmqoFQxPpKNVyFfmPFO0ZV9KTsfAHBTcX0UHSTfvgb4mOhdC1xwo6K4g
	 aHkBg5mAVEHuRoHaAcpY+G14Mp0TeQk25M79FdrrGwm7tPImSklDcIsmWvaceK4rqh
	 CtAOX8gS6Yop6flHaSQI3Em4vVGouZ1z7bjE0RtFbpJIWKEXvkE0q9CBRo+lJYWE8n
	 gBO7NAvhy4vFQ==
X-Pm-Submission-Id: 4jHZ0X2y0lz2Sd2r
From: "Beat M. Liechti" <beat@softbase.tech>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Federico Amedeo Izzo <federico@izzo.pro>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	"Beat M. Liechti" <beat@softbase.tech>
Subject: [PATCH v2 0/2] drm/msm: fix CTL/LM swap on color management changes
Date: Sun,  1 Nov 2026 13:26:56 +0100
Message-ID: <20261101122943.8155-1-beat@softbase.tech>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101095754.33840-1-beat@softbase.tech>
References: <20261101095754.33840-1-beat@softbase.tech>
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

Closing the lid of an X1E laptop under GNOME with an external display
attached moves the still active external CRTC to other CTL/LM blocks
without a modeset, which ends in SMMU faults and a hung display
pipeline. Patch 1 fixes that in DPU. Patch 2 removes the CTM-only
allow_modeset hack in msm_atomic_check(), which patch 1 makes
redundant.

Changes in v2:
- Patch 1: don't set allow_modeset on behalf of userspace (Dmitry)
- Patch 2: new, drops the legacy CTM check (Sashiko review)
- Link to v1: https://lore.kernel.org/r/20261101095754.33840-1-beat@softbase.tech

Beat M. Liechti (2):
  drm/msm/dpu: don't reassign resources on color management changes
  drm/msm: drop the CTM modeset hack from msm_atomic_check()

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 25 +++++++++++++++++++++---
 drivers/gpu/drm/msm/msm_atomic.c         | 17 +---------------
 2 files changed, 23 insertions(+), 19 deletions(-)

-- 
2.53.0

