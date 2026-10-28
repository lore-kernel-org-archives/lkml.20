Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200856;
	b=Nf69HGrFU930h+OendzXBRVT4SbKpNZNupGnfemsC/t04S1awxN9+YVULeuBNZnSq1g6
	 3iVQPUb3DdojRtB7aq+4rioqGZW3Gwf8ka3XpS3I6b9xvW7YO7dCbFS4tNk9EZJvvADkY
	 z4jtTBirT5+InJfvEcB4MlmwZV4VuofyTVYKdEA6H6TsCkOqvTHQt86FLQwRjYfUj2oWE
	 AxS6cNYaKO4Z7xZdE0YmvNoNluTECRjotNILCHrv4z5w7xfAhc0FM8efZ/+E5AS/Lxep4
	 eNxH/6z98HzVheXx8OLJCZ8hTan2t4NmzFxTbN0yc9B2fia2r1yYQP+prjV6PuYkTXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200856;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=e8sy+6Ne/mbGqYeYU091nTkD+1IMsnQysV27aZi0gT8=;
	b=cTIr7izCXCxpzfVOKl/jDAZl4Bc2a0nI2TeBsKLZDUC2KSxeQws381N9+AXJoCzbflJM
	 qyBYRh/zQKHpKAJLDR/MHF/5ZoRgmebL5MjD+pP6gE0e3e74rLyAsYUJGVKvWIwwIpUC2
	 O4pabE+8ATw3UzHGivhHmeq1P4mBk7bBKi8MizdMaTMC//1Tr/dqqY+3D3fH7gWG6iMua
	 PVHudXoYeBjOHszw0NqHlEeHSZ1+E4gFoPleLy5QvfenLZNz9qhVqTiLQPTyQElR27Nsb
	 an+PhTc+ZCtrHZyi6n0uB4BCZJfNxdaqhOh9unXwATJN2RaBNMMHMBxY2KI1rpZCxag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZnRuogTn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PxTwtQEf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B08B606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B08B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZnRuogTn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PxTwtQEf
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA78R2543274
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:20:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=e8sy+6Ne/mbGqYeYU091nT
	kD+1IMsnQysV27aZi0gT8=; b=ZnRuogTnHYRGBV3xoiAAWX0L6JFGUJq3tu1jUf
	ZYXBFj8kMU6ic9q8kuYPA45tP8aeO2fwWPVMftwijzVL7QDM3OnCHA9czMFSM8/1
	unqckc6uNynEnrcRaJMKfSs6GLHLlwVWNPK+PHPxG7zbSTw5Ri1MOuTJ7odj5TK3
	yX5IEU8QMoHDD2n3ktda2sQrAm1/zWPRjKSQ9mMzA8tXZqDWJ3CJcHdgP9Nuk3FB
	2JBqW6guxJhn4sotHvKHcl5Z188xEDSRPFEeRma29GHUXLT0xsF+FU8UCZCZvpps
	imhpMIBUbecfSV0evZ4aM4pttRr3hY/vkGsFGjt3zjsUwLUg==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkkehr1v6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:20:54 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-67a54487d63so1045728d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200854; x=1793805654; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e8sy+6Ne/mbGqYeYU091nTkD+1IMsnQysV27aZi0gT8=;
        b=PxTwtQEfai38rweH7vgjhDxce+YH5eYv0ShDZYaBCdVjQ+78f6AOxrIdEm+7AhGEmS
         Ft1vtCDbub/K4ji7R2vTY5r9CPGF9cvCGdBv1H8JHijeV/FsSWtV5LQV9zPqDHr0o0P3
         O2502p2tNYtlCnOlXpoK7mOCUUvG8rhceFb6V7ofO+QmX/QTB/ajb6p9aiSvlbzI/kg3
         xRY27fIg+aeYwlhPuMH2g1eR23FcjQ340HVDlXxRma4NYffjj92gGFy98eOtNXo2XsBR
         1qBxUy+WdDspANIexyR1jVILMQAvlrw4bMZtGSBKdVObv3OlDWuS4OcgE53tYjvK+/S/
         LY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200854; x=1793805654;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e8sy+6Ne/mbGqYeYU091nTkD+1IMsnQysV27aZi0gT8=;
        b=ePQvctR6Oggyr+eEYniW4hF1ATGrv7WVReG2+M2vqOhy6DZf5Prz6/4GcNmyusOc5R
         8BWDx+Qv9+ypUCXwyC0N3UEow2JvZuesfuX07W9wVZDirFg47LaISznag2CHGMpIFY2r
         1CviGrvVgFbE0gCqNGYBMUiuPQQXTXIzrxKQmh2cnTvGWeFWTlO6i7OwybeoiE1tf0WK
         8selTxKSwPaKVa2jJM4Ole+ZTXtAxVXHbIDhlJDDXiKbGJSbKlnT18RecqWhENoT3B+A
         wPQfVE7LDOQTrxove9Lr3/HJwNgScJOzDclNGyddUabm3LotimzBbvPrtjwwzG2P8sWH
         aRlQ==
