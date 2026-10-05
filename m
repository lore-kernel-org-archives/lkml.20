Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B92F49E5C9
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 17:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220043; cv=none; b=nPIEC9m4XYJB4G1nIT5F6+nkbhKc1cDtV+Q8mpsC9CShpB69i9BzfBJcYNT4fDloeSZSP2E0sWXzcL5o7Xr692KJX1cbwwFV3sIqhp1efkQ+dagy39uENRvb/LlkgWxQ2lPl+LJ19BbUMZtZL9J37OKdMSQxcRvtG9gbwCS/Bl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220043; c=relaxed/simple;
	bh=Tbjl7QCyd3XUz0f7QK7uBnlsLmdS/Tdn0PtBhGquPE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gRYF7AkadJ+kjDzu/7mFxoAelkzupn7xCcCmM2iXlfpVNfhVVFnYxno1viYSZCoarEAdU4nnMhd53rIfm+va41wLC9Bz66VSqkbpoBnUDklIYt+3vRi7fl6aa9p6g0OOzn2kj3B7PpLdLTO4j2C9THCtxnBrQD7NBK2jcHllhdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3LSS7V1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3LSS7V1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D949D1F000FF;
	Mon,  5 Oct 2026 17:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220042;
	bh=mOi4oGFPPbeQhM3FWgE/6O7CyK7xCJC3sQnulZRZB1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b3LSS7V1BwwESZVnWv2XIhBfqkxY9a8RwcFE0m86fXEd5xr3DOVHYiVkxK4Qear0z
	 Xp3ocelE6Buu1reNIo7BsB+BObIoDiGxiknA/+L/x4XXaBJnA3djP24uYOsfRFL/AK
	 P0lnvnkTDiAFBkQFoOf3MIAGEwJ08iYXQbIEBib40Y2NePVXrt7F/i906pM/hvnEdZ
	 X2HqxpH4MncFO4KluMkHfYD/8deFRU0L6lBnQCop5qjl6MtVT36xFV8ANHsachEcAG
	 s0japRKyJ0qmm6CBBMRLhUxD9T6ZzVTWBeu/1zCdu++Hb1R8uHAhbe+epJBtOWiHpB
	 kme0o5SRJFRUQ==
Date: Mon, 5 Oct 2026 19:07:16 +0200
From: Thorsten Blum <blum@kernel.org>
To: Habil Eren =?iso-8859-1?Q?T=FCrker?= <habilerenturker@hotmail.com>
Cc: "luto@kernel.org" <luto@kernel.org>,
	"tglx@kernel.org" <tglx@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] x86/vdso: Replace deprecated simple_strtoul()
 with kstrtouint()
Message-ID: <asPZRBSZy9jf06As@kernel.org>
References: <20261005163335.6716-1-habilerenturker@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261005163335.6716-1-habilerenturker@hotmail.com>

On Mon, Oct 05, 2026 at 04:33:37PM +0000, Habil Eren Türker wrote:
> This patch series replaces the deprecated simple_strtoul() function
> with the safer kstrtouint() variant in the x86 vdso setup code.
> 
> The simple_strtoul() function is deprecated as it silently ignores
> overflows. Proper bounds and lineer error checking are introduced.
> 
> Changes in v2:
> - Fixed the logical short-circuit operator bug in parsing error paths
>   where invalid inputs could trigger deceptive warning logs.
> - Refactored error handling into a linear flow with unlikely() macros
>   to avoid branch misprediction.
>  
> Habil Eren Türker (2):
>   x86/vdso: Replace deprecated simple_strtoul() with kstrtouint()
>   x86/vdso: Replace deprecated simple_strtoul() with kstrtouint() in
>     vdso_setup
> 
>  arch/x86/entry/vdso/vdso32-setup.c | 11 +++++++++--
>  arch/x86/entry/vdso/vma.c          | 15 ++++++++++++++-
>  2 files changed, 23 insertions(+), 3 deletions(-)

I submitted a very similar series a while ago [1], but haven't received
feedback yet (besides a Reviewed-by from Randy on the documentation
change).

Dave, did you have a chance to take a look at my series yet?

Thanks,
Thorsten

[1] https://lore.kernel.org/lkml/20260831101657.2947-5-blum@kernel.org/
