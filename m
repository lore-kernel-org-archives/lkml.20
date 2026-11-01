Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793547279;
	b=DXT8Q/28378oXeKBe0qV/NyAgTqp/lp6i7g2WyAOTeRiLKJEgxloJ1hhlSXPGPuZxAFC
	 tmpBOkyMXgqQ0UcQ+cXOIDJ4SPqCRXn6hCoLWki38JFAefzb4qgvE6ki2ln0mTVa258Py
	 dG3e6o04Lq5dGMCoKjifuXbCorcmiRt1UEOsFwoWp+qohdIxKrWLZXQnfHL/TJS+MlVn1
	 blSDlQCkZpZ6RfxFnPPUarubL66acTngMTlrP8fKA0nh+aFl0KEDOBOisIyCqLAZmxqD4
	 FwNXHy5b5RuZ5LepbGCrlifwsx8SR1BPlqviToaMTxPPTrVMGMwIeJ3iP28FAhGZ4zg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793547279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=psGHhOsIoIp6B+XTiXsNSE0GhyZPqC7AReMe33kXerM=;
	b=ZAn+tLb1koCe36hR+Kh9ogsWaJAu4sK5FECm2g4a6XNdwIlXcnTQsLpEAfLWhwyDfx9r
	 5TdnQabB/fYzHlU9DTGcmcEXWj8yXSTtMznwY6xy2Zdf/ZczQSftYfIlcCM+BOX//5nTZ
	 /8nNHTc5Z9w5tRmgeJFqdDZMBD8jFEJvvD7A+lJQIHVBddCxSC9F4rZFqeaINW3ICHWt1
	 LVWrzqwIJ5mdtMtjeg985JusZuzUmjPOJlP61fRceksrqTeOT8RjXQMUj3BsrUZCJiOqS
	 xNoOMiBm87BpeOB+IFvkgS/Kj1f2OVQtoFvA+MGKQ1Cyqk5K2MxrJ605SC2yJ67rSJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eYprsY36;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7AE606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 15:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B7AE606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eYprsY36
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3550dd02c9cso188498eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 07:34:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793547279; cv=none;
        d=google.com; s=arc-20260327;
        b=FTAVS/JqAHb5boe4FKCPxo4PXNi0+dZmoUey1w55wPGtBZITYIAAM8cDtxOGpPtJWV
         i7jNtSpubu6scykaMbf+gWrkpcpj1HzOxpSso/3aqKMY/LZRn9nhVwWuePrWiONQEJC1
         lQqZ5dR26se4MlTbcibdt2VOGP11ANRrEWNmixCeu2OBxfRI3q1OKWGKK8zfPF3VH1e1
         hDYed4h0AfiGCmRGSwoTsj6xcXUwemJjUdFQaS5m4qHU59CBqztJ9epagLyMHl32ig0c
         0v7w0UzckI9lFRY7xjnmZr4o3OqtOufalu45r+PG3njU+3Ti3UgkFR7X7L//svE5gsQv
         nnNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=psGHhOsIoIp6B+XTiXsNSE0GhyZPqC7AReMe33kXerM=;
        fh=tNe1kwyKyGMMUxhlS4dpKIgAQiYMk9UIIzBgWmMP4dc=;
        b=DKYhdRWGPD4eZJ4R0caUC0ui825FyjtUW119HtOEFCuqBxboYZmnhEV6gz7C8JYG4/
         tGrHUyeMWAIUCf2qbzKxSOZmOZMFC5Nh/vwKhlbxDhr0jlFW0GENRNc8N6ZI+yy51xvj
         UbKyHnMMxYjVyiDuRaygrq4LZBb9k9aDE2k6fFj1cwKuB4oCKNkNFgRQthGo82dx7HD0
         ifMS5UkIoVy3nhz04Di/gbipo4nWQiQuAoR8IzVIOxsU0Td7zDF4zmIEpPhNXmtLZli7
         gsnvSfz6imCO7FQ6ynUsN2mX84AQ9RdK5Aq53No00icz1PcljcP708p5/fZH1qWYt6QM
         SsNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793547279; x=1794152079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=psGHhOsIoIp6B+XTiXsNSE0GhyZPqC7AReMe33kXerM=;
        b=eYprsY36nXzookYULLHmEke8H5GI5P3RmtqXHxJ1MQ1DResE4YG+f97CLR94tUL66h
         AS7XKPPrNS4wmAtiXLg2oRuR1zRuz3w4vCmGa538IkalFwBWlxeh0y0ie8btlDREU4qp
         N2G4QWT/XGiVxK6bXGk9UJdEt49SaZ35Ael3n5eBzasN/u3WfF44pv8IN8iFIHgC8u8H
         ko+ZjD/B/9wLJnd9F0NjfUm72KWWANIO1r8yMaDMTeWHjA8lALh10/UocLtMR/r4c2f2
         ZLCRPbVaLwo2KBblST2c97RQqYh8L/GYy3q29EOYvLaLhwdwEXF8KlINH0nmtEprlkqD
         uU4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793547279; x=1794152079;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=psGHhOsIoIp6B+XTiXsNSE0GhyZPqC7AReMe33kXerM=;
        b=leMNgsO2b98P36QU7oVP6VDcEwcbKCMce1LV8CYi//ccxqrPdCY+/Wc5un46P+SCar
         jY8sbWm83lV7e6IaiwZvEIVnor+C3soiDQzDKHJGGUo1vdVz5GsNbINihj4BLsl2nJ9M
         Yqw4JVxgdGuydfwHVnFlcl1+p0uOT0x5HTGUraRcHjkXU1CH5fHghB0d+o7ixvKomY5K
         1Izy2D44KhU3Oq/xmYJ41phDe29svI3AlZ8YJcr8H76862vcicS3LBiKw7l/bkvZsmsI
         xNOG4xRcYnrPn/UtuneCAO+ZknrO7ctaf1BTiuCBX2IrvzTndjtkUQsSGnGm/0J05Z4w
         NVCg==
