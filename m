Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F3E5328BF
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791996752; cv=pass; b=VmvyNkFBeZQ0qUvEchXSUdmBIoTmTm4xP1BHPGitnYp7h9/doLnzi33XpS4ondGbN/CmOzQgLuYhn8IeiZYmhAfU/xNeE7y7gcgpStucJw89/DBub3C9JzKeOHlvrjukxNl4h+XTMcBfnfPYc5wh+vK50LbFyZROaXMtgfijLcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791996752; c=relaxed/simple;
	bh=fQ50eGlFnjMQI2C3GaRdlcFw09nmY23Q11yUL7SlD5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AaAwBXV5/amnnNKHgTsNgUfUhLZMB5xXwY8GxqEXynk4vZSGuZAW2hNfVNeNLwZ8FonNPprSLSWzA5Gf1wASZrOeGHh3izfsiqHLX6pVzUDnWiz42UBDNvgajWIOivtLvd3rChD+BFdk6tESwtUQVbrAGntkmY6L1yjBZXXKnPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=cIqhkAJt; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="cIqhkAJt"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33e6279a1d7so1243456eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:52:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791996749; cv=none;
        d=google.com; s=arc-20260327;
        b=GBShZUavCyUP6znTwe+t/kBZ8F73ZODj+F2CDyi2GF/cktpeQIU1XEjiStFacfqXz/
         UT5sMBAypdisLczqGgRWKF94Z0RHyIyG4ysKDYLQ0IQmEaDQwGcXHJN7PLQQ8NfhdDTc
         YjXwnNrcjwkVjivRoxchQPQOVJbnFBunTzjlEdvSvAehMHC07D3Eifk4Y1Rn1BP6+FMW
         nmcynU3+9qIJUBl6zuS1Xce4X2v/KGCQhsv39ccMt/1vee6DV72yS7QWkB3sX78eihe8
         hfZBuiQrosjhw9LG8KyEU0cv40KwWWG1BPqJItmPQXN9X77Z8VxWzuBIHHYig7QpQSmF
         Dlwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SWLwZ/p70zDk5tHBhgiTHN/1ZMG5p4KgHwoBBSKxoBM=;
        fh=/X4I/+Z8nCXiEEslsCCm9jcQhGwUdoXXa9LnqxUlyfY=;
        b=d3HeCh69ePeQPzae8vusNaEuLrPJ5o/i0DGouDbLcwM5enZbk4Z5PlhNQIW7Oeizr7
         mU4eHy+BhglOUGSG9ocK5EdeTO4e1CVqBWuiLg1g5N3rhEdtYE7GF222s0cJy+EbF0ex
         30MlFd7MO9IRxL5o6zrSldRGDEO7Hr5DQqnuhYfJSmu6sjoEC8qKL1+xUAcDe5cUnVNE
         NGH1MXjd+3LFPrtJ26NPYHVm63Y+1BkYw7tWQ6MWr1UKTrr1tBLNJhYpKr8qFwvXSJ/W
         JDv1SCU34Ou+Xbr/slC2eC5btqSmQRyzMMpcV6I3IvcBI8Ea1Cs57XYicbktttP8eR0W
         fMtw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791996749; x=1792601549; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SWLwZ/p70zDk5tHBhgiTHN/1ZMG5p4KgHwoBBSKxoBM=;
        b=cIqhkAJtHmT03n2ZEgG8w4wzPyqXgS0tO+5FPE0Ijiuk5wj2XwI84XFWd0i4Vc7TXg
         kFDiRMoW3XYsxxKDS5EjN84s4sc1+2cceZ1KakpWldZFyeRMMfzl/gV6uTka0p/ks7gI
         H2hGLpArpHVzQrPUuBnAPvsjQJOHIS2HgT8d/fqOLKEnaKfYQb6yaQsCEnAERJSdIDqB
         3uTklSzvtA0WwbMzDPeMUTbDt8c7NVVUqdch7WFB+AhRJP0/3pEKvK4dpT/lDM+0bEPA
         zQ6a5NS2siQjSjLHvhxtR1xI24TbhiHMwCI5s05O8LFtnksRrNU7sRcMgCwksiRPLoMV
         KoQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996749; x=1792601549;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SWLwZ/p70zDk5tHBhgiTHN/1ZMG5p4KgHwoBBSKxoBM=;
        b=HzGEaKItyWMM9kyfkyer8Hn7gcjGqspwKOZPkUnyajNkkkefgg47pHGLnAxMDUhTUh
         eDahQtWUI7bezAeWQSHO6ZgLanTPeyDoLa8UEqb4lcvw+LQJ75+4yZrCuqcSmDwZdYS4
         yJqpAlo+ZYvQJP32NDgiEsMCJ4kmCMXJeDSfigdijijuCTCut2d8S7hNHXkO6Y+fDO0M
         NRbyfpZ8BDs3pOVoFYW7TARq8Z2aJHebJDs4D4kZ0RD8Tem0BgcIDoPOg7XulSdFNRCO
         geqo/FcGDuAMzxPpjzPSKFWRIH0neMHYD2b6Q7Cw+fTu222cRQ0IzMvK+qii6x9GrZ8o
         uQjg==
