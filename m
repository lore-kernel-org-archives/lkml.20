Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793799782;
	b=dQ6svc0oz/k0M0n4HzPgXqf/WmYDIAcRJ+HMsmyPnBpQ72l0cLtBDsY7hMYof91oLmhl
	 w65DSVCdMEciDE07130cnFy6d5UQNO8G43T8lLaDwd0/uEYKbnbC2/ucawvzsPsuqs1Vl
	 KbnEkhx7idvLn+H/Jyy2vKtuJ02shiOOJyiVktwVGVjUVhxsH2jlmTGqbp79BaQDwsYeY
	 FhxiPrSakv/F0jKoseFnjWAvYqnoKmibGzM0fQIAoHRLQWa96uA5H5g+FSiNB9Gg5h9Af
	 orX78tromf2dW3nHn6x/mHllIvN2liTmEg7GADfjgW/CdlVy6jRfWGWciGZVYIhbNBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799782;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=JLATmvImDg/5VrDBag7NLO/Ra27QQfElNkmu7cHAdiY=;
	b=U5oc+Jdr7mtks9W/ZpwErrNtf4vjtrCKwaAeDf6eKG09N3Pb1QMwT59nkDt+8T4AedtX
	 6PQYm7psCyChZnx7gfK3UF18hB2FFE/+9KdHJoUqhz+h1vZF2efy3Qg4g9jl3gg2+iXoK
	 /zyYhid6hWDU0OjAVYdetzSQzXtoU3Eacfso03GHdPIihTC75Iy25wbxEF1KKkrkv2+13
	 qVijUlizyIbVl2lvyFgAoQYEjAn2hxvnl4LAgDUusmVGskAEt1WJpkPvLE6OCFyeiOKVS
	 aqyMkECT86Q03QSBTi6ztjoVbz/sXUPWCtS/pd0SDQsVgDFYgLDj+Fx/xy/a1hX6JpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=apDpBAmV;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Mouu1XSq;
	arc=fail smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819BF606A32E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 819BF606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=apDpBAmV;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Mouu1XSq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793799780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JLATmvImDg/5VrDBag7NLO/Ra27QQfElNkmu7cHAdiY=;
	b=apDpBAmVyHsE8c3Flsxy9Ca82GUT6I+55gzpzWCTdUXVsJI9n3ccEwuf4/Obnn4yWBkAem
	HqBD5dLRmJdJxj8R2GQC20jDlFRwYnvfSKyGcVECq60ENLzqVljorLRXl3T1yOpIX/xvrC
	d+bSQqkg0EFxXymI/5arWzTYgt9yAJo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-DGgEXzn-PkuvjngsH_oobg-1; Wed, 04 Nov 2026 08:42:59 -0500
