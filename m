Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818E745198B;
	Tue,  6 Oct 2026 15:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791302017; cv=none; b=glkxq7wZLrKOrsGpmdY2HJeLr3JXvpSMy/ha4AkjBuV9S7RIZXcS/F+c2YT2cxprhEtyv/ldsqwa2TP4PZXhoXIZwrkjloSVElXok+N46VzpkrCmpGwehblvu8HGBXwd7EEvNNOWe45R7SF5jtmjb1QvfsFudl65lKmOWwa/JuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791302017; c=relaxed/simple;
	bh=UpHlpaEz7c9J14TIOn+9SWXopjAdk8m8s1n7KIqHFQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i985xbPiBS/ojrk2muIcktsRBH03OHrtyBk8iHuOO+DR+lS2Ddj8VsoJVoIenNhOFZhVgtwYyZ3UVZZFtBnJHHWyyZwt3NWfSHbDoC9vSIJaLubf87IvV2q8HC/zpClL3ZZWpmuJvxdJC1gXyw+V6YxiKaChssgBpjbB/rxccl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=muOxX6LI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="muOxX6LI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03C5B1F0089B;
	Tue,  6 Oct 2026 15:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791302015;
	bh=HaA0ZhKYqnepgQtkpomdXZL3h1QMBDZj0RAHb4oXqFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=muOxX6LIg6lMO0wM9+b50Ou98q+xGy/oQTNxD9FEn8ToH1U+HrgzBGnDldh4vinM9
	 7fbaQn41WMaJ0XvghBygx0A5OYtO+GT0fb0t0SPbl1SqWDG60zxfMvoracylQXfbQn
	 9VAesHgFCXxGmKwRaln5BtPygeM0t8aCUGcQ0M58B+rZsKhjfNLpniTQAdeeYltbPy
	 6kC79FkjqB7P6Uzc7R55hNIHBr7xOnw88FikCt0ZS0VNP0uOTbc/nRcursa4HBMz67
	 sqPSDkJrS3RwbVhabTZov2D1pTmWF8zQ9m19kIAeAqH6tMOiG4KmENTelHY+lciVFp
	 oQ7qibFOD7aag==
Date: Tue, 6 Oct 2026 10:53:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-edac@vger.kernel.org, Tony Luck <tony.luck@intel.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: edac: cdns,ddr-edac: add Cadence DDR
 EDAC
Message-ID: <179130201388.2400941.10837422268871185940.robh@kernel.org>
References: <20261005-paul-v7-3-rc1-edac-v5-0-140a0f124bc0@bootlin.com>
 <20261005-paul-v7-3-rc1-edac-v5-1-140a0f124bc0@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005-paul-v7-3-rc1-edac-v5-1-140a0f124bc0@bootlin.com>


On Mon, 05 Oct 2026 14:49:22 +0200, Paul Louvel wrote:
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
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

