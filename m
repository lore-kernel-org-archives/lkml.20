Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2414A4B4891
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 14:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791385191; cv=none; b=jrVuVOIPCcU6WGMhiFKLO4j405P4jK7vcQmcZ/hx/GdU5gKgi3jYMj85OlJpAVLfhCgX7ftf1kQuy702uOPaYuOuRRHx/eUGyk5dueTDsJ76YtvEl/pkFCNT0AK1YWDER1uPQNOfaTd0tEGyi0Y7GpwCHnzwKoIjBzj/c8rftyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791385191; c=relaxed/simple;
	bh=Z2Bdct4GuZTfHJrkKxcsnWcaneoEa+kNJUkdRNO7FVY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=vFByNf1VMeZR7ZDFHytSBOptDxwsg5nfob2ijVAFc7NZpTNfi9daJqWx/Ic1HfZBXIi7a7tXu/I9uWfbrb8T/PDuAwTkOtzas/JUmQdILrO5yOjSVrqSS8uHejJJ6oDJQlnNmmk2byzQOlE6Jwt2bFbuEAnjHqDQIw2iYyC1Izk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WgXBQx74; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WgXBQx74"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57F431F000FF;
	Wed,  7 Oct 2026 14:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791385187;
	bh=RlbDPA6UwQ0YRs0y1zeJhCOYJioG5GQ5Xlbiv1h43G8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=WgXBQx74jpl0plYm2kVRYv5yN98oRwxzz/GBR1MpGMGhA/+pGKF2gzsF/PJXYo2+k
	 bxDF8AeVQVrY9Zi5jIEemlWBCbU5plt9WrUauBfyZY3pxKu20+HGI24Pk6mXcC0TFp
	 1nbdpHQmOQRGaWLC4TTUO4hGGfBpqd+vNl0HFOoigPYDb3jTwYDyUPDuoQhqT1Z8C+
	 zUFgWdmL6V3/ACgFAvx0Y1d1HVD/aExB1qg/r4ltTG4ZvagywX63T+TKGOQMg+cBhU
	 aiTnPeRJLKUf2tI7XXeJm9Eju2EbwgFgsFaoEA/86MzrXKKpmXVndsCa6bF0BHrUts
	 DhwdDDhQG7EaQ==
Date: Wed, 7 Oct 2026 08:59:41 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    "Maciej W. Rozycki" <macro@orcam.me.uk>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, 
    Djordje Todorovic <djordje.todorovic@htecgroup.com>
Subject: Re: [PATCH v3] riscv: Add ERRATA_MIPS_P8700_WFI to replace WFI with
 mips.pause
In-Reply-To: <20260917-p8700-wfi-v3-1-ada4b0584712@htecgroup.com>
Message-ID: <cd400f89-a125-3f8d-3b76-ec1e19976823@kernel.org>
References: <20260917-p8700-wfi-v3-1-ada4b0584712@htecgroup.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Sep 2026, Aleksa Paunovic via B4 Relay wrote:

> From: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> 
> The MIPS P8700 has bugs with the WFI instruction. A WFI instruction
> after a mispredicted branch can result in erroneous address
> translation on the MIPS P8700. MIPS has not published an erratum
> for this.
> 
> The workaround uses the RISC-V alternatives framework to patch all WFI
> instructions with the MIPS P8700 pause opcode (0x00501013)
> at runtime when running on P8700 hardware.
> 
> Two call sites are patched:
>  - arch/riscv/kernel/head.S: secondary hart parking loop
>  - arch/riscv/include/asm/processor.h: wait_for_interrupt()
> 
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Thanks, queued for v7.4.


- Paul
