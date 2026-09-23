Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0DA214A84;
	Wed, 23 Sep 2026 12:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166084; cv=none; b=nBS5jWq7pC9kHF6BZ+Zub3qqsxCa2MqElpwF/bgxPkIKGCE4+mtxxf8LejMaPkaINvjGmWMgmvjgakJB/A3lnf08JZ6Mku5Wi3kYH2/TT0SuHLPS1X1XgRJqlMB7pA11/h7VOglVRGfKyS8u8KliKRGJ1aCzhaj+0IMZwQSjXsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166084; c=relaxed/simple;
	bh=vNLwuTrNaoz3DB5YrxokbQTYP3l/BBVxTHXz1otYNso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VPDlZiNRzTtmh9+KnnK0HpneE165HoDiH+iW49/GPi0BEo8LbaaD6n9KxLy34BmWlDOtU5rzhg6Yl3AWj8xcdHU4lkSWVkZNmumhLhA/ka2X+uowZsRi0HIH0zgJOq6bmIZANgfjh3P1V10h8hwvXGt3vZN3agWH+9mE2lh8THA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F2ZI8vsi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F2ZI8vsi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B7141F00893;
	Wed, 23 Sep 2026 12:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790166081;
	bh=43gQIrRHk9kmLjJ0gFBrQJUF2SnO5b7qTZu9u1qXA+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F2ZI8vsi5jnLLvoqpEc7p9HU73lolhQb+s3uGQ0XEvMWyCBYz59NOp5Vyf4tw3iB/
	 VTkhopSidPH7ViArqx6PVO5LRwdYNFJKajBYs/7dYwqBlcBJSV30Q9s/4gI+x8o7hE
	 kunsVoytLrYKryvKRpTR4OLcW3OkrTz13k37MvSRAAZ02ISk8EBMLWllor5zdq7/CA
	 EZYkMRBbXvqiBIPhpCm8WWvvj+3A5UlcMl6w8gouQUsswYYyHzUyxmQtJ6iFUSh5y5
	 4KB+BbdyDqpWaICAcRxcSdVLHGUGN2bmMg5P8oc1WhomNrVxlaxWfH7aojhusd9dwq
	 78wQWcX17CX8A==
Date: Wed, 23 Sep 2026 07:21:19 -0500
From: Rob Herring <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] regulator: dt-bindings: Convert
 mediatek,mt6380-regulator to DT schema
Message-ID: <20260923122119.GA27237-robh@kernel.org>
References: <20260922195502.818012-1-robh@kernel.org>
 <arOtTntGW-ocXRxK@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arOtTntGW-ocXRxK@sirena.co.uk>

On Wed, Sep 23, 2026 at 12:43:26PM +0200, Mark Brown wrote:
> On Tue, Sep 22, 2026 at 02:55:01PM -0500, Rob Herring (Arm) wrote:
> > Convert the MediaTek mediatek,mt6380-regulator binding to DT schema
> > format. It's a straight forward conversion.
> 
> > +  '^buck-(vcore1?|vrf)$':
> > +    description: BUCK regulators
> > +    $ref: regulator.yaml#
> > +    unevaluatedProperties: false
> > +
> > +    required:
> > +      - regulator-min-microvolt
> > +      - regulator-max-microvolt
> > +      - regulator-ramp-delay
> > +
> > +  '^ldo-v([mat]|phy|ddr)$':
> > +    type: object
> > +    description: LDO regulators
> > +    $ref: regulator.yaml#
> > +    unevaluatedProperties: false
> 
> The LDO is an object but the buck is not?  I'll apply, but the above
> looks weird.

I missed dropping 'type: object' here in my review/rewrite of the LLM 
generated conversion. It is not needed because regulator.yaml has it 
(after processing, every schema doc does).

Rob
