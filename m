Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793947855;
	b=lf7ea6cYJH+ZIH4pGxkG0zxGX2nDcc+GpCKLS/PGoeQM59j3yhU7oaOz8MUxGCjvQuAa
	 FIwIE6g2UyEZVzd1zyDZsUQRxyYpIzwMXxu1ZHGWWvs1JYvri0oxiZIx6bfZx8qQipJOQ
	 AUwHP9kuAS/WxVtkxZ4BnxtRcurQlADjHJaCpOfLTVHYTcq1EavC5Vcth9gyUmPMJ0y+N
	 8HDc2LBoVUaybTlpBbLpUzUHyz8ajPTckwEKXPozi+FaZMEGlcX87rfRUv4MGdO0ZsCrv
	 Jl8tygiiGUpLduMrAVhHyYBYFm0GiaYNYhDKvwIbRmrHRU3XRRyNncDNh0mYYgKPspw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793947855;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dNeDKXrKYOKFzYRUv5DD5Xm3IPsUxN2lQ1AkRqcvQfA=;
	b=ZrG3q0AyylVpobp5bSBhOjBCTSt2M4EZTrw1G44U0VB4rNo8i87mYKaw3plC8GSbNZ/V
	 rYIA+yz7+rOp017nvffvpCByeWbEsZUVVQw/hGeTieHKPk7pivTLsvig2PlpQ3Qnb6KYx
	 kOxyjJVV1JY8ZMq3rcbhx3Oro4KxVTcw+AYEj5A+JQYqc1pFEHusZjrbrcMPaOvd5RzHM
	 Zac6G6tuFq6LFbYXJsHQM1moNzqBefF/rberkMOsWxA0DwoPVx5qBdZWMQDZyjT2vfk2z
	 Jk5kTcoA+ubHKC+CoBjlLpWKxlofwvmYWOhaoU5C8cS0s+zrMWNlhvbABETBzgPAaHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V4ytrOeb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AF5W1mG3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F31D606A32F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F31D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V4ytrOeb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AF5W1mG3
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A641Mhv2473923
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 06:50:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dNeDKXrKYOKFzYRUv5DD5X
	m3IPsUxN2lQ1AkRqcvQfA=; b=V4ytrOeb6YHVjP1HumxXidFfUIeGfE+OIm9Y6u
	TDu/ELw4bEdSUPC0zoRlrdFH3yCthsnya7YKz+IwVceKKb5ZOACJzfvl8qvsNjwu
	MJRLnU6eMjpHrUhPYpFukAF/AlVC7BHrtqALHujOcfkTxOtfWIFGLt7JJriFC61Q
	bmRgUo0pLGXnDvPlMOa1fkmS0p0mWk0TrWAwq8s8g5vdFK+5WRhPe3ivC/oun+h7
	w8HrEvdt0s9bzxr/WJR9LcCf5KkLFdQVW+wXoGvHfx39bFK1+/9LVGmMmANawKAV
	10AftugoP4P9P1gY1W76ePgM+4s3gePs0RI+yx4UIdCzK0Mw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa1er0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:50:53 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd0cf3b1c70so230846a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 22:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793947852; x=1794552652; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dNeDKXrKYOKFzYRUv5DD5Xm3IPsUxN2lQ1AkRqcvQfA=;
        b=AF5W1mG3M4R5riU87bVWdJVje9BmFE1JkcWXhD26kd6Gxq8Rvi9mavidsVUh3ZgZ8X
         ZApcki3yUZ+F9f50t3Mrp8z2qE6xIQgZZ9B3lX9C+J/EsBO2edmnxzxfP2ZxpIzF6BUr
         Lh2pq1JCYGyzyyWGaL9b7ZY2TmXQ23dI8iJWC8XTfdWPtweppIQsEhYehtJar2hh8lTQ
         levRDlBMti8o54h56ghUdzGQci+ZnKO0so6sTVeKxVvSiDppVeId6nVMdY/lyhho8ed0
         /Gwvt2siyAT8XzBFYS6ZEiOgMoSmf1l+fEw8V6a5JAq1BHOPWDuSrjbIC767PB8q57eO
         1xxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793947852; x=1794552652;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dNeDKXrKYOKFzYRUv5DD5Xm3IPsUxN2lQ1AkRqcvQfA=;
        b=x7gaaooL/vSeqSTPL1cvBA2nfFErs+HHeQJYtuPMNnExefCDM1nm9iynWUeNKA/G1V
         cGSYFBv+ks6yxD4W4XTnW/SjYxolTKpmJfk3ADH3XpjrSGgiK4P0SY9y6R2HwK9spFlc
         tAnmsWDUc7eXJxq66Mtl7LCN1+uByIaDkC59ILUiiUWypnYYVss5+XCgz/NqTI83eP4a
         RyU25Ma05yqmZemqxCse4Fv4IKnxV/MH6W24AWgCeh9pnWPL4h3V2EwAkuZSYMx9Z6M4
         znMFsTNfJtMp/50d1+7ESYh/sSxvyYIV0rWOpmOpHp03BhYF2K3JAdY5HJ5OYSqdOz29
         5ZEg==
