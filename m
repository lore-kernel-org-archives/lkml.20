Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792683717;
	b=rMrF5YwHJI0DwQnHaDaigq0idCZeeOuTcGpMEqd2Yox5B3p343Kv/UVmLvPtj60MlDYP
	 /nJ3rseZf6EwC7Y2VcCi7RUcYZsIQhT6D0uxc3XFcW5FQivv6kTXSB5AL8Y4nJZu9JXVM
	 8Ql/PxElHSy9L4iQwhiGv2dpscIdONKgDY27qjvZsbDmIiI9lVhBBORKAcELLcFveE2S5
	 Vjl3kMgKZW9ZU7MIDu1KLn9wO1LMCQl0CF5sNlg6ox6aa2eYkjBAPq51OxYE+9UpMcV4+
	 k6utzGLZTqr+aSgHjTG0AI99FSAl0TfTmKDxus/RYAabacfK/DX4nrJ2jyHaBLpam8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792683717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zA/mm9rb6v0PXkga2C3gcDW9NUOTKUUtrwcsHol3f4A=;
	b=5J2z89qcB9sXFOYOZA4J7ttQT2jGlP0KwcccvMUzWmVKRkCW6sFAzGvuifO5pBcLhSLy
	 7+EKf/nuApHxAIqooSbP1ecxQx0+rtXgFcBxtDT664xEUYqbpKECPUwE+ThPBNVjY4Moh
	 prIsUQ18L+uR2ff8VCAvX5mJ9OKx/HNmCnP1zo9a9QvxFVgwiTUiVKUoHQS1rzZoB+ImG
	 lnig/ACuTs/3Bl+fGCJ2R5wjl4edXOL8rd5+E0q7ZutiNW8ZwlyNlewI+W7OJ8lbA8Bfg
	 9fuCI33L/gNdBtNbzkeQJVUDJAN7/ZoKwEir8ffmfAeMX9tg+Y5MNb9BsebXmis3iGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ZE7yvOJA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B95606A324
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:41:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26B95606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ZE7yvOJA
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so14894a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:41:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792683715; cv=none;
        d=google.com; s=arc-20260327;
        b=BThDdX8xVKU/ygS72QMXb5+dU5pHONnvBrfOAeuMGFi21lb+Nn/T2R8Zvb93qq7AKI
         HTFkDeVXvfQ5D5vEzLeGj0u6+tLx9UI9Rhpu5PXkRPjogR9xociC63DKA/H9eLOe1Fg1
         KIFGcP1AgwwAGxQT1NekAMLwaJ8GwoqEj0mpIVJNAhQXWBoUq70Rp4630qTKtNeAsx6o
         YPsWWlPN92h1kna/oj3A5nQvVoZmTcWt6tCnRYIqsp2eS3kCdmdr6WgMm/plM+xbvNdW
         baAKouzOtS8jAInltM/lS1RjeYd6C//UumWwJFnjTxjst8oX9Ic5UatJuTv8xXqBX9im
         5fmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zA/mm9rb6v0PXkga2C3gcDW9NUOTKUUtrwcsHol3f4A=;
        fh=458AKL+rPd/HTeIgyl0r0x95gAy0f8sIjXOr5QKH7Uc=;
        b=VHaY9xtKiKsPK5jfccz8DANx5OoCRq5+Ze9H5o3cvj9AupoFXKHsAwEu3ukDRT1+2O
         NCTF+BDKPNIFNnufCxRY9i6/LOY75TivUqTkNCsJy9YiBJfBOltdGMWo0UxNsV5kAt2p
         Gkrad8QdoAbulPRhQhLSfrCUlEv+1lPkmNyqlggSuuHrZA3v7AkugWv5Sn1XGGbimK8R
         +0I+vA76pdjtNxsy2klHUlTPFrnQpI/10NAFUQCBxShvLjqLHsa7kE4T1J8E9gHQpWhy
         CF7qa9AUiSlJ4D6m7HSSGC6+ktZ7meXNfmKqzg6tc6ERaNq0XtWYTkSz5GdKkxpBv9dq
         Fl0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792683715; x=1793288515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zA/mm9rb6v0PXkga2C3gcDW9NUOTKUUtrwcsHol3f4A=;
        b=ZE7yvOJAXvirByTnY1Vkt27fJmKkbeM5kXZgy9I6V8zc3FR5ZUPfim62uiMjPuAUOE
         6SPRwRldc/SKrFbkdXf4hRf1/c3O03pzePfvS0r71ba+enBaOiJAbZPPhMOVNCWBHZ/3
         4tVMMjYEO5ZMp0D2z+Ije+fZYXBCho9JUorRY966hydJ1JMEmhe1Q61r8qlwZrET6WFD
         +Vf85mxjx/J3HPmeM6cqVMjUUHo/y5qg8EXcl++6krOhRkzZ7rzWYua95XHaGKgRYIU5
         tGft8vrtYkKSv7UR7+/AfReVLt6gzEKNR/8xFbF0uvf+i2HNlZavauOVkq5m0veX/JjR
         FWaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792683715; x=1793288515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zA/mm9rb6v0PXkga2C3gcDW9NUOTKUUtrwcsHol3f4A=;
        b=teMkLF0sq7jWlei+QzYREygYadWhAIOQvuC+gUKVELGNAEnv2gMyG5OqY/RLVW7Stk
         0lK8gmkwnRoriLtAJUr8dY+e1JXxBESVj7QrZP8fCRF0uZ+MkltDNviJw724DGtzRZZ2
         //X6ccWAouVXRa8XaEbrqW+RGH5tuUB3BAj6oveUwf9kxwVygtbjUMv7CbUzN89hHtLA
         b/RknQo6JPxlSilc4aeZaezhB+NU8kFvjFCiE149DbTMqvfPdTPHqAfa+GuHQwPBLA2h
         ca64RqOfewdQFX3zZr/pdOs/jsaV1YwB2zGjp+BxZ4Iprclu/Cp9ZDqao+0SsWeBr3dR
         FF9A==
