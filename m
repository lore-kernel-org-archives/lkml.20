Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793981705;
	b=zEPfVzD7hIwO2Rjn/hTP1zb5vr8j/bB2gc+X2t1sudhIdWpqACNPfV8JJ+HqsJEfUgCp
	 WtWoN/XC5pMbiYDTUx5kfYml0RMzGVqjJxUl0taX/d9DzOQSiK/CTu55YiD4kPuG+kEvm
	 WIGIztaentvbjACAnJiXAqkzgIlZAHy6FmCKm/l10VjOXnGkMkbtEoGRSea5CsFdg97FN
	 2bWryPBCVGYy5Hloh9GzKUCN+OLhktvXRfEr3v1JCGDvb/BIPbQeDLkphxGxGmccUWTS5
	 9X0Y6wf9ek5Mbcdi++vtlB/qGOqnhR88ppadOIxtdRlPg1RKCsz9bpV0H0zzekZ3spA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=92ncpz2zqTSssGvafEik4HYNh5tsdm8+gtf3XtknF9E=;
	b=oNOsr8+P7Ca03nbLqXbNThjBb/l80a2IEWzHZoGivu/MMEuDH6pH8PnW8u6dHC14d/06
	 RVY0IL9QWuCpiffPH0p3Ez4fH208/v0ffa4/cG/bCMDHdbouvVCcPZXDn0oXsyWyFD7gS
	 pupumjFycH1gv8XS2Tp3QlY6MUYNZkAoZYaIXAMdxwWiU1OqGU0/K1S9ozwHziEjtBOf+
	 NiKPRGrG1HwUSVhIxV517tHXBtRMQt9f3Xy0s9MTQfjzUsk5xWikOFeD7J/rxv3ed7VG4
	 XQiNn2AF2lZKvP4JET6+gxu+ALKURGetXO6nQSnvN22evjjd4TeyUm6WVV2WqzT7bXA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNuhYWUr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E29606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:15:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65E29606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNuhYWUr
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-491971ac844so727995f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:15:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793981704; cv=none;
        d=google.com; s=arc-20260327;
        b=TPqefQIySeyCPsSJZNMIoCl0O+KmR4P8rtiEEEyHH0GsCbax2AzR8IAmHDC8QtTkNn
         UaEe/kJu6+pbtZt4mTNAbWCWZckGaIKXl7eZBuEzd+23HGBR+BTtm3/QOAwJtABvU9l9
         GbyvIXGy9mZhfWR3m8WcsakG8lInSQvvGW77QGo1pN7APOgLM81atPHrcuZggxBcDrpi
         GOf1zNNvWQHEwRIQclqrvSVz+irObq2lRc/iTBuwOtf9TzMFOb/0sVqYhnTDAaYRqgb+
         EsOqRrKwYNDHqxtIZFGAOPeB095lVlFsAFbygVCfUSM/AR1GRGZprBzX/IALczUDCxvo
         2WSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=92ncpz2zqTSssGvafEik4HYNh5tsdm8+gtf3XtknF9E=;
        fh=XwghpUxWPbDQ/zSR0RNUQIJOT4Bc2K7ZOtsQStDM8Zo=;
        b=fi4dSyBFbVR4idTkCpApgwMUKcTe5EisSZiGgneZe+zaLD/OcfBepa3XZYJjQ7Em7/
         EZl+neYtcjwzl9YsLZLRIVf5pV1eW0eraFQ/6xNZDBKlQlYLRnLaFVuPeiBBI3rojoGr
         D6t5/awlWYkxgTsd6Rcrk9mrxPUZu7qPUs7vyuUXX9onPj1tebUT7tAGGh6lFmXUZp4J
         UMDWPBf1v2tVbURUOBFnvbdMrsnOBPYsbGOME8Z8iD1/1AoFEv4BHZWZQsPXRJfv4In8
         wDV3rfRLpzVjCxAejfAVc9fwX/890OD8c+7rodgIjrE6fdCH+Mf6Q7NZ9rUNjz7lgR+e
         zIYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793981704; x=1794586504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=92ncpz2zqTSssGvafEik4HYNh5tsdm8+gtf3XtknF9E=;
        b=nNuhYWUrJNcLx7NnnyArrLMisRCNWdf5YbjqLKRYoocrt/0AEty46ozh55OS+wNexn
         g4LZDPh95y6Bl0Xfo3f5C6iNC2X2sJE291Igat6mgCobnMqct2um71l7F4Dh86TgPYDk
         k6sfJ1v5XRZ1j5D57ZYfVwGLpTZ5a9q6+cGWL50Sk6rxJHJjDaKksZ/yqzRUKdz5jppl
         4Vqfd7KJ5Rs8xAVdOIeemw9h1BM/FM/TT88X2IxYJ2SlyY69onX/zhAbOgWuO/zOBtIj
         5ICJZ7Aj4fX9x+WSKMBtObQ4v4d9QsbXN8+DJLJrp1EA3qUQ2Kkeh/B02C+VTntSOGvC
         osXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793981704; x=1794586504;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=92ncpz2zqTSssGvafEik4HYNh5tsdm8+gtf3XtknF9E=;
        b=nfyi2hvz/onxM0quuUxw9E0Ov5oEfPYJozjsbLBztxj48tZOj0IwKBddVqgOboBjIn
         M73jAMBeyQpOeIYDIhx8Q9lyD0/Sj6l5q3wSUzNpdgvMiTFeU7MP6xBeVqOlK6vVd3V1
         o3TSgHkG0kTvM52ViB2hv9AuNQaUYzQ2/buFUksoz0sHMUcAmH7cWj727InF4tYhUS+p
         bqxzBLlegx3UPqd/IdozXYQA3S+OtBneLs63KtkSVfCfFHXzV7JL6ZXYsc4xWy4cGVD4
         CVypplU+OhP+F9ysk2+7bLDSx4ZW68V0B0q5itUqrHV7DDZDEyu2MmPQ7hXWZM82nx0y
         XKyA==
