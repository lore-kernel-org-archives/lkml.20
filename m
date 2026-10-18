Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F926455631
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 20:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792357193; cv=none; b=jJjxE/n9q6b+X4U+ki7L83Z8qq1uD1sDo12bUDzjt9Bu79NCBIlk6AVfvvEONDScu1XlL/sVGxceaffYUhQn+2SHA0imcqOPZtk5cfQMEKmRplNUSw/AtBGXsiXseJZB3UUfGMSvC1jtSTN1eXDzdLu79pHcTxt7VyPaZ567plE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792357193; c=relaxed/simple;
	bh=MvyK1q7uj4KeMXQ2Xck1ZbR6WJmUBYJje6x78tcnJw8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IkGYFX0hgrretkTmWhaFz3dvw2Jl7vkWjVG8WpSVdsE65a+kBIjZvthvLCq3IF6peuDm4RtJrxE5/1IqK38vvZV/4kc9I5OKx7zqfB9bqZHfLorsmULboQR8ecI+UABoeQynOaJ5QcjwsKGh47NEKtPtyZ9M/DrmHtQt80I1Kzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=pxU3odpO; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="pxU3odpO"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6FAAD40904
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1792357184; bh=X8ptQtNfVac8yIjQ6h9qgXzEHJsN+ucb5FpTFrg51RE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pxU3odpOssZjdDjiKP/cdbiQTjxMq/eVCe/kcZpVQQAAIVVKEJ/cEtT+quQVt3QXe
	 0sQ3uqAcPdjnAj5A6dMmSMY0aSUQF7knwMOmc4uFDAy9LaSASeiuTnBA//YOcipSwM
	 YwHMzQ5UZ/8JaeJZaj98IwFkfo5uGtVHaE7JduvTFGbvUVJDviKY6UhejiyNDaDbWL
	 dtFCpUmeiHuSy9zjaEBVG8v9LllY6fnyN1DsOIeyz39K+IdU9RdZ4AlskpCkVjWbfJ
	 DLNhHE9bOn2rtQxamqnMNKfm04VLZOBcpTD4gCgYxNBc/ZEIQI3c3o9BYmQp2NsOIO
	 1w0dDyckzU06w==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6FAAD40904;
	Sun, 18 Oct 2026 20:59:44 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Breno Rodrigues Alves <breno3011alves@gmail.com>,
 linux-kernel@vger.kernel.org
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn
 <lukas.bulwahn@gmail.com>, Breno Rodrigues Alves
 <breno3011alves@gmail.com>
Subject: Re: [RFC PATCH 0/7] scripts: convert seven more Perl utilities to
 Python
In-Reply-To: <20261018110638.9947-1-breno3011alves@gmail.com>
References: <20261018110638.9947-1-breno3011alves@gmail.com>
Date: Sun, 18 Oct 2026 14:59:43 -0600
Message-ID: <87fqy2afnk.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Breno Rodrigues Alves <breno3011alves@gmail.com> writes:

> This series converts seven more Perl utilities in scripts/ to
> Python 3, following the checkpatch.py + bootgraph.py +
> checkincludes.py + markup_oops.py + profile2linkerlist.py
> series already submitted.
>
> Each conversion is a faithful 1:1 port: same CLI, same output,
> same behavior. All use only the Python standard library.
>
> The seven scripts are:
>   - checkdeclares.pl          -> checkdeclares.py
>   - checkversion.pl           -> checkversion.py
>   - extract_xc3028.pl         -> extract_xc3028.py
>   - generate_initcall_order.pl -> generate_initcall_order.py
>   - get_maintainer.pl         -> get_maintainer.py
>   - leaking_addresses.pl      -> leaking_addresses.py
>   - recordmcount.pl           -> recordmcount.py

So an important part of describing any change is *why* you are doing it.
Why are you doing all of these conversions?  Some of these scripts have
not seen changes in decades and are likely unused; why do we want to
mess with them now?

jon
