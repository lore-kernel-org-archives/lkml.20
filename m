Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DC535CB60;
	Tue, 15 Sep 2026 19:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789498966; cv=none; b=GKhMPyGWcpcW4zJJUIN25ujdZfeRz8MmbFBahn0qbov6YhIImYihw6J+4VRei4341xRoWClKo/6aDJpwCnbtF9c17UswrQSYV64fCVsUaEQaaWJKW3xoNRe1OS7QBJzgACvHlY3WpzRZrgPDLG01tPpP4qJYCFztop1xUbuniX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789498966; c=relaxed/simple;
	bh=UErGy8QY9YoTQZwu8G3b3nLpBu4dzUs+0u1RoUBQoMg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ihOfbIEuFd2XsGaxbgMwljTDrKhV2PK4P5d98lrhn0yhIwgz+GXgfsOHPc1DgPrSalUnTHVlrbbAgzjwcUnySQeDAG1mZVCVBQdup9M+1Nwxv8LEjWzF/ZXTYTaIsWXJ6PZzYzX9pvyIun9T+Q9s3ptBcgiJpOpeOVRO8ZoqR/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=shOIqcOV; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="shOIqcOV"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6B61B408B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1789498964; bh=L4cu8MZpg1QvvPqbIniZ75rewCDhaAbj1PE3JzMPAzU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=shOIqcOVX4v0P/ro0Y4Q9OmnF+DCFCv3PuBs9XTxlNWvvgBWUTiECBMgjDqBxlgJg
	 VsUO1HOL2S3F36KkXvrPn5qK4zi0mUh2MmKwBQemZbKSHM1Qg77xAQ7mLXurHjG2Nl
	 lQQLsiLGrUslx0Q4AvoxojGgZsBbtnBmYF1I9aCPygZbUi6dfTy8hQ7Haw6ljoSOlT
	 ig6j0FMPa6j+iRxKuNV1yTsFbfWzXkIq1Glz9zN6pKNBKUOR2kbf8yyW+bwD371fxj
	 PiOvdnsd9JquA83ei1unU9SrvWJFlx+P/qvsq+jjsT6n85sWgEcCsizDvOu9jT0Ij9
	 GjsmGbLAnAvig==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6B61B408B4;
	Tue, 15 Sep 2026 19:02:44 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: kernel-doc: inform that '@' applies to other fields
In-Reply-To: <20260911184213.4143776-1-rdunlap@infradead.org>
References: <20260911184213.4143776-1-rdunlap@infradead.org>
Date: Tue, 15 Sep 2026 13:02:43 -0600
Message-ID: <87a4pi9w30.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> The '@' sign applies to struct members, union members, and enum
> values as well as function parameters. Document that.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-doc@vger.kernel.org
>
>  Documentation/doc-guide/kernel-doc.rst |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> --- linux-next-20260911.orig/Documentation/doc-guide/kernel-doc.rst
> +++ linux-next-20260911/Documentation/doc-guide/kernel-doc.rst
> @@ -422,7 +422,8 @@ Domain`_ references.
>    Function reference.
>  
>  ``@parameter``
> -  Name of a function parameter. (No cross-referencing, just formatting.)
> +  Name of a function parameter, struct member, union member, or
> +  enum value. (No cross-referencing, just formatting.)

Applied, thanks.

jon
