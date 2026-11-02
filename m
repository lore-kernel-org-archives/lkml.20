Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793658192;
	b=E3XqsM+TOuKsWzJ29FPnwp7lP6CPq4RFRUbYsqTaprQnLtYK93hxgloW4ePP6gH56sHa
	 vdtwQT36cDWRnntTVEz2MF9e8dOMMNR5eKEaPt54MjAO9FIACbRwRKZVzYQzj8UAtIGXH
	 I+p87Q7Hi71WOtqm0GkKaRtlfGKxdkDd5Ve4qSNypCEjU11T5B8dX75S2k6VTm8+aWO1V
	 VUqGq5TItrdq1rdL9KyuJt6c3LY1WOGaY93BWA3Ctn8JT1Mv2IcZW8x06SQ+bhDG/YzWT
	 YQiNME/QzRJflbDZHXXDKKVlqBQzg8tZKdWJ0Ru4T+4WD8RBm8UwGxzkBlFjTii7vjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793658192;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=Srq5bM4JSJDOJRn0G0Ykn/jY5yw6rK/skZ/5tb3CWkg=;
	b=ABJzWLuX4DNCLtncRvSuYs4iilsRV7f9BWF3qCi0ewfrIex916uVvsrEbnH4ZGFN6rZh
	 EcVB+gz7xuZF5BZq5WbzhU81ifZ68wTTLiBgaCmTxb9QS9OkDEzeGiMicaNG1ACLbu1XX
	 He5oq9/Xct+Qk2tGIGxURDsQ2j6g9QtYhPFgT1W23gXf8U7p/QOqrcgKWUg01ycoAV93W
	 dOFQOs5c0wN1aTZelofoNwz3IqzeuFZnBRHFEXscPbvIwWCGemtaKv7AUtqvqWxYqZIpG
	 oWWClNKVidwxy/Z4EtDJ/Tu4LC6+VCEhyHyCuGhlJL7aHLe7q+PMB/pqQubH9Tu2v4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PDAHr0hs;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="IxXs/gxy";
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C938606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:23:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C938606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PDAHr0hs;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=IxXs/gxy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793658190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Srq5bM4JSJDOJRn0G0Ykn/jY5yw6rK/skZ/5tb3CWkg=;
	b=PDAHr0hsqhKjeM6A0awidP3SE5/Vcun6wdvoqp73a4DcgcUtTXY+YdbxdTYq8LYsGHU8tR
	uY1mbVNUqDn01FD+f1bha/Fgwurhag7GZ4ZmlLwfaFHfExazRmLvFyugP7IdnmJXidX2pz
	qV+wtOx2Z2skNemqvpsLzaMzVkndWEw=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-qZLWE_MjMUejyCH_GjwUTg-1; Mon, 02 Nov 2026 17:23:09 -0500
X-MC-Unique: qZLWE_MjMUejyCH_GjwUTg-1
X-Mimecast-MFC-AGG-ID: qZLWE_MjMUejyCH_GjwUTg_1793658188
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-3ab42f480e1so13427501fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:23:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793658187; cv=none;
        d=google.com; s=arc-20260327;
        b=SJMvqljoVVj1rAkJ1vzlxo7YDUHUruwPFBH3Q59XsJVDsU5LnRpGs8Zi62PGAcbKZd
         qpfeGGSrHJGFa8LMy9djvoHexX08R9CdtFRyAvHY1lBmeUxD/W+iHggiaW/H6blXSMtu
         X2iP9cKzllxw3NoYmaSULTgCHcVF5LYowYOnpJCxMuyMl6K7ss7R4qw5a2WKUhbNhUvs
         vDbgUzGOf2j4u8wxEeoYWL5VaA3IAtDIeP0Kl5CXmfAjHQgA/562WlVHOZX9zDdZpsxu
         H4AZtY5os7ld03oV1Is7hfOnaoPn3BpnbspdF1e9xSpr9ljfSik66BeqyrIHt5fULn+Q
         aKnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Srq5bM4JSJDOJRn0G0Ykn/jY5yw6rK/skZ/5tb3CWkg=;
        fh=fGRBhl9O7xt9BAiPmV5lfziPLOeWCnjkXwSAgvOg5uY=;
        b=pzB2AuIsgE8UNshO9MGFqu0qV5RaEQRa3m/DeEoS1XxjAqV2R6PFZArYho15730HUi
         aeuN8aOqUgGQ0sZ9JiLgqDmErZW/IJmN2guExZEy9BQrj51FZI08EBrxKtkILd0BAzH0
         Y139EBiIAvdpSeMl5PIQoOs00cCoFcOazsf3/h+CJVkKPNtn4xzA5VAS0ujvxHou2Se7
         /Oq3nJR0OTEHUS5t1CqDEvyEQ0eK36kwlArATy/yBD+6XPDMLbqHPOk08O5pF6L1XUve
         NTq0ch6AE6zGwMsukX7TPoHo8bXISVdH9kqOHBTjRBdUj31gIEVh2cxyD5fTEYWzhC2Y
         PmGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793658187; x=1794262987; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Srq5bM4JSJDOJRn0G0Ykn/jY5yw6rK/skZ/5tb3CWkg=;
        b=IxXs/gxyHc5vVEEWzI0aZQHxtCeVWykpgAk0t0M7LexA1HhpBUrIBpi1tYhrW/87CW
         Z1/z4xeVp0NCj/JIr6wVgCq8K2B3Wx3BWCnAdgQmc6kucXCFSpeIqm5JHPoPazJSQIh0
         nS5jhwZHAdF7JpL7Qo+DUPD8k0BOiZICVVLQ1sovsDGK+VLvqwinxtDOKqP5yUf3quFf
         DHIL5gLOGgW+arc6/KAA0hsU3SVAdTohF2qj83xhckRwPYCi37vIJFn+tW8gIC61kVVo
         NQMum8PeDb2k3UDypzd6Q36XWQgKc0F21bY5RK7K0Tff0je6I8slcsbbdZWhn4Xdnqlp
         bTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793658187; x=1794262987;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Srq5bM4JSJDOJRn0G0Ykn/jY5yw6rK/skZ/5tb3CWkg=;
        b=UJuT07QoC6aqNN9BS+FErBEc7mRjo7hTCKtuMtP3OnvbMmn5+p2IuCuHwta3sXDUK9
         CVPtrMuRBa6Qr8c/cOmJCKGQV2zT+27MwnCX68wd9e/4+izqvNZxs/bGDeo5w6YPgz0M
         XuEWckMlpPBJHfJNZOY8cL8ASWPuaNkR7LRLNKnUNMHalirUVEdBlNG4bTyiI4uRgtQK
         c15PSO4UsDBXVPitdrEHJdT1ZV+cHupOzQW3a6Jl3k7dgA7JxdLA03ZoFHOseimPIkC5
         9bGTzyDUq62rngiHPro8s1ETkwpqjbb2ezNeUBPD6nou6/bUYxPdZRChuF12Aw1UqnsH
         Sf3w==