X-Forwarded-Encrypted: i=1; AKwUvBxERFXbXtCGA6zhcs4NQvSDSVXfMudquPMcxOql2FDMEaTUqD8uH3ZazMzviz+PqRhN976UMxATRExmpWw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKh1487A3qSS53HYIjTRhEtTBQBvzlbwVhj49kyrQ4tMIPcOzlQ
	Mj/AalKXNyNEzo79TW4/oMoRuDq0gt3kbPJ704jEWzlQWHKb08ybn9zmhVPoB1uO3V0Kx+7nr5y
	vSG25CqP3+2KjCHKvyUIzCtr8R6Wg7J749oF8OhE1itSnqVUqxDyTskl3cKvAzyi6YBE=
X-Gm-Gg: AYBFou11B933fw9hLXER4k4566EUzuDdC4KoVEtaCq08dttdIva0DW5vE+tp8OJM7Ry
	eBkfK/aFNN7aBTMctwgo8OuMF1wmIWIlDt30dzP3nzbcYuiBKlLcloOimuSSd/TCeHQPE/5ao8W
	hNjepjPItiCPrvUPD1/4uvzue/VkyjNPJ5avL9HB8WQq0D+qQq9Tm83aqTVb2oBmGx147p6kNIA
	xNmXrmGJueg65oRAavYidpWomTdrXpABJaXrF0el4x+HYyg2PMYdlYYuL7jtx8RgXr3ve9tg7bQ
	XM7zO82mm5n0n2B/dDYfGJ6n0RO2KrBOJ9kxiFjmrsMJOgIx2ulvmy2CNL1K+sICfP1fwwQFUcB
	9ULIGhoXob/RXo1xNkcTcRO3eHQlBE41bt14b0rlaT+RI+hCkttYNiDveNQek5t4nz7VzlTjG5Y
	Bwc3jQ4yLRCVLlrhE5bQEcLopeBapnhWdRE8XSBsN6UiawwlHsDrCVhlcJtX6L
X-Received: by 2002:a53:a8c3:0:b0:676:9578:6727 with SMTP id 956f58d0204a3-67a7be82e8amr1514640d50.54.1793200853264;
        Wed, 28 Oct 2026 08:20:53 -0700 (PDT)
X-Received: by 2002:a53:a8c3:0:b0:676:9578:6727 with SMTP id 956f58d0204a3-67a7be82e8amr1514611d50.54.1793200852504;
        Wed, 28 Oct 2026 08:20:52 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a803cdd1asm1107541d50.4.2026.10.28.08.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:20:52 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: [PATCH v23 00/15] media: qcom: camss: Add Kaanapali support
Date: Wed, 28 Oct 2026 08:20:34 -0700
Message-Id: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XSzU4DIRAH8Fdp9ixmZvj25HsYDywMutG2utSmp
 um7y9bEbiJcSCDMj8l/OA+F54nL8LA5DzMfpzLtd3VD8m4zxNewe2ExpXowEJABRBJvIezCR3i
 fRAzbUoSV1lJSinO2Q636mDlPpyv59Py7n/nzq8qH38NhDIVF3G+30+Fhs+PTQSw4ArlhKXidy
 mE/f19bOiJeS7qv1wsChENWWfugE7jHfSn3n1/hfXnhvi5X9IjyBmlwDUhWiLTC5Fhro7EHqRt
 Ue2pAqkJsTSYTgjG+C+kbZAkakK5QhBEjorFRpx5kbpCvRf8hs0A+y2yyQgexB9kVRK2MbIVSr
 FCSNlvThdwfhACyAbllanYMikeGNHYz8muo1ZGv0EhRO8lZA0MHIlhB2Ai7DgCEkexdZB9iNyP
 CNdQYPy0fElRO5JJDHU0PohVEqgFRhWwKkoPy0YVWRpfL5QcoPtFnwwMAAA==
