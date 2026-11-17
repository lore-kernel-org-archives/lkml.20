Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.199.235.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794909104;
	b=cBug4EknkJnQBG05exX0nZYkNpIc4dFVEx/VxM/wxx87qWM+8+7nPON2Nv/dF3M7qdtv
	 vdnB7egku+0KDcKPX8d4OLxolsOaAzzeQb7jjX3BTvilKLuWceExaRMG1gjyUkrYm1VIV
	 zHnykYZ/TQWJKYxawE8Tbek07BRfYakL9+5CMvYOu1qDXtDsf3qY9ydW3jWfpPfV4ho+8
	 /ye/AdDfvSbchal6nS+t2asS8Zg8f2MgHrA04f0Wcqu/3hSeyItadHnw9ZpZporNiqNFb
	 6vwwPzS6NOL4raATy03jA3xe204DBeQQm+ZXuZuJVKuszWek3GulTXQlV0o/0dpskxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794909104;
	h=DMARC-Filter:Received:Received:DKIM-Filter:DKIM-Signature:
	 X-Virus-Scanned:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ie7xlH959msYwz7Ly/QutwaJloMdPwLzBWnER2Gq/kg=;
	b=xtWQsHU7vpg+dfjmwSt7W0o/DL9/saTqAiJ17JWlLqvZVRi1SX9hBJuHlxZRqGFgE7St
	 Pc9TWuRnQv9iJktpZcNAhkVwM9k1EpeIxrl6kBV/OWo5RebAOHNt/dN8mSMxSMBXlUtG3
	 jm3koUKZiguBEbAnFDLYDrUKRRfYBNkCzYDSkcioBDHfJm4Hjz/+b/qbytMGw6wpytJG3
	 3mmSecJjcCEtzEq9CC96T+liDAz1a8SfX+dyBk79btdrDI8mV8aaM1WHup/VLCvF+1KyR
	 pUo7/deua8g5TSNzwvyBRIzzyJ1emlUndYEyUjG2adaiPMQA3vmYTebbMp8ale+3olg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cirad.fr;
	spf=pass smtp.mailfrom=cirad.fr;
	dkim=pass header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=p96zj0p6;
	arc=none smtp.remote-ip=194.199.235.221
Received: from retz.cirad.fr (retz.cirad.fr [194.199.235.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D751606A323;
	Tue, 17 Nov 2026 09:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D751606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cirad.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirad.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=p96zj0p6
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id 4A09420D7CE5;
	Tue, 17 Nov 2026 10:51:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id 27C6D20D7CEF;
	Tue, 17 Nov 2026 10:51:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr 27C6D20D7CEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794909101;
	bh=ie7xlH959msYwz7Ly/QutwaJloMdPwLzBWnER2Gq/kg=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=p96zj0p6vXfJkE1WQkAKbK4G9GFIBWL4KEXcjsJ/+SUXYmPhhfHdJSDn6Dx+O/dKM
	 8ROESkLGDxXKff542XW9p1A5Gdl4ZJtTD0QMxRhjdDNUIBGGvKQRwXPrtqRwIEssli
	 ho7bVtgDTeyuixkftWDMnU1UbgLaHakg+ILAmW1pQkw61ig07DYjyat6rJdWLaI1cE
	 hUcA2FY5VgBwB1tGmE/R9QQmwHDgK56WCQy94/gBE1pu3VdhZc8RPkHnkU6vi+S3k0
	 B+9xv52rARCvMzjMTFz2BmjW0x0fZ46jOC9nydVoBDH0+hwaRnhUojd4580rtuEZzg
	 1LGwgwCbNFjbA==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id 1qjICo2zv9do; Tue, 17 Nov 2026 10:51:41 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 3194820D7CE5;
	Tue, 17 Nov 2026 10:51:40 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Vlad Banea <montrealtango@gmail.com>
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>,
	Yixun Lan <dlan@kernel.org>,
	troy.mitchell@linux.spacemit.com,
	wangruikang@iscas.ac.cn,
	guodong.xu@oss.qualcomm.com,
	jyc0019@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: dts: spacemit: k1: give each PCIe port its own DMA window
Date: Tue, 17 Nov 2026 10:51:28 +0100
Message-ID: <20261117095129.97140-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117084938.82968-1-frederic.mahe@cirad.fr>
References: <20261113023158.2872492-1-montrealtango@gmail.com> <20261117084938.82968-1-frederic.mahe@cirad.fr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

A follow-up question on the hole that remains for each port.

On the BPI-F3 the remaining pcie1 hole (CPU 0x1_1000_0000-0x1_1fff_ffff)
still costs a lot: anonymous pages often come from the low end of
ZONE_NORMAL, and when fio's buffers land there, 4k random reads lose
about half their IOPS to SWIOTLB bouncing.

The port only uses a small part of its 256 MB window here:

  pci 0001:00:00.0: BAR 0 [mem 0x90000000-0x900fffff]: assigned
  pci 0001:00:00.0: BAR 1 [mem 0x90100000-0x901fffff]: assigned
  pci 0001:00:00.0: bridge window [mem 0x90200000-0x902fffff]: assigned

So I tried a test DT that excludes only bus 0x9000_0000-0x903f_ffff
from pcie1's dma-ranges (the root port BARs and the bridge window, plus
margin), on top of your v2:

  dma-ranges =3D <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
               <0x0 0x80000000 0x1 0x00000000 0x0 0x10000000>,
               <0x0 0x90400000 0x1 0x10400000 0x0 0x0fc00000>,
               <0x0 0xa0000000 0x1 0x20000000 0x3 0x60000000>;

Results (v7.4-rc1, 16 GB, NVMe on pcie1):

- 15529 pages in CPU 0x1_1040_0000-0x1_1fff_ffff: 4 KiB O_DIRECT write
  and read per page, no bounce, every page read back correctly
- fio crc32c verify (16 GiB direct, 8 GiB buffered) OK, no AER
- 4k random read, IOPS (1 job QD32 / 4 jobs QD32 / 8 jobs QD16):
  v2 27.5k / 86k / 137k, test DT 47.5k / 185k / 193k
  (same as booting with mem=3D2G, where nothing bounces)

I did not try DMA into the bridge window itself, as that would target
the drive's own BAR.

So it looks like the root port only claims its programmed BARs and
bridge window, not the whole 256 MB aperture. Troy, is that how the K1
root port works? If so, would a smaller aperture for pcie1 (the M.2
slot on most boards, e.g. 16 MB), with a matching smaller hole, be
acceptable? The other ports could keep large windows.

Thanks,
Fr=C3=A9d=C3=A9ric
