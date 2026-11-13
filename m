Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585380;
	b=5H0+QbZHW692PJbGzIVtlk6JHDWDR0tK8G0eV6GCxObCQ3/vP759NwIZsI0PQ7w7fUNd
	 GBj7vUPuJRHDBBo8jRiApfiwAe6F2I1KJY1qUo8Etvh3N/uQKDwc7xsIp4EoY0uf0qdbS
	 J2ckJ+mhnXOOc4G3FY+54lf/C2tRwDXAhAzeN4VRpXvTRkCv4SERT+qrrCsse4Y1Uq3Ij
	 8p+abDGIn+DNAUC6gxmLD+l+xlruZVW3uTIBEyueyJXPr/mdUpnNV2+E3I/n25u/VHgEt
	 W0gtUE7tRsEOQDWGVWlYbK1YTh/Y/1VoeWZxmaGOC7N16LV6+LKFnuwCqUWvHU5pwxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585380;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=essLqwzEoNtV95IkKs+aOj/xFoD0x8dpazOkHhZwxBY=;
	b=MkyHAxH1G5ez2zrRLB1LaN1zWjGXMYHFOuo6S6Y4dpS5K+6zDLAaLxj62GDSegfdJ4n2
	 VUVtaT3nP/De2kJfb6N5uXic7ukTZ1B8vDzHy6a+7o/6Wb6UUdk9h64yLzhs6Evh8IiOP
	 39CZ1hJkMSvgM812U9Qa+wh1kSjCtJgVuAGJE3Nj+V2WuH00Q9hsExCqXLWNTLSfkyex5
	 5XeIWSGuv2blRL5B3o6XjXaEX+twcRHEpgvzZ+BAULxH/G4/e9n6V9Lw8u4SfKZA19Chy
	 PJmS0txrEBiCXF5MzMhqT2x50SsCyzAx0+fS6N4qZ2yOBTXgFyYNfSmBX4ZWvMJxERg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=mqVWNCoz;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5474606D459;
	Fri, 13 Nov 2026 15:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5474606D459
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=mqVWNCoz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=essLqwzEoNtV95IkKs+aOj/xFoD0x8dpaz
	OkHhZwxBY=; b=mqVWNCozBlCM47oPrKc4mgf0uq0KPu9dKRxGZWVZxh8w4Xa1kM
	GN0bwTQTu14SqqOTQxd9pvhO72dAMvYsb2dRSsZZl+Ce5q7vVB27R3AlLlU1cYZE
	cLtj+62PVN2NvSDfuf4epOqeMpNB4yiaiG3N4GoY7Geg7UCx+ei1Ov60U=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.188.15])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgC3KS4WM_dqbQ66AA--.937S3;
	Fri, 13 Nov 2026 23:56:07 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>
Subject: [PATCH 1/3] dt-bindings: display: msm: mdss-common: describe additional block resets
Date: Fri, 13 Nov 2026 23:56:04 +0800
Message-ID: <20261113155606.1677313-2-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113155606.1677313-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261113155606.1677313-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:3pYKCgC3KS4WM_dqbQ66AA--.937S3
X-Coremail-Antispam: 1UD129KBjvJXoW7WFyDAw1fWw1DJF1fAw15twb_yoW8CF4Upa
	s7CFsrX3W0gFyag3ykWa48urW3XF9Yy3W5uFsIvw17ta1UAw4Fqw43Kr1qqF4UAFWxZayr
	uF4xuayYvFyvyr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBSb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIE
	c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
	8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCF
	s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20x
	vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
	3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
	AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxU2k9NUUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/

Some platforms provide more than one reset for the MDSS hardware block:
beside the MDSS core reset, the SM8750 display clock controller also
exposes a block reset for the MDSS core INT2 interrupt controller.

Allow the resets property to list one or two resets, keeping the MDSS
core reset as the first entry so that existing device trees describing
a single reset remain valid.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 .../devicetree/bindings/display/msm/mdss-common.yaml          | 4 +++-
 .../devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml     | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
index c6305a6e03..51ef4cc74e 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
@@ -84,8 +84,10 @@ properties:
           - const: cpu-cfg
 
   resets:
+    minItems: 1
     items:
-      - description: MDSS_CORE reset
+      - description: MDSS core reset
+      - description: MDSS core INT2 interrupt controller reset
 
   memory-region:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
index 46dc0d28da..729de45ec8 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
@@ -101,7 +101,8 @@ examples:
             interconnect-names = "mdp0-mem",
                                  "cpu-cfg";
 
-            resets = <&disp_cc_mdss_core_bcr>;
+            resets = <&disp_cc_mdss_core_bcr>,
+                     <&disp_cc_mdss_core_int2_bcr>;
 
             power-domains = <&mdss_gdsc>;
 
-- 
2.53.0

