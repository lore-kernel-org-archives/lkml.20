Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793111735;
	b=RIroD1/1NTfNscdTLUlUY4nC5L2gvfuaAaurQfePF3SXULiyLOldaNi+aqiSjgjqifIM
	 wePtGJBmt5uI9yMv4SrCWe7MUlOZI8Mdzjybu7GPc402EeyR8hc+Gvx93V/mT+Xz9P/Yx
	 r8ovGqQiOiCZ9KLUxC3zzYKhP7iLl3vzdGNTBj8LJgA4ZfCt7pLN1/ux5M1YfUsMzisTr
	 A0uS6yHiiSJh+i/hyEhSCL86jJ23582AoM1AGepeuKoHwMxIthPd0N1zDVm/NBkrs5f4S
	 7miafk0do3pVN5gP2jj1Ddc3FUWJ1P6XlYBhuxXPWOnTpDuv4k9kU8RtFWhemNT/7bA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793111735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=R4PvwjpIeFOLVCtuRNnnzwQtCCwBRvOOzElq7eLGth0=;
	b=AzTaT+1mQWSYmuFdRNGzQYZn4XTw5pnfS4UuZYSGKyqlxk7pKBXPXSt5ztblrf6iSrel
	 o7V0GQB6TRvpGgUxWYjovZvO2nN2fyYPHTMHVH/ga61wCNcAoEq+VylmWhk9kZwsNOglQ
	 gN/imyZ0W1waK35JD+qNJW1BF95yfRVFqWJzob2Wf8Hk5QsqfbFzS/PR8/2vKiCCrJs/C
	 lc2oa/otj1KH0c5v6Oc/znsPTobrXZKVbcncClHF3L5bQJll/q01Ks1nbDZj1AfuEp6XI
	 S2GhS7gqFFvkEGPIW2+sQgn38QcJQmnwssyxm4Ne7bLMv6tfsTvnZeoTqGYYAG3ogxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UwWt9o8Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D49606A329
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2D49606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UwWt9o8Z
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b1afcd2d23so6020758a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:35:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793111733; cv=none;
        d=google.com; s=arc-20260327;
        b=j3fGoKX9LpY/p0teqA3jXToW060oaHNUtsubcG93bWWCE9VU/KHPwZtWdLCixuN+LU
         GT75C65G+XsFgFr4FGRjHJkKqVgc3JA3zzmXvD2j5GgU4Znt+oUPQvQiSbCPi3+1jnku
         nbWnrZvos1lbIiiDCYvVSQE85WfnH1HOlhJHv95Sady/svaT3geQKxQ7jqnHAlGiNZD/
         zjLVpMnt5GpdMpQhWiNSVhgIy6HvCehtaDiidoUGKj8mvFfmMxyLKyg9DdjPfEt1KUxp
         HZKzJ/XdJUJ5vp+OgLrfwuhHmD2YTmNbzE9HSbX+mF6V2J6eEePK2UW8ovxwQH4KlhGu
         0ocg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=R4PvwjpIeFOLVCtuRNnnzwQtCCwBRvOOzElq7eLGth0=;
        fh=ENV9zPnQIuI0S7F7s/aZvSHBIY0NBaDagmbWCUv1Aks=;
        b=lKBkq5l4B+bb2wxnYoxQaFN/wUHcLqjd7T/uhxIefmiBLwX/khHh2ARFnnOD8isr/Q
         VIAjLgmmKhoe0N2fDeOA62WN65biybGRPhfa9XMJ6G+iEvyHjAHK+79mMMs6dmomEoAl
         qqPfnnGNrfOWGr8Cl/WWhSn250/qz7YK0v+WzkJJaM5NxY9xZow/v35WAeTEgA9czLi3
         RDUv2PCRTcjBQDdmyvYadWyeix+kj7cZQc+nslNNyBgh9HXUSB373EnCQ7PUlrCAaWlU
         MTVH3hwHsMiODJZPWSifcc1GiAYJT4WHMBSN1xcFH9eUkXUtEJoiQxE9jGjc2yH/CFf4
         kR7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793111733; x=1793716533; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R4PvwjpIeFOLVCtuRNnnzwQtCCwBRvOOzElq7eLGth0=;
        b=UwWt9o8ZezP5LeWGsoH8IS5Pner7sMD3rjIALXXVva+aYX0GxB3y7bKdOWStFLmazx
         avuMDRiQjd9PiV+n/3fHALJDHwPlZTfzFvaQvoRwk1zs6PbcVIg0Ph1Z6jVnHMGez22u
         ApISIBeOMpYJ8MRZdxWbpFMxHnJZ45XGhhZdyLqrpcks3sxzdo5qbpS1BJalBOtvNhBQ
         YbwC+04kBEjjbVfB42yblfiLCr/NhQRmn5cUkWcqS1gDSRk1MTn9eQVFm3uslPsAOpea
         bMLCUie3NhqBVTRrxn3xlNoc7xUV9/JbSMIhgnmuVkfLiYJCNmUOho0zseiVespNUnJR
         42HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793111733; x=1793716533;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R4PvwjpIeFOLVCtuRNnnzwQtCCwBRvOOzElq7eLGth0=;
        b=Tn0td0Txl6EtdEH1x5isoa4fCX1d6I3MGmMbI9OzMP0HTIl4O44z1tCEaQCqKvJw1o
         1y1zbYH1mOft5ZaSjvimPcz8/MYQFVnyCgaIcm9Hk5eWSe8RVqUuV9A91hNTnqwsuAXb
         1+OJFjV1Nn3La0xheyv1JGdGPuh0edfZifpRvcQDHYWC0ZdBUhm1niz3OycSrZwlzAew
         2PrYiP5J9ev2owN7PxPSilr9jZfsSWfW0JckJV12fbXtYmIR7HNCl2p6b3/GaMom7IeN
         w/ILpx/geVso9DFhorUgxdNgraqqQqh+F3CYH68rrUgBt82hgv/AE3PhuF1RP9M3JRej
         U5JQ==
