Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A9E3BE636
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792257217; cv=none; b=cwqBYVKoRFKQKVLyZjlGP5OjkBUNN3u8Alqa46e6XbtkLsgzamkEbtu8pwd+eeiYEp6rj8EDAlQfIQ5+22ndt2xNgAo8qxaXjPh2Vv8VRTbk/eRKnUdPG8+81mkGVvoAWdFgcbCnUPwfTm60Q7qmhJCwIdq3TJ6m787Kp5Bf8bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792257217; c=relaxed/simple;
	bh=mrZCKxlte38Z4rcqmMXHQzBjM3D3yZZPZyfosetq8XQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ixSJF0IXziFo4+/G1yTUahlxorvbo3ytlqtBtQMtU2x7jn7izQoD93eJNDNckw5PDfCuWukBLP2+GJaONacm+bqiO7LAA3r1uQX9srr9UhIUtvaU0Aa0twkg9NDjn9j/vAHrftvz0aw1m+ElM0hnFZxiuJnuUMURqGccpAHXEI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R4zYrXE8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JspZbr8C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R4zYrXE8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JspZbr8C"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HGA1Pj2534031
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Z3ZvBV6x0VOlnroXPGGo486t6fpn5GiWYT9/m40b3A=; b=R4zYrXE83RY9Fix9
	fA73EVqgzUDxLBIHWC/orHTIPnAchkCm8Nl100i5RfR8arMYr6+oIR0GDD/o68it
	WgQlQGcyIXYs6J549pYHl8QVDDG0FtlOP+FdHvzE8LE9GVfgPVXvopEGHyf56l19
	y8DQHapbkD616934dHj4LHkmx8rTSDZGj4LlioA03BWJe2/uTRlytEZSp5MvcmPk
	FZ9M8c+OFCgK5tVndXWRYeze9OaP2H8Q6l5BAXrI+c+nWem1Zs8SUgdWImNm1d1R
	nAwM04ye5HHzTp43BnBzZ9Uv94WvSXM/ltOouGXiIc5XzC5BlqRjHlDiA1JA6bEx
	51miBw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbyys1j8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:13:35 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1595306eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792257215; x=1792862015; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Z3ZvBV6x0VOlnroXPGGo486t6fpn5GiWYT9/m40b3A=;
        b=JspZbr8CA3IID2+Ehi9/xSZw1ecEShup6ifxzRSI0a6k2j9263sPp12eAvBERpjl69
         LLsca18kDeuE3SX09tWrQr8vuxqVlEYglYwk6VKAJUfUftUMB8qOKw1jKI+Nj/LhrjoR
         7DRujCXpu6fZkJS1q+Q7wyBpmXikpTdtNDOBCcGbpXzL0moIY9v9c/xy7jzHiHp13eNo
         dp2RrzAQ4c9j9zFU/T0xFS43LjRa7YnylfFacNoM86v322I58liJOQbyx7jiwgo5bTKJ
         P35C2xVjFGEm8/FCFZ6DNQ5q4yUkeeWKDhsPP961stSU9V1nmI0gmzOobdTN/5asemD3
         CA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792257215; x=1792862015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Z3ZvBV6x0VOlnroXPGGo486t6fpn5GiWYT9/m40b3A=;
        b=c9fWHDoBz8dyn/93uqASL+q/yzkZqxAgWSUBaqbl2u1e+Tsr3R33vZa1YpNRrpp3B9
         mFmhspWvWinpQeaXpOARzvmR0nLBz2aVtCatDQvQzo/PY+943sDDc/aPDFGhcOawOSzc
         T/FP9CRwE6auhHsfxu3fbYZu0GdtWov/sPCq+E4g8hMpu3qOkkdoEPqIq2Xar25MAThO
         8O/uIGgnVhcA3ixEQlgOvp2dJNXaffGHsZ+PoEpBBAWi17QqInbhXM+9VrQpqeXe7jd1
         N7aNKix9unYQV6vOEg6bl0DF21RHq1edm6wkY4hVI6vwv+Zsg134QKEqcAHFV0VzWTfX
         IPDg==
X-Forwarded-Encrypted: i=1; AKwUvBwlCNSr2g6dC9DLzN0eEfkTwotbSHhMozBWH4r4RPdN70VwhYRlspaX8/DucCvSjFJyQ3aZ1GRinW3BaIE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQuPPF657xWZ7MGjZSEdUcuSvribSyrCbcGcXNFUo/JsmWwGUa
	WiW+ZM1At5+w2duAXrlsEXXpok5VsHbdChfIsqUFNOv/OuD0R2wc9egUQkqogRt3skO38yrH/nx
	UL4tK1fOggL8s91V2ztkcerwC/UM33XIVCCfZZi9XlhG3hww0nBuG/Hn5+wlgNpMXYEep2BYNcc
	E=
