Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794511809;
	b=TNIJq4rDX9elBPMo/ELzA+G5s5nY3UrOEtbZuzcrreovBf4BXuke+Yl+AjBuQT2YPbXC
	 WZqJqFXZP+DruXfKIWN6dy0bH9veat2ckecMCBRtjEySn4VBxo3WrHd3M5iU/YYi5AFY5
	 w5YFNtRCOZiSw6T6nmNu8wsdGbPOu/79DiOOOwpnrUdmYEDmjs+Ktfbz+iKM3mQISdrWh
	 4itFIRxTsU97LN3hXaEC5jYmKUjt9+qi3kN6dI0vEZNJoRNdKRu/6yzMBXQaTV1vAf2ji
	 poKtr+V9E9lnQrF5yc1SYWLyQD/wXWzdq7ujWK6ijxGULqzux24Gf9hja7hq5sts7dA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=+aWPSD9WHD2tH5+MNAceVSxEE7AS/jHw0VSgRVclhb4=;
	b=UTH+QGWinfst0Kd+0nT5KGF7BbYKqNRziFCYxYm7xxP5wddfQ+sd5BsA/gBkphG06HJO
	 9dil9Pt9PEL+QVRXEwV05o/NOG38q+0+hiIn2w6d/xO2gtI3SK9CFCq8FAP1FGpNpbomL
	 sFQOuVJWjIOyyaU9Ofo1BgBbRN+5R00GKYIZxAl2MRz1uGVHqrlGLDZ79S5bYWpiNtvZA
	 1IDdH0BO+I+UTSS0kSiLve8xhHVnei/dIlT8xiimdazYZvyZOvllebDT5j99HnYR0QWY5
	 HVENEs2ExTj9XC4LNxDNUCXgKQNJMq0djS7WUQrABqWh8zWqBhDoslur5nLZpIr2k4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sentinelone.com;
	spf=pass smtp.mailfrom=sentinelone.com;
	dkim=pass header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=rKO8AWay;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294A8606A886
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 294A8606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=rKO8AWay
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8bed7a8c7a1so8368b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:30:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794511808; cv=none;
        d=google.com; s=arc-20260327;
        b=p3Csp7waYSlu9duC2o13rDYSF/8ZcXdIn7mnkjEeiTuTwBbbKHKdq/ch1unCeB20+L
         61t0baGY1UwEwi8v6x+1ZCJ23PW4p8VZhxlwb09nNOJ7zz3q/bnUUhSq+TbvJPBW/aND
         Za9JGAoUmhMpMFy0yrdJ3JAmpnrXPMGxDqIxOMS4+gMdo68D0pn/t96nJWcRQ7TOT6R+
         fszefjDIEORCqWrHTaZtLEPgIwf7H31y3BsP9+x2pGmNbs1t/dP9xIyyWIqUXXSs5Oud
         +pACZ7wc/kDLQ5dSJl5Z9JpYlU+b0WLz28T7QDKt38t55sK4gL+HsZUJk0LXN2mckovZ
         HwLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+aWPSD9WHD2tH5+MNAceVSxEE7AS/jHw0VSgRVclhb4=;
        fh=2lkPky5XBuZ+PVxMGsjvrPjZ8HdszAbgrvqg5MSHTX0=;
        b=szaeXd3UxopkbhdMsEi8qyWaQQLHebq4y7uR725QRnuPPoe8jeZaog5HrhtAe9y8EP
         MIa81VpyPJzRD/Vyd34gVrFfDON8kBKfQOKIiJ4Uk2K5pNu7OrSZFtVNYizQxM+uo4R7
         M66kB2mixMgWkhsQUyHoW9Rk5sIS0CQP07q6rYTvVR703Qz89oTi00TR+ILTaEymnA2H
         FXbjbl/nPTk5zIl9J/0NZP09OcUDjXiluIIxc4GruhCeDdjgXgpMTF1Jua9C9as3G323
         QHogQYTWc0EiM+0ubBG8YGxnHEbQO4MqWdVsqp6zhmkAgB6Sf52XUyu6N9n+Qx+PCKrv
         IPvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sentinelone.com; s=google; t=1794511808; x=1795116608; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+aWPSD9WHD2tH5+MNAceVSxEE7AS/jHw0VSgRVclhb4=;
        b=rKO8AWayB+bZ8jG8zMMhbLMXHR8XzxlJO+5tmgHNbwAYW1D3i9CKl52JuvrAf8o/qC
         yNYDUMDiVTMcYsV6uxs0FSLy/ZSMGdoyQUZHREhCBNJ2ocNg6OjMJIZDsd+6tkV6OG8l
         Py0qF6INBfeW1uYrA/v+HcEa28dSpm6yW62XcU+SkvKs5a6NmAOChnPv34lmZXTg7B/1
         1XBJL/4DfPNyi68pi1mFDUOtIxjVQjUOx7gwsYzj6F+ydaZ6DTOclMVsesr9Nnpestxz
         k7c5m238p6wDTmMgs3KR3emyHg9Z/eiU03PJkFXgpkNzGdXfQ735t7q6TjmVg06k1lcq
         pTuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794511808; x=1795116608;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+aWPSD9WHD2tH5+MNAceVSxEE7AS/jHw0VSgRVclhb4=;
        b=w/vYtxbStLjRr3AK18Zo7H9MCwQxMGo2cxfQ57cL+dsJpXO3C9A9bbhp2Z/pg12nX6
         UhZlsg8GHEN1TWQFIRh7odVnkYxK4AvI/gs2ClLbOHRHN1o86jJ3vnvTHEuMZaUK9fdV
         kLsw0zJs2bWBUrCZK3Uc1gUIkO4bXmED74aatnvBfFSoVJpmjfgiFNZdg7b9mZV1NiIl
         KeKKBEK2Qz3/RlKbGLU3HtAzalFmwVsWlxEMkO1lZ90YNqOIMHNJhTIdTxz1sVVUJpsP
         roGrI0KDB76vtrFk3ZBDbdaiFd2cQfB1OMu8TWE9K1vLAfUj/hngDp7CcydEzfwVjOGN
         Rq2Q==
