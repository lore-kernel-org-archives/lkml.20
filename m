Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.62.254.231
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624017;
	b=Af77Aq50lV4+xRSAqIHxzErSsx7FBzg6iK9CNSFqmOiRpAJaETgJIHHq9tpzicBSLGkK
	 aZZQE+ViZ9NGYKnr3IBgD7DaSdniH4js2IYdGIV5s9b6gXOTXAFcetvdQFavogK1WdZ1E
	 hf7U2qewVKN6Zqb5ZbAJZTteq+G4hbX+bQdljdI7JijMwn3VrpDorZzGjQPTl3AV27LEO
	 TbWHTOn/mtbFwEiUGxbw0Xs8aGju3opxmdd8FSKWL+QsKltyfIzXlSpb0RWNu1PlvxIFP
	 Vnzpa0OwJpx8lLKTmgGo3CNPv+xxLHuYvHvUPLIxjlflMq747NxTJAMWT3ylEg1zQmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624017;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=2DN6nJAak3G5hg32C+AP78Whr8rhMiUJeU/VUd9QqpQ=;
	b=c62j1YGPAKA/3qqmwdb7QdO0AhnXwbZpPXbRV2j3E7hJy0w5ak9bZfgk8YJnhe0+3mAj
	 rVkt2/wvNZ1h6uqQlmp8YSzqJ1krStm+0dfZXCK+1HzyNom2EDKqkg7Si2sOr2Mb3H5Ot
	 YeqGLcMqFsT4pKJ4tk9BavscgPuc6V6Ric0bZBz57Hkpcb9CrBmrEaXJ1BY/bOSE3LA9h
	 71YLm8zFh4sfBUsTRnEQm81bi/MHkj2iBvdoWRCoaI/MH17mOLrNg8p5ucy1NdHz+1dq+
	 GdHQ9nqcKggrjITZpqg2ksgbXxPhZ0wJhVS7zJKq65MQLzs4xaUrE3lojMtwYCMYZcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ilvokhin.com;
	spf=pass smtp.mailfrom=ilvokhin.com;
	dkim=pass header.d=ilvokhin.com header.i=@ilvokhin.com header.a=rsa-sha256 header.s=mail header.b=GPCuF8AE;
	arc=none smtp.remote-ip=178.62.254.231
Received: from mail.ilvokhin.com (mail.ilvokhin.com [178.62.254.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C42606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42C42606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ilvokhin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ilvokhin.com header.i=@ilvokhin.com header.a=rsa-sha256 header.s=mail header.b=GPCuF8AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ilvokhin.com;
	s=mail; t=1793624010;
	bh=2DN6nJAak3G5hg32C+AP78Whr8rhMiUJeU/VUd9QqpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GPCuF8AEDEyGDk9usc/SqRzvSdkMdf/x9PCHiX0/g9sRFSEZrMupzvJjkvCbYLygZ
	 De0e4+QZ48f8q7wcj9lffFZkofDQ8p2hGnuP6ZG/SaOv9Yexmt68VXXrI+yavaTI73
	 sNaTN1X5Ok5uWgMEnqI9S5gjVeN28o78kGXCLAYs=
Received: from shell.ilvokhin.com (shell.ilvokhin.com [138.68.190.75])
	(Authenticated sender: d@ilvokhin.com)
	by mail.ilvokhin.com (Postfix) with ESMTPSA id 51BF4101462;
	Mon, 02 Nov 2026 12:53:30 +0000 (UTC)
Date: Mon, 2 Nov 2026 12:53:26 +0000
From: Dmitry Ilvokhin <d@ilvokhin.com>
To: "Artem S. Tashkinov" <aros@gmx.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, david@kernel.org
Subject: Re: mm: tmpfs: huge=always Kconfig help understates severe space
 amplification
Message-ID: <auiHxos_Dr1PXEB_@shell.ilvokhin.com>
References: <b42192af-d9b6-4820-bff3-e3b6c6ce9bf2@gmx.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b42192af-d9b6-4820-bff3-e3b6c6ce9bf2@gmx.com>

On Sat, Oct 31, 2026 at 03:19:08PM +0000, Artem S. Tashkinov wrote:
> Hi Dmitry,
> 
> I'd like to raise a documentation issue with the Kconfig option introduced
> by your patch:
> 
>     mm: shmem/tmpfs hugepage defaults config choice
> 
> Specifically, CONFIG_TRANSPARENT_HUGEPAGE_TMPFS_HUGE_ALWAYS.
> 
> The help text currently says:
> 
>     Always attempt to allocate hugepage for tmpfs mount, can
>     increase the memory footprint of applications without a
>     guaranteed benefit but it will work automatically for all
>     applications.
> 
> I believe this substantially understates the potential consequences of
> selecting this option, particularly on general-purpose systems where /tmp is
> mounted as tmpfs.
> 
> I recently encountered the following situation while extracting a Fedora
> filesystem tree under /tmp on an x86-64 system running Linux 7.3.
> 
> The tmpfs mount had huge=always enabled.
> 
>     $ df -hT /tmp/Fedora
>     Filesystem  Type   Size  Used  Avail  Use%
>     tmpfs       tmpfs   48G   47G   925M   99%
> 
>     $ du -sh /tmp/Fedora/usr
>     45G     /tmp/Fedora/usr
> 
>     $ du -sh --apparent-size /tmp/Fedora/usr
>     1.4G    /tmp/Fedora/usr
> 
> Even more strikingly:
> 
>     $ du -sh /tmp/Fedora/usr/share/man/man3
>     7.5G    /tmp/Fedora/usr/share/man/man3
> 
>     $ du -sh --apparent-size /tmp/Fedora/usr/share/man/man3
>     7.8M    /tmp/Fedora/usr/share/man/man3
> 
> Thus, a directory containing just 7.8 MiB of apparent file data occupied
> approximately 7.5 GiB of allocated space.
> 
> The overall tree occupied approximately 45 GiB despite containing only 1.4
> GiB of apparent file data.
> 
> This is consistent with severe allocation amplification caused by
> transparent huge pages, although I have not yet established the exact
> breakdown of huge-page allocations and other tmpfs overhead.

Yeah, I think one can expect up to 512 amplification on x86 in the
absolutely worst case, based on the ratio of pages sizes:
2 MiB to 4 KiB.

I suspect the magnitude can be even bigger on aarch64.

[...]

> 
> For example, the help might say:
> 
>     Always attempt hugepage allocation for tmpfs mounts.
> 
>     WARNING: This policy can substantially increase memory and
>     tmpfs space consumption, particularly for workloads creating
>     large numbers of small files. Allocated space may greatly
>     exceed apparent file sizes, potentially exhausting tmpfs
>     capacity even when relatively little file data is stored.

I would probably drop "WARNING", since there nothing to warn about yet.
Also, second sentence communicating the same idea as the first one, but
with different words.

Probably, something like this will be enough: "This policy can
substantially increase memory and tmpfs space consumption, particularly
for workloads creating large numbers of small files."

> 
>     This setting does not guarantee improved performance and
>     should only be selected when its memory overhead is
>     understood and acceptable for the intended workload.

This part is already mentioned in the current wording: "increase the
memory footprint of applications without a guaranteed benefit".

Anyway, I think documentation edits are always welcome, please, submit a
patch :)
