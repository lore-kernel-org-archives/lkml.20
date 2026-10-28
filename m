Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793183973;
	b=qCUZRf0UwFXokaC7SspKsZ5LNoNOe8cK5t0PvXe6Y6OuFVo7iXOGIabu22MD1SDTrrMk
	 h3nTeL9+JC/V67gVj4STLdZHZ6gUXGp0TB0cqS252cuFbNZCibYS2Ea3RIJRb1oJKOpWe
	 GnyT6tLthABKv2OdTkzu5AA9oyMxFaJsUZKcHHJtdd9Td6UADhx2ycONzN5ROPwQJE/Fs
	 ojMCyhGTwjBcUOD2BH2kCDybFJlgslZg/7ya9ltk+HgCxY/38NFT0CVeGThFNpC/5cG4A
	 SyqKz0z6IrZT2+g/Bi931eCfnkArZiuaWCSsZ7EXt2zPQjD4WFHoXCZk2yPWWTtTeaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793183973;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sa3455GO92UVU2gr4OcaS3igM6dxF+tEL6zEH6pm9fM=;
	b=LplhVyD9MJ2/AA/tor7p2enZgG33jsw2NysCRH6/Ra/CFgyOv9XyKOvf3QZt0EDnHx1x
	 qOInCbVH9mG8ZBpt0tVTzpxViuOCa/eOVxK/xMcogDrbHRGJBsO2OMzNUElX9sVzCUdky
	 wMA4BQ9SimS+Xj1gVCCHD6EvhzS+uXWh4DEjm/ytb1DZEv+54FUqQPTwLLuQ7rjU43J9C
	 VXyjs/wM5M7uMrOgYhqLhbaDGlKsITBZXAiHWggX6LuZXAC6x9+5TNrNqe/hLjnbw2QqP
	 8gHO8XDnXgRrLFUMK4y2hHJdVRjXq+glVfjhYHcBeAWvB8B0TolhOF4n4y5/+esDt5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ochpRf0V;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SD32Vonj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA58606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:39:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EA58606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ochpRf0V;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SD32Vonj
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K8Lg253383
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sa3455GO92UVU2gr4OcaS3igM6dxF+tEL6zEH6pm9fM=; b=ochpRf0V6xv8E7h9
	eCDUcixBlb8u/JkHdOENgGKHpJgt/04OW9QHBq6DjWZ2ZmrkL966xzhmYyTAxKX8
	lS2Qa4DphMCizgYmfEsFFYL5gMyzOExOxVClwH3ogQjljnY7oRCYd/G8rGZgkfMp
	7y6VQMT/EbFlcxfL8Wh9ia0GleoqBqqTeflFpuTjXQWxl1UgrxJZcwnZtphjZW/n
	8rixYVdyDGEakN98CO+W7sylop7V12E/jdYLdmQSgt+Dt+xdvYIYd06RnIE7wl0f
	F/mXI0nbMFR6TAEuJah4+dvzZ/ZBEBO98nxH3B8/qO+Ii44FX12TPMhiy5slh9vP
	1szC9A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be21dg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:39:31 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36998507c13so1380860eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793183970; x=1793788770; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sa3455GO92UVU2gr4OcaS3igM6dxF+tEL6zEH6pm9fM=;
        b=SD32VonjfdWJhj13jHs9Pc1QgJg8K9+GfWUjJS5ee/gICGAZyvMI7sopXmXdvV3hWd
         3PbkpgpJCEz1Y9ZpLb75H4DT457nuvBvw2+3TYyH08CchVw0gx8BTM9kN7CpZEP05UVy
         b4dXHX2Luj6inTEecCxX69JWhDcovO4ZHr9ssyqnWPlNyfsmihB4HVVx4hguW30SNujQ
         7d1NbR/vojVDhVlz5pqCKfbhK7GRADEkmmFDPiZNnkgfw0gbvR7vlgLdTVSvDd7VA842
         iZGjjYuvzbIzc/dEaHnwOzD/wlIoY10ryq2n8SVDwvkRBTB2sFyskXH+AyhcCcfcWhdz
         DCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793183970; x=1793788770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sa3455GO92UVU2gr4OcaS3igM6dxF+tEL6zEH6pm9fM=;
        b=EEpOaj0Lc+Ug8kUk/7o2Jcgu4Vuy6ryQaBQe11sJ73IDR1L4MxolDUNB3cqIauZYz0
         yEyClEvebzq5XViKU+7s/Wl9BTVIr5tMcFtpD3ksjIgsjSpxA/yZAAxo2KRRoh8vcK4i
         fJ3esbwpzU7dkxOCC/rGWxLbTwJxEwJKF0BnCJrZVoIP7ec9Sm8X/mTmmr0LS9QXCihk
         8WoLPkHtUq1k1X/CaNl0Xa9rx+CDjCizPB5M9FO6FqIluC5f1MLmR+yEFeYjuQnRKJug
         QtD2j/oLF3nh7vRZdgqV2KU9eclSIz00lC5YsriB8PmkVWppk4bKcGZ9GYMDfKL0PefR
         0luQ==
