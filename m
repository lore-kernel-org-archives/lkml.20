Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792618865;
	b=cTAidam5ufqUyLLHYf9BB6hFbrbTPaJpkPpSXT4O7b6Frw9PBM6vs84aga6CzprezcHS
	 H0NRUo1t6fb+s39W+oAbmJ3FWhiYWtiWha+1cMwkHWUMilYgBDlSXllqDLn7MdFl0Ybwy
	 J/VvpJeZHMbBJiZWwQAuEn0WhKw0usZcFCJlUCNRIbWWCyEnaDnoPrV/ivbLkM8dnwLat
	 xIzUHfM/qEHkQittRFvcRpgWa+QRX57Mdq5CQWbxwEZ1l4d2Nl/cOo5UFv0SP3CeVyZAV
	 GwdMA8pXtL4xY17hmJNum7xwPv6BGex7KHqxoQ5OgmcdzgYD7mLQbGxK2rciHTGMqaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792618865;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=/1aHWxyPWaYI59CMhIW1BNu9XQN4EHa+eCNK3CqCECU=;
	b=Xnc4BNTk5s4xOKjyE4+Ofcf5QQI3yeMmSK328MED0hHDnOB1/aWvD4XMVqbd8rlOa4yJ
	 QI78Go8sP+TnyUHLi1tVkgdUyy9zWPnEqqzcoU+iy/dWrNAmNnXmI7IC7pm6QLmufuJRc
	 eMv9NztVQcmjwqJyfthqIVw1wsT7ObS8bZ18HYvyDEJ1XiD3faxyqalDhrJUcyGDaxGwA
	 +Dz3pSQFiiohrWlQ4+Iy5Ewr5UdPYeDFsPEugzOsp4jV0RmsXdNh+DwH5wY5hBqzc/1oT
	 PmykM9iGJLKD0UqjY8c5mA1Su6sRh5krPyTiOR5X0ATJnMNF1nIxdjHd8P8q6GqxI8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=eE+ocNRC;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B234606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B234606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=eE+ocNRC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/1aHWxyPWaYI59CMhIW1BNu9XQN4EHa+eCNK3CqCECU=; b=eE+ocNRCWFnuOT27sO4xPdlij2
	t6Rm729ePETVVg2CsQcT9clnADQpez7N1pkcPgxnKjZwTV+Jt7Aw09ec/G589YXVEuw4NJikJASgp
	sK8n23mjcSeZBpvdIWEPlBlsaPq8riJixY75CxDxUpjttm6QytHMKidP1z2yHxDWmpBH2mF6RxyVR
	GjI3VobILlezRrY3BUDKkCc5ebsrjhSUSRoGHGLE9xfWOr9DvIMdod43zYa6+Ot8KvEhMUykDyFiO
	qeBSrCO9Pgl2/nWaHib5XZJZLnUWrAN8rDAkg64UC25amwn8iA1l0ieW2c8TFuuScpx7/Qd+bZB4i
	Q/PNga2g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJe3O-00000006Fnu-28yp;
	Wed, 21 Oct 2026 21:40:58 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B51E83005AA; Wed, 21 Oct 2026 23:40:57 +0200 (CEST)
Date: Wed, 21 Oct 2026 23:40:57 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>,
	Rick P <rick.p.edgecombe@intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	the arch/x86 maintainers <x86@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>
Subject: Re: [RFC][PATCH 12/24] x86/cea: Map and use FRED exception shadow
 stacks
Message-ID: <20261021214057.GT2823843@noisy.programming.kicks-ass.net>
References: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
 <20261021195136.687DBEA2@davehans-spike.ostc.intel.com>
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
In-Reply-To: <20261021195136.687DBEA2@davehans-spike.ostc.intel.com>

On Wed, Oct 21, 2026 at 12:51:36PM -0700, Dave Hansen wrote:
> 
> FRED hardware automatically switches stacks between levels on different
> kinds of kernel entries. Each normal FRED "RSP" stack has a corresponding
> "SSP" shadow stack.
> 
> Leverage the existing CPU Entry Area infrastructure. Add shadow stacks
> for levels 1-3 right next to the existing RSP stacks. Map them with
> shadow stack permissions. Last, point the FRED SSP MSRs at the exception
> stacks.
> 
> Just like the task stacks, do not leave a guard page since regular and
> shadow stacks have mutually exclusive permissions and serve as guards
> for each other.
> 
> Nit: The "return style" of the new cea_map_stack() and wrmsr() code
> looks superficially inconsistent. But each site is consistent with the
> code around it, just not when looking at the two sites against each
> other.
> 
> == Future Work ==
> 
> The *_stack_guard[] elements could probably be removed now. When in
> use, shadow stacks serve as guard pages for the regular stacks. When
> not in use, the shadow stack region could remain unmapped and also act
> as a guard area. But that would take some more fancy dynamic mapping
> work. The existing CEA code is dirt simple and doing anything dynamic
> would add complexity. KISS. The downside is wasting three pages per
> CPU when shadow stacks support is compiled in but not used at runtime.

People were trying to *shrink* stacks ;-)
