Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533AF47F787
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 16:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791046513; cv=none; b=SHDxUzH5tTdu2rR9pAOmwM+zj8pkO4D73xk6QXbNMEu5EVRyUIJzCjsvHjM1qZ2IkHa06eDdqTRCcNzkJFzSatgyAvirbCgWHSxnDVrb0dG/JNvYo2HAD3AfMa7tZMijEDgtzJBemU6d2jr5DjQO29YSzSWvG3u2BD9r3i8o1Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791046513; c=relaxed/simple;
	bh=X+JsHy9hcmmtZJVBa9Kkkln84dK+oOE5eRwAZnxmFJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nIeocJkSvw1HQXcqI0WKeueR+vCb+MlJ+hmrkw0yLDnI9udeTzLJ09WeatzZq1AZUvWjdoTbdVemB+bS7Umc/K5nst0LAItVdJN+gy8xdAUNLGwl//9lFbaZusKjUbxZXkHnQjBo9sq20DVvOpeWcYKZ08wlE25jYKasmcakC/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wpb5/xPa; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wpb5/xPa"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b1743e9c7so383728eec.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 09:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791046509; x=1791651309; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vfNONSg/6lEhGon/gJ7DMZGMT+W70fNRaOzKZcnrLmk=;
        b=Wpb5/xPa8rjPsNtwJuOIGUdW1VZv1F1GswyijTEk3+u6K13k3G9zKd83uHTu8DNBQL
         HlLpFC/tBuNizcPJdF5FFZPkJjbGDILUzZzOrSGX2S+GQyzZHP8N7YTlGuQywOL0hWP0
         moN1QMSJmvpQOIsmpzPkyiQswObFuuE0BxL6huVI22vQdNMwnAeSXAfzx92jWdiLEgD/
         vYUX2O3kjDfwyHc/zeLFn4PHTQ6NndBFrtRe55STFDEhy/qPTJEJKcYRwp9SQYue8vPd
         Qz+FSHTPpobiUMTHs3dKKaYuaT32ljJOAn84e+tfqx0pqn3RSI9wZMjeJ+FbzjmGGVap
         pBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791046509; x=1791651309;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vfNONSg/6lEhGon/gJ7DMZGMT+W70fNRaOzKZcnrLmk=;
        b=JI5igUd1w+xADvFqEMl8NBGwySo/sU4IWemWruTVMZdvwcisxNbg2mQzWOs8E6YLUP
         ZkwzwBiRjwURoGvFCFUJcvJ9x5IKrUXJ+icDEzLp5y1cbjHg/8tUeFhmYBPUziEGuTRH
         NSyoPTezypI4a/2oqsvpROfg9gVltAakBFEZdt2twiy6LHVylc/E8FVVmJjubKyZc5Gr
         H9mOSzZ95Vnznw45HKy/kU8iirX8VL3V+jUGMrIO/jBKcIS2DOeZ3ZZJ1zL03O4uKjG7
         l7fNNCcEcwS1CqDG8wnAmHgEQYwPo4STGlOrT+1LnJUWfaaJib00bFwm08qHCp2Zv1ec
         /yeg==
X-Forwarded-Encrypted: i=1; AKwUvByjtCxlQVNZ6sql9fKm6bjF/cipDZebtVckBw+hLFmm/F0qx3wg/t12tYVIOCtXRvhnu34KB3g3ygc6PpI=@vger.kernel.org
X-Gm-Message-State: AFuF++k6xL3JIBN789gSJ61ybvOg4+GBEgW1bfMvgMlN6oDmtOR6BSGR
	TEJkZQl+izRPnJJVokgH5BmTNmFn71Hj7YA7iG8LiImgnKi9JoXy1t8j
X-Gm-Gg: AYBFou0oAgHF7s48vyoLciVErRgeA7Y9KuNukyVHqbGqxmhhrXY0t7MzcI5KyDo26/T
	zqSvsYsxX2o+oY29frgL9bx4kIzBOnmDQS9RMm+KnEAgrwHoZvIL2lCX/SuMSEMjMO/L8+hjSw9
	0n5nQHpCgXR0zCNn2Ja26s17/CkkdkgSqzF2Csrirh0rRwo8yr0/hJq7PlEQwArR574jidqpryR
	41M7ShQOGM8TMeojr8GqvMeXJ3abzJpwbNqBP44g8Eg7uTKOTPzc/ijy5do45y0DyG6q//7FJnM
	xWGw1CMvXEAPn0Z2Flpa2OwpYXi4yTGa+uT0bi6A7NysF8q7Tn9MbwHC3YnLWTeBbkimqYKdGBi
	AHDS83Y/mRmYzyDczQfN50WPTrROB2zJvPepjKc8iHfEYWWSZOk4JrHwJtcoS09PmjrN+eBFEOT
	b8O380LHGuBZGaKXe9YEZ7OqrE1SjCsA/wPaKZUadrQ9yQY8gwZCIvSEzTtKTB4XXSWItOzvTMA
	RPwh64SjLiAviDf4KOw5fh/gq6h