X-Forwarded-Encrypted: i=1; AKwUvBwP4lx4ZI+MmExMJl1qP9Br2IWLtVY4vl12MEG6jg5r6O1AfqScxc+fmMLoiQgxFZhJ5ZIsjXfDg0txzxs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKddS0gWtvW+uT5TCAiJiOT4lFrT56sYy7MuD0x2PJKRYyKrsDv
	0RA5AJOwoi+uPAYyitW533YtEFMmbDYYQjVIfeHZm8bEEeIkFHwYd2tfAGCvdg4edZ+3vgbgfQR
	ARtd5OVYdMfkMtgCwyQoUxwjo4+74rGA=
X-Gm-Gg: AYBFou0rdMB2nXjXnKYMSBHNfFZ7OEGwZ0eoUuCeopfjSwydc/eIlnPor/onJRCNpVJ
	Q+gDlE1KEkbuEC6g9682vxF+TbTbhTyE25pA7EXxMwlPz/C7m25tCqPV5FojXqu7F9qD98v2m2t
	pdCyNN5tUcc9Mr9k8D0uQHhDxHdrD08yK1VTU7y/g13IVwZFg/GR2+B81HKxAIBTZp5Nx+5uoXO
	tenRjGuXdTe9KR+GWOCt6TFOHM7zUma3PWzocasNaFspi9WeeuVfhp3OMu/+bKkE1hIMn70MkXF
	x185NbnUtUKC81y3r3keN/T7rfhT6sgWDZFyuu1+Kl7SjukrOlLBJsB9JbT5pGgPZfixFWtP9Nt
	o8F6ysESxTdcfcov2WyTEzuyyMbE+I4rPrELpUw==
X-Received: by 2002:aa7:d48c:0:b0:6b1:c7d9:b61e with SMTP id
 4fb4d7f45d1cf-6b442fe0840mr7297104a12.22.1793111733086; Tue, 27 Oct 2026
 07:35:33 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Felipe Agger <felipeaggger@gmail.com>
Date: Tue, 27 Oct 2026 11:35:21 -0300
X-Gm-Features: AclHuK-GHLEyqr6KB_kfCjwvu3tRikc3hEyilqurJguoavY6ZDCGH81xmKudJ-c
Message-ID: <CAETh984mtGx=sJciwk0Gdfa54FXpBgE1S-0XZ-eg=BHLDveFtg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: impl_flags: add conversions for raw flag representations
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Felipe Agger <felipeaggger@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Felipe Agger <felipe_life@live.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

Hi Andreas,

Thanks for pointing this out. I hadn't seen your patch when I was
working on this.

I will use your patch as a base and send a new version (v3) of my
patch set building on top of it,
adjusting the missing pieces.

Filipe
