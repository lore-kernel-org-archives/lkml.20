Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B983F39ED;
	Wed, 14 Oct 2026 17:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791997569; cv=none; b=R87dwzm0MsQU5i6/eZuLyYSpP7uMdeLWGMEypDrY4Zy6c+iN84gy6pWFgNiwIsWtK803kZuNmKfY8nKCdTy/VYyB8jwlHP9ab24qb9Ea/gW7n/EbA29d4CQFJ+t2KAa4YyFy1YB5zvpIdGW9XzcL5lEWiQzxnABdLokIUZjalQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791997569; c=relaxed/simple;
	bh=6FkSRj6yEIibOUR6hEE+uPcOlk3pi7yxTIEuccw3hg8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dIcmPKEtUL6Lx3y4d8vwsG0GkiRsucgpERWF7CEkcjP5w/GNbC6F4eJxUvLMJNbgEcM7Fwhj3Rb+9mt37TSf3ibQg/oI/EYl3kd2dD6u3IoQC32BKbyB4zVoUvGLmXefdezqmL1SOvVerPKoGejRDPbdoNwIFeAjg63siB7giP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=RPSK9/aq; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="RPSK9/aq"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C340E408FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1791997568; bh=V3fKsgG5iY77xmqyrOhYqdFKE1+IVwYgz7kMxEgAwqs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RPSK9/aq9j8Nzg1fd4VMNPFzXRJmtZz24NMq81pTNQ4oD8XhbrfTHksEjTRmVBKB8
	 557XILwzG50Oz8UDOWwkBgeYiHXAan0Q865WIZKmrs9bu964/ODoHWuz4/FlVJjwDJ
	 2UbdSl4UatkM6WiQLAlU+GTucyPcrPwVSTO4QR8X7/fyvS97t/ytnRYjJ9mMT+6wRM
	 8eSEBTp3rhMeEsgr24NrHYxuI351L062M5Qf59IOcRLuRDTwVaN7yKeknzmD2I6AdX
	 C4BLoWEluIyJkFd7HFm58QAtifjQiXw9zq2XWCiFgx4H0rVd47QUV95CMvUh9H5ST5
	 FILQeN/lY1wAA==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C340E408FF;
	Wed, 14 Oct 2026 17:06:07 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, Mike Rapoport
 <rppt@kernel.org>, linux-mm@kvack.org
Subject: Re: [PATCH] docs: kernel-parameters: adjust reserve_mem build option
In-Reply-To: <20261003213457.96408-1-rdunlap@infradead.org>
References: <20261003213457.96408-1-rdunlap@infradead.org>
Date: Wed, 14 Oct 2026 11:06:07 -0600
Message-ID: <877bjkw6tc.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> "[RAM]" means that the command line option is applicable when
> "RAM disk support is enabled." However, the reserve_mem command line
> option is not related to RAM disk support, so modify its build option
> relevance to "[MM]" instead.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-doc@vger.kernel.org
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: linux-mm@kvack.org
>
>  Documentation/admin-guide/kernel-parameters.txt |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- linux-next-20261002.orig/Documentation/admin-guide/kernel-parameters.txt
> +++ linux-next-20261002/Documentation/admin-guide/kernel-parameters.txt
> @@ -6693,7 +6693,7 @@ Kernel parameters
>  			them.  If <base> is less than 0x10000, the region
>  			is assumed to be I/O ports; otherwise it is memory.
>  
> -	reserve_mem=	[RAM]
> +	reserve_mem=	[MM]
>  			Format: nn[KMG]:<align>:<label>
>  			Reserve physical memory and label it with a name that
>  			other subsystems can use to access it. This is typically

Applied, thanks.

jon