X-Forwarded-Encrypted: i=1; AKwUvBy0fxMPwXoUHLzRYocbhvQjYO2qWfDuUpF/nPho3gwDEoYFrsAbSvIzq2+tvGdLVW1+NkmcGTfDWJ+B6rs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jiySTYhTFxGmp4YvylWvbtD7xNvaMNsJCO9B9Vu77T1l/Sq6P
	y6XCuuqHOZ8IboVRRpsErqR2v7L2mw1rs9UgSlRKx5FZFGdtWWUJdYGB1m3ms6waGZuC7dLZ7pN
	w9VyPTpyDk2AHbIgnvuDLZ/USkh1GzU1pDkF+umEfjosy9OUQHdFp1wUTHEy/M9R7duamgw3xNJ
	CsGaYTLjeEgAm8/BUWZhU/m6DBl4XUm5jS/EzVdC+3
X-Gm-Gg: AYBFou3RdBhIeYABJHqQCZsyuoPwrZYhnjqfEwb+CNAoq36bNdC/2PjO7HyM1zcst8Z
	6TA442odE9bwnGKZ4lQ2Um2MCbPV509d6ZTt6F1q8NmQPRu+nLfZSG9NifhITK8+hCx3rGWzbnP
	ZY7V4tcKPEVGoAhONnFFRd/o+szM7zEPTImOmO2JI/9NcCslOiGGUiSm6n
X-Received: by 2002:a2e:a988:0:b0:3a9:bb20:27ca with SMTP id 38308e7fff4ca-3acb7aaca8amr28812981fa.27.1793658187668;
        Mon, 02 Nov 2026 14:23:07 -0800 (PST)
X-Received: by 2002:a2e:a988:0:b0:3a9:bb20:27ca with SMTP id
 38308e7fff4ca-3acb7aaca8amr28812941fa.27.1793658187250; Mon, 02 Nov 2026
 14:23:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019151627.3324886-1-ameer.hamza@truenas.com>
 <CAK-6q+j64=mSzuufOaSGjsC2aSwhb0hs9MKxxaAhbwugdztHZw@mail.gmail.com>
 <aujr6x9t2gXbXfFw@hamza-PC> <CAK-6q+jBNKN=oSCmm+i011FdhPS+42BZc0iUfbqGiLDBc0Py5A@mail.gmail.com>
 <auj4LE0bq7w7lOF8@hamza-PC>
In-Reply-To: <auj4LE0bq7w7lOF8@hamza-PC>
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 2 Nov 2026 17:22:54 -0500
X-Gm-Features: AclHuK-jPk_10wd7dw5HRXH6KuFHPFe2h1VxKPzJFXDKCKLHQXwWBWUxRIFhqWg
Message-ID: <CAK-6q+gqM6O4h762H5NVJ_B==VL2zaBVTBDiwUdbf5zxGNEDsA@mail.gmail.com>
Subject: Re: [PATCH] dlm: don't set RSB_MASTER_UNCERTAIN on rsb with no master
To: Ameer Hamza <ameer.hamza@truenas.com>
Cc: David Teigland <teigland@redhat.com>, gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	caleb.stjohn@truenas.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 2, 2026 at 4:03=E2=80=AFPM Ameer Hamza <ameer.hamza@truenas.com=
> wrote:
>
> On Mon, Nov 02, 2026 at 03:38:12PM -0500, Alexander Aring wrote:
> > Hi,
> >
> > On Mon, Nov 2, 2026 at 3:03=E2=80=AFPM Ameer Hamza <ameer.hamza@truenas=
.com> wrote:
> > >
> > > On Mon, Nov 02, 2026 at 02:49:04PM -0500, Alexander Aring wrote:
> > > > question:
> > > >
> > > > how do you "pause" anything in DLM?
> > >
> > > The nodes are VMs, so I freeze the dir node from the QEMU monitor. It
> > > stays a member but never answers the lookup, and after the cancel I
> > > evict it through configfs. That is what happens on our HA systems whe=
n
> > > the peer reboots without leaving the lockspace and a pending request
> > > gets cancelled before the peer is evicted.
> >
> > Still, do you just randomly freeze it, or do you busy/poll wait on
> > specific struct field changes?
>
> I don't poll anything. The peer is frozen before the request is made,
> so the lookup to it can never complete. Then the request is cancelled,
> the peer is evicted and the name is requested again, and it asserts
> every time.
>

I see, do you use dlm_controld/corosync as cluster manager?

I would assume at some point they should fence the frozen peer.

- Alex

