Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0A547CA77
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788255281; cv=pass; b=aqa8JXyz+YekaXphtNiBz0v4BvaQzPFwiUT49yDKBw0UggvL+MoaivPFc6NqvjVvRKzJd37npeXgtueAXypgaNYX9KmmRZyB3bO8FGiWKWIrUxrWAkztyU4nQ+zyLwcuj/uVKFvvVA9iG71LF6BBHfFj6OcQCjSTQ2qiUsQ4+E8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788255281; c=relaxed/simple;
	bh=pn4Yi8R4MlFIS7n8aLufkBYgw+zaA6iEcjMtZetXLtE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZLbt7KoVUs23mqnWTmXu9EJLE2csWxo0wKP73dMKQBsNXN9pkmIKdcxKC2XVlgLO5bwZT6Jgz7O1uxuyHMt3zlnhQxn/0FTxQQypBxfL7H7eF1I4zECHPyZC0zDAv0bgjbGLlnybPNS+a+ULjk9VBLJScrhbWcIkfmLQ20atoB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=DS5n64aX; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="DS5n64aX"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a20f06cce6so8907051fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:34:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788255268; cv=none;
        d=google.com; s=arc-20260327;
        b=roezYC6ne9uCB3AQuOHImMdLlwZGysmcAnS6vb2D5DO1k+G4bYgaD80ZZi/y1iltjq
         5lz0P6j8Fp12EmTaI2svM+eUQ295yXMdLzU4KfVViROUfUaRZoPceBmwTMdDzXz3DVfb
         0WGFKiG9K+2IuGNK2RYrd1tSX2K8Jr2MwKR/7wJqYE2QjkXD7ITx/U60Bg3+Y9zZ1vpz
         3ys6jDTx7NvlAIzZmaJ96GJLxcDf1BKiLKDP4L6kWKRWxfxdvDXmz++506a4kMtcut/z
         LcFFWAY025rd4x1+/h0Fcy+QoYnmOZKTWbM4HsMqedsX/50QpN1GbfU+OZ8tUzh7B0og
         j1Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v0sDCc0evcY+F1EcaXTNVaeae2Uf3EeOiPTVY1Pi1is=;
        fh=ekK428bjP39KLsbN+IZfM7Eu3lJPeSvTwv+SKzghroY=;
        b=hLS/K9BW/wM2LlPWzLpwlwxxzwsSYXPtISemrgMFTxkX6lTcApPJAHZSMY0oNSimw7
         dhiEysUAYRUQKtCZlrPSQYlJfr0GfEKULSNrySon/xJfxyZjtTArIaTRHh9c3hKkEcOo
         enaA9ufd5sV8Gtg09Hksjo5GwXJlagozz+kcgcRBI8Nh1oYZ3yV2L4w9BzSDziLVBjPL
         7F5Sr33Jc5jxw/86FWqUHyARhFfwLP8hUoAfuSIhR/FzNRZuhFnrGIt8NNaNBpJ6WVO9
         g0Qa4f0zA+sWkjyZ6amblTZG//TfOcjTyPz0eMVtfg1Ib3qmOOLN+En9GM71TeO+dc4d
         /z+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1788255268; x=1788860068; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v0sDCc0evcY+F1EcaXTNVaeae2Uf3EeOiPTVY1Pi1is=;
        b=DS5n64aXf0XCRrLnZKPi8BH9JCKVRny0QwIRkOUkTnQppUIJyHkuewt2NxXR+3LecH
         lg+DiuQHgU62YAhoaMOVinXXVawp1lM5BFXbreaiA9Xkdzje8FYO1rhpM5BM03xkc3YJ
         tdLQrsSPi23KXyWN6CgRIT0Sj5ytQFwgNBCMb3cSz6jMBbplvZyVL+QPw2a0Jr1XjfCm
         ZqjRfRxOMfKSF2YfW2NwOHe8XR4dV9a5Xks5vQT3gY10iizjWGy4xn3GK2lv263+RFc7
         l5teXeDOAXR48GREUmjn9Bng4nvS5+pHjE9us/Bd0/buNo/ILopOfmFSDfeePjNBPQt8
         61Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788255268; x=1788860068;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v0sDCc0evcY+F1EcaXTNVaeae2Uf3EeOiPTVY1Pi1is=;
        b=BjY1hYjPB2ezDqqV+5OaqYYq4MfwaGjaDLqbnvOC1v47uTk8UPo93jAB7uqi4MYTBR
         qqYy9OhPlVrIfOaEkcaT+wBj1G05heZ5SDCTfpKZ9zl0/sHbKvrV/q4NgnggCqhFj+3Y
         NSf93/Lqkh6lY42awdsh5EIqlVf9FM3NU+GoWCXCvJv2OiBCl552ZIEUG3any/lEijNf
         p5DyIBh9v3I91TxkbEPI++Dbv3eN5XNpCznUn95sSAkuwJp9ia+sijxp1NfrZWLWzx6h
         MFYB/x/y1vC8BqOijmDFU7/3wf9ABEdVfMqy85+PrwQ98AiMWCN1DNVUR66cI6RXuzBb
         6rhA==
