Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793183934;
	b=i39+SKoI4KbzUYrFzMsN4I/PbUPGRc58ikkVtXOf7Jiq/SOn1R0BgO8h0qzb8wEhAW6d
	 cYwUk8RpKgVXdQOLTFN37z+0LZlEdFGhYp9kqL9kcO67TZiszz2ULjN7aemFm0StDE7PF
	 bumFKomWLUyMSTTaQjTgYOoAdb3xRrCzRZO8RZGKMKKDP9v7ywH0oiLiiQbCzoM2OXu/r
	 b+ur88CAsa2SUP77UKwHnVP5DpvLv8r2QUdDmj4BwIosWrI9uAVF8TT1uT5psnz2uvz8B
	 V/UfVCWkiqm3wdtOw1Uns9tPyv08b/NWaoZVrd4uDil5lKAK0CuOOmr3B1TN1qNFJKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793183934;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1DmnsPu9LkHnfYUxkO27zCm2xtQYkAcumr5i+xtwZnk=;
	b=KUJKtATCHrBRxQ3bf6t7cQFm7311oTZqOdAxJoVh2OEq2pDsmpZ0xcTlByTsxiw3M02s
	 kq+j73Lyh4nJQxXVwiGOWEkV+pf1BUaZAGoNCjOn8pDe4iGsAZhpZuVNPhB1PUSxVBYSo
	 /nipxef2JklLuL3xZ8/JjEQVSs+cEMOS6bwvCp8hJgsjEXUc3yWBnhZSES3hKD9aa4YYy
	 riyLXBVFmKt6nS+LiGspGrWhUiyCEgfyhf8Dkmy0s+dCVW3LlbR5kq76+3xPIZP14FHME
	 e1n+weSOlSdxmw07NPx/ZH3LSe28rVBU3d9zdqaB4tbRGn8w4tVMxbEoQiMtn7cWZtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MlnyKP6I;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bsDirxK1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06DE606A33D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D06DE606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MlnyKP6I;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bsDirxK1
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8KsVZ1101773
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:38:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1DmnsPu9LkHnfYUxkO27zCm2xtQYkAcumr5i+xtwZnk=; b=MlnyKP6IIrteuLZa
	xrqvjqkzp9dBygSIxrGWCfNR6rbRu7P2wnRvPrqQSR8OdPixEolQuUSTmoHiVr/v
	4KH0rfMm3xV565D1zyk/lMh0Q9RxIhaFStm/uGtCf1yHkwXvjEK22+r1ZEAh/t/G
	ub8BTHlDGyhcvCqywLuVd8yUV14zfmv3aXXpDCOyt4m/7a7Uj6dK+3GhrV2aW0d/
	BbCuwdoH7s4lHLlbxnCt1UV+AFKmWcGBjwFkhHti4P/FDuWefFmJgag2F3yZ8cxI
	T8jtTYEJZse4qx0y1O58OTWuGbECBCV2wwcvUdENOuNJuzbjp3S0bbXcw4ze4eas
	LANdGQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7rg5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:38:52 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-147be78cd56so2520530c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793183932; x=1793788732; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1DmnsPu9LkHnfYUxkO27zCm2xtQYkAcumr5i+xtwZnk=;
        b=bsDirxK1VyUWyPLgr1Tm7tdV18RB76dS8Rl8Zj40GChXvGJ/NNT/1jnGgpB429tGIm
         ywn8djofjOtHXWKeBhU+q/vTm0wstQy++Zr4mEaRbZhYsl1hlp4S1ymNkBn9Kb/FNjms
         IBEVTUKBcle3zX+yV4Uc10ewY5Q0LMQ8RybUawXnROP919NSlvgze1XOwsJuMO5DlaAi
         exPXAj4VPgVvNyo1T2G6UsVGomJgklSSTrHNtkXBoeQgZWcYTYMW2Jv4/ifw244A3B6a
         kyzhjw4mtVRoj6kVxdBphBOPh4OTl4qTnuvbnXfjVNPpaFG+jiz7owlQzSbCxwgpJGii
         epcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793183932; x=1793788732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1DmnsPu9LkHnfYUxkO27zCm2xtQYkAcumr5i+xtwZnk=;
        b=PT1I0Xie/Dgl8+uYUfUKLGyBIm9hL44Yb6ButQCTIBPZmOVNhUhCzRERTWaZsNU5fo
         cIlLzKgEKXxHwpz5S3VQp21meR/CEFegiJuOSQL7LpmkKHUiSFiev04DzQ5/WSPcZqhM
         KnlD5N1F8cphobVsF0biTQN02QsW50LRJGRmzMIa0c7ImTdY5S3mZjsKErxPw5ClFXTK
         2mquXNpFO21HXBThn/G2TBfqApYaZkudMi0c8UM72uqSRVqjbfxO7BNjM1PQVZMRim7b
         U8KT1xBgIVERnEAgkeSnCkLFggcjwxNrGEnP//FDSqNE0R+366OPB3k03LXmEwcLKlBH
         HMwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxpceqS9cdwHDnHwuuuMcLVcS6nvqutD5MQj5oSJQZxegy5a3N8cft8Y3vDwEY4xyTjt5+xs9+nww0lJM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJ9nMtKecbhgY6nI1N8ehSpI4mNgN+ynoMIcvG9nLYVvwUfFqU
	Z9+h1Cjj0jQTiId5vMoJBpM52fYbI11lClFzK8Qis1PigIW2fARpZJulPgQnzU920UeCepfEEC0
	VFXMoSqO/DOM+2ognQK/WlESc9uPCVwXU9aBIEqMGwbOE5HiIedzB8t+uGgxEKWXSx9k=
