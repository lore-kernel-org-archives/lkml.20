Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957793;
	b=DqSRSE+9z5AS3w85KmDllJ81vOAcRLFLTW3tzIx0WtPF9iElDt+p4G3/dtCbEX1sJXJf
	 87+AGgYrkYvZfsOMtLVdhOtTclytIdpWNK51gknuT+PhWTnkFwj/StO4mrKLw7O7i+zyp
	 I47JIopkm/iA4giuNMitZqdIr1z42lqKAI3FlKHzb4w/zn5a3oucB10Ssb0JJzS2qtmFU
	 NeQ6Me+GjPyjUI/fFYj9GQ4rrm9y+TPs4pTAKElAujmTGiDd0HQhv/LEWgKNHxI+MijDK
	 nGIkM75b7I5HCJdZWGv4dvMyMU+9lyRlmSmUhewnt3Q1uWXmIXEEmMbqgMUZViYmc0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957793;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=PmvkvI8OaAhi+XMObPh4CCXtx59TLJVvB6ntTIHgJIg=;
	b=xroTJzko0eiQtr/SsB5bJpmw3FHNbOrSz+kAx01nP7BY94cWKRBKq5TfkuwVXt+lU/TD
	 AQUcce3mc0ox85l9H/bjFmu4GQSWKTdqBTe3X1MWFBKnYCzNgLtXQ1v8HXC1j/jS1bEjq
	 AQ1nhaiXof4mwN9qBDJmd/4uEFsi3Bep67o07Xinc/SznYqfHqeqSoTETEaqoWfaSI53/
	 AZExaB2JKDEK8ONYNgLbSf7syYGNGePVuU5ZeKffo/oM6hvw59ysAJNN8ulJGoQm0SoWX
	 PA7kTtp3tsWUCyhDWdGRGsQsAcJqSvWmAKqFg10TAikpPsEnNKloG0VlbNyqjM0E/ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b="fIXKV7j/";
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83328606C3C3;
	Fri,  6 Nov 2026 09:36:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83328606C3C3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=fIXKV7j/
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B12534091D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1793957785; bh=PmvkvI8OaAhi+XMObPh4CCXtx59TLJVvB6ntTIHgJIg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fIXKV7j/xKKtO+ITgVrw+QB460e8y/eX5ND7HpJLnuxvEa8E9f6pO9vDy7Q2Uennu
	 YAAqRVZmYMcJXdRdkKxFCftPCersJb/B71KfTG8YPMHcLJ+GOUXmNdSIR5jQiz1iK1
	 qldol3VsIlgAPpIl8hUMPMh0e8vjgjz1TIJcw2yTjftYOW0+y6R82aBo1XGbJjkcsi
	 HJ8cLLvBYKacFofA1MJvFsX7lxTveVSlSF9PnkgSbBg9pqlq5l9YUE+6ym30DjeVkb
	 bJc6uFaQfZ+/pTrKO4TMUbBlf2OYiSCjA8NJ/a8clClJ0sKxJ7DJqrA9PSH2YZbLG2
	 58BV0lI98TZ8A==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B12534091D;
	Fri,  6 Nov 2026 09:36:24 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Oscar Alejandro =?utf-8?Q?S=C3=A1nchez?= Lucero via B4 Relay
 <devnull+aleszlucero.gmail.com@kernel.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Oscar Alejandro =?utf-8?Q?S=C3=A1nchez?=
 Lucero
 <aleszlucero@gmail.com>
Subject: Re: [PATCH v5] doc: process: clarify scope of applying-patches as
 legacy reference
In-Reply-To: <20261105-doc-patch-fix-v5-1-0658a9e3e235@gmail.com>
References: <20261105-doc-patch-fix-v5-1-0658a9e3e235@gmail.com>
Date: Fri, 06 Nov 2026 02:36:21 -0700
Message-ID: <87cxsi9u96.fsf@trenco.lwn.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Oscar Alejandro S=C3=A1nchez Lucero via B4 Relay
<devnull+aleszlucero.gmail.com@kernel.org> writes:

> From: Oscar Alejandro S=C3=A1nchez Lucero <aleszlucero@gmail.com>
>
> The applying-patches.rst document describes the manual manipulation of
> source trees using the traditional 'patch' and 'diff' utilities. While
> technically accurate for non-Git or constrained environments, it can
> create friction for new contributors seeking the primary Git-based
> workflows.
>
> Update the opening note to explicitly state that this document serves
> as a reference for legacy or constrained workflows. Provide a direct
> cross-reference to howto.rst to steer contributors toward the standard
> Git infrastructure.
>
> Signed-off-by: Oscar Alejandro S=C3=A1nchez Lucero <aleszlucero@gmail.com>
> ---
> Update the applying-patches.rst document to clarify that it serves as a
> reference for legacy or constrained workflows where Git infrastructure
> is unavailable, redirecting new contributors to standard Git-based tools.
> ---
> Changes in v5:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.
> - Link to v4: https://lore.kernel.org/r/20261105-doc-patch-fix-v4-1-3eb49=
e363f64@gmail.com

Please slow down - two revisions one minute apart really makes no sense
at all.

Thanks,

jon