X-Forwarded-Encrypted: i=1; AKwUvBzxHJqEzMF5nx7G+RbOMn3Tv+orzSqlX/i9syxknLecv2FTmpQ25bUzk1myrvc+40eZqaBbssLtFzir1b0=@vger.kernel.org
X-Gm-Message-State: AFuF++ny2R0rGF4gdv3B+BSaTFbKEoVjP6cCFAHCWYFmQhjyAglw1LtC
	2nOER3YFjw/Y3qVM6T8qF/QpXoa8kBkCuFL0dXtaLosvC5AAPVkghHzxjFGV1akECZznzNRVial
	mebYheZiJtIw+5dnR6kRO58ZaHYyzeBOPCDicoksc6lg=
X-Gm-Gg: AYBFou2l3qhT39Exh1J+4lIQuRVoEo2qAJx3I77hCVCKMzpHZlDrXN2Gb8UhOgpbtZ0
	wQF4ywTrsrMn3jF9sj+hbbADhRcoMTi40oY1ccpbqw7IAY8+GJmLLn1i3yX+t/YjXzOR604qP5r
	sOJP10sQRYKzVTyrfH/rKYN0xuTzGDFrVDLYZx/xdVzwe1DkdfDkv6LOi1o7Z3HKf5WrSJlQLuw
	iF1AzX3GJxHRQUAEpwLxvt6PtL+TKw1lcWGGCXeqQAH5DLdzuJezpE1dQOVzQWa4FdkVFRUp+4E
	dMQgvxlvTaNWBX2pWt8mkRRdozdV16MHdqsPknmC+JG7z+zwdtrZjldQaqLK1ukJb7p5GDfrFLb
	i
X-Received: by 2002:a2e:ac12:0:b0:3a3:364:f783 with SMTP id
 38308e7fff4ca-3a33e515762mr8807151fa.11.1788255268016; Tue, 01 Sep 2026
 02:34:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788223735.git.zihanx@nebusec.ai> <7b6bd9bb1bf6bd43db18156f42b2d7f83789a673.1788223735.git.zihanx@nebusec.ai>
 <20260901092135.GA3402711@shredder>
In-Reply-To: <20260901092135.GA3402711@shredder>
From: zihan xi <zihanx@nebusec.ai>
Date: Tue, 1 Sep 2026 17:34:14 +0800
X-Gm-Features: AcwNN1W81ESOZ7FAp3XHS-uh8ENJqN1hRRIa6EY3HEt-t3T4rInt27-n8S7n6Vs
Message-ID: <CAANe3eRHfO+Q-3VYPJ6Ui9Sm1TzCA13DYd+1aFh7Qfg8ebbhbA@mail.gmail.com>
Subject: Re: [PATCH net v2 1/1] ipv4: fib: bound automatic table ID allocation
To: Ido Schimmel <idosch@nvidia.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Ahern <dsahern@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Patrick McHardy <kaber@trash.net>, stable@vger.kernel.org, 
	Vega <vega@nebusec.ai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 5:21=E2=80=AFPM Ido Schimmel <idosch@nvidia.com> wro=
te:
>
> On Tue, Sep 01, 2026 at 03:00:01AM +0000, Zihan Xi wrote:
> > fib_empty_table() probes every table ID from 1 until it finds a
> > free one.  IPv4 tables are stored in a 256-bucket hash table, so a
> > dense set of IDs makes each probe walk a growing hash chain while
> > RTNL is held.
> >
> > Automatic table assignment ("ip rule ... table 0") is an IPv4-only
> > legacy path.  Bound the automatically allocated ID to 4096 so the
> > RTNL hold stays bounded, without changing lookups of explicitly
> > specified table IDs.
> >
> > Fixes: b801f54917b7 ("[NET]: Increate RT_TABLE_MAX to 2^32")
> > Cc: stable@vger.kernel.org
> > Reported-by: Vega <vega@nebusec.ai>
> > Suggested-by: Ido Schimmel <idosch@nvidia.com>
> > Assisted-by: Codex:gpt-5.4
> > Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
>
> Reviewed-by: Ido Schimmel <idosch@nvidia.com>
>
> The bots will likely complain about the change in behavior because the
> commit message doesn't spell it out. I explained why I think it's safe
> in [1]. In addition, I checked, and both NetworkManager [2] and systemd
> [3][4] explicitly forbid "table 0".
>
> [1] https://lore.kernel.org/all/20260831110647.GA3202627@shredder/
> [2] https://github.com/NetworkManager/NetworkManager/blob/2e83a4082b22349=
9c4f1bba156998d0171071967/src/libnm-core-impl/nm-setting-ip-config.c#L2747-=
L2758
> [3] https://github.com/systemd/systemd/blob/9b62fd169e06d14cbab801c66f2f9=
c2006edb75c/src/network/networkd-route-util.c#L456-L457
> [4] https://www.freedesktop.org/software/systemd/man/latest/systemd.netwo=
rk.html#Table=3D

Thanks for the review. I will send a v3 that spells out the user-visible
change: table-0 auto-assignment now fails with ENOBUFS if IDs 1..4096
are occupied, while explicit table IDs are unchanged.

I will also keep your Reviewed-by.