X-Gm-Gg: AYBFou0vJbs6cfEetYRdXcCcr8e+MEha7TSIOhOScxMDebjCYiM9YyBHLCexacuUDoB
	TM5fpEFrKnf15m/0upDj5Pe4JNM+XLcp2XpUcTrvMyNQdy4YVEIoz/xfE1DWRQwreE4BJISHXGu
	9o+xZ7rkL2nzEn2nAL7fwMgE8n4d4J0bs13biGMiUzn4kUiBQHO/IJhLiwhLlsTR28ddOLOKGZ8
	+lHxbO6bmiQBr+s8gosgH1eju3OO7xD0UC/wxegeZ2gl/Eks8Hfh4Vn3MsuCXvPHFhsO74KAkpM
	oalxYRGKQtihpd+fw/3KgoASUwPHNcH1iZqPceLByy7G/fpHnXtPfdyiG3IfZoJc6IE1hQ143jQ
	7I+fk9uQhIqh6IdtZeIe5mJVxPnJ3JVT4q4NfJp5agtCbk2QL6vWbZu7CsVmyKwgjDKJho3Xa+C
	0=
X-Received: by 2002:a05:701b:204b:10b0:194:9e7a:3ba2 with SMTP id a92af1059eb24-1a6c800e5acmr2967054c88.2.1793183931610;
        Wed, 28 Oct 2026 03:38:51 -0700 (PDT)
X-Received: by 2002:a05:701b:204b:10b0:194:9e7a:3ba2 with SMTP id a92af1059eb24-1a6c800e5acmr2966998c88.2.1793183930839;
        Wed, 28 Oct 2026 03:38:50 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75e5c6d4fsm8340186c88.14.2026.10.28.03.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:38:50 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 16:08:00 +0530
Subject: [PATCH v6 04/11] phy: qualcomm: qmp-combo: Ignore Type-C
 orientation for Glymur DP mode
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
Message-Id: <20261028-glymur-phy-v3-v6-4-1f1d2e565a66@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jeff Roach <jeff.roach0@gmail.com>, Luke Macken <luke@phorex.org>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793183900; l=2505;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=vJCG3Igx+o3iKS2uCeMJkCfwOhV1lYTiyUt2vCdACQI=;
 b=i6srCDerdX7UTdkxOZ9DwZFgpi8lttjaccsdR1KmJ3FNLQdXp5Z3u7yc2wllcHcjDptAqHIGC
 NcqICQf/cUqDLhYjXpS+J/PHK09fKFxwhT4clFC44TJ9NUU+yWj8ieu
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae1d0bc cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=mO8_gwkcAAAA:8 a=I9iHhWb_IStLGF-kurEA:9
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22 a=InTEqNb8lIr1xazlwGwc:22
X-Proofpoint-GUID: RCBpw3UyiK8JAwAy5RAjjV4itDVQqtNg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfX+c8H/3dlfRJf
 jn0jygua/wRZkEILW1c83DDYGxZ65wel9Dn3CWsSsn2OfgUu6gkGwNwnyCJ3b2IsufoCQi/EYgV
 Ko8xLsX7bTwJwMwpnZH1m+vXW80+pyY=
