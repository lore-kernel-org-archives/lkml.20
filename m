Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793811311;
	b=LxJF/z/F9VJru86Hdv1aRF6qSXnnLWm9QB+msVzxb7DKTO1Yh64V+t4pEseeXLC9nSRl
	 lgactWrbCFxD+bOJDbnlfat/2ZoWncDfIviCWg7M8ONw6FIgT8UGrJgl9nBS9BGctM9VV
	 LWKRNc9OMJNoFSm6Y2rtwetEk3taz3kgtuVdwOAp79Z4WZDelHl0b5v7tv/XVUMknDlRV
	 BgqQhSCZkAj2nGL5N0LmJ0sugQMsYTx4OWJjD5Z54Tv6vftovgIveEczlJepG0kA6IJDY
	 FfzcnCXWWlFO+NX//CFilgc1fW/t1asKgVccTMuSv9SiJEuO9dMiK4WYRqwJ7S8DNZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811311;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dJHknsWINV2q+AXBD5YPzcv7ChvXNO7Eg793ssWVnCM=;
	b=EccmGvKM6/lxe7pkp3CBatd0C4DHKnplx+rxSGlpHr/VMJ6hl8DMEkXr3l6Tyc4pg9M2
	 pfHsSgIx1/Oj69D0gwa2nNC/UEUgTVsz498VTHv6AXjKMT4iWdnAmfv97ec6aChFNn8K5
	 tlhgHCEUYWVYXpjp9O56VGAbpyr9gIerK082bVNwoBz5jnpqF2XPNNXG3D7JcqSD9BYZB
	 SNqxweFk0+a5ThDjUV4qNuSOVmp9ThpgMvvX/xqyMVMj/HiB7jJarDPM7i1lAId0MnE5K
	 vlOaX38wByFlf4Pt4cKjOnkyrvqmVvTSoYyL6hqblOvI9+lVb2QHUBhTeO6BIkuKbVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fLZkm0q3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFA2606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:55:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCFA2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fLZkm0q3
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso4555075e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:55:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793811309; cv=none;
        d=google.com; s=arc-20260327;
        b=nabzyUbmVXkZE8M+ROBL5c0vIMqvnLWZutBCu4Kv7IungOkUFLEIc/ywlJnyjfpd+o
         M2WvRD6VQwf8nv2mCEJ9nbvunGdU84wXf2v4PC2+MQE3bXs6xm2D8V3ToXxMWx/YQQlN
         sZAbm5Nal5yH+I/fktLhlTYPwxleshOH77aSSBOupN06mUJi6C8k0zZ76ECwV8CB4Byw
         6uCd5ktSUHUT/Fnm0DdN91zih81XUVd9HML1Jap+h4b03FdUHhJDbKvOooRQ4BZm5Mte
         rqGkNHdj1cGMhDufwAXh/6EtpYPUZqjPSvQry5ZNM0uVM0+R5NdUQXqT6R25Pw/q+Az2
         5czg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dJHknsWINV2q+AXBD5YPzcv7ChvXNO7Eg793ssWVnCM=;
        fh=0ABb8QMqr0uuMWcIlUbX6XYIlVNmvf71Xp0xElQ9Usk=;
        b=pjV1PMDIs/uWkj5saKv3CBqL8aZgxSD+cP2kgApHUL/pj5Dsx3YJ+jjc+qkPGMeDro
         oQ3GkX6bLkuEkGhdK/yGG1ECGVS/lLYAAF2ExhZcAGxQzWueshcbb/v7UEoe8D3aB9j1
         pZZnvu/TYGZDkJndL6h3+jkb6S7Mp9p2gKKc4TM9x+XMu9a6vhuGQDvbZqMxsQXSBNVP
         FUCfoUTGERusfTPdM2g0giCxHf4U2TJ3o3u+0IcnSx2VQsqWrj6z0UFAjBdWafwdc99I
         r/74Ze6Q0HYbISM4DJSVuuvO41zIZZGoxeY+p5BTvnoOLE4ylqSel+a5c0wDky6MHyZ6
         yhwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793811309; x=1794416109; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dJHknsWINV2q+AXBD5YPzcv7ChvXNO7Eg793ssWVnCM=;
        b=fLZkm0q37XBcN8I5V572Kctn/znbnZSKlOY6jPPt2A4+RJ/CwrWlBSJt+6q8AJIJ2T
         cEqQPvbmHfJAvUz77oJhe9GghRnEtZIMgh7LXrCRxxqhqpAqX2BSQbZ3+/nIVBWjCvBp
         /8O+4lDUXxBE/ceotv+a0SQPmUSI+dUhIChj2vtDc0L1/UapcOcNGQR/k2bKyTiEzgFU
         GyPxmTCf13mHQJAmpA+Su1yn7ay7dy/QxdRPybIOzsLUeipp6CVCMymuzP62w6oT4yFt
         0awS2hzO4U6IMJMr3gb1tlEOaRcadjnq9W/fVk2ByIwwxK0l1m8Q4C23Ibp4FMsmsECG
         Ik4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811309; x=1794416109;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dJHknsWINV2q+AXBD5YPzcv7ChvXNO7Eg793ssWVnCM=;
        b=dHv3dcxZ5cScfzPH3oSxmDJwKa479d28eUfmLOYCjAcosUxn1k8oEmNoq+ShGXAyWj
         z71+ni8WDdKNUKsfKqIPEEiSVUnD6xhMQ2PMClVkrhkH8I3YG38vlHFnnPB3z2+o9//0
         oiLW+7BC9ccsl2M0bJmwv0/RYgHWdyJFQm4y1oxh/46C1eXwp4sOC4B75uxp0nPnDuzJ
         Rg9vMkzlKRs+3XxZwR949ky6OG0CSy3wX9l/aoP3kkqUZJyWAq2Pragb4YyubHFr9EDq
         IocRFX64OnfIuWg5ws/6Zm180Wz5XKasBWg1rcQ+sFx4Yz6EDZkMhC54l/eiSp+nnRaj
         YhlQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4olPM4m+MZPnI4sSYzFBTGJaX5dsPq8Cs9i4Aoykf/19zy16+J3diz57FddOnQieEbfXq7vTt8TvXG5E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cXqIE3Hkc228o2jSK8PaSekw65+BNMOECsKXdSsp1JsBCyx1Z
	0925qzgvqr6t9HP/v6MfsXF1HAl7iob3a7CSt2dU5fqTcLzTr9obpkbdATgCJFrRbR3JNECQ+RX
	MlvQCHtRHH52Tle9NG0hu4KBC1YiHL9YnAjJxRaMI
