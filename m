Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014265;
	b=p0sV/7EmNSDmj9JWfFQMBsM8id52F1MIMdXoIlQ6LLVTK2QQT9qg6nCwIZKRsycn+tW3
	 EjSX9bHFowh0CFh3QJxUfc3+Y8uSNlsc7vYRwfxywKv+m7RP2dOgvCZ/iKKCCp3FvDH2t
	 eVC9ke4FNdpCPEkUznydT3FldpC8bO7lRAK8gwlm9Gg4XRAOrCidYgDKCWP2Y56krXHo2
	 cT+oFiJyz4sEZiEf8tcGI0RRJjQknxI9kVJlfckYJJIf+2sr4nFCZoJw26SjoZtFVvRFC
	 p1zZ2Fi4vpOvxsa7FV/6NWOekzpRtvMo3RaiA86hH+RfM0i3P6Q0TEjd/1NR4+pI7EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014265;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1u7BOZ4HXoiDpqQfE+eys0BaXB4J5QVKelBVG2AU3rk=;
	b=EkfPSxciYYUI9sjgdhIUovO/siBFWZDspmIl6e6jRucns3Jv6zee4OePyV8oI4LqhXFr
	 1MPTvdtg9o745PvBU/LOiZMVUi/BX7s1A/3aX9l3Dsj28Jr/AHaYUQJhl7Tn5cNvGpWte
	 R0bDjiZOICAmn9+VqOQZra7o87H49EHckLMthgZWXVfuwcelpJv8hJiEGcXOjaCyHcVKG
	 YFMdpeDjPpgFsahjI2+KNqSfmMoRhA/QCtIvubcSc0k+8P66QKenX1vs5haukYdofaxQy
	 v8fe0kbpM2CF4e/gdcxxfLXWnu4cKaomuZbVRtALcljbQowHhIRL8OkpCVXyrbJJMCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HtLNkUTM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z7743F42;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CF6606A321
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:31:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82CF6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HtLNkUTM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z7743F42
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtIRP3085493
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1u7BOZ4HXoiDpqQfE+eys0BaXB4J5QVKelBVG2AU3rk=; b=HtLNkUTMolx1qtB1
	TW5/7L69PCVG1AC8+nEv8EkukyHyRQJNQb40yUZKsJ5EDYqw72mO+fOSfRLbv0Ac
	zntv23IX5ptpf/UNZH1u9Nv1zjveEE6vBRXzEYa3J8aGU16C12cN9HH7k0ouPM21
	9NrCuCcws56R8cAXOFnt4c0xEw0nflWVMIRPGcWFcplZQZR/k+uRt1S2wbtNLs+a
	zH4FARObvu24avwUyZePi9mVCBUszUwSl9CXTDH/ctx0VbZ05WQesT4mBkMeDa46
	LZF66kpm7M3t2hxvp7tZyMJ0jMihkIyxTitXK/g7z0Vcd4BtWdbr6YP2ZIi773M4
	Cfi8hg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmw3p4kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:31:04 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae1d132d52so766569a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014264; x=1793619064; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1u7BOZ4HXoiDpqQfE+eys0BaXB4J5QVKelBVG2AU3rk=;
        b=Z7743F42nD1f9to+/Q7H6hajZpYswieM2gw+0SeRvaVoR7+4At+zCeyeuhi/n+IxAH
         hR9azr1+ISHd5HFQg4JcxmGGOBHeVGxNcmpUikY2f4fQGzTSpc4t+vL7BGYgDqkU7jMH
         xZ511TCyCyNt15/PNQlVTh6HJOfpo3IA7WtHaFfxEZ2oXL5zbwRFALZawZejh3vIOELG
         nHShtTu/7C5PZbNKpFux67+shAyIdgtWJxtwS/aL6OWhW0qAR++zygipCS7CBJhXXqV1
         /YSM4abMbA67+wAEnrIpsHTkianCVtIyUYJTEMPBfyIiKqAXFtHfRqOfDKfEONZj/dzH
         q1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014264; x=1793619064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1u7BOZ4HXoiDpqQfE+eys0BaXB4J5QVKelBVG2AU3rk=;
        b=1PObbkHS+iyxZeorwmlJ0HF0hQiFrD6wKMplIuZ30bprwjf8tkWc46dmb6NaaKGyFq
         O+6YhRM1n2ete8SGi4LDSo6g0IEfpUyje3VWnQLvCdO3gysj/vKpX6I7028FbSFVzoio
         q+8HnCJiWrZq1i1676FdNQIqvGZTZCQj6a2Ghw0k7uQCnl0jCYPKbghFqCyma1se2JOX
         I5Kg8yFNF7zE+g7/tGutxB+hAuSPoKUtNMs+x638DGAVEfuxyvhu9lXCv/KDFIsM6enn
         A0q59EVa+8rRMBY12XE0sw+bpdjfG+zLAW2X/5pa5EIvEggr/bpIqUkbs0PcnGEuye1i
         nYPA==
X-Forwarded-Encrypted: i=1; AKwUvBygsaAoLKnmDaMEUsoq7K6iwUiF5No1HYc+bnLmFsqORO8nDMfDHqTKWcoI/SQ/KK/x/vZ2PAy9YsSLmO8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJh1ieD00UBt++npcfhFIa0o3BKTI8hSWk/TI/Y6IhP7wcatb8k
	cm1kM3zBRBjRrOcmI66QO0p8LLP5mgUtBlI8ApKW8S8uI3AmOCeTB9zGFgFofk0s3/1coLzH1/M
	5ePbAQLCt8Pu7aaxrQQmm9J5S6qEF/lmDOIUHd+ZIiySTO3OBhpB5aJymN5y+xFOqtWM=
