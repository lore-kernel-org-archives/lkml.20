Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793878098;
	b=tsyXUwphPG8ImbHfanSeWSE5uuB8RHozHsleZBkOI/bxPkBAG7MZGP2DOOOqggij3Hj9
	 OlyyTHe2io1a5iGVZB1QmPzi1AVRDuN2+oN1ZD0j8Yv/dnb56jFObuA5l13PyKEwcfhzf
	 WEGXqTdGIPIOMQD4bFX0G5FxJM1LdMebwkYxUKd5Rtk6704TvLs7TOaYZuvgN9p+eXKvM
	 7Vi4hgYPyCHRxJ9IoQNOftg2FyWmbujuS5oFnxvPh38e3SEIn5KmnJr9NJkYz85hn12Xp
	 YnOf2fln57GsV3xImuZF5plCFwu8j+Oe5ah3CGqfYabVDwcUQ1Z2mu3U1qWzNP6ivNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793878098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=XIvvCs+k7eLYLtLSx2FRqYXI7MEHUp/Na9v+SW9QvaM=;
	b=FTpALCBy59k+VUa6XdZObxeICacDptZipP428CHnPxLpBLXFL/hMVpV81UJ/oe/pHO3r
	 Gs7aA2vr8q9w5j4n5iWVMYahILt/Q7sqVQPqQ9616l6vI4KkldSwhFj13LLLSXCA5k6Ax
	 3i8A1+04JufYYktwxFRd8GBTyX+UF7EQWskMdHGGNpFM4GolOMrr7zQVzlPVh5JNWBud8
	 ULdFnx+fOOEHbULHCYAeRHc2cMQqF5WP5220XghSY42Nc9beJXEi0FTRQOvk7lO9CvYw3
	 LCT4k4/CXQA+W0QTCKT/LhWfitYTpXfW3kwPHx+GK0UILaG1UMUQQuwcZOa1iAr9Y7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xhGPxa/r";
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E555606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:28:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E555606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xhGPxa/r
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490c1d337d8so801253f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793878095; x=1794482895; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XIvvCs+k7eLYLtLSx2FRqYXI7MEHUp/Na9v+SW9QvaM=;
        b=xhGPxa/rgYkWlxNrvyrwQEkX6SzKw0FYWANtKQnChjWff3XwBBq3mGwV5BQErdoyek
         mPuRE+JIKIEQtG5UVyRs89ovm3SCV9fvObum9cS6jw3bmURv9nKALqe+uwI3/oHxs5gJ
         yWGOSI/cqyTNlsqGfHQqUW55btccS5uqIHBJHfRTYDBTzTTknIpTMyGTx7hvYxVQS5X9
         +Tt3oRfWlpgEfLP1vXhYzoukbzBiypRrLZbhUSH0eN4/hOLA3uXjMoq9fu1kj5oDfB/J
         qejJ8Oo5lNpID6G0YuAX+Y9Pk1Il63eLoEn7pgv/ZeEF1AlO4qLd1Xxv3DwmyWF8/qaz
         dWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793878095; x=1794482895;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XIvvCs+k7eLYLtLSx2FRqYXI7MEHUp/Na9v+SW9QvaM=;
        b=1i+xgt30BNukx3CMrHLLWrNNyhKElQXqep+UMkijrkOITMFtQ93+jU65/zmpTNsEOk
         qT7zZ2TcBfADjCBcNSXHL13q8AtBsiOZog/ux3R9iR2CoDCPOkUbgmSVrcw5LNxkMYiX
         Jpyj7e2UgwihREo/jcBOj20Ag6jxuxXs82SONIYG6c/wxjzRj9GEXxUFDIL+KDtMFiXO
         jNBVQW+MJtWi7FOD7Z6+CYiPl10YRJxRf7HQrpCfKHoqkEOWNTsu+RFQ1C4LS8efPRun
         7D1UdYLZhdTJimtrZ3fhpDURhYfiAfGZPsLNpipMEq2Zo+7m0x2n0gfchTUbhb35oPFA
         30Ng==
X-Forwarded-Encrypted: i=1; AKwUvBw5kJcfCd+K6UK4xP4zm9OhE2OZk8zT630/P2dPgJFha43+oPCcke702TYUORXHMPQ9Nvz61mnatS3Bbdo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9q3QgE9vZjWIwXYkPTFMYT3QfyXZwvyDvRxg7snsTFw51mpVNp
	OdTGM7dkgDt90Gy17vGRP+uigKyP2s+nE/piZE6i2Dq88qZGI4mlF9Yt
