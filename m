Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792583069;
	b=BaywSfAMa/FrxLtdAASyOSj6WUdO7kAEEG/ei3dxc/gaCq7tcEM7pLqTypP/sZdlk5N1
	 Qi0O0BWxTM9TawesZ5372GwJQ/i1I4Od7HxZByMam1qzBwNTJM1+DqngDvUql3NPBb6AE
	 d+JERVOl6daiOBZduwmDfyh7zdnP9y8+VCkwgnJJkrqW+K5hcvoqt88BGrFbtQ6s7ka9f
	 pmzi8MpfzxbMEcl1HKTVL7DLkbx3EWdW8zhSI3ALkcHiwl4Z3OB6NUpJrayPWKn7rtMe6
	 qOqQqH3qauRYpwUtVXycLqOenyvYD84aCVtm4HmPRsrDQkmVnXQUWPieIc078KZre0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZZYr3eBHIRZzy2m2KZECWH5MwINu9our1XGNLE3fKJc=;
	b=gDcVnAVjoziW7V0OCky29BV0UB8vbm6mDx2oewNC8F27SvMPsbfEhTS7fc9P3T6vywBV
	 lB/qYtVsH1w9EXp3mAkpgLM9QrSBHmTzQlvjByr4AUIy07ErojRsIxO6kHR+66t9rjtKE
	 N5qEPCTP7ZfRZ0dHufFeaxUacAoHiH7dyWxbufkAelKXLtDH1u/hQZZxxgeD0ZPSjZaFC
	 QZgYgEUZeQM1OScQ2Pd8RnID7P8HJLOorcPPOVr9FRtEP3xiFefyrFS9XGJ7sSAyctkCr
	 Lxzf6uSFLn04jUyFVFS99KR4/fPuesYNBjfRSWK5K/LGGRoTWEuepqlwDFgrobN+ixw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="rB/f5s/3";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AF6606A327
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24AF6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=rB/f5s/3
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b060ec084so491178f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:44:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792583067; cv=none;
        d=google.com; s=arc-20260327;
        b=RBffH/EOFd2PJ6SFOjdDkMJrKAiMYOzvRR23ltqJL+C8IxH7pyJDUoPo6l16/VZ9zl
         hhpwtFhY6gHEGC+GMeE+p+44P+jY/tLBdMo7xqacm0JcWeXTRAYxxKOKj1KYWGKkL0f/
         zud2FWVtXYvaidXoa9P7VZkl13r/tH+L4N0AIBFXVaDyBfxxYVxTnM5TmZ50+CAnL/CD
         cj4xjTanxxbvVdBXL+ge+nZL8GCxgpN5ITnFtl5UWDDJ8qQWAKtfkg9ACeLWshxxukBr
         7oHZ9nqo++FtRA0Eg7BXFP6YD5yRtHHaFVLv4oheMARt8lNFq8VPUuB0/tq5L9UXnYvq
         KTNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZZYr3eBHIRZzy2m2KZECWH5MwINu9our1XGNLE3fKJc=;
        fh=kmzQHM7zGIUA8caacXw7/Ynqx/AnY4RZTy0Na0iJ/9U=;
        b=o3s/tS08mDZrwpW5U4SmxKn0FIxasw4XLuAdWf/cO71oNDTCNgA5lPQc1T9SYSjXok
         pUI2F4ubw60xROfflJ5HEX32vjMAhr6AAFq/69xtzwUPm5Bb00aWH2kw5f43CGzFSGBo
         qp+BbloZ48mGfimiL2J/XHXf3G9Btv0ALyxU3VFjo09tLICNeEK9mGXy0j52RcyYsPEp
         bMjWyduM7pHHIRJvYiCOlnFKTW7BG6ZOy99tuGMPmvcNANybZ74glLG+T9aMVDkfCpRX
         W6vaal0oKobQyghcsWJUgsmOGIY7KUK2P722x5Gvzk6zpuZvzd+fadBIrnmOv0yiu1Mj
         8g1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792583067; x=1793187867; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZZYr3eBHIRZzy2m2KZECWH5MwINu9our1XGNLE3fKJc=;
        b=rB/f5s/3KXMi3vhEFQEoLtDmJ0sq3Ikz3QY+vqIS7vfGlsLt2LkJj3OPKHGkoJV/Dk
         CplUP6JE5o8MQfFOaoDna9iSqn+BPLaOD76ilDkG6Nl876omMSxF90riVt2vWUU3r9K6
         +YVvstpPnJamx7Nf/PujZA9B82Ai4V8n5guq+/dMy+QkQOtsjOclnkaHVSkz4OCTgM39
         y9fv+WVecunLmTGNvuY1vB4CeWIncjVQofY0GULRStoeNFNem45kMr4CPKnbl1Y9W/La
         2IQoGD8nZgNYjOuiB0g7CCgEcN0bhoA0WcWgfalXfc8tH7BLQYqA2Y0gfPfyuXBAHm8w
         np2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792583067; x=1793187867;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZZYr3eBHIRZzy2m2KZECWH5MwINu9our1XGNLE3fKJc=;
        b=aKEvkUeda6LO6tW7jSg+bFNzpHXWxUOa8wfVKwYikfE7ATH8Rmn0KAYJsdY1synA9s
         4qTG10v93V6oINYlUF3zUn9MtIMkNUmfiegTHJJ2gTSz7lslYd6aExiK4bNSaQTJwOUC
         Nppq+/FijJ8VDWYwpsTswiZGuk2dbiHKAKPvYsD4pPx6hQ/h3CmInt0RtcVMD9N+fCP9
         sB5j5CjwvlHNhaxY/P6ea9wDoLSYMngA0+hqYzeSmwN60vfyfNtnDFj12unUXLAhWaqP
         TQPO19CGxJQ3TwhaWIuw0+N1F+hKgFT2Dh+5lVx5c4RJbrubCK+ZISC5sMjoO36+CWeT
         /iGw==
