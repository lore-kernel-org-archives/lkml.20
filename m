Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793282773;
	b=45CKprMdxwvpgkNpb9etDHo+NxZCHWFmPQyKFTLtiRYZmoYYRh2EVg2zIXPvzIuxNp93
	 /XxRbUl0DMqVxoLQ66F5lDmTMayuwM57vVweWKpp02LxoPg9syKpw0duAt3w0v+Y+64eC
	 IIE1sAWSeLUgl2+qwDKaS7aRDpxQjj0SEnMfxAkV7FRGFC6K37C2vlUo652SBCySHwhWJ
	 QB3Xkt8tB3OZzIgY3qm7CFe6U/Xz6WneuEZdRoZjfy+HjnLGYxPoLLmPYaVGzQ3EmB0MY
	 g+CM69D724QMVDgt8bnqC3M8euNeJRlXl2eWOz2IK3JTqxI5/5Gcfu/WboFfUe/yjeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5AFMA62x81Eod9qLhy82JE4hw8ngyRnLnh0416nT1Yg=;
	b=GnLctdH52gJwR50H5KbqGgV0128MVC7ozL0ZP32Ld8rQTTTaW1IZauYH4HvmWCvv4uQs
	 +gCL5LkB+5cTBG03a22B5S6wVvdpu13eQ5AshjqVoNNCREQn/woNWbQ/ubkLBibgnYe+y
	 62Z4LF9evtUHN+XTXtDoSJ0Hl1e96oDztbJHs6382xakdxzXfjb1pNMyhjzWQJXYWZ/qF
	 P2eTvIdg1A7zycZI8BhqkmScAkCsi/Dw9KG7z+wxY7T9qekxdvbUfmVM8hglCIm3XeMRl
	 Rcr7sEsH1m7mI6InAURxPb4qvCy/TGPB9SzS38QDUEQF3A9/drYY7+/FR5fOGzlKA5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PUMIvSwQ;
	arc=fail smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3F0606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD3F0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PUMIvSwQ
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-353804b591eso3341987eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:06:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793282772; cv=none;
        d=google.com; s=arc-20260327;
        b=fZTTYbt8g/Oqx0rYXCIwMJhQ32Necn/vTmhUtVf+spX6ZZmqIao+o+MwUuJ5Oq2ba9
         OiYzzCwvzq4foeKoM6iKPCeHGXlpb6gjC/XGKoI8zwgyS2dN2jh47dVJel+VLcT1Xe0X
         +FVbeLSM7uTuNFdLX0y652B5Gg/70//mXzbwq7nRDkjmHyR4Kq8OFM3y2EcRMArjqsWp
         w69T5PLJRlCwOIdCc2W7w+zBhPsUssnlQZmGI9OnuzcFQYQA1UYoYyxOf4pXuUIwzpDV
         cwdnEKx1QjNdUSXpE21euY7A+3Va8Zk7w0iBFtjt7J86YclSbefKZmhe3G5RfBYBDnEb
         akpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5AFMA62x81Eod9qLhy82JE4hw8ngyRnLnh0416nT1Yg=;
        fh=i7wDo0tU906hhE62ThCoWbw8Zz04CTFNDtvB6c2rR5s=;
        b=jj8YGWI2WFLRafU2qTkgrfL26eMBk4XlmvWOd4nRoEcyeZtw3aTVkiC2OhU7bebPRs
         8RIzHvmeNM3YSRjBGUzzgedd2rL0fCD6tmYbEc2vUbJxeEa10M+3VvZ01HVuKNDBT0dp
         lFw/Pl8UL/QHiiEQTRwKb9oqMSgzVRxItMZleqIxeTpFuvPe86Gui+68pCMAQXeSzELj
         7QvrWZiH5YKD/XPWUrPPY1YKN+b9HxuU/TZFlR3C56KgXr9xFrKadB0fRd7y2otv0BVo
         hv4hHTbzso+nxbRdORUqpuYp7IK2UaFNVmuD06wV8YWFatRsZrU+/mewDXtjkPBHuS9l
         2NKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793282772; x=1793887572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5AFMA62x81Eod9qLhy82JE4hw8ngyRnLnh0416nT1Yg=;
        b=PUMIvSwQU+R4CLSlB5Lx/jStEGM2g7fWdLaGdT88RoWpXvqMpGBFUnGMn2je4Drajj
         zKzZ/hcw+7aDkUlZ/mLyWEAepcg+lcT2wAP9YwRBYWCHSm1fGMKyYQHabWrLx0tfNecl
         ZgT/Fr+HfZJcaDm5h0++hm+hv05vSxLNZmr+n+rexbNQKK/oTL0E1qhRj9DnN9pa1IzP
         59zS2mtCLGf6oE8pmIY0NttEBy+BRG6jCoqzuUu0RbrqveTk5tPtZCo6/mlPDaA5gbhR
         OBhC58I/7yWrg1nDGhyv0T5mjPl9FUGXaGN49B6cE6vUwOWF4pqrp6UArrajWppcGDSx
         gKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793282772; x=1793887572;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5AFMA62x81Eod9qLhy82JE4hw8ngyRnLnh0416nT1Yg=;
        b=t0vUHQ9+yBq4kISevsnu5Q/uAiWHDwSP4bxmIIEcZx2wY4FsWBmn8wXtoZGUE7XdUl
         bU++7TXt3XV0Wq9qzc+gSaum5rQ+Vs3rW3wDO7wlCkJaChgWDv1wrKFTKkQNPyQ2xZqo
         afS52WbXCnahcMFu8V1WrRlYtp3WbxV1g0ElFRWVHZKEC8ZXv1k84SkmHNahRjj6gTB6
         ZycH4kYoxmmuDDb6cvLxrqcfWQOW7fFmeuZBWaT8nWxv4vjZQsMBitJyyoap8dOHJs8P
         VVAQCo4AoTeHzMQ4ft7cfyVgP5ccjchNCYMTQ3vIjrXCoN9pQiucembKCzNIzpuKXiM7
         KCnQ==
