Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792618627;
	b=guGPe4VlQ6TSO6Y+nU2WdwGN2gbQwO09Oq3aPgiK/cLLvTBZ0FRD9Ihj/s/QL665nzuk
	 YDg3gr6w/JGcGFK/Zbq7iUBRi4w8YXHpeJvdOMaLSPK5VO/SmqC3qBzW46ykGJElt7NC8
	 LBh0Fv4TAVsmCrXfihuHO8jAFCc+FQFloTskPr01XoqwEi9Sq+CyrdueX+Q/fvrm7X9Po
	 ZZNRXW0Vj+j8qKeiAwwrnCVuzCOjz1nm5FsbV1+CqFGm1hT6KXoAUfUZISPWFfGWPQVOa
	 RWUGPwW5UZvXI9F2cDQUeXLkTpR4JT6jEACovQDux8JfL5JrapP2ASpBHvcWVUG1xhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792618627;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=sJ990sqZ4/ri6q2ejelZgxO4KylZ9CPLKUVlUc+fxbE=;
	b=gicVdNzm55RCjn4XKipOQXLkNfUp+P4jMrvNBRiM+oe+a6M1RnsCcQpYh62KFK1otTID
	 iG1L97IWbsNJSbtrZJxT3T92JUXZtKt1h/ItLddM8Ga1wyI1PAZgf06fc7M5qJQtEHEVw
	 lOhm/fp0VxxRnhZXCorTQ+yBuoQ2GXEJyOlywxcTTfMGOteMOT1HAI4to0NlgJ3uxYcfU
	 QPJnHHBz+/aPuRbpZWYpCeKzRvtyhHa9FdCcf74O2k9hwfhSEZNzNtCeFlV68afJC8XmW
	 COMRBqzVCvFuPy6igHgvG5gU9SuIlKCrzBZuex9wN1douzZtU+nU+9IqDFNHlalxjJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b="izrIMM/K";
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD59606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DD59606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=izrIMM/K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sJ990sqZ4/ri6q2ejelZgxO4KylZ9CPLKUVlUc+fxbE=; b=izrIMM/KmRR/slCxkIfq8rXF+u
	ZDvGkmYRjZa+8/Wi/yZI07DyNDvLMJdCrjPvoJp0ejIKki8yBHI11rlY+yUBTWX4uAf66aUdTyAn3
	gRgCgeu8xKzfzppKyPoO0jxN2BpKEGTZhKu03RFhQeU2usMJoFYXPPMzdQ3Ak+0fes6qi/9/zPO9z
	zFFfdCbrtMrwb6i4edHU7NNFvjcjyooUDRvRK0PT5wKLP8uW7IRtPMx5EsUcapVzGv746ipL2GpMH
	RPnAj+3pNuW2u7025dgDbkLT8XkpEjUqmwKOja7hvmEIpsLvVhMk18UKTZG7uE57IpeBR3eYDF5hi
	PTCEH5Wg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJdzP-00000006Ffb-2DyN;
	Wed, 21 Oct 2026 21:36:52 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id AF3763005AA; Wed, 21 Oct 2026 23:36:49 +0200 (CEST)
Date: Wed, 21 Oct 2026 23:36:49 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>,
	Edgecombe@programming.kicks-ass.net,
	Rick P <rick.p.edgecombe@intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	the arch/x86 maintainers <x86@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>
Subject: Re: [RFC][PATCH 00/24] x86 Kernel Shadow Stacks
Message-ID: <20261021213649.GS2823843@noisy.programming.kicks-ass.net>
References: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
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
In-Reply-To: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>

On Wed, Oct 21, 2026 at 12:51:20PM -0700, Dave Hansen wrote:
>  * Work with IDT-based systems (without FRED)

This simply cannot work -- IDT relies on that horrific NMI nesting
stuff, and shadow stacks hate on that something fierce.
