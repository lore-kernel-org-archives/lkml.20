Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558990;
	b=MrCgiCQVNAvnpYJBlMIMkQDmtaJCzhn00/aCrkDxr9F4kd1tZU3dMdWlNTjgoiI5SLt7
	 4/RlXDf50ExohcxSHexbAz1xWrwHxualWisO/Lpi5V5gvFHu0nQkkegFAxlXOtQgzPvuv
	 4JcFcYoajj+DD1/ZF8Sl805sur8tmTWelLDZDca2cb7aLFAJfJ255GSYpFOvHIwkDs4s4
	 wAPJK+KeJ99x4j1b4DG1+IFU/vG+H4QSqAEcr2wGnpbGYtVmvoMWmyrC8taa35ASBuQUN
	 WTigWctuYiXDbIVw2fX5sUmneOt+9Ye0bFG+oABLgkNW/bkhTGpRcIoVosxLkUlNP3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558990;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=Z8yEJH7QsJkjnEo53SRqLt7/vf23wlmCRiQpxdRl1YU=;
	b=0pJIBHjEPoHvWZYoVzOTsj5imaeKy7TtWXtrMf3mEAUUCR9YZeBlD9Jy3OECs8CEq9sO
	 4ixpNxRvnKZCMK3JnY/Wwsm8XqPC4Mlp3G8w6UWkhW8mpumE9eJA7shoHyrosrNPkKkug
	 LF7pv8tfykLyE3MI/kAjTP2VM6GPWSaOyNgwxCtEjbWEnYCeeL2Zax95BzB2C8rrCIXHP
	 oZEYPjm+2Lv81QNWP13DMEELJM/LdfMQt8Ho20qj2tAaVw3xYQRg1SGu3hWF/ih9lte0e
	 S4vDhtAQy7ujL3tUKVe/ozU/yHVjsa/PXKrT2tlS4vn527w32aIM7Lz0L8vD4bZ9QxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=FSznDy09;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 816C9606A32A;
	Fri, 13 Nov 2026 08:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 816C9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=FSznDy09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=Z8yEJH7QsJkjnEo53SRqLt7/vf23wlmCRi
	QpxdRl1YU=; b=FSznDy09s9S1E5TsBOItLKdMzIypTAIs8XfCaIcj/27mUnt28f
	dh6GATTaFEsZ4iCT6Q1dbIXZ2VLgQ0//IadNLHb+lTE3lqqAswt2Q+vBNBrI7oif
	PI3f1jzeRYWwvixTHUK7fYAVMe9ekifElBahw7HhcoZsJ8gzWEbcwYY8w=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.188.15])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgD3g0j_y_Zq+ze4AA--.520S3;
	Fri, 13 Nov 2026 16:36:17 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com,
	taniya.das@oss.qualcomm.com,
	andersson@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: display: msm: mdss-common: describe additional block resets
Date: Fri, 13 Nov 2026 16:36:13 +0800
Message-ID: <114cd1bcce56c1267059826f7c9619d835a2912d.1794558882.git.xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794558882.git.xiaqinghuan@mail.ustc.edu.cn>
References: <cover.1794558882.git.xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgD3g0j_y_Zq+ze4AA--.520S3
X-Coremail-Antispam: 1UD129KBjvJXoW7WFyDAw1fWw1DJF1fAw15twb_yoW8CF47pa
	s7CFsrX3W0gFyag3ykWa48urW3XF95A3W5WFsIyw17ta1UAw4Fqw43Kr1qqF4UAFWxZayr
	uF4xuayYvFyvyr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPGb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7
	CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
	x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
	v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
	x2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
	Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIF
	yTuYvjxUcpVbDUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREJB2r0wlk29gAms9

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
index c6305a6e033..51ef4cc74e8 100644
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
index 46dc0d28da2..729de45ec86 100644
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

