Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C724E3246;
	Fri, 18 Sep 2026 11:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789732499; cv=none; b=Sug0ay1rLo83EIGLmIcrY4nOQubbV04wZRUP9FYFV7+8+BGg+pI2kWxmj4UIXrQT2f/mgfSuiRHoqPCuOKpTfdYsyS9+0jvVjOwlCiWY3BmpA+Q4e3Q4wzwE3Ze3XdP2tbe0tqxVtANnCZ+QJt85yXvxL+vgmGHppLahFN44G00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789732499; c=relaxed/simple;
	bh=aUj1hyinUTbaDHYw84m2e/yMqAF8Bx2ivUBnt4Pmt4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tAB8c4IRRVsAQbunUVPOeiEeFCdI3JiGrPL180XAb9PbCU7yJJVmF2qLQRFBSaMlf7z9CLEeOhrqROBTMu9FSBJ3d2qy2aLxwCO3GyJQZmqK9cAcpKDHyUym6YLGX62+19DjrV6dlUYMTDTTtqG+OggAl9nli/9v/LiwlMHxM8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XVYnJrwo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XVYnJrwo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6242E1F000FF;
	Fri, 18 Sep 2026 11:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789732498;
	bh=kv9vWZ9ioKWdApWQR8wGrdnCIOGwP5JD+4GkiREsFMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XVYnJrwoQAMw5/SlcH0X6agq01PNi+Ml7wBGTFyh0qdEbUS8e/iCpvOvB9zK7x9aP
	 exyxMIX1j1zCbF1PkmAiKGAt7B6QNcWXVcqyDQhqc7tSzt0ilXqAcyzPnAmTSa4z7p
	 yboR48GdFUQ8yOnJLkuDBToRivSLQ3PeuPMMM0KVXuviZuPxsH9v+Kuz7u1/2bEKCT
	 0ZiWSuXHZxbjaRAsqf+2p/LXXUkT6VthTi87x3AvxSo3BJqyO2jMvhdVOLr1QcyR1C
	 SCW1nUXH0ixxpeMx7iwtYoW/HSANKWF0rxrr9XlK4erxMgCNM8o86Z4NdvTcfO2/Tf
	 JNE2ojy8PSiAQ==
Date: Fri, 18 Sep 2026 13:54:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Petko Manolov <petko.manolov@konsulko.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, dinguyen@kernel.org, 
	arnemaximilian.richter@draeger.com, martynas.grybauskas@draeger.com
Subject: Re: [PATCH v6 1/3] dt-bindings: vendor-prefixes: add Draeger AG
Message-ID: <20260918-prodigious-festive-puffin-af2f2e@quoll>
References: <20260917163157.1380860-1-petko.manolov@konsulko.com>
 <20260917163157.1380860-2-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260917163157.1380860-2-petko.manolov@konsulko.com>

On Thu, Sep 17, 2026 at 07:31:54PM +0300, Petko Manolov wrote:
> Add a vendor prefix for Draegar AG, which is Draegerwerk AG & Co. KGaA
> Link: https://www.draeger.com/de_de/Home
> 
> Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state in the patch changelog
or cover letter why and what changed.
</form letter>

Best regards,
Krzysztof

