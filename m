Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E8A43F4CF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344583; cv=none; b=fGVa/X5NB8kmcz3rR01MQQioUomzgqi5MHAaWqnKg1gYh/VcDsAmP2ncfkYOPhTbP8ypUS7GxHpwNrwqukgc5gaV89DaBRSoaMk6lYdL0FSIlijxmczYjL3l3a2Yshlu7CHSUmY24cYeBAY5uffi6dIGZ7pyOn1aqktaw+fKeb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344583; c=relaxed/simple;
	bh=fS3V3BGXA2tO1x2vx31WL0Npme+1qzuAanXx2mjT4UA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JZGsmBLeGzj/0jf56nqeFcBc8VS7uvs37FDe/ALExZmXWDZiCWvDuMFSUeqTphA5D2VQMj5QBs+ewOvH1h9MQI5TRV23iHGxf00xtZV54IJJE64cPjx03TtJOnva5pWqlnE+0aJE4jIuWD3WNdWitKUloAijcBSTDjwCLS9p4e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n13n6WcO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jveUphAA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n13n6WcO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jveUphAA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829MvDX4141420
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 10:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PfgP/DBP0RIbDcb5reJJer4RlTs0vVSXQT37ojTBPrE=; b=n13n6WcOrqcMH0pV
	VXZ+c71qzL1ninDs884OrMavwDfVkvGEpPnrQlq24YpjMYEz651qjMyACusd3Yjc
	xBMvYNIOdELza5amszUBCIT3K+R0UxSJEcTp2IWMSIolEnmoQlgYQx4MD+Q4FyBH
	oThs0vNvTl4AaxkoGExylHgpThmmSDVekPUzOApMpWPTbvIRLQSfJsb20+TgKsy0
	H14SnqYJ88VUM1ivy2DDococ7pYP+KRnP3cc/IiwAfIW++Fcv9fQgOCbPRaSdqle
	COZLjnz977C8kShkP/BnTVl7gV1yge+l6sWhEP7ZlZva5WCHNWjTOLfc4mxk3mbG
	qvyBow==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge39ckc0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 10:22:53 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39af92138f9so430882a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788344573; x=1788949373; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PfgP/DBP0RIbDcb5reJJer4RlTs0vVSXQT37ojTBPrE=;
        b=jveUphAAIHxuJJP4XWEmmPkfkkxNugDUumB6UeeqLU75oKanwNh9y98Dy0nmoNRV/+
         DBL5kMe/qwWD+hIIkJ4urDSdkVKIDcUpUXT2pKOBvBB5hlU1dmBd9oP4So40XFfmgvzH
         p/v3zsf6snzcmAnQCVzald9v01NBJNkz1GOec3Vt9BQ4mM93jXU9hsMnojsPqcXJLHAs
         /5XK0Oz6rq7OsYZQxWvDFfOO+VOFIlXPPzabb7lQWO3vZkjL0imKzGpYytxD+TRV11jW
         IVHpcp7unP3V2a8LiOhapMwxuwqpL34j2SV5bCyelaysR38kpBvvQztG6hDpiaDW0goO
         jheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788344573; x=1788949373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PfgP/DBP0RIbDcb5reJJer4RlTs0vVSXQT37ojTBPrE=;
        b=c1Vl5WCCSuCMfwerXUlFtuYmznvLKjFInxtB/t1A5hfox9QlQ7r0bUZON78ZK3bRCD
         jXhr57rrP017mZSJ6ORgSf9ZcPXzDGsplTZijjRUX0/lUmNGMX0iwuYbDC6oNF+UZkRJ
         WhxUBQvd8skPf2fBbgnqWRzwzjv+XFHQz7BNP4e+mEY0UhmKfRlmITtLukxSb0bZ+2av
         IAkFjIZx4A256zOZMIaTFhyXNNSXCs/5trkAtyN+5tMYFNsvihkOIt7V2UPmMukMNiFq
         Oy2lSV55phVUdjQDTvWmF/lXJeRHOmzgBed48PDu3wS3+SxlPvFYUV1s/kFX166F/lsq
         In4A==
X-Forwarded-Encrypted: i=1; AKwUvBwCz5xT2Ss1sUf2/42u7KA0ToxD0Fo7Blq/FWjH3lUwX/QJMtgcRrv0qHytn9NG1pawt239GJ9jEwyjkCY=@vger.kernel.org
X-Gm-Message-State: AFuF++k4t2GNBLgXPZ3SDAhmlFb6jfFZXcz9n5KSWZ5LTRLMq5oLDCPu
	RBZgt2MDwdS5MDFZ+VbbLYr5W1l4d1zInl36cND8CE4C2OS/uuZDXm0PuQgSX+3k32s/3whpprH
	gFuSsSEu8mwyO4F196xphGcAzHdGx07KDfE0MdB5IyMILkQeraPOl4E9JYDGE2l+GlCA=
