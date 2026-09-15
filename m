Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AFC37F005;
	Tue, 15 Sep 2026 14:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789482920; cv=none; b=RyKOywQ2T3I+1Cu7YePJPnJUdVLMw3A6Ks1YRqA4LPmcu65RvmnKaftVqmYEKJfHQf9TXlXhuuCjQpBpyKKhJw3EJuaGH6eyv2PxcRAYw2TFngU4E8dsZXFCqY3ZcGO1l/NBkYRUtfsNtCqejrCfFwGywr1jYw/1SsCN5pG70T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789482920; c=relaxed/simple;
	bh=C1coTTaLTSmCyi/AXBvsfewwaO0peBv5QpWCXDLAUVA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DYqyA+hGnewpUyiEnu30ezaabKi5tLKbXa9/xLOyZ1gdk+s6p9dLr/QGouNFUHZyiq7eZr6zGeZS374mT2C4sm0JqMr+Om6uoTl1BJODEdc5LWIufPMSeBb/8hS6cK8ABI/Bn+6x887hxD2j4n5QtxxpoxSKib9ozYTsQ1kSyYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=brVbkqEB; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="brVbkqEB"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4C22041595
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1789482912; bh=/U+FzXolChR/x+oOjr8UtZTVZsL6QHKzY/JemdiNuzo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=brVbkqEBRdXIWc6ksWiIqXDG2upJ0LMqMxQN0gks1yY9Ocqp+4BKiT0HivkqDqH9J
	 TY0Rr6y0rB0zL1rYs0gQZP6Da2/h6mYh0NatvAMdMJQShqW8l6JL9Wpl9S0Wh1/vZE
	 zsOficFcO80llD1C690IlyRkKYciGhJtoWDt+Mjx1qXd4FyuNKg0XqtR85SJLhxgaf
	 QRtBObXeAelz9wbbyXMqiXoaZ4NYdaLFEfv7CMrFea29e9YeYXJrZcffFzrcAxxWW9
	 Xk/6o3Ol5VV3y/ZqwoDbAmyw6oWi+XNCdn9gxALNt5SM9oxeW2dPHutXicVmjyyI8L
	 tUwOWNunY4wBA==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 4C22041595;
	Tue, 15 Sep 2026 14:35:12 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Akira Yokosawa
 <akiyks@gmail.com>
Cc: Masaharu Noguchi <nogunix@gmail.com>, Chen Miao <chenmiao.ku@gmail.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>
Subject: Re: rst2pdf (was [PATCH v2] docs: sphinx-pre-install: warn about
 unsupported Docutils versions)
In-Reply-To: <20260915101638.76e3bf1c@foz.lan>
References: <20260914-docs-sphinx-pre-install-docutils-v2-1-6a2a6deedd19@gmail.com>
 <b5df5eee-661e-4f46-9abf-1bd9cec8069d@gmail.com>
 <20260915101638.76e3bf1c@foz.lan>
Date: Tue, 15 Sep 2026 08:35:11 -0600
Message-ID: <87h5jqd1ls.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> On a separate but related issue, has anyone tried to use rst2pdf
> lately (https://github.com/rst2pdf/rst2pdf)?

I have a branch sitting around that, on occasion, I dust off to see how
it works; every time, rst2pdf crashes and burns.  I've long wanted to
find some time to figure out what's going on and try to fix it but
... well, we know that story by now ...

It would be *wonderful* if we could us it and short the LaTeX toolchain
out entirely.

jon
