Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792467901;
	b=MOnDlgulnyV9RJYYm4P5au9+/987CuiqnOcupOED1EjoK7VXXKBGy0wqenXWH0Aoid5d
	 EoEXikmv10wqPKXR85/cHQcmQs59vz12XmXsSBWANSh6TiwTCNl6R7WQxZN/llswMxJDQ
	 IeNLxyy8+zWY2BMvdwmOJVhF3eIn3o8o3DB70N28RzgfNOE/WJZy4EoZhuBmBlj8WnEsG
	 g9oPbVrE+aGc1iRW/s0kYAmtqKHO+W50/n8Jpz1gjHklQjSjxQ1L39jMVzgV8qhN9v5p/
	 IoODRF0gyIO2l5d/w9ODvBBNoWPIAF23IQ0GYEhK/vcpnqochv9z6e4w1z+9n0yKV+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792467901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xJY+94UWftZtjtSM+flon33ddcDGcmW6jXcDcLrfWuk=;
	b=iMxM79kwCqz/4b0I8IzfY8Dux7SQKhP8SA6SYBSVDUVzuyRi5UQScb9rU7igGcAjZBlG
	 Nnl4EBzNoLHqbiRu7C4DpL1YIFd5IhNtXU121Hm4hyX/O9/xZhgvwIp5YyjpK2NWVBeVi
	 c/Wv3rR2Ll+hUnozb2NXGSB9dZ3IRkKrKLWOOT6agiibmpEbRZ2MeZkuqKPbBin/pPjYQ
	 gXa2h1+fvjRlfEU5fjnl/bxzluodxWPnn6n92hS/NG6sNlFxFI7pvPVLpkBmVQdg+A1Eq
	 sSFZsA/svin/HEs4fU2psob3r6wnhcy3q1CRST63Za2oD6qWWX1+IQmjmFEcqYth9aQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Iy6FwxqG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.75
Received: from mail-lr2-f11.google.com (mail-lr2-f11.google.com [74.125.230.75])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC936606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:45:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC936606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Iy6FwxqG
Received: by mail-lr2-f11.google.com with SMTP id 38308e7fff4ca-3ab2c9f5c01so16355901fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:45:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792467898; cv=none;
        d=google.com; s=arc-20260327;
        b=OS/0r5OdKcB4SftnpQg4cKBpKBqxKH0KwObbSyii3FjUJT46QiVMg1WUcv2runWSCz
         dTgN13NIElRGM2XQLilcXIfHjpMM9yjbwMxpQPbGMuOvCLq6l0JXcpK/5JuymL/0NPcA
         STshIR/+SrUVA9aSdujqXITxKxrqCmAsNTd1b9hxr8j0DctvbjDluVxPGnOzzt3zX/Va
         DLjUSfHw6kHQMWKnwY9MV26kyQTxZ+MJQn04jPdU/FRSePP/KZH03BIMCEoZYPOgDwXC
         6jOs18NY3dXB6Zryjaff56PcYJZy+V24809EYTvksWKHofMzr/3DaG7pL8zrJv3VycU7
         TWKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xJY+94UWftZtjtSM+flon33ddcDGcmW6jXcDcLrfWuk=;
        fh=FeQQ8qZyGig8uCDcHIzJwxUM2V30ima9gfUFNo8tWrc=;
        b=omcl6IAKnbpKeLkw14jFQ939ZOad/c4+Caf+iq48JDC1Ss9BbQmUG/NekuqRyHlqZK
         x1KX4Y3yLfRtrlUGpbStW/ME2HU/Nyp9vslastK3DoEyQASpBm6PmANTkNfWypK5/W+N
         tJRKjadbiTth2Q29XfEg1vg2dekPDF451tzRTo2n/Wjrcopw9T+/YHsObHm1tVtKm+g5
         cTdVBSK2UvIlhNUwvLkRDbHMzEvLCLjMEElckaRmFwrKomA1kAfnwQpaXRhg59Z19oWN
         TFXhZ2QhRItYwnRnt1iybbKUJit5OWVLhA44SVP1V3DcCKCNn+aTd9/yb4uRFnFi7D4E
         lp0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792467898; x=1793072698; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xJY+94UWftZtjtSM+flon33ddcDGcmW6jXcDcLrfWuk=;
        b=Iy6FwxqGrSXqtUPDzb7gV9FqQgEjUzPqBsyqet0vXgBMz3YgdTWmorQDl3nRY5C5ZQ
         FxwlRT9R39RJNqQpqLxwwQdvKPTZ3n+JgpLBEVcsgSjymOVsakaWnw4xXPTzuknRltGF
         aBkdmaxB2qTaNQQjhd8L0Ans1SamEgkjbHt40DHXY+sCYJxePng9ItK/HbcDtcvsgnYH
         BkeFel867jU8YrThnw9oiIwMXlVTKtB7Y2oR/qBcnBkXlouK83OstE7k3AhyZ84qwpNV
         EKzgU6e1l+fHMd8JUqdCsrV6URl/WNMci9i0/lS4PrveJE/agncD3IgZmKAvenjmXur0
         9ZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792467898; x=1793072698;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xJY+94UWftZtjtSM+flon33ddcDGcmW6jXcDcLrfWuk=;
        b=ciDthdVYX46GcL7jzYg3Njs0TtoYkVvtQPfUN0mI8mY/qdkJ5vsZ8XVIwTPvRUZ/fO
         OrZ/RmlZB/etb72OZqaPmaBA1rBl0DuagpMUgnqrKHI74CVO4v64LuOMe5hpzzD4T0VZ
         sV7Jsh7Jpmq6bEqUPO5Zl17yXyhs3SDszbnvXY3y12iy145d9ApNQyZEHx4oxZEUf6GZ
         a6ZnhU9zTherplayNX6rr67MeuZo8JHTLQCtrm7nhWV7NoAN97btdAlwE0w0So+VY2hY
         Jplh+VIpK0m9LLTlcVyHOHL2uqNhnBOEqAoCJqOZkP3+VxrLilfEsynKR4xZutEVXWkZ
         /+FQ==
