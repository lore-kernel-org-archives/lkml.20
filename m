Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFD948424F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787855977; cv=pass; b=RJ5k/L+XDkzrjfKlyfa3AyxOXiCKui8ICK2yulK8aTkiW6FmRelpRZi6GvWFhtCbGGIkBhHkzK8keCO3yrnlZD9fn3SnTLgGGkcd4OdIAfmZjAgt5nYUTJEvXuNy7zAFDdoR3FqRYSg+2fehTy9km6HxHUeQDA0Hu2fTGQ05EMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787855977; c=relaxed/simple;
	bh=445iCSTTCoBe15Hu3Q0tcs0o1U+eeAp83PGi5YJxTA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=obwNhq+kwDkupAxJYUzqAkNoCk95PhCR5DeBJ4aTfq8ltp9svA4wwvoPUr9eg9wfUCbB1pnRd2u46KKY/0CFyimcIAtr86wpCPBEXwF4pBUmMXA5AdQEwyzLRjCckdC0jr4+k+5BzF50y1aZ507yHxvWrCuw18/Z2wnw3AlaIlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RpnXFyPe; arc=pass smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RpnXFyPe"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-936c02e58dfso9897585a.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:39:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787855974; cv=none;
        d=google.com; s=arc-20260327;
        b=FOK3WKJMfp1ayBIp+YsRZOqBUDqlsVNH6Nuj7HPyXbwFT8z4LaMmEBabhzQKFHYYGQ
         hdy7DVD840DGyqPYazFqRbwo8k5GPFQnZVIeeoZDjGJ9PeIcall1Z3bnN1NrGjFaizFf
         RNx5haQLgIUgxkEy7rO8qZEJxXnGaG+9pPzR/shnJH82xppYdBq2mogOd0entwCgCGMl
         JsYlO3iVJ3Pgz8cn+DvsVpDIkruPH+TZI5xdFmKLgaIQSComodrkalUlPK+noCai/O/h
         LqZ73stcWb7c3S/7HZbWZrGH0jtfGdGhc5VBk7sA+9BlLTeY6l2zNgmtG4AWZkevfAgu
         BUtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=445iCSTTCoBe15Hu3Q0tcs0o1U+eeAp83PGi5YJxTA4=;
        fh=DmbvI4mzJPrRoqnIlJ9YIU9QCGluZzTXBWAaDnAY8Is=;
        b=QfkbxkfuZJXYPGaVVSv1AO4D5hgw/Fd/cuzCoJXdLnPrcS8v943Cu7f+L0TDO0aZEr
         Bqlibg7EB931tplHmZ+texmao+aOkMnnOmQ08Zz36Uooy67sxeqtn6KlwmweBkZr17bD
         qjr0QaUPS9xcpm2qhUGOjCwysnCRkzA4DODgT0rOUBW2h+uAAUaPY6Q4Ww1/7m0+EB34
         8v65beOLb021rTaFlkUtbFugpdxA2D+2aTCGWWS9SpqP+oA0VGRNNLf4+XpCc2ByoeDg
         I2JreS3hV/mReK9ZGxTtLRu/cBg3B7aeI5GBP/HT8aLzpsy5JfzzY0kFkc6QZkTAzJA3
         TZ4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787855974; x=1788460774; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=445iCSTTCoBe15Hu3Q0tcs0o1U+eeAp83PGi5YJxTA4=;
        b=RpnXFyPe7FpyduMBgsai8n3mLFB/Eksg9qhiO44fSKcQ8P4TrRYQcsKthS3xTf6Gxr
         ing3IvdyL7w/6Rf8vhQyAySrlsqkJNrmK35fyRjoZOvbd7hpJFxSHwuBbUDq5zp3s+u2
         +MHeNBRY0NeCPn6TVCYYbRjc207FFl3+w+icSJZApLCBQWNqcCdCBt67KCwcA3bCVoBr
         tHiDkEkmPPTsc1qypQd/vl46ix6pFaXOyhTD86GvCyoHvGE3yxp6fh5WlvdopQZG+YK/
         Mb8xaiJlXkqLYuaD4fZzQDTq9k95J9ykUQ+6iqO+E2ETMwSjgXCB16xMNbR4g9nyGYCM
         VTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787855974; x=1788460774;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=445iCSTTCoBe15Hu3Q0tcs0o1U+eeAp83PGi5YJxTA4=;
        b=BjKyQJqRDTM6hPopxmcTMLf7p7EtxWteVjiTlrJpQ1xwgBBUWvXYHWaIzve600OmfA
         amzZf2+hXtD8XZXI54PP4K78HWgX+y4jKG4nE/ZdhuJ5pPBcHMFSBx+TV20oXKPOjzDM
         Vvj4M/7mt32DdxOFEXJkvpgAn1XpBGVRepksQv6/NtwBaN/3rK8+EENxgaUIPilrscby
         5qB9QD8SZNruW12sneyQvZgrNCaHce4Bm4qsmR0VnR7bT2UfLNP6SrxDUbLrdWHsUuEY
         g/usPRgs6bQioKx+hPUAM97I5/KZ5X3gLEhVTkap+YCKZ4SGOaHegvXK/jKYnj6p3KzU
         u6Qg==
