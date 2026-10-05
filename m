Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C813F363C5A;
	Mon,  5 Oct 2026 18:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791226016; cv=none; b=Qxy6JGbufe5/HmPDGimzPPxl6w7JDHWFqi9gJVHo85MVZMAkdFNq+RUH2USd+y8huywBKK1kV4zUEW6/bORsPkPAD5S3MsutASGexGXXQ4x1eMeCN4LxKt58HIlCdl4IoBCRg6EWrpsDBhGbkLK+mk5/t3tDcw49FPR/rQEtulI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791226016; c=relaxed/simple;
	bh=zJy94wq+pxsvLL8zQ2fDXpGOCF5NanZqgXUp1EvccIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GApkF7HAvQK1jhT68RyTTTF79Kxg8L07MWdNNVY3QKuYh89NTCrUvL/pmgfX5Gr0hd2uhfkp6XPPooZ4rB4r5cgmf+0L/an51gwaTNWPzxAOQpmy2rHJw597SkAl/4qXTB3A713+gO0ejMTJYINiOftzyBlqVNZVdVhl/Qr/TaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=MABR9Alz; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="MABR9Alz"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8863040E02A8;
	Mon,  5 Oct 2026 18:46:51 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id WqRemdZ8-rBP; Mon,  5 Oct 2026 18:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1791226000; bh=JkX2GDHCaUk/bsmTXqai5KaSceDht0IEE6x+doMIyr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MABR9AlzoRB85EV/neOIxFXDjqhHkp0L0wp90cXC6dd3DOnHWA3dNmY5pNasCZiSb
	 EIPqNQqPosZmIszXkCYnPItHiiOWVIW8Mr8ISjpjmVsQA9Qct0zYuTiNM+SyB9/kHF
	 WhkPM2Y3V3xwq4A4iXZioYoAVHi5eDT3v9dwTBDv/HVojfnSjFPejJrSELSTNt1gtS
	 tjRJlNKdgCCqd8QHJJgTxmi1A10KkJssn87bnWLfNYAgX3SxQrVT3NpeTeRATvzPc9
	 fqqvZGy3FQvPTYh2l6izrCSD8Y3vrF/QqogSUvyT3p/x4iehzwqBkTd6h+XaRYY/j7
	 KsakRUPELSVqdi84fMiDFGMdmTTuZk2Cdk2Hc6pj3LX0pCAW/gQErUw25P4t5TwYlw
	 DwebbyJFBMSL2WKUcymrvLwLwPVLf6vhRtaB6tyy5Za1ePysipRLcIzKS1/V5oqizw
	 sinyfw9/lmUFzU0s5/0nvKBsPz3IAY10vcRw+f7OKR73bP0EOhytit/jXaWZCSJbNj
	 EGGZN8rWxyaExoH+5854LfTQZyGNiljANILgNMy2sPWT91hseJhT5Tdo1vKSGANtS6
	 RThngi+aXsm9ue9+xNhY+/tjFmQM3OsFPLhwmE5NlHBSYZIb7KNz2t48HJoRJkfxN6
	 gi+doYG5AJJwwsPg6qMXg2a8=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A50BC40E01B4;
	Mon,  5 Oct 2026 18:46:24 +0000 (UTC)
Date: Mon, 5 Oct 2026 11:46:21 -0700
From: Borislav Petkov <bp@alien8.de>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Tony Luck <tony.luck@intel.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-edac@vger.kernel.org,
	devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: edac: cdns,ddr-edac: add Cadence DDR
 EDAC
Message-ID: <20261005184621.GCasPwfaQNE0q6zykP@fat_crate.local>
References: <20261005-paul-v7-3-rc1-edac-v5-0-140a0f124bc0@bootlin.com>
 <20261005-paul-v7-3-rc1-edac-v5-1-140a0f124bc0@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261005-paul-v7-3-rc1-edac-v5-1-140a0f124bc0@bootlin.com>

On Mon, Oct 05, 2026 at 02:49:22PM +0200, Paul Louvel wrote:
> Add the Cadence EDAC dt binding.
> The memory controller optionally supports ECC SECDED with DDR2/DDR3
> memory.
> 
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>
> ---
>  .../devicetree/bindings/edac/cdns,ddr-edac.yaml    | 61 ++++++++++++++++++++++
>  MAINTAINERS                                        |  6 +++
>  2 files changed, 67 insertions(+)

Needs review by DT maintainers if it is going to go through the EDAC tree, see
output of:

./scripts/get_maintainer.pl -f Documentation/devicetree/bindings/edac/

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
