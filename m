Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B634492E42
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789991253; cv=none; b=TGU/DhFrbOs3s5Bg8uXevGX//+8J4VKWHk9oeS5XwXYgkHAQdLjx8FHgHWIwu7j5Hy6gLERMey8ws9GQNxjH9GLgBl/K5HLMA/D5oWROnDXowvQW96ggA8R+2PY/4VD3SA9ybfdB5QDFR2L+YNBVokzvmdwj4hn5HwJRL264YWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789991253; c=relaxed/simple;
	bh=vG8zJHLNi0qMvqUd7qVPkmxoCT0TVVqFJ3dbxfZNijY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GtPraWaP2Pgx5OpH/kLFLDVOd7uCX3DAozKtyhKbHwzj4x133lbhMk4Fv7U7S7Eh/W+jAV6GBu1uamRhdmymQGJ08fFBieRgFk66MFlGBxdVoEyjouy4kNpJvcyopMGxdGV1LGpwgnwAI9FNFSHGZ5jF3BEx5d52Ge2lcBcBXPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XexgclCn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HPGJ11+F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XexgclCn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HPGJ11+F"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdxRb1563458
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4Wr9fWbf/j+FpQ/PYK/qb4
	OAANvCCi+pmm4MO9kYPrE=; b=XexgclCnjEgJ/XpwRyK9ptgcIqBUgnqSStS3Ow
	04tT1Kj8KI91qngyc5jfpoiUXcBrvVGP63Adlrp7YyzVxQ5iVRI2s5iMdMOvqzP5
	r9H+p4lNyZmrzeM5GLXbRmnrBm25Q42rEdElqWKUDmSJdto64vDQayuhWZP7C7VT
	4XxgjSJGnlTpIy1/BlHa2RVC9d12pq70e2Ls/azC1oQauCUcNFq4TJTS68acSavk
	GCvEjTxdwtABUZPZEjKQVBkLmi7sx/EdTLE2I+PYyOhWkFyhUu+kEXFKKmpqNrsk
	BlxnjsglSsf6YJVFFcgT3UEUyK0myC9SVuhPQSyVIx5utMsw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtysw141p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:47:29 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39e18af9f48so4419964a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789991243; x=1790596043; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4Wr9fWbf/j+FpQ/PYK/qb4OAANvCCi+pmm4MO9kYPrE=;
        b=HPGJ11+FP2S4Ww9kkoe7/GgAcJvKqIwD8BD5yXsGRgO4GUieBI7BcU9qNjhCyKNT6X
         Rz0f7NERvQcJAZQm5xSrMB5qe7GD1F1ZhNexja4Ddw0YnOIh9+xeE3Cp9tUqczOcHZOO
         JrZ/xNRzeLpN7Nciu0x/wLNki3DusYJjdlP0dlWwacak/GqqYs+/nwWrdTcdYRrcsDsF
         jcp7Xd1o14YpFU7cdD1MC0QNQ60Cy2bMD8DNIep/1wTQpnyQb04cVu3VFD5hsi7lJbU2
         fiAQb7OG2dLpJko5DoiDZzEltTlL58euHuEym1AjaiujserZJc5+h7Mm23OEfaujugT7
         ez2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789991243; x=1790596043;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4Wr9fWbf/j+FpQ/PYK/qb4OAANvCCi+pmm4MO9kYPrE=;
        b=bNqGkuae8g1hhuhF1Fu22dJfzCElCozTKEKzqN7l+xGnrpa17sZ6n9iC3/oiZt/lFc
         i5RyU7SyFlE8Nm0yZ4mZ5m3Y6Fbe/LcffGt7uSon3JSspkuzu77JfYyCjNzFtndjqLxz
         GSyL189RK3a/5rvzirMWrdrYIn2fRGpomh6Jt6GisL5TLxzilCOYiz2fzqEtKho11ohd
         KbsOI2lKNeLp/CTWGiF2VE8tk2Vj0Ur07j50kKmbIPEPvQtfJUZ9g8b25ez9wZ1DO61V
         iSImH4e40hIScY3mcUMTwkeTyjHpGVQM0hbSNo7ZMY+/nrm5TNdjy4Fc3VR2zmxIXV2Y
         eKxw==