X-Gm-Gg: AYBFou0d5YJwodyxetueyhwHEU7RQhg06A7IPWil0ieomB4/vhK1122bdnKy6q6M8BI
	y2DH1Y8PrS8tn2hCv6hYH1O9db1qRJhXRlQPmvYpNr1euAbxBoxcUy1A5qB0B5oQuj2ggHhABGG
	kK3ZqTvashifHYmrLSfL8w2koEsibGdDscuRZQmRJSR5J35vznweBzBxTR6Dv3f6llHT11fBGlN
	n81zqE8jI2iFR+0KyOiegpHwMy2ILo6q27+D1cfyj41JgKIAREDqcYEdgl8sQRKQNUei404zP9L
	aabrzbwqbqm0xEiff7VCdU2uegNEky0m/wz+Me2SZjxMtk9ZazoVvqFO/GPLGxorcKxKRunNGWp
	jEYLhXHfIDtnewqRLg6ii8CIJsNp+xruPcvyw+upr+oF5tzldAN87tWrGkMh37D1Ae3Gh17G459
	hyyMP9wIWHxVgpWhcmFL+N5RvX6yRshYACAVSdbq9+uEHrZWkABcJFNuhcH+z1Y0HX+xNMaokNU
	ibVbdqyc6hcZKY0KzQO/HDI3Tb9vbF2wjMzog==
X-Received: by 2002:a05:600c:3f0a:b0:4a3:7344:13b4 with SMTP id
 5b1f17b1804b1-4ac1709a2d0mr359812735e9.14.1793811308661; Wed, 04 Nov 2026
 08:55:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103060658.696994-1-martin.ankerl@gmail.com>
 <CAKwvOdmXSH2W0evc6XF+2yjr1qg3oUExiy-pF+LAx4_iHycu7g@mail.gmail.com> <CAAFOosZkUXst22MOVUyJW6mdjnAO2XgKWJ_NuFp37QJWk_nk-w@mail.gmail.com>
In-Reply-To: <CAAFOosZkUXst22MOVUyJW6mdjnAO2XgKWJ_NuFp37QJWk_nk-w@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 4 Nov 2026 08:54:57 -0800
X-Gm-Features: AclHuK_MognXqVzsN7aCO-Tzc_dSSdkDWIg--v7GYGsPmy7ERKpNDianikR4RWc
Message-ID: <CAKwvOd=YHcfaWOn9-tPK7-ZLop+erypMQWteHj-p1x7KApbAyg@mail.gmail.com>
Subject: Re: [PATCH] x86/cpu: Use prefetcht0 for prefetch() on 64-bit
To: Martin Leitner-Ankerl <martin.ankerl@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Andi Kleen <ak@linux.intel.com>, 
	Youling Tang <youling.tang@linux.dev>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Youling Tang <tangyouling@kylinos.cn>, 
	Nikolay Borisov <nik.borisov@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 10:49=E2=80=AFPM Martin Leitner-Ankerl
<martin.ankerl@gmail.com> wrote:
>
> > Thanks for the patch!
> > Is there a reason to have the cast vs simply use "r" constraint and
> > deref in the inline asm?
> > asm("prefetcht0 (%0)" : : "r" (x));
> > https://godbolt.org/z/xezh15oMe
>
> I mostly did it to be consistent with the 32-bit prefetch() and prefetchw=
()
> in the same file, but it also has a codegen benefit. With "m" the compile=
r
> can put an offset or index in the prefetcht0 itself, while with "r" it ne=
eds
> to compute the address into a register first:
> https://godbolt.org/z/j311eYzsY

Interesting! I learn more about inline asm everyday...

>
> Thanks for the ack!
> Martin



--=20
Thanks,
~Nick Desaulniers
