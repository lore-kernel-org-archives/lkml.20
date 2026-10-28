Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206251;
	b=bouDXzx18JGRMxb+9HyKWb6nhJ7HYwV1FDKdM4Ilgk+CHc/PK5juFqP5a2kV0PPqiY5C
	 IZiUm3FkFAjP1R5tZ5uhI+yz/5UaohJvsxbX5G1l13QJ2BdPzvc6doF1ngQAqGLprOIs4
	 F/7XZiTmM1Q9RVbDd+wozKDhKEAVYSleSeEx9aHEXRNmbhOnCK+ICHWJwk5Lv3xhrVUrP
	 NLsXdkEEk4qFG4xhVYDV5PVwR4JQDYqEsKsmHa5lEi8EfLAla644sCjVl52EABekVnj63
	 5MDV8eeN9XgUr+hL3xRGx8WbnWBXc1v5o2be8TpujYvYPGK409UBPPZbGaAdOngDNOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Lf9pN3NSTDncbChFIaA1CziT+h/fl1PzcuS355jZpQ0=;
	b=cHo+lkqmXCXUTGN/JJICuC9zj+q1DNmaRS3Gc49ZampzVzENZzq4YIn4x1ml1eiHImlo
	 V7ZfL4iThmu6KQyPs7OM6owBh3/puDBIuLCt3gq6UnHl91/Z4+pkMV5vhhrvpDUcHnzIV
	 PTMUOVYu2OPzNwCTjDvrh6ZpAvDCp7bwhFGzuDsmGevM9qYw4NzUnISBo/s57/hQo/KIQ
	 HErMF467EBNMEEPAOCU5v+Ev6H4srC1gj7bZ7BhNh8CgLjAHKcYolhusX5LzQhiY68vGw
	 y1ZCzZOKOaFGIgIcuWjoTMZV8PLIWLrwrdqZ5+RTqkMI9wAGvzSDdOIMjGHQHime+Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=JyiBaDZc;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28B0606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:50:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D28B0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=JyiBaDZc
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-8253bc5a613so812066a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1793206249; x=1793811049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lf9pN3NSTDncbChFIaA1CziT+h/fl1PzcuS355jZpQ0=;
        b=JyiBaDZcdBn3+lmaSpdcsZF6lxVbYeELGVLjKmrkU242phXf4EOrD6UfetUJj3UGkD
         9IllrbESu1lxYeeDmC5szgXoH+FgPPyXthKrhN4txz5sBPq+r+FyZRxXP0wj5LFCj5ch
         LCryPPkOU+LvQs2d0dVHynxL1peLPVJb9I76I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206249; x=1793811049;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lf9pN3NSTDncbChFIaA1CziT+h/fl1PzcuS355jZpQ0=;
        b=mqOBpDUapui/W+hvF/o02+lssbXBvY48dO+DaUV4AsgYfVij2uQuVVzxcTGI65wgtg
         TvvkxPSlkEpFy1sCQQhbH4bo1UpxIjn96O8MLEuoF1uElSzUU8hZHRZGeh/6g5zrzwPH
         RvT7EeXPkxzxIy7abmS0hy9ExiD1AAbucqtGvpzjmVi2JmyxbqNuZZKjg6TdNeLvw9y5
         4SpbeQt/Iy3rBitw+OzDMTNwO9DhgB/xkWtH+ozp9MBvXpqhnZAfSivfkkIkh1XYZreJ
         2apuOweqh+rqjLP7UwzNkX+q1nMm3qQIjSJDYT/TBulL0P1QM1gDq00Bmq6jm23YXdX4
         hMTg==
X-Forwarded-Encrypted: i=1; AKwUvByM/WajG0XML5xqi445RQjfgnbl+9iQj4IM/9mRfvrCb9IeB/V7t/63msc/r/sPRhjWydlBC1mWbRzVJzo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLe5Yd+Ll7TapQLl7PyKhED7aQRUiPs73eFqD2rLhmE1wRBxppA
	QAU5pkyeFCBUahTQ9Q51CkDxscv/Xz43Y2JS9W3aLCCCCQ+5DQdYH5uPIfq5l2j+aQ==
