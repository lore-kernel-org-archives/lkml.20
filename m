Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428395;
	b=ck4UDsWLal6COPEWrNc4e0YTkJqLKiS4KR8voDXHt3n4OWfyhU/+b+DbdsRJv+6mshVu
	 DXKyjWiaQ+awfYNpHlN7Yvox62/w726nJyWVoEXANMNib4sNZHDpiRNFEerAwAq1d/eZv
	 WG2/9upkYfQl9b7tOZQo8aFDkozRJqT9g7887uvtTA8MGoeDumgtGlJZ7MrYbXGIUlhfO
	 H9o63p0ZD02StmJz0OaW3vUm2tmTtrL6oH/oiasfOURD0gsvrU8aSIyj/W0pPY38LKEN+
	 U2oceBAgcqPvzXIkS7Y5fiIJVjc9PBuEH8TYY/RnBE/8TC/gTTqNICG9mnWeNGnMYOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428395;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hebtPO5JWaFqiDHPGNPU2T+9bnoIHyDDr0H0tLrI97I=;
	b=TeqkYPmzC7FNtlRXWBmsHx79TcznOY1xNGUPbhZPyMbOa6icqAGr0qUQZbLd08ACdwXa
	 bruSTmaBySwZsj7Fdi9nkHQaxqWPntt9NSzTtJpE75mC5oy+G0bLzBocoCXKtDCCNT0o4
	 aVlqzwV5YFDoovrXb1xA98cTcU04rFouM6XuUsWCpitOUvVQcXRQ2UORJPl5FHXbpqh/R
	 akTt/AfFPLNeVlIYCc/Uvq3uKMqstQTQeoOmdgsH0uQZkS4vWAEw1ga3UFtqjy8xxAGbp
	 xb1Ut0oSP+vioJdGBjBKK8NiLeO0NsFbd//qcTvAlZwqbW/Uf6VgfK3yjbZYtDEA2dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mz7CgNs9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fuXLmgD2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A76606A33F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8A76606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mz7CgNs9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fuXLmgD2
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JFPOfL3675774
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:46:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hebtPO5JWaFqiDHPGNPU2T+9bnoIHyDDr0H0tLrI97I=; b=Mz7CgNs9zSBOxPXF
	SKljQOXDULC+KrDJAuNHf09hNnJgVDAJ9yksW3yLFf5VWyjh1FkkPWiPYWAWQKoR
	WGSvaA9M+w0DpBZmyLY5Eb5cQjK3S+EyiJK5jUtbaswAPGMfSqNY8sZglnEY2Y+0
	j0c2SUjOVWgT7Qf6ua4VXxMLb1MPcLkL6PQWuvqhFyMUAep3sWUw+0o4vV4F+nch
	D04Fg4tEwyNM90Y9cJmDKFzeIKylXX1jTla9h0hnZozslnUa4NN9AbP7anMGfsdU
	cYmwt26AvNOzCIpjmeqU56ukYFB6/hMJHKHH7ONbQxCokHMKJrFJVwVjyr9U/DQA
	GKPrhg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48j6ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:46:33 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-151ba226e1bso3680388c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792428393; x=1793033193; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hebtPO5JWaFqiDHPGNPU2T+9bnoIHyDDr0H0tLrI97I=;
        b=fuXLmgD24aMTYrnlB/u4T4f9N9mMotk5ac3w+7vqTHnCpNBTu53DIS/hAoehmA6+RO
         dnVrHUwyWxhTIxvGhnWdVBAEYAzIUZzuO2TOZSSD3r9TcUPsWXukuT1V4V1c2W9mw8/T
         eQLWK79ocxTo31ZTwnvWK1UZc5EQUtXo0RyrVBFWrdUPq8zhmfRNw198NaGB/sRu5hO4
         j/dbLiNkiYHBPtnrW6FWZ7jkZ+xnsk79IIeU6M9CALqr9/v1OslMmYjrtthoiMB0eNC3
         Oz7FNxBQjA+v2RlB1YLzCYpl/TItiUrN3i90pEak5FoC+F2tsO4xLPsNexyLcuRsMmgX
         IvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792428393; x=1793033193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hebtPO5JWaFqiDHPGNPU2T+9bnoIHyDDr0H0tLrI97I=;
        b=hPQXwSFtXKDpIdJFFVOirO9sREdfV3lMMtdZKG7nW328QPxy2ojdnBa/L6qSTXNMME
         gtpL4k0PmqglPoEtbDDGbV98/R/nXZ70cfDZFAazwC28/Gh8A51XNA7+fKT9tg7gJj6J
         w+euzBPkATY4N0CQr9KsEYs1uv55Za4x/IOGCfT4ZxEzHIRF3SQtesjZ3922F3DNM+4x
         t0N1KkzpONreC4gMlQqNegOQkQj687MoQIcEmGwBQizv/Lfrm2ldyyhh3zrYsqHUwxlS
         1mcwpXGJsdlsJGttdKnIuuIcjPQ/MOPOGR7oSY9urIdZjq4hcNyWM3wl5NixqJy6L03F
         pzzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUdfbI2uvvDTXL3eZsaTXSRmGNOZSAmQunyEIOl/unrNfAYeHmUhQ8/SrUcH7E3J321ZbRmsnOYzz14io=@vger.kernel.org
X-Gm-Message-State: AFq9FYJa/1okLw3Crgpnu/9FT7VgM+p+iQOCiCtXUBsdrnexB4PVfBFG
	RDQ1LRG6FkiaXgNNBKJDIdjuowtxdm+eyDAyqY6Sn3YDlIUk27FZgaRDy5gTJat2o1ypLt7/KRo
	jbIpYoINR5ZL03ifunfJoyrl/+460GV1919e6JNmsY/5KMTXeAwplGPKFLuySiUDkGoc=
