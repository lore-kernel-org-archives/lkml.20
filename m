Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793710312;
	b=ZtxbP+wz49QAA46V/z2tLseJ4Vc7q9Qs/qxr1X77tuG7gflvXHVwNCWNdRZsDdfiETAQ
	 rMY+40DZZ4CtZMKqzHCW3I9YsEBafVHcB+n7xIbVVKZtl5R43kSud/6iMumBbf1+GiVgL
	 NgY5tl127ui7+e71p0bY2JkFdFedLIP/hYeIw6rpVWNd7HFrgccb0t2qXXZ1iYu2n14P7
	 1NSUHmtP2bC9JTpmfPTmnfSe7X6D3+sVu9trzEnDBwA2zkH4vPLzjUviy4eyUEvebHDPf
	 2uZhJeeuen3apAe35emO1MtIL307/Jbw4fJcZqkKLw64CniokvIIsLye9lBnw1DBxng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793710312;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MvI9s+vxqYrzkFHqaDuUend+Fy1l8uPbk63PrVt4O+E=;
	b=qrKqMpW+udMAH2hbkmv2uGE9WDdU6zubFQXwhKk0f6WAwq66FrP4/rNq1SdI7dBCiXVF
	 3CYGrusb8+5w7ee0vh4YgbubnNV75NJDwEcQRYKGulwoIVh/WSnSjMcnAdf89Npt0aRUC
	 gTYyPvcwL12fDaZfkLT5Tc3oOZ3wVhz/OQ1/9Ghs2McjzcbyJpUTJ5M604Hp31Tvf6JIH
	 zn+T4t6Ujj9OZhgpnegNJFMJt7PFDrDM42A/KvkMM7eGoLZ8st0zVbP2ndS3D6YL4GN7a
	 ylATn7XSy/eTWW8B5BLb6BABrjPiiqln7VzeH8bhLeF34U/bB7/1JyVYdcH+GCEcO7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PzwMscs5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PmIBVmQ+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522F8606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 522F8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PzwMscs5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PmIBVmQ+
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3ClC9g3506766
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 12:51:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MvI9s+vxqYrzkFHqaDuUen
	d+Fy1l8uPbk63PrVt4O+E=; b=PzwMscs5Xkd/A5f/rDQ/HRTzeOKuj2+NeZwLEI
	lFB6PoprJqYbYcZ6HmlZgV6ol80SmA6ZtmIhWD3Vh+BQAxgv2Ql1waXP1CLJtXl8
	CdWjtFlSV8sssLRrodKUMuNN5BT/PT9LiEZfbHIiVbld00pEyBGlifuBmNLkk5LY
	6Dyagv/KUEoiUYD/8c32kkELZZyCKsH+jmRnG+18CC2kjxXIh2JS5WBzzP6IaNp1
	WFa2T7pwrIm/QCf5MczEgVslISnKqC2HWo2RqyLQ56S402ostqpu0pfBsmeGwSl/
	WzT9Fxi9f1amB9k8yKbNdvpQfCSouAvo+0y3FuUDmV4SWpnQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m9a9rd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:51:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e8ad8c5f80so68137455ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793710310; x=1794315110; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MvI9s+vxqYrzkFHqaDuUend+Fy1l8uPbk63PrVt4O+E=;
        b=PmIBVmQ+Wbti1tYZ6Tcu92/N641NiGMNuYbLg44D9qkvpC7f9L0/BWyvnfO6bmrOhj
         RRFZ5SeazYLfOxKic1Sqo7N+8p54HmQ3kbYqUiLWG20x18qDZ0Nk5e3asSPYJl4OKzYE
         iV2qBLtIAQpCuzUwviryITb2plpWYCkKcln3zncUZhJS+P1RLWuJ1iyhETBfaRiXexEZ
         qJRvC5/TqI29kCaUMlkVuRd7d+oakQ+28YEIUc5AHK4NuEpIEDzJQESOo+UFMKcgwOQ/
         p2/DuhzLvV28sMG8EgHHi7MOyPaPzPSrsptqRTRCJ55NlCjpAmfg97CYc7OnQC/1cdsJ
         y01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793710310; x=1794315110;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MvI9s+vxqYrzkFHqaDuUend+Fy1l8uPbk63PrVt4O+E=;
        b=oM01kRXa6Q4BpxjiKsmpD4X/LuZ3DwXwnPXWm/SxijouVgP3MusrEFP7AzVm3hpHJQ
         RRoTkujKnUOWWf+r67VldSvCx4f8sBySnGwwfnzxkuY2IknWBCSfuMEZcvSk+whQJ2q+
         sDJoWcEQ6Nbfm/PWnqv36OUwI8IKUnGwfuqaFPQcOw0Ys9yTDyUWxGwLUAs2c+fjukNJ
         z/A+nskAJsImZqyiGKN/A1MnZmXKY/szsbhVWM00FfsOceXiizTRiRVi71XNaDNiVOek
         enkCBn55/g/jnc7BLg7ZORcytJLykTojzAn3dG+i6dLHFLv8J0281iQNy9rXl3LLyVZy
         TqSw==
X-Forwarded-Encrypted: i=1; AKwUvBxZ4wviejC8DcHFPb0t3tGzr2+pCRfnamJOgDJeARladcUu81fYZJH9CNW/gX5QirFiur6TyaUsKIfewUs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+t78vt3aeKKi+kvocsDK5pONjZYPBDlLPiwCe3SkB8tdwgaTcf
	80XENv0OZ02A71ZtXyiZG6ZzaS8N/ZFPsK1E7nhUWYfXBx8LOlW83Si2O5c6ORrjlx9ZTmrwZUH
	jSeSWXV4X8iPTiEP0kXKxYfihedqu5YpHRw1iLhMz37eTiHV8gZ9wwL+UM1i3wWwXdSU=
