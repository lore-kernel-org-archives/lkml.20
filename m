Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F181F33A02B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790580118; cv=none; b=OsDB+LN9u3pKw/oCG02fsImOLgj4SJajU44ncL5OPrNn/JigPQvZeWl1OkUPYqjqEeWtAlWBhE6zgOnncfw/Jw5HpGS0GE4FgSM7BL58Co0WFBJLExhbxzJ4lKN/gjyTY7mM7VbkssGJwpvGSPIZwrTaRbQN8Amir7RRXjQ3XHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790580118; c=relaxed/simple;
	bh=LdRp3BoxsUvuBdgdpYIliSyKMiXdYa8O2gMhJ5qw2Zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eiJdtd0zG2YIjG8iM7ETR9WR7RxshP2GfSBoRyQsIsnub1LnhZD+pziI54WA2O9iSAH6Z8gR+CHm4N4n05XmSEpRav9gVhiALK9InD1Xr6mmcU11BVF3beTXh1FFVY6H2NUv0gujzBTvKx79+2IJdxn0VOKYYaZGOBYpJNNaMSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D0d0H2O+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D0d0H2O+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5654E1F000FF;
	Mon, 28 Sep 2026 07:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790580117;
	bh=pjWZf1auWciM0t/tzIaHilDCX2PzkzFuO2fqxNX40f4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D0d0H2O+wFox1vxz6GaXraMUjdFc8oPkr36VVt6syNwHz/vZlkVRokPyWTEmotW/g
	 TgXiL4DlgHlZNWD3/xrpuxrNQzgVcRCV/aMwU3yDoPdmrZxeIMNpBPpoZdSlicRPFT
	 IKCdyvLZBNC1my1UYL4ucCyEptyXeNB/R5nPSiq9+ETo6NWHamBPNAkY19r7ld/YQx
	 6wlNjpTwndog4VEYnINiQ8G4RV8Gv2Xs2lQfQFi1BIIK5PNNX/lBvWY7znynafAFre
	 0fhVjI06rIwYbLte3+pZSjb1OmxJcAaJBanGwtj5pxgiJlEgpo5TQwEB2SRtzvwPC0
	 HRv0DfAsiZbkA==
Date: Mon, 28 Sep 2026 10:21:53 +0300
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: at91: Replace __ASSEMBLY__ with __ASSEMBLER__
Message-ID: <jypj45gex4daonopod5slfuob2dzbqjysbfanbybt33xu7krlg@muhrmrczdpwm>
References: <20260821083645.200344-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821083645.200344-1-thuth@redhat.com>

On Fri, Aug 21, 2026 at 10:36:45AM +0200, Thomas Huth wrote:
> While the GCC and Clang compilers already define __ASSEMBLER__ auto-
> matically when compiling assembly code, __ASSEMBLY__ is a macro that
> only gets defined by the Makefiles in the kernel. This can be very
> confusing when switching between userspace and kernelspace coding, or
> when dealing with uapi headers that rather should use __ASSEMBLER__
> instead. Let's standardize now on the __ASSEMBLER__ macro to avoid
> this confusion.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Applied to at91-soc, thanks!
