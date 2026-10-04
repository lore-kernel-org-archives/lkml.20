Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E186F3C5546
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 17:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791133644; cv=pass; b=MEdZw9+X/gzPJXJXI/cqOUvwPkcQzbZm4u7b8TCH2Ul5s++upEQ/Dk9PFSSkwhCyLHuO6Nx3nkecsOhf4pAIAE4INMu4u86THbI8CCtFWuWYxadzyiPUBEIJEVC56/SrZAV8Mg2dnHFgzM/6rZ8mZofz5SP/5Gx2PJXjFZvrmCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791133644; c=relaxed/simple;
	bh=HjGJP5tD91XNGYXee3E7zuvEtsEPqCl8cbOoLpn3IwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FVicMm5s9lIcLWjxEL2Vt8dmYnsNwr2uDheceVJ2IIMkIB1VgoBywRhDV3VI507dV9rsLHb1bpKLF9lYb/IZWXXp8FasdxBHoGL5eyK0z5zx9Hr9ubNwLnAkjkuR7CE6wj7hAIp8HW7lJx0HKFJGp/s8kzVK3OWjmR3MivA5j+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=Yrh4My5i; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="Yrh4My5i"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8ac9d666d4eso8382487b3.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 10:07:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791133642; cv=none;
        d=google.com; s=arc-20260327;
        b=kVQ88sioGnCdFM8nF/yP1S9A1wrvoc9W8mkLqUNP1+n9k98ygFtlrFUIYOcGvoy7Sk
         vOSAipxtnASeJyCa0R/jBFh7OJBEgXbK/X6V9IfQlfG+APijsqtW/2sJTEQnw4im/fiv
         p8xE8SWhvIXwId/u4C4/j7d6VtsQOy1jP0CNmzGsw6UY61riaA1MfGPZ29gx76aR3Flq
         DMo44DcKV9DD6QYk/7EnNhNmDXNgCQvZOUbpMGErQkjRzE8kBsYzk9OdyKAlwEAM6Muo
         sfhBKJX8+6WVCCgRW4eX9eGSz26fJFUFkQOU78paiGsSNIu5lNhCoFG+teiv8mnZYjHE
         blRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pLU+H3Rg/9OU3qmdYRdJ32ZsOLhx+ZoCaNo1XPLyUvY=;
        fh=ig3ZgUFmfh8eqaraq8QaX225Olb5BoTEoYNrB5wjjzU=;
        b=kcNiAWPSDzlan0aYByREN/aXJbM/fyLds+82u4X/C/0dDXZtg7GFcj0eN/VLM0teYM
         UZdxzNmwC8s7F0WDpi/ElsNodZa1K7cM8GJQbEncKG65+6Itf3+4kk8h4jWs+c8adfpL
         dh/JnnUAx7BOTDO5EBwr7tq8S1f5BLVUkLySBOf098hNZZG/gfwPsu2SLZlfHteVZjpu
         ocZkvRdiQpOhtrO8WD3VS2KLPcGFz+n8XVd0dw2YRJm75iI2182HLHDzLY+MDZFV72zw
         IT5KsH3lR/PjRn+iqkorZzJDeCpOQia2UjgNFwdah71PfuW2WPSHzGziy6cQcMBWZ/mr
         96dg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791133642; x=1791738442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pLU+H3Rg/9OU3qmdYRdJ32ZsOLhx+ZoCaNo1XPLyUvY=;
        b=Yrh4My5ifuOyepCADBL6Tv8hL6qDC7oYeN51sF3/05cEpv0FXSaCLNXKbpg3Bee7pJ
         U+0WeQhLIjgJzDC/E0nYHRdS0f8rcj1eFalbH0tnfnroxKi4pg+qKthRTSL+ah5Tn5y+
         3stIVfSe/9MB+ZZ2zDB0F+2+zCQzFDOaWTkWj7CoRkkCzMXUqebfRlgZqJ6AAKH3oRMx
         Ear9DE80BlKlO0wM431et1cWthkySN409VChlQfxBlD0ChEonkB2jJP9Hx585C8XnR1n
         eWCWSFaSvq5P6cYndHlR0L4aW13zd+dxMyGvXR09Vh+EygOCXYUol13ISEq4RaUdN55r
         +Crg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791133642; x=1791738442;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pLU+H3Rg/9OU3qmdYRdJ32ZsOLhx+ZoCaNo1XPLyUvY=;
        b=TvEvn55WLtatTdorq+OZ3i6UIjL5fo3HoZ+BFqsJDjkUGoJU9nhlgIWHY2RmLb4+vq
         pm8IeFr6EywslDd2sr4RGykthEQ2L882LjdaWMQWDJSVeu+Wvgcw2tU/xhMb8i4Q232q
         tgolvO9pFmsBsg++7DXAEBoccUT59DisGlKSmc3DVBn376eEnHLtu9tBw6xj2Ue7O68e
         R9IjmTk3ZYJCoZf8Uv4pqs4broGIXq0z5SjpiueZeqcJO+QFM/mYUSW3vFlQhrFScQhn
         wjm9vI9vafmbNTVRuzmmJ94rTnpSLkfCzXwpAP8Zsdu+eQsbP2zwR+/sV3dDSYIiPLoe
         UmTw==