X-Forwarded-Encrypted: i=1; AKwUvBxk+/tm9dOxartHHSJq3MXH1dgu2MKciSu2rl4ENljP1roTG0qrQ7Q3qw06t0wqJoPYBtx/Obr3njw0UN0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYyz60O2zpC6Y5VBdOQO8ITwTMADw8GfOouBSWgNBDNLHK3M+t
	bBVwQNgPJd3f8sQU37PlmiZQSceNvfW5eY3CF0XimZhf3WZ8GHlaAu8Vx0bSbnkUVaF7wcXibrQ
	ua6J6cRWcktDAP0qDAcjDt4hCPQVIRrk=
X-Gm-Gg: AYBFou20XzxLXI9y0ddIsC1K4dwJqFmFwyXNcP0cKNeLPekNAqikhcIIYSTUcbc68ww
	EEGYfmeKy99CnrHr2u+K8GJkq55WxnD1sHqvS/e5gG7mStLCYNMveATZ5G0qmzMOAkZul+sOI9l
	BiiinoWRgu18fS2+Af9TS8896r5+1O4LezSCbFi5sGrV9lp86gqw5nT4+lwG0swnWn+jFjGasii
	YkovGQOqREOj4VUED0YuZTMDqLDpbKKsNK526ecMZOZmmQ7FcGnEnsPMFmt/qff2ik5FKFz2wSe
	OipW0/8tdMOJjeA6uyD12XV+KpObvHSdAt9VD36sEIj6AOSrI/2RkDOh
X-Received: by 2002:a2e:bc1d:0:b0:3ab:3af0:c291 with SMTP id
 38308e7fff4ca-3ab3af0c2f4mr14632091fa.20.1792467898084; Mon, 19 Oct 2026
 20:44:58 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261010064802.2741221-1-bsdhenrymartin@gmail.com> <179170221371.434549.11644886224016401666@kernel.org>
In-Reply-To: <179170221371.434549.11644886224016401666@kernel.org>
From: henry martin <bsdhenrymartin@gmail.com>
Date: Tue, 20 Oct 2026 11:44:46 +0800
X-Gm-Features: AclHuK9vFCjXXnVvd1RUeYDFtI_MUYNa-CSoiwQxmbvdiNykBSFi5PS9x55ztMo
Message-ID: <CAEnQdOp98Dhd1b7jYf95fS+h2YmyjD+OHx7vzTJOCMquRVStLA@mail.gmail.com>
Subject: Re: [PATCH net] vxlan: reject appending a remote to a nexthop fdb entry
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, kuba@kernel.org, edumazet@kernel.org, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, kuniyu@google.com, 
	idosch@nvidia.com, razor@blackwall.org, fmancera@suse.de, atenart@kernel.org, 
	i.maximets@ovn.org, qotmddnjs@ajou.ac.kr, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Both findings are correct, thanks.

The Medium one matters: placed in the append block, the new check
returned -EOPNOTSUPP only after the entry state and flags had been
rewritten, skipping the notification pass and the err_notify
rollback and leaving the entry half-updated (f->flags losing
NTF_VXLAN_ADDED_BY_USER for one).

v2 moves the check next to the existing nexthop guards at the top
of vxlan_fdb_update_existing(), before anything is changed, and
rewords the extack message to "Cannot add a remote to a nexthop fdb
entry" so it also reads sanely for the vxlan_changelink() and
vnifilter callers; the changelog now documents that these two
rtnetlink paths change behavior (silent wrong-remote attachment ->
explicit failure).

pw-bot: cr

Regards,
Henry

