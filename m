Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA5A43BDB4;
	Thu, 27 Aug 2026 11:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787829495; cv=none; b=m/c4W8MDK1S5H4iBvwcZNMkA780Dx+7Gfofe9zYHO1SudV4C9BzYki6tn+wZC51Ydp/KZWV/ok82VKjbs1erJd3IXiIW9KCaxwGdb8aQCCJaFBJdeAtnXwsH587tgNEXRTFkPZnql2ktFKmj+viBwWzGD1H8ACdiJirBkmDZTJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787829495; c=relaxed/simple;
	bh=MJ6gx4fQAQQiMiyUia5Kwki9u7qW+HCOdWJghlWyKgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LM7sCAQ8ckG7LDJ11ffPa/Fs0ZYInl6r/OPHpOyF3aKHGm1U3UxBSeHCkLOeMBvQy+ISpXNMkYsGM814wAwEcA3mWvFcW2BozsKCtGtyBF4X1tmn5msks29g3Rvf+DhPWhbYIG1cVmi2ZJKKCPYUrp0tEzerkNEfT3BrvT10iSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iQ3aBsMV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iQ3aBsMV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06B341F00A3F;
	Thu, 27 Aug 2026 11:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787829490;
	bh=//3mFLKXDeSlJf9uiTpXYSHoe4KEas2aUJMTYjaIYDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iQ3aBsMVfVyIGNeebDQBhf+x9z/cvPGz5nmhv87XRAkDKA38hdkE3QEIZnZAb3viq
	 MOxQHyawWMbIXIcCq9bcRgLV5NouQKSOAMHWxUX65TN9sJEh8mKEA1lV5uq4rNaejq
	 sWC+8skOc/iMNXplYWjITrT4kTyHcvYqYAcI6JRCCC0pWtliMbDdZYxdidJE0vNFfT
	 Ryz5Fd9INrlICO77kqfx+3crXNdvHhJAaKhjLkhPa2GttfMMgZzYQawHQT3+PBiqOh
	 +6A8dcFdf+CP5eTc5H3/R1S5nfe22uxfTXAGWtrQlbRiOieX87I+e5i58jNkVrboxc
	 50D6FM2wE8ERg==
Date: Thu, 27 Aug 2026 13:18:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Karl Asseily <karl@asseily.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: vendor-prefixes: add ESS Technology
Message-ID: <20260827-innocent-unyielding-koala-36daa9@quoll>
References: <20260821043859.171871-1-karl@asseily.com>
 <20260821043859.171871-2-karl@asseily.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260821043859.171871-2-karl@asseily.com>

On Fri, Aug 21, 2026 at 07:38:56AM +0300, Karl Asseily wrote:
> Add the vendor prefix for ESS Technology, Inc., maker of the SABRE family
> of audio DACs. The prefix follows the company's domain, esstech.com.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Karl Asseily <karl@asseily.com>
> ---
> 
> Notes:
>     v2: rename the vendor prefix to esstech, after the company domain
> 
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