X-Gm-Gg: AYBFou3TtUhLcMl/ouZgQYCXVv7cUvgCl+T0ZHzbLiRr7++qMMTs4slrE6xa/V1CZxz
	Hw/sAVX6rutH+gKo/9a+hWbmSv243pUbIQFN529fKgvA9Lz9t8NshcYhV7kFoNXNNrliQNq2BNX
	edj3LHaYbcW1RarIRY3kgi6eZT6+cFMw5KJPp0xlEgJP9GfSMxcEzK7+Cc4osCVwYAki2szsxAh
	4sKeNQ32bUy9oDhMV8aKuUbvesATxhl9/fXeapqYmlIfoO+VxY89qFIgcIjOmPR6DWIgXZ/K9E8
	Y/VvJPGifwLqhPaMyx3WQ7gGrpLJtmpf8rNKMCSwoF0ErjAR2m45VdmCKHuwembKC1Uqb0E+1fW
	+RAuP48wMhE+16F8GIc4ApAY7KrsJ0xnUZMG1/aAtGvp7ECIBNJVUqXjqoicRVgM2snZ0l8NV2v
	UqUMS0JOYfx3Rz2DM8Xbmbzlcv6t9VDOMrHps=
X-Received: by 2002:a05:7022:302:b0:157:cbf6:89c4 with SMTP id a92af1059eb24-18514350f17mr18556607c88.26.1792428392678;
        Mon, 19 Oct 2026 09:46:32 -0700 (PDT)
X-Received: by 2002:a05:7022:302:b0:157:cbf6:89c4 with SMTP id a92af1059eb24-18514350f17mr18556562c88.26.1792428392111;
        Mon, 19 Oct 2026 09:46:32 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314b16f57sm30379415c88.2.2026.10.19.09.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:46:31 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 22:16:17 +0530
Subject: [PATCH v3 2/3] arm64: dts: qcom: ipq9574: add support to get
 watchdog bootstatus from IMEM
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
Message-Id: <20261019-imem_restart_reason-v3-2-e6b1ff5de841@oss.qualcomm.com>
References: <20261019-imem_restart_reason-v3-0-e6b1ff5de841@oss.qualcomm.com>
In-Reply-To: <20261019-imem_restart_reason-v3-0-e6b1ff5de841@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA2NiBTYWx0ZWRfX096k4B2lHB6r
 rk1vZ09xTqNpDlSt85nOQS7kmGyV81uYWNijWpsJasFfLiywXoptgQ3/xw6+DEFHIm+1rXayx81
 8ZJzs/Ka/tnGbozXNTVynefiwCl6cxb5XnGw8RT/wL/QA0qkxPDk/X0BRtmaKLXMcm3iFBvjwyo
 CT9uYuMSInRDOYMSdrW7RsoVEZzRLqAhUGc7PJkEiwxThZXPNUxYyS8LefPBAfLzs2XwPM3tOH0
 B4vroWpeAz5B8vfGLXHQ5r6C1eTOCuP8lfmM8/z7K13rVeNLCz7pXv2onRYi2p+4OmjTmSBYkpo
 AFTBArMU3pI9iqwhTU+uXktz1TMvcQsbSNTNup1np+mM4/BjFvxkgrTV0fAZgBDpEzqJLRL+MRG
 +I7DPpd5ho7I9JGo8An+D3fQundU2pd0OI6nfk/iByEJ8jo6uJAO2tomtLhXG12N87JGhBQTNSB
 6HJFyKrnEKHsHRam7uQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA2NiBTYWx0ZWRfX+DiE+S3fBetg
 Kr5p+qSjBh5tQY+p+zTiV6kbyPVqn7DNrrQ1ndNTcOT9vPxG5/jkDJ/NN4BWoJIz/6vQizuxaOU
 oIHEaLXbJ5CGfmyZyei7nMMBsBc8yN4=
X-Proofpoint-ORIG-GUID: cNibMtDmPEU3lK0ZIjLCiBZuqnpOCz9W
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad64969 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=WbeaI0-OC7IQdSlKmUMA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: cNibMtDmPEU3lK0ZIjLCiBZuqnpOCz9W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190066

Add the "sram" property to the watchdog device node to enable
retrieval of the system restart reason from IMEM, populated by XBL.
Parse this information in the watchdog driver and update the bootstatus
sysFS if the restart was triggered by a watchdog timeout.

To achieve this, add the IMEM node. The overall IMEM region is 32KB but
only initial 4KB is accessible by all masters in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 771a59585645..e1908f01851d 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -757,6 +757,21 @@ usb_0_qmpphy: phy@7d000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq9574-imem", "mmio-sram";
+			reg = <0x08600000 0x8000>;
+			ranges = <0 0x08600000 0x8000>;
+
+			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			restart_reason: restartreason-sram@7a4 {
+				reg = <0x7a4 0x4>;
+			};
+		};
+
 		usb3: usb@8af8800 {
 			compatible = "qcom,ipq9574-dwc3", "qcom,dwc3";
 			reg = <0x08af8800 0x400>;
@@ -847,6 +862,7 @@ watchdog: watchdog@b017000 {
 			interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&sleep_clk>;
 			timeout-sec = <30>;
+			sram = <&restart_reason>;
 		};
 
 		apcs_glb: mailbox@b111000 {

-- 
2.34.1