X-Forwarded-Encrypted: i=1; AKwUvBw7r3VHwWOvOGrGzSulJYN+8U+1I0YwYwo0y3YSvD5rsQIJ7JCTj9qGOxKtSucwkitxTrwOur3pwZTsb6o=@vger.kernel.org
X-Gm-Message-State: AFq9FYIk2mbMW5yB51zCQNs328Uch/a0PP+seoy+xoVvRjHauvsWDqaU
	Dk5e2WqXYpemei4hEwAsmiBK7om66UWbaCfdzlzxFEongOcx49JcwfOD0G7G1PUAuNlaXt9mBA6
	T1hbBfuTOE6kmatVcGekQzS6qT24UXklkPWOs3SlO
X-Gm-Gg: AYBFou11brNPDtf7EyiCiNUK2lbuJF7FcGqFEapSM7A+WU8g27Ym1d9DkJ1RZqGDeIA
	KqJa/ziYYbL2Lyl9kBCxK90FwqekYKQGs+1YSaLPA0iP4qXbdniCPa23BMcqId1AlPuDopvuUWv
	9qcFyawom02FHpJaYSnVrjYJTGmdxl4whKl2cXTCjaE4ithVc8f+2qODpvNqDGCYVZD7duT21iQ
	ljYSo/ZGAN29fyGKB73KqByU8yiCNh80VeD3ZyWdeoJtTt+jBzN+njQXvCuHWYt2p1m/wNbjbAx
	nG8foHvL0/NUYGb5NdNb/3YfLPT7mmfsMUJ8Cxmz2XhwtzmhhmLMwkmJjLZlx/6BsdNrcoLSDfD
	Jij+uSEIKviAIfKBCNrNprMTPEjLldo7uwgKEbeYwaOC4s5XLmzwwwrF7S1yqe+BqhTsvYgfIHz
	OGFkxcob404tRjrtl2M2vCB+ICtmXRB0JhWdO1tj8PhXLYQrt2bP8psZUwWuOU+RAXBrNLsDqEf
	F7EpkiiAV2I+qNkYlFilfycAKvaQePR1z7FckfbhpxL+DOVFkfuN1eSrt2wE32ivCyNoS9fEO6m
	lkZInAaJyvgd248=
X-Received: by 2002:a05:690c:a786:b0:873:5bb2:6c37 with SMTP id
 00721157ae682-8ae94efdc33mr12232817b3.62.1791133641779; Sun, 04 Oct 2026
 10:07:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908135319.754140-1-julius@bairaktaris.de>
 <20260908135319.754140-8-julius@bairaktaris.de> <CABkEBKa0pEB9cL1+yoOF0OQSkYb7T1ji36oJ3sVYYV+Nc-_dcg@mail.gmail.com>
In-Reply-To: <CABkEBKa0pEB9cL1+yoOF0OQSkYb7T1ji36oJ3sVYYV+Nc-_dcg@mail.gmail.com>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Sun, 4 Oct 2026 17:06:46 +0000
X-Gm-Features: AclHuK-EedBupHUek5v73mxQfgY0Ojo9131n1X7zqgfDB2Zu8K3FpAglHH7v6fQ
Message-ID: <CAC1t37+c3WG8SDLkuK6qzYj1Af0TSGS=5eNwCnGhKPooAys1Zw@mail.gmail.com>
Subject: Re: [PATCH ath-next v4 7/9] wifi: ath11k: charge received airtime to
 the station deficit
To: Tamizh Raja <tamizh.raja@oss.qualcomm.com>
Cc: jjohnson@kernel.org, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org, toke@toke.dk, 
	sven@narfation.org, quic_vthiagar@quicinc.com, john@phrozen.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That's true, I will incorporate a fix in v5.
Thanks for looking into it!

Julius

