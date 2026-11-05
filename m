Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793904828;
	b=H95jDqfNHzTaiZuedKuAlTCgmSzHYPIR2zIyNHvGhkQDWDgPVWsnwZzVKYENS1a0Hip1
	 XW41kqmoZDEUytrhrk/k/22PrWD68kCq6Rko62w84+FBo0Zpwh2APbP3K2/AUNgFgBxat
	 66/KtkmKe6mRD6emfcqWSplEgsSAOtkEGzgrmquGHe6DL3CPD/IwStBEWCuVVmkqUS24h
	 QPqv8DStzXhKmOvWKOsPSVLqM79uZQ5Z5oS+S3y3INBIIDYN3KB7lbA3QvGUOGL2JaTW9
	 Vbqbwo/9EMZalvCIgQwAJxPLCRNqbGLU955Pt1EEdT14AundfHKPhPk5QuwQGrnQlJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904828;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zr+jPL093kMtPtVWReLyfcIydpRhCbpXeanMC9JcuXs=;
	b=1CfU5f1fFd8pv+3dgXOxsXZ0nV99KKpR/MNxxWqlBsnapv5yC3tgy8ooyeAoaflgg41I
	 PLj4cKfwI9lHWW0hXsdA9qSzB+mLe6UT6iEkssWg5PJndLP8HgV0xm+YmxNl2ApLYhQcY
	 6fGlKZ0FSe0oLdvWDPY8jvtsK78L2/f2CHhadNNjwXcdUApFdQ/YfRzqEtr3YfWXwSOzT
	 HKC/fMKgQxeO1rfWdpf0a0ObMpmLE2TVFGggTTlg/oAf/JYIoPB5Vh7d/0hgp8gI7Sfgw
	 9jUfG58ikeDwv2Xzavt+Ik6R/aot7j4pS7KaAg+93h6wlkB+3oPziJZIf7iJD8v0M9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=brMsclxQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB87606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CB87606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=brMsclxQ
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so17343855e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:53:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793904825; cv=none;
        d=google.com; s=arc-20260327;
        b=nquAp+a8FvlG9vFVOJsA01i9h9ebbPe90Z3EfKsL38ZX/xXf+6q4+Kqf4GMGb0vCMh
         x8eHP7qcbi3XqcgugmfIUCI3IWeHBJ35zziUn2uSV6aagPmMHtNwRfKB4Bv1xVIegic7
         ojNpYq/HsfIgS39rUFemr7NrtVzGg7ChVUVYIbKbcDFVXQGCqNg6WxCt29JvAB6VhvJ+
         AtPSlaLyRCFEXDIHmmmJwm++oISn06YcmDX2U6ukfm+42w81MCqFUZfSo/i8RcDpvqOM
         kOIX2HFwc3GS5+rK7qldLPkQEZ5wYKz2fsJwwS/v5Z0JUeLl03hvCwogsvgvIYq9udhb
         P+rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zr+jPL093kMtPtVWReLyfcIydpRhCbpXeanMC9JcuXs=;
        fh=ywHq6vbHxcscisP/ZwNlomtomkYdNteXWsgEx1KqEIA=;
        b=r2Uf9s4Yhyw2zmMbDP1yW+pftUFWeorfncJe68ac4em6HrPSzCTorUVN2Ihxxp3LP4
         6N4nBwiuN92cdIohP8i59mgqbr50esaPMhcuQzWQQyWaEwN/jneX0uOg0+KtKxwVTYyQ
         Md7aOXr4ADvGNu59gFSBuhC6qpaTZ1S5OpcuopQksCkWlhBER8ryFfUNt/qsybCufNsj
         fmOZ3SmYvblENeLKSA4rsUG05J+oDMXw0PAIboS74sgQu2pVCYnpbiWIMfic/dFYLqTK
         K4hk1Qi9aWIdD6sXT4lP3GI0aDxgDeSIOBdZePyXT2JKGpmnbhP+q/m2P9gr+d3psehL
         y7Nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904825; x=1794509625; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zr+jPL093kMtPtVWReLyfcIydpRhCbpXeanMC9JcuXs=;
        b=brMsclxQlXABke9NWXnW7MfsiXT7zjc/bspNwv034x5SzL7P+VG8Sp/AT9UL+gokTQ
         OzHCFKUbP6b7aIpJegYOoOr3lBuLygK2xD10wNuA2fOwOcgcxmJRSzd6eYWhDUgMh2nQ
         BTaUtaqAVkzNKs2wWUNB2nwA6dfV5mpP91hzWxhVJOmdsDR6xRN1fIoB3XxDUgKMez0b
         WA1vm/q+5PncLtLVKPR70SaI1df55rBTEGjbe1xw6C3WYhagbKhr1SnbiVkBGbqHL0bL
         KtPSvgp7+h2xMd4uG+vDCDbHWOTP/hkNZessrSw4j/fyy3XVM800d/Afnb5RPKteWGSz
         uEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904825; x=1794509625;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zr+jPL093kMtPtVWReLyfcIydpRhCbpXeanMC9JcuXs=;
        b=JB/RAY5zc2EfsauBy3IaZ75jHl6bOPWlDeOBm3UJhcxkmJVn48hBl9tgF/Iw71JYj8
         vxxyAAzRvRAW9X0ngvLcvMheWXXMHE7nClzBh0Z6g70GgTTIhSBTrmF4TUR7wUE+t+rz
         Osppmc0Gc80FwgEQ53BqkcJhl2edu+jUeJ4oHj7a91aZ8JTv9EgUg3W+j5eZBXTf2bGP
         ebMRQvZL+I9XaDc/5BPw+ONtwI95g3QxKLRcQax6WB9Z+OaRSxiANjcEFgxYQTfhY8Cd
         qu8xawBO5BvL16oz7FEs5eKnDG8LoPL1ebr0kFnFIdBOruJJm3rHEH1tns7luQoXsF5T
         Ikmg==
