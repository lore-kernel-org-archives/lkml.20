Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233DE402422
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491844; cv=none; b=PF1snJCWBqNB8nt/+U9uhWFrSuuJeMspPf5VNdnqQ6hlvBj3HPB13PYeuhOU3nP19dGroRcROOSKFo0lmbCVR343QALQTuZJBpiXcmO2eXl1R/KFG4mfeohWjGXFVSuEdaWg/nuAUvqPnEJq5hM4ZFRByprhB4/mdUV6LvyAfhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491844; c=relaxed/simple;
	bh=w3zTKteM9+dXP6ekYmOuIUo7NZB4TZ5SyaeehZjbXRc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mt0s1H3oY/ZZGX5NhDrioi/69L/Tp1+DIxSDhoSeslvfr+bb77EeLx4K+TjQ57Dfb3fIREA94Sf+YF91RgQ6oaxMb5MWyMdrlAD5DBRqTeMrAw3P590E9QxcWDfw9gKUpBYi0zwYDCtl8FoFzsAFJvD6RWrGqgMcIYuVxzLcvNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hY4VMplV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f5MGWl0/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hY4VMplV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f5MGWl0/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAX3F291063
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:04:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nUHktJGTHh8bAwUtVbzFPaSsYpwxlbXpnYldJaXVb2g=; b=hY4VMplVo0qbPKHH
	O6jCP9DDDJp+Wn36K6xBsaX6R7eSrekgd8s38bMdd2gCv06RU6pqNnuyXyEODxEu
	nRzl2smvVEcNRUfcmQvobZXBTjxV7w/JkDs16I9m0wA8FVCsr/0uTjQno4L1RiGV
	yWwEt69zxJFP86s5n8FcHJVtJlzjhuXobfn6Ue/VTSGWMcwSZoMdE9dYc8UIBtl6
	yda9gAajV115d6V0x7fcWSbVctty9DdrriVyk0yPHrvEy2062j5aqrY0gyLZccBu
	tAPoNCRsBuMOcWr+dB8s1HNNmulwy4xFIEpyvGudptVVwR7sjvawZbFkc3e1FlIL
	64b3dQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyux33f9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:04:01 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c82c2e9761so1316792e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789491841; x=1790096641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nUHktJGTHh8bAwUtVbzFPaSsYpwxlbXpnYldJaXVb2g=;
        b=f5MGWl0/gFhwaJIzcX+EsNMF/iVG4vG8zyzaAkhAjBRCm2zPUg/9NVNGm463ubhCXJ
         XM49CZog/HfxgyuPP2zxltWugDChnTVAX4XhvBdvDO0M6SQVnYv2xscstdUVDP1r3GTl
         gya6mpzKgRTlKYxrBlcPziCA6Ek8h04ux7pAa9fQOESB8wwZ0rcz7hrRGecZ/KPtKGVl
         O/96MGIt2r+b9a1V+/yBLtU2rHJmgyGYSNL5Rn3PuzAPTuU3BGcNuPfVoAga7b+wX1fF
         cC2qIi9IpbihTZ2U8VYwKQVDw1GVET+FnevyPw4eZ+AiPnoHzDUu3d0D1USKzbQ5kxfx
         GUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789491841; x=1790096641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nUHktJGTHh8bAwUtVbzFPaSsYpwxlbXpnYldJaXVb2g=;
        b=VN67rxOaxsesfIXLIYVZooJHaKhJYyZkTGQIcmnewAhm3HuT+9PdFf+GDFoorY/nyW
         EgZZ5GSZlLrlAU3czyQ3un3pWXLxFOu3iutCQIGHv1owYhue8SYvcnrHqspicBHgYueo
         XWGNft1kwTnU/eiXeHJ1A8+StLNU+8IJaGNLm5zYBn5SOxVIGvb7hHwO5s+7njkqvmh8
         tdzwlXvVWZCSYwO8QQrowdurUYcdVmSdJgg3GOVxRmYLDUQAo1J8hbpd/4+S80NUtNIU
         NjAG6OBzigyfQSs8OYlnhS96EYcGtp+8FNCltVlZQ+IX7qnE4YaCC1x2F05Xruw68v/L
         WEGw==
X-Forwarded-Encrypted: i=1; AKwUvBys8RzUmjTBzvV4xJNs4C6HnKnLKY0S/EAGwGms6W+fIGXmXZHU1mUSCamGYgNa9UaiC4asYEna1Q6OKno=@vger.kernel.org
X-Gm-Message-State: AFuF++ln5MTukKfS9voTpmKW1jSZn0LBLLqsf2H8fdg4gyrchw3bLBNf
	A/bVS6rLyJAPophpV+0zIOe/Ift+wx48aiPfAuKwpp73zedV8ZrxU3ByCXaGdU5biAM6bMMesLm
	L4nH7Wp7kumeb8cYoMRId3ZMg426dnZocUjOUW831E13s4Cxrvco/OoLLFqndkXk+6wQ=