X-Forwarded-Encrypted: i=1; AKwUvBzrpm+9Y41h4mTV2cf75ZMc7KOF86YmIXVWE1zUfLkCrQNB/R4NUzWK7vENXdmyIhM+i8dO/5fgdEeS3pQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtV7DhHN2l6LTtKIkQbqn7nccKHb8bCXQfr9dRLgh5DM08MN51
	0LS/GxUUL4CVSBVrzgLvdXxho8iDQomaMjapvjUgLdJLW/qim9KokflkUPELF7Vah4jZwQNnY4O
	Q+byXLreonQ3F4+TjSNVKOqjvmq7wuTE=
X-Gm-Gg: AYBFou1b5H2BKE/OQ4gL1GCMo9sim5YkCMmIpy/7ESARkAtMeBQPNCNp3kQs7JVHeRh
	jO3e3MDESl2O0rc8CoBz/Ibc4afQsSaJkhpN0xEkxLdJ/6MSufaWR91kVAW5vNxIm9YJB6KmdEY
	uEV3YP4qEgNTwbsHNX/edV/hcI9+mnkeI6sdeF+qFpOLdhGcmydkdDkvI80ILMHrAcAOxzJinhF
	3lZ8iUEkgpgGhg2zaqshNJZYiaABLUwe28Y6KVzzK6BinpjEmktC/AFY1T7sgG2rKluvGkET56i
	cdWR93UwKipoLDtAVgLSeeppl4gmTeq22lxmnZVXFoA0Hu0g0g9qDe42LkyRXkP05QbvN14QDZj
	N9SKd/9zvtMPXgTcCeczZbliXddrzETd857SF1zxIaOegpJwz56IAgUH+sub4OExOs7hxCO1gcc
	ZyGzwfUwoO/Wj1AWmCsv6G20mMdNAVtbdzyGRptKWu8aQXBvWMlcSh3Vw1172BQC9dFMKNwQhYC
	sBw48fGHXBhvlClbf4SuBZyeXr9YAMsFX3uE/4kZdr3Fc7s4q8ODFOUcg==
X-Received: by 2002:a05:7300:e9d7:10b0:36a:1452:8da9 with SMTP id
 5a478bee46e88-36a4231f759mr20462458eec.1.1793547278227; Sun, 01 Nov 2026
 07:34:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <27b58e47-723b-4d67-a1f0-ccb8b0ae66a9@kernel.dk> <20261031152846.746656-1-sashal@kernel.org>
In-Reply-To: <20261031152846.746656-1-sashal@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 1 Nov 2026 16:34:25 +0100
X-Gm-Features: AclHuK9CG-B0tjlQR-Ajve19cMS08Wyi0a0Q-isF9a0uhX3oTI1dOa50vKFtVEI
Message-ID: <CANiq72kK9p_eUwa9BY1pYoidRqsORXhd-YDu3SVpnAmrMQm5gw@mail.gmail.com>
Subject: Re: [PATCH] rust: bindings: derive Zeroable for bindgen's opaque
 array wrappers
To: Sasha Levin <sashal@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Josef Bacik <josef@toxicpanda.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 4:28=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
>   error[E0277]: the trait bound `bindings::__BindgenOpaqueArray8<[u8; 72]=
>: pin_init::Zeroable` is not satisfied
>     --> rust/kernel/block/mq/tag_set.rs:41:49

Reported-by: Nathan Chancellor <nathan@kernel.org>
Closes: https://lore.kernel.org/rust-for-linux/20261030223702.GA1673281@ax1=
62/

Cheers,
Miguel
