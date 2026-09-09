Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838A455C1A3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959459; cv=none; b=dC3+7eBlDUTXj9KDmQyeB4WMWRJeS6Bpfi9wDMzafiOYJvIB34twdZcnAX3ORpsRTo/k5fL3rWAj8op51zh3lan3ql0zbRkIaRWCQF1OiXyaB/rp6WMY/4H4YvA1WPFh9MXDO87OXnVAPTy4rHxmgToNsv5uQcDk2BCXb/aS/58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959459; c=relaxed/simple;
	bh=Ixb/AmdAstOcn9FVhgNt2Xll/IdUyQ44GvDHEBU3aaE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CQTNM3HXjUT11dcXlzYjGsam2UEABLWNQBesQlVp5JEKlxoTjdBwGHw+5r2eIV9ZZN+vuMx2Prvuc5qCP6N5SJwp3MtxJXWg+LWR+H2JWm5cfnI+uU3eusOK+dOmqGzmNJoZDLXUMSAQjytAHiH14FBtyXRA2d1kpfMcz2GO9RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DAtkTypM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i51PaaXQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DAtkTypM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i51PaaXQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU6ZY599697
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 13:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AiS2pGqIFKAf7u+eYdTRDO4CKrAlgaifUWeuWMxg02s=; b=DAtkTypMn04wZ1TP
	WbSui06HmTW3UHNwKc5XLh+GWQiORuQHKnyGnJZyR4d1DQ1IQD9KHBu3EgO/iPeG
	dYpjgeBb9fRBhgAbKd9a6+U9AHP6bKBHgzs/qurmuXwQ9GrlUDQG+GK9atA8Sfim
	rxUaDzz8L58Nlptu1RVcPHSLa+sJnBrz2o+zuj5foYpstr4kVNJad3FB6vxAmNPA
	2+fglSMQUp1L/3ypBIiOql4fNQAOFChaNM9YqsQSl7Ht/uSZJ3/V0fa069EObEU7
	Dg7RU8QXYi8rNnXyMidz0x3QM6j8RHG6Pq9ANbaCFa5+GeAI6AuVuUC7DlqJkNmd
	sPd1yQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjywr22ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:10:55 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78fb9f59781so690503137.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788959455; x=1789564255; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AiS2pGqIFKAf7u+eYdTRDO4CKrAlgaifUWeuWMxg02s=;
        b=i51PaaXQcuIhn0l2B1YVsFMZT1aHPtqAFFEPFAwyc+GMm/hzxeF5t/PNlh8MHF9Q/S
         /kiR7b/YiCGnb4p7UjKLs9T+RCx9VtMebm9v8TsRJjrQsSCONSBE97k8RktKALmXakXd
         5/kKlGkP7h60h31AM+l7oAyhZ+XC9L8BdQyRMAlJ0+PVCCYL7DoYKua5h105qr1RpfNO
         5k/0I3XsogyNe+LNKGPIygVnhSXE6QFEIpbJ5ZAngKNBY+o7oGjjYEJmcw6tZekBewNs
         tx9LWjWjN9nDIRyXgnixQ7fwkCE7QvOAbTDurlBeFOhcCJ3TCBKTamssWMcWylkCao+V
         A22Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959455; x=1789564255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AiS2pGqIFKAf7u+eYdTRDO4CKrAlgaifUWeuWMxg02s=;
        b=MpwfNlpRNGpSbG1taWv1LRA3ffBXlaIE2j6K1c7iG8CRjrFgDkhmW9bUa5Eu1FoEj3
         JAX4zVcGnCh8y+tbYOgQ7ffBbtlKKYZkFATO4xu6+GQz3F2ktv0+6CaaKqnkvvVleOk/
         zyG8CjUNDkaW9zbGcM7Nl+99tpdP9ExJrLXBuNK40G4fEdJ5zzmfTg12zdD2w7lE+NJN
         j6SjXs9dyv8P3yBsXiYwDv54/M0tvFp9GdUbI2xASkJGDnPHmO9h5VdcEq8wM0bYpuig
         +rz7jy2j9QS7TWDhNiLb7W5Y7oCi8+If4xYYgqrYbx7JgYnO2wSlRhGqQNxyHizjchz9
         GcwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgMvs0j8MXIQD2SWCYOD92bg2n8lPY5MW9/ZozQZDE0KNoPyh1zZdQeLDrxs8vXCFu3SBUpkmXcnIV/1s=@vger.kernel.org
X-Gm-Message-State: AFuF++nzGRu43tjaXye8Xjuu6dc0veNvWLwE7+9Uqi/pw8x0/ufn6FwO
	vp2uO0wuNo4U+iMPnR7X5scwDDm9DuK08zBt+YkFtudaWFNpaSu3kxFXy9cSruygf6cXIel5fAR
	V+jBClJvR0ztNejAp5IzuYxp00pj6nXR6Q61Eum9yeRE+NoY9vlVIkjAk8DM0c9p6qtM1HUu724
	E=
