Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F2B331A43
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792124314; cv=none; b=uksiu0NvDxJUOl1f1X8QQldjw2W+aShKXEv0kkUFd+TaOsEIWnVL8nERgyyzXcuJQCbRM6OgITqlMqLij2eFnl0tZ9CcXdubSCIfPTuXDG2YHME99elB7IvPCDcXL3KmKste+dh1TgJhrG3t6hbcBoLbMQNPMYlAQDLJeDPFLG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792124314; c=relaxed/simple;
	bh=5dI1vNqahyas465+GYwyqS6GukLCd4L1S8FDhE5BDek=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=lpwVAc+g/rGx3kFoh2GvBlqznE6HXjB/nAuEOS+zqm1XCEEPPPQnpA68w8yZHLSeejVOe2kKfWq2vg9Gz7nKumEni+1tOrc626LYKU3qFMji91ir0Fw3EkpFvpd7fMOQiOtLRXBFLnCMXXtMpP3VVQ6aaynwrIbjPZgd7tBZj2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=E4Dct8Vk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="E4Dct8Vk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D286A1F000C4;
	Fri, 16 Oct 2026 04:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1792124313;
	bh=QbDnuNasrWjaITOnoYmeUW3ewMNkOQ1kcGgALUd7mpQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=E4Dct8Vkz+SkJCejpYR4oJW6gZTakV7zWa0h8ODzWS48qDXN2E1XzVmUEqGwRKBp6
	 TraIq7ebzd27NoSIfORpuGISEved2+C9w2L9gqxnQs/MGyr49s9rS+pkz/lUoj9cL8
	 I8LuLAasSR4327SGNDjGiYoyP+jZRj+Rf4oqk/BQ=
Date: Thu, 15 Oct 2026 21:18:32 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Nikola Ciprich <nikola.ciprich@linuxbox.cz>, David Laight
 <david.laight.linux@gmail.com>, Rik van Riel <riel@surriel.com>,
 ljs@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 david@kernel.org, Mike Rapoport <rppt@kernel.org>, Dave Hansen
 <dave.hansen@linux.intel.com>, Pedro Falcato <pfalcato@suse.de>, Kiryl
 Shutsemau <kas@kernel.org>, luizcap@redhat.com, pbonzini@redhat.com, Tal
 Zussman <tz2294@columbia.edu>, Matt Fleming <matt@readmodwrite.com>
Subject: Re: hunting memory corruption bug in 6.18.x
Message-Id: <20261015211832.45d87fab15bb3e0bbc2f47cb@linux-foundation.org>
In-Reply-To: <20261016031242.GDatGWKo98YSOhEOOn@fat_crate.local>
References: <asKdhWiJb3qXeopz@pcnci.linuxbox.cz>
	<bd8e9b01ad88cafb12da33331f32a1ce315f590b.camel@surriel.com>
	<20261005132113.43548696@pumpkin>
	<asP5xK4axiUk7jun@pcnci.linuxbox.cz>
	<aseMsMGpGPT/G548@pcnci.linuxbox.cz>
	<20261008182356.GBasffvDuTemTu1VUY@fat_crate.local>
	<20261009090042.39ba9c06@pumpkin>
	<aszH4vpXFAOQP1WG@pcnci.linuxbox.cz>
	<20261014235736.GCatAW8GD0GlYumL4l@fat_crate.local>
	<20261015172820.7961d2c0def74d41cc6c4b0c@linux-foundation.org>
	<20261016031242.GDatGWKo98YSOhEOOn@fat_crate.local>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 15 Oct 2026 20:12:42 -0700 Borislav Petkov <bp@alien8.de> wrote:

> > If that sounds sane then testing 55780d8a1dcc on that 6.18.x kernel
> > would be useful.
> 
> Hmm, dunno if that LLM sent you into the weeds. Because I ain't no virt guy
> but if vmcb01 and vmcb02 and "L2" in that commit message refer to nested virt,
> I don't think any of those crash dumps do nested virtualization.

LLM said "oops, my bad".  Then


The corruption patterns strongly resemble AMD VMCB state, particularly
FS/GS segment data appearing at the expected VMCB offsets in unrelated
host memory.  This suggests that a VMSAVE operation may have written to
an incorrect physical address.  Ordinary KVM performs VMLOAD/VMSAVE
without nested virtualization, so Boris's objection doesn't eliminate
this possibility.  However, the relevant assembly is essentially
unchanged between 6.18.55 and 7.3-rc6, and I haven't identified a newer
commit that convincingly explains why the corruption apparently stopped
reproducing.  The earlier candidate 55780d8a1dcc remains poorly
motivated without evidence of nested virtualization.

Two investigations look worthwhile.  First, test 6.18.55 with both the
KVM TLB-flush fix (26505e1b5b54) and tlbi=ipi; the existing results
don't conclusively establish whether that combination was tested. 
Second, examine the vmcore to determine whether the corrupted host
pages contain complete FS/GS state matching a legitimate VMCB, rather
than merely a few matching values.  If they do, inspect the VMCB's
VMLOAD/VMSAVE interception and virtualization-enable bits.  That could
establish whether a hardware VMSAVE was allowed to write to an
unintended physical page.  The successful 7.3-rc6/rc7 testing is
encouraging, but it doesn't yet prove that all the reported corruption
symptoms share one cause or have been fixed.