X-Gm-Gg: AYBFou06Cp8Xo4bl3BPUQKW+B28NtKToIPh50y1nGst+U1dl9k8VZhUDrb/5lyeV+sZ
	QDzBsOgT1FVuqfiHEjlBp6TSYqFRRhMsHOP7dHKIuDVs9HhA8b1x+mNi4KYHNprEjS0KcBZHOzx
	ZULAFJqv2fqxTSlNCnZ7lF3I7dQarOpv/MzZl7KhQDHHC7M5JEngVOi4VyxqxwHip5qOAXNsyUT
	MsMXrS2TET7jdNWP3089WxgxBYgLr/HNMwx1D3fPztXEiKw7kT1Ux9CTsys/FXSya+tHmFe/oPf
	Wkg+tDqiItGM7P0cJz/Q/JJ1Z82UxeE0vaU23B+ZYG5bzfJpA7xqKWUTQvqUG/O2S7oyKgJwBXx
	4MmP4Pb2hS8LsA6omCwntMs8=
X-Received: by 2002:a17:90b:4a49:b0:3ac:9d83:8861 with SMTP id 98e67ed59e1d1-3adeb0f8d94mr5582101a91.67.1793014263364;
        Mon, 26 Oct 2026 04:31:03 -0700 (PDT)
X-Received: by 2002:a17:90b:4a49:b0:3ac:9d83:8861 with SMTP id 98e67ed59e1d1-3adeb0f8d94mr5582076a91.67.1793014262860;
        Mon, 26 Oct 2026 04:31:02 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:31:01 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:36 +0530
Subject: [PATCH v2 10/12] arm64: dts: qcom: sa8775p: Add GP M/N clock
 controller
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
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-10-ff8e4bc8d567@oss.qualcomm.com>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: iTnd0Drv6nRtBVH2d61R404m6xN6yE7b
X-Proofpoint-ORIG-GUID: iTnd0Drv6nRtBVH2d61R404m6xN6yE7b
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX8DufBCXYy2Xj
 wCQpuZf29Jubn3/EueWqfggwRrcE9CZwzYKVn2YyGnzLrI43zYWEtoXOeymcpeIyYLGtHzoDhil
 ejzHXVHUxstvTGTZMB4vjYSFrx9uhvM=
X-Authority-Analysis: v=2.4 cv=HqHjiETS c=1 sm=1 tr=0 ts=6adf39f8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=RQSmaMWm8AJIs-iJKlYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX2cATNcW5d6nJ
 vJlKNBPyys0exvPy4LY72Z+8sH03SKKN/RkRKCg6QU8pPPi0jGb0iBu1TfqPbJrZJh4aXqNEqxe
 POQp0V16UauMBvx5s/g8vKBW6A0Q2LX788P0ND1RfAY+T/RK+y73Kr1wnmiTh98u6jYTjtIjlDa
 u09g1J7X7yw0MiFenj/Eem+f9U/NXirNWcBenBBgmINWr64fNytNZLUSwReWgqPYfW8qIIiUeXD
 ePtH9DBjpnxN6YBzE32KMdencMqomwumjsTeyTF4FMbFBXE/UOEfZ6YxQRJbLJTHwp3w96Zri/u
 zPvIIoFnlgqwP7XEUACmsJzcbza0kUW1e8tzFGsLnfeSmdyRey0eqhtl0mryKWgxfUggNuDWbKv
 6WcQ4kgLsoux2uooucnuN/AKfjwUfZcaH11zU0NYTiyPDWWINk8yE6T6xwT4VjBJvOVlOWZHDwP
 39QY1WYUlJ5pOYJ2hYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260045

Add the GP M/N clock controller and its pin configuration for SA8775P.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio35.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518446ba2ea582e8362e86bba75c379..4132d288e3a16ab0a6d8b6d0816e85671bd25c73 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4348,6 +4348,20 @@ opp-384000000 {
 			};
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,sa8775p-gp-mnd", "qcom,sc7280-gp-mnd";
+			reg = <0x0 0x088d3000 0x0 0x1000>;
+			clocks = <&gcc GCC_PDM_XO4_CLK>,
+				 <&gcc GCC_PDM_AHB_CLK>;
+			clock-names = "pdm_clk", "ahb_clk";
+			#clock-cells = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&gp_mn_active>;
+			assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+			assigned-clock-rates = <4800000>;
+			status = "disabled";
+		};
+
 		usb_0_hsphy: phy@88e4000 {
 			compatible = "qcom,sa8775p-usb-hs-phy",
 				     "qcom,usb-snps-hs-5nm-phy";
@@ -6017,6 +6031,13 @@ dp1_hot_plug_det: dp1-hot-plug-det-state {
 				bias-disable;
 			};
 
+			gp_mn_active: gp-mn-active-state {
+				pins = "gpio35";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			hs0_mi2s_active: hs0-mi2s-active-state {
 				pins = "gpio114", "gpio115", "gpio116", "gpio117";
 				function = "hs0_mi2s";

-- 
2.34.1

