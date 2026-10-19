Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792439596;
	b=yn+59mmO0GjBvQ8RUzCQMB/O+cl1CX2L2dsRqWsyJMllht0TYBdeLNgJixuKWph1I8I/
	 uLqkULmyaWe0ECp9aRfdxa8jyT6SbKzCBGbPGmU40wwHkFEQ9Aa9r460GOpcqZPZk+hXr
	 8r5SJyF/iWORSiYmlAyI/qVmu5Y6K43attXkax4fA76qKs59C7elo7KdrIYpLocpDGKXe
	 AgJLLjxRFK3APsvBR9s9juGNFDqqBsk2oA2Zj0lEAea+NjVeevn/Ig7Uyu1+P3Nj7ovRD
	 flv7BplBluJ2hGyPJj3TdElU6n2vp0avyYesHLVWahguSnKRXEN3DiZGdaBZUkcmEIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792439596;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dyY7JNrqiai4abS/gqtvGdCXTYu9bu6Za3R7laojQRg=;
	b=d+nf/BsGSwjxj4qQhBqQYJ7+zw8GPG4XPSjBwUMcsIhRei9pdcVG8OsfPIXYKVLzGuYv
	 j/R+mhMdyZDh/0GTPawDOSi3yYEwzarBwUMdUyFHPng7PV7d7iPOb6esG1kl8qUuD+Xnk
	 QMU9rgDVYV77i7dhlEAhGpr2bqZlB8QOpu6yiGWX2rzffFLPjp66VbiEDhkXpRdEbNeCs
	 sfVkNBeg2i0+qDjT2jtGgg8asFqsxDidlUM2xwFe1EdZOGLJ34ajulBJnWmBROsJ+7FQh
	 wOhvEcmKIi1WuRNUqR0qaOhzWxDWQIKfPpHjQ4OAzm990X7Mm1YxNsy47jM7O52xIkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JNwZmfob;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF14606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JNwZmfob
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A4DD1F000D1
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792439596;
	bh=dyY7JNrqiai4abS/gqtvGdCXTYu9bu6Za3R7laojQRg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JNwZmfobCYy44kF73fLPY3nx2mQpel3uc8oCw5yPeblOK9knkM7xVo/+J9D8Iq7bu
	 /iQPRLEf22B1WMVJG4qUjLLweblmu2RuVgTpQUS1XILp4cAzI+lcyrtvezARBYnkoO
	 PrE6DSv+IJafrFiSHGYTBNzfB2MbBNAs/N8BU+axmotJzpmeqs104le2tTMJoeHeVp
	 1xuj8vb3rCtxQSkiIfEALrtAXehbiavVBYVjxb62W2RbsKO9mmx+2HOSIQ78fhyDzB
	 mJmZQgH+m/0TWSGP4EDkA08nZl1EVzRZrtqMLivYRhtmHtTsTNdogjD0dleMijjE4d
	 HhdwzF0pz/7xA==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2afa22e1dcso384891166b.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:53:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByOMLr0HBa3O9UkjB8Pflwv3jVGKH2vYOLOaWkVH7P0SzNj5y1TFAyfJmbgLlrAIjqplGHKqjnS9VPMm/U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIp166YB2r1COwKSmGcMLa+1sY8wz4AbAOqYBdmjeAmn3ckKHQ
	B/kijwQgZ3ONzY3v8dY6OlAyJfvXS44z/kjtHfCrveolDErnzoFp0/I5OdlRCuDlYII/qgLXUKU
	NqNXyTedve0bXrgAyBZSvZnBIVionE5A=
X-Received: by 2002:a17:907:9346:b0:c41:8e21:4d5a with SMTP id
 a640c23a62f3a-c4199c63959mr703570166b.5.1792439594928; Mon, 19 Oct 2026
 12:53:14 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016054954.GEatG7AgMNFRkiTo1H@fat_crate.local>
 <atI_yuCc4BiweBQP@google.com> <atT5TYyLapHO5ZoX@pcnci.linuxbox.cz>
 <20261018201538.d0957878f378a9821852836f@linux-foundation.org>
 <atXXma5NXxoSWJO0@pcnci.linuxbox.cz> <atY1vWRBRUwpISKb@pcnci.linuxbox.cz>
 <20261019083529.a81910ac0976c1a5687d4c6a@linux-foundation.org>
 <CAO9r8zO41EromgLGhKv8H0aKXjrffH+t4CFGU6cLo59JJ3CEuA@mail.gmail.com>
 <20261019105844.02d4623b7063fec25ebd34ad@linux-foundation.org>
 <CAO9r8zN1dTJmULsKCwNrNr_vKyrV+vMfD7wifQ05uAti7E-yDw@mail.gmail.com> <20261019181510.GAatZeLtUmU3Zy9VZt@fat_crate.local>
In-Reply-To: <20261019181510.GAatZeLtUmU3Zy9VZt@fat_crate.local>
From: Yosry Ahmed <yosry@kernel.org>
Date: Mon, 19 Oct 2026 12:53:01 -0700
X-Gmail-Original-Message-ID: <CAO9r8zMdLN+wms164bs_c5BfnrYZoNAPz6b6hcODt1JnUMniVQ@mail.gmail.com>
X-Gm-Features: AclHuK9WexEVPWPjZM8Xg7vW7SIGXnR7j5todzSpiBgiM_zmWuBHXiwBEKHuGRQ
Message-ID: <CAO9r8zMdLN+wms164bs_c5BfnrYZoNAPz6b6hcODt1JnUMniVQ@mail.gmail.com>
Subject: Re: hunting memory corruption bug in 6.18.x
To: Borislav Petkov <bp@alien8.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Nikola Ciprich <nikola.ciprich@linuxbox.cz>, 
	Sean Christopherson <seanjc@google.com>, David Laight <david.laight.linux@gmail.com>, 
	Rik van Riel <riel@surriel.com>, ljs@kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, david@kernel.org, 
	Mike Rapoport <rppt@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Pedro Falcato <pfalcato@suse.de>, Kiryl Shutsemau <kas@kernel.org>, luizcap@redhat.com, 
	pbonzini@redhat.com, Tal Zussman <tz2294@columbia.edu>, 
	Matt Fleming <matt@readmodwrite.com>, gregkh@linuxfoundation.org, sashal@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 11:15=E2=80=AFAM Borislav Petkov <bp@alien8.de> wro=
te:
>
> On Mon, Oct 19, 2026 at 11:00:00AM -0700, Yosry Ahmed wrote:
> > Right, but this is for new patches that get merged into Linus's tree,
> > what about existing patches? Any way to retrigger that workflow?
>
> You take your patch, apply it to the stable trees here:
>
> https://www.kernel.org/category/releases.html
>
> and send the applied and tested version it to <stable@kernel.org>.
>
> I.e., you backport it yourself. :)

Will do, I have done manual backports before but only for conflicts. I
was more asking if I need to send the patch to all branches or if it
will be automatically backported to the others if there are no
conflicts.

>
> Do git-log on those branches to see how stable backports are annotated. I=
t
> needs to say:
>
> "Commit <sha1> upstream."
>
> at the top.
>
> There's also Documentation/process/stable-kernel-rules.rst
>
> HTH.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
