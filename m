Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768198;
	b=QFcfTF7e6WYZ1uU+k1YyANOvJdRg3qXKI8DrrAr53hQGtoqRRWfy3F9H2fqdoEKYpM0R
	 Y8s74A1N9XBogeY0fNnLiT7C816c32hi34bVzn3phuPhQjVvkB1m5gfZtmcp6yYyka7zG
	 fBTsKoqFI4gVsifv6Hxa0XbQKsRKN92c9rKrOGNmgc14Z4fW2LLw9urDIGVBZqqwK5l8V
	 b7H5aq3wqESqm3GLWthH2lFsZPs4juzaDd+66AunuvlPUB11CBJkmiTlRAgcGKMdb7gR6
	 J0Vh0cclXQG0kSLgNzbaoR9lyb1HNgepfD2xvjlcbviYbiXkhcPu3EN57LCHrSpuy9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768198;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=posbByi2C22vAqDX2ezu/Vx97adQ0JmvEhOqcNgZPY0=;
	b=OErjepxfcJszFn4ovRgZKQmxzTULutNIwJIV9hZKuFaQEewok9OlSR64RhbkGLlmHDgp
	 Wa1Eh/5/6z3V7HCbHg0i+q60SSkB9ARxFc69vpISs1B9D+S96E+Oqd87GtZldeDJ6VQVk
	 /EyT9CxB2HOPsSuKI1qtBMS7zYrJZonpfM+r/7lX6akzv5EsSk5fxFbUU8lwfnUlKX+ja
	 4U274484IC1XLaan6a9ICOr06nQ5HrtfyO9MvghNj2H4nBhyd6NQlZuuxTFzlFSIAfsM+
	 losDixOnXsGYC2Km2g7JwsuDn8GoMPNodmUCEfzk58DoJayo++xJtQyTaVNzSop0dUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="k1gQCA/N";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A1d8bkNn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1142560A6F41
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:09:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1142560A6F41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k1gQCA/N;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A1d8bkNn
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6pR73480895
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	posbByi2C22vAqDX2ezu/Vx97adQ0JmvEhOqcNgZPY0=; b=k1gQCA/NeRRM0N6X
	bs7GqQN4v3pJZ2NXvC3FNKBxnn7bSUXLLsq84ULAf8uR6U4QfiyHOtUrDI84YLVc
	2Qh1YUmERppSR0THsNUXXzC5IVcWU7l7cFD+Lfs8NV+OTYWHz646ITwqGtk5llVS
	cVjGihIH5zb4edMp2mBbKaMRzljxozQiT+nIzpGyvp+GnlA8ci8E8z3NIpCE2yWn
	71pUOGy1zOLTx0Sb+YH2fhgrgkm0l/LgszOfzOtGhZ4dNnjf2Cx1IlICDYjkLoPe
	uyx3zadceXQyBayASCbhEy5JbIdCPdEkoxgRfV+UJyRu3+xsVLR9dS6jE2bvYL/H
	LX7baA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnq0mrr5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:09:50 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7bf71bbf197so857484137.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792768189; x=1793372989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=posbByi2C22vAqDX2ezu/Vx97adQ0JmvEhOqcNgZPY0=;
        b=A1d8bkNn4ZRwqMGIGJx5IXqEut6BUQhxl43tFro+K37vTm7HBY9NoVndns/Nw1l53w
         4OztkQAfJeM1zDl9pGlgiMuJjVJ9fP/JlYKNF+SG9/4b9DdcZHsm//JLnKo1bZfFfhZU
         cKLHfAc8v2ppLynI4sXBiaBO/EsGXstW5gu0XUay4bFSLhlTMPsXrTGF8LxX6m1arhZt
         zPa2mAvadxwbr+WADRWGR1RquaDYTV8xwdOvli8xnERl3VqVRXEMtbkiNF0dnRgl5Pkr
         Jm8vSkfAl7B/n2tVMspAU6ie8Is+UL67YykxUovYpI6pEMQtjPps+6nMVHyX+Y/aOheb
         NjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768189; x=1793372989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=posbByi2C22vAqDX2ezu/Vx97adQ0JmvEhOqcNgZPY0=;
        b=I+kQfQ93OAB9lgSTVlHjf+i1ZV1IjPJcjcjU/qNHixmZOPudMQhjPen1BNAabNX+OM
         O4mUVehe4WT2WdejK/ZS1OGnMBOQDVi0TS7Htugj7VsnXvxvy+PpsHoHuE+lXgsYrD36
         1jqkqTbnohGReQREgrFCh9kRQ4ekS+aQ+RsSDEA5OwS0dVfC/urJjSIfSLj8WHKZyZSt
         KQgS2jHQkFOcsEPywDB0S1BcFSqv0R76Sj3JTeCmmNzaDMprlgt2wWPypOVOH6HUUb30
         m0htsMZ5GxCLXVGQjdk0JsKiZQVjYUXyqbfk0vlOqHovbsRYWWbvWNHS3vMJKUJW/4Dk
         o/wA==
