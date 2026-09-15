Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7926B43801B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491858; cv=none; b=GqbYkuE/zGPgYfNoWcupyabjQkwI5IznRB+1q/pPf3ZMlwGhqVqTNVTH8cXlSoNtDvnbVj4X1Kqw6CIvDoG/T58uNThLniYC7qR9Ii7yaLwNd7JMUqtDQn6PGT8/LZTGdavDOty/O/moYBGz2nC5RMw5ly4rbVxYlg4BpDhMuCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491858; c=relaxed/simple;
	bh=IH1W9IlOK+nkzbQ00GnaQXjHG0Qc0Siw6521Fcp0sS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OCoOHd05p3kUsrVSz3HunLU5HNB7t1HzeQ7OqbnUJBQIAqX61HtbnmGQF2WiT9CypPKTwB2HuLVgFxCeQdd6D/EU+0jqf/9qCNMUHv0+CjTETMUUFNxAq3D3H6Ko20Grxqfr0Heewcylip60LP5hEOhsAIq3AgEYqen3TZZdPqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jf/Oa53k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zf0nvziQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jf/Oa53k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zf0nvziQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAYLN3958815
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Q+R860tRKkGNSd01+QxlRg3ifR5jM01Z5ifrXiDEe8=; b=Jf/Oa53kF8gCMRYA
	gpGp/H2GSz7tVV2rXvjn0HUCNtC56niht7hf69n5TYHxeIyEY2ckGJIMVZSGFNMK
	SKsX5k3OgZwLPFCIwh5QvAIgqMIPId9mOaaRMhUcHIdt7g3yNjlGCXGXFwel86us
	8ysuf4Y5zWTvixTg6ocen2riCNoapLifymo3IkVLrp/FurBGshIPbQOTUJX529yf
	EhJR0dbSkiB3+QgR+WJBsjXIR6/b72s+Ux83qZbPkVR7H5Ghc89PDbi8n4+TRzE4
	rppN9c7kUoa3G58qHJu/9SbrZ1Nmn28wDAe/KI0sp/VWaf8lnAa/zhd0L1pbzXK9
	Fhpltw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq2y2j825-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:04:10 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e8472ee1eso101592826d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789491845; x=1790096645; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Q+R860tRKkGNSd01+QxlRg3ifR5jM01Z5ifrXiDEe8=;
        b=Zf0nvziQV6bRRrdpsYxaXRweywurofa1DQB6VSvCUEHBMT1f9CsGM2ga/SOqNJxtfa
         mBr1ln8JmFneM0Kou9w6Lqybr2fcvSpnV3BKyFh30E0zxFvUcOU5zfIx6zpu8nIRe0q0
         k1nxzUVQVuUHcdORHOiZvX5qvR01jK6hclJ8WMr9EY4vYStnRI0MguAW2oIB47Adjbtk
         wXlwSJ2g+VvY6pAj+qqhAHAXnq5KmD7CbNlQFOaQKYUsDMbiJJMVKbSzNaeJ6HaJU3oQ
         2vOYP72reE52KdmtVMUNCtHAtXpPj+z43jBDtBBQw1+ynzf820nzv9uTRt9946C6Sy25
         3EEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789491845; x=1790096645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Q+R860tRKkGNSd01+QxlRg3ifR5jM01Z5ifrXiDEe8=;
        b=QOjKbimr+Dgqp9r7NEQCLTDma7at1jyczZAa7NgkpWL38r6wg5HEXGw3nI8kgpkBkd
         EBQbxR6PiHYj3ivmlUADOUG5/KFNUTsLiBAMkgCieImAuiClr5Xil4bjQlx+NjZD00Kb
         qY45SkNPVx9JIxUf37Mj11shZXNu52TZ5jzB+J2ASWhbCmXhiPoJxO99LTWL77Fc97UV
         vvFiE2tP7GdHWmfyzC6diS+pTPdzTDqhQSdxrkXjfas/WLTsP18jlH96Ka9v7yqSQKUy
         C2iYsr+IrURtyUsJ1rvw2UxcLWzqRiaj4y6fShc1FNHZ/LBBwbkE4HYWLJyjuGLv+oh9
         /GXg==
X-Forwarded-Encrypted: i=1; AKwUvByiutiGGzh/wKq1PUKUU7Yxjt0SeK+8DwtwloBcjWbv+DZnWV6gSy7o76ppuGM8GwcKkfC6INlX8H4JEKQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kcVCpuNtmGvLeJA1ZLc+YvAz3g4zN45x4Mpp1roYxxd7ROc6uE
	JJz7O5JulLTasKGCbxz3hOok8oIVhrS24oIp/FXdryUeqEk26SJrKlONiZFYIMsbF0VTE8FpBJL
	+iBYBZLaP4FzaVRmZPNNTXZmu+G/n9QfpR+IvsOee6QN5nESuq50K25r/zFvKkJzIBZ4=