X-Forwarded-Encrypted: i=1; AKwUvByiQ6b0WpNhhTsOVaq7nLem4hJ9P3qseqUho3jsuegO+iwAJvKDTZqZx6kp4NCmRGaJjbiN/DGZQhT4R4o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKU6elRCsr2pRJMuc2KvMyvg3sL+oK/FYBIsUftwW5uybI8QmyX
	pJ5q92QT+b7P2IQjwUDO/vumq/8cZEiU3Sil2qsYTyQv2UWJvTdA7fjL4dqvqSbSe+KLJoq55iA
	aHB/cgWglVR+S4GU2SCujiwb254tBkRG2+29IMYUeEQd/ElPGVCKgPJD5
X-Gm-Gg: AYBFou2vsjM1kqkyiOG/pzSGtd7dS818QhRa5uvvKTeIxUv9iODaJc59x7nODMDgZxK
	c2/5H8uDhIkv8xueZzsPnrjvbzXeW5t/fzU2S6KvOy1LMmHKgvrXaBCsRaI9x4gspEvQ1nRs8sE
	oERuT91Y+2OUw+0cJWBjJMdzuOO3iGDIPwkNx+GeeneDvjbRWrb61dDTvkw4t4axmP1XEgwMzFW
	MXv+zuMguSK9tRs8Jpfo9rgD3UVniAtyEY5xNxOuEVuLQXIgudjdCbVB6LN6ti7WeDW9ZPwtXdT
	KVnQOU0whXyGPYQw1fPJWDGyt9rmVFduZN/l+Hl5UUyqS2o6mZdUINhx60s5iiCgUlzG6hTI00K
	TgCdwxp5kv26lzjzaOX/jJSqpE/Id5rxyDYIT74OUsizciklfJMz6qx31JLkBDb454BWj1INikH
	uwCZc8ofiVAHk1lQ==
X-Received: by 2002:a05:6402:8d8:b0:6a6:7dff:61ab with SMTP id
 4fb4d7f45d1cf-6b42037090amr51165a12.15.1792683714889; Thu, 22 Oct 2026
 08:41:54 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015163915.1166043-1-almasrymina@google.com>
 <20261015163915.1166043-4-almasrymina@google.com> <20261020121858.3b9107c5@kernel.org>
 <CAHS8izPwWT+vbgAe49m5vXsRxT3unbfjLTkVZBScgAPdQTo2dQ@mail.gmail.com> <20261021132304.23e0a4e7@kernel.org>
In-Reply-To: <20261021132304.23e0a4e7@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 22 Oct 2026 08:41:43 -0700
X-Gm-Features: AclHuK8XnKCgw_zM2po_QzMrph49LXNIEmHOTKG5LdhHg2Whq1BLNJdt4N18LfA
Message-ID: <CAHS8izN_N25mm9vALax+P+W45gyxVoMbZoTXW3r6nPC2Z0A7JQ@mail.gmail.com>
Subject: Re: [PATCH net v4 3/4] netdevsim: support devmem RX and TX bindings
To: Jakub Kicinski <kuba@kernel.org>
Cc: Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf@fomichev.me>, Taehee Yoo <ap420073@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Tariq Toukan <tariqt@nvidia.com>, 
	Kaifeng Wang <kaifengw@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 1:23=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Tue, 20 Oct 2026 23:17:34 -0700 Mina Almasry wrote:
> > But on the other hand the test coverage is nice, and maybe one day if
> > we add enough devmem support in netdevsim we'll be able to fuzz the
> > data path or something. Is there a way to get the best of both worlds?
> > Like put a comment on top of netdevsim that this is test simulator
> > device and any missing functionality and/or bugs in it should be
> > medium criticality max or something? Or is it too much trouble and I
> > should drop the netdevsim support and tests?
>
> I already strip Fixes tags and apply the patches to net-next.
> But it's still a burden. If you're signing up to fix the issues /
> review the slop we can try.

I'm more than happy to help but I'm not sure what you have
specifically in mind. What I was going to do is put a comment/readme
in drivers/net/netdevsim with a note to sashiko and LLMs, "this is a
netdev simulator, used for testing; do not call out missing or
incomplete functionality as bugs." And then hope that the LLMs and
sashiko pick the directive. If not, I can tell patch submitters to
ignore sashiko code review bug findings in netdevsim. Is that
sufficient, or do you need something else from me?

And we can always revert the added devmem supprot in netdev sim if it
becomes an issue.

--=20
Thanks,
Mina