X-Forwarded-Encrypted: i=1; AKwUvBxRc1icO1OE8Mv/Tj9WUycvDRYjbMS+I2T0qJvr0nkVM4z6+xj02RPw69znCv3wwsjtsnR/2Q8R7+mosOw=@vger.kernel.org
X-Gm-Message-State: AFuF++nBxVCBW22730mlrBjd7cXi0KEG8Yg3wRTpcQgLO5v3F4r7h8FO
	FztLfXoDdubpeATrFY4OD2/apRxfMIhuAk2+ZHzKpejplOmJ7UCvF26lyUp/tK3xTu81Pzd66ht
	js+N7J3/f8ZcFq+d4grdzdxQMw55XRL2RsKmPbcSqWA0EsGXq9T+5vPdsQ9k2H4FRPTM=
X-Gm-Gg: AYBFou33XUOhLSyx7Cg88WQETuB5mbJvCnWYkSb5A7sn2HKtpdAQToy9g+XHbo1Sz4k
	DYh2HaByYW6Qsj4RdPF3uxKmlHEKy3mnfV6aSB3FCJhOBLOaleYvSfuw54zu5oMm2FpZuLiaPLI
	ef7HL8U5ZjGeGHVih6DpN3HQd54S8l/V21nvny/qxD4K8Y+/JjGoqEEjsV42w/OjGyU1Dk/IerQ
	DksGr3rQU2ixMKuOWdv/sgdARetagYtq0NC7YUmuNqBa05dYexhuMtRKfWz6Ncxd+0tGUy8BbaX
	mh9NEsVcklCnCyPMaGAQ69jht0uCVDrw5Z5ij3WyQJrpwOflXcLakW9Qhy0renrITFi2WisnD7x
	4dhEu++xhNjFptGmgFEXGwG37ULO9qIq+5Oo=
X-Received: by 2002:a17:90b:574c:b0:39f:6c3d:d4e3 with SMTP id 98e67ed59e1d1-39f6c3dd840mr6576713a91.29.1789991243125;
        Mon, 21 Sep 2026 04:47:23 -0700 (PDT)
X-Received: by 2002:a17:90b:574c:b0:39f:6c3d:d4e3 with SMTP id 98e67ed59e1d1-39f6c3dd840mr6576681a91.29.1789991242644;
        Mon, 21 Sep 2026 04:47:22 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3311a716sm21422027eec.8.2026.09.21.04.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:47:22 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 17:17:01 +0530
Subject: [PATCH v2] i2c: qcom-geni: Fix hardcoded clock index in
 SE_GENI_CLK_SEL
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-i2c-fix-se-clk-conf-v2-1-8b5537ceff2d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADQZsWoC/22Oyw6CMBBFf4V07SCUhIcr/8OwKH3AqLTaAaIh/
 LstunQzyZn7yF0ZaY+a2ClZmdcLEjobgB8SJgdhew2oAjOe8TKrswqQSzD4AtIg7zeQzhqoG1O
 ahquiKgQLyYfXwbK3Xtov09xdtZxiVXR0IuQ7L6wc4st57NEeR0GT9lEfkCbn3/usJY89vwW8/
 rtgySGHRihZ8SKrDVdnR5Q+Z3GXbhzTcFi7bdsH8BTblO8AAAA=