X-Change-ID: 20260112-kaanapali-camss-73772d44eff7
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: mO-0DlXZIg-pce2puwm37fV8QTm2lkeJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX8K+13ZSY9w2O
 mpoIuN3AlAyF9/6K/CL+SH2ZsTShQU7tPuiiMmWti/bHnGU8UmnKq3xy3t1biPKQe8HX4PUZyho
 I7E68Wk7Fc84cJRBLz7BbKlBnPRZ9mVVOo5Z3bTlrOnsKNtH9eI/uUGAEa8oudPoHWCWM/BBd6e
 YjEqspevLm7HohTnPCsJX6R+tStTZ4dM+9mkw3jWfd/G2yaVXNGH/4cCKSuZQeBoMMn3SWCcDkd
 zwOE5nEkiFEjG7BRcx4NPtiMSoSE4kfXfcwPt4maUZQcTSy4L9vbJziFsYJdU2Vm+N2kDaLjtQ6
 RXcDJnY0BRLFVFPe+V5gZaZ4c1y64y8Bn3VYwgQziQqnUETgLT68iFFBKsDKD8sh1nIK9PrwOLp
 7g906/KtSoqwTT4Sm4IWojHMwzlFP0PhY151Wtz1UFwMFm9yM2OrvMmi9PBw2T/wfY3Vngl3wuq
 iIwTmQigzHldYOM3CCA==
X-Proofpoint-GUID: mO-0DlXZIg-pce2puwm37fV8QTm2lkeJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXzIHCmQfZTNB1
 NijI6CkWMVxBvVxAR1/iZqrPylZqaNm04RfiulPvfQ830UTTC7pYuwJTw0NFVEdwdAj9KiZpUv9
 l+jxltjjnRmXEgm5ryd0bWkteEPIxt4=
X-Authority-Analysis: v=2.4 cv=bYv+w+PB c=1 sm=1 tr=0 ts=6ae212d6 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=evSYKa1S7t0lYFehcVYA:9
 a=mFjy0mxVfy5YfI7e:21 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

Add support for the RDI only CAMSS camera driver on Kaanapali. Enabling
RDI path involves adding the support for a set of CSIPHY, CSID and TFE
modules, with each TFE having multiple RDI ports. This hardware
architecture requires 'qdss_debug_xo' clock for CAMNOC to be functional.

Kaanapali camera subsystem provides:
- 6 x CSIPHY (CSI Physical Layer)
- 3 x TPG (Test Pattern Generator)
- 3 x CSID (CSI Decoder)
- 2 x CSID Lite
- 3 x VFE (Video Front End), 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite

This series has been tested using the following commands with S5KJN5 sensor.
- media-ctl --reset
- media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F  /dev/video0

PHY driver part for maintainer Vinod Koul (3):
[1] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Kaanapali CSI2 PHY
[2] phy: qcom-mipi-csi2: Parametrise the common status register offset
[3] phy: qcom-mipi-csi2: Add Kaanapali support

CAMSS driver part for maintainer Bryan O'Donoghue (8):
[1] media: qcom: camss: Add addr_update hooks and guard CSID reg_update
[2] media: dt-bindings: Add CAMSS device for Kaanapali
[3] media: qcom: camss: Add Kaanapali compatible
[4] media: qcom: camss: Add PM clock definitions for Kaanapali
[5] media: qcom: camss: csiphy: Add support for v2.4.0 two-phase CSIPHY
[6] media: qcom: camss: csid: Add support for CSID 1080
[7] media: qcom: camss: vfe: Add support for VFE 1080
[8] media: qcom: camss: tpg: Add support for v2.4.0 TPG

DTS part for maintainer Bjorn Andersson (4):
[1] arm64: dts: qcom: kaanapali: Add CAMSS and CSIPHY block definitions
[2] arm64: dts: qcom: kaanapali: Add CCI controller nodes
[3] arm64: dts: qcom: kaanapali: Add camera MCLK pinctrl
[4] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5: Add DT overlay
  

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
Changes in v23:
- Add the CAMSS top register region to the DTS - Loic
- Use the GPIO function with bias disabled for CCI sleep states - Loic
- Move the common CPAS/GCC AHB and AXI clocks to the pm_clks array
  in a separate patch and drop them from the VFE clock lists - Loic
