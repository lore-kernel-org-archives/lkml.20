Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E603E0093
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791282379; cv=none; b=UyGunHjWdSpBF8Emg39H8NjnjynEWM/vLxqO07vyfIfJTMklA5DNt1tnTaVCB9uZak0Ve/wqtrZoBOdJTlhTPJGUIaU6NOWns03mwQiSNZO8dCAf+JAD9brUvIBD4F8h179KQpOjyBDenR16q2sHV2a+sGQyWbAODBBrQdrhvAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791282379; c=relaxed/simple;
	bh=Bgtu1G/xKsT1poLg0m9/dTlyXn/OoGnutYJksLEo250=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZLcD5ueLbfQmk+eUzHFy/P9edtPUMoi2Q92XB8rMNSxeYC1Wf1YV8o9auzqPRC1S8x7SZIh9WddhRBAHTbRaODCoryr0CkmhTmZ30L98KW6DCSFx/ahFzRQfpEZyBkINGQWJVij9cksXgLceIFA+UJgHX5FPl58BIQ6xEt7PRLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MXqE1E4Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dBVCPGBb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MXqE1E4Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dBVCPGBb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696A5ZXP3716763
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 10:26:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PpJmWjeWUD+Hl6NsU9Ms6A
	ZsYY2nv+kkxy5+VkQkbmI=; b=MXqE1E4YJNC4vv5qnakLepc78Bd6hIl7/E9nvA
	lyFaEm8WWAFFUxSP4d4dyJDv2VjpcIsVLAjK4gl6wYLlLKhNIs9i8rLm0/WdXOiO
	Xch5gOH7BQZACj1er9oURJOMIhWK6JyMxz64oQB3bLE5h+uYMyLKME9pNbwoCDLe
	63MCpmatgJJ6JWuum5LhkRl1GCqBxxU4cJB70eE2c7Rldedacf+hkCPM1VGHNT3q
	8SfmX2j6AhrgH+eVFe33FrcW8nQvdYLb72mpp3h52/saJa49NDYsz44j5WGHkOgU
	kQzGPywlPv6nODeFtUOeEd87S5m0iD1qDDgz+jC0GqDjMu8g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4fkukf7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 10:26:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a7fa5e0442so2805998a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 03:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791282375; x=1791887175; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PpJmWjeWUD+Hl6NsU9Ms6AZsYY2nv+kkxy5+VkQkbmI=;
        b=dBVCPGBbGW/SwU11H143EZM0II2ONKq3ILKaiTJspvrQfaLtdplitxPBNGcjIsS3XQ
         nwMHYXzkXZ4GyOurXDChXh98HY8UL8puJJRfSqqqgg8V42Y+rct+aRni56tr8pYkeFOu
         +wDy5+urUI+pPP64q6NC1U31jeAF4WRzF7tBs7X9xjxZumTBBnUoIggNBMD9mx0p/tHh
         v27cHgW73Yg/I5FIddumPOtoxSKvA4awe0CwfLHYfJgv8w/i2qIZtpy71NSzcGLqAa9l
         cFo0JkP1eToFCTpxR/sEZCwq8RsSvWdpdJoyWSUQ8hSDzf1HdpJg4s6S1AwPstImstOe
         qzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791282375; x=1791887175;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PpJmWjeWUD+Hl6NsU9Ms6AZsYY2nv+kkxy5+VkQkbmI=;
        b=HblFBQkdaBsZJM96bCaBO5HnPac0OR2X7i15sqvEIyRprwzaPWH/h7LAHuzKUCXbCG
         1hFwBtV4qbqykJer8kKuH9uKzwWw4EoquWku7UtutW+7J0uxCxnMPfALTXqmg1OzV+aN
         CMSTyqGxhrIoKvzVR6zh5z0E1DvrqA5V1S+mPqoYPNJ38dY+EQFVy9UQeYDvzKdGZick
         AiLJRRE/mcMpCcrPdKJKSTa4W8WdLo85O+ABQs8ySuTPQWeZH3OVIySMqCLdQbryvv5r
         DiBc1sb/wU6nOFSmIyarnWfr4zFzahXZTrAWVCm7GKLUspjZoHLulULSjVh8gQNDSgpU
         1KQA==
X-Forwarded-Encrypted: i=1; AKwUvByiSS9qChULrYHXngm17yTwDCfG0Xdh4M5ORvfe8K8yaAv0Vxxc1jZftMUqv9AYMdKgCa2/EJBmao6K4yw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLL1MFYTzRaatkYLO+yhakiThZ2I72vbKd+lkyawM0ByuLLjsqn
	vOnjTmIMrkVUs/54kORISUo58GHWoBp+Pzt0xEBlNwD0x5C96pxbOkDSOqghHh037yLUV1+3l9C
	7ZXrDdxiXahs9wDKoEfdhX4lv6ocTDMhJRTKPHwR5nHzl7VDt1x17sscuNV3QN09/hXw=
X-Gm-Gg: AYBFou02uN3TTGj36EpHRkvcJ3pM2QTCfmuhlCuksARH5G6L6fH/slmnX/XSwLs3fiP
	wBfmFYBjWLb9NpAYEaU5IJE41BTnuMmvFOzJ8rj/Cfsqy47MoCe1VMICpyQf+dtrlHs08WErZGX
	ViihBjmNPfbnQz6TPqPYIaKjo8pfZ2JuvwrMurNn0Juscx4HKchrB2jtTFcY2YH3QCNY88BgPL/
	cBS+hQWVpgsrhYuh9a6177ereHMdC+Hk7qwqLqFYIU9hsDppTAFyzJSe46HbdgsxIldo9o3wMrF
	2fAR1G11cI1PYBvTYPqLXp3PnOeErJ51uC+R8MyrXWDxXQVt7anSZfVTFP74AS35TNGDMiw9jdS
	UDTRM6Da1A74tbX5551JAwHqO7ja4ZRs=
