Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933304FC8E9
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895259; cv=pass; b=PXwTtbaaUa4N5O7NEvQl19+NLgC1wrcPiXquhGZNmnDkWOYKzo90aw3dqDvcoSPmxUI9tHJN54PUx9Sww14y6Vu5Df1XJA60xTeIhpTPCe8gPQLojmBqT36poQBCO5/xgJGHLM1srYx+jrv4NAWWMP8kQn/QhzmXznsbiGxqWaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895259; c=relaxed/simple;
	bh=+6HbdvXz6pDwyHoZBHfAtbCp8mco+tVTkhaG46/uc+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WRgzuUrjmUMfI2zvnPTRyGmyLjRuzXRew1UfsvCuqFZv0Hok4+H5KfVWl2waxKec1he6bH96MyiuXKd8kxtN6l7TRPTXzvJ94bWhYL8CftdQ65Bpn5rq0s6HpEwg0tRHsmzfJ9mV7lQYfgUJIhqzFhOiXnmv40a68KP8ea+210c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eX7cpyuY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=afM4UA3+; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eX7cpyuY";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="afM4UA3+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791895257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8VPWzp7oBCAkGHJlAcxMxO63noDeryK10tEP324EHX0=;
	b=eX7cpyuYU+800b53xk5/JJvs4mNy3MZpdkXj6YIC+IAX2xZclxRr52d0zQIWVOB3csDtAq
	jzyYNBKJIWLON9EFsiUuUa9+TIQKFWIjpVWfNI+ziU38uW1jBnXAfcLHegG0yVXcUVQy6t
	Kle4h9EUeLii6ZckMl+9rSabH/pkndA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-676-aZT8u0kOMKOyczw9POideA-1; Tue, 13 Oct 2026 12:40:56 +0000
X-MC-Unique: aZT8u0kOMKOyczw9POideA-1
X-Mimecast-MFC-AGG-ID: aZT8u0kOMKOyczw9POideA_1791895255
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c3613c35145so167579766b.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:40:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791895255; cv=none;
        d=google.com; s=arc-20260327;
        b=nq0a2ocGoGJMsNfIYqk9Q9slvJmLvg3c8OjUuebx/y0m79oGblURMlwOIZHnpE3a+c
         HJg5VljmI0ITfZrPUv+hS0PiRatgur9TiboirjTwjMNBGsygj/gmXrZRgFKT24yCkXq4
         l1dRVsbSg8zRrDFGkrSlcft0DLVnNbtPVk71Zzluho/0qE0AQXRi3qrP1otfAkTiXF3W
         7jcKT8bji2qvm3Wp/e3e38nfwakvKpNVhQacXDiPklj9yd3//EpTPKQaMKe45EmJLFqS
         GHObhRHN1R9ojj6VDordj0v11VI8wYc1WeC+yKSRvGYDAwpiWOPSDTezv1/0zQGrmRE8
         b3ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8VPWzp7oBCAkGHJlAcxMxO63noDeryK10tEP324EHX0=;
        fh=TJhLPHBBQ1G3H8hmQ3grmTb/V2BI3qJUlDeyojwnxyk=;
        b=G4N5gooK6KT1J4PBLlB65zJsoWC88BMGPrsmJ0xLXJGpeI5Uy8yMExXOl+J+MABr27
         Dmu0F0jZHCiBHpbGJ5UCXDcn0ts0EEBUtcG1UmnMduWlSYnyxmz5Jdpaek4PMJjL4MFb
         9g7m6xNTDd6n+tgLktC8UNvzSKDcsyhpHn9Mta0dgC8JHpCC3kt0xvIC72nIo909RRkb
         Ec1B58dmYJyRvCWLdTJUrMEbRyIW4ShbRGdUqCwWGkN2m3pCa13nsOrb+gf8ge7c/mQE
         EN7hNDit24CkWqjr2n2eJR7lt96D1y2KCBiEgx1ClGl0YWjmEmqT9P3zVihR/jHepwWh
         3OSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791895255; x=1792500055; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8VPWzp7oBCAkGHJlAcxMxO63noDeryK10tEP324EHX0=;
        b=afM4UA3+7Uh4rCgEPDp1gUBOa56z6Comz1f0HdywN2tscvcRMMa1paYwJnapSgoumZ
         zT1B4r+lsTbSEV74qZt2Kn/dqav80xy2rH/WcAq2OdL7fplgJijFU5qN7wr6kp6LmL34
         9s4e38+IHf53RC1XBMopg5kOxBjhhZVa3K0TxsekU76nci40eMCeaLF2p94+wWffN4Kn
         OY+rd7C7gvEX6foEJ/AKCprNZGv7a23P90PnI1vNxaZLFfVJsjQ113iwHDZ/89LvneaC
         7ocHfpYnxezOTPP+NOrE9F3TlzwoCF8V52NuCZDQGn8VpdBvBVXCVtF3DTd/IrMDmxIG
         Jurg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895255; x=1792500055;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8VPWzp7oBCAkGHJlAcxMxO63noDeryK10tEP324EHX0=;
        b=2BHMYRKBZN56V4K8YAStAVnLvT6s0p5RD93cXAHqEhiziKxolkA9UhtksBkmI61I1a
         Uzz2W9vuTNQLfF+qnOurvZCbQtGdZ7DHafhP3AzBYGTWUnKtfJy9OvYvL59izvJnfcp7
         ttdj+KHk7ofG7EHfqpwzd4/vduzVxmFXagDg1h9j6cgh5egGOU+nwBYVlB1TjV2PNImD
         135QSkcvT8nj2kh3PNxvw0jGd9YVU9ujISqoEHPV8vQmPSXoFy37fNN8G0HmRmJ0eDZ7
         cyLpPZ80+D4+Daxntll9R6ER5hMI6o29BX2lgV57rqjMc0VDbTiE+YWRfy3899tTFuuB
         9EAg==
