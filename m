Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793991293;
	b=LxKtdiiHm17Ej3VPkveR0e0AfrPrF2suWAlAket0hClSykby1gPmnWsgkyRgT7bkcmzL
	 VZrV9gVcUht78cXXlOcnluHrKljshWXX5ZVC7Iqxd5pX4UBg5YzL6IP9v3JUE+eu6ouu6
	 J6bxQzK3WrRNir6/TVDX/Y+vv7bnb/cJ3Qs0zJ6AmtF8Yt43JL/xV+BW/YP9RbiG0uTih
	 vK5eIjALILIjOh/WjENsjUQglDOtci5sEvjIoMZsLH5gR0wIxJX6OkQAVhq//8WfP0+sL
	 RWyc6/694X/TFOEfiHvSD/9LkbUNGoo1Z+RcrwIzfuNjqeCgaZu1S0NzvkcxowwzmRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793991293;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=RMetCwXaRXymMxJ1no11BIY53svi4m6BzWuwI+r3+Yk=;
	b=JxwuVyZWoowHZmoK6wtvga1FOjR7j8SX4HtWi1jaBHn4IGLcf5KMW5ZA+Mxj4l8ZBto4
	 bGG79mwv07lY485iZLkdT0cV9CsSMfMcFp4hpdVMBQ+ErUapGrD4PyT0GzHeJVoBlSJsa
	 EP5Rb7ZDdUSXdS2ug3jV4VC9oHuhGs0PQGlLRO22+eqVhyQHaOHxoLex523p/pqcpnuGa
	 4BXKteEIAUXOil7mF792wqB4buHgjxdZaeHjRyj8JEcw231UO5c/L5upIu90GiQFhq0Ti
	 Ean+qRoZUWe/0sEnq+aeXyfFM5r1o1QOFGVufaWPLOQEWCbymsJ/AKv6VuAGFBt85VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SXD1nRCq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42765606A329;
	Fri,  6 Nov 2026 18:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SXD1nRCq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F75C1F0089F;
	Fri,  6 Nov 2026 18:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793991292;
	bh=RMetCwXaRXymMxJ1no11BIY53svi4m6BzWuwI+r3+Yk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SXD1nRCq54irp9J3Hfs2YYDDkiieUeNvywxgPrZHddyLVMreqXE+BTopeC2rnOA9S
	 t0QBBE8LiX5BEwVq/M+us1Zsq+347PwekAHKH+VsESMkthK7XdoAwz+Me5oq5KRvMm
	 ZPXSNE3cUy91iLXJXEbWc5pOZtEepW76TCC3+PcClugDohWpFgTX6LkPoIXREb2CB7
	 iGZc69fFQASDk1z0YVpWKecItYEeWEZvWr3WtKs4TaWbYxcjaA7nee2oPumgGM+bXH
	 xg7LWXVPPhk/RLk7abTwiwQatq+fSpoT4XAnbWDO/TwDv1Iu/1MmqAFK4LLQukopvR
	 QzpfIaUGTe1AA==
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Owen O'Hehir <oo.hehir@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	E Shattow <e@freeshell.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: keep the status power LED on
Date: Fri,  6 Nov 2026 18:54:42 +0000
Message-ID: <179399127414.1902073.729566010968054971.b4-ty@microchip.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106184055.3891621-1-oo.hehir@gmail.com>
References: <20261106184055.3891621-1-oo.hehir@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=490; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=eV68g8YH+NUab8Y375gkc9AMM08LiYaGELIC443mCNU=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFnvlAofsbYKnvK+cnTZZtdcCe0HsW8i/xxewX7WUrLM5 Vhs6mXujlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzkYg4jwwMRecWnp8I96le1 /87Te6erV37z0IeCxPs797e4ilvaijMyrLldfjE8VGvSaYf2ytX1K9b/cg3XqPaarV/6Sc7lzmY TXgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

On Fri, 06 Nov 2026 18:40:55 +0000, Owen O'Hehir wrote:
> The firmware turns the status power LED on, but the node has no
> default-state, so the LED switches off when leds-gpio probes and the
> board looks powered down.
> 
> Default the LED to on.
> 
> Tested on a VisionFive 2 v1.3B.
> 
> [...]

Applied to riscv-dt-fixes, thanks!

[1/1] riscv: dts: starfive: jh7110-common: keep the status power LED on
      https://git.kernel.org/conor/c/68dbe2550bd4

Thanks,
Conor.
