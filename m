Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794657899;
	b=wSESY6y5H+slR95UW9lemYNX+G2EV997PqSvcHMSgdUydJHljugiAhjagbYWUOLuO1h5
	 eokIXcMP44lzyYw8a4qT1vbYappcaSpNJYDe664HpEotQZMl4Iikq91+wZDG5Pwk4zO1A
	 X14FhbAk/ZZ1vdZ4jELkWAF6x22Li6gMtUN0Ak8NkGB4Bdafk+p9BibpUx5oKG4JFtRlK
	 MvMkSrEpSpDV06+hztq8p/ky5AabFSKPxoBOVtMpmQYpRyNIgldzbHSosHng1DNiF/kNR
	 cZBxgTKn8VFs4CvRwYXvr5gMwvYD2+F4VsshBprMWBKVo6Iu7Vn2SymObII+XkaRekA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794657899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gKJ+mTdGFKhhnohs/NLJjgkzp0d0JdJ5SvOCcapXCp4=;
	b=u5HO3RQ7wwgEZH0VHqK4I2C43nDTyH9Klwo1HvdGo/SXYxi+HiIAbK0B3vwAZ0D6u57X
	 cHqWXUk4vsuxY+l8bZKcwqRxYKKFNDFMvWJe5vRuEH+8CnT8KVTcS2I6M1A5Prtg7quS6
	 cmFR7fKST/ELVbStZZN3hBOj2Bb7KGzgwCInPZ8yaWglkIQT/ffvlpot4CNpWFK4UXB/K
	 JK/yXAqSvaaEr95DgdSa8nWavuoWKbPNiJnlG6yvjza43l8Qs9b2BHXwInUlvrTrhcZVg
	 KCyqxBelYhokUVL+GsgtBmHs0wjl6EUuetr/oUacI4qWHvcjYyzKR1lgI3dkXm1xU8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=t8fY95lo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDBA606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:04:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FDBA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=t8fY95lo
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a058315c79so1294890b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:04:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794657898; cv=none;
        d=google.com; s=arc-20260327;
        b=nKgoFPVDHQv/qx8XfcBuk22pNTbOH9XYzF5TqXYD68raxO5jUl3YiFU0OJNUqGqp9K
         E+f7cbMVjwYy8R+5U/KDEDe65F0DeuVRKhg4UZ2HDPGrjbuhiLEIM6bQM+GcVbamEqA7
         6PpANwHMn73ley/RD2j+lRXUKu+VfPvvK8XNVxnYIcvgVqkE2yg9r6ve/OiZkEhWraTB
         UZpXYVg+btztL3F+3YgQMLmyoLYcGOQ+AbJVwAeNON9ESnTeFgcE6uJ9kc/Oz/N2nw0o
         1hNCCPKpujyDP/+e4gLp9UPBAp54BRq5cpVPE9eBBIyQYJ2PtvEMdIqt4p4wrwXkmewF
         4U4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gKJ+mTdGFKhhnohs/NLJjgkzp0d0JdJ5SvOCcapXCp4=;
        fh=qiy73quuLlEltN2Sca4nrc/nUxugHrdWft6XI0eBdN4=;
        b=TyjtwNoFqPjfQVdN73zylFwDjSwkMeAZo25U1lqbMT/Zw7CMozeMWgsqp9GY3i7gbY
         sFWw4HrziM10mT5ukm4HIChqME0eCGWYBCIBhXSfshfDZqNrhfb3NMJ9Qe5eZH9hn9Fx
         7NzFu/rjEJ34h6r1uptw9qpYWwO+HC/zkjw41SYoayCaFmc8wH3shpDKRWWHtdjnNbKn
         O4jTWq0g7tv3fapJqwXCnHFNZkCpA5Ni24dYcvzsAZLNFBDrqVnJ3BPB4ZOvxfFJjXNS
         kfw5mOrmt/MEQULFDbc4hr1J9wgEd74MhAI7eo4lA0fAKVjsAQlezFP0NoGB+RAgr6wG
         Uwyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1794657898; x=1795262698; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gKJ+mTdGFKhhnohs/NLJjgkzp0d0JdJ5SvOCcapXCp4=;
        b=t8fY95louL73YALHqWLdAldiJ/r4amI16c1eqOrXx3jcxfMoZqAtjWM75h5sjD1Mpp
         lMgAUBaz5oH5XGG95vbTUw6EcYJB1G6zGGuvqnJ2snSxN7Pvp385ga6Xft+w3+RcOsPK
         KyVCico6t7O6BtTDrKWFmk1JK1g553StTKLZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794657898; x=1795262698;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gKJ+mTdGFKhhnohs/NLJjgkzp0d0JdJ5SvOCcapXCp4=;
        b=lvZ9tHTuLElcMy3mOxQrYFoYzrTFzMTUeOpdECm3uS9yVcFASUBjs9QSO6Da4ikW2N
         oLCv8dZZK3pY/AzEZBWp6PRmmMXMhk2I0YS1W71+fh+CVkbV3ctEdXOJMEb9wOZvpyf2
         rkRDj1K4MInJp3W2TF6K6PRAr43h9z9cjHUbR38Dc0SxOg/m4oqmzDjaiEqfG7IvLxbC
         0MOzP2ZkNCEJDnamPleDQeK9NKcgyd/qenase3+Z6yKjNtyl296uyKTwuexVrGwnF4hE
         AnkhrC8SdmOg/ax7cZtn/c5qVvmmbRVsque7gV5Wl/EHrEWMa+tIT6twnJtKY4clbNex
         sZZw==
