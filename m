Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A3152F272
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867507; cv=none; b=u2ZkJ+CqQF5raDMrxM3H2DibCDSpPAQEugD7Jq8ThfOY+yE1gWix/H6F2JPqIGdEKC3ObviK3qhNJyYcu3Z3r7WPHYb/qnIVHstiPllwOV4Ul/VOtQ/P53oSIdlKvyYDVpU8+5rivWBhQV2jIW01EmxIxNJ51AcJfzWY8/ZOGiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867507; c=relaxed/simple;
	bh=HTfux28qeRiM9UR4Si4CXxbE7s1EAWFs5z2fgAcyXq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YBdfrTJulVHb6E/Rhp3gnnX1Mp3qAcRKag+p98nMpvHx4Ru4YGRIrcYdIZTzw7QBItbQGrL1BHL7gghIQDlPk9rCF4t0t1lENFgO0i9RuOJy1RaWSqk9RMjagR3chL0LxsflMzcxgE8GKXcSLjiAbHkFN8XBXuzbTKnl8yH9dPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QYrzUzqH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B7fr6Me8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QYrzUzqH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B7fr6Me8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691DjIw02403884
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 15:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9lGZqpBatDhAwoairRyA5X+HxlguV3XafztM288Ex7w=; b=QYrzUzqHn5K9jBij
	asARavBR362YViEVo+4CfgFwMnngXxeAayBY5HQtcJkiV0m/X433XkIsiJeDdqhp
	RIIP+1ZRk+dv1j88MzKfNTDAfWBMVWFfRT0dp0einDWU63CAsRT8YsJjnfj+BC2v
	gjXeAJzRF/6nnn1Xp6pi+1vrN1Fyj5KnR6OT71XFyTsXPOaQfOUwuMfcx8ghcMpx
	1F4D2XLSbGA0pO2W1Sjs3jXTjRiVXEtpwNxF5lvonjNaVTUKH8XtOucfYY950riV
	dMcgyxAHsN1tAde9TbN4AArkMQVVjf8tIQorOkSrLNuEoheD4m2k4jpQPDsnqngW
	xZ7p8A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h188svcw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 15:11:44 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so13011189eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790867503; x=1791472303; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9lGZqpBatDhAwoairRyA5X+HxlguV3XafztM288Ex7w=;
        b=B7fr6Me8C70UiXrSbGiUx5lIBcMqLZEtsZkb885MFVXyvTmpH0+1IjiPan+wGhbi9Y
         gvb4NGEoNlWDKWYnYSiyaAgYcxBLOI3YbtyQ/WOtDviMOLl0xT84ZKO222X8dZX4bE5L
         YHdWakbeosMrdnXxZG19nUbvUM0SvztPXN4LTc2XeFl92i2qCeBDWMAj+4l70zLfiwcu
         Lx4iFBW1pMx8DvMHXJEk5WPYVM4dFxgOMp4oLMjwOnRpjNgun/EjP16PiQQXFrpHdUVs
         uDk7htg3Snch5zWU5qcRYY9Eij3GDRfc3TPHW9959BPCyFrICvKDiTUJzCeRRRzvWwp4
         vO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867503; x=1791472303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9lGZqpBatDhAwoairRyA5X+HxlguV3XafztM288Ex7w=;
        b=WAfYWL3E3AIQIrYoHVj9LlC4yQQxAJcIqG6TEp7p2IgFM8s2qruwS9tjWXqjd2994+
         MO425kZ2LTI3qxYOCJ9uuuXuhvGHnToTS2bMPzbBe8sDdTpMYLIryD2yyIyQEnTFmzpM
         Okbnax/2vbqN3xF8P6zyNyuLDNURLgGa9GRFdZvpCAyxDVCQgWrd54/KGLCAxj3+6nNE
         4pHesM6CNRmN8vxLrLyjZLSIK4zsEi28Y6lBAbuFvQnH2Ct0B4F4Q0y1s+pleO4kJcAU
         gSsrq7z5a/4wllpTZS9/HeY5DaJNlxVXsaYWjT9tOc6da11/SwyawrR9/GuIqeYZPoV+
         P32w==
X-Forwarded-Encrypted: i=1; AKwUvByCuM21mv6z0+0QTKHjLQRSResSVCLyKZl4NttUi24DJ+Qig0H2pPEn1P56b0SeIg1xb1UlaVWAPIm5p9M=@vger.kernel.org
X-Gm-Message-State: AFuF++nL7AQRxeZ1EA7QSYi2mZzdGxlGNzgVTk3EESWcAeOiUgkw8PmK
	DALTctpRXGQ+i8Q+QPIu0lgLWq0ekxSqzTMkghX6oxhfpAwC7dWtpGxMSN+ZDF4RbrRaZWjz4YC
	U2WE6hkCUq+xXMHLVDjjdWu1SVrUOZ0An/v7Avp86JZ2ctOZYsNoLbua46gXV8w4xIsE=
