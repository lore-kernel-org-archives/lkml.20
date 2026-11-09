Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794211642;
	b=deS0MzW/xfW3254+5HGHQZT1c771VIaH8DjQr2K+xixQH0np888hmdHbWnujDl3WWW64
	 RGhKHBcy6fa4ZM80RGha7BOh+DNcduupRZuLvGHNceZgiGsfq5bK+BsabSV765S+zGOik
	 PPK8QntuPJZGCIsYRMLQgxfHsGwAmn/wNPL5Mjja+SNKLEoHST4u0S7oH8WXWmkW5lQMs
	 NiMO4RmoyzOfX+WahOmCbtQ4uEO6Ui/GrXHMmT3XigdJ+9VIWHZzKxY7ZxaMKEGWvLfMt
	 CyMhbXxEvccdDuT8ZputtT/zTK7AMk+ko/56i0KeiS0UjZ/HB1Fy/UwaA2ketutVwUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794211642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=tSuGt5zJ2pU286bCSrjG244N3zz8YI+MYqo9ROV43xA=;
	b=pngl8ZtjlosYuLewFQtwSQNnFbff6yULrfrzeNJ0c5Xm9yrMHeLidOvYK7zkgKbo2AHW
	 hisgulhc9NJf46FxlsDcKEA18zUidAvnC0MLmhehPsbkr40RiGieVzEPgWdz0mrBsvFJ9
	 XVKK0ZKP0SWzvRdWUMnkm24nxF0h7JgqUlvfDjXBVaeP2K2BqaF+sNnVbu6NBYHtYM5QC
	 GH6ahrByqvUzQpQA9enZ5aRN/JrZr6wAyhJumBezB/ToBQlx6T9Vo7bUK7ED40oM+Ra/i
	 ihwzYzNTrqtATDQLSemxM3utkCbJXGYHCTdImi1irh0ZX/Q7mboGxCu/Om/fzpz02sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RIbOmdy2;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292D0606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 292D0606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RIbOmdy2
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a2761c69fbso1438185c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794211641; x=1794816441; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tSuGt5zJ2pU286bCSrjG244N3zz8YI+MYqo9ROV43xA=;
        b=RIbOmdy2ib6vKnkVWcn7VT8GORG++zi3RESLnZOwHMKnhlQzuHv6n1iDPPs0KmvGmC
         IreK21HSKKgVXbd213rMInKk2+ksnzTHAavfooHKKHqF6thg4SmrsFiMEwnVGwP5Q8f7
         wcjYIY1hvsXS38Mp113/lTQPX2mX42r+6zib4GjlOiO0X07eKZSjjWQDjrLmV2IH+0qe
         Hb5rxfCm4BM8MwKgstbByJq72QaOjIG3FkHzbGdALWcnNEY/eB8PFDoUClya1TusHafq
         RgXyVt07EqNCMSZhfIFkBPeJlBdjaWZpOa4Bkyt9RsMZNNbLKDCgP+OgZ3UAJCN62yUu
         8N3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794211641; x=1794816441;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSuGt5zJ2pU286bCSrjG244N3zz8YI+MYqo9ROV43xA=;
        b=oAlWhbYWMcVW4QAQeS4wcEToB7KCfPE0FT+sIynJ9LQCYbu3iWMeJ787yobB2z/mc5
         vHR/SmPwff6zv4gdXPQ090RpnLQtJwnE/ZrbzaE9JaKEOKAKIL/yAe7vUsTWf8bnft2h
         n3l+Lug9eoUXd8bmBFESTaiDQYPGFBe33AfJNSYTVVkAgQUzcge2WRV2dbabe57tQfNH
         Ev6oinB9J9NEvqxox8XCSJMYUtlM6Z/PvLIe+NYyXvc2yvO/XqPqyDt1j+bVYa4X7peA
         30vSbHLSAkk9aa9jQ9ne8rMqLa14Gtv8NxGIsnID/3a94z7En5VyIBuud/ErPz7Rj42o
         a55Q==