X-Forwarded-Encrypted: i=1; AL+hErFyxoYz5RmqbEeIWAsFOIkL6yGdM4nUq3pqxM6sCtw1LO/TyICPV7QqaM4PR8j9mYpayQ/KDXmfySH6vNM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+J5coklv9UjuWzFfD8zZsmG5wT/UgRIrB39KDdIzcuPuAJB3d6
	DjWwr9rYaVFFxOkIu4UuNSb2wB6fp8V7C8dtAjGviTq+irnOg9ssY0TJLKiXNYcJIs8AMS4Uk4t
	QUVO8oZytF16xnc+qJIlKAecNHdXGVAM=
X-Gm-Gg: AYBFou00n9U8T3cd883H3/FCUDLMhLbDyoi5KVq8znZrJcGorUa+l56Ja0QT35F8Sfl
	B/5yHgFrno/4jhQQqdM9JFLLnlY11+MHhzsy/YQI6WPgU7s3Yp5vgJUqhTcQLij+LoR83BKwpSx
	cdQ508gHa1dg5jwxQLRJfnfXFa1dlat08DvobCGePkxlj2AKNmq2btBz5TZduuHC61sfBd50MY8
	B9TQIMfwJrjXUh+W1u3XKF05SqWQkK44mm97HeW944sUYNz2C/PiTIwgboSO1LE75VBYkAec3yh
	t5/52/e6LsGNGcnQZOo9AyFx4ZVy9ZNyjKvbwmqZKA5VWBIvJKM3yRjfZSQXnFTkpKMGcNHFVnX
	KjkE8EIpIkx/5lEFDbMs/sODfpdJfiBjWpMJ2DmDLHn9c4ASPFaivWN3fzUPwts3HNT1AvQ0p6/
	eq/SBqpbl3N92oiTOat5e+r0CuLFTBIdaORlecXN70R1RarINhU4+DD+A=
X-Received: by 2002:a5d:64c6:0:b0:48e:4e00:b737 with SMTP id
 ffacd0b85a97d-492775f151amr6727659f8f.54.1793981703348; Fri, 06 Nov 2026
 08:15:03 -0800 (PST)
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
 <CAL4Wiiptz1zyxRDKrCrnK2Q-qn0_1d1aSxuUPkJKWnODpjMp1g@mail.gmail.com>
 <c8be6713-2378-4dc5-9959-fc7eddd800e1@linux.dev> <CAKgT0Uf_yYxp+tUJt4xYAnwqtK6LZY0KQYt0h4kt78=oQZxd3g@mail.gmail.com>
 <f15c49f5-724f-4101-806d-24303c5408a4@linux.dev>
In-Reply-To: <f15c49f5-724f-4101-806d-24303c5408a4@linux.dev>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Fri, 6 Nov 2026 08:14:26 -0800
X-Gm-Features: AclHuK_90837NB1huADdRT5_NjnCjWpqOnKsGALBKgpKP0fDla8aUVrEXAgzWHs
Message-ID: <CAKgT0Ucx2USkWr2eVu0ASybWkpj2CtBrb1N5Vm3qdJQmCxnKJA@mail.gmail.com>
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

