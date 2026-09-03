Received: from hqu.edu.cn (hqu.edu.cn [210.34.240.11])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84AC34028C0;
	Thu,  3 Sep 2026 07:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.34.240.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419423; cv=none; b=XIlhJ8MCmQd5dJXsCeOj0YL2GPamC8oUv9trn63YXHuaKcrAphngO75aWW+S4EXtH4onHFSPDIRH9NMPndqCteEQRRFq02Larhr0qkINwt6Z7qijoumC/rs1SQ1+3kDZCX3kPSAp12e6fzjepLjpOTRPhDOLRKRotuvAtv1K3UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419423; c=relaxed/simple;
	bh=5MVe7VfuMqJuWslnLm09SLHDBTAzqM14xKpvmxpGhVI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BeMoiSpLsGqx4/I0vS2EIiX7KZIydZ+5YSdFTBdeNpfd/OgG7xScJR9Ll1dSBJEinRHa2uwnLKYd52K/X9xfjGJa0EzjBLNvRl34+HtcbinMjCiASPTJ+4aX7MNU4PsrHE+Xd4XZel3dX7aUkbI6mQrhitzIM5UbrFokYU7yLys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stu.hqu.edu.cn; spf=pass smtp.mailfrom=stu.hqu.edu.cn; arc=none smtp.client-ip=210.34.240.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stu.hqu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.hqu.edu.cn
Received: from [127.0.1.1] (unknown [27.42.228.181])
	by cmweb (Coremail) with SMTP id C_Ai0gD3WtpGHZlqUQYHAA--.14782S2;
	Thu, 03 Sep 2026 15:10:00 +0800 (CST)
From: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
Subject: [PATCH 0/2] Add initial device tree support for the Xiaomi Mi Box
 4 (MDZ-21-AA), an Amlogic S905L based TV box.
Date: Thu, 03 Sep 2026 15:09:53 +0800
Message-Id: <20260903-mibox4-dt-v1-0-f29f1e828ca3@stu.hqu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM3QpAQBBA4VfRXNsaTIpXkQtrZxnlp12kNu9uc
 fnV6QTw7IQ91EkAx6d4WZeILE2gH7tlYCUmGnLMS6ywULPo9SJldmVLQiKDhJ2B2G+OrVzfq2l
 /+0NP3O/vAO77Adp5QFdtAAAA
X-Change-ID: 20260903-mibox4-dt-f64044d040ad
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1319;
 i=raspberrykan@stu.hqu.edu.cn; h=from:subject:message-id;
 bh=5MVe7VfuMqJuWslnLm09SLHDBTAzqM14xKpvmxpGhVI=;
 b=owEBbQKS/ZANAwAKAZoNcluxItUHAcsmYgBqmR1HDYoTl8GGOpU5d+pHiJjQZIN7zF67oQ6V/
 Sehnwk27mWJAjMEAAEKAB0WIQTDd02egjFwFlgfDD2aDXJbsSLVBwUCapkdRwAKCRCaDXJbsSLV
 ByuJD/9UH6WkBxHivcqo6EN+k1+iGbCfi7o0sVT+QAGEhX7AlCjjg8Nsv2f/83+Q34w2WiwO45N
 +/eCuzViFmYJeJtetfScdY3m56PPy45fuGdY631ArqrnTrLE9VApXhVoGABWnBSeKrz88R3oRi4
 EZLrZ9uksOb64CNCVWYz7SHe2b+LfzDuIrsabI7H9vpkhkZT12FRSMKCDUrzDreoUL+GNRUHRef
 EdOrw6e9Cv0eiTXeB2Yoqg1u9WWYNDIY4HKo4rpCcuyu238U/CdjQdwVvisyKJJqJqpG0EBUnE4
 7H0MQy3giR1SyOw+D4PDci08MCebDd3UujD7iSfBT/zrbOLGRL2uIn6/gp16W/1T0spZsMNRTKR
 /H6ZiwKEUtELTiZnzbUyoMyej7vhInrS/qAkjTsNuHkOY254/Jn8nla/+XkDJfGMS8n54g8BmaE
 1cOzt8uicuM/NJrcb4IFI45SB4/tlXeTI4ghwBS0HG2yIzE2NWs+xlEuh/NKok7QpuweNXcj1wZ
 R0q8SetCLDu1ibOXbEVQ5QfL74wPfPwe+X5nIHRSYnHa+fyTZXxryvD9Zw0bMZ0DV1eah7XHpCs
 pHzZjxMozIwpKt5ogzqpe5lvfr8ozTN1Z059lFpLpkgaPz9XwH+xHkPZtYhM/oWQUSykEzuCa0p
 jenn5neAUUR8IHg==
X-Developer-Key: i=raspberrykan@stu.hqu.edu.cn; a=openpgp;
 fpr=C3774D9E82317016581F0C3D9A0D725BB122D507
X-CM-TRANSID:C_Ai0gD3WtpGHZlqUQYHAA--.14782S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw4UGF4UtryUJr4rWw43Awb_yoW8JFyUpF
	WxAa4rKFZxKr17K3WSqF48XrW5JaykZF4Dtry2qr12qF15Ar1ktrWa9FnxJr1fCF93ZF1U
	tFyUJr45Kr4DuF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUqeHgUUUUU=
X-CM-SenderInfo: ysvskiyqsqlko6vw3hxktxhvlgxou0/1tbiAQASBGqYO2MCEwAAss

The series adds the board device tree and enables the main on-board hardware, including eMMC, RTL8723DS Wi-Fi, HDMI output, HDMI CEC, USB host, IR receiver, power LED, audio, Mali GPU and the Amlogic video decoder.

Bluetooth is currently not described in the device tree. The device firmware uses the H4 UART protocol, while the current mainline RTL8723DS Bluetooth support expects H5.

Tested:

* SMP (4 CPU cores)
* 2 GiB RAM
* eMMC
* RTL8723DS Wi-Fi
* HDMI output
* HDMI CEC
* USB 2.0 host
* Power LED
* Mali GPU
* Amlogic VDEC

Also verified that the sound card and IR input device are correctly registered.

Not tested:

* CVBS / analog AV output, due to lack of compatible test equipment

Signed-off-by: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
---
YuChia-Kan (2):
      dt-bindings: arm: amlogic: add Xiaomi Mi Box 4
      arm64: dts: amlogic: add Xiaomi Mi Box 4 support

 Documentation/devicetree/bindings/arm/amlogic.yaml |   1 +
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 arch/arm64/boot/dts/amlogic/meson-gxlx-mibox4.dts  | 340 +++++++++++++++++++++
 3 files changed, 342 insertions(+)
---
base-commit: ae77d827fb0e6fb2faf8186f075c6c337f2dcf08
change-id: 20260903-mibox4-dt-f64044d040ad

Best regards,
--  
YuChia-Kan <raspberrykan@stu.hqu.edu.cn>

