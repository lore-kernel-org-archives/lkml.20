Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794618827;
	b=N8J4cSB++nhK3Erp8VIMuzwkfe+cBfOo7wtMn3OSeKKoa3TFZPGV2PjwahE2ZAoNFHS3
	 ztSNlsm7FMBeErbuv7wcq4WJglV6nZdf2qiwQUvYEMEK6tCxRMlLaMTh/oaHz/kUo3B+t
	 kacOIbRn50SMmhzn7R2kgw4gKKVc7wuZinsnlNx++IbQr4ehm7DGBknoZl2c17CrGeK+R
	 CBWrQI0ESJcgKC3l4PE68yYjkmUim6t5xrPWur3ySA/D+QSg6ftHk/lYB2NZo+COR2e2E
	 SEoz2ehMvCxSagITkuwEt/bCG0XH1uDmuUBGDAtUge7hdZZ3OgOdPz6DEDGVKoIGKXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794618827;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=B6QGHTbiKt0tsTxI6/Psf/ZbSXE1UseAZPqz6tlA+5g=;
	b=u4K8aTPlqIHQ6RZqyhZ3BLppxZg1xrlQeDVmMQNP2yWEpLVz5gvrxX3chAjiwwalQkXZ
	 AvD3+UmxVeBmGUb+owzsvFmlUd6Mxqm8GXNE5bswJ0Cx5tyOC28tokIMKFX+rj9TMcC68
	 /2U45dRfba7g4XTS9Z9cm04JGdj6FVOAmwGAW0ptz4hnD5mWw7j8XZ0kIgJoJ39pE16hl
	 SbMjQu57AY+7/vGcsScAtPK0VHl2mXijLJ+UVvxLt85esyBRVWs0Bc5+iVVHk2hEoesaf
	 15WRHwNJj3vcBgRkO32iu6O9MbNls/aoHL6d37B2xb2h7j0b+SloJVVuH7CFC/hDLlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MfRvvy5u;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W4Hp9X8j;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D42606A334
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73D42606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MfRvvy5u;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W4Hp9X8j
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE0JjOF482827
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B6QGHTbiKt0tsTxI6/Psf/ZbSXE1UseAZPqz6tlA+5g=; b=MfRvvy5udeIsF5tF
	3WfsknUOJgROwcaqYZ51gTUfVRF83ZzENP1SQTu6QIT9mGbLrkAmwXK6t/NYiio4
	ukkxq1JemCuhMkKbsa/SkdLwZ2BbPI6Zlogo0OmnoU5m9tAES69AxTDHRSGmfMlU
	SFF9p/sNS/pa+CL/p+uGeggwPTBWa2COxe3EwEMsL7B6QFCaherap9tJpou278m7
	1Jz0iyfbWmsJGX1BDDyithUyT7ClYjVnr8p6IPj4akP6sY5o+QAYFdryP1jLTMsd
	ThK4a7PM3uFGQzevfeW39Pm4hf0fMdaNk/yVfgRlnNhyDoiw+ph51o7qSVd7MA05
	qNtSzA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxd0nr4j3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:13:45 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1999341eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794618825; x=1795223625; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B6QGHTbiKt0tsTxI6/Psf/ZbSXE1UseAZPqz6tlA+5g=;
        b=W4Hp9X8jnLkjATtdfyI2dv8NEGpai5YP/jQG2ZyGP4xoFyqEK5qhX/yj+Gt1z/o42u
         Rn+dKT8i7b4h3nnbAMAtrKGhV7biBHGzpLASZTF1TpgvH6ZSGlrS19BxBCOUF/mvsw6W
         z1OIBl49xhkRf4lQv4cSOSMxleaDVckZOp++6JD+5g77aDz1AUEWmFI+FVejAfYBLnpj
         W9lhchHnLW8MyjSDXTe7pN6jr60+g2/PunZT4Z2oCL1K3NNz5HLDFtUSSgA1HIp7WJj+
         dQK8q+WLvCaTRDrR8kRM+pq0yNaF+TEWuOaUcXR35ejI86JKGgwPyZtdszgq/EfaAm2x
         un2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794618825; x=1795223625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B6QGHTbiKt0tsTxI6/Psf/ZbSXE1UseAZPqz6tlA+5g=;
        b=Z5y6bYpI+WOdyieHtB91yeanvqJzOhzN1d4MLxad7lkOyZZYM8Nmvbs2/nP6Slmrql
         K1EFKqfwwRVxhGDsy6j7bfNv5cG5k7oTApVZzHK2IOeWZU4mRH6XzzeVPLC0+eWHOWDY
         iXzvXdWvS1yk5ZievRRmUORlJKmokyTFXrzL7lEjI/EoZkfFasks+7jm70jT1EZGH4by
         BnvRULQb9eemwjFtUP2qA/yDENcYM3IiOEyK3yR21yKb9gKTWeqF2yI5N49MYRf1rrOx
         a/MUgVzAisnnSlVfDwLKrOm4546GnXmup8F1Iaz1cMh7yjka+IZtM3ED8tcyVcZfBI1K
         PkZg==
X-Forwarded-Encrypted: i=1; AL+hErEbtbnt9j6o3GjiARLDtUPfSNL7D4RwqDzzVh4LgKgMYRsxMmn5G/QcIneB5qKD+bjfH03CwqcnHo1/3Gw=@vger.kernel.org
X-Gm-Message-State: APuU4Z88lK/354nsMtRESceB79i4otxwadzyNxtZR1QWFdBgj1RkQK7q
	U8OPRrFy9La/WncBoeAAElheb591Hnn2557EmqaRPDaMvEqRN/nrPTQM5XZscDuNNzpIdrihwxi
	xkieV8JICM5F0cva37YpeAvm5We1a1XDJafTQM3YdM77ReFuz5fnOV76fN4weLjXNoUY=
