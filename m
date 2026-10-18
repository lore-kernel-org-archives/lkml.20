Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8033B9D9F
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 07:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792307833; cv=none; b=CV8ogBo9buTgw9nqp6N6uJbiQg3fQ0Ixmd1UTrLCvoBgSMjU/rzqHYQMrJX918Xtl9F4IEomq4nnRMPXNNE29XapeXOGgL/chbTOn5bEEKweXesXAvApHxKyeswm95puePSBng60YHRIB1qjzLj9nQ2GCom7UEmTK5g+sbYajxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792307833; c=relaxed/simple;
	bh=gX8Sf5hSx2iy6mk8J0qxlIs6miMk/VUezEOUJS/ry0o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a+rF6m7xV2zAbp1ZthQf8BwlSH0Xza8U0NjEtnNFr+9ZG8lYeo2PJc8tOBq9NRJaOBallnZc1Pq/NrKyxKpUagNthEJOfsQZTUGdoBPMUSwN0Dct+OkB8+D/QwItDIutZ+yyJ6+WNgznIv1R9WdPzISvgY3mNLqNv0tcFi8PgGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CbYIo2zM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j11KLK+0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CbYIo2zM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j11KLK+0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69I5tNPq3170521
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 07:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Wl4aLCo52UTZ5qTjAtAaLq/RHmPxmM39F8eOkDWMSE=; b=CbYIo2zMLQPTkovi
	VFHD1IBo3tHKh7YKFY1dGsm7p2hMAJZkPh2QFyCRDcmVUGXlg8yizCvqzDP+TXnu
	fteZchIXlHDgkSsYCRXOBGjHQGP35j9XdkhqdPCO8P94yLkwh4pSLBDl97pTjjCJ
	PV7WBvcwOGNVcYnskgR33sxylZrF2QrSL3wi1KrRZ3hGKHG+KokBFb5U8xDXeEFI
	wPBwT0tbvMU9owWD+F2H69LW6M371JbSB/1wCpIc5uotXvMdNsRPgrfE6JiMT1Aw
	4TzQ8Y5ZhRnOWH2HpcdZ5cAoYtuclWg/uROeU3uiaoCGL5DuhxYY4Ngli84O/hv8
	IaN0sg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc183aksv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 07:17:11 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c3c370b17so2517432eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 00:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792307831; x=1792912631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Wl4aLCo52UTZ5qTjAtAaLq/RHmPxmM39F8eOkDWMSE=;
        b=j11KLK+0Ok4anzYHpBi9Z8YRrcYyi5zDDvL8KtizM09hzwzMyxifXkv6w0J35XnJWU
         n6Sc42wvYn7fzabC1gB0YhUsada641kBLRqKxuNy7L7mW0t29aUDWL3M6SsPrQYsUVZm
         d2SlJwOzYUUFTyfOvXFfkBo2EZ9ipex16ck4OnEuv0yaTbmByBCCcV1uwQYI1sdE3k/n
         2g/DD/FsdDqmMLvyow1+j3hhutriQc2mSmJeUp2TWBQtbUGWxdHpdmzhEfvZjErZ7BDf
         JpMZCTOy2ga/5Sk6YT/2pmv/RuLIDxkswQFl4TRtkbiYCitPWv8aB+nkwNZ62peXCB9L
         IXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792307831; x=1792912631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Wl4aLCo52UTZ5qTjAtAaLq/RHmPxmM39F8eOkDWMSE=;
        b=h+pjgX5UK5lr98bYaFVZWOfESImwa+gnLHsUpxO8u2oxb4ggH9o0YtLwc3iTwgUSY8
         31nsd5Kyr5jzzpRzXewyrWO7CNhN1u3Cp1gxk5a6uQ419CQ4KGu7Y7anpvKac+N7u7LJ
         /UJa99ZLFXGF++mt53El+D3ZRZ+/vKffAU3Mhfib08tyde+0YRd8qqae+q01DpyIVcWp
         R9hz244/9GsN2JufPHVQA21VwaIFNtgTkRbfjvT6YXsSGjQ7ktWxTovowY7Col2CEgo4
         ACPSn9qgJ0L7INVwGHDqcGml8U7B30GVv3vAGDj/TU285vtaFMlx5ocJp2TyVZ/iFO1N
         ZMIw==
