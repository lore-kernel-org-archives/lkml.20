Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558577;
	b=Xg5b59H4+l4oqj0+S8RdP9Yw0xdFfoCIZlgOuzDdRx7A22oHb+ILTfDyGUrpWddId6B/
	 V16wkRHcfSmk7lug33FvN7cpXhNhOXtyq1SZoXMHHGEzDh443nYAUCbQ8JE7/IU6Yu9LU
	 hcrNpJyvCrdXA+k5/4b9lvEsbPGZiXogTySy0LMzG5MBb8Wh2Q6PqyiPf+O5N83pmeXNo
	 k3qOREidLs+JdVTsBbu27vAv4iDo63fHv8LaRLiWoBSRkELCz/yDUxhpO9m++8135aJP9
	 6E84mIist2g+av9ioVHWAGIbdYwxx+5sCFz95RiV2RTcpbA48EzOKd3E7OOOeNMWQYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558577;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=1mYFa7xxgjAJeyPToTySUaczpeeUgBwhkLFQ6YEU7hQ=;
	b=TxzLPr9Hd/0MFJazqouSgnckiohSnCnww7F6gBUKMHssltKLO8mav2hXACD6aOUQcokr
	 IZedKNNLGHDr+JBRjhrFrz/QAYlU6ZeIIssT3IGy/6m9tZbk0/zT7DwAlIP94FC1T5NZL
	 icUVm61+aK8K9KvOp4rDdfCL9pm5kfF41At0M2/0BSnGgPPJ6VGH86zb34LFhsxCDQv4O
	 tlfvE1JHb7FUxFWHuONyH/P9swfZGVBom/OrhvkKDO4l0OqpJgVKDkqhOKEn0BCHmNQkw
	 sOxRrNI6TlWLee1CXL48tJOzMMf8aZGv+9IOv+ZyErfKwkmSIiFhVcNTpfaSZhtlcWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=1g4.org;
	spf=pass smtp.mailfrom=1g4.org;
	dkim=pass header.d=1g4.org header.i=@1g4.org header.a=rsa-sha256 header.s=protonmail header.b=Z4pVlkPr;
	arc=none smtp.remote-ip=109.224.244.119
Received: from mail-244119.protonmail.ch (mail-244119.protonmail.ch [109.224.244.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C7960A383A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02C7960A383A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=1g4.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1g4.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=1g4.org header.i=@1g4.org header.a=rsa-sha256 header.s=protonmail header.b=Z4pVlkPr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1g4.org;
	s=protonmail; t=1794558573; x=1794817773;
	bh=1mYFa7xxgjAJeyPToTySUaczpeeUgBwhkLFQ6YEU7hQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Z4pVlkPru5cQylQgYvXMOr49LFb2OHKQRpwgqEsPQ8IYOcp5mY86PTpezXkfEXJIM
	 TSWPAC6obDhtBNj8zBxGTMp4LunDoLDgHI8CkgfsnlwI90lWB9o6nf88ZWXy5JTsyJ
	 oyg4WoL4zZxN7i4Q4dYHhxADPMk3sh+uRVhA6rIsjYPzgl+bzhDT/FttGFSsPYvf5B
	 UZxLMtao3ZKqzEClyme06nK7cG5P1Vh00IoMUU72thYfI/lkBUMkmXeqLlIgi6RL8Y
	 GlCImxsZ7xBP1myXhpZBT84h2pzXJ9nbLH4rhzSnwNydeyT9lMMQhmNIm9Y6BzKyC6
	 E8DKtqW7gMFxg==
Date: Fri, 13 Nov 2026 08:29:24 +0000
To: Ding Meng <meng.ding@siemens.com>, "gerhard@engleder-embedded.com" <gerhard@engleder-embedded.com>
From: Paul Moses <p@1g4.org>
Cc: Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Richard Cochran <richardcochran@gmail.com>, florian.bezdeka@siemens.com, jan.kiszka@siemens.com, wq.wang@siemens.com, Jason Xing <kerneljasonxing@gmail.com>, Simon Horman <horms@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Martin KaFai Lau
	<martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, intel-wired-lan@lists.osuosl.org, linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH] net: mark skb NAPI IDs independently of busy polling
Message-ID: <Fhn2gT70aJ-2_eak73NBZYuXuKtVb64PoD8VQ9jwm-S-K0RhZilAg9iwSBJ0RlaiSrRvM1vPw1aHvGPjcktu9GmdBuvFk9244-q2IVOrFu0=@1g4.org>
In-Reply-To: <4pqljild2fp6eotiicvwbwu2wfw66fzd4qamwt6utirdjxlaok@iiu2f3k7azrp>
References: <20261105071706.7043-1-meng.ding@siemens.com> <20261110134539.12d860ef@kernel.org> <4pqljild2fp6eotiicvwbwu2wfw66fzd4qamwt6utirdjxlaok@iiu2f3k7azrp>
Feedback-ID: 8253658:user:proton
X-Pm-Message-ID: 8667dd8222532892df754a88db7395758801c657
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


>=20
> Then, drivers that use deferred timestamp conversion (e.g. igc, engleder)=
 must
> specify a busy poll dependency if they want to obtain the original net
> device upon consuming the skb. However, this dependency is far from
> obvious, and annotating it for future features of this kind will be very
> hard to discover.

The "deferred timestamp conversion" was incomplete is what I'm saying.

This started with 97dc7cd92ac6, 0abb62b68252 and 069b142f5819 were built up=
on
it, so maybe Gerhard should decide the path forward?