X-Forwarded-Encrypted: i=1; AKwUvBwmi6KQLlbPIiAEmeDHQFBVOEYf6ZXHjJWmTOsW09t+lX117G3sNadGmkCFNEKofpRaiCBZGnphS95z8OY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKavJRpe9fyqj52lxxCgqcqE9r3tsGdDtCFjnz/UaCGaaZrSq49
	lnDfgOHwHiZ3hllSQK8iZUwfSyczHcQwAHfmJqpA2qWL99i9VZLQks+fTUFc44KpNAyyeRSQGr5
	zaLfiltyGN2CyLgjIf+MdQZxPzB4Id+h3aLnBIaTFbVmJ8pp73iynh1O5o6lweNAoRYo=
X-Gm-Gg: AYBFou05jgcUgL7QhIruIb1X9Soq58t9+rF6c2+V2cq8YK0YZlrUToEGf8Ru68uvVYM
	+EFTju3EMs6w9a5WXWi7OXbDPF/EL0eQt3lL14QECvVyTk9boCvxFLMxXtcXZgdEf8S80bWDylL
	tfnZdN8/eSknBtpUTsVUh7OCVVpZTTkNc+2RSsH9KqNjbA+aVx2Hr7W+lQUTqEPgG/KEJD/A3cS
	Szh8RSa1pvQ5NlCi6EXCs1w+0hHj4G6cGVEExCTa+MeAi9d3D2X3Xuv0PWLLb/f5pItDsSUjj40
	saI6CNZ3FxCtcAPhhTPR3HbbVQt/Gs2UiOPnDaCNOz7qQd0DVT6fhuFxqfLUB8xubFPPiovHobR
	6S0SpICqCR2FzkBGbgph4wSw/uNucLah2bfjBlBWor7eHFwKXSY4szD0nW6/SXY16/iaQZkeWwy
	KWMYUjc12vqUY3o26VszbkcWd47G+9GOW1F+3y6DrM4GFWXgPlaKo=
X-Received: by 2002:a05:6102:5706:b0:7cb:fd69:4155 with SMTP id ada2fe7eead31-7ccc2ffad08mr1256688137.5.1792768189280;
        Fri, 23 Oct 2026 08:09:49 -0700 (PDT)
X-Received: by 2002:a05:6102:5706:b0:7cb:fd69:4155 with SMTP id ada2fe7eead31-7ccc2ffad08mr1256668137.5.1792768188810;
        Fri, 23 Oct 2026 08:09:48 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d0fb:daf1:3106:3697])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4040d3sm323962f8f.27.2026.10.23.08.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:09:48 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:09:19 +0200
