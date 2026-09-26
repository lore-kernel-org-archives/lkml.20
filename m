Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90381FBEA8;
	Sat, 26 Sep 2026 15:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790437001; cv=none; b=hhme7xyeAFPy5d9xPMT3Jg3ZhV8R1jIs93l+KshkhUrZhCwbEKmU7qXOx8TASiBozRcno/6oxFNjrpxBMP9k5xI+PA9HMF2DScgji+YL9GJrE/gsyxMoeAAI14jO7aPMqwSoqm7xNYx+J4JNYRd92rr+Wh+FSnNOUHrdXi7KTA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790437001; c=relaxed/simple;
	bh=MdfRb/XQfyut12BQkspgxcFj7McbrfGVxpL8Zz5feag=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QkbApHwZlJAXK9kfaHybqmvuaFHZuP2iHzaRQd3uKzyg2gW92miVoXlZWREICw5ochx2dzfoh1ljJjmR3m6KGJwYHZqSxGu+R4/unKDdUAWgETA96PNNWdMlCklRAkQbgF9cV8kln/H2CXCRc2yymX1hr3sHKkcScOTQspawXqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=LwrNY8AR; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="LwrNY8AR"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E2565408B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1790437000; bh=QLvEJSAHKEc/625O6eygaOHDJiv4i1BXgFarFQcqE2E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LwrNY8ARrW+oQ+91gik+zDA/pibFI/oFJMx2GtFNXconiBjwJzFRhHhs4kGoOlQDU
	 fYSUI3syvPoSFjxo+BTdHc1Gb7WVKLXAMX3KmD4Fql+2ifR+aMAsTUlFLHcvOuGt17
	 jDi/QRbsO/63aufjK4lH2AelXzrgRVB9YuXb7IFYsnJEUCNb/SGH43L06t1W5OxGJh
	 ItYTd7rCWRl5c3RQgvLkuOan8SKCociTF/qwnv4bWXpsPMxh6Obb+iQ3ZgNKzSkiZu
	 5ZzZBpt7XW9BQpxdn8sETbMl56arsc2SCeDs+gi67kjwzrIl6v0U8/JCrxg/I6I4JL
	 Umxxnpzn9eJjQ==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E2565408B3;
	Sat, 26 Sep 2026 15:36:39 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Lucas Adryell Ramalho <lucasadramalho@gmail.com>, Daniel Pereira
 <danielmaraboo@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lucas Adryell Ramalho
 <lucasadramalho@gmail.com>
Subject: Re: [PATCH] docs: translations: pt_BR: add debugging index
In-Reply-To: <20260918042835.156030-1-lucasadramalho@gmail.com>
References: <20260918042835.156030-1-lucasadramalho@gmail.com>
Date: Sat, 26 Sep 2026 09:36:39 -0600
Message-ID: <877bk83tyw.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Lucas Adryell Ramalho <lucasadramalho@gmail.com> writes:

> Add a Brazilian Portuguese index for process/debugging, mirroring the
> section layout of the original. No debugging documents have been
> translated yet, so every entry is listed under a Todolist marker
> instead of a toctree.
>
> Signed-off-by: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
> ---
>  .../pt_BR/process/debugging/index.rst         | 73 +++++++++++++++++++
>  .../translations/pt_BR/process/index.rst      |  1 +
>  2 files changed, 74 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/debugging/index.rst

Applied, thanks.

jon
