Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485915;
	b=zoH2VFzVXiGF5C/MWuBK86HimwLevw3igWeArXB5KSmkgIK8GzvMD6P8xyD4YSVRU2P8
	 BkYsyTOfYXe66yzNZWlNy0/b75Fj++49ho3yEE/0yAOnyQVAyBs7VNZYorvPL5eK/qGTk
	 Z3IRAVV1oYpuUt4+7ATe13dX2QQboENjin176PTni0MxiVzdkmC7iFeS9gIkigN62BM8y
	 CaKCcx13hsa6CBL2z6BZgVjYHzJ95e+RN/i2g8eZlGgR7MA9uKDo7J10CVSYTnsxMOVM5
	 e3kUCQR380puCJQptxD6hm28VRROF+RGHumuqcHUO//wYvYBpGDqrSTrSC1Lw2Mp6Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485915;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PlYq1CzDOE0KMf+K4N+LoX2sgcqee9IGaZ548tHJ5dA=;
	b=VGOC5jIxG90DVoDV9e8/32zdUlZI3mNdczeUSkUJ9B/18UqyOvdHmwGDQ5VvE8vnOlA/
	 juu1SZ0emSjn6Ow5wbB9xG1gTCQJ1w6nKim+lUaG5NjfLHhR+BDXpc7YLmv0A91M5taEu
	 GYGWXGSjjN4g7CapgxNio/QTGURi9HQvoeAcKs4uMBCDL4ozGldC6JgaHnZmZco8VkIBF
	 mexM3kwT3UjQz1QJE790qgOUlth6LZ10P30KQ46y4uGA2yhlG7oe/BIv50KXVCgX16e7d
	 F0bE1WEmovjXVV51MZaFNqzTlms8f7N/XV87/qIHEe/sXuiqWY//6dyVqKOzO04zfvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bThWk2+T;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NtTjRSi5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE0A606A322
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:45:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FE0A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bThWk2+T;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NtTjRSi5
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8TRrI2877674
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:45:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PlYq1CzDOE0KMf+K4N+LoX
	2sgcqee9IGaZ548tHJ5dA=; b=bThWk2+TodQoiwVUCPnH8B6+xg3QY53/1EQsut
	C0VRrxX1NYPI39T/w5cGjrI3fNVd7HpDpQMBrqM0ErPvX59pkxnN71Ng7Lxh0a/p
	laf5GgQGRChS7NVnvO1qG817Q/btXcH4rui6vD3AClwIXHO9+h1W4W4EzlVXLFD5
	qH1ttAkLhZncQ69Dg1RR4YA+JpR1gwmu5ztWFxrVQVlg3ag6mQ57syatviiIKNYm
	9nSwaolNOM3+eZgSVbEg6lOt1UvFugpAaIbanwCAM1ktxU/eFn3f9ec/4EiSNeTY
	M1yDSLzTGLMJ9y8nh1WsEU4Zd6FY1Cu3u+5EzTeyHRlZ06Rw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pspre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:45:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so613568085a.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792485913; x=1793090713; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PlYq1CzDOE0KMf+K4N+LoX2sgcqee9IGaZ548tHJ5dA=;
        b=NtTjRSi5STgYoanUgXWfO/slT+09LGSWQyBJKk6zAZHbntESL0Q8mTHEi3tN6T89Vn
         yJoVwPX/or6FRr5LXwyWiRk3Lris6usXeQXIU4oMOZ3iD8Nx0+bA00j04wN7GGtDeEoN
         gOiGnJz8YKW4jB7VuYYVTXd5O6sWrsjlax4uLS5/HvvyO7L3yIJz/6s7iYzwmoJs3JLU
         C0eKbkB9CrLlg5JQo8inaRfv8JOFCgMfdJIAoum5BZZwN1TQKBD9Hcf5UE1HFd1Ufcaq
         LDjJxSBRq9RG/h6KNtqNSFeT1UXJS2q4eke4SRPcbCZydH+0WOBZEop0CHhrRv8HH6oi
         UetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792485913; x=1793090713;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PlYq1CzDOE0KMf+K4N+LoX2sgcqee9IGaZ548tHJ5dA=;
        b=uwDKs4TUyoxBu3o6HZSDnp3z4VUbs2hOL+nJvPMrmZJW3YYcH7BzhTnKNouSkUYN2X
         2y2LNvAcY0uWFiyQ6sX93+ZRYPQIeWSJ/+N3S97QMbKjcSrEy1q3Na2bfB/X38izYciK
         OnqzrFxrBHDiEa19QMDZVV+fxPBRxZqk1HHUnfnjxvWxyftaYl6cwlD7tysmAX0syMqF
         iv/wDKQRGG5+/aN1FfALPrpc8R2cJqIlHhm7GsKlYTt9lhO3dtD88LM3FCDDBAXbUNtq
         gOKltK8TP2pKmIMSBC+b7R51SnqGZoflvxPJAZnXkBxG8w/XEzqruQiV/y3meY9acU9l
         SfhA==