X-Gm-Gg: AYBFou36yU4gKXO2giwyK4aVmf6I6IJjRq+6Y+e6kPKQqQV5+aqRQuHGZDfpLdZ5m8d
	Mypeu3EH9Q6CLOtMM3pZXx62Ri6baRpXd/6AAV/qwZeM5FgHJVqLgnNnvKgiwXSMG8xpc3V79Od
	BdzFL7wPaAyl5PqLRWcU9IHY5gBkDgTHkxBiONQ77cg03D6aug4OY87DR45TXvKtDJGE5rkV9AJ
	6jN5Tau1BlNgOHQGIqvO2QKXug/xHZpliqwl73GnfF4T8H2KDCP9rU4E/8xUKDrY8Z6H7NW4fZ9
	0ctH73RD5S5PKwoPTF/xkItONFXZdEblCowy7wIMvc3G3fs+Z0DTEXsh8qyX0k2V0rBtvlBWvIm
	fgCoQkGqCfgdYeWKZYDblmuD9iIuI7LGWnV4inbsTZFjdG/63yr4W3/n9TsmhKFqcR/Mkp/R5S3
	04o0ZBwgTu2tkGCnog/5Ot0/RB6gXOmR8DLttXpVOMyIvnv6cKdJNWC4PwquCfQhZKw4cixjGjw
	2W7duWoFQ2lO6v/v1bWvfEM2e6/Ci0M24EDGBMKxyZo4KGUTLeKD2k8Ps+/fHOqVdBSVjgwHBFX
	Oot1Kw3EbGJAOFwolmEL2cq77VsYF67wv9DAx4NXmO3RsrvH5/WL8dpAU6qvDv+i
X-Received: by 2002:a05:6000:4310:b0:492:149f:67ae with SMTP id ffacd0b85a97d-492149f6981mr789005f8f.32.1793878095471;
        Thu, 05 Nov 2026 03:28:15 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac2772sm9135636f8f.18.2026.11.05.03.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:28:15 -0800 (PST)
Date: Thu, 5 Nov 2026 11:28:13 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Cc: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 kees@kernel.org, justinstitt@google.com, morbo@google.com
Subject: Re: [PATCH] Input: mouse: vsxxxaa: Replace strlcat() with strscpy()
Message-ID: <20261105112813.13210334@pumpkin>
In-Reply-To: <20261104062319.288360-1-nikitash.mariiaw@gmail.com>
References: <20261104062319.288360-1-nikitash.mariiaw@gmail.com>
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

On Tue,  3 Nov 2026 22:23:18 -0800
Mariia Nikitash <nikitash.mariiaw@gmail.com> wrote:

> In preparation for removing the deprecated strlcat() API[1], use
> strscpy() to initialize the mouse device name.
> 
> The destination is zero-initialized, and the constant string fits
> within the buffer. Since the return value is unused, this preserves
> the existing behavior.
> 
> Link: https://github.com/KSPP/linux/issues/370 [1]
> Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
> ---
>  drivers/input/mouse/vsxxxaa.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/mouse/vsxxxaa.c b/drivers/input/mouse/vsxxxaa.c
> index 042a17fe81db..b3a0d7ff5738 100644
> --- a/drivers/input/mouse/vsxxxaa.c
> +++ b/drivers/input/mouse/vsxxxaa.c
> @@ -463,8 +463,8 @@ static int vsxxxaa_connect(struct serio *serio, struct serio_driver *drv)
>  
>  	mouse->dev = input_dev;
>  	mouse->serio = serio;
> -	strlcat(mouse->name, "DEC VSXXX-AA/-GA mouse or VSXXX-AB digitizer",
> -		 sizeof(mouse->name));
> +	strscpy(mouse->name, "DEC VSXXX-AA/-GA mouse or VSXXX-AB digitizer",
> +		sizeof(mouse->name));

You might as well use the 2 argument form.
Moreover, if you use strcpy() you'll get a compile-time error if the
string doesn't fit.
strscpy() will truncate and return an errors.

The other question is whether mouse->name even has to be char[].

Personally I think that while there are issues with strlcat()
(mostly to do with its return value), and that there are often
much better (and faster - so sprintf is out) ways of getting
the same result, the deprecation really needs to propose a
sensible alternative (not inlined strlen() + strscpy()).

This case is, of course one of the 'better ways' cases.

David

>  	snprintf(mouse->phys, sizeof(mouse->phys), "%s/input0", serio->phys);
>  
>  	input_dev->name = mouse->name;