X-MC-Unique: DGgEXzn-PkuvjngsH_oobg-1
X-Mimecast-MFC-AGG-ID: DGgEXzn-PkuvjngsH_oobg_1793799778
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c40285df2a0so64573266b.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:42:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793799778; cv=none;
        d=google.com; s=arc-20260327;
        b=q+4wGUd0Z3NGIyR4L/JXvd6SVB1MiTLh812N6P7qZz6HZLDQP1BKv8pmfP17PHsdiM
         Pzy1nju/v0s/erWavohZmA66Dvg3oLPoNS0CFZpO7i8SoFATo1ECLY5nZfr8SxdFKKOL
         /d7e9D7QgHopeLb/kWU/whFkd6e4IWMKFQlyMRMvTPRiXxM+7JpAiPl9+9q8giQaJEDa
         aIO4fysQG+EiSM5qTazRmqGeYCim59IXDzu9UBymulW2aMD5I8uqphV+LwyMjpHQNjqt
         L1sGtC0Z9gJivMR2COmTJDMrYnik/G5114R5SqlmCk8lOjmknTYobzyyogkWg0sR0F52
         DMZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JLATmvImDg/5VrDBag7NLO/Ra27QQfElNkmu7cHAdiY=;
        fh=h0Fp1HsX/4pny9RT+b9fAzCHNT5mlbYxMsENehT0ZWU=;
        b=i2ntfMa/N04+mgckVPjicS+DM+t1dxODH1r5F4sq3PHCkCv96+6HlieqBDI3KhGdK9
         ussg/NjHVBdgcoaL5bjDP3vEV7FphLcatPd7e205jw6uINchpYB435ticYz3Tn31SXOI
         TMAmpDNpQEH9S9JN9EImzwqjM4NM+qoZfJ1En0EJJK3Bjgoxao4FmXpntFD5eVgGNnRu
         78RMvZaL24UXn+RMzjRivWtmEfIowtxnJs0al9gRuAdL7nPMP9/XiSq17Iy0DXqhPest
         uFoXjW1lSzltuvWllru04u/4D5kbszlGPgufZbYTQT/SWAlxSVbmds1bXoCMFQI2x33c
         PVpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793799778; x=1794404578; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JLATmvImDg/5VrDBag7NLO/Ra27QQfElNkmu7cHAdiY=;
        b=Mouu1XSquusTnpfBvStFzeTN87Vx2zKs0FoEY5SevuYiOSnWt13aiH+f4QP1nefFjN
         bwfvfwVDenTxSc8Ohnkem1H17b4LundNCijbYaIAUcQNAY3l9xb5ksqEC4f6Z0cL5fRA
         xNQeCDtNJvCH87SLQgARz7InVVv6L0tlELNSUxXik0wyk4894QFXRxG6ccRAtEW0LHKe
         THJnGdreJEIFTFpGet+lyfmvPE85xw5pgU74TXo42+1aVRehgiL3n4FUvqXowAs6156M
         o0mbE4QPzv8Fl1z8PH+X5bYTvPRcqdU8Fdi8z+HRncDyBsgEgiGZAnMawcFzMWiu0GGR
         D9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799778; x=1794404578;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JLATmvImDg/5VrDBag7NLO/Ra27QQfElNkmu7cHAdiY=;
        b=kpjcqTOJxYFBtmrANZu10sBxebQkOWMN2It+uwenzL2xPITydT50r1qQ4EDaNwRyZZ
         HATucRK8ygEScHKLbL5COSTCRo8yqWN+Vfzj0z9mF9B+rVljVw9996fdQb2eHFzbFEpC
         hAuPGB/BfRAmQsnqbY5jir1WQ9sbcuTiH6Ag/44uswdN77Eo++qFna+Lhro1zFJ/e8PO
         s2lbGpJ5s6r3RwZqQAnVKIa3FQxOfV15QDM9Tnr+WLngyDpomRKhkoVO82H36lpWqe7D
         HA65Lqt1iTrngx/+yCgbHbIm95fkpC+NWpNnb20UgoQwVimIcyPAaY/cqxh2mYSLnHuM
         Jbbw==
X-Forwarded-Encrypted: i=1; AKwUvBxSALTg5Arm4LSfPziyAHIjLcw0pT21jOx95dUOhRwlFOKGzaX60A3vnMlk6mRZhFzyB1CF7fGWVy+BH5w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ORrEsZCuvOWXp0tYhqeYEtsKSgAOAYXGw9BMroTbo+EInD5ve
	ARPX0KdlTnB0n/8u3njAytg+Xsy+NA/tNycllQKNTX2Y3LxQGGiJbZz2O7ZSGqiEuGgB7Hh93WC
	24qGiNvfiW/fMkYdJjGpVcFJXidx9Je8MNcvE7B2E0SED0X5+8cWtZmExkw6uckUoSWlATgqw7y
	2wUWJkUXMhgqSXoh/Kd8Awm7bdVsKM6CaDmaZ+q+rF
X-Gm-Gg: AYBFou3dcHigRk3hSnU0qQ/6/cCp4ExTc6p38wkRGCXFDCcewg88ligqi1dqclFEPi3
	QOIZ8EDwjD5i5Ym2pA7CBV8cTqrtTH17Z0SGdumQNmWPZRZzwgHlwqPvV1xQbYSw/WaQ790oozw
	D/z9h7S6CAry6002XAfKPkOUi/p+RmJ656SFa1PK4XrQxXYAWdmwhXeLRLl31YCjLciJg6UiUQ1
	HZ/2hc/1YgXCVhhg2vyJJoSRiXP3XZiXTCKLWg470MaCg==
X-Received: by 2002:a17:907:1ca4:b0:c24:adf4:5c73 with SMTP id a640c23a62f3a-c4ca795d0cemr1327719966b.1.1793799778101;
        Wed, 04 Nov 2026 05:42:58 -0800 (PST)
