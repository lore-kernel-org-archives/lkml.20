Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792681528;
	b=n3UI7zCJtjf/VbEdIAp5g0e6bn+Bh8M4pRig5kTsZXg/ZR0QEOHM95oHolp4cIdMwSVW
	 G/PgdUOWCmHwPB5H6tjViFC1Ph73xz3/KtxwDdrhmDXxcs7aoKtGGb8vHVLDhKnq/+YJJ
	 ICAkCbDWQLDcP1mDTcJDFR7zU+YZENKwyv/6RpORW8sr2G0qfT4t6AKs0H6xmr6MJQ71f
	 dzA3PwQ6exIbKW2xfO0xC/1+IkCdmggo+029JJJ7+RY/ubtKmXBmJgeEkrRzQFR/rc7Eq
	 MgFsQJdYhVLhojgi0cslc9npU4EXGVX05Iy7ERnogP8WPBmFq63AKe1FcAvK5oPSfSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792681528;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=mHIYATDN2KrkydKOA/m++sLO2Tc2mh0OXohgIjQvZoc=;
	b=SVXpzSCdasWCdltwUpB7L/t3cmY4OmuYQW2D5Q/aJwzgSxjWugfxeUBK0istyrD/G935
	 fHXGJ3bKnzcMHQWq+wxc06+td1bVrP/sYjrjsBEO6sTD2xlAF4xBPljr44KLMb4ebPfHn
	 VKfemu9HYN80rJqjHdijv9C4x8+7KpveXkCXsHpUuUtFCgRQP8OlcbsUl8B/eYsY+dlZ0
	 Vv8bt5jUITiANwQ6X3PGCZkdK2VNSjKvKi19xiemV8VBaOfZCV9VP4fdxKWTQ+L6UlYHe
	 3XYKwPJ1llGMJoxzWFtwuLSXSTeLUEHcciux+IJLNX/Qy5rdnubeXAHche7H1mzHE4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CBYMRvQe;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=BHv40pAz;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B943960A3823
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B943960A3823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CBYMRvQe;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=BHv40pAz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792681526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mHIYATDN2KrkydKOA/m++sLO2Tc2mh0OXohgIjQvZoc=;
	b=CBYMRvQe/UomEE7KxpIXNrHpBZ7DiK/Nl4JdYIB+MY3CIBJTEZ7u0OWAuBdECRH8hzyp8S
	cIsgdITt8gR7mZuVfuihwMNL3smBUOSzgDBBIcRZQjwRUtd0OCuOKQptFybpXNwia4bkEp
	pUvdJRV867rmmodKdM2+zJzreIDGBOw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-3B_mUiVHOpyUFvj4ncck-Q-1; Thu, 22 Oct 2026 11:05:25 -0400
X-MC-Unique: 3B_mUiVHOpyUFvj4ncck-Q-1
X-Mimecast-MFC-AGG-ID: 3B_mUiVHOpyUFvj4ncck-Q_1792681524
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48c430f0f01so1688169f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792681524; x=1793286324; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mHIYATDN2KrkydKOA/m++sLO2Tc2mh0OXohgIjQvZoc=;
        b=BHv40pAzNDQh3OUNs68BG/P1mOww7XKXrmb/fJKDIzG2ipOZ6XVRyJDGT5CZWz5xYG
         gJCnfy38BKpI9PKfdB23Omv0MB4FD5c3uaLNrfcb6fxfWMUmqTBBFNYIAUv3oq8+cO35
         BV6gHrTy8+4JLQY9usqM/Ura142d4yYYC9mMyXb4YGZZwXof0lHNdMkqbEklPfAR1d5Y
         KxekEcTIOrCUJxPdvDYDq9+RFocLRdtfFzdmg+A81G+R6rtkaHlLGm6qLScMx2gan8FD
         FKmSSbrL7cp00+xJgoVXPyynAs+FAIrsG7GuE6B4ebRCy3AU7EH7iZG5CCjxpMeSBDoo
         WwfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792681524; x=1793286324;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mHIYATDN2KrkydKOA/m++sLO2Tc2mh0OXohgIjQvZoc=;
        b=L9Oq6PPCE3+oPHlqv7MGW8Vq9UKJ4MJT/8EmWo00eZkwK0rPA/WLEQLCjM0hCzTW3n
         IjtNFYdpxgCvf0oEyQ5a8Z9+rt5VwNPlXuiqFFxNsxq9n8rM/x8uF9ALftv6mxaOIKTn
         1Ux4/ksul1+nq/AI3mX8l7ZZB6kUZpgOyFNP+t+rLImcN59gIR9iuuxiIPTgjduRbFeN
         ceX0qvAAcoQKVCkV3Qqz/JCfUQGmaH/MGeW/DBV45j+n3hjTWnwfDEzF03fLMlALS7jm
         IquzQZZ81jotFBprGr++yWMmSjEG0PDuL9ihk+AVulV2DLKqxAEgBk8VAjPJLBgZeKOL
         ElcA==
X-Forwarded-Encrypted: i=1; AKwUvBwiMHKaIGqTsRR7NZqko8dU2ulSP+JkNxJXbWwI2PVtxLDHLH99/YpdwBJgq9ETJ+bqVu9gPtYalbIPKR0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFB7aBaTT22OiQj2YntvJqBGEAlxZN1i7OAHEkx1gsPajQBgSb
	hQB3LorQ0wCAUBb4OtJfRJLhRuvScn66jT5HeuShLKOtsPzYIfzkoXEzPsHfX0YCaw0t86Z0YgE
	sM2UQ1S2Cz4Cpa9MuFhRgyCkbc180oGc4oxYOCqruLPd7xZZAftciu6Pmfk0vtjLMJZRdcB4VnA
	==
