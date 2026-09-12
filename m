Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4246734D4E9
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 02:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789181454; cv=pass; b=klsiXZR1BecC6z5Z6COXEwhKFdGz+8ko5WrAlOShcEQkTXH08clRaFsBKztG5z4kWlunedriSGrukIS8IGhtEAOwCsaYeToRyjXQgyBRKBZTMsZ+jn+HnsuvRhvqWh2HQAKfj8Ic8mYjurOdp7Tyobl6vSSmfNraFL7I0aTbUmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789181454; c=relaxed/simple;
	bh=UBF68ob9rLLcJ+B4BGI8OMKoTXkffDblP9vHlbmSr8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kVcTzBjc2cyarV1YILBR2KAhyHpHYUm8rKqXu+FY2Trin+UYnslxZOKPgTxbrqxOz8WKQgzlTbUHxxaFONI2DmhlgxzeD6b1JYtnf6GWyxd9ALHWtlUirz4x8kvQgx3hoJpVenIhpvyIPue/4tdbS5ZpxFga/X9YMzylBtrCjhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=soekMItX; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="soekMItX"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a5919af39dso5081651fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:50:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789181451; cv=none;
        d=google.com; s=arc-20260327;
        b=oxf5klJDrLc8av8+EfYZtXsDzPKL0ltLVq6YwYprFXoPOuGLQz39DOzn7Ii2/ooFm1
         0dTkInj7l02JDRzA7/fhXz5vPq3O8SSMKtgdx99AAmWveK56Of8D8x+y21+CCHeZGMX2
         RZISascQqC9CVZxoCkX45neVLA1aqZkhu0hf2bV6vgxbosbuu9Banmz2daJIfuOZiHYL
         pOe1CYXmpkxcRGTLktqWtW9z6FB6CEyW/igYlt0mgNBEZC1uM+MLBQ7GxdVYza66R7OD
         eoXI231n4lvjpVSeeZIz2lCaDJ4ArrehZPGoWydG1vwDBzumMqQzDjZduKlU79vnsUX/
         9SHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7lm0hPUEiNGm9wQton/cSC99gHERZOkyr34L44cajdM=;
        fh=yfV50YEDLW/dN7EpHDPZ2LCHWc0uO2v0QTHLCVXgcf8=;
        b=XRQfUC70hL3rsOIxdIZSjo7jbvrDqMpGFAs9Ltq28lZII2FeQqsJjp4+kYvxTb+VZX
         c+bSYl8oKVtubCB3vLPx3RWW5UEWuxAmJX37wYb0kcx0tl3BwZyjk98BFbd1EECFqDdn
         QuihSV4G4TlJ7aMQN2e4j4UW4xDV8xH4Qmy61aZ8f/RbFXEyhCGnq7DcNpWG9o0PMosh
         wOdPqlSiPx8lz7gCRq+uYZMMCuXsUqBfAIZsTiQ+Jn7d//wLISTDFJgA6GTUitTSxb7D
         m84y2EA3dIiPkVuD3CUpasIgjNAcs8853ZDU69F/U/OqVCWTmzgvUTEw7HcLT3rHJW93
         BT5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1789181451; x=1789786251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7lm0hPUEiNGm9wQton/cSC99gHERZOkyr34L44cajdM=;
        b=soekMItXA9QqFaOQZUqkhYikTmgyQ3GxeHmtHh/W776sbTPTNFfZFQZxbFmJ5lGy1r
         UTDOsYLtWXJUhDejqN6oRafURawF+E01esZbvRgC1nPi+j4D1r3Ipwhc3jeEofjFTUKZ
         ldQoE1yCZ5ZFNnqhedj8lWp227/lVMVOvmM2yDkFbBv2sJVwprjh67H/psR1EnySNc9W
         e0CfxcQrSruWo1qh3jKeUZZe7VUD2sQQcyEs+Od4HNyA1U79SEutUp2caxRzR6VKiQx1
         pRnd4AHMowh+qp+/4l3tTZ7bwn+L17kIBucZWbG5eQQAg1DrRWavNsaIjxw2ZyD6HwqZ
         OOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789181451; x=1789786251;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7lm0hPUEiNGm9wQton/cSC99gHERZOkyr34L44cajdM=;
        b=oso0KS5tkwHIYTFl7loddyEOK8aqSPgmYwoOpl89aifRuJX5+iVAwQfAcfaksdUFKJ
         ggFxY5//FjLEQmtAh3B267hlVN2WsY+w9e4QX+StB54U65Hm4dho7iYasoefrJmTDSkO
         VSRMESqrpdNX1Ll7MktcDukW5CwDofNoEgUMiC468YaIalcXMl7IizqckmJqvkCi7fvh
         tkngTkGwz0qe1nPm6a8EMFOer6wY7MpPWM9Xldd92gAM0EO6dnetS0I0rPMoQbldCuVK
         w5QwyHwgKpk6WJA48Dd/s0xEa59W6fOfKMb6Wu8Z6GFlN1/JeqtJkHNr5ZS88hbnSPE6
         Vn/w==
