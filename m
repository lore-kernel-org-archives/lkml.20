Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815704;
	b=KZRs2UXjQWlGFbjmoD5MEvq1rhCxVXT/iCDyK3IjzCDXgouVB3Feiq0tGbGRa1Hu+uzH
	 oy2v2d4QwUGv/B262mJg8Du57P+4na2RerKXBbU2lT3T3QsmXASxznjp81JEJW/xJgIWK
	 eOm7jq8Veb+kUXsOY1a3YCwPkPWkAkTESE8NWNPXn8XAa8X9t4QCEa1F3BiHmslwQF6sQ
	 z4XJTWC16vgYlMdOT0vGvrIoR1YbFiPXyXfjk8FovezCubJ+yTsXv3aVKeMjGeOPzA0Wx
	 Jo3TcsE2S8R0r4efsadTm14cLrqbvCNM0ligCubbMxrZHfJeAUspWhdGWn1+a7CeNFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815704;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5ygwqe1JP9A9W8L+SChmCtHtv5W7cm5qpHwTeHwLkl8=;
	b=I4d/3NZAO/hRf+oRSR29FrSEbbn21O9djHjvYeE1E3rOCrnJl1G8Pp5pQo+Jn9ZW9r7K
	 CLx1W51/mQ96Qxkpz+c18IRdnXajXpN4njeCWALKXbh+tRXuu8Tg5MCD5YAQu1kBSUXpk
	 VPlefUAQrjrqKBuDYvgCr/oua991RSlz4GTiWBZ2yoewcVKKPZaBuTTIHLwBLslMxiXXG
	 xh7z4vmV0pWiALxaQEN2D9hD+3n8yxI778sOp+9/xd1PTz0dB51H+jc738eK5fx4jpIUl
	 z4mRk7jAVMqMV1j86Aa01DiNxtYn/2kY2biinQ/0Z9UBWkW/ntnvyrN45lNz/hb0AxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aASt8vQf;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2FE606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:55:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA2FE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aASt8vQf
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3712b6d9843so2371416eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794815703; x=1795420503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5ygwqe1JP9A9W8L+SChmCtHtv5W7cm5qpHwTeHwLkl8=;
        b=aASt8vQft3vEdGQMeIlFG4pbdeaQ22pdQIz+6/E5d6SDKEus7AEz0i3o89pCm/LckY
         4L0L2PAN6mBMCwTwAIjDwQWtJOCEw8XKsJbhZrFO1nX77l9G8SWYzKfsSGIWbTAreI14
         +swN1pXsb88X1ERXrmf3FwMKtHgXPELFWcY7oXR1bV9VIsXhDwQVvyHrG1g03vU9uC1e
         AwxARZcOY9eB0Wy2gw14gnDvhqiOj4uoNFVfd1ME2pA/kiNtc0tweRSfg5+NWn+bem0k
         mw6olnXI0PnyguqcZqkL6+n0YNuPiEXg5KCpOX6yFSkagO+60OSV/WnnJ2DMvjKcdw3g
         OCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815703; x=1795420503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ygwqe1JP9A9W8L+SChmCtHtv5W7cm5qpHwTeHwLkl8=;
        b=21sOxa8eH6gaJQWNV+fdRBBEjM6RpmQQXNj2IL4Z8NlboISBJhlLVqCa5sL/eWRKg/
         61Qxlc9CtzaiUVIvBHuEwf77x2Qr2hynkDf5Q4fNmxlIBfT2mVUqlRl460PR4jS6E87p
         1LPRZEelwo4rG3KO8NwBdDq6GwRnMvmz3JG9KSYfLuIu6OhoJJcUK3ad9iruXS40W8/w
         A8HA0oKU8yjMLGJC7b7zi+AkNPxIq0d+k++gGzVDgi45axP3HL6+6e/U8qZBaET1lhO3
         fyYz9XwaaTa0bXLNKBNn4AWUOx83zRMCXkeTU9EoCDUWf6OrI9PGGV9XrkAeSEEJHPoF
         zH7g==
X-Forwarded-Encrypted: i=1; AL+hErF8z7BPgxl/qcknDvGDh0jzcgr3F8fqG+KV2lG5v9EL0jU3YeDRoO3fuJWnXEeIz+YdI5KmE8K5feelm5g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JXhsOrnFZVxEiIRAzoEwGHmu1CdYSVFuVNt9nddnKi3MjuXnV
	n7DxDq4nU8bbcDJm9JKri/3tfYCbGE+aKTYp6phhEvm6oGjuAEom6Mvu
