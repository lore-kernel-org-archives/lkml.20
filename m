Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BB32BEFF6
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792129823; cv=none; b=jjm6tMJbkYcockmLGtK3Cz3x1EWdtU7h/xOgBpXRRsyjPLzzmJAdZEKl6Hg+xod9S/aKGEa/IySrF487dz1sr0vvcCqB2bl1EJYmxGEkFh6/uh7lmf0QCfvHzp5y0VHd+K8bJt2WemxT8QKoaTC3p6OY1/A+++qrfvLlDzWqe/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792129823; c=relaxed/simple;
	bh=6Gvr2+KroXom53+mnaz4z076dzX52IfnhmMfpvf2f1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ifuQ+WGAYkhBEX1IKTAXudz6P4nPraiS3mhj8cf1r7zc9VAuELiM1+w4SYCvPFc8trCE1u4tpLC1wOTjvQtO4/zb7KgUtKNTxCicBCghDOWGVgcHn2Of951TplOPF7mDkbZIZ6+AESCwjFmATH3Ulh+ciz8jbzacDXrInmayFxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=a6Vzh7EL; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="a6Vzh7EL"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 991B540E0498;
	Fri, 16 Oct 2026 05:50:17 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 6lR6XK1SbiMP; Fri, 16 Oct 2026 05:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1792129814; bh=rrScfHS4GnofBvxxw+MCiqt5aU/I+G4MuOJOP57DfZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a6Vzh7ELny2/ijHAne3MvjQiPhqiFTEk9p8jT6zcvEVeckQ51rZ8PiRWKubQuEPJv
	 5FKFazziykn0ueVhB++eGdNrcyJDaGQL14aH2rf27Zpvim8BjyIoMJ3KwJ6zVPVUgI
	 95FsSiX3t/GzeRkF0qgv0S55JYCFcptg8rBuGV/3fBtIpRU/5Vw2YafTGafAhE2TR3
	 AgVEtJIjGJ31NXIh0/uESaNGA3nQOvTPoKbV8heJa3gjHBFUzjxkQkyDmlRRlpUNNN
	 nYYuHC18l7GZpXA8lW2dktbmH3ArZVSoLx56ByxEqXEoz7YArwEjmFSVtCfGa/haQ4
	 jIOZqJkGHLcJlUpMq33Bs7nB1OdKCd9JfWV6NVPB9c7mOc7Ky41BffUl6iwyNHDs8M
	 RcHVcQ+F1kq1voUGFofYupgtn18lnQrV29Ag/wE3mzrIXdK0Hq+cMYRs+SR9bFqOGg
	 PrKMGVJGnsXzD7nL7odIxRjFmEg5R1KlUE3SYy69kxkihBuD/Kg1oea1fGPexYQEht
	 StW/bI5AaruwIb9z9jh8banhSn9zMg5Cgx4SZE04CcYCRlxVU5rHwPkfXkhMJ7Q9ss
	 lUsVR4JiHvPeyuy/dxqK+HNSU/TNRYWT4TaAyV8CMFDHo+1kVo4+6fBW4CnNUzDiZS
	 DW/Avq928yeGxMrFZUj+l12U=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id CF7BA40E00E5;
	Fri, 16 Oct 2026 05:49:57 +0000 (UTC)
Date: Thu, 15 Oct 2026 22:49:54 -0700
From: Borislav Petkov <bp@alien8.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nikola Ciprich <nikola.ciprich@linuxbox.cz>,
	David Laight <david.laight.linux@gmail.com>,
	Rik van Riel <riel@surriel.com>, ljs@kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, david@kernel.org,
	Mike Rapoport <rppt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Pedro Falcato <pfalcato@suse.de>, Kiryl Shutsemau <kas@kernel.org>,
	luizcap@redhat.com, pbonzini@redhat.com,
	Tal Zussman <tz2294@columbia.edu>,
	Matt Fleming <matt@readmodwrite.com>
Subject: Re: hunting memory corruption bug in 6.18.x
Message-ID: <20261016054954.GEatG7AgMNFRkiTo1H@fat_crate.local>
References: <20261005132113.43548696@pumpkin>
 <asP5xK4axiUk7jun@pcnci.linuxbox.cz>
 <aseMsMGpGPT/G548@pcnci.linuxbox.cz>
 <20261008182356.GBasffvDuTemTu1VUY@fat_crate.local>
 <20261009090042.39ba9c06@pumpkin>
 <aszH4vpXFAOQP1WG@pcnci.linuxbox.cz>
 <20261014235736.GCatAW8GD0GlYumL4l@fat_crate.local>
 <20261015172820.7961d2c0def74d41cc6c4b0c@linux-foundation.org>
 <20261016031242.GDatGWKo98YSOhEOOn@fat_crate.local>
 <20261015211832.45d87fab15bb3e0bbc2f47cb@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261015211832.45d87fab15bb3e0bbc2f47cb@linux-foundation.org>

On Thu, Oct 15, 2026 at 09:18:32PM -0700, Andrew Morton wrote:
> The corruption patterns strongly resemble AMD VMCB state, particularly
> FS/GS segment data appearing at the expected VMCB offsets in unrelated
> host memory.

Aha, ok.

> This suggests that a VMSAVE operation may have written to
> an incorrect physical address.  Ordinary KVM performs VMLOAD/VMSAVE
> without nested virtualization, so Boris's objection doesn't eliminate
> this possibility.  However, the relevant assembly is essentially
> unchanged between 6.18.55 and 7.3-rc6, and I haven't identified a newer
> commit that convincingly explains why the corruption apparently stopped
> reproducing.  The earlier candidate 55780d8a1dcc remains poorly
> motivated without evidence of nested virtualization.
> 
> Two investigations look worthwhile.  First, test 6.18.55 with both the
> KVM TLB-flush fix (26505e1b5b54)

Pff, we've been looking at that one recently too, trying to figure out whether
it was really necessary.

> and tlbi=ipi;

Yeah, we checked that, it ain't that.

> the existing results don't conclusively establish whether that combination
> was tested.  Second, examine the vmcore to determine whether the corrupted
> host pages contain complete FS/GS state matching a legitimate VMCB, rather
> than merely a few matching values.  If they do, inspect the VMCB's
> VMLOAD/VMSAVE interception and virtualization-enable bits.  That could
> establish whether a hardware VMSAVE was allowed to write to an unintended
> physical page.  The successful 7.3-rc6/rc7 testing is encouraging, but it
> doesn't yet prove that all the reported corruption symptoms share one cause
> or have been fixed.

Hmm. I guess looking at and around VMSAVE handling wouldn't hurt...

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
