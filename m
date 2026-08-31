Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFFD392C34;
	Mon, 31 Aug 2026 21:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788212765; cv=none; b=Av21uEzB0I1WydvxNHYKfPXUNcazD9KDjpb3ITNNY1CMQm3xQTp1kk0hMJWkjQflViVsCa+Zlbsynk/O7/eFWhd43qMWV5+zkABy4w+eIc2DPu3EsmztAJh+Ckr7mnUJjHphUo/1w53fGhxNi3gFkyFPtUkjzBwsqOACgC4PELU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788212765; c=relaxed/simple;
	bh=5YBZk6+S6cGK32SKRwAHu3YWtc1M5v22W4q3G9pvIVY=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=X+i7FCheohQTj5cCEZjJO0JRy/EOpWWkZdxaHiSp3rpH10wf0a+uyHtJv4ibJ4xIDqBIwJn+4oA+dAlby3yrScmgd/hRrDdW0WBZJb9oXgTvWPdJ6CxJx0bQrK1QklNDAK+6YfQxh95rN6oL1f+1dbZyQUqUx6/bd+w2aKx2y5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Z52H/c91; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Z52H/c91"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9ED65408DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1788212763; bh=EFGqfU9HkeIt9fcjWEdtnOhdwdCof1fhGIvVt3dD1GY=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=Z52H/c91Ib4UMjys/xRwrXd3qeLHRC0zf/KhkeQaiKWpNot068TIzCS5PV07d5Mvo
	 vlmDMyRiuvh7Q4mGkgaPG7bLroa6SFpb+Qdxm6GQ2uJEzYu4YbELkfr+dz5v9SH2+5
	 3r1eMkR0/zix7ZRIu3s3tjry/9JOgkpIJMdSuE+HhUnwBf/p6IAVP+NumASVOfIcuv
	 Os6RuSUPWMvMz5ZErokPIvFVAACfHP+8oP9d4J3AJwQyx5BJEuZMdH+k9sVupDnouR
	 ENUf5WRIJbg2Ql84ALO3YXD6q4J28eMaQJ9VycJ3NwDr1CGmjCroTy/zsOxRAgBup8
	 MIJtoqDOKPkhw==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9ED65408DB;
	Mon, 31 Aug 2026 21:46:03 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Costa Shulyupin <costa.shul@redhat.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] docs: sysctl: timer_migration is for hrtimer only
In-Reply-To: <20260826132921.294142-1-costa.shul@redhat.com>
References: <20260826132921.294142-1-costa.shul@redhat.com>
Date: Mon, 31 Aug 2026 15:46:02 -0600
Message-ID: <87se3uezfp.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Costa Shulyupin <costa.shul@redhat.com> writes:

> Since commit b2cf7507e1864 ("timers: Always queue timers on the local
> CPU") __mod_timer() no longer depends on timers_migration_enabled.  Only
> high-resolution timer migration from isolated to housekeeping CPUs
> depends on it.
>
> Update and clarify the documentation accordingly.
>
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
> ---
>  Documentation/admin-guide/sysctl/kernel.rst | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
> index b6328cd0f43e..fb38d654846d 100644
> --- a/Documentation/admin-guide/sysctl/kernel.rst
> +++ b/Documentation/admin-guide/sysctl/kernel.rst
> @@ -1609,8 +1609,10 @@ If a value outside of this range is written to ``threads-max`` an
>  timer_migration
>  ===============
>  
> -When set to a non-zero value, attempt to migrate timers away from idle cpus to
> -allow them to remain in low power states longer.
> +When set to a non-zero value, attempt to migrate high-resolution timers from
> +nohz isolated (nohz_full) to housekeeping CPUs.
> +See Documentation/admin-guide/cpu-isolation.rst
> +and Documentation/admin-guide/kernel-parameters.rst.

Applied, thanks.

jon
