Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B74D48E0C6
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 07:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790839662; cv=none; b=WGaZFMMsLgxZxLRAVKRcXpjef/ymwLILTfceKExvhqw57FLZ2Fiwk0/YuMoTpT1HCdf/7Z0nUXwoci4qAg6igoUtrin9pLQ44ILpVRGruGaeOvwKfQ6pMMoIjYmd4NDv8A6ROSkZGpGXrBJtpzQNnh2aZ7jYH7CM2eJv/P4ok8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790839662; c=relaxed/simple;
	bh=SmobSyFddogGFeY7M2R8q3FfXAqnnVco+qzB3Pyn1So=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J+NAnMzMNCxZ8HXiN70DGut6f/3MA/7ZWkNxpo35zYBF/EMlahQi9zUaOh+yVQKhvjRM1P7OJ4ZjF8z2CaexV4fz1jmVjxrXJ67G47ifQeF0xn9CML/z3M7t4MmxHc1N/UFHGeRd1yPd05IaWyVn6Occ+U6ix6yDz+mvA2HbiRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P2/aphZq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P2/aphZq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 832F41F000FF;
	Thu,  1 Oct 2026 07:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790839646;
	bh=Yn+BNDD3uVIMrlfbHqtIvEfB4qrTW1vWxSV7SfUpzfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P2/aphZqkksPSqU/+moRoc+UVy5ITbdkRSYXR5ZLi7chDLk5ojqaffNC1+Nqb/ufg
	 wK0phOBnoqb6kh0AY/49lpEGUnfmoIkmt/PcRo+dN0l9md6pAqftJuAItzVJREdjVA
	 Uvf8uLD7XdycfIQumf51oZf7XgvgQbuDBTwUJc3LFO33Wm6IRxKUyz3Uk/EQb1IUfT
	 OZ2qtE/9XfwYoiohbcGL8TmnWJXszOmhtmZ/QNrkaDnJUkSv9NgOBRIPphSqR9NMMl
	 nIh9aGL9lGEGNXzIc8LOqx1c+HZZm6Nyf4KN4EcbxetPjXj5xwq6ZlNf5GsVpHn+nl
	 5kLi7X75MKkTw==
Date: Thu, 1 Oct 2026 08:27:20 +0100
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
Message-ID: <ar4LWGJ_qfV71_Ia@willie-the-truck>
References: <20260918161407.2300-1-will@kernel.org>
 <20260918161407.2300-20-will@kernel.org>
 <CAD++jLm=9RyVXf+hqFCMir2dBFbwysR5g8Tp2_14H48xtLx8Uw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLm=9RyVXf+hqFCMir2dBFbwysR5g8Tp2_14H48xtLx8Uw@mail.gmail.com>

On Wed, Sep 30, 2026 at 11:36:35PM +0200, Linus Walleij wrote:
> On Fri, Sep 18, 2026 at 6:15 PM Will Deacon <will@kernel.org> wrote:
> 
> > With the kernel stack pointer in SP_EL1 and the overflow stack pointer
> > in SP_EL0, it is now straightforward to switch between the two on
> > exception entry from EL1 by writing to SPSel. However, since exception
> > entry sets PSTATE.SP to 1 (selecting SP_EL1 as the stack pointer),
> > repurposing the overflow stack as a more general kernel exception stack
> > would require writing to SPSel on every exception entry from the kernel.
> >
> > Switch things around so that the overflow stack resides in SP_EL1, with
> > the kernel stack residing in SP_EL0.
> >
> > Signed-off-by: Will Deacon <will@kernel.org>
> 
> This patch gives me panic, and as can be seen from the review
> comments need some love...

Please can you share the panic message? I'll definitely be reworking
this based on the review comments, but if there's a bug it would be
great to see the details now!

Thanks,

Will
