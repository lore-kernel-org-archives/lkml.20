Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.72.0.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986637;
	b=e/oz8vOx+BDcFpI7g7RVnLObLvacHBJOWHDHczjstX8OwN0ceiBpCArWdz8Y/w+6su9O
	 C1nZjUgYUZ5FHD1+08rEb3A/rrHV3cSobl2uMrwVLiEQ71S+9o0oYikmXgLUu3MC+20Wc
	 tM1mBJRPDt1YKnG5GiJiZ9lJUvxpXbS2CSTMwc3LFX8LYVJ14BbpFC6jGCd243erD1nvd
	 LkYQAU2qC1X56KMF8DsHHu0vfflmJQyD1k88iY0brtGIpDskS1kHst99hyEZdv+ym3QxH
	 waMIXlw6i0VmMBKmbA0WEs6mvWQsMV7IKcBLLCG6A1Qo6+9TWKtFRDciD0G/S0aT1mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986637;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=1uoprF+BWZMjYQHafHnomTTQtakytGeDxHNxG458KU4=;
	b=O4TrpuylmE4g9rACtdZsFCnN8jCX2crQokdnbTj9kj1jOv/J1S3JIqSg5MuCHWBIdlmC
	 jsAZ7DWfFYI5do56GuxFkmmetOraUrcHLie/UQSFZA+yWrsLpguk6tkI1CozEtFEP2Dtw
	 z0IchMbiHtOTP3ejnjePmOhrrkcUfcLjVUSJVVf2cInCTFc0St38g/Vz0hdfB5QhJW9wp
	 IoW3HFl9nPpzmj7DOlj0Gc1QHRHTt7d+O0fuJjOS4FEYKBm9YQ05VBjAoXRxUwANqSyeR
	 LzTOPMkbUCOdrbb3Bfq9GH9YRaGhdERkwToJTnuKRMCX1R7PgvOXyMFEpG4g9xSMy0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gentwo.org;
	spf=pass smtp.mailfrom=gentwo.org;
	dkim=pass header.d=gentwo.org header.i=@gentwo.org header.a=rsa-sha256 header.s=default header.b=h+QEgR1f;
	arc=none smtp.remote-ip=62.72.0.81
Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C580A606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:37:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C580A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=gentwo.org header.i=@gentwo.org header.a=rsa-sha256 header.s=default header.b=h+QEgR1f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1793986630;
	bh=j8vdMm0hGJoZSKbsDFe2MZRFIjAVfM8/OQPnYklq6tg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=h+QEgR1fn7lqdq2kynHMk2XnpoLTWXW5bsY2VXxfV9GkG5jZ4AhEH8GR10JNCbiDj
	 3xoqJFjQjHjwLbMFM8mfuZK//nunxaseFKqKl9vb14V8Mz5UD+po0IOIPmlCXcIraa
	 VEIfAm+GuiLZZrp4yWdus29GklEsu0kQ7lPE/VRQ=
Received: by gentwo.org (Postfix, from userid 1003)
	id 275D140257; Fri, 06 Nov 2026 09:37:10 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 24F52401FC;
	Fri, 06 Nov 2026 09:37:10 -0800 (PST)
Date: Fri, 6 Nov 2026 09:37:10 -0800 (PST)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: David Rientjes <rientjes@google.com>
cc: Andrew Morton <akpm@linux-foundation.org>, 
    "David Hildenbrand (Arm)" <david@kernel.org>, 
    Vlastimil Babka <vbabka@kernel.org>, 
    Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
    Sarthak Sharma <sarthak.sharma@arm.com>, linux-mm@kvack.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [patch v6] mm: vmstat_kunit: add synthetic benchmark for mm
 stats
In-Reply-To: <21183f5b-2697-cbe6-6370-dbd27c5e2b60@google.com>
Message-ID: <2e88a1d0-3a36-cfd5-3e4b-79cf4c8aae0b@gentwo.org>
References: <21183f5b-2697-cbe6-6370-dbd27c5e2b60@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 4 Nov 2026, David Rientjes wrote:

> cause performance and scalability impact for users.  Google has carried
> these tests internally and kept them updated since Christoph posted them
> back in 2009 for this purpose.

Thank you. I have a couple of more for atomics, slab, tlbs etc that have
evolved over time and gathered specifics for the variuos platforms being
benchmarked and the issues that it was used to track down. I can dump that
stuff somehwere if there is an interest.
