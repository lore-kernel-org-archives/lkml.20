Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907977;
	b=dqPqFp6OChrimx2kMmMk/7CFK80Finsuguoh1IGYT4JIgXZwVK/SYPZsRBFiW1IuDokx
	 DGB99aXmhzNr9aqMdLWgMkBIyq9FyrLdvNbG4cMPop3vEmuu3gXWuUV23YcfWbCbXIMja
	 ckhgSGYN7pjC12oIlUVIU9uE751ROxLcjkTsFNch2dLB3a0jiN2WDb2TtSnwjBmKwUHXK
	 x34KkjCRLBgZoGg/ibq0IkqiFPxzSyR27bPaz6Up++RQYjHNEFj13NTUhqTPaI9YTG1/6
	 e8lqJ59Ev9w21jPNEtOXCSYNcQFpk4TrTiKuPr6efnF4lqbYl63YxXBXDKeCncXLNcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907977;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3BFnUHcE/+pbpFcfNMGE+vFXRnYLIh629ZomjR+Ujwk=;
	b=mLE2ZPXZMgZFVyLD6qndakRzKI1oQeK2MbtRaEkRvpUvhX7OZTP81nunE0jrqwrS/Ij0
	 5M2IGwXz13LWa2gHifXQeS3lrEhDU/MUQRYwBr08wjexy/Jh2mlSXXZR2EaRBaUSLab7A
	 ekCgsBSX25xe/k00IRal2IFPSdeM6eK2Agvq54Oc7EK97MGlhWi4O+a/IWD0t4trRXMbm
	 XrWLqd+9lk2q4wFrr/kz7oseyYe+am3JOSus7AKgNDOnoaXtdu5OMkVjz9RTxvPFI0lY/
	 +yyQJMBvc5CQw+YtdIOPyhZSy4vfjFMpHeHfLtUqXdUUEsTtbQbiw8TExdaV8JL2n9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AmeU8GTg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="QrZf/H5t";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266FC607113B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 266FC607113B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AmeU8GTg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QrZf/H5t
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5JLEhj751780
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 19:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3BFnUHcE/+pbpFcfNMGE+vFXRnYLIh629Zo
	mjR+Ujwk=; b=AmeU8GTgDBwiWMN4/T6A+Dyxv8IvBJZNTHbYFRpjZ0iUxpLoTry
	iYDQJARx+xLyFlr1cMwf/1d6h/ecXd8dYo5LHQ2LUchNhlMV+uUx+6NMKK/DEGFt
	wnqY72zlKu2mJhwP1xT/LY0eJsiHvTjCCPDnaQSRmf+C0TwOLjPFI88d9RINzUA4
	NWMZRH59hbmmSddTDfX7mXK+gfs2TSbZfOONFAkVgHTGBFNRQ7exj3zsfJgDcIZj
	wJ5eimlQN3NpajwbHzly9WkySv5V5CsjDseBs2vUHow2JdkBIJta/viT/JHds02y
	tlSxSTkKZXHjGsPvhB4pVymO/j0CCCrKS8Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hryvp833h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 19:46:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9441113670dso510003585a.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793907975; x=1794512775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3BFnUHcE/+pbpFcfNMGE+vFXRnYLIh629ZomjR+Ujwk=;
        b=QrZf/H5tIzT3hY67++JUZAsJkoAiBRCSnRqvUizLKYRWaE7qvKlGBvYVCDwplreE9d
         vHmA7cLiTMIbwtWEQwjYrAJojoEKMRI6mR9sag9vN1oB3fLhUV0LHEaP/ghXXA3DCurc
         PbQPcwF6UX7ChB7eLcGyW5Ir84wZujJfV14b1LibKxNi2RAoXCN7T904K390sc6jLsxc
         HnAkuY7h2xIzkf8vLkfFEJVXzd0IQ3yeEX3gpA0p/MCnEXApO80yYqISvJj3/T4qniv2
         Uz4UuMNl1WB22zWxyTUX+pQ22ilCagFtKBzV4/2OEjh5ieSFEDnPHL6hq/YVpa4b6/IW
         IMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907975; x=1794512775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3BFnUHcE/+pbpFcfNMGE+vFXRnYLIh629ZomjR+Ujwk=;
        b=Qg2E+a8HnCq4or0PbjXlB1K76QUwIQD9embXU6tfl3ZKBohy6eLPcBOxb0ig+1hQ5q
         XmnAgbi5Jl+hXBu3JzifouDKBqWw3Priy54pc0dLya7yVQQvv8R1mh5vmQiDlA4rv2Gu
         6ZlWcsghjcFES0qrySkixPj0VauP+FOtBHvLuXTfvf66TMswsILYbEHXrgjAXwEIEEuJ
         R3HZT6k+S9Q++Ld4sHxXWKxJsLrF8U2SmdT1HJk/piskKyQWaKmxX9Vgf9x1L5s6Sp7c
         Y7j8ECuCNxMLwybgwi8h17ebbrpXRQqCxfWUqbXQoNBQLLM01pxadEX0nUQ9M/v6qPyp
         kiMw==
