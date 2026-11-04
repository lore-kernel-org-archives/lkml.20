Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793752869;
	b=lFz3nfMbeE0+wlBjzqtEUEVKilNTA/24BWkeApWt+D1stU6iGUiPoWOlc0qkSAc43Axx
	 xlLMu7weFnqfCAu4yewaf0hMWgsF/I9NgYsK9FWQ2tf7L9LsoLMImJcIInXjMoepL+KqP
	 7GdpW0OMdO7BOGoffgFNIJUl4f7CuFRKvRpy8b7emutTgClXTYix0tSrffNgDvpgdEphV
	 ENVx4hvVQZcZjmo/xUQ/gpq39b3eESrwU2qzDJuWip9h0GzotfDcxKY+jeUC8Kl0fJP+M
	 jdMnqOtoXqv7eULPMFQ1uI3G59xpAzqCn+W/68u8YSN5H/m4iNaU0uPpkNQpyRPWlLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793752869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fPNnZyQIDXSKNoVkiNoUdoJZWsQu0g4dBkxCnrIJvKA=;
	b=XEWNCuhj3vpq/IfWYdQi6SQwy00LZUXacZN7HlzrRBVOInXq2la0oWLdwAoJuh1U8r1P
	 vyooUEq2VEa4Zrqk6XW3qmynJ4moNpzVehfrxFEXAZ7oBNRWy4hR8uUphzqk3ZnZFWkJ8
	 8R4FbTeE6F01OKJ7geCOG1f4spT/hvLVKdAlJehcAiAiJ3EeA1nW5m1CREXOUgl0W81bl
	 0MVvxkLKdvWXQzzyaLiUYiCfnpn+m+mQaSAx+BVMshAy+jxj1uXLfUJ+KejAyBcfka8qs
	 YZTEFHz316Z2aQFHCEwosE+TSybBASNwmqPGi+TM8NwzYSILfhnE7pY5fC6GKEa2Pow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6387606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 00:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6387606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a05b210703so114372b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 16:41:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793752863; cv=none;
        d=google.com; s=arc-20260327;
        b=NZaPvT8FlvbxGPTGedWiWwkL8tVqAPWBMgcKgqndqxbibpt6A0TdTLqGlYkJcz9wTo
         f15fcDskmC0K8FUdSe1PncpdtSwt9pibCJwzTZx5R0/2AzeRBZhfMk6IgLw426ze/hEk
         qL7qO4jEOOgSnao461qH4qC5twgk7myj23NKQaKhz0f3xFu6VXTQv8Bom5j5ud+ZBmVa
         ckHszFxtmiz2l283D9uI5hL/pmBZo+dFYtLjQPZCshC7+CCnPkS68rEMqa8PN4xsALdT
         iiHZWNgukJ0dUWjmAvt01gr086xdi3DtxDoovLTGXSf4MtMsLRZdAucbryiQVL3stykW
         Myew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fPNnZyQIDXSKNoVkiNoUdoJZWsQu0g4dBkxCnrIJvKA=;
        fh=PZGpAmapLYZ0HPRFwdRvKNTJabSDmUTFlTQsthYhhi8=;
        b=AKwS+4n+GN+o+vTmqvaMaPC47MMvY0VOS1Q5QRwlOCAS/XEdKocVpAdtc7cDrKadva
         jytM9ECN1kdcGTJsoswkiUdTfTiu9dVXV4ccCRULBGlg5nKWhBmYSCdGVJHqFIqHiOya
         x/E0FclrJLIeLKu5FeSqqqNU7PcjkL5xXDOL/MVhjfNg7YXjPc/sE5xvYaGome62IdvW
         K+Z9grZMhyxMFSBhoEj5n6/XRalKWecYsqGvNgrjZQrcbsEWIOTsyYiUOeoB8gYDJKzG
         229r5KF7EpUZD5lEBxHbjTYcBi8r1zN43tfpIFNrslyvKZvmfJjDTHCT2DAjT1aeGlTI
         cJWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1793752863; x=1794357663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fPNnZyQIDXSKNoVkiNoUdoJZWsQu0g4dBkxCnrIJvKA=;
        b=PTPniKxw8lSLWSxMbmhmXVodXffwfFqC3M3cDEPYPvY1SsBjNOjXXv95CLFg3rVQFu
         x1tdyRAr0bqYQ6HVqsjHpfPPU10/1FhE3kd/CHXKlKRa2s8Jf9/RWGaRvSd9s3tWp3+h
         Tji6Btj/3XlTUrwGPe+aphN7moDM3Ujmyews2MtwEsOdhWo9d1B27IQnIAXxeCj/AgoF
         TwCZd9YYNW98ENSoBC4GvFAhash4XN0WeHulLfX/snYculqtKEVgWcaAWPf68LjYBfvq
         i5NzGzwAog4kKLckyYK3n2IY4tOHLEWiT5cJSG6dbW9SW1FZ4MjXmEMstZ0yw7BaSVW5
         5qpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793752863; x=1794357663;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fPNnZyQIDXSKNoVkiNoUdoJZWsQu0g4dBkxCnrIJvKA=;
        b=v9fNTHnNPi0YS82itZEL276s9CRf/W0Nup6Jz/iQrS3LFWnzyVnFiYT5jVfhYo76v9
         FQOmECub9yswv6ShKki2b9ENxuXSwaJaEJbkyCc7jn0bkNw4MoYlMFo67VdxgGdkObTk
         cSRwIlsbnxdVgvQdgNjetCK+udVWMEukPI7RrgB87aIzHQWc+yeChmmwikvQYxjZcEwS
         E0ki8eLYaCulJug+rCliyDDctV9x9z8wqv5IKdxSW66+VekvUuXbcWnRqq8hOVvUwyKN
         jOu+UgSmtUsXZPjSjyOttOgdYsffsixFOwdc/R3bjKyN7CTa7rWzag4lA/Z6TAhFF0dk
         3Cfg==