X-Forwarded-Encrypted: i=1; AKwUvBz8YuOAN53rrHeEKPVJjJtaErZv7YnMHmNt27yIKefL63s6Z61rflUuDyylPSzGSyCPTsGjuhhanhK73ZQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWep/9TZTVun5A0Y8l/Q5JvN4BB5Q8tVlCCpUtKBfvwRuynvlr
	IR2StNwt0Dr8kMKh97IQwHtadbRyEkijxvQU3N5IRWqtCe5Ub564WU8d0Nquzcu6VrFL2vmjDX3
	6QDYwqXgZEjbj64jeNK1aXBCJGg0cd6BQoRfqTRf+kvwjCD0XDESEaIsowuXnh0dckH8=
X-Gm-Gg: AYBFou1wPpvycrob0Y8owm8Ev1C0Qr7Gz4fZWbML0W8/r95wjBFDYNUsZ6Ny8O89xsv
	jn0P8o8i0wYGqRy1nH43szqtANrHMz30QUZrsLa13PMq5nfcWoTsEh6XZEoTTLxwlgyD0VmCCu6
	0J0uYa53qP1CfpqgPpkRUoFJvVQwyRjHT6oN9Ic/2N5tGCW7rPqfO8xKtR0a2FRCfYZagPHg/pC
	cWk9+4u2l+Z7eZFJJNJNGC8joDWe8FhaKeczDfhCIVuHBwck+lBox3lgKkMsMO7tOIUVndSpz4i
	T6OV8W1VRYVDmYgWPcIw4pSFmToUTlIbDsSDv3WhFdpkXC48cv38MZAGRqa9lxt49lIcmKaCgK0
	mvTVyoHdC1ZoZzuZeHBrUlZ/KP5t/wIvhLn4=
X-Received: by 2002:a05:701b:290e:b0:14e:8d1:1012 with SMTP id a92af1059eb24-18512b3e51emr6106027c88.19.1792307831083;
        Sun, 18 Oct 2026 00:17:11 -0700 (PDT)
X-Received: by 2002:a05:701b:290e:b0:14e:8d1:1012 with SMTP id a92af1059eb24-18512b3e51emr6105996c88.19.1792307830468;
        Sun, 18 Oct 2026 00:17:10 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm18646776c88.5.2026.10.18.00.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 00:17:10 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Sun, 18 Oct 2026 12:46:46 +0530
Subject: [PATCH RFC v2 1/3] arm64: dts: qcom: nord: Add SoCCP remoteproc DT
 support for Nord
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-nord-soccp-dt-v2-1-4d713d316e9d@oss.qualcomm.com>
References: <20261018-nord-soccp-dt-v2-0-4d713d316e9d@oss.qualcomm.com>
In-Reply-To: <20261018-nord-soccp-dt-v2-0-4d713d316e9d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDAyOCBTYWx0ZWRfX7dEtZxhNHs4n
 0kVZwv32kb3Uw+eObJ8nZaLmJrghlpMdKtBFERGSVTvkK/U6kEQ/flX+h06PACPJN4sXjwt5NGT
 M7as1b17ObX59Dk/cJBBdPAaKEmbXeI=