X-Forwarded-Encrypted: i=1; AL+hErFJLzN3szsUzltbs2zk4/YDWUj3c0T0d3wvlNNDpUBiyLAG6yyOyKoq9WOXuogBgnWdwBIhkJhEEAOV080=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jYVsCCT/O10G9tHfJCp4mKarj5CihJyB7EhutMC+D3cT4IKuZ
	/rAP/3zlFY9GtF8kVamoWcbemXa4NeYUotydfq3N3hUJy7D+bUZpqfbarFD9IGfAXp7pepITO+O
	iloF2ySHwXgQf3Z3LRtgz3PW/rcLORze9F52pb/jlUWmj2z4jb4XokrfUH2bvDDABcNI=
X-Gm-Gg: AYBFou3fCY0MA2gHWL9Ywxt+hZlQU9DNCv9/7u6SxOQ3DRlATygRxaI1uVr6UaWZ3t7
	PHPml2XOc49DZsYbyTje7DLJsdX/9s6E4sY8bp2DdDzk7DfN2ayk7nHHhPNGrTRPZxDSdbqWdaC
	QJQlEha1x9x2Rz12f1cjunrjV3X3hS9xgRF3/lNf7dWIeT8xb1O7g+RUB/Cl0Z6XSjEfWIpWYHJ
	Lx9RRx+Y2Qh0NbgnNWAnDZ2BnIMKsAn/H6eHp+nvvPj6Bfz9ufu20lSY5ff38ba/PlQsy5jobue
	UrprTDU7QjBiTmAadSfT2+dVSzEfsnJFaL4W0Li7shvI4pzMx2JW0aRmp1tdfOa+vRpX4o5yXyl
	uHihskLB20Iv2dJ4/UDxR/r09enp7Dh/kJ9KnNDaOg0cb4GJak5ZahYWx0VCP3bSHO+MQ7/ChfZ
	szuelc
X-Received: by 2002:a17:90b:5585:b0:3ac:7749:2f0 with SMTP id 98e67ed59e1d1-3b0db70764fmr1557108a91.44.1793947851879;
        Thu, 05 Nov 2026 22:50:51 -0800 (PST)
X-Received: by 2002:a17:90b:5585:b0:3ac:7749:2f0 with SMTP id 98e67ed59e1d1-3b0db70764fmr1557068a91.44.1793947851343;
        Thu, 05 Nov 2026 22:50:51 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b313c0dcsm6597274a91.1.2026.11.05.22.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:50:51 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v4 0/6] Add CAMSS support for Qualcomm Hawi and Maili
Date: Fri, 06 Nov 2026 12:20:41 +0530
Message-Id: <20261106-hawi-maili-camss-v4-0-d528c7a797b4@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAMF47WoC/32S0W7bMAxFfyXw81xQpCRKfdp/DHsQRWox0Cxrn
 GYbiv776BYYlqwbDBug4Xsu75Wfp9VOi63T/e55OtllWZfjVx/ih93U9+3rF5sX9XlCwAwVad6
 378t8aMvDMvd2WNdZkvZIDcAUJ5d9O9lYfrwiP332eb+s5+Pp56vDJWxv/wO7hBnmLiIRLVG08
 fG4rnePT+2hHw+HO39MG/OCvzkBwnscdM7olRBRW6n9Hxz6g0PwDoecUzmi9Fa6DXyH8/IW+mS
 PT17f+S35JG21eftoOd/vinDgigEE3zpq5773Zu937luGtcIyajKsIQyoIsZW02iJcqduVPlaJ
 RS5aYYeOQ0CSgLROmeOwWAESQ5JqcC1qlGBlEbXJIRDBvsFRBBaLBKbluxdlizXKl/Dxpa9pNQ
 tj+2ksfMIboQpUjC1CC1eq1QHqG7K2FGhFL9HYLWiCCNLzbl5sJtcSVmyr6GRuteVCuUGmmAIs
 joGSEGGlr86lADcGyUCEN+vmFtT0CE11RYThDFyvlY5yLz0nIjRmoQqTE1rxtqt11C5JkmJ200
 uL0gtE1Zt0s3dHF+pRMUiAytYYC/55pQZ0LNKrX4s3re0bTWUWFrFQZQ4BS5KN6oYCTiWEkcNy
 grI7pa9gx5qHY1jFu4ck/+CL78AdGl6lMkDAAA=
