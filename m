Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B633E168F
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 03:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791084056; cv=none; b=OHsBA1+Gv66g+44HOCJnDRaKoDIyku6k/5udbAVe9rBQ2JsgvN1zzIeTwDIlrccq/YgrjS02yD9QU/L+jh1Kpjn2nQOio9cpYgArolLylBu4SaOydiCWqvUnqg2HuEfevkFsWhIhLhDwFSxlTvfQmUp2Qbv839d0iVzXikcn/SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791084056; c=relaxed/simple;
	bh=ZuoVLXI9mZ7Ed8I5MUuPHCLNfDIzZ0wmyd2KS2Qgu5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bMN7XeZAWKpFuHhz0xzh6IJDL15Voe/ocSPMKaLRT4QuUGS4jpe+4ydpRMl8nTNlwtwmHPuaIu7huW80n4ZtxsxzkG1YQCNg/Um891/HQ9fK9Ijhll2dHSQOCaqYebQX8Y5d/f12SZmwmYUR6Fg/kFYeRY8ypXdZgkLOZcWYSo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B0XgZHiw; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0XgZHiw"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33c11ef641aso926623eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 20:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791084054; x=1791688854; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x2thzfSt5QLT8HAsgWdixq/Y9P05apsvpgjsWLwXNuo=;
        b=B0XgZHiwIuXftckS6QbH+LUuWK7NJZDT3/wKixb7SF2xgjN+IcAmACMyKp3RMn14Go
         op8+gW0fVXk5In3Gk89F36XPaIhwDc4TYGoaIOsSBpRS2j6CRj6GZUG5305h4dTrsLCO
         GqJ7Fz6CvTGCBXVHAGDkOQTO8hNn37AvcVSWejREOxelnu7OgwXs13R6mbEIZM2QOcEA
         FYT05de1UJGniKCblrixXDM3hguvsd9VI2Y1fVaeoiyYOxnQ7qge7S/dK7WLirdrhLkh
         c/No4shSCuZfOUkHMeiHi5g3ESe6S6RVvZxODTLSSige2A7MVdGT5u74ND/C3RW3a1sW
         jQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791084054; x=1791688854;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x2thzfSt5QLT8HAsgWdixq/Y9P05apsvpgjsWLwXNuo=;
        b=2V0sax48D0shMJ+4GnjfPklbU25I/R8ip9RXXvQcaZpdmd2FBrjTnIKmoodCklhGzI
         temzXsjgAJ9HHycMS6Xwh9KMdVV/WingoM479FjjnekPGiKZjsRwD06nxBZYnSOP7eM9
         4tdtWp8zM0S9NdiF/BiF2YZ9iiLpG15hU/ykwgUsIChci2T1Yx+oUK4HQ8wBsQKuToy4
         rzfIW+opeJ7HTb1QFH4+p7ip6mZQoKdRRlMshRe7G+51npu/vui27+KTjXIh1MN/+qES
         5M9kV8CnHsDveQp1DnbCFS1RUJZlBLhpLflHqWnUUlkW3/PE/1zEu4xrzB0AQGPKX3tj
         6oCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpvWpBKu5s+RWegQWCyk4Xi1JxJ3tOdvZmaRG9VyFxTwH02PnruvoG7CnNCbEfQD5NRXkCDGWq1OAiPmU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRPA46jYZiY8/e0xSa8oG5NEnB2PeR9eVA7VnmI7HIvqvZdcVj
	krKCrW8wWr2eXzlBePUjt9m0JODzdZb0wh/P65oNpo+UeiqmvLXg+/eq
X-Gm-Gg: AYBFou2+eyPB10PqY9YgsTOIZMKNA7vdAk7/H1gxbB1D7jY6Bk9Qu3Kk8RODAEX9frK
	+qYlmY14XXds2MCbvJ4yBj1lIg9WTGzE4fqiBbQ1NUjt0LCEWs721nUrue/EFSVHaftFn1uLOZj
	P/8P8ciEfBlM3Nb0zVsWYM6Jr03xAKGXPQiiDPHDOspq2NoQ11c840NIR40UPIiz7o6VdPzbpnh
	N+9ziu3q5CfJ5hhtVuy3Ngv2SAQqwrRODBRA2zk4iIt4Jh94cWa/WccPwhMXbh0GqCV8OqYuEi+
	ppqLl1X+HYuba6Ic12qlwHak2yGIvFA4K11h7ZkpB7u/hxE9435RDv9GRarRQXdeMkwBTeSXeRG
	S/6lXeRimHd8R7hJHzoVfkaZqR63NOGXpwO0UpX21nRDcjys3qmcKo3JkLC+3RK76hdUqlBWEmv
	VqvsrVZ5Aea5KmFrRtn5t8ba8LzabOB27vyranO4ZPmXODGcbXKOy9DL7c+YutTYc14pbBSfP8E
	wKAUZ6KF+BduClhU04=
