Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269288;
	b=4d4/y6LtIdnTZJ2C46XztN8KHjB6nxtrR0duz0MlbF90KrD1as3PZavWkuPFtjHd5AIh
	 Cf+Mo655k0AP2VB3TgtDLL7HjJVHeBxt1xt6qF/z6iNHRI62UftOuvCvR9egmxW17SN9I
	 cqDY8/u6+A0Orno25HsgKmop3baXQVmxosNzthaGNbWpROZmuACNvm1QR39b3Elujkc/K
	 NAXDXIUJaUsUgNMC5hWj9c00GgqrFV/QcVNzii5+KfskyMUqDar174SuERlIFEA2rMjYl
	 yedWYMGhYfkE+ZdBvpar/OJ8pgrlDHKmzkQt8l3QRIpvOvqjQy7rCeTY6TTWk4Fwx6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HBllqaFspq6PXDfJKO7BEL1LDpbj0tKT551PveSJLv0=;
	b=tYZ1ijWJjZBm1aDIOHr/7771KotXHKChHc2oU0PUn8YFS8MRf7z1wdtvaegPy5n35K1s
	 nPS/J+6HvvXyhjLcQr5YeWYoNUpiRi8GA0RfMy/uzMjUJZKEsAtNrt/hvBZTDVOsG9NWv
	 +iquQgEIHrdPYVOEZ0rpHrGNewaV4TlzkoL7RNDQDxYoYc5MY2UqGdOZOtB5stiCuFhLA
	 xdOsSzvHPr2XrwJKhAcLCckY8nGyvNuwI0ztDxw+tryz92Xshoaa9xwJzyUOiqJ5hwuDg
	 DR87+TuQy0rFnN8XxynS/fB/8UoCx1oG6+O6Zy/+eUrf8QCC3EZ5XeFhviawbpMVOTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iL5+I0cL;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB5C60A2600
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACB5C60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iL5+I0cL
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1246203f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794269286; x=1794874086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HBllqaFspq6PXDfJKO7BEL1LDpbj0tKT551PveSJLv0=;
        b=iL5+I0cLr+ATVuNDWPuu5e61AlHGDreEeL8uYqTJan6brOFqG81URE/GhFEPf1EXj8
         19SD+Z0FTubz4ms3PvY57QzZw7b+ObGHn8SoL9HrwcKy1++JPooTxj7pk9161Vf/vKIU
         ekhd8K3g54CvLJbULwkZx1M1mNfkjLBDvxOWAKLz71aQLSEg6hnozUNxcsh2YTRSPywx
         uS+RUOfu4IxObk8F68Gc6CHL60uz8I0PCEb/uiY+t2qH6Muh+YOzzcrsILyLqobYSFfE
         /h3j+2zTwDNASqYiOdpu/BJO7DMO6jP9ruk4rC6aMfFPN1t62vW26Vfx7364HCvw50gX
         9NjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794269286; x=1794874086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HBllqaFspq6PXDfJKO7BEL1LDpbj0tKT551PveSJLv0=;
        b=MMecleT8paEGcaOzQNwxBvU2hVugOIOepPwMLgxGlCXRNSIT810ZC48XKkVWpf4KHF
         Kh0xAy/9JPOv5zeeTtyk4ierk56+g8EnHJzhMnBND1/PDj6+KvzqZlrMef4ERZF6aHb0
         9CFUqm57qAVlUt8o4jqmkZpjBqlwUlOdpp5GagIJZTXu4D+dGA0it4R4HR5w7YganC2K
         vR/xGzLYqyhC/g6m3M8BZyYAwW7qHf/Hi6HiMKVmnnmqK/9uvQ7hgW3INmxyYu27RH98
         GnRtD8844JhueYgw9fqNqN+mNoiXE/Z3gqdPppkOInx7YM5a3gznnttT7f+fMwIFfLCk
         fe5A==
X-Forwarded-Encrypted: i=1; AL+hErEGom5q9DFtyEZqgMEPrr7BIjW2Mom7egkB1S0viB+pOqNdT/rLEjGAmjJggCQ3holBIvX35QI67/X//2k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8iVGKQHgjaVBdnpRk/ZL5FS/rxv9UVG2hQJAdrvhABdU2ZOgB
	VaucN3iJ+eR7/ODO901kRf7q0CizsAYpn1oZgKdCSdrV0h5qi9ffO4Is
