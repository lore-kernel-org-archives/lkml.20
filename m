Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377895;
	b=S7MRlIM6TCMfA9+zeEpKuDAStmUIh684Xb0RZzW9HGHQWyekw7XeAxYbuy+M0+ezGnkD
	 H55PQzMTNYKA8NPK/WEqNJE6xgIqhK3YyjHJZrTEEsV8AyAnMc+izqWlJkDdX8xc+3EhA
	 0hjqjzzdab6K0Vrk8Mpb1+MlAtEaL4DxotbLI6At6GoEb8J3OyZeIF8UKb+p9Iva8a44Z
	 beceRN5sbztQsN4b2eLvk/D8isGKDCcoi7TGgqjG8jehda18HfxKvsyWS9jMmGpeX1E7B
	 V4pkvkc4BzYcxuInYTq7sdcjszkUhEVNuc0ufsg0jFR7/fIEQaD7whoQnPbGiLOjLqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377895;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=1gGF1mtAr/lwTqIAotY13/mj9rw+PP7UFZyG/jdv9hY=;
	b=hbJGAgmZtX1GJFHU1bXDmfLQU12qA3EThH9CavSiZeIjuZXVycDg/sitoxOFaVcg41c8
	 XopJT4NgMzWBDbGHJgFu0a30Njs6JQ+6cMtdC8Z5pcRl45hYc67vpYEB7nQMlObQsmxC/
	 /1lqP3R4+UQuA05aIJ/Ousk9x/t7v0ScORo9tzDzsBNgsbkl1mBHP7FQEGsI03A8qQdHt
	 8yHmFgz7YDPVT6ofoB92ERFC1JaqE7060kendc5A7P5I7Yt1R5x1cOdCUyYySZQcuItKS
	 J7n1LB7pNcs8G144duiwCUInXaD0Tv5kdjYvwI+ITGcksojgmjE2Q7hwLVtv00/n1mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hdprGwCS;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEA4606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:31:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AEA4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hdprGwCS
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so10334705e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377893; x=1793982693; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1gGF1mtAr/lwTqIAotY13/mj9rw+PP7UFZyG/jdv9hY=;
        b=hdprGwCSzXf7PRKQ/V5wvfaVkpaM2GmUVffQo54E2zGDxNlDOBku6jVRQrBvOEGPw6
         os5QkDVc5h5REpSPb+OJH/0yxAl9ymggDnYFOn4pUmDwgvn+kjTlv6nTaErQzZHXHGfO
         NvfrNDuU6i/W9D9XQ68WspWENQMBFPh0poo7f9kjoV40fMjuWt1VGQQ3V5CH4uaNdp99
         BDf+G0piQkL8K2u8K5xFRHm28dB1YLroHCLaoW1zvMgSirm0rIfjWpzEKUGrkw4QIusM
         Q7OXVBfjO2rFU0sg1y78nmoid9RwPqeLOMbm/jBjxhqkgsQFkMrokIb0SzzO9BIjLOzV
         XS9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377893; x=1793982693;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1gGF1mtAr/lwTqIAotY13/mj9rw+PP7UFZyG/jdv9hY=;
        b=MuR3GyYJAiEfn3T0jy1PUaKHcNGbf9nXrWyVv8tusl7/u0vW45mBUQCBIutm6jvThj
         /lrrYfGdJOze+77QZUbpOLI/sFBWXhtJDvdOKRFUtBhw9qG39bhImgPz6vR3WYiCxUlD
         rWxjNXMzpF5/orsANe3FMIM3m5kW2MBQZO7hpJVlzMNclule3D9lw0QXEswgehsLUOd0
         kmYm7A/QIW36KgMxtcrY79ZLBKdW5kgh5cA6bZfj/qbubWi+AUrXRWgy08T5+pJOy/u0
         Dl4W6wJ1dCAenXVkN1PV6KhV+uVYhlPYVTl+1sNwy+ehOJ/VrhLS0/NfT26g9cNPd7Ct
         LhpQ==
X-Forwarded-Encrypted: i=1; AKwUvBx20noTSU+4tT/8UWInk6jd1siZOFry3kthXLFypQbQ2VbZNPLidNJt40tSBkyt37YeaDD1vXTjgkH8POA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJObd/eQFl7bmM4eXIHQkINJ4xjBaC7dk2b5vu9anfpIf75rKEt
	mokif688HjSwhEr2k+GYG4tIAJZl9VdaIgtn60dBHi6dzPBFmUHwiAcI