X-Gm-Gg: AYBFou3o1fdxYwniEWey+CC991CEcw0VWCI5UYVlPHbGx9PqRoA2InVgW9oR5mqZywM
	tSr/HRP5yTXDF2tICm5nle97aBTTIF1y03UMyEf6YhbIjNH/uANIH/cGW76wGlq1WTqHHDr13ws
	ywrxsWfc2eunG/eaGQkmemE1BwdLx+LyIjsrkPKr7uzAvrq037IgQXuEm4JU2UHJrqKXlUxVa69
	hC2TBIoT7iGyLUb9dh++drvVmnfC9c6RZF7XaV9xH6WN9JdmUqUMPuCy/Q1l0cdl6kVS0HoZzTi
	Ip8QZq7ZH7gOTfsNrPNSftaSG81NC/YRaI4u9QIrJKEF6i1iU4KQzEXA5MnkNe3oSxpRg/hC0dq
	8NpaY+gQKTQUYZFPP88AlBBb4lBNYtw==
X-Received: by 2002:a05:693c:4152:20b0:34e:c001:1486 with SMTP id 5a478bee46e88-361a0b97ba9mr4942446eec.8.1792257214691;
        Sat, 17 Oct 2026 10:13:34 -0700 (PDT)
X-Received: by 2002:a05:693c:4152:20b0:34e:c001:1486 with SMTP id 5a478bee46e88-361a0b97ba9mr4942403eec.8.1792257214089;
        Sat, 17 Oct 2026 10:13:34 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6e33sm17893966eec.7.2026.10.17.10.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 10:13:33 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 22:43:09 +0530
Subject: [PATCH RFC 2/6] media: qcom: camss: Add C-PHY timing fields and
 get config from sensor
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-cphy_support-v1-2-8b0e1237ce95@oss.qualcomm.com>
References: <20261017-cphy_support-v1-0-8b0e1237ce95@oss.qualcomm.com>
In-Reply-To: <20261017-cphy_support-v1-0-8b0e1237ce95@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792257199; l=7527;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=mrZCKxlte38Z4rcqmMXHQzBjM3D3yZZPZyfosetq8XQ=;
 b=6NvCfR2a9ykAq97/zA6GxRlSk5qkrwG6FIm1ek8W4OHQN0FdcoevVBk4dlCDYuhJESINgJ2R2
 QdFFTCo+CKDCmVAmYTdjWR4M/Zye/jXNCEEvZiDqywaWX4LaA1jn5z4
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2OCBTYWx0ZWRfX/SmMDDN1Y/V2
 NRkb1xu5MCOHG6TQM5xi8YvrQM7Mqv9MiRU2WdOL92frpY6592c12E3VKYppI92RVdk0f6F4gDn
 L3laqAP4m6JlI6JfTzHkfYuIg/p/0BK4ACZx5CwkfAOemq981mwj7+KLI6Ns4qC3TReL3ZfiTpY
 rS1h9rjqeVouGAfauYmq30GaMpsUsx1e0JU/kbw77QLTaZCfFDhXfi1ocxwrlylkrldqWV0UIVm
 +kLXP8dDEM9rB/X7s+EDRpATDBl6wVol021xYhwJ9vOwmIUpbi/uFGCo1U2/pudPesDW5SW5yzn
 6GTdYPfbtg/L1GKFIII/nAKHO/jGxgSyJi19NS5tuWWOWbgl4FCAYv4+xUzltvQKZmBWtJW106t
 mY/ol945/JxXspyOlPolSNEaIVneizKsXjn8ktlnBkpM54uMosb/cCAKqiCQWdVAs7Mv5gwDTqE
 8a8IjnepYvtFdJb+8xw==
X-Authority-Analysis: v=2.4 cv=W4WtxhWk c=1 sm=1 tr=0 ts=6ad3acbf cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=uwparDF5YPYKf_HLZKMA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 8p7Pb0l6t--5XkCdQEaiWwx3SJDb5moS
X-Proofpoint-GUID: 8p7Pb0l6t--5XkCdQEaiWwx3SJDb5moS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2OCBTYWx0ZWRfX0rEwoxNlCdFe
 09yJ5q/v1S/FBo4LWuwdrpAS8jwcHEOC/Rm8T2ob6hOudZOQigoHNHmZfPkCDCaiv7rNssiZtZR
 8dhDd5Cao4HmpKCpLJSUbwcceP52SR4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170068

