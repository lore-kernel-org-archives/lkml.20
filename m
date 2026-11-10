Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794276591;
	b=nksBlXEmtg+nwfzEkHxEuFVIDhqJ7kHjjA7ZT7FKsqezD4kQEYflGIwWu2ZnzNE4ap6e
	 BOaOOgNaw4BIDRubrW2USeAkLCZO28Xi6i10cCaMtzJJX4nkJk1NUuIGdT7jM3NNmtJ04
	 ZMirVGZVm+UVICDGx78HL3oPNLTYxXtYiL/mZJ8H3fMLd7MHZLY/DSraUxaXEQ9Y2PzpI
	 CJJwALF7zfSYHrcUjCu5BMveLj3iRoPsNMBBdtT48A5Wi37i1l45qBjrw2qsRPUycwciM
	 84rPKFynSdBldT/d207870sDn836/0igV1QW91oEGW63IrGF4BEFbeVQ/+eMn32MHtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UzMGximFj4DUBgBHxhMcMwIgVslNRL9hrAzzKDz9yOQ=;
	b=HyJJPR336xef9b7IBOnrwVUa9YV5immRyb2GB3xOGaCpk8ndJaLoySorJSU7iz5GFVuS
	 tcytDi21Vqx7aa4B349xEUANKKcwKVkmbp7OUT3h90OAi2jDbpEBtkqxsbs8GMSoN8396
	 M0NPdarWJVU/Darhu10sxX/0EASfDh41zSYVWHIrfV/tt7I6nCLsBMoIXPlOO74fA2wcT
	 qcIY8d/3EoygyHLGBpE6/L7MyA84b8qP/I/0hGx+462GZgadFA9dVROvkvHAUiNswPPem
	 QPvYblmuMul0EyuNRSwh8Ijkzhlhf4MHGEE/BTr0rXqs0tisRsMKYUwrizvVImMvtqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VhTWIjwJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F164606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:09:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F164606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VhTWIjwJ
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a0673d9bd2so890483b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:09:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794276590; cv=none;
        d=google.com; s=arc-20260327;
        b=CnvYcU1bjxX4rOaLNqZ8+gDuXJdgDb/rVTgPxBQaAHfzYVBy7GbVGQ4SButQEG7B3E
         QNn0uDGHHf/awNsMAKmMz605BeDqPMUHAW75t5Y3l1OSjvV6LUs09JH5q9AhGkATO2KP
         96unDWoCf5AYzxNq3Z9HfCm0rBCsc2OnY9kWHueIYUuBlPRnDqzslQZDZTEFHA3Qahw6
         2ex8Ht5hyZ630+EwWmsnU0csO4BosLURb4i0Md4gknkDVFNU/Jf0zGp7vxwGt4LLpNEN
         DwqdMBFq58lLWc7dklRwMWV9gJ99T6DtZSxK7Ee/rddrF1ele5KDWyfJKlE12dtyxfHn
         pVAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UzMGximFj4DUBgBHxhMcMwIgVslNRL9hrAzzKDz9yOQ=;
        fh=qhyxZOrPUgfCx/jaB9vRx9jSHO4TFLVxH4iQzJLbsPA=;
        b=EqQJWavPI3bHlWqhbkLHGj04KltZu6QUMuLNP4TWv335rCthW7HsdJqBAdnsjs5q/4
         4mB90h4sLSiYG9Ag9WhXSZ2GWqnq/6DR3bimIliBj8DRIhdXGvgDm1w5q6miUwG5O0jf
         lBHYolK99Ls8jIRclP8oPX5Fjcyb57Rfz0vdI7Feyr/jQN3NQGMB7AdLAqtKXp2E2Jt3
         VZ7u+ww4inKAjglo1FwuAU5MBuIbAU4cZ5vgzUUxU6wvW5UEFFsF2tIm+A0U+ts8jMA7
         0hGpIBU2Z3dOAZoaQslFr3MaU/odHYoHjH9MRI3spPo0Q3NuYU2waeJJUFU1WJz+dCQn
         rnmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794276590; x=1794881390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UzMGximFj4DUBgBHxhMcMwIgVslNRL9hrAzzKDz9yOQ=;
        b=VhTWIjwJl1gVoUACZ6PlcP8DxAcXYhFGB0m6Z+8BOCsovVY/s5/Nolmu7n88G/axiZ
         SUEqZ9FVROd3tNVcVtk/5KGeIiQRWJxzMcfATqxXFuAFptTJ1aVzdEFfIrjlBXVrundS
         PX649y32l65CYBtR+yg+rJZ2yU/KY4dxX+DtoxNbrHoGNgFsqY5XDe+0daHiyBbIvNVn
         yTFSK1BaOjZRp8Qi/bVWxIkkqpkg7K8zWW/cG2YQRDd9oDtapjNaUFvZAVjymBJSXTSF
         Bwap2/T/T003yJrq+laLBfRW2LGbq5yTJNIS63J3z0dajDbS2BeFsy5NerPMX1764N4q
         PAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794276590; x=1794881390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UzMGximFj4DUBgBHxhMcMwIgVslNRL9hrAzzKDz9yOQ=;
        b=mdIokhW+XmcaQS/tY4jbtt9iUOoLxdj/6zz8I5gMfuMHTMUc9zOGPQW2Wg3zjKyoHQ
         h4Emt1g2MaUkM2msZqQcg6KMK2sM0gpyOZUg2+XBmZBpSgpo2FvJ1s0oyuCejPLUoeUW
         v50QYp8a76zG4+gMdROBNt//Im/iZ4lULEsx8n7fwRYzB/TRpsf6F9PgVaG3LpH9z0Eo
         IPbD7bGlnQWVUOvIxz83bEYNm9lA1AHICYlQv3y/B+vs0oq+2DPgg2sXaG99wgG1kt8i
         Z636mMx5GPskhGsT1xYPMC6PQeP6D5WjJ+dp8qcLqVMJRwtLGu8A7iaAdyyQALHDu6rA
         sXIA==
