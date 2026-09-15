Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BAE438013
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491856; cv=none; b=MY7sYNGFnLNi50xaxxxsN/kuiNTZ/JiX0ncJaA/33ErYH379Gsqws6+5tW89ajGYZQs5s8Kklu2+YzUmVFXvokM6chKt3SO0GPStbMQgiY7V5J/cDcmrZne5e7U/B81IC53B+IYf+YMIBceqbKwzr4dZnNw4tSieBCKt9/At060=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491856; c=relaxed/simple;
	bh=hjntdJUmLLlpSp65R90lod9o1WQrohD/jePzZpT9g+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eMfUTlSXhgv4OL+X+AtyF0lZHNA++9GDltiZe0TrK8Id+vOO7maLKXSaQJ3o9DOLo+9aRw39mPDwCiDSstKZkkdeA+hSyNoUgJSMZmDnyaVl6VBNVmwazCDwImj1ZP3AC+JT51h9ng5XMnERER2PPyPeaXo/aJzTCyJ8XcDvD9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TUFcwhQL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zb9sadOq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TUFcwhQL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zb9sadOq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAYsZ3958808
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RGhQRLp2DcKp1qv6Y3qdZKbSsx4vf6J2PmKbcj7Lreg=; b=TUFcwhQLxOZ1ZSVh
	2pWOjkjT7kzWdOOm/8ZIJ8b8Ndyuz4jq3LAchyY1LlyR5u208oLUH/RTANjykZOA
	cZwHJ2iYvZaTWtCBDn7vQoEvYv1dUH49WFUXtS6AMVevuUhuU08ux3yEdTMgIS9o
	XrPXJd68ApkjfodvJzVGDz3YQUW8s7tH9tQz8t74Ii9TGnGf+LsJkQvNQgNL5VSg
	QaIPZZaQBLFKlTSDX6Oxv2eK8I33NoAczNXOia+RPVliqhPzhxOJ7g2Sr6oHQ6PJ
	VdXLv0PeFvz5VJeEKD5ao2auUvJQ5Rakgzb/jhP+eVGbk3Hdt3vVwn/wzvSRSL77
	ZtsjCw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq2y2j822-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:04:08 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c58ce17b04so5557249e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789491848; x=1790096648; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RGhQRLp2DcKp1qv6Y3qdZKbSsx4vf6J2PmKbcj7Lreg=;
        b=Zb9sadOqbHzp4LtilkImzjN/X4l+H1DAPhRBs1lgHb7xI9IYN07zXYAsBzN+QfRsC2
         xqvXuISFJHphQ/dmDmzoUTag00D0H3TPUUwUq9RYsfKgRHwKZ1ybxVzaAlbu/O97d1IO
         v33nB2rfLoYQ6BUyyDUdiDvvym4cq2OIUr3WRsdVYfRL+uKH9Gi6pBlIIHzYrsVm8kmi
         3C2ZxYbOxkfVSOXkxKfmrf0GId7tJPwhDKXYfBTRq/a70KQ0bdOsWo10w6xyzl1g+oWs
         EIGXloGsnAW04EkOU7rv6lf2Hm9+Rk0XqQz7ddFVyNO/9i1lzPUSAbohxBnRQ/FblU2K
         Tlig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789491848; x=1790096648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RGhQRLp2DcKp1qv6Y3qdZKbSsx4vf6J2PmKbcj7Lreg=;
        b=D9wvjkVFEdaTwRQa94DypxlPuQgG9ARZJnt9C1x3c9Htu9i9YeubKiHRqPkGUS0bkV
         fY2NbZTdMU8SxRsUTtGZGRiDjfoJDRyhGuY1bFasQbahc5bx70uL+8RpNT6UWRl8J3VR
         4kFHG27uaSFNgQjofHrrp+8onPTbRaYIjEf8T12poY4DQpFHUnRjAlK+O2hd2Zg9fqRA
         DF/YAl7i1ZYOhQK2JfUheUimmwRUU7xEknUYr/x+uJT7kxZ+rd5hEa6aImLR1TjBsQLj
         1fyyes17VIzn4k5/yWfgzMpd0hkZtd7Iy5WRREYqbXYuGa6XlMycO3+tdmbaWoUrao/7
         cCJw==
