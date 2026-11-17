Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.26
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794894237;
	b=XGaaxe2MDrvr1PhadbnFgJl9/bz5a2OVGIC9Qa5bpD+TPeflZD915X11zBGcEUclCL36
	 exGgkwcVFFGdxgaaI2rWEITj/+DXdtrT+HkLdGz6F0Y3vMzX8Syg2DrIFlPCzAN+DS19c
	 tbE9JR+3ujoLzDnum3D/8s+s06KczQnz333Gu2sxYqwAAHFE9yg+/y/hfy1jsU7NLlPAq
	 gd+JSsXUAHT1/JyfVe6uh5KVyg1e8UVJlZJb9W1TA3n3efH/Bv6LIx5yItf/Zk9X2nrdX
	 C2Puvv/vVUylun7M5tOK07HVAt1rnF1w9wnWuEXNhfh5bGASN7E5HWF1ALR92Yg+V4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794894237;
	h=DMARC-Filter:DKIM-Signature:Received:X-Lms-Return-Path:Mime-Version:
	 From:Date:Content-Transfer-Encoding:X-Mailer:To:X-Original-From:Cc:
	 Message-Id:Content-Type:Subject;
	bh=DsGLFo3Ah3ZqBE0pL0mtcci+TztznhZ6bWOpznuGZd8=;
	b=BYpVg6UFn8iPTtrMXKDJ+J7+5R/tBDHSfw8H9wV9QwrLbDKuqoS0B5ILbjR9NOsZA0bW
	 qfRkZrrnUnR9JSfBsuKneTzbcQ4HV0qQwHC4jJUmwg/49+bb1YqEFTIuZqBKa0uZe+QQo
	 aw13rr7r+ypqRkSVSxqCtErq0I2TDRcyU/cFOL4SZAsmFDxysqO+thk2TWVykx6LFIBit
	 +vZG4s07W+rD7MMsBD9LySyrjY8qvS96MUGwE0jJnIjhJ1687tfjt+UI6StEXijF99g67
	 qRMt/N/3WgK1VbpAIbcB1OzRoZ2126hBDXMWE2TabiCzGk+xibffOJEVYUnxrwp6OaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=JDC579OF;
	arc=none smtp.remote-ip=209.127.231.26
Received: from va-2-26.ptr.blmpb.com (va-2-26.ptr.blmpb.com [209.127.231.26])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637BC606A335
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:43:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 637BC606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=JDC579OF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794894226;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=DsGLFo3Ah3ZqBE0pL0mtcci+TztznhZ6bWOpznuGZd8=;
 b=JDC579OFQHDMJLEY8/2cDuh+6kxCeH6CAuDCtZG/kNMcXsZG92uOASeqvqHvaNE0lR2ewi
 qSGfFaqDIGqA4vAioanyMjnCwyapoUDQzuJIOQU7RAtOfUrnAz2xbmCkd6/u5g6B+vfcIn
 dH9iLKb4DVF3iQmCjoBPnPSKBrgjlfSqT6NuHb2cNHmTeQEWVAvd4/zIIrT+GUun09Fte3
 dang5QLOaX8hNW+DDNYvJVhEgP8s4yF7C99+0Rm3p7sH6lDciMNg5BAtz8FM5DaY/rkw/a
 N0uNmxTGm4Qy9SU1E/M3O1tu9IoB704+dRQow/zwXLDwz7P+/qfmUGJ2nXpqAQ==
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Tue, 17 Nov 2026 13:43:43 +0800
X-Lms-Return-Path: <lba+26afbe990+6b1eeb+vger.kernel.org+sandie.cao@deepcomputing.io>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Date: Tue, 17 Nov 2026 13:43:24 +0800
Content-Transfer-Encoding: 7bit
X-Mailer: git-send-email 2.43.0
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Message-Id: <20261117054324.1048767-1-sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
Subject: [PATCH v5 0/3] Enable USB and SD for Deepcomputing FML13V05 board

This series updates Deepcomputing FML13V05 Device Tree: Add P1 PMIC 
regulator tree, add USB controller and USB phy, Enable SD card.

This series is rebased on next-20261116.

---
Changes in v5:
- [patch2]
  - Correct commit message.
- [patch3]
  - Remove Onboard SD Card comment.
  - Change non-removable to broken-cd.
- Link to v4: https://lore.kernel.org/all/20261109033154.361399-1-
sandie.cao@deepcomputing.io/

Changes in v4:
- [patch1]
  - Remove unused reg_aux_vcc3v3.
  - Rename p1@41 to pmic@41.
  - Add regulator-always-on for dldo4.
- [patch3]
  - Correct Onboard SD Card comment.
- Link to v3: https://lore.kernel.org/all/20261102060012.100623-1-
sandie.cao@deepcomputing.io/

Changes in v3:
- Remove useless gpio header.
- Add Onboard SD Card comment.
- Link to v2: https://lore.kernel.org/all/20261020081633.3673704-1-
sandie.cao@deepcomputing.io/

Changes in v2:
- Remove usb3b, usb3c node define in k3.dtsi, it's already uploaded by 
other patch.
- Add phys and phys-name define for usb3b, usb3c, usb3d in 
k3-deepcomputing-fml13v05.
- Remove cd-gpios, use non-removable for sdhci0. 
- Remove vmmc-supply for sdhci0.
- Link to v1: https://lore.kernel.org/all/20260922110231.3426011-1-
sandie.cao@deepcomputing.io/

---

Sandie Cao (3):
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: add P1 PMIC regulator
    tree
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: add USB controller
    and USB phy support
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: Enable SD card
    support

 .../spacemit/k3-deepcomputing-fml13v05.dts    | 215 ++++++++++++++++++
 1 file changed, 215 insertions(+)


base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
-- 
2.43.0