X-Forwarded-Encrypted: i=1; AL+hErE/pOGxyTaHESm2NpKIci0u7T0jqWh7pVuCqwi+3I+9pN6QLG3K4BczzVTfq9J+Je2kf1X4PSVcHNlAy60=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UmSs4+6LU5qYkYBYN21S88Mv2mw+4wyAjTQn2b/nBnEYhgK02
	SQo7BUAA2FpfR/MtPaKq6tIwpLw/EK1A25GdTUhm1hNHbxPFQGARSA7FJoK7uBj2pDB05WU/rt+
	u77emXDOOozouJaiP6STlLcXyVfXF2+Tlg67t0sXDIw==
X-Gm-Gg: AYBFou2j+6o6YB1lVMxJ+X0uMduxIEsWU0Sf8mc8XEyyn4kCwh0mwzm0xOqpJgDpQE1
	5HWgZAFu9FFh/fkrx6gvr5qR8SZ5EGYgZL04O/Fs/2n+xWCWLPQM4SgT24Cdg1blZ1sQcgi21HI
	dQo7brus79gjfbdAJ80duagUqaL2oi3zafM84g/35DIn1MJDQO/z+QfKpSf2pP3VkR1B6uGcOnE
	D2xkHC6oCoJUT7B0biCAdGBH0toRzrB0XLKBh3gigW7lJ5x+Uvt+cJeDucsrqN5nyO/dmBe5W4y
	hUBMaR/qpamiU8hyoVR2Xj+qfKdMurUBBrXT9ojl+MQn4Za3j8rX6eSCAFifVH1nAMV/DCyiFJd
	rMzHI1j1OXBFUv0KKsOUBb48EE8OguEmXDqqD0c7tNySxWgYBAbD3cH0=
X-Received: by 2002:a05:6300:6d94:20b0:3e2:86b6:9c03 with SMTP id
 adf61e73a8af0-3f7a71a6831mr168905637.2.1794511808209; Thu, 12 Nov 2026
 11:30:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-bpf-preempt-v2-r2-v2-0-9d8f6b952ad2@sentinelone.com>
 <20261111-bpf-preempt-v2-r2-v2-2-9d8f6b952ad2@sentinelone.com> <DMSTTWR4MAET.1VEV3R66S7ZFY@gmail.com>
In-Reply-To: <DMSTTWR4MAET.1VEV3R66S7ZFY@gmail.com>
From: Mike Bazov <mikeba@sentinelone.com>
Date: Thu, 12 Nov 2026 21:30:12 +0200
X-Gm-Features: AclHuK_9VqK3YuMSfLM4sy6-SrFdHB6b2EbD_ZgdfLZ2b3zUmDfAu99epYN-nG4
Message-ID: <CAPnbwjopkQo2vp07xyPyk+bMYVbCNy3+y_sU_Ot4B6GhHcwuAw@mail.gmail.com>
Subject: Re: [EXT.MSG] Re: [PATCH bpf-next v2 2/5] bpf: Check program
 recursion per task via bpf_ctx
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	JP Kobryn <jp.kobryn@linux.dev>, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> This is an existing bug. Today it takes two or more progs.
> With this patch A, B and C can be in one prog.
> Doesn't hold the series, but I had to mention.

Thanks. I will note in the commit message that the series makes this
reachable with a single program.

> I don't think we will be sending them to stable soon.
> This is a big behavior change.
> Backports only after next merge window.

Understood.

Thanks,
Mike
