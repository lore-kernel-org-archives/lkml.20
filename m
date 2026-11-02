Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793651483;
	b=kSzddCbo/AlqBOBpU8LxQndLdeUQdL4j6C2uHPaovlIL9cp+1o5aC1oUBMQg2ZtN9qW+
	 n4qGzw0pVtJYkZWGQzBUU7mn+cUedE2hYWOnS6bMtGZEYnZXkc28GO58N7FG5TC9T33Q2
	 m/CwvesmHN39oLHI1Sggws13BgGAfKmZ93XVE5PEgJUyK/4KYHZ5A99XFOZd78BiOVxbg
	 XpGbGfppJHU3dNiu63f6gExRWsgNp0UW5MhADv+JmKyT+M/tSwqnojasTNDPnxnjzm8Hc
	 +/RACiYCYPLD3TvRRQgPVgOFGkMFInG+m+ELzdgaMI8Q38yP/z6Hoisw5KsZNelURzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793651483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5RwrqFV+JAK3ySp9u6e0Zx2PkbN0JduCY8deT2c09So=;
	b=B6od8LZ0h9PH1+Uxf9X05a5MPEsO5nXpex8JbL2sJ2/+v52Yh/VtMDQNlHPkrUg++NNp
	 1zp/uWJVw0tYg0d680AY4X2z+mCVdE/Y9fcL5lW5baYTxJi2udNpaqT7VR5CmSf4SB+J5
	 xYfLtY6mT8Z/F9p1XWLTTBiQmza1y6kwC/sm3OaDJCfq+1UGmr2msbym/g12pLJE30pKe
	 iGSl5kORTmNpwjvv1MyPGbMZX04Gw2JuTCwyaau06E/7Y9neHBSJsZzSdu2x/zIsGrSdu
	 lCd2n/w7gFVM27al9CJ3s5OQYfq4cl+psGw9uNYEy5U+qawo7cq3A78Xw1LQ1VuCPew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RHJlzlK9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CDE606A331
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76CDE606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RHJlzlK9
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so2077a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:31:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793651481; cv=none;
        d=google.com; s=arc-20260327;
        b=mjqW/xuaIlEB9eg4F8Az+5nM078+74trz7Zy4RO64ffTupOLmQhm6gaucgcfZv4x+d
         wacFD1p7PubwBZc2ErMWrvI4Ouj15p5ymyljryj3TbBnejC7kFeHXEjdh2TFXJgcchzZ
         XqhKFcnHrVGC+zMOof5O+JqrAsOx+lWDjhH15gbhLdP/s/u0lxyHUSlWXiklBeL9N4Ld
         PLI/0OS1Y1rx8IJIhjtvcL6WgnsCqfrDAU3QbunOV5X5zQLoxnyRDlsJCZ/rFlvvcHyO
         OBqXxpT/VqKJWL/ufSxSWFpmWrMYAApT7MYnE/TslxPJ7Dp1j+nisrkO/tKdCkf0B27c
         dlGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5RwrqFV+JAK3ySp9u6e0Zx2PkbN0JduCY8deT2c09So=;
        fh=20m4Ra+ZJhzpOSCau4y29XTZP6VVdsd7/SKVqaRlWKQ=;
        b=GBGyPJwozFH8FA+T9VUBIz9dL2uhGAuwGplFXmuNHEVBsKDEp3vsB3bZHhxESqhaTQ
         XZX8DEJ/OvFlpiT+Hx/ERassM4+65wY4vw2VKlDe36pDh8iIJDIpnHlnFsdCYItoPsiv
         K3kWY7x5965OiH/cKpL/fN2NrjfsXKbquHlzFZkNI5PaVVxNGo/ZsDnYJuh5Byv2SSTj
         UFQawWrnFEPgQB/lNgozFtzraFV/eKHRNOU1E6jEiNWsX3WNyoQ0Q9dNHGPj7DRarv/k
         lgtGb5LcnnPgj+zuj1lJuVfVC23H/HV7wRW9jTOmer/O2EwoMY6wVbp5kwCHt+rnhKxw
         SAHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793651481; x=1794256281; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5RwrqFV+JAK3ySp9u6e0Zx2PkbN0JduCY8deT2c09So=;
        b=RHJlzlK97bzgvXNW3xL3lDaxN4w+2qFJE1LvMY2LQLzINz9zP/BXIKEYZFP8bTVh+A
         EuulrRQH2guD6Utn/XukATUgp1NTEYUsdzmamqkRjQqZiDi9K2SIsNujmk46Qm5y6JZf
         uIFSGrR990BOymBXHS1Tszzj4O86/1RwSR8bRNWPN2MZgA6SHuPNrcuPBptrZ5rhkepq
         lFcQtooLnqodgchqyzmjsOI+7faMvfesXvFaJ8Al5opVkj1T7uoos8Pe2du1wsPrZi1t
         w5DMRvVWUzkOF2Pn1RzYh0i2fUWXYvngpVGHQ4W8qiTOWH71A2iNPDwDZ+DiK4LqnDDM
         h3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793651481; x=1794256281;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5RwrqFV+JAK3ySp9u6e0Zx2PkbN0JduCY8deT2c09So=;
        b=JPj+g9pRrNNb0vXKtHuu5S/wRHWpRHj/sHee//IkKlpBZhjaL8pw1QTfIZTiLbjPrg
         I3QgROmzrcLZcfXJJqn/F+7CRN8deIzI6iK3CVfLkzZvSVgbqHClhcdNxTX6GR7We2SQ
         qe7biPz+E9scsF49bYDT4JEZPeG6vPiPjsfQW4mrplI1+gKXK4qqCiFLBZu3o7NH/vzP
         TdcB3C22H4KBBCCxt+V34l0vy5B1pgHOv8RPkRKZPKUxRQuPrOl0dHSVVhAzWxH5EgJh
         YQO0hUnjkWrJyvT6G89vlQaRY9MhWj/z8KE23hAUnR6xURHbFsEmy5zxNO3gzJlBnhyu
         40Pw==
