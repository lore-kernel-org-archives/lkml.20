Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34B165237B7;
	Thu, 17 Sep 2026 13:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651402; cv=none; b=SRi9Jx7wUSI/G8jDyLPxmmBj7f2dR1ESIeTp+0g5gqNANbA1fQNFFMgOZb9t645IivdWpw9qODTLGLYR2DY2EHTnGJ8yR8eWqe5PrzdNKgX/ukCs/pDJtAUntIHj6p7dnurNcxrKzEqcYAO2pMkHWkGkQmD3fp+jZ4Xt4JsaxHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651402; c=relaxed/simple;
	bh=SE+uYkL45foSSoTA1vwsCAagaEeuyJPJ9nANf7lwtBU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HtrrWvK0Tj6OwGuZXmqIMbU7J1m9PWJTpINchnGUFKHVWSHvPc+/LzA9VDcSPlKrasidGEfNELr03Io6Q9qMB89o4f1yiD3kIaMsLxbnInBDULB+g1C6SXQUjMBoclXBmoQWZ4OsWUOwJAMTIYxnJ6qI+5chIoSxK2Z1//Y1XzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id F1AF992009E; Thu, 17 Sep 2026 15:23:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id EE31D92009B;
	Thu, 17 Sep 2026 14:23:15 +0100 (BST)
Date: Thu, 17 Sep 2026 14:23:15 +0100 (BST)
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
Subject: Re: [PATCH 3/9] dt-bindings: riscv: Add MIPS Boston board
 compatible
In-Reply-To: <20260915-woof-ducktail-5e2f52bc5762@spud>
Message-ID: <alpine.DEB.2.21.2609171254060.15569@angie.orcam.me.uk>
References: <20260914-p8700-dts-v1-0-3267f14ebce1@htecgroup.com> <20260914-p8700-dts-v1-3-3267f14ebce1@htecgroup.com> <20260915-woof-ducktail-5e2f52bc5762@spud>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 15 Sep 2026, Conor Dooley wrote:

> > +    oneOf:
> > +      - description: Boston FPGA development board with a MIPS P8700 bitfile
> 
> I'm not convinced that this is specific enough at all.
> I have absolutely no idea from this description if there's even a
> specific FPGA involved here - this could mean a bitstream used on an Altera
> platform or a Xilinx one, with totally different contents.
> I'm only happy with FPGA bitstream content being supported if it is
> versioned strictly and matches with some clear and obvious releases from
> the vendor. I cannot even find this board by googling it, let alone find
> clear information about what this could correspond to.

 This stuff has been around for a decade now; cf. commit 6e62a888029b 
("MIPS: generic: Support MIPS Boston development boards").  Public 
resources have been scarce.  Here's the best one I could track down: 
<https://training.mips.com/cps_mips/Examples/MD00901_Boot-MIPS_Example_Boot_Code_for_MIPS_Cores.pdf>.  
Expect disappointment, but at least there's a photo of the platform (p. 
142).

  Maciej
