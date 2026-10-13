Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3314EDCBE
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791894965; cv=pass; b=pxmvxmfbo+KOz/f8i9Krfpxd8V3uZfgmQHPADidzCddrkUsjRsF0pKFBzdxrwv4SLMR35f1fNufKem7kW3ri52gm4LhZwliRF1Qeb5Nsrnam0rOQA4DJM/TwmuEnBwYRLsYiQq0GwYGWsr1tFQNBEino4PD7eVbaLKHmUWYl1gI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791894965; c=relaxed/simple;
	bh=KJz0ljhpxQV0dxuLmyAZzCH6KN1a+1DHS+L2+lDvs9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t/LrdKWcmYgwxxMg7VnLubfe4Uyjte0jM3xy5q8xWd6qLTQyMwJ8ruitBe/K41FZ45MEbA5Ht/P4OMJaRV/RbqLjx36vrhlfOs+ZKA5iht8PalNfhdm1KjW/Yv+EMp/AXqj++C+FyqwqeHGG/YkLGAN0vHf4WsFof4hq/IMrtyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dfwSn7zu; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=YgoLMzzU; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dfwSn7zu";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="YgoLMzzU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791894962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ooKLa1R3KGvywNv1R+3CFpG+InkWtGBVvbQRUtpRSf4=;
	b=dfwSn7zuZu81ewqBOOFI/l9xBxfYJhLUcFdAPbnSmoghiBOkFiERe/7H8aC8j/8PUFnFxh
	hUEDo/0FrspbXA/QllExBFUWPEDUX14/KIH1NCYfGCUalH8BbQhjiAXAvmcIhVnRttbg9R
	J1fIDjF29+kS3QGm0E5Cg8ZicDZJ6dY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-cwT7J8DCO-i-irx5jC5kWw-1; Tue, 13 Oct 2026 12:36:01 +0000
X-MC-Unique: cwT7J8DCO-i-irx5jC5kWw-1
X-Mimecast-MFC-AGG-ID: cwT7J8DCO-i-irx5jC5kWw_1791894960
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c2e71425f87so321546666b.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:36:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791894960; cv=none;
        d=google.com; s=arc-20260327;
        b=FL1jIhaE3L3WpysRgAHmUgy/EWYFfig/hX/OM1PutHsKHdUFF1oYQcopeOcONdbA1H
         2CDBUvw8iIM1lqe0bm03T1+xp7hXDID3vJqa0R4n5uWN7m9PkhubzrA0TMYmrmwJB0xk
         peCUhsrYhcVvvcHex4UXohVZfNFETsRe+aMnxLKxO3vJy/Nt1dZkW34itAMX8NHBsMZ2
         RtpMYg4juANZEgzIfUjKaYcRkeOnXI9Xw4KtnJW3YJVJW/2WJ/7NM0atmPMpi/FejV9D
         lqfdJ4u707GOrjaE8Y19SgjgcuWqhRrwCkEx3tcGOAi82gJcxMc1Ygneeg8PZ3D2d/nH
         81Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ooKLa1R3KGvywNv1R+3CFpG+InkWtGBVvbQRUtpRSf4=;
        fh=fc8EyH47C1XG7hTrj4T8E373nAdquhF0zbZ+wNqYubw=;
        b=mHnDThbJORaSleAqLH+1Jlec31YiDts/a7yJiJhUjmjpjqvzKRQpebmj47Jy6UvNkp
         mx/kZxxsqZePy+k3LQsrPqGTE8oAXSYsEDgN+baFxp97a5h+D+C7vsxNRESbINgFY3RY
         aPhRiD5zvypnUAUDZxg17fa8jTDA7K51qxALpupcaWRX8Dfac3RVq1R/Q+Jpu3G4qj/9
         FehCCFcgL4eYy8+lr3c9niEs6WiOU+FZ22eE5MShITWFbHzbdDQFOSR+bjrOm4NmNar+
         8oLs36PPQ0SbeLToV0Pqmx0vdDXj+FH8oMfcbSct3D9GI2n+8VcmrnypDXcWGSe3FRFu
         LhBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791894960; x=1792499760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ooKLa1R3KGvywNv1R+3CFpG+InkWtGBVvbQRUtpRSf4=;
        b=YgoLMzzUztWzAtGp2BsnHbg4p+kiT33FbX6LqK9gQMrWA1L2iCBRfHGuRar0q6PPvi
         Z+/pKSPqH9ljzJkup8+HBSxiFoZhhYF+EG9czbqjtvxPdNGONXNP8VzJrWWyK8wt1XJI
         WJmkye6UFTuSDnGTG+lWNQekyg9JvV578yJFbnZ+CB30MZKnFvJ/g2FG55n0ZYrYQOeT
         JopL6l+aVJkFYLJz1V3QLGr7MSW03SSWSdAIoUOmHauJXBNbtpwoVRzcLPZouXiBgWiG
         hACkPXzW6b5ieD1bEV21hIW1mcG/rZHsSqaWAw7jG0dKXVWwMufD+Bh/ffF5JBE9k6bi
         o6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791894960; x=1792499760;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ooKLa1R3KGvywNv1R+3CFpG+InkWtGBVvbQRUtpRSf4=;
        b=Juf0KHnBAFQTkrTADlaKdnu9n1jrgjT8TdDdbFeWei8iAO+8PxKZKBdU7IE1R1fmyW
         Hv/D1kEw5wuacUyJAL24f93vMkgbCydmymJnaSEq5gUr8cZcFt/uhVcSNfzaHFlIcrIZ
         gECnC7K9XKdgzEUJa/lPR76pk99Phcpy8dio3gjPBYIaa6t7vWiMmq1MotE4ALw12mB9
         Igt6vtme6stsnh9XZxqAUemlkllfXn1PZxqY/95nxth8oWnG6AK/jd8BrfaSxv+fMEpV
         dj3xNLoTFJXMd85Ua4yvLBW4n24yDqIN0uOMGwMXRqmL2geuPKGhcFZjhToPugnZdYwl
         fCig==