On Thu, Nov 5, 2026 at 6:08=E2=80=AFPM Qingfang Deng <qingfang.deng@linux.d=
ev> wrote:
>
> On 2026/11/6 2:53, Alexander Duyck wrote:
> > On Thu, Nov 5, 2026 at 5:33=E2=80=AFAM Qingfang Deng <qingfang.deng@lin=
ux.dev> wrote:
> >> Hi,
> >>
> >> On 10/20/2026 11:08 PM, Eric Dumazet wrote:
> >>> Le mar. 20 oct. 2026 =C3=A0 16:30, Qingfang Deng <qingfang.deng@linux=
.dev> a =C3=A9crit :
> >>>> Ordinary TSO does not update the PPPoE payload length. A PPPoE GRO p=
acket
> >>>> forwarded by a bridge can retain hardware GSO features and reach the
> >>>> driver without software segmentation, if the egress Ethernet interfa=
ce
> >>>> advertises TSO.
> >>>>
> >>>> To force software segmentation, clear the GSO feature mask for
> >>>> ETH_P_PPP_SES in harmonize_features().
> >>>>
> >>>> Fixes: 55a5d8fca836 ("net: pppoe: implement GRO/GSO support")
> >>>> Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
> >>>> ---
> >>>>    net/core/dev.c | 4 ++++
> >>>>    1 file changed, 4 insertions(+)
> >>>>
> >>>> diff --git a/net/core/dev.c b/net/core/dev.c
> >>>> index a6951ea08961..27483a2ad747 100644
> >>>> --- a/net/core/dev.c
> >>>> +++ b/net/core/dev.c
> >>>> @@ -3831,6 +3831,10 @@ static netdev_features_t harmonize_features(s=
truct sk_buff *skb,
> >>>>           type =3D skb_network_protocol(skb, NULL);
> >>>>           features =3D net_mpls_features(skb, features, type);
> >>>>
> >>>> +       /* Ordinary TSO does not update the PPPoE payload length. */
> >>>> +       if (IS_ENABLED(CONFIG_PPPOE) && type =3D=3D htons(ETH_P_PPP_=
SES))
> >>>> +               features &=3D ~NETIF_F_GSO_MASK;
> >>>> +
> >>>>           if (skb->ip_summed !=3D CHECKSUM_NONE &&
> >>>>               !can_checksum_protocol(features, type)) {
> >>>>                   features &=3D ~(NETIF_F_CSUM_MASK | NETIF_F_GSO_MA=
SK);
> >>>> --
> >>>> 2.34.1
> >>>>
> >>> Ouch.
> >>>
> >>> harmonize_features() is called for every packet, GSO or not.
> >>>
> >>> This is a GSO-only problem, please do not add more protocol-specific
> >>> tests in this path. gso_features_check() is only called for GSO
> >>> packets, and the cost there is amortized over all segments.
> >>>
> >>> Devices without NETIF_F_HW_CSUM already lose GSO for ETH_P_PPP_SES
> >>> because of the can_checksum_protocol() check in harmonize_features(),
> >>> and fraglist GRO packets (the main use case for PPPoE GRO) are
> >>> segmented in software anyway.
> >>>
> >>> This leaves bridged, non fraglist GRO PPPoE packets sent to a
> >>> NETIF_F_HW_CSUM + TSO device. Have you hit this on real hardware?
> >> +Cc: Alexander Duyck
> >>
> >> I ran the real hardware test on Intel igc.
> >>
> >> igc_tso() requires skb_network_header() to point to the IP header, whi=
ch
> >> is not the case for PPPoE packets, so it won't work on an unmodified
> >> driver. I therefore used a kernel module to inject PPPoE GSO skbs
> >> directly to the driver's TX path, deliberately pointing
> >> skb_network_header() to IP.
> >>
> >> Test results show that the hardware can still perform TCP segmentation=
,
> >> but it cannot update the length field in the PPPoE header. So
> >> theoretically, we might be able to make GSO_PARTIAL work in PPPoE.
> >>
> >> Kind regards,
> >> Qingfang
> > Is PPPoE being stacked similar to a VLAN or being ran as an L3? To be
> > able to make it work for the GSO_PARTIAL on most these parts it would
> > need to be inserted as part of the MAC/VLAN headers instead of as an
> > L3/network header. The main problem is that the drivers normally need
> > access to the L3 header in order to set the payload length and things
> > like the IPv4 ID field.
>
> Currently, PPPoE occupies the skb's network-header (L3) position.
> pppoe_xmit() points skb->network_header at the PPPoE header and sets
> skb->protocol to ETH_P_PPP_SES. pppoe_gso_segment() temporarily pulls
> the 8 bytes of PPPoE/PPP headers before calling the upper layer handler,
> then restores network_header to PPPoE on the returned segments. For an
> untagged frame, network_header therefore points at offset 14, while the
> actual IP header starts at offset 22.
>
> > Really if you are going to support doing GSO with a PPPoE protocol in
> > there you probably need to look at adding a new gso feature flag bit
> > as any driver that will support it will need to know how to move the
> > header out of the way.
>
> LLM suggested the same and wrote the code, which I have not tested. It
> could make both hardware segmentation and software fallback work.

Yeah, it makes the most sense. Basically it will then treat the same
way we handle vXvX tunnels since you are essentially doubling up the
outer L3 headers on the interface.

Basically just means you have to add it to the gso_type on the GRO
side, and add logic to process it in the GSO side. The GSO_PARTIAL
setups gets a bit more complicated as you will have to add logic to
pop the header out of the way before your process the IPv4/6 header on
the inside.
