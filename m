Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A8F3AE1BB;
	Tue, 29 Sep 2026 08:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790669416; cv=none; b=B7518uQb6bOJnyBS8HyiEZeUYCt77OcLVU90T4cs3SY0ae4Ul0Wtv/7UNHWIUN+TvLCCCZEDtOCEcPUU83G4vayKgHHPZfXQrS/2HxIZp0V9NQqzknHzM7/mGFF5c4oAOitsCAyQOcbKVyU7BhXPyfbYQgScjSd0PfmCNom1I/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790669416; c=relaxed/simple;
	bh=kDUDkH3UFw4ZxsHByrrMoT+h2ZzfLXyEjg9HpgYiyRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jwUhjni19TA0GMDzdPfIAW95KbCoH2ZLk6LVckO3wlbCVLs4OxbNQwrMa3MMk1Admii6AlPcL1GH7LkYqDq6CrLxDTGGwz6sKn6IKnABWnqYdtIFSpBxgROacE7Iy7JzzYgskE1kGESaqd8U9bJEtk87OyRRz8Y10zZ550fZUuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AmLC3yV1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AmLC3yV1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B89E51F000FF;
	Tue, 29 Sep 2026 08:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790669414;
	bh=74bL3SRRIbCcDrDNnzgNsBOhQELiOCT4+cf/vUlclqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AmLC3yV1lunhscknsO9+pWunvtQoR4r455TeM0zCvp7odmZ9TViS+gwadR3HwsbE/
	 DMeHhgPbEsG1abp8bK5iq4iiBxPR4VpeZvYn5v6xPwWmsBbULmj9VMqwAZfP77gJbj
	 CiShC7EnTen8s8e/gYja2f4Thal9TJJISxfRkGwDCU3v0htdIkAlbUk8Jk4AXfzREh
	 o8y6hQTKPms2az44EOeIdPEeETp7LUgzEMYF8eggAHBY6n2JxP4COdgKxa1BsOjQQg
	 ggzBZWujjL6EpvKxL5XtHVx/q0MirH918NBN1rqsg3A3+IPItbd4AwgeHpVu2HdCIe
	 qX9CQ6fOfMz2A==
Date: Tue, 29 Sep 2026 10:10:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Cc: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Christian Eggers <ceggers@arri.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: eeprom: at25: add Microchip 25AA128
Message-ID: <20260929-sloppy-slim-gopher-97dd20@quoll>
References: <cover.1790308304.git.adrian.ho.yin.ng@altera.com>
 <3f2d6a2b5a55.1790308304.git.adrian.ho.yin.ng@altera.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3f2d6a2b5a55.1790308304.git.adrian.ho.yin.ng@altera.com>

On Fri, Sep 25, 2026 at 12:15:36PM +0800, Adrian Ng Ho Yin wrote:
> Add the vendor-specific compatible for the Microchip 25AA128 SPI EEPROM.
> New device trees should pair it with "atmel,at25" rather than using the
> bare "atmel,at25" fallback alone.
> 
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> ---
>  Documentation/devicetree/bindings/eeprom/at25.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