X-Forwarded-Encrypted: i=1; AKwUvBzw9JUnE3yfeBmzQXa/1lup6dZri3SmRSmp/EAGY7Ea7BQ/mmVGtjZVIaoJISGTfNzgWeMrPzlCdvypeg8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLz5rmoHSBGggz0gw1TlujNHQaQZn3jQKftS7zORDJi9Q2CY2DA
	SBxfQhkD7/ie4v2FGW9/UmYRPOa/moBYvE6jALm6Qop+N5D7goynPC8hS+fL0inEVxuVGbk6hNZ
	AxgDmh5mYkgC6ei/gtl17ROsX7NQKmfJV+ehI22MSh6wpULnd1FDx9R1re0zsn5weAR/9CBpBBR
	DAh8Z/RhvnYKFRtOuaDoOPLwoP/Vo6zbmHzKeAQR4R
X-Gm-Gg: AYBFou2XVTHWcxtYwO/oRRQT9bSRYbyxc1OCGMbiS6LLa0fgdsqTmRCve93IZrEdr42
	EcPWcQGfI2h5+7VK4rPQsEgZhK2N4mJbHzTQllrA+8ACdBGVzesIQwp3c6L+tMgMZaPGHlI1wAM
	+y+7FwCbOvlyrnlvBkWnWrtplF+PkJ/fh8m1mXPMAmOfR/avpqrMwXBafL+go9nT3fpODDma9aI
	p/5U2hKu5JKAUIADsdRkqaQJ8uq/YH88xGSXRVKUsatsx91ljLvCTPYNghAAdPpMfjXuCyKLWjZ
	BF8=
X-Received: by 2002:a17:907:7b8a:b0:c2e:1b4d:e9e9 with SMTP id a640c23a62f3a-c31a9f6ade4mr1135545066b.30.1791894960269;
        Tue, 13 Oct 2026 05:36:00 -0700 (PDT)
X-Received: by 2002:a17:907:7b8a:b0:c2e:1b4d:e9e9 with SMTP id
 a640c23a62f3a-c31a9f6ade4mr1135542366b.30.1791894959880; Tue, 13 Oct 2026
 05:35:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790088067.git.rrobaina@redhat.com> <CAHC9VhQ=FFYVNmQdiMsqg+5KDDrSC3SZS+H2=r_GkhfwQox8tg@mail.gmail.com>