X-Gm-Gg: AYBFou3diNp7iM2HJ9kyoladwNlTRk/blN9f3cI6dXeqFFqvSfSPYQWPl7uwAAnP9jy
	pGoJ8I8EBbzLvSqYPh0kdJCDvJ9MQdzf56CMzhBlq7h0bWJaVjz9wcJg0qfaLrRA5BrrfPGx87F
	mthZV++pJrd8j6R9a3RV14tYYTe7oNEIeOAjOJpjtk9kqINNFeg7PKqmCHTVSVuSWAM1GMVTzoA
	9SRSPaKW2lNamWdBgnNbv+YvFTIhF+4/0KQbuS9a7bqB9CRoFWlm2g7DLmQBlDQAFIAlc4GZSQQ
	NVgklpcZQfi6JiV15w3QDhSNR4rZJFykVO28X0XiQIRsqQCQ/OF+EFoJ4Fp5EekYfiZRPM7RbqM
	7VIcN/wYZmNYglAbx0Clundo=
X-Received: by 2002:a05:6102:5e8a:b0:785:eb33:87af with SMTP id ada2fe7eead31-79078210c3amr485362137.10.1788959454511;
        Wed, 09 Sep 2026 06:10:54 -0700 (PDT)
X-Received: by 2002:a05:6102:5e8a:b0:785:eb33:87af with SMTP id ada2fe7eead31-79078210c3amr485329137.10.1788959454022;
        Wed, 09 Sep 2026 06:10:54 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8993253b3sm114594e87.52.2026.09.09.06.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:10:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 15:10:36 +0200
Subject: [PATCH v3 2/7] dtc: dt-check-style: Handle continued lines in
 check_line_length()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-b4-dts-style-checker-continued-lines-v3-2-474bb324ae53@oss.qualcomm.com>
References: <20260909-b4-dts-style-checker-continued-lines-v3-0-474bb324ae53@oss.qualcomm.com>
In-Reply-To: <20260909-b4-dts-style-checker-continued-lines-v3-0-474bb324ae53@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4091;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ixb/AmdAstOcn9FVhgNt2Xll/IdUyQ44GvDHEBU3aaE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqoVrP3y44K/5QKTimSkeef6hsl1b6Ri9MoiD0+
 GTehlOA5mCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqFazwAKCRDBN2bmhouD
 10qdD/9/+rRPDUfbCB9PEoX6U2Fy8f4AOv+aXooPfKpn1TL9qMi2cQq2aJpiA+OScLO+uyCl9Gm
 R7CyaMslr8fKXc5CwhXXUVUl/TUfokq0kZD2GgoumgKtoHLvburs3YbyH1UTznKCvOAdN/kH415
 0zYW7j7wLGaK3vWNy34Ho4e3UnEJlYxnEVaMhXpFHIHeJ6rNxnIFkz35zrRgwMdbvAwEZ+mLE2W
 eETQPeN+3ARhqjP3RPOm6wLJZ+GD7YYcvKna69SlRWKQwL1qDa6VNBfPg0eETmrwFLTxwoBNm+L
 GTNPDQqgyjhAQycvYySVfKcC3g/qfO48Bh+yJPiEP8qF8CqnnEYgF73FSpEfv1M0ceR8ywP1WcT
 nBSUN9dmPyb42qLg39BqCnm6hiaKcwi4XdhcvOZa7HSWBbfkHky6PwdFjh+JAPupsVm88IV13Hk
 XFnAMx5jy2jSUGnaqMeYLjrPaEllv7cWaoGm5tkZQqaL0X75mFMvwXWMgmfRU0/Lh+dyRFSFHnm
 +rhlSWt7+q6xidF65VhCIzHBWrZ2pKE6AuAOBcvj+Ta5JlUTVv0U/U+VuJ7vf4cBDDwdaUERR4g
 SbMfH6F793sIFwvgGaB7d3kw1f9izxyXKNrS7TYvQZcqchuDfuOuFy9D3jgtT+xUOreICy8ZTFv
 36aA03vhFaQWYFg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=a4YAM0SF c=1 sm=1 tr=0 ts=6aa15adf cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=jHdmtohXv_5nRK-EuSoA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0NyBTYWx0ZWRfXxBU4dUzhwKd/
 fwqJg9cTZUjw31Ux5A8FPKTvKLdLKSNwhbZuJ/blX6evSZa63oxLc5BQe3TBHQkqmj38DwKxehl
 9GgJ0SaFxk+09T+SefVu2VkCnzvE1wG4vG2Il9VTD+o7yUXT5mLNvQ2c9XkO/fW/xvhUuPqtmpY
 eZ/6ZPmK5lbj555m+ARKIjrNXaV5FzFqMxW8e35U9K+85iW0h2qf3G27xBbSyxBluIqqz3FaGcn
 TMzzmZ/ivacM75jcJYVJ1h+iBA9czcuWtOEw9DGuQbl6RcD+xdFgzK0hcMb3n9hJje+Ic7Lo9hX
 lqEZx84afhrhVVDhPdtGxLhnu3CoDHdmM7s4GfV2sFY8S5KCn1CfrV/9/6+F9MHwLEKmHfhUtJA
 imVwH+5aQ6Gt2DrEcFD6GBeWagosb/fFr70/+8d5aMvwqh55I3fRCeUx7ds7fHVKZeowuDU7rAP
 iz+dQLc48V4GfHk8O5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0NyBTYWx0ZWRfX6NlqH611J4nw
 n3UUWIvBNszsI57QIA5shCePkiSUvfeqqVo3R+g6C43dSknLXkM2/fHiMQezW3ZTfGl8SCqcohp
 IeGC2XBp+Q3x7XEm/7h3Rsk55BwPGWU=