X-Gm-Gg: AYBFou2pnzOyu4dchqHEVQXvIpdhJnpUznoCuoO+kr5qvGqxGBHwn+eIRDw+KJNlyl0
	lKqIpsnHUMWj05DG8SpFCzolHb5Y2fzLni8Y6PIcBHbNX86kxCyyTrVJuyWfYkcwr2UI3GWL5xh
	EVBf1rDwDubEt8VBJmrgckMtirpysAD2gtbHXQVcg9+P4K3UtePyMLuJTQIYoWVmOVVesw2VVqb
	nYNDnZB+piYLBNVymtTXrJP+3wfajuAm1BgBmonc+mwaS1nFrIQ6TpTVEDOrCB/X68kYSs3DH0W
	g51q5EPenfrRzGqJOhut5y4vtHOvw6OtGH4cq+UvURgIzBqiN5lZUPE7ou4zckf7WXbz08GLcc7
	GSkIV4Fw3RYghIJGR+ZTUQ3YCgKZycXkJhH1DYZ5E9cmXT88DRIRZUF0BTUk+x6HO62c6SWmGr4
	2vrz7Gvch5
X-Received: by 2002:a05:7301:d185:b0:36b:fca0:80b3 with SMTP id 5a478bee46e88-37966961040mr4045019eec.22.1794618824274;
        Fri, 13 Nov 2026 17:13:44 -0800 (PST)
X-Received: by 2002:a05:7301:d185:b0:36b:fca0:80b3 with SMTP id 5a478bee46e88-37966961040mr4044989eec.22.1794618823719;
        Fri, 13 Nov 2026 17:13:43 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm10952813eec.3.2026.11.13.17.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 17:13:43 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 06:43:07 +0530
Subject: [PATCH v3 5/6] arm64: qcom: monaco: Fix pcie1_phy compatible to
 list qcs8300 first
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
Message-Id: <20261114-monaco_ep-v3-5-7fe227cdfac0@oss.qualcomm.com>
References: <20261114-monaco_ep-v3-0-7fe227cdfac0@oss.qualcomm.com>
In-Reply-To: <20261114-monaco_ep-v3-0-7fe227cdfac0@oss.qualcomm.com>
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
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794618790; l=1159;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=zxS+46LvOuCqUZH6dROCss3FjAJ8EeURbIsga0w8/po=;
 b=zeu8POxTeEy82lD3VDgyQeiFY8IKN64oRX80O3Y4i+snxRCjKrU/EhOKhbIdETTKyhc7/Pz/V
 eJJ8oasipa7BNp0mxpXuIuLdaxZb7jk+NbLrDWPqjuna8HiTcKgWz4L
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAwNCBTYWx0ZWRfXx/J+SV6gh6H7
 ZXGQxIaBqDsbVKrT6pWvwM7YSJrF/DOtOugXBeLjG9L3+5o88HmvCRY2o4+UIeF1vbeXvXhawJj
 DEWC45OUYI31kjI4yzMdKAlVpo9YMDg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAwNCBTYWx0ZWRfX1fXLiJqOgVv3
 UpPrAmA/5uCC4hkWINfGIfw8HVRQy6k0vK+Mf2tHOkiQj2xhUedQ+FUgEsiIlnSajSMXxCyPO9E
 /eqSjnvWj1DakruCh4aafretRb3D5g8JVOrZUOKywrteszNv5Ip4vsXao6/2BX/pYm17achCmXF
 pEVt8GKgdtZsFTzyVvwP2RbkvW0ohueoaEw6wcob/OzyDJyQKv8X0JcnRu+9UlSSapNbazEGHek
 +ZMU2TDenaFdogPcNbX9JCotD5ES3n1dQ6j/0R6rtfuR6cgfErKObBbrjkjluLZ+X6rPN+v8NBr
 AwN/nh8TPpgn2yPmk8bdu/7iIofcT8QhlnFcHhLxSG4BtdZyw18Ro8IiF7uDMvTKvY12qxXL9Su
 qXO5KvyVR9dpfUJX/i25EhTKG976UbpZof5ErSGmLakM1OJCe1+OdvsQGl0AaMI0LYQSwXrvc+m
 wonk+VUvvNa/QhY4Zgg==
X-Authority-Analysis: v=2.4 cv=Zo54uN7G c=1 sm=1 tr=0 ts=6af7b5c9 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 7gVeokX83NJ3El1Vtaif0VE7R40yaR02
X-Proofpoint-GUID: 7gVeokX83NJ3El1Vtaif0VE7R40yaR02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_07,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 impostorscore=0
 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611140004

The existing pcie1_phy node only listed qcom,sa8775p-qmp-gen4x4-pcie-phy
compatible, since no QCS8300-specific compatible was documented for this
PHY at the time.

Now that qcom,qcs8300-qmp-gen4x4-pcie-phy is documented, list it first
with qcom,sa8775p-qmp-gen4x4-pcie-phy as its fallback, matching the
order used by the pcie0_ep and pcie1_ep nodes.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 35fbee63d4c6..f27f0953ab9e 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2598,7 +2598,8 @@ pcieport1: pcie@0 {
 		};
 
 		pcie1_phy: phy@1c14000 {
-			compatible = "qcom,sa8775p-qmp-gen4x4-pcie-phy";
+			compatible = "qcom,qcs8300-qmp-gen4x4-pcie-phy",
+				     "qcom,sa8775p-qmp-gen4x4-pcie-phy";
 			reg = <0x0 0x01c14000 0x0 0x4000>;
 
 			clocks = <&gcc GCC_PCIE_1_PHY_AUX_CLK>,

-- 
2.34.1