X-Forwarded-Encrypted: i=1; AL+hErHIhyrPo9O7n5WYIXF3bEGL3pzX1ZECkhZbtpzETE8fL3s7ioUv/dTP6Pqn7FdhMfd8KLMFX/d5vq1aesM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Z3p/McwTghztmngHVQOPbWpU7cHKCfGke6bNW2KEAuqWHc9oy
	pfY5uT10kQ9bpAY4cPocNA7ttmQtOH7pjRs0NozlssYRNe5o9/EOpbQPcLX2drS8XI4v0SifJQb
	EhX9ZVDGVb/Z893sOC+7c20GCqmsFjzQ=
X-Gm-Gg: AYBFou2nYNIGBXe/SQa7T4c3+268NyYcwJHueNjds/lm3ntXn1Mfebx/4NqZOvSwWWp
	etzEUuW4AD1tD0Bom1lrAQY/uYgGhZ1DNK8Nkt0lbQCSLDiv9uu3bUu9p+vCI99UCISRgGLVpPc
	Vl0bgAvvu3Ko1Fxvv5S+FqOaoPsb0zSFOfzY8PPkWrI0WhSKRbR86vf6Gavvao5NHYqZHloOa+A
	p+fkMWfSdGOzqkS598kdo2ESmTZ7qUBMR0Wj48FKBnu4I3w/NXB1oD4JtY7dkacBs6RN10ioAzk
	0nknqTUEu4jMg/V/O/hMSHYZGhJqgNAYkWt+k8MPs4oBaUnVnI8UYPkx9zsCD8pMCTgrmlxXZkc
	3WeU9mdAOrI76HSy9g1GPfAlFX8WXung5TjWZJrsbbTZTcQT3m6/MiZYKxB8FLe+HCPSISWITkE
	yryDvGa/1jNPSn1Jg/Uf7zY7qc6b3AsNL6Cw==
X-Received: by 2002:a05:6a00:ac8a:b0:880:ee58:2768 with SMTP id
 d2e1a72fcca58-8ba885c540fmr1453882b3a.56.1794276589822; Mon, 09 Nov 2026
 18:09:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106195126.1563231-1-andrey.misyrov@gmail.com> <179408114179.994134.782467837057730523@kernel.org>
