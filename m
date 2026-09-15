Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D712F7F00;
	Tue, 15 Sep 2026 00:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789433887; cv=none; b=cuL4CJnEclTRjxiBo0OOGW8VQoWoQzGu4eId6OKtC4X02N6TOMJYW6pvwwTmIAtN/ayT6x9HDB3xfi44JKDNluJLlCILCvFSe0c4e2uT0PTtHsHey0Sbwd7M6uyP2g5GWoBng0aEPN4exvQ5qawGfzVf5Lsfk6Q2zi6DfenFkig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789433887; c=relaxed/simple;
	bh=XGAmiLWdgsYj0c+boMgCzJzvbfduXB6i+SdLv4Jx+j8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O0X8q9NEveywjoZ8vb7KlscDPXYcBzR16bZsm+li9BQgKbLMRebN5oCK9rT1YZrZhHZOQ1jzE8WrJZ/78gFWShhLuBdj2pfHesrK/d4ksCN12mpyHidKPq5kLitjheuArxFOmyUJq05QrXXhItwb1XrHTEqVAV09dMkWauAA+Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oY2nyQYa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oY2nyQYa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 068CA1F000FF;
	Tue, 15 Sep 2026 00:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789433885;
	bh=GbaWcVbQPLTkAyQjGB58ukYMT/b3NDN5HpI68gRI0Sk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oY2nyQYaQNNVunkf6kYhibDQUJHf2epLugfl0kk5T5CG29CsC4eEnj592ZLpWoaWM
	 s+edCt8FCAKYqHZw/5g3CxF9WPmbx4ic85eHdUsIAWPUkMAqpm3ynA0zVVORFtVkzz
	 vmsa/hTou0iwPGF8eZ5AUL2B2AdCZ1p3t4mDfum1tEoxUxDE5WiQgO7Jt04syCyfAD
	 R/9iZJhVcdhIO+kL7cPhqxh2yU2rp3R9sSEXkKpZuK85VBWKisi3Ff6Hskhx7UVDlu
	 KbhTnvAT984dIYqdj/O0VQjIM6heI5fhhchyu2E1XJVka0bp9YwrKulwndcATqfzB0
	 xa5GCG1coJ9zQ==
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable onboard eeprom for OrangePi
Date: Tue, 15 Sep 2026 00:58:00 +0000
Message-ID: <178943386049.3673953.206218142747797275.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901080010.95040-1-amadeus@jmu.edu.cn>
References: <20260901080010.95040-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 01 Sep 2026 16:00:10 +0800, Chukun Pan wrote:
> Enable the i2c2 bus and add the connected GT24C02B EEPROM.
> 
> [   6.766] TlvInfo Header:
> [   6.766]    Id String:    TlvInfo
> [   6.769]    Version:      1
> [   6.772]    Total Length: 38
> [   6.775] TLV Name             Code Len Value
> [   6.779] -------------------- ---- --- -----
> [   6.783] Base MAC Address     0x24   6 .....
> [   6.788] MAC Addresses        0x2A   2 2
> [   6.792] Product Name         0x21  15 x1_orangepi-r2s
> [   6.797] Unknown              0x41   1  0x01
> [   6.801] CRC-32               0xFE   4 0xE5A74B18
> [   6.806] Checksum is valid.
> 
> [...]

Applied, thanks!

[1/1] riscv: dts: spacemit: enable onboard eeprom for OrangePi
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=ac436e6879f5bf25e971d80f96f9392b61ff54c6

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
