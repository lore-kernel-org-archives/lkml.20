Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A7040BCB8
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790118438; cv=none; b=DoQjcubQy9IteryKXTjg1ewthq6NtHcXdg0R63/SboDd7M7eGUXAGdfxHqFgXGrR5rv9Pai3snH6I+R00nIEcADQvtOY+VTrxtWf0xesd73wYDvVQBtwm4SSpF1W7XCKrZxid5TvyQcBgEq2i/wMWwJrnhR24qCS+/XKAq/b24M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790118438; c=relaxed/simple;
	bh=YhHDPn1w+fGHVpTXcMRfO/BYZaq28nhrK775K3W60Gc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WmQ307jCXz4JTYZHE5CKPOWkkiQJeJIB6yr9scfG2h1U5ItkT5UI4g5pu091RQ5udMb0RedsWBjeoxQx7380krG4L8+KGV29KrG8lJuvHGfcqX/fMpyoqyGG09KMw7RtteONDfV5hpf1YDyY220pLcMig7WJJqTe8vzUtjrLzOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MWokzUl8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JLyS25uD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MWokzUl8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JLyS25uD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI73HI1348892
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:07:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OMMlMgnS6xl+6RSHGuHaRN
	5YIWe/23hApHhJq6B6Z5k=; b=MWokzUl8Cdp9pZ1yRBl7Xu4kDMEk1TfDy2fwCE
	qVbXkCVHFIKAhByW3OhMV1t955k9Z0ZUTX9M+grOjBvOIT74GojVlLx+fYnjAxQn
	xdOcKA7JAksDO+288mqDTZ3IavslqZ73QT4FkJGZpOQlchqNWjvoyw6TV/hO6oo/
	Xpi3OZvsU4Jx4qEunh3JJtzGincg3z2Jm4pSvXONCBc/snQezE7+QjPRjqryAQ0o
	rSgBT8umppABZxfdUA/mIWeJ04rE8n09IrNMYQqU18xyXIX666OCjtlKzorv11S1
	tIz2DKk52CxD7OlxYoGJVeqaFvkp8Eym08q5faGyOMhMy7DA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux861fqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:07:15 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-14371f7ba1eso471892c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790118389; x=1790723189; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OMMlMgnS6xl+6RSHGuHaRN5YIWe/23hApHhJq6B6Z5k=;
        b=JLyS25uDupF1TduXqjRKaZrAXQ70MggZz2gnEH9SSJp0hn5AO/KmGe35qHZO8zNsnG
         H5QvWjnB6FWwKBdW4CEY+g6Hk6Q9zQTNTG7oxPu7N2TEF4M0g1g9Rxp7ky3gGyGZgFJd
         Dfj1KnHfqWTjhPXD12inoK/9O6rXisuSoluuCaIPoJIiQxxhGndcih1gY3eyLYGVXQrn
         BwICIEguoWmy3pSaj7KF381Yzj1RUcvLqqwPEO9qFq48stjiYAKsChzypb8abjg2DSc9
         m7Imeb1ENff+XMHDzQ9sEN/9ZFAHFN352zWJXohF+rwULdlJBS+QkRnp6Cc3KG9qGUNH
         4Dsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790118389; x=1790723189;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OMMlMgnS6xl+6RSHGuHaRN5YIWe/23hApHhJq6B6Z5k=;
        b=FRh9+EgmKSSficuiHNpRtQL4RTb6GF2qSynp/lDL7FeZpVS/COrLHdKEYCI51bJ1DS
         YbbJ9c4DKXYiHqRqH4WDwFk6qi66hN65YqTAmrroB7iqiPiElYygFJWFhZwN/QCW8tPt
         hEK8I+6aGnyx81BrPyWpbjAC7BGqDGPyBpkhFABjLYjMcJAYda8Tj1QPqU0JDS/0/CkJ
         9lrrIEmLqk6ugEXRQBcSzo74RVyfteswakm3jruuUOpHwfPScoJp6YbIuX+5N18xvvgL
         NwokJrRSCzrqova6+FwAKTnmvIplvEraMOKUHNlyvJ+6zHmO5IzmnczbOq3aK/78LkYF
         Me4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwmALm9uJheOEPx0iYI6Bi0mlm1U2D4LxReWJn265+w7TuQ/caMg6BatZt4foExm44uOn8mPNoRLkdLNjE=@vger.kernel.org
X-Gm-Message-State: AFuF++lQHmaQkU5Ue8DiKMi3Kd1zEQ9ElVUM0zjeN5TjGM8U5ilnqdB3
	kjgxGcq7/MswkdyW8hbEf6eWeno/7H05GMXQaWU2QdeyNmKOFEvf5zTJgsKH/EBvc2sHLWcmrEO
	gzlPCL0an6fuhBEOZm6dvFclSNF+mr7Bcp+HvmF0t9tsqRhp5IuIeRVrKIvvVwXjZR0Q=