X-Forwarded-Encrypted: i=1; AKwUvBxHXlx2LnhGDy58V5JjOakYLsxC8dljvVtFBPdNlzU6PZ8KW7zrpXFLgCfX+M7Q1zenXK0eZ6kb0wMgfJk=@vger.kernel.org
X-Gm-Message-State: AFuF++kqoPVQhCWd6MDqzju80gqC9mhhferC5Ab1z3LVDQ/0swWudLNl
	b5GUxwyMnT4Lw1LVBp+n8MW3XADsbqn4AqOEbp4EbwAE+RI521SwE3X8tkd0YdRMmLTY1CWE2zo
	9cxuO81XhPzm20kJ9FDgYZ+dE4jvQWFOWLohK/9Z2L0i2JtEFveQUvj7SrYWC2hkraP8=
X-Gm-Gg: AYBFou1tRa6axhdU2qo8GEmBsg2FTRzkEiHtbBPCVPf6w/faXay5jwUZUhuTMwRK72R
	mazqHrjn7vAJXguT4RNX4st3/y2ABs3iHEbHimfNO+xL6U7WuARrzdUJSvyJgHRQaRO2vDzMdEv
	cjzpqMYQp1Ag3uUYK6I8G+rYYudKlkRPIRgxs9Ya6ZteJE3Wg6kUh1erYNZ91UoAvFchLR9O9u5
	yqMvKBb6rimeQ7YoJC6ZblmRcMV9ut9S8vr9mGsd6/2QbKRmrOr5CnWoWbeB2ExYnKy3QIYSWaK
	Ut4RZRd5poH3COZmoJkN+bRrQ3W8Gag8Be8RPc6tuIpyDHtbSAFLUJVThNvqoxkQ1uJ17VOUYuG
	QxD58gplqc/vrKhTXmtauP5Y=
X-Received: by 2002:a05:6122:208d:b0:5c5:ad20:1fc3 with SMTP id 71dfb90a1353d-5c993c40be0mr3650294e0c.5.1789491848153;
        Tue, 15 Sep 2026 10:04:08 -0700 (PDT)
X-Received: by 2002:a05:6122:208d:b0:5c5:ad20:1fc3 with SMTP id 71dfb90a1353d-5c993c40be0mr3650191e0c.5.1789491847684;
        Tue, 15 Sep 2026 10:04:07 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27df9sm391286f8f.19.2026.09.15.10.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:04:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 19:03:49 +0200