X-Forwarded-Encrypted: i=1; AKwUvBxO2fUSKHn5Ey4AjAoGqhrStzE3cbHua2TM4Re7Wm+NRbuBvuXU1AdeaMG3/82lFNpl32VjZv8lbIOPdaQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNg7P3VIma9R/26MM5A4nn0aLDMQ+P5oAL2Go0avW8e5VYLTh3
	QeXgtzMLENwxn6J4yBdggnKvVDYVVeV2z7BWwah2iZd2elUnO+feOJ/HzAlNVE4XFM6b1WNpVyN
	20jRsa2lA69LmukBLjBIJ+psVmW0S7VvuXK4V30Aazw==
X-Gm-Gg: AYBFou1TGb5AV5a6aJKFVXfEPNt3abzcSZLf1ep14MZLCoO5fFWveI9+y9sI37r/hGT
	ufP4FawiefZqUujbkeRAmDzRpJ4edSY+I5DZuNt1LyNxOu6yG8PiCGo90t1PXEIZs3aKpNeQKv8
	w8vg1JE9lw2+mkBvajlxp7cKUzr26AoQzV/dapQw9xR1whgplOjFaXH4yoOJlvlc9tGfqWwN5Tk
	wo0IYO3jFoXFg2TsryfQ2LxZd0zK6Fyj0Pog8Bl+2OpnJcKkz46FXBnBdpP+JiF8YIgPFB65vLj
	x14n1EKoMW2ecJ1knkGvXaMLgJjG3iKJw75Elo4lMJU79+VtnP01dKicdaFxdsiDjQjvCRkAu3Q
	IyiqGskx7ijBmkA==
X-Received: by 2002:a05:693c:87c7:20b0:351:516f:7576 with SMTP id
 5a478bee46e88-3537e01e8a0mr23272919eec.10.1791996749365; Wed, 14 Oct 2026
 09:52:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-b4-skb-segment-nosg-unreadable-v2-1-6c28d8ffa51e@toxicpanda.com>
 <20261014135154.05de968e@pumpkin> <179198668564919.2.10323410751655182155@toxicpanda.com>
 <20261014173042.0a74a25d@pumpkin>
In-Reply-To: <20261014173042.0a74a25d@pumpkin>
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 14 Oct 2026 12:52:17 -0400
X-Gm-Features: AclHuK-GYay-AQwoTupL5qC9wZ92QZPzmV0dk65w2lPnhQBw10ayUmM8aY0IhLk
Message-ID: <CAEzrpqd9Pna32K8i5Ug3tP+ZiRa7-0GmyX+sn=OwbZ_3osEAsQ@mail.gmail.com>
Subject: Re: [PATCH net v2] net: skbuff: make skb_copy_and_csum_bits() report
 unreadable frags
To: David Laight <david.laight.linux@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, David Ahern <dsahern@kernel.org>, 
	Ido Schimmel <idosch@nvidia.com>, Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
	Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>, 
	Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Mina Almasry <almasrymina@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nfs@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 12:30=E2=80=AFPM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Wed, 14 Oct 2026 14:04:45 +0000
> Josef Bacik <josef@toxicpanda.com> wrote:
>
> > On Wed, Oct 14, 2026 at 01:51:54PM +0100, David Laight wrote:
> > > Can't you use that fact that the csum function should only return
> > > either 0 or ~0 and use the other value to indicate an error.
> > >
> > > ISTR this coming up before with the 'copy_to/from_user_and_csum' code=
.
> >
> > skb_copy_and_csum_bits() returns an unfolded __wsum starting from 0, so
> > 0 is a valid result today.  It would work if it started from ~0 the way
> > csum_and_copy_from_user() does, since that doesn't change the folded
> > result and the sum can never come out as 0.
>
> The result can only be 0 if either the length is zero or all the bytes
> are zero.
> You can probably prove that is never required.
> It is likely better to initialise the csum to either 0xffff or ~0.
>
> IIRC both IPv4 and IPv6 complement the checksum before sending it.
> For IPv6 a zero is invalid (it means checksum not calculated for IPv4),
> I think the best was to achieve that is to initialise the csum to 1
> and then add 1 after inverting it.
>
> > But this is one of those "you have to know the behavior of the function
> > to use it properly." Explicit errors are always better, it removes
> > ambiguity and creates cleaner and less error prone code. I'm happy to
> > change it to start with ~0 as well to add the extra protection, but
> > explicit errors are always best. Thanks,
>
> Look at all the places ERR_PTR() gets used.
> An in-band error indication gives better code and is probably less buggy!
>

...ERR_PTR would be fine too? I'm arguing for explicit return values,
not "0 means failure". But I don't care enough to argue, I'm
respinning. Thanks,

Josef
