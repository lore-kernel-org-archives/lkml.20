Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BFC41DEF7
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790279183; cv=pass; b=TbJIu7QMO94tChbNhD9L7nvWpjbRTQohhJyeqURjBepKsuM104o8nduMgDALILUO9QJUccraKsaWaPacN8cvqvRE+WZT029gi+K6Duk/utWA3nq4g1h9QuHHmmZWQOhSrJL5hSvxmDRen6aib+qaW8kuOZ6DaOoBz/d/sxrcjpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790279183; c=relaxed/simple;
	bh=cWBBE5NKGRnMa1w/IhPdQbTbTPbXKFZ24GCRjXXb3gw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Izedyw6XVIfA/e1c+Cbhs4FmvCK2cimKBW3RFp99pvZvcsUy9t89G0VE8cNjhrfpTJzgPzondt3/wOrmZV3oVctMg5IA4IX/q//nAkESknIFl7wenX869bwgVXQeepUrRN3GP51jIRaVkYEi3GTPgtDGV/FZyih05CvyJtPzltA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cellusys.com; spf=pass smtp.mailfrom=cellusys.com; dkim=pass (2048-bit key) header.d=cellusys.com header.i=@cellusys.com header.b=aHbPOj0F; arc=pass smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cellusys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cellusys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cellusys.com header.i=@cellusys.com header.b="aHbPOj0F"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a3156692c6so938471fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:46:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790279174; cv=none;
        d=google.com; s=arc-20260327;
        b=gIFlFskKBKFXuSZ/ykfIgjAMFXcM2P2S54LXDvOIWmIuTZ5LsHxX3djkRimQkSjTH6
         DO9Rh1StAxmEqN1OJ3e38f7VBz0a3a4voICLzuA8TyymY9IEOlLVbKc6YTyB6ujoJ/8w
         Qg10s/cmgIui4jZvKNzyw/KUcUw8OTFa7n+qdJh/eal65EuG5DOfTYt+aZrjdm4PO2Kb
         babc3f8wEmG6luvCsWQJLf5Jy5uYknhLE44qAf1ZrdzMqdsP+FmvMU1lKpGJRX5iuBF4
         /ry9MmzLB7wTYfrKZjx+kcCRH8+/vou6EnIZVxqgoohoF91AleJYlCJl5F4LfGuXgJXP
         /NxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1uYTjFCSvnfULFVrptjRLphPX1S8KB2IOyYhkGGsRus=;
        fh=z1apUq7QEzavzOynSZs9ULSesSO4O2QWl4ZSWwMaaOQ=;
        b=pGKUBV5i6KSvaEEgxeBxDjusmLy/XxmR5aeF79NS4pqX8lOnI5gkLV7x0PG3eIR+Dq
         1KWSbbEEZP/+JbYzdcBdJVW1HoXHMux86HICDINxP/diWSbSYGn2XAA+9fcrutiviR8/
         8hRDIMGjyRRkJVK1or05grSBfal6931SUVNyMYuKrnhteDnKHu1h3Xp+3wY3eh3VU8/9
         cZGODcDDS66FvwYn3DjxlHZnBU7O/HoUGQLHfuK318kNQ3p5j4O1fDt9roDJoeYPClKA
         w3qluFa0xceYA/Wjp8/icMe2RMomrg/vSHYTNoZKBDnxDA7Q77vOcnLwgUMPIUFNwBZB
         Mc6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cellusys.com; s=google; t=1790279174; x=1790883974; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1uYTjFCSvnfULFVrptjRLphPX1S8KB2IOyYhkGGsRus=;
        b=aHbPOj0FgZOQf2zJwspaBZpbo/FoV6n4/YRL/WexokbtU8FgdBWezDNeOsoUd7dGoO
         WUlRIW62fcEd1xgbE4luXS9MFUdjLoyLOqncU0BC2WhsCdCHYXJYEWMJz85i07q9tiUw
         xHV+ZSiRzaMgrJ6iGtaOccIV169UyEqy2oevEg/iGEHbviBNtQQuNJDj3uBehywvttBM
         wSay2sS5vpKgvyXVFG+sLDlldMZ2LZSGPQ5H9fNBAuPVIbyR+qKT8fpi3Yp/RBJuSQTs
         YAjmcXnwvOjU3KNEG8A3OQtiI+2DcjXnAkZgEU345mJep/lz/P1G7JXRHWc+YGrCm2L3
         zo0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790279174; x=1790883974;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1uYTjFCSvnfULFVrptjRLphPX1S8KB2IOyYhkGGsRus=;
        b=wgIX09wCrsWGzeXzIbqhaeqWHfxcgWveHsPslAn45TFTETzLYQ4USmMg0TypWQvoMs
         rXYZttSasGssghxSO2McR9B2gT/qt66Z4v5TiRiLdiFVqZUoYnQKTdUu+58nNUy3SnP8
         T97DFFLDonEagmZGu59tO3tiamYH0j6NXW5zCyfPZdvklk9GlsvowIsqTV+VFcKHIbIE
         ztx+iHfcZzZ4LRnKuXtB7FwPMZ4h4bLclwF/xsdxp4Xwk4aQRmGIOTnXk2l0gsMuBF/T
         a1koGvV5X0TDt78qat8Ikrg0WTXq6KEzhmkAZqBCsHAx0vvL+xSKuQIToaVlHRVFsH+Z
         7qXw==
