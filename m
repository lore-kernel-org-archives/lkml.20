Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB1350B8A3
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858815; cv=none; b=WWh+4XAvsOOuEy1hvTtsUIzFVWTqKAE6Ae+L9eiIgBYtca5gcrk8isb9k4267RRL47iU/dLDpwredpeITWgZkP8UepLdBs3L41z+rswCo/Rd0TakonvrVcY0/qnIgbkuM08mPGaSXuX1QgD8IR8ztyIeMDMDDLMcoyKG7Opd8io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858815; c=relaxed/simple;
	bh=EKCIxJNZEKVm/LJJ351gVoK6q7H9e04AGwo8s2GTHto=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CtkOt1IHX/h/zrlSYv2elNtLTCOoOeRFKDhV4/6Exn1ADYrBMpedrrg6PdSYDewPYFIb3uadj09zxz3csjcQWVu5s1NriLh9tr/ZbfH4dlf4srynJa4xsztTkQF0m7SVEbqZcI6nzchZud69ENUOeBr2kwg1CfEj3z/z+W/RK6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j1aHZKZI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SRpyGzfL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j1aHZKZI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SRpyGzfL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691CDiX0396111
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 12:46:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XhASI7Dy5cGYVoR3oHPmx4r+3Br63Xn47/KudvC2y9w=; b=j1aHZKZI8h5wBUJj
	Ik1l6X6oZYFvhAql/7O5CFqrxpj5RercIg2YTnbTDTw0vugX4CwIGxM/JDJyOAiN
	MFuKlvGWHCqeZPOnMZx10p1/kNC3iRG/DrtIlfUn3BnpQsYDfUgD+QjAXQVNCw2x
	cL++CSUnMUJ5YZ4XaAN4aG1e1SYSJiuedsv/+SAJbuLEJo6Ahx3+mE/cl/m/Nct7
	vktQZ929i8H3e2I7/IcwSg0Ja8tt9w5Qel44/JyK+pXFWhFoHJ3vEUk3i8fUvvkz
	28bnnBv79SNcYXDxjYFMVYXukSXx1nt9MiBuBFgH5FzBysmaI1FrQ7xMGHi9mFms
	BZS2WA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh5axv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 12:46:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so6374048a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790858812; x=1791463612; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XhASI7Dy5cGYVoR3oHPmx4r+3Br63Xn47/KudvC2y9w=;
        b=SRpyGzfL2l2Rkl/5dyzbQHGtkTJt6er3Xa6Cod//JkUz7nEHhaRsO2lm+5QKtyzJyi
         etdcAwdRMaYk43pyU3YP//azHLBokusOCw98rFYHCRESurmxbkJvSLWfvaBWwCHK7eH5
         ofX04oYnwMO8jD4yiczx59Uamc8Cbp0P5got2B4R8YaImtxHoht8/dqXCIYBC4gvHOOK
         Dgtgw2rQ6BIw04Jt+LsA1+waFyk3zm1Py4HIfvNzWcbENtZLc5MKjGTIWrsvw8x1cKUl
         oz9dyQQ2Gj9DC022t12mETBQm97wklrbjZQfFuqLSfhEgNdTxRYNX+xfUAouGA4dZE+N
         DOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858812; x=1791463612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XhASI7Dy5cGYVoR3oHPmx4r+3Br63Xn47/KudvC2y9w=;
        b=Q0XjinK11pVg2ZMMKwSgmVQwKk3NqTmQbLaqSXF2JNbMFqH9H3wNgC5OAO/5xRXACT
         j8Q35DBjawl3jHIkUFY35ScnUrgBJiP9TDe6d7WnKMo0sZRJTG2p1RWfUe0Wif210H6v
         PzH8JT8CUvZoOJn2j9MuiPzOM9sylidRGFFOxBIMkYpMxLrW0HPSzB87IjTVA8GCuZv9
         17uBSmSKdkKKnGz01BcEo3kaMmW93tZl5j7xy4OMcl/VVAV48xMD0q4t3l6LnHlMbRUz
         cnk7cwSmpMdR8dyOhumSpAbEUDa3Dc+PjU/rY1uqRVNrVxcSEFeS98pa9xOSZ7x9CcwU
         /UkQ==
X-Gm-Message-State: AFq9FYLCOgWNOUm4wA6DheB2YT/Kg60skYLMm+BYELTF/KLSqOmEre/E
	by+v/h5ZRUPB+pAuXwcSyYSEuI1xpSc4ahH04UklVdVnmMztDQFnp+COAyrBLRZAQoXW68XFyPj
	fBebn3abJHj62+kmKGqNheHrPNf4CMoocYacaXTR/DcCQFH99SuA8bQ9GBh7cAW8cb+g=