X-Gm-Gg: AYBFou2H0j6U9/+iEaV+H/rS/WfPOG8stDFO4oahMCzhOxLGewn0D3/JBP4UUPRdLmp
	vWOQG48+EhjRIXDX1I4R9nYDD6c0KwK3vXHeniYVLZSOpXtni4Km46Ir3x0zCqB1aDTOh+poKA9
	N9Kn1vnFNEV6XBQLQRjzIhHFVmEQHPV4wFDuG5b7nYj2vr1nV9wIzkEMWA2ugpvsVPdBhq+94G+
	OPoP4WRcpDoPU9uOjqLd0Fji6RHiHjbAo3SXmhhB1xYzc4C5fMoHIwv7DzXUpBUQqorxnWfmGAj
	20nExY10dr4d6FyHzTD7cV9rQZZXQjFrPrO3XUwg8etRSUDvzFR1QctNf6lPxubRnQnKSMeGiyS
	Cu0KNv1FjUcn00JCEYmUzhMr6tXGp+or1qpoQp67W8+UgIUwU56EtdfSuDSIbPywnuubOzRwrGO
	KEBvSWIMJtSMpk5RZaBCknEiaG3Wg+qnr2DQFhaRyM/q92hFn3VxLR8XJMc0vRy3fwP5ZoyfQVq
	P5nhod31EBdtxz+bdKY0MEkp+JbTDlzshG1P5BEhgsYqV5LOOLZcDpOs47RRLIXM77GweyXahmp
	XgdmsZ2GnOWPJTeOU7k+VEfdQHKHF3WlVsKujAduSdjeng==
X-Received: by 2002:a05:6808:f0d:b0:531:3bcd:41a with SMTP id 5614622812f47-563843a31e1mr2172905b6e.59.1793206248735;
        Wed, 28 Oct 2026 09:50:48 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-563c5a4d8b7sm1514936b6e.8.2026.10.28.09.50.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 09:50:47 -0700 (PDT)
Message-ID: <b999bf45-8e9c-4a49-b39e-f5c68b5e48ed@ieee.org>
Date: Wed, 28 Oct 2026 11:50:46 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Alex Elder <elder@ieee.org>
Subject: Re: [PATCH] net: ipa: Fix double free of the interrupt structure on
 config error
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "open list:QCOM IPA DRIVER" <netdev@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20261028102327.28263-2-fourier.thomas@gmail.com>
Content-Language: en-US
In-Reply-To: <20261028102327.28263-2-fourier.thomas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/26 5:23 AM, Thomas Fourier wrote:
> Since ipa_interrupt_init() allocates struct ipa_interrupt in ipa_probe(),
> the structure is owned by ipa_probe() and released with
> ipa_interrupt_exit() on its error paths and in ipa_remove().  The error
> path of ipa_interrupt_config() still frees it with kfree().  If
> ipa_interrupt_config() fails (called from ipa_config() via ipa_setup()),
> ipa_probe() unwinds through err_interrupt_exit, which frees the same
> structure again.
> 
> Drop the kfree() from ipa_interrupt_config(); it should only undo what it
> set up itself.
> 
> Fixes: ad1be80d7582 ("net: ipa: introduce ipa_interrupt_init()")
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>

This is a good catch, something that really should have been caught
when that commit was reviewed (even by me...).

There is another problem I now spotted, and I'd like to have it
corrected when you submit version 2, because it's really related
to the original bug.

At the end of ipa_interrupt_config(), we (still) see this line:

         ipa->interrupt = interrupt;

That now happens in ipa_probe() (which calls ipa_interrupt_init()),
so shouldn't be repeated in ipa_interrupt_config().  Similarly,
ipa_interrupt_deconfig() does this:

         ipa->interrupt = NULL;

That's meant to be the inverse of what was being done in the
config function, but it should no longer be done there.

(There is no corresponding ipa->interrupt = NULL assignment
in ipa_interrupt_exit(), nor in ipa_remove().  There is no
real need, because the ipa structure will never be referenced
again after that.)

Thanks.

					-Alex


> ---
>   drivers/net/ipa/ipa_interrupt.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ipa/ipa_interrupt.c b/drivers/net/ipa/ipa_interrupt.c
> index 131b9cc94201..17cefd6a0b18 100644
> --- a/drivers/net/ipa/ipa_interrupt.c
> +++ b/drivers/net/ipa/ipa_interrupt.c
> @@ -260,10 +260,8 @@ int ipa_interrupt_config(struct ipa *ipa)
>   	interrupt->enabled = 0;
>   	interrupt->suspend_enabled = bitmap_zalloc(ipa->endpoint_count,
>   						   GFP_KERNEL);
> -	if (!interrupt->suspend_enabled) {
> -		ret = -ENOMEM;
> -		goto err_kfree;
> -	}
> +	if (!interrupt->suspend_enabled)
> +		return -ENOMEM;
>   
>   	/* Disable IPA interrupt types */
>   	reg = ipa_reg(ipa, IPA_IRQ_EN);
> @@ -299,8 +297,6 @@ int ipa_interrupt_config(struct ipa *ipa)
>   	free_irq(interrupt->irq, interrupt);
>   err_free_bitmap:
>   	bitmap_free(interrupt->suspend_enabled);
> -err_kfree:
> -	kfree(interrupt);
>   
>   	return ret;
>   }

