Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212DE3EB10C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656100; cv=none; b=dD7AVpR5fcO/rPETPpQcBVI20oXZm65FEKleMN/8wCuLcEbyQi0ugkWk94/l4L+B6EQlGINO9uaPt90TJXphct0cYvd/E2mV1iwA5XcRDWTUoTEPRB1WmdJaGy6s/O2yI8q3QXIXjlSjtNoYL6cclizIwN854NyY2vLFnzpgIiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656100; c=relaxed/simple;
	bh=IfXwfbgS8xgWmMHEApffvfffdEKn4zPcOBgNS3h2Cv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dSnqWHG1dtFdWa+D/kRbi049FGH5z8KiIbKucClT5yQooETuFRt3CcJ/nG/b2fBmb1STJWY2h6xKRaqkvuM8eC0bUa969YqFWS6uJAugxfZnj4THRyA7hjF9xfcN6NMoBlOo9bgh5M9tCJ6YiQJXUCisXGc8bGbCXqckJE1c2dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nr8PHZLI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D1EUKjm8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nr8PHZLI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D1EUKjm8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T475Ix3390853
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p+IJo5TcfNLBIq7DPD1RDw5FC3Qa6/qDsC1jq4n1mNU=; b=nr8PHZLIpY4SotVJ
	3slVP0e6zBzevIntzbekd2D2RVC2kAnXryscGPWceRj/Yn+OC9UC2zX9VScuvYZi
	qrylBt/lIS7l3k6ne5ENyZA2geRl/SyFC0w4nPZkU7SZMAC4bjh4EOsMEn7F9rzv
	zRDLsoPhfXRPfw/2H++mWMmMBYtntP9VPFY6oGZhy9LHM+jxvdyuW9URKK7Nl+/6
	KqLcjxqpZI0q1dC9r4ZYUMY4pnQFRc07XpAVuOhj80jhXWlUzfAMDEhmqkHMGDtH
	Cnp14KjGK0N37VmmyAsByASrtFi/STETQMgH8h2QI9hWozEDxrpp957VHe3QZDhv
	OAcmZg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h01vkgvhr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530f65ddee1so89929361cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656096; x=1791260896; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p+IJo5TcfNLBIq7DPD1RDw5FC3Qa6/qDsC1jq4n1mNU=;
        b=D1EUKjm8yBEA984GiE7s631Daw6DLZgbfipp1oqaaa1bWaL+4Zr58HDPqbfunZFzft
         qhf2Y1SUnnqsE77fJtxSP6kMjqcXbt27Ctni3hXBlOMT901GUbLt9chftt28Q68/inky
         kloetzT8OcXogF3OVkGmrW/byr6yanyxQsv1mzwXgu5FEnFwA5KoZUjYwNHnQcTqkDW9
         7WTy6reRBlIlnmzOeqsTumQytYLyPP0kKj+rZmGcJlAsIayzKjM53W5opI1Ihwf34rCH
         r0lmWlGnH/uDZMvsJRkJdQP5HaOmTyiplif7c0ac7BYGINvSSe+1NChPNxMlmXHqXnVV
         4EpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656096; x=1791260896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p+IJo5TcfNLBIq7DPD1RDw5FC3Qa6/qDsC1jq4n1mNU=;
        b=MJAXjGLT60zcERrlMLOUZsQRypqkoF+zsiUdksNqt0aUv0u5KZ3ZTd9klBH9m8ORI2
         TZl0JCZTQV02gLsk5ydkv+oCIzc84MPp2eZLv+izu+IvDGMR6YRQwKEbMovcu8Co1Ier
         QueUIi1FN1SVdPoxeKTz7Rz9SejDH7VGZ+ubA3S4+4K0lKxVCBiIwkOzNUtkdrT8jIkt
         wMMFF9Q1yYRTL1ieteMaMot++bs9UybNXXxJFiDbVBxUSZYfQ19s5JbGhOEUcSKZTALR
         NqNtVkEbCUw6Cpk2qcKQSvvgd4Cy2BKSspy5evacE30J0j7raDbBeqTfjGgsogMZx1ld
         6wUA==
