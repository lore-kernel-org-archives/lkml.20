Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793071064;
	b=2Ffo3vKhuEEO8lLXPRM7zoFRbwWQRvXgA0zIp2KfUFvK10lD01UiPkNmsEQi3QgoLy9Z
	 jhpV+DE6+n9iw70JHNEYiDye2azsY/zkRYxl6C8p791F2mIVwQfkFzGas4AxxtKdvggGN
	 hqyE+VkA8OeSfLKGAneTP8dKA6DtSK99vD3WdQ0EhtUKrWbiS0bMHZr5olu/Hfxt4ecHm
	 cCU1QANUOszHSB/9wUegUaoPTPb+x70Nf/oT5ZCGEI1OTd2iGWwXOJtUDDSZqbXFJbIbA
	 ZISLo0gzEb0EJjfd7cL8I8Nzy0+f7KEYD0rXE8FhFT2n2xCDuFq+mSFJOJAfgyyfGjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793071064;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=1h0JdYmEXnguZXk1vkk5poE+L+sggC+onupDoS+R94c=;
	b=FgYrp+QSVP2c9JbXNxmYwMXbskYQGX3R80aFjopHoLknL8P9WqERtccMue06LB8qVptN
	 fJlf92hTDl8YkEv03Kjqo+Wv7hwZwXUCKC3p6SH0bY1r+xqxCmB3RVCGLJ4/0/7g1eOIq
	 CJzOJmO2eWUp5uLo4fuuUk6r0h7TOMYMS8JpdBTU48SL7UkVkP0c/Bt0yqnTP1I8JVAJn
	 7l5MaVlhuNlheV23wG/Fjua9EOi95RMAnoeOy3ItQWOHR2Dtma9VwgPJfSHw1zVzoR4IM
	 uIyiN61p03yr2wH049SZOEdAMXtU2WfscsnTwzgPBC8pU39XK3l3Tg+Nfe5K/iiUtEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MkDvZguO;
	arc=none smtp.remote-ip=95.215.58.151
Received: from mta1.migadu.com (out-151.mta1.migadu.com [95.215.58.151])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB79606A323
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:17:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AB79606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MkDvZguO
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=g5mKGEg3esWjrSYi4zhdySwiQhjoroqqYlyme6WhbNU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793071061; v=1; x=1793675861;
 b=MkDvZguOM3/KKjgVY1Pj/bsHiXysY3ZB1n68SB3wl46cAjip1sg4kWV0ffRSnMEnAOdyPHX7
 Do0TD0xDpt8GzdAm9mtD0MOp4wWlIWPIM2oSl1L072svvaoNdfBnVxcBPbP0WbZwB7yi9UQ2QSM
 Mes4A2+A0dq+tK2XoLCJTSIs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cdb8164229260d30;
	Tue, 27 Oct 2026 03:17:41 +0000
X-Mizu-Trace-ID: cdb8164229260d30
X-Migadu-Flow: FLOW_OUT
Date: Mon, 26 Oct 2026 20:17:40 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Peter Newman <peternewman@google.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>, 
	Tony Luck <tony.luck@intel.com>, Dave Martin <Dave.Martin@arm.com>, 
	James Morse <james.morse@arm.com>, Babu Moger <babu.moger@amd.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Meta kernel team <kernel-team@meta.com>, x86@kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] x86,resctrl: Read event counters with an IPI when
 the read cannot block
Message-ID: <auAXqinfh5lTBCVQ@linux.dev>
References: <20261020151352.2346257-1-shakeel.butt@linux.dev>
 <c96fb51f-9ab2-42ac-81a3-a5e49c87c2b4@intel.com>
 <CALPaoCi2YV0EHTjz0Q8c0PE_CGXPcupqfGd7=YfK8UqpLzn1oA@mail.gmail.com>
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
In-Reply-To: <CALPaoCi2YV0EHTjz0Q8c0PE_CGXPcupqfGd7=YfK8UqpLzn1oA@mail.gmail.com>

On Thu, Oct 22, 2026 at 11:05:42AM +0200, Peter Newman wrote:
> On Thu, Oct 22, 2026 at 12:58 AM Reinette Chatre
> <reinette.chatre@intel.com> wrote:
> >
> >
> > If the goal is indeed to obtain accurate monitoring data at regular
> > intervals when using the stated hardware at its full capacity then
> > I would suggest that you consider the per-group rate files that Peter
> > settled on per
> > https://lore.kernel.org/all/CALPaoCgpnVORZfbKVLXDFUZvv8jhpShHPzB3cwdLTZQH1o9ULw@mail.gmail.com/
> >
> > I actually cannot remember seeing an update on that work after he posted that
> > message and my assumption has been that that is what they have been using since
> > then.
> 
> These changes have been available within Google for a while, but I
> don't believe they've ever gone into use. They've had a lot of other
> issues with the MBM implementations on AMD and have been estimating
> jobs' bandwidth using the offcore PMU instead.
> 
> Shakeel, I can share the changes for you to try out, but they won't be
> up to the standard for code review. If it works for you, that would be
> one confirmed user and I could put more time into it.

Yes please, do share, I will take a look.
