Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA8E472545
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 23:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788995593; cv=none; b=ooM3AGzmi1Lkd/dQ5oSZlIiq1q90I1JeaAvIji9e1AoCAYWktIpTX6NRjAE9AVN8+Cl8s3qHEGrE78fGHwy1MImzCoqvnlMP3bjHsB2q0MpkpyRY7+KxK20tvPv3x4Gj+UWE4OGtoT/EIgJQGE2rGW7BiNLJxAIgtMWhbqHSWQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788995593; c=relaxed/simple;
	bh=9wmKe0tT4k7TRT4eL9VdlFFODN8mM2wkhONcBKuX6GI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=ubSVVnhW0fGj8JqtE/S3gEXLiI+WNXuCsSQk1EBsrQcW/jIjrrvK1Qy5H94BrwicrQrvJbrbR7AhGt2ifhTUYlAR/1lSm90HK8SCPOd3FbFD7ng5VlUJAQty18AvH3h0zMjioIRDuFmIE/wjwZPeQKAwXiO9FGQ/MWRdrEM1lFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=BfXbzxtQ; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="BfXbzxtQ"
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 689NCRHa620834
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 9 Sep 2026 16:12:28 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 689NCRHa620834
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026082801; t=1788995549;
	bh=R/8nMPS3dvCdQrQ8+hytYRqJVY0aLJ29jddBRs4THwo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=BfXbzxtQljma3DPp+z1n7nZZBVIiCTYHFVbmngpcJlUb9S/8wubQ3mPZaZgtqGyUe
	 w2sG6l/nWEpiKuI2fQ8IeODF2F6YGEfrGyurEObB9+BWseQYUpCyx0dDOb/7ip59ZE
	 PUXdAZixQkKfdXJuF0iixatU7BhJ05RHO3S0phCXNd4RBHiGgOHLZXGpcdX/uWLbvV
	 96lwK16wsBjytCqOLQZ5cL0aYbU4tcH1bAhLHPN04Tpgwez2bgkBtj8+OHpZQg5riS
	 BembEYyOZqW7I6whRYJEDBqd0SPEvgVJrnRr9QV9WVUsEKxPiFQ5OMUvtGvjmS8i+9
	 lT+oljNGv5q1A==
Date: Wed, 09 Sep 2026 16:12:20 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: David Laight <david.laight.linux@gmail.com>
CC: Borislav Petkov <bp@alien8.de>,
        Mauricio Faria de Oliveira <mfo@igalia.com>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Jan Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
        kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 2/5] x86/asm, x86/boot: expose inline memcmp()
