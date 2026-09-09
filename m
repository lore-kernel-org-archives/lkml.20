Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DE8382385
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788936067; cv=none; b=MVghA5S7KEAGIAWDoU2Dve0ryj5la9EKocTjEYmh5TKC5ezb9i6vuWdpEV16s5Sp/Z6WAEVphx5wBF32efe3Sbu9aCvLR0WHpzOcZyIqZYfI3E/3pH4QshiJKlo5CKbYW6Co17K0x8NBHOjtnnFy1E+/2B03cxuo/Nw2bv+moGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788936067; c=relaxed/simple;
	bh=NlzhrkF7JSpIHBiXXSqMcyHhSGAiA8qh5mZEtT/g0Ro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zx74wouN92QOEHdzjYm6kblrXgJGAwqcJkuiaccb5pRDoGqqdAs16T+CXtpyw5F6w8H0gz4PIVzDz8f3NjXYL01CzHMfMwiDCVEFMQy1GXMv+wJXpxNJyuW0yB+C8HDH2JWUNkYwaIJ5alqAv9dggpNqM8R3a6aN652A9To3I40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E5s1MDBE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FoNV5EDP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E5s1MDBE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FoNV5EDP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896X7YL3817257
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 06:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zs6SgYOQTGF0cWtvmW7156pRkDFZkuJqOnalOR1+T94=; b=E5s1MDBEH1ON1ZsY
	nKqm1kTpj0vfKXp2qChPevX9/eJZE8PgdFhIgIHDa5Lwj5+V8S3iUQZOJr2jD+9n
	r0vXRa65bFOUB0cGnVZpgeeVK0bVH3cyDeP/WDVZ3laD5PWuFe1toukt5couE1OO
	z3TJcTzN3IVWiNKLP3nbwbMmqhJiAa7APIcSMQeAW7m1pfrR519c4ePaGuREpfVX
	rtsRQQCZody74mrd/3zN0Sj0jPvw7WtmVmuOKBleeiacZknP2zXQAj6VBhAUFo4Y
	zeamkdSUMeQRo+yIsl1LKlA12W7iNmqPympicQ967eDkk4Uew7t13fNejuwuTrWK
	zo9O9w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjstu9tun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:41:04 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc44d708055so9294398a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 23:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788936064; x=1789540864; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zs6SgYOQTGF0cWtvmW7156pRkDFZkuJqOnalOR1+T94=;
        b=FoNV5EDPIBQcp6Vigki4z2l2tQLwfR8/WOQ+DHIKgertk7gtkM5zuEabtwIClkOMiI
         HufvYs7+LLCqGZbGIE9KyvoKZ9VNOWyf1t+l3LGDdzs0g3edobb3kH26Smm31BWgg+w7
         MFkkc4H+5pPWNtPV+y5Bn/ViUhwuL8pAs4RsVq/bhdrcmh8Xb+7OUs5gYkJQqrP198jE
         1tdGLAAxGNekIYeLUFwkyS5nrqkul6GPXigx5OnpoVG5R1Q+RkAwrSGE0OyxPxB9XWey
         6zaEQBbs83Tg8J4LBmXkvk/nRUROiiNWNu+Q3f9plltfTdTrp4iLLsIEXbf5ZBxzz9FV
         JKIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788936064; x=1789540864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zs6SgYOQTGF0cWtvmW7156pRkDFZkuJqOnalOR1+T94=;
        b=hsYrCt4iJP4BvQNRWm41aa11w7+nq9TyAcRU8VxM+wsGHcPaWdvsj9iIsBACVHw3Kb
         M88VJYh3LtJdg4CAkdMTxBaH1YVRsu3qWNm9glgAO7XrVwWDc8inpVSwNioa2RVxIj4/
         nUcX7EYslzyzQNbeI0KUEg/L9tAtPD6WumZ9WOhnpYNlkhN/4w/tp53ety5VQmQ2UW2P
         c+avBQ0H00FcasLXk4EoIapl/iLVhUzeenZU+5IzpDtDN8n9k3qDTSDriecZm+PI/oFm
         lWQxiH6UpZo3FiZj5ULAM12ry1WXYBLJAhGftZ1yC0c1PB1ue1JyKnotvInkSWlGHiyP
         AebQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOvt9+6xUkSE5Xl8xsxRx888Z/b1mGy6rw8YEODmngr2AuVaS9L/l+ihtKplnpWnD3a2tR/oadhgpRJl4=@vger.kernel.org
X-Gm-Message-State: AFuF++kskSfbtkotdxe/50aCANg+rhIFFUbLMWLHjkBFP1NOf7FVXIPd
	oPQgrXs+DxMVMEpQAlY6VU5Qa9HEjFcB8EXY6ohWKAzm/l44TtakFa5+uVpBjS+Ouykp2MrMtnK
	UdjeZo3rUvyhK/zLYO6mdy0PHNUa00/RELBY9wErA5tsb2xd754SfYbIxMJgapfAsOmg=
