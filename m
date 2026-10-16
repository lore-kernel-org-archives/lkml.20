Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFA447CC7F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792149440; cv=none; b=slPm4zTNQd20WpurEIdDHeY7T6SCVlHIYBx1RBnJewAfne5xQu1ITvwJbNKHT5bTDCtOjpVKdk+Cy5u63rUjc0mDwS3mMhHRY7WMQM3KaEur67kzcLISamXXgnAgt9/94TVDXHHZ+QrIFTyGNLI+3mB0vw++8sVWUxOipPKwUi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792149440; c=relaxed/simple;
	bh=IbCgg4z28hRd7eRsRoCXtFCpbgA5PnjLQUnM4sY+tPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RsXoUDwyf0RHAAuhMawjdR4j6qycrkH9ST01qH/yuTr2bEZWYMAp6OI2dEwPiU00e7B3x2xd6sJwQo6zVWlBGGsmQyEf2ZSPgVkHssrDST3422Ka42LKaqhRpU0AW9c4d7Xz5o4p87PhJOiVxswQnngvjoQaR8O5oVeL7Q9OnUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cQ2a2Mhg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PA7mdBOu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cQ2a2Mhg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PA7mdBOu"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAAIfK2998514
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RwIutfYQVDI9/OP+nWxrrZ
	DrGPvBPRfBeRnPFtihytw=; b=cQ2a2MhgmdH5ncQZiSYFbErrb9kVIuIqmtVjkq
	QJnkrozzBvC9tffM2/IFxil4Bt4+22Zmk1qiKIOXXZlmI9qzqNBBtQX2325PEtiC
	b09gx4tskCjOLAuBqHNr6prW+K0kJIHjXdPFXQ5oqXMEo4+VS+uV5yk3m0P9PlOG
	StayPzY4vvZz2G/lq/WfANzPbYzWsawADe1QRD5TIZJnabnj5DeClrw3sQGazaGX
	+3YL2r/udzDChtmKBg+ElKhQtYXIk0M65OwEoaFOu6uAKU60iviyMS9NnscYPR90
	md3dQ4XkSlUP01RDxNibdfc1+O55Cwu7hjZNaZTYq/0OvYWA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8r129sc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:17:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1f2fafeaso53881085a.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792149435; x=1792754235; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RwIutfYQVDI9/OP+nWxrrZDrGPvBPRfBeRnPFtihytw=;
        b=PA7mdBOu4mXW/LxNs9F4XJI4K0WAoEx6scTtYfZyqq7r5yLUH7Km0y7+eu1322giSL
         C9RYe7fXL++kGXLLmzhRgg3My3b2F8z0qjI4wd+t7GGbEIAKa3KR90ed0rvk5fC2OeCg
         fOaoff4IzBGQuFUFCTkxKWBXFkf500+BMA8sdTEfokXmicadcsGJs+Lcg1c0ydj8ESqW
         g4xnawl+5XIzkeQ3DvE+GsW7FzVtFbgN2BOt+xC9MmjDvA49Xd7P44M+2QYVP6KRWCvg
         JeJ39tzeztiPUifa4fF/5O2sk+Uj8+azBzHZVGkGtc8PNg5tDg8vwmoDDAetFAjgv30g
         Wp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792149435; x=1792754235;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RwIutfYQVDI9/OP+nWxrrZDrGPvBPRfBeRnPFtihytw=;
        b=V/myjQ91TErfuE7eZ5VFowZB9khv518Ij6ORY8CrtxXiCjDWzIDCjWN/zCy3EqXVbt
         oxvA9qOeYi7SHUhcGiRZHkfexUBMTzLm/BlG4a64dfAaHp8mtEPU8gXpc63+eOBYCZoB
         K7Kplzm4CSFwpWEIU8vqrh26nMeoYYFyfm60BOTL3X/VTX5fNeXO1GOh77uol8UJnsWk
         TGF2vzWzreJTAbgoiyppxyT4pi8zZvNJ9gHiXmc4KxBUvjShAREK1OKpRtPkIqV15OF2
         u9ZdqY1IfzmLqrzd4R59iNFcevztS3WWLYMKdPqRpcCXqGnj7zORkHZ7dB/CxCTMpnQr
         KOTw==
X-Forwarded-Encrypted: i=1; AKwUvBxij6EQ96kSvY0jfkyMetemHSZaBSottCQAsz0V5W9fCpFIfWEdaS7AH4YizF+TDvm/aAt2hq2ITuF/xoc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNQ1HgYOVwBRSSISboVZZ0UjR8QyD4oh6zuTCCclHEAbsDyQ2W
	cFqWlEXzmjpB1NhTe4djTtEgzukMhNS7HoCP1uja43b1ufeUHXhLauXP70yi9MHbH6Yysi9a9U7
	8BzwpNxb0y8AT5YAPLrMknd00vYLX0pE3jRn70+E46Yml/XJx6bW8LEmh07+H5+mwq3YkeqVx2u
	8=