X-Forwarded-Encrypted: i=1; AKwUvBzpsw5RgC71tHq6jVdkqFM5/r++SZFhH6Np/cE/ypuz34qLJS9McDoKHEuxZVvGC06K2sRwnTXNFZh5E2g=@vger.kernel.org
X-Gm-Message-State: AFuF++nzRVrF1L9SyHN2TqesBy40MUr7kgppeelTYejnoO3PO6TH0Oeq
	CYoDlHaAPLpEqMm2AtFmvM3HYQLp2eRUHk+vVXISGsFKCOB8nDK458OYhga7xMfX5Z6bs9TfUJ9
	M8SGfq4w3Fv2/r0jQbuKZVjgEEfkYjq1M4Nar4Bnkib6LMz1zukyhQdctOK+6mFfrtnE=
X-Gm-Gg: AYBFou2dMl7q4l/MxGsTHwa3oHaFERoDvS/RY5Jpbx8lKbohX6R/raoMHuXD/hNgptu
	dt1LJ5cOoIEN894EMx0iS/CiFxGEhgl+Pr/ms1R1YCintcDWAFLuw6+49gK7tuvy34xXhzw0Sem
	e3mFZBgKuqSgyQf2SSVFC8g1wpfwCTzVUhCKVw7iVqIJ85tgKtzIJSLdD2nnLyRInzMXlHcBNFZ
	logdMEc0RnBxCf0fCM8lL/Z1FxiiS8R5hRvBUa5V/IbvocEiC9EbmuWXn4DHsltL1ywO5lgPuPJ
	kaBkmSX8DH2SkG9kOY3hUT8EB1iDhhReb1NDzU4FL0nqW86+XIg2ezgbfpMfgQVpNSfJ2kuZsJK
	zSRRtOlk+KdQqEITrOi47Y2uhi3DRsHjdMcZ5bK0npSh81Ya4Zr5Z8DaKQ1hxFMs=
X-Received: by 2002:a05:622a:9010:b0:533:2826:292a with SMTP id d75a77b69052e-53328262f69mr159113191cf.7.1790656096222;
        Mon, 28 Sep 2026 21:28:16 -0700 (PDT)
X-Received: by 2002:a05:622a:9010:b0:533:2826:292a with SMTP id d75a77b69052e-53328262f69mr159112901cf.7.1790656095698;
        Mon, 28 Sep 2026 21:28:15 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:28:15 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:47 +0800
Subject: [PATCH v7 23/35] drm/msm/dp: move link capabilities to dp_link
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-23-4b81473185e7@oss.qualcomm.com>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
In-Reply-To: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=8883;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=IfXwfbgS8xgWmMHEApffvfffdEKn4zPcOBgNS3h2Cv0=;
 b=A3n0hH2WqPcxkBsxxLwnAko/mvDKDVbDRrFh/G636DVb9YVgmdL5Lb0Py6ph94Ze6Y4lrdiUG
 yhieOt3LNWeCsHRfurMrh8E/1r9atuTqJ+OVMhxACA4P3vL7/Y0l6d6
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX6I9f2NsuUqLE
 ue1Vga5Ihl+XFpbAuInDJvw8xY9HaX5SKZs5HpjlXwujIqOX+33SYwPn9ZlhNu1YxfXAFcLA9h/
 yysVQHG+8E/xTzU0zrquK+kbVDNjMGyeYSvVNaTHaDhODdepY0iPad0avQZz00WzlYbsH0OUTaB
 DfT6gVp8gfZfwOay7Fj/VZVM7ktiC/PmI9DNuUl+sE3ZK2Ox6IsY0tXvK+eIlpNEBWuEFXofh99
 OoJyyn/By3nx04clLGR+IEnr/og8msM50OG39EAfOFP3Mrq4CSsSKFD1PCNGDBBsdQmxcgE8Jvn
 reqYYFosr9mXO/1q8GwZ+Tthj1ywnJjrqc/P3aHUnzELuXmndF584HExDLakhNK1FoqgCQETTtl
 ttjEZmPX3h9jPkavwb77rKae7qaNNXkP0JTLNLkw6rbRsRwePwD0b4NsYCFrECLLdMIRGY906gp
 pNm4tugmWJ5lEV7zh9A==
X-Proofpoint-GUID: Gw1YICh8CY8ZlI1b07su_sENjPUUUysW
X-Authority-Analysis: v=2.4 cv=VcVir1p9 c=1 sm=1 tr=0 ts=6abb3e60 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_PXc0LwuVPefzUNtRYsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Gw1YICh8CY8ZlI1b07su_sENjPUUUysW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfXyY6dJDUt2+8V
 zMtkVKSl3vuuA0geMlSLbuCbxge7/ybnm/WKNbp9CxyPguY6nlbXFd7aOPuIEGOG8wFHPIYMQ4x
 ShsoVVF1/MvXrVm3IESfO9soqUOgILw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290017

