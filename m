Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F9140BCDF
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929062; cv=pass; b=swdfF39kgrxplW33Cl1pr5FhfWTZnUOXyn9196LjzVpb4wHwqLiM1Cl/XMz2L+/ichkAaMPNCDSl6C4NUI/N7RJ8XeKOeQIa3uS75Kf7EJpmwiCpg0GxZQbzYc6IHpsiS07D3p6aTcoPqTFfnpmyPqKtFGLDPynlcmuNKx4gfR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929062; c=relaxed/simple;
	bh=kAyeEhSjNccNcnTFgFj7n9DSA0wrFShWyms0f0y15AY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VIzYbFWXW/jnYA4DSV4NdGTOa6hNEl2hNxPchSO3QHGkm8TMR771T49BFYD/tN5ySKReF7YTKcpViUjh+nEFmDGeboRmb+2Zng6IGwfmuOvj8IuNiBvBHYrdhKdS8jPqhGxdFTi91wOv5KB0FEFojUIdLb9iY0SEgjjQ7AqnD5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uSg/N1iS; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uSg/N1iS"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-52b3934af3fso12932401cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:57:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787929059; cv=none;
        d=google.com; s=arc-20260327;
        b=b3p9H/aILH/D0LE7Sc/yZfGvzDhAp83TjmWUWTiOyPrIrx7errONhj4A55aruZTQIj
         s9PrsIS/X/Bme1xhheOcl0b6JwrqONCZNiMNX7dBGpl7JPVGxi1nc00FKIYTQqPUmsUq
         jZGrET3Dv5jYpNAvCiIVTCxWWyFnOFioTXUeV+sSZzukp9uU+TG0VEIXah+I/Dhdihdv
         wMb2nngFa9oP6ew7e2GJzBMEIV5b6q/jFAnCFh6LMCm1jJYCk/jzp/rUigr88VGSCu3/
         ilWxWD9+G2urLQRFUuuu8uz9N+50QekMVXtanOyeKpty9ha1zgEtYyaasN7fjnevmxCb
         3EWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kAyeEhSjNccNcnTFgFj7n9DSA0wrFShWyms0f0y15AY=;
        fh=azpyrgHHTX4BHy8rTeVENbG6ttQo7mazqCMlsGBNCCM=;
        b=NP/xPK5bHmEoe7b6RFD20/moHa4JaYY1VLsztjpHsuheD/R2MnDPWiuHGA6mFdEsQj
         aPaslmIBt1l7c0q5Q+XKFPZHSn+UyfpV3SOaWPVSu9CUu4XXCjiX+0JYazCg1L1P729u
         9MfEeINVH6fqs5ViXHZiLzCSB7PqIuEOjsbM6Xc74D3Q+/IamnwmLNa8Y7+tRS0fpGHM
         ifVpcfKwmJ057Cbfcjgp6NX4YnHlDGEwQcQyGZXeF5CtCAFwQEH0kjCHVxbvkje0DGZi
         JXqIm7voeBtkcCSknTx3jLlZJYDR1St3yR6WfCApPIGEbhE6C7ZReVoCfxagmfdZ2jDl
         A3Lg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787929059; x=1788533859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kAyeEhSjNccNcnTFgFj7n9DSA0wrFShWyms0f0y15AY=;
        b=uSg/N1iS9wRCLSsaEb5RIKeZW6B1H07+sjbyyMr7O6RyDSp6qcgD9gGPwKE8fkXcW+
         wCy2Sby5T+FoRqJZmVcZVIEl/UWrxrHG5yrCXHR3enIVXI6RIDwDKz7geaIx8LfzJ4tf
         MPU9b1K2TUG5oFg3i/aKQt67q4Mr+hNaGgruUh/dgo95iRtN7th41rv01tEewQgnAICI
         vHVfHjfD6GMeuclYPtxIsn0lBAwh4StJwePMr06+NBmJp7nwMYPR8irKqToaySbYqOOU
         +//iUnCtw87PflVAXOAJ21UI07sKgulVqLgtFe7WHhf4opRFRcL2jkD3y2027K0iwc8K
         10tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787929059; x=1788533859;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kAyeEhSjNccNcnTFgFj7n9DSA0wrFShWyms0f0y15AY=;
        b=U96wXSpF9MyZPGuYHDE322mHPy9S3iB+mf5wNKg00rpGhxAjipknv7GugU6/phgk6+
         pE5blQfQFlivzNKcS37lCOAeym0Vykr/vLCbYriLIDTzLb/bsYk4sVl2Ug0J6H9Tg5TU
         AXCJF7mdjI4WCdJEvZZmETGASB/UfONXhaIGCaeiPOdm2j0R1iwjfgSsFutfKYZN8kAw
         k1pr1x/uV1rsWYEi/NqOfkDw6jXD/ZshEivF3gbwE4G+O1eqk9yfeJVjCB0IAQZ1kRdf
         prYJ5SPafv+JivtVInC+MmVDzGUYXC3ph+I+6197anETYWOqmzRgDYPWtNd2bLKIL/gb
         fRTg==
