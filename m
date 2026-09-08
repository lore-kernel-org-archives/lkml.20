Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25833D45FA
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 20:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788901157; cv=pass; b=WE7QzfOqTK5yddiaKrMSHpxohVp9mmwALJvY5Yb87DBsPwQLKSSCFdAyN4DTixQGNpOrH8SRADmXx1b7ddPgO/gUJ9DR/J0GzZIIRJgKM+4Yyvb3DD8BADAqG+cDv77XB8sIkGAuB2lrO5+15e3n7w6+jPPq/do0UJGZktyFmnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788901157; c=relaxed/simple;
	bh=4L3mIQ51Za+hevnJQF35OKF0lhPUnBQCI7anwHqJZZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EI2PftDHMhyMZfeH7E0qcDmFrgFOAXZh/XYekmcnPwcbE6rOnhOmAIeadKR7Q3NMC81UEeU0lHwWewE97CCB72fLidTIih8HwN8GI8WvNM7ULe6OThpuUpnl+0hBgRK+LEqs0W/VrJ3c+GT88UOU2nIjmrqNbG1PJ+zNdMG07jM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akraTvgC; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akraTvgC"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-87005a0e052so60866397b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 13:59:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788901154; cv=none;
        d=google.com; s=arc-20260327;
        b=JWNDru9v23aON0uiYrcNO0DN/rAwCoDPonir5xekfyfLfUvCqw6AO48hbTVll9azLv
         VqZAr6qNYiAlva7M44Hs+VrAMr0opi1X2Ut4CTT9RddYKCu4csDvtOWiXrIu7iGh4pT9
         PMNiJ3tJFD6v1+aiEdOW3U5abtwlVO7WLDjiVqLEAOTR/38t/AocXxEfDSe/AoqpGPE7
         gm0/4nzm8nk0TGzrwV8q+PVObqYLM2kJ/ibdQ6JY3hOVX3uEJ9AE7FnkuHcpXZHa4SOp
         N71sUY9yYOH3V1zad4H62+TFi0nvLlrSC502yZDub310Np7x9wiwcbzAfu+oSRr9UcYw
         xoTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j2HjWTwKOW7XBjlA+0JQVM2bxaK/3ypo576iHosJe1s=;
        fh=AeBr3wgvPVkvdDZkQ30x+GrfBew5pWAWSoTcWH4a1bQ=;
        b=kffZDyLNdoc2u+S8wjbUc9+6y1wVSd1qigpGT8ZrI8+iLQ5wVEVMuHKboM2Rr5Ajxq
         SpB0pCQFAylVkGlL6nYrHGxetR5XpDFW/1iyf/qhCmN4+MigiUal/yyM6W4suDNFNm2c
         feEDHQOWW/ze8rs5ls5tmlz83+krE/H6nIjpkkPetgtB8n3QL35aGGt2sQBoCJc0j15O
         yFqk+e8NUYddjjzwuy8EoDwnTwTNDQEBCPp1PvqmrnKnEDtRaIketf/pL3nIBQSzka7N
         Z556cGuxvcgapd2MILQ7Bu/xCTjq6Qw6Lteb4D5TSQSJz5VBE6y06K98kZiki6XzYHfg
         o7fQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788901154; x=1789505954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j2HjWTwKOW7XBjlA+0JQVM2bxaK/3ypo576iHosJe1s=;
        b=akraTvgCjokgS5CTJ/WFLSqsdVGBXwZihAmeYk/+Mv8f+G5yhP26GsPDK86J9LZOHk
         KUC6KAEhhOkM5n3ERHQqWI0oalIbOK73JZLWPY5pv9spndkR9yFC+RRZGVX0a2nYF3FT
         UWtbs1d4NGDeaHBxXfF19reCM1dC/NiMeoYDCGNsKTPmLgCI/KoIrom62Yu/C/tUl17+
         UV/ypagne6r9WX+Z0U/rzYL88z+Sn+MnOmGdjSypM6wJfhScOjbjdgymRFDls0k5hT5w
         MjGFxCqLtSajXsrlif3LR1WNDELiA+3PkHtzzXHHQWPoPevj//oR2v0V4wxm3rDCVllH
         DCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788901154; x=1789505954;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j2HjWTwKOW7XBjlA+0JQVM2bxaK/3ypo576iHosJe1s=;
        b=kOvQaJx68L7G0duNus4RzhqYkvIeaMw8YY+d/HgEOxj9p8wzSIcxbhKXVd7g6iuzWj
         z8Kw1w0L8zUJmXfesLfHvrhvSSZTloWJCODem45TdgTajy/QQiH54G73uTc2qgSAnZTZ
         KroJi/4Gv65MnAi/BBy/J6gkDawcDkyMbUttXe8onJm49Lzs3KN4lA0f5fwJijTBTJoP
         O70p2NW4DC9IfdgmUV7TsM26kMjqlGOLHM7rveE0/CYlwvrH5dZFUXOzf3KqzG07hUII
         c4jArCBnSEtdI6mN0WbxGTlC4JvAvPPtEtGhc+rAV8EeAEeuKlW/0c5Rwh3AbXZfQTis
         AuuQ==
X-Forwarded-Encrypted: i=1; AKwUvBw92f69sIMakHmPWqWzH3nur4S6lkprVO3xV7LFpk0g7Uy8P/zuNSK+dMSEzSj0WJgYgBhchtQ8EmRDbDQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m0KkWANQC5KuwDXG8NdBOyE7ZLu1y4NKVRhC9AApMevjXydTX1
	TxCwWFxucN+k2+OGnSEJf3LmI65qN4C4iUB+1VRv5U8lonmMsZy84Vvi3b1UnWvdPJGTOJAHm2s
	WlJ+uS7aZGKe4gAvDc1Ki8vylh+e8PUBY5hJR
