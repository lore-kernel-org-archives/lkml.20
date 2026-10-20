Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792514337;
	b=QmAitVFEqZ9sZ4Q4+yn6+1YHb+L4t4Cj+JwlcsTD1AQcWCKEg/EYIdZdhpWc6TaTTPnM
	 0CgvlO42xmsCh8kIuA7ecWl+uja7mMZtYSduFBwuzWFk4u+nzGYX0glJS9isGZhWcn1R4
	 4M9gSFwI8Rq+JpOFWQhDHOlesgSjHnTOrsyC/8Os3N93wZSJHSC8NPdb/oTNk4bo7ocwd
	 MEHE016Gz7qx8SSq0qFLHL91m9MRlD2FJLTmMZ2UDplzrkKZotGl3X90FnYie8PJjsYG9
	 cME+LMRFlKgZS9pCVAPfoyuTqt/L9PtPmFsDa+jEjHCXfPUJzO90aRbtpTbUACfMVvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5h6v8PMV52XAIibb0bLKm7PVGjK4muo/m4wCC4Oc5nw=;
	b=Fu3bmQqPVgnC13VcIVGyySU4GRlD0RN/+Yi72UcywChSJA8BKrhQdD6lxGWcsnwhxVw9
	 ST4fHfczZI2Okt5Yi+3t5T6dNu45hOClsRulC5nV2qaNavixrb30MWkK8naCQyJwRuWNw
	 t6+73si1vQ2U6FYfndDrly0In8Ch/41jGFLyzWG1fVIylmVV9VLYzUkM3nqfnq4HhsA/0
	 iPC0THHBfGtzroXQ7p/CteK/B8fjIaBAHKbWGWQqvsdY6iwoaNIP88iHbU7oELEmFp/NY
	 eQKagIGjjy1KjU2CxlnI56zXUlMCoO84xBbTWwc1UsMAcCZREPyu62E8W77stiIqGng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=GwYGVURA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0787606D53E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:38:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0787606D53E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=GwYGVURA
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e8ad5b31c7so19815915ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:38:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792514336; cv=none;
        d=google.com; s=arc-20260327;
        b=LqmY0ncJVguUhqxH7B1VckvRRG5Ylpj4SGvqL6SLZGa+xVxjpMhD+qUccWDU+TacJD
         /4JXlk+mCfs6JTDIC0q47nYHsflewE10JR2JAyKNQ3T+pi/ZSfMpzrDKeWg1cuQ9LbY7
         JOWLGRIfWCfFoEUM5iE9DXmIj7mNJVX7+eqCGdnmSo3loSV45JpydYkVqTwxa8VZFz6l
         X3V3MZ08wPwwCj0lrgCCPqSyHf8bNv8RBZb2hBo8rfuCIAhMKXuCltT3pSa+OYM+UPC/
         Wjag19TJCOhBCA4y/3e6WN0SC7kZMqGTOgm9TPXTkKzdgfsGBWHG4Vf+xdzE4nFdvcxm
         cNDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5h6v8PMV52XAIibb0bLKm7PVGjK4muo/m4wCC4Oc5nw=;
        fh=ZJH5016FevF4UtlxN+/8YWGXgE0joRYSZVU65mv++Xw=;
        b=hv0WOOr0GqEp4cBCEhZ3dYh6q2Rap6f5i++e3xZL2g9+aJDv+p0+rXzxr1z6ZpSamE
         SCv+tFsN72DaXhvxYwbrY+IBaPzbqwIk/I0scALUbwnllJt2AptoXPUuzaCj0LWezDnR
         ktYh1T/jIqanrbRB4KLcyBB2ikKbkFKCRSdD6L53HFAbX+Lv9Z0n+XEcx+2k6/RuCH/l
         j7Qf1rascH5qqVYNNAVY3NstPyS3psOLyvOAuL3NMAkJpZqsDSUSYc3d/M7m8M7f+Obz
         9nFs51mC68MOerssbk4M+8yv0HyTKciBIQf9KVZ7sMyU7ClvZ28/nz8KRv8sECRO4Tjk
         inMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1792514336; x=1793119136; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5h6v8PMV52XAIibb0bLKm7PVGjK4muo/m4wCC4Oc5nw=;
        b=GwYGVURAL7E3Gqp1mE6IbppA5fK/M6QVj3T4+Mu1VqNJAQWSHTCgIBs7lXAHx7VP4b
         X7Ol6JtjEVwHUVW/UUWijctAKk0S3FIF6sAkL2D0z4+yun1CiPIG05jQakKiuYArY+di
         qKUZ2JssWHS9PY4Rrbam2j+K8HSVipMYAjJhVwlz0qlw5vC30c9m2oPlM5nOac4bwKsb
         0iIOeo41vgbotndmbkqO3IW2nEL8EcaGXBwYuALkuaiWKHExqpmpd78k/kVF659++rVb
         16kcHMvBo17gh+L06xflahlYQXJ+NMSTGDwKIeHcy9Z1IKqewLhKEpxT50Ywi1EBHbtT
         Ya6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514336; x=1793119136;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5h6v8PMV52XAIibb0bLKm7PVGjK4muo/m4wCC4Oc5nw=;
        b=hpETUmAP+ICfUDjjMnKnjlhr2tCFKBM3FJzqfy+z0EYtjyuwbvfTGAigEaDgZCNiaG
         HknBgu/wWziF+HyQC0j1Ro+VAFfaZPHpVP7ZGYJxwQ4Fg4OjOatEfr23RdzCXhH5fCt1
         PTD/gYKZxZxI1F2kK7bIZxk4xOJuP8ZEJTGeNhTuETIUXElm5SJbrzSg/SjJBEQEbG/O
         1YPWb0KfEfxfUyOjcztHSQKe9Bzy9zHmPRWDNn71FYoq80sQLSKaMcJreakzA6vRTH5U
         9OD1WmgYJ5VNutTU7n98Sjj6LQLSm1S814FRWPjvBY0y0vCDPxoGV2yflg9TICULGP07
         S57A==
