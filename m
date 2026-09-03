Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886FD4921BD
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788432921; cv=none; b=msEhrqla7q78wNxhMtW/pgbB/tv0o0BcGELRKDDNwqriTqVl2ZaHTpaS7KC2MxZquRlkeQPgOFeOKA5sWbQ6N3j4XSJqGOYwjLyZhPdbqw36CzwmzWsI9RrwDJK8Yi88Q0mOtiSw+mzulDQiDskkR9LktygpjcrudhHvUAHbcFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788432921; c=relaxed/simple;
	bh=0ZNppeh0ZlYWtizsvSK/rGmy7+pcL/M5jSpzzhNgk3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dEnCKUTVpKhKy5YvyrXJUqSFYwRiE/fppibsTfbyV+XUy+UKesSEdJ552kIUc3zG98FDa0suTFWEEKpA32pfl045+AgaxYPikALuII9FvZHekClM5m7FGp5PCdb5gJwSadZZEf34AFLFTuxk7daSvOSYwDxmHSBVivY2dYEseHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ShAwQheQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ShAwQheQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B77E91F000E9;
	Thu,  3 Sep 2026 10:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788432920;
	bh=MS+xJQNxLdGqKYm3UoolvVPTT5UdPibXHtDgluZIrTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ShAwQheQuHIXroeVMwUOAKxfDDGxf+Kjf5b1+cIW4NasQjSoB48stQnAGHdwlbZ2p
	 3EgtO9d+OmzXlpqUsK+0ygDClfybT0H/l/Oo2ay0Pq8mDQ3B1+9Ohj/AUcpmcSxkxE
	 9/o+60V7uhkZ9EKw0+44aMCQNNlEpKURjScsxmvr75acJU8lwEw6aDxYhSInQJrQnS
	 auzyA+A5V125G5Oc4U+63Op5miLvv73nr0NEcwRwOwE3OxpZ7tJKQ2s1wmsy0ELjTu
	 /z9O3hGFSAO9nem0mk/7cDagknWz3Y2a9XryXEe380ehCsIWI3iT4/AmMaxZN0hC1m
	 vSsuzEGHIE9zQ==
Date: Thu, 3 Sep 2026 11:55:14 +0100
From: Will Deacon <will@kernel.org>
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	David Matlack <dmatlack@google.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Andreas Grapentin <gra@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Martin <dave.martin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 0/2] Use __u128 in arm64 UAPI headers
Message-ID: <aplSEuD_h9OPOZoD@willie-the-truck>
References: <20260626141730.5976-1-will@kernel.org>
 <d11026b0-1faf-4de1-b562-f6e46e60ef92@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d11026b0-1faf-4de1-b562-f6e46e60ef92@arm.com>

On Wed, Sep 02, 2026 at 09:21:32PM -0500, Jeremy Linton wrote:
> On 6/26/26 9:17 AM, Will Deacon wrote:
> > This is version two of the patch I previously sent here:
> > 
> >    https://lore.kernel.org/r/20260619130835.5678-1-will@kernel.org
> > 
> > I even briefly queued that version up, but it exploded spectacularly
> > when building the kselftests for arm64 [1] [2]. So the only change since
> > v1 is the addition of a preliminary patch that adds the '__u128' typedef
> > to the private copy of linux/types.h used by the tools/ directory.
> > 
> > I plan to take this all via the arm64 tree unless anybody objects.
> 
> This seems to be creating a interesting situation that the follow-on commit:
> 10a47fb67340 tools: linux/types.h: Add 128-bit integer types for arm64 UAPI
> structures
> 
> Is missing from older kernel tooling/etc, which means the tools that end up
> pulling this header in won't build on machines running 7.3 kernel headers.
> 
> AKA, build/install master, switch back to an older branch and discover say
> bpftool won't build anymore.

Ah, I guess we need to backport 10a47fb67340 to stable, then?

Will
