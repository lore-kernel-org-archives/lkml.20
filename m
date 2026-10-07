Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C635D3BCD29
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791361622; cv=none; b=Ke/I8Nd/K5At2dXMvYKV3xdzq2qsJpoROCN9Fqptkey9kOfPWnNiKian31tm8RrU8TSmDiy4EeRK0ZQQbhf/2r9YCnkfbQa4SZYiUyOLweEK7czfDkQZlxtxOSKlaJKQXf8giiiWxswLGIS/es80pqoii8pcAsx6an2JptdUba0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791361622; c=relaxed/simple;
	bh=0wEDrsR2XjIbJMUaVBksjnUI8HiJnPv/SGDdAf+utfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T1qWhG8ELCTsQ3WqFvnUMGz6jDToJnm+NYXHB9vOocOY5J1ACos1+L9EgM6tyEmUYX5PV4hwxGSkofCDo7xh+AgUFDEg67qQENaumMVro9H35lKunFo8qwMUhb4IzneKoQvmSYsuBjrDC5C5HnkhI06jwywQG+3GrSqQp0Ko9xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mrPk/fKD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mrPk/fKD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8228A1F0089C;
	Wed,  7 Oct 2026 08:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791361621;
	bh=n04QtMA0DHjNS42yE8yuD/SLTKiMOQwatlVYHAsgZ6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mrPk/fKDC9/cRF5ticVGRx4Qt/YstQtSJ2ydoSmln/128OTQRKKTq9kbQJEE7oN1v
	 VmEFIwgJS/7CadM56P3xIdvGv/QWxY8lk3JuwJONR5GkzrYiqVLr+VABBH30Orks9I
	 MIWKh4e7m7MS/WonuVXFpffwMO3yjLplxjoFcA/k/btEViG30whM/iWraCbwY05/cf
	 s1aG+IsjP0pTvU/9GUdPUJnjNDGXFBPUH7A9Mq8hpKIE0L/vSCmTclTBGq6wBqMOxI
	 hycY2ROiV+6q1OczgPUUtMLHtcoolAAtO1/i5zznP8aumKX+oO5yn7BqCzSFK4gEbV
	 1g3t35WjjDltQ==
Date: Wed, 7 Oct 2026 10:26:56 +0200
From: Thorsten Blum <blum@kernel.org>
To: Habil Eren =?iso-8859-1?Q?T=FCrker?= <habilerenturker@hotmail.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] x86/vdso: Replace deprecated simple_strtoul()
 with kstrtouint()
Message-ID: <asYCUG08QdcELGEC@kernel.org>
References: <asPZRBSZy9jf06As@kernel.org>
 <20261006201255.598040-1-habilerenturker@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261006201255.598040-1-habilerenturker@hotmail.com>

On Tue, Oct 06, 2026 at 08:12:59PM +0000, Habil Eren Türker wrote:
> > I submitted a very similar series a while ago [1], but haven't received
> > feedback yet (besides a Reviewed-by from Randy on the documentation
> > change).
> 
> Hi Thorsten,
> 
> You are right, and thank you for pointing this out. My series is essentially
> a duplicate of yours. Your series came first.
> 
> I will withdraw my v2 series and let yours be the one to land.
> 
> In the meantime, I took the time to review and test your series on top
> of v7.3-rc5. Both the code and the runtime behaviour look correct to me:
> 
> Code review:
>   - kstrtouint() preserves the original semantics of simple_strtoul()
>     while adding proper overflow checking.
>   - Error paths are consistent with the existing vdso_setup() logic.
>   - The documentation removal for vdso32=2 is accurate.
> 
> Runtime testing:
>   - x86_64 QEMU/q35 guest, TCG acceleration, qemu64 CPU model
>   - KASAN profile (KASAN + KFENCE + DEBUG_OBJECTS)
>   - memory suite at 256M/512M/1G, 3 iterations per case
>   - All cases pass, no KASAN/KCSAN/lockdep findings, CRIT_ERRORS=0
> 
> Reviewed-by: Habil Eren Türker <habilerenturker@hotmail.com>
> Tested-by: Habil Eren Türker <habilerenturker@hotmail.com>

Thank you for reviewing and testing my series, but I believe you must
add your Reviewed-by: and Tested-by: to my series [1], not as a reply to
your own series.

> Sorry for the duplicate noise.

No worries.

Thanks,
Thorsten

[1] https://lore.kernel.org/lkml/20260831101657.2947-5-blum@kernel.org/