X-Proofpoint-GUID: YT_FiIrWDnnsI-KMCOjx42s2ZDGqyfh4
X-Authority-Analysis: v=2.4 cv=Bu8IUoX5 c=1 sm=1 tr=0 ts=6ad47277 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=qGMJ7aszbcm9s4uXBBkA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDAyOCBTYWx0ZWRfX7LkJ616wXuZ1
 nRlhVSaXFVBVi2vJ6KrdF+FE76C1LCGimdmaFzvUaYzvYER3eTVWT4JE+KzjTRlsTu0+oZDmJML
 Cmyz3faPomulSnKmOF13RXR3zSA86MbaveFpKT5+ztG2ZMlru/SCJuj/Wh7O6rjxc4s5Whbyu5W
 j/aT5Bllq1NUtydqrVvUjNpv/bSwZnTbR2cDlPJXIo9bu/8mcpEel/UFOKDL0KFUCHxdsO0+eCC
 +xsFWNNX2r4lpGuCw4ms1heg5hodUFkm6T4JERklMhzIDpdg0uY6s9FijF4EgCjsg1aGvvlwBc/
 nyjvpSJyeg6igGHoWtUDrHLEfIVnkhikC0hjAVKfQ7GDwJpn9J+kRBQ/ZJ8SsMn8fdXe02OA7Zp
 Fkiz+vE9ZR7zspkn8iN8KbMh/qXAYgDzBbUpCWRer+PCWuuBoKSEGRMzlWO5GziyMVBDCntJuPL
 cHwr5zYoN8X3TZFmpjg==
X-Proofpoint-ORIG-GUID: YT_FiIrWDnnsI-KMCOjx42s2ZDGqyfh4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610180028

Add the SoCCP (System on Chip Control Processor) remoteproc node and
its SMP2P configuration at the SoC level in nord.dtsi, and wire up
the clock and power-domain dependencies shared by all Nord embedded
variants in nord-embedded.dtsi.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi |  9 +++++
 arch/arm64/boot/dts/qcom/nord.dtsi          | 57 +++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 6dc4c871f41e..e21b9ba480f5 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -430,6 +430,15 @@ &remoteproc_cdsp3 {
 			     "nsp";
 };
 
+&remoteproc_soccp {
+	clocks = <&rpmhcc RPMH_CXO_CLK>;
+	clock-names = "xo";
+	power-domains = <&rpmhpd RPMHPD_CX>,
+			<&rpmhpd RPMHPD_MX>;
+	power-domain-names = "cx",
+			     "mx";
+};
+
 &spi0 {
 	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S0_CLK>;
 	clock-names = "se";
diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index dfbbaf94a7ae..827531fc1276 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1029,6 +1029,28 @@ smp2p_cdsp3_in: slave-kernel {
 		};
 	};
 
+	smp2p-soccp {
+		compatible = "qcom,smp2p";
+		interrupts-extended = <&ipcc0 IPCC_MPROC_SOCCP
+					      IPCC_MPROC_SIGNAL_SMP2P
+					      IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc0 IPCC_MPROC_SOCCP IPCC_MPROC_SIGNAL_SMP2P>;
+		qcom,smem = <617>, <616>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <19>;
+
+		smp2p_soccp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_soccp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -1587,6 +1609,41 @@ uart13: serial@a98000 {
 			};
 		};
 
+		remoteproc_soccp: remoteproc@d00000 {
+			compatible = "qcom,nord-soccp-pas";
+			reg = <0x0 0x00d00000 0x0 0x200000>;
+
+			interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_soccp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_soccp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_soccp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_soccp_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_soccp_in 9 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "pong";
+
+			memory-region = <&soccp_mem>;
+
+			qcom,smem-states = <&smp2p_soccp_out 0>,
+					   <&smp2p_soccp_out 8>;
+			qcom,smem-state-names = "stop",
+						"ping";
+
+			glink-edge {
+				interrupts-extended = <&ipcc0 IPCC_MPROC_SOCCP
+							      IPCC_MPROC_SIGNAL_GLINK_QMP
+							      IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc0 IPCC_MPROC_SOCCP
+						 IPCC_MPROC_SIGNAL_GLINK_QMP>;
+				qcom,remote-pid = <19>;
+				label = "soccp";
+			};
+		};
+
 		rng: rng@10c3000 {
 			compatible = "qcom,nord-trng",
 				     "qcom,trng";

-- 
2.43.0

