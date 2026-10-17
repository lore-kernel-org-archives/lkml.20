Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D301B48123D
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792233464; cv=pass; b=NLieQOEIiDvTt8AI30+hUtOdvP52cb6dwwil+LkVs1B60LTalPX9+g1xTSyT705PRG16mJZkQTTt01CKLIMCS71SptwWl/KrwL06RyKT2Oxl85ex4HcKlQLcVtXbFD2lAowC5I1gVRmNWWDQ8CadD/2QOa14C3LWuvL/dE9shfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792233464; c=relaxed/simple;
	bh=DdTRwYsOyMO2Pon1eB9HGGKKuUN6WYiZ/XENSt+d+ow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OTDuKth5FDhlTebVj+w6PSNnAvBK3ccOVeLdG6uFPGsC8+cy9lbdYFVSCzNw6Y6wlDnOu8Z08mH16yRD8qYlvinm+wvvubxZCUnNVkGu9TnnuIkeUf2PBK4ATWLvZrHoPjP8WnnZy2KHIxIjhsKNBAihNE4Gsd3ZAQO90bUrOh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=Gz8k7RRe; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="Gz8k7RRe"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-679a2b5fe87so684749d50.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:37:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792233462; cv=none;
        d=google.com; s=arc-20260327;
        b=akUNl0a+adZDXCvL/3LevE4tC4JwQq9Oeo6c4fwOkCvt84sICckrNAL0gFih7MDwrs
         1pmZbZp2XDCOIM1fAC8ltLsOWj/oBjivzyglZ2RGfhvG4TwaSiI1Fc88eWIxB3c5Dzxo
         7zVgZ6YMc2KBEwVp4xu5+UWv+cHAlIxB27g76R3S5nuLjzDWpYm2VpbBIKb9e1XC236H
         tYzS3eOYNJ13emMe566ddrnCKL0ZRRT/MOi96RGEEfUL+YA/Im8D1uOVp9I5UcrR7fBC
         X70EdTHV0d2ck+G6zEkRPA4PhrQVTfbq6DnHqm/owQokTGyJRj6Ov0D4yNVU96hsE0Cw
         uPmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8xQtVA18Ly6EVrTffA/+C9Ju5Q0HewYi23Ad/Eu06YI=;
        fh=/Was0AKr6Q8s8PjjgtlW//XaiKR93175e83wfKCvg+E=;
        b=SxU9JDtShrACsl3aehMSvDWS3Zq0VSKtxEtbs6n3GLd7nCXiiU9/hxtVQdD7YpF4gz
         pYGinM9S3SDB9/hV0rvzlL7HFFFhgFuP9exYtst6lb4KQxCIChTNFXpi9GLOWUStHEr1
         /1W02hqDcCTT4YZ/wP01X9xsRuTzb8KWwsiudgWyA7zeLvmmlMec5EzC+73TZXM8q9CS
         c2FApJQ92AaoLKB+mmAZ8b5ls8HsNQAaI7zJvOi/mGnXSQ075HQghYM09bSpduaI30Fe
         6RAV59nPuq9jNH2OhIPoddfehkFe6HeoQxkwBJzTvUNuToIrcrMszMMYvOecUGEeBKwj
         v/HQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792233462; x=1792838262; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8xQtVA18Ly6EVrTffA/+C9Ju5Q0HewYi23Ad/Eu06YI=;
        b=Gz8k7RReE/vgqJIU2IlmmvzZtxgqj7Zoz1Pqg9mI57Ea0Zjc9gnNpvTRM8DDyEByI8
         KR4iQRBvgZjjOWswddPDV1Tl/sWmckZUrR2NlxR2jl42h63QQUetaHO6ieZGz/8wmWZ3
         MIMzj31omne/mFjOOAKGgAvjQvM4c5omH1sOhnT8KjKTdWh1dAQoSfuwK6uVJCwBNqPh
         T1TQ6e8QIYjRj9JeRF+24xakerjrFEM5UAcQ4d4Iy3cwyT2oKVeqH5JvCYZfYnk3oJYk
         emC21QpdAUUd5mZGxoOv7FN+tsAPAl43Cx/+SW3/XatAAY+2Jukl3l07heiWDmO3MnXX
         02UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792233462; x=1792838262;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8xQtVA18Ly6EVrTffA/+C9Ju5Q0HewYi23Ad/Eu06YI=;
        b=dfC3swn5i3uuOKZ5bleI2XeqK4Eym0t4VC310hay6SgXXJ0hVTCU3NcAdvh/MyBoJO
         xNsRFUknNCuPRVsrg8Y4F6PIJ3D1glwt20/n0hl6EbcLbyT65rgaYfLPZJWXd3q3sAk9
         9CqTndhvma+bKMamXuYDhWNDNDhwnM8216pPKsE+Eqfp4olgzpzphFK4SdFI2PJUQz5j
         26Xt1VEho/8GHNL40G0buZdRxPw4Cpj8fNKBXet9BqWovyIxYEuuyefMtvX3BTBofZrH
         Ig7sdoWV/QvPv9Ro4u7StaDdYdhQ+7u7gjxeTzXXtAZBWQTxs85ulrJlXnQvLPrD81IO
         6w3w==
