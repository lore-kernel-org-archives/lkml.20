Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794536006;
	b=lurNeJWQMAMnmI0Ao6eTCCV4FEYeNOt9SdFtCesEr86YdHTCWw+ZrZ8igMLGSHJR72tV
	 b8OZ/n3iPRFcehf2bobR1xRWxk6tGdAcalhafGTjC0MBHAcpMny8RDEGwMI8GobALH+ZA
	 e2RMNh+As53xXMzhLXj2kOPy4RpkbDmz2KGJIawIJc/1kvqlzeOGY3L/b3jDq3QLz7cl6
	 DwPgoQ7wtzkDP4KD2GngoKWk6LP6cSjZE+hPC6uSanHHOhp7jxhHbS7xXqkLaULckE67O
	 ZWtgXyATsBo3pSrBu7EOjdaRNPbYOBS3ao7NDauskzJZ78IRwXe+18tgAvbeb2ZGjQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794536006;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=XZuZqb2pYvkdbIHSIpmTPZOj0e4f8sdqh9zYBGMsvbc=;
	b=H0ntVqZ/psFg3oRiMFJkueGR+GhPoseKw5kL2/j33LWwL6K5XKDzCF41AF4vXEfdwMw1
	 g5mv9nLelVyYiPgDBvkQcK5qUROgOFMdTkmbYCNg+XkQudYCvnN2OYvxkFEhehNKCVN7R
	 /+l9ctLLAMYGpERwuHKYUDJf4tvp52kvbie3RibVSCXh/If3OkhMp3YsqqQlPfuC/N2nF
	 okVXlX26tiF6H6aOmdvDc1vOEIb4a/gmu5S3nboDTNAQ0aVQ/e+1l/iCL2MnUzA/UOPRR
	 l+C9wNvf37wuxJvp0IQevxw4+viRfRd8ekplrDbLR7RgBXfWWSMwJecxF7AVwzws+ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=TkV6mt9q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF87606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=TkV6mt9q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D97441F000C4;
	Fri, 13 Nov 2026 02:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794536006;
	bh=XZuZqb2pYvkdbIHSIpmTPZOj0e4f8sdqh9zYBGMsvbc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=TkV6mt9q5WOTB0ZjU0cYLtz6lHB/c4o5awrD1fmJ4ckbQp1h76XIUEen6NutffH6p
	 ElwVjfQI9jAdh/hkZWLwjfL6lnkf5DFBHZPLS+/1VRYnvpBUVH4H66F094p6kvZGxO
	 VMROFL2mQzaMb5AxQwQmBZ6loiH/RhZ5E4HJzXQ8=
Date: Thu, 12 Nov 2026 18:13:25 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Akinobu Mita <akinobu.mita@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fault-inject: use a shared initialization helper for
 the random state
Message-Id: <20261112181325.20cab0fae21fc368f0d8e5bf@linux-foundation.org>
In-Reply-To: <20261112144636.840042-1-ekffu200098@gmail.com>
References: <20261112144636.840042-1-ekffu200098@gmail.com>
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

On Thu, 12 Nov 2026 23:46:34 +0900 Sang-Heon Jeon <ekffu200098@gmail.com> wrote:

> fault_rnd_state can be seeded from setup_fault_attr(),
> fault_create_debugfs_attr() and fault_config_init(), and each of them
> uses its own guard. Configuring fault injection in more than one way
> leads to useless reseeding.
> 
> To prevent this, use a shared initialization helper fault_random_init()
> in all three places. So fault_rnd_state is seeded only once per boot.

Thanks, that looks nice.


Generally, fault-injection doesn't see to get used very much, and the
huge number of AI-generated you-messed-up-error-handling reports we're
receiving show the cost of that.

syskaller can use it and those people have shown some
interesting/useful results from its use.

I have a side-project going where I get the LLM to drive patch testing
on a local test machine.  The AI looks at the patches, figures out test
plans then controls their execution.  One of the many things I'm
telling it do is to fault-inject every error path which the patchset(s)
add.  It seems to do this quite well.  So I'm a big user of
fault-injection now.

I'm hoping that I can also make it use kcov: use coverage
instrumentation to verify that all code which the patchset added or
altered has been runtime testing.

But oh my, it's soooooooooo slooooooooooooow.  It does really
impressive testing, but I need to make it run 10x faster :(

