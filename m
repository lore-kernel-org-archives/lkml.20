Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3CF3EC691;
	Thu,  1 Oct 2026 07:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790840681; cv=none; b=A/cQj1+TtA6AFx/NuOe2OWn7N3d4IAYM0NfbGuRVh2lhPz9lh8d2Y14ifYdnCJ8OEpBZ3fb3+yWH9R7RGghm2d4RkdhGwQkn9xcBdSadT6bxn3wpEhmfgxkaliTQ8p5J+bHnpRz6Y8rlhDUhOBesDRF98Nm5F0iu2Fi+Nux+Dtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790840681; c=relaxed/simple;
	bh=VGDR48rMuQPaeJPCQr7e3/+LRJgzDuSqPLpyvJeYKnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U7c8mv8cyCXqnCM+ciaDI+I27feaFoVS715XmrOvmNKxI/aywNapUQxTzNPJWRjZyPtM9fi3CpdS57j+hhq12YGiX4/92OLa65UEoJOwcRWMZD6Y+Z5JC7U/1i2gElTjkTQW6kHzSw5u6xmfClg/wT3klYFAMCGOEGxwQ4+Su0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [127.0.1.1] (unknown [223.166.93.127])
	by APP-05 (Coremail) with SMTP id zQCowAD3J0JPD75qjtLZCQ--.7172S3;
	Thu, 01 Oct 2026 15:44:18 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
Date: Thu, 01 Oct 2026 15:44:10 +0800
Subject: [PATCH v2 1/4] dt-bindings: riscv: thead: add Milk-V Meles
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-rv-meles-v2-1-c61052262f84@iscas.ac.cn>
References: <20261001-rv-meles-v2-0-c61052262f84@iscas.ac.cn>
In-Reply-To: <20261001-rv-meles-v2-0-c61052262f84@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Jisheng Zhang <jszhang@kernel.org>, 
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>
Cc: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-CM-TRANSID:zQCowAD3J0JPD75qjtLZCQ--.7172S3
X-Coremail-Antispam: 1UD129KBjvdXoW7JF1DCw4xZrWfZFy7Wry5CFg_yoWDXrXE9F
	1xCF4DZay5JFn5Ka1YyrWUWFW5Z3yxCFyxAw12yF4Skw1kXFZ8Wasrt3s8Cr47Cr47uF1f
	Jws3Jr9rGFsrWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbkxFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGwA2048vs2IY02
	0Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
	ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I2
	62IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcV
	AFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG
	0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI
	1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
	CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
	I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
	8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2Kfnx
	nUUI43ZEXa7VUjrHUDUUUUU==
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiCRQHDGq9rsa9jwAAsb

Document the Milk-V Meles board compatible with the TH1520 fallback.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 Documentation/devicetree/bindings/riscv/thead.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/thead.yaml b/Documentation/devicetree/bindings/riscv/thead.yaml
index 301912dcd290e60f816d380152591106de9415b4..e8170915f4d6d63fbc10a0e6863ea7d5000e3643 100644
--- a/Documentation/devicetree/bindings/riscv/thead.yaml
+++ b/Documentation/devicetree/bindings/riscv/thead.yaml
@@ -17,9 +17,11 @@ properties:
     const: '/'
   compatible:
     oneOf:
-      - description: BeagleV Ahead single board computer
+      - description: TH1520 single board computers
         items:
-          - const: beagle,beaglev-ahead
+          - enum:
+              - beagle,beaglev-ahead
+              - milkv,meles
           - const: thead,th1520
       - description: Sipeed Lichee Pi 4A board for the Sipeed Lichee Module 4A
         items:

-- 
2.47.3

