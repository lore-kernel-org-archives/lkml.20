Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C564C14E5;
	Tue, 13 Oct 2026 10:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888537; cv=none; b=Kl6qwoo3H3WWnb8yQ0J+9V6LTJ9AGBSgOZ3DsIORwePaL/2ICt9QsFB56J4UipjN2/1Kn3NbjMEmzE20tSpR3L7plH0ZSZCULH5VvOT4jDSYa1TgzHBeYlykTTmAbzKEeXpk+VIuyQaxlt1ENUz2Pce47wT2eORAHvSqgRnuH58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888537; c=relaxed/simple;
	bh=PU12tnr5NOCs4bPLwIyCrmBNHHzahZ6eKs8gFnG0X5M=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=n6hTEYZ+yMGqo82GGBnIbNPlcoJixVvHycRsfdillWSt8HPojK5CwLwtULhQz11mI8DXdK7MqLb+VvqDUWWbQh9Fu3rnfciRk1JBMO5yz97x/iHU3morMS9TBgIxG8VLBUYXRXVj6rsuGM8Tgis4Jzp3mzJibaSarWCzQpdzHU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=xJvN/0qm; arc=none smtp.client-ip=162.62.57.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="xJvN/0qm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791888528; bh=m4Bl/vY2N1MPYgLK8qSEQQ1wtqzLVBSpXYWmQ7yKnP4=;
	h=From:To:Cc:Subject:Date;
	b=xJvN/0qm1OwQOdTr9TmIUhVN6eamTAb8R1kr7BdSPNUQajGYH2ElsjXbmy+BD3NvU
	 m90v3PEk+udtAXZfLrCUIqpgXGlZvPxfJc3Qs+M8S8LJ4C4EnHNyght+L0uW+12rLc
	 nzvuJwJygNiXkd3wb+fpvlsllBJMHZoK/INZhXf4=
Received: from DiagonAlley ([120.253.195.162])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id BD285CE7; Tue, 13 Oct 2026 18:47:18 +0800
X-QQ-mid: xmsmtpt1791888438tzzmn2amf
Message-ID: <tencent_D9A0A9BF766957BDB9C77A8EFA5941993908@qq.com>
X-QQ-XMAILINFO: OI219bxu/rL8F4mhi91T2Qq7TAyxRqbVvpmwFI4X2twUBueCQWIA75VHJd8VCA
	 ulWlDmZvZw0bFJ16BPjc3f96fXd9dCZBuxac4G9d/86grL460kmdh/xdxmZB4x05f0Vv7TqiGD2a
	 e4R1JoPAh0tL5HV8H+Hrv9D5uRy1BWF+QvhAj5IR5XTyTFefYr3UfJk5jFiTWb9q4JQE/mPqg0Bc
	 m42npPgZDqJtooLBBsWQQsrPWKXaKRFn0HHmTjs7gYNdB1ekTVuC2BeZRPgfukLkcmLPOxyphoio
	 S/y4AvhHVXGoVkzzZbVH7T/O7CyfyxxY5vR7l/Qyq8T/zmhuVYS9DZr0e70zWll2KBpnP5TpERNY
	 iGQ7o00EODMwUw2ebKsA79ZgoAapolsC4ojN/MD0UT4snphO/gx36DbnHJlnTY8QXU29WuVK7pK6
	 NuzI/n7snMjOYG3SrADkti3MpD4ZgeTpqrsgyzQhypgOkWd9M5eydgFN0fn4T1MhQiSqoQMf3wLI
	 0blVKPXU80UWbBcObRv1GgZ2lsaYWTt0YRUu1VwzAYzXcJZBKzm4OBpThp9ALnoyCDHTqgdk7piQ
	 B6uewWAxGrTH9+kM8UzmbYyuTuLY88X1bH/41Qy//LlSMfcGx6OPCYiyT+NQ/FK/wTrLe+lfCZPQ
	 TU6zYOTrEKoaP+kvs5xy5vTmiciPy2dudkWt1fci/LRYQazDzocAowY/OEGDViKAzZEYrGJYDQzV
	 Rgk74DRMlhiM9MzRANM3GN6TV1YB1xnZpZxs305AX4F+YJjTLlbdSl9f4ssxo9wf6J51ZmlPnPc+
	 ruwOYrc+zDBCU5dl1kOWDSioMOHo4GI/T9NU5sIqwhKsiXwJqMiOed3lv8uSWGkKcF0IFjHZ9R5o
	 zOOUujZWZbhgiyldFVQq32kdaHARZEE868uOd90a0KSGPjPFWC45NKszJMV5WmvIXGr10wEv7Qlf
	 J9QrE9UnyKAs1fnJbUThZhJO3oIZQyU42izL19rH/GQbqRJPpwcZSuH/PvuXe6p00MMpFW6sH6Vd
	 vMK8VsU79v9wo8SO9w2cFmwiaKJxSHpx3hnLfIT//fN+QuZQAqhpLMWCLC5TH3GiiPbfXcY+M69q
	 QKsufQ99G5/q5E9EP5Qt0PwSO00gB+3qgP4A6D87t5654weCReiYF0Xxp9oVoOC5Y5Fy7Ix/pKSI
	 sT7VnNR3o4Vj8/fwK45ef/4xKFF9UFfhkpL3w=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Mingxuan Guo <gmx472@qq.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingxuan Guo <gmx472@qq.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3] dt-bindings: media: i2c: dongwoon,dw9768: add Giantec GT9764
Date: Tue, 13 Oct 2026 18:47:18 +0800
X-OQ-MSGID: <20261013104718.1750602-1-gmx472@qq.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GT9764 is one of Giantec's VCM driver parts and shares the register
model of the GT9769 already covered by this binding: the vendor's VCM
driver application note (AN971) covers GT9764, GT9767, GT9768, GT9769,
GT9772 and GT9778, all built around the same 10-bit DAC with the AAC
actuator-control extensions.

Document it as a specific compatible that requires the GT9769 as its
fallback, so the existing driver binds through the GT9769 entry and no
driver change is needed.

Signed-off-by: Mingxuan Guo <gmx472@qq.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v3:
- Drop the comments duplicating the compatibles, including the two that
  were already in the file (Krzysztof Kozlowski).

Changes in v2:
- This replaces the v1 series ([PATCH 1/2] binding + [PATCH 2/2] driver):
  use the GT9769 as a fallback compatible instead of a standalone driver
  entry (Conor Dooley), and drop the driver patch accordingly.  This also
  clears the Media CI warning about the compatible being undocumented.

 .../devicetree/bindings/media/i2c/dongwoon,dw9768.yaml         | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
index a0855d3b7..23cd49428 100644
--- a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
@@ -20,9 +20,13 @@ description: |-
 
 properties:
   compatible:
-    enum:
-      - dongwoon,dw9768 # for DW9768 VCM
-      - giantec,gt9769  # for GT9769 VCM
+    oneOf:
+      - enum:
+          - dongwoon,dw9768
+          - giantec,gt9769
+      - items:
+          - const: giantec,gt9764
+          - const: giantec,gt9769
 
   reg:
     maxItems: 1