X-Received: by 2002:a17:907:1ca4:b0:c24:adf4:5c73 with SMTP id
 a640c23a62f3a-c4ca795d0cemr1327717466b.1.1793799777447; Wed, 04 Nov 2026
 05:42:57 -0800 (PST)
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
 <CAHC9VhROsmzbm+AP63Sm7mqCokgEy6Zu0AVMY0gxp8qY75Pqiw@mail.gmail.com>
 <CAABTaaBOrPknzdxc5S6L9hGu7hbFu2e1RZG=Sxjb_B1Cs4Sixw@mail.gmail.com> <CAHC9VhQ4U-Z2KkGurfMihJgzGgwD3miWSW4wWAjWvUdDxLpH7Q@mail.gmail.com>
In-Reply-To: <CAHC9VhQ4U-Z2KkGurfMihJgzGgwD3miWSW4wWAjWvUdDxLpH7Q@mail.gmail.com>
From: Ricardo Robaina <rrobaina@redhat.com>
Date: Wed, 4 Nov 2026 10:42:46 -0300
X-Gm-Features: AclHuK9fArBl2NqgMDWGc__kMOSMhBxMeP1FQYdilvQJHUxXbryD-TLWb0XsxW4
Message-ID: <CAABTaaAYn1oBwHSkoGm0a98c9YUZKf6ie=yUOtR4FQuSjrusjg@mail.gmail.com>
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

On Tue, Nov 3, 2026 at 9:41=E2=80=AFPM Paul Moore <paul@paul-moore.com> wro=
te:
>
> On Fri, Oct 23, 2026 at 8:45=E2=80=AFAM Ricardo Robaina <rrobaina@redhat.=
com> wrote:
> > On Tue, Oct 20, 2026 at 1:39=E2=80=AFPM Paul Moore <paul@paul-moore.com=
> wrote:
> > > On Tue, Oct 13, 2026 at 8:36=E2=80=AFAM Ricardo Robaina <rrobaina@red=
hat.com> wrote:
> > > > On Thu, Oct 1, 2026 at 6:06=E2=80=AFPM Paul Moore <paul@paul-moore.=
com> wrote:
> > > > > On Tue, Sep 22, 2026 at 3:21=E2=80=AFPM Ricardo Robaina <rrobaina=
@redhat.com> wrote:
> > >
> > > ...
> > >
> > > > > * As pointed out by Sashiko, when you were converting all of the
> > > > > arches, it looks like you missed alpha.  I took a quick look and =
it
> > > > > appears that it should be a pretty straightforward conversion lik=
e
> > > > > most of the others.
> > > >
> > > > I've actually dropped the alpha patch as per Magnus's request [1].
> > > >
> > > > [1] https://lore.kernel.org/audit/CA+=3DFv5T4826T2sd0Gbh-nfZsqcWK_p=
hdBKy4BLWOvDTt92t5Eg@mail.gmail.com/
> > >
> > > The problem is that as things stand, this patchset breaks the build o=
n
> > > Alpha.  Perhaps this gets resolved during the current merge window,
> > > but as you know we can't break the kernel build ...
> > >
> > > https://lore.kernel.org/oe-kbuild-all/202610041836.6TatRQSm-lkp@intel=
.com
> >
> > Of course, you're absolutely right that we can't break the build. I
> > was afraid that this dependency might cause trouble.
> >
> > I noticed Magnus posted a pull request a few days ago containing the
> > "alpha: enable GENERIC_ENTRY" series [1]. It seems this will get
> > resolved during the current merge window.
>
> ... and it has, or at least it appears to me to be resolved.  I
> rebased the audit/dev-staging branch against v7.4-rc1 and Alpha does
> indeed appear to be using the generic syscall entry/exit code in v7.4.
> I think we should be all set here wrt Alpha, thanks.

I'm happy to hear it.

>
> > For future reference, what's the best way to handle dependencies on
> > other subsystem changes like this?
>
> Generally speaking communication and coordination :)  Talk with the
> subsystem devs/maintainers to understand what they are doing, let them
> know what you want to do, and find the best way to order things so
> that it all lands in Linus' tree without making a mess.  In this
> particular case, with the syscall arg audit patchset not being ready
> (missing maintainer ACKs) and the Alpha changes going into v7.4 it
> turns out to be quite easy, which is an important lesson: sometimes it
> is better to defer a new feature for a release just to ease the
> coordination burden, enable better testing, etc.
>
> --
> paul-moore.com
>

Thanks, Paul!

