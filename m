Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A4D3859E0;
	Fri,  9 Oct 2026 03:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791516028; cv=none; b=O5/KibC3EmGMvaPJHa4lNmiEjHMS7NFNMsCYNCN1lith2gKQvfZXFG/tVe2J1uyzP0AioayMf6jH/AFYEVsbA91A4yY26Euzk95Hl2O+JYedrLHzrsGgu5b77aqG2LxXsR8wqds5f9KmySriRlg3vySdkQCRCpEk79zGcpzxVy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791516028; c=relaxed/simple;
	bh=w0FWwQh+BArzLEg40xbIVHgfENw/S8iO3UHo5I+Bfm4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rPE0ohy7eOJF+e0Z1Li04vo2X9sLpIt/bqCCPPqZcvbxVR3O+igJi5j2G6AjTp+Uz7CjWlre9EhWzOC7lS58n0WkEdm5202oahNMFrzognMWgWiTmwWrWpcAXB4wo6UzPVunmF1eXdO2Ww5mLNfpWyi4bft1Af05RBA0Ro/9zAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip2t1791515838t472c8b42
X-QQ-Originating-IP: MKR7kzW7HAK+NrS0wgFqsGbBRp/tfPe9KB5QgOo6rjo=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 11:17:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16529762743812786716
EX-QQ-RecipientCnt: 30
From: Xilin Wu <sophon@radxa.com>
Date: Fri, 09 Oct 2026 11:15:56 +0800
Subject: [PATCH v2 04/20] drm/msm/dp: Accept a const SDP header when
 packing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-msm-dp-hdr10-v2-4-1835d4966da3@radxa.com>
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
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1789; i=sophon@radxa.com;
 h=from:subject:message-id; bh=w0FWwQh+BArzLEg40xbIVHgfENw/S8iO3UHo5I+Bfm4=;
 b=kA0DAAoWMsMVZ62eMk4ByyZiAGrIXKijETSs3rt6JIAJ8bXCJKivjITsO1dXNj8lydUN4XW4T
 Yh1BAAWCgAdFiEEIF8AnQd5bdblFnUuMsMVZ62eMk4FAmrIXKgACgkQMsMVZ62eMk5+NQEAnfcl
 sZ3qoQ57XjQN4azidHE4kJrQ/Mmm0rbt37WuTOAA/jg8pZJgWaNaE/wWRj5tblS+RXKhQ34hIsp
 H125BnrYA
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OQhZ3T0tjf0a1abGbRcrVv+f2BIzHvz/iLqpjLBaMpknZtoQoX5Ac5yO
	sIDYLhhQIkdOis04C5pFcOzxQta9ontFfjMsD6CQ8s/KuB9rSY+tbX00p3mqOZcvufmPA8c
	+zXrNdpCM0M/tRVQM6UzNRW4LfPtPGsd04X5SA99NmlmvKQ9PFJToaHKjRRjRK5TDcSKH8N
	3XVTx+KD1BzDaZPIDFQir4QHkcg80zHpcvcqye6Go9tGNFnSAZfvt029nwEeEURopMwJe1T
	ElqrIik52WDOw360Xtwpsrxwfk1DELqpN1GNkc1tHdi84q28uOEAZxEVeVcz/FtlVDdkPPZ
	XXuvCDqgunzr9eC+TA9LBBx/9ZN2acLgkF48tAd6r7dfbR2TV2H0weMXLfmtYk49xR+8SVg
	QFe9fZUrXEeplwK32bCJaGWwKMHxPp9/7M2pJDUGebsoTZnlVuXJ3nie1UR79SqRwAWLKEM
	JUlkvlMHLipw7jiyX1opCDTStKnXI48U28uzs6l5hR8UCRqsWrku1QbjVTuWfSvvMDmSXNE
	ZZ51hJymkXYoZ73c2tvkF6x7tbuuu0SeoyDOln9ht858Rj9GeYh3ZSvDZC3scPojD/ocOSU
	WapkB9TBqtqbOwFa2WRklX8/7RYxAzlr0NF8gzieKcXtGsxVUFPiT8nLB+GETScxt0c70tn
	BzYw7T82H6Tp3ZABEEWRUIw9pzx4yqHFEIM4NwV6LyuWFZM2KvBu4kZ/LFjrt8lqg+8HgQ9
	X83BCavQY//s7gl0+mns8lb+c8s3Y6AAflDswwxfHRhAIvD0ZQ95A7mzTzmQ94G2qe7Pgbh
	7VU1RFyJd0jhqxpzXN7/RVeY0lVi2aQvFHnVxy5DIdAbTQ7jWo1K+CWhBOhAVWLDoQ0BncT
	k0YLqAX082DLWQNE1jcOYgibY3UKqNB767JnjmKpza/WUUktxuF+Vd8NutUPDXYYsYB6psI
	I8S4GYDIoNpA7eU/MyZCyRhk20lJjubDeefohx1eR9/ZOuSmhD6ab+bJ1OkpTt3c+d2LTJA
	4bY56w6B36laet7BPARCB+S6LItmfz3c6viNyvJ6rWYLlTmg/SFLjFJqbQrNc=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

The SDP header packing helper only reads the header. Mark its input const
so callers can pack headers from read-only SDP packets without discarding
the qualifier. This prepares for the generic SDP writer accepting const
packets without changing the packed header bytes.

Assisted-by: LLM
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/gpu/drm/msm/dp/dp_utils.c | 3 ++-
 drivers/gpu/drm/msm/dp/dp_utils.h | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_utils.c b/drivers/gpu/drm/msm/dp/dp_utils.c
index 4a5ebb0c33b8..226b370ce8fe 100644
--- a/drivers/gpu/drm/msm/dp/dp_utils.c
+++ b/drivers/gpu/drm/msm/dp/dp_utils.c
@@ -74,7 +74,8 @@ u8 msm_dp_utils_calculate_parity(u32 data)
 	return parity_byte;
 }
 
-void msm_dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 header_buff[2])
+void msm_dp_utils_pack_sdp_header(const struct dp_sdp_header *sdp_header,
+				  u32 header_buff[2])
 {
 	header_buff[0] = FIELD_PREP(HEADER_0_MASK, sdp_header->HB0) |
 		FIELD_PREP(PARITY_0_MASK, msm_dp_utils_calculate_parity(sdp_header->HB0)) |
diff --git a/drivers/gpu/drm/msm/dp/dp_utils.h b/drivers/gpu/drm/msm/dp/dp_utils.h
index 2e4f98a863c4..2fdb89efc57c 100644
--- a/drivers/gpu/drm/msm/dp/dp_utils.h
+++ b/drivers/gpu/drm/msm/dp/dp_utils.h
@@ -31,6 +31,7 @@
 u8 msm_dp_utils_get_g0_value(u8 data);
 u8 msm_dp_utils_get_g1_value(u8 data);
 u8 msm_dp_utils_calculate_parity(u32 data);
-void msm_dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 header_buff[2]);
+void msm_dp_utils_pack_sdp_header(const struct dp_sdp_header *sdp_header,
+				  u32 header_buff[2]);
 
 #endif /* _DP_UTILS_H_ */

-- 
2.56.0

