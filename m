Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794059835;
	b=gIIyYgiPr2wnC6neItAjh4MZr7LEwqQhSlLSGb29m4DopNvnznpTCgHkY+U17yT8H4Fv
	 DLmHUWlxTwxXaqdIqvH/WWuQpoqzHUAFCFE568RJVvrCkqcZ3mtLKJrFJM2mCEx1wu0jS
	 VNw7kQ2E8EsNdE2KKfe23bLmFZJDsb3efMfapGYhhMim1C3QONnIAH/l9Z8pG7qyNt/nV
	 oXR0py7c7CVwrgo1QeaSQKWd9OkKh0q+bAwECJM4wnvArM0rRFV7iaViseEduixcV3Lp3
	 Pqr/m8tsuihPkHsZ2WxZts9PEzFkCFYcl91QTHKu95ahT4zyd/MmJvNYMbDrkWjWm5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794059835;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=rQazHl2W8GRFaPbw5/2n0Q0BbcZXjLMKmMtTBId1V18=;
	b=FTG/uLCn73fEXWxAFr6DtvV/6YWopNmXG+mZITyD3nmzwJtmpbLOcVLJGJral5nl10uF
	 U04gWKzBBv822q2k9NsqT48sWdoDT7pSmzwoWQwrc49jNZCVqj4BLAjhXt2E83KfhWjSs
	 Cf5YuiRDOm2f8P00ngBKkre7/253yXq+bf8nMva6fJlopEQWD9X4D6+V3L2yJgK4efP/b
	 H+XrU6dPeek9UFQrJEXoD+LDHDM7HzfVivagaGa0JrlA2CYLVLjIH+9kT9GQ80JPjR4PN
	 Bigfc1Jy48JlTxVn9lQzkMEiPjjSkHI4PN581j402DHxYc55OrbkXZUW74fYQay9TFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XKzvDIMX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE5E606A326;
	Sat,  7 Nov 2026 13:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XKzvDIMX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2743C1F0089F;
	Sat,  7 Nov 2026 13:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794059835;
	bh=rQazHl2W8GRFaPbw5/2n0Q0BbcZXjLMKmMtTBId1V18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XKzvDIMXM6sSQT5afdfqdOS/6BxFI0tmsMj00iT+Y2QeqEU9yMLtBMbMSYVlceoD3
	 5OwGgtgpwT1MXCdMRFeYd1QMHMB0Wo4NyGTUgH0PTczIs48Pw2y0WIbUyzrveOpBBm
	 d2YzMyVBh+fXdDDQO+9dmD1E71kD5yh1+d4pnxE1Sa05vIk3aGJVlfrqWjH4B5as+U
	 YIOlbkDwJy0Pxkawe4eUENJyPd6wZVd7I0c8uxWQWKQVOo3uHrD33/ymv7KL7ALDSG
	 aWYq2bWmYpy4LAwRFdS5KRBy5x4Xu00bQbvnKxa7TfwEkqndlsOIRgx98gBFzp4KoU
	 IRfgxazoXeFQg==
Date: Sat, 7 Nov 2026 14:57:09 +0100
From: Thorsten Blum <blum@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cen Zhang <zzzccc427@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	bui duc phuc <phucduc.bui@gmail.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: info: Use snprintf() in snd_info_card_create()
Message-ID: <au8uNTlz49yooqNf@kernel.org>
References: <20261107004338.323417-2-blum@kernel.org>
 <87a4nlypdt.wl-tiwai@suse.de>
 <au8h4SDC6fKaY7st@kernel.org>
 <87tslsycva.wl-tiwai@suse.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tslsycva.wl-tiwai@suse.de>

On Sat, Nov 07, 2026 at 02:44:57PM +0100, Takashi Iwai wrote:
> On Sat, 07 Nov 2026 14:04:33 +0100,
> Thorsten Blum wrote:
> > 
> > On Sat, Nov 07, 2026 at 10:14:38AM +0100, Takashi Iwai wrote:
> > > On Sat, 07 Nov 2026 01:43:37 +0100,
> > > Thorsten Blum wrote:
> > > > 
> > > > While the current code works correctly, replace the unbounded sprintf()
> > > > with snprintf() to bound the formatted string to the str buffer.
> > > > 
> > > > Signed-off-by: Thorsten Blum <blum@kernel.org>
> > > 
> > > Shouldn't we use scnprintf() instead?  Otherwise it may lead to a
> > > compiler warning.
> > 
> > The only difference between snprintf() and scnprintf() is the return
> > value, which is unused here. Both are correct and shouldn't trigger a
> > warning.
> 
> Well, not really.  For this particular patch, it doesn't make
> difference, but in some cases (like the use with %s), snprintf()
> causes a spurious compile warning with W=1.  e.g. try below.

Agreed, although that's a different use case from my patch.

I don't see a warning when compiling my patch with W=1, but I'm happy to
switch to scnprintf() if you prefer.