X-Gm-Gg: AYBFou2TiKa2jcW+G/5Hf6Ee+a47kUK8lyaPMdchHuL0chX+OXDHMz6YMClZyv+MGbs
	nYJxK0oaYHxbg7UWhWtICViB5OdHeAMwJlf2a/6u4Bat60HkqjWmqydjZfGI9C9x3BE2GZvsWqp
	hG5EHBQv05Sr8eKBqR/rMxZ8biyal+mu1kRnK5Q+htfiadxOXOStMaZFSOJ5XXeve45spgAP2/M
	SDy9Lmc13/Z1RLxmlWaxnxcm1+DMBAN0779wQhOr64DuUI40IDKqYjptS0PJm9W1owR2vZBWJsO
	UfPj9D8fbmVMVzAlcvDpY+9q1tR7ku9/VGx4ZCwgq8F0BsvFDKvOSYt1djd3VTtnYBJBxXMvaJM
	8r5iVDEcStMaKHWHETPaBR8o=
X-Received: by 2002:a05:6122:d21:b0:5c8:2dc9:f8d2 with SMTP id 71dfb90a1353d-5c981898b18mr12591368e0c.0.1789491840875;
        Tue, 15 Sep 2026 10:04:00 -0700 (PDT)
X-Received: by 2002:a05:6122:d21:b0:5c8:2dc9:f8d2 with SMTP id 71dfb90a1353d-5c981898b18mr12591260e0c.0.1789491840453;
        Tue, 15 Sep 2026 10:04:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27df9sm391286f8f.19.2026.09.15.10.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:03:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 19:03:45 +0200
Subject: [PATCH v4 1/7] dtc: dt-check-style: Handle continued lines in
 check_hex_case()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-b4-dts-style-checker-continued-lines-v4-1-5b8e09b11ef2@oss.qualcomm.com>
References: <20260915-b4-dts-style-checker-continued-lines-v4-0-5b8e09b11ef2@oss.qualcomm.com>
In-Reply-To: <20260915-b4-dts-style-checker-continued-lines-v4-0-5b8e09b11ef2@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3317;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=w3zTKteM9+dXP6ekYmOuIUo7NZB4TZ5SyaeehZjbXRc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqqXp2c+qFIDZzEzr6deLeF+TnkVbedSeoB77Ag
 FeLpozrm6uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaql6dgAKCRDBN2bmhouD
 1/JPD/4uJKpDQhsUfOFzY4TwpDLEWMi5UtiohBi3nqgaDFo6WtMuA8CDpqW+dLQA2w4dnIoHqCu
 74YtcbQTu2DwTy+9gNquIhnbcfVqIjAC/MnprReZ2Uih8PbszD0qrrepXXu1yD9N6IMqGNa9URd
 Tq64kPlekBYcTIXjtDDGRDg+x0qAN0Hc4JrAM/ZB68jB7OM7L4ne+++FXy5U3uFdKwvYm4IYJlT
 CpgXAM1wduDXxnImdZDRwzWpjauSk1h8ZeUevylbi9lSpIIM/XR6Z6sPlL2yyEOJZ7dpcfLTvLA
 SsCxDy0dObu4gkDFDuEule4aVLMc1v/nNrVIo7soUjUIcqiF9I3N+i626OwmfUPCZBO/fveFARd
 zjSnxsreMfbRJolPH+s603p/Zy+SPcBiHM51WoQUkipCEjDaDqyxvgWJ1QlBYTyN1r1NFAYslSW
 F14zNNr+ESlUjjwu3mvxylNID49Ji+v8WNSE2YhNdF7tP1kQbVD5C2Uo4ZNUjgb/JXcotwOXgMr
 y+/7ASrCvsf3nUuRlDXi9C09DtdF6NWeN9ACp/ec/N8iqGRAzYmYp48THd2DHPfLaakZXwgmI5U
 1fqCwXKO/Lk6pF+pL7YLdnW+KkNvVx5ROuJvHmOcCYyJrddomL9BSovh9gvuD675MByLwZZWqSw
 xbLcXcCYGATVP3Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI0OSBTYWx0ZWRfX1YLLHUuuI9Bh
 1e7wHnckXuiWB91yv0UNvQ9q/b4FWfMtDtSFAnCuT+RmOf5zPJg2zJOzVT2YCy08H4KLUZc6EVn
 y3sscJ5+Z4hEPakCL5zxcfA1qviHVY2E96p7NE2xAOW+SfEW7RolNysRJP1fCYdlBk8y37Jb168
 JzYCbUMIbnqxiTV1yeKWGD1eiVl9KbTqAA54SFTBfqnEOs9uahYsHLbhzuh2LvsC3RAA1PyEs3e
 yccq2kmGpZ65b0RmLW+nsMnSaoMw6/7SK5Pvq1FWdc4l4yeJ2rmzha9eltwghrOkDTBf/Gp/uMf
 mW650jziQ6XDacJxOQ3ELu8LPoMftEfCZx64MYbjjIWqf2CAln/LtHVJOxIXHvvYtaoVLLJv6t7
 g5BlBtpxfDrVmw46/n24wY+ZdFWw4EpGzcmy2ekECNl9+TX4eWBdQE4nyMLnLebKTmdBLov+/2L
 3L3hthGTnP5PH0JLwig==
