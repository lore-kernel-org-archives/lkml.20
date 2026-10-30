Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793339087;
	b=ikfsvdqgWNjJpg53JOPCeL33bK5rNDnrNMzk6B4u/te3HD62Aow9oPmhu/EzUWZAXJpp
	 T0AX7BquJ7xuFgL2IPSS4GJLmb60mq4L/MvUbGmDGZi5plOugx9NzySMd47fu+b9XmsYz
	 6mW1MMyVvZJ1LBcLYcSLd5Gq+nxgWGTZd8G4CZ0c/msWIynrTdb50VAF/EKA+7RcthRWY
	 hLrMAK1hnoQdHHre5qYDKQdPWgQ0Z7txV3f+lTvlwj4eIIXoaQfXQxvY0YSuTghUTt3/a
	 AYQc6FTIXeGpDdmeFmHQPrbzpz909c/jB7q+RmCyIreNgGOGQ99a/dP01F3vkhQWktg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793339087;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:
	 X-CM-SenderInfo;
	bh=F5gbMGX5iusTBgqPUxiRXUYirrovEg3wvTHWcTjxHUs=;
	b=C3z0obnejpyhS6NUX8LQ8aOm/80ieF0pBE+8iCPBwbCHH4uP8Mh76c9XzrhBvhrLi86N
	 eJDiMfH7EkQg9fWicjFamYQGmPbL0Zi3Y9mm+C/MPIES0tGBdkoM7ZJFhLazkbgB+3FUF
	 fN9kVBYlWDmNt9hmn9MSXGhG3b+vakSPI6fzDrnpA7H/axTKf1b/vkPLxe8qyfxp6z+rA
	 /o+pRffwB7D6IDCRH316pIKpWM9AU64AfsbORxigRymykofn9OaTQSRRqQIuzWQ9Iqtvv
	 VF9/ZwnIWsXtv8bns749TLP7QcQdi/Mi3dlZryctOuV4v3CQmqjYnJ1Xnf/gvWumkiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B83606A31C;
	Fri, 30 Oct 2026 05:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33B83606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.150])
	by APP-01 (Coremail) with SMTP id qwCowABnO++1LuRqL2kEDA--.17661S3;
	Fri, 30 Oct 2026 13:44:24 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Date: Fri, 30 Oct 2026 13:44:12 +0800
Subject: [PATCH 1/4] dt-bindings: vendor-prefixes: add Shenzhen Mingjun
 Optoelectronics
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-mj070bi30ia2-v1-1-a0f65b65c290@iscas.ac.cn>
References: <20261030-mj070bi30ia2-v1-0-a0f65b65c290@iscas.ac.cn>
In-Reply-To: <20261030-mj070bi30ia2-v1-0-a0f65b65c290@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Icenowy Zheng <uwu@icenowy.me>, 
 Han Gao <gaohan@iscas.ac.cn>, Icenowy Zheng <zhengxingda@iscas.ac.cn>
X-Mailer: b4 0.15.0
X-CM-TRANSID:qwCowABnO++1LuRqL2kEDA--.17661S3
X-Coremail-Antispam: 1UD129KBjvdXoWrZryruw13Jw1kAFyrurW3Wrg_yoWDKrcEgr
	s7AF1DuFW5tr1Fqw4YyF4xG34ruw1akFWkua4Yq3Wqk3WSvrZxJa97t3yFyw1xAF47uas8
	ArZ3WrWDXanrGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbk8FF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
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
	8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73
	UjIFyTuYvjfU8XdbUUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

Shenzhen Mingjun Optoelectronics Co, Ltd. is a vendor for LCD modules,
and it's the supplier for the MJ070BI30IA2 panel used in the Sipeed
Lichee Console 4A device.

Add a vendor prefix for it.

Link: https://www.fpdisplay.com/index.php?homepage=mjgd
Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba20029693734..094d9f12c11d5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1099,6 +1099,8 @@ patternProperties:
     description: Changzhou Milianke Electronic Technology Co., Ltd
   "^milkv,.*":
     description: MilkV Technology Co., Ltd
+  "^mingjun,.*":
+    description: Shenzhen Mingjun Optoelectronics Co., Ltd
   "^miniand,.*":
     description: Miniand Tech
   "^minix,.*":

-- 
2.56.0

