Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783344;
	b=mePlgmKsm6nlnMCEGVplRtVVTST0oEA2oEwm4L4PrrLGr/8MnGUL6garnRplv30Oa6io
	 SPDcut8d7uL5qabux33OH0VgehOZYYmP/KLKUg4AY0VLd/8Pjc5oDH99nIi4RAZkP9CN6
	 khhqeeajh8PTLA4TcwSPG+ncWiExPcFUigpf4Wkc6IqSrAny7i+7OhtDgV8Qt0mTkEJMp
	 BJyl6VI75nq3A1WXJ3LlfPa8SNUB433q8kCb+KFxL5s+a78gJljeaVAoUJgKw6lcG+MjR
	 Sxrs6WCDHcsWVQSX1hD4owUX5VuwqfuHFFGK1NPDjid/TT7HCHp2Vv1N/KwMBK8p+nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783344;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=jarkkDe5ANJ4sCXVfgvCOyq/C9SPf+j1gPQF2RpMyHk=;
	b=0abZYiKUTWR8/xwDy2wY/sk/+S1i1zZrL6G6KNFbd1/aiGsvSpUiQNeHsHREC8t8xr+W
	 414GemeoxTaNvmN7TeQtt/p3yoPvuVO0R9oLR+TmiMxs+AZWWxcGJwwTj6mTJIOUU17e+
	 uBiUQHSFl2/rv/dpiKHg+4xT37pH0xI6YL7Krr13xGGfDvfGSBynhvEZ/JJTXm6UGLxGp
	 dTVkvIlHv3FvVRZ6TmXikMPkoYWD1MGq0IdxH5Xj7gbXovYYznv0Ow8vp0osBWgGol+Ql
	 F4Hy/fQ5vDSzDAoEVgYoYsN5KEpmOhi1wTkJQfy6tes8JyaDfegLhYPJVW/UfKR5F9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=ibaDmwJu;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=uel8xokL;
	arc=none smtp.remote-ip=103.168.172.150
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFEB606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CFEB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=ibaDmwJu;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=uel8xokL
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 3C126EC0255
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 04:09:03 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 04 Nov 2026 04:09:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793783342;
	 x=1793869742; bh=jarkkDe5ANJ4sCXVfgvCOyq/C9SPf+j1gPQF2RpMyHk=; b=
	ibaDmwJuVTHRtIVUBaAe/7ez2m8kPZXB/9T3LTJd3IK6FsenL3t1f42KqHR7SAnc
	x4nTFVZpq44cKuX3nMehfC3ysrHlNrjEG0XS9WHAEWr0KPNztTvfPfbic6r47nt+
	OEpg1Kemu4koV+qQKUu4j6qxVr+nbCN/LUyi03OXk39NjrdedQtFGYbRkjrmG3Eh
	bWTvfVh9SzO8TrEcOfl7JRRJKXXycqmpthsh43KUm7H92rnyjUD2XYip7IYx7ogS
	PTkYaB4VedgkvwjmNop9KFfUgp40B+Gam2GBMho3hXIQRAzRj6nBnwyi8QKVSWUw
	XKIqG0HDKz55i3STjwznpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793783342; x=
	1793869742; bh=jarkkDe5ANJ4sCXVfgvCOyq/C9SPf+j1gPQF2RpMyHk=; b=u
	el8xokLzRGyQLAw7GmEmopXfnpq0ucZxqwovQqBLXFpdEIrpRLxrPmj1euSAuFtr
	FWpwkwwwdBeoumXe4Jr2U3c8+Y+drb6Zu6pPsfdnewuR3oURDPcWDmedn9mi0y4N
	/lZtriRpplhafxQJXed5/FmOvbW0uceyUQ4LbtA9D7qmhEWUBCMPfQNvP8KHHXoh
	lVAKfzVv4EHeRvTw6FQRV7x/dT7lUnuA6adQI5cuxxJznmTyFqGckGo+ZD0Uw+Q5
	/imTaKozE11CDVGjWbfUIBWpWMFsANhn9R/EmS6sk1njcEN0S37qZLYvjtqpmlXR
	LAFrfHrViH9+sCvSmqPjQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793783342; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:p1N0O9cHWOH1O4CQknOh0R0ooQsXEO0QeO8m4aWcRI/gNni
	IBfIglSboOqgCSTZAUIzoV9zA40q8dFg7xfet5Eu2KPRb3E9JDtCr4nwHtiBfDPs
	MOQRsEDpMZE70PNamf8gZ6/0iGSx2e5AoC7xgyx6Sg0JjJkUVPCoQpw1L2zIYC9c
	cEZYM3YA+XhQBsApLm6oFqcbAoLAmWUD4r0Qcjzqo2LGW0AObZvbVLAeg6pjzKSq
	Kg3BUXd4RxywGhF/mwVMKxgst5zPJxhzHUtrAaX9gJcZQ2dfSk3Qbbsgd2C8QsKh
	FfEWb7Iug6X8gxCcOVl2pwyZurWZPz7EI0VLMEg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:SenFEhNEliwTzCny7iuI/XxNEaVdXN5fPEoIwegYFnI=:jarkkDe5ANJ4sCXVfgvCOyq/C9SPf+j1gPQF2RpMyHk=;
