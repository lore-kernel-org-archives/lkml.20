Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877118;
	b=xg67DpmbtSaxwPIijsUbXmuMCJ0sB81okUQW9Kqtnp+oaP0ptguavPd9b/+Uec+OBIbw
	 TrWACMM+sLU+/wsbuZDd2t3bOmj3sRiTbJ8P+Lr9KgjjKpeE8EK6rRVH4uF4xIqghGMXe
	 karAjP3d8OR5nRPEiaTZw61Iypz8Z0c3dLCypqhMmJ9NWN8xYKog5BIAi0XvVLh1Cn0Ca
	 FxdhcBsFqS+PwBugI4wJiQNcn//R3QnmvxPTaukOdhe9JPcIJlrCxuOrFWgSPtIM8st1O
	 JJbL26Fpr/Cyp2tlxCR8uyURlhKR7+IiNLpHZ5bVPaM7yEBu38UPBSGfMYfz7rRlthQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877118;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=hpFvMwFbdTtza9HTaf2aH2LwpMunVMiqC2tNpfzgcq4=;
	b=SktyBMpSMstF9Bup4xFcbXWMRUXgt6BKoiH85Z67+lXbx8QfSpEqpWY3zODt2zMpoCLu
	 yRFWxQSkvtOTy4DIvI7FRhQxiqoyZMIJrnDI+o7cC86sSHGFEvjt7j+Hg1P7Uw6nPAp3y
	 dPmQ+HHNaKqIC190An3O2jhmayovTAPI65lGiiMHWSLhuL8edVNrOhhMQgKSCBVAu0MlK
	 rnpo12Xtbu3qNWFjge03zYHa3JICHps+xBU6/D+lOAtYK9XrcQAb8hG7jfJHyvPFI7PoY
	 1lVByXs5rTUZnMMwWYO67Ot7vkCPSTZ6ds/TZ6ytFBZM3GAohVjz5AJQ//ykICcmINQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=LSHH7MHb;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=hPHZuVdH;
	arc=none smtp.remote-ip=202.12.124.156
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85839606D812
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:11:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85839606D812
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=LSHH7MHb;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=hPHZuVdH
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C802D7A0157
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 06:11:56 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Thu, 05 Nov 2026 06:11:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793877113;
	 x=1793963513; bh=hpFvMwFbdTtza9HTaf2aH2LwpMunVMiqC2tNpfzgcq4=; b=
	LSHH7MHbJDFIHwXZijZsJGIMaAfMSaefx8tavROoD4xhHXsak0aV4noS5zghztxD
	Pk7kqUnw0Xn0rTFQSqjZpEVKNQ81UtYAX8YZl0G/dD1SCSxzqz0Gdp+9m7ph5p7r
	IxAwNjd5bvx9uXEHnkNnhsoCLfyhDpyTDi/3i0BARJSKcZyI0KVgJd7Lf6LIddb1
	jq3v4A3SFpQH+GHHC0GajuEeX6PfxCDYa0ZsUuda/E+4exROmRkNJIT+1qVQs9Vs
	U5z5AnFu7qrgcSRoW2li4XnRvY+Mqv4DLNB3JSW3j0IE8+L6Puy+azMYOHM3fjRG
	ZFt9UaZnJcCQtTvKTbc83g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793877113; x=
	1793963513; bh=hpFvMwFbdTtza9HTaf2aH2LwpMunVMiqC2tNpfzgcq4=; b=h
	PHZuVdHY5DlT4jjgfOGIyWtgC2ZjH2SUx2ZbjyYGFU/xSCpS+DrlDXQ60QDlJpzg
	L+AngJZb1lxbFQYXXJ+wgfK3P5y0UaYzQZWAibeDDQgQwXxdHJ0zuMzkdofNZUCe
	owzdDU7MnNHQ85LII9iri4GCZwGGKKUsp3v3wpeZUKbuXMBWGIqlPd01ab0H6nn/
	7wU1C7+sGcrXs5JFAvVGmC/hCnou3mbDRW71+JEIh/dasj9UNScDITy3BbdIAjWd
	oOr7v4Se0aq0M0eHXA7SqAiKZRHhzrCdSMgRW4TMpdLg02WZVDBnfr5KrLMMbEkR
	/WNjEaaivPzXPU97Ak7cw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793877113; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:AnD18inBSHDN4MuN9cQwpQ9loj0b95hJYds4gk/RI7Jql3S
	KWwST2Zc7dsDtSQrV/ZPXWPB0H9EVLlsHIflWXc6o9TYxIRFy29eeoX8Jpz6V7e8
	O9CUNF/ae5n3qVvRgw9TPH/FCHEgLDSWILwKZcHa63oiRd+jUBaWuPolPFKMEdIU
	h0X8o56DJV07RM7Px9CA9MK1LjtsNcPIobqM67x4R656Yn2U1IfOMW3njREZGhBN
	RErqC/0nJQgXyZxtW+FffH6zVphD/TZlxtzA3VIJzqoFtWP9bhob2Qfne+Z34iKs
	4MJCM4l5KcBqmtqxZPRkPZix5PX1M+8Ialm2G+Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:YI2NYsyWKONGc8rKQIlx2UBE9FiJpS3HV8hLCyY2CI8=:PrFSSJuiCr0qju1njMTZWXGNPZniWdYjYqOwPGuj7T0=;
