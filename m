Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A1C278156
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790727637; cv=none; b=NSHIZbJM76ZZLdWS7gCmdmAEz/xG0YsFY3ewRx8bMtT+qZELAdiPAs4J25qoGgUHnQ4xqURiBH1F89yi01RVmlFYbijlGncbZJmPgWpcBNLADAbfW0EAiZgrqDgj1x5uFSn9axLhcIPtjE+5Rtds48HW9Mm86i5egeh7Dml2nJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790727637; c=relaxed/simple;
	bh=VOFB0XG5n0/qUK+fjFXTn52PBfpRI4Atbn8TzW+pn4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YYN8uw92H4LotzSTiET96UBlU4acoIsb7HiylHvoHV0YnCCJkVX5RvjoVcRHtDbTrDArQo/FK+CxylyTZOZKRaGliFMUf/1Eqfx3ZmHenMgap8jXXSO8DB47WU9Vu98WNqPjZ0uqSmEZfYtQSqN7id4Epv7E/OBFGAF/HdeVfeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Icv/hFUf; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Icv/hFUf"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 596C340E01F9;
	Wed, 30 Sep 2026 00:20:31 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id mursWfUzc6P5; Wed, 30 Sep 2026 00:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790727621; bh=kaPu4dIWNkWh6gjgRdJMdkJTS13q0lH17KIDUyE4rmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Icv/hFUfjwbw9UrY1t/RWqs9bGPjWcy1iK/M5gar9gsU3Ef5nNuie/4vVwpfb87Se
	 PfYyyhwelwQhhxWOYwgeEuypKbaUdO1GRY2c722/+uaqWLJgGLK7k+pKRKTat20DMy
	 7mSyy+CtMf1JitKn9h8shCzkUlDrRd+Rkf4LiLe7PDYCwf+NCiw1byvU1AcyoHxltD
	 H8zVUXyN0e2GGWmcCltP9ly5QmvdMh37kUt7FRR9XouOcwWryOr3KMUu1/CMEhW+mf
	 YLpYpccB8oz/bGP3OyU1fQS2v+MKJgonC8BlTVaYMD655b5TWBbg4dgJvb92FpRQr6
	 1QrBWCIYh4ziW45kcfp/pZvsVyJuj1H9NnVJSOJoSTwpQMMAl+LVV6Aa6u4Cz5c+oZ
	 ytH63b6dwwohVfjnrz29yZpApfRnuuaq5CsLiwng1UFgX1P9sH7l4BuJiguhI5P21U
	 MbrgxMZ/PZq1I+d8KC/qnNYCI1+wG1vIwB7m6c6235GoMSlYpqCKiA/xx4p8ca4rSu
	 6+pOJ1XrJQQ74OB5b84MpxCU8Sze29hFS1XiidVIqUWPaFDsiGsJBIq9E7kEx2PGLE
	 hQMCG2qTCU0bDfjvwAsNu0DdGS0u7e2H5p7eda2pnpRcrHjkWE2anVSO1fIyQg2vkN
	 lbbrexexghMte35HGCb6VTMc=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E665840E01ED;
	Wed, 30 Sep 2026 00:20:13 +0000 (UTC)
Date: Tue, 29 Sep 2026 17:20:10 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, tglx@kernel.org,
	mingo@redhat.com, dave.hansen@linux.intel.com, kevin.shu@intel.com
Subject: Re: [PATCH RFC v1 1/8] cpu/hotplug: Allow architecture-specific
 primary CPU bringup
Message-ID: <20260930002010.GDarxVul0JZDam_-bG@fat_crate.local>
References: <20260912000815.997720-1-chang.seok.bae@intel.com>
 <20260912000815.997720-2-chang.seok.bae@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260912000815.997720-2-chang.seok.bae@intel.com>

On Sat, Sep 12, 2026 at 12:08:07AM +0000, Chang S. Bae wrote:
> Parallel CPU bringup currently proceeds in two phases: first for the SMT
> primary threads and then second for the remaining secondary threads. This
> ordering avoids race conditions, specifically for x86 microcode loading.
> 
> Upcoming x86 changes expand the microcode loading scope beyond a single
> core to package scope or even system-wide updates. Introduce architecture
> hooks that allow customizing which CPUs participate in the first phase:
> 
>  * arch_cpuhp_primary_aware() - indicates whether the architecture
>    provides a custom primary CPU selection scheme, or not.
> 
>  * arch_cpuhp_get_primary_cpus() - returns a CPU mask for the first
>    bringup iteration.

Why are there two?

Why are there even accessors at all when you can simply use
cpu_primary_thread_mask whereever you need it and drop all that gunk here and
in the next patch?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
