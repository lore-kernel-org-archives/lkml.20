Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C658947534A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790933078; cv=none; b=NCCvvPB82/Wu63AD86WMfnN/nQYBAbpWkrC4a66kL4sxWPNF1qABC2r5gKKNdFL/cqemNUKMGbBYfYtdzkGm7mjP3axQV2DjXLZZH1/XqrWFVfEU+P55f8t1PVKS8cSKRHxq+pZDGpcvcrnT39YRIM7Hd7Y4Jl6g6CrgP2BK5so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790933078; c=relaxed/simple;
	bh=08Ci8fj1DOUcWMa5e7hTxyMBm6vW29UQdAqjE2Ixklo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f43Yva0ECWlQcbL4beKevuxHLjpi6J9PDDhT74RtrETpP163yCtYUZ4mzw7lAyU+pZ6sHzkTaESCf9BcZ1wekklFj0sdnXn8xpOOUHLltm/y94n4aAV+TQXYO+p0pXOqOxWlZUto7MLfTZDhI9adZfTdoW9JlgYmjKPaGHFBfp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2I5UONi; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2I5UONi"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b01d89b23so1635799f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790933075; x=1791537875; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=crWOBlGGUju8RDLxyaVK+zkXbZKM1vH+7+dULKDp4T8=;
        b=e2I5UONi3YwwHCmukmS/hiI8YwTp0my+pokWNxC0sUHl0j70eI5OVwfOxnquFiZ5Q/
         /px36TUOn9+TjW6VieQDVrgXVCw8Fh3dOrya+vbxB95ot0BBdINuozFnKQk2m3Fr5PD+
         pdAa/tqZtMKmLc1Jg2jmvGPsmWPpAFG6bMoigfpT88OJozf0QrkjB6UfP4DEuHNgYbYj
         1XUi6aFE4xIJ2k3UGLhvDYjNKjsxDd/KVgIU6sEpLKTxUwN/aA1d3/XJeHctl27VjI3O
         s5S/fR+RP42s2GpIZ7Bj5KrB6DwPgQUlnwCunRLziSI/ZRYjvMhZejLq8Ne1w+oAI9IL
         U3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790933075; x=1791537875;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=crWOBlGGUju8RDLxyaVK+zkXbZKM1vH+7+dULKDp4T8=;
        b=mXTQltOPt0SSgTzUc1tvwsJ7qORJDl5IgxUs2gxYa9B+dy5fTKvNLazZrxD5ZyaLPw
         Nfh/5cE5AntUfbBRbWepnr7uBTNS0WzpXyiRKh0vPULL5/gMm4Z2MZcy/tGTXN7Vqpex
         HM/KmYCb1BK2mpuvS/3Nz9N8fB4+EkpZ9+COOdvfXIWg/9olX9VmSeYR83OW7U1yg86O
         eyqP5/c15vbhKcMHOzSvMNUdsZioj31RQvj1NwxN3FRIXfw+eWAAw98yj4rGubrqmbAu
         Zop4OjJm+U0ehjuxjY8pYMBeKQ+5MNDd694gkzRB+7AP42d05xmlPJwEVSYK3azu66/P
         xgjA==
X-Forwarded-Encrypted: i=1; AKwUvBw4qi0E9Hs1cq3oeK3NhCUXDAYtV+i0W/228MfxwkBSSJqSWaNZyHGldy1oLPiz+W+4KqEq5KX5iux8RSE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/2QJf1MoDzIYoDddptA8bVz4cxVpHOiBadhWDTGt+0mLb0Le1
	VtDRmBdfpEhr1HD5finx7JbcwDO3+0VhTfqELd5Hqc2eUVc5EbHS2xe4
X-Gm-Gg: AYBFou1jTJLquIUxjkoIyO7jeEBIk2CwRgT4nJVxtGgrZIVEbHFJGIL9ouFXXguEI9X
	lUEqBVX8VIqFGHlIZZkRisuNKoFqieU2fpkCA2RUlm2qFTQbpHN9gqb1j0UDKKpOgmrlyxrswoQ
	Zk+EqAZD68LBr4/n93gpfQFs1jCzleaSm2FK/KnjBRIRn3jm5sDEUnwvhqM1E/Lue9kfhD0ZXFZ
	pqjb7MGDrRE1SmQWC4hD7Thonb67VWm6WjyMa5z0K8xZrmO07n0lMAqm11TcydSycpK6otbr9TU
	gcmhjV6rtXhyTp/BKJCKknnZ7WDffpK30cqJxArxHLB0xBmvlTFz3tsIgiVUt27GMmQxURxve3e
	1jA15Z8Y7MB15cRMtYiLQWVEqVeLXL8F3iV2f7DQ/fvBLagnHuiXp9L2WH8v+ff8yx1ngvoVCbG
	Jub+GFZFaOSB/kcdUmL6Lme47rvEZqb0Yb7cCol+KaS21o7AdfbeAFV9L096DpOB8ZY5ousZMfT
	6kDB0QvQbRm73zS1OAyOYtfO1NG7jSIduUI+ija2u4pJ+I=
X-Received: by 2002:a05:6000:26c8:b0:487:35c:6513 with SMTP id ffacd0b85a97d-48b12720148mr4450874f8f.42.1790933074740;
        Fri, 02 Oct 2026 02:24:34 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f8ab4sm4228409f8f.35.2026.10.02.02.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:24:34 -0700 (PDT)
Date: Fri, 2 Oct 2026 10:24:30 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Thorsten Blum <blum@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller"
 <davem@davemloft.net>, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] crypto: cast5 - use memcpy_and_pad() in
 cast5_setkey()
Message-ID: <20261002102430.65e546ae@pumpkin>
In-Reply-To: <20260921061120.29694-6-blum@kernel.org>
References: <20260921061120.29694-6-blum@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 21 Sep 2026 08:11:20 +0200
Thorsten Blum <blum@kernel.org> wrote:

> Use memcpy_and_pad() instead of separate memcpy() and memset() calls to
> simplify cast5_setkey().
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  crypto/cast5_generic.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/crypto/cast5_generic.c b/crypto/cast5_generic.c
> index f68330793e0c..1de0dc966a03 100644
> --- a/crypto/cast5_generic.c
> +++ b/crypto/cast5_generic.c
> @@ -483,9 +483,7 @@ int cast5_setkey(struct crypto_tfm *tfm, const u8 *key, unsigned int key_len)
>  
>  	c->rr = key_len <= 10 ? 1 : 0;
>  
> -	memset(p_key, 0, 16);
> -	memcpy(p_key, key, key_len);
> -
> +	memcpy_and_pad(p_key, sizeof(p_key), key, key_len, 0);

This will almost certainly be slower and larger.
The fixed size memset() will be two 8byte writes on 64bit,
definitely cheaper than the calculations required for the memset.

More worrying in not verifying that the key_len isn't too big.
Maybe the length is validated against cia_max_keysize somewhere,
but there are whole lot of unrelated constants that have to match.

David
 
>  
>  	x[0] = be32_to_cpu(p_key[0]);
>  	x[1] = be32_to_cpu(p_key[1]);
> 