X-Forwarded-Encrypted: i=1; AL+hErFBVjaFJWIzmGIBiPPt4iwhppUVr/9aehNouHs4NMdnUP5PqxOZCFQlWZqLbwHYRDZZ0DtsQYvpDIrJwUs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XLfhidF6PK5ouTwB02yz4sF0XEwDmMby8gwhJnQj/cE7MPqIR
	xg6ydCL048tg5pyezN6epgIWV7T575PwEFg9kkABxe4yGzA6ym8ThB8kaH4E2w==
X-Gm-Gg: AYBFou1+C1XVv4kU8R5ormKK+UJgsrjuoLH+II1UChOD2msN+igRL/UMwzpBYUtjiaw
	WFK9YosOoDX3mucEK43cJip30CuDJGAx6H+uFnBeUs5br/x95/6DKZG1mDgOXA5SVGzMITIVex+
	pk01oMPZpQzxuCQOifBveZq9cfETxk/tQMDz3M49iQMIC631CiQWZE1uo6bdENNYagbkwsnUVf0
	aEwtUp5oac3Vy62d3SpDJ5dX5LUqEP3xiJTDg+Z1QHwNU31F1mx+GBfEWeKXFuOqwH+pU7wVSkX
	MttkKfh6sdYBDxsr17A9ax68azh4GZhwYOE+EkGph99Ba+F8qF7pgGliKEQ/hSglog8wonuIKbO
	v6bO9NOCayRepUpC3tVmvxsatIdMfeDsoaF8SJFwfhQk08GkpU7LlVwd3LGxbb/MsEFp0ZyBMjB
	eomjFq0cuuCcGyzaMGwQM1Lbg3scEpC/0XdAsGgszShntpal2Sv2pvbqamlrpP387w1boDh44x8
	5b6pawnWUKDnVHVToVjw3eOIa7YzRGYbunqxqO2HU+Ief8f67s12Hadf5QcNSeKQLxSOTZq7t67
	pb2tgwuNc+5BrHJAQpVGFwS1hvtLu1PIWwwWomkjE6wxynb+TDZ7v3e9CpRflLrEXOhrhJ/7xV8
	sAvW8Zpf8uRATKw==
X-Received: by 2002:a05:7022:220a:b0:15a:2b63:a0cb with SMTP id a92af1059eb24-1b3a32c135amr6400658c88.13.1794211640937;
        Mon, 09 Nov 2026 00:07:20 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:3588:b56:78bf:db5e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771fa200sm10691247c88.22.2026.11.09.00.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:07:20 -0800 (PST)
Date: Mon, 9 Nov 2026 00:07:17 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Guanglei Zhu <zhugl3@xiaopeng.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	liuc63@xiaopeng.com, stable@vger.kernel.org
Subject: Re: [PATCH v3] Input: lpc32xx-keys - reject matrices bigger than the
 hardware has
Message-ID: <avF_I_6WkF4B7tPI@google.com>
References: <aurPvymSFACa_kXH@google.com>
 <20261106014928.328020-1-zhugl3@xiaopeng.com>
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
In-Reply-To: <20261106014928.328020-1-zhugl3@xiaopeng.com>

On Fri, Nov 06, 2026 at 09:49:28AM +0800, Guanglei Zhu wrote:
> The scanner state array holds the last state of eight matrix
> columns, and the interrupt handler walks the matrix size that the
> device tree declared:
> 
> 	u8 lastkeystates[8];
> 	...
> 	for (i = 0; i < kscandat->matrix_sz; i++)
> 		lpc32xx_mod_states(kscandat, i);
> 
> The probe path only checks that rows and columns match; the
> hardware supports square matrices from 1x1 up to 8x8, but nothing
> stops a device tree from declaring more, which makes the state
> array index run past the field into the rest of the driver data -
> including the keymap pointer the same code dereferences.
> 
> Reject matrices larger than the hardware supports.
> 
> Fixes: 69690bec400e ("Input: add support for key scan interface of the LPC32xx SoC")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guanglei Zhu <zhugl3@xiaopeng.com>

Applied, thank you (but dropped stable).

-- 
Dmitry
