Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793897264;
	b=Gz82S3lpL6TgZhG9uyoxJT/QFhvlkDYmiTWnncQ11uXkYp9mSXrj3SvqOuC5RrW0bpL5
	 rei4Cka3y0oiViP1mEyvz5cqbd/OsEjhDxicMaB4jy3iB1jsSOy2pcunl44QSovtbSgcn
	 NuRs9gT9o5owMKuJVO9T/VtLd+YZSmckQsbQPIO/mwXgzLAtZ47Epw43Qi2mjoyrRQBAb
	 b3yrAtmNoFOmWDhMK30g1da3QrvVrdFfCZHKHwH+wj4OFtVWH6b8tfvmsg53D4m3oZSim
	 QN1Xt9NH5WpSux3zyYaQPA5OVuKkr7QVXk8XVLQR5sVGwp3dazd3qlqXrFOm9yBaSNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793897264;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Date:From:To:CC:Subject:
	 In-Reply-To:References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=z0g+7vISePoB4bLXA+qTUBwjx3+oinPNH0HiHkjJYm8=;
	b=Ok4g4jK40BGcN0RspyVDHkEtI74F5KJoNubj2mka5HMdbFEw0VFKAjzO0HHZV4eQPDJl
	 QB0fqjbXCmUoBlcfSqzj8hfGC0OZF0FP8Gbg+9m2TfFDqDrcqHYlEgwWdTPX8w9Gry4ho
	 vJwb+51DkilvjePMM3p8wJM2kFVajksFpx5dDw10/i6rlM9qZsSSs9t6gF71v6BCgero2
	 oyxZQl58gW7H6XDX2/viXHnT5lT6CIWTmsATHZ62Vfne7fH7n3yMi7TbfLafn2f94s6NL
	 Cz6BmVlDubpiXmIZUGxU/1CJCZFgoQq3KAtCLJfDV7i43j34ZJYMAHYhty8ZjGLA2OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=kFkLtRDW;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=fU1kFVuo;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B6E606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2B6E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=kFkLtRDW;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=fU1kFVuo
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1793897252; bh=z0g+7vISePoB4bLXA+qTUBw
	jx3+oinPNH0HiHkjJYm8=; b=kFkLtRDWdOVpZFqPioVtZvVeolohO82+4gx0u6Wrv30GC0wjpr
	vLB0b9H8yx/8Jvn3v/hvynlYP79+ANgwDJVMMToka28IH/K23vCA+0RI42Fj1G6aMnhrvt51MFe
	AosrA5/k5FxSYai5hDfp4YHw14kDFw9/N69o7hdOfzCr2skCiZmMV2vcNvjS8MCuNnE48CDtI4K
	maKlx35PfjPs0a0b1ZOvrBJoV7Ycqw8/jAbJ6Hxyxoddx/AYeBjNLhf2wgEUh/UNRQnMknG10/0
	MhcJ6kiSZ8rP5YMn1yBAVymGk4FcrmSQpeBIEuxOmuhQkyvC+QafdtgWibeDbSRN5Lw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1793897252; bh=z0g+7vISePoB4bLXA+qTUBw
	jx3+oinPNH0HiHkjJYm8=; b=fU1kFVuoZEdXB6EzxLgfZDWu2+Qats/ljapydj5sbE42+7GS76
	RyaHeCzdw4Rl2BwhRBmhoKSBjb68ZAtgqnCg==;
Date: Thu, 05 Nov 2026 16:47:30 +0000
From: Bradley Morgan <brads@mainlining.org>
To: Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>
CC: linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_3/3=5D_compat=3A_make_compat=5Fsys?=
 =?US-ASCII?Q?info=28=29_scale_far_enough_to_actually_fit?=
In-Reply-To: <7e655d9c-d38d-49a6-bc51-73f4e65383c9@app.fastmail.com>
References: <20261105003129.3130709-1-brads@mainlining.org> <20261105003129.3130709-4-brads@mainlining.org> <7e655d9c-d38d-49a6-bc51-73f4e65383c9@app.fastmail.com>
Message-ID: <41718958-62BB-488D-A95D-E23411B97195@mainlining.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 5 November 2026 07:25:22 GMT, Arnd Bergmann <arnd@arndb.de> wrote:
>On Thu, Nov 5, 2026, at 01:31, Bradley Morgan wrote:
>> compat_sysinfo() checks whether totalram or totalswap is too big for the
>> compat struct and scales the values down to fit, but the loop stops as
>> soon as s.mem_unit reaches PAGE_SIZE.  That caps the compression at one
>> page, 12 bits with 4K pages.  On a 64 bit kernel do_sysinfo() always
>> hands it values in bytes with mem_unit == 1, its own overflow math runs
>> on unsigned long so it does not bail until 16 EiB, so the loop runs its
>> 12 turns, the values come back out as a page count, and anything past
>> 2^32 pages still does not fit.  Storing that into the u32 field then
>> just drops the top bits.
>>
>> So a 32 bit process on a box past 2^32 pages gets a wrapped number
>> instead of a coarse one, with 4K pages that starts at 16 TiB:
>>
>>   ram      old                  new
>>   8 TiB    2147483648 x 4096    unchanged
>>   16 TiB   0 x 4096             2147483648 x 8192
>>   17 TiB   268435456 x 4096     2281701376 x 8192
>>   32 TiB   0 x 4096             2147483648 x 16384
>>
>> The 17 TiB row is the nasty one, a 32 bit process is told the box has
>> 1 TiB of ram.  Keep scaling until the values fit instead of until the
>> unit reaches a page, the unit then says how coarse the number is, which
>> is what mem_unit is for.
>>
>> Nothing that works today changes.  I ran both loops side by side over
>> ram from 1 MiB to 2^56 with 4K and 64K pages, they disagree on exactly
>> the inputs where the old one dropped bits and agree on every one it got
>> right.
>>
>> Signed-off-by: Bradley Morgan <brads@mainlining.org>
>
>Makes sense, thanks for the fix!
>
>Reviewed-by: Arnd Bergmann <arnd@arndb.de>


Do you want to take this or do you want Andrew to?

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
