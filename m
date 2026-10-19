Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428398;
	b=4xvsQ8HWq+PfEY9Uzu0tOuYKNLOmhu9lgzRHV8hz1PZ5BL9xIyxZk3Qj454bFD2BK7LV
	 dRmvTlAmp63oRs0qaEtUOd5fU8y/ZnOq9R6QnyQCOoJMktEplxiOskzTj7tN2u4CS1+6U
	 mWBP2Nl4OjmcXUtSSlce4yJdMe+mPJwveemZY3yzBdnUKuSe7QKd5js0swiIMmNi6NBGy
	 PVf8RNCbzKVQCQV/mtwplWbhrtE8TrSguu9lWNHw2unP8tCK+ysWmUtDtgqthEGVcnvPk
	 MT6+MncejLgogDSrD0PMMzAHATtpXOcd9yp/6LcjqbAWjllq4dqNHpoEiArEfJLAIbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428398;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LCB12u/eYnIgNx+afjUtJRsI2c6eqFrAafZ5xx6S5qg=;
	b=e/H/2JDsIhRGrIYtfe80K0d796h5VYwIlOPj3Iylol3lWHtEcrWClyhmECAP4WRvFUKx
	 QsiWAs3WBNc02boaVzZ4jhT1+kI0x+a/zuz5m8DxPdQ7EVQo9XmgGR4+P/x3ik6H9wFrP
	 VX6gLoZJwhoKq4b+FXHYmy/LILIsORFtbG6pUYtUUD9nQvTRAxYb18ss+/FO6xbv4Skik
	 vjchZgMXmysXa30EcfxLlAQvBzgwYrXGOFbf3lCfSyOeYGNicyREPUOCYIlioecy8KMT0
	 IYFnE6aauz6n6Oslv5pwUl3/F/WfjYpm32FCRTRc5SwRNqLwXOPTq1NFI9TGlVWzz8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Eesuay6R;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gtfKn3OM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8545B60A3812
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:46:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8545B60A3812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Eesuay6R;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gtfKn3OM
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JFPGqS2589872
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LCB12u/eYnIgNx+afjUtJRsI2c6eqFrAafZ5xx6S5qg=; b=Eesuay6RDDnwsxRu
	K//2N/OLOvTUdpIAZ7xVQsuBo3GJQhS2EuIbDFJfATY9kTIImguf6/BFWjM/Qt/w
	wcrAuUnRGseAPTO45fQO/qGWzjBpq9QWWZeZI0rAMJADTCPTdQ+5LHlkpwDwZ7Ji
	fwKtuPJrmmYq7BC+MinxkIrTVD8vQK7/I97vlCu3HKaO7EHqypjcg9VkwFQrsTjJ
	2Ab6ZOUL27VIAhFK+k/XcyvO7bNLZaM4SDo8Mcp9PG6HilMHntvKm7ibe1EohqBR
	5M+h01suJoDX92i2wivjNef1LEndoqi8McuN/3lrsMt2ig+eTM3baL33tu843vcD
	fHCdyw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3n28y6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:46:37 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-151ba226e1bso3680512c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792428397; x=1793033197; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LCB12u/eYnIgNx+afjUtJRsI2c6eqFrAafZ5xx6S5qg=;
        b=gtfKn3OMiPvQw6ScF222fuO2mCS9rT06UhvsBuiolLs4bdfWsHAkWszGL7OlkoojUL
         CiNqnn18S93M3KMxCmqlFlFrMrUJ88d4kJSnWKNEFRwkK+vB+IO4FnbtP7VS9Mh5Jy+c
         KBqqV4mGS8rkwA0Fhu/xorz09D7jxMjU2xYBhVjnqeVJmBwpb1m8IwRACqK2L0xTZUyJ
         1sF5y/fmGc4z/kMBN62YhV8C0pPlQ+/stG7JgVAiZHbhi7HezIuasJOm3Ymm1zdiVpft
         Z0lcqn9TQ6mN8KzCvfZkHqLdcTt/AN3KhSaEHvDJ17FcknEMxciFGg0uEcUr0mlUyVEE
         baqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792428397; x=1793033197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LCB12u/eYnIgNx+afjUtJRsI2c6eqFrAafZ5xx6S5qg=;
        b=UcNgXfdj/HOOlzDfcgTWdkqOcHCNwFdnW/pPdML/U5zWQzTUuRTiRcB+kCNHHgFNOV
         PDWv3t95FD+ABYJDGs8TChCRoJZmnE2m9HWuDJYDrvv0fGONxrN3Y4kt7Ue/isfNn9Fj
         /x1eMVGHKbS3bpAuFAgubo0z0yD5UF5sgMq9fC9EQJcw8+1PejIywtgIxit5z5twUwOI
         6ziJzrCvchVGKnjZQmMNpuxmYK4jAsUisUBuFuXPoYgTCh7nB/9R5x1V2Oh0uePluL6V
         G3mloxLfMn5YbBW2/ZiNrEmFelvUgBMqOBLk0YLDW09ThMlR8LbHmWSaW1RJqADBhJ1f
         zBrw==