Link rate, lane count and VSC SDP support describe capabilities of
the physical DP link rather than an individual panel.

While SST has only one panel per link, MST creates multiple stream
panels sharing the same upstream link. Keeping link capabilities in
struct msm_dp_panel would require each stream panel to maintain a copy
of the same link state, mixing shared link capabilities with per-panel
state.

Move the capabilities to struct msm_dp_link so that SST and MST use
the same link state. Rename link_info to link_caps to distinguish the
link capabilities from link_params used during link training.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  6 +++---
 drivers/gpu/drm/msm/dp/dp_debug.c   |  6 +++---
 drivers/gpu/drm/msm/dp/dp_display.c |  8 ++++----
 drivers/gpu/drm/msm/dp/dp_link.h    |  2 ++
 drivers/gpu/drm/msm/dp/dp_panel.c   | 22 ++++++++++++----------
 drivers/gpu/drm/msm/dp/dp_panel.h   |  2 --
 6 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index d6f39cc3bc66..f1642413e4a3 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1758,7 +1758,7 @@ static int msm_dp_ctrl_link_lane_down_shift(struct msm_dp_ctrl_private *ctrl,
 		return -1;
 
 	ctrl->link->link_params.num_lanes /= 2;
-	ctrl->link->link_params.rate = panel->link_info.rate;
+	ctrl->link->link_params.rate = ctrl->link->link_caps.rate;
 
 	ctrl->link->phy_params.p_level = 0;
 	ctrl->link->phy_params.v_level = 0;
@@ -2556,7 +2556,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
-	rate = panel->link_info.rate;
+	rate = ctrl->link->link_caps.rate;
 	pixel_rate = panel->msm_dp_mode.drm_mode.clock;
 
 	msm_dp_ctrl_core_clk_enable(&ctrl->msm_dp_ctrl);
@@ -2569,7 +2569,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
 	} else {
 		ctrl->link->link_params.rate = rate;
 		ctrl->link->link_params.num_lanes =
-			panel->link_info.num_lanes;
+			ctrl->link->link_caps.num_lanes;
 		if (panel->msm_dp_mode.out_fmt_is_yuv_420)
 			pixel_rate >>= 1;
 	}
diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index cf3838fcd154..22242bebb560 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -38,11 +38,11 @@ static int msm_dp_debug_show(struct seq_file *seq, void *p)
 
 	seq_printf(seq, "\tname = %s\n", DEBUG_NAME);
 	seq_printf(seq, "\tdrm_dp_link\n\t\trate = %u\n",
-			debug->panel->link_info.rate);
+			debug->link->link_caps.rate);
 	seq_printf(seq, "\t\tnum_lanes = %u\n",
-			debug->panel->link_info.num_lanes);
+			debug->link->link_caps.num_lanes);
 	seq_printf(seq, "\t\tcapabilities = %lu\n",
-			debug->panel->link_info.capabilities);
+			debug->link->link_caps.capabilities);
 	seq_printf(seq, "\tdp_panel_info:\n\t\tactive = %dx%d\n",
 			drm_mode->hdisplay,
 			drm_mode->vdisplay);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e322176163e9..f5947233ab96 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -314,7 +314,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	 * set sink to normal operation mode -- D0
 	 * before dpcd read
 	 */
-	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
+	msm_dp_link_psm_config(dp->link, &dp->link->link_caps, false);
 
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
 
@@ -804,7 +804,7 @@ enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
 	}
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
-	link_info = &msm_dp_display->panel->link_info;
+	link_info = &msm_dp_display->link->link_caps;
 
 	is_yuv_420 = drm_mode_is_420_only(&dp->connector->display_info, mode);
 
@@ -812,7 +812,7 @@ enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
 	 * YUV 420 is carried over DP by signalling the colorimetry through a
 	 * VSC SDP, so a 420-only mode cannot be driven without VSC SDP support.
 	 */
-	if (is_yuv_420 && !msm_dp_display->panel->vsc_sdp_supported)
+	if (is_yuv_420 && !msm_dp_display->link->vsc_sdp_supported)
 		return MODE_NO_420;
 
 	link_pclk_khz = is_yuv_420 ? mode_pclk_khz / 2 : mode_pclk_khz;
@@ -1641,7 +1641,7 @@ void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
 
 	/* dongle is still connected but sinks are disconnected */
 	if (dp->link->sink_count == 0)