X-Forwarded-Encrypted: i=1; AKwUvBy1NTcT8kQ1thjggq+HWXCT+znHe82UPCPv4uNWoWj03BR1DBpBtZ4rn8xBWAH821E5xIUfj6KfuNVy9oY=@vger.kernel.org
X-Gm-Message-State: AFq9FYII8EpyY5JEejHVVJCFRv2YlEOEjuenrM6gaaD5M6DUMqmdHjd9
	dWHU/AMdF5e1k1FaHYh/iU9ViQbNqMCYm/8o5y4nXhn25R56lUQE4NPd4N/BobCznqDSU2CtXBa
	WqFIB4+jsAvyeNnMFxWfLIqlNPtpLvis1DFyy/mY8
X-Gm-Gg: AYBFou1KSAUDmhmE2aOfeqTuyI36PYdOgnZbYheR6ofs+nrwHmR+C3u1V96CKPQ/SlC
	rOKYZwBn2lEsiXDLQzFByYOFDZcaB5i/Fi3BRot3TadvSejTffOeRz9Cn7BTjSfYmY2gzZB3xaX
	c+nm5rHVX5xcGKt1UjgaxdvE3uZcH2/RfSu5/Xha/unwk/b2usAOj5Lyt/Wib1K/skbF6LpySfB
	mDqu+ISV9drj+yNTFrUD5UMW8U+JNyCNwpKkGJ7RTbCrhKfo5S6KulLVLU0Fgzst2akr2pXFJ0l
	4lF/eY8DmCxxQmtd6wxbFRuiA9ZdZbZbsatfuAHJW92gUeAT1GKLIMzc6kvAw8ftLhuuY/cNeTf
	NryxtFI+ZbTc=
X-Received: by 2002:a17:903:1111:b0:2e6:dcce:8227 with SMTP id
 d9443c01a7336-2e9a6c1a30dmr99034965ad.37.1792514336247; Tue, 20 Oct 2026
 09:38:56 -0700 (PDT)
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
In-Reply-To: <CAABTaaBL=TScs8Qqu3b8F6KZPGMyvwy6cBC3teDaBL6MGMucNg@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 20 Oct 2026 12:38:41 -0400
X-Gm-Features: AclHuK9ZakV6IFm9eD67kaqUic0iU1MgVPLS7VN6RgjPgTRZmZP6_X_XOYOX9ZU
Message-ID: <CAHC9VhROsmzbm+AP63Sm7mqCokgEy6Zu0AVMY0gxp8qY75Pqiw@mail.gmail.com>
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

On Tue, Oct 13, 2026 at 8:36=E2=80=AFAM Ricardo Robaina <rrobaina@redhat.co=
m> wrote:
> On Thu, Oct 1, 2026 at 6:06=E2=80=AFPM Paul Moore <paul@paul-moore.com> w=
rote:
> > On Tue, Sep 22, 2026 at 3:21=E2=80=AFPM Ricardo Robaina <rrobaina@redha=
t.com> wrote:

...

> > * As pointed out by Sashiko, when you were converting all of the
> > arches, it looks like you missed alpha.  I took a quick look and it
> > appears that it should be a pretty straightforward conversion like
> > most of the others.
>
> I've actually dropped the alpha patch as per Magnus's request [1].
>
> [1] https://lore.kernel.org/audit/CA+=3DFv5T4826T2sd0Gbh-nfZsqcWK_phdBKy4=
BLWOvDTt92t5Eg@mail.gmail.com/

The problem is that as things stand, this patchset breaks the build on
Alpha.  Perhaps this gets resolved during the current merge window,
but as you know we can't break the kernel build ...

https://lore.kernel.org/oe-kbuild-all/202610041836.6TatRQSm-lkp@intel.com

--=20
paul-moore.com