X-Gm-Gg: AYBFou3nUTXA6cegm61PzwCWSWYzoqIQfE0PX0y9kxjjw2cxN40lmkkYwUxWb6KDu3O
	AjbF5LLZj7mH4mZHxs3wrQKnJzolgztHdY13M5LVXhrM2QiTilximaYxjHH4YHHmNigjLLtVT4F
	22zNyxk4rc7XcobACzwvDYcbnoGQ0ujdz/23YM+w8G4O6t2mbEiC96pDQnVZyqt3jlDgqqfQubH
	cFARF21lH2Kpf24isBbHlEqnN4mgd1I8iZYxa2akuJuMoYPDZYymJ+9FMMiQnFmB2QSP9QKYmF0
	HxqAcDICC9cXvhu4AD+Bwh4zG/wXpoB3G3rlnzCYWMt9+Wwd8ZrOtTmyb3U/A9cUJHzOlfSKn2e
	QwwOfWMzHFg==
X-Received: by 2002:a05:620a:46a9:b0:93c:17db:d91f with SMTP id af79cd13be357-93ebd227087mr3641258485a.39.1792149434929;
        Fri, 16 Oct 2026 04:17:14 -0700 (PDT)
X-Received: by 2002:a05:620a:46a9:b0:93c:17db:d91f with SMTP id af79cd13be357-93ebd227087mr3641252585a.39.1792149434287;
        Fri, 16 Oct 2026 04:17:14 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a9ea3bsm39854105e9.0.2026.10.16.04.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:17:13 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 14:17:10 +0300
Subject: [PATCH v3] arm64: dts: qcom: eliza: Add FastRPC support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-dts-qcom-eliza-add-fastrpc-v3-1-4e3fb632300b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALUH0moC/43OwQrCMAwG4FeRns1oq9bOk+8hHro21Yo613RDH
 Xt3OxW8iHgJ/OHnS3pGGAMSW016FrELFOpzDrPphNm9Oe8QgsuZSS4VX0oBLhE0tj4BHsPdgHE
 OvKEULxYs10obNLa0nmXgEtGH6xPfbF+Z2uqANo3iuxGxafPV9KntA6U63p4vdWLc/nW9EyDAV
 miUdhq5qNY1UdG05pj7pyIPNuqd/IilUD9FmcVygW7J595Lpb+IwzA8AI84FUJEAQAA
X-Change-ID: 20260721-dts-qcom-eliza-add-fastrpc-c0868aeac9cf
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5859;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=IbCgg4z28hRd7eRsRoCXtFCpbgA5PnjLQUnM4sY+tPU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq0ge3myR/XjGP9cEcd3OeeO1xMRhDzqaQ0WnQH
 u7XHNDiq+6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCatIHtwAKCRAbX0TJAJUV
 VhW7EACeloM9WUXfwOc4H5kWiCAUh/Mss1Z1wogHs/omX25HGIt5/rwFgmkfHtKn4+ee8r2LWCh
 UkJ0J7JiDW8UJjbWAeZdphA1UGXSKc7Y+HPpWHWySs2l0nX/18yXUV0syoWXp/cv6nQan88h4h9
 PrpwCqs17ur9e9wo02+pItpGjfHZXeECUTqxnAdiNpojLXD4Xz/ysGnRYRhg1slKT1UUGaQtGra
 H7abImSsjTxSPGpbwovc6HLLvUZ8WaWOA+/6x5nSDyg1yhjXh1igHzS9T+5c4qpVrHQA5uEnfE3
 9jCvK14x8H6Y41v4OLje6C3b4oRb9TFid/FcKZzhKy31sR3Q86N53cdNuai7LlvQhE1CT8FY2uZ
 Tai/jt1+AzklK0a2i1fTjhYLkiB02zTM+ubEZtKfVIYMpKcOIM3PyySxAaRO3BNULiMYKUj8ohD
 G4q3Fyi1gESZX9qO/omH8ToQTtBMdS4c8JBOTSQCPzJA2DWkm0QJsq3aGYF7XOVA3tBG8sRtf5E
 szjyrrD38uIDGBNa8/AWeXVejza0olGNdLmA9SGgiIddoOGO3yz0qQBYXMh0ZUPdWq5P/qpNisA
 ZDcqofMefg7D6TbY8TaRCMhtPW0J+PfyEM0WPUpfb10w/HVBrPGjFtRAH+KwyKvcGEXrxGW/Zfh
 0AVKi7uzQzHqbwg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: f7zey657UmQrcgokAEWbPx8_Xr5AAV-D
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0NCBTYWx0ZWRfXz4CIFrxFSYGS
 yN26ETGCuQLcRQKzt9mNar6XGwqGJHEyw9YejO9SRDmcX+x0vMlMqLU37Erp6kzfQxa4vVDv0/K
 KhdcoLKpXvkqNs0o5CDhT2/ImQV/Qm4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0NCBTYWx0ZWRfX8cdIkb/0MSeH
 8kcLtWZrGH5v3u/pGGT1RbXK7Yj52ERzWjXyojUT5KjTNouF7mULZHzAbO/3b+azhCiBAugro+P
 jm6lRYktvhpwAIt+RkQ6Y+qf57rSqy05+WERFxgDd4+U4Q0+0TxAUTW+imV0E9dfm7Y8qxyyFJE
 5pXpkHyaa7kXZQHS2jrLyi65dDzsw0ihWg7xiIlIwC8blJbUDDNO5KYZr7aX8B6STB8mleb7yHP
 cZQnbw9pEPN3wH9QWR/wA/1B8h5IF8HuqM7DXtX3ZuZOMuZQstiO8x9Y9aGcqTMynwsz/gO0XpD
 uxCrcdcqDNDwL8wXIIFeqcENCmBXQryukGLnJ8ACcoG/9y38RE4EnFpKjNyMLRPTLTwH1ofqP64
 gajXxXhuC9iGYdbInRwEUlWm2IPGN+5C4s37WljA/gQlTUGE2f8DkMz/unnKMFLRksKQvSgUUbf
 uy0O1iJU/r8MEnTmtIw==
