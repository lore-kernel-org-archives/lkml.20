Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BA047ACCE;
	Fri, 18 Sep 2026 11:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789732564; cv=none; b=bqjaDmfHdgcHIXYcSnux5ILUV9RaPnzJdnvYw7lsSGgPzMf5OTdOdkgxVy93sqthXEe5A9o/1ql6Bhp6R/SQvhzbsdbtTgptnQzMlzAu3D2Qhwz4np+ZE4qqEOMuw3PhA4bP7ffBk7ZLkOJcQ67uqyogYhx173dy5gHBCcuoR18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789732564; c=relaxed/simple;
	bh=mHv6ysVb9HsSvfqOVpsqwVcpz6DtozA57wQuNvIzemo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Swk+TigciWk4Hvmu7a52EBq0Hb/KqSYyrNU4RPALhffOx69ALDh61ZXuygssKRlcvkDF7H42kzpCFRVih7I/dGUouMCktiqnUWlxP3LoPnKYNrabIZmzWS6CcmVl4MhtFDgwlMeK7Bok0HsWrN+X/ckOQtmXHHGdgBNCazo96/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KlnS1nuf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KlnS1nuf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE7B21F000FF;
	Fri, 18 Sep 2026 11:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789732562;
	bh=mHv6ysVb9HsSvfqOVpsqwVcpz6DtozA57wQuNvIzemo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KlnS1nufGrroGri7hHPEULasJVCD3t2ZVM8nKMa2OWOyP24GiiESWNICy4YEU9ZzT
	 55BEpqXjhHW7RBDEzo2PixMFi8VWx6nPZM7PZwrh8vS/gpF4E0PjpmRuVstJv9e0pQ
	 cutTuNQms0IjzPaIwqEHGemdXhaJg+FrdiaReh+Y7Zus/PKke8J2wspb129dVpdDDh
	 zv1c02THoGtIe5D1GtvzGBkXmqKbZvlQZPag15IAWVbcAk+cAr1vQsTrSegR7y6WXH
	 8ui1ekmrzysT+spu4Jx5mz/ntL9OdERpfHPBCD9HSbJQJrpzPZUj4nlVhi00iwSy83
	 5fUNdgmqUz+Pg==
Date: Fri, 18 Sep 2026 13:55:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Petko Manolov <petko.manolov@konsulko.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, dinguyen@kernel.org, 
	arnemaximilian.richter@draeger.com, martynas.grybauskas@draeger.com
Subject: Re: [PATCH v6 2/3] dt-bindings: arm: altera: add Draeger M48 Module
Message-ID: <20260918-robust-spotted-orangutan-4b669c@quoll>
References: <20260917163157.1380860-1-petko.manolov@konsulko.com>
 <20260917163157.1380860-3-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260917163157.1380860-3-petko.manolov@konsulko.com>

On Thu, Sep 17, 2026 at 07:31:55PM +0300, Petko Manolov wrote:
> Add DT compatible string for Draeger's M48 CPU Module that is also
> based on Altera SoCFPGA.

CPU modules almost never can be alone, thus this is incomplete. You need
the final board compatible. SoM could be a fallback. See NXP bindings
how it is doing for example.

Best regards,
Krzysztof