X-Proofpoint-ORIG-GUID: 0Xv8CstdXGhBdCWrzYqhYOJ0irDii9li
X-Proofpoint-GUID: 0Xv8CstdXGhBdCWrzYqhYOJ0irDii9li
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090147

Continued lines are not separate DtsLine items in ctx.lines, so they
need own iteration.  Rule for length of line is applicable to continued
values as well.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                             | 18 ++++++++++++------
 scripts/dtc/dt-style-selftest/bad/dts-line-length.dts  |  3 ++-
 .../dtc/dt-style-selftest/bad/yaml-line-length.yaml    |  3 ++-
 .../dt-style-selftest/expected/dts-line-length.dts.txt |  1 +
 .../expected/yaml-line-length.yaml.txt                 |  1 +
 5 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 6d978c4d9832..ff5e715593df 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -627,16 +627,22 @@ def check_indent_unit_strict(ctx):
                    'got %r' % unit)
 
 
+def _check_line_length(dl):
+    if dl.linetype == LineType.BLANK:
+        return
+    cols = _display_col(dl.raw)
+    if cols > 80:
+        yield (dl.lineno,
+                'line exceeds 80 columns (%d)' % cols)
+
+
 def check_line_length(ctx):
     """Lines must not exceed 80 columns; tabs count as 8 (see
     _display_col)."""
     for dl in ctx.lines:
-        if dl.linetype == LineType.BLANK:
-            continue
-        cols = _display_col(dl.raw)
-        if cols > 80:
-            yield (dl.lineno,
-                   'line exceeds 80 columns (%d)' % cols)
+        yield from _check_line_length(dl)
+        for cont in dl.continuations:
+            yield from _check_line_length(cont)
 
 
 def check_mixed_indent_chars(ctx):
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-line-length.dts b/scripts/dtc/dt-style-selftest/bad/dts-line-length.dts
index bde91a922477..adf40e3c95f7 100644
--- a/scripts/dtc/dt-style-selftest/bad/dts-line-length.dts
+++ b/scripts/dtc/dt-style-selftest/bad/dts-line-length.dts
@@ -14,7 +14,8 @@ soc@0 {
 		#size-cells = <1>;
 
 		foo@1000 {
-			compatible = "example,test-line-length-this-is-a-very-long-name-indeed-yeah";
+			compatible = "example,test-line-length-this-is-a-very-long-name-indeed-yeah",
+				     "example,test-line-length-this-is-a-very-long-name-indeed-yeah-second";
 			reg = <0x1000 0x100>;
 		};
 	};
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-line-length.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-line-length.yaml
index 6e4140e500b5..6b1209ee4f26 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-line-length.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-line-length.yaml
@@ -24,6 +24,7 @@ additionalProperties: false
 examples:
   - |
     foo@1000 {
-        compatible = "example,test-line-length-this-is-a-very-long-name-indeed-yeah";
+        compatible = "example,test-line-length-this-is-a-very-long-name-indeed-yeah",
+                     "example,test-line-length-this-is-a-very-long-name-indeed-yeah-second";
         reg = <0x1000 0x100>;
     };
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-line-length.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-line-length.dts.txt
index 8ed08c309632..9cdb7550b56c 100644
--- a/scripts/dtc/dt-style-selftest/expected/dts-line-length.dts.txt
+++ b/scripts/dtc/dt-style-selftest/expected/dts-line-length.dts.txt
@@ -1,2 +1,3 @@
 # mode=stricter
 bad/dts-line-length.dts:17: [line-length-dts] line exceeds 80 columns (101)
+bad/dts-line-length.dts:18: [line-length-dts] line exceeds 80 columns (108)
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-line-length.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-line-length.yaml.txt
index 89b36360caa4..f21b823c6136 100644
--- a/scripts/dtc/dt-style-selftest/expected/yaml-line-length.yaml.txt
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-line-length.yaml.txt
@@ -1,2 +1,3 @@
 # mode=strict
 bad/yaml-line-length.yaml:27: example 0 [line-length] line exceeds 80 columns (81)
+bad/yaml-line-length.yaml:28: example 0 [line-length] line exceeds 80 columns (88)

-- 
2.53.0