X-Change-ID: 20260807-i2c-fix-se-clk-conf-89f6f92d373a
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sagar Dharia <sdharia@codeaurora.org>,
        Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>, Wolfram Sang <wsa@kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Cc: Girish Mahadevan <girishm@codeaurora.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789991238; l=4938;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=vG8zJHLNi0qMvqUd7qVPkmxoCT0TVVqFJ3dbxfZNijY=;
 b=OW85IeOmtC+0mKhpsZ3uok+HTB4HP5U1fjH1/E9lH5Qytn4Yh82l2yJmVAxS7F2gHCkFZgtu+
 BBRKlTcwAe+DSXD4PRcwH2OisrVmJaScdIIv9uIsftBdKH56hPUmxKm
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3MCBTYWx0ZWRfX4gWiYifEcmDP
 lWrBre8DYABXEYmLKxubNKEH0K/C8UBUprw9q6vMYsP3T2TBhQqkD+qMMleWJP/azh+wZap2R+N
 H6hH4WJSBobk109BxDWM45MK5iTPdOHzOVdAcnxivguIA8Ih4XQ/bjkiQzMLbX4KSDFe2ii2SgC
 4+6weaHExOHWbHfr8bQKhNp1B7f2wJvmGFkvryLOCCwiE0zyS4klK6uBzvWAXuUyzUFfKUGyhCe
 KdLjQrdM4mU+nD+Z06HQCZxuTuSh/8YQgqJNvFoJs0cw/0Z+0+TPQVJ7/5GiGReI7irGHJYwzvE
 j4XKueTjIygbMcP6SEIDKs+J4DOFL8ZOGLX06pSZnY3B3GLWDSNonurgaey7MHt3EfyPWEtolP1
 aJM6Z7V8fLNVsKT2gjk/M1ab123m0K/WG5a8am6K2plwL29YoXOXIjPJjthaicO6V/kjXkHLTbs
 +rwPKqcmJ4WPpJsGFKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3MCBTYWx0ZWRfX2GvgpfMNS2CD
 ICmipSF1E8ylRHll6BREmw7Jgq1lMQRxJWCGvYY3Vz9lllHjlBEmCrRpkhHCuTxGrDq1+hKMoyV
 RzAPE34aT1/p+oayoVK75A34HVFo85g=
X-Proofpoint-ORIG-GUID: 9oFIp2J_cy5BmS7AR4Q2R7Y0xUvd-i2E
X-Proofpoint-GUID: 9oFIp2J_cy5BmS7AR4Q2R7Y0xUvd-i2E
X-Authority-Analysis: v=2.4 cv=W7etxhWk c=1 sm=1 tr=0 ts=6ab11951 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=zhPZPbRyWZJIox_krK0A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210170

qcom_geni_i2c_conf() writes a hardcoded 0 to SE_GENI_CLK_SEL, which
selects an index from the hardware clock performance table. This always
picks the first table entry regardless of the actual source clock
configuration. On platforms where the matching entry is not at index 0,
the wrong source clock divider is active and the I2C bus runs at an
incorrect frequency.

Use geni_se_clk_freq_match() in geni_i2c_clk_map_idx() to find the
performance table index for the source clock (32 MHz or 19.2 MHz). Store
the resolved index in a new clk_idx field in geni_i2c_dev and write it
to SE_GENI_CLK_SEL instead of the hardcoded 0.

Fixes: 37692de5d523 ("i2c: i2c-qcom-geni: Add bus driver for the Qualcomm GENI I2C controller")
Cc: stable@vger.kernel.org
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
Changes in v2:
- Update the comment describing the source-clock frequency requirement
  and the rejection of higher-frequency multiples.
- Add a blank line before the final return statement, as suggested.
- Link to v1: https://patch.msgid.link/20260828-i2c-fix-se-clk-conf-v1-1-9adc72308f2d@oss.qualcomm.com