- Replace the CSID AUP/RUP union with separate reg_update/addr_update
  field pairs to simplify the logic - Loic
- Link to v22: https://patch.msgid.link/20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com

Changes in v22:
- Add addr_update operation function to CSID and VFE to extend the
  CAMSS capability for split AUP/RUP in CSID instead of traversing
  the media graph to dig out CSID reg_update capability - Loic/bod
- Modify CSID 1080 and VFE 1080 to adapt the split AUP/RUP design
- Add SOF and EOF enable bits with top level RDI status offset to
  allow their corresponding interrupts but not configured on - bod
- Remove redundant space between the specific property and its
  paired property name - Konrad
- Collect RBs and Acks from Bryan and Konrad
- Link to v21: https://patch.msgid.link/20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com

Changes in v21:
- Drop reg_update_after_csid_config flag. Skip the VFE-side stream-on
  REG_UPDATE only when the connected CSID implements reg_update - bod
- Add address and size cell properties in camera node to avoid
  potential warnings during compilation
- Link to v20: https://patch.msgid.link/20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com

Changes in v20:
- Remove the redundant null check for reg_update_clear in VFE - bod
- Define the port property for CSIPHY nodes and align the style of
  CAMSS and CSIPHY nodes - bod
- Replace bias-pull-up and bias-pull-down with bias-disable for the
  SCL/SDA pins of CCI nodes in TLMM, as internal weak pull is inproper
  with existing board level pull up resistors - Loic
- Align the if-else condition in TPG version judgement and remove the
  redundant comments in TPG code but describe the hardware changes in
  commit description
- Add Kaanapali camera subsystem and S5KJN5 enablement dtso
- Link to v19: https://patch.msgid.link/20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com

Changes in v19:
- Remove the internal CSIPHY hardware operations for CAMSS - bod
- Collect RBs tags from Bryan and Rob for CAMSS binding - bod/Rob
- Split the PHY and CAMSS into separate parts and document the
  corresponding maintainers in cover letter - bod
- Link to v18: https://patch.msgid.link/20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com

Changes in v18:
- Rename CSID and VFE hardware version from Gen4 to 1080 - bod
- Correct the description for CAMSS ports in binding - Krzysztof
- Add lane count fallback path for CSID RX configuration - Sashiko
- Align the TFE lite line count with the commit description - Sashiko
- Use hyphenated pattern for MCLK node names - Sashiko
- Resolve conflicts introduced by Glymur in CSI2 PHY binding
- Correct the spelling mistakes in cover letter and enhance commit
  description for compatible and CSIPHY
- Link to v17: https://lore.kernel.org/r/20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com

Changes in v17:
- Rebase due to CSIPHY re-arch dependencies merged - bod
- Remove redundant CSIPHY resources in CAMSS block
- Enhance the commit title description for CAMSS and CSIPHY blocks
- Collet RBs from Loic
- Link to v16: https://lore.kernel.org/r/20260915-kaanapali-camss-v16-0-c9f3f6f4180c@oss.qualcomm.com

Changes in v16:
- Remove RBs for binding, CSIPHY and CAMSS DT as tags stale due to
  split-CSIPHY re-arch - Krzysztof
- Update CAMSS bindings and driver support for the standalone CSI2 PHY
  provider and graph-based PHY lookup model - bod
- Add the CDM IOMMU stream and simplify CAMSS binding example part by
  removing redundant subnodes - bod
- Improve commit descriptions for CAMSS compatible, CSID, VFE, TPG
- Clarify the common-status-offset change with x1e80100 compatibility
  details and future SoC offset considerations
- Add Kaanapali camera DT descriptions, including CAMSS, six CSIPHYs,
  three CCI controllers, camera-control I2C, and MCLK pinctrl states
- Rename I2C and MCLK pinctrl nodes to include interface identifiers
- Link to v15: https://lore.kernel.org/r/20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com

Changes in v15:
- Add TPG v2.4.0 support
- Drive the CSIPHY through the standalone phy-qcom-mipi-csi2 DPHY
  driver, which let CAMSS csiphy_res only carry id, ops and formats
- Add a preparatory patch parametrising the PHY common status offset
- Add the mipi_csi2_dphy_3nm_kaanapali config and "qcom,kaanapali-csi2-phy"
  based on the new split-csiphy arch