User-Agent: K-9 Mail for Android
In-Reply-To: <20260909223951.1fe5fe25@pumpkin>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com> <20260822-pvh-kasan-inline-v9-2-e70ef3b75b6a@igalia.com> <20260906170116.GRap2cXOY6ENSzAXUJ@fat_crate.local> <E4FDF95C-3FAB-41DB-8EA0-8A26B964B38D@zytor.com> <d1b9ff734b918889eaf8885d64141bc3@igalia.com> <20260908193229.GFaqBizWcssBoewNSo@fat_crate.local> <e74c5a6b-ed9c-40c6-b9d7-ff04ee8c099e@zytor.com> <20260909093831.095b89cb@pumpkin> <8b00b7d2-2bd3-4871-9908-9fe1568d2690@zytor.com> <20260909202838.28071bff@pumpkin> <95D5AACE-1D91-402A-9B6B-8D03C3D90705@zytor.com> <20260909223951.1fe5fe25@pumpkin>
Message-ID: <7046AFCC-2E5C-438B-BF53-907F09640572@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On September 9, 2026 2:39:51 PM PDT, David Laight <david=2Elaight=2Elinux@g=
mail=2Ecom> wrote:
>On Wed, 09 Sep 2026 12:33:40 -0700
>"H=2E Peter Anvin" <hpa@zytor=2Ecom> wrote:
>
>> On September 9, 2026 12:28:38 PM PDT, David Laight <david=2Elaight=2Eli=
nux@gmail=2Ecom> wrote:
>> >On Wed, 9 Sep 2026 06:43:01 -0700
>> >"H=2E Peter Anvin" <hpa@zytor=2Ecom> wrote:
>> > =20
>> >> On 2026-09-09 01:38, David Laight wrote: =20
>> >> >>
>> >> >> Here is an out-of-line compact memcmp() which works for both 16/3=
2 and 64 bits:
>> >> >>   =20
>> >> <broken code removed>
>> >>  =20
>> >> >>
>> >> >> On 64 bits it compiles to:
>> >> >>
>> >> >> 0000000000000000 <memcmp>:
>> >> >>    0:   48 89 d1                mov    %rdx,%rcx
>> >> >>    3:   31 d2                   xor    %edx,%edx
>> >> >>    5:   31 c0                   xor    %eax,%eax
>> >> >>    7:   f3 a6                   repz cmpsb (%rdi),(%rsi)
>> >> >>    9:   0f 97 c2                seta   %dl
>> >> >>    c:   0f 92 c0                setb   %al
>> >> >>    f:   29 d0                   sub    %edx,%eax   =20
>> >> >=20
>> >> > That isn't the object code from the source =2E=2E=2E
>> >> >    =20
>> >> And that's the ultimate hint that a cut and paste error had happened=
=2E
>> >>=20
>> >> This was the actual source code=2E
>> >>=20
>> >> int memcmp(const void *s1, const void *s2, size_t len)
>> >> {
>> >>     int lt, gt;
>> >>=20
>> >>     /*
>> >>      * Note: for the benefit of 64-bit code, xDI and xSI are reverse=
d
>> >>      * compared with what CMPSB uses; hence SETA and SETB are also r=
eversed=2E
>> >>      *
>> >>      * The XOR statements set ZF =3D 1, CF =3D 0, which is required =
to handle
>> >>      * the case len =3D=3D 0 correctly=2E
>> >>      */
>> >>     asm volatile("xor %[lt],%[lt] ; "
>> >>                  "xor %[gt],%[gt] ; "
>> >>                  "repe cmpsb ; "
>> >>                  "seta %b[lt] ; "
>> >>                  "setb %b[gt]"
>> >>                  : "+D" (s1), "+S" (s2), "+c" (len),
>> >>                    [lt] "=3D&q" (lt), [gt] "=3D&q" (gt)
>> >>                  : : "cc", "memory");
>> >>     return gt - lt;
>> >> }
>> >>  =20
>> >
>> >Try:
>> >
>> >int memcmp_2(const void *s1, const void *s2, unsigned long len)
>> >{
>> >    signed char lt, gt;
>> >
>> >    asm volatile("repe cmpsb ; "
>> >                 "seta %[lt] ; "
>> >                 "setb %[gt]"
>> >                 : "+D" (s1), "+S" (s2), "+c" (len),
>> >                   [lt] "=3D&q" (lt), [gt] "=3D&q" (gt)
>> >                 : : "cc", "memory");
>> >    return (signed char)(gt - lt);
>> >}
>> >
>> >https://www=2Egodbolt=2Eorg/z/6hrxGxb18
>> >
>> >Saves the XORs - go away completely in the usual case of 'if (memcpy(=
=2E=2E=2E=2E))'=2E
>> >The 'mess' on the return statement moves the sign extend after the
>> >subtract=2E
>> >
>> >David =20
>>=20
>> The xors are explicitly in the asm to deal with the len =3D 0 case (thi=
s is for the out of line version!)
>>=20
>> We need to enter with ZF =3D 1 CF =3D 0=2E
>
>And, of course, I knew that=2E
>They also zero the high 24bits of the registers=2E
>Given the setup cost of 'repe cmpsb' I suspect the xor just add code
>bytes=2E
>
>David
>
>

The XOR is cheaper than the sign extend; look at the object code=2E