X-ME-Sender: <xms:LvbqahfpcbjEoB0p4azJZkP7zUjM_Gxw18YJM7wa_MO_GhNemFDTDg>
    <xme:Lvbqagia8FA8Oy-xu6hhe9SnwD_AYJHxATW7xJRkSpeoRfrAo63kGtvGS1Hi3z7I6
    1UxZZBEEkIPH65XPDxK2hnC6d7jUvuvzEt2EGXsG8aMWy7gLahd03o>
X-ME-Received: <xmr:LvbqavLJYyt0-Y2nWlV7JoUeu3glLTYTIuvJYaEJqKHfU4WJxpIgMMe3tr9ysb4LnyxS2CqT-FizqfXsiZpUBwPJ>
X-ME-Proxy-Cause: dmFkZTGWfYb466dxfyMOhh3rYSxzB4P3W4jlwofjBAYgI9vDWioa1Gi09+ryhkE1pE2LXi
    EYLBA9vxir40Zu07wDqa64Wz9QmhVMZLQkXRddi3guJqNX92R/WkPJ25umBecu9SovLN5Q
    AidGV3HsnoTSEJPO7APwTNwmpA4iIciL60IJ38FQx1cDYATM6v+jvZkBfwRCO2md+1mwGE
    QOzqt4r8YmGdB018cAL3ryVWZk5AtpTuIGWKx1TzE+6CU7nYsQfWgEbMkAOOb6gBC7YNeq
    fHKaAQthQMN+OdsDo/O8KXCEbbzFOoT9M9+f5YUcv5dG3nFnXJgqP7sgjfrK0qCUld6OVV
    ItoZ7SPnZjKnjb/jC5UDt33vMO+k+rxTNdT3WGMUYKDqaRITayUF6nwI6WVK6505+CT8OM
    TcGFewNJBspgXqXd/QoXHypFWTsYyEbDbRX8qzSVo5SQiYiFTz55tie/SsS/AcOQlEyDWU
    bdaLwygTuUDZSWMjjDT1asPYu3ijPgafHopfROY+xnAfsOQoYFnlSgZU1o1OkQCFZkNChF
    pU41PpLZnnt/Ush1xTtirVK1rClWiC2wsqj7OiHXQF6ZqAFhiz7pp2sZF3Kz+V8+29KJnH
    W7S5+AQVfAA4L8OYejH0GA7FGf9Q5iYl62/wN0bQdWV44uJXEJnAOHcSUMNw
X-ME-Proxy: <xmx:LvbqatoPwNKUqEG2nqsoHd3rXRIRi9_Qftug0A2dodDjdsaKCCO5Bg>
    <xmx:Lvbqako5IjmcfsnT9hz2anJCHyrucM13VJjFWSGwpzeJdypxSKobyA>
    <xmx:LvbqarGnrypERZsjTzFhEHTGu82hrMdnnDhBmMk6iq9EGS4l1OvJrw>
    <xmx:LvbqauqvXedbBYGtCbr8niir-Cu4egG0r3gtXXZfSdrKHZIPSuPTYQ>
    <xmx:Lvbqanqj8g2BHGksRCzKvB0wihdbIk4jx6lZwdUeQTLLsYASey7-AQRJ>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Nov 2026 04:08:57 -0500 (EST)
Date: Wed, 04 Nov 2026 18:08:54 +0900 (JST)
Message-Id: <20261104.180854.547774168466136920.tomo@flapping.org>
To: a.hindborg@kernel.org
Cc: fujita.tomonori@gmail.com, frederic@kernel.org, lyude@redhat.com,
 tglx@kernel.org, anna-maria@linutronix.de, jstultz@google.com,
 sboyd@kernel.org, ojeda@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org, boqun@kernel.org,
 daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com,
 work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: time: implement `Display` for `Delta`
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <20261103-time-delta-display-v2-1-b01b1fe9ff9f@kernel.org>
References: <20261103-time-delta-display-v2-1-b01b1fe9ff9f@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 03 Nov 2026 16:23:40 +0100
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> Implement the `Display` trait for `Delta` so that it can be displayed by a
> formatter.

[...]

> - Drop the `rnull` user, which will call `Delta::as_nanos` instead (Gary).

Now that the rnull user has been dropped, I wonder if we need this
now.

If we want a readable format with a unit, Debug might be a better fit.
core::time::Duration implements only Debug, not Display, and its Debug
output includes the unit (e.g. 1.5s). Debug output is not expected to
be stable, so we could change the format later. Users that need a
fixed format can use as_nanos(), like rnull does.

What do you think?