X-Gm-Gg: AYBFou0jsO+aZF969YvmzaQsWpAWrg6iFdBmkIUQ2FOS9o3WxN10eXj3FWtkmIjKROy
	/GvfH0IpHEi2FFi5WiThl0miw7ZOYjeYROCKCjY7sATK7jouBdMkEHVCDCiVRCqrRN0cu/s/2Tq
	1uImTyUpKz3s1gtTBLSCPw1GDo3kk/8NexBY4ThZelngzcuMOZP265xvJ50gXqR9CRKcp8JV6X7
	JQAoYmbEe4Kj4xkKq/Yrb8nzDEb4YYOr6sFVyXZC2nOrIZisVXJcci4FvsDClx+AqS87C5Z+KFc
	u8etlwJFpBGK0X9xBdk/CjH3m5r8m74188VhhdHCAGOBCVy3E46FHCQMrSO/hhcgHkMCaNK2ilt
	sm25I2dEKgZAPlCXQMQBl4rw=
X-Received: by 2002:a05:620a:a190:20b0:93a:c10c:6b5a with SMTP id af79cd13be357-93ac10c6bc1mr186015885a.29.1789491844853;
        Tue, 15 Sep 2026 10:04:04 -0700 (PDT)
X-Received: by 2002:a05:620a:a190:20b0:93a:c10c:6b5a with SMTP id af79cd13be357-93ac10c6bc1mr186005785a.29.1789491844336;
        Tue, 15 Sep 2026 10:04:04 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27df9sm391286f8f.19.2026.09.15.10.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:04:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 19:03:47 +0200
Subject: [PATCH v4 3/7] dtc: dt-check-style: Handle continued lines in
 check_trailing_whitespace()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-b4-dts-style-checker-continued-lines-v4-3-5b8e09b11ef2@oss.qualcomm.com>
References: <20260915-b4-dts-style-checker-continued-lines-v4-0-5b8e09b11ef2@oss.qualcomm.com>
In-Reply-To: <20260915-b4-dts-style-checker-continued-lines-v4-0-5b8e09b11ef2@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3744;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=IH1W9IlOK+nkzbQ00GnaQXjHG0Qc0Siw6521Fcp0sS4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqqXp3uPtpiOEMYkPf056eEynOVIU1cWbac986d
 PsYYVwqUUuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaql6dwAKCRDBN2bmhouD
 16n5D/wIfBxhvYM/8kM0jTUXsZFRkvJOL241xfILXz77J/SRKbtckBOl00urgBrma4dq/JxnD0C
 PmCpKRquVrC7IT6j3d80sUOtCUCGgPwzIi9SKBt0pCYI9TJDnrLv+0230QkyeD4VplpU2BBXFqe
 GjRbKdQxqgYqh7uLB//n3bjQa4zLb9OV8nWqIvdDfRkxuZKiaUNv43v1ieEkWgWmZa0NhMTSewO
 r9tsY9CPcJO6aBiJBxwX1RANLNTlKIuQHw/sCuQM6KHF7/DRDC2mrwp+WYZsaayQPKUkV1IfiRe
 74XUk/bqFLTRH3hNhgFxt+aBMwi5aopHrcUiN4HQErrQB8yvD4ciTLqoT8IdqbM8iBEcuG18wWH
 G4mE80iE27Wi8T7jb5vCDHwpUsYXUTaf9Nkz+I/mGFHNT1TWEUrWkrRLIZ8WV0cos01mH7do5IE
 VwT3P+IvvUvnHtPygiVj9r4fdgY0Pd8ZjmMcEzecORRWgIa6z3LlzcTUv/oEmiaAXu8ghP1Po+J
 VNwkjPjCeTyCrFUcO3uIKsvuhP03/PXpaTK88L/JQ0GgrGsjOeexvp7BZjROtS9PwV+fpsl5nwn
 4rkSkrRDa4gQOODkd01dPFUs2dmWPIUX0JaBF+IrS5+/7+2LCv+WuIYzAGdC6i+Iuh9RQ3XbiS4
 GXU+Dn0tvySB62A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: CcmgdmG3YzyCmRglzngnospXxEK30gOU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI0OSBTYWx0ZWRfXxFl2pjvTulgU
 ZDRo5wzeSwFIN0mg2Mgp0aiyYAIgcIJi4LlPcyAiBNOWR7HmRxFO7qW+A/nMMVymgj0crFoldf2
 wjJ/L47d2BFuGiwqc78MtSRRbkXosJThE3ZrH+vDk7R23SM6XnYX5Grtr1eAh6+t8N1F6iNXP0R
 N6UrcBYBgPoESY70KmCrS01JtQS727Rrv/Cc4xcmoPlEZftOX+qAnr6vCzyOQ/7PuiPgPoySxNM
 93A2pOKhLiKFu5KGG/W/8YKc0tNMfug9uWcAv2fjnzkOyFPO93yb2aWrTRlcRMLnrPR58NT4TeI
 2qAkU873E6U+s3clsDrtHMIfCFY6xR9AkkOVhIj3X1foj4VAyiqVDm53m70uX8ihpVpHRUiJhtU
 DQpQiGgNnRuktKSiKbuZUFjcqx7z6s7wAS4Qg2z9WXOCFA/kdcKAoZ+X5Pt35TZ0CZRV0mXpYEj
 ZU5aSo5ty70MJ1yBdYQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI0OSBTYWx0ZWRfX5MttphrFG81r
 FTZ/WEdZAnSsSYZvsNgIgdXTSOPzmfNczVFf6t4yR5hCQjxRhVbD9xScYj2bNxaD4JJw7ZaLOPm
 6mN/29o2m/P3ALOFx/DOIADv0X2I+ps=
