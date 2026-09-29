Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF63D329E5D;
	Tue, 29 Sep 2026 23:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790723204; cv=none; b=jJJQlkBGWTtI2M4s6ujiw81uaFw3gB2YXlhHOqPaOKWqxDgkqfRLtChxn0vbXc0XPHfnI6stcCTdGF68/XyWL7Pv86Viyff9s9BM9JPkFuZAnYsP3YRF3CXzT0DXA54EwZWx+ad/qhfHu01pnnh/eaDglEkKngrBBonO/BvrbUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790723204; c=relaxed/simple;
	bh=hgZuY1NB6LpeCr6RapyBc8LRcgy0vqjfZ7B8ehuh9/g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AhdpjPvo8+pW29WA/1Wx6VWYTHs4Z2YhBlDo9bXSXKVGqZlW/8azrk7i/RSa7vwfZsGa8f153/z4c8T3oBCSLlMVucYMejkspoepCS7gSlfcKiHYQwskmPbdJ/K+i4z1Z/RFOqZLapkXfvROufuLBxJiO3KeIRc6fIIlVox3S88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=o3HYD9Xc; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="o3HYD9Xc"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net F3148408FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1790723202; bh=uIke5UfhrUOUD+L5m0KedjGsRjJ3iYLA6gviUCnOmYg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=o3HYD9XcgRrcr+gnctAFWDGmM11Fkz7HZU+7lO/KlIv4pWdR9JbQaXq8c8Xy/TKaj
	 Bmt0Cwq9zc6NBNifIRDcQwC4PJ1ygBLBu7yC56oDEXr5M2JZL3i/PMTcKnKP2de+IE
	 A7+pLVaBY03/H0xOspIbTjQx6sIdP27DC+S2a62kOk5uMXWLCt2Sa4bnco7Ws3xZXG
	 BLZ2ZzM8Dp584mzEf86lC4goc/2OU6vL/dw7BjtG3KuXB7semccfQbmlYhz7+MNjKx
	 J/XXjQoYo8UddWO4aO34TSCVn0iR3zNUkV1wZ7RBJPV4qGhkK8pja2RXKuIKc2ayEs
	 Vb6LFBqlRyk9A==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id F3148408FF;
	Tue, 29 Sep 2026 23:06:41 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>,
 peterz@infradead.org, elver@google.com, bvanassche@acm.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org, rdunlap@infradead.org, mchehab@kernel.org,
 aleksandr.loktionov@intel.com, kees@kernel.org, emmaonana18@gmail.com,
 tudor.ambarus@linaro.org
Subject: Re: [PATCH] docs: kdoc: parse context_lock_struct() as struct
 declaration
In-Reply-To: <20260925234054.128477-1-emmaonana18@gmail.com>
References: <20260925234054.128477-1-emmaonana18@gmail.com>
Date: Tue, 29 Sep 2026 17:06:41 -0600
Message-ID: <87pkxvwtby.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com> writes:

> kernel-doc fails to parse struct declarations wrapped in
> context_lock_struct(), e.g. struct debugfs_cancellation:
>
>   include/linux/debugfs.h:245 ... error: Cannot parse struct or union!
>
> Add a struct transform that expands context_lock_struct() to a plain
> struct declaration, and apply the struct transforms to the whole
> declaration before split_struct_proto(), matching what dump_var() and
> dump_function() already do for their prototypes. The member-only
> transform in dump_struct() is then redundant.
>
> Add a regression test for the debugfs_cancellation declaration.
>
> Fixes: 6e530e2e3119 ("debugfs: Make debugfs_cancellation a context lock struct")
> Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
> ---
>  tools/lib/python/kdoc/kdoc_parser.py  | 11 +++++++----
>  tools/lib/python/kdoc/xforms_lists.py |  1 +
>  tools/unittests/test_kdoc_parser.py   | 26 ++++++++++++++++++++++++++
>  3 files changed, 34 insertions(+), 4 deletions(-)

Applied, thanks.

jon