X-Gm-Gg: AYBFou0RbDmPJMvhU2edWx6V6OWDoRXJxiUYDBSdJJNTZDNnWoKhIYzIr4tpk4xAHju
	ctuwAJif0AHZ6ACf+kYFA2KoWAmoUI1NhUw0zQVFD/S3NJqidIsSl3UFp5eNuUxNJDTyxQnDw9L
	Aq9bU7NQoUXFjDGppmIVsBLYYcyGNQ2J4awvZt9eCv9vvOn7oaXDFZvN4HxRodh4vcF5Jp6xrE2
	DHYpXtMBJyi8xPo9QJVdy38t7meG9OJushE8mGVA/7TKaytNoLTbVYaCHi++4oSpKxXTxPKljMg
	seqlapHhmmSe+JE429gQUHRIQuEdGxnBEnhR4AJUT7uY0NzC7GsT9ZPOmD4KNsxcS04z83mAs77
	SQCIuBA8QB4ySnbxoI20RFlF55inFt5co8UjKgafIzTKamlw2Kw6ATFh6KIovqSI2DYHMoPqJGR
	+EzorcCAIUVGNjVkTft8gu+ZAOFtwVtfoC84syW0EvOeY4vTb1EsMjB1Vo0bD+2EMNUm7jhphhj
	2/jqBng1RKV+1+WfVIrZTNjd3Yx9bcfb8XblOXng9NMX6BO9N9WlPnifvsmacgHVTf3RMbTdsGU
	j6g8xrygS0i2meXI6n0YZzC1Yt4iNDj/Jhy3r3qeIcfIyj7UtkfC
X-Received: by 2002:a05:7300:d584:b0:378:a35b:9e1c with SMTP id 5a478bee46e88-379684afa4cmr9309155eec.37.1794815702636;
        Sun, 15 Nov 2026 23:55:02 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([183.192.223.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm31398803eec.16.2026.11.15.23.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:55:02 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
	me@ziyao.cc,
	aurelien@aurel32.net,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiayu Du <duge1256@gmail.com>
Subject: [PATCH v2 0/3] Add read-only SpacemiT K3 eFuse support
Date: Mon, 16 Nov 2026 15:54:20 +0800
Message-ID: <20261116075423.1519438-1-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds read-only NVMEM access to bank 0 and bank 7 of the
SpacemiT K3 eFuse controller. These banks contain temperature calibration
parameters and other configuration data.

Tested on a SpacemiT K3 COM260 Kit: shadow reload completed successfully,
and reads of both banks matched v1. Repeated reads and reads crossing
bank/keepout boundaries returned the expected data.

Changes in v2:
- Trigger a shadow reload before polling FUSE_READY; fail probe on timeout.
- Enable the clock only while accessing hardware and leave the shared
  reset deasserted on teardown.
- Explain why the root key and SSK registers are excluded.
- Use an aligned __le32 cache instead of put_unaligned_le32().
- Drop unnecessary Kconfig dependencies and the bootloader initialization
  requirement.
- Use devm_platform_ioremap_resource() and align the register definitions.
- Enable the eFuse node by default in k3.dtsi.
- Add Conor's Acked-by to the binding patch.

v1: https://lore.kernel.org/all/20261106060525.346873-1-duge1256@gmail.com/

Jiayu Du (3):
  dt-bindings: nvmem: Add SpacemiT K3 eFuse controller
  nvmem: Add read-only SpacemiT K3 eFuse support
  riscv: dts: spacemit: Add K3 eFuse and temperature trim cells

 .../bindings/nvmem/spacemit,k3-efuse.yaml     |  63 ++++++
 MAINTAINERS                                   |   6 +
 arch/riscv/boot/dts/spacemit/k3.dtsi          |  23 ++
 drivers/nvmem/Kconfig                         |  11 +
 drivers/nvmem/Makefile                        |   1 +
 drivers/nvmem/spacemit-k3-efuse.c             | 199 ++++++++++++++++++
 6 files changed, 303 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml
 create mode 100644 drivers/nvmem/spacemit-k3-efuse.c


base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
-- 
2.43.0