- Link to v14: https://lore.kernel.org/r/20260601-kaanapali-camss-v14-0-e76f26aa6691@oss.qualcomm.com

Changes in v14:
- Define 'CSI2_RX_CFG0_PHY_SEL_BASE_IDX' locally in camss-csid-gen4.c - bod
- Align csiphy lane registers value capitalization and case rule for 2.4.0
- Rebase this series due to conflict - bod
- Link to v13: https://lore.kernel.org/r/20260508-kaanapali-camss-v13-0-2541d8e55651@oss.qualcomm.com

Changes in v13:
- Remove prerequisite dependencies that have been merged upstream
- Remove redundant empty 'regulators' initializers in csid and vfe  - bod
- Revert binding from full hardware description to CAMSS-only scope for
  modular and incremental development - bod
- Rename icc path names and vfe clock names to drop redundancies - Krzysztof
- Separate port index from VC value in csid_configure_stream(). Previously
  vc was used as both the loop iterator and the hardware VC, causing
  misconfiguration on RDI path starting from 1 - bod
- Link to v12: https://lore.kernel.org/all/20260112-kaanapali-camss-v12-0-15b7af73401e@oss.qualcomm.com/

Changes in v12:
- Add CSIPHY regulator current due to regulator interface changed - bod
- Link to v11: https://lore.kernel.org/r/20260112-kaanapali-camss-v11-0-81e4f59a5d08@oss.qualcomm.com

Changes in v11:
- Rebase this series due to conflict - bod
- Update binding commit message to align with previous generations
- Link to v10: https://lore.kernel.org/r/20251211-add-support-for-camss-on-kaanapali-v10-0-39e8874dcd27@oss.qualcomm.com

Changes in v10:
- Update interconnect and CX domain AXI clock names to be consistent with
  previous generations - bod
- Update the struct name for csiphy lane register settings to make it reusable
  for other compatible chipsets
- Updated power domain names to IFE for consistency - Krzysztof
- Add description for acronyms listed in binding commit message - Dmitry
- Link to v9: https://lore.kernel.org/r/20251208-add-support-for-camss-on-kaanapali-v9-0-3fcd31258415@oss.qualcomm.com

Changes in v9:
- Updates the names of some of the resources in DT bindings to be consistent
  with previous generations and improve the commit its message. The name
  changes are also applied to csiphy and vfe camss resource lists - bod
- Link to v8: https://lore.kernel.org/r/20251130-add-support-for-camss-on-kaanapali-v8-0-143a8265e6e8@oss.qualcomm.com

Changes in v8:
- Change csid and vfe driver file names as 'gen4' to reuse for other SOCs - bod
- Add missing register descriptions to binding and cover letter commit log - bod
- Link to v7: https://lore.kernel.org/r/20251120-add-support-for-camss-on-kaanapali-v7-0-de27f9a67ce6@oss.qualcomm.com

Changes in v7:
- Add ICP SYS registers to camss binding - bod
- Rename 'is_deferred' to 'reg_update_after_csid_config' to do rup/aup
  after csid config to make it clearer and simplify its call path - bod
- Remove unnecessary bitwise AND while configuring image address to bus- bod
- Tidy up a comment and a couple of hex values and csid/vfe - bod
- Link to v6: https://lore.kernel.org/r/20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com

Changes in v6:
- Modified the bindings to represent the whole of the camera hardware on
  KNP than just what is exercised by the CAMSS driver by extending the
  descriptions and the properties, the regs, clocks, interrupts, power
  domains, iommus etc. In addition, use the word 'vfe' everywhere in the
  bindings to be clear that all of those resources are referring to the
  same front end modules. - Krzysztof/bod
- Change camss vfe power domain names to align with the binding file
- Link to v5: https://lore.kernel.org/r/20251030-add-support-for-camss-on-kaanapali-v5-0-f8e12bea3d02@oss.qualcomm.com

Changes in v5:
- Refine v4 change log - Krzysztof
- Fix typo by removing redundant numerical version in kaanapali camss binding
  comment description - Krzysztof
- Add missing tags that should be posted with v4 revision - Krzysztof/Andi
- Link to v4: https://lore.kernel.org/r/20251028-add-support-for-camss-on-kaanapali-v4-0-7eb484c89585@oss.qualcomm.com

Changes in v4:
- Add detailed hardware descriptions and revise message title to follow the
  standard comment format for kaanapali camss binding file - Krzysztof