X-Gm-Gg: AYBFou1+Skkojua3OWoU3+KOjRvJnN7xCaaLXBmztiGrGnKVh9iRiefX7Hn5nDBibXf
	3zIDhoaDolMlACnnNV5pWP9y6gIQSkzzbOVpiG/q8khCsAK2wsEFXrSSZJEnHPrwms4ldX8xSdj
	5n92vJ6Go/joWVACKeLKga/GiXuU46pPrCsdNEZayBw1iZcLp7dBcXfqD6aQjPGJ5FEERKG3Le5
	erHlo9v7gv9SDOfOdD7ZIH1Hgq3uoffy+Tb/U+oruhCzgAZQNuM+BXUKaoWkmaA/eig7U0kGUtq
	nwTVfOcP6VYbVj8ynBOO8ko4gTEM1OW2heTfD3mfh6rjYCXLlTwa/hgXF4jZsRJNKloY+F1VBtm
	tkhN2K8VkB8SThMitzp4pPc5tV68rTIv7WzXTvrmKejvsGgCJArJoUSjhSI9dsp8xdQHG/D5Zvc
	qKC2fogxzrDfYQU8ePOJlgehwD1M2ozOJRoDShd2hPBUEoQBLfISQhPdSELIp99LAzxxXPUcZwq
	u/pMq3AzrwrL0NEqCMlOl5y5xtcNCUP2F6l35xBsjxnBiaOZYKpjV6VxSytw8eTER297XLd9lWz
	84h5no+i3q7Ogk+ZixWT0cVI2i3B7XK9+eLFZMroBGuDgGTxgV74mWsPjXyZrooYHtAg3im0rCX
	PduvWXip1kZRJ9LA891Vr1SM6HPe3deKmGMA698M8Jw1GtjCMcA==
X-Received: by 2002:a05:6000:25f1:b0:491:9fc1:e6c2 with SMTP id ffacd0b85a97d-498318067demr1350295f8f.51.1794269285946;
        Mon, 09 Nov 2026 16:08:05 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-30.retail.telecomitalia.it. [212.171.11.30])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-498363df7a5sm1704703f8f.37.2026.11.09.16.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:08:04 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v12 0/5] clk: add support for Airoha AN7583 clock
Date: Tue, 10 Nov 2026 01:07:45 +0100
Message-ID: <20261110000753.508-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This small series introduce some cleanup and support for
clock and reset of Airoha AN7583.

The implementation is similar to EN7581 but AN7583 introduce
new reset and more clock divisor support.

Changes v12:
- Fix dereference on pcie early unprepare

Changes v11:
- Move to global spinlock
- Move pci ops to sleepable prepare/unprepare

Changes v10:
- Fix whitespace in include patch
- Add reset and phy cell as required
- Add additional patch for devm variant
- Add additional patch for lock for clock and reset access

Changes v9:
- Fix compilation error for priv (again) (this time fixed)

Changes v8:
- Add ACK tag by Connor
- Fix missing priv->base assign

Changes v7:
- Add further info for DT patch
- Add serdes selection support
- Rebase on top of linux-next
  Link: https://lore.kernel.org/all/20261009070725.13196-1-ansuelsmth@gmail.com/

Changes v6:
- Address bot suggestion for DT patch
- Add further information on chip-scu phandle
- Add dedicated PERSTOUT reset and PCIE_HB reset
  Link: https://lore.kernel.org/all/20260819221458.30040-1-ansuelsmth@gmail.com/

Changes v5:
- Rebase on top of linux-next
- Drop even more patch to reduce patch delta
- Make chip-scu specific to AN7583
  Link: https://lore.kernel.org/all/20260528190000.9164-1-ansuelsmth@gmail.com

Changes v4:
- Add review tag for DT patch
- Fix clock patch to use en7581-chip-scu compatible
- Drop PCIE SCU SSR write

Changes v3:
- Drop .set_rate patch (will be proposed later)
- Drop chip-scu binding and related patch
  Link: https://lore.kernel.org/all/20251106195935.1767696-1-ansuelsmth@gmail.com

Changes v2:
- Add .set_rate support
- Rework DT to EN7581 implementation (clock driver is parent)
- Add additional cleanup patch
- Merge binding with schema patch
- Add chip_scu phandle


Christian Marangi (5):
  dt-bindings: clock: airoha: Document support for AN7583 clock
  clk: en7523: use devm variant for clk_hw_register and fixed clock
  clk: en7523: protect concurrent access to reset and PCI register
  clk: en7523: generalize register clocks function
  clk: en7523: add support for Airoha AN7583 clock

 .../bindings/clock/airoha,en7523-scu.yaml     |  25 ++
 drivers/clk/clk-en7523.c                      | 367 +++++++++++++++++-
 include/dt-bindings/clock/en7523-clk.h        |   3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   |  65 ++++
 4 files changed, 448 insertions(+), 12 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

-- 
2.55.0

