Received: from mail-pz2-f36.google.com (mail-pz2-f36.google.com [74.125.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E4B3D6477
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871120; cv=pass; b=gF/A2Kj10MYsmzFqsIId4742Z5IKzM4C3E0swSMuz8CVEUzbnZ1BHj37GiNIgQ5c21D7ys7QPSZeZQXwG2b6t7IJ0gCXmrlllmEAkMoH4ZFAnIOfcz2AvEeqlAaT2OZaaUVYjVljEdFMobyrQnfMvuLO2inEIFD1gFFgzPNJ6AQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871120; c=relaxed/simple;
	bh=S0r0cGZ7NaesTXmp6HeI9s5W1vfRGs1p6GRplXqhx5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZEw/QNZIGMlDg2odJ4xeG7Ovz9+7kOEVAg4Tt6HY8G8zBfl46qtRHiP6do/GLFmUEMqP0NyP//Kf/g0niBmmQN72ZiErjr53Fa4s91nvHkoK2s2sOSPBTzpm7mcYJmtEpXJ797qwlRDdgTKVN/Wrx0cF1Erml38jtNTPIjYRTM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7ehH5yj; arc=pass smtp.client-ip=74.125.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7ehH5yj"
Received: by mail-pz2-f36.google.com with SMTP id d2e1a72fcca58-88a9f57bd42so232420b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:11:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790871118; cv=none;
        d=google.com; s=arc-20260327;
        b=Zh3Ihyk/bfrxgZJeuPAAzN5k087kJSDyqhHE8ss86HqkW70bolBT5GatVKHIxGRcaj
         f7fErirCJ4dVI7VxcOM4fAGCAMSfMMON8Iyj98GENoTYgh2T2saJRNHGZnInZkjtF3RQ
         6/pT2X2okOfs2mEK8r2g6hvRWp99xeX1P3SAeaob7WsYzXGI1UO1NRF4Zc47uZCLIrra
         xnLg7mdSUP0UKRaXeIgGBL8X0+j7hTgf4PeV+iyxh+1UpbiVRYjq+FqqswbZoHlP5v8A
         FkuMcXHyR9hsCEhb43/CMgpCthEM8YCwnS6+6aBeoeXo2ITWuOfNSFXknkbs8QCourVd
         FpxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5hKfE8YeFUB2v4D0quTu6qsZ47v3trhdTivuK/VDgPs=;
        fh=Tm31kqa43T6NYWPugmll5zEvbsbodp7YTcWUu/9gzLo=;
        b=fzdrFwja9stsCdXvd/telP1p1WV/r3km1m/essJCFa1j/SLQ3Opbma3MyjGHoHthd5
         i7XGBTaBl+NJW1uTYrc43VReB9wlnZSAIkN2FGMu8zmS+++ACTKGCTeVXtUm1Z4khQqP
         gkX4kEE0Ur7wNJVvhSqTocXr7Upo5MRx3eZI1GccdYQJTXTVNjmTHEKLsGBAp0slx7Bw
         lXb98ftICB0IFqlOofyQZf+BJStCZFDzKJrpf2qdMwgXGKuznrVNbjMjnpk/Orb9Xpmw
         0F+p+OisxKLLu9Jq3Bdu6XmRwWrV3k+b/g4jS1hPeSaFzbdAUMTIvD0k9BGLJ2JebEbe
         ebGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790871118; x=1791475918; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5hKfE8YeFUB2v4D0quTu6qsZ47v3trhdTivuK/VDgPs=;
        b=D7ehH5yjaPP3+GLQjDa8spEsW8WBXQIs3PK2wUXyhskiEZH9pmBCXR1ayOe+J8lyrw
         dVyfUCygNN26Bs/BS1USW1LbVAKA60KCGrc+25C2ykiiePW7I79PDUlsdT6xT/ZuI7rA
         JpZfPthI+A0RVFK5xjAnZG252fbVh33DUeIH6y9096aZ9YNsxQXDrpAS5VW8k1BU08KW
         9aGdhwTBk/bZ4zgiO4F4DB3YcunNmHrsVYqfD4diK7TWxX/3JuorZfPmY3xoSFGy+zKJ
         XS1oi0peDkE9lfGAd8jK3sjdydikU06p4+iU00aAqSJOSbDiQ4UMjy6uet2tAZsrjMtT
         liDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790871118; x=1791475918;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5hKfE8YeFUB2v4D0quTu6qsZ47v3trhdTivuK/VDgPs=;
        b=k/2ejFuDr112/GwVKJDpB6yUCTqhOcfAnlRU+DtlFLzaw+94lut4e4xKikEGt56lvM
         5/MrN0Y+Q8wzWYo1m2AEuk+Irf93mfs28SDZMNiS1N+pIIv1H8uwQcPCpeGN1FvZOO5X
         QDeAQwtS4P7npH8OWVZLDwqWb6jq/obdV7CPOJ/GfcXKXbVxLOzRbd88bgZcV2a6aR5i
         kNUFsGE2RcSaHYxutGff7GHK4rOLUXH++dbegCVbSLiNmqmWBkSgdP14wkGwyZQehfo3
         Hzb401BvnPtxy0ptzglg/OmxX2NTGI+5dYnd9yGXy3Y88d1s8ZdB+slCUG/ai5w2UeN7
         Ah1w==
X-Forwarded-Encrypted: i=1; AKwUvBzs8ucGE528gD/SSdi+N9r+ecd42JwXkLBE7GjDx8y5+ipX+b0kJjqM2XOWZ5ufb7XgYIEh9R5ZlmgU3ac=@vger.kernel.org
X-Gm-Message-State: AFuF++nHUUKcel2fJSQYUJzNVJf7OqWmk17KjM3eXp0LOgsXTRaRVjr3
	zCZJvrVTyjIKT3kYriSOB5BI32/ui5zDgVNZKAKKHWHzkhkgLgMYtmPKeXMc3r/Vvdy35zwx7yz
	yqZmstfq6xtEaLSPnOir/xI6ISvwygSY=
X-Gm-Gg: AYBFou2PLvLXYILgobcWgFtcUoBK0af/MhwWo+t/PFYh7Tu7flWys42z4uUfAENEqLY
	ggB1knduBTeNcnHhMlowhwBCGbqGxM2uiEK223lgxttIv+suRK+qfAQbDaUZ7+qDjbogFxhuY8k
	Yc938kT0TZv0b7dKql9uGUEYhyfhXhBuZmfLuPigmO/O+ZA7TvLshz8u4wSpnA3rOiO+++ZEBvr
	ajJvs/lixwMwisKeC2z4po4dHm+ZZZFmzwENa3Futi+ADwRokaO1s5EdNIK2vcDM5KZE+nDZ5kr
	Rh1/Xzc4/BqJiOBo0WriIVjdChvAV3GUiugoY3b9WQHcexMXWcveN/6bcZ3/Bv1kCoaNNkwrLHz
	CcEm8ViZTjKVxvf1OOoNMhuLlnZbZQrKlGBryCdbg4AELcvnke3levA==
X-Received: by 2002:a05:6a00:2451:b0:878:1aee:fa43 with SMTP id
 d2e1a72fcca58-88af5e9e0b8mr66237b3a.33.1790871117648; Thu, 01 Oct 2026
 09:11:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928190401.1641260-1-wbriggs@cellusys.com> <179083835206.434549.7959555054670908229@kernel.org>
In-Reply-To: <179083835206.434549.7959555054670908229@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 1 Oct 2026 12:11:46 -0400
X-Gm-Features: AclHuK-SE6KAyYVWH0zHyC1WoWJwVISfzWpNwt0v8Yvh6tmXfkow1wJu9vjLJXM
Message-ID: <CADvbK_fps4LrNX36j-MBpFmc-S5bQXhqkBgz+HC2RRuCvhdBXg@mail.gmail.com>
Subject: Re: [PATCH net v4] sctp: carry peer capabilities across an INIT collision
To: netdev-bot+sashiko@kernel.org
Cc: wbriggs@cellusys.com, marcelo.leitner@gmail.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 3:05=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wrot=
e:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] On a peer restart (sctp_sf_do_dupcook_a -> sctp_assoc_update,
>   ESTABLISHED branch), the patch re-derives only the inbound counters=E2=
=80=A6
> - [Low] The commit message says the change only affects INIT collisions
>   (Table 2 action B), but it also changes behaviour when the peer=E2=80=
=A6
>
> --
>
> sctp: carry peer capabilities across an INIT collision
>
> When an INIT collision is resolved, this patch makes sctp_assoc_update()
> also copy the peer's prsctp, ecn, asconf and reconf capability bits, the
> ipv4/ipv6 address flags and adaptation_ind from the temporary
> association. It also re-derives the inbound ASCONF and RE-CONFIG sequence
> counters (peer.addip_serial and strreset_inseq) from the copied
> peer.i.initial_tsn.
>
> > diff --git a/net/sctp/associola.c b/net/sctp/associola.c
> > index 4521be3bd85a..77ac155fdb70 100644
> > --- a/net/sctp/associola.c
> > +++ b/net/sctp/associola.c
> > @@ -1107,8 +1107,19 @@ int sctp_assoc_update(struct sctp_association *a=
soc,
> >       asoc->peer.rwnd =3D new->peer.rwnd;
> >       asoc->peer.sack_needed =3D new->peer.sack_needed;
> >       asoc->peer.auth_capable =3D new->peer.auth_capable;
> > +     asoc->peer.prsctp_capable =3D new->peer.prsctp_capable;
> > +     asoc->peer.ecn_capable =3D new->peer.ecn_capable;
> > +     asoc->peer.asconf_capable =3D new->peer.asconf_capable;
> > +     asoc->peer.reconf_capable =3D new->peer.reconf_capable;
> > +     asoc->peer.ipv4_address =3D new->peer.ipv4_address;
> > +     asoc->peer.ipv6_address =3D new->peer.ipv6_address;
> > +     asoc->peer.adaptation_ind =3D new->peer.adaptation_ind;
> >       asoc->peer.i =3D new->peer.i;
>
> [Severity: Low]
> The commit message describes this as an INIT collision fix, but doesn't
> the same code also run on a peer restart?
>
> sctp_assoc_update() has one caller, sctp_sf_do_assoc_update(). That is
> called from sctp_sf_do_dupcook_b() for the collision case, and also from
> sctp_sf_do_dupcook_a() for the peer restart case:
>
> net/sctp/sm_statefuns.c:sctp_sf_do_dupcook_a() {
>     ...
>         /* Update the content of current association. */
>         if (sctp_sf_do_assoc_update((struct sctp_association *)asoc, new_=
asoc, commands))
>                 goto nomem;
>     ...
> }
>
> These new assignments, and the counter resets below, have no state
> check. On every peer restart, a live association in ESTABLISHED,
> SHUTDOWN_PENDING or a similar state will now:
>
>   - replace its prsctp, ecn, asconf and reconf capabilities
>   - replace its ipv4_address and ipv6_address flags
>   - replace peer.adaptation_ind
>   - reset peer.addip_serial and strreset_inseq
>
> The restart behaviour may well be correct, but the commit message doesn't
> mention it, and the testing only covers a COOKIE_WAIT collision. With
> Fixes: 1da177e4c3f4, this goes to all stable trees.
>
> Could the commit message describe the restart path too, and could that
> path be tested?
>
> >
> > +     /* Re-derive sequence counters from the peer's Initial TSN */
> > +     asoc->peer.addip_serial =3D asoc->peer.i.initial_tsn - 1;
> > +     asoc->strreset_inseq =3D asoc->peer.i.initial_tsn;
> > +
>
> [Severity: Medium]
> On the peer restart path (sctp_sf_do_dupcook_a()->sctp_assoc_update(),
> state >=3D SCTP_STATE_ESTABLISHED), only the inbound counters are
> re-derived here. Shouldn't the outbound counters asoc->addip_serial and
> asoc->strreset_outseq be updated as well?
>
> On restart, sctp_tietags_populate() reuses our Initial TSN:
>
>         new_asoc->c.initial_tsn         =3D asoc->c.initial_tsn;
>
> and sctp_unpack_cookie() bases the temporary association's outbound
> counters on it:
>
>         retval->next_tsn =3D retval->c.initial_tsn;
>         retval->ctsn_ack_point =3D retval->next_tsn - 1;
>         retval->addip_serial =3D retval->c.initial_tsn;
>         retval->strreset_outseq =3D retval->c.initial_tsn;
>
> The restarted peer runs sctp_process_init() on our INIT-ACK, so it now
> expects serials starting from our initial_tsn. The ESTABLISHED branch of
> sctp_assoc_update() copies next_tsn, ctsn_ack_point and
> adv_peer_ack_point from new. It does not copy new->addip_serial or
> new->strreset_outseq.
>
> If N ASCONFs were sent before the restart, sctp_make_asconf() builds the
> next one with:
>
>         asconf.serial =3D htonl(asoc->addip_serial++);
>
> and that serial is initial_tsn + N. The peer's sctp_sf_do_asconf() then
> discards it silently, because it is above peer.addip_serial + 1:
>
>         } else {
>                 return SCTP_DISPOSITION_DISCARD;
>
> Would T4 then keep retransmitting this ASCONF, with every later ASCONF
> queued behind it, until sctp_sf_t4_timer_expire() aborts the association
> at max_retrans? RE-CONFIG requests would carry a stale strreset_outseq in
> the same way, and the peer would answer SCTP_STRRESET_ERR_BAD_SEQNO.
>
> Most of this mismatch predates the patch for associations that already
> had asconf_capable or reconf_capable set. However, the patch adds a new
> trigger. sctp_cmd_process_operr() clears asconf_capable after an ASCONF
> has already used a serial:
>
>         asoc->peer.asconf_capable =3D 0;
>
> The copy above now sets it back to 1 when the restarted peer advertises
> ASCONF. Before this patch, such an association never sent another ASCONF.
> Now it sends one with a stale serial.
>
> The COOKIE_WAIT collision case doesn't appear to be affected, because the
> local outbound counters have not moved yet at that point.
>
> Should the ESTABLISHED branch take addip_serial and strreset_outseq from
> new, next to next_tsn?
>
This looks a legit one.

Since asoc->peer.asconf_capable and asoc->peer.reconf_capable are updated,
we should address it in the same patch.

So please follow the report above to update addip_serial and strreset_outse=
q in
the ESTABLISHED branch.

Thanks.

pw-bot: cr
