Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36834490BF6;
	Wed, 16 Sep 2026 09:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549580; cv=none; b=Fz0S06bZNwtSaEt85PHqXEIzrF3LM/hKyakjyj6oA8Sd6oa3NVnp8AIUkadMKCSbYcJ0c2+6spzPFvIQTzy811SsygnwXk2Bno4C+pSBilnpHk8Do82fg2tI5HDLRFzxwAMkh7l2WcWKaOuJ6MG39YpbWybkVtYJpEmbZa6Aeig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549580; c=relaxed/simple;
	bh=+VDz1J5rdGERVVmAIcntFj3n3C5YKbpcFcBBMkMOPGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UdD0ytfrJqrN/1cw4m0GwvYPR03dC40DZzECYlptQyZoH92ItA3yULt50a7em9aFfAXfb41XeJcNA+rIz6prFQCOYxUcsmVFqtrWAoSOJG3TFMbO9+iGUHpp8Sjg5O5zp6e/8nPmebMITjAc4BGC2ErPHKisCPttNXVd6NGrStI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R3xlIEui; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R3xlIEui"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17D511F000FF;
	Wed, 16 Sep 2026 09:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789549573;
	bh=Vko3nN/Bde41QZ/UJ3rIB6o26nKsrR7Gyy/tMZzX+jQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R3xlIEuirF2XQxnG9v2cjLvwpeGGypB/TNegNrxprnX14tynRfrLKpH+zaMwkKsyh
	 OtTcNNIymxqDViyboHCnyLZ7O2ammaucwhR3vPAOQbzsRqBU8cNmmNi3UyoCmlDwSv
	 VBrlSb9wvrKjhlEidqPXpDUdDfgTpWoUxJ2DODI8lHraXiKDud1SG7i5MOveKjG7oh
	 Z2H/Sox6P/H6hdBKG6Tb2fPHAnTH9XP4cOM4rgFQ53P1Pbhjf1xmGq4ZbFLZ/rHY6D
	 vhjoZwoC+41SoDTcr+za/HgW/UW2dFJ6aAQ+c2qWygMDVecuDijBr+lHgxSfbBUlaB
	 X6290AbrgOJxg==
Date: Wed, 16 Sep 2026 11:06:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, 
	Luca Weiss <luca.weiss@fairphone.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: media: i2c: dw9800: Redocument
 DW9800K
Message-ID: <20260916-meek-qualified-penguin-fd8cea@quoll>
References: <20260914-b4-dw9800k_cleanup-v2-0-6553273aaa33@fairphone.com>
 <20260914-b4-dw9800k_cleanup-v2-1-6553273aaa33@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260914-b4-dw9800k_cleanup-v2-1-6553273aaa33@fairphone.com>

On Mon, Sep 14, 2026 at 12:25:56PM +0200, Griffin Kroah-Hartman wrote:
> The DW9800K's properties are too different to justify sharing the same
> bindings file as the dw9719, Create a separate bindings documentation
> for the Dongwoon Anatech DW9800K with it's updated properties.
> 
> More specifically:
> 
> The DW9800K did not share the SAC1 and SAC6 modes
> that the DW9719 used.
> 
> The DW9800K does not actually have a register that matches the property
> description of vcm-prescale, instead the description of the clock-presc
> in the DW9768 is much more applicable to the functionality required
> according to the DW9800K datasheet.

I don't get why it does not match. You have exactly the same first part
of the description, look:

dw9719:
  Indication of VCM switching frequency dividing rate select

Your code:
  Indication of VCM internal clock dividing rate select,

Both are dividing the VCM clock rate, no?

Best regards,
Krzysztof