X-Forwarded-Encrypted: i=1; AL+hErG+ZPm7ZXbAL3GjMfQ2dHrMPGqBKzvDpoewk7GF1pc9INQaF9XY8EE0/8fCvG4yuHaYHLAxGeQH3a1S0no=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hl6wW00y0btH0dKCx8cfIRsbeM0EiFJJndNmUaJaN3F7gAG0D
	znfFAhsi5bkVF2UXEiPWEGmll4wQGnjtYK9VP9mlqlhia4kzbZrl0mZ3SYRAfj8G8R+jeKKs55e
	q+0h23yPQis2NvzbKbHS57HOe6qGOKp8w0Yi8CLhy
X-Gm-Gg: AYBFou0GqqYpKKj7LyLny9tl7mXSgxuPx5CqFinrmwUv7IXsq5Mn0+abKPSoi3paXeg
	32I87vHiNFesxPdPadODwPtuKIC+fmZ7za61WCbbRgMq5mw90kQalveMrYwfmWHbUKI/AYA53lB
	K92G8DmssqSd7wV5QxrlY81u3eYuO+nzH58/QiS22DvLTgDZ4ypk7RLVODuWwM2g6nfpn53jEeR
	l6IOmDxQCH/DmeM02btWAWE5O859IGOxuB9GbQGQzciymb85gumpE/r/EQHLN3gHMCe8uwi8HTZ
	HURv5pemXp9c/2JGuJyAZ5nz9VBYb1sR6dHsz0JKc52+kZcLjR/iKQPsB5fzEJsN4s/MHVAMugW
	zBPqE9xEWZoStpxvWgExzc7C1aqgC2NI6u2LKSBJRFio+rOgzhwLOTHOLuhaZUu1wvuFm/Gp5OV
	4gr/3IXNu7tYA3bbE=
X-Received: by 2002:a05:6a00:188e:b0:8b0:4e79:b3b7 with SMTP id
 d2e1a72fcca58-8beb63a2bd2mr4941673b3a.31.1794657897786; Sat, 14 Nov 2026
 04:04:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113185553.171059-1-toddfreed@meta.com> <20261113185553.171059-2-toddfreed@meta.com>
In-Reply-To: <20261113185553.171059-2-toddfreed@meta.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Sat, 14 Nov 2026 07:04:46 -0500
X-Gm-Features: AclHuK-HzRxyaz50x2QBJn-n5uNP2J1O-ML4FbLSRGjiewNn8xPID_Ky1F0Sj0M
Message-ID: <CAM0EoMnJEGweo2oxJsgAjuwLDHrMAEEwuisFX-CDSbj+TvK3PQ@mail.gmail.com>
Subject: Re: [PATCH net 1/3] net/sched: act_mirred: don't send decrypted skbs
 from egress to ingress
To: Todd Freed <toddfreed@meta.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Daniel Zahka <daniel.zahka@gmail.com>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Wei Wang <weiwan@google.com>, 
	Jiri Pirko <jiri@resnulli.us>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Sabrina Dubroca <sd@queasysnail.net>, Boris Pismenny <borisp@nvidia.com>, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 1:56=E2=80=AFPM Todd Freed <toddfreed@meta.com> wro=
te:
>
> On transmit, skb->decrypted means that the device must encrypt the
> packet, e.g. a packet of a kTLS or PSP device offload socket.
>
> On receive, skb->decrypted means that the device decrypted the packet,
> and kTLS device offload trusts it as such (tls_device_decrypted()).
>
> A packet which mirred redirects or mirrors from egress to ingress keeps
> the bit. On ingress, it then claims to have been decrypted by the device,
> although it was never encrypted, and its payload, which was to be
> encrypted before leaving the host, could then be forwarded in cleartext.
>
> Clearing skb->decrypted would not work, because that is what indicates
> intent to encrypt the packet.
>
> Don't send decrypted skbs from egress to ingress: a redirected one is
> dropped, a mirrored one isn't copied.
>
> Fixes: 414776621d10 ("net/tls: prevent skb_orphan() from leaking TLS plai=
n text with offload")
> Signed-off-by: Todd Freed <toddfreed@meta.com>

Missing Cc: stable other than that:
Reviewed-by: Jamal Hadi Salim <jhs@mojatatu.com>

unrelated - are you sure patch 3 belongs in net? Feels more like net-next.
psp_reply_set_decrypted() only sets the bit when the association has a
Tx key (which you are testing here).

cheers,
jamal

PS:- on your question regarding sashiko-nipa reviews: They show up on
the mailing list - but sometimes its unreliable so an alternative is
to visit the website: https://netdev-ai.bots.linux.dev/sashiko
> ---
>  net/sched/act_mirred.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/net/sched/act_mirred.c b/net/sched/act_mirred.c
> index 1c98e4d81ebe..52c3eeab381a 100644
> --- a/net/sched/act_mirred.c
> +++ b/net/sched/act_mirred.c
> @@ -285,6 +285,12 @@ static int tcf_mirred_to_dev(struct sk_buff *skb, st=
ruct tcf_mirred *m,
>                 goto err_cant_do;
>         }
>
> +       /* On transmit, decrypted asks the device to encrypt the packet. =
Sent
> +        * to ingress, the packet would read as decrypted by the device.
> +        */
> +       if (unlikely(want_ingress && !at_ingress && skb_is_decrypted(skb)=
))
> +               goto err_cant_do;
> +
>         /* we could easily avoid the clone only if called by ingress and =
clsact;
>          * since we can't easily detect the clsact caller, skip clone onl=
y for
>          * ingress - that covers the TC S/W datapath.
> --
> 2.53.1-Meta
>