X-Forwarded-Encrypted: i=1; AHgh+Rpw+wmrzcW5J/g5go9qSqn2t2PT5pvo/XkEIoJ80iWRYtZeXWMH+FrQvwy0jkb0NHLGSQHR37/MziD46uw=@vger.kernel.org
X-Gm-Message-State: AFuF++nzLP6nU7I0BCwTIAsjbnvoAKPtxarttMiQxToulNfBpNeUI8Mm
	TZbjOx9N6I/7l9PVXyp2hDevknsp/fnPxazuZkJj7jEMywYPGrCHYYZ69vZa9IYQt7riERuYgxr
	nVeqBHfSB2ZXllStnkfMDjtLEQwbWGdPM4tjE7kOr
X-Gm-Gg: AR+sD10Jx0kXTepKVgU+NY8Im6+pEhHaqdw43JMZXQWMa6xns8Y5pmpICQLiLnv53ms
	rauuE8EbXmIFBAUVM5B0UD2q7X6ueKkmfMtBZS94oDleYwVlhHs8mu4eJDcGsJOayWXV3r4ixSd
	PnDpZflvZMof3qhIiU9cDjYrz/qTRq5T20QGafU7tNc6D5D8HxYP3Ec7kaKFQiOvbaqqo84WELR
	Nc38amWh8+ONHexsF6rhFMqWhfAfV/OJtv1B4gWiH+olPLhO7Z7RNa8p09NHpGPjU4w34D+vY8h
	B7ON2GOhJmnuM3KiHr1psAa300g0hYf4XOG52FX0cZJkx0RweAunclIJiRfiBI2Bv1nZWdWxGrN
	MpyR0freReJeBvlpghxdqebdFiIheiGFhWY8E6CucbPWFKQ4Lc9GacQ35HNBHpYaFeavwWA==
X-Received: by 2002:a05:622a:58c:b0:52f:b36e:4075 with SMTP id
 d75a77b69052e-52fb93b2b20mr87332321cf.10.1787929058786; Fri, 28 Aug 2026
 07:57:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827230233.94878-1-joe@dama.to>
In-Reply-To: <20260827230233.94878-1-joe@dama.to>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 28 Aug 2026 16:57:27 +0200
X-Gm-Features: AcwNN1VizoTZVZB2sDoB94siA40iAhF_z9QOM3aJZ-MfaTs6002ngL1t8IbRvxk
Message-ID: <CANn89iJTkVw17sM=8Y80yh40vEHDe=tDWicGVsoLNdKBv9GDMQ@mail.gmail.com>
Subject: Re: [PATCH net] bnxt_en: Prevent queue stop with deferred completions
To: Joe Damato <joe@dama.to>
Cc: netdev@vger.kernel.org, Michael Chan <michael.chan@broadcom.com>, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	horms@kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 1:09=E2=80=AFAM Joe Damato <joe@dama.to> wrote:
>
> When the driver receives a burst of packets, it can mark a BD with the
> NO_CMPL bit to defer completions. The expectation is that the last
> packet in the ring will have this bit unset and the completion generated
> by that packet will cleanup that packet and the ones preceding it. This
> helps to reduce the number of completions fired.
>
> The suppressed completions are controlled by the driver and the number
> of packets with suppressed completions scales with the size of the ring.
> SW USO packets, on the other hand, have an upper bound on the maximum
> number of BDs which can be consumed which does not scale with the ring
> size.
>
> So, for small rings it is possible that: a burst of packets is handed to
> the driver, the driver defers completions for all of the packets because
> the number of free descriptors stays above the threshold in the driver.
> Then, a USO packet arrives, but the number of BDs available is not
> enough and the USO code exits early with NETDEV_TX_BUSY.
>
> In this case, you end up in a state where the ring is full of packets
> with their completions suppressed, which can cause the queue to stop and
> never be restarted.
>
> Assuming default CONFIG_MAX_SKB_FRAGS, this is only possible for small
> rings (<=3D 457 descriptors, below the driver default value) when
> a burst of packets fills the ring, followed by a large USO packet that
> can't fit. For larger rings, the delta between the completion
> suppression threshold and the BDs required for SW USO is large enough
> that completions will fire and this case is unreachable.
>
> This issue was pointed out by Sashiko and while it seems fairly unlikely
> given that the queue size must be small to trigger this, it is indeed
> possible.
>
> Fix this by tracking the last BD which deferred completions. If SW USO
> exits early and there is a doorbell pending, enable completions for the
> last packet in the ring with disabled completions. This ensures that a
> completion will be generated and avoids stopping the queue with no way
> to start it again.
>
> Fixes: cc5d90667db8 ("net: bnxt: Implement software USO")
> Cc: <stable@vger.kernel.org> # v7.1+: 4e15e89faac9: net: bnxt: ring the d=
oorbell when SW USO exits early
> Signed-off-by: Joe Damato <joe@dama.to>
> ---

Reviewed-by: Eric Dumazet <edumazet@google.com>
