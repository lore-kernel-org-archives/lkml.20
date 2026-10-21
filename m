Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792543604;
	b=U/TEbuCxNCQcevM2scRvHU+UAW11/61R3GN05MeX77F27GftKMxcd6kzPsMKh0yGaZpK
	 gykdMr1tlaOFepGln77ml8UaGQQpzBRKedeXRh2CFXKRUnARiUbnK+HwhZHdjO5CJ/Npe
	 zOSlDFzG4c0oqCbDTq1Xf8m0fYIJEW4bk9tAetOdtPTYOroG+ICb2Yp/EidIoibkoYMvL
	 KJy0ER2dCWcKXehC0OxRhKe2hhbLBVxYxCk4RQ5IAYGntUDUd0MTIe8zsI5PB3SUKJS0R
	 oiaWmzHOENfctn91QYSwp5RPtikDc8NJGZv6cXTdVavQHB3Cdv905ggIM+siqZw/Hfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792543604;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=cYpHHOHNHq5tzuXPfB7XouT8ae+NpXW8E3LZxG9wwtA=;
	b=V9+Ckokzm60qS7+JG5t107z6DjjLjCC655g/Df9H6HGxaz6GSIqROKfzhFGkm7QYwlrn
	 sZNh6rzdNxJbzMYosI4VkMSP8H7u4Ywtp4Ym4TnQ6g8yaqzIsxEwCCrUdJ2em4Jm/e+RG
	 2lZPTxjhGzsLboqPpCApHdHHFZXBeKQghFXtLp7Kfef4bBIo1gchk/AkOrPpDsstVIQdP
	 ME5o5Nt3mYEfvDGwt3RMANZq97Q1iSycd1DhQrH4SdyKOTapEZ0TZjhqaBQTzG4MkcuWJ
	 48/aV6ZpkLrIi2+YcQlsuuoYwdDXEMRuY5m4aQF20jKOud5XW/1zOJgQwfLvF4/bPnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=vWWnqBmk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEAC606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=vWWnqBmk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 621D31F000C9;
	Wed, 21 Oct 2026 00:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1792543603;
	bh=cYpHHOHNHq5tzuXPfB7XouT8ae+NpXW8E3LZxG9wwtA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=vWWnqBmkjzGkxuzqf7s9WbmPmVzrHdxinjflYQXw2wmdEzh8SFTR/DoCh7lI40vJb
	 ZBFN7qloXI3Sp5ULMNIjrEGPG6aKfu2ZvKcU3iwe1NtygT3o6gXjfdMTfCsVRyMsy+
	 q2bJH+OhgG4BW2pirFH3LoyB9umfYfhSzeEwV9VA=
Date: Tue, 20 Oct 2026 17:46:43 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Bradley Morgan <brads@mainlining.org>
Cc: Avi Weiss <thnkslprpt@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] profiling: fix sampling step on 64-bit big-endian
 systems
Message-Id: <20261020174643.41ce3b98434d0791af79cda7@linux-foundation.org>
In-Reply-To: <FBD0DC2E-B6C0-400A-A2C2-BA8BA127E43E@mainlining.org>
References: <20261020101225.917959-1-thnkslprpt@gmail.com>
	<E2C67135-E62C-4E68-9087-4E3CE47E5A4D@mainlining.org>
	<CAKOB7-YhfVyoo95LtfOSkJTVxgjOA0bxPBndca5L+9M9MXTSHw@mail.gmail.com>
	<FBD0DC2E-B6C0-400A-A2C2-BA8BA127E43E@mainlining.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 Oct 2026 17:50:24 +0100 Bradley Morgan <brads@mainlining.org> wrote:

> On 20 October 2026 17:47:22 BST, Avi Weiss <thnkslprpt@gmail.com> wrote:
> >I'm happy to try it anyway - just so I know how for future patches.
> >I'll see how many I can run through before my laptop gives up ;-)
> 
> sometimes the crux is for these kinds of patches something in some cryptic
> arch gets messed up in vmlinux stage, odd right?
> 
> This *makes sense* for me, off the top of my head and thinking hard id say
> this *shouldn't* do anything bad to a cryptic architecture, but I've been
> shocked in the past.

OK, read_profile() makes me question my career choices.

It starts out with totally inappropriate type choices then bandaids
over that by typecasting just about every damn thing in there.  None of
it is commented, natch.

I'll grab Avi's fix for this merge window.  I persuaded the
coin-operated coding machine to generate a couple of patches to fix a
pre-existing thing and to clean up that code.  I'll send them
separately so Sashiko takes a look.  Please review.