X-Forwarded-Encrypted: i=1; AKwUvBzcTF9lEVp5NsbZIwofPrJUwOYfvQ/Nm4SVUmE1/9P68Ff8gk6iSIXZnHAqlYzJDk5pgyVKcjqPWWDwnrU=@vger.kernel.org
X-Gm-Message-State: AFuF++lLN9PhcRbvvVs3Wg9U3lTM0DJAh7YXQtVVv07MbWGZ8COyYijy
	xyzb9W2m89ZvEd6nT1ygI16RFEounfnCMdWofup13s5qqi+XugZZaeAR7nsxL4GTBBCz46/PJpL
	e4zeckYTEIUc3z4tqpKR1Q5Rgey/wdwW3U+78YqKJaFY=
X-Gm-Gg: AYBFou2KMjb9pGbZpw6aj9c+WQS1gh0IUr8kc6ed9w7OH9oQW3ypyU6FsaZ1ehSFyfi
	aeG3JKoWmy4QqmK2+ae91ScQwcW670s6YWA1GdFKBEPfklA1r5U4p5miWiP//p4prrAhSokBj4P
	8dz6RLS4R/uNmp3qkTx+6KaOcRmual7cxKxtjgDzveRPlAm8Z5Nw++RwFoMaJ/jYMxqasdpWvkJ
	iQTkOe5HzbE/6hh+HzyZsua86qYk6c/42ySm4HkXG7FnIV53EBmS9e/uXL3V90LuFZQEm0RjZ3r
	/vqoCK6G7pPx3tfli1nEs6BnGPmbAYEnaNfPr1xcri2R0ivSKyfRVKrNbCfjidzq5hx6wlrfs0f
	ZTAlAHHvvyQ==
X-Received: by 2002:a05:651c:1503:b0:3a4:99ed:beac with SMTP id
 38308e7fff4ca-3a5a51c9fc4mr17435271fa.4.1789181451073; Fri, 11 Sep 2026
 19:50:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788516372.git.zihanx@nebusec.ai> <20260904140527.62354-1-zihanx@nebusec.ai>
 <20260911170034.1236993-1-sorenson@redhat.com>
In-Reply-To: <20260911170034.1236993-1-sorenson@redhat.com>
From: zihan xi <zihanx@nebusec.ai>
Date: Sat, 12 Sep 2026 10:50:38 +0800
X-Gm-Features: AcwNN1U-uRTqt8ykL8GuFuZ-SOYux8MbyRejD1SIf3LqoAgM1qpEMJQANafNEo0
Message-ID: <CAANe3eQwGetW4jWjGrjCwO+kXhGbDJpE5iMhVbWkJBGp+Do+MQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] smb: client: fix create context out-of-bounds reads
To: Frank Sorenson <sorenson@redhat.com>
Cc: Paulo Alcantara <pc@manguebit.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, 
	Tom Talpey <tom@talpey.com>, Bharath SM <bharathsm@microsoft.com>, 
	Pavel Shilovsky <pshilovsky@samba.org>, Aurelien Aptel <aaptel@suse.com>, linux-cifs@vger.kernel.org, 
	samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 1:05=E2=80=AFAM Frank Sorenson <sorenson@redhat.com=