X-Gm-Gg: AYBFou0ji2iTVyjJgsn7FhY26wP9AAf7HynLgVUpWYge4VvgKqaNdO4gz5q5nK8+F+p
	II6Hc/Oq+bny5h9yPOnVt+bWa2gRPu9NZKat+3zwKPA1wOnzbfUhKXCIZx4H8qe3QpTOjayWul2
	wfGBmX5RlzoUt9w5r9SO7ZyimtVj/zCGl0C9df97ulTwY0iBIEe1JnPbX5TguplW7Go/jfF6zgL
	3+xbB01SXbXcw7E7iTob5GUFbckq+6RIs0bChjinME+Jj+lBaDhLHXt1c4IIlN0rIJXd9rvb2+G
	47vD9eCXit+xjrtZK9p44r4AzmxHAh2uJIst1eYjfQS4EDAYUr7KyGIUno0wmRDwd5DTo7DFCeS
	Z3qQx5WijhCz9PFu4hzWf8n0G0F17SoWZ8U4/NLy3hJHMoolMcxE+Rmj/DSH0HG476ehB9DymDR
	DfQQGD48plqd71Ry+wv0tArsRnMrlcTm4R02uNZoC4yfYShZXu9wUCsHUll50W8y1PBVyH+U2sf
	mpHdBGdsEvMp8K3OYY3tBIgTFvGNpWZn2FiMgE3Bg/0qvlIQYTlh8IIa4tFYFPa7LcbGcIS/boS
	KSQGVsUDk4HS2sgEurklw24OjyNDrorlCiTw+8hd8xUfJfkeZeqmgw5jKSJvqoau4g==
X-Received: by 2002:a05:600c:1c0f:b0:4a2:150f:1601 with SMTP id 5b1f17b1804b1-4ac1709a7bdmr62699895e9.12.1793377893396;
        Fri, 30 Oct 2026 09:31:33 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d4f9sm4141958f8f.2.2026.10.30.09.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:31:32 -0700 (PDT)
Date: Fri, 30 Oct 2026 16:31:31 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>, ardb@kernel.org,
 Jason@zx2c4.com, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lib/crypto: aes: use memzero_explicit() instead of
 memset()
Message-ID: <20261030163131.21d8f0ff@pumpkin>
In-Reply-To: <20261029173119.GE1862@quark>
References: <20261028142636.5888-1-raizudeen.kerneldev@gmail.com>
	<20261028155134.GA4041913@google.com>
	<20261028205633.7625d789@pumpkin>
	<20261029173119.GE1862@quark>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 29 Oct 2026 10:31:19 -0700
Eric Biggers <ebiggers@kernel.org> wrote:

> On Wed, Oct 28, 2026 at 08:56:33PM +0000, David Laight wrote:
> > On Wed, 28 Oct 2026 15:51:34 +0000
> > Eric Biggers <ebiggers@kernel.org> wrote:
> >   
> > > On Wed, Oct 28, 2026 at 07:56:36PM +0530, Mohamad Raizudeen wrote:  
> > > > aes_gcm_decrypt() and aes_ccm_decrypt() use plain memset() to wipe the
> > > > output buffer when authentication fails. But the compiler can optimize
> > > > that wipe away, so use memzero_explicit() instead of memset().
> > > > 
> > > > This matches every other sensitive wipes in this file, which already
> > > > uses memzero_explicit() for keystream blocks, tmp buffers, ctx
> > > > teardowns.
> > > > 
> > > > Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
> > > > ---
> > > >  lib/crypto/aes.c | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/lib/crypto/aes.c b/lib/crypto/aes.c
> > > > index e1c191551736..7814ef525239 100644
> > > > --- a/lib/crypto/aes.c
> > > > +++ b/lib/crypto/aes.c
> > > > @@ -1733,7 +1733,7 @@ int aes_gcm_decrypt(u8 *dst, const u8 *src, size_t data_len, const u8 *authtag,
> > > >  		 * Clear the inauthentic decrypted data so that callers won't
> > > >  		 * receive it even if they fail to correctly handle errors.
> > > >  		 */
> > > > -		memset(dst, 0, data_len);
> > > > +		memzero_explicit(dst, data_len);    
> > > 
> > > This isn't for "zeroization" (making the data unavailable in ramdumps),
> > > though.  It's just so the caller doesn't accidentally use the
> > > inauthentic data, as the comment right above it states.  
> > 
> > It is also a parameter so has to be zeroed anyway.
> > memzero_explicit() is used to clear on-stack buffers.  
> 
> Well, that assumes link-time optimization is not done.  The kernel
> supports being built with link-time optimization.
> 
> I guess the motivation for this patch would be:
> 
>     (1) Shut up LLMs that think the use of memset() is inconsistent
> 
>     (2) Maybe the caller really does want "zeroization" for the dst
>         buffer, even on failure -- and this guarantees it for them, even
>         if LTO is enabled, without having to do it themselves.  (Though
>         on success, they'll have to do it anyway.)
> 
> So I'm tempted to apply this patch anyway.
> 
> But the zeroization stuff is getting kind of annoying at this point,
> when it's unreliable anyway (it's not like we zero out the registers,
> which can then be spilled to the stack and/or written to the task_struct
> on context switch) and can even be counterproductive (by forcing data to
> be written to memory so that memset() can run on it, instead of kept
> entirely in registers).  And Sashiko likes to flag them as Critical
> issues, which is not at all accurate.

OTOH, if someone does a memset() then maybe the compiler should never
throw it away?

David

> 
> - Eric
> 

