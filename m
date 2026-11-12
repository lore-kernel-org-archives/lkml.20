Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495708;
	b=OhyPz10AwE1Gwsd0Xd2vi+SGbElv5ffpaEaCH0mrB/7X+KqxDj/BmUvUnXsmutUOO/95
	 s5i0CQOt3zRq5z88F5CSoTLgjFH2Of4cHiZ4Mzk4BbQxnkUe5lZjBEA88xWK/4A/mzZ9h
	 ltIrAY90QyUC9wU/byGg7mk902KSXKB+LB2H65mp38Ifeqj37EHWET1M1p8r39CrtKdIt
	 GWYfQ2m6DRzz6JdnY3QpAjKet42MeQs0rFh62O0gqw16WQsViWz+8qQnueaKP4LSff/Ed
	 5enX/MtxcB63enkFf4HVnSm4V1RV3fbPk04pk/GZ4yHnhpeNlPikoxwLRMK04be0AnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495708;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=mpXlpjdkWY46x6nl2lgddCsBWNhG/QtyR/nSFtAJaS8=;
	b=xm8j/oh0wv5F/5D17wEdrmh0aKzKFrCi0i1OG2+8hANUErPCySmetdg/DqZXLwEoiKiq
	 yh8T1Fih5b+0cHAjHlwkU+HdJe+JzsVo4HaborfmgG35zvbE8Q7qByz7Jn1UUc8j5CCKt
	 jBF5PZoSe/goLamSayoZ8rTtiXNDLzv8YyVtbJrlsUQZ160iitj+gWs64O6fuQxgEsblf
	 73LHS/Up9xubXFLOLMxekmT+GYU0LpTF5pLCo4L8fch4uUn12nvQnkh/U5rPyukk/jRjI
	 N12q7b2T/UiR0LJExMILXC/A0QmfuaIyekPKn7LNmdUxADmCtJ/E8fyXs12NWteJjPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=DJbmiuP+;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88962606A321;
	Thu, 12 Nov 2026 15:01:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88962606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=DJbmiuP+
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 40B5A40904
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1794495707; bh=mpXlpjdkWY46x6nl2lgddCsBWNhG/QtyR/nSFtAJaS8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DJbmiuP+vyLzDQqWzlybH0zs83ocLR2kXe9XKBAZgnhm+CKOba/3u0e3mHeD+KibI
	 2bqFHDRNU/FO5P3FrJb8yOMTAEe0dR8BMFYcBeXsBCF/oyvUJiQ5kIskw+RnGSvLhL
	 cxOIyawAYLy+kFZ6nMfhit0nrmuPEpcMuQiUtKqqddCPXK+t3+itMUJAGFic2NTKZf
	 gJ86wEreaox2E2iYxp33ngbRYA3wKgeMj8wIibK8BRk3crzfDWg9wDrSyXQtnXjFRF
	 WVSkDSWs8uLuP+qFFmaF1gwYGyuw8H3fxUvHAq+M4zBvK4TJ24jjgZRjTSpeW8/uo7
	 wwoclZbsl784g==
Received: from localhost (unknown [151.38.237.230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 40B5A40904;
	Thu, 12 Nov 2026 15:01:46 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Wei Lixiang <weilixiang@kylinos.cn>, Miklos Szeredi <miklos@szeredi.hu>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, fuse-devel@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: fuse: fix spelling of 'successfully'
In-Reply-To: <20261102093827.6-1-weilixiang@kylinos.cn>
References: <20261102093827.6-1-weilixiang@kylinos.cn>
Date: Thu, 12 Nov 2026 08:01:43 -0700
Message-ID: <87v7625c14.fsf@trenco.lwn.net>
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

Wei Lixiang <weilixiang@kylinos.cn> writes:

> Fix two misspellings of 'successfully' in the FUSE dentry cache
> documentation. No functional change.
>
> Signed-off-by: Wei Lixiang <weilixiang@kylinos.cn>
> ---
>  Documentation/filesystems/fuse/fuse-caches.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/filesystems/fuse/fuse-caches.rst b/Documentation/filesystems/fuse/fuse-caches.rst
> index 0778dd3d357f..de1a452fdd31 100644
> --- a/Documentation/filesystems/fuse/fuse-caches.rst
> +++ b/Documentation/filesystems/fuse/fuse-caches.rst
> @@ -156,8 +156,8 @@ in several occasions:
>  
>  - When a new file system object is created (e.g. ``FUSE_CREATE``,
>    ``FUSE_MKDIR``, etc).
> -- When a lookup is sucessfully performed.
> -- When a dentry is sucessfully revalidated (``->d_revalidate()``).
> +- When a lookup is successfully performed.
> +- When a dentry is successfully revalidated (``->d_revalidate()``).
>  

Applied, thanks.

jon