X-Proofpoint-GUID: f7zey657UmQrcgokAEWbPx8_Xr5AAV-D
X-Authority-Analysis: v=2.4 cv=L/CI0OT8 c=1 sm=1 tr=0 ts=6ad207bc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=iNmt55xwLDWB6Bi4V4cA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160044

Describe the FastRPC nodes for both ADSP and CDSP remoteprocs, along with
the ADSP remote heap memory region needed by the Audio PD.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v3:
- Rebase onto next-20261015.
- Add the ADSP remote heap memory region (no-map) and VMIDs.
- Link to v2: https://patch.msgid.link/20260916-dts-qcom-eliza-add-fastrpc-v2-1-95ed704ff268@oss.qualcomm.com

Changes in v2:
- Rebase onto next-20260915.
- Drop the CDSP glink-edge description, as it was merged with the
  CDSP remoteproc support.
- Use the documented 0x1063-0x1066 secondary ADSP SID values.
- Drop the undocumented tertiary ADSP CB7 stream (0x1087).
- Link to v1: https://patch.msgid.link/20260721-dts-qcom-eliza-add-fastrpc-v1-1-cbea68d8e01b@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 160 ++++++++++++++++++++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index a8042291bd07..2ad40cc3ce4f 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/clock/qcom,eliza-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,eliza-rpmh.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
@@ -615,6 +616,14 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
 			reg = <0x0 0xff800000 0x0 0x180000>;
 			no-map;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0xc00000>;
+			no-map;
+		};
 	};
 
 	smp2p-adsp {
@@ -2432,6 +2441,69 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 				label = "lpass";
 				qcom,remote-pid = <2>;
 
+				fastrpc {
+					compatible = "qcom,fastrpc";
+
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+
+					label = "adsp";
+
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
+
+					qcom,non-secure-domain;
+
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+
+						iommus = <&apps_smmu 0x1003 0x80>,
+							 <&apps_smmu 0x1063 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+
+						iommus = <&apps_smmu 0x1004 0x80>,
+							 <&apps_smmu 0x1064 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+
+						iommus = <&apps_smmu 0x1005 0x80>,
+							 <&apps_smmu 0x1065 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+
+						iommus = <&apps_smmu 0x1006 0x80>,
+							 <&apps_smmu 0x1066 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+
+						iommus = <&apps_smmu 0x1007 0x40>,
+							 <&apps_smmu 0x1067 0x0>;
+						dma-coherent;
+					};
+				};
+
 				gpr {
 					compatible = "qcom,gpr";
 					qcom,glink-channels = "adsp_apps";
@@ -4571,6 +4643,94 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 
 				label = "cdsp";
 				qcom,remote-pid = <5>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "cdsp";
+					qcom,non-secure-domain;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x0c01 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x0c02 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x0c03 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x0c04 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x0c05 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x0c06 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu 0x0c07 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&apps_smmu 0x0c08 0x0>;
+						dma-coherent;
+					};
+
+					/* note: secure cb9 in downstream */
+
+					compute-cb@12 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <12>;
+						iommus = <&apps_smmu 0x0c0c 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@13 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <13>;
+						iommus = <&apps_smmu 0x0c0d 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@14 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <14>;
+						iommus = <&apps_smmu 0x0c0e 0x0>;
+						dma-coherent;
+					};
+				};
 			};
 		};
 

---
base-commit: b810335a0699d1810683796b0e3ffe8827ddfe6c
change-id: 20260721-dts-qcom-eliza-add-fastrpc-c0868aeac9cf

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

