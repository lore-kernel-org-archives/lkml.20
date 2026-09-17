Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE585503BC1
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789649259; cv=none; b=n3F2OGd2/Y2qyhLJZjUVpycC9p4NP9AAXYURWidZEPZy4OpJ/8Dep0Rlx7/UnhNTVI78pcLNYg2tk0Y3DKLWBN1JJjvYUw+2rh6g7wMz8vgS/FGRaQEDvr/MRSiWjzTHz4fG5ArBGhYOlkCGTh7FZKiPnVw6Z59ASILQoFtg9CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789649259; c=relaxed/simple;
	bh=XLbtsIJ0DCxTOUv5XKkHKfVXn3fWlNTkshqaBhP6s+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DdHoYDdkWM95qfUb9Ws2ztS3JI37v6wA8qa4gN/rpGX6lB7yNK9gTxDcuVK6dS3+imaAWykAl3Ij7H2gQOMYEmZ38XBEqDiqJ8G4hhdVSMlMppAKTrbE9LiSWKC2ZjJt1AaCMcmyLfc4jhimFQmq4YTX3hZlMVsTLZvr+y+5w9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dNPujPhj; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNPujPhj"
Received: by mail-pz2-f41.google.com with SMTP id 41be03b00d2f7-cc50b9e8a45so489683a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789649244; x=1790254044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DbfultDs2OD6410ViT9useBSnVgsUPIPJqHZwqlPlSs=;
        b=dNPujPhj6JaUbWKDw/UEoCeZ25st9A/3gJTjqkOkxapYT3me12xGddc8gZwFtXra7t
         xiliBjbr6gnec8Hbwy/pQ4qpyuxno9wedC351xui5jQu5GfVgj493lckieEgACYxlTvZ
         894PpHuQth86XcdPPT64nOR3Xe30Mwzpy2Ja4JdS+P6NX/8iaQkQp9iVtwg4HYSKFKJN
         C6PSyT4Iy79gvLlZLfLk//L4fSBeyxi44Ad8mqONHmjAkFumj68nRj6u/Rc3MVQ2Mjph
         fioOvSDeqsKmDsDLTNsmflrTPJQIusiKYfdPgXAGsSur060tDaVV2dQap+XZOVNEi20F
         gycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789649244; x=1790254044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DbfultDs2OD6410ViT9useBSnVgsUPIPJqHZwqlPlSs=;
        b=fkRNK3DeQcHeZDPqUqbyLYCM46SghijNSEORaeI61SuWgwUMCteQRyrqQ+IN+lPbGp
         uaQ/+s3ZA9MlaJFWTg8Xl+b9on+uhTpk68X6ghZ4+PcqEr9wPX2ha4mHo0LaXz5j6v50
         c2pZ6mnyJijdc3T7zWWf5rk2WOJQwoXspRBFnF3KgheFvdQgBQOuWwA3YRYeDTE7KYeV
         u5+uK8Xc4F/NGTEHrtiO1qER5lgcVOZB1o6xns+JQcp3PXyS22ol/QhxudTukZBH856J
         SyP1Db1K9CDL2mY23OjbE6mMM/87i5Zb8CZ9/RL5WF9gMm6JGVTE5rj3TFYZwTAuImix
         DelQ==
X-Forwarded-Encrypted: i=1; AKwUvBxg8aGA6mYZT2Z0t96eu8kc0B1MdS2CI8/YzLLxLNiqGu6ey54Gtx1zZe3YgZlN/gGTSPOuzQ6mSar1Jl4=@vger.kernel.org
X-Gm-Message-State: AFuF++kwDMwn0odKyoewiA29UEdoEwwG8JWH2Rsv/ra7Ftb9OuZYS89M
	L2glCzr4lu+EFpcuBNllYr/F6h/al/uXdqy9wmDRicbIZ0QjD477boL4
X-Gm-Gg: AYBFou019veAS2siOLOYNwFY4nbBQcB2n2kF5thQzwlMv6SwQiQaHuLqEH5hFFpp73N
	uGO2LzEOFRjNXQi96Rn0oUbHrmuMWwvgytnWsZaUqeTk163+uz3slree8TXNclzV05hspBoT/Sb
	XHsYCj8IV52ncV3UMJhzSmwH19Wd5bXO7GMre5rwJTVDj0TDDd90GTlWD0yutJuEL3v4V7Ww2A5
	1Kwu8RuKXG8fD2HBUWLSpRLFuvaav3A3iPlRT6fccKxLpXYxMvxmElDOy5qkmFDEjDzjBzjHSZ5
	zCIQlrV8QVNhyM0wPSl2flvS5lHJNgtWO8zafIFNgDu6xy+uQAnJDIaZced40vCp2lt2GZfG6um
	5ihEp9avQyJ8bwv9Zyg4z3NLPag88P6oywrNrP7a7ZHQywy8OT0dThps550quzcMUCRR4j2ppfQ
	nkqetMdYe30wcbhTqHguiX/Rv9zsli/x/1WQTMH1ZWC04lFMGmRv+TxPPMVfqS7YXhIJ8mcaTb6
	hB1dhhOh4U/3AynR2iMe9z8REiFLHM=