X-Proofpoint-ORIG-GUID: RCBpw3UyiK8JAwAy5RAjjV4itDVQqtNg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfX/E3fu3qset+B
 s7wMgHC06jKcZtTk3J8BJ95iKA2jGIBH4KmMUtUPU4GCFH21mQ6/QhoQ1fayDp6EphLIltcG+mI
 /rMK9svn8c9QiSDijC93rTIYyhfsCyxtnB/TsqGEeCm4NSrTdyIxFquoEZxSNt+hpGD6Ay1HVxl
 SUSrvnMQ9zdYdHZY3ltZn+K0NH47g+xf/y8EQ8Kx6OG8pQefYPFviXExaFdmKSux4q0mTzH8V+y
 tigcTWudwbya8YNnUKMVMq15vGV1e8FpIeR5tX03kGEQf2Q6NJmCVtJuRoIUj/f1qtsrNYaYUch
 nSkzxWb95eS/kP119DnaP0OsNxf7gxQ/PS2QhGFc9JbWyOkMIdhk81DXsIMAL/42rSZ06Pc7OvI
 7DGERXti25HhmnrP4ChqUv5xlUlcn2p6Ed8dJ4sAEkAtIG0oc/X/aUKF25hoeHjJ/OeUblXGmvK
 vzUkjo8QvppI3kEvOKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280042

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Glymur platforms use a fixed DP lane mapping and do not support DP PHY
mode reversal based on Type-C orientation. Add a configuration flag to
ignore reverse orientation during DP mode setup and enable it for Glymur,
ensuring that QSERDES_DP_PHY_MODE is always programmed with the
fix mode value (0x5c).

Fixes: 815891eee6687 ("phy: qcom-qmp-combo: Introduce orientation variable")
Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
Tested-by: Luke Macken <luke@phorex.org>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 71f5e8ccfabe..062ee4397171 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2565,6 +2565,9 @@ struct qmp_phy_cfg {
 	int (*calibrate_dp_phy)(struct qmp_combo *qmp);
 	void (*dp_aux_init)(struct qmp_combo *qmp);
 
+	/* Set if DP mode configuration should ignore TypeC orientation */
+	bool dp_mode_ignore_reverse;
+
 	/* USB4 specifics */
 	const struct qmp_phy_init_tbl *usb4_serdes_tbl;
 	int usb4_serdes_tbl_num;
@@ -3429,6 +3432,8 @@ static const struct qmp_phy_cfg glymur_usb3dpphy_cfg = {
 	.configure_dp_clocks	= qmp_v8_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v8_configure_dp_phy,
 
+	.dp_mode_ignore_reverse	= true,
+
 	.regs			= qmp_v8_n3_usb43dpphy_regs_layout,
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
@@ -3622,6 +3627,7 @@ static void qmp_v3_configure_dp_tx(struct qmp_combo *qmp)
 static bool qmp_combo_configure_dp_mode(struct qmp_combo *qmp)
 {
 	bool reverse = (qmp->orientation == TYPEC_ORIENTATION_REVERSE);
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
 	u32 val;
 
@@ -3635,7 +3641,7 @@ static bool qmp_combo_configure_dp_mode(struct qmp_combo *qmp)
 
 	writel(val, qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
 
-	if (reverse)
+	if (reverse && !cfg->dp_mode_ignore_reverse)
 		writel(0x4c, qmp->dp_dp_phy + QSERDES_DP_PHY_MODE);
 	else
 		writel(0x5c, qmp->dp_dp_phy + QSERDES_DP_PHY_MODE);

-- 
2.34.1

