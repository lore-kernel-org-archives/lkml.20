Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793339087;
	b=SqZ13VqN9gRZ1Yzwd6+w1W4BrS0K2QhDSou9OrKEef6FoTNk7B0b+zjt+7iDpC0/Egw/
	 BQIIqcoFlghz6iQkryAeeD6HJV9tACROiZ9jjN8am/F66EM+gTnvaJUbMZcTeWt3XD3kI
	 ki4RDgEEo9+mwmb9qYfJg/Ioux/rKAdlUa+rY2Aics77AxAy1dnJOtnE9T0QUXC/xtWsz
	 6Bww3TxwoWEzk0s2oL40DE7J6f+O3Ct8x6f/KXl1gxZWDk7lylIasUnBeaO3W/7BzlzJW
	 yLVFMQ9uJnbBQpPht97XAriBQCIkBKMc68roBpxBeyTmv5OuihLKusJRtSdLYN5GScg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793339087;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:
	 X-CM-SenderInfo;
	bh=FvUkk2Ujds5I3iIwUe4mprHxpSX7dzZ9WgqP3B9rzxw=;
	b=LWZlaUg7e17c0DbSCQA3s1lJchyeXLqQ6wT9VCNUwrGhhbl5bGyNhjoPKDGqxiDTSX6p
	 zhBZ8OWwP3pL+RFk0aW+0JdX/Rr5D7K9jGQ4yDKXRnuEcv5itnD10UVfQ0qvBcFJ3sDeL
	 fv9ntPVVArQn0Cd1YP3IbG/D1FScu30tISJ4Qo/mbfGeMr6AbKdBHoncP0wlSyp675QLs
	 ew6MNyyFVGV7SYx4aYE0kDOA+nyTOlr90PSQqm7PfFchdIIKW55PZFJYto2alOuy/YAyH
	 8iHgpW+MJ1jqvTTkBHkodrSGcCr8ndZMmKO3YrDMviyY+7Swwux24gx+qyaV61mKCuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C8F606A31E;
	Fri, 30 Oct 2026 05:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33C8F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.150])
	by APP-01 (Coremail) with SMTP id qwCowABnO++1LuRqL2kEDA--.17661S4;
	Fri, 30 Oct 2026 13:44:25 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Date: Fri, 30 Oct 2026 13:44:13 +0800
Subject: [PATCH 2/4] dt-bindings: ili9881c: add compatible string for
 Mingjun MJ070BI30IA2
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
Message-Id: <20261030-mj070bi30ia2-v1-2-a0f65b65c290@iscas.ac.cn>
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
X-CM-TRANSID:qwCowABnO++1LuRqL2kEDA--.17661S4
X-Coremail-Antispam: 1UD129KBjvdXoW7Jr15tr43Aw4DXF4DGF15urg_yoWDWrg_Wa
	93AF1qvrn5A3WSgwn0yF4kGr4rZ3yxCr4Duwn8tFnY934IkrWDKFyvyw1rAryUurW3uF1f
	ur4fG34DGwsrujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbk8FF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUXwA2048vs2IY02
	0Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
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
	UjIFyTuYvjfUOdgAUUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

Mingjun MJ070BI30IA2 is the LCD panel used by Sipeed Lichee Console 4A,
and its initialization sequence seems to match ILI9881C controller.

Add its compatible string to the ILI9881C binding.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
index 42e35986fbf60..0139e35d85c4b 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
@@ -20,6 +20,7 @@ properties:
           - bananapi,lhr050h41
           - bestar,bsd1218-a101kl68
           - feixin,k101-im2byl02
+          - mingjun,mj070bi30ia2
           - raspberrypi,dsi-5inch
           - raspberrypi,dsi-7inch
           - startek,kd050hdfia020

-- 
2.56.0

