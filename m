Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FFE3D3327
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792209935; cv=none; b=hDKzrYowq5+lHVkDz6kEtEmJbfq7WLRVWB0m5jEVcczsS77BA8wk/n2iLtgER06gXsBZTLukmRr0obid/1lENAvFsiBJ1m+C5vgNd4CyaRpJ63fb9vGERsWNzjS0LZIuOaPWzNo6f2fisxIVhBB1TQq5D8u7GH47Hot02kKHJgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792209935; c=relaxed/simple;
	bh=ZGB3BMtazrQQ6MMTIvyMgUHSYUWyrXV8YqQ6fJ8K0eI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ujCOZAbWPSYs/d/NrdsOhD2RlQn5U3wYmho3nWoyQlMMpzHOd0px/zcOWOQFZjxIzuYftFbDL9zeolo5CGlG3Giqgp/O64pPWfVWQNX/bfN6WceUJ73MaY4J59/QUnHuPvBlZDtuZVbzRwt7N7gLsm3rM9DSQkNtpJFZYDQ2/CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J1l6r2Rn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ol7GDRfK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J1l6r2Rn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ol7GDRfK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H30aMk2625067
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jdsJ2ls6q39LpTyv1PA55j1F9Xs1I+m6tBh
	o/hxXmlQ=; b=J1l6r2Rnqxxnvp587RwFzhBsBVYMraYxLH2TJjuxA7xrwNC7Gjh
	G8qRafyr2VSoZD3v81Ne6BvRLgT2RDF1OjA1Rfw53Wm1ejRTZwbIyGymsYuzh+/3
	BiRkb6HJt0LWDgk3e+qXmwheirDK3ygAR6ltf2MxE9CvwxEd25cWNJ0Sn/Lo6rsX
	tuv+NZeSHb90SvT86yCg93pipNP6uvnEUkoLXfW5ObNixB8RlL5DpmXcmGaEVJWW
	ZpB/+/qM48PLgjaKZLfmNc+eb/P4la1JwpaHI0jrJUo52imUWnxpEnMbkjh8e8oF
	LM61jXptLEZuxzln8Wa1blPoetkKDD2FTZg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbcjtcn5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:05:32 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35fb6be0f9fso1350578eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792209932; x=1792814732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jdsJ2ls6q39LpTyv1PA55j1F9Xs1I+m6tBho/hxXmlQ=;
        b=Ol7GDRfKAy81Q/uqlU9J7YzDTUA+nXojQOgzQaISH48TZb6dfyeCXT6gUBEDRs8Jb/
         p1O5dwQh+L10ZA1Uea+UCJ55YkrLoGlHQK/5g49fq09R/1DN+ZohQM2uw5EwuSiODS/Q
         DHVBkx7pO2dQzydgfr+1DEwosMieqVd+DklC3zD+RCBblRUGT4m2atM0r3cgEZxl3LrU
         PL3BsTQ4g5u0t2wlASNCa1D7IHqS0g7M0mRA8Bxw4dgWHCdCcafOUaZsLPHLUq5oO1Ac
         kI1g1XbWCuVBYtXfe/204It4qyO6ChNv4PWJzifZDMdgXh+hhQq8T2l7hptoNbUsmQMl
         tLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792209932; x=1792814732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jdsJ2ls6q39LpTyv1PA55j1F9Xs1I+m6tBho/hxXmlQ=;
        b=0aV7DDQLoWvyFxyeZ0HXtwADwtMM/2k0nlSRRf66DS7s4y1ymPByql0dUBv6oA1nTU
         aRnTUjCDy4wDMyKLKKucZ5WB9ejZm0ypvGnw0+WW5FFvTE0USWqNkPKW2npQa7NytUlD
         +dPC8JBWF6hqnuXHVOeAk7nynPWykvPnxGMQsEDMDsGLa2/0E3k072rtL3v6pkdgSBjQ
         56DFoc1PyQmb9PuHsgbS32Rh/3J3AwC0mi+K6SZgH/sWX+FqUJ6vlW9FazN1ikmNyuYH
         9d8BD+XUfur9tIswKuFU8cr8AKPMOwjT86W/6Xcku5H0Ws4N9Ut8TqEQvCTcQ51witi7
         Z/bg==
