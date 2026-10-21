Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792552412;
	b=fb3aai4RcNV59Sg4ZZRfqS5sU2bJRoV3aZSfaIpWrsCrKEKkp9ilm25W0e0UuX2JiZV/
	 KG1Opbp57uNS+h/bwoPkeDovJQdKB/d5iVx3l0U4yjWc6Mxrs5/gGFq+SFTVzPFRiM5VU
	 pjNm0A7AknUPaMqq4QWfr57IHF9l05PTcz7iY0sfpTIxIT3cYk+FWt71I18L6W3bSd9uH
	 6arAfYXlrRCVMZtKVpcohVMUOciJzUIT/3fAUeecwJr7a3yDyDLe5EiUMpjDrkANVB4jU
	 Bzt6rxtXO3SN6eJ70/LrgSiftydWiyqA8mAnZuy8DKMKWgSjVvocGVhndjTIPHloodA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792552412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=owTD2m6CJPZ7PTH8TbTKp/ZkKH93Z4csYcnVmchEj2Y=;
	b=O61n9MfYKqTQXMTyMJSAYmmt5Ze2G2Z7tN3gL9ps9n/trL8oQQSgzdiXbKSYztmnV4pR
	 lPpWEg/wEJs4LLBAwPyMDFJljhDOpMv/aBXoL6UE1eaJk05gFxNo5dx/tBnG9YTLqW4U8
	 78rrgGIlgevXobIFBlJ8naXc6xSpAn0fud79ElXBydfDGb/7bJuej/xkGYjyC0jI91BQ+
	 oZADm2Eg9iel/wNK5sC9eJ8ultoa0SlHaP58SyAbT8hAjsLSyOvSNIiKgLAgoxaIrK78o
	 raXS6957l4lsUt9LysOmPs3+dr9hs/MXFXt3TL8nLYX8ZgARQedqMcD+8HxZzxZ96jw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I75PRIon;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE37606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EE37606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I75PRIon
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6f5a0893610so129502eaf.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:13:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792552411; cv=none;
        d=google.com; s=arc-20260327;
        b=drETo+IJxKvD75Z8JOdnjprb+6sE+2Acn2z9SAch5lcry2cCPgds32sVLlhr3Ix4RQ
         DexYAVNiajXzX0+FvLXirC6krYoSp2rtJRwoA1pdS8sKCpM3omU9WhPeP6YkTB7jLI/d
         7pdRvGhqT/+Tv9D/MTMcdlIMhZhcj514NkSrz6XvpZv0FPg5RUwU3FX4XdcUB/Fy1DHU
         cXfiPg/5HZtbxUFQkSLV7iKj5NsqOtfogVh4l1cUNzF1p4ffocDHm2/mGKuXkk7mGvHb
         G4INjO9os8Xr02a6aaKLHr7HxHxoBBbXZ7szfv1SMMuEXlzg0HSI0vVC5WKz/sj5U9eX
         5ejA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=owTD2m6CJPZ7PTH8TbTKp/ZkKH93Z4csYcnVmchEj2Y=;
        fh=vOJ4aO6moymd+tKQpPlExnDGAoJYnQBZFWWNGHQRTU4=;
        b=SnqPh43EDx43j0eYA6fTanYH+vnITBiVRv41+kQQECk8Ui2EQHtJ5fndOghQpdRRl7
         QyUE0oDkuLZm31A128rdYhJ2B+ru9Ko0+kgOUkpNGC+a1AwNns6ttzjvEpaGVSzT5vfO
         tXkKcvyU7PE5DGtGYI0G+bproYnsFdXFrwmJn7YTgn0z6JKYUVDTjeoSyBj+QRM35Jzk
         zarEPxDE7nB0yPM3nDO2f1qNOhSigeeEpRFavQp/SXzOQ8Ga1PZjbbKeZO4rUKQJnA1t
         NdGuSPrPPr+YGbGLt28KtUrsJEdov+yn+vswyMKvjETOeq1Ut7osNzAMxxzAaRJKSg3W
         ffqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792552411; x=1793157211; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=owTD2m6CJPZ7PTH8TbTKp/ZkKH93Z4csYcnVmchEj2Y=;
        b=I75PRIonupBYmXgnY0nF9muLapluPbJMRRPCt5Aj02Vnl5k0lMYiJRbmCRIwLJZo4y
         4+kg+MYE0Ewcbwv/QktrPStSZ0hysgqqmHezsZtB5+dg50ncWqLYoFsAEpR3lzpHUdFU
         Ot/T0FAxzEJo5RJrXOiBnySK8KOLzwkMBe0lQs6aG3en60Uhzw7xK9DPpwX/SMu/1pnK
         7SwaFNojOnL8ZRQJociCBCC04VFeFlvuCrYR3xGlMPEdaBuBbnzEN/gTzATJFN2La2f0
         QKTTnOGV3GazVSGTiZ82gv5dcZsWTrPUHmvotmHBfpZeFK9U1WXxrtAf95EZlkRU+GOR
         cBpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792552411; x=1793157211;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=owTD2m6CJPZ7PTH8TbTKp/ZkKH93Z4csYcnVmchEj2Y=;
        b=BEPSd0hnEb3Ja0eJF3pmQ9aIbbNK4jbhly1611SAkJDjTt/MRPbxmRpc3Gs0QnUDL2
         043VVLpyD93RsJlQvgXjELAp0Y/2miDj7TbjamvJohk73EDLj9vUBrb9Vy0OSQ9VYHp9
         +UlNgFL0winnEBd7zxp+G3cdFm8+2jtfoQhcx6yv8+5T4NCu07d/K2ExYVW35OyvFaHh
         bTUmjecgUUDvyGJMPAzvoxqTvJLxW0gi8ERziKu08CH8WrJ4QHjy9O6YkWanWL9E6hve
         WIX6dTKoBh17g7k8Rr9SDqvOMD9zQ8aRBRof1KmJL/FsJSDbnwti7PPGDs6LKQmwVmr2
         iytA==
