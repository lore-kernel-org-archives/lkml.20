Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794423665;
	b=xwcdMXTs3XJ90XZklgauPDP/xoy/CyWbm2KpKcdG3WhroYDVi8zLbaxtLTNhGAtzuZSH
	 3mhez5PWeFgAlBmxMKVb1i5Ylw863Kf3XAxdWgY7h5UBjTdq2kspV5apAC1R8uwL5GXKb
	 06x1+QzmD5/5eKiQQ51VzyaeIuPUrb24gAKaOT1nINku+dj70L8Ag58XRVUToS1HyCnAa
	 Ud1YgEuGdrrPzXpTd7mnc5fk8If0S46ctlmRxTs2H6gI9MlzrOZOa30K1u55x9IHN/5zV
	 yD34utZ3fNre1lmxWs29xqNPfHmJe2sfotneMhAwCITX6rzryS3f8FEVr8rIW7xK44w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FhExMibayfnhhZfuPps5vX6y0sziM39MHH7rzV1Ch6U=;
	b=M2g2d/1cqAujHusXCIhPxRXDw6gVdjEQgJdF+2AfJnaCqPpwPOnh85Ud6/TEUCBdGI0O
	 k8KZLU5DM6XRn31+3VfBNE/KDXB+UG2qmGK+snCle/EMUUElOlkFkLp0jjkIAyj0wWyls
	 SJ0CAtQzj2FR+DYv2ivsal+NtWQENzCplEGo8X9tCWLHb9cZZ89zgcaK+4XLKFgwzp1PY
	 Kk9PCaZXr1+WyAtv8lytqeBt7xczwOfQL03LK57k5r+wLjPGlAyCfN9gVix8IWRDrasK3
	 /ABhGRe00Q/MCFgjFaIhF6bMf1hsNo6keK96b0aG/TCgd8YYC6R4XZ9O5AIAb0D+2ew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DImU0jwV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B30A606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:01:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B30A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DImU0jwV
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-37071c0f42aso5952665eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:01:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794423664; cv=none;
        d=google.com; s=arc-20260327;
        b=QVskGNTr0JR2dVWnKFTHJt8zGsUSa2cRoO8DoNDteL8/7ogI9RkLepsHfxZuFDldlx
         QM3C8jbfv/gz7fLl26V/ZI0tWv+3uMraQbBWfCGGPYom0cVhLPk/ptU09jAyxSw9JzGB
         EnLDINDztV8N9ocD/wqdXVbFoqN8t4cBJCveWQNOe/ixiruoHBKNaKgENj1OsJWVbJD1
         gv/0qeqdmlQ/JqsVZ7DZp1BPN4/fMxIYSzvmTYa1lj2pslZ3pHuZnynqPHkRCRdsaRic
         eML+Ind/KI4iRd8wzmY2BDT0VMhonTMVUpUrJqPYHwJPCmKH0HzdWIQ0cp39yljz/9GX
         KT0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FhExMibayfnhhZfuPps5vX6y0sziM39MHH7rzV1Ch6U=;
        fh=aBvCcBMT+fKFyx8m+Z0g60T5ujtMWonX1U/emjzzIZQ=;
        b=ZNC+TXhE535sLsa0vXqoJ6y6oMHhOo0eRnxYDwxKNC61Mc2y/5Rn9DnjdI5J4mlwd1
         hFn0PBmsZD2a2xXjxhcWWuvlIJCe6HAv+0s07u2Nt1pvGt0fdAUft4a6j+2G9dYrbdXi
         sHYqaJs4GVQVmFlKWT8MW4exRQ5ll3639cxAiXtPinFLrDOKAlemEvne92uPW40TPWdh
         u2CYYZsm8RPnS2Hw5+lcMaG6vQtuhO7b8aCDbs1299FgYy2kVvlucbEChfGuMQwG/VHo
         97iq9+UTYkpg+xXHS9BqK3S7Tem4IYbH1n5/RcQTFMwwSlMhWnmrpheS98/kp3ZqcjAE
         xzNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423664; x=1795028464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FhExMibayfnhhZfuPps5vX6y0sziM39MHH7rzV1Ch6U=;
        b=DImU0jwVRZ0iBjCn/ZQkLB+58dSM/Q/ZXj21OcZPX/pxaNKEzvfEQkWYG3CEHRD4eT
         UDhh5QD1NU7TT8wO0nNPjyVuopL7ax2aldPc/bbRWcReQ3VMHUj0y5eKaLzaykJHpAtz
         AUdNid6qIAizZeyNaVypQMUMZ5kfFGh0i70fCsbXp/ZaYDBAAfdwlTHeNlyVGLilbXI3
         gnLhnIbUWGT3IaY2xifUvIgGylWSH4/0bMX3/6GTrwy06r4gws58PlOfKjx7QlmmLnu8
         B4/ZLNZrU0Sw4dbadUeUIxkK9EpZXTBEEKWplKLHx+ITMnw1lT2y/YnyZR+IfRCOGPiJ
         SC0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423664; x=1795028464;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FhExMibayfnhhZfuPps5vX6y0sziM39MHH7rzV1Ch6U=;
        b=bP4UD+bGo9D83tR8uXUN0i0S7vka/aPEGmISOItb5aj1GBcWYyOrkRAY2SabcmehRQ
         vi4JQhpczpAQNgie5KsKBSLfTBglHncQqwvudCoWDKBtTVGcIqOM37VZwu8aoH7zfSLm
         O+joGzgmivH9sb0BIEE+9ufg3zeYtaje+/FYuLTfYez2Mr6ngT0WcHWq7c5IIlNQA9X1
         BCZqgG1lJ+9zwNyScT4SYp6brCo4RiUyvu1HbXfYM8VylGqgKLg+je5yEIi0FvrzHV93
         DoQRk2edhIRHC6HvnbvEPeOq2lHt2nGbM6WR1KCz4a/CQwn1sAcerPrhgyL5tdgcpryf
         R+OA==