X-Received: by 2002:a17:90a:d16:b0:39e:3554:4d0e with SMTP id 98e67ed59e1d1-39e35545939mr9663298a91.1.1789649244173;
        Thu, 17 Sep 2026 05:47:24 -0700 (PDT)
Received: from flyingfox ([2402:a00:163:2ce9:6c87:7904:21fa:8675])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395cfb0b1sm12349328c88.5.2026.09.17.05.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:47:23 -0700 (PDT)
From: Vivek Kumar <vk092kumar@gmail.com>
To: robin.clark@oss.qualcomm.com
Cc: lumag@kernel.org,
	abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Vivek Kumar <vk092kumar@gmail.com>
Subject: [PATCH v3] drm/msm/dp: allow eDP sinks without DP_SINK_COUNT
Date: Thu, 17 Sep 2026 18:17:06 +0530
Message-ID: <20260917124706.421107-1-vk092kumar@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some eDP sinks, especially fixed-format eDP-to-HDMI bridge chips with
no downstream AUX-capable panel behind them, do not report a non-zero
DP_SINK_COUNT even though they participate normally in DPCD capability
exchange and link training.

Treating sink_count == 0 as a permanent disconnect is valid for external
DisplayPort, but it breaks eDP probe/enable paths in
msm_dp_display_prepare_link().

Use the same eDP exemption as drm_dp_read_sink_count_cap() for the raw
sink_count checks in this driver, via a small shared helper, so valid eDP
outputs are not rejected as disconnected just because the downstream sink
does not expose a usable DP_SINK_COUNT.

Tested on a Qualcomm QCS6490-based board driving a fixed-format
eDP-to-HDMI bridge IC (chrontel,ch7218a).

Signed-off-by: Vivek Kumar <vk092kumar@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_aux.c  |  8 ++++++++
 drivers/gpu/drm/msm/dp/dp_aux.h  |  1 +
 drivers/gpu/drm/msm/dp/dp_link.c | 10 ++++++++++
 3 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index 3825a2fb48e2..3b5a4da93122 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -679,6 +679,14 @@ u32 msm_dp_aux_is_link_connected(struct drm_dp_aux *msm_dp_aux)
 	return status;
 }
 
+bool msm_dp_aux_is_edp(struct drm_dp_aux *msm_dp_aux)
+{
+	struct msm_dp_aux_private *aux =
+		container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
+
+	return aux->is_edp;
+}
+
 struct drm_dp_aux *msm_dp_aux_get(struct device *dev,
 			      struct phy *phy,
 			      bool is_edp,
diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h b/drivers/gpu/drm/msm/dp/dp_aux.h
index 4be02e8b4d0b..9ab401c8526f 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.h
+++ b/drivers/gpu/drm/msm/dp/dp_aux.h
@@ -22,6 +22,7 @@ void msm_dp_aux_hpd_intr_enable(struct drm_dp_aux *msm_dp_aux);
 void msm_dp_aux_hpd_intr_disable(struct drm_dp_aux *msm_dp_aux);
 u32 msm_dp_aux_get_hpd_intr_status(struct drm_dp_aux *msm_dp_aux);
 u32 msm_dp_aux_is_link_connected(struct drm_dp_aux *msm_dp_aux);
+bool msm_dp_aux_is_edp(struct drm_dp_aux *msm_dp_aux);
 
 struct phy;
 struct drm_dp_aux *msm_dp_aux_get(struct device *dev,
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 34a91e194a12..bf08b5b18097 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -725,6 +725,16 @@ static int msm_dp_link_parse_sink_status_field(struct msm_dp_link_private *link)
 		DRM_ERROR("DP parse sink count failed\n");
 		return ret;
 	}
+
+	/*
+	 * Some eDP sinks do not report a valid sink count, even though they
+	 * otherwise participate in link training and DPCD capability exchange.
+	 * Treat a zero raw count as a valid non-zero placeholder so we do not
+	 * misclassify the link as disconnected on eDP.
+	 */
+	if (msm_dp_aux_is_edp(link->aux) && ret == 0)
+		ret = 1;
+
 	link->msm_dp_link.sink_count = ret;
 
 	ret = drm_dp_dpcd_read_link_status(link->aux,
-- 
2.55.0

