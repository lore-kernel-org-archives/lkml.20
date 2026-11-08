Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794181798;
	b=0r9cYBuyXx1r4/x215CUUy1KJR9rkWmJAUtUZO+PfikfZd3sGxis8D8XE+mLG/HjrM2k
	 1vLG8jMVTBHGCczWRKciwwApKjxx11n76xhS7Y4MQVAsjAAqbhwFeizYcgKOYhUZm2et0
	 Jthma8ZQsf9MqP5QOOrw+L8qEUBZ5debOzp9af2JErW6jiCEdcICsWWuoUdytjMxYh0g4
	 f7xPt26SHGj2r+eXFXNrPqMaVNVI9CZY0cmibMwfjjNYcGZ472e9hqKipErPT6xcbc3Y9
	 jatQAyFwIBZtRk21hvUwXszHFGihcI9BmWeWTL5GKS7EJzf29MLofkpqxPQO9sIgNvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794181798;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=oex5wt97mccn7lWV24VHOrsRdlZpmYj9IVSwtPavFXw=;
	b=sjM7bGMSeHdqIL1kVGyNn/fKVtwV1rL1L2Y7XZCjcytUfkQUJ9nAWwi/T9VlbuW1jBne
	 ZeQt6RAIQqkNGB0xJlwVycERiNccvygIHDUBylGmEe6WxHcISs2XO5Dps4Ws6E4ruQzfW
	 0zTvoC/o8G4EQahcCjokxKYqj5Tj852InHge6Ui7ohYjxHiUAa3SavmL/L62ArXKQQgIJ
	 0rzBTbK/HdvoyoFQ300O7FKUFgipxbeg8jNNiY+Cxz2Xke9IZD1FdYe3H3V+co8NcHnRu
	 AtxsjeU6abf7Yl8fP+jQE/gzqMvu9dSA+Ap84I/YakGd7/KLQSMpBhWLCip6JCpRTNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=knonrycmirev3idjte3oxf3piq.protonmail2 header.b=F7trs7ce;
	arc=none smtp.remote-ip=185.70.43.102
Received: from mail-43102.protonmail.ch (mail-43102.protonmail.ch [185.70.43.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3AB606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 23:49:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA3AB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=knonrycmirev3idjte3oxf3piq.protonmail2 header.b=F7trs7ce
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=knonrycmirev3idjte3oxf3piq.protonmail2; t=1794181796;
	x=1794440996; bh=oex5wt97mccn7lWV24VHOrsRdlZpmYj9IVSwtPavFXw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=F7trs7ce6TMZZUrBXHGsIErgsi6rG4E78HJ7MdSmcvHI0pzmK34iOsvnP9CHuMUiQ
	 LacNRK2a8PohmI8GyeoY44wSroX6dgJt9MChhsmhFxqH8v0IhIb5pHxcCETDeUBAd2
	 /aMT4w73kiIAa20FYYjBVkWsaQ4HI7PszsDsCrv1QDD9I9Ahjw4T/vBE2EEdL+0SG2
	 8kj6sj7Un6diZcp4vmjDsswCW1+z8W6pha873TvUxS8l0oaocd63iYSlB7h8g3L1wp
	 JMlNYHvsi3VLeXXAYwazt6Fav1BztM1pudD6fXGBZ8GgqbkJYXk2t9U90ciIcj6DqI
	 1tDUikHUUnkHg==
Date: Sun, 08 Nov 2026 23:49:51 +0000
To: "peterz@infradead.org" <peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, "acme@kernel.org" <acme@kernel.org>, "namhyung@kernel.org" <namhyung@kernel.org>
From: Noah Weinberger <NoahWeinberger2003@proton.me>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] perf/x86/amd/ibs: check captured RIP in software privilege filter
Message-ID: <K46Nw33T8XOxsZs7GMezoyWoLLaWUYLMSISdCAIzsWhXNpW9mTqZKD9e7mCQq40RDRD_cHnOEoQ_H9AANx0MVkmj3mAmB9n9DdUwxJLtvIs=@proton.me>
Feedback-ID: 186545857:user:proton
X-Pm-Message-ID: 20fdc039d12a1f7e8c7c13871e7d081c1f2aea02
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




Noah Weinberger

Keeping humans in the loop, and the AI alignment joke slightly out of distr=
ibution.


Sent with Proton Mail secure email.
