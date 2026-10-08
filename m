Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBA52DCC13
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 03:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791430785; cv=none; b=YXK4rsSWchOYNDKyERGWynj0Cqyyn+2hZ+cT6eknoCXbyAWwVpnYa52q0uVwC7TEWJzs2DlqT8uxEfb3cnYjwao74KhtrYRrGau+GwdzNxHXx1bAlt8xO5vruTmFazDe4R1/cqy83i9+t1X2+Zl85wS3KFNgsT12+FYXOlWP8AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791430785; c=relaxed/simple;
	bh=RnissqypflDLpWNzFUeU1J0WwCQz4gc83nJVAkHfYf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gb72hsJFsUL963bsGwElKccVqSWHRRRD5In4IodqEDb1g7tbz7mPkp3DSKQZw8jMrovKjkvmF1vqoJL/Ap8fzSD2p8wePFVUlNW8PhaRI75vTwivehFV8ECLMO4cFwGAuUEww0jq+O/uwZg+leHuBlbzKPmE+6YQ7SbyIo/6GDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=ELR5W+2+; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="ELR5W+2+"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id E573D40E021A;
	Thu,  8 Oct 2026 03:39:40 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id vqgpF6VRqRlc; Thu,  8 Oct 2026 03:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1791430771; bh=B5T8lD2eJ9YQFf9c+UYCFQvOFl6CQJzpDY/qp3B3cDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ELR5W+2+BQqT0pOR2OejOkf0YKEvu1TSoomDG3HiqliFsLSdZS3UmOy40kgEWj9uJ
	 Vvset1Ra8ALMpQgsp4bfqI84NEVUcjwMLBTQNO1P4y4DXTdt88XJE5BWTUlYKxdZFd
	 0SwjS12snzvHw6BLNHjuxPG8Bi2TZiiTEfy2LCCZlLUlaShamv5t0NsQ9VoK9/Tzoh
	 cpKnMw29TpBPOlnvfwoPgmNqZs9Gx2wO5g3NrdQhwNr28tFq0vvCQoCPGjQWo2U5/K
	 YM9MWqmm+27LMizyXSeu1qf+gc/m/u4cvlLOy1P63yYZoobJPK+0QU+bAi243gSYsx
	 rql+xXp3gN8tLno5JLIbDAN0/9Uyiq3n3Y2P3xiLnc2djRzSYfrNrctwNRTJq+OW74
	 KVVUJpD7QNrZSN/mnkDXB8+kiqu5pWhDmXplL0sLNq82wx3CkAtkTdXVFKRGIArqdB
	 SuI0Fl7oSsOe4g/AG39jtS+5Yir3NkCJQuYnPVrVneCRWzen7Wf86Ea5R6CT1XIRoE
	 jeFPtb18rhNMX93HrLS9MCtP6BTrN8kbKoVrlNcRr9kQsg7rrFUWI9GffZUzweVKGz
	 xwNicS/FUcs9X1QnfVZnVz/rni+ek3/rOhlxh1/waevg/NHWv1rXBsFKpSGVnwbJOW
	 UsQyU8uAA2LBDRzi/Ym2ID4w=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6C12D40E00E5;
	Thu,  8 Oct 2026 03:39:22 +0000 (UTC)
Date: Wed, 7 Oct 2026 20:39:19 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, tglx@kernel.org,
	mingo@redhat.com, dave.hansen@linux.intel.com, peterz@infradead.org,
	david.kaplan@amd.com
Subject: Re: [RFC][PATCH v2 02/11] stop_machine: Accumulate error code rather
 than overwrite
Message-ID: <20261008033919.GBascQZ9ueHINwNghd@fat_crate.local>
References: <20260331014251.86353-1-chang.seok.bae@intel.com>
 <20260331014251.86353-3-chang.seok.bae@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260331014251.86353-3-chang.seok.bae@intel.com>

On Tue, Mar 31, 2026 at 01:42:40AM +0000, Chang S. Bae wrote:
>  static int stop_cpus(const struct cpumask *cpumask, cpu_stop_fn_t fn, void *arg)
>  {
> @@ -512,7 +512,7 @@ static void cpu_stopper_thread(unsigned int cpu)
>  		ret = fn(arg);
>  		if (done) {
>  			if (ret)
> -				done->ret = ret;
> +				done->ret |= ret;

Yeah, can't really do that. Sashiko says:

| Looking at this update to done->ret, is it possible for multiple CPUs to
| write to this shared variable concurrently during a multi-CPU stop operation?
| 
| Since done->ret |= ret is a non-atomic read-modify-write operation, could
| concurrent updates from different cpu_stopper_thread() instances race and
| clobber each other, resulting in lost error bits?
| 
| Additionally, the stop_machine API is a generic mechanism where callbacks
| often return standard negative POSIX error codes.
| 
| If two different CPUs return different negative error codes, for example
| -ENOMEM (-12) and -EIO (-5), won't the bitwise OR result in -EPERM (-1)?
| Does this regression corrupt the final return value for generic callers
| that rely on standard negative error codes?

and I can certainly see it:

__stop_cpus() declares done on its stack and passes it to
queue_stop_cpus_work() which copies the pointer into the cpu_stop_work struct
of every CPU and by the time we end up in the stopper thread, it has been
woken up and we don't take any locks when we run ->fn - we're just
preemption-disabled... So, IINM, we should drop this patch.

Making this work is perhaps too much of an effort with diminishing returns...

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
