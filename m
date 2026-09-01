Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AE11F3B85
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788243187; cv=none; b=FJDjQsknsXkz+me/iFkf1JecBgBwVw4WKrLoz4Rn84izyW5E6u47w9zq4/3DdqThTr4XqCoJqPNPvZLAh6Ow7GRg7epnK2FcqsM98zMdbRWWyeQ3nTcRxJy4i+CCGvTXWIL0EjcPfWOvz5Ix+EfwgYPpWLqhjE3eZUVReMDIj30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788243187; c=relaxed/simple;
	bh=tmBDYtXEn7QF+P/Gffrerjt1xFVzGjsaADtgY4akAV8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kRGTfNbsaaAg8kXlwhSmkkm7ylDQb6ALp6z36ea8RPW0VBgRsCpasooe/Vp4Bdn0PR6PYTurY8UTsfYnSkTFIe01da4Qfko5gJbxW0lHNJpDJVEiTGCC27FuY5mnpA9ASCo45cQb6e85F3b0w6YwBzJ6vJq3+sci3jEmhMQoktU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PLBz4bve; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XSv7LmUN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PLBz4bve";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XSv7LmUN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6810oGdM1724651
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 06:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=64Fc6Cp8W9q95DTXHpfoWRnw1VvjCOGDPFU
	7ee1+j78=; b=PLBz4bve4E/wLQ/FJSCQ/yjd1/O5FqZheAHLmLdrATn3MekZH+o
	dAiQRvEB8KT/ZhuahE4O3GWNOHqePSaXZfaIpwuwcH1uJutOZdQYx/QuQ/4mW6Yp
	ahYvl7/Nwi71kkZrlmuRDlftfCkAjzszZajNcHM7u/Omv76hc3oOETAlcYSFivRr
	T51qkz+TlbjqUHcD9y0xeXg1kNK4zzaS6GNQ3Qh8tWVUTa65jQs4kikdherwoaiV
	yZL3Ovz3+yg3n+6YKFq/FwCk/gPcw/Y+yI03zS+TDWGr/NVw6Vuyn0b7m1A8lrl8
	0t8gj2zn3Yx8noHBwmZWVAjJw7+Ylx2nrBQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdeg3ar66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:13:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9394ad7f64aso144409885a.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788243184; x=1788847984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=64Fc6Cp8W9q95DTXHpfoWRnw1VvjCOGDPFU7ee1+j78=;
        b=XSv7LmUN6NoRBFPo6m3i2l/ASXZSYeSu2tjXGLxMmvokraEH59QlqPhq+jxWoWaZSL
         /d0eJHWRLvwlw4Ic+xvBj08+k9/A+U+NaRv2snZTT+qtcGztECfEm7kJ5hhR3+G4PM4R
         TgGRAMWoeN6AMJZtnP0Wd3Y2u21cYLAEaw5i9JkHjDdbS9g9rs3IwMD/u/Y/BEpjzDRw
         WSiVAaRNsKyrvK/qAedSrPw6+yvn+eXrP9gSlYPwYCU9pTj1Jpst4WaiKK4Q39TIUNrn
         OceGijybxZm9nUJ2/CwYbhr9E7wk3OT/hUW1EmT4ZzxfvzBuHxkfR2fznCRY6nH6IAxu
         t0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788243184; x=1788847984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=64Fc6Cp8W9q95DTXHpfoWRnw1VvjCOGDPFU7ee1+j78=;
        b=Nkd449T4jAb1YdBVMTb/ckl3XptxuboY++Z6ng4W4qDWT8Qqla0FiwLR9wSNgSzxOU
         A/nscaBg7ZtDV/6puk84IFjvkg0hjjTBlnDEUFRKMeHQGQvmqiW+X2ge0TRba+YsQVrh
         l8yXDv0p/jEOJTkk8v+8D7jbXLJkjHBG5gsIkEW8GAm4zkChOnvAuKjGbtRmGpKJRbZB
         zteezBPvzte3BcNq1+SnN6iBQtMQ+/KgDhQ7spxHZjcM4toY9zF5xJYmHnr8EnLud2NI
         b6a55VRJ5huq3uww0uMPHtqm8PWE9m1YgPwu2RJFlSpkOhv4B5kUpdpP7R1fGDz/B+mY
         E/ew==
