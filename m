Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B53E44AB81;
	Tue, 15 Sep 2026 19:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789501040; cv=none; b=tPZk2IspG92vssqbjOif2MdhCPZqd9RlEbUqG+Nm1Y23NwFYp2eLi9xn3M6fYL5lQQYVWj3mHbEgSRkaHRrZhsvNls95r40d+kDXsKjDkmm6YzPTrnWgEZBDgqjC9QEVnDF+cr2EeWWWsQ8xxeeD0n4lE7l2Gb6NXUkYC+qossI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789501040; c=relaxed/simple;
	bh=/zS2E4DbP6ytnjyakX6GxndaMsVS2D/+Wc9ZjtPH7U0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UZ64hjzpjg9onD+xt9exN350Wxd2+bCWWKlMxzpucl27qv+yMhi9/gIuwmSFhPUmcTk9nl647IA3vUruEJiN/6Qeiw/mQfdMj42A0NB+z1hzdNHD8ApD732d37Ask0aYH3uKk7Dxg28cbGBInINK00gS+5qFKc6JERMYzCp7lLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Nsdy0ngz; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Nsdy0ngz"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 158CE408B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1789501036; bh=inm8Ih+/T2kfBW/aDAbkP84VqD0uHU+f+HG+z2efPXk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Nsdy0ngzhuqr8F7WM33MCjGS8Nmb0Br6maICdRGe8yjkNN5dYNBxtNdO8bEu26dvE
	 LJzH0ak/V+Lhl7b3BdrZpP2yKaSpwaU6G0XZfmbwLvN8r0Un4KAQOLKOyfvnX5xIYd
	 nBkoEFLaae0jktygf/Ha83cBofa7pvyK8y+TCB/y3NxuRrKcAsG5oGxOis5FKw+W4o
	 fQD1jmt5PxNwlZAwOPtPf+YxL1JTlNJCgBW77F9k/Jl8v2aLhOiL6B9z2EONVLWVVO
	 FkwXrOGSB+byrPU8N2tF57HXvNmDsajfyHExrtun8cfO4Ow2woPLblzsrt/+BhYGph
	 TtCWZP8M9SqOg==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 158CE408B4;
	Tue, 15 Sep 2026 19:37:16 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Karl Mehltretter <kmehltretter@gmail.com>, Kees Cook <kees@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, James
 Morris <jamorris@linux.microsoft.com>, Ke Wu <mikewu@google.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] loadpin: Fix stale KEXEC_VERIFY_SIG reference in
 documentation
In-Reply-To: <20260905013655.58665-1-kmehltretter@gmail.com>
References: <20260905013655.58665-1-kmehltretter@gmail.com>
Date: Tue, 15 Sep 2026 13:37:14 -0600
Message-ID: <87v78671cl.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Karl Mehltretter <kmehltretter@gmail.com> writes:

> Commit 99d5cadfde2b ("kexec_file: split KEXEC_VERIFY_SIG into KEXEC_SIG
> and KEXEC_SIG_FORCE") removed CONFIG_KEXEC_VERIFY_SIG but left the
> LoadPin documentation pointing at it. Refer to CONFIG_KEXEC_SIG instead.
>
> While at it, clean up the grammar of the sentence.
>
> Fixes: 99d5cadfde2b ("kexec_file: split KEXEC_VERIFY_SIG into KEXEC_SIG and KEXEC_SIG_FORCE")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  Documentation/admin-guide/LSM/LoadPin.rst | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Applied, thanks.

jon
