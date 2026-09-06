Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEB23BB694
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 18:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788718596; cv=none; b=lzIXFxHrastlwLS+VApU8CETl4cYwqqf5Ze+L7QVGQhZQisENO6DExepFHroRsQT8mnmiq26pvUoHNQhOhExt8iw3feA1Z3JDkVFfYuNG3zmTL4gGw8bl+em5PcwonfxLfJQKhsUPY/Q9Otnv9hgPxD3wQZOVltzGRDCGF1NVF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788718596; c=relaxed/simple;
	bh=Jx6MWhhVtWjN5DixKrnjC8JBwcj2KAV+RtPJOvkKc5Q=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=s2XeqQQHx1asNFJz+Z1lGt99PrZDPNOP2gLzRjcqpnfUQCDdA/3PkGxBiIxR8cbgCPZA0BWjvPDXH9inkA3f3nXp0nOar5anxx4rA+vMmJGY2eADhBZkDpwQbnyTSufsm443wtbtVDbu6hTz/vaV+GtawKKJb5Ng7xA+5xFqu+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=My5wT8OQ; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="My5wT8OQ"
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 686IFdJ2989969
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Sun, 6 Sep 2026 11:15:39 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 686IFdJ2989969
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026082801; t=1788718541;
	bh=DhRKyzANNARtmaWAz4jDDix5ntjLK+kItZzluS+D+BQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=My5wT8OQBzVZyrqJR8KvHJV9I7W4IPlJ3k+N1opZm9C4RhQbBHPkMIsiGH4D2WXmq
	 +CYlxhppw5y9EgKmYnWHx4hLBlthWwC0uFmTSvcXgviltv2uImyN1pue9kESh+J2QJ
	 QbqRDmoUiTUb4BfVsk+UCS1z2gix8XSM0GJW/gZA+EArA5vCCzvzd0vq0af6CWn3Sp
	 w1loWnM91xquRmfSrUfad02Cmv3ACRf4eUTCU+rZGvw6WSTpm0/2DdkFZmDVFVF40O
	 44I7W65KC1lgkxbo8t7DhLUe0yBiwGrDdl0yrPQBj9eirxzUMqa6iEyjlEqYdB7b0k
	 0gTCPh/269mAA==
Date: Sun, 06 Sep 2026 11:15:33 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Borislav Petkov <bp@alien8.de>,
        Mauricio Faria de Oliveira <mfo@igalia.com>
CC: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Jan Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
        kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 2/5] x86/asm, x86/boot: expose inline memcmp()
User-Agent: K-9 Mail for Android
In-Reply-To: <20260906170116.GRap2cXOY6ENSzAXUJ@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com> <20260822-pvh-kasan-inline-v9-2-e70ef3b75b6a@igalia.com> <20260906170116.GRap2cXOY6ENSzAXUJ@fat_crate.local>
Message-ID: <E4FDF95C-3FAB-41DB-8EA0-8A26B964B38D@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On September 6, 2026 10:01:16 AM PDT, Borislav Petkov <bp@alien8=2Ede> wrot=
e:
>On Sat, Aug 22, 2026 at 03:33:18PM -0300, Mauricio Faria de Oliveira wrot=
e:
>> Move the inline memcmp function currently only available in 'boot/strin=
g=2Ec'
>> into the shared string function header <asm/shared/string=2Eh> to be re=
used=2E
>>=20
>> This is not done through <asm/string=2Eh> to avoid pulling unnecessary =
code
>> in 'boot/string=2Ec' that causes build errors in 'boot/compressed/strin=
g=2Ec'
>> and 'purgatory/purgatory=2Ero'=2E
>
>Please drop those '' quotes - it is perfectly clear that those are =2Ec f=
iles=2E
>
>> No functional changes=2E
>>=20
>> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia=2Ecom>
>>=20
>> ---
>>=20
>> Thanks to David Laight for noticing the return value difference between
>> inline and regular memcmp()=2E
>> ---
>>  arch/x86/boot/string=2Ec               | 13 ++-----------
>>  arch/x86/include/asm/shared/string=2Eh | 26 ++++++++++++++++++++++++++
>>  2 files changed, 28 insertions(+), 11 deletions(-)
>
>=2E=2E=2E
>
>> diff --git a/arch/x86/include/asm/shared/string=2Eh b/arch/x86/include/=
asm/shared/string=2Eh
>> new file mode 100644
>> index 0000000000000000000000000000000000000000=2E=2E06c1d5e5013e4d59cfb=
49866d10e164362d2c4cc
>> --- /dev/null
>> +++ b/arch/x86/include/asm/shared/string=2Eh
>> @@ -0,0 +1,26 @@
>> +/* SPDX-License-Identifier: GPL-2=2E0 */
>> +#ifndef _ASM_X86_SHARED_STRING_H
>> +#define _ASM_X86_SHARED_STRING_H
>> +
>> +/*
>> + * This inline memcmp() returns 0 (equal) or 1 (not equal)=2E
>> + * The regular memcmp() returns <0 (less than), 0 (equal), or >0 (grea=
ter than)
>> + * to indicate ordering as well=2E
>
>No need to overdo it:
>
>	Returns:	0 (equal)
>			1 (not equal)
>
>In contrast, the regular memcmp() follows glibc return value semantics=2E
>
>

Worth noting that memeq() and streq() are becoming used in other contexts,=
 e=2Eg=2E glibc=2E