Subject: [PATCH v11 8/9] arm64: dts: qcom: shikra: Add OPE node
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
Message-Id: <20261023-camss-isp-ope-v11-8-0c2937195298@oss.qualcomm.com>
References: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
In-Reply-To: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 7Gn0AtyONqTipLwANbnoCEl4LGjiby5v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX9kepwCzFdAYF
 8y2k/bTkj4tyculTpXk9GpgCwVH75Bng63K36FU1Rkc6xBpNh37YpcWkPcJQQxd1MmWm6vRK7pb
 MqgpwjGzmBLhpZsgaMlOiHk9ZsY0UuEBo1X64bEO3NMLiFZ4GdOpqxmdt/lRdBAooRN+/cl59hP
 fppfT9iLZkct9rfshEHnNShfy1udOzPJA4j13T3qVrM4EGsE9CZf+rPeY6lsdhnwNOJyGOJi7EV
 815+16Mp8BO73yuKWfg4zSKDvqQo8gxiCu2kmF8iI5DaSiDjArK2qNqod40AB4kO3PepSln55ac
 FH2jWAMKP3NajeALJKkyJK9anpLWlPYGd3lu4cKfM3FHBvthZK/NBqD+d8yXrRwk3TtDpaaxA+z
 Xo06ZmXr5PPqqmQiLRqA1lTzWmm0O1r9nU7zUh6bx0aidxB5p1t277z+ULUdMkfRztPsJZzJVjj
 9w6bOt9pDcC1cmfwKqQ==
X-Proofpoint-GUID: 7Gn0AtyONqTipLwANbnoCEl4LGjiby5v
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX26rik6+k7jsE
 tf90C3PbqQfZR6gXe4EAj37/n5BaxyftzTFm8pj9eD3mkXHBOaGQ12ixQL+rrLkxR5Wc3WZlCu1
 2tPM8g8OT1mzDtYal7KfilaxpwM0Cng=
X-Authority-Analysis: v=2.4 cv=UaHE26SN c=1 sm=1 tr=0 ts=6adb78be cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=EzCDy3pf2FPqfMyO2-oA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230059

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add the Offline Processing Engine (OPE) device tree node for Shikra.
The node describes the six register regions (cdm, top, qos, pipeline,
bus_read, bus_write), clocks, interrupt, interconnects, IOMMU mappings,
and OPP table.

OPE is a memory-to-memory block with no board-level dependencies, so
the node is left enabled for all Shikra boards.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 77 ++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 92d22e3b6931cf49f213d1807f78fc1a261f290d..5adc28e9aa64508366e6c7fdad191a152b8cb6dc 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1828,6 +1828,83 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
+		isp_ope: isp@5c42000 {
+			compatible = "qcom,shikra-camss-ope", "qcom,qcm2290-camss-ope";
+
+			reg = <0x0 0x5c42000 0x0 0x400>,
+			      <0x0 0x5c42400 0x0 0x200>,
+			      <0x0 0x5c42600 0x0 0x200>,
+			      <0x0 0x5c42800 0x0 0x4400>,
+			      <0x0 0x5c46c00 0x0 0x190>,
+			      <0x0 0x5c46d90 0x0 0xa00>;
+			reg-names = "cdm",
+				    "top",
+				    "qos",
+				    "pipeline",
+				    "bus_read",
+				    "bus_write";
+
+			clocks = <&gcc GCC_CAMSS_AXI_CLK>,
+				 <&gcc GCC_CAMSS_OPE_CLK>,
+				 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>;
+			clock-names = "axi",
+				      "core",
+				      "iface",
+				      "nrt",
+				      "top";
+
+			interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING 0>;
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+			interconnect-names = "config",
+					     "data";
+
+			iommus = <&apps_smmu 0x600 0x0>,
+				 <&apps_smmu 0x620 0x0>,
+				 <&apps_smmu 0x640 0x0>;
+
+			operating-points-v2 = <&ope_opp_table>;
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+					<&rpmpd RPMPD_VDDCX>;
+			power-domain-names = "camss",
+					     "cx";
+
+			ope_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-19200000 {
+					opp-hz = /bits/ 64 <19200000>;
+					required-opps = <&rpmpd_opp_min_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-266600000 {
+					opp-hz = /bits/ 64 <266600000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-465000000 {
+					opp-hz = /bits/ 64 <465000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+
+				opp-580000000 {
+					opp-hz = /bits/ 64 <580000000>;
+					required-opps = <&rpmpd_opp_turbo>;
+					turbo-mode;
+				};
+			};
+		};
+
 		remoteproc_mpss: remoteproc@6080000 {
 			compatible = "qcom,shikra-mpss-pas";
 			reg = <0x0 0x06080000 0x0 0x100>;

-- 
2.34.1

