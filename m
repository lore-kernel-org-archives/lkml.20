Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB1E2DCF46;
	Thu, 15 Oct 2026 03:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792034214; cv=none; b=WjoPRLUyuvk76JqEQPTrlT0kAeBVyudS495PfZjzr2Zowv0YN1EYZjiTZ7bUWy+4uDlL8L4UBQKWEn1SdTIf63IgNdKKk8t2YyxmDseauxlB0JKVXildwqke2J5BlGqPamRo3MKzbOTDauqIDLkIDu8/UWkk/vNBiXmPgXBoCq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792034214; c=relaxed/simple;
	bh=hOdxXgt+gcVWP6DlzjCe7Q/4RrsKfq84mV5+goxkzoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AhiTa1MLgnBafyCaHhEGaHXc7YNthSg6IN9N+ivDKp8odeWblpmPeQmYcnZEtW2rn0+9t47Onv/T0M0et6dMDh940J4YPgoEG23PdncjzbMnSV0bNwWiCNAJ3fIGOVbsfPPoQ5myVquydcmLNQcmgpCEMpSNrshkYz/YrbsRH4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L6tPt6/k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L6tPt6/k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96E9C1F000C4;
	Thu, 15 Oct 2026 03:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792034213;
	bh=8AVJ6zfOuV6JVNYsdJG2ZNc/lQmxSzK44gUbSXPXfiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L6tPt6/kuZ0siBp8DQC14ojkWMwCKY2snZeDy9KFq4wTw3fep/nDtYppxEiIJXk+3
	 3LDRSekaHS4nk5A7/vnd4IUbpSBmGeKAxAYw5GjeBl6c2YsvZPDPckvWHDqY+5NODj
	 RurYW85HkKI/sNSJlaA9VGV57DG2/26GUlP1ll9oLApra7Fj8Fs5hsYyg7CQiv5fNT
	 sjGPEr1mbZGrRs0ByEuS6ZRFk8xGCj9awpVAXsfLHri19+8Lw9OoBPW4CdmGpGF8kz
	 Hpzi043RcjvoURMnQAEKrGtEFGJRMUdQOSHz2UFu3U+HUaRuHWjIN+EV+tOffAh25c
	 porTm8u/5W++g==
Date: Wed, 14 Oct 2026 22:16:50 -0500
From: Rob Herring <robh@kernel.org>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
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
Subject: Re: [PATCH v6 1/3] dt-bindings: edac: cdns,ddr-edac: add Cadence DDR
 EDAC
Message-ID: <20261015031650.GA370919-robh@kernel.org>
References: <20261013-paul-v7-3-rc1-edac-v6-0-2f1d6f2f74db@bootlin.com>
 <20261013-paul-v7-3-rc1-edac-v6-1-2f1d6f2f74db@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013-paul-v7-3-rc1-edac-v6-1-2f1d6f2f74db@bootlin.com>

On Tue, Oct 13, 2026 at 12:44:58PM +0200, Paul Louvel wrote:
> Add the Cadence EDAC dt binding.
> The memory controller optionally supports ECC SECDED with DDR2/DDR3
> memory.
> 
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>

Missing my Reviewed-by.
