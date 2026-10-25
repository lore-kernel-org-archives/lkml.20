Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898248;
	b=Tyl9Lxi6/aEPnJg+WGrMquywpRG8gk4KUaz0BWP4Zn2Niv9jxusDQjnJCFvd7rFv6J2A
	 MUq4IgjKVhXbznrVUhcwwPfA79AaE2lL+xIkaOZ6EvK+0xge7VuILrqei8t2Nm7ioYq8g
	 caGe+IfV++j2lJBu6Lg6XI30domLtc4ytHQsur4SNCtaKlZQSb+POq18L2e3L/YjlXUdp
	 Y7paRoQYnBGQUEa6mIWfdSTLBJ3bn1zfsrJulwErpAlAcGW3taE14fsdUhsvc0RoV9G+h
	 mnWxGiyhza2uw42fbgC8xFU1CO2u3WS0ap9ThyAuKQiOyIshHjmOroX5zRw8kbQ3Btg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898248;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=86oG2sMAWYQ0Ptji6XGY6DZDu0aNYohA0G3P6THr8Lc=;
	b=uaYpeHIedEBFtQ23mg7Dx82tMBM3uSAEA47vdeicSHnPHOnvdS88Bxs+7ihLsnbmX0mM
	 DlxkGwwEdtTtG9ZI3efUrkVr4dXqF5BakFy6L30ZZ7PW9+MVmXZSQVT/s44XmDFfMvp/k
	 gk0RWEUvHOT50FND4S3MkphcDS4MUL5n6T7GNt7l4A13MrV7kYeRT+t+rq8+VktrDqvOP
	 HQV+IJkNRnHO/BDqTmmHaqPqhI/i9MlabaZyI0fxTiCnUfdhPtCD05sqDpxZD69mGAmup
	 ibcbsbb8wVJbDsFSE4SI7JZFFti2GkHpXLj2yZxgtqTj9yV440pPxEQhA7TLoTf1dww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=duwe5fD3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hNvRx19y;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C4B606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44C4B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=duwe5fD3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hNvRx19y
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P170Wh2777525
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=86oG2sMAWYQ0Ptji6XGY6D
	ZDu0aNYohA0G3P6THr8Lc=; b=duwe5fD3tKtLezPgF/a96g5SrSosV/NwBB1cZe
	osmEe4EAMg6uGBAVgU0Am//F8PdvqJMJ83bUpbCUaMT3Bf3s3xlZjxdqnl0NFpP5
	VeE1vUcZfrnHixQciQr1s6G7Eyl5jbUAeAKrmoep1oH9fUixHWiEt9mO0OVmqEpF
	7N+KzZojCRruHAm/3ljgvEtYtmKZO7zUtCzZ07A+Nj18WFv0R7iMncJausAiBcSm
	Gi77yWU+7AZ6Gl+3EHiiqzfXBNf+6EtvhrpvuJYa6YS0xCc1r8xvBYyK1/5nmj0N
	qeH8Ins/yZ/VKbJzg7T6Qf6OwUhs2gcQ6lHgqFs1e6dt9s1Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm0gjdh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:17:27 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3692c5b061bso7399436eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792898246; x=1793503046; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=86oG2sMAWYQ0Ptji6XGY6DZDu0aNYohA0G3P6THr8Lc=;
        b=hNvRx19yIYnxYY5434OCdCPCC3VbXCdM4tfE1MKekNyWws4EcBHr4bb+eKmFxWFOrf
         odKTtSgacr3YfsrMNNZH7vXoj09EkXVPWXmy7+Y4QhqA0hAgEg6a/O6Lgu3NAdTXnewr
         jsS9lw/lSDMxWt2V1RYw9ykVeLWrcCNqfNpH9BsNDabuP9doW8IqCQxcQKceBXM3PyiF
         BR4/36wHtuLgk9HI4u6X+QM7Zk8oY70x0BAMxrncGt9+W/X+EnwmnGyeMgnmLt5O/FRS
         KakudIkoCrwP4rlgfzsqnYtegHNFgCGFsHTHpnPd+jqCuoGOxPvf431TLAk+GQifkRV0
         rdSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898246; x=1793503046;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=86oG2sMAWYQ0Ptji6XGY6DZDu0aNYohA0G3P6THr8Lc=;
        b=F4WDqpRQgxXyZdkTM5vl5PkteCGsTwVelHfiNTrG5GOyIO/aZ/WitF+j98sPM0y27o
         EGqr+mYGMn08wlayxDsT3zmbax6hHwIeFeGLcE8ir1tM8HdP2+IrDek4aESdC51Ig00p
         hhwp8LHnvAivUyJot8i2rVniEf/ti+pKIqkte5bvQV82kycyoHzdW5w6DAc6vk6pMgKe
         lsjQeqcuEVtPhmaM1Dps6Q/peMMylS5x3QtI24J3iwyW9nV7Prqd+EiBN0NvCJXT9RkV
         lphXxu0I0eEJCTSoh2vbhFDGaf1/bg5yChQg9cWWOtOavIMCTQ6cRzv7W71PbZWwpS3x
         J6vQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJE6PySKhdnxpvMi0ty/KpAwSxA5zQIRNEiqgLthEwKAmNjePxQnRCswBKNOE2MS3x4B8pVzUBwShYhos=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkbSRjxw0Vg8+HH9d2w55pGJOpy6FEFgXGrOnZKw52V3za3dRH
	jdngK+Pj1eVn2aDyZuGkHRNczAEul5LvVJtx+Xyh/N0zBxhkWKPyj8C0Ba9xcLGBOcxEBtxbVwz
	wl7EzJxTM20ZHOVw/rJYdQRrm84IKoP0ScAUdWw71+WuqoU+WuFI0OdfcDlZzPvHAYw0=
