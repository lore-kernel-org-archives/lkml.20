Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793096616;
	b=ijhB82+3OE3GNijcYWJucjI8VDhdPs+JJzedC5aluylfkkWYoD2cuYUq279cqSdBJkEY
	 3rT7w5+RNMS3fC8bZHTJfOIsPeb0pn5jIN3EZlKFgqd7di7K3fzqwEcXs/lyEAJIEaUjO
	 BOOiuLmfG1ibrhmntfPHN2VO8sY4lZgBhRuR0MmK58pWUBNxJNYpWQWS6TJn7cuWYw2JU
	 JkENQyyFiajemcZg58rmPEP27y94Z2Ufsw3jSO60DEtc1BzRAACiVefITtrYnOw4viDTc
	 4YjDCufOaAHjSFXhV06hq8+35a00kEYjBC9ZkH9r//JCF1NgdI8kQFqP6g22azmAVQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793096616;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ixn5H3vAXnv2/MEaB41gzMYUz43Hp2KGMaNZl/QjLfc=;
	b=E5TNasrJfTMMg7lkBg5pXaeyYOAHgWXJPt7DUm2Se6I1xmOucrF+umQORdgc5DBxcVju
	 Jw8OLBSpppELyRUi/HYLCPWKS/gjdJGYVdfh6ecobVNlQ+9R/CFaEprExDpXT6o48U1CR
	 i78DcyyYU8tiGUA3OUsjsD9xPiX9HXh8n8DLamB+wqnPQs2vfF1VPVhJyD2xQo9LrNSbA
	 K9pQ+Zovk9Wv/6kieyzpl1Tl13JRwR1NL3MvStVEEeL0j8jbGlfF5UyNHzoxI25SnAwHp
	 tjutQj/56uSJZbITF9OJApnQDyeqVaDERzurJOHwpOHrJS4cvbhYwzMnQTosHhBaSug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=G61uIgdJ;
	arc=none smtp.remote-ip=209.85.222.53
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD6F606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:23:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCD6F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=G61uIgdJ
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-990fbae94f5so3308328241.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793096615; x=1793701415; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ixn5H3vAXnv2/MEaB41gzMYUz43Hp2KGMaNZl/QjLfc=;
        b=G61uIgdJAgWLvqaN2anYk11h/HE/uUT/8PX5ugyGROleumnHYAcBvYCnQOuNdajm1T
         XoNoLK06iA44AhBPaNufTWmguWHz82MkXCdHawxr/E4w43k8eVptMyxbRTY64sK9krFA
         BnTkHBJSy2mz+fPluxCnwjmP2Bfbp9wlqc5By2fxmB0f8BHnbIByqE33842q20YuzyWz
         +nS888b1AG8Osk8RGyXuicv2vjWpXXIPyRE+8oa9dBgW47y4gqpkud8c72nHr5g7MT+0
         5hpxtPRYT7/rPHetn+RUcjk034Kv4EACdVZS3WosBo/w3ybC0TcB5o4fkwY1Iw2+hRhm
         yN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793096615; x=1793701415;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ixn5H3vAXnv2/MEaB41gzMYUz43Hp2KGMaNZl/QjLfc=;
        b=qAHQSFlM+rKLPOXWcQCdsTyv7M6xkInVELYRKnUSftZ8GIjcUu0aZGW7/2ft8kgOOI
         hEys6XSk5ciN/45yAKGA4/8Em9HqO5Mo3ygkV/Qm7fEArmR6GtOss1cc1/aoH8GePQQn
         ecO1kkz+GcHr4woofhhLed1JAXCIm3TmLb/bzwMIvgsAdXr4JRDF7HSkTbTyqb4xwMqB
         He3tY027hOwcquMg/d6jCEpbBXgUG1djJZHS6jmjTqOEqHPMJgHVD5WGNCzoARm2/obq
         LiSA+fdbsTf7bNRV8u0nj6Ssqb6Y2kJX0gCNLVk445jgg8TdnO8CE8/GDQ9DalpAOU3w
         NiDg==
X-Gm-Message-State: AFq9FYIFTw22/qd8oEtTbwEA3Samx2e0FeJsh8kALCWO8JwqqcLZ7/94
	YnbPi+LH5I14FguXWXS8q4QDlHLUxfl3dCoXGshbA7PNc904eCZkdsrdqQw5/w==
X-Gm-Gg: AYBFou1jF9Vs7FTyjG87DWOzx1F/bUwkPU3Vsq3D0xkbeGYeHJX5RWt7tIuJzmjop04
	jlbDE/4C1HTJbMNoJvoveMlAcya++L9pz+tUJrYfRv9CJHYIrbhE/VP9isQSCFNAiFLl+TluJHC
	/Fbwjb1WM20EYP37E9hD3mVed6dL9xy61ERaVnvdTuLShKuzs3/tL8zmjt8sOdwGRt7obMeJzn1
	H9+HFZLG+hfu7wZV5KlvE6Wfiy6oR4RVJWeFXRKrRVe7PVskLlrsow6M7Sm1ryow2+s+O0LFKFU
	WTnS9OcC/hBPn41CIJNzieHZbdVY6/PgDBdDLqsnOwCVQWbPBIOjq13QvIEFb4Vu0jMje9pkx+r
	noJAut7sYM4LMUKmq/wqEiCJS5SX/7qVsm6RMZJLBWdoWUfYf6HjAvDYZle/NX5Ww62mIky/WIU
	MyTx5qo8IuZpZBQSmCj1Gs6qy4Hrj9C8da1aMECHRaMRWnsmLXc9iMdxgrDFr8TwwqO6wYR4AVA
	phw2l7WagrmHR+NAod1cHdahIax5PXLLex4eVwE2ZQZSSzmd3uJnD5FbvteY1dAUgjxPPaQWE/N
	oSlzcDKTvI0ZimoFmqmc9/eSSnAIwcnXM7taRVEQa86Ax+R1AfI=