X-Forwarded-Encrypted: i=1; AKwUvBx62AKJNF08iXjgfdSY+D/dGSbY9k6GcSJ01fsU6Ydv/lcWIqkhOl5D/9xQxBrJGlzzR7EVZDJvovaIJ4M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVe1EwFynNQVlBVGFWOJxKwJLwMcsbM4j8son4DjtSUp91pJLP
	a8HCdZvQttV4ov6BOf9mYpyIX/TUFQVkDY1sxt2mvTn0/vlFSgwsshvA/SEwgnrgxMeHfVITObw
	NOYryc+5xDfbHKIAQhHwhkpPFt6wXqyEhomHFf7tD2MxZ
X-Gm-Gg: AYBFou0Ik412raf4sj7Mz8LubX1++fSt7/bUpl7bP5o1Pnfw9vZw4CR7O53xOZ4ZlOf
	K1a2GDlujSse1WUrRCFL+yvF/3HCWlPDhTuHmWUaoYAfbdv5bJejdD4PXZfTbK9YWnylLFFCvgw
	gIhICQZhAe6jfk6Fpu4cmbB+PUJNuwqYTTk0TJyGnnTFJHw4U+7Q9focRD5++RoTvqTidOk+1Lt
	1V3vr2t4qRek+BIsnpb6rCfDpRpuyh/bWFVx9z8wXGxbV6/R0/ORzSD3DwfonMLxmsGe0Gq0eAR
	kK53GCwLgf2WGXPYuEA7wz3KOkBRH5xNcwl3DtPzhxHZytol6EKCUmFSQpqrEOfLvN/fBzYyto2
	QHUlhvNYGaeSquvY=
X-Received: by 2002:a05:6820:1509:b0:700:e002:672e with SMTP id
 006d021491bc7-709418305c0mr412441eaf.51.1792552410713; Tue, 20 Oct 2026
 20:13:30 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020101225.917959-1-thnkslprpt@gmail.com> <E2C67135-E62C-4E68-9087-4E3CE47E5A4D@mainlining.org>
 <CAKOB7-YhfVyoo95LtfOSkJTVxgjOA0bxPBndca5L+9M9MXTSHw@mail.gmail.com>
 <FBD0DC2E-B6C0-400A-A2C2-BA8BA127E43E@mainlining.org> <20261020174643.41ce3b98434d0791af79cda7@linux-foundation.org>
In-Reply-To: <20261020174643.41ce3b98434d0791af79cda7@linux-foundation.org>
From: Avi Weiss <thnkslprpt@gmail.com>
Date: Wed, 21 Oct 2026 06:13:19 +0300
X-Gm-Features: AclHuK8xZRF3lRC3S_wUQIry6dMzmtmdN_w7orHwZGtwH1nVBXyf2m17-ei9IDY
Message-ID: <CAKOB7-a2bgiUMYdV7Txa3Wjd8WNkrSrurzN5paiCQJu1HE-DYQ@mail.gmail.com>
Subject: Re: [PATCH] profiling: fix sampling step on 64-bit big-endian systems
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Bradley Morgan <brads@mainlining.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

FYI Bradley I left it running overnight and got these to compile successfully:
s390x
sparc64
powerpc64-be
x86_64
arm64
i386
powerpc64-le
mips
riscv64
loongarch
armhf
armel
alpha
arc
microblaze
xtensa
csky
um
nios2

These I couldn't get the toolchain settings right so they never started:
parisc64
m68k
sh
hexagon

On Wed, 21 Oct 2026 at 03:46, Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Tue, 20 Oct 2026 17:50:24 +0100 Bradley Morgan <brads@mainlining.org> wrote:
>
> > On 20 October 2026 17:47:22 BST, Avi Weiss <thnkslprpt@gmail.com> wrote:
> > >I'm happy to try it anyway - just so I know how for future patches.
> > >I'll see how many I can run through before my laptop gives up ;-)
> >
> > sometimes the crux is for these kinds of patches something in some cryptic
> > arch gets messed up in vmlinux stage, odd right?
> >
> > This *makes sense* for me, off the top of my head and thinking hard id say
> > this *shouldn't* do anything bad to a cryptic architecture, but I've been
> > shocked in the past.
>
> OK, read_profile() makes me question my career choices.
>
> It starts out with totally inappropriate type choices then bandaids
> over that by typecasting just about every damn thing in there.  None of
> it is commented, natch.
>
> I'll grab Avi's fix for this merge window.  I persuaded the
> coin-operated coding machine to generate a couple of patches to fix a
> pre-existing thing and to clean up that code.  I'll send them
> separately so Sashiko takes a look.  Please review.