X-Proofpoint-GUID: CcmgdmG3YzyCmRglzngnospXxEK30gOU
X-Authority-Analysis: v=2.4 cv=IcISymqa c=1 sm=1 tr=0 ts=6aa97a8a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=n0VsRDhmN3h0bdBGaSQA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150249

Continued lines are not separate DtsLine items in ctx.lines, so they
need own iteration.  Rule for trailing white-space is applicable to
continued values as well.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                                     | 10 ++++++++--
 scripts/dtc/dt-style-selftest/bad/dts-trailing-ws.dts          |  8 ++++++++
 scripts/dtc/dt-style-selftest/bad/yaml-trailing-ws.yaml        |  5 ++++-
 scripts/dtc/dt-style-selftest/expected/dts-trailing-ws.dts.txt |  1 +
 .../dtc/dt-style-selftest/expected/yaml-trailing-ws.yaml.txt   |  2 ++
 5 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 525d9df6c11b..4ac10cb45068 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -976,10 +976,16 @@ def check_tab_in_yaml_example(ctx):
                 yield (cont.lineno, 'tab character not allowed in DTS example')
 
 
+def _check_trailing_whitespace(dl):
+    if dl.raw != dl.raw.rstrip():
+        yield (dl.lineno, 'trailing whitespace')
+
+
 def check_trailing_whitespace(ctx):
     for dl in ctx.lines:
-        if dl.raw != dl.raw.rstrip():
-            yield (dl.lineno, 'trailing whitespace')
+        yield from _check_trailing_whitespace(dl)
+        for cont in dl.continuations:
+            yield from _check_trailing_whitespace(cont)
 
 
 def check_unclosed_block_comment(ctx):
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-trailing-ws.dts b/scripts/dtc/dt-style-selftest/bad/dts-trailing-ws.dts
index 1eb24d91c640..73c24525ce18 100644
--- a/scripts/dtc/dt-style-selftest/bad/dts-trailing-ws.dts
+++ b/scripts/dtc/dt-style-selftest/bad/dts-trailing-ws.dts
@@ -5,4 +5,12 @@ / {
 	compatible = "example,test-board";  
 	#address-cells = <1>;
 	#size-cells = <1>;
+
+	interrupt-controller@10000 {
+		compatible = "example,intc";
+		reg = <0x10000 0x1000>;
+		clocks = <1 2 3>,
+			 <4 5 6>,  
+			 <7 8 9>;
+	};
 };
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-trailing-ws.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-trailing-ws.yaml
index f338c14174e6..17eeed3411c6 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-trailing-ws.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-trailing-ws.yaml
@@ -25,5 +25,8 @@ examples:
   - |
     device@1000 {
         compatible = "example,test-trailing";  
-        reg = <0x1000 0x100>;
+        reg = <0x1000 0x100>,
+              <0x2000 0x100>, 
+              <0x3000 
+               0x100>;
     };
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-trailing-ws.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-trailing-ws.dts.txt
index 94d9ae9d616c..a15a7d637c30 100644
--- a/scripts/dtc/dt-style-selftest/expected/dts-trailing-ws.dts.txt
+++ b/scripts/dtc/dt-style-selftest/expected/dts-trailing-ws.dts.txt
@@ -1,2 +1,3 @@
 # mode=relaxed
 bad/dts-trailing-ws.dts:5: [trailing-whitespace] trailing whitespace
+bad/dts-trailing-ws.dts:13: [trailing-whitespace] trailing whitespace
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-trailing-ws.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-trailing-ws.yaml.txt
index cfdbc8476c73..4f2ec9572bc6 100644
--- a/scripts/dtc/dt-style-selftest/expected/yaml-trailing-ws.yaml.txt
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-trailing-ws.yaml.txt
@@ -1,2 +1,4 @@
 # mode=relaxed
 bad/yaml-trailing-ws.yaml:27: example 0 [trailing-whitespace] trailing whitespace
+bad/yaml-trailing-ws.yaml:29: example 0 [trailing-whitespace] trailing whitespace
+bad/yaml-trailing-ws.yaml:30: example 0 [trailing-whitespace] trailing whitespace

-- 
2.53.0