X-Forwarded-Encrypted: i=1; AKwUvBxTHYJgKKtvFOVfrtcdts0CjkK69Jt6HCUfxXBMAH0UJCrig56isYPJNrFDi9+HpLPiC7Gl4zP04IZ60ws=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEHPDF2NZ8a4zwdzXEhiQ7rhNIbZktmy+cJZaJOr+K03zZdq2l
	G1QNb0K689zIZ84ZI790xwxR9HrLkI/IqdloGw6gZyr0SaO9e7Aky1UZv2Khb3B588AaU4CWTZg
	RHBZx+XMRMB305hbkzxX6gwsncQlhKwVaVRRL8aM4462bTPmDFyWgfWhkCgnhXz8WSMWqK+0Jib
	Vo3LO70AAGkCHqxdGqkxRzcNZiBz9H3RsfKTcadjx8
X-Gm-Gg: AYBFou3zQOs7u2poFX/bocd0PMISIuPD0nO04SqvCMJB4K4tcGJeM25OQzD0ZP6rZjC
	JRRkjdjf/LIPxMkEQy/ooSPKpvabc7HtV+IpKLvvpWywUzP66HxmXcSvdX3Cwj+URL4w0+k7qUK
	FU+ylZX8mq9VfBlr79j+1TPNpV7fdusZpXjT38K1FHRJMJhEbEcXFg/Wrz+e3UR4uBg3SCSgIfz
	ysWKaxr4wQlZ/KMJ+ekCUdmX0dAU3CjYyKMSgHbkfpv98Y/8kiA9mqXiTZ/ZT9e1FmSU92DxGco
	/iM=
X-Received: by 2002:a17:907:e00e:10b0:c33:923b:ad66 with SMTP id a640c23a62f3a-c33923bd1damr460792366b.43.1791895255417;
        Tue, 13 Oct 2026 05:40:55 -0700 (PDT)
X-Received: by 2002:a17:907:e00e:10b0:c33:923b:ad66 with SMTP id
 a640c23a62f3a-c33923bd1damr460788666b.43.1791895254469; Tue, 13 Oct 2026
 05:40:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703122548.1623981-2-rrobaina@redhat.com> <alaO+HZ7qJ1Iv9SP@madcap2.tricolour.ca>
 <CAHC9VhSosDsvCZyq0yY3Y61r5Od52WJecqcEjrT7XGkpyBi-xQ@mail.gmail.com>
In-Reply-To: <CAHC9VhSosDsvCZyq0yY3Y61r5Od52WJecqcEjrT7XGkpyBi-xQ@mail.gmail.com>
From: Ricardo Robaina <rrobaina@redhat.com>
Date: Tue, 13 Oct 2026 09:40:42 -0300
X-Gm-Features: AclHuK_BqgHG9szdxsfF_J8_QomlYVv7uojh01Rda0mXNc18M6GONX950OFpYpA
Message-ID: <CAABTaaCj2Bap_w7mESYhPgT1njd1rQh6kB0HFnnSiMW40SCNUQ@mail.gmail.com>
Subject: Re: [PATCH v2] audit: add FSOPEN record to log filesystem name
To: Paul Moore <paul@paul-moore.com>
Cc: Richard Guy Briggs <rgb@redhat.com>, audit@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, eparis@redhat.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, jack@suse.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 4, 2026 at 10:18=E2=80=AFAM Paul Moore <paul@paul-moore.com> wr=
ote:
>
> On Tue, Jul 14, 2026 at 3:33=E2=80=AFPM Richard Guy Briggs <rgb@redhat.co=
m> wrote:
> > On 2026-07-03 09:25, Ricardo Robaina wrote:
> > > Modern mount tools (util-linux >=3D 2.39.1) use the new mount API
> > > (fsopen, fsconfig, fsmount, move_mount) instead of the legacy mount(2=
)
> > > syscall. The generic SYSCALL audit record logs the fsopen syscall but
> > > does not capture the filesystem name string, creating an audit gap fo=
r
> > > filesystem mount operations.
> > >
> > > Add an FSOPEN auxiliary record that logs the dereferenced filesystem
> > > name string passed to fsopen(2).
> > >
> > >   type=3DSYSCALL ... : arch=3Dx86_64 syscall=3Dfsopen ... a1=3DFSOPEN=
_CLOEXEC
> > >   type=3DFSOPEN  ... : fs_name=3D"tmpfs"
> > >
> > > Link: https://github.com/linux-audit/audit-kernel/issues/152
> > > Signed-off-by: Ricardo Robaina <rrobaina@redhat.com>
> >
> > Reviewed-by: Richard Guy Briggs <rgb@redhat.com>
> >
> > > ---
> > > Changes in v2:
> > > - Better placement of audit_log_fsopen() call to avoid UAF.
> > >
> > >  fs/fsopen.c                |  3 +++
> > >  include/linux/audit.h      | 10 ++++++++++
> > >  include/uapi/linux/audit.h |  1 +
> > >  kernel/auditsc.c           | 13 +++++++++++++
> > >  4 files changed, 27 insertions(+)
>
> My apologies, this patch fell between the cracks, but it looks good to me=
.
>
> As this patch touches both the audit and VFS code, I've merged this
> via a topic branch in the audit tree, topic-7.3-audit_fsopen.  The
> branch will remain static and it will be included in the audit/next
> branch as well as the audit PR for the upcoming merge window.
>
> --
> paul-moore.com
>

Thanks, Paul!

-Ricardo