X-Received: by 2002:a05:6102:3e8e:b0:7bc:1de3:39b0 with SMTP id ada2fe7eead31-7ce5cdf6628mr3450597137.32.1793096614648;
        Tue, 27 Oct 2026 03:23:34 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (158.95.44.31.netskope-rdns.com. [158.95.44.31])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cea3bc3816sm1983763137.3.2026.10.27.03.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:23:34 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rodrigo.alencar@analog.com>
Date: Tue, 27 Oct 2026 07:23:26 -0300
To: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH v4 1/6] lib: kstrtox: support E notation in
 kstrtoudec64() and kstrtodec64()
Message-ID: <c7lsphh64wm7572rt2dt27ar2fo3w7v3a7jjmahhkyzttp22rk@o7jufy545hfm>
References: <20261026-e-notation-v4-0-a366a6d14d57@analog.com>
 <20261026-e-notation-v4-1-a366a6d14d57@analog.com>
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
In-Reply-To: <20261026-e-notation-v4-1-a366a6d14d57@analog.com>

On 26/10/26 08:54, Rodrigo Alencar via B4 Relay wrote:
> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> Allow decimal strings to carry an exponent suffix, such as "2.7e10" or
> "271828e-5", in kstrtoudec64() and kstrtodec64(). The exponent is added
> to the requested scale to work out how many integer and fractional digits
> are consumed. A negative effective exponent drops integer digits.
> 
> The digits are now scanned first and the string termination is checked
> before any conversion. A missing or malformed exponent ("1e", "1e+")
> returns -EINVAL. An exponent that overflows when added to the scale, or
> that makes the result exceed 64 bits, returns -ERANGE.

...

>  static int _kstrtoudec64(const char *s, unsigned int scale, u64 *res)
>  {
> -	unsigned int rv_int, rv_frac;
> +	const char *s_int, *s_frac;
> +	int len_int, len_frac;
> +	unsigned int rv;
>  	u64 _res = 0;
> +	int exp = 0;
> +	int ret;
>  
> -	rv_int = _parse_integer(s, 10, &_res);
> -	if (rv_int & KSTRTOX_OVERFLOW)
> -		return -ERANGE;
> -	s += rv_int;
> +	s_int = s;
> +	len_int = skip_digits(&s);
>  
>  	if (*s == '.')
>  		s++; /* skip decimal point */
>  
> -	rv_frac = _parse_integer(s, 10, &_res, scale, _res);

previous implementation required scale >= 0.

> -	if (rv_frac & KSTRTOX_OVERFLOW)
> -		return -ERANGE;
> -	s += rv_frac;
> +	s_frac = s;
> +	len_frac = skip_digits(&s);
>  
> -	/*
> -	 * Check input beyond rv_int and rv_frac to cover cases like ".5" with
> -	 * scale 0, which is considered a valid input, being parsed as 0.
> -	 */
> -	if (!rv_int && !rv_frac && !isdigit(*s))
> +	if (!len_int && !len_frac)
>  		return -EINVAL;
>  
> -	while (isdigit(*s)) /* truncate digits */
> +	if (_tolower(*s) == 'e') { /* E Notation */
>  		s++;
> +		ret = kstrtoint(s, 10, &exp);
> +		if (ret)
> +			return ret;
> +	} else { /* verify termination */
> +		if (*s == '\n')
> +			s++;
> +		if (*s)
> +			return -EINVAL;
> +	}
>  
> -	if (*s == '\n')
> -		s++;
> -	if (*s)
> -		return -EINVAL;
> +	if (check_add_overflow(exp, (int)scale, &exp))

I was wondering, and I figured that the 'scale' parameter can be made
as a signed int. This E notation implementation allows for that as
the scale now folds into the exponent value. A negative scale would 
make sense to allow the representation of values greater than 2^64,
still limitted to the 64-bit precision, i.e., 10^24 would fit 64-bit with
a scale of -6, which would have least significant digits ignored. The code
is ready as is, that would be an small change on a interface internal to
the kernel that wont change consumers code. More test cases would be added.

Although the absolute value of scale needs to be reasonable, the int casting
here is also not ok. big unsigned integers here might lead to negative values
without warning.

> +		return -ERANGE;
> +
> +	if (exp < 0) {
> +		len_int = max(len_int + exp, 0);
> +		exp = 0;
> +	}
> +
> +	rv = _parse_integer(s_int, 10, &_res, len_int);
> +	if (rv & KSTRTOX_OVERFLOW)
> +		return -ERANGE;
> +
> +	rv = _parse_integer(s_frac, 10, &_res, exp, _res);
> +	if (rv & KSTRTOX_OVERFLOW)
> +		return -ERANGE;
>  
> -	if (_res && ((scale - rv_frac) > 19 /* log10(2^64) = 19.26 */ ||
> -		     check_mul_overflow(_res, int_pow(10, scale - rv_frac), &_res)))
> +	exp -= rv;
> +	if (_res && (exp > 19 /* log10(2^64) = 19.26 */ ||
> +		     check_mul_overflow(_res, int_pow(10, exp), &_res)))
>  		return -ERANGE;
>  
>  	*res = _res;

-- 
Kind regards,

Rodrigo Alencar