X-Forwarded-Encrypted: i=1; AHgh+RpPrjFbczhbra1Z8zkRXygPODBbtAcEnBMf3S8di846frjzEXlbuniz98m5A/8KuqynzuvTHHXmM6jpjuY=@vger.kernel.org
X-Gm-Message-State: AFuF++kJhJqXa3HAzE4bBsIpxXUiPhcQUp6ks2DI9Nnhlgv8x6D2aOQa
	xBxTSzEtprVDZZld7ofW42i05jdhphVmG4T/HzgC2j6da+GayT2AKat7TD1E3OherdRH7LjMtAN
	D7SLxXP7d3lnzGqW8n7ZZ5R3ABMKZlojruHTIT/eovzPGKfj14Bn5qRuZ2Fw=
X-Gm-Gg: AR+sD10R7Pi7AeUjwfbMKkiUKMoBtTEGJYvw5Wi8dIZ2EL8QOZmchh3uWU5uoWNuOSl
	dqoQoGnhb76zqewSE9qAK2Vyug1YXepjxn7ZfckSAK0Lue67Xljnp5vcyVDnmnrpdfHMQq5T+R2
	8J1qU88cFsXYD1dIxOWFZtE04DPpQqoSLEOCpmxjhlINhUFf4RVTJDg9pGPjhtr9n+mDQHm7/12
	JguSJxQAf2oyjxgLhBqAjJymbPJFQDZM95Z20sVZH2Y2vur0GsXmOhfNyRrnkrc3mDO/7b90U41
	DFPqQzvSkhdUumodRB6fia86ipGAVQ9lVz6hj/Tv+tsQxvS2XoyQkiwVKXwu5vBsn5wGVk+1xNu
	w2uBqcb0KEahLtbBLtplqPlGCBElmk0CWT4iGNDa/KIMQ4b+sDKVqkx8SNeA=
X-Received: by 2002:a05:620a:a913:b0:939:2e1:91b1 with SMTP id
 af79cd13be357-939139b0e77mr79071685a.42.1787855973945; Thu, 27 Aug 2026
 11:39:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827182514.4667-1-zihanx@nebusec.ai> <20260827182514.4667-2-zihanx@nebusec.ai>
In-Reply-To: <20260827182514.4667-2-zihanx@nebusec.ai>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 27 Aug 2026 20:39:22 +0200
X-Gm-Features: AcwNN1VRhQVJWnUjimjnCssYVB-RsZLLiLw-RwPls-JFeJyYJ0GNI-z6p5Tnrm8
Message-ID: <CANn89iLL7g9iZ-pZZw321GFNVKKW=xs-6exMxeoM7=krsL2T3g@mail.gmail.com>
Subject: Re: [PATCH net v2 1/1] ipv4: avoid divide by zero in fib_rebalance
To: Zihan Xi <zihanx@nebusec.ai>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, =?UTF-8?Q?Peter_N=C3=B8rlund?= <pch@ordbogen.com>, 
	stable@vger.kernel.org, Vega <vega@nebusec.ai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 8:27=E2=80=AFPM Zihan Xi <zihanx@nebusec.ai> wrote:
>
> fib_rebalance() computes the total eligible nexthop weight in one pass
> and programs upper bounds in a second pass. A concurrent change to
> ignore_routes_with_linkdown can make the first pass return zero while
> the second pass sees an eligible nexthop, resulting in division by zero.
>
> If the first pass reports a zero total, set each nexthop upper bound to
> -1 and skip the division. This matches the IPv6 fix in commit
> d2c26c2911dd ("ipv6: avoid divide by zero in rt6_multipath_rebalance")
> and preserves the lock-free rebalance path.
>
> Fixes: 0e884c78ee19 ("ipv4: L3 hash-based multipath")
> Cc: stable@vger.kernel.org
> Reported-by: Vega <vega@nebusec.ai>
> Assisted-by: Codex:gpt-5.4
> Signed-off-by: Zihan Xi <zihanx@nebusec.ai>

Suggested-by: Ido Schimmel <idosch@nvidia.com>
Reviewed-by: Eric Dumazet <edumazet@google.com>