X-Forwarded-Encrypted: i=1; AKwUvBx01S/pgJhZh0mvaTxFgF9b61GapP6IsUAM4RCgZ5GU5nZm9lpMyaP7pb5ltPOUCtobgjhjvIc8bNXHJhs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKafLDG/Z0+UiDdsZwXRHGWlbFhilCAyRTS0W3BeWoxQOBODlrD
	TmSNgPa9a8OoAyub0nIgdbD4aIct3H9q+dNELmCWGtYiy+KkUhbWTytch/+eaHBENXtNR4kZece
	SQ7mbN5jCV45KrY/4iU6sOpUp0dh9o0RBbLe8u+6t2pBkkHEk5zWtJVXgfJ7WpT4SE+Q=
X-Gm-Gg: AYBFou3YmOqeylN/6fvlisbhzdgIJE8ZjpFWsuGt0Fh83rJaSYYcpRYN2ECZkJBVHhG
	5iVuqeYQAwNruqoJwFKVHlocxlGG1gL0H8Lm7n0zL2SUvAaiYaoaFS2Bkhkuf/VfqkZIndXJv7+
	/M3H7VSAlKd+ce3CVaR+vVC7RSySXMP2/ugMdX+rP221zj4hIhk+1wWvPIp0TrfsNgjynTNGpXi
	ZaJNTyaYw6wS371uxJFaVoIEPy+kohEXTsQ+D0893R1fcY1nlma4cL7JHOXKhaUS51/IM///MAN
	NBc5Jyx0VT7WRz8VWcVmo6IEVMW4qDsYDo7fRkYQkqKQFHzCxnjKxcGMYkCPnSHHL4zM0SJBK79
	ddG98FnPrjRqlxl40LkOvHeiKgu0UjpV5Dn4cJBjhknAQiqLHeA/sYRDU19/NgvoCz166g6Gg4C
	DQTJ/lOEzwzsb3Oeu6gtXsvJv2zJRuHB8Hgbw=
X-Received: by 2002:a05:701b:4201:20b0:168:6ad8:e89f with SMTP id a92af1059eb24-1850c22369cmr12825692c88.3.1792428396946;
        Mon, 19 Oct 2026 09:46:36 -0700 (PDT)
X-Received: by 2002:a05:701b:4201:20b0:168:6ad8:e89f with SMTP id a92af1059eb24-1850c22369cmr12825650c88.3.1792428396320;
        Mon, 19 Oct 2026 09:46:36 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314b16f57sm30379415c88.2.2026.10.19.09.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:46:35 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 22:16:18 +0530
Subject: [PATCH v3 3/3] arm64: dts: qcom: ipq5332: add support to get
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
Message-Id: <20261019-imem_restart_reason-v3-3-e6b1ff5de841@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA2NiBTYWx0ZWRfXw0gFzrlsjI2T
 Gf46WKkndEEo54sv5iWTvD0CTPqzBJw5ezHpanON3Co4T0N5zzI6gvRb30YImNO5zOTteg6xoPR
 yjtmgzwfW6mT+mkBHQtxiEAOm4FcGcE=
X-Proofpoint-ORIG-GUID: FIbawUpUhekQO03pvH6yoXayqPDw3mJC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA2NiBTYWx0ZWRfX9DISucwd92Vx
 QiEfYzVizqg00WzcFK0Swa5CeoM5Jxjo6zmF8FMIyAQOT7WNZeFOjr3zx9d8eFJnk8R0ZDEMa/s
 KpI2dHqBnRbfasmt/xLBA69fV/sDGqR/u2vNz0ykIs3lHPbe7MlVb1KHHc9OOVYPH1ws333NqOl
 rnAA8GS7w7ApKDkRE/VuV85gheBnu3ZyTdldZUwqeZTzCyTDySdvb3xW2gGHVVu8haY+BTNvzrf
 CC2WQzKzFtvqsQJY0MJw1fuQpvFoaus59hX4dJFLFdPbu3qLbg4+lpVp09VUSSFqEWZbvdFbv4y
 Hr0iel2gMZLK3zPHWMFqXWuLHDLP4pk9b0BpSPnZ23WlLgHzU40kP+LHbromMBHz34l2dNOvXE8
 hPVBEvIyPhy0X4f/mB4IcCL/COFST7IC0gZnDTBP7oUuQv1sJSs/ExOYs2bTmHPA28BhcoIEdgP
 1gs2j0eR5y3Xrgr2uZQ==
X-Proofpoint-GUID: FIbawUpUhekQO03pvH6yoXayqPDw3mJC
X-Authority-Analysis: v=2.4 cv=Zf2IpcVA c=1 sm=1 tr=0 ts=6ad6496d cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=WbeaI0-OC7IQdSlKmUMA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
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
 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index 74d9de8d7641..c1b083624696 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -493,6 +493,21 @@ qpic_nand: spi@79b0000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq5332-imem", "mmio-sram";
+			reg = <0x08600000 0x14000>;
+			ranges = <0 0x08600000 0x14000>;
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
 		usb: usb@8af8800 {
 			compatible = "qcom,ipq5332-dwc3", "qcom,dwc3";
 			reg = <0x08af8800 0x400>;
@@ -578,6 +593,7 @@ watchdog: watchdog@b017000 {
 			interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&sleep_clk>;
 			timeout-sec = <30>;
+			sram = <&restart_reason>;
 		};
 
 		apcs_glb: mailbox@b111000 {

-- 
2.34.1

