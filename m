Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201C3374E5A;
	Fri,  9 Oct 2026 03:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791516017; cv=none; b=IV/N+5XzX8n3m8TZwvu+QFRBA3ZgVtL18MKgaGLRM25Fwt8sSPxujJKemZoamBT4/FKk26ITfAQBm3aFLuevWAUBXQDv5G3g1hXvXeUT8wQk2DzzgXtO/vKa2ym+hXsAD6TzhK6nid34emd6lGoDzBiHmYnzINbswF8SyjSd+Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791516017; c=relaxed/simple;
	bh=Z9h8OALLyQT16FzQH0lJ854H/RrF3oqTzDkmSpjnkKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LfTOUQURzlBHUpBWElPlnQ8Huxu3QwL3F1dV5Dwmf3T/w6lW44hCs4fUGmC2FAeVEIgasWFI3BdNGjtdg+5b90oC/GxQ4Qj4FwnCD8G49bIpwvP69bjwzw0wAOmLeeim3sMCYZdeZPRjZNB9e8zJQjdqqOhVTJ6LVb0voCn1xq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip2t1791515882t0fd3316f
X-QQ-Originating-IP: XXNfWD6sBCjyqaCfOai782WfGgGzZkkZ7WXlzuAHYJ8=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 11:17:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12552488957466588621
EX-QQ-RecipientCnt: 29
From: Xilin Wu <sophon@radxa.com>
Date: Fri, 09 Oct 2026 11:16:07 +0800
Subject: [PATCH v2 15/20] drm/msm/dp: Flush VSC updates when leaving YUV420
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-msm-dp-hdr10-v2-15-1835d4966da3@radxa.com>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
In-Reply-To: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 dragon@radxa.com, Xilin Wu <sophon@radxa.com>, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3407; i=sophon@radxa.com;
 h=from:subject:message-id; bh=Z9h8OALLyQT16FzQH0lJ854H/RrF3oqTzDkmSpjnkKg=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFknYlb1VPj7TlmssD18z5dZVp5Ppsnl555o3H0o43fcB
 ObaR1emd5SyMIhxMciKKbIoxDPMZa/MvfZUrFQPZg4rE8gQBi5OAZhI73OGP/zX8mwuvhZWVrnI
 7bFGYuPsY+HM55Xnmi62Pr/Ir+V41j9Ghon8wfmbPuw8te/9xiPC/eobRRgEtL9c6PXaL+ncdvT
 zUVYA
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OYMEOeTae7mlISRHksvqf9mKHFDAasBBoBfvK+/vygPUzPQEbzmeATce
	Wb9d8cGlMHPJFCfUwfdOIVRta0UQdGHOqkf3BWxaGu+iSSNK+j0JCcOflNlH84vz1cwrULN
	5Jv44Cmts036kLe2fNQwXvvWQYaYXuo+knQUtrZvLXZJvTkk9Q8bA4ZQGnAVFCfGc0pw0Fu
	p+HG0VkmtiqagE81axSVWS9cwtobY7lkGs72oOkkn4H4kval9CgH2IeONYO4YsHH1l30qpi
	ClKncC7Dyogh5ybsql7jMZxUzeIkIhyIvOCVD27qcMUEg6InuMEIZU88/Kh/iDV3ndex1VJ
	OPQP1xlBcMpKtYPpRcPlIuCM7W/NLCDQ5AbpH+41E3ptjFYgtw3byQCXrnW1z36JkX9Cuak
	eZTBR7OMjmA+DD2yvq9wSA0ahUYn9QFU/1iUJfuEXJ4BwFKeyieCNzEQouhQQ59zT2afZK5
	hHqd7+Fs+Nu4ut11NtDfRlciLcIO4irz253egntREcyOLoJ3VspysvE5PlNsbeZCs8GWzu7
	Egz9lGmeWUHXKstHSfjnTDKgZvUCrf9HVJIk5haY0eOEfYAz47Z04eVhbKKqWeeHCnEn74x
	p7O5KRE3zaJH6cf4C3fMWHYTcwdNBrHOZD2l+eOCxEx8lMVpFsYyU65A5DfMir9BRuEP4S/
	tV7NLq+XVcRzEjLIGd2fvfhWY2eJTwDDbiguRSJKV4puRwSPaxqSgDKN+XTWgHGN6CdayMf
	MYnRsaNl/sLRZmRNNwIMb6sf7cA8vPOU6TaNFqwqpq4xhKvmmcdYpb2FBA0d+yomRby7NjR
	bVLb0GUBjwqkOzkcTBUV44xizDubfb8DziycQeTFjqfXUGEVzHhlgSTdz0ZeuYP8Sl572rz
	Vkh7SUuevecNVQYvLlEhUd4Eq94KNX/evgnc6wGpreqY3c6kKvmBFCw4sYrEFm+3485PBcJ
	d7NhgpRG2n5VfnCMWDJsmxH+Kt79Uiu0cZVvOtfSoHZMF8vX1lGHkZiP9qxE3T0eAK/eoX8
	LTExyCTnF9ea8PfXaTWKwYWCmsmb9gT+G6DjGr3MpG4d84uVJdGYTxUWMma9XOkZkyGBydt
	Q==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

