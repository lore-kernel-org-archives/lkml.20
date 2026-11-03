Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793718093;
	b=QcTT/EV6+AFbrTkC1KaumYta+lrsB86ko0T7byEmu/+mBzo/qebuaHY6w09Jd+z6402W
	 xrLo9R0JryB3e2syRS+Zldu+G+PmnwPIU3DAZBn5Yal2lHTJNV8X0CklXlO6/cMTjOvV7
	 ndrNfn33tliw6DFOJhcW5h0v0B4x4p9rzCSbEPvSNVNlTF49+gT9aTsnXoCaaMkl491/5
	 5zLrdZUA9QX7vPgSLB2mH93xgwBBecCMTDokjQsCDJ/RWEUaRiEbNIf7AfO47nq4o3MfV
	 BArd8Z2ZLQZaCwdxaHTE35t3c2/XsveMHlAdOsbvW6Xtan2l0B3GDYsbj4rGucxfvqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=C5z4M29UxeONpK8o8OLGczvOOTRjyuOm2u6SOdS+0pI=;
	b=C1OD3z/UNLdjBXQV/f6oW23DPG4Ox1v048S00QH1xXown0SUqO+lMOvh5893Nd8CFM8m
	 CQinZXKaig+sFYmQVd4XM/tBwi/QoLNquH2ozOO15bIIWJfN3W7iWCzrj8atDFD2PG+J3
	 gQstdQXlYogWqi1xJrKIEpKx0iD2Zv4ZrKuLS0X1NuTciCOO5VW/AhgFvrHrkeJX73hzq
	 GKngKpJ63VsitAcG1lt1PumSDEYw/Capv5nJz2tFg3IvEXtZ/U2Ci1MtIolgz3p9p7cBT
	 rWwGvOjfYHYUyWTE1xBXPuUbeCsNZWI/qXF/rbvx4r6fVNiAoqJyBfAmwAHlwz0TSyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="zeu/ko8D";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.48
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B642E606A32F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B642E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zeu/ko8D
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-990fbae94f5so2533765241.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:01:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793718091; cv=none;
        d=google.com; s=arc-20260327;
        b=ASBMKMx0yoVeNd5LzoNzoTJ2lkteRm4uVvfuToCTd4DHjlJZEh1mk5yU9gqbuGSAwV
         Ij73NLSO5+9r0l4i4FyCbhWx4omQMr53TI55DRPcQctFcg/V+I/S89aHhm7vjU4TdCg5
         5eUj6TXKvR556IpO2ry2u2DC8K82llqEOqmHxzFf4GucGV8jtzeHyMDwin/UXa7lz5UQ
         ZybL0PiwBwXqZZEVk492GtPkoMIwTUJ/6equGnanNC42dUMYxl3BPKMnmkQcHm0A5tLU
         wv/2HWOGTMainmtiUzKI/t8y5oxGMcAMraVmeVhcJt2E4Pbh7UaGvel5hkNEFf33VFBp
         4Awg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C5z4M29UxeONpK8o8OLGczvOOTRjyuOm2u6SOdS+0pI=;
        fh=x92TL+dSxgFCMNzyH3FDRF4UP7/l4SyE6auuHAcvUsc=;
        b=N8F++oitfxPzPUmG638ejks8lmQM1F/tW5DUufTk6nppLsEe7jpKrExMnNNdnp0OoA
         q0aAmXkefgTqAkk/hPYN7DtX5soKJNIs+DQml+qGOavbrD+ETFfwAWk3Jb9Ie1JDLk92
         wrQvz9v5bWyhwyLR+o+1Ljx88DFUQim4Rwzilxpll1ds9XhiZ7W1glFxsxPfYYTbCkOk
         ECBpQlki62DGEmlNnArmawQa4HrHkIc/GpkPAluxT3eF4Dx7PyXKHAwlE2CEH2aqP5cb
         ybPU3gcxxmdd3rR4c9zjhMYNteuPGeHsDxcUUFY10b7NYJ/fMFPgzkbkAjm0uCr9/PvH
         bfmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793718091; x=1794322891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C5z4M29UxeONpK8o8OLGczvOOTRjyuOm2u6SOdS+0pI=;
        b=zeu/ko8DkS5rKNStf2MC93UcGfZbVP4uaoIt/BxP4yh5fKcoofKYazpLw1iRdh4Hc6
         lBQQOPUz8KJK7M/V6FBAp3wNnNA3NWoOh++0wBPgNw8VluaRTz4fZJnr2P3NRNOWGCwX
         3a5yjceA8ZM5Nxo6MHbYAetTo8JAgOoMwe3qhLwzrdqn8AGmIW/tm7mGrIcS9pl+52d1
         /zdUtCr0WDE6fcdEObwzSH+S3sri0cMB4LWHUZgnsK6c6eoDhiILmJpxyatrvdc61xZY
         oIPtrdD5JEpYDL3zhUGlUHnJ1Yf6THnbIcE96nUDMnVY3kb1wGlFuWpqqNgjfsnntGNq
         +yOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793718091; x=1794322891;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C5z4M29UxeONpK8o8OLGczvOOTRjyuOm2u6SOdS+0pI=;
        b=zYIVuBuaGAMjODu/wauoExTnJXJ2GcjkYNh/286zcvQhy+c07o5TswYpGEk+bonCPE
         dCdgwGyquKXku7WFopg19BKkY2Ua7zvK3PTSbkaOpuFA3UwDuPqa8w4C4vBwwVRfHJ25
         g66J2WzOfsl2sAmVrhSSx5mthka5+OXaX4PKDFHE+gR5MAH2gWenr7rSzkt/qGfDGDpP
         IZgUStzGrGh0+pYuZnvAl3ayqf8p3d2T5fPWsBxbLbq0t7VPIJ99PJc8w5uRKWO9OCwC
         S2BZ2QOQV4RcnmUr9UBle7c6QSCkjODXS4XUMvqHAgDpMqyZa5ARwLVkiMgltmjwnwUi
         UUQw==