X-Forwarded-Encrypted: i=1; AKwUvByzUreyXZBgCRQownt8NutbWTi9Hb0DKmvdOkuZSQXOy9V8sM/G/LtHmLiO/Rc6bR3lkt4pvWBDxEjc6CA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8HImqQYTc6QM6XGOiRANf8T6nLbCR4qzIh+Y+tFTtrscXSW4e
	tQ+/M0Jylc2xJ0bS0/R30IlQ+MLibdHV+/dTmovnfPoMlgDRQNduNB6dSpztz/rEnTRW7YsHg/b
	iD+X4m7wZI7yIX8yHPRscYJFE1UhSnhFKpv3pTX6G
X-Gm-Gg: AYBFou3AycX74c0rhCWbCaFYuQ7s8DXWj4EgSr647PMvASU6SCWyS/nVa0u2D8R4wbC
	/u52aYIRegnK+xQN95Z5tsmJUpRNSgjPhiCmeTDpc5YR/1z6Y6e4LDGF06yj/R5A9D4GHcWYDPI
	SwmxuiodExNzS2WidwykpToVNShN/XXE+Eaim75VrzpNGDU2M64zst1vp39lbpQEwhb1DLnKFkG
	7wWMO3Ro7dNaAsCVzlRntA8dj2BNtCSN0XUrTknxACKKrN69ipxUBlr2nwCWxeaWiJ4nW9W73A5
	x4ot1Dam2o1SVvEiDjOAjsr9Jf9nHgNtc7qA+gH3Ne9SbRrtu1XUa4LAuuSPudqVj9oymXp0+2k
	pFaflOR3R4ELi8LaO1owFMJ8+XEXMbqk29v58PkhzAaovtbC9ui2UZkNu2l3gA2TnjoprwoW4BB
	oyM1gSdRFQkfhxCI73JVm1nTo27wzFyTam6fNrp03zwxzMtELT8+0EO3QM7zJTWZ+j
X-Received: by 2002:a05:693c:87d0:20b0:369:daea:812a with SMTP id
 5a478bee46e88-36a203e04ebmr7980604eec.30.1793282771027; Thu, 29 Oct 2026
 07:06:11 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022162116.2282295-2-phasta@kernel.org>
In-Reply-To: <20261022162116.2282295-2-phasta@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 29 Oct 2026 15:05:53 +0100
X-Gm-Features: AclHuK_SoizvoU1-Dr6Iy33-0wETUO3c6OG-X77GiKNsKuJD9voK4ASEhNNET7I
Message-ID: <CAH5fLgiDRJuid2usngucBVNd4tP3R6Xavx-WWoKpN7xMQqv+zQ@mail.gmail.com>
Subject: Re: [PATCH] rust: DmaFence: Implement Deref for FenceContext
To: Philipp Stanner <phasta@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 6:21=E2=80=AFPM Philipp Stanner <phasta@kernel.org>=
 wrote:
>
> A FenceContext carries data, which the user should be able to access.
>
> Implement Deref for FenceContext.
>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
