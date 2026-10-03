Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24BF2E11D2;
	Sat,  3 Oct 2026 14:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791038467; cv=none; b=KZ3FWJRh31MAaXap5up5xZZkDah4YGAk5xBidU+5Fd2rU6a0S1FonSowVWJS8cy9zxCPj7A+CQbmfI0jiVZqm57wjF68AMJFYUcFguQrRcSLATqIyOz574rGCFSDBbF0v4C9G0hibbfMB5acnNfk2FUt5O1BDLGMByF7Uc3Bnfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791038467; c=relaxed/simple;
	bh=OMiF1Aete3rw3AtbN+V4b4J0t6TMo+a0jHHxjY5Mwnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F1YwhnHG/wMIHxWVq8fMjFqJnbBY/Rzf4Py5G+ciuVfDgeiBOF3M+wgLRkD5H5er4e+OTnIzPbipwrDq2Y6bOl5BkaZPWck4gvCLTgxAgEIVjBB8MQnEytuax1Af2MvV1+h3F3ED1/vaemQ8pV14mFzJ2BgEVAUh++c5Ax8Cuk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nU4kZ3ol; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nU4kZ3ol"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C32811F0089B;
	Sat,  3 Oct 2026 14:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791038464;
	bh=Za1pZegFszNhsXf/v1xZJxwhyF/n2vi12w8ByATTNQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nU4kZ3olmxqRaWGh/BMyUHNDmUetS5azGwKj+HLbpDQ+6CwqJrNiiXtOqPvtCxGby
	 n8C2YQcakn+dKgddXQgrFasrajHZTSYl95IkQg/PrhO1L6/BYRw3sLgjV/d9+wR/kl
	 n8HpXYCJab/uHaIQWOvLOIWtPBMYrOFV1pkXjjFG7fvRzNEAlamHlU/QOwnW4Z9z/Y
	 x+2oUmN4B201cIbsl2ncSI3rnvDb7c6UJrkhBpK5YhRyL7Fw3lOBK9Xo0Y9BFyFStF
	 pNukhjCLyv9PkPaDwwRLvjBlF9eDfu9C/LpoKxHlchOfR4Gulr7D/cri+QLY+T27IJ
	 PsiNQffNRWcjQ==
Date: Sat, 3 Oct 2026 16:41:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dawid Glazik <dawid.glazik@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, maciej.lawniczak@intel.com
Subject: Re: [PATCH 2/4] dt-bindings: arm: aspeed: Add Intel JNCRP board
Message-ID: <20261003-convivial-mottled-turkey-d6c932@quoll>
References: <cover.1790344811.git.dawid.glazik@linux.intel.com>
 <212171467173c9af64b3f8ecddca2a445b7e7148.1790344811.git.dawid.glazik@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <212171467173c9af64b3f8ecddca2a445b7e7148.1790344811.git.dawid.glazik@linux.intel.com>

On Fri, Oct 02, 2026 at 06:32:43PM +0200, Dawid Glazik wrote:
> Add a compatible string for Intel JNCRP BMC board.
> 
> Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>

Squash patches. You don't even say anything useful in commit msg, just
repeat subject and diff, so what is the point of having it separate?

Best regards,
Krzysztof