X-Forwarded-Encrypted: i=1; AKwUvBx7NbpofwDC6tx5CI9LY+mMZtaDxRe2Dexd0Xvkd+/EO0blYgruA6cnagcDTZgs2LW6eWOLgO1hK/BhcGI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jOrhltBuF5chxdBT3Xqg1VKtvKvVVBmh6sFrBUIweqKX0m3iq
	K3vuP022437MV+gQXPx5H0qi+jNBmzHcUCULxwbggQK9243TW1JlhtxMZeMtUd+RHNwkME59wui
	7azEoHOg3hmvdSoeZuja32phW2WnoApE=
X-Gm-Gg: AYBFou3JAVGL6V6t+WfS7PrKJw42wwnLLNVcJ3VxIxoC8VLXJe1a3y5LOnpgV7fmr6K
	CzO6uqYDNwvn25lprHLMrq2ZAxsJLZXccjVsnHgPhdq/EkHx4Xi4jf8vLaZzjycycZgeQ/WhqBs
	lSMw2Jmy2dKbudKQENP7wp6WjToe7v/H8aSeeEkyxcoGnErhlkcFuKWuTA6dtO82c9JcGONuggT
	e/ZaME6Cau+MKwOOKUtri/Hqa0bT+aJx8XfPcUQRiL2gwcI9eFltxAO3NeaxnCXFJ7vq4zfZXO5
	3L0JTC3qaeiL03Mua4REzJU+4T04HTHuHfZZy9u1C35GDq29DGWFhAgrCN4Tzqpf3PyoIqCY47M
	7ns+hOhgTkoJulsDa/VTEtPMwl4Czw/A8zDeKrT3kyhL+V2++ja6EAaqS6p9ydd6SQrllmSyMzM
	QzOT2sma3UTrP/yKKYwDHO0kPVrLfYqO7e7I0j/g==
X-Received: by 2002:a05:6102:c13:b0:7be:25d4:7ff0 with SMTP id
 ada2fe7eead31-7d072247a9cmr4891903137.4.1793718089861; Tue, 03 Nov 2026
 07:01:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029193454.1028626-1-andrey.misyrov@gmail.com> <179365071111.3131.11060798860349203804@kernel.org>
