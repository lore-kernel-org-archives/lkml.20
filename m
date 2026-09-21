Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAD5498921
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988345; cv=none; b=Ors/MyqGk0L6BZsneI5KDSaxOhqKvJfVmYBXK6sOJz+8IRJf+SDYAsv72hvgAGWZqrgbZ7q4s6WOEzQpeUCbPOJvvOruEZxto+8f0UMjlIyz0poUhoVAjqHhQzMZwE/AOyhQMlna0oR8Q32nL+QUJ2WytmxVnNGm2U8ewTCQhKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988345; c=relaxed/simple;
	bh=WbRARIO1/TWwRAYkZ98IWSIfbhjomj6AvqrXUdfyKts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kv7qMcg/EbmiMLDh2qctbQ7UOQGJLAJnVYCWUOyqFcWUGFTt6TFq3OfpNR83ODqLIjJ5LNaxYH2PxetjsFzArOApIeBdASob3OpeoRcsCvybbCF8j3LDtBcQYTZW+dGwHWAa67vHib9vE1HeAhzZTc5MOAsr0ixVocx8r+1rYI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oFlx1ty8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fPiL+23S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oFlx1ty8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fPiL+23S"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdw031413934
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:59:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tGAVhDoa+/o8/9WqrqkGlwFP2r5vvltUvLwZDgbxems=; b=oFlx1ty852IYEhOI
	BSfnRhvKHbTQHhpCH3rL+1egLetGNfkrS81jGEVqr05xQe6qqCEH6fq/gIyFk/nz
	1MVjwSIKP9FqYrNXGmpq9olqSraP+y98aNzzALlBuhT9JS+M48RGW1JT0iNvdike
	lykq6JqPfjecxOCHudOtAT/D0gVXL8bnwZrJBEGIluk5s/8WAfAXSsJb0At6RARH
	GxM6+GUSVnrYYg3g1zM4RFI++X+qZT6ZnHvz673NzDHcuHbV3ylNImPzq7/65dQi
	TJ5ZAlBViyT69VfjxFcon4jHEQHfAgDEWvGMLFxIb34xWvXfxuAW012KqxAfxzUT
	BmCrwA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01d0v3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:59:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39af92138f9so4313094a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789988341; x=1790593141; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tGAVhDoa+/o8/9WqrqkGlwFP2r5vvltUvLwZDgbxems=;
        b=fPiL+23SqLrqJpX7wwxcEyneVHFAqQQfAKLji7hegkxMpjtt5LoR4fH198FskeMjBR
         BGIskjJbs47mZtmsI5/0oFQ7560cXc4cN9I83W0cMAd7A6XX2pczhfkdd7O8wKkT1ucH
         JzeVF38fXlfCi/pBL48xFdtJKjndHCR8/tYvpFSVhdUuatoR29V/4dMI+DsABSJVwyTr
         /NgkfUTudmOviu4D1S/J540B5bHXhokWRiy5b3/LXqV24XTZ3id96LyBZRRWJTP0bQZw
         1Rtkrvj+VMD9e6t4sAf6Uc9ayIhprI2GRFFgtut8Q1KGwXHoforVU1kLrbMonGPf/LZ3
         ELVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988341; x=1790593141;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tGAVhDoa+/o8/9WqrqkGlwFP2r5vvltUvLwZDgbxems=;
        b=dE4Z8zNK74jmcjpHbmeIG1wtb3opGnnxhymi0lN3ZkfI6kmUNxgnPARdD3kX2ziIp+
         Br22pzjZXmvqIW01j4itHIkNub+4fFpdBzKLFOLRZyml7WBxdisKsr7Cpc5y7D9r1hkL
         efc8v9NXpioSZJF2L4TZ4EFxZLzUourWm2lRrAbhUxVsDLM3KDeWKzNzdxlxb4VpJywR
         qTpCjNdQdPC6Ufj7EAEdaUu9fQTwgjztNJyt29k5ZF8RSF1Z0YHTW8fDiXwFZY1zKKvj
         yOvATHGCMV1iQtf/m7V4JvD6xx1JurtcQ2zLmiwsVPgh/AucAT9mVkp1CbnWvAQqKFC4
         z7xg==
X-Forwarded-Encrypted: i=1; AKwUvBzKjXe5RqNTMCP68bOga5iSya6UDy6KX95+m/kowGoXgUcZiMp6XrYZVUXqDMI68OodzweEIl5Uhnk8J2E=@vger.kernel.org
X-Gm-Message-State: AFuF++kfA0Q9xPDmF4jYXinDEsxUHKmQaXckvs6K+8cXl+V8kanPRBTQ
	DrU7Tv8MHxOeuKgxfx8aDV31f3r3qlTaDMkPfK8ObrCQZtU2B7hTSuD7nSfEknqtZBggyzZxbql
	NxE3rvfIngdy8CcQ3lpzLbNFkpWo11M1GAET61vQjYax1hRq9fs4SLTmBPgrps0dd2DQ=
