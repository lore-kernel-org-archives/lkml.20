Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794038238;
	b=Ej5DIdKXhQo6cG12fOzMqRf1Ud1bIMecp0txEVwTC0yJTDD4DWOdkCWK/aDKtj89FWj5
	 qqeb/Kdrg5kv7J8PBSNQPckpHo+4qKFlIE3E/7C0JYkXFRkw9k5imW+ih7NFuGAWfGC2A
	 rVVfbIbC6OnZHDZk7BQymiJ6wvwpZiTMS89fe1BDkgowSzJvfYOUwa6GqAUXBXoRDPjdY
	 +yZl/4IZApVAexpgpd6vaObAhTjzfEJhMR93gOxf4RTiNSv6Sr+NK1dtvaJuInuTpGEAP
	 byZ7F57tNBvaZLrbQediXd+gzUWVKYlymszpjJoAnFBvl8mvHeKr+hIdmMApT2+a0MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794038238;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=m5Omii0j86WJMr8UmFiNMdKh5MdlzgSG+n7rpPqRM1M=;
	b=vfMYiKeMdJXqYbGDc5CQuMJCxTzOmyrmAjCkKGnucPxR+vQWlT46Rd/S+MPlDa6XoZJC
	 xEpvo7oLt2UyS1/5iUTy5tbkNE92LamHMMRTT4OFjZvS6TjsC5Azi4GlUIL7LcKwRuOsS
	 w8tMO2L6OtkrMW+xsWMwAiU5V6iT3gob2CGilu/s60g2NfSKNkwuQBuIZGXDWVw4fiqll
	 TV0QGnYC+4eXm/zrxl+7mMGcXmme0KcT1dHMN0NNC+d20Ami38XjIVhJTE3ACBWdAwBwJ
	 lO9t2iimz3APEtMwmEf7TXH6VT3iSaTPqflTGfAQVshTYMcBppsTdEFmaa2h4ft2JLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=AISpnsW0;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CDB606A326;
	Sat,  7 Nov 2026 07:57:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55CDB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=AISpnsW0
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5DD6540904
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1794038236; bh=m5Omii0j86WJMr8UmFiNMdKh5MdlzgSG+n7rpPqRM1M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AISpnsW01/yflZIH+ceF5svRQFNKIPVGbTop/FI5nHopmF0i0hfSk0WBCeAZcuCbg
	 ybjlOblneiDalrolonUz9d2I5RucQQio+7S4fuq7Rw+mrGimOT2FeWseZtQIx5trNo
	 j0vWvRSX1rAAV4K64TAnwZoV1r8EPRlW7xZYWEXjnNi2cveBFGAscAP7NNMzsYxTRF
	 fSY/ZOSIVZPVeU2pP535p/d5H3Ml5TipwdOsHHLxUatRdO6UlB6j8tNP5itPv8RW/Q
	 dQsEV+z5uXsDvdxU0DrgrSv2pnOd5B+Wp5kgfYG8qCNYqCHxVG93fLHk6aIeZFn4z1
	 lOh99VYcD9ZYw==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5DD6540904;
	Sat,  7 Nov 2026 07:57:15 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Oscar Alejandro =?utf-8?Q?S=C3=A1nchez?= Lucero via B4 Relay
 <devnull+aleszlucero.gmail.com@kernel.org>, aleszlucero@gmail.com
Cc: rdunlap@infradead.org, krzk@kernel.org, wy@wyuan.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] doc: process: clarify legacy status of applying-patches
 and point to Git
In-Reply-To: <20261106-doc-modernize-git-v1-1-8b59c1a578ba@gmail.com>
References: <20261106-doc-modernize-git-v1-1-8b59c1a578ba@gmail.com>
Date: Sat, 07 Nov 2026 00:57:11 -0700
Message-ID: <871p8x9iqw.fsf@trenco.lwn.net>
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
> The applying-patches.rst document heavily details the legacy 'patch'
> utility, which creates confusion for new contributors since current
> development relies almost entirely on Git infrastructure.
>
> This patch updates the opening notes to explicitly mark the manual
> patching process as a legacy reference and redirects readers to
> contemporary Git-based guides.
>
> Signed-off-by: Oscar Alejandro S=C3=A1nchez Lucero <aleszlucero@gmail.com>

So how does this relate to the other patch that you sent six times in
quick succession?

> The applying-patches.rst document heavily details the legacy 'patch'
> utility, which creates confusion for new contributors since current
> development relies almost entirely on Git infrastructure.
>
> This series updates the introduction to explicitly mark the manual=20
> patching process as a legacy reference and redirects readers to=20
> contemporary Git-based guides.

...and why are you repeating this text here?

Thanks,

jon