X-Gm-Gg: AYBFou3I8ZtOcwf/e6q31q3dMp4kSMcppepBz/KmM4GSHG5RDWv9LphtmOFnr39gCAd
	Srs+EU4qpK684fxkzmHRLDJlL9msMijMRMJiN989hcnD1wLWJZ3U8DL50jNjQ4sZocm98plKBXy
	vPv07dCHXGN7tdmed5R4gcxcGyoDSZlZV34YK2w+gZOceUFhHEYVNk3CaqazSaxmvPc9Mu1Bsny
	92NxO3rcUebXiDj8IOrtGNnpgw6AkPwdGSSGydFRTVm2tkGS65yrB17iZY4oy1xgVviSOeDho3a
	DB632oi6JFwuyorQpwflN8bQe2kSR6URtzYYicc+2bauGlR7y3579qKfReAnNymKYkUL54MQOLC
	fFgumVn3Dh8YC5n6o7ZAv37fPcl08QXxtr61x0PmCmPrOp1/JER5+1Ovbtm+lGExV
X-Received: by 2002:a05:6a21:3204:b0:3c3:bbe6:95c7 with SMTP id adf61e73a8af0-3da3a0a910amr55767916637.17.1788936064237;
        Tue, 08 Sep 2026 23:41:04 -0700 (PDT)
X-Received: by 2002:a05:6a21:3204:b0:3c3:bbe6:95c7 with SMTP id adf61e73a8af0-3da3a0a910amr55767877637.17.1788936063865;
        Tue, 08 Sep 2026 23:41:03 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33450e140d3sm35553014eec.4.2026.09.08.23.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 23:41:03 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 23:40:53 -0700
Subject: [PATCH v3 2/4] dt-bindings: embedded-controller: Add Glymur QCB EC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-glymur-qcb-v3-2-c194c0219218@oss.qualcomm.com>
References: <20260908-glymur-qcb-v3-0-c194c0219218@oss.qualcomm.com>
In-Reply-To: <20260908-glymur-qcb-v3-0-c194c0219218@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788936058; l=1007;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=NlzhrkF7JSpIHBiXXSqMcyHhSGAiA8qh5mZEtT/g0Ro=;
 b=b49zJ4gwbfO+Zq9+Rnmm0Q+SstdvTLXhCOM6C3OI06W6x6Qy/gIhxyrzNFTw0pV4ffI+xhsCV
 x72kEen6hPCB+Q5UAxpibYa3F3ACnsuQYRkQ5MlJD3C+w0S22pJlG9+
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=ItAutr/g c=1 sm=1 tr=0 ts=6aa0ff80 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=34zfTHg3cMDFYMdkEaIA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA3MyBTYWx0ZWRfX8fuMBKKhybPd
 eaV16ilCkeLajjisXnt64mvJyqHRCkIvB5rwRVa6FrTxLTGBWbRcgeS+D3iPZvBDDnp0wBwu/S9
 WrfTtFcaAXvaQeRp/eervnPXqA5nqxk=
X-Proofpoint-ORIG-GUID: tI1vDWqPaRwAdEi-quummEXgPTgttb50
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA3MyBTYWx0ZWRfXyjtt2qB0Nf23
 7q2qI+2nDXrnA0QG24bEgVQMSpTGffZCAT+MZXhS47cCJSfU9MrtkwQXl7rluKAzNqY1sP6bif5
 S3Fwp0Dwlit4Y/Mxjxl3gPDvwP1dEHwfyNylEddyM522MVUkkpMHyhXpHPaqkm+lD7YsQ5e9K+6
 f5P3d73KFSw7qZLNsjIZgetUxvTKejJtw3VGpPnRXjFhV8dUswzpixC623kPXyJ+84YjMf3xYB5
 zajgKpuFbPv+qnMK1CVQbXhC6GM84BtsgwxQvuj4KBjJqNgE1I3/70S9Kw0Fl3AXX4zQgsFDPTn
 myYLx6nDX+gO+BI5kjMwSFSn9Ppg3yvyr+dx8ECxDT8LjQ4SrBixwnIiVALhtMKJ+IqfpSz2zt/
 W3RCQMhEihstdBjNpdT5TepmKhJgOsyZdbwhqUr24Cesb13m09oK7kGwsh3PszBmUKw+YnF8d6G
 SUuS7S4gsOZgzd5fTFw==
X-Proofpoint-GUID: tI1vDWqPaRwAdEi-quummEXgPTgttb50
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090073

Add the qcom,glymur-qcb-ec compatible for the embedded controller on the
Glymur QCB. It is the same EC used on the CRD.

Reviewed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 .../devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
index ac5a08f8f76d..de416057063c 100644
--- a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
@@ -21,6 +21,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-crd-ec
+              - qcom,glymur-qcb-ec
               - qcom,hamoa-iot-evk-ec
           - const: qcom,hamoa-crd-ec
       - enum:

-- 
2.34.1