X-Received: by 2002:a05:7022:304:b0:14a:51c8:e9f2 with SMTP id a92af1059eb24-14f5c2ef7bfmr11363603c88.31.1791046509232;
        Sat, 03 Oct 2026 09:55:09 -0700 (PDT)
Received: from kernel ([103.219.206.69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fa751693sm18671183c88.2.2026.10.03.09.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 09:55:08 -0700 (PDT)
Date: Sat, 3 Oct 2026 22:25:01 +0530
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Shuah Khan <skhan@linuxfoundation.org>, me@brighamcampbell.com,
	jkoolstra@xs4all.nl, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] crypto: chacha20poly1305 - Fix missing state zeroization
 in xchacha decrypt
Message-ID: <asEzZY2-PqUK0N-M@kernel>
References: <20261003060826.7792-1-raizudeen.kerneldev@gmail.com>
 <b937fca8-f436-47a5-988c-963fa1af6296@app.fastmail.com>
 <20261003085757.GA144870@quark>
 <ea68191f-86cf-44b1-a045-237b93a4953f@app.fastmail.com>
 <20261003163926.GC152469@quark>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003163926.GC152469@quark>

On Sat, Oct 03, 2026 at 06:39:26PM +0200, Eric Biggers wrote:
> On Sat, Oct 03, 2026 at 11:28:20AM +0200, Ard Biesheuvel wrote:
> > 
> > 
> > On Sat, 3 Oct 2026, at 10:57, Eric Biggers wrote:
> > > On Sat, Oct 03, 2026 at 09:34:21AM +0200, Ard Biesheuvel wrote:
> > >> 
> > >> 
> > >> On Sat, 3 Oct 2026, at 08:08, Mohamad Raizudeen wrote:
> > >> > The `__chacha20poly1305_decrypt` function does not zeroize the chacha
> > >> > state, unlike its encrypt counterpart. The regular
> > >> > `chacha20poly1305_decrypt` function handles this by manually calling
> > >> > chacha_zeroize_state(). However, `xchacha20poly1305_decrypt` returns
> > >> > the result directly without clearing the state.
> > >> >
> > >> > This leaves the derived chacha20 subkey on the stack after the function
> > >> > returns. Fix this by storing the return value, calling
> > >> > chacha_zeroize_state() and then returning the result, matching the
> > >> > logic in `chacha20poly1305_decrypt`.
> > >> >
> > >> > Fixes: ed20078b7e333 ("crypto: chacha20poly1305 - import construction 
> > >> > and selftest from Zinc")
> > >> > Cc: stable@vger.kernel.org
> > >> > Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
> > >> > ---
> > >> >  lib/crypto/chacha20poly1305.c | 5 ++++-
> > >> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >> >
> > >> > diff --git a/lib/crypto/chacha20poly1305.c 
> > >> > b/lib/crypto/chacha20poly1305.c
> > >> > index ea42a28f4ff7..03b14d272520 100644
> > >> > --- a/lib/crypto/chacha20poly1305.c
> > >> > +++ b/lib/crypto/chacha20poly1305.c
> > >> > @@ -199,10 +199,13 @@ bool xchacha20poly1305_decrypt(u8 *dst, const u8 
> > >> > *src, const size_t src_len,
> > >> >  			       const u8 key[at_least CHACHA20POLY1305_KEY_SIZE])
> > >> >  {
> > >> >  	struct chacha_state chacha_state;
> > >> > +	bool ret;
> > >> > 
> > >> >  	xchacha_init(&chacha_state, key, nonce);
> > >> > -	return __chacha20poly1305_decrypt(dst, src, src_len, ad, ad_len,
> > >> > +	ret = __chacha20poly1305_decrypt(dst, src, src_len, ad, ad_len,
> > >> >  					  &chacha_state);
> > >> > +	chacha_zeroize_state(&chacha_state);
> > >> > +	return ret;
> > >> >  }
> > >> >  EXPORT_SYMBOL(xchacha20poly1305_decrypt);
> > >> > 
> > >> 
> > >> Wouldn't it be better to move the existing call from chacha20poly1305_decrypt()
> > >> to __chacha20poly1305_decrypt()?
> > >
> > > Since __chacha20poly1305_decrypt() has two return statements that would
> > > need to be considered, I think this patch (which makes each
> > > *chacha_init() clearly paired with chacha_zeroize_state()) is slightly
> > > cleaner.
> > >
> > 
> > Fair enough.
> 
> Actually, looking at the whole file, in the encryption case
> __chacha20poly1305_encrypt() already "takes ownership" of the state and
> handles zeroizing it.  So given that, I think it does make sense for
> __chacha20poly1305_decrypt() to do the same thing, for consistency
> between the encryption and decryption cases.
> 
> Mohamad, could you send out a v2 that does that?
> 
> Also, for the subject prefix, use: "lib/crypto: chacha20poly1305:"
> 
> Thanks!
> 
> - Eric

Hi Eric,

Sure, I will send the v2 soon.

Thanks,
Mohamad Raizudeen
