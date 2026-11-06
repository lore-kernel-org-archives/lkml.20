Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793939130;
	b=FfcG8Pv0qT7YHPYOHbHr9dP1qwI49hkyPhJXk2JfsgTcBaGghF7kX6F0ytX89hyusg+r
	 ShNSdJ8x/cYBTAWwhtyoKOYhAzLYH1CC2I56Y99gJLcSf3epzkoluUJLXz59XsPyhIFof
	 BYM8gMsvgF5YOZ+MaaL2/hh4K7kvOGV6Te8sz1fjqJoFlE7rKRBeEiwlrKyZIB/k8itJC
	 Wb3377NLcBjmIarJMI9eFg+4gja+QQYUFYsGl7tn/HHctJQudhqk2nF29xndSofx8iF41
	 CCzRwC/yNkik/PYzEbpZltvCH9TVkBkKvCFsUCFDcNDxHuX1RyYQZ0oSBfZV8Ex50BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793939130;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=m3i35cTPpq5EVgKQXrBdfiivmSKz9fZ+AmK6CCiWbeo=;
	b=D9yj4/i0ixLM/oPmEFY4O9/p9/vitMEBCml4HLEPgCczOnlATJs5EDRDOb1DeApj8MvN
	 m3Di+khInzke+HoyROvRYsrkC1eiEeFafx3rAuGa8ydwnM5uassotvh+GFADR328HMUmb
	 MJX7FmVl12U7UIjdOReyLFv5B/WYxX3AfL2F7safOtZuGmfsg+pevZcdKazAUzTtlDnUV
	 lW4+XZaD2kEbNJaAWXHM5DgwTkzsSJaSvjFS9ymaJvZigIdyAw24B8HzLiqZlga3uh8kU
	 Tp1a5T0LLuIqomrZpPzMleh1vBg8cXv7axhsZC55ASn5RaxgCuKIyyJtstnwsvlS5ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=IRfId2d+;
	arc=none smtp.remote-ip=185.70.43.103
Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9180606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 04:25:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9180606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=IRfId2d+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793939128; x=1794198328;
	bh=m3i35cTPpq5EVgKQXrBdfiivmSKz9fZ+AmK6CCiWbeo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=IRfId2d+lO7rsrlLdrL2iXUdFTjQN8YJNo4gwAZDmYWmY7UpEvahsdRX+7wTroAoq
	 niNYXDJbmigDpfUs8SIYqq5Yf/t9JXW4hUwbXcGeRzDSno9zmcbjfcHf8ba/J1/Kv/
	 4JYS4XOJpSU89TsXj4d7nvnRCxEq5GWqtTGbCiW7hujzBk1rrSS7BF7KuiDnu+xdxZ
	 i1LisitDgqeA9bd5+pdVHpoZPQJ7hO1JMsosGzkNb0u9YpUYHBhtEQEQL0QhqVeLjV
	 wrjyyyCQxoznG7oC8joY9DsIptBNkHe3OKi6qgcjJNlR/rbITiXuHc6VC1EKhV6Pii
	 LkPmzye+6xp1g==
Date: Fri, 06 Nov 2026 04:25:26 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: i2c: ov13858: cap analogue gain at 15.5x
Message-ID: <20261106042520.83651-1-lsa.uz@pm.me>
In-Reply-To: <20261002093507.43584-1-lsa.uz@pm.me>
References: <20261002093507.43584-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 141d74d6cdcf69f3fc6fcb665f6e1f808aaa73a2
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

Hi Sakari,

Is there anything you would like changed in v2? It applies to v7.4-rc1,
before or after the ov13858 power-on v4:
https://lore.kernel.org/all/20261016210246.58562-1-lsa.uz@pm.me/

Sergey

