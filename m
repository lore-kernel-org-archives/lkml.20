Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3A73F927B
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789977164; cv=none; b=UKVxa7RxaJkjW2TKfkaxFf7oqan3ypvo382GUzdncWnzguPBfJ90/AUX0mkTCoudT5jqRfJimhQnKLhJxcUxOdI3upZ7OeLXRzcS4JOuRwjVfVZlcCm/RN0h8tkdzRb1BmwlH1DMWG6+5bSP97Wb1BUGfl1R+oesnHpz620J8Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789977164; c=relaxed/simple;
	bh=6eMSWF5rKkymzEikNODWvKreapXDjdVr1PgxWIjFRw0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZubxRfgOEMhINuid6RrcjUZAL3Q5AZDKcK4zwx0JWk/Q9YfHNO4RMY6GPGoZ7GWDHvtWSdwiRZvomfuAv56gcGauFTF/ERC1QIW9l+6YaWnw2C3qcZZrZrECzp9j82V2JseEW7D7vkPhTPZ0ZHBiCxotj3/PzfchLcBjK85xxVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e61YYWJ6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e61YYWJ6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D82761F000FF;
	Mon, 21 Sep 2026 07:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789977162;
	bh=U7DD0xHw7espI4/AnC7KJkdaffmkOcl1dyECwif58s4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=e61YYWJ6AYV/TOnS7KPTiAWp9tyjgmCpVboJIUrpMeeDehRlGlDx7RkTQc0tH5vQr
	 Q9ISacvKRlRCzGw40FWvIHQZ8A8ZTIqdUWXZHjUBeFPx2xNMEIwZFqu2+TmYfWYr0E
	 kiwnSxxWxxb/qQdsvV8KSxWWgo9IXjCfp4VFXZ1CbPhqlf8vfRAFGbzf9uti1qFRfD
	 7diACnUzwA6wsUZ1UgNq3cdv4f4Vc1wnu0dmRGBDuWMaTmkrQaKoz1w4nooud+NKyZ
	 D14Dy2Kt98hJm0obju2xWEj1LtsRXiVHzm08ZF6FtHdrg9x85L4SOLp9ob7nDZYXWn
	 wacg7ubgpLnOw==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260921-winbond-master-spi-nor-jw-cleanup-pw-addition-v3-0-38eef3b6a7db@bootlin.com>
References: <20260921-winbond-master-spi-nor-jw-cleanup-pw-addition-v3-0-38eef3b6a7db@bootlin.com>
Subject: Re: [PATCH v3 00/25] mtd: spi-nor: winbond: Cleanup JW family, add
 support for PW chips
Message-Id: <178997716061.3543798.10663289831575576446.b4-ty@b4>
Date: Mon, 21 Sep 2026 09:52:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Mon, 21 Sep 2026 08:43:31 +0200, Miquel Raynal wrote:
> Compared to the previous ones, this series is super straightforward
> since it leverages all the core changes that have already been done for
> the JV/RV families. Like the former JV/RV series, it first cleans up the
> table for JW chips. As I have access to a lot of devices, I made test
> runs with almost all of them. This way I could extract the SFDP data,
> the capabilities of the chips, proof that they passed all the tests,
> etc. I then add support for the PW parts, also showing a full test run
> in each case.
> 
> [...]

Applied, thanks!

[01/25] mtd: spi-nor: winbond: W25Q32xW-Q/N: Enhance identification of the chips
        commit: b1c987abe26f6b8614888c93dfb088193eebcdcc
[02/25] mtd: spi-nor: winbond: W25Q64xW-Q/N: Enhance identification of the chips
        commit: 96601905963b030a82b9ba4b0df98d8681c6a002
[03/25] mtd: spi-nor: winbond: W25Q32xW-Q/N: Fill locking information
        commit: a0d9dedd3423efd069bad9f181cf69c7dda76464
[04/25] mtd: spi-nor: winbond: W25Q64xW-Q/N: Fill locking information
        commit: a13c9bf62caa62a4cb96d7b85394346cabb73496
[05/25] mtd: spi-nor: winbond: W25Q128JW-Q/N: Fill locking information
        commit: acaacdb1e75d7ebca7ffb1fa97f149b08ea0fd3e
[06/25] mtd: spi-nor: winbond: W25Q32JW-M: Fill locking information
        commit: f81793c87530d45e96c5a012fd35d87457328cd1
[07/25] mtd: spi-nor: winbond: W25Q64JW-M: Fill locking information
        commit: 6af98fcf79a5d86822d3863802ad063a7ad6ca7d
[08/25] mtd: spi-nor: winbond: W25Q128JW-M: Fill locking information
        commit: 9780e26196039d7a67c915409e22c87db6b721d3
[09/25] mtd: spi-nor: winbond: W25Q256JW-Q/N/M: Fill locking information
        commit: f5e252b178066ecf4efe5abf2b0438242199a1ea
[10/25] mtd: spi-nor: winbond: W25Q32JW-Q/N: Add quad page program capability
        commit: efb7901c6b4d039d4a9a995c0710517b7217cbf0
[11/25] mtd: spi-nor: winbond: W25Q64JW-Q/N: Add quad page program capability
        commit: 016d9512933789a5e23608cf0839288f894b73a1
[12/25] mtd: spi-nor: winbond: W25Q128JW-Q/N: Add quad page program capability
        commit: d83b5c1df429b5df707046fc6562c60432445b32
[13/25] mtd: spi-nor: winbond: W25Q32JW-M: Add quad page program capability
        commit: afdf4a8c316bba78d8e72a2e113c63427504ca85
[14/25] mtd: spi-nor: winbond: W25Q64JW-M: Add quad page program capability
        commit: 34d7f1f5f1aab0c7b08599f0b77611d79b1377a9
[15/25] mtd: spi-nor: winbond: W25Q128JW-M: Add quad page program capability
        commit: 3520931436ee2ac2720f097c856aea01541ded60
[16/25] mtd: spi-nor: winbond: Prepare introduction of W25QxxPW-Q/N parts
        commit: a95136c1c4756885e4d333c7968b716f9008ee99
[17/25] mtd: spi-nor: winbond: Add support for W25Q33PW-Q/N
        commit: 93a72776acb954814940af8b915e609e1b18893d
[18/25] mtd: spi-nor: winbond: Add support for W25Q64PW-Q/N
        commit: c0f1355cece2e2bd19d62a35ba1b66bd09e89bde
[19/25] mtd: spi-nor: winbond: Add support for W25Q12PW-Q/N
        commit: b8a959f55f9f1806865aa38304289d2abaceacf4
[20/25] mtd: spi-nor: winbond: Add support for W25Q25PW-Q/N
        commit: 136588c583adc2c73934bb0e89877fd1a8b91305
[21/25] mtd: spi-nor: winbond: Prepare introduction of W25QxxPW-M parts
        commit: b60627be8faf82b2c64d86c83c27c730423d0524
[22/25] mtd: spi-nor: winbond: Add support for W25Q33PW-M
        commit: 03613e40f15d704013f90b2405c4a3bc6b751207
[23/25] mtd: spi-nor: winbond: Add support for W25Q64PW-M
        commit: d96b00b230d0512844d0e9c9bc391cdc30ab653b
[24/25] mtd: spi-nor: winbond: Add support for W25Q12PW-M
        commit: 8df89f0fe8e8ecc345c5a9e3ce49e41139eb4a0c
[25/25] mtd: spi-nor: winbond: Add support for W25Q25PW-M
        commit: ceedf3193cac49ddb488518616587484093d66e4

Best regards,
-- 
Michael Walle <mwalle@kernel.org>

