Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9384B2798F8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788358788; cv=none; b=Ki/hDaxuXpGk4UiKjtrjdC2sVX5IaunfY9/33IcaPEN/OAorcgaeTIrTSlgq1ew4jeCwl5seP4C+uzjZxGeJtlgyL+yVOaNm7h2yJsLXHFzt+Y3SSr900Lf74GqpghPvcsqR8/CsJx6BkrcEtLBg/RWjrs7KCbm5WoST3wNMNGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788358788; c=relaxed/simple;
	bh=g/28rqhhbb/QWuUvNaBiA0mGQOWJc3+mDX14bIzW5Lk=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=FY9UwZpMbANwdLHLZ1VkMOvRHwgYiPQjlihBm7H459RPmCoZ05ZcDp3PMwZ3f7xbRhy0jx630BUJPs88LbI5ouyb2jgm2VJijqrUX5aem4e6xE1lpoaBIqTMHWeZGn1nVBy1qF1TXIiHK6Vfq5oDqoMnmyMQ3cTZk3tkAaWma/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=i6t+zDaz; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="i6t+zDaz"
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 682EIqnL3615183
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 2 Sep 2026 07:18:53 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 682EIqnL3615183
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026082801; t=1788358734;
	bh=9+cci75UmAKXSNYbyFNOPFn1zAmcIFOxmoM0RCeSqSw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=i6t+zDazNQW/PHul8N3EVpOl+Ov5fNuUkBVtoSR96j4zTguKq+uvxrLMleTcAGviV
	 3Mtu+gx5FV9r4Arst1+QPkPDetNgvsmYxLWSxtCNdND7H7i4l4TN8AbEVPdHHvwWT9
	 C83QjPihUd+f+E4Aazn/xY1ByIB5tHu6SwqqYDUy4PwsYog4+PEE1hp99z1s/4uqRd
	 8PCWy8im7IQZbugf0CQXdn9qdoSi5XV+lT6rsstlfcHgOOmKE4J4jHuXCVDGRZ6GWj
	 2MzmIbyciLU6ilAXSQ/ZqZDfHKSxtge7HiWQ/3m1dbrBOntoRybH212bSXMjouFGJv
	 r9tXB1rf68wdg==
Date: Wed, 02 Sep 2026 07:18:47 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: David Laight <david.laight.linux@gmail.com>,
        Jan Beulich <jbeulich@suse.com>
CC: Mauricio Faria de Oliveira <mfo@igalia.com>, kernel-dev@igalia.com,
        linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Brian Gerst <brgerst@gmail.com>
Subject: Re: [PATCH v9 1/5] x86/boot: Remove "cc" clobber from memcmp()
User-Agent: K-9 Mail for Android
In-Reply-To: <20260902093354.582c2f07@pumpkin>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com> <20260822-pvh-kasan-inline-v9-1-e70ef3b75b6a@igalia.com> <16110ecc-fc0d-4b9d-a958-2a75ca60b69f@suse.com> <20260902093354.582c2f07@pumpkin>
Message-ID: <F6CBA8E9-F901-47C8-982D-F23F38247D8C@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On September 2, 2026 1:33:54 AM PDT, David Laight <david=2Elaight=2Elinux@g=
mail=2Ecom> wrote:
>On Tue, 1 Sep 2026 15:16:58 +0200
>Jan Beulich <jbeulich@suse=2Ecom> wrote:
>
>> On 22=2E08=2E2026 20:33, Mauricio Faria de Oliveira wrote:
>> > According to the GCC documentation, conditions in the flags register
>> > (e=2Eg=2E, "=3D@ccnz") are output operands [1] and the compiler is aw=
are [2]=2E
>> >=20
>> > Also, clobbers (e=2Eg=2E, "cc") may not overlap with an output operan=
d [2]=2E
>> >=20
>> > Thus, remove the "cc" clobber as it is redudant, and overlaps with, t=
he
>> > "=3D@ccnz" output operand=2E
>> >=20
>> >     """
>> >     6=2E11=2E2=2E4 Flag Output Operands
>> >=20
>> >         On some targets, a special form of output operand exists by w=
hich
>> >         conditions in the flags register may be outputs of the asm=2E=
 [=2E=2E=2E]
>> >=20
>> >     6=2E11=2E2=2E6 Clobbers and Scratch Registers
>> >=20
>> >         While the compiler is aware of changes to entries listed in t=
he
>> >         output operands, [=2E=2E=2E]
>> >=20
>> >         Clobber descriptions may not in any way overlap with an input=
 or
>> >         output operand=2E [=2E=2E=2E]
>> >     """
>> >=20
>> > Reported-by: "H=2E Peter Anvin" <hpa@zytor=2Ecom>
>> > Link: https://lore=2Ekernel=2Eorg/all/5e19b195-0ca2-4510-81cb-497b40e=
4aaf5@zytor=2Ecom/
>> > Fixes: a8c171c107c0 ("x86/boot: Add volatile, clobbers and zero-lengt=
h test in memcmp()")
>> > Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia=2Ecom>
>> > Link: https://gcc=2Egnu=2Eorg/onlinedocs/gcc/Extended-Asm=2Ehtml#Flag=
-Output-Operands [1]
>> > Link: https://gcc=2Egnu=2Eorg/onlinedocs/gcc/Extended-Asm=2Ehtml#Clob=
bers-and-Scratch-Registers-1 [2] =20
>>=20
>> Reviewed-by: Jan Beulich <jbeulich@suse=2Ecom>
>>=20
>> > --- a/arch/x86/boot/string=2Ec
>> > +++ b/arch/x86/boot/string=2Ec
>> > @@ -40,7 +40,7 @@ int memcmp(const void *s1, const void *s2, size_t l=
en)
>> >  	asm volatile("test %3, %3\n\t"
>> >  		     "repe cmpsb"
>> >  		     : "=3D@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len)
>> > -		     : : "cc", "memory");
>> > +		     : : "memory"); =20
>>=20
>> In fact I'm using a modified gcc which properly rejects such conflictin=
g
>> uses of output and clobber=2E ("cc" clobbers are redundant on x86 anywa=
y=2E)
>
>And, if "cc" clobber wasn't redundant, you'd need clobbers for the cc fla=
gs
>that weren't being used as output values=2E
>
>David
>
>>=20
>> Jan
>>=20
>

No=2E The condition codes aren't orthogonal like that=2E There is only one=
 flags register=2E=20

(On x86 I believe asm statements are assumed to clobber the flags uncondit=
ionally, because it is so common=2E)