X-Gm-Gg: AYBFou0jurjZtMcS6xAyWDAd3a0ecI0H2SK6TWN+WPUjSp5N5w710+lhdgaWhQtZWm1
	6BYGXoTp+05JCcWKARVPlISZeT3s1YV4Waw7FrwLreV+QlO8T6kGhSgXEZ9KHCjq6hWpdUHTquB
	aT1GbBx0qZ5OaKUUBc9jEl5oGfgjPXNrCkJ60gFKVmL4KXr/CQ/8wAsZ1T8800GVlRzXqk6+SYJ
	21gGgLloKYkhOvrPyqSHdUXvUAQsM6Ls4hAC2esJ37WSwPOPZha4VIdoV81Rqw23iFoHIcygepA
	y2/krnfsuwyOXVOoB0de9GtgPj+aniZ0sSWZ/KGwmpxNXCrG9jtfZfA7qgrxornCKm9n4L5J2nD
	I2YtIFxIuWvRkNVDFGszTQtTxAMYRHW73JeSzzlJy4v0vrMQHh/j1f0dtA8xw
X-Received: by 2002:a05:7022:ea8a:b0:13d:974:a42c with SMTP id a92af1059eb24-144f9087209mr983553c88.1.1790118389163;
        Tue, 22 Sep 2026 16:06:29 -0700 (PDT)
X-Received: by 2002:a05:7022:ea8a:b0:13d:974:a42c with SMTP id a92af1059eb24-144f9087209mr983514c88.1.1790118388522;
        Tue, 22 Sep 2026 16:06:28 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f983c5a1sm1737515c88.7.2026.09.22.16.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:06:28 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/2] Add Qualcomm SM8950 socinfo
Date: Tue, 22 Sep 2026 16:06:18 -0700
Message-Id: <20260922-maili-socinfo-v1-0-a82bd7d4ca77@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOoJs2oC/x3MwQrCMAyA4VcZORtoMx3MVxEPaZa5gLbSwBDG3
 t1ux+/w/xu4VlOHe7dB1dXcSm6Ilw5k4fxStKkZKNAQRiL8sL0NvYjluWCQq0x9TD3dGFrzrTr
 b7/w9ns2JXTFVzrIclzDGAfb9D2bUik12AAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790118387; l=557;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=YhHDPn1w+fGHVpTXcMRfO/BYZaq28nhrK775K3W60Gc=;
 b=U4nR/uq0WrGtBKVMnjdZyXqBRdKzO6/z99Vrf/0T56CSEKLtkPWWpLpExay1yd4ofY4ZV56MB
 CbhZQDam84FCjCDWsKcLwGOSs8drY/WNQ8mVC1oxCt+DHzaUUJ7CsNz
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: WQz0lM8ADd6q3_MM6oYtsauO7oNlGvQt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwNCBTYWx0ZWRfX1wJ882RfjWtV
 +GSI8TX4hO7DxlYlsH8LGVxTj0BoT6ckXym78EdtMSSI5wCjt2OrD7PBfU0etYoxkocBbMobAKL
 ldXBQLs+m7vWUz14EylTjFBOiYhhhsY=
X-Proofpoint-ORIG-GUID: WQz0lM8ADd6q3_MM6oYtsauO7oNlGvQt
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab30a23 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=bZKhxiC5GNGfeMcMCAUA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwNCBTYWx0ZWRfXwvdJQHk+swpV
 lSIp8cm09R2yECICCXvX5WlGjmeNw35s91v8Ej47csnBM/JOE9+nQIIeWqE41Bfz52Yg9JCOLhM
 B2uPp/r9FoHq2eQsi8Td+wTHwvbpVD0VJhkenav9PWxjvgEdj7zhdgdd/Cr4BZcLTr/sHjjOK9f
 KXrNEdhIBZpNQk5FERhdIoPk4MhDrRXWehzqtCdjkEl9IFWWUWeVUh468xk9v3rrCUmWys5pM/W
 radIGpoU8ChY0/8+XbkxBdShuA3sK/GGOISR4QoAek0I/7aFIqzjNoghU78BVMhztiIdFUxEv4M
 v1SqW5K+13R/It1yzv+VvUf3/ta/QQa7yPmOAEDn/OGKZUd2784m+8dyDjaKIEbA5uLZYIegoQ9
 vfGj+pb9XWgU1zyHUCV8ZnaWAMzu6tqKNtpO7QZU9/ZPtCNah5LwJzRwK3gc/3xoMWsG9G4LzlV
 KM2qUZGHVwEjZb42nqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220304

Add socinfo for Qualcomm SM8950 SoC which represents the Maili platform.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Jingyi Wang (2):
      dt-bindings: arm: qcom,ids: Add SoC ID for SM8950
      soc: qcom: socinfo: Add SM8950 SoC ID

 drivers/soc/qcom/socinfo.c         | 1 +
 include/dt-bindings/arm/qcom,ids.h | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20260922-maili-socinfo-0c4cd31b325a

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

