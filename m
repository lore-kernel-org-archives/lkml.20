Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819467;
	b=cuiN7/sH5CCyj70VuFG3u6K1uIDiQl3WwnUK6veVhYiYkyT88CY+KBPmkg+84j+Uzk2a
	 5OUrWOoqbyEThOo6IO51h40BeFJwSGX5hX76z9lhKrhJaHo287MxJofTTXLlMLTqV+kCt
	 CzBNUUlPBi4vOprsVXeRFzSngpDkSv62Evd7b+H2NG5TL/w7wil5dne1sKLzMUdxnnEex
	 Q7ZN0D5pqZAYcim1eAWk9Mmb7XSBQsKs5bdFIR6bLihXPW5ENmkv5T15Gr83NSYQQor7q
	 c3ehJrwJSfuRJ9L5yj2ahDURdGp5VKn4GkL6wQpF5wDokF90YZ6SILtnpTZIV2XSoJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819467;
	h=DMARC-Filter:DKIM-Signature:Message-Id:X-Mailer:Received:
	 X-Lms-Return-Path:Cc:Subject:Mime-Version:Content-Transfer-Encoding:
	 From:Content-Type:To:Date:X-Original-From;
	bh=BTcZk/ysXO+x/psVKKTgMfCcFG9OUCtxSRwx0yIpMrg=;
	b=J/qnzOJ8hoAWCE6UNTylY5jnQ44ExxFya6984OgYiQJO1CUZsk5THmsFQZ7I61bD3E6g
	 j2RDBlTsqS6Gcfwjwr0rW2WLPEi5Vm0Asz4NrZiAWvs7MEofiW775RdwOR5w4re+HQQR2
	 SpdIeKgIXJPaSuajG1ppnMM+4E48hnaSdxmJH8Y4NT1z157vj3mMZRCLCYdf2SE6otc6g
	 0eI8pjbL7aDbG0LwRQD238BtD/sgRg8aATuZDeld/Gti7NbxPInvob/LOeeig0P8g5n3v
	 bX28tM0loRInI4UYqM9C4GRAeDxWpgIraUIS8lx8FDpbnVYjW2Guf7OkOLxGMbH8ykQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=FXEdP6im;
	arc=none smtp.remote-ip=209.127.231.39
Received: from va-2-39.ptr.blmpb.com (va-2-39.ptr.blmpb.com [209.127.231.39])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031E2606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 031E2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=FXEdP6im
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794819454;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=BTcZk/ysXO+x/psVKKTgMfCcFG9OUCtxSRwx0yIpMrg=;
 b=FXEdP6imxUa80WWfC+36CeHIOP2D7V8thM9xwarmZts2uMZVhoct/Y7OADD7Ck5PPr6Q3D
 xjGB8BJWSsE/W2STuHBeHXve38RtKUI7ocAohE23bUOZkFijUtPn1Y15TvFazNmhFU5gNF
 er+fPmFd8/1AQasJb0jnUzQ6e88/EoJpYcqIskOPWir1+Ng3Wv9eGbNtXVxTmiF23v+qJL
 ZP2cUgAhbGPjLr7ea2cpwU3sDYoZWSX8KwDH6kgbK5EIo4MJAQumJvMJWJWlrk5GtQWgRO
 mXIfAfBx0yIA/q/8WzdFf24ImAlgu3QYwxXs7HjJ8nROVRiFU7hqlPTpJ+0m1A==
Message-Id: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Mon, 16 Nov 2026 16:57:31 +0800
X-Lms-Return-Path: <lba+26afac57c+450d40+vger.kernel.org+sandie.cao@deepcomputing.io>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH 0/5] riscv: dts: spacemit: enable WLAN and Bluetooth on DeepComputing FML13V05
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Date: Mon, 16 Nov 2026 16:57:25 +0800
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>

This series updates the DeepComputing FML13V05 device tree to describes
the console UART as 115200n8, add rfkill nodes for WLAN and Bluetooth,
model the 3.3V supply of the WLAN module, and enable PCIe node.

The series is based on next-20261113. The DeepComputing FML13V05 
device tree depends on [1]. The PCIe driver depends on[2], which 
in turn depends on [3] and [4]. The PCIe node depends on [5].

[1] https://lore.kernel.org/all/20261109033154.361399-1-sandie.cao
@deepcomputing.io/
[2] https://lore.kernel.org/all/20260929083755.458238-1-inochiama
@gmail.com/
[3] https://github.com/spacemit-com/linux-6.18/commits/k3-br-v1.0.y/
drivers/pci/controller/dwc/pcie-spacemit-k1.c
[4] https://lore.kernel.org/linux-phy/20260904083709.425893-1-inochiama
@gmail.com/
[5] https://lore.kernel.org/spacemit/20260727094726.890179-3-inochiama
@gmail.com/
---
Sandie Cao (5):
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: add 115200n8 to
    stdout-path
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: add rfkill node for
    WLAN
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: add rfkill node for
    Bluetooth
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: add WLAN power
    regulator
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: enable PCIe

 .../spacemit/k3-deepcomputing-fml13v05.dts    | 60 ++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)


base-commit: 4bc415760dd40fcff23deb073333984dd15d418d
-- 
2.43.0