X-Forwarded-Encrypted: i=1; AKwUvBxvfq81uWJxk5aqk+XcPSYNsAhYgGkULKgVniIS5Scijf0+t35prg/vzU3ZM2bBW8F31Lj0C3IdfZq2RAg=@vger.kernel.org
X-Gm-Message-State: APuU4Z82P3uBj2DtZkFtN+lxykNdwlmEWr9enu+gLwQVd7sKtDLtlS/5
	BRWaJtEcgh0CCKg7udQNNMwb2ZIIgCc5g2dyx/2WUJAsNbu3VqPQvFhxWpNcfsjXVJCIu+tkT14
	bAfw203ABnVyGQvcnMp8GxiTdFIVsQynAhUjEAWj3
X-Gm-Gg: AYBFou0SPXBCS8fPAWdH45B3oeEjsKeUjpjEr+4lMniDUyNjuMSJbP/rkAnFNeSfV1C
	yoNiaVDpv9pHQpAo10nrkJYyhSr4aUCnHcbPtaTgdG5zziomEpYh40YkpTDbHMC+8itjmSrQvjf
	9NvYkhrxW31GSh/87xS8EpWJJ/bDZXh1DqiWhXJQ8PF6c1VH6NiViOwWDZX/tBKDrODeyb+gkg3
	IrstIjQUV3tmyGby3x00TnWW+ym4pAbZW1l4y9si/KtHku7RqNu+6smJdHIuPaXshMjviIbebde
	hjEPbomFKuBwu1HYlbV2LKfQqbDISs6NhDfBMjhFZ2PqH/KB/+FVC37MyYV1YC0ecGCsgudOtsf
	qxEv9amSQc8zx1C+E3d8AsYiLfdnMdmbjrRm+zxOrG3nuyjlkus1bHburQZ7qzB1wB9g=
X-Received: by 2002:a05:6402:20cc:10b0:6a6:7dff:61ab with SMTP id
 4fb4d7f45d1cf-6b4b42b3ef0mr308863a12.15.1793651480477; Mon, 02 Nov 2026
 12:31:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102191438.1059771-1-sdf@fomichev.me> <20261102191438.1059771-5-sdf@fomichev.me>
In-Reply-To: <20261102191438.1059771-5-sdf@fomichev.me>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 2 Nov 2026 12:31:08 -0800
X-Gm-Features: AclHuK9XRqRq9bYvRVLxJXUkdgt5z_NPqmaDip-9Zrh7UQsi494jQFBIdl60e9Q
Message-ID: <CAHS8izP6BmNJLUdKR0DpqieOVXreR7ycKWmVbtbBtP-kHy7HOg@mail.gmail.com>
Subject: Re: [PATCH net-next 4/7] net: devmem: add a per-device netmem TX frag
 size limit
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch, 
	edumazet@kernel.org, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, michael.chan@broadcom.com, 
	pavan.chebbi@broadcom.com, sdf@fomichev.me, bobbyeshleman@meta.com, 
	asml.silence@gmail.com, daniel@iogearbox.net, razor@blackwall.org, 
	leitao@debian.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 11:14=E2=80=AFAM Stanislav Fomichev <sdf.kernel@gmai=
l.com> wrote:
>
> Devmem TX frags are bounded only by the net_iov size, which is about
> to grow up to 2MB, more than some devices can describe in a single TX
> descriptor.
>
> Add netmem_tx_max_frag_size, U32_MAX by default, and cap devmem TX
> frags to the limit of the device the binding is attached to.
>
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>

Abstractly LGTM but I'm not sure why this is TX-specific. Didn't we
add non-PAGE_SIZE rx net-iovs? This should have been a problem then.
Either you know what you're doing (maybe document in the commit
message) or we need some more alignment on RX and TX.

TBH I was dissapointed when LLMs started reporting that
binding->vdev/dev are treated very differently for RX and TX and I
have to write a cleanup that consolidates this:

https://github.com/mina/linux/compare/devmem-teardown-v4...devmem-lease-bin=
d-map-dev

I think maybe my reviews and yours maybe should be more mindful about
keeping these memory things consolidated and as much as possible not
RX/TX specific.

--=20
Thanks,
Mina