-		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
+		msm_dp_link_psm_config(dp->link, &dp->link->link_caps, true);
 
 	msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_link.h b/drivers/gpu/drm/msm/dp/dp_link.h
index 76125e9c07e9..80116d5c58be 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.h
+++ b/drivers/gpu/drm/msm/dp/dp_link.h
@@ -75,7 +75,9 @@ struct msm_dp_link {
 	struct msm_dp_link_test_video test_video;
 	struct msm_dp_link_test_audio test_audio;
 	struct msm_dp_link_phy_params phy_params;
+	struct msm_dp_link_info link_caps;
 	struct msm_dp_link_info link_params;
+	bool vsc_sdp_supported;
 
 	u32 lane_map[DP_MAX_NUM_DP_LANES];
 	u32 max_dp_lanes;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index bc7bad5ca3b1..dd650b3dc917 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -193,13 +193,14 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
 	if (rc)
 		return rc;
 
-	msm_dp_panel->vsc_sdp_supported = drm_dp_vsc_sdp_supported(panel->aux, dpcd);
-	link_info = &msm_dp_panel->link_info;
+	link = panel->link;
+	link->vsc_sdp_supported = drm_dp_vsc_sdp_supported(panel->aux, dpcd);
+	link_info = &link->link_caps;
+	memset(link_info, 0, sizeof(*link_info));
 	link_info->revision = dpcd[DP_DPCD_REV];
 	major = (link_info->revision >> 4) & 0x0f;
 	minor = link_info->revision & 0x0f;
 
-	link = panel->link;
 	drm_dbg_dp(panel->drm_dev, "max_lanes=%d max_link_rate=%d\n",
 		   link->max_dp_lanes, link->max_dp_link_rate);
 
@@ -308,13 +309,15 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
 static u32 msm_dp_panel_get_supported_bpp(struct msm_dp_panel *msm_dp_panel,
 		u32 mode_edid_bpp, u32 mode_pclk_khz)
 {
+	struct msm_dp_panel_private *panel =
+		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 	const struct msm_dp_link_info *link_info;
 	const u32 max_supported_bpp = 30, min_supported_bpp = 18;
 	u32 bpp, data_rate_khz;
 
 	bpp = min(mode_edid_bpp, max_supported_bpp);
 
-	link_info = &msm_dp_panel->link_info;
+	link_info = &panel->link->link_caps;
 	data_rate_khz = link_info->num_lanes * link_info->rate * 8;
 
 	do {
@@ -346,12 +349,12 @@ int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel,
 		return rc;
 	}
 
-	bw_code = drm_dp_link_rate_to_bw_code(msm_dp_panel->link_info.rate);
+	bw_code = drm_dp_link_rate_to_bw_code(panel->link->link_caps.rate);
 	if (!is_link_rate_valid(bw_code) ||
-			!is_lane_count_valid(msm_dp_panel->link_info.num_lanes) ||
+			!is_lane_count_valid(panel->link->link_caps.num_lanes) ||
 			(bw_code > msm_dp_panel->max_bw_code)) {
-		DRM_ERROR("Illegal link rate=%d lane=%d\n", msm_dp_panel->link_info.rate,
-				msm_dp_panel->link_info.num_lanes);
+		DRM_ERROR("Illegal link rate=%d lane=%d\n", panel->link->link_caps.rate,
+				panel->link->link_caps.num_lanes);
 		return -EINVAL;
 	}
 
@@ -770,7 +773,7 @@ int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel,
 		!!(adjusted_mode->flags & DRM_MODE_FLAG_NHSYNC);
 	msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 =
 		drm_mode_is_420_only(&msm_dp_panel->connector->display_info, adjusted_mode) &&
-		msm_dp_panel->vsc_sdp_supported;
+		panel->link->vsc_sdp_supported;
 
 	drm_mode = &msm_dp_panel->msm_dp_mode.drm_mode;
 
@@ -837,4 +840,3 @@ struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux
 
 	return msm_dp_panel;
 }
-
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 04938b9d2091..59136264166f 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -41,12 +41,10 @@ struct msm_dp_panel {
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 	u8 downstream_ports[DP_MAX_DOWNSTREAM_PORTS];
 
-	struct msm_dp_link_info link_info;
 	struct drm_connector *connector;
 	struct msm_dp_display_mode msm_dp_mode;
 	struct msm_dp_panel_psr psr_cap;
 	bool video_test;
-	bool vsc_sdp_supported;
 	u32 hw_revision;
 
 	enum msm_dp_stream_id stream_id;

-- 
2.43.0