X-Forwarded-Encrypted: i=1; AKwUvBxcIcr8SiH8anZBBz0IweWO9vf7A3kH803/1CUyvyCOTs+YIItd4vQR7kfjTWWWBED6NpjAw+i1MW0l+L0=@vger.kernel.org
X-Gm-Message-State: AFuF++mvLmoZ7RISlpyqvh6Mq+UYzAPcIM22csCKwO198G8JnPeNgI3R
	oO26svFMyLnWULP1kAdAYq9jvC49uVNKAg9RK0LTCKtbYMD5X4TZGTWPZUTSKaiqI0iS57rMybb
	pYabYZoaQ1SxjITyC8r/AyQYrGNx8fQZhHciZa+hkmA==
X-Gm-Gg: AYBFou2UqVOpW70Gkc2z6ZL0OdxriQizL5alI8CKP4EciWDS+EulJnR2XvSfr8xWqkc
	PxKGoQFCAya8qEdiJz3m6n5+J94YkZqhHCJIcpm0Pb+R+FOhOnhW5f5JdyIBK+kIuR2lEp0C8SN
	WFBYVnAUsjv4xJnlW/s0uGV2b7zVjyizply4ISizika2+ENCD5IGzPcEUIvw+QzRcLqmQgD1j98
	es5RBRiKvdIm+83H+/jAAhIXpPX0jRhbHAZkq4bzoYmQiCJ0y8f9E5Bw7WzSEj1ctQIWVWztA4N
	GavZsiz1zBzjYk6iu/bwwcN4irJzLoLJ8kC1vSNRE5DBIDXQ4TcrYNMo90yi90reEQ==
X-Received: by 2002:a05:651c:54e:b0:3a5:f982:9c92 with SMTP id
 38308e7fff4ca-3a63c061c09mr8269281fa.7.1790279174670; Thu, 24 Sep 2026
 12:46:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921135733.577647-1-wbriggs@cellusys.com> <179021514567.2160803.16218616091479610626@kernel.org>
 <CADvbK_c2P-qxJJ3sCDLJMpCQ4g6PaKVN3kiLTiXYx8UREmCZWw@mail.gmail.com>
In-Reply-To: <CADvbK_c2P-qxJJ3sCDLJMpCQ4g6PaKVN3kiLTiXYx8UREmCZWw@mail.gmail.com>
From: Warren Briggs <wbriggs@cellusys.com>
Date: Thu, 24 Sep 2026 15:46:01 -0400
X-Gm-Features: AclHuK-O0oW-wMX0yMzGjTG_pFHVFuxMN8-cHfLCwcd4-GHCZmAeQO04RntgfNM
Message-ID: <CACjaXw6eEyjeJ3YS+b-xQr89QDRiQVdD7fKH2OzA6V7SQkBo7Q@mail.gmail.com>
Subject: Re: [PATCH net v3] sctp: carry peer capabilities across an INIT collision
To: Xin Long <lucien.xin@gmail.com>
Cc: netdev-bot+sashiko@kernel.org, marcelo.leitner@gmail.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > The testing notes describe ASCONF and RE-CONFIG appearing on the wire, which
> > exercises the outbound counters (addip_serial and strreset_outseq, both set
> > locally from asoc->c.initial_tsn).  Was the inbound direction tested too?
> >
> > Should the merge also carry strreset_inseq and peer.addip_serial, or
> > re-derive them from new->peer.i.initial_tsn the way sctp_process_init() does?
>
> Makes sense, please follow the suggestion, and add something like:
>
> +       /* Re-derive sequence counters from the peer's Initial TSN */
> +       asoc->peer.addip_serial = asoc->peer.i.initial_tsn - 1;
> +       asoc->strreset_inseq = asoc->peer.i.initial_tsn;

Will do, placed after the peer.i copy so they use the new Initial TSN.

The inbound direction was not tested on v3. I will test inbound
ASCONF and RE-CONFIG on v4 before sending it.

> >
> > > +     asoc->peer.intl_capable = new->peer.intl_capable;
> >
> > Would calling sctp_stream_interleave_init() and sctp_assoc_update_frag_point()
> > on the surviving association after the copy address both directions?
>
> Outqueue may already have data at the time, we can't just call
> sctp_stream_interleave_init(). Let's drop the intl_capable update from
> this patch and address it separately in another patch.
>
> You may add a note for this in the commit message, so that the AI review
> won't report intl_capable update missing.

Agreed. intl_capable is dropped from v4, and the commit message says
why and that it will follow as a separate patch.

> Please address this one as well by adding:
>
> +       asoc->peer.adaptation_ind = new->peer.adaptation_ind;
>
> either in this patch or a separate one.

I'll include it in v4.

v4 to follow.

Thanks,
Warren

pw-bot: cr