C-PHY settle count is derived from the T_PREPARE and T_PREAMBLE link
timing parameters reported by the transmitter. Add C-PHY prepare and
preamble timing fields to the CSI-2 media bus configuration.

The endpoint bus type already describes whether the connected CSI-2 link
uses D-PHY or C-PHY.

Accept C-PHY endpoints, store the parsed CSI-2 PHY type and query the
remote sensor media bus configuration for C-PHY links. Pass the reported
link frequency and timing to the generic PHY while keeping the existing
D-PHY fallback path.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csiphy.c | 90 +++++++++++++++++++-----
 drivers/media/platform/qcom/camss/camss-csiphy.h |  2 +
 drivers/media/platform/qcom/camss/camss.c        |  8 +--
 include/media/v4l2-mediabus.h                    |  2 +
 4 files changed, 79 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index f99eea2ef2289cbee404808348c06968350dc4ac..ed2318d76987d6a9ae7e185d00e258d49d0c79a4 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -313,6 +313,29 @@ static void csiphy_stream_off_legacy(struct csiphy_device *csiphy)
 	csiphy->res->hw_ops->lanes_disable(csiphy, &csiphy->cfg);
 }
 
+static int csiphy_get_remote_mbus_config(struct csiphy_device *csiphy,
+					 struct v4l2_mbus_config *cfg)
+{
+	struct media_pad *remote;
+	struct v4l2_subdev *remote_sd;
+	int ret;
+
+	remote = media_pad_remote_pad_first(&csiphy->pads[MSM_CSIPHY_PAD_SINK]);
+	if (!remote)
+		return -ENOLINK;
+
+	remote_sd = media_entity_to_v4l2_subdev(remote->entity);
+	if (!remote_sd)
+		return -EINVAL;
+
+	memset(cfg, 0, sizeof(*cfg));
+	ret = v4l2_subdev_call(remote_sd, pad, get_mbus_config,
+			      remote->index, cfg);
+	if (ret == -ENOIOCTLCMD)
+		return -EOPNOTSUPP;
+
+	return ret;
+}
 /*
  * csiphy_stream_on - Enable streaming on CSIPHY module
  * @csiphy: CSIPHY device
@@ -324,43 +347,74 @@ static void csiphy_stream_off_legacy(struct csiphy_device *csiphy)
  */
 static int csiphy_stream_on(struct csiphy_device *csiphy)
 {
+	struct v4l2_mbus_config mbus_cfg = { };
 	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
 				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
 	struct csiphy_lanes_cfg *lncfg = &csiphy->cfg.csi2->lane_cfg;
-	struct phy_configure_opts_mipi_dphy *dphy_cfg;
-	union phy_configure_opts dphy_opts = { 0 };
+	union phy_configure_opts opts = { 0 };
+	enum phy_mode mode = PHY_MODE_INVALID;
 	struct device *dev = csiphy->camss->dev;
 	u8 num_lanes = lncfg->num_data;
 	s64 link_freq;
 	int ret;
 
-	dphy_cfg = &dphy_opts.mipi_dphy;
-
-	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
+	ret = csiphy_get_remote_mbus_config(csiphy, &mbus_cfg);
+	if (ret && ret != -EOPNOTSUPP)
+		return ret;
 
-	if (link_freq <= 0) {
-		dev_err(dev,
-			"Cannot get CSI2 transmitter's link frequency\n");
-		return -EINVAL;
+	if (ret == -EOPNOTSUPP && lncfg->phy_type == V4L2_MBUS_CSI2_CPHY) {
+		dev_err(dev, "C-PHY transmitter does not report media bus configuration\n");
+		return ret;
 	}
 
-	ret = phy_mipi_dphy_get_default_config_for_hsclk(link_freq, num_lanes,
-							 dphy_cfg);
-	if (ret < 0) {
-		dev_err(dev, "Invalid config for link frequency %lld\n",
-			link_freq);
-		return ret;
+	if (!ret && mbus_cfg.type == V4L2_MBUS_CSI2_CPHY) {
+		struct phy_configure_opts_mipi_cphy *cphy = &opts.mipi_cphy;
+
+		link_freq = mbus_cfg.link_freq;
+		if (link_freq <= 0) {
+			dev_err(dev,
+				"Cannot get CSI2 transmitter's link frequency\n");
+			return -EINVAL;
+		}
+
+		cphy->symbol_rate = link_freq * 2;
+		cphy->trios = num_lanes;
+		cphy->t_prepare_ns = mbus_cfg.bus.mipi_csi2.t_prepare_ns;
+		cphy->t_preamble_ns = mbus_cfg.bus.mipi_csi2.t_preamble_ns;
+
+		mode = PHY_MODE_MIPI_CPHY;
+	} else if (ret || mbus_cfg.type == V4L2_MBUS_CSI2_DPHY) {
+		struct phy_configure_opts_mipi_dphy *dphy = &opts.mipi_dphy;
+
+		link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
+		if (link_freq <= 0) {
+			dev_err(dev,
+				"Cannot get CSI2 transmitter's link frequency\n");
+			return -EINVAL;
+		}
+
+		ret = phy_mipi_dphy_get_default_config_for_hsclk(link_freq, num_lanes,
+								dphy);
+		if (ret < 0) {
+			dev_err(dev, "Invalid config for link frequency %lld\n",
+				link_freq);
+			return ret;
+		}
+		mode = PHY_MODE_MIPI_DPHY;
+	} else {
+		dev_err(dev, "Unsupported mbus type %u\n", mbus_cfg.type);
+		return -EINVAL;
 	}
 
-	ret = phy_set_mode(csiphy->phy, PHY_MODE_MIPI_DPHY);
+	ret = phy_set_mode(csiphy->phy, mode);
 	if (ret) {
 		dev_err(dev, "Failed to set phy mode\n");
 		return ret;
 	}
 
-	ret = phy_configure(csiphy->phy, &dphy_opts);
+	ret = phy_configure(csiphy->phy, &opts);
 	if (ret) {
-		dev_err(dev, "failed to configure MIPI D-PHY\n");
+		dev_err(dev, "failed to configure MIPI CSI-2 PHY\n");
 		goto error;
 	}
 
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 8c3319f2ca1cfdef4c0185deed2805854ac81703..a13cfaf3796106d421c8d711308d3fb3fb9259a8 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -35,11 +35,13 @@ struct csiphy_lane {
  * @num_data: number of data lanes
  * @data:     data lanes configuration
  * @clk:      clock lane configuration (only for D-PHY)
+ * @phy_type: CSI-2 PHY bus type
  */
 struct csiphy_lanes_cfg {
 	int num_data;
 	struct csiphy_lane *data;
 	struct csiphy_lane clk;
+	enum v4l2_mbus_type phy_type;
 };
 
 struct csiphy_csi2_cfg {
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93a8a98fc6a20fdb8e0f9f8e61bc41058..f61a9c242ef46f968ecc22dddd16a2e96465ca65 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4694,11 +4694,8 @@ static int camss_parse_endpoint_node(struct device *dev,
 	if (ret)
 		return ret;
 
-	/*
-	 * Most SoCs support both D-PHY and C-PHY standards, but currently only
-	 * D-PHY is supported in the driver.
-	 */
-	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY) {
+	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY &&
+	    vep.bus_type != V4L2_MBUS_CSI2_CPHY) {
 		dev_err(dev, "Unsupported bus type %d\n", vep.bus_type);
 		return -EINVAL;
 	}
@@ -4706,6 +4703,7 @@ static int camss_parse_endpoint_node(struct device *dev,
 	csd->interface.csiphy_id = vep.base.port;
 
 	mipi_csi2 = &vep.bus.mipi_csi2;
+	lncfg->phy_type = vep.bus_type;
 	lncfg->clk.pos = mipi_csi2->clock_lane;
 	lncfg->clk.pol = mipi_csi2->lane_polarities[0];
 	lncfg->num_data = mipi_csi2->num_data_lanes;
diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
index 24c738cd78940fa7f6118d78595fe221689a39e7..42543ec98a839567c21485d3e97f875b8a081100 100644
--- a/include/media/v4l2-mediabus.h
+++ b/include/media/v4l2-mediabus.h
@@ -109,6 +109,8 @@ struct v4l2_mbus_config_mipi_csi2 {
 	unsigned char num_data_lanes;
 	bool lane_polarities[1 + V4L2_MBUS_CSI2_MAX_DATA_LANES];
 	enum v4l2_mbus_csi2_cphy_line_orders_type line_orders[V4L2_MBUS_CSI2_MAX_DATA_LANES];
+	u32 t_prepare_ns;
+	u32 t_preamble_ns;
 };
 
 /**

-- 
2.34.1