X-Forwarded-Encrypted: i=1; AKwUvBxO1sIHLfhRl3Qaw/GstVnUkXhI8R4NOCkeL2TuaMng1xUAL7kM/KGcHnSbc2b7Rxu6hmoLtJQkCwSvLhM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTSO3fzPuxuqFLWvIu+lQMecm2Qi15kxwvplWvSxF104H159zP
	v1lEkjjhzKy4VK1zdeu7Y1CqWTG52gJNsEd/w8eIoPi35t+/PD9FR3BK0qokkT3xsHsSLhun+PO
	N6EwFwev8eQYprS1sar9P4ucFoprIKYmtctIiuGxLuP2DwywvaROwRRRbuctsCFQzyh0=
X-Gm-Gg: AYBFou3AHIzcFU9WIo0if1bbo7fAWXsBtc9jt8MGTvAa/VPMz6ss/DQ6oahbnrPA5fl
	w+aispW05HDVCycD0rae8aw7is81TbdgUDD8nh1hi2TQ7+laEZIl1/jHjOTbh1SxyO0jpi5JmoN
	DAu8YGd+rtQar+dH92s+XehlE+AdV0Cd1wk/48Mpq1Nrelk5us0vmUnBb2wGHdQ2V0ithXhK/uh
	fHQU9a5mspXlQ/gyE7PsysCsjG5jpRSV5v1UaqTbhMdjIOYdjk0ylE+MwU1nOM4dufi7XaTaBXl
	dpjsUSbR/Jhk3w+hKh80e5cwUiiOnCne3LMJbcCut1PQzqUXUIM5ToBF7p5c4NhxfX6G6aixHJU
	Fh4VBXAJdnShAVHrL6VIMr0WEMXXbWlyPNVxO9chLTWWzL6bExnc0vD0NZxK6M1gUXge4fzosCe
	k=
X-Received: by 2002:a05:7022:ed01:b0:15e:6541:3099 with SMTP id a92af1059eb24-1a6ce01d3afmr2759407c88.7.1793183970013;
        Wed, 28 Oct 2026 03:39:30 -0700 (PDT)
X-Received: by 2002:a05:7022:ed01:b0:15e:6541:3099 with SMTP id a92af1059eb24-1a6ce01d3afmr2759368c88.7.1793183969473;
        Wed, 28 Oct 2026 03:39:29 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75e5c6d4fsm8340186c88.14.2026.10.28.03.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:39:29 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 16:08:07 +0530
