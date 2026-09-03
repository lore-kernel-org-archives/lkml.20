Received: from hqu.edu.cn (hqu.edu.cn [210.34.240.11])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82562402436;
	Thu,  3 Sep 2026 07:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.34.240.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419425; cv=none; b=b+t+iQNLUZJmsfV+MkeMgiadH0csD3M6X39DQldBX88oj0P3lDkDcu+P1hogA7V8e1jJc7deH17xKso5rWwrQLahkoAkTgP8M813I6+npeHIjRO551FSJrObQbPlbFsO1r2uamqwFBhK6VlHMEWsEg2oHnS24Ss0yfzThHNv5L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419425; c=relaxed/simple;
	bh=kzaphFFUobmSgrEhjROTSnnHhHp0e4xJhaI3eW9w61s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BJBU7xhiDtxCJeuS2KawaB/LDt5L+cn1qKapy5b9RHhVMhGp5Hw/t8ysS9Ej0E4cvrRrvLKZWq37Fu8Ne2IjiLKT4QtuiQ7lTRRWNKnw5Xoq3zY1+iV7f7tiIv4a9vjCv9ISQeCH9ojBaCh140XflCwiUinKPgpGx5fldSJjX6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stu.hqu.edu.cn; spf=pass smtp.mailfrom=stu.hqu.edu.cn; arc=none smtp.client-ip=210.34.240.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stu.hqu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.hqu.edu.cn
Received: from [127.0.1.1] (unknown [27.42.228.181])
	by cmweb (Coremail) with SMTP id C_Ai0gD3WtpGHZlqUQYHAA--.14782S3;
	Thu, 03 Sep 2026 15:10:01 +0800 (CST)
From: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
Date: Thu, 03 Sep 2026 15:09:54 +0800
Subject: [PATCH 1/2] dt-bindings: arm: amlogic: add Xiaomi Mi Box 4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-mibox4-dt-v1-1-f29f1e828ca3@stu.hqu.edu.cn>
References: <20260903-mibox4-dt-v1-0-f29f1e828ca3@stu.hqu.edu.cn>
In-Reply-To: <20260903-mibox4-dt-v1-0-f29f1e828ca3@stu.hqu.edu.cn>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=771;
 i=raspberrykan@stu.hqu.edu.cn; h=from:subject:message-id;
 bh=kzaphFFUobmSgrEhjROTSnnHhHp0e4xJhaI3eW9w61s=;
 b=owEBbQKS/ZANAwAKAZoNcluxItUHAcsmYgBqmR1Hkh01cUEP+VKy7kBwlGhOZClOR748koflm
 m6ENovs0O6JAjMEAAEKAB0WIQTDd02egjFwFlgfDD2aDXJbsSLVBwUCapkdRwAKCRCaDXJbsSLV
 BwiqEACW8EBPaN6mO3vJNaEz0CeCsOiit5fDRy4EnauaYenGrEY5WdZG/HE+yzAGmgDIZHFFkNz
 qfgGNrGbIHqILOZN2EVy7KsVUX7KdGFsJjofkcc7X2C2CJqZU+d5RU2YPWCM3H8Fm4eQsmwXGRK
 PC1i6qK+mSZ4JoTZMmoxi1HUjHQfm085m948/u8ae3AgFxMXoF4fZM+WvlwuVqs8MELwnlceFt5
 H4U0htTTcd2aKdhXu3LUwbnacgsm7MuNCWDIOsBqVpSTvIJXN1iXWGCUBNEsFMtHlglDos4EICg
 s92Ary7roibJBroUXtQ5yqny6xxZ1oTs6x7SF//5BHxMtU8kHqRvGFUmE8WWotHGjbOUn66Ngma
 awxnMCDbYR/p88cE85CMJIl13Ts334ymN/pmg11FLe8kv+t5lyEw6UhKgKtCCIltMv77VpxH0FM
 dA6N0mMpp5xENf29oZRQ9xfsg2uLEF4vkRJblHyLGxp39anhw5m2ZY9N8UZ12gAeo6lnDCH+OxO
 CNHw9NOqINZW/NUvKFHgsBBfOUdkX+3etCq7PXcjcoc1Qc8nCoNyVnDHk0ty5V0ixSM11I890kt
 TNUgWbW3pGommqwytAfEAdOUx1EWNHNpRZOXBNtwAp/sBdJQ6LSj7LHjJ37EpxPxOJ7SuQKI1i9
 qJNkOhx7eJBEoOw==
X-Developer-Key: i=raspberrykan@stu.hqu.edu.cn; a=openpgp;
 fpr=C3774D9E82317016581F0C3D9A0D725BB122D507
X-CM-TRANSID:C_Ai0gD3WtpGHZlqUQYHAA--.14782S3
X-Coremail-Antispam: 1UD129KBjvdXoW7GryUurykCr1rXry5Jw1fZwb_yoW3JFc_Ga
	yxAa1DuF95tF9YgrZ8ZrZ3KFy5Ja13Crn7Zwn8tFn5A342vrZ8WFZ7K3y3A34xua17u3W8
	uF4xGryqg3Z7GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbk8FF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGwA2048vs2IY02
	0Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1le2I2
	62IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcV
	AFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG
	0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI
	1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
	CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
	I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
	8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73
	UjIFyTuYvjfU0ksgUUUUU
X-CM-SenderInfo: ysvskiyqsqlko6vw3hxktxhvlgxou0/1tbiAQASBGqYO2MCFAABsq

Add the Xiaomi Mi Box 4 (MDZ-21-AA), based on the Amlogic S905L
SoC, to the list of supported Amlogic boards.

Signed-off-by: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 9f73a0054fb2..96e207572d98 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -120,6 +120,7 @@ properties:
         items:
           - enum:
               - amlogic,p271
+              - xiaomi,mibox4
           - const: amlogic,s905l
           - const: amlogic,meson-gxlx
 

-- 
2.53.0

