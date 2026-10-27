Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116158;
	b=lmwWPYrPEBxJCrtPGmm42REDT786M8GfBuAixXzYh/vYCFCMXdJU/7b8jEKazJIWToPM
	 bolhcV1XbsYP7OC5iUH448oW3Y5MDMhvBVfs5SCweI0/p9Diicfw1LOnxOHkFhdk1gwp0
	 MWqy/I2YCjLN4oLU3iqpD+07Gw5azHNlJUNNAeiFquqwuiQ3mEFu4C4njc/+rFvd15rkL
	 AsNwI1aEMM+lWEuz3QQETTZKcqeKkUd6Zot4tRXQdCxzw3CLEmBrDuSRX1pvOUJzRgkUi
	 yGE+LQXM8WnGEiZleUvSd4PMXS+OcyY0CDjM6n5NjC6lvQd0NE+0/JZlHnaeDOLhUAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116158;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=8E+YTB/kTWap1mlHgdmrlX2wOTHM6KWQtaYBVxbtz5w=;
	b=r3VGs1sTh0rz8UoH+ZxZufydwl0Gwe6PIHGY1l0U4GwgwGGk205kFV0b3xz4ysk74Jcu
	 ARjQynbKBR/mUEh96+N1ab/HMHFlBMcRznDOtGQtHYQMnpEldL+El3yysRvRVrMOL2zN5
	 RKvkMZzEM2VMm9ApJFOGi9ekCr6yJbBGTgsMQ1tRnhT07gnyOBhIn7hDXIvmnN1Xvobdq
	 W6Hy8mdU5bm/528KTOGJqJvcLTzxJG7beAxjcJARpBfse35KGOvaBINjJ1dfE9BsMKkl3
	 +obpP2UVK9flsxjyq3qQ8Ja89/ZA1z9yJ7cvC7xooem4X/ta2UmNYH7rBGRVmq/YXrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=Y8fzhI03;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCC9606A31B;
	Tue, 27 Oct 2026 15:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DCC9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=Y8fzhI03
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CDDB540920
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1793116151; bh=8E+YTB/kTWap1mlHgdmrlX2wOTHM6KWQtaYBVxbtz5w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Y8fzhI03Qz/eFx8j1Qcd0FMlws12HqQmkq2phUQlapZzA01fGUA8hqpUduNoi1Vhy
	 y664kDEmGKDjqUbdBS9LtlAfde2QJPmDjBcuxwIIdmpzFqBCHyvnpHEVwkafM8VyhO
	 PusIRFppQqm68m7Ou6LT+5w9DO9PmfxOjWXDMzPpNpCs+hhJIV7XTIX/AIg3kRXWO+
	 E51Ya0Y6v50E2D7qRjVcAIWfd9/3j6Qa+vmDTH1e64kKakN5IYowl55Rx8d27Ko2CY
	 +sf8Z5deuZ5gnR96n/BbI7JaiMx1o7jdLR2YK6PaItjF1P+mMLVZBa9911jNFZc4P4
	 Qx52XulaD0J7A==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id CDDB540920;
	Tue, 27 Oct 2026 15:49:10 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Alex Shi <alexs@kernel.org>, Yanteng Si
 <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, Chen-Yu Yeh
 <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>, Federico Vaga
 <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>, Carlos
 Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik <avadhut.naik@amd.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] docs: doc-guide: add a guide for translators
In-Reply-To: <20261015125644.12908-2-danielmaraboo@gmail.com>
References: <20261015125644.12908-1-danielmaraboo@gmail.com>
 <20261015125644.12908-2-danielmaraboo@gmail.com>
Date: Tue, 27 Oct 2026 09:49:10 -0600
Message-ID: <87pkwvrvnt.fsf@trenco.lwn.net>
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

Daniel Pereira <danielmaraboo@gmail.com> writes:

> The documentation has seven translations, but nothing in the English
> documentation explains how to contribute to them.  The only guide that
> exists, Documentation/translations/zh_CN/how-to.rst, is written in
> Chinese and covers the zh_CN translation only.
>
> As a result, the same problems come up over and over in the review of
> translation patches: labels and citations copied from the original,
> which are global in Sphinx and collide with the English ones; partial
> builds with SPHINXDIRS that hide those collisions; lines over 80
> columns; translations not added to any toctree; missing commit
> descriptions, tags separated by blank lines, HTML email rejected by the
> lists, and the documentation maintainer left out of the recipients.
>
> Add Documentation/doc-guide/translations.rst, a guide that covers the
> whole workflow of a translation:

So I finally managed to read through this ... sorry for taking so long.
Thanks for putting this together, I think it will be useful.

I don't have a lot of comments beyond what others have particularly
said.  I would definitely echo Federico's suggestion about not
duplicating the material found in the other process documents.  Length
and verbosity makes documents less approachable, so anything you can do
to make this one more concise will help.  I'd just tell people to read
and understand the relevant process documents.

One little thing I might add: anybody who spends time with our
documentation will surely find things that can be improved in the
original as well.  I'd encourage all translators to send fixes to the
English versions when they find these things; that will make it better
for everybody.

Thanks,

jon
