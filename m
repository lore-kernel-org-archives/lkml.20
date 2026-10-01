Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6D4175A68
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 11:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790854358; cv=none; b=os8cRlbZY+VyoIG1UzEqU03ip7FX9tCtOS7GmXc+jQNwIE1hIVv4QCADCHBRIIjbmjXcDAwanXFWAmXZlmh+GFFm9hx8B7FHklQ4ntp1MMuhxZJxYFIpPMwBpqkOqfxY2kDAth9fMo6IS4R0O2yPCYDLxANFilW5uWVR/399S+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790854358; c=relaxed/simple;
	bh=j3nEIBv4oOHy0M7pgLSoVMzyeqoJJEGXHTcpGG2mOTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xo2oYFVaZVZJGRdZqGlIsSNqnxu44VZnTPmsvPGxq6h9Q/a3YlsbKl1lsf5JR4E/X2veh+BBNqixCA33lxNVh2QAdgWFDEdD1WztutyT8AiT40CRg0KpaVSwjdaZHCq9CAaPDJgbe79K70drQaDxBrhJLGyU8xhVfbikNtGOc28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j8lQaess; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j8lQaess"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 870341F000FF;
	Thu,  1 Oct 2026 11:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790854350;
	bh=hW1lFRhTfd1XvPXBZZ4fZBn5mUdcZRR29Siru0Ej7Fc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j8lQaessvpy0Sge3/FTK04t5fXsU9wMJx20b79fxBhSvAoPBddsGQ3hHEtwLIkT8m
	 u9z33Vn2IkVC0mgn8cYj87xL8LC57fITgnHCA3D2VPwiiqYBrWAfaxMHAWAeG1+xY3
	 /Izp8FJBIV0XXc9MYdrIBi3YZOQzPOAGaWL6lgpAJy7ei4msBLXrwu/9B9xcXEd/JS
	 8DO1mG6E2/IycQa7gfpzr3tjsv6S96JYLuLRhE0ENkMy5GiGp2G/zEqDNtPNYqQPTK
	 ZREKjyVJfzzhlxPKBKy31zJZL0gUd/rCtw06Zl9obkUbYK+z2o8iItqw2JBiO+uswr
	 oNzN1ZYO8yWrw==
Date: Thu, 1 Oct 2026 12:32:23 +0100
From: Will Deacon <will@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 19/21] arm64: entry: The great stack switcheroo
Message-ID: <ar5Ex6nNxmdgzbva@willie-the-truck>
References: <20260918161407.2300-1-will@kernel.org>
 <20260918161407.2300-20-will@kernel.org>
 <CAD++jLm=9RyVXf+hqFCMir2dBFbwysR5g8Tp2_14H48xtLx8Uw@mail.gmail.com>
 <ar4LWGJ_qfV71_Ia@willie-the-truck>
 <CAD++jLkipuU0PcEvr=Bqy86Av_y9YBuVFsw6dtgy9zbkAWNU=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLkipuU0PcEvr=Bqy86Av_y9YBuVFsw6dtgy9zbkAWNU=g@mail.gmail.com>

On Thu, Oct 01, 2026 at 10:38:22AM +0200, Linus Walleij wrote:
> On Thu, Oct 1, 2026 at 9:27 AM Will Deacon <will@kernel.org> wrote:
> > On Wed, Sep 30, 2026 at 11:36:35PM +0200, Linus Walleij wrote:
> > > On Fri, Sep 18, 2026 at 6:15 PM Will Deacon <will@kernel.org> wrote:
> > >
> > > > With the kernel stack pointer in SP_EL1 and the overflow stack pointer
> > > > in SP_EL0, it is now straightforward to switch between the two on
> > > > exception entry from EL1 by writing to SPSel. However, since exception
> > > > entry sets PSTATE.SP to 1 (selecting SP_EL1 as the stack pointer),
> > > > repurposing the overflow stack as a more general kernel exception stack
> > > > would require writing to SPSel on every exception entry from the kernel.
> > > >
> > > > Switch things around so that the overflow stack resides in SP_EL1, with
> > > > the kernel stack residing in SP_EL0.
> > > >
> > > > Signed-off-by: Will Deacon <will@kernel.org>
> > >
> > > This patch gives me panic, and as can be seen from the review
> > > comments need some love...
> >
> > Please can you share the panic message? I'll definitely be reworking
> > this based on the review comments, but if there's a bug it would be
> > great to see the details now!
> 
> Haha. I was not referring to the kernel function but the emotion ;D

Oh! That kind of panic is easier to fix :) Are you going to LPC?

Will