- Format kaanapali camss binding file to keep style consistency, by reverting
  power domain name from TFE to IFE and keeping clocks name order as last
  generation - Krzysztof
- Separate the 1.2 and 0.9 voltage supply DT flags for each CSIPHY to allow
  for arbitrary board design with common or unique supplies to each of the PHYs
  in kaanapali camss binding example, based on v2 comments - bod/Vladimir
- Link to v3: https://lore.kernel.org/r/20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com

Changes in v3:
- Use the name 'ahb' for 'cam_top_ahb' clock in cci binding file - Vladimir
- Reduce and simplify CSIPHY supply, port properties in camss bindings - Vladimir
- Resolve the dependency issues in the camss bindings file using ephemeral
  DT nodes - Vladimir/Dmitry
- Update hf mnoc name and bandwidth values for icc module - bod
- Split CSIPHY status macro changes into a separate patch series - bod
- Add clear functions for AUP/RUP update in csid and vfe for consistency - bod
- Clarify why the RUP and AUP register update process is deferred - bod
- Clarify the necessity to keep NRT clocks for vfe - Vijay
- Link to v2: https://lore.kernel.org/r/20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com

Changes in v2:
- Aggregate CSI2_RX_CFG0_PHY_SEL_BASE_IDX definition into 'camss-csid.h' - bod
- Remove 'camss-csid-1080.h' and use 'camss-csid-gen3.h' header instead - bod
- Remove redundant code in 'camss-csid-1080.c' and align the namespaces - bod
- Slipt 'camnoc_rt_axi' clock in vfe matching list into a single patch - bod
- Add whole vfe write engine client mappings in comment - bod
- Remove hardcoded image buffer number but use 'CAMSS_INIT_BUF_COUNT' - bod
- Remove SoC specific logic for vfe ops->reg_update and add a new variable
  to determine whether ops->reg_update is deferred or not - bod
- Add description to explain why 'qdss_debug_xo' should be retained - bod
- Add the procss node in csiphy register list comment - bod
- Rename the variable 'cmn_status_offset' to 'common_status_offset' and
  align this with macro in csiphy register structure to avoid ambiguity - bod
- Aggregate Kaanapali items into the definition that introduced by
  'qcom,qcm2290-cci' in cci binding file - Loic
- Format 'kaanpali-camss.yaml' binding file
- Link to v1: https://lore.kernel.org/r/20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com

---
Hangxiang Ma (15):
      dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Kaanapali CSI2 PHY
      phy: qcom-mipi-csi2: Parametrise the common status register offset
      phy: qcom-mipi-csi2: Add Kaanapali support
      media: qcom: camss: Add addr_update hooks and guard CSID reg_update
      media: dt-bindings: Add CAMSS device for Kaanapali
      media: qcom: camss: Add Kaanapali compatible
      media: qcom: camss: Add PM clock definitions for Kaanapali
      media: qcom: camss: csiphy: Add support for v2.4.0 two-phase CSIPHY
      media: qcom: camss: csid: Add support for CSID 1080
      media: qcom: camss: vfe: Add support for VFE 1080
      media: qcom: camss: tpg: Add support for v2.4.0 TPG
      arm64: dts: qcom: kaanapali: Add CAMSS and CSIPHY block definitions
      arm64: dts: qcom: kaanapali: Add CCI controller nodes
      arm64: dts: qcom: kaanapali: Add camera MCLK pinctrl
      arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5: Add DT overlay

 .../bindings/media/qcom,kaanapali-camss.yaml       | 306 +++++++++
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       |   4 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   5 +
 .../boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso |  81 +++
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         |   7 +
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            | 760 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   2 +
 .../media/platform/qcom/camss/camss-csid-1080.c    | 413 +++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h     |  10 +
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c |  23 +-
 drivers/media/platform/qcom/camss/camss-vfe-1080.c | 213 ++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |  11 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |   4 +
 drivers/media/platform/qcom/camss/camss.c          | 288 +++++++-
 drivers/media/platform/qcom/camss/camss.h          |   3 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c |  32 +-
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |   1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |   2 +
 18 files changed, 2151 insertions(+), 14 deletions(-)
---
base-commit: 5fed66a6fde4dcc6a63ecec6f32e1a331dc4e1a4
change-id: 20260112-kaanapali-camss-73772d44eff7

Best regards,
--  
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

