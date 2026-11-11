Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794392920;
	b=Ds9V+Dj3ShCq4SJwhtgS7hNHyN63NRLnXDWEak8omKiIv/LxhoTsmTYK1UXJqbHozxPs
	 2mskZ6VvLZGf90pf9em6lJHSw5pjbHSakFrmoNDK+DKlmSiu/4iqzWv1RzWxWjQAkZiIT
	 qD1I9h74Z1e6p+daRIPsogkhBKRarfCscqn9UA8bWIftwQdx6uu1ViU0Sl/3fOqMtDS5K
	 xbsJ0AFiFk1Uh9k/PiYVisKcFRd1/KYegsDwJhbO4B62+pX8Y7f+sYB4nPtjGGvwLv5Xm
	 DepPa+9GqLVE1PCPMgK4oc8QtD7AIa4XfKtCkMmMz8YRJSpw0wosLCwn1PlLBmtge+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794392920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=FgfjZ6gPNStEt/RNYx2qJuKKf940MnozlyJhtYv0suI=;
	b=4Vemq87SlrO67VMhSgOHuMZfSkmqZIabkjVRXtqPTCr/YBmDNZfsUp/lOlPdd74Z51ao
	 ldhRno+nN8psyzfh5ItaMjDimDdhU+ttp4/docELft24XkSVBKSMlkS/Lh3e8iU0OXW+E
	 6/FylwYJAl93DlZAhJMnNkikfbtUYeEuyM9H672c1ETX7cJVBogyc5uPlSxNBkaeydk/C
	 I0VbIm0I2Ue8vHfmmx8O8hbBjVs5uY79ks3vqtFQugJ9vpnGzuMclL0W7s0ykTFgByvh6
	 Mo969J2YHWB7Ns18WxU0EfYz/Zz8QmXa9ORrwYQ3ldObj8FInr0VE53cJcitZ9dUWNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zWDbBcPl;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37219606A882
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37219606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zWDbBcPl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490a0e72588so1642477f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794392918; x=1794997718; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FgfjZ6gPNStEt/RNYx2qJuKKf940MnozlyJhtYv0suI=;
        b=zWDbBcPlqS1AC19c/HKVJJivTF+W3QDFDNQtIKOvb3hEChlZ4gd3uHJGRCqzbATgi+
         4WA95HRAW2CM31vuAQddh7JXzptPeou2EnYnKEFZGeKj3eOKR3tQjEXWHFnPKbtomdzT
         qYebL4M08+kzm+fecTEfuUPhgT3cf2mQl38aA0zBrA/RVjVllPMR7+CI+ypkaVRyCVHv
         JyASfAk8iIqtIvzNX4yFl994GJnBbETlTTUETK2oIjy7wEOHZ2MHdtCi1gKcVIEdxh/5
         IXw9112LmYt355Rq2qfFzl+8sFHcxLKC9TnUDf617SM9jDHfoqgOW4LLz/zDpS2v6VsY
         vYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794392918; x=1794997718;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FgfjZ6gPNStEt/RNYx2qJuKKf940MnozlyJhtYv0suI=;
        b=pHB5j0P6nol+QSdVF1VuRsml8xOEgioEB2AHWUWGWcTxSmaMtafo50WM7x1leAinuI
         +bcSW5dbpSt5K7tHkBb2E9ByGPnNXn/cjXPel1/Qh4Fq9jrUuHzjlJOnF3KZ+UxDIKb5
         LWiGwOqMcM/Lw02/OznfStBglGiSrj91MSrQ77aK7tnWg2WfOqnRexFKv59MJ28Zqc1r
         NnqlEnwwTEBvbwr32gs5oBNO1Rbjbi9tvQ9zuRwmDZ4i9ON7uIEBBL0hNLxsvS2Yhb+1
         LMB9g+DBMg8HMMtEqgMb62cP3F5aOOoQK1vMPCOBDLgqJ03hxxY9RXUBmYgudMsk/RKM
         Krmg==
X-Forwarded-Encrypted: i=1; AL+hErGrXE5i09N5LDLC5uXPPZNkHpHhsNv0cz/sCPRbxXfFul78qBEem/H4rTGADjxYUv1gneQ6hJc5Glo62kY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sxwYtHwtBXBjobTKf6NlYKgGRvfaMEyJW4IuYUdHSUTgHbmsR
	KX4kbUAddQxBwEaMIA8SN5sjTnkMnNQoaObsEhUtu8tnH6qCF2SXdr2D