In-Reply-To: <CAHC9VhQ=FFYVNmQdiMsqg+5KDDrSC3SZS+H2=r_GkhfwQox8tg@mail.gmail.com>
From: Ricardo Robaina <rrobaina@redhat.com>
Date: Tue, 13 Oct 2026 09:35:48 -0300
X-Gm-Features: AclHuK-0QABZ6yrPwALI3VDGc1f2HfQWIB06SZ96BvTfEuUJkskwg4GU5NbIk1c
Message-ID: <CAABTaaBL=TScs8Qqu3b8F6KZPGMyvwy6cBC3teDaBL6MGMucNg@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] audit: log all six syscall arguments in the
 SYSCALL record
To: Paul Moore <paul@paul-moore.com>
Cc: audit@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, bpf@vger.kernel.org, eparis@redhat.com, 
	sgrubb@redhat.com, oleg@redhat.com, richard.henderson@linaro.org, 
	mattst88@gmail.com, linmag7@gmail.com, linux@armlinux.org.uk, 
	catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, monstr@monstr.eu, 
	tsbogend@alpha.franken.de, jonas@southpole.se, 
	stefan.kristiansson@saunalahti.fi, shorne@gmail.com, 
	James.Bottomley@hansenpartnership.com, deller@gmx.de, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, richard@nod.at, 
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, chris@zankel.net, 
	jcmvbkbc@gmail.com, tglx@kernel.org, peterz@infradead.org, luto@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 6:06=E2=80=AFPM Paul Moore <paul@paul-moore.com> wro=
te:
>
> On Tue, Sep 22, 2026 at 3:21=E2=80=AFPM Ricardo Robaina <rrobaina@redhat.=
com> wrote:
> >
> > The SYSCALL record currently logs only four of the six syscall
> > arguments (a0-a3), silently discarding the remaining two. This
> > leads to the need for auxiliary records when audit-relevant
> > data lands in the 5th or 6th argument of a syscall.
> >
> > This series extends the SYSCALL record to log all six arguments,
> > by adding arguments a4 and a5 inline within the existing record.
>
> Thanks Ricardo, this looks great!

Thanks, Paul!

>
> There are a few things in some of the individual patches which I reply
> to in a minute, but there are a couple of "global" things that I
> wanted to mention:
>
> * As pointed out by Sashiko, when you were converting all of the
> arches, it looks like you missed alpha.  I took a quick look and it
> appears that it should be a pretty straightforward conversion like
> most of the others.

I've actually dropped the alpha patch as per Magnus's request [1].

[1] https://lore.kernel.org/audit/CA+=3DFv5T4826T2sd0Gbh-nfZsqcWK_phdBKy4BL=
WOvDTt92t5Eg@mail.gmail.com/

>
> * We need to get ACKs from all the various arch maintainers.  Aside
> from the parisc changes all of your arch specific patches are trivial
> (and cleaner than the existing code IMO) so I don't expect anyone to
> complain, but getting ACKs will likely take some time.  Even the
> parisc patches aren't that bad, and arguably they fix a problem for
> seccomp so that should make asking for ACKs easier :)
>
> Since I expect chasing down all the various maintainers for ACKs will
> take a little while, and I'd like to start getting this patchset some
> basic testing, I'm going to merge it into dev-staging now.  While the
> dev-staging branch doesn't feed into linux-next (this isn't likely to
> land in the next merge window) it is one of the branches that gets
> tested automatically and included in my kernel-secnext RPM builds.
> This also means you won't need to worry about keeping this patchset
> up-to-date with rebasing, as I rebase dev-staging as needed (it
> intentionally isn't a stable branch).  Going forward, if there are any
> minor changes to this patchset, e.g. a few line change in one of two
> patches, please just send a fixup patchset based against
> audit/dev-staging and I'll squash it into the relevant patch in the
> series.  However, in the unlikely event that a major rewrite is
> needed, just send a new patchset ... but I'll be very surprised if
> that happens here :)

Sounds good!

>
> --
> paul-moore.com
>

-Ricardo

