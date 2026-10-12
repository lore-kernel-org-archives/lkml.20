Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11364BD798;
	Mon, 12 Oct 2026 19:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791833131; cv=none; b=fXOVOQG7IvEFX0Am6gGwHNRkmbcvB399XZPtPRIMLULXz6RsGEIp9+USQQvxWIqgWOqeGDYwzwSoEPEXTdE+meNd0PehVyWcvtqg9az0z3f2XKNZSJOZ9C8C0CFuCIetEs3TTQ9l4O6QGyqVX+6/5CChSSeDIlZveVc/AnSRyKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791833131; c=relaxed/simple;
	bh=o447zsGNPwyGinGv9HcXwIhUnX2VZBKog1Cfec/2gEY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=j/7gnCjNGTFiNxrAEaJ/ZohbXcSwHRrxJi9uENSIxGQx9vtFOgNO3IGtWg6f75ZDeC7CKeaOm5J3oZmVu/BfUls3LwHE5DutZXTPmtr+8ZCTS3EiXLlsfTEfjMUHBFuZBWxrTuvr81pdI2lUJPLhgDdq+DPhmE1CNomdc/WuTfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=kw4mNG4/; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="kw4mNG4/"
Received: from ehlo.thunderbird.net ([172.56.213.145])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 69CJOuGE954325
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 12 Oct 2026 12:24:57 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 69CJOuGE954325
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026092801; t=1791833097;
	bh=yAoccG/LTttD1h9L3r5SW6HRQUuXcC+JCP51wkvLU30=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=kw4mNG4/7IHPtMe0pOKvp2osW858vqnhSfpRr9iX0ZyOkNdJogL4o8ji2nwY8jMz/
	 lYWcj6WrTraRc0VLGkb1nxEMVnxvNxg6X92zh5FnrqLhUcRLLMuE7w6IJs5oyfk3PV
	 dL1d3g7OXf0jmWaDZ4b/7m4sx0w6wRN54FWnq+e/4nu06IMhSShNVK9HXvrlh6GmOO
	 Tr0DwTrhkKQb9USemmPYmdfdqLOa0d4EMoI71Z9w0l3WSdn7YRldXUZXnHwen0OADj
	 WsvJ1MZFc6tTjuUqGZuqibzF+cA5MmTC4lGNhSEQ9PDRJm1MJE4NAhqE/MOt0dF+KM
	 voMzdj9Wqw3Ew==
Date: Mon, 12 Oct 2026 12:24:46 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Borislav Petkov <bp@alien8.de>, Luiz Capitulino <luizcap@redhat.com>
CC: x86@kernel.org, tglx@kernel.org, mingo@redhat.com,
        dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, corbet@lwn.net, rppt@kernel.org,
        blum@kernel.org, david@kernel.org, linux-mm@kvack.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3=5D_x86/corruption-check=3A_Remov?=
 =?US-ASCII?Q?e_the_BIOS_memory_corruption_check_feature?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20261010194519.GAasqVz2brXiOLegQi@fat_crate.local>
References: <20261010153604.1885381-1-luizcap@redhat.com> <20261010194519.GAasqVz2brXiOLegQi@fat_crate.local>
Message-ID: <33A35EDB-3AD7-4F29-85B1-4D9C9B41C874@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 10, 2026 12:45:19 PM PDT, Borislav Petkov <bp@alien8=2Ede> wrote=
:
>On Sat, Oct 10, 2026 at 11:36:04AM -0400, Luiz Capitulino wrote:
>> By default, the BIOS memory corruption check works by reserving the
>> first 64 KiB physical area from memblock, zeroing it and then scanning =
it
>> periodically=2E
>>=20
>> However, this functionality has been broken in its default configuratio=
n
>> since v5=2E13 by two commits:
>>=20
>> - Commit a799c2bd29d1 ("x86/setup: Consolidate early memory reservation=
s")=2E
>>   Moved trim_low_memory_range() into early_reserve_memory(), which runs
>>   earlier in setup_arch(), causing the first 64 KiB to be reserved (whe=
n
>>   CONFIG_X86_RESERVE_LOW=3D64) before setup_bios_corruption_check() run=
s
>>=20
>> - Commit f1d4d47c5851 ("x86/setup: Always reserve the first 1M of RAM")=
=2E
>>   Hardcodes the reservation of the first 64 KiB early in
>>   early_reserve_memory()
>>=20
>> It might be possible to get the default case to work by allowing
>> setup_bios_corruption_check() to run first, but it's just not worth it
>> given that the kernel will never access the first 64 KiB area anyway=2E
>>=20
>> Lastly, note that it's possible to get the corruption check to work wit=
h
>> a different region by passing memory_corruption_check_size=3D=2E Howeve=
r,
>> the main goal of the feature was to check the first 64 KiB=2E Besides,
>> the region picked will be almost random as setup_bios_corruption_check(=
)
>> will pick a region by size=2E
>
>And?
>
>Do I want this or should it be fixed or the first 64K are not worth it to
>check or=2E=2E=2E?
>
>That whole "rationale" is not really clear to me=2E Yes, it is broken,
>apparently=2E So let's remove it but we might get it work still=2E=2E=2E =
So which is
>it and why?
>

We aren't using that memory, so there is no point spending the time scanni=
ng it periodically=2E