X-Forwarded-Encrypted: i=1; AKwUvBxHWa7l7HlYCAVTZSE4TRCVbPHuAssoEsJ1R8bkkjGB67A0JWXDbgZKv1dNgAy/P29UIS649aDMT8fauhI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aN0rVxKP0+mZCCJnIcgqPUrRunn5C+68ZxQTzDWBmG9/FUMyh
	WfAJacDBkaqFQKlIvdXMN99bX1NG61+t738h6TOMAFzwNyCFCG3T/78udICPp7fx2Lj0yGDfppT
	f3mQ97ufPDWYTs2f9CwTQrQ1XPwVlQzMQD/duXp+995OGsTGHZlBqBmJEmfz8GFzxXdY=
X-Gm-Gg: AYBFou2RRcJYQSBC9H58KvWSSoHCMKWeF1W7caM9gwsDsJjaK970StRP+6s0gl++yQc
	PqlAuLVFJk2ddfF2uhWvM0lt/XSH2zzseKdntR2sJYioZALWyqB9MQoywOZkla5z4a9BLCw7PJC
	XWLOWrpFSeLMjWIwtAjoPdhF5wnNVFJDcMvbZEyGCuPJCwlghiN4VOmPaYzFOW8FDZ2VihEB7C4
	/WZA4g5jECETepf6XeC5olK2GFwGPlE3GHdUZGAwifymyEGoffQPwsmod2ExymfYIxBfrH6/bA4
	UFDjrnk2bRHpEh0LszzSPADBTBEZyQo6vUP5n3XSXLSilcNxKvWHV6zJHvTlHs63kaCyTOqVbhX
	Y90vs7ZGYL/b8Xs24eLncFVxLeX2DKtfI25zuwc8BKHwIB7ejZoeZk7huBLR1Sg==
X-Received: by 2002:a05:620a:2702:b0:944:2e2e:69cc with SMTP id af79cd13be357-945f34ce97fmr20080485a.49.1793907975241;
        Thu, 05 Nov 2026 11:46:15 -0800 (PST)
X-Received: by 2002:a05:620a:2702:b0:944:2e2e:69cc with SMTP id af79cd13be357-945f34ce97fmr20076685a.49.1793907974812;
        Thu, 05 Nov 2026 11:46:14 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e58fcb8sm82495855e9.1.2026.11.05.11.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:46:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Ilia Lin <ilia.lin@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: cpufreq: qcom-cpufreq-nvmem: Simplify bindings
Date: Thu,  5 Nov 2026 20:46:07 +0100
Message-ID: <20261105194606.772346-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3795; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=ei0/JnfNAAX2qJbDNn+6Uyh3n+06uKHSrrdp7G2A7ew=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq7Nz+q/+5a2h/Vy/JzzACmTB3XbMLDFW+T0Sk/
 hhFR3jvxXeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauzc/gAKCRDBN2bmhouD
 1wPgD/9N3au9Ru4qEGpuVNiEQ38tGsbqeiHc5J+W2pHu7VmvW66WRXXhxknNTTQeguVW1hZBea5
 ksi04j56hZ7dZXSA7q6+LP9ZvikzypImgq+GMVxm+t3nY4FlJEcOg7/95DLLbaAknbxtd6AhYld
 S7RujdhKRyul5vmnj2pxn7fKuXjl6ePoaKQWmGsyohZwMsKLEKuecfdcOTW79wN8hiFszw3OKtw
 RFR6ymuACaIK687aWKaBI+CvYLISj02Lyb6c7UZ4u/i0GJQ1YuN3aoM0b2nbpIBAZgHvCd1nYY8
 TjpZgXL0ioplBAw9xHWqT6DNwbdDvKOnpmpRWJqAF1x2r2kGtsvxtN+sb0saGZ/pyEtYg4F8OpG
 wJcu8Mhf5XGgc2BCPWPgJ+6iYVlQJPrVxiaTyrVJcD9vADPd6tInshRQYU5sHkq5jD9IalQKYWJ
 XNd1tjf/TM8cT2RKH9n8tHc87CehvG54Buf5sXF7FUX5N0YMof8MnMdeK0xy+OTiRY2An58ToC0
 me7gwJc2JQohRBHxirG4Gt6PpeiPsvVXFtX+hKQsa+4ovmNO0Vni7MgwehKbgDa4zdAvCg8khvL
 tnT4oh8HFFcQZTlYb4K/Qp/9FaBsJf5cjdsk0TTHCckcxhatEXLR9e+tL9Ymb+3JFoxDuW0yUP1 1860SmvyRqfz7Bg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ib4Symqa c=1 sm=1 tr=0 ts=6aecdd08 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=hpx_vC1UKZy5HMHMfZkA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Q7zNC29HmYNTjN1CYlu_H7__nU7vPoFr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfX3ulzU6fR32AU
 WowFp/P5HVbFLkCCTxMuHjy90SRlkBTzIhWlh9xIthm8Wo2ocLp0lzy5jlGWmZQAxAQHmWValMT
 oFPVYjEX4E+dqvmWUFm8nTpaTAn7TZ9qnQzmnovqQpNK10hTqedFmm1pJatR5cNXkif8hiZk/UK
 bnbRWcacFdXN6YuTygN3i/viZ7M8R/pXPTQktyhhAPCwHsr353pDAEqqvRS/CptzUNCFyETqltJ
 RdpmMWXtT5GP6NkgjKGC1jkD5brm5JSGp/v+DdL0aXundutduU4Klt/TJdEJJrGYgrisAmtrFC8
 +UowyCqNpNkqEGcJ1kB9NtDXWOfcVn+L2gI9elkrRhGCdpiPXUzXGxV7ur2rRhveWeNn+GesXcb
 /4q3olG7KWd/RrM36UPD1UMv+JAW6XBSIlkfvpye6JOIFxQxKRjcImVO+T//Q8uP4QH1wwpRtOC
 Od9Gn8hIcXAsTfeWe8w==