Am Di., 29. Sept. 2026 um 16:11 Uhr schrieb Tamizh Raja
<tamizh.raja@oss.qualcomm.com>:
>
> On Tue, Sep 8, 2026 at 7:23=E2=80=AFPM Julius Bairaktaris <julius@bairakt=
aris.de> wrote:
> >
> > mac80211's airtime scheduler is configured to account both directions:
> > local->airtime_flags is AIRTIME_USE_TX | AIRTIME_USE_RX, and
> > ieee80211_sta_register_airtime() adds the received airtime to the same
> > deficit the transmit side subtracts from. ath11k passes zero for it, so
> > an access point serving a station that mostly uploads charges that
> > station nothing for the medium it occupies, and the deficit that decide=
s
> > whose queue is served next describes half the traffic.
> >
> > Register the duration the hardware reports for each received PPDU. It
> > arrives in the RXPCU PPDU end TLV on the monitor status ring, which is
> > subscribed for every radio, and ath11k already accumulates it as the
> > station's rx_duration. Charging it once per PPDU matches what the
> > transmit side registers, whereas an estimate rebuilt per MSDU counts th=
e
> > preamble and the interframe space once for every subframe of an
> > aggregate.
> >
> > The PPDU end user stats TLV that names the TID is not in the default
> > monitor status filter, so the airtime is charged to best effort, the
> > access category the deficit arbitrates the bulk of the traffic in. The
>
> This means the resulting fairness accounting is only an approximation
> and can leave VO/VI deficits
> uncharged while accumulating all received airtime against BE
>
> > call is made after ab->base_lock is dropped, under the rcu read lock th=
e
> > loop holds, as the tx completion path does; base_lock is contended by
> > every tx completion. A PPDU from a peer with no station entry is not
> > charged to anyone.
> >
> > Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
> >
> > Assisted-by: Claude:claude-opus-5
> > Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> > ---
> >  drivers/net/wireless/ath/ath11k/dp_rx.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wire=
less/ath/ath11k/dp_rx.c
> > index 68472e1e748a..a7b9bb295728 100644
> > --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
> > +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
> > @@ -5270,6 +5270,7 @@ int ath11k_dp_rx_process_mon_status(struct ath11k=
_base *ab, int mac_id,
> >         struct sk_buff_head skb_list;
> >         struct ath11k_peer *peer;
> >         struct ath11k_sta *arsta;
> > +       struct ieee80211_sta *sta;
> >         int num_buffs_reaped =3D 0;
> >         u32 rx_buf_sz;
> >         u16 log_type;
> > @@ -5324,6 +5325,7 @@ int ath11k_dp_rx_process_mon_status(struct ath11k=
_base *ab, int mac_id,
> >                         continue;
> >                 }
> >
> > +               sta =3D NULL;
> >                 rcu_read_lock();
> >                 spin_lock_bh(&ab->base_lock);
> >                 peer =3D ath11k_peer_find_by_id(ab, ppdu_info->peer_id)=
;
> > @@ -5337,12 +5339,25 @@ int ath11k_dp_rx_process_mon_status(struct ath1=
1k_base *ab, int mac_id,
> >
> >                 arsta =3D ath11k_sta_to_arsta(peer->sta);
> >                 ath11k_dp_rx_update_peer_stats(arsta, ppdu_info);
> > +               sta =3D peer->sta;
> >
> >                 if (ath11k_debugfs_is_pktlog_peer_valid(ar, peer->addr)=
)
> >                         trace_ath11k_htt_rxdesc(ar, skb->data, log_type=
, rx_buf_sz);
> >
> >  next_skb:
> >                 spin_unlock_bh(&ab->base_lock);
> > +
> > +               /* The airtime a station spends transmitting is taken f=
rom
> > +                * the others, so its deficit is charged for it too, wi=
th the
> > +                * duration the hardware measured for the whole PPDU, a=
s on
> > +                * the transmit side. The TLV that names the TID is not=
 in
> > +                * the default monitor status filter, so the charge goe=
s to
> > +                * BE. Outside base_lock, which tx completion contends =
for;
> > +                * sta is held by the rcu read lock.
> > +                */
> > +               if (sta && ppdu_info->rx_duration)
> > +                       ieee80211_sta_register_airtime(sta, 0, 0,
> > +                                                      ppdu_info->rx_du=
ration);
> >                 rcu_read_unlock();
> >
> >                 dev_kfree_skb_any(skb);
> > --
> > 2.53.0
> >
> >
>
>
> --
> - Tamizh.