X-Forwarded-Encrypted: i=1; AKwUvBzhTrYMGy6K07YLRXoZsL/zmybJWPpqzF3bctYdlV4+kPedi6YFzSJX7mvq6eZcBlqowTqg9rNp1y7BC6g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMuyWWrUKz2v0IEHMl/SqQ9iEZE77JUJO1YNusvrjmdFWfCM57
	gSfUXW6+oeLcbC8mYdxsfOQAEk/3+xyxzU/2TEHEMbcQGfCsJi44AAqxbGvglHX7PFpkiN29HFu
	iiGorbnPd+OeabgyPB+lAu0uJMQwlDV6YS4LCvM1R6R4HatygUGZjNCFruXo6iJEzvJA=
X-Gm-Gg: AYBFou3vT7ypa3XApMMOyQo6jQIkJfkPH6duq5yNS8bWh1wqgG24P4WT0tkbVt5iFD1
	Q8H0zYDovUmYnE4+h1Jmk+LfAZ0uyIspetX/rdcLMU+qnSjvrqYtgJGAlMCjuzcnX6N7O3R4b7W
	1hqXRy9lOr4Asu6gepTr0qRoQsVYLszWKlkamG/esprY+i2mZQi1D11DXnT/llhDZ80xRT52NGg
	wLfiewit/ylED+4mts7mvFvt02Pg8ttCwkOJd54fvJ76t5Bp4Gz846NOGk6zM9b7koEsYl3wE6M
	SyRj5t1Q19wjGHqfVJNf3QBqwsqy7fO5kq1V05gSX7cT9QHIvz2wFJ9Go9dWeEwhUjtHskpa6bz
	8rjg3c1y0NnO3dogJMOGpKgrpvo2bpoWuH51pp11Ry771f8vM/9RwXy3zum+el+uICRuW5mTwQH
	VPDPhNvuYgja2u
X-Received: by 2002:a05:620a:44c2:b0:930:f337:ebeb with SMTP id af79cd13be357-93f29b9b238mr1527290685a.12.1792485913283;
        Tue, 20 Oct 2026 01:45:13 -0700 (PDT)
X-Received: by 2002:a05:620a:44c2:b0:930:f337:ebeb with SMTP id af79cd13be357-93f29b9b238mr1527288285a.12.1792485912725;
        Tue, 20 Oct 2026 01:45:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab20a8b3a4sm27637231fa.1.2026.10.20.01.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 01:45:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 0/2] arm64: dts: qcom: sda660-inforce-ifc6560: fix the
 ADV7535 interrupt
Date: Tue, 20 Oct 2026 11:44:51 +0300
Message-Id: <20261020-ifc6560-adv-v3-0-5da1a33fdcbd@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAMq12oC/23NywqDMBAF0F+RrBuZjA+0q/5H6SKPsaZU0xoNL
 eK/N1ooFNwMXLhz7sw8DZY8OyYzGyhYb10fQ3ZImG5lfyVuTcwMAUuoEbhtdFmUwKUJXFVkBOY
 IUCkWPx4DNfa1aefLN/tJ3UiPK7E2WutHN7y3uSDW3r4cBBe8qpXIs8IAaDw579PnJO/adV0aD
 1sHAv4IAaL+JzAS0lCJhWmyhrIdYlmWD0/rCUgCAQAA