X-Change-ID: 20260923-hawi-maili-camss-b5dc43a00ed2
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793947844; l=6623;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=NKAvzBeIOyHRorG+C7lkP9fG+SDdQ6NSAz4rK2NCADM=;
 b=YSAZ3W9/SQK/lgTTj9ckkXJKOKrXvh20hMJNPshTLin+U6VdO7q4NAhci8Tj8lb3s9b8QlECK
 vEc/Ab8xsS2Co+JCtGnkijBmJyDsReTN4+9D9jh/N0BWnmVb1Nal21/
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: KVWEhGP1lv0jBlB2lDgHTbXtJPNZHnCR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyNyBTYWx0ZWRfXx8Z6mAG2/WcU
 NGqdkwl14VbQu5I2h2/lvntWww44MnE//tdBPLwCzEaXDvGs+mazxAsPwfnHNGEX3Nwrm12rFuS
 ZiZMUaIJU2Yy1YPg+XKKcE0GP09mnkmv7yrM0g8pLWXURs5eY/Ou+b//DvSMrKWE/FLIF7BLsqu
 IDmvToCqNiX7/+1Ue7eqQqHt/objzZF0ifVBJBsbNWuogHezx/sxk2TIjJwqVPaVr3EiSzSZ5YN
 3py7OixPLBJUJsknGsgwYTfpkYK8XHbGyjdlIKld1gYvK80/FQUoHw76hywYNTRImVb5+IoIO/W
 D738T3UH2/eJmtjMKn4O81Yw2zMGNCb+GkzlV5grPJIUvG42qnVfEf2L0PCS7hnzkBSTIoIKrpZ
 o7w+DGz5RXv1pgsC49U3Vhyqvx9JOb6hFl852u+V0jbX1VRDuB1PnLsjsBo+WmY5OeqTWKEbSpn
 1jPNyfvodrQ6F21cY7A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyNyBTYWx0ZWRfX70k4EaxHuu9n
 hDU2rWOf9u9mG89UMgJr1sa00qVwCOWKp7cDl5sAgeKOipVpQMlbqo0gqn0cg9qwFxRauk1o//m
 zsIJCHqVZC9gIovoq8TGHbalVhrR1hI=
X-Proofpoint-ORIG-GUID: KVWEhGP1lv0jBlB2lDgHTbXtJPNZHnCR
X-Authority-Analysis: v=2.4 cv=CaKdd7rl c=1 sm=1 tr=0 ts=6aed78cd cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=vswd6c7O-hQB6D7BPuYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060027

Hawi and Maili are recently announced Qualcomm Snapdragon SoCs [1].
This series adds Camera Subsystem (CAMSS) support for the Qualcomm
Hawi and Maili SoC's.

[1] https://www.qualcomm.com/smartphones/products/8-series/snapdragon-8-elite-gen-6-mobile-platform

Hawi's camera hardware topology:
- 6x CSIPHY (CSI Physical Layer)
- 3x TPG (Test Pattern Generator)
- 3x CSID (CSI Decoder)
- 2x CSID Lite
- 3x VFE (Video Front End), 5 RDI per VFE
- 2x VFE Lite, 4 RDI per VFE Lite

Maili shares the same IP as Hawi. The only difference is Hawi has 6 CSIPHY
while Maili has 5.

Used following tools for the sanity check of these changes.
- make -j32 W=1
- checkpatch.pl
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml dt_binding_check
- make DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=media/qcom,hawi-camss.yaml dt_binding_check W=1
- make CHECK_DTBS=y W=1 dtbs

Dependencies
------------
[1] https://lore.kernel.org/all/20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com/ -- Kaanapali CAMSS driver and bindings

Patch grouping
------------
I2C CCI bindings part for maintainer Loic/Robert/Andi (1):
[1] dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible

PHY driver part for maintainer Vinod Koul (2):
[2] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Hawi and Maili compatibles
[4] phy: qcom-mipi-csi2: Add Hawi support

CAMSS driver and DTS part for maintainer Bryan O'Donoghue (5):
[3] dt-bindings: media: Add CAMSS device for Hawi and Maili
[5] media: qcom: camss: csid: Scale the clocks with the CSI-2 link rate
[6] media: qcom: camss: Add support for Hawi