X-Forwarded-Encrypted: i=1; AKwUvBw50LBAztGi7gzyj0SvYHsfUrXjjAj0err9uauc0rlcrTvRdS1tKDwHLgsbI/Z2raAtt5nybPQayy9mR7Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIua+kmj5+wAzpYWkmTNsDUS9QHdWjqggCdROH2R5CB+GxuFBp7
	CLLNrzVCAI0/PpjtqfqxEvQ2KEzpyG/F/4Owcox1q2LXwM5fdhl2nlAMCC7EfTf9a/wMGdBfuRo
	o2TvAe5yYxwrgZeJcQyIR3A+5GcaNUVatZ29TSA4iJadVcLnx3bgp9LFCATsRQyyFXWA=
X-Gm-Gg: AYBFou3JUtrZYSIM9Jpu0e82xHMrpkk2AxNQo3uMeWd4BRPhbgtfjx62fMol/ZNmy91
	P4LVm+N+ifo1tbilrafKu28zPU7GonLSmOt3PAY5XcagUlCn2+RaS7cKY0ayf4UnzhqkovE0u6H
	0CSVMKvE1avKDOd8QeA+VTF10Fj0H7RdBg1hRaiD12xyX8F9kGX9B2rh84UbWgu2DhmjoTEfda6
	Lx6an251O/nnSsTD4lG9OWgXmDHJqpaGnLEL0j3YAuwRE7UtoBUw5jDi84NUaWzpmGvSe7Ywdw0
	bi2/zw5MIXyuVYIbs+VUopx4+Ce3CjNDt/mF+ySwq1mlMGDC6+HBgs5j+QSmy87haDbsWM5dVhz
	tWt450Csu4MhDYCGIwgH9luT4P8JJhDH3zWqa19NFrgVPQmuP95/yZg==
X-Received: by 2002:a05:693c:87c2:10b0:34b:4b99:24ab with SMTP id 5a478bee46e88-361a1e501fbmr2738823eec.22.1792209931561;
        Fri, 16 Oct 2026 21:05:31 -0700 (PDT)
X-Received: by 2002:a05:693c:87c2:10b0:34b:4b99:24ab with SMTP id 5a478bee46e88-361a1e501fbmr2738791eec.22.1792209931045;
        Fri, 16 Oct 2026 21:05:31 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608297f4f7sm11190385eec.23.2026.10.16.21.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:05:30 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: david@ixit.cz, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bod@kernel.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        bryan.odonoghue@linaro.org, linux-media@vger.kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, daniel@quora.org,
        konrad.dybcio@oss.qualcomm.com, christopher.obbard@linaro.org,
        alex.vinarskis@gmail.com
Subject: [PATCH] media: qcom: camss: configure C-PHY in the new csiphy_stream_on()
Date: Fri, 16 Oct 2026 21:05:29 -0700
Message-Id: <20261017040529.3832120-1-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxNiBTYWx0ZWRfX/B5LWEk6k68o
 x0544QA8qGIt7XZH8we1e4pala+msIddeoOBCxZHPZZEcGGkPTN+iBNsfg/OIw0ktTrHJ1nDKoG
 ffdUCFFVb21QvT/f9qrgVjCLa7XsU8w2QMzSgu9ecbQLfNemB3YVQZXlo9PYzcK+3ayA2EeUxcU
 jvlgR6s7SlXQRQGa+gtoXXCud19iTjqtpLM7p+PCQgUn7adtrHBzbKgsE620bNNFV61I/bsJQA1
 P3TNyJBBFOAiQRoS5bylTRAVJwnLdtnHHZUdiXBQ3LEBUxQgAj3EOIZ3Sqw1Lb4wtO54IYXvZ1C
 wUDpO7SxP8b+hYZyTP+K3/m4PSvYwcx9h8WZBRmX5CCY/8SL98FLQjmqmF8U3RoaghaFANEQ78I
 cVe92Ut2rlKU3s0Gar7anOZIpka2ZzUmYMifIJUippLlwi56vO5Yx9Zd1wzyPG9KP9Ow+tU1LXd
 90cnQi3um47S0zdnsIw==
X-Proofpoint-ORIG-GUID: CD_sB-nxcNmjmsxV4Ni9mXUf89aCDuli
X-Proofpoint-GUID: CD_sB-nxcNmjmsxV4Ni9mXUf89aCDuli
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxNiBTYWx0ZWRfX8DvVzJEkeZln
 0QfMFgO13p/wnvcwylWYTLXCItSDMSAp25sum9tmwER9I5nQpEG2W1RPsF79W/PV8Phda3GHwYm
 qN+gIrEghblrsaS4fxzpe/VdATGNYJM=