X-Gm-Gg: AYBFou2wABExAAfWr7bW0zGwZEUrUcD+VHPPpAydJpu05EqSdb9Kx/uNCSukrbRVKNX
	WaZcFQ/Tf2lck1WOjhSHXWxx7ZE7NNB2ZO2lj3MVs9gNWD41cKklw+b7MBWp8fEjmmrKkHjPv1j
	m42KSukhuZAorXYGOFoLK2cwmD5MkkYkp2LlUURRCm7wNrh45KrTuhrBLzytdjwPvF+XeWZtc4n
	Fv7cdWO4nKRLR3HWfX3t4qXbafV1u4XZdpKHxMqMj54g2ewWgSYXFd5dem6fQPtFC8RbJhjxC3Y
	XnYQufDDc2iRzOXoNSl1FBWmb5Cvmtort3A8B3Z6RrpJty0/iR0E7Bd04SQGHZ5roTUGzrc5fsC
	4WWVW7iILdI5K7ECPGBeUJZZ/OOjl76mQZdFnocZ39LedKuXRF0t6AZO1OM8SHFgYhX/EwbsKlj
	bCF80iAjVBNMZ0iOydkZgq6B3TflBx0GYums8Vc3mdnSkdpweJout8pgQcogbBFrwHbKyzL9bXt
	Fb42Sj7oyYTVOaBy10QZxkhOZGDez/Gr3p7HiBcMy5l3cH7b0pGIKRTLPYbP5ZKRunLUO8CVq2y
	XXe3Cs4RjB8xJwxwC9ovyPNDLxJMruDXSaQFrVmeegbRBrJ3cr+aUXth9yuMwO7MnA==
X-Received: by 2002:a5d:5f47:0:b0:48d:ef7a:e59f with SMTP id ffacd0b85a97d-499c75528cdmr3034821f8f.17.1794392918442;
        Wed, 11 Nov 2026 02:28:38 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498361f674fsm10337668f8f.33.2026.11.11.02.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:28:37 -0800 (PST)
Date: Wed, 11 Nov 2026 10:28:36 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Alejandro Colomar <alx+linux-hardening@kernel.org>
Cc: Joe Perches <joe@perches.com>, Alejandro Colomar <alx@kernel.org>,
 linux-hardening@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Andreas Schwab <schwab@linux-m68k.org>, Andy
 Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Daniel
 Scally <djrscally@gmail.com>, Danilo Krummrich <dakr@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>, Johan Hovold <johan@kernel.org>, Kees
 Cook <kees@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Len Brown <lenb@kernel.org>, Linus
 Torvalds <torvalds@linux-foundation.org>, Linus Walleij
 <linusw@kernel.org>, Namhyung Kim <namhyung@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Saravana Kannan <saravanak@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Tom Zanussi <zanussi@kernel.org>,
 linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 5/5] string: Make strprefix() const-qualifier-generic
Message-ID: <20261111102836.759ec121@pumpkin>
In-Reply-To: <avOn57pfHntiwcaD@devuan>
References: <cover.1794323750.git.alx@kernel.org>
	<35bf6672f84f07de3f40e8db9e7fcfd643894fec.1794323750.git.alx@kernel.org>
	<64aa89daf23821f95780813fe96882ff61688578.camel@perches.com>
	<avOn57pfHntiwcaD@devuan>
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

On Wed, 11 Nov 2026 00:27:28 +0100
Alejandro Colomar <alx+linux-hardening@kernel.org> wrote:

> Hi Joe,
> 
> > Date: 2026-11-10 08:32:41-0800
> > From: Joe Perches <joe@perches.com>
> >
> > On Tue, 2026-11-10 at 16:33 +0100, Alejandro Colomar wrote:
> > 
> > no commit description on proposed patch  
> 
> There isn't much to say, but I'll add something (the explanation of why
> the parentheses are needed around the function name, for example).
> 
> > > Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > Signed-off-by: Alejandro Colomar <alx@kernel.org>
> > > ---
> > >  include/linux/string.h | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/include/linux/string.h b/include/linux/string.h
> > > index 9e59f9697c9e..55ca4cb5122c 100644
> > > --- a/include/linux/string.h
> > > +++ b/include/linux/string.h
> > > @@ -590,7 +590,9 @@ void memcpy_and_pad(void *dest, size_t dest_len, const void *src, size_t count,
> > >   * *  @s+strlen(@prefix) if @s starts with @prefix
> > >   * *  NULL if @s does not start with @prefix
> > >   */
> > > -static inline char *strprefix(const char *s, const char *prefix)
> > > +#define strprefix(s, pfx)  const_cast(CQChar_of(s) *, strprefix(s, pfx))
> > > +
> > > +static inline char *(strprefix)(const char *s, const char *prefix)  
> > 
> > Why introduce a new coding style?  
> 
> It's not style; the parentheses are technically needed to avoid macro
> expansion, since the macro has the same name as the function.
> 
> Alternatively, I could rename the function to __strprefix().

Or put the #define after the function definition.

David

> 
> 
> Have a lovely night!
> Alex
> 

