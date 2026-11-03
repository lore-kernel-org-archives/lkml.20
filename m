Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793710537;
	b=vydB7FDUkWre7PRDgslGSHc4kBT/2+MGKEPrmuP0NyuUBrvrIZwho0Pi+TLyiTL9LB3h
	 C22EtcRkV5aqGowpBD7xWWFGDSzA33naK+YE5WaSDvI5IT93sXBBQSnRZBnLTM/ZZBWJa
	 vDB0V/gf8Ct6/Gcw/wwekLpL2KgUvXABmqgzBD9kpT52kA7C70pGfeOI7L8dE88W/j+u3
	 KQah96ezeMjWNtU0rjyzR40B/n0WoMFzD21RpmcUzya35VIO5quOg9/sI+l1Rey8Ujeet
	 Pqafmf9GA2ERmfD6EAFq0PMwUZHDpVAM80pIHzTI+GC2Rlikoz9mvCgnp5KfnAfeFlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793710537;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=44sQKkh8ZCNN9HhAnW328Mo4zI/my71RquicLXgmPs0=;
	b=dCL+RxhivBYh9yQiydgqwG3RQNFQQ1PQ8qUUFCKkk2j59Zpq6ZN7szyvbqeYfAPnfFnt
	 MRQdsT+qtdbY6Cr42KtTE+9GjuaFYF876upw1z4FJ+8f2HgJbUeYHvkmYNvOda8Cm12pU
	 D5uJ25s+w4QusRgyMmV1kTaYjsHCu/JCclSTWAIUYmcFyyZSLm9kGq8EiOb5Hdn+0IB4j
	 MSzJxFJ/BevVWdWYLjXFkCgzhD5UZkIQyEgnUDI5d9f/mlSWUkKlgkYfYqvsiaGpaSM/T
	 moyPfjhMYV510Gx2q4XfFahQ65fTB/rlghtxdWYKAkgbpcJZTb/tetAe9fSkXWb/r8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=KWcOugTQ;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7ED4606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7ED4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=KWcOugTQ
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A94C61595;
	Tue,  3 Nov 2026 04:55:32 -0800 (PST)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 39A5F3F628;
	Tue,  3 Nov 2026 04:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793710535; bh=FqopgaouZvkZO6sfW6cY0KxqGQEHnXLG2/V0ntSLV+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KWcOugTQIf03uX1hwv1jxqrIelZdCwUAU4EZu9xmHLyA4xyikQEjhcDUZBLVYcvNK
	 NlYpNK4l4BzrUi5T7j1kNlTliRjGExW08buGFEggBRd5ls0KGLqMOQ/WDRU/tnbUXG
	 pzll+V3sHFhtjx2oRMZ35EE5FzPXnZ+n8vTlHqKg=
Date: Tue, 3 Nov 2026 13:55:23 +0100
From: Beata Michalska <beata.michalska@arm.com>
To: Xuewen Yan <xuewen.yan94@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Vladimir.Murzin@arm.com,
	catalin.marinas@arm.com, will@kernel.org, suzuki.poulose@arm.com,
	James.Morse@arm.com, seanwang1@lenovo.com,
	linux-kernel@vger.kernel.org, Xuewen Yan <xuewen.yan@unisoc.com>
Subject: Re: [PATCH v4 0/2] arm64: errata: Share broken AMU constant-counter
 handling
Message-ID: <aunZu2vEPjsFPutU@arm.com>
References: <20261001090050.3849551-1-beata.michalska@arm.com>
 <CAB8ipk-3pec4PCteA8+moHveHobE4FZgHbc4WnpKkJRyt=Vwgg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAB8ipk-3pec4PCteA8+moHveHobE4FZgHbc4WnpKkJRyt=Vwgg@mail.gmail.com>

On Tue, Oct 27, 2026 at 02:40:00PM +0800, Xuewen Yan wrote:
Hi,
> Hi Beata,
> 
> Sorry for the late reply.
> 
> On Thu, Oct 1, 2026 at 5:00 PM Beata Michalska <beata.michalska@arm.com> wrote:
> >
> > This series factors out the existing Cortex-A510 erratum 2457168 AMU constant
> > counter workaround into a generic broken AMU constant-counter capability,
> > then wires Cortex-A725 erratum 3821522 into the same handling.
> >
> 
> Has this patch only been applied to the A510 and A725 so far? As far
> as I know, no chip has received a fix for this issue yet, including
> the C1-Pro...
> 
Will send an update shortly.

---
BR
Beata
> Thanks！
> > ---
> > v4:
> > - use midr range instead of multi cap list
> > - reword comment to be more generic
> >
> > v3:
> > - splitted the commit and droped changes for cpucap_is_possible
> > ---
> >
> > Beata Michalska (2):
> >   arm64: errata: Factor out broken AMU const counter cap
> >   arm64: errata: Add Cortex-A725 erratum 3821522 workaround
> >
> >  Documentation/arch/arm64/silicon-errata.rst |  2 ++
> >  arch/arm64/Kconfig                          | 30 +++++++++++++++++++++
> >  arch/arm64/kernel/cpu_errata.c              | 24 ++++++++++++-----
> >  arch/arm64/kernel/cpufeature.c              |  2 +-
> >  arch/arm64/kernel/topology.c                | 16 ++++++-----
> >  arch/arm64/tools/cpucaps                    |  2 +-
> >  6 files changed, 61 insertions(+), 15 deletions(-)
> >
> > --
> > 2.43.0
> >