X-Forwarded-Encrypted: i=1; AHgh+Rq+Ba0KmBqk8D0X/XHuxk8jT4i5+D23JCvVIE0JRFclLDA7aBz4klI0zkfL9xpo0zlT9fyGkmS4pPz+I38=@vger.kernel.org
X-Gm-Message-State: AFuF++m8moge+WDThQfCyvH+Twy4ThZsYwCHH5d876dlrb4a7s7pboAd
	gmzoqKrqIHuh9cW73qi4guibqb+BzX7bTl1akA56IQJBxW+JVin9OW5Z/FuyCGi0KKHTY1174nY
	YVk+9FZO1ai4ar4a2q0NSLLrmql/SGTV2Xb+uNf/zjxAyGeQmFLsKL8ew+Zn2O25JF0Q=
X-Gm-Gg: AR+sD11U4KZMEqaiIWTUDKeZaATcGa0t2OCPFwVnbmYBywYf7F91t3ZJVWiXxhiRXak
	O31WixvOgGCpoag+LVQ95hwPQ1uPm6vFOc38g5P31sTdUbhLC48vBPvTfIEFAKmZtpDhdXdmER/
	WACYbwa8Tc1vGxneSypAxdXDMswugV56fTKRC5T8xnUL28Y8QkHiMn7JXEu7HfaG7Ha1dgimzk2
	Yy+ShYiaPDZ0SYo95v3O+g04yydGOCzavZiz9mfOcImQNRpyYDE1Y/6fODH/567Jkrk5Hin2Vo/
	YLPL1ht+PwicQMdJw6JwRSqlfDJANo67gggdww6gSdXZuuZsPiajUNqrsdxXeKzNChZvlRbuUmg
	+z4idGv4rvxdE0uc=
X-Received: by 2002:a05:620a:bd6:b0:939:3626:558b with SMTP id af79cd13be357-93947f80627mr875347585a.5.1788243184201;
        Mon, 31 Aug 2026 23:13:04 -0700 (PDT)
X-Received: by 2002:a05:620a:bd6:b0:939:3626:558b with SMTP id af79cd13be357-93947f80627mr875342085a.5.1788243183663;
        Mon, 31 Aug 2026 23:13:03 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d6eafesm2397518f8f.24.2026.08.31.23.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 23:13:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Madalin Bucur <madalin.bucur@nxp.com>,
        Sean Anderson <sean.anderson@linux.dev>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH net-next] dt-bindings: net: fsl,fman-dtsec: Drop redundant pcs-handle-names dependency