X-Authority-Analysis: v=2.4 cv=VpS2kO2n c=1 sm=1 tr=0 ts=6ad2f40c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Jz9lr0wY845TKGJsqGYA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170016

The new (non-legacy) csiphy_stream_on() introduced by the PHY API
devices support only built a MIPI D-PHY configuration and
unconditionally called phy_set_mode(PHY_MODE_MIPI_DPHY). For a C-PHY
sensor this makes phy_configure() dispatch to the C-PHY handler with a
D-PHY opts union, which fails validation.

Branch on the recorded PHY type: for C-PHY build the opts via
phy_mipi_cphy_get_default_config_for_hsclk(), populate the per-trio
lane positions and polarities and select PHY_MODE_MIPI_CPHY; 
keep the existing D-PHY path otherwise. The shared
phy_configure()/phy_power_on() tail handles both.

Depends-on: https://lore.kernel.org/all/20261017035221.3816464-1-anusha.nandi@oss.qualcomm.com/

Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csiphy.c  | 61 +++++++++++++------
 1 file changed, 43 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 60d58becc7c5..5ee07b969005 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -329,16 +329,15 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
 	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
 				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
 	struct csiphy_lanes_cfg *lncfg = &csiphy->cfg.csi2->lane_cfg;
-	struct phy_configure_opts_mipi_dphy *dphy_cfg;
-	union phy_configure_opts dphy_opts = { 0 };
+	union phy_configure_opts phy_opts = { 0 };
 	struct device *dev = csiphy->camss->dev;
 	u8 num_lanes = lncfg->num_data;
+	const bool cphy = (lncfg->phy_cfg == V4L2_MBUS_CSI2_CPHY);
 	s64 link_freq;
+	int i;
 	int ret;
 
-	dphy_cfg = &dphy_opts.mipi_dphy;
-
-	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes, false);
+	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes, cphy);
 
 	if (link_freq <= 0) {
 		dev_err(dev,
@@ -346,23 +345,49 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
 		return -EINVAL;
 	}
 
-	ret = phy_mipi_dphy_get_default_config_for_hsclk(link_freq, num_lanes,
-							 dphy_cfg);
-	if (ret < 0) {
-		dev_err(dev, "Invalid config for link frequency %lld\n",
-			link_freq);
-		return ret;
-	}
+	if (cphy) {
+		struct phy_configure_opts_mipi_cphy *cphy_cfg = &phy_opts.mipi_cphy;
 
-	ret = phy_set_mode(csiphy->phy, PHY_MODE_MIPI_DPHY);
-	if (ret) {
-		dev_err(dev, "Failed to set phy mode\n");
-		return ret;
+		ret = phy_mipi_cphy_get_default_config_for_hsclk(link_freq, num_lanes,
+								 cphy_cfg);
+		if (ret < 0) {
+			dev_err(dev, "Invalid config for link frequency %lld\n",
+				link_freq);
+			return ret;
+		}
+
+		/* Set data trio lane positions and polarities (no clock lane) */
+		for (i = 0; i < num_lanes; i++) {
+			cphy_cfg->lane_positions[i] = lncfg->data[i].pos;
+			cphy_cfg->lane_polarities[i] = lncfg->data[i].pol;
+		}
+
+		ret = phy_set_mode(csiphy->phy, PHY_MODE_MIPI_CPHY);
+		if (ret) {
+			dev_err(dev, "Failed to set phy mode\n");
+			return ret;
+		}
+	} else {
+		struct phy_configure_opts_mipi_dphy *dphy_cfg = &phy_opts.mipi_dphy;
+
+		ret = phy_mipi_dphy_get_default_config_for_hsclk(link_freq, num_lanes,
+								 dphy_cfg);
+		if (ret < 0) {
+			dev_err(dev, "Invalid config for link frequency %lld\n",
+				link_freq);
+			return ret;
+		}
+
+		ret = phy_set_mode(csiphy->phy, PHY_MODE_MIPI_DPHY);
+		if (ret) {
+			dev_err(dev, "Failed to set phy mode\n");
+			return ret;
+		}
 	}
 
-	ret = phy_configure(csiphy->phy, &dphy_opts);
+	ret = phy_configure(csiphy->phy, &phy_opts);
 	if (ret) {
-		dev_err(dev, "failed to configure MIPI D-PHY\n");
+		dev_err(dev, "failed to configure MIPI %s\n", cphy ? "C-PHY" : "D-PHY");
 		goto error;
 	}

--  
Best regards,
-- 
Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
-- 
2.34.1