X-Gm-Gg: AYBFou3Iqjk8qWu0mt5mx/S0WnO873T0zD+1SUmi5zd7GeifwLGAW7pwOXNW/lSMNOt
	UQaUzM8bmb1oGfR/4W9XAQgitrOr4Y983WNDZbk+e/GKwDORzj8T2W2afBZUy6rDm5+ufiBEpyk
	u7qand6x/8pAf+NVJB9CHIyLJ6N+hpkD554RpEc2sQCRzVYSUTWtGOcyQcxeQYyaiUqV23wUwsz
	zoaQcyb+H6Gtvg+VPuWBF0GCjQV50Y52zdvpnCepKrUvyzaPepcxKasI3IwoujycaXhkorYOaWY
	1xcRaQKSnlpMusypovp1Fr7r0qf4D9J+q8dGZn9r/99Ehg+HsiqMAVRps8n8DKBiHTja8rYqcyu
	k7aUxjWxgn2aMEcod7is=
X-Received: by 2002:a17:90b:4b87:b0:3a4:a229:58b2 with SMTP id 98e67ed59e1d1-3a4d1784a63mr4237751a91.38.1790858812472;
        Thu, 01 Oct 2026 05:46:52 -0700 (PDT)
X-Received: by 2002:a17:90b:4b87:b0:3a4:a229:58b2 with SMTP id 98e67ed59e1d1-3a4d1784a63mr4237715a91.38.1790858811940;
        Thu, 01 Oct 2026 05:46:51 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f479dc9fsm4567467a91.15.2026.10.01.05.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:46:51 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 18:16:28 +0530
Subject: [PATCH v4 1/4] regulator: dt-bindings: Add
 'regulator-off-on-delay-us' property
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-regulator-off-on-delay-v4-1-258ba9612da8@oss.qualcomm.com>
References: <20261001-regulator-off-on-delay-v4-0-258ba9612da8@oss.qualcomm.com>
In-Reply-To: <20261001-regulator-off-on-delay-v4-0-258ba9612da8@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Saikiran <bjsaikiran@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790858803; l=1388;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=EKCIxJNZEKVm/LJJ351gVoK6q7H9e04AGwo8s2GTHto=;
 b=CAZuIzwEeIcbVQgQPje+g2bEtdMqlZUgg+Rt4x0Ktlisysm3ZzPXyOdB8dDeaLoubOpIBi3Gz
 BMjEJo3+GkgAygFHhT1BQOslCCuqshOPr16o0T3EsKty098Plg9Hkap
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfX/CPKFyawqAYR
 7wM7BXE/KO1QLLE45x3I2GwDIJzT8vSh/snQCN22mHS5fBrAHMoP++Lzc4KV21JWXPY29zs2FCm
 k0Q2VRGLCmtCRJkqUa2gqjW5POQNJ7W0+DVdMSnpqSoOzZVrL6NhrjWCvIexaTjGO/l481AE6eN
 XkfPiyPZRcpkGYF3Q1lVu2hOlkfFVTvR9bC89s2uxNsSLeonB2rifaGKK24keM8dp8xfJNmCtB+
 L/2URnHT7lnxxvcdtWuunabEGj+DK1VA9sV+uVWTmhJo5gqBio93KpORCqMV236LDIBx1xl7Ycq
 AvMwZoDYyqtCdXvNm3usT+SYlTF/O5Ny3UAGQ5v9bLfrXFXyhUXcWOeWb+g3RmONGKYZDSWYVxy
 vDcWQr6M7VMBzVnj2qrZgO50hrY9ol3onO7Dz/3wauFhRYH9hduFdtdUZJdN+U3nFVCj2lck2Ut
 pIITA7b6ofa3cGaBjBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfX+OmLaVJiaZeH
 xxAjERtpk6GpBg1tImQSK/Pn8TBeETRfG2RZNhrweEWDSR/Gz2KIiwnrRfeAKzTvPAvhkWaMvUD
 C+AGRHJkDoRE1XWDM59xHKPHp+FN+wo=
X-Proofpoint-ORIG-GUID: f5KBbU8FqLi2uobkWcfYQDT6J01bAWaN
X-Proofpoint-GUID: f5KBbU8FqLi2uobkWcfYQDT6J01bAWaN
X-Authority-Analysis: v=2.4 cv=NrJE4MdJ c=1 sm=1 tr=0 ts=6abe563d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=xl1xDpuIGGFnwhC4BG4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010050

Add a new property 'regulator-off-on-delay-us' to specify a minimum delay
between disabling and re-enabling a regulator. This is useful in cases
where a regulator discharges slowly and needs significant time to reach a
safe reset level, and re-enabling it too early may lead to a brownout
event.

Suggested-by: Saikiran <bjsaikiran@gmail.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/regulator/regulator.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.yaml b/Documentation/devicetree/bindings/regulator/regulator.yaml
index 019aeb664cae..73e1bea87adb 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/regulator.yaml
@@ -243,6 +243,11 @@ properties:
     description: Maximum difference between current and target voltages
       that can be changed safely in a single step.
 
+  regulator-off-on-delay-us:
+    description: Specifies a minimum delay in microseconds between disabling and
+      re-enabling the regulator. This is needed for regulators that discharge
+      slowly and require a significant delay to drop below brownout thresholds.
+
 patternProperties:
   ".*-supply$":
     description: Input supply phandle(s) for this node

-- 
2.43.0