X-Gm-Gg: AYBFou1JcfYSIblFKK7Sd9SGmAtj/6PdJILoVLBzAgFImC+pwLSujb3S7/NXW9RKh9f
	GNBJ+p7dLV2oZy8O2/2iuB0ycmUhBBAnuPrWppGqMu2ZvlVGWuJFHgVargF7DOzwek0zwfHdJUO
	Wiwkp2sb/1AJ9DQoxiVLV8ZScJCj1N/bpEsui+GY68KaTD00GKWKdYhwnNr2zsTBL6XVIr4JksZ
	qIDGfakwGjtMXpItAC4k4ozKHedQScheZ8eUyCnd+Q+JIhvmQEWU4qXhyqyi7q1J6iJMWJITZSN
	HeyEwKn96fW/xov+pkvVQHiPHR0jqr2Uis3Oh/sdbAaj9lYuOCV3kGX5hDccD0a1czShPnbElEB
	xOSCI6dWWKAxGZ9e/wFzQq0rt1+wP8Y/265qj3Ohvmi7+pMlH0P8HwrRN2g+3H5H40MXCPpjXB4
	8lfiZ0qX6uYA==
X-Received: by 2002:a05:693c:2502:b0:366:6644:2839 with SMTP id 5a478bee46e88-369e836b295mr4708652eec.3.1792898245684;
        Sat, 24 Oct 2026 20:17:25 -0700 (PDT)
X-Received: by 2002:a05:693c:2502:b0:366:6644:2839 with SMTP id 5a478bee46e88-369e836b295mr4708616eec.3.1792898244950;
        Sat, 24 Oct 2026 20:17:24 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm24133054eec.23.2026.10.24.20.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:17:24 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: [PATCH v22 00/14] media: qcom: camss: Add Kaanapali support