X-Gm-Gg: AYBFou1NwvEbNm3g9v7T1Jj5+ilt4STsNsmpriG45nwYAUBiwBRvkEzEvnb86GlGlTs
	QLMfU6YV2GZ10Yxz1B59CTZge4rnyB0mIZSSyZVQ8Ozck1drDk6qkj8NXc9mCpz4qMAjGMCOmeQ
	KSaIN0iUrnX2hDSvp9l5GbR8AV0TfBwQrgFnM3ydob2LtgOxXPJC7cSPTt8PWlQj0LAhnaRsfMX
	c53X4I8yDGQlUYGFC9+7rNfdZ87RqmPUyasjmy8UeG3hL9E4kul7SkzjuxFSL4aokJrDtXIs0tu
	bpujJfJiY48U2PlkoDw5unT3wJ6CdW32cAkQC4HFN7FOojt4yS89EaDClPeJ65jJ4J649jF81J0
	IpiA2H0DnJq2ebplkC0qGeesIJ2pusMBSRBxhdZOvtio=
X-Received: by 2002:a17:90b:5890:b0:398:9beb:a2b6 with SMTP id 98e67ed59e1d1-39af64db294mr2354066a91.24.1788344573018;
        Wed, 02 Sep 2026 03:22:53 -0700 (PDT)
X-Received: by 2002:a17:90b:5890:b0:398:9beb:a2b6 with SMTP id 98e67ed59e1d1-39af64db294mr2354033a91.24.1788344572568;
        Wed, 02 Sep 2026 03:22:52 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f079c0530sm5054861eec.3.2026.09.02.03.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:22:51 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Wed, 02 Sep 2026 03:22:50 -0700
Subject: [PATCH v3 3/3] arm64: dts: qcom: ipq5018: Enable mdio1 and add
 QCA8081 PHY on rdp432-c2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-qcom_ipq5018_mdio_pinctrl-v3-3-629c7bb05c44@oss.qualcomm.com>
References: <20260902-qcom_ipq5018_mdio_pinctrl-v3-0-629c7bb05c44@oss.qualcomm.com>
In-Reply-To: <20260902-qcom_ipq5018_mdio_pinctrl-v3-0-629c7bb05c44@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788344568; l=924;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=fS3V3BGXA2tO1x2vx31WL0Npme+1qzuAanXx2mjT4UA=;
 b=lqcytDa/xshZdY5AJhA3IsC+fTgNZqHOQ04ub1LaNUVvfciNS93VZcBcG7/7LXvw6cQ68mof+
 z257LmwnatwArkyzYBZAo4q77uHj3NuMSvz9SGFJY0Lhk9isEp3WF0g
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=T968ifKQ c=1 sm=1 tr=0 ts=6a97f8fd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=mKqJttMW3klxcx8NO6gA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 6x9yQK4PbbC7VPz58Ojiu66qcfofoE5v
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5MSBTYWx0ZWRfX56zlSY6BL/oM
 XYGawP5y6CSMBT0BwqPhitqXDYgtlEofW1NUkY8F+TYFg+u/+MU/7/k85MauMvo+JydIG0CuA4I
 41r/aRix8JV4T8DbiksHClXSyDJdn04=
X-Proofpoint-GUID: 6x9yQK4PbbC7VPz58Ojiu66qcfofoE5v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5MSBTYWx0ZWRfXw8yw6x9ya30p
 5YMbZJ7lUaDCcBZ9YNgySzIW9fm7ogGBHW8N/BB85wu+CWWOJzPqikWS82qen/fV2y27fsfpyKh
 QB48IUuNz1fI9lBW4LLNGNmRVf8qhsAAdT4PI1wO/h2/8isqGCkIvxCsuz9TJQX108Iu+nGLxB5
 CSxO5TGKlvTvXmHEaRaYXPUKpbHMrNs1yrsgTEkrq28QTldqXTU5+cNRzURQw4TdkpoJArFrEMy
 AoW7cRpA5FPezUHQ3iS3SBvTc7olHUX2L+ety+8ZeQ6YhyMu/OKtY51hFF31WE31KQxdDQEP2rh
 zeThldBLgsz6jfNsttQQLPVt0kNf+hIM52jJ7xXcphJP/tiprUChB/1rBTdxoNV5t1tTj1IQZwU
 OXALvSrJjiM+8z/pUm1KUuVqv2zzFYZG0m2kwO+qpf9TK943vqZjCpRgSnVCBuNrvzqy3ta49gk
 z9KOApxRwLopb/zGQtg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020091

The RDP432-c2 board uses an external QCA8081 PHY on mdio1 for one
of its Ethernet connections, but mdio1 is left disabled at the
board level. Enable mdio1 with a 6.25MHz MDIO clock and describe
the QCA8081 PHY at address 0x1c.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
index 33eef92b19b1..34d4a0886356 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
@@ -30,6 +30,16 @@ &blsp1_uart1 {
 	status = "okay";
 };
 
+&mdio1 {
+	clock-frequency = <6250000>;
+
+	status = "okay";
+
+	ethernet-phy@1c {
+		reg = <0x1c>;
+	};
+};
+
 &pcie0 {
 	pinctrl-0 = <&pcie0_default>;
 	pinctrl-names = "default";

-- 
2.43.0