Date: Tue,  1 Sep 2026 08:12:56 +0200
Message-ID: <20260901061255.25734-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=853; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=tmBDYtXEn7QF+P/Gffrerjt1xFVzGjsaADtgY4akAV8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqlmznaSgRk4CJ3ULRxmcX4rpugQNhVnRWTGSNa
 E8A3T3lLLuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapZs5wAKCRDBN2bmhouD
 16GeD/96j4VBBsiOCxTl0vY/rbA8roLRwGZ3c3rpd19Ayf3xympShEh+TzwmkP2v7y6MVbhwXjC
 NruCPEIKt9sgo7pAbzEisogKgDe4AjgGt71y7CWmC5nUu0TknI37yYJ+aErbJFGqySI/xbwiRzX
 qRvSIRDqTGqcuiu0JqL6+36SCxwag183wGVEZu0Tb6HI5D/+npcQw8poWp1Zg92Xe8jMUQnTAR1
 z/BgaW6l7EM4/LgfkK1nejeDUvTfQZxwaAlwfYL8IDAhwZn34Jzq0OzLXX31piyJEku62dkx4qH
 Wn7/gUQSbcjZMk7RJF4Vq2tf8U6HNajurrddJ2drO5EGjtjiTYKS16CzINWK7ZPCrgzyQfq16I8
 gxHhkNgi6FipFRqcf5t7HHhohmanrHGPGs1HFqnesrcADbPPUJr76Rp5KpawPBIi2z0D6NxpouJ
 K2TaeA45YOs4a8rhtxn6BazAi77oTSJX27pWEkiT7PIkWByALos77eUJFTUN7TnnPah8OeupuMK
 wQIEkfKL65t2F2IK/ETONLL8lAkK73QRWWlr42CxwbXokanzE0a4slD+4G+HiKcAvM3FvL8OVj4
 EPYmAThrrKKv8uR/Z747XnjPTvFsv8Fpqu033laDwRl0EchA8obE7kUgXLWfxYMx31Eg/nUb/V3 m0OvCQKjvWRg21w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA1MyBTYWx0ZWRfX2q6ehs4pV1UK
 xIwQxneJWM74la38wwXQjSVdbWQnD4Mo7e+l3+LdkQAwE+HpE2zBu1eyZymNpTzbyatlv+HAU7W
 yIJbGlDhl7QSjJ9jeL/sAf7BfWtfuT21lZVHzJuYIO0iVioibswELlocvfkDl2ZaJwI3usIEH6Z
 zOnFTBeVI7qQPQMTL6fBwkiohnhXGBIAbnZ51Lht/oU01MJTpqpN8IMwAoD9YMEYndZzimwSWG4
 CUWBSI4ZwmHvnwFzDui3ZuHS9IUY2TV42XIhyF6VoppwBuvmmHICpDYk/6y74+daFBdD+8/Bxzb
 c8THPLBsnVvBbqk0XC79n2udo7YY3uOkG3HePIdATQgqI+90SGSh43blnqF4GGuEoCaFfAKqHPP
 vufvG6W3nex628XjeXIWX8nvnBY0tMSm1lQxpoKPSTDiVeJr3COPueils3Tf7hXlljCp46IJZ+a
 rDpgSIw18tGsRpojQNA==
X-Proofpoint-GUID: bqDb6gasfbX_Fuje2Fm7Z5HKdo094Ud2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA1MyBTYWx0ZWRfXyw3NpZ2Gcq5A
 Gi6qryDW6IprMG4oINXNujTGst8HLojouRNHJgFC3HVabDHh5aUakBjRkMwWEIJ2ifuQ2k4lKOU
 FT+E2oVD30y1WiQYHwk6lKqdRQyMSZU=
X-Authority-Analysis: v=2.4 cv=NZnWEWD4 c=1 sm=1 tr=0 ts=6a966cf1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=kdWYA6eUZccx_msbsMkA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: bqDb6gasfbX_Fuje2Fm7Z5HKdo094Ud2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010053

The binding references ethernet-controller.yaml schema, which already
defines a dependency of pcs-handle-names on pcs-handle, thus duplicating
it here is redundant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/net/fsl,fman-dtsec.yaml | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/fsl,fman-dtsec.yaml b/Documentation/devicetree/bindings/net/fsl,fman-dtsec.yaml
index ef1e30a48c91..5dcb49f2f3b1 100644
--- a/Documentation/devicetree/bindings/net/fsl,fman-dtsec.yaml
+++ b/Documentation/devicetree/bindings/net/fsl,fman-dtsec.yaml
@@ -125,10 +125,6 @@ required:
   - reg
   - fsl,fman-ports
 
-dependencies:
-  pcs-handle-names:
-    - pcs-handle
-
 allOf:
   - $ref: ethernet-controller.yaml#
   - if:
-- 
2.53.0

