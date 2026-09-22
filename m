Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAE530567B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790052487; cv=none; b=Dvv6xg9aMt9gXcZoJSvCSB0YaZi7OEpJ09j8AXYFORv2txx9wuT/9UGxjvtSVt9mPvoL23bx27JRh+6ADywDBBwzXAVd98evUkzWBlL/Ul0IfdciWTsbawCgK1KyO/I21M2Jt+CwcOHUryBxGBdNE+x5bKwQ6w8S8HMSRPjkQ+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790052487; c=relaxed/simple;
	bh=DRso7SbL8e4As3H+pvVXw6BzQtWRETrRQMqxN1VYZOQ=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:MIME-Version; b=OuNyqP1/z1GqIsnLRkbDeFRk3oUTT9Sevb5tPg1l1g9ozpXDuCTbrPCRXdOBKPIPM1ar4cXuAXwlLofWOcw9CmUkxJ1Ow/ClxI6I4Rdptf3lMP6iI47e78C1e9fhhUCqyUKJRzdeaqeoxeRFwBj7ocX2AgwOd0iCvC07Ukx0Gbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RPhu+Tcd; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RPhu+Tcd"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea34ef3so3277451a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790052483; x=1790657283; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9yu04hZXDiXWGAL1P3A8arsPpXEh1RVC3U31vsrwLYk=;
        b=RPhu+TcdaWpiRoXAg6/wRviuBTZ7KWfATLI5nL/A5BHcoOP6fNRNoTftIWHRjgYHlu
         muQbLOadTfZODfG2fGvSkWe5oYq7y2PcRZIbbstDYc3FKwlQI3/1wWHrmPWyC95yRO8U
         NaOfGPpnqy09lvYFF8ujCE5BBY5eK7EQE4wiewyKoiWavZQ6/Gv/bP5KDMw/90j1m1e0
         K4VLg5GSC0L1FyEzCdiqjH1BIuNMmm7qNo9/Ev+7T1WFev5XCHYiWLl+0N39C/9rWHpQ
         HoyJb6N/Dz9WsHDrTd5+8POP5xKhb9OKNPdof0eqUDkCbuUa6/vB4E4ycoMAILDEzm2l
         uniA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790052483; x=1790657283;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9yu04hZXDiXWGAL1P3A8arsPpXEh1RVC3U31vsrwLYk=;
        b=Bg0lEViOT0HYHxqcr9Z/TQmh9M4n1wGQsL3q9qJCwdXKMexVY+lDpqP8PziA2Bbt5V
         YyzvkbZin752qTFQesRmS7vYntjndkj+RwnCtW1S1gfX9Bbw+/rcIrPGtSW9/ZP839gp
         1UA1Ajf0bgk5MI7Qgk786dvGWLp9HbKCw0/pwPsO+wLKvOvk4NQ48J1ckPeYf6uevPeW
         PQ8LJZ/FiTaMYrMFEWtQYTJLPW1kteL47XQfgHQaE8tAQzNUySLpfayO9m/vxl6skPH5
         nCtJGo1pEYzEtTZk6HTusC7ggLlYFbiA+bN4RJ6u1U73i9iflRixUPq6rE+atvqjqV4K
         MeFA==
X-Forwarded-Encrypted: i=1; AKwUvBz/caB/WEjqplloLH9nywCRRcFnWbCGw01noTdeKa5PVrY/92gWhIaOYKtlC1w/Hsi4/T9eMW0d5BYwHA0=@vger.kernel.org
X-Gm-Message-State: AFuF++lauv6C6uZoOE5eb/FV8s98ai2ELOFWrwTopuYcKosowuVKMrP3
	QdGNMdokBbYfRBLI6UUqBi9unzR2pqslJcX0jSb1I3oq5g5kWIDR/aCd
X-Gm-Gg: AYBFou1tgoRPrhAcupnTRv8kVBJ6BO2HNhP9Uk2qbyXIAf1terBS7+pVKr563kFEhXn
	h/nUGu7nQDN2tt3SnbxemZGKD3ZIDJReRPN5LCFLkRAOoPJi5Ki7Jp/d8Z3fCoIf+mbYfFXf7wW
	/gXQuzhlJy/mMQYhDNtO0/8S4yTKAQ3LxOf7CLggX1v5eMlkqIDMSLs8PVttbuWGNwZP17PrQbs
	J5v6HEDPnLmNQjAVRsnR4unXmd9nTzxmQlMXZTFVeRVbEVtjxMj5xcQY0jXOpvvt+Hi42Ox3jBz
	SbgS7spKScl7ZDT1wH8aHtrJqq/kLZrAvzP6MHV4uRVyBkbiyu7vHo4PI0/8crzAddd3aW0dwNm
	Wygq10pK3liNV++y5qYOQXwyEwyywqHsT9SdJDEU6+xcyMz4blFnEqk7IDi16aq4IEd+HzDh8Q9
	I7wK7lFDvCUgWAzIC/SKFmwc/ScZoim3+AF6jddQuGVQZt3lJvkwoft81gOWmTqOaDq6jvatXEU
	I+5QHma3bdAAuRAVkgnEAuKy2vxo8ElYN8awI9XDJITMlKzYwKJPwKT3J/GlKzb5dgSwEVDMjoF
	y4Dp
X-Received: by 2002:a17:90b:5388:b0:39e:21a7:5dff with SMTP id 98e67ed59e1d1-39e54d1e037mr20177534a91.11.1790052483431;
        Mon, 21 Sep 2026 21:48:03 -0700 (PDT)
Received: from localhost ([153.61.198.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06cbe369dsm455307a91.0.2026.09.21.21.48.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 21:48:03 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 04:48:02 +0000
Message-Id: <DLLKN9WTMVHD.1601DUU5LBVAB@gmail.com>
To: "Eric Biggers" <ebiggers@kernel.org>, <bpf@vger.kernel.org>, "Vadim
 Fedorenko" <vadim.fedorenko@linux.dev>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>
Cc: <linux-crypto@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong
 Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "John Fastabend" <john.fastabend@gmail.com>,
 "Karl Mehltretter" <kmehltretter@gmail.com>
Subject: Re: [PATCH bpf-next v3] bpf: crypto: Use AES-CBC and AES-ECB
 libraries
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <20260922040413.28885-1-ebiggers@kernel.org>
References: <20260922040413.28885-1-ebiggers@kernel.org>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, Sep 21, 2026 at 09:04 PM Eric Biggers <ebiggers@kernel.org> wrote:
> +config BPF_CRYPTO
> +	def_bool y
> +	depends on BPF_SYSCALL
> +	depends on CRYPTO_LIB_AES_CBC
> +	depends on CRYPTO_LIB_AES_ECB

This will break the build with CRYPTO_AES=m.

>  struct bpf_crypto_ctx {
> -	const struct bpf_crypto_type *type;
> -	void *tfm;
> -	u32 siv_len;
> +	enum bpf_crypto_algo_id algo;
> +	void *key;

No need for this. The bot was wrong.
Reading any field of struct bpf_crypto_ctx requires CAP_PERFMON.

pw-bot: cr