X-Forwarded-Encrypted: i=1; AKwUvBx9A0qjUvipy9egHzd3dpd362E0r9psihJ8ChZRVdMiTU/TRLOcrFQ37OZ0WvFgVsaBVwh00fSBryBm0Os=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6HwH3T3UBskzvPbfkUV0PdbJdelTKTrd9XAd78I3rMQkdc8gb
	PjMJng2K4+j2HdzBQfuF8/rMFcz5+mMkqKBU882sgatf1ywEAkd3uIeo00Du3rbiOdBBI9OOUNT
	JbCR9/Xi2GEQZQyCXN8sdNtqMkNi7fyg0LXPyBUHw
X-Gm-Gg: AYBFou1DIxBihmF2HmCU+G3xsLW6Qn+eQzBJt3C8elAv9/YALDe0cp0HZ59pjnx2kqA
	52+EENScqfe8kK18F9wTrpCOaEVSdMVq8SD406W74A+DkRp9wJPxyqFSDM4qTSoM5uL/HE98oQt
	g9wAV0H5LA4YRwDD3mYfrKRDvrbs2U/IBbZZlITFwp+fIBN0drTB3Pni4gs+dN0F0b8ZYUkapHF
	Y+68sMbGuXH9iJCCT7cmscyNQibOLzGHX/N8PZseUX/P7MmoUvhPX1KTQt6XBhOBTstue8Rp/bx
	gepANj4xtmB4ci2fkngrACD9BaVp+c1sGT+fJBzmjP8L+wU2FRHVAjUw3ns+RXZ9nhuJFRcrUwo
	/YryBFQoBz5BI1Ih05W9HiqwBtgSLP2tq/VEQiUbi0jw+wuZT6JsrpSaCQ9eCdRnhYU0L