<netdev-bot+sashiko@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=8811=E6=97=
=A5=E5=91=A8=E6=97=A5 15:03=E5=86=99=E9=81=93=EF=BC=9A
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
> - [Medium] In vxlan_fdb_update_existing()
>   (drivers/net/vxlan/vxlan_core.c), the new `if=E2=80=A6
> - [Low] The commit message presents the change only as rejecting a
>   userspace `bridge fdb append` onto a nexthop entry.
>
> --
>
> vxlan: reject appending a remote to a nexthop fdb entry
>
> This patch adds a check to vxlan_fdb_update_existing(). An NLM_F_APPEND
> request on a multicast or zero MAC fdb entry now fails with -EOPNOTSUPP
> when the entry is backed by a nexthop group. Before this,
> vxlan_fdb_append() would link a remote onto such an entry, which breaks
> the rule that nexthop entries have no remote list.
>
> > diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_c=
ore.c
> > index 278d41f58d895..e9c5ba7a74172 100644
> > --- a/drivers/net/vxlan/vxlan_core.c
> > +++ b/drivers/net/vxlan/vxlan_core.c
> > @@ -1047,6 +1047,11 @@ static int vxlan_fdb_update_existing(struct vxla=
n_dev *vxlan,
> >       if ((flags & NLM_F_APPEND) &&
> >           (is_multicast_ether_addr(f->key.eth_addr) ||
> >            is_zero_ether_addr(f->key.eth_addr))) {
> > +             if (rcu_access_pointer(f->nh)) {
> > +                     NL_SET_ERR_MSG(extack,
> > +                                    "Cannot append a remote to a nexth=
op fdb");
> > +                     return -EOPNOTSUPP;
> > +             }
>
> [Severity: Medium]
> Can this early return leave the entry partly updated? When this check
> runs, vxlan_fdb_update_existing() has already written the new state and
> flags:
>
>         if (!(fdb_flags & NTF_EXT_LEARNED) ||
>             !(f->flags & NTF_VXLAN_ADDED_BY_USER)) {
>                 if (f->state !=3D state) {
>                         f->state =3D state;
>                         notify =3D 1;
>                 }
>                 if (f->flags !=3D fdb_flags) {
>                         f->flags =3D fdb_flags;
>                         notify =3D 1;
>                 }
>         }
>
> Returning -EOPNOTSUPP here skips the if (notify) block, so no
> RTM_NEWNEIGH or switchdev notification goes out. It also skips the
> err_notify rollback.
>
> For example, create a zero MAC nexthop entry with:
>
>   bridge fdb add 00:00:00:00:00:00 dev vx0 nhid N self permanent
>
> Then run:
>
>   bridge fdb append 00:00:00:00:00:00 dev vx0 dst X self permanent router
>
> The append passes the earlier nexthop checks, because nhid is 0 and the
> state includes NUD_PERMANENT. It changes f->flags and then fails.
> vxlan_fdb_add() returns the error and restores nothing.
>
> The in-kernel callers vxlan_changelink() and
> vxlan_update_default_fdb_entry() also reach this point. They pass
> ndm_flags =3D NTF_SELF and state =3D NUD_REACHABLE | NUD_PERMANENT.
>
> On a nexthop default entry created by the user, f->flags is overwritten
> with NTF_SELF, which clears NTF_VXLAN_ADDED_BY_USER, and then the call
> fails. vxlan_changelink() treats the failure as if nothing changed and
> frees new_cfg.
>
> The other three nexthop checks near the top of this function all return
> before anything is changed. Could this check move up next to them, so
> that the failed request has no side effects?
>
> [Severity: Low]
> The commit message presents this as rejecting a user's bridge fdb append
> onto a nexthop entry. Two in-kernel paths also reach this check with
> NLM_F_APPEND | NLM_F_CREATE on all_zeros_mac and nhid =3D 0:
>
>   vxlan_changelink()
>     vxlan_fdb_update()
>       vxlan_fdb_update_existing()
>
>   vxlan_update_default_fdb_entry()
>     vxlan_fdb_update()
>       vxlan_fdb_update_existing()
>
> The first runs on "ip link set dev vx0 type vxlan remote <ip>". The
> second runs on vnifilter group add or change, for example
> "bridge vni add ... group ...".
>
> On a non-metadata device, the zero MAC lookup is keyed on cfg->vni. A
> nexthop entry created with "bridge fdb add 00:00:00:00:00:00 dev vx0
> nhid N self permanent" is therefore the same entry these paths update.
>
> Before this patch, these link and VNI changes succeeded, though they left
> an unused remote on the entry. With this patch they fail with
> -EOPNOTSUPP and the extack "Cannot append a remote to a nexthop fdb".
> That message describes an fdb operation the user never issued.
>
> Rejecting these requests is probably the right result. Since the patch
> is tagged for stable, should the commit message mention this change in
> rtnetlink link and vnifilter behavior? Could the error message also be
> made accurate for these callers?
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261010064802.2741221-1-bsdhenrymartin%40gmail.com