X-Received: by 2002:a05:7300:6a90:b0:339:8131:424e with SMTP id 5a478bee46e88-34f2185ad93mr8712750eec.34.1791084054190;
        Sat, 03 Oct 2026 20:20:54 -0700 (PDT)
Received: from kernel ([103.219.206.69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351272bb9basm1070301eec.24.2026.10.03.20.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 20:20:53 -0700 (PDT)
Date: Sun, 4 Oct 2026 08:50:47 +0530
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: ebiggers@kernel.org, ardb@kernel.org, skhan@linuxfoundation.org,
	me@brighamcampbell.com, jkoolstra@xs4all.nl,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] crypto: chacha20poly1305 - Fix missing state zeroization
 in xchacha decrypt
Message-ID: <asHGD1_z-N9k0czy@kernel>
References: <20261003060826.7792-1-raizudeen.kerneldev@gmail.com>
 <asFj6Nxf6fglYfor@zx2c4.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asFj6Nxf6fglYfor@zx2c4.com>

On Sat, Oct 03, 2026 at 10:22:00PM +0200, Jason A. Donenfeld wrote:
> On Sat, Oct 03, 2026 at 11:38:26AM +0530, Mohamad Raizudeen wrote:
> > The `__chacha20poly1305_decrypt` function does not zeroize the chacha
> > state, unlike its encrypt counterpart. The regular
> > `chacha20poly1305_decrypt` function handles this by manually calling
> > chacha_zeroize_state(). However, `xchacha20poly1305_decrypt` returns
> > the result directly without clearing the state.
> > 
> > This leaves the derived chacha20 subkey on the stack after the function
> > returns. Fix this by storing the return value, calling
> > chacha_zeroize_state() and then returning the result, matching the
> > logic in `chacha20poly1305_decrypt`.
> > 
> > Fixes: ed20078b7e333 ("crypto: chacha20poly1305 - import construction and selftest from Zinc")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
> > ---
> >  lib/crypto/chacha20poly1305.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/lib/crypto/chacha20poly1305.c b/lib/crypto/chacha20poly1305.c
> > index ea42a28f4ff7..03b14d272520 100644
> > --- a/lib/crypto/chacha20poly1305.c
> > +++ b/lib/crypto/chacha20poly1305.c
> > @@ -199,10 +199,13 @@ bool xchacha20poly1305_decrypt(u8 *dst, const u8 *src, const size_t src_len,
> >  			       const u8 key[at_least CHACHA20POLY1305_KEY_SIZE])
> >  {
> >  	struct chacha_state chacha_state;
> > +	bool ret;
> >  
> >  	xchacha_init(&chacha_state, key, nonce);
> > -	return __chacha20poly1305_decrypt(dst, src, src_len, ad, ad_len,
> > +	ret = __chacha20poly1305_decrypt(dst, src, src_len, ad, ad_len,
> >  					  &chacha_state);
> > +	chacha_zeroize_state(&chacha_state);
> > +	return ret;
> >  }
> >  EXPORT_SYMBOL(xchacha20poly1305_decrypt);
> 
> In my memory, the reason it's like this is because for WireGuard,
> xchapoly is just being used to encrypt a cookie value, which has no
> forward secrecy concerns at all. So it doesn't matter if it's left
> around on the stack.
> 
> Are there other use cases, though, where you think it might matter?
> 
> Jason

No, none that exist today. The only in-tree callers are the wireguard
cookie code and the kunit test and I agree the cookie has no forward
secrecy concerns. My only thought is that the function is
EXPORT_SYMBOL()ed, so a future caller with a long term key would leave
the derived subkey on the stack and since chacha20poly1305_decrypt()
already wipes the state, having the xchacha variant do the same seemed
like safer default.

Also, Eric requested a v2 that moves the zeroization into the helper
function for consistency with the encrypt path, so I will be sending
that out shortly.

Thanks,
Mohamad Raizudeen