X-Received: by 2002:a17:90b:5623:b0:3a8:d1c:8e67 with SMTP id 98e67ed59e1d1-3a8736cd466mr668278a91.35.1791282374725;
        Tue, 06 Oct 2026 03:26:14 -0700 (PDT)
X-Received: by 2002:a17:90b:5623:b0:3a8:d1c:8e67 with SMTP id 98e67ed59e1d1-3a8736cd466mr668213a91.35.1791282374259;
        Tue, 06 Oct 2026 03:26:14 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853e66d7fsm4088289a91.5.2026.10.06.03.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:26:13 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Subject: [PATCH v3 0/2] arm64: dts: qcom: glymur: Fix fastrpc compute-cb
 reg values for cdsp
Date: Tue, 06 Oct 2026 15:56:05 +0530
Message-Id: <20261006-glymur-dtfix-v3-0-44e2bc5370c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL3MxGoC/3XM0QqCMBQG4FeRXTfZjrpaV71HdLG5kw7U1aYjE
 d+96VVEceDA/8P/LSSgtxjIOVuIx2iDdUMKxSEjdauGBqk1KRNgIJgEoE0395OnZrzbFxUFLys
 QutQMSJo8PKZ65663lFsbRufnXY98a/9AkdN0lTRKaIZo5MWFkD8n1dWu7/P0yOZF+DSKLwOSo
 UrNJZyQ1Uf4Yazr+gaf0MKd8wAAAA==
X-Change-ID: 20260922-glymur-dtfix-6314526b4b02
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Mahima Bhattaram <mbhattar@qti.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791282367; l=1637;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=Bgtu1G/xKsT1poLg0m9/dTlyXn/OoGnutYJksLEo250=;
 b=ReUh1Z/fMl/E8ea/pc8f0LBd5t/4CDU32Z4x0O0CfmVerzz1p8xzdkcVhGP42K+qH6JBbFpIA
 PBaulU2cVkDCZi3hQw32ob7LIrhQ7Y7xCXjXn4lRNRY3IxTBFm8cq0M
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Authority-Analysis: v=2.4 cv=HtPjiETS c=1 sm=1 tr=0 ts=6ac4ccc7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=p04a6VuR7GaqaFzguDYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: rskDb1HSCAeCm8G4OWulNbBmP-sOJwHg
X-Proofpoint-ORIG-GUID: rskDb1HSCAeCm8G4OWulNbBmP-sOJwHg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA0MSBTYWx0ZWRfX8yMx0fk1nhuo
 YvZLbwQZgtYO+qCbib45TUVXADgbzAJBdPNOJUqimYxyo1MW3GCvBwAPq6B3fTiHtp4KBFSXrHv
 yloOjKF1kCh9ELNl2LOG6QX0t74pYvA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA0MSBTYWx0ZWRfX6JXvEirIJ5Zr
 y0vq9D2/xOViHZohhdCLLE7Xtfz4maxOy0zlpDuwV/r8bsWWnefyDYtpAZP1vBbICKDWQqxOB8g
 DLK2rBws3auJ8tgS9UqY9ZdXtsuNzHWFbfJK3uWOS14kgWcFYiEX0DFULDcRuqFuGCK8AKvBkou
 GwTkgWFFBvXxT6N5YioDnSNLlT+QjGAy7G3bpeE6sliOz/isLi7KWeDk1x0jGpyMxYGWaDvxd8C
 u136RyAbxmiehPhC6WL1jCiOQ5uTKcR7XQSe6O3bqY7JFwj7asKVNRfo0hdJSmbCvLOOp91kB5G
 Wl7JF6BEAIhysyiXoa74F1aSE1tYgEJ/K6jkuRwD8lqcAeREeI14h4Mf5TiTaEWCFgSXLFueQob
 Jntonr/WNqng1rI1YMD3BJvc8ChMS6AWl7QaONAKZiTi86R67GwstUZaZJS0/WysySTJMKGkvNx
 jRMh+csJGzrCUS4GLBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060041

The reg value of a compute-cb node must match the SID (the lower nibble
of its IOMMU stream ID) it is associated with. In the cdsp fastrpc node
of the Glymur SoC, three compute-cb nodes had incorrect reg values that
did not match their SIDs, leading to SMMU translation errors.

The fix renames the nodes to use correct lowercase hex unit addresses
(per DTS convention) and corrects the reg values. Since the fastrpc
binding's patternProperties only allowed decimal digits in node names,
a binding update is included first to allow hex digits.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
Changes in v3:
- Add binding update to allow hex digits in compute-cb node names
  (required since unit addresses must be lowercase hex per DTS
  convention, and the corrected reg values >= 10 require hex names)
- Link to v2: https://lore.kernel.org/r/20260923-glymur-dtfix-v2-1-a4b1928e0c72@oss.qualcomm.com

Changes in v2:
- Change unit adress to hex.
- Link to v1: https://lore.kernel.org/r/20260922-glymur-dtfix-v1-1-159da6b0eed9@oss.qualcomm.com

---
Ekansh Gupta (2):
      dt-bindings: misc: qcom,fastrpc: Allow hex digits in compute-cb node names
      arm64: dts: qcom: glymur: Fix fastrpc compute-cb reg values for cdsp

 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml |  2 +-
 arch/arm64/boot/dts/qcom/glymur.dtsi                     | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)
---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260922-glymur-dtfix-6314526b4b02

Best regards,
-- 
Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