In-Reply-To: <179365071111.3131.11060798860349203804@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 3 Nov 2026 10:01:17 -0500
X-Gm-Features: AclHuK9nfSNUyCyqoDyvo9sP8tF53Z1JcsckJk3ZwF841Id_BliZCishdgjDQdY
Message-ID: <CADvbK_ctB+uPFZzpNF7dszEqyEQAK+GZJGtMo-tehoWUDQyeXg@mail.gmail.com>
Subject: Re: [PATCH net v2] sctp: fix ASCONF address change on single-homed hosts
To: netdev-bot+sashiko@kernel.org
Cc: andrey.misyrov@gmail.com, marcelo.leitner@gmail.com, junvyyang@tencent.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 3:18=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wrot=
e:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 1 =C2=B7 High: 0 =C2=B7 Medium: 0 (1) =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Critical] sctp: NULL pointer dereference in sctp_vtag_verify() after
>   plain DEL-IP
>
> Pre-existing issues:
> - [Medium] This problem was not introduced by this patch, but the
>   wildcard SET_PRIMARY branch of sctp_process_asconf_param() does not=E2=
=80=A6
>
> --
>
> sctp: fix ASCONF address change on single-homed hosts
>
> This patch changes DEL-IP handling in sctp_process_asconf_param(). A plai=
n
> DEL-IP of the transport that located the ASCONF is no longer refused, so
> the single-homed renumber case from RFC 5061 5.3.2 works again. The
> wildcard DEL-IP now looks up the peer by the packet source, and
> asconf->transport is either cleared or pointed at the surviving peer, so
> no freed transport is left behind.
>
> > diff --git a/net/sctp/sm_make_chunk.c b/net/sctp/sm_make_chunk.c
> > index d64c3ae33298f..0f9538f8040f2 100644
> > --- a/net/sctp/sm_make_chunk.c
> > +++ b/net/sctp/sm_make_chunk.c
> > @@ -3153,9 +3153,12 @@ static __be16 sctp_process_asconf_param(struct s=
ctp_association *asoc,
> >                * packet MUST be deleted.
> >                */
> >               if (af->is_any(&addr)) {
> > -                     sctp_assoc_set_primary(asoc, asconf->transport);
> > -                     sctp_assoc_del_nonprimary_peers(asoc,
> > -                                                     asconf->transport=
);
> > +                     peer =3D sctp_assoc_lookup_paddr(asoc, &asconf->s=
ource);
> > +                     if (!peer)
> > +                             return SCTP_ERROR_REQ_REFUSED;
> > +                     sctp_assoc_set_primary(asoc, peer);
> > +                     sctp_assoc_del_nonprimary_peers(asoc, peer);
> > +                     asconf->transport =3D peer;
> >                       return SCTP_ERROR_NO_ERROR;
> >               }
> >
> > @@ -3168,13 +3171,9 @@ static __be16 sctp_process_asconf_param(struct s=
ctp_association *asoc,
> >               if (!peer)
> >                       return SCTP_ERROR_DNS_FAILED;
> >
> > -             /* Don't free asconf->transport; a later wildcard DEL-IP
> > -              * parameter reuses it.
> > -              */
> > -             if (peer =3D=3D asconf->transport)
> > -                     return SCTP_ERROR_REQ_REFUSED;
> > -
> >               sctp_assoc_rm_peer(asoc, peer);
> > +             if (asconf->transport =3D=3D peer)
> > +                     asconf->transport =3D NULL;
> >               break;
> >       case SCTP_PARAM_SET_PRIMARY:
> >               /* ADDIP Section 4.2.4
>
> [Severity: Critical]
> Clearing asconf->transport here can leave a NULL transport for any
> chunk bundled after the ASCONF in the same packet.
>
> sctp_rcv() allocates one struct sctp_chunk per packet. sctp_inq_pop()
> reuses queue->in_progress for every bundled chunk and does not reset
> chunk->transport. The asconf seen here through sctp_sf_do_asconf()
> and sctp_process_asconf() is therefore the same object that
> sctp_assoc_bh_rcv() passes to sctp_do_sm() for the next chunk.
>
> Once this branch sets asconf->transport to NULL, the next bundled
> chunk reaches a handler that calls sctp_vtag_verify(). That covers
> DATA, SACK, HEARTBEAT, a second ASCONF, or even an unknown chunk.
> sctp_vtag_verify() does this:
>
> include/net/sctp/sm.h:sctp_vtag_verify() {
>         if (ntohl(chunk->sctp_hdr->vtag) !=3D asoc->c.my_vtag)
>                 return 0;
>
>         chunk->transport->encap_port =3D
>                 SCTP_INPUT_CB(chunk->skb)->encap_port;
>         return 1;
> }
>
> The vtag matches for a legitimate peer, so this is a NULL pointer
> dereference in softirq context. For a bundled DATA chunk,
> sctp_assoc_bh_rcv() also stores the NULL into
> asoc->peer.last_data_from just before that.
>
> The trigger is the case this patch is meant to fix. The peer
> renumbers from L to S and sends [Address Parameter L] [ADD-IP S]
> [DEL-IP L] from S. __sctp_rcv_asconf_lookup() locates the association
> by L, so asconf->transport is the transport for L. The ADD-IP raises
> transport_count to 2, so D7 does not refuse the request, and the
> plain DEL-IP now removes L. Any peer of an established association
> can bundle another chunk after that ASCONF, so a remote peer can
> trigger this.
>
> Before 9b2854f86f0b this path left a freed transport in
> asconf->transport. The patch replaces that use-after-free with a
> NULL dereference for the same bundled chunks rather than closing it.
>
> The v2 notes already handle the bundled DATA/SACK concern for the
> wildcard branch by retargeting asconf->transport to the surviving
> peer. Should the plain DEL-IP do the same? One option is the
> transport for asconf->source when it exists, which it will after
> ADD-IP S. Otherwise asoc->peer.primary_path could be used, since
> sctp_assoc_rm_peer() has just updated it. Or do you prefer to make
> the receive-path users of chunk->transport, starting with
> sctp_vtag_verify(), tolerate NULL?

Looks like ->transport can't be NULL at any point. I couldn't find anything
in the RFCs about this, so setting it to asoc->peer.primary_path should be
good enough.

Thanks.

>
> [Severity: Medium]
> This is a pre-existing issue, and this patch did not introduce it. The v2
> notes already put it out of scope. It does interact with the new
> asconf->transport updates above, though.
>
> The wildcard SET_PRIMARY branch just below says it uses the packet source=
:
>
>         case SCTP_PARAM_SET_PRIMARY:
>                 /* ADDIP Section 4.2.4
>                  * If the address 0.0.0.0 or ::0 is provided, the receive=
r
>                  * MAY mark the source address of the packet as its
>                  * primary.
>                  */
>                 if (af->is_any(&addr))
>                         memcpy(&addr, sctp_source(asconf), sizeof(addr));
>
> However, sctp_source() returns the transport address whenever one is set:
>
> net/sctp/sm_make_chunk.c:sctp_source() {
>         if (chunk->transport) {
>                 return &chunk->transport->ipaddr;
>         } else {
>                 /* Otherwise, extract it from the IP header.  */
>                 return &chunk->source;
>         }
> }
>
> If the ASCONF was matched by its Address Parameter in
> __sctp_rcv_asconf_lookup(), asconf->transport is the transport for L, whi=
le
> asconf->source is the real packet source S.
>
> So if [Addr L][ADD-IP S][SET-PRIMARY 0.0.0.0] is sent from S, wouldn't L
> become primary instead of S?
>
> The ADD-IP wildcard branch, the D8 check and the reworked DEL-IP wildcard
> branch all use &asconf->source. That leaves "source" with two meanings
> inside sctp_process_asconf_param().
>
> This patch now rewrites asconf->transport partway through the chunk. As a
> result, the wildcard SET_PRIMARY result depends on parameter order:
>
>   - after a plain DEL-IP of asconf->transport (now NULL), it picks S
>   - after a wildcard DEL-IP (retargeted to the peer for S), it picks S
>   - otherwise it still picks L
>
> None of these orderings uses a freed transport. Where the result changes,
> it moves toward the behaviour the comment describes.
>
> Would it make sense to have the wildcard SET_PRIMARY branch use
> &asconf->source directly, like the other wildcard branches, either here o=
r
> in a follow-up? That would make the result independent of parameter order=
.
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261029193454.1028626-1-andrey.misyrov%40gmail.com