X-Proofpoint-ORIG-GUID: Q7zNC29HmYNTjN1CYlu_H7__nU7vPoFr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfX/g7JMGX6TrrO
 eHrXmTsQwU1BxIedADdIy2kJb41kqvN/2vzNjyCmFgyENgHb4uzUR7reoc7Gg3kBVRS17CwEjUG
 f4xnYVDTeXxD7xdCbpzoq6X84AbdTjk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050078

This binding selects a few top-level compatible machines, but since
commit 389de9c5a677 ("dt-bindings: cpufreq: qcom-cpufreq-nvmem: make cpr
bindings optional") only qcom,qcs404 is present in  "if:then:" clause
which enforces specific OPP properties.

For all other machines, this is a no-op, because there is no schema here
enforcing a specific compatible for OPP nodes or any of OPP table
properties: one can switch to standard OPP table (operating-points-v2)
and this binding will not complain.

OTOH, this binding has complicated "if:then:" blocks so is not easy to
maintain and causes false positives when regular OPP table is
encountered in matched machines.

Drop all machines except QCS404 and move the subschema to top-level.

Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/cpufreq/qcom-cpufreq-nvmem.yaml  | 78 ++++++-------------
 1 file changed, 24 insertions(+), 54 deletions(-)

diff --git a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
index 547265b8b118..dfc7a27a7bdd 100644
--- a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
@@ -25,22 +25,30 @@ select:
     compatible:
       contains:
         enum:
-          - qcom,apq8064
-          - qcom,apq8096
-          - qcom,ipq5332
-          - qcom,ipq6018
-          - qcom,ipq8064
-          - qcom,ipq8074
-          - qcom,ipq9574
-          - qcom,msm8909
-          - qcom,msm8939
-          - qcom,msm8960
-          - qcom,msm8974
-          - qcom,msm8996
           - qcom,qcs404
   required:
     - compatible
 
+properties:
+  cpus:
+    type: object
+
+    patternProperties:
+      '^cpu@[0-9a-f]+$':
+        type: object
+
+        properties:
+          power-domains:
+            maxItems: 1
+
+          power-domain-names:
+            items:
+              - const: cpr
+
+        required:
+          - power-domains
+          - power-domain-names
+
 patternProperties:
   '^opp-table(-[a-z0-9]+)?$':
     allOf:
@@ -48,10 +56,13 @@ patternProperties:
           properties:
             compatible:
               enum:
-                - operating-points-v2-krait-cpu
                 - operating-points-v2-kryo-cpu
         then:
           $ref: /schemas/opp/opp-v2-kryo-cpu.yaml#
+          patternProperties:
+            '^opp-?[0-9]+$':
+              required:
+                - required-opps
 
       - if:
           properties:
@@ -62,47 +73,6 @@ patternProperties:
 
     unevaluatedProperties: false
 
-allOf:
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,qcs404
-
-    then:
-      properties:
-        cpus:
-          type: object
-
-          patternProperties:
-            '^cpu@[0-9a-f]+$':
-              type: object
-
-              properties:
-                power-domains:
-                  maxItems: 1
-
-                power-domain-names:
-                  items:
-                    - const: cpr
-
-              required:
-                - power-domains
-                - power-domain-names
-
-      patternProperties:
-        '^opp-table(-[a-z0-9]+)?$':
-          if:
-            properties:
-              compatible:
-                const: operating-points-v2-kryo-cpu
-          then:
-            patternProperties:
-              '^opp-?[0-9]+$':
-                required:
-                  - required-opps
-
 additionalProperties: true
 
 examples:
-- 
2.53.0