X-Forwarded-Encrypted: i=1; AKwUvBzs4PiotM4ACV1xCUDWBnD+89lap5DRMnkSNGP5h5Jl3lVaep1sp1OEao8R3UdJYjXdkOQpvSYgPZe7WDg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGPkY+3PELM8j/92i+pyKVeuWiQXqT5Izb2eii+iPM9aklpTrI
	dCrefNOi5pbtuqOYldqIJd7dMz4mzhzDuyqg8ODLDjK+mcL6Ly2exuH7En5YTbDw3s77jMPCWIc
	DwV1H1MYqj24vZr7lQZWdwZ67MOGqQcg8aKWylDqU
X-Gm-Gg: AYBFou2I/3CkSgAuiNZ9FXLPjMn+TOBVnQDmN5aLLGMOSzYey48q//tChwuMODQoN0W
	tXjdEKPmv8dc2Uvn69XiXNMFuSp22rq8g4LVeF5hutSS0qUjNLg8BgsGxWl3V004d23K2D+vQde
	Z787EBamOmDompZigp89AgGP3YWJCS2JPXFPgO6laM19MB3zLfV92cKHx2K7E3aJmWQIUQZ/EKi
	BddBaOHDIaCSXwQGKRhrelEoHAKIfMAjNFyIWXnfl10QFsno7baOZzZTJ4KpTxaZUqVQ02A2lPy
	FV2muJU2bEDQ/wa5X3LLia3IErC42syWt7tlLuYwOF4vK66jA6fE4ir7WLdhfHLQPYNF/dxAoT2
	+Ip4B8lSoxqtHr0EfQXyTgqKSeC5zqfRIsAsmayDJ812J9wmVGhchmtOS/rOW/yCKD4iec6jiKs
	lpVKXb6W5Vlr/IebmgQSeP5GKIGRoyDKFx7o/FzyG1WQe/sjgbpXd0t1Yv3mJVg9+OA/v9EoZit
	PDTL+dX6JM8XSDNFeUXQVdKjRKCvrQX6GNNcICGK6kArWeywc3LChAKjiUv0FplgwWmiCNGbXpj
	VHyzwKMBzO27QA==
X-Received: by 2002:a05:690e:1913:b0:674:981:a937 with SMTP id
 956f58d0204a3-679ca914780mr522735d50.121.1792233461776; Sat, 17 Oct 2026
 03:37:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004171616.3544880-1-julius@bairaktaris.de>
In-Reply-To: <20261004171616.3544880-1-julius@bairaktaris.de>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Sat, 17 Oct 2026 10:37:05 +0000
X-Gm-Features: AclHuK-ma-16nXT2QPoniX4Y6rIglK1_-HkBDcD-pfQT-pjJWoWmgSkOWis1dDQ
Message-ID: <CAC1t37LLnXEaD2YDSj1iBBxezSKjHGNqm_AR9G4s5Nhy_O=9mA@mail.gmail.com>
Subject: Re: [PATCH nf-next 0/3] netfilter: flowtable: update upper device
 stats in the fast path
To: netfilter-devel@vger.kernel.org
Cc: pablo@netfilter.org, fw@strlen.de, phil@nwl.cc, coreteam@netfilter.org, 
	netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, andrew+netdev@lunn.ch, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nbd@nbd.name
Content-Type: text/plain; charset="UTF-8"

Hi Pablo, Florian,

gentle ping on this series. Let me know if you'd like anything
changed.

Thanks,
Julius


Am So., 4. Okt. 2026 um 17:16 Uhr schrieb Julius Bairaktaris
<julius@bairaktaris.de>:
>
> With the software flowtable, packets bypass the bridge, VLAN, PPPoE and
> tunnel devices above the flowtable device, so their counters only see
> the first packets of each connection. The classic forwarding path
> always counts them, so this series does too, without a flag.
>
> Patch 1 adds VLAN stats helpers; it touches include/linux/if_vlan.h, so
> a netdev ack would let it go through nf-next. Patch 2 updates the
> counters from the fast path with the lengths the classic path counts.
> Patch 3 adds bridge, VLAN and tunnel counter checks to nft_flowtable.sh,
> which fail without patches 1 and 2.
>
> Hardware offloaded flows are not counted. A GSO packet sent through a
> PPPoE device counts once, not once per segment.
>
> Cost: struct flow_offload grows from 296 to 328 bytes (slab object 320
> to 384). Forwarding from a bridge with a VLAN port to a veth in an x86
> guest, mean of three interleaved runs without/with the series: TCP
> 55.7/55.0 Gbit/s, 64 byte UDP 177/173 kpps.
>
> This series was written with the help of an AI coding assistant. I have
> reviewed and tested it.
>
> Julius Bairaktaris (3):
>   8021q: add vlan_dev_sw_netstats_rx_add() and
>     vlan_dev_sw_netstats_tx_add()
>   netfilter: flowtable: update upper device stats in the fast path
>   selftests: netfilter: nft_flowtable.sh: check upper device counters
>
>  include/linux/if_vlan.h                       | 36 ++++++++++
>  include/net/netfilter/nf_flow_table.h         |  8 ++-
>  net/netfilter/nf_flow_table_core.c            |  3 +
>  net/netfilter/nf_flow_table_ip.c              | 53 +++++++++++++++
>  net/netfilter/nf_flow_table_path.c            |  9 +++
>  .../selftests/net/netfilter/nft_flowtable.sh  | 67 +++++++++++++++++++
>  6 files changed, 175 insertions(+), 1 deletion(-)
>
>
> base-commit: 87b80c2f6b05cad9f0ff9136709c62a0f59923e3
> --
> 2.53.0
>