X-Gm-Gg: AYBFou2SUE1g95PI9JIESelqVHUZRz4PVdPwBItjm0tnwHpx67Nnfp7V+4auOAcUirL
	pQY7nuveceFBWccjbLhTEuEAcuHbVS+bTNdctKkg4jZ3ycbj+A2J9t5E9HN6IhL9do3ZCBkRLT6
	91U7K0cgC53QKqmQJRsDixaMyPGVogfMHKhFrbFTwbgWrHBLSemtdKINb3zbkudKpq7p/CrFLYv
	NKG7EJmH4eA/Mx3uIrxtTEhxT3keNQIy2GPqTOS6sfm039G9IRFcPSiXvO+PZnQObgNuEOSYxd2
	wP7AfuEYcYJPqDX2J2XnzUR1Fx7IxpHK2WMtZ4PVwyJNiORM8cHYpZMkmeXxfxtN1UZRn5UE4eB
	fLE94eCQHS515DlhkJEHbYixyNQ6P1GB2HnHRa/VeuChHGtppV902G17/36AiXJuQ7FlVZdspO8
	QPu6Dv9+EjbHA7nUpUIaLDLN0rX/F7NDsH6A==
X-Received: by 2002:a05:7022:370e:b0:14b:f56d:be2a with SMTP id a92af1059eb24-14d330b0eb1mr4226471c88.28.1790867503248;
        Thu, 01 Oct 2026 08:11:43 -0700 (PDT)
X-Received: by 2002:a05:7022:370e:b0:14b:f56d:be2a with SMTP id a92af1059eb24-14d330b0eb1mr4226443c88.28.1790867502436;
        Thu, 01 Oct 2026 08:11:42 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f265d307fsm56159c88.3.2026.10.01.08.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:11:41 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 20:41:14 +0530
Subject: [PATCH 4/5] arm64: dts: qcom: ipq9574: add support to get watchdog
 bootstatus from IMEM
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-imem_restart_reason-v1-4-79f516906010@oss.qualcomm.com>
References: <20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com>
In-Reply-To: <20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX7wtdPwOtBCb5
 7JCP2ENh/syjRL09MeNoQSrkup3VtlPc34F43VhwOuIt4JpSpc6VCo4I2sEvB3XQ7y1WksfluKm
 roXF6m5SRibPRXYG/F44/2fKIBgnSPs=
X-Authority-Analysis: v=2.4 cv=OozaWC/t c=1 sm=1 tr=0 ts=6abe7830 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=WbeaI0-OC7IQdSlKmUMA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: sgnqt92oNBgO1NSn-v4AN8hqY1NFfM9u
X-Proofpoint-GUID: sgnqt92oNBgO1NSn-v4AN8hqY1NFfM9u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX+AJ7IN7n+p2Q
 IA4ZD1TrM49X1Wc5j1kcItCu/+DfjHF93T4KYJzyIzKQ8TPwhLkG0ufa0xitEb1Z6S2ftQ5MXUV
 l5/WyQlrltlGNGQWk28CMXq55YYJXBmVYduUMgucxismeE1AyaFBVyhsQMDibmnxbdg8djs90y2
 bvE+UW5lwyCmG9VmWMsqnqcvTYfQN2HxlQxdFlr34S2uBVDELmsHyJpLA36NVq6zUi0ocHob//K
 sSi/nSkHbUdmTPaBoo4aNhadtP2i++PZ1R2k+uVovI3z2WZ9v54ixXAknInaHwXvjRWqiPqdvXf
 Fq+XI0q4f0nW77w9k6S47K6Q1EaY6symUkQMcmHsqsK0sCc5nZUVcFlS74MfzR8pDHa/JJ+vKuC
 UMHpzc25d0HTgyivIfzGpz1dk1IGQ/8LJyooZeoq3bA0w6WSgTYGG7G2xK2BoXlCKsEaKFPq4XC
 Wf30b4lhv6Y6SEVmMgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010060

Add the "sram" property to the watchdog device node to enable
retrieval of the system restart reason from IMEM, populated by XBL.
Parse this information in the watchdog driver and update the bootstatus
sysFS if the restart was triggered by a watchdog timeout.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index f7cc6f274ca9..2156911876cc 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -760,8 +760,16 @@ usb_0_qmpphy: phy@7d000 {
 		sram@8600000 {
 			compatible = "qcom,ipq9574-imem", "mmio-sram";
 			reg = <0x08600000 0x8000>;
+			ranges = <0 0x08600000 0x8000>;
 
 			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			restart_reason: restartreason-sram@7b0 {
+				reg = <0x7a4 0x4>;
+			};
 		};
 
 		usb3: usb@8af8800 {
@@ -854,6 +862,7 @@ watchdog: watchdog@b017000 {
 			interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&sleep_clk>;
 			timeout-sec = <30>;
+			sram = <&restart_reason>;
 		};
 
 		apcs_glb: mailbox@b111000 {

-- 
2.34.1

