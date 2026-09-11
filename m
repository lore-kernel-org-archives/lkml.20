Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632C94AEBE0
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 20:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789158837; cv=none; b=qz5CdVa3bS/jPSmj2lkJSMfBKhPheZPaxBKgb5FHV7rrcUUmeC+iPXEmZBko7YFswElWdhmYu997ZUUUZu2HfQWkvyN3x4TJ4QJZ/Hewzum+l1gFXZdRahz7RmP1dUMJWTtb82ui6l7RgRxSCxRmb3IK3GuJ1kyOpUrnIdY8dqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789158837; c=relaxed/simple;
	bh=iUQC8d5PfA0Ift8TUsn934+l9CrS8trXBwCeCv1ogsY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GIpsljBX+POMK0NvCugB9Tz3P6HUkBSaZUQqQ9CJk1wv4SR0EiAiRObGmJApMiriJkiIdhVuMRhi3XQFgrFtbddXj2DMqXCrHn8zP1xm50/mdFIO5GHh9/WWy7PPs1bkbipFmtTQhTGVsjjjDioDguNXxxDXzNN/nhly1yxTCp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pM0aKbzo; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pM0aKbzo"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5c8386a01b0so873014e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789158834; x=1789763634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TNQAtUsfSHMHHKsvw6ndB+vrFH/q79ludt31IUIO6iA=;
        b=pM0aKbzo2J4Wck1Su/Epn7xCkVaFf5o8NzhFNwvTF4FCgiE2P7dfvmd2tHB8M/n2ki
         Tq9EDiyyL+q6xmot7O6mz+YkUxvoATlaTV/C7M22dB20F4aUhYwgZilqPajKvw8Xqy5E
         BcYC17dbJSGOn0RIhQuc6IY9U1sO5kSJ7QqmlVLyDm2L/jNBMh1Et3TEtJeye+PIK/m9
         SmNh8yuEtjJsu4FyPXMuo9pFnIr6zPpctrjmzQGwE+pm1Kgw4R4N20R1ahOQVlYobG6F
         tqvQYyqfb1sMrunFuTL4PHcEB4fWHb4zRab/7fZJboxFZUQIMhE7NcWVm51mXGai0+LC
         uwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789158834; x=1789763634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TNQAtUsfSHMHHKsvw6ndB+vrFH/q79ludt31IUIO6iA=;
        b=LrSrp8geGnzPTOmbdcdCO74AsKnmkfEDu7oG53NsYxQdrAdQo+p/NgBG6vpPP/jIdT
         5yp1WDGCK1qkRlyAPy96mGc11cA+4yGcguRrVg9XSexIvLDMtpmklSdyFvevk1gOJ5ng
         s7j+KGx/AK2J7y1cMGGN020JUA/GJk8ylCuC057HuF3C96cqKPXhuUng5VPsckQksvI8
         H29akgI9lvsuCI/SMh/bm1fGauvJkFyhqM5BzqVvO9GQjxbK/3fsE3hfQ64C5dsCfpUZ
         8ejvtNSEo2EMmhXxZk4m51BDT5wVa8hEZSzYGDOAZDJIxMFCyvAJZ5pZGoPagTETDMgl
         qkxA==
X-Forwarded-Encrypted: i=1; AKwUvBx12pRMuU5/sFWSndas0874DdUBZPXT84LXcJzDFK3iOL1cn5c1tBUb9mG4yJw99BC8FTTJb6msc58TGqI=@vger.kernel.org
X-Gm-Message-State: AFuF++lNFw/ckrDike55SSiwdzmxy0akAZkMaovwNlG0Fgt/GBEv6Qmo
	RZ72KKwMpefQhc57yuLKJFPQeGB9uEC5ZmTORXJA56vAQbAAqwmJSCUG
X-Gm-Gg: AYBFou3xHdsJMfoJsSyq9oAdChNOOAXpnk73pESkmll4Srx9z5lGfVqpmBdXp6rou4S
	Sq+9VzSNBhWniDclX07upbmw/+tQSQakucv5nBpf1QAmDgn7IctOT9SkUsU0yfgISxX2uNOOQjD
	KYuyTv5O3TmsWs/1HQC/gUY3g5gkjqsqINIDSEi5LX4zMw2z0+tfiVQWZfuzeNvKYd2gQZV2bPO
	RDG4JndiuNnJNT54SCY+Q7C2dZCEiuE5F+2c91LI6XoTu7VSmiS8lin+4E2Y6L2aduFKLBq2JHa
	rbNi3+Vc+G/biP90R9y+ptVmtEyikad9kPhzURzye7+sMnkh4hLgt2LQcX8lTI4jQekKjsDXkI+
	1GvaqlZ2JHVCYct0QvfKl5jjcvVXfsOJjSRtW0Cec9EbnLGvYc3/1AL/GhRFSsXIQrWyzFOItQO
	W1dRzWtLU1aF8QTXHdXsxhz/ZEj1Vqv2O1xa5+MM4kFFmcXuUd6U5y2ntfGZ7BhPzt
X-Received: by 2002:a05:6122:6217:b0:5c8:46e3:ec57 with SMTP id 71dfb90a1353d-5c846e3ed98mr10169733e0c.1.1789158834008;
        Fri, 11 Sep 2026 13:33:54 -0700 (PDT)
Received: from frese.. ([189.60.169.129])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c8470e7ef4sm4187018e0c.9.2026.09.11.13.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 13:33:53 -0700 (PDT)
From: Enzo Frese <freseenzo@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Enzo Frese <freseenzo@gmail.com>
Subject: [PATCH v2] dt-bindings: display: panel: mipi-dbi-spi: add sitronix,st7789v-tft28
Date: Fri, 11 Sep 2026 17:33:42 -0300
Message-ID: <20260911203342.76692-1-freseenzo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a generic 2.8" 240x320 RGB LCD panel with a MIPI DBI compatible
SPI interface, based on the Sitronix ST7789V controller. It is commonly
sold by various resellers without an identifiable original manufacturer
name printed on the PCB.

A basic mipi-dbi-cmd[1] script to get the display running looks like
this:

$ cat sitronix,st7789v-tft28.txt
command 0x11
delay 120
command 0x3a 0x55
command 0xb2 0x05 0x05 0x00 0x33 0x33
command 0xb7 0x75
command 0xc2 0x01 0xff
command 0xc3 0x13
command 0xc4 0x20
command 0xbb 0x22
command 0xc5 0x20
command 0xd0 0xa4 0xa1
command 0xe0 0xd0 0x05 0x0a 0x09 0x08 0x05 0x2e 0x44 0x45 0x0f 0x17 0x16 0x2b 0x33
command 0xe1 0xd0 0x05 0x0a 0x09 0x08 0x05 0x2e 0x43 0x45 0x0f 0x16 0x16 0x2b 0x33
command 0x36 0x00
command 0x29
command 0x21

$ mipi-dbi-cmd sitronix,st7789v-tft28.bin sitronix,st7789v-tft28.txt

Tested on a Raspberry Pi 4B using the panel-mipi-dbi driver.

[1]: https://github.com/notro/panel-mipi-dbi

Signed-off-by: Enzo Frese <freseenzo@gmail.com>
---
 .../devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
index 6f0290c4e291..25c176b0098b 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
@@ -75,6 +75,7 @@ properties:
           - saef,sftc154b
           - sainsmart18
           - shineworld,lh133k
+          - sitronix,st7789v-tft28
       - const: panel-mipi-dbi-spi
 
   reg:
-- 
2.43.0

