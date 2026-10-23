Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=144.76.98.110
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792800005;
	b=DaVK6/6yc6WA60VEGTx3hrQ1AvbBkMZ8aFw7mrWm7xN+8UXVCiZeg82+VbZA26tv+ahw
	 mlDY2sLsMVgtN9AyurkOM6Gum4VoYa8jwcefw9QIYLM4bUhzfAsrPeLImNaDMy3YyMFHo
	 e/SLE66RSPh/JGUi1Rw64KU2kbv2AWHXU7AgEX81yo8YXp5hEQIE1C3u2Uy2dKggulYLH
	 s33FoS8IW8/93M9ETdjfvHS5mne8+jbmREdpuLoN0OR7qTmRMyR3p+A4+syZiK3iS9x6u
	 MIx6x/0aj7BIpWSVKxZUf4tyZSDvKvdXls1euFtUgbxYr039pkkgLVylVOfCXHVdz8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792800005;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=39uwv70l9BfZuduXmg0NFg2rcRknzlpybRRvMivwSBM=;
	b=S/HmeLZVOAaRULn/FsbovmTs/8o7CWNwhaEVHajtRa+XqMEt8SmSQk88wXzk6808ClYK
	 d6yoXidPi7M5VjI8P3EtZdgGVCEnTSVbxYStCobAfGIBPFMYHsnj5dmnkOEjg7zQdAyku
	 6AY6BwYwZNpOcfNibE0Dgwc/KaIXSzWJ4C4SYaUlouYD3ApKINYwy9XKewZ+fo/rrcGt0
	 lZcRSc5sAhOo9kIT8o+RgmAMONR1YdDJN4POS6AQmPGXvCGfZCxMArDHKY4EVbKDyTWE2
	 4MFPA09+ifBQWFc8l6L9QBNx6tcADsoUxixeNced8mnRgSiAagDTEOwd42yRWosldrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=rojer.me;
	spf=pass smtp.mailfrom=rojer.me;
	dkim=pass header.d=rojer.me header.i=@rojer.me header.a=rsa-sha256 header.s=main header.b=Ygem0n2Z;
	arc=none smtp.remote-ip=144.76.98.110
Received: from mail1.rojer.cloud (mail1.rojer.cloud [144.76.98.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF4E606A324;
	Sat, 24 Oct 2026 00:00:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEF4E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rojer.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rojer.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rojer.me header.i=@rojer.me header.a=rsa-sha256 header.s=main header.b=Ygem0n2Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rojer.me; s=main;
	t=1792800001; bh=24i8uxMQ2lh0kY2DiQrLdhGZMhzYI8Atrmzz+mGcMaE=;
	h=From:To:Cc:Subject:Date:From;
	b=Ygem0n2ZzMUqld40o2ZRlrLB7/ZKZNS8DBgC4pbajoUFPxZY08qxQPZTbwFj7LNGg
	 1dIk7PBfJ6S6gu0CuB/1aPgE1akWCUkd+igdQm09JEtDVbrYRI5SlV6aLUjplkDV0t
	 wxFwAvDhQJHZ4Qjh6HIGMLl8lgL3XlLdUvDIZVhr7wbHuiCNDBMsPSgNBMxIK6bkWt
	 B6EkFkxeVofYrrcVR6ECasu/c9SWzRcsXoLAsPqgo/GRh3FD7EOa7TsJb+iVjNb84P
	 7U6J3ZWdBW7fOQ+OIBltSFfBME1cAEDWI972nLzHB2quwV2BCgk5Zb8FpCObDEGFD5
	 HGvsttA1Fgfiw==
Received: from nbf.lan (212-5-142-134.ip.btc-net.bg [212.5.142.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail1.rojer.cloud (Postfix) with ESMTPSA id D2623126B27;
	Sat, 24 Oct 2026 00:00:00 +0000 (UTC)
From: Deomid rojer Ryabkov <rojer@rojer.me>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sergey Bostandzhyan <jin@mediatomb.cc>,
	Jensen Huang <jensenhuang@friendlyarm.com>,
	Deomid rojer Ryabkov <rojer@rojer.me>
Subject: [PATCH 0/2] arm64: dts: rockchip: NanoPi R2S Plus: fix io-domains, enable SDIO Wi-Fi
Date: Sat, 24 Oct 2026 02:59:57 +0300
Message-ID: <20261023235959.2988087-1-rojer@rojer.me>
X-Mailer: git-send-email 2.53.0
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

Patch 1 fixes the VCCIO4/VCCIO6 supplies of the NanoPi R2S Plus, which
were inherited from the NanoPi R2S but are wired differently (see the
schematics referenced in the patch).

Patch 2 enables the M.2 E-key SDIO slot, which FriendlyElec populates
with an optional RTL8822CS (Fn-Link 6222B-SRC) Wi-Fi module.

With these the module works at 50 MHz high-speed. Reaching SDR104 needs
an mmc core fix for the module's CMD11 handling, posted to linux-mmc:
https://lore.kernel.org/linux-mmc/20261023232813.2983368-1-rojer@rojer.me/

Tested on a NanoPi R2S Plus; dtbs_check reports no new warnings.

Deomid rojer Ryabkov (2):
  arm64: dts: rockchip: Fix VCCIO4/VCCIO6 supplies on NanoPi R2S Plus
  arm64: dts: rockchip: Enable SDIO Wi-Fi on NanoPi R2S Plus

 .../dts/rockchip/rk3328-nanopi-r2s-plus.dts   | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

-- 
2.53.0

