Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5823ACEE9
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788030498; cv=none; b=fCulD3MYD0lUfWIxy19gUJVrDVew6ML+aDhX6V0EDx9kqoScYOsFILVbFtVoR0leveSjPwDXnP9VMTNH65ASq+CbusrUcbfQxVdLofZX7BLXzlnlOWwUor402kKB+EdaEZ0PLswm4pQ08wYH6+6CDVxDQz7P3WKz8GG/7RuxNuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788030498; c=relaxed/simple;
	bh=W2p1gqkX4AQ8Th8f33I8eROJT74xXZVBij/fNQ25/NQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sV/h4RKcvhwD7sCNjjYt1hEu2LL0nrrKzsH0tBSXEtHW6HP4339FDrZ8w3aXn6NV5QhGDI3ZUPezjG7UNgYH1i5icRTSJa4xUpXpBNLiAUKoXgZ9JtM70eXJNovDb+Zscqe2SO9FYYnbiotrSimdiV/UZKm8kvpG+842zPUnKJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S4itGM4O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SHXUOoaF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S4itGM4O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SHXUOoaF"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TGx6AI1831314
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kjs0JpkjceaOXlcdB95wR46vNOivhHcjPSAD9oYP1aw=; b=S4itGM4Oy/04gOgP
	9lGTxN2ed98QDBA5y0Jc7Kme/fmTAlzReOESiyvpHVl8WNAXw8FleIH6yDgpJ1yg
	qkUI2O2n7vOrCNJ452SZKlpr9BbIvH89QjMoXWCZoTRKNA05GDP6lA+UqvYvDDUh
	n9ORvaRx8AoBp9uD1R/KuvHJ3iWpnpw6fhWRA22JYfLKFYo+sxvNdy0wFr6An9G0
	np3eiUClSEo1zH8G9Ww0dZhGNZ9DO4P8Uk6VpqTyGePJIvy3JDmJCAadSmB5yehr
	P/bTTplglHTaI0e+r+RaP5JAUlJx0vsDM1jYrdUDzOlLSSeoyzOSRda1HfxgoCOB
	CyAeAg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqt6hj7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:08:14 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-855a66e5c76so47784507b3.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 12:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788030494; x=1788635294; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kjs0JpkjceaOXlcdB95wR46vNOivhHcjPSAD9oYP1aw=;
        b=SHXUOoaFbcyCqiCclPf27Ll86fDN0ZS+AYGl8/qetKAeKseL1Ed/QtC6VGDvRJz8TU
         EA8j15IyAkfMsqm9PxNlKLOX6jjYVP5IniNOSWwRgPwkZjTv/IVpp/inRYrKOzH0BuC1
         uSds6eISZva6vEktXoSNN8S4/hxwIIh/EsEnJ4FEKaPoTvaHINXPKqKpz+sNZFs85uEt
         zxvGE1dB+o1B0P2AU+AZAEKU0ixaiYweM+RHuY7fzAgS/RdMPm7bCS9niEE/eC96Ffcq
         B6htZ6YSkr59Gr2NdZ2B2snjlhlwTdnCWPmyrHN3aQpwlSzi3NxuuW0uiR7sJOAGbgEO
         nQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788030494; x=1788635294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kjs0JpkjceaOXlcdB95wR46vNOivhHcjPSAD9oYP1aw=;
        b=KPXnFOWZStx1uAUfhS8GnAANePkgqLlu9hx/5cje7BwDDzSWM80k/jUri72sz/qENt
         vCFBNiZhcvu1vVIfPekRcEMcJdJqrQcnsN6WRLgQ10fKbteu6scTQNo45mk3tkNmc+VQ
         ORSjwLMY4mYQjrAbi2asjC01SZOAkAxod71/ZbBVYkhmLa63jALUyLAEXi2kKkbymmJ5
         R0kaVtZtHW6g23kYZKPUsHCvCWUBdmOQVdIR+ohFya6uIqaLRTLGUxQIsHp2eFfMI6Gp
         xBlNFxzsmrQxDjQD7xWBd62PPNwhKIitZBbhzDwEUX4gJRaJAUDxPadLe7oT3tdyMVau
         iJBw==
X-Forwarded-Encrypted: i=1; AKwUvBxU5V3/5Tr5bvwCircZWVGuV48TdDv9iNKIaWjxd5HOU+bRoxFkGYPNOjvISq5dxVKZDJx5YykWcDECkew=@vger.kernel.org
X-Gm-Message-State: AFuF++lpMLgWUiphyYCOcvkh9ZKx8RPaZFhS/O+gGKidxVHJ3u21xemx
	bUzGzKy2C2CvtnxXxyHaojb8N2UN6ZQGJi1MsMbp1Dke3iprYvaJiPTbqhm0rx/tSFazaf86kOF
	YqSSYrzIqriYceV5FYe/uUtq4fumfcYzeBljH/qmZKz2cAASktuKJXnayqXj1Ssh+5T8=