> wrote:
>
> On Fri, Sep 04, 2026 at 02:05:17PM +0000, Zihan Xi wrote:
> > smb2_parse_contexts() validates the complete create-context area but do=
es
> > not bound each context record by its Next field before dispatching to a
> > handler.  A malformed chain can therefore expose bytes past one context=
 to
> > the handler.  The QFid handler also used a full response-structure cast=
 even
> > though it only consumes DiskFileId.
>
> Hello,
>
> I have some thoughts/comments on your series.
>
> First, a possible reason for not getting a response on your v2, and
> delayed response on this v3: Steve French passed away in August, so
> mail addressed to him isn't reaching a maintaner, and things may
> have gotten missed during transitions.  You'll want to send future
> versions to Paulo Alcantara <pc@manguebit.org>, with Cc to
> Namjae Jeon <linkinjeon@kernel.org>
>
>
> I've been carrying an overlapping patch (an earlier posting:
> https://lore.kernel.org/r/20260826153147.4112943-12-sorenson@redhat.com).
> in a bounds-checking series of my own.  Like yours, my patch has
> been addressing the memory safety problem in the three handlers
> which read at fixed offsets, rather than the generic checks.
>
> But I think yours is probably a better fix, and you've got the
> PoC, so if we can perfect yours and get it in, I'll be dropping
> mine in favor of this series.
>
>
> A few points (take with a grain of salt):
>
> 1) The lease parser still reads at a fixed offset rather than from
>    DataOffset:
>
> >               case 4:
> >                       if (!strncmp(name, SMB2_CREATE_REQUEST_LEASE, 4))=
 {
> > -                             *oplock =3D server->ops->parse_lease_buf(=
cc, epoch,
> > +                             if (cc_len >=3D smb2_create_lease_min_cc_=
len(server))
> > +                                     *oplock =3D server->ops->parse_le=
ase_buf(cc, epoch,
> >                                                                      le=
ase_key);
>
> cc_len bounds the record, so the read stays in bounds.  But this is
> just like the QFid bug you just fixed nearby:  smb2_parse_lease_buf()
> and smb3_parse_lease_buf() reach the fields at the canonical offset
> of the create_lease layout, not at DataOffset, so a valid but non-
> canonical DataOffset could get in-bounds garbage rather than an
> OOB.  That's not a security fix, but since LeaseState drives client
> caching decisions, it's probably worth closing.  Reading lcontext
> from DataOffset, as with DiskFileId would make the two handlers
> consistent.
>
> (My version also had this, so it's more an observation than anything
> else)
>
>
> 2) You may want to consider matching DataLength exactly, rather than
>    taking a minimum.
>
> ksmbd's parse_lease_state() requires:
>
>         sizeof(struct lease_context_v2) =3D=3D le32_to_cpu(cc->DataLength=
)
>
> and validates DataOffset + DataLength against the create_lease_v2
> size, rather than accepting anything at least long enough.  It was
> suggested to me that having the client & server halves agree on
> strictness would be good.
>
> (I did confirm your minimums cover all the fields each of the parsers
> actually touch, so this is about strictness, not a hole)
>
>
> Frank
> --
> Frank Sorenson
> sorenson@redhat.com
> Principal Software Maintenance Engineer, filesystems
> Red Hat
>

Hi Frank,

Thank you for the review.  I'm sorry to hear about Steve.  I'll send
future versions to Paulo Alcantara, with Cc to Namjae Jeon.

I also appreciate you carrying the overlapping bounds-checking series.

I'll address both comments in v4 and send it as a new thread:

1) smb2_parse_lease_buf() and smb3_parse_lease_buf() will copy the
   lease context from DataOffset, as the QFid handler does for
   DiskFileId.  Agreed this is not a security fix; it just keeps
   LeaseState correct when DataOffset is non-canonical.

2) DataLength will be required to equal sizeof(struct lease_context)
   or sizeof(struct lease_context_v2) for the corresponding parser,
   rather than a minimum.  A mismatch skips lease parsing and does
   not fail the open.

Thanks,
Zihan