Subject: [PATCH v6 11/11] phy: qualcomm: qmp-combo: Fix error propagation
 in qmp_combo_dp_power_on()
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
Message-Id: <20261028-glymur-phy-v3-v6-11-1f1d2e565a66@oss.qualcomm.com>
References: <20261028-glymur-phy-v3-v6-0-1f1d2e565a66@oss.qualcomm.com>
In-Reply-To: <20261028-glymur-phy-v3-v6-0-1f1d2e565a66@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Jeff Roach <jeff.roach0@gmail.com>, Luke Macken <luke@phorex.org>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793183900; l=1738;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=WL4YAlfjN6MhAdQ0GSQ+FQW7IyH6mURHkrvjaQtIApo=;
 b=cLzwJ3/oKBc+VW7ndAVeXK7ARSNAnEndg/bgCgzCgEHyjoZW0xsAVUe1F3rVCi2OnBBhVmJqA
 5iyeJ9IyRMDDLLYO7LuksNXCkbMzGi0bXcd2M+/jiBMpffxYTSKcrQb
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-ORIG-GUID: cjGfruMhC6DZj3pDPHOxcDaSEJTCw2RQ
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae1d0e3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=mO8_gwkcAAAA:8 a=uxOsGGhB1PPybffeXOwA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=InTEqNb8lIr1xazlwGwc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfX/KNu6NBtFLwj
 5wmh1ITEB+8I379ICFZmyIirPk8RXq145ENAQ7NGXvZ1qiuZswGeK2L6MuqcVaevcLA4Ntfwm7u
 vK6hbGr9rcVE1IyRgt7xRhfKqEVmBlk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfXy5sE66GgEKbR
 HLK1iFaQo+6z1HBpX3HHowP6ZeQSIzDIbWiKNyIU+/+Qv4K0p1DXpKX7I4Op3aBrjhWu85Q7wc0
 WksQE6hPNEcsh1vh65QYv2wRvvc1U0QOU80YE2OPbBbtoYGgNYk9JoiskQvHyfZxJQgcBHiN3Sj
 FBW3CLkDdcs1tUTZ5zIVvo2gmLV4XlXa06J8dqwJZjENGgXsZUWfmRojTdXffxUMS+eSbmUl6II
 69rSOIpKD5cUgLMuUkVpqhRLmhu8U2/4o2CCrwMdNCizkcz8i7aTWmTxT2dEGUTnFrvwnZfFIn4
 EUFXf2mXNv03hrPlB3Mwx59MyQx45VmNU8huSOEZ/y2HnPr/hJ9v/hz/CmSqv7w0aM4gLArvaUH
 LIYG61121q9HfdxkNPqKZYMlqXS73zgsUj7rL7LDzlUbGEuhpMPS2hvYRRWvgdSD4FStimWT9Nd
 Yw+ulOQXNNWEmbe9Xvg==
X-Proofpoint-GUID: cjGfruMhC6DZj3pDPHOxcDaSEJTCw2RQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280042

The configure_dp_phy() callback can return an error (e.g. -ETIMEDOUT on
PLL lock failure), but qmp_combo_dp_power_on() was ignoring the return
value and always returning 0.

Capture the return value, skip setting dp_powered_on on failure, and
propagate the error to the caller.

Fixes: dd1153651b038 ("phy: qcom-qmp-combo: merge driver data")
Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
Tested-by: Luke Macken <luke@phorex.org>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index b34b892c2702..4def2bd991a8 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -4416,8 +4416,9 @@ static int qmp_combo_dp_power_on(struct phy *phy)
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	void __iomem *tx = qmp->dp_tx;
 	void __iomem *tx2 = qmp->dp_tx2;
+	int ret;
 
-	mutex_lock(&qmp->phy_mutex);
+	guard(mutex)(&qmp->phy_mutex);
 
 	qmp_combo_dp_serdes_init(qmp);
 
@@ -4428,12 +4429,14 @@ static int qmp_combo_dp_power_on(struct phy *phy)
 	cfg->configure_dp_tx(qmp);
 
 	/* Configure link rate, swing, etc. */
-	cfg->configure_dp_phy(qmp);
+	ret = cfg->configure_dp_phy(qmp);
+	if (ret) {
+		dev_err(qmp->dev, "DP PHY configuration failed: %d\n", ret);
+		return ret;
+	}
 
 	qmp->dp_powered_on = true;
 
-	mutex_unlock(&qmp->phy_mutex);
-
 	return 0;
 }
 

-- 
2.34.1

