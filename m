Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD4649AA24
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792014259; cv=none; b=kobH29EegzzKaZJ4FLm0BX7OgZAPEj9muXNP11MkexofRoQ60wry5/+/sErWokhUd0BXsiN6A8ru7ZkH2TttkaVGsBKHBBL9w+3VfbpWS3baAcPA+K9bWPqpkbBCpB/ABozkHiW1g4ZSz0Gu2z+oKoqBzE5sNY+5klTlHwNoKio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792014259; c=relaxed/simple;
	bh=ZlsnNdUfOVho9jmT6Hnl5zvOQLLi6uv8gJyum34DEYE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mtAih9CWEBHFNQWdxeuslImssO5xR2S4dkUoLpg/2iwcdxVBAFOie6ozoLkJAz2jYU1z58XgdZDzis5iZEgEUbErbA2FQSCrdM5NiYpdJUSDWw0e/KuPv+Ckw+CcIAXEY+XRQuLIeZr5cBa+rC1Hv7yZ+HDq+ez4F0yVmuDmuhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rCs/NXI8; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rCs/NXI8"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so39737365e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792014256; x=1792619056; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cff983+JIMMydZYhp9A54f/c6x1XpQzAnWFKZyZ7iSQ=;
        b=rCs/NXI8euK/ZK7HX1EnkZvgdG9BVnllooU4kf3BE/44kmSh7X9dP7mH0+hJuaH/3X
         SHHP6fXkK62Ro3qBm/p0OdhOm06qxaGj1MFgHrm6bP+BKRvcAioDWI2u0KsnGkFGVMei
         lTcFILxkLxLxkvnKwyjPTV5/TgRbDhhMgVU5dOaEP3J32gdVDZ2jf4QAMWXsdkq4AcsW
         w7wR7DQovTlvLKaw/xsWiaSJUdPsIzalOMnJQHZ6ul8rGevMgKGjTQ6mUdG5fc1w6Tcx
         8W8nWg/2eQpgS6vbh4hApd44mpP1yfw+m+Fa1j7sDsUj+qudZe19B/pf76R1dgMiovB8
         2u7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792014256; x=1792619056;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cff983+JIMMydZYhp9A54f/c6x1XpQzAnWFKZyZ7iSQ=;
        b=jI+4jkfBULKgp9iUAUtnzKtYcmIC0VJLFBgOFk3WvUaHKeQpuyCMfLMXJw29dQUyeK
         1dWtpTo9BNb7FA/8oVCIRy9qBngYNbaggxX6JJJiSxPAyS5v0aBvDYR9wI6+WC++ggzM
         3hdbJhlAJ55jS1Fn1E33PdIRwQMhbm7kNA8o3qzhqOPcx8x0Iq55XFdl2XgRzXaJzaoi
         lyykQRvrsOcOKc/UaMxiEEvNoROwhhymcbRBf1cv6jctCxTjc/uB0TR2QhBQGOacCaG9
         JOY8571eJFhv7DHhI4/2ZudeVpR0kTHPuk+JNvbEvVg3CBXgHo7vqd2HfhzjlVteHtpe
         +5Bg==
X-Forwarded-Encrypted: i=1; AKwUvBzS01qOXXR9Rr+MAC91U8m3IlXV2+X2GCrtabuvm9qk6DrqvZZdQ3IuDIhBMGxLyDpO6MmQFqjlr163sLM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzk+2tEBQHRdWgKk/H8gmupSRIKe26DDHMybmDr5KP4FVouGw4
	UkKnwxTZZLInaoKSYm19GfqO2UGh7kT9OCJq9oXTjB6T7qtHkOYWVDeY
X-Gm-Gg: AYBFou36WZUCrBc0ujU1gDPcxEke+SIwHR4SF6q7dILBCHLeFMqVQrk5Ivq0yrd+ug+
	Dng2H/mw22etKkWjGjceShpr3BVeC0p1ow8q6i8Hip/gH42iuvIhaWzhmf03ZSlw4AKxAPjjkQc
	SzNNKer5wFz6RLrP5RO+LFzOwXCWVgBFZ1uqeNbyrRI+YNWZp4AmLe7p/AnFA0IOo9Lc6ef5T6L
	oCVZKJWMzdr42v+gwUsrBHVIyfbQeEc1KSvOWNfLe/2UM5GWLoBBozLTfH3twT1R3XlYtZI0Tlw
	7r94CiWFt/IXGcfGcBfXrWJsfNoflgbRA762qhYBQv5Is1qE5vXV94ODBwWW1OZkprMMqTI7/p8
	YPmAS2+bBpaUypBb3XDf+Dx6axg7AviJUpeEt94FxRH9GlyEadlIFgIAW6s5axAtqsA/cNxh7qm
	ONoGxs65QqauGl8Nd7t0BmB6vQ72UACdhedvQiCWTeLNnatua+JopRJg7k/A==
X-Received: by 2002:a05:600c:c176:b0:4a0:c2a:485e with SMTP id 5b1f17b1804b1-4a18e4dce0cmr348735225e9.33.1792014255987;
        Wed, 14 Oct 2026 14:44:15 -0700 (PDT)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bdbace19sm18835365e9.14.2026.10.14.14.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 14:44:15 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 14 Oct 2026 23:44:13 +0200
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Quentin Monnet <qmo@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Mykyta Yatsenko <yatsenko@meta.com>,
	Avinash Duduskar <avinash.duduskar@gmail.com>,
	Anton Protopopov <a.s.protopopov@gmail.com>,
	Amery Hung <ameryhung@gmail.com>, Jordan Rife <jordan@jrife.io>,
	Rong Tao <rongtao@cestc.cn>, Eyal Birger <eyal.birger@gmail.com>,
	Pu Lehui <pulehui@huawei.com>, Jingguo Tan <tanjingguo@huawei.com>,
	Lin Ma <malin89@huawei.com>, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 18/21] selftests/bpf: Add tracing_multi bpf
 prog rollback test
Message-ID: <as_3rZ5ToLjzQidZ@krava>
References: <20261012154024.29423-1-leon.hwang@linux.dev>
 <20261012154024.29423-19-leon.hwang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012154024.29423-19-leon.hwang@linux.dev>

On Mon, Oct 12, 2026 at 11:40:20PM +0800, Leon Hwang wrote:
> When rollbacking, the prepared trampolines should be reverted.
> 
> In this test, the first bpf prog will be attached with the trampoline, and
> the second bpf prog won't be attached because the bpf prog has been
> attached by a fentry.multi prog, that causes the rollback procedure.

there's rollback in bpf_trampoline_multi_prog_attach and in
bpf_trampoline_multi_prog_prepare, would be great to cover
both with tests

jirka
