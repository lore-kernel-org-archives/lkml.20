Received: from hqu.edu.cn (hqu.edu.cn [210.34.240.11])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF641364052;
	Thu,  3 Sep 2026 10:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.34.240.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788430747; cv=none; b=dIMuSgAFVgAlC/Mx9MqMhl/LIkZJUewv4KWx5vzd7s/B7bYdFKNNrVL6KbE4H4JhtGvzC8jFHiJTNiWUN+N+wL9jDcuwrBh0uUryCdUW+mzus7gU+9UCbhgtbCAgG4ua1GSSRAtUgKqvUZaQQu2Qdo7mtgmXLKKBbt4XDbY5nzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788430747; c=relaxed/simple;
	bh=kzaphFFUobmSgrEhjROTSnnHhHp0e4xJhaI3eW9w61s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FUMhJL9/Ivl5NbP4Gi8z06TjJUIRrUS0Qdv2bb4cd/5qKBbL8ZBUBblSq7PrMnJc3sifZyM/V4pTlgd1v58b6LcKLY9umtgt/X9xSVxkGbp+HfhT0QYK9Lykj/rklCvI8ZGlL6p8kgtsBh8Dq6+YRJsA5Y3PTjUdh8Fa+gTbjQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stu.hqu.edu.cn; spf=pass smtp.mailfrom=stu.hqu.edu.cn; arc=none smtp.client-ip=210.34.240.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stu.hqu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.hqu.edu.cn
Received: from [127.0.1.1] (unknown [27.42.228.181])
	by cmweb (Coremail) with SMTP id C_Ai0gAXe9qFSZlqyEUHAA--.14896S3;
	Thu, 03 Sep 2026 18:18:49 +0800 (CST)
From: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
Date: Thu, 03 Sep 2026 18:18:45 +0800
Subject: [PATCH v3 1/2] dt-bindings: arm: amlogic: add Xiaomi Mi Box 4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-mibox4-dt-v3-1-1a8e395d923c@stu.hqu.edu.cn>
References: <20260903-mibox4-dt-v3-0-1a8e395d923c@stu.hqu.edu.cn>
In-Reply-To: <20260903-mibox4-dt-v3-0-1a8e395d923c@stu.hqu.edu.cn>
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
 b=owEBbQKS/ZANAwAKAZoNcluxItUHAcsmYgBqmUmGQi5mjdVw0EoV3lW436yaywJ3pbNegCGbO
 aJvxgtgVJyJAjMEAAEKAB0WIQTDd02egjFwFlgfDD2aDXJbsSLVBwUCaplJhgAKCRCaDXJbsSLV
 B+VHEACXBlDb5j2aNJZr8ZD+JRzlevf3LCTzBEJ/hzPjZBZA/CO7r3Dl/6QY8ONLKBiKhlnFyRb
 pPeYY/gcWTG2+F2PR3FZHYs+jUVfCH1UvIsjm/14YHbgm8BNdRztBm4PXSFT+knXoLjZb1BsGkN
 z3DAsVqC/Pvdqq8QvIQkcy61+gbW3N4MEcLj0MRgsALjDxw3FH3wE1fIChukwtDcF/g07F6ZaMI
 QZyMWuUrkEBQeMSuxJZSJZS0MXKpjHIn74RFR2/Chttj+YlViuLwaVuvTB/BBb9MAL88yCYzVas
 H8Z6EdnZSiMTkoAnsoxKYDJ/iCKAo2ugA3IIRYn9vkjKXUcHTfrv0f05alj7+8hR/2ByLuxp2jt
 2GL5Mz8ysU1gqnJS7aAfhs4mcXQp83tXBjyOyV6dFXNdYFHFo0mG5VjPsi1rGNgBHmLZhZZeLTd
 ssUIOx7UiQlmrw0iXggh2MqUIKR3Na/Ho+Z+rnRbTGgUnngPxVOZZXRbOlrvYNewi/FRSKjCbqu
 ys0JH01haCWhXcNsgWLhpOQli5mSusCBvsCHzY40bChPnpWYB9GaVUYCv01249yXAjU4K3soZac
 ATTzG5nCQG21akBwHgsYhhkJsebzg8DafNH5KKm0VSPLCUmzL2D2HTIWC1P0yn190EqUJhMkzaG
 dnAqisJPXD37tfg==
X-Developer-Key: i=raspberrykan@stu.hqu.edu.cn; a=openpgp;
 fpr=C3774D9E82317016581F0C3D9A0D725BB122D507
X-CM-TRANSID:C_Ai0gAXe9qFSZlqyEUHAA--.14896S3
X-Coremail-Antispam: 1UD129KBjvdXoW7GryUurykCr1rXry5Jw1fZwb_yoW3JFc_Ga
	yxAa1DuF95tF9YgrZ8ZrZ3KFy5Ja13Crn7Zwn8tFn5A342vrZ8WFZ7K3y3A34xua17u3W8
	uF4xGryqg3Z7GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbyxYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7
	IE14v26r18M28IrcIa0xkI8VCY1x0267AKxVWUCVW8JwA2ocxC64kIII0Yj41l84x0c7CE
	w4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6x
	kF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY
	1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7
	CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
	x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
	v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
	x2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
	Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIF
	yTuYvjxU4ksqDUUUU
X-CM-SenderInfo: ysvskiyqsqlko6vw3hxktxhvlgxou0/1tbiAQASBGqYO2MCOAAKsN

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