Subject: [PATCH v4 5/7] dtc: dt-check-style: Right strip whitespaces,
 leftovers before comments
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-b4-dts-style-checker-continued-lines-v4-5-5b8e09b11ef2@oss.qualcomm.com>
References: <20260915-b4-dts-style-checker-continued-lines-v4-0-5b8e09b11ef2@oss.qualcomm.com>
In-Reply-To: <20260915-b4-dts-style-checker-continued-lines-v4-0-5b8e09b11ef2@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1119;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hjntdJUmLLlpSp65R90lod9o1WQrohD/jePzZpT9g+4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqqXp56de0sb8Y3WwMeTi8g8H6V1h+EgMUW6N6B
 mIPS0hNv9mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaql6eQAKCRDBN2bmhouD
 1/QED/48YdEsIcg2HhYUkO1L4ZByufS25ABygaWF+Kk7kqUzC/8FaSbIoH9DVy89dOUdfHJhvSW
 vwLO435Ozip2xeljzjCeM1qtoMYqaGUavmaSkBtAFvlIea33xM9sG94mb84bbLMimUUOBufGLY5
 XiGBMS/JcSWzWJBIzjOsK6TZXrJfpqKhKh5S8o2qdkvNsz2sVxpVk7x7AapbRxlvq5HD8wlMCxK
 sobCzFqOWkcQp+fE8NR1v6zlKBlbz/A4phX4ClrcL4sRzuFpZRagQjRlmSZwTTyB1tRnucssIbR
 fghsYKRapXskJUvmRkmgOri6IeaITl0gKdQWeGHG2iIuBSfBmckp43bNwh4X9SBwKEAs+9GERiG
 wUAVc+jNoz6gt0iG4bzQ8bkoXbzi/sIwymWmCxBv5f26mZvtWebhX7FVvjEFk4AQhhUi3AQsIz1
 SzbXc8iaCMVeEQQG1iwo8nzVK2ZPiIwDxSo58dTTC/njSDO2XO1vXxZCOLnbZZshtclIelUMhxY
 V116Fd6Ww3s0acni5YXdGKyf3OqUppAqy1BN1tbsR/3Y0XNXKrXhZWCoJC3un9l1FLkknobBFN9
 m5KGI31J8iEzDy7Jp1sDw+NVLC1tc9FAMRB/3RHCcAEr63jt4m3i9Mv6TocDUV0t6ZtoxjYFzao
 TS8X+oblhunpqtw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: u6LWFIitSHDqJiY1TnqvO6Dm1brcRAxE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI0OSBTYWx0ZWRfXyCxnbIxN8L2D
 yH2ipY6iuBEIXWlrTBdSx38TmpNVmEP/kNSV0XvBUeJUSLqPFlkIVmWSczC+E8PdIY7gGdcwCwG
 5cXusqfAkx680F9BsB1TP2Lvy4ApzVsalGrfo3SOkSntJth/R0ODbC6N2b7SSoO4d7bYrXFnwh9
 s/v7BXnwRDri8xYlVW0lFqkj0a+wVtad6EwICm0Fp+P/In50PnwpFwTVKAqPAyQqunZYGx0IMUT
 72jhZSrH880pab3arQV+cvFBWnKvDfJmP3ojXC5QCCwVbTI3fwqrSKolCNe3/DHiXmOqmrq/GOl
 ZTESfMCSjd3/DjtYtHP7OoMPnlQSKqx8YIwC6AFtc/39ZW0bqWVE6dtBqveYmDG/p+GDSGP/zR6
 Qp1rMdkjCuNmGOiLnWlxCmizt329rwJIm8A6JeSOPelIMCenFDdKbPynE3dCUG36XSnW1LdKhmZ
 5tZMikL5bPnwfUJsdig==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI0OSBTYWx0ZWRfX6FsLh0q0BRv4
 Hxk6QcG5pTZr6RzEraqhwHaOr359T9k/rdeJ+Cxjx0nn2OWIWh1SqlhEdKUelxHph0OEh8VcxMn
 jZqHbMb90t7WV8J+ViJzLJEy9YR7124=
X-Proofpoint-GUID: u6LWFIitSHDqJiY1TnqvO6Dm1brcRAxE
X-Authority-Analysis: v=2.4 cv=IcISymqa c=1 sm=1 tr=0 ts=6aa97a88 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=3nWb1Bopbj9nUPZVt68A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150249

Stripping a comment from a line to get the code leads trailing
whitespace (e.g. in  a line like "enable-active-high; /* comment */")
which will break DtsLine.code.endswith() checks.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 41c97d996882..a36c45c29476 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -91,7 +91,8 @@ class DtsLine:
         self.indent_str = indent_str  # leading whitespace as-is
         self.depth = depth
         self.stripped = stripped      # Code without indentation
-        self.code = _strip_strings_and_comments(stripped)    # Only the code, skipping trailing comments
+        # Only the code, skipping trailing comments and space between code and trailing comment
+        self.code = _strip_strings_and_comments(stripped).rstrip()
         self.is_root = is_root
         self.prop_name = None
         self.continuations = []

-- 
2.53.0