X-Forwarded-Encrypted: i=1; AKwUvBzdaHEwyfk0N5HA+feukIal9XyehKb81QBtEOIgbLJCOx45KyCwieaRpyl4j2rh2jcB1oJsbNEjXWJhFPA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Vpz4KjNquqn2MR+PBxrbIlwiXBsQ7w6TihtKqwuxvPcAo3D2F
	+ll0QmHKy2CXT8HNY6qX6TQoGES5J2m2Q/n5VeSXHdtO18N/SlAu9ujbEY3eUSOlnSOjkms/09n
	0/S//ewWo348CqIT/C6PF2UQ1S43798Q=
X-Gm-Gg: AYBFou3250EOkNq/LTunXdEf5fvwBq6Pf8xuLvn+3OVYu+pkjNojjGxrzVdI940ukBv
	a1ftpSGwZ2U673gvqejFtX8nk0fIKUypn6wrRbis9dvOQYVKPgLD6PgQkyOr2Pnl358Jdp0tmqj
	aYsywOXiqJxJDUJ1Rc9rq3rA1sMuNPIJfs6kuAdHGNU7v4taTmClpOPY/f94zk0Hwk8euWDD/A4
	xWdj53T+598r/cyDHG2BOx3ky5c/AI6IjxThxKMVBwJ7fV92ebbqhONlZKn+2MKmSxgoh+tmFtv
	WwMczqnlDH27Xr85zYk08yB5T96YqlQeuoZFSc+G6ZImHkEub2N1VoPWU1Ko3XpY11R/oD0+/z4
	CHgX9ZRDzNak5EBv8ch2Gv7etkwPdo87rh+R/coNEsTl/9nbHbbAph8zoACw+1m7320qYDG9k0P
	u3vqqavFr6MW6EXeWItZPpnsBVHYx5RkHgCkLgXM9F9TCRbqiopr62vA==
X-Received: by 2002:a05:600c:4fc9:b0:4a1:fcfa:2a07 with SMTP id
 5b1f17b1804b1-4b6e007beefmr79625e9.30.1793904825112; Thu, 05 Nov 2026
 10:53:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020143031.1829-1-qingfang.deng@linux.dev>
 <CAL4Wiiptz1zyxRDKrCrnK2Q-qn0_1d1aSxuUPkJKWnODpjMp1g@mail.gmail.com> <c8be6713-2378-4dc5-9959-fc7eddd800e1@linux.dev>
