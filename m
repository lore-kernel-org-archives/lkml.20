Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5C54EB865;
	Wed, 14 Oct 2026 17:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791997721; cv=none; b=LYjvxqNdiOYtFcmbUWebI806gsdSZKbTiPo/EpJ202DqFcwHsA0LtxPyuygg6skE97dLrSlLF8kb3ySn3Q9V0Ef7zc89SE3ROgGYTP9FPID14+Vm2o/GN4wKXw1HvIx9CsE2+zTLv9CFqQE2iUuU7YT1VL7kT8WeNufAIwwpg0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791997721; c=relaxed/simple;
	bh=J1kARglvkj0vjRqxJvO8MQkLfD1DplreU5/mETaG8O4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KclxGqvmRtYCbRlVt8bJKS6brvlmdDoBDlVdzQc+QbGDBbUEVfDbZTeu0zcpHWCgpUc0ifgRAJVmxzQNWbCiiBDZVW+iX7+X2f9y4LYb1wpy2Vgu6k1RQm+zk4Jfx1mF6bGIvr5dOVUzubCHzkAop7iE+pTgnOHDTZ+yBVbcBGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=bi1Lp/sN; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="bi1Lp/sN"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E74F1408FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1791997720; bh=yo88Zs01CTIx7NJlXoOPkXmTWmZWmCqeNydaGzIv6T0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bi1Lp/sNzr6yUdPPnkx2O7oakapm+70gu4yoRiowVMDx1MjWUC2rEGZC4zpEB5NlX
	 fe/dx9pZvlNK9D8ZY+THZ3D0cEpG32NhyUPsTA9zBqWR0D6BzfzHVWOwzqUx/6nfIZ
	 jkEtCRHtV00SHKz27VWDs+y5o2ZdqUoBVzJ+MuQHtlnKaPORRBrtv0qsBtYxeFVLnq
	 873RvMcOMMiHKt3ZZaT+0c88MjOv/bhUqW3lsi6MwsKsBV9nfRkIV3Ho0GsjXrrXW+
	 IJkdF4QftbSiAKpHkDCa1OFWgszWr9u7aRaRi8ZABskBfr4Me4v8djNnQydOR2bN5s
	 7TEGLXa+BJs7A==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E74F1408FF;
	Wed, 14 Oct 2026 17:08:39 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Jakub Kicinski <kuba@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] docs: kerneldoc.py: preserve headings in kernel-doc
 output
In-Reply-To: <20261002230114.39651-1-kmehltretter@gmail.com>
References: <20261002230114.39651-1-kmehltretter@gmail.com>
Date: Wed, 14 Oct 2026 11:08:39 -0600
Message-ID: <8733u8w6p4.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Karl Mehltretter <kmehltretter@gmail.com> writes:

> kerneldoc.py parses extracted ReST into a detached section node while
> retaining the surrounding title hierarchy. Docutils 0.21.2 silently drops
> affected sections; 0.22.4 reports:
>
>   Documentation/networking/kapi:107:
>   ../include/net/net_shaper.h:75:
>   ERROR: A level 3 section cannot be used here.
>
> The same issue drops three Xe DRM RAS headings already in mainline.
>
> Use nested_parse_with_titles() to give kernel-doc output an independent
> title hierarchy.
>
> Fixes: 2404dad1f67f ("doc: Cope with the deprecation of AutoReporter")
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> Reposted as a standalone documentation patch at Jakub's suggestion:
> https://lore.kernel.org/r/20260925120152.09ef180c@kernel.org/
>
> Changes since v2:
> - Route the patch to the documentation maintainers without a net-next tag.
> - Add Randy's Acked-by and Tested-by tags. No code changes.

Which versions of Sphinx and docutils have you tested this with?  I
needs to work across the full range of supported versions...

Thanks,

jon
