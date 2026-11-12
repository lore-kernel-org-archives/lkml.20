Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495782;
	b=40O8+B0I91KZRwd2SjgEXsrWUZ+O2VvV6ZtKW4+xlaFCTjCxzx2idOb3hOoDgDm+LAPL
	 D/V698osLvEqFuT4CiUFjwXF9TnTrfBSsMHgClaoVUkzdrKpIBmCP3GDiIWYgHSOCqeiP
	 N2kEK2QtoeNbQtwcUc9aN01LwmKGRUerzPUTuJ9dmoW9VhTSLrtJofzbUUCbnQTBKjamA
	 16cLf8w9SWkTBNZmr2NT8HH6OKFOFCk6JG6NQuxvRRqKPHGIjgB/zQKHuWYGALRoK7nju
	 /3q6iK7aswfkWn96cmn2C0eJ7gXpRkFXpOx7iS3J8M/V5bGTpFUqrX+/z0nX4cwUHyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495782;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=UTq3Ug+A1WyzxOJ6gjEEmCWETAT3P103xDAvVf4D39g=;
	b=JE3l+BGaJgXsylzJBCzVCCbauf9zkVdzSBKnOy+tUIYzje+oah5s06NLsBJc+PmMlJKy
	 i86ToFLdZ9PJGkJ8L0sk4xfVacDpN5j4FihJIhOqrjc/CB8qQ7C9gwP6/Gw424uZFY7nP
	 nYh3tQu0gjygAtaZw0CUxRkWJHohjWzRVJ7Eojvm56dCyuxder3MjzZQwTNT8gCikJZI0
	 cmED3LHDhAkJn9FwP9+jN7L2dUXU3s0eQmmFWqN+F1JS4gR3Hm4nr3BvbAB2rC8KOUMgA
	 OZTzyPa3LW7BWPipv5DkjRuoMHGntD0uPNam7okOPwvN4T9y554uoW8T+co7c8rS3Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=iBzGQls3;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC06606A8A5;
	Thu, 12 Nov 2026 15:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EC06606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=iBzGQls3
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 58C1840904
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1794495781; bh=UTq3Ug+A1WyzxOJ6gjEEmCWETAT3P103xDAvVf4D39g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iBzGQls351RHtoDHfevR/pPFRLuU/15FbX60AHpT7fZajFLudiCSaIojIwVt2c18Q
	 GtCp7UFvmkkjf9j5Opnq7Fp5Y0/FbkHH4KgrCYWB/+LORi8bldF0WTOuxtZNQMgbqe
	 QTtp3tJNnR8dEWvMBBWVSHY+TXsbH0A9SWAAHRcAzEpPJaOYlPWKSjxrB4SMChJjUw
	 Wkp+7WOczGllto0kGf4L5vQuIfpzaPIB9VY0vqGA6DFtXv+5YHJMXsaJoeCe8tFt/8
	 bvpPVbN1NAzCtosuXsvozMdPjWI5WZVbKfZAy+icBgEyPkLRZIvitv+ZszC1tY1Qst
	 rGgB7vT5q+E3A==
Received: from localhost (unknown [151.38.237.230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 58C1840904;
	Thu, 12 Nov 2026 15:03:00 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Dongliang Mu <dzm91@hust.edu.cn>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dongliang Mu <dzm91@hust.edu.cn>
Subject: Re: [PATCH v2 0/2] docs: Update Sphinx dependency checker
In-Reply-To: <cover.1793375024.git.dzm91@hust.edu.cn>
References: <cover.1793375024.git.dzm91@hust.edu.cn>
Date: Thu, 12 Nov 2026 08:02:56 -0700
Message-ID: <87qzgq5bz3.fsf@trenco.lwn.net>
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

Dongliang Mu <dzm91@hust.edu.cn> writes:

> Add Deepin to the distributions that receive Debian-style dependency
> installation hints. Correct typos and awkward wording in comments and
> docstrings in the Sphinx dependency checker.
>
> v1->v2:
> - Patch 1: keep the Deepin change unchanged and add Mauro's Reviewed-by.
> - Patch 2: limit the wording fixes to comments and docstrings. Drop the
>   v1 changes to printed messages and command-line help, and add Randy's
>   Acked-by.
>
> Dongliang Mu (2):
>   docs: Recognize Deepin for dependency hints
>   docs: Correct comments in Sphinx dependency checker
>
>  tools/docs/sphinx-pre-install | 53 ++++++++++++++++++-----------------
>  1 file changed, 27 insertions(+), 26 deletions(-)

Applied, thanks.

jon