X-ME-Sender: <xms:eWTsavsC9kKeQQ8-rA6kaCYJ6Xpu-jnNmKWudRGaLBvwfH34V8xBGg>
    <xme:eWTsahx4opCT2zwyd1Km2jLILTnIBFi-WaOLueZMRu6ulw25aKehTeUf-ZxG8E4Rt
    LZZEtp0GYsJ3HnLbNGHV0Sv9qO89IPQXfGWEGmpQkQvzYt4MuS9jeg>
X-ME-Received: <xmr:eWTsanZQFSoqtIcvMs-c1kzRk6q-b9lqwcsBhO3EWAHJJGR87qtBxNYI2zDnQBjGpEXkngUJqs6RWAftmdiD90Vx>
X-ME-Proxy-Cause: dmFkZTFv0OcMEalbQ7TW0DpuuicFNiggu4TTaE/UFZUC67x/zvGuYcxrXMSopxVVUYnVrI
    QittStncup8D4Ass9ZyOxWQwGN8SjUNAhXJLbQRc/oDFUSwqmIy3Pwg54hRcKsWR/AjZtZ
    9CVqgNjH6l7pKBHM6bzySkxFC/GhEbqNaEQC/Du9wZzhrJhUtrExe6SUw3wb6pn/MUyw9U
    gBLQW5N+KHwc97qIeAENjxj066cUFIz0cpTtNu1S2Fg+0dWOlbKHx4qefbQINFapcvAdbL
    UP/WeM49kdRnmYR0I8AsOueI8Ud50TsjOtDwqLzzFbzsTvz0bT+5nyK+PQF0Pc0HcLTiZC
    Zhm2kTg8+byhSI/gVPyqYb+6al5y53FrICvVcxQSQspXr+bi7GqoxVYbrQ16QEH36L8JYG
    pq1sNqPdZuZ/iMyOQ5mx1JMu07PBsUgm/WmneYBol9IgbSpcqOYgH/z03cEhKAFdpLqyPu
    IjYQ3bh/JcK1zJoWB/yXv1DlenYvW6oAa/TKhkBZbDrwQtL1uAcG8ZqHrWkv5xNM2xNT4G
    lxcDnhu3+RivIcaCwmDb8ac4qJ8weXnPoqt928NliZWLMUOH/Elqr39jz5W1UCVsOF4LWB
    YRqvrzu3/CX56j1ELrEjgBGozrDIpDjXfSSaZAOBDXksEJ9blR6QaNgTOUOw
X-ME-Proxy: <xmx:eWTsag7u4Dzsqi9B0JSEuzQjtE0zn94FkBV167V9oI7jlP6ORI7gqg>
    <xmx:eWTsam6Ns-BXlIqVPTsPpC7zUhlqyLvj4QEie2R55f5UuMCcfx1WeQ>
    <xmx:eWTsagXTWN7d8datsT-6GDo5YxjNKjPzWQwRCfR6QjLcgNQfnHhErg>
    <xmx:eWTsaq6awixyANGcxf1S9LU7SONJ8203bG1LVjwOnbu7q8YWZEBGow>
    <xmx:eWTsat6h16er_Qkh2praZPLfRYKoSDxTz_TFktR_zbj847pAj9_ccE3o>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Nov 2026 06:11:48 -0500 (EST)
Date: Thu, 05 Nov 2026 20:11:45 +0900 (JST)
Message-Id: <20261105.201145.828445900027892304.tomo@flapping.org>
To: a.hindborg@kernel.org
Cc: boqun@kernel.org, fujita.tomonori@gmail.com, frederic@kernel.org,
 lyude@redhat.com, tglx@kernel.org, anna-maria@linutronix.de,
 jstultz@google.com, sboyd@kernel.org, ojeda@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com,
 tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: hrtimer: add active() method to query timer
 state
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <20261105-hrtimer-active-v3-1-52636808ccda@kernel.org>
References: <20261105-hrtimer-active-v3-1-52636808ccda@kernel.org>
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

On Thu, 05 Nov 2026 11:17:24 +0100
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> Add an `active()` method to HrTimer that returns true if the timer is in
> the started or running states. This wraps the kernel's hrtimer_active()
> function.
> 
> Unlike a direct read of `node.expires`, this does not race with a
> concurrent start operation. hrtimer_active() reads the timer state inside a
> seqcount retry loop and re-reads `timer->base` with READ_ONCE(), and the
> core documents that it must not return a false negative. No exclusive
> access to the timer is therefore required, and the SAFETY comment reflects
> that.
> 
> The returned value is still only a snapshot: a concurrent start or an
> expiry can change the state right after the call. Callers that need a
> stable answer have to serialize against those operations themselves,
> exactly as C callers of hrtimer_active() do. This is documented on the
> method.
> 
> Also add documentation clarifying the definition of an active timer.
> 
> Introduce the term `active` as a set of timer states composed of `started`
> and `running`.
> 
> Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

[...]

> +    /// Query the state of the timer.
> +    ///
> +    /// Returns [`true`] if the timer is in the started or running states.
> +    ///
> +    /// This method synchronizes internally and does not require exclusive access to the timer.
> +    ///
> +    /// The returned value is a snapshot. A concurrent start or expiry can change the state of the
> +    /// timer right after this method returns, so callers that need the state to be stable must
> +    /// serialize against those operations by other means.

Does "expiry" here mean that the callback returns HrTimerRestart::NoRestart
on another CPU? An expiry alone moves the timer from started to running, so
active() still returns true. If so, I think it is clearer to write this case
directly, and to add the case where the timer is canceled on another CPU.

The same sentence is in the commit message, so please update it too.