Peripheral flush is currently requested only for the new YUV420 mode.
Returning to RGB also changes SDP state and must remove the old VSC
packet rather than leaving its enable bits set.

Track whether either stream needs VSC and request peripheral flush for
both enabling and removing it. Explicitly disable VSC for RGB, and write
the packet payload before enabling transmission. Retain the existing
hardware-specific SDP update mechanism.

Assisted-by: LLM
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 7 ++++++-
 drivers/gpu/drm/msm/dp/dp_panel.c   | 6 ++++--
 drivers/gpu/drm/msm/dp/dp_panel.h   | 1 +
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 1f9595ff5fd9..486348113b8a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -691,6 +691,8 @@ static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
 	else
 		bpp = state->bpp;
 
+	msm_dp_panel->sdp_needs_flush = msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 ||
+		drm_mode_is_420_only(&msm_dp_panel->connector->display_info, adjusted_mode);
 	msm_dp_panel_init_panel_info(msm_dp_panel, adjusted_mode, bpp ? bpp : 24);
 
 	/* populate wide_bus_support to different layers */
@@ -1557,7 +1559,10 @@ void __exit msm_dp_unregister(void)
 bool msm_dp_needs_periph_flush(const struct msm_dp *msm_dp_display,
 			       const struct drm_display_mode *mode)
 {
-	return drm_mode_is_420_only(&msm_dp_display->connector->display_info, mode);
+	struct msm_dp_display_private *dp = container_of(msm_dp_display,
+					struct msm_dp_display_private, msm_dp_display);
+
+	return dp->panel->sdp_needs_flush;
 }
 
 bool msm_dp_wide_bus_available(const struct msm_dp *msm_dp_display)
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index af05441bc32a..026074cafc88 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -526,14 +526,14 @@ void msm_dp_panel_enable_vsc_sdp(struct msm_dp_panel *msm_dp_panel, struct dp_sd
 	cfg2 = msm_dp_read_link(panel, MMSS_DP_SDP_CFG2);
 	misc = msm_dp_read_link(panel, REG_DP_MISC1_MISC0);
 
+	msm_dp_panel_send_sdp(panel, vsc_sdp, MMSS_DP_GENERIC0_0);
+
 	cfg |= GEN0_SDP_EN;
 	msm_dp_write_link(panel, MMSS_DP_SDP_CFG, cfg);
 
 	cfg2 |= GENERIC0_SDPSIZE_VALID;
 	msm_dp_write_link(panel, MMSS_DP_SDP_CFG2, cfg2);
 
-	msm_dp_panel_send_sdp(panel, vsc_sdp, MMSS_DP_GENERIC0_0);
-
 	/* indicates presence of VSC (BIT(6) of MISC1) */
 	misc |= DP_MISC1_VSC_SDP;
 
@@ -686,6 +686,8 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
 
 	if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
 		msm_dp_panel_setup_vsc_sdp_yuv_420(msm_dp_panel);
+	else
+		msm_dp_panel_disable_vsc_sdp(msm_dp_panel);
 
 	panel->panel_on = true;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index a5cb8a4a9498..31752895f124 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -42,6 +42,7 @@ struct msm_dp_panel {
 	bool link_caps_valid;
 	/* All capability reads completed; eDP can reuse the full cache. */
 	bool caps_cached;
+	bool sdp_needs_flush;
 	u32 hw_revision;
 
 	u32 max_bw_code;

-- 
2.56.0