X-Forwarded-Encrypted: i=1; AL+hErEPZrVaJFi7ROhrMgVs7hHTsxB122zi0+2R+35guvIvwU/9Xl3PpgjRZeil7+Ivv4DxMs7QV4rTOHon57E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9aGtoC34stOzByvdGBy74Z5c2LhENlrlWEm7TRbQHhNLUyUG0X
	oHcEsW5na5weLFes4ev2sy8pbAxHK4Ms3K1/KryTFCj5hZJVznA6JMoTwxYVJK7e2f+hSFQiMnl
	1Nl+NEsovKF9bj3hFzgmLuVMskWCL9y0TNwNA
X-Gm-Gg: AYBFou1cqlc3+3HFnuz4/5I8T4kkLRHRfhSszXU7aJhYwUxxaqvUJVyALvhz5jTDNeW
	+ZBgRJlUoO931e1rvpiiyEOPQRV5YNSfkrFmqe8doRApAHHtyx6gybUzt6MMs3eLOn8dB/Djvq0
	coGe3jwxmuw4eWuUr0W6r8kNqGDdM2LTbZZZL9jPZTjGq6PngRM+V8KWUbTa1b/6Rn76IjCGYXS
	uqb5wAnIdeSsoKI0lgzumMVSxOGRRTG3vl6WmtxTYjHtojYvcGrxHVDDuflRQTUCM7U3GpfwKYd
	iD+nIfuIlnnYD4CTaa1BXvOSNYETqiQMo5Oi6vAthNpGGDldyC2el3QXM8dNaZ2J+FXKajaCaVI
	EEt80qrKq+95pt77s046R5WsD2z11BiE527KgScCIEbSegly+N5PPcyiE7TMV9jpo8whUblgu2J
	hg+BqrvHjCdY+wfzUH
X-Received: by 2002:a05:7300:aca6:b0:36a:15cb:30bf with SMTP id
 5a478bee46e88-3768579fd19mr5126531eec.13.1794423663932; Wed, 11 Nov 2026
 11:01:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106010611.1708587-1-lcy8047@gmail.com> <89544da0-7c18-4fe5-8005-131760a2b8b5@arm.com>
 <8a20b9a9-b10c-4b7f-8d42-2e8c60edd943@app.fastmail.com>
In-Reply-To: <8a20b9a9-b10c-4b7f-8d42-2e8c60edd943@app.fastmail.com>
From: Changyul Lee <lcy8047@gmail.com>
Date: Wed, 11 Nov 2026 14:00:52 -0500
X-Gm-Features: AclHuK-2wDvDd_YZaNx0NfT3zLBUdDhEM6_NJ0-1AP9VmFhU-7GE9k2k4Tj3_HE
Message-ID: <CAKefsHt+LO=1f_AvOmr1hpG1LreUXby_qmjhgBed9FESxgnPJw@mail.gmail.com>
Subject: Re: [PATCH] serial: mps2-uart: Remove the ports_idr entry when probe fails
To: Arnd Bergmann <arnd@kernel.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-serial@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the advice, Arnd. I will keep that in mind.

Changyul

2026=EB=85=84 11=EC=9B=94 11=EC=9D=BC (=EC=88=98) =EC=98=A4=EC=A0=84 11:30,=
 Arnd Bergmann <arnd@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Wed, Nov 11, 2026, at 15:17, Vladimir Murzin wrote:
> > On 11/6/26 01:06, Changyul Lee wrote:
> >
> > Before getting into the review, I'd like to clarify a few things:
> >
> > - This driver is only used on a NOMMU platform, where any code
> >   can write to any memory location, so the security impact of
> >   this issue is likely minimal
> >
> > - The only platform that uses this driver is deprecated and
> >   scheduled for removal [1], with the driver to be removed
> >   afterwards
> >
> > @Arnd, could you please advise on how to proceed? Should we
> > review the patch, leave things as they are, or take a different
> > approach?
> >
> > [1]
> > https://lore.kernel.org/linux-arm-kernel/20260908152808.3928630-12-arnd=
@kernel.org/
>
> I don't think it's super important, either applying as-is
> or ignoring seems fine, just don't spend too much time
> on a review.
>
> For some of the platforms I'm planning to remove it would
> be nice to backport fixesto the LTS kernels in case there
> are some users after all.
>
> Chanyul, it looks like you've done a thorough job testing this
> patch, and you probably have similar work for other drivers
> coming. I would suggest you try to prioritize the drivers that
> are likely to be in use somewhere.
>
> I have a branch for removing a lot of drivers including this
> one, maybe check your other patches to see which ones are
> obsolete.
>
>       Arnd
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/l=
og/?h=3Dboard-remove-7.4