X-Gm-Gg: AYBFou2lClwldVbhD2iLGYf/ChmfXhsWN5ry/5PBRHxuo9hgPpkwLnqVTy93xSTL/U7
	Yv0vtwxZ2LxjxsG6PIoniHK+ikHOlUyt8Yd4kF9t1pqPPAsL6q6EsINTEiNgjc+9Isx0gdMY4z+
	iemkR35ReqLsVPWej+6zrLsfbK9wx2Ky6HwL6NHyCNluS/lc0/CiKY2cdSHuRwoFEDIRkXzi2zo
	oJuExdozXaswnneG9f5s78u2up1aiqOXj0/dESQwB0r4AuxuuJXFSCpNMZNpZZ5g/Y4y/wQwdeI
	3dGS7CK1k6+iKCf5/buXs47PN95iX7cqbpmDCRxGyWolffXa4lZwSy9JS8mTyR5+cm332UVmkkm
	NPnyWTTtCWBX0UVhOPcxa7m32qBErw54VZi7mQzbLWqI2eTPVEY6nxS54MGEiwYSlHROSP3UfGV
	zFdjf70qOYKQ==
X-Received: by 2002:a17:903:124a:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2eb36495fe9mr124446745ad.14.1793710310162;
        Tue, 03 Nov 2026 04:51:50 -0800 (PST)
X-Received: by 2002:a17:903:124a:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2eb36495fe9mr124446545ad.14.1793710309688;
        Tue, 03 Nov 2026 04:51:49 -0800 (PST)
Received: from hu-nmalempa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39266b84sm41027435ad.43.2026.11.03.04.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:51:49 -0800 (PST)
From: Navya Malempati <navya.malempati@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 18:21:44 +0530
Subject: [PATCH] arm64: dts: qcom: eliza: Add RPMh sleep stats
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
Message-Id: <20261103-stats-v1-1-3dc062db66b3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAN/Y6WoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwNj3eKSxJJiXeMkY0uTpBQTi9RkMyWg2oKi1LTMCrA50bEQfnFpUlZ
 qcglIs1JtLQBSH9slaQAAAA==
X-Change-ID: 20261103-stats-3b394bd48ec6
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Navya Malempati <navya.malempati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793710305; l=956;
 i=navya.malempati@oss.qualcomm.com; s=20260423; h=from:subject:message-id;
 bh=wE2xDtIAvPUdGZyRloTfBF9zn9w5/LoqpVgngsrVQh8=;
 b=zZEZVY5VueQtgva3+BAomXX4FHzWGKO5L2Jf8Y5WbW7OGlu10RAFhGcfUCk2fXE1biU2pXWUK
 2V+RCa/iWcEAxQw1qV5JHek74UOlGi1uh7Y6dv6KC7lsXALgionaiOq
X-Developer-Key: i=navya.malempati@oss.qualcomm.com; a=ed25519;
 pk=XWkaQ4rYqw3tflaJ4YH+9iUHSq1kn9eQh+CAbSvNrdI=
X-Proofpoint-GUID: tg-midEo5gHnDYpIvj5VxSPe8svTLyLU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MSBTYWx0ZWRfXwXOgBd4cRFm1
 4c2RTiMMFWTNViZUpTFe//u/PM5Sphv2NdMXtsNFjsz/tf/ByTJtWq4daTjZUHYmf93lWlonmq+
 WYp34uoT8B5darRcSuEX2lBjweYQ0cs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MSBTYWx0ZWRfXyutT3PbFZbFz
 +5TPGrqmCuSewx/t5yY6Cvpqcssuq6fkrGj4ueRdorF/7cJPgQG/9VTviSD5WPwsXo7CWBmjOgA
 yg6Jhovk0EK2RRmybG6bU7IxHlETcFyNkkDVd3bXKzmwOsqO/Ma+cK5VXDJEoHzWkHp3TeTc9On
 QVBSaVM4KWZu8JS3LfRiCStia2Zw2K8TyJ/0d/FUiFasINB6FApkUihRhHOxQlqCWMTckpYvpLD
 KYMjm5I49iB/THT2kSQCAxp8LSNQmEjTy+aSgDYuAk8H+BoZo3dmGEd9NDA9hEzx08wPBuaXYKv
 7x69Tok9febWXefqgKw3JkyC0lcOKOc++45L913Zw//RUZWv++NizeWTbl3c0Uke5fShr8RNljU
 4k9O3o3gadPHB9awg0g1f9PopNhv32ghehbSS1OVswpNXi2f8aBC9RQULtCUH5SQK7WxF7pPV5B
 ugx5JRUBJWkgsK8Kzhg==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6ae9d8e7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=bzhEBfGdM2i4AtwIHPkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: tg-midEo5gHnDYpIvj5VxSPe8svTLyLU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030051

Add RPMh stats to read low power statistics for various subsystem
and SoC sleep modes.

Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index a8042291bd07..13792ee34e22 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -3517,6 +3517,11 @@ aoss_qmp: power-management@c300000 {
 			#clock-cells = <0>;
 		};
 
+		sram@c3f0000 {
+			compatible = "qcom,rpmh-stats";
+			reg = <0x0 0x0c3f0000 0x0 0x400>;
+		};
+
 		spmi: arbiter@c400000 {
 			compatible = "qcom,eliza-spmi-pmic-arb",
 				     "qcom,x1e80100-spmi-pmic-arb";

---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20261103-stats-3b394bd48ec6

Best regards,
--  
Navya Malempati <navya.malempati@oss.qualcomm.com>