X-Gm-Gg: AYBFou0YPrq+t8qFEYa84ftGdmnOSBvTRV3KKyyWL4awRbXiRuGv2AEmffg8Nfn156y
	B+u72f6ssEYK6g5KQvr9X9ajJ1vR1yKSELrPs31CZeDnZy9x4ltHJ4n+rU243aZF4XdQ1/j9395
	gtCe/IEFxxnEUrkFhkNvles9/L8dOSo+Kf5WwJz80ulgXeIM2LoSzSxezexUUEa/U7B/lG5BMSh
	DaJbx90iwd1/5vh9NZSB/969gwcYnykI5IY4JliI9PFbS+D7bjmXV6y8I4S5SUycQP71FSr2jeP
	FHatgAeuxbiM6cWCAGUbr3j6TWrEaGWJnRXZtbPgyLEGPasllOwSHfwJvQiK84iRnBR0BFfqCGu
	BLXO9g9Odc+L8RuRvp+gv++5PcH1O6BhhiAC4hxRj8R4mV2In
X-Received: by 2002:a05:690e:b84:b0:66e:5dcc:1050 with SMTP id 956f58d0204a3-66e5dcc10a0mr1394772d50.48.1788030493941;
        Sat, 29 Aug 2026 12:08:13 -0700 (PDT)
X-Received: by 2002:a05:690e:b84:b0:66e:5dcc:1050 with SMTP id 956f58d0204a3-66e5dcc10a0mr1394750d50.48.1788030493516;
        Sat, 29 Aug 2026 12:08:13 -0700 (PDT)
Received: from agents-mac-mini.lan ([2600:1700:b450:a0df:44f5:f599:5679:b5a])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66e4ecf1f6fsm3013945d50.13.2026.08.29.12.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:08:13 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Date: Sat, 29 Aug 2026 12:08:08 -0700
Subject: [PATCH v5 1/3] dt-bindings: arm: qcom: Add HP EliteBook X G2q 14
 AI
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-glymur-send-v5-1-a11bdf6a4b66@oss.qualcomm.com>
References: <20260829-glymur-send-v5-0-a11bdf6a4b66@oss.qualcomm.com>
In-Reply-To: <20260829-glymur-send-v5-0-a11bdf6a4b66@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: 02cJ3bN-CmB50nNCRMpw5bC_M0va4cVQ
X-Proofpoint-GUID: 02cJ3bN-CmB50nNCRMpw5bC_M0va4cVQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE2NSBTYWx0ZWRfX1OcdlG/sUhMW
 YbfBqIAMBfcY/G11GcZDWhhvC2J1RFbOeiCzBEqgej6XqPOAwRm97lH7i9eci18eDJOXM7PytIi
 k1RusOi8f5DxQ7RaT9xsw8OHW35l3nnNz9VMsYPgdf7qN7y+RErUXoHgnTsowpZ3Qjcpw66FHnc
 gqilUFuDtWXysCYPyMJmzF4cJlglL3BsiGHnf8ABSqkCKG+5vNEfEn0zUtUqEY0yiylcjI1d64t
 KQuodtv74x4YpVwqPQjEqdpi1rnC0J7uqBJDpGs+3rpXkjzGWrqeFCbwxIdZZWlYA+MFPhJ+81t
 sQnemvFnJsAeB9BPAGeXJvUAx9zWeXrOB7rDpNHKGIKVqVZ7uRVeStoVLtSy6F2gYZaLx7BCavh
 VYpCB5Afks+60SYT70X6ThVGk6d9sBEiAx6FEEmwAxoJguGXqkyoKysMDst2MRrkUljLbgkD/Vm
 jpYz6pAx8BfVQ5Bvrkg==
X-Authority-Analysis: v=2.4 cv=S8/pBosP c=1 sm=1 tr=0 ts=6a932e1e cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=FzA6eXefDna1RhwR9dEA:9 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE2NSBTYWx0ZWRfX6fCp5J2PIxfQ
 mh7SaAGRyWl7DNl3sOB560SMlLlyPg2WSd9Y15aiRbZXQPWHuFhiv6os6gkWde5WEqLgHNkH26R
 ppFaQ6lcqAgcgOv/f+YDlYpUiu2uSmc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290165

The HP EliteBook X G2q 14 AI is a Snapdragon X2 Elite (Glymur) laptop.
Document its top-level "hp,elitebook-x-g2q" compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..d141872c2b28 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -87,6 +87,7 @@ properties:
       - items:
           - enum:
               - asus,zenbook-a16-ux3607oa
+              - hp,elitebook-x-g2q
               - qcom,glymur-crd
           - const: qcom,glymur
 

-- 
2.50.1

