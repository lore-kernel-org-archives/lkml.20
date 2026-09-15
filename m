Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2AB2F8E98
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789449147; cv=none; b=BZPGuqjQI44TKROsr9dmkQ/BMnJMj/jL4180vCpsfuYyG+cmBSBZplSRP7VG57MRMxk+tvPYmo0v1OW6zKRirUhD+O0UApThcK0AzVDQjreGrPFlFaovqPdvdz74y19kHnMokNHQm7adgI8EqEn7UpDFg/xMymY86HCF5vpdky4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789449147; c=relaxed/simple;
	bh=EjB+J36sSUoCZz8UwZbhCc8kPIMNnkSXmUY5HYtTRJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fnZhT3P2a+rL44CrgUIAFqdG/6DrDp+tGxTDWkUb/7CsIFswTurtxA55hMzw/OKvoLgjxN55PL5RtWADrgiP6SvbGVEFL1D5GyjM5j8SIqkwzhx+pkG/YBNrJE2e5BZ6dZbXFWFNzWSACZLKW6k+vCqHg0jB/GX/wGukgMaLnZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=JpG6RQyg; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="JpG6RQyg"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 424C640E00B9;
	Tue, 15 Sep 2026 05:12:23 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id l7mK6AY6STDk; Tue, 15 Sep 2026 05:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789449133; bh=hLEWkb75NILErIyiEvrD6H5Nyelzx0xY/igrkoWaqWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JpG6RQygncGPaWQbpmRNxxwJCcqwa5zGFcq7wXesX1MmWu5X84jzrTis3K34DMzwM
	 cUdiscylPSQgVCua0KQJOj/vAYrZhUBXO1iZXS/vNmpja/FvkQXqej1nNd3/rmwLAx
	 hq1FdeUgxjsUXOK6uFSHn43qfp5DYsUGbwIQoAJjd3F77PybjeoCRY6+yZ4/ZAxwy2
	 /KC0Q4B6qk+wlC3WzM6y8a8crPlbeCu/z+qPzVw9uK6gwxGpO4D5bjEZEbKH14QSDB
	 xz4EwFmxy9kx0gwZrZLja4Cakm9KfReIa/oFlVP1ClPsyZTtp1bIVXkoOT/JfsWFFz
	 zHMCrNzhHoB1wwBvgfaSzpsneU3Ud1m/DX5mrku2Ok1CjJtiLJrkqE6Bc39zakdt6y
	 kDAvFl+u8OkXvuiL5uRO0o8a5/Xe+PVRFFGfo/XZM88gjbpy/7xMT9E/mwxc2arID0
	 L32tLGSgjo3OnoVIxuHLuKFFZ3nWwWNTaozksEkiXVHJ+TDpzJpEkMsuLApWCVjToF
	 rU6J7yoBjWlEghXu6itUXnnDInCq1AKVACCZfpMI87AUKa5ojEnkBeb12CYoKW9fQQ
	 wYqWQws2pnIWYZ/Zk41/4YWS4C7cdLM9Lw/SMHY2N6aZfvfu17hm8ycMoTNYVqe9N6
	 GrBoXGvQi6Ai4aCNnH/+FMgs=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 99D8240E015D;
	Tue, 15 Sep 2026 05:11:58 +0000 (UTC)
Date: Mon, 14 Sep 2026 22:11:55 -0700
From: Borislav Petkov <bp@alien8.de>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Jan Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
	kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 4/5] x86/cpuid: fix unbootable VMs by really inlining
 memcmp() in hypervisor_cpuid_base()
Message-ID: <20260915051155.GGaqjTm7yIluwxZ80x@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-4-e70ef3b75b6a@igalia.com>
 <20260911043822.GHaqOFvnw5mQ0s89QQ@fat_crate.local>
 <6113f06c790cfe1141d2dc09b68937b6@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6113f06c790cfe1141d2dc09b68937b6@igalia.com>

On Mon, Sep 14, 2026 at 08:22:08AM -0300, Mauricio Faria de Oliveira wrote:
> In the review of the original patchset (fixed by this series) it is
> mentioned that a compiler might turn it into a memcmp() [1] -- and thus
> revert back to the same issue.
> 
> [1] https://lore.kernel.org/all/877ccz12ab.ffs@tglx/

Hmm, never heard that before but that doesn't mean anything. Probably should
mention it in one of the commit messages so that we know for the future...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
