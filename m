Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA4464D9556;
	Thu, 17 Sep 2026 11:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646304; cv=none; b=H551ccrjB+WZ068YzLr+QuFerO5SkPdwPDs4YUNFLYRSv87tTRYGIEVkp+OgRvuP+OuGoJpcO9vnZLkUmtBf7iKxbMRJ7uZdsrcG4XRkOWpZ5ZWIQwczaQWUd1+nUBs5gZY1l6btlq0LM3xv9SnPtoIvxF38q8fSbAhxQtaQb6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646304; c=relaxed/simple;
	bh=mhuNZcGbSmiBOk3nhXyqjRMpYdJx5+fOm6k6FFo8vTc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dWgQ1h8RgE6fCzKnEUvUuLknfpAnt1gFtpMHXvB9jIxEM+s/ow3ZFv+Cgmvg8pddxe6LiTqKflqkOLSVA0ztnnK1EgaxVPJ86WI25Ar/yCy4dKFgbWkG7vu/zZdcsQYycs+Ob3FvrxzjB/cnVSAukPYLONtJY3mW9MRZdCgWEhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 5C37192009D; Thu, 17 Sep 2026 13:50:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 59D6692009C;
	Thu, 17 Sep 2026 12:50:32 +0100 (BST)
Date: Thu, 17 Sep 2026 12:50:32 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Conor Dooley <conor@kernel.org>
cc: aleksa.paunovic@htecgroup.com, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, 
    Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
    Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
    Radu Rendec <radu@rendec.net>, Inochi Amaoto <inochiama@outlook.com>, 
    Daniel Lezcano <daniel.lezcano@kernel.org>, devicetree@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
    Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: Re: [PATCH 1/9] dt-bindings: vendor-prefixes: Add GlobalFoundries,
 Inc.
In-Reply-To: <20260915-engulf-backpedal-fef3a5fc2607@spud>
Message-ID: <alpine.DEB.2.21.2609171247190.15569@angie.orcam.me.uk>
References: <20260914-p8700-dts-v1-0-3267f14ebce1@htecgroup.com> <20260914-p8700-dts-v1-1-3267f14ebce1@htecgroup.com> <20260915-engulf-backpedal-fef3a5fc2607@spud>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 15 Sep 2026, Conor Dooley wrote:

> > @@ -1104,7 +1106,7 @@ patternProperties:
> >    "^minix,.*":
> >      description: MINIX Technology Ltd.
> >    "^mips,.*":
> > -    description: MIPS Technology (deprecated, use 'mti' or 'img')
> > +    description: MIPS Technology (deprecated, use 'mti', 'img', or 'gf')
> 
> This is starting to look a bit hilarious.

 This should read "MIPS Technologies Inc." FWIW, as that's what the 
company used to be called (note the plural vs singular).

  Maciej