X-Proofpoint-ORIG-GUID: MbqdKoOWdL92zvyae1l0QuHRk__C4GRQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI0OSBTYWx0ZWRfX+cGhuQKhaTQf
 ODvv/4Fr1cWtQMO0Ue+wx1x89WyqYvu3eyPxMKqlk5XBnPXN79TxbI2UTw1ALBRhvgoJtaUMc6V
 X5p26I0iK5LAGiFTiGrbXk5ma0JoN88=
X-Proofpoint-GUID: MbqdKoOWdL92zvyae1l0QuHRk__C4GRQ
X-Authority-Analysis: v=2.4 cv=QYLzLcbv c=1 sm=1 tr=0 ts=6aa97a81 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=SU40fdrgiSb2mxkwluUA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150249

Continued lines are not separate DtsLine items in ctx.lines, so they
need own iteration.  Rule for hex case is applicable to continued values
as well.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                         | 24 ++++++++++++++--------
 .../dtc/dt-style-selftest/bad/yaml-hex-case.yaml   |  5 ++++-
 .../expected/yaml-hex-case.yaml.txt                |  2 ++
 3 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 0ebbe658b893..2d0463c626e5 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -547,18 +547,24 @@ def check_continuation_alignment(ctx):
             dl_value_complete = cont.stripped.endswith('",') or cont.stripped.endswith('>,')
 
 
+def _check_hex_case(dl):
+    if dl.linetype in (LineType.BLANK, LineType.COMMENT,
+                        LineType.COMMENT_START, LineType.COMMENT_BODY,
+                        LineType.COMMENT_END, LineType.PREPROCESSOR):
+        return
+    for m in re.finditer(r'\b0[xX][0-9a-fA-F]+\b', dl.code):
+        lit = m.group(0)
+        if any(c.isupper() for c in lit[2:]) or lit[1] == 'X':
+            yield (dl.lineno,
+                    'hex literal %r must be lowercase' % lit)
+
+
 def check_hex_case(ctx):
     """Hex literals (0xN) must use lowercase digits and prefix."""
     for dl in ctx.lines:
-        if dl.linetype in (LineType.BLANK, LineType.COMMENT,
-                           LineType.COMMENT_START, LineType.COMMENT_BODY,
-                           LineType.COMMENT_END, LineType.PREPROCESSOR):
-            continue
-        for m in re.finditer(r'\b0[xX][0-9a-fA-F]+\b', dl.code):
-            lit = m.group(0)
-            if any(c.isupper() for c in lit[2:]) or lit[1] == 'X':
-                yield (dl.lineno,
-                       'hex literal %r must be lowercase' % lit)
+        yield from _check_hex_case(dl)
+        for cont in dl.continuations:
+            yield from _check_hex_case(cont)
 
 
 def check_indent_consistent(ctx):
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-hex-case.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-hex-case.yaml
index c55359a4ca68..b0b8683b883a 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-hex-case.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-hex-case.yaml
@@ -25,5 +25,8 @@ examples:
   - |
     foo@1000 {
         compatible = "example,test-hex-case";
-        reg = <0xABCD 0x100>;
+        reg = <0xABCD 0x100>,
+              <0x2BCD 0x100>,
+              <0x3BCD
+               0x100>;
     };
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-hex-case.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-hex-case.yaml.txt
index 6600f7cd1ba5..f42490256939 100644
--- a/scripts/dtc/dt-style-selftest/expected/yaml-hex-case.yaml.txt
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-hex-case.yaml.txt
@@ -1,2 +1,4 @@
 # mode=strict
 bad/yaml-hex-case.yaml:28: example 0 [hex-case] hex literal '0xABCD' must be lowercase
+bad/yaml-hex-case.yaml:29: example 0 [hex-case] hex literal '0x2BCD' must be lowercase
+bad/yaml-hex-case.yaml:30: example 0 [hex-case] hex literal '0x3BCD' must be lowercase

-- 
2.53.0