X-Received: by 2002:a05:6a00:2d96:b0:88d:4b30:1c11 with SMTP id
 d2e1a72fcca58-8a9ba703bc9mr11394030b3a.6.1793752863107; Tue, 03 Nov 2026
 16:41:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1790088067.git.rrobaina@redhat.com> <CAHC9VhQ=FFYVNmQdiMsqg+5KDDrSC3SZS+H2=r_GkhfwQox8tg@mail.gmail.com>
 <CAABTaaBL=TScs8Qqu3b8F6KZPGMyvwy6cBC3teDaBL6MGMucNg@mail.gmail.com>
 <CAHC9VhROsmzbm+AP63Sm7mqCokgEy6Zu0AVMY0gxp8qY75Pqiw@mail.gmail.com> <CAABTaaBOrPknzdxc5S6L9hGu7hbFu2e1RZG=Sxjb_B1Cs4Sixw@mail.gmail.com>
In-Reply-To: <CAABTaaBOrPknzdxc5S6L9hGu7hbFu2e1RZG=Sxjb_B1Cs4Sixw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 3 Nov 2026 19:40:51 -0500
X-Gm-Features: AclHuK_mzIhdjHPxjnkTYRthyfMgrzjS55JZuNf6mZPYYsQQvO81kKGlvJUv8_0
Message-ID: <CAHC9VhQ4U-Z2KkGurfMihJgzGgwD3miWSW4wWAjWvUdDxLpH7Q@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] audit: log all six syscall arguments in the
 SYSCALL record
To: Ricardo Robaina <rrobaina@redhat.com>
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

On Fri, Oct 23, 2026 at 8:45=E2=80=AFAM Ricardo Robaina <rrobaina@redhat.co=
m> wrote:
> On Tue, Oct 20, 2026 at 1:39=E2=80=AFPM Paul Moore <paul@paul-moore.com> =
wrote:
> > On Tue, Oct 13, 2026 at 8:36=E2=80=AFAM Ricardo Robaina <rrobaina@redha=
t.com> wrote:
> > > On Thu, Oct 1, 2026 at 6:06=E2=80=AFPM Paul Moore <paul@paul-moore.co=
m> wrote:
> > > > On Tue, Sep 22, 2026 at 3:21=E2=80=AFPM Ricardo Robaina <rrobaina@r=
edhat.com> wrote:
> >
> > ...
> >
> > > > * As pointed out by Sashiko, when you were converting all of the
> > > > arches, it looks like you missed alpha.  I took a quick look and it
> > > > appears that it should be a pretty straightforward conversion like
> > > > most of the others.
> > >
> > > I've actually dropped the alpha patch as per Magnus's request [1].
> > >
> > > [1] https://lore.kernel.org/audit/CA+=3DFv5T4826T2sd0Gbh-nfZsqcWK_phd=
BKy4BLWOvDTt92t5Eg@mail.gmail.com/
> >
> > The problem is that as things stand, this patchset breaks the build on
> > Alpha.  Perhaps this gets resolved during the current merge window,
> > but as you know we can't break the kernel build ...
> >
> > https://lore.kernel.org/oe-kbuild-all/202610041836.6TatRQSm-lkp@intel.c=
om
>
> Of course, you're absolutely right that we can't break the build. I
> was afraid that this dependency might cause trouble.
>
> I noticed Magnus posted a pull request a few days ago containing the
> "alpha: enable GENERIC_ENTRY" series [1]. It seems this will get
> resolved during the current merge window.

... and it has, or at least it appears to me to be resolved.  I
rebased the audit/dev-staging branch against v7.4-rc1 and Alpha does
indeed appear to be using the generic syscall entry/exit code in v7.4.
I think we should be all set here wrt Alpha, thanks.

> For future reference, what's the best way to handle dependencies on
> other subsystem changes like this?

Generally speaking communication and coordination :)  Talk with the
subsystem devs/maintainers to understand what they are doing, let them
know what you want to do, and find the best way to order things so
that it all lands in Linus' tree without making a mess.  In this
particular case, with the syscall arg audit patchset not being ready
(missing maintainer ACKs) and the Alpha changes going into v7.4 it
turns out to be quite easy, which is an important lesson: sometimes it
is better to defer a new feature for a release just to ease the
coordination burden, enable better testing, etc.

--=20
paul-moore.com