X-Forwarded-Encrypted: i=1; AKwUvByIebSpWG6VizE74L/8uDtkQNb7N3ttXU1/RLTwaZ7L4R/6RsN30jP5ZzS4OLvTPEKNRz4Nm7q4b6Ey3jM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6oj2YiW8ysc5qY22Mgth+Z//RnKnprx+jj1LJo8JOij+L+5YO
	PgfIvNYSXmAUPhP0eM71Ty7b9MWVdMPdwiZ01/2jf1M1C03BA9y+Hr/KZrag5qHS3G5+JuS6j29
	OxZV2vRUjfszyRQ2LCWYlNe5A6R5mw4GXaL8eWEHc
X-Gm-Gg: AYBFou1aKoPKTE3g1IT0J2YRT7vhVqRrdoDGWagSvi1x7h6wf+ub8ZZH9knqmWvWEd9
	tNAs3VLKqYalhyqpKXz+tK0xRZ3FkvfUQIvp6KZMFs68DYg6XN5VGsekXxIJFX0Lp36U16j7R7n
	HD1KxtpysXxqNXgjYv2A3H6709qtyNfc+NR8BgfTP/Q+gnDhTQFfMPtaytH6sB+fqcThcYH/pWg
	nrlosB+QXdM7jNvkmhHeiz+G6RCnG2ewtlbt77QlA4sp9bdj09H5SjHda2GL2e9N4/syBPTXvsX
	VuIUtguvbyGlSxCuQvAxnTIdJyUUuKxzBYuTqd1ZJhpjhJuz/56Bex1mR3Qplyxynt+QE1ch/pj
	BAqS7wuxGu+Om3ul7Ip1hYy8q/TschQG1AZ4HwKhzgelT12ivbb+Tsx20XS8aH1q+2WdcU1XAXp
	LeyW5xGKwyA/V6CPLcaztWTnrUmQjCDY8lMUBA3nRx95Wn4w==
X-Received: by 2002:a05:6000:4a0f:b0:48b:e50:7159 with SMTP id
 ffacd0b85a97d-48e264adfafmr3173042f8f.30.1792583065670; Wed, 21 Oct 2026
 04:44:25 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-b4-gpu_info_intobytes-v5-0-3e0c7c93223c@collabora.com>
 <20261020-b4-gpu_info_intobytes-v5-1-3e0c7c93223c@collabora.com>
 <athToIRyTjSB_jVg@google.com> <CANiq72nP1cXVOQp0xciGfBhZZfEfNP5hx8c+1ZPhXwrr=EOUGA@mail.gmail.com>
In-Reply-To: <CANiq72nP1cXVOQp0xciGfBhZZfEfNP5hx8c+1ZPhXwrr=EOUGA@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 21 Oct 2026 13:44:12 +0200
X-Gm-Features: AclHuK8jFkj1SdL-sn9s7gZYVhHgWgNf9M81gFX7u1yfFc_Pok1tIoSVJ9rDId8
Message-ID: <CAH5fLggAuPdmwOFiOMMRUCP+yLPjmdjYGGfBxZJ=7+bkGODJmQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] rust: add zerocopy to bindings and uapi
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jesung Yang <y.j3ms.n@gmail.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 1:37=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Oct 21, 2026 at 7:54=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > Miguel, is this something we can take through drm-rust-next? Or perhaps
> > you want to take both through rust-next? Let me know what you prefer.
>
> Both sounds reasonable, so whatever it is easier -- do you think there
> will be lots of movement in the Tyr side?

If we're able to land JobQueue soon, then yes, otherwise no. But I
think we've aligned on how to get it merged at LPC, so probably yes.

Alice