Date: Sat, 24 Oct 2026 20:17:19 -0700
Message-Id: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XSzW7CMAwA4FdBPS/Izn857T2mHdLEGdWgQAOIC
 fHuS4u0Ii25RHIUf7bs3JtEY0+p2azuzUjXPvWHIQecv60av3XDF7E+5IuGA9eAyNm3c4M7ul3
 PvNunxIwwhgcpKUbT5KzjSLG/zeTH5zMe6XTJ8vl52XQuEfOH/b4/b1YD3c5swhG4aKaEbZ/Oh
 /FnbumKOKdUq+cHDJhFklG1TgWw74eU1qeL200V1vmY0SuKBVJgC5DIEFcSgyWltMIaJBco91S
 AZIbI6Mi1c1q3VUgtkOFQgFSGPHToEbXxKtQgvUBtTvoP6Qlqo4g6SrTga5B5gXhpRiZDwWcoC
 BONrkL2D0IAUYDstDXTOUkdQeiqM2pfoVJHbYY67pUVFBUQVCAOLxAWhp0XAEwLaq2n1vnqjDi
 +QoX18+lDgoyB22BReV2AHo/HLwbM0XN6AwAA
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
X-Proofpoint-ORIG-GUID: pWLpJvKaJkPgbqgAfJsmAoXC-ucGy5TY
X-Authority-Analysis: v=2.4 cv=UfTE26SN c=1 sm=1 tr=0 ts=6add74c7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=evSYKa1S7t0lYFehcVYA:9
 a=7qzPE26d0q4XaHo7:21 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: pWLpJvKaJkPgbqgAfJsmAoXC-ucGy5TY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX5gxGstSIA47f
 ok6/TvFJYJ7ND5O65fu/mTOM1t2J/IBglLll+HA1dRTOFUPD8u4bkSCd8RJOCQmOJfBJUksYu79
 IorKymzgk0OA0QtbtW8W+inXzgb94sCrr5bANCA2v2NI9V1spU3hUZ27o19kS/9VswtErP1BW//
 T7cpYZA5h0GJFnFKWLIBj06OBGKzAiCXLmfW88pMvTRPkzX63KwbYMkXy99p3Ns4cAjcd2w18+Q
 oGxltdyAnEMkjapjTK/5cDHoxPq3gQVLYgBtbwRpu8vKxpCHjglqY9ruMCAa/+gTScZ/zaw/JAe
 NKKzqQEzHubHtu3Vdd56uJI94ZarwY31W/Fc+gwMchl8/lMPUU3jWhBM/bQE6Q4lJJtaTw4aGEp
 QbSA9zW8nz2jNfvvpj6w7in37pPu+sYpDoN30YbvKCG742gA3C7ZEyfrOWI4t4ky4GhgPDpEBrB
 hILD6TomLYtOWE6JkqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfXxb7U8Uwb8Gv+
 /Pe6q/0EcP9E3ePiRPcFLw8qapOfSCQTgePi0FfqNL5O85+PwG2HnySrhW7Qb6B1HVYP6tAOcDD
 unLaroN1mDUU1tEZtcVIzgGsiz0sOkU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250012

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

CAMSS driver part for maintainer Bryan O'Donoghue (7):
[1] media: qcom: camss: Add addr_update hooks and guard CSID reg_update
[2] media: dt-bindings: Add CAMSS device for Kaanapali
[3] media: qcom: camss: Add Kaanapali compatible
[4] media: qcom: camss: csiphy: Add support for v2.4.0 two-phase CSIPHY
[5] media: qcom: camss: csid: Add support for CSID 1080
[6] media: qcom: camss: vfe: Add support for VFE 1080
[7] media: qcom: camss: tpg: Add support for v2.4.0 TPG

DTS part for maintainer Bjorn Andersson (4):
[1] arm64: dts: qcom: kaanapali: Add CAMSS and CSIPHY block definitions
[2] arm64: dts: qcom: kaanapali: Add CCI controller nodes
[3] arm64: dts: qcom: kaanapali: Add camera MCLK pinctrl
[4] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5: Add DT overlay
  

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
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
Hangxiang Ma (14):
      dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Kaanapali CSI2 PHY
      phy: qcom-mipi-csi2: Parametrise the common status register offset
      phy: qcom-mipi-csi2: Add Kaanapali support
      media: qcom: camss: Add addr_update hooks and guard CSID reg_update
      media: dt-bindings: Add CAMSS device for Kaanapali
      media: qcom: camss: Add Kaanapali compatible
      media: qcom: camss: csiphy: Add support for v2.4.0 two-phase CSIPHY
      media: qcom: camss: csid: Add support for CSID 1080
      media: qcom: camss: vfe: Add support for VFE 1080
      media: qcom: camss: tpg: Add support for v2.4.0 TPG
      arm64: dts: qcom: kaanapali: Add CAMSS and CSIPHY block definitions
      arm64: dts: qcom: kaanapali: Add CCI controller nodes
      arm64: dts: qcom: kaanapali: Add camera MCLK pinctrl
      arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5: Add DT overlay

 .../bindings/media/qcom,kaanapali-camss.yaml       | 303 ++++++++
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       |   4 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   5 +
 .../boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso |  81 +++
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         |   7 +
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            | 758 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   2 +
 .../media/platform/qcom/camss/camss-csid-1080.c    | 413 +++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h     |  17 +-
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c |  23 +-
 drivers/media/platform/qcom/camss/camss-vfe-1080.c | 213 ++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |  11 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |   4 +
 drivers/media/platform/qcom/camss/camss.c          | 309 ++++++++-
 drivers/media/platform/qcom/camss/camss.h          |   3 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c |  32 +-
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |   1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |   2 +
 18 files changed, 2173 insertions(+), 15 deletions(-)
---
base-commit: 77cb3534193b758eaecd662a610a3a1bffde43ed
change-id: 20260112-kaanapali-camss-73772d44eff7

Best regards,
--  
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