In-Reply-To: <179408114179.994134.782467837057730523@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Mon, 9 Nov 2026 21:09:38 -0500
X-Gm-Features: AclHuK9-_9zDYgYh_PNtipPEbD4w4V5_qSi5RppRmeY4tJ42ye-6FwxEoUTQuyo
Message-ID: <CADvbK_cwMN-KoELV4O3R9dMOsj+4CHpEhV1VqG-gB0KJd7CfFA@mail.gmail.com>
Subject: Re: [PATCH net v3] sctp: fix ASCONF address change on single-homed hosts
To: netdev-bot+sashiko@kernel.org
Cc: andrey.misyrov@gmail.com, marcelo.leitner@gmail.com, junvyyang@tencent.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 2:52=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wrot=
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
> - [Medium] In sctp_process_asconf_param()
>   (net/sctp/sm_make_chunk.c:3181-3183), a plain DEL-IP that removes=E2=80=
=A6
> - [Low] The rewritten wildcard DEL-IP branch in
>   sctp_process_asconf_param() (net/sctp/sm_make_chunk.c:3162-3170)=E2=80=
=A6
>
> --
>
> sctp: fix ASCONF address change on single-homed hosts
>
> This patch removes the refusal of a DEL-IP for the ASCONF's own transport
> that commit 9b2854f86f0b added, since that refusal broke the RFC 5061
> single-homed renumber sequence. The wildcard DEL-IP now looks up the
> transport for the packet source, and both DEL-IP paths retarget
> asconf->transport to a surviving transport.
>
> > diff --git a/net/sctp/sm_make_chunk.c b/net/sctp/sm_make_chunk.c
> > index 90de272842512..15c2d87575a8a 100644
> > --- a/net/sctp/sm_make_chunk.c
> > +++ b/net/sctp/sm_make_chunk.c
> > @@ -3160,9 +3160,12 @@ static __be16 sctp_process_asconf_param(struct s=
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
>
> [Severity: Low]
>
> This changes how a wildcard DEL-IP behaves on the wire. Before, this
> branch always made asconf->transport primary, removed every other peer
> address and returned SCTP_ERROR_NO_ERROR.
>
> Now the request is refused if the packet source is not already a
> transport of the association. That can happen when the ASCONF was found
> through its Address Parameter and no earlier ADD-IP in the same chunk
> added the source. For example:
>
>     [Addr L] [DEL-IP 0.0.0.0] [ADD-IP S]
>
> The delete used to succeed here. Now it returns an error cause and all
> the other peer addresses stay.
>
> Refusing may well be more correct. However, the commit message only says
> the branch now "look[s] up the transport of the packet source rather than
> reusing asconf->transport". Since this is tagged for stable, could the
> changelog mention the new SCTP_ERROR_REQ_REFUSED case?
>
> > +                     sctp_assoc_set_primary(asoc, peer);
> > +                     sctp_assoc_del_nonprimary_peers(asoc, peer);
> > +                     asconf->transport =3D peer;
> >                       return SCTP_ERROR_NO_ERROR;
> >               }
> >
> > @@ -3175,13 +3178,9 @@ static __be16 sctp_process_asconf_param(struct s=
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
> > +                     asconf->transport =3D asoc->peer.primary_path;
>
> [Severity: Medium]
>
> Can primary_path be a transport other than the packet source here?
>
> The D8 check earlier in sctp_process_asconf_param() returns
> SCTP_ERROR_DEL_SRC_IP, so this branch only removes asconf->transport when
> two things are true. The association was found through the Address
> Parameter L, and the packet came from a different address S.
>
> In that case a transport for S exists only if an earlier ADD-IP S in the
> same chunk created it. That is the [Addr L] [ADD-IP S] [DEL-IP L]
> sequence this patch fixes.
>
> With two peer addresses after the ADD, sctp_assoc_rm_peer() makes the
> first remaining entry (T_S) primary, so this works. With three or more
> addresses it does not seem to. For example, with peer addresses
> {A (primary), L}:
>
>     ADD-IP S  -> {A (primary), L, S}
>     DEL-IP L  -> sctp_assoc_rm_peer(asoc, T_L), primary stays T_A
>                  asconf->transport =3D T_A
>
> This happens even though T_S exists.
>
> sctp_inq_pop() reuses the same sctp_chunk for every chunk bundled after
> the ASCONF and does not reset chunk->transport. Those chunks are then
> credited to T_A in three places.
>
> First, sctp_vtag_verify() copies the packet's encap_port into T_A:
>
>     chunk->transport->encap_port =3D SCTP_INPUT_CB(chunk->skb)->encap_por=
t;
>
> Second, sctp_assoc_bh_rcv() updates last_data_from and last_time_heard
> on T_A, so the SACK for bundled DATA goes to A:
>
>     if (sctp_chunk_is_data(chunk))
>         asoc->peer.last_data_from =3D chunk->transport;
>     ...
>     if (chunk->transport)
>         chunk->transport->last_time_heard =3D ktime_get();
>
> Third, a wildcard SET_PRIMARY later in the same ASCONF resolves
> sctp_source(asconf) to T_A->ipaddr. A then becomes primary instead of
> the packet source, and the request is still acked as a success.
>
> Before this patch, bundled chunks in this case were credited to T_L,
> which was not the source either. Still, the new code picks a transport
> other than S even when T_S exists.
>
> The wildcard branch in this same patch already calls
> sctp_assoc_lookup_paddr(asoc, &asconf->source). Would it make sense to
> do that here too, and fall back to asoc->peer.primary_path only when
> there is no transport for the source? That would also match the
> "Remember where we came from" meaning that sctp_rcv() gives
> chunk->transport.
>

This requires a rare combination: an unknown source address, an earlier
ADD-IP creating its transport, a subsequent DEL-IP removing the looked-up
transport, and later processing (bundled DATA or wildcard SET_PRIMARY)
relying on chunk->transport.

The impact is minor: an incorrect liveness timestamp or a misrouted SACK
for one packet. No crash, UAF, or data corruption.

I'll use primary_path as the fallback to keep the code simple, as already
done in this patch.

Thanks.
