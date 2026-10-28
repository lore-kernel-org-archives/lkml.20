Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200258;
	b=Mzm4C2SMwY8HJ+VWeS2fBLvLMHKXvL5qOKgiIUDrTaR2zZbIZTgQ6aOcDaLel13jhEzt
	 lr6n94dG6Oo11XB+9mZgUu+v7iT2HP5Vi+It1AufUCuupz1SfDa8TXBuCkw8JUjrOCmg8
	 hJNahhkNQGyC9fIp9guNtNREZ4ZJE2ZopBufz4Tr9KhHq6Rh/ut6d/V27aBV5Kecb05XA
	 16+xMVONUR+g/I700bjNYSkjObR7xanMBIK74ETXCRRwqwql+3ny0s4Bpu73fuda0cC6l
	 Vj87i/XBZCu4L+sOFU0yOQmlFjwpLl5nBJ0ZddV6uCwn/WYD26ZR1NLRuYGX36H6IkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200258;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=zJEXaQ8jSWgP6qA1dzo+tcj5ogtK+kqgyHg39Lx/ixk=;
	b=ELjhTSGu5/zbd635V4J1moM7BlJqEUigmetoKQE58K+b19whoxMX3OdLd2YIWxwwEyHx
	 7XkqBQB21TMQDACdaUgIyMjyo0cX5LFkY+Hehhs/K/gF/yiynD/4pdISVj9kdv2j/NOQE
	 FSEm/b3BnVDnO6GGBrLjCXbfYaZ9wVUon27F7Zou5c+7KaalBLc+MpzAXZkGBwZfdb9jS
	 CPl5RbgCGc9hK12eT4l0vN/cOQgwazsFhqmbXG3AxaSmnGRrJUT7UoH1HsSxZlkw6fAUd
	 1ZGTTK0Jx1t2rnxuxjfraaNepMmP20Rc2RLhsXEtJthIAack8i42vRG3zQBzcSxRsnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RilOH8K6;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7570606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:10:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7570606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RilOH8K6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793200257; x=1824736257;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=kZpJ51Q9XHOo66vwnmVE6Y5LD80IdRLYyTLoW7lukgs=;
  b=RilOH8K6hOTORdbxE+qgSoJWv3QcuFTTeP711Ju7qeqnRSmqfo0Ia/CB
   /u/0vezJZSdkacXR60++ayyKTS2e4tDA4cXCkOUabqxoAg0S2KCBvJfnE
   lRAdKe/n6uayGemaEwPUBubLcElGB15dsx3sawUUhzcuuicDydo5pgOiT
   OM0U4i3xAxevpza02t7TlefS++Xefcja39iVutmXWKLmqiBTD356E78Qj
   JBwM9OINe5ZnUSB9/F1SfDUIiHB5hCtKEdkEbX99CUoVA6d4SvHF4c8F6
   K7UqEEAOa64k0gx6khaK73JICoD/LsHy5TIEpuVwjk2PdChCPLGtdNniC
   w==;
X-CSE-ConnectionGUID: ujnGcisgSYKbJfY+SK3znQ==
X-CSE-MsgGUID: fQNZeedsRW+/aW8wGsf2Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1815499"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1815499"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 08:10:56 -0700
X-CSE-ConnectionGUID: s/g7RBvgTuyrvc2aaiToMg==
X-CSE-MsgGUID: C/5+mR20TXOs05Ao6j31CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4896664"
Received: from jjgreens-desk24.amr.corp.intel.com (HELO [10.125.108.218]) ([10.125.108.218])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 08:10:55 -0700
Message-ID: <27a7b4b6-23da-4469-9161-2ce44e8ac2a9@intel.com>
Date: Wed, 28 Oct 2026 08:10:54 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: Drop KGDB support
To: Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>
Cc: x86@kernel.org, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, steve.wahl@hpe.com, justin.ernst@hpe.com,
 kyle.meyer@hpe.com, dimitri.sivanich@hpe.com, russ.anderson@hpe.com,
 linux-kernel@vger.kernel.org, mhiramat@kernel.org,
 Matt Mullins <mmullins@fb.com>
References: <20261028122124.GJ2668804@noisy.programming.kicks-ass.net>
 <28F95BAB-6D5B-4C70-A9F2-14B752EBF022@zytor.com>
 <20261028142625.GU2668564@noisy.programming.kicks-ass.net>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <20261028142625.GU2668564@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/28/26 07:26, Peter Zijlstra wrote:
...
> Also, when was the last time you used KGDB? I think I've tried it once,
> some 20 years ago, and haven't bothered since -- it was *that* good 🙂

I can't remember the last time I used it. I also grepped through all of
my stashed-away kernel configs I've been using for the past 15 or so
years. The only place I even see it configured in is in distro-derived
configs. None of my trimmed down debug configs.

There seems to be approximately one clear commit that shows anyone using
the x86 kgdb.c in the last decade:

	commit 71ab8323cc357c68985a2d6fc6cfc22b1dbbc1c3
	Author: Matt Mullins <mmullins@fb.com>
	Date:   Fri May 31 12:47:54 2019 -0700

	    x86/kgdb: Return 0 from kgdb_arch_set_breakpoint()

The only question for me at this point would be whether we should just
config it out for a couple of releases rather than removing it outright.
