Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969879;
	b=r3AFnsZ3fz/phYPGnGfl6KqsUaQESr0+cCuQviQ6NlAPUNNjAiAvXOeiUpkqaYmB5lXY
	 7Sgy7NfoxfQ1NdgE2tIvgYxIzB3bfcqp3chwW9sdM1kl7nPkCMtZ6qcqCGyGX92w73lXz
	 zE1YgU3DDleuraBbnp3c9Ei5pn3LdYE+Y0xsPVbtdvhsvK3KRPrDrYubDRlkwhOUz7/4X
	 K+jfy7Qt3jRyESL+dPIGEDdkImn4m4xpkXuqPt6lej/yhmnmLS0gSl2FqCHh7HJvFVNr+
	 WwEesiXlr+7RBI80+FfZgHAP4bWLBNVAvdqsN630g+7w6UvxDKzq/lFNppEbBTqgVNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969879;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=iZ4lN681ajQHPx1uvbvHoK+Cj6ldX5GuC96t5z/VUy0=;
	b=LP5DFUPxNpwRpy9LDxdLQgPx8/20UyNrP0bWgz6ISeilivpqAwgstSmUJ4bXyPS3MTdi
	 yOIE1LRt7B25YxpEjE4OKDTqzIpA458kwUph7n1QETBmoblXm58FGWv8yqKpyXnhm0jIg
	 FqdJfYB07Ld6jiaAwVg9pNI5CupUP5pkiD4vZJ2DYxEwrmYjyej2xzy8G6TY5Q8OV3A6v
	 UJ07n6iJ4fVQtwrT5dGmfR1G9WyMNK4f64BFcV62K8H87J3yCJ6Fgs2afeRwX75Ws6I3a
	 yOgny5BQkRlLUqgIHG9QYM1C1pjvwT2ZdceqTHLQXBdCoJX3ISquKNXuPVOO7/ely/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kw6iZr0x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E919B606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kw6iZr0x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2F201F0089F;
	Fri,  6 Nov 2026 12:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793969878;
	bh=iZ4lN681ajQHPx1uvbvHoK+Cj6ldX5GuC96t5z/VUy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Kw6iZr0xdVbUVhaorQzM+c2I5I5tSdtyy0WJFxR+cWWcoPDeY5aQf5fDy9MbwAqHd
	 3+K2hixVUatcMeQ9phS1sB7NXBPM4/HnxfYoaiTAjOF7trOLC7O5/WTcm3It+dJCkN
	 TlSHZ9s7CbbBeZ2eZPTL02/gaDl7RQXeHC4X5BurkL1wy+8ZKaRLQjRuyWjopXrVL/
	 H6T8HWTF0ztxMUS6f2w3spK6ZLdX+Jhj3NocxzM9mf8C0UrJUQt0wYvREdX0Nm/VWr
	 IGtz7qAYdCcdV0SG0/rkjsvzpvRgW12X/4qbCRVIdvBNkl1mIWxxEGjTzc/UBgxgq8
	 Kd6uooG/WzNAg==
Date: Fri, 6 Nov 2026 14:57:51 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Ivy Lopez <skunkolee@gmail.com>
Cc: david@kernel.org, akpm@linux-foundation.org, ljs@kernel.org,
	liam@infradead.org, vbabka@kernel.org, surenb@google.com,
	mhocko@suse.com, fvdl@google.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] mm/cma: fix range selection in
 cma_declare_contiguous_multi()
Message-ID: <au3Oz50x-y3GPYpA@kernel.org>
References: <6099bcde-15be-4197-905e-13dfa4c83bfe@kernel.org>
 <20261106002347.255584-1-skunkolee@gmail.com>
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
In-Reply-To: <20261106002347.255584-1-skunkolee@gmail.com>

On Thu, Nov 05, 2026 at 06:23:47PM -0600, Ivy Lopez wrote:
> On 11/5/26 20:38, David Hildenbrand (Arm) wrote:
> > Do these two fixes still apply?
> 
> Yes. I checked against akpm/mm-new at dba8aba0a9a0: both patches still
> apply (two hunks with a small line offset from the accept_memory()
> additions) and both problems are still present, since
> list_insert_sorted() and the sizesum accounting are unchanged there.
> If Mike's rewrite is going to replace this code soon, dropping them is
> fine with me. Otherwise I can respin them.

Sorry, got distracted, here's my version:

https://lore.kernel.org/linux-mm/20261106-cma-multi-v1-1-054eae6e2c1c@kernel.org
 
> ivy

-- 
Sincerely yours,
Mike.