X-Gm-Gg: AYBFou3ul9RvqIs/ezUlL/rpnlZixrq6qS2HjqPevKIRuoHgoaMJcT+aAT4qUfQUXzD
	kU7N/73Gyew9vxB/14p496GsNgkU+2A7mQxTdFvDu6gVezYPVkBuSMyhosR3TnT6YcLef9/ONZT
	OV74ufXUFRrbWXMS/NMOjyo2tYDHCKaUZ042QWxeP+QyJ3Pq8FBowVREi/WMFsk/bJbGc1ZMvcR
	QcSYikciIFKGiDHIrQfl+EPgJm/amrQ69vf+cVV29tHBjXPcJ7n5BamEha5+PcpkhnQTgEaCmL4
	mBl2JenRljbQl5YUmp91Od3gaMJGd+D2LB9gfvOSfXIYGXimN0NLmDpcD4/sfeGVdq6dWDzGFo1
	Tb5EHVuPDIOpodqBSE5jR+SpzoLWxwqPe/w==
X-Received: by 2002:a17:90b:1347:b0:39e:6c68:fd8e with SMTP id 98e67ed59e1d1-39e6c68ff44mr6442034a91.35.1789988341083;
        Mon, 21 Sep 2026 03:59:01 -0700 (PDT)
X-Received: by 2002:a17:90b:1347:b0:39e:6c68:fd8e with SMTP id 98e67ed59e1d1-39e6c68ff44mr6441993a91.35.1789988340585;
        Mon, 21 Sep 2026 03:59:00 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d55cfsm23544128eec.30.2026.09.21.03.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:59:00 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 16:28:16 +0530
Subject: [PATCH 5/6] arm64: qcom: monaco: Fix pcie1_phy compatible to list
 qcs8300 first
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-monaco_ep-v1-5-63c5282fb0db@oss.qualcomm.com>
References: <20260921-monaco_ep-v1-0-63c5282fb0db@oss.qualcomm.com>
In-Reply-To: <20260921-monaco_ep-v1-0-63c5282fb0db@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789988304; l=1098;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=WbRARIO1/TWwRAYkZ98IWSIfbhjomj6AvqrXUdfyKts=;
 b=EQq+urTQpBW0hMMCDp1Dku9OvNG2uaQYe18LjursrmvHtoLDUxaDE7QKX952o2fYut7NZXn6n
 sU6PgULGsKbA994AEH50YhlNqkJ2k2wqTzLWaNSQxbexbmcUHSvW0bl
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: axR6KkGS9rETSZWpO5fFDKJmZBRIszey
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE1NyBTYWx0ZWRfXwYiu6Hgu4OGP
 OViGkKpkuIXvsm8+rKs5dcgoXQd4bdQNDfOeiVfTIOAej9fmpKvKaiQb1FO+PfjhKf3q9JWtKjf
 aUx1JrAGylk5pQSM6Th6rzUrxgxP4s4=
X-Proofpoint-GUID: axR6KkGS9rETSZWpO5fFDKJmZBRIszey
X-Authority-Analysis: v=2.4 cv=Ht7jiETS c=1 sm=1 tr=0 ts=6ab10df6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE1NyBTYWx0ZWRfXw+Ri2err5JuL
 76mIRhpkHovKwkDvjP2TcnuRWwrzFkbT3vdrnEAv4AEQcsmuek7G5J05R3cu7Ul5/LoB/hAo6TV
 Ex5qcVPAlolk9PxgQ1lXWim4yaUCH6wnVnFupnKZxsFFXBvcJEHXuCuNZbhsQgdsgAnLlCgaOYy
 0NURkN3ljVK0N66BMQbLSssaJvomHttmI6xHyvqpcDNI+ti8C0c+D7fm5PQzs6ZQcLNfiY7Uw6W
 zJo4zBlimd0ZONAaZD/o52eAee4OZaeL1ZV8ZtsfVqNhPq1TPg4Bv1RVeuCL8xVz4OS6QyMHHcx
 NsJli0Ba5S2sHz+evLGs0oicROuu1XyM0yvcEMEwo/iZ4YwWg8Fg4a9pFep7Rg06Z6YwtgimtKp
 0yUdWPYM2nNop4N779V2bEdS7fWrMVIWeK6BdP4DpfWGUfTSHdaP8LCbhBLI1Fr+7l7jUYAr5bU
 Vl7zquMisz6MnE+wbbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210157

The existing pcie1_phy node only listed qcom,sa8775p-qmp-gen4x4-pcie-phy
compatible, since no QCS8300-specific compatible was documented for this
PHY at the time.

Now that qcom,qcs8300-qmp-gen4x4-pcie-phy is documented, list it first
with qcom,sa8775p-qmp-gen4x4-pcie-phy as its fallback, matching the
order used by the pcie0_ep and pcie1_ep nodes.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index cfe39f923224..d7d135e87a8c 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2597,7 +2597,8 @@ pcieport1: pcie@0 {
 		};
 
 		pcie1_phy: phy@1c14000 {
-			compatible = "qcom,sa8775p-qmp-gen4x4-pcie-phy";
+			compatible = "qcom,qcs8300-qmp-gen4x4-pcie-phy",
+				     "qcom,sa8775p-qmp-gen4x4-pcie-phy";
 			reg = <0x0 0x01c14000 0x0 0x4000>;
 
 			clocks = <&gcc GCC_PCIE_1_PHY_AUX_CLK>,

-- 
2.34.1

