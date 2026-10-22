Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792705066;
	b=vYXlYQg9sj/iymmK9CftUkneKUPY/CaScIymeRstmBwmWrXWuvXR2IqQtv7VTsTYTgPG
	 85zpcLMTjWfeM/fv/5XhbNDfzInX2MZc9FRYiNierTMD9ldYlzxo6QRMlJ8HOsoVNO/Rm
	 HltPzSCBe3E1ILNX0OIpce5/0UkpDeQR/k97ydAPOvBvSL/YDa80oMOP87R+dhF0vbgUR
	 u7Ywb7OvA0zJnAQA7bPpJ1gEg8SvfUG2HJ+JNUGBYY3B0alFF2uLbzpWI+3Y5dW3eGISj
	 20tFbQY2eIk38BFyVcPp5ba25rQTiSTHgfK+AabBM+pI2pZ84nkXzL7fw5JSpFTXsKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792705066;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=hOCXLjjMCSqfojimdFCQLS/n5SqI1H3eQ5hYx2WoKOM=;
	b=cs/hq198QI3GxauMPq6/6FThZiPPA3qY9awy8wbn0MR9NyOM0BPLCcp5K32qtWUkpUjv
	 9HF0ijLansUpbP/kkPUpjHl2iGP4BY6vjnaw4dvVrF8BNGGBAQI+0CPB6prNnBBx816mt
	 x9btkDconjvlIwdiei0qLNeTdFi24MV80tdge7Aa2mxk6bP3/UJ/0Cr7ZOwZhpuRtGA9X
	 5NaZgfk1JEDv5V9LccpySD2wfzUm5BAhrPD1pZvoiC0de4Kh8aI98hXkcseIi19Gwe6ls
	 NBYeW4+sOLZUtRJXgMrtQ6pObk6sxqMztLGE2p+C/0Y0OJsw8IH9GuTEK3CLPFmyxJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mjm2RASS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92EA606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mjm2RASS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D057F1F01825;
	Thu, 22 Oct 2026 21:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792705065;
	bh=hOCXLjjMCSqfojimdFCQLS/n5SqI1H3eQ5hYx2WoKOM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Mjm2RASSBi02V03HihG5dPV6pXjb80ZX2lUEK7YwCPNalEXzRiNeCWVWzulvADuyn
	 maLVcphWcGKar8btNYeuMMBAdAtL5+3jviyzk/BoNfbqqklHTalazpZ0kwlqOdnpry
	 cf/sYEw7HvXVfJTrzWKgJoxmv8i14JAG8oFqQO7dLtR9barsqU65pq5BY8QoedrGw5
	 nVKFvOHPb+kPBrbZdXtIMI1g+ko+Z8zHls8Dr3ZkB6GlddTm4a5HtRxjDIutiom0Pu
	 0BKkyCoqVqxu2O60yqVDmoif7t8YcuK1OjPam67NYBCY+QmDAPRqcPyiiBdzYIecv8
	 rQvfTT6XGu/4Q==
From: Thomas Gleixner <tglx@kernel.org>
To: Kyle Zeng <kylebot@openai.com>, linux-kernel@vger.kernel.org
Cc: mingo@redhat.com, lukas.maar@tugraz.at, outbounddisclosures@openai.com,
 Kyle Zeng <kylebot@openai.com>
Subject: Re: [PATCH v2] futex: Use a keyed hash for global futex buckets
In-Reply-To: <20261019183334.29433-1-kylebot@openai.com>
References: <20261006222450.42518-1-kylebot@openai.com>
 <20261019183334.29433-1-kylebot@openai.com>
Date: Thu, 22 Oct 2026 23:37:42 +0200
Message-ID: <87a4o51knt.ffs@fw13>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Oct 19 2026 at 11:33, Kyle Zeng wrote:
> The global futex hash is a public jhash2 of the key, which for private
> and shared-anonymous futexes includes an mm_struct pointer. A task can
> populate a bucket with futex_waitv() and time nonmatching wakes to learn
> which chosen user addresses collide. Shared-file keys have predictable
> inode sequence numbers, so the task can also identify the bucket and
> turn those timings into constraints on current->mm.
>
> Lukas Maar, Jonas Juffinger, Thomas Steinbauer, Daniel Gruss, and Stefan
> Mangard described this futex mm_struct disclosure in KernelSnitch at
> NDSS 2025. Section VI-B recovers the pointer by observing futex hash
> collisions and evaluating jhash2 offline.
>
> The per-mm private hash does not prevent this: a task can disable it
> through PR_FUTEX_HASH. NUMA-routed private futexes and shared-anonymous
> keys also use the global hash.
>
> Use SipHash-2-4 with a boot-time random key for global bucket selection.
> Hash the three identity fields individually, without padding or the
> separately handled NUMA node. Keep the original futex keys and equality
> checks, and leave the per-mm hash, which only hashes userspace addresses
> and offsets, unchanged. Initialize the secret before the global tables
> are made available and keep it fixed for their lifetime.

Fine. Did you evaluate the performance impact of this change?