--- b4-submit-tracking ---
{
  "series": {
    "revision": 2,
    "change-id": "20260807-i2c-fix-se-clk-conf-89f6f92d373a",
    "prefixes": [],
    "presubject": "",
    "history": {
      "v1": [
        "20260828-i2c-fix-se-clk-conf-v1-1-9adc72308f2d@oss.qualcomm.com"
      ]
    }
  }
}
---
 drivers/i2c/busses/i2c-qcom-geni.c | 38 +++++++++++++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 367522734247..f842e7ec56bd 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -87,6 +87,9 @@ enum geni_i2c_err_code {
 /* 300ms floor: budget for clock stretching; slave may hold SCL low indefinitely */
 #define I2C_TIMEOUT_MIN_USEC		300000
 
+#define GENI_SE_CLK_32MHZ	(32 * HZ_PER_MHZ)
+#define GENI_SE_CLK_19P2MHZ	19200000UL
+
 struct geni_i2c_desc {
 	bool no_dma_support;
 	unsigned int tx_fifo_depth;
@@ -132,6 +135,7 @@ struct geni_i2c_dev {
 	spinlock_t lock;
 	u32 clk_freq_out;
 	const struct geni_i2c_clk_fld *clk_fld;
+	u32 clk_idx;
 	void *dma_buf;
 	size_t xfer_len;
 	dma_addr_t dma_addr;
@@ -202,19 +206,44 @@ static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
 static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
 {
 	const struct geni_i2c_clk_fld *itr;
+	unsigned long res_freq;
 
-	if (clk_get_rate(gi2c->se.clk) == 32 * HZ_PER_MHZ)
+	/*
+	 * Frequency counter tables are calibrated for a specific source
+	 * clock frequency and are not valid for any multiple of it
+	 * (e.g. 64 MHz, 128 MHz).
+	 * Use exact=true and verify res_freq matches req_freq literally
+	 * to reject harmonics: a 64 MHz clock that divides evenly to
+	 * 32 MHz would pass exact matching but produce double the intended
+	 * I2C frequency with these counter values.
+	 */
+	if (!geni_se_clk_freq_match(&gi2c->se, GENI_SE_CLK_32MHZ,
+				    &gi2c->clk_idx, &res_freq, true) &&
+	    res_freq == GENI_SE_CLK_32MHZ) {
 		itr = geni_i2c_clk_map_32mhz;
-	else
+	} else if (!geni_se_clk_freq_match(&gi2c->se, GENI_SE_CLK_19P2MHZ,
+					   &gi2c->clk_idx, &res_freq, true) &&
+		   res_freq == GENI_SE_CLK_19P2MHZ) {
 		itr = geni_i2c_clk_map_19p2mhz;
+	} else {
+		dev_err(gi2c->se.dev,
+			"Unsupported SE source clock: must be exactly 32 MHz or 19.2 MHz\n");
+		return -EINVAL;
+	}
 
 	while (itr->clk_freq_out != 0) {
 		if (itr->clk_freq_out == gi2c->clk_freq_out) {
 			gi2c->clk_fld = itr;
+			dev_dbg(gi2c->se.dev,
+				"I2C clk selected: freq: %u Hz, clk_idx: %u\n",
+				gi2c->clk_freq_out, gi2c->clk_idx);
 			return 0;
 		}
 		itr++;
 	}
+
+	dev_err(gi2c->se.dev, "Unsupported I2C output frequency %u Hz\n", gi2c->clk_freq_out);
+
 	return -EINVAL;
 }
 
@@ -224,7 +253,7 @@ static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
 	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
 	u32 val;
 
-	writel_relaxed(0, gi2c->se.base + SE_GENI_CLK_SEL);
+	writel_relaxed(gi2c->clk_idx, gi2c->se.base + SE_GENI_CLK_SEL);
 
 	val = (itr->clk_div << CLK_DIV_SHFT) | SER_CLK_EN;
 	writel_relaxed(val, gi2c->se.base + GENI_SER_M_CLK_CFG);
@@ -1138,8 +1167,7 @@ static int geni_i2c_resources_init(struct geni_se *se)
 
 	ret = geni_i2c_clk_map_idx(gi2c);
 	if (ret)
-		return dev_err_probe(gi2c->se.dev, ret, "Invalid clk frequency %d Hz\n",
-				     gi2c->clk_freq_out);
+		return ret;
 
 	return geni_icc_set_bw_ab(&gi2c->se, GENI_DEFAULT_BW, GENI_DEFAULT_BW,
 				  Bps_to_icc(gi2c->clk_freq_out));

---
base-commit: 3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
change-id: 20260807-i2c-fix-se-clk-conf-89f6f92d373a

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