X-Gm-Gg: AYBFou1pe1KU0Uzhl+4ijxAQodjyo5wdednB777gDEhhTBaSRI5BE5X3DRlb6yu3vn7
	L14TZWAZz+Lr5zB46vAVRSqROrVmekA2YV4wBUnHq3Tq5FtbpTNK5FYga0Th8IjbIwUt81FtmUS
	QBhCfeD+64gJy3WrF8RspwNTpkctsqjSM22ltbe/WEjWup4z4C7OfrWuvlQ/eO4gs5cdu7VaAi3
	zVnFQrdftuHm14Feahkx9xtTrCmfrymXBBYpmIWem9H2pxUYl8Q4zPKfygIdSQ5vwCCYRTkpWvG
	/dBcJb7TV95Vswy7FAcob1mskkP9/SUPsAMDiqTZOxZnOSmRsnfi2MA/VnBwzM1Wylw=
X-Received: by 2002:a05:6000:2c0f:b0:488:7b66:140c with SMTP id ffacd0b85a97d-48e26494127mr10574598f8f.28.1792681523904;
        Thu, 22 Oct 2026 08:05:23 -0700 (PDT)
X-Received: by 2002:a05:6000:2c0f:b0:488:7b66:140c with SMTP id ffacd0b85a97d-48e26494127mr10574548f8f.28.1792681523470;
        Thu, 22 Oct 2026 08:05:23 -0700 (PDT)
Received: from localhost ([46.6.57.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258420e4sm12200375f8f.49.2026.10.22.08.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 08:05:22 -0700 (PDT)
Date: Thu, 22 Oct 2026 17:05:21 +0200
From: Albert Esteve <aesteve@redhat.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sarannya S <quic_sarannya@oss.qualcomm.com>,
	Pranav Mahesh Phansalkar <quic_pphansal@oss.qualcomm.com>,
	Sudeepgoud Patil <quic_sudeepgo@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/4] soc: qcom: smem: validate private entry list walks
Message-ID: <atomMZYbzh6phIFk@aesteve-thinkpadp1gen8.rmtes.csb>
References: <20260924-port-smem-v3-0-fbc2ea81a654@redhat.com>
 <20260924-port-smem-v3-2-fbc2ea81a654@redhat.com>
 <a966fe74-4ad7-4212-a164-f9f6fe225dd2@oss.qualcomm.com>
 <CADSE00L+bJoy5AYYB_0PuJE0NEs-_=y20kDUzPkA=sdD=APs+g@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADSE00L+bJoy5AYYB_0PuJE0NEs-_=y20kDUzPkA=sdD=APs+g@mail.gmail.com>

On Thu, Oct 22, 2026 at 10:20:05AM +0200, Albert Esteve wrote:
> On Wed, Oct 21, 2026 at 2:39 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
> >
> > On 9/24/26 3:10 PM, Albert Esteve wrote:
> > > From: Sarannya S <quic_sarannya@oss.qualcomm.com>
> > >
> > > When walking private entries, use the uncached/cached free offsets as
> > > the list bounds, require room for a header before dereferencing, and
> > > reject a next pointer that does not advance.
> > >
> > > Skip the cached list when the cached free offset is at the partition
> > > end.
> > >
> > > Signed-off-by: Sarannya S <quic_sarannya@oss.qualcomm.com>
> > > Signed-off-by: Pranav Mahesh Phansalkar <quic_pphansal@oss.qualcomm.com>
> > > Signed-off-by: Sudeepgoud Patil <quic_sudeepgo@oss.qualcomm.com>
> > > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > > ---
> >
> > [...]
> >
> > > -     while (hdr < end) {
> > > +     while ((hdr + 1) < end) {
> >
> > This will reject a header that's at the tail of the buffer, need
> > to make this <= instead
> 
> Roger. This is a bit hard to read as intuitively I would have thought
> end is the first free byte after the last header, so `(hdr + 1) < end`
> should include it? End uses `offset_free_uncached` which should be
> bigger than `hdr + 1` and it would not miss the tail. But being
> defensive about its value seems like the right call. I will change it.
> 
> >
> > [...]
> >
> > > -     while (e < end) {
> > > +     while ((e + 1) < uncached_end) {
> >
> > Likewise
> >
> > [...]
> >
> > > -             e = cached_entry_next(e, part->cacheline);
> > > +             next_e = cached_entry_next(e, part->cacheline);
> > > +             if (WARN_ON(next_e >= e))
> > > +                     return ERR_PTR(-EINVAL);
> > > +
> > > +             e = next_e;
> > >       }
> > >
> > >       if (WARN_ON((void *)e < (void *)phdr))
> >
> > And LLM thinks should compare against cached_end
> 
> This is preexisting but I think the LLM is right, and it matches the
> theme of the patch. I will change it.

I've sent a new version and Sashiko still complains. Maybe we can just drop the check?

We can continue the conversation in the new version of the series. I wrote here because it had the context.

BR,
Albert

> 
> >
> > Konrad
> >
> 