---
Changes in v4:
- Rebase on next-20261104
- Collected Krzysztof, Loic RB's tags
- Added Loic patch to Scale the CSID clocks with the CSI-2 link rate
- Use 8775p TPG resources instead of x1e resources
- Align tpgX and csiphy_rx clock names with the 8775p platform - Vladimir
- Remove redundant CSIPHY resource definitions by introducing
  compatible-specific code and keeping .csiphy_num instead in the
  resource list to denotes the CSIPHY number - Vladimir
- Example Address should match your first reg addr in Hawi bindings - Loic
- Link to v3: https://lore.kernel.org/r/20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com

Changes in v3:
- Rebase on next-20261029
- Squash Hawi and Maili CAMSS binding as a whole - Krzysztof
- Add description for IFE and IFE_LITE IOMMU in CAMSS binding - bod
- Correct the lane count variable fallback path - Sashiko
- Add CAMSS top region to binding and DT - Loic
- Use split addr_update/reg_update in CSID and VFE 1190 - Loic/bod
- Add SOF and EOF enable bits with top level RDI status offset to
  allow their corresponding interrupts but not configured on - bod
- Move the common CPAS/GCC AHB and AXI clocks to the pm_clks array
  drop them from the VFE clock lists - Loic
- Use the GPIO function with bias disabled for CCI sleep states - Loic
- Collect RBs from Loic, Krzysztof and bod
- Link to v2: https://lore.kernel.org/r/20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com

Changes in v2:
- Not an RFC anymore
- Rebase on next-20261012 and drop the external CSI2 PHY series dependency. 
- Drop DTS patches; they will be posted separately with Maili DTS dependency.
- Collect Reviewed-by from Konrad, Abel, Bryan
- Split CSID and VFE 1190 into individual files rather than in separate
  combined Gen4 files - bod
- Remove reduandant is_lite condition in CAMSS CSID and VFE resources - bod
- Replace bias-pull-up and bias-pull-down with bias-disable for the
  SCL/SDA pins of CCI nodes in TLMM, as internal weak pull is inproper
  with existing board level pull up resistors - Loic
- Drop the unused reg_update_after_csid_config flag
- Add lane count fallback path for CSID RX configuration
- Add Hawi DPHY support by tuning register table, which prevents
  potential stream stalls and SMMU faults.
- Add a standalone Hawi CSI2 PHY compatible and make Maili fall back to it.
- Resolve conflicts introduced by Glymur in CSI2 PHY binding.
- Link to v1: https://lore.kernel.org/r/20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

---
Hangxiang Ma (4):
      dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible
      dt-bindings: media: Add CAMSS device for Hawi and Maili
      phy: qcom-mipi-csi2: Add Hawi support
      media: qcom: camss: Add support for Hawi

Loic Poulain (1):
      media: qcom: camss: csid: Scale the clocks with the CSI-2 link rate

Nihal Kumar Gupta (1):
      dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Hawi and Maili compatibles

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
 .../devicetree/bindings/media/qcom,hawi-camss.yaml | 317 ++++++++++++++++
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       |   5 +
 drivers/media/platform/qcom/camss/Makefile         |   2 +
 .../media/platform/qcom/camss/camss-csid-1190.c    | 417 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.c     | 208 ++++++++--
 drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
 drivers/media/platform/qcom/camss/camss-vfe-1190.c | 217 +++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss-vfe.h      |   1 +
 drivers/media/platform/qcom/camss/camss.c          | 228 +++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 136 +++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |   1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |   1 +
 15 files changed, 1500 insertions(+), 39 deletions(-)
---
base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
change-id: 20260923-hawi-maili-camss-b5dc43a00ed2
prerequisite-patch-id: 6108fea87bf95e2911f09bbe7e95fa536c3ce397
prerequisite-patch-id: b347ad60c475f3035b04ec76741e0f1b5f095580
prerequisite-patch-id: a38055fcd5b32fbf7f7f03301a48b4ad8601386b
prerequisite-patch-id: 5faef8cef855ce6fa00e2c7f10f125431ede40a4
prerequisite-patch-id: ddf0ddaef84c2d088d08f17de8d20f6b966ace37
prerequisite-patch-id: 5d7b6860d43c9215836a0d50fb27d2d003d0bfd8
prerequisite-patch-id: 610b107ca35300b00e8edae31dfb959a4501ff66
prerequisite-patch-id: 0bfebf965372eab19b73ad9629cec919795b557a
prerequisite-patch-id: d386de6329dabce0b0a459384d28bf290e170552
prerequisite-patch-id: 702e37b99095301ba1dfb2b48a92f33575178d32
prerequisite-patch-id: 443074884f91d7d027b0a603dc199fa746b7c745

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