X-Change-ID: 20260920-ifc6560-adv-b8ed1242008b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1722;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cY60tlBQZWvtVE5GJ4MKTfEnnv4ZK0eZulZjkYr2cvM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1yoOJaeEi8X7+lmIrQzia+SrVRzvUy/hJqv6I
 Ibp0qv6jZ2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatcqDgAKCRCLPIo+Aiko
 1WhnB/4sNNdPOuYb13jgV2YFB6TDZdYwa9455zctip8DQkuUbRDQQk9QxAJZITGQTALpPiEowBF
 T+61XV2C0qWTXnocllTpwsHlzsVWO8giy9A+MUQeEQUawWEYur4vlMFzgs1bnWS6e+HLGBElhGU
 9nKW7E9NFH7IqbzumFqatCpHXtC2tA+su1ib7yx5C+RPzJ/pVxTrofpG2B3QctiJtnv3HRl7HOL
 UEhpKvbbg77K1dw8l14pmrPgWptLjXT3Rhlrnf7Gn9Fg3t/wPhid1vDow5FY0a6uKymQCdHCKbQ
 BNI2+8+wq4JgM2iBAYisx7gQ2Ckh1DiIHQDcvbfv7wMt/E9k
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=DrrDa2/+ c=1 sm=1 tr=0 ts=6ad72a1a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=tVI0ZWmoAAAA:8 a=_9f8UQ2UEQgcCYNCZg4A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfX88Oov5f4lKRN
 1fTW2yqKGo8SO5L8IeOdF/4L5qkPKMWbdvP+ZTrquRlDORYF6etnBZXT1i2k6ELcMQM8MNLbnbG
 UnY3nuabW3IHOkjWAmXBzGI5w4iR7XFlELmvtOv42nrAuQnHl5nzcRVeCNpM9oqZhBbEq9qpr5P
 9jPWj+WfTwiMN8oEjG6Ar3MPDmyJYp3IA/6kQaJ5R9CXXcxFhD6FmUZidrE0yyeMs70BxaWNG2Y
 V6yXXF/XhgWxlKmyTxvsLVNO3U4SJZE0W9/himQtt13zP1HaxrH1z976nrT/Gs8SkbAjIib5rlk
 7uroi5mkr2Mgrttpty5LhhaMmKiG4np4kMcBmnH1nK5juzVrMpoiH2K4txiapSrNY1MLq6UzHnl
 PX5xQKDxjhRhgys7/7WFC31/04BnAURxvabkp15dHgXhMPGjYAoWT5+vtRbmYVa2wuApwLtze23
 8cLKZekAA/z/wUukcFA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfX8PqmHfTsPoxf
 UxxiLzgkLdV7FTs3oeKlVsmL0iGU1moMGuhi8flxhVDSeVgp99UwL3+q6tV2zLEDX+n72EWo0ri
 R83ypwLX0gZ9r5UiYTenlr9Dn9d5P2A=
X-Proofpoint-GUID: DD2kW3W-bKhklR5BlSClDgIFBbyxCNuL
X-Proofpoint-ORIG-GUID: DD2kW3W-bKhklR5BlSClDgIFBbyxCNuL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200034

The ADV7535 HDMI bridge on the IFC6560 fails to probe because its
interrupt points at the wrong PMIC: the ADV7535 is wired to PM660
GPIO11, while the DT uses PM660L GPIO11, a power control output driven
by the bootloader. Point the interrupt at the PM660 and configure the
pad as an input instead of relying on its bootloader state.

---
Changes in v3:
- Moved the interrupt to PM660 PMIC.
- Moved the pinctrl state to the PM660 and added the output-disable
  property, dropping the review.
- Link to v2: https://patch.msgid.link/20261019-ifc6560-adv-v2-1-ade625df3fe3@oss.qualcomm.com

Changes in v2:
- Dropped extra empty line (Konrad)
- Added a note about pull-up for the IRQ line present on the PCB.
- Link to v1: https://patch.msgid.link/20260920-ifc6560-adv-v1-1-89b1435d00c2@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Dmitry Baryshkov (2):
      arm64: dts: qcom: sda660-inforce-ifc6560: fix ADV7535 interrupt parent
      arm64: dts: qcom: sda660-inforce-ifc6560: fix ADV7535 interrupt pin

 arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20260920-ifc6560-adv-b8ed1242008b

Best regards,
--  
With best wishes
Dmitry