In-Reply-To: <c8be6713-2378-4dc5-9959-fc7eddd800e1@linux.dev>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Thu, 5 Nov 2026 10:53:08 -0800
X-Gm-Features: AclHuK9CGtHlpEzyvf56PaHvDk9YYrC0X1uB83qunWer31KQBoOIypGlR3DOD_c
Message-ID: <CAKgT0Uf_yYxp+tUJt4xYAnwqtK6LZY0KQYt0h4kt78=oQZxd3g@mail.gmail.com>
Subject: Re: [RFC net] net: force software segmentation of PPPoE packets
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: Eric Dumazet <edumazet@kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Hangbin Liu <liuhangbin@gmail.com>, 
	Martin Karsten <mkarsten@uwaterloo.ca>, Felix Fietkau <nbd@nbd.name>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 5:33=E2=80=AFAM Qingfang Deng <qingfang.deng@linux.d=
ev> wrote:
>
> Hi,
>
> On 10/20/2026 11:08 PM, Eric Dumazet wrote:
> > Le mar. 20 oct. 2026 =C3=A0 16:30, Qingfang Deng <qingfang.deng@linux.d=
ev> a =C3=A9crit :
> >>
> >> Ordinary TSO does not update the PPPoE payload length. A PPPoE GRO pac=
ket
> >> forwarded by a bridge can retain hardware GSO features and reach the
> >> driver without software segmentation, if the egress Ethernet interface
> >> advertises TSO.
> >>
> >> To force software segmentation, clear the GSO feature mask for
> >> ETH_P_PPP_SES in harmonize_features().
> >>
> >> Fixes: 55a5d8fca836 ("net: pppoe: implement GRO/GSO support")
> >> Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
> >> ---
> >>   net/core/dev.c | 4 ++++
> >>   1 file changed, 4 insertions(+)
> >>
> >> diff --git a/net/core/dev.c b/net/core/dev.c
> >> index a6951ea08961..27483a2ad747 100644
> >> --- a/net/core/dev.c
> >> +++ b/net/core/dev.c
> >> @@ -3831,6 +3831,10 @@ static netdev_features_t harmonize_features(str=
uct sk_buff *skb,
> >>          type =3D skb_network_protocol(skb, NULL);
> >>          features =3D net_mpls_features(skb, features, type);
> >>
> >> +       /* Ordinary TSO does not update the PPPoE payload length. */
> >> +       if (IS_ENABLED(CONFIG_PPPOE) && type =3D=3D htons(ETH_P_PPP_SE=
S))
> >> +               features &=3D ~NETIF_F_GSO_MASK;
> >> +
> >>          if (skb->ip_summed !=3D CHECKSUM_NONE &&
> >>              !can_checksum_protocol(features, type)) {
> >>                  features &=3D ~(NETIF_F_CSUM_MASK | NETIF_F_GSO_MASK)=
;
> >> --
> >> 2.34.1
> >>
> >
> > Ouch.
> >
> > harmonize_features() is called for every packet, GSO or not.
> >
> > This is a GSO-only problem, please do not add more protocol-specific
> > tests in this path. gso_features_check() is only called for GSO
> > packets, and the cost there is amortized over all segments.
> >
> > Devices without NETIF_F_HW_CSUM already lose GSO for ETH_P_PPP_SES
> > because of the can_checksum_protocol() check in harmonize_features(),
> > and fraglist GRO packets (the main use case for PPPoE GRO) are
> > segmented in software anyway.
> >
> > This leaves bridged, non fraglist GRO PPPoE packets sent to a
> > NETIF_F_HW_CSUM + TSO device. Have you hit this on real hardware?
>
> +Cc: Alexander Duyck
>
> I ran the real hardware test on Intel igc.
>
> igc_tso() requires skb_network_header() to point to the IP header, which
> is not the case for PPPoE packets, so it won't work on an unmodified
> driver. I therefore used a kernel module to inject PPPoE GSO skbs
> directly to the driver's TX path, deliberately pointing
> skb_network_header() to IP.
>
> Test results show that the hardware can still perform TCP segmentation,
> but it cannot update the length field in the PPPoE header. So
> theoretically, we might be able to make GSO_PARTIAL work in PPPoE.
>
> Kind regards,
> Qingfang

Is PPPoE being stacked similar to a VLAN or being ran as an L3? To be
able to make it work for the GSO_PARTIAL on most these parts it would
need to be inserted as part of the MAC/VLAN headers instead of as an
L3/network header. The main problem is that the drivers normally need
access to the L3 header in order to set the payload length and things
like the IPv4 ID field.

Really if you are going to support doing GSO with a PPPoE protocol in
there you probably need to look at adding a new gso feature flag bit
as any driver that will support it will need to know how to move the
header out of the way.