X-Gm-Gg: AYBFou10F81zt8zbgON+KfiZCz+lQHLjiM+z2VXUA2K+czD1EdwcLFcul9wkko3Mxeo
	fXQfyn2ly0NK9psyM++Qreyw84SZn9RDr1MErXPcszwMeeqE5wgDzDmY6A4U6gQiSUY/D5j4KsH
	W0g2ebF85SeipKcYLYVD9GZWUlrJ2JQw/IcLRKAgBStpXHVflrAqwGo0osMOpNnKTyvFd990UaI
	0teTlhYEh3u2e2+Oqpi+xmDP8zCbjrSd7hkwhKsHs69g8cycguLs2KShXy419aYd6ObrtA3Or4/
	aP5Sjf+0mZtw7nvh2/m7KbF5KHFSV0IoQeeeann4vjyRhIdXECaAp8P7gi5VxEubFU56G4yHgZ3
	apLxMkzWwaZriK/3RT7rDZyzkJLsAayj9b4dGNGYxng==
X-Received: by 2002:a05:690c:45ca:b0:870:f53:4ec7 with SMTP id
 00721157ae682-87122598fe1mr125736787b3.8.1788901154527; Tue, 08 Sep 2026
 13:59:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908012048.3681904-2-radek@podgorny.cz> <20260908012048.3681904-4-radek@podgorny.cz>
 <CABBYNZ+nWb0m=qMvxADM2HvuLhopxG7L+io2JTmGXQM51YOYhA@mail.gmail.com> <178890003160.100543.8134592214245196581@podgorny.cz>
In-Reply-To: <178890003160.100543.8134592214245196581@podgorny.cz>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 8 Sep 2026 16:59:02 -0400
X-Gm-Features: AcwNN1XS4ExhaXQOfMrKhkKQKNCEj0x6gxd9015WVyRPoldkhojD6FLOhC076cs
Message-ID: <CABBYNZ+5zV8xzhHZKTUQYT4tLHaZAO7iiKOEsKuT8aA+YNLjPQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Bluetooth: put the peer's on-air address on air when
 we cannot resolve
To: Radek Podgorny <radek@podgorny.cz>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Radek,

On Tue, Sep 8, 2026 at 4:41=E2=80=AFPM Radek Podgorny <radek@podgorny.cz> w=
rote:
>
> Hi Luiz,
>
> On Tue, Sep 8, 2026 at 4:00 PM Luiz Augusto von Dentz wrote:
>
> > Ok, the problem is then that we are trying to an indentity address to
> > connect when LL Privacy is not supported, so we probably can just
> > revert to use the private address at hci_conn_add in LL Pirvacy is not
> > supported or we didn't program the address in the resolving list.
>
> Agreed, that is the better place. v2 does exactly that: __hci_conn_add()
> keeps the RPA that hci_connect_le() swapped in unless
> HCI_LL_RPA_RESOLUTION is set and the peer's identity is actually in
> le_resolv_list. All of the hci_sync.c changes are gone;
> le_conn_complete_evt() already resolves conn->dst back to the identity
> once the link is up, so the round trip comes for free.
>
> One cost worth naming: with the RPA in conn->dst from creation,
> hci_conn_params_lookup() in hci_le_create_conn_sync() misses the
> identity-keyed conn params and the connection falls back to the default
> intervals. That is the pre-14b06c3a88f7 behaviour, so nothing regresses
> relative to the code this fixes; if it matters it can be done on top by
> resolving through hci_get_irk() the way hci_connect_le_scan_cleanup()
> already does.

That probably worth fixing, but yes it can be done on top.

> > Not really following why this is needed though, we always scan before
> > connecting, so perhaps we need to update the rpa whenever we resolve
> > at process_adv_report:
> >
> > /* Check if we need to convert to identity address */
> > irk =3D hci_get_irk(hdev, bdaddr, bdaddr_type);
> > if (irk) {
> > bdaddr =3D &irk->bdaddr;
> > bdaddr_type =3D irk->addr_type;
> > }
> >
> > So we do translate the advertisements to back to the identity address,
> > but we don't update the irk->rpa, which is probably what shall be used
> > in case the controller cannot resolve.
>
> irk->rpa is already kept current on that path, one call deeper than the
> snippet: hci_get_irk() routes any RPA to hci_find_irk_by_rpa(), whose
> second loop does
>
>         if (smp_irk_matches(hdev, irk->val, rpa)) {
>                 bacpy(&irk->rpa, rpa);
>
> so every advertising report the host resolves refreshes the cached RPA,
> including across a rotation. That is what the old swap in
> hci_connect_le() fed on, and it still runs today.
>
> Which also answers the timestamp question. Since every
> scan-then-connect path refreshes irk->rpa from the report that triggered
> the connect, the freshness check only matters for a peer that
> distributed an IRK, used RPAs, and later went back to advertising its
> identity address - the cached RPA then stays stale forever and keeps
> being dialled. That corner predates 14b06c3a88f7 and has shipped that
> way for years, so I have dropped the rpa_jiffies patch entirely; it can
> come back as a separate change if that corner is ever worth closing.

But if it advertises using the identity, we should connect using the
identity as well; there's no reason to use the stale RPA if the peer
somehow disabled its privacy.

> v2 follows as a single patch.
>
> Radek



--=20
Luiz Augusto von Dentz
