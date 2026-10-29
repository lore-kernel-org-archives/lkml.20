Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793308633;
	b=lQwwO7NeAs/9YElj81nmGx2regSlcHq8tPFTqt9XyoR3B7aRgP3GcexN2ByPbsBNwPmM
	 45mOf0xNXrM0jqe8nPZOh16dnjlPbAiRLTE4BrL0p+AQEqJlo6Wbba8UDlCviP97gQgsf
	 cay2xYxDgbmHEoECuvhAnnWJq6x/IYbq5ghEdY234kLfMJgA9x1jcfzkPfVN+k11HdsNW
	 ivtGn6RqNYUxUqa/sFh7hA5xb6KsN56JTD9xjJM4Ywb1wLx/O90DiTxz5SSmDCYe2bevW
	 eJCqEK0eTZa9lpiyjNEFg7B/bl7b/BIW10+fei4Klwzm+tiGP5h+CfJHKFMjcE7pGcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793308633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8a9VwW/l5pMCLhHvRptqG1Mk1HgWYqAaQdHG97Kg0Qw=;
	b=A+kQqxinhy/mTeWW6DYx+f/Y/a8e7FXLI/gyj2fZqkUXTjf9bpdprHREkg6euFxuKky1
	 J1xtY0SdGed4QNcpY56uoYwNPzN3ebWLXqURWbqR0JPpnlUPtQVokPbJKZcfAXjyHta15
	 pCesBUMGVQwNQh62H2dyRvRSKPAsI+qzw9c3r0x1FyQfmI5prSc/5ncsGXTmN3mxRokR5
	 XP/UZtJMoDGeG0aN4IoqDNFiZEEuB6gGzAHrb48ePuQ3CJp3//W7Msc2nLD/Iucgj952M
	 i7aEXlFQHsTPPBbF3bI2rc5/beNof6qBMN+Wnb+2oxI092YMzKezHZ45r1xrUMmosnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XXunou9C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06F4606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F06F4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XXunou9C
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36a1c464349so17298eec.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:17:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793308632; cv=none;
        d=google.com; s=arc-20260327;
        b=TLRPaVdJg8tYK2l1U7j3gnSE98TQ9FwYVGJ90pyw8h7V3Po6ZR9TRwxtgA165nFqG1
         Bt+qjfiiupAoNCWb0Jq6Fov3UTM9pA2ccmxAl+q5kVXyz4DcPCu92U1sA19U8toC8oBY
         K7di7+r7wKuCma8SqKVubIBN6sG0nOwucraaFg9wrOr2YfREJfxE3ypB8OueZN4apK6r
         JvFHzHnFoE7oaTWJsmC7FyZlzh74B1oC9dY6S5Li60A+Bvmj+qz/HMUmyijWwSfg2e4D
         faRHVK9qaPx378dIhFRI9jo6gr/6EK0dPhbyU6Jfobb60y/kYccmzjRMGeiiHfs71xvf
         09aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8a9VwW/l5pMCLhHvRptqG1Mk1HgWYqAaQdHG97Kg0Qw=;
        fh=wK4+AZRA26WAoycv1TdG1a6clXKJXbTK2Nx/YZ9bNgk=;
        b=CzsRtv3WC1GkDBdhd3TxU1laBSGBhcKvt/KtKRm89uY/3doq+tEK9CTCNJwYSXcbhI
         /IzVygiFPOdhCzlSOvdpK98YXk2mCkFvQXy45k1oPPcss2FSYxajUR5DhyOjPl2vxqm1
         Sbig3Xgf3NRFB+sFVFy5wW+GRcoNOvjt2DMR1c6yNxUnRo/264a5eRhh9gb1MikpstqL
         QtabieFScfkuMmXtyUC3j2Y/l4vI5Mn1Ic6fWk2xieBa4XRa8CSjvNYZBsmyBDUvVhrf
         0f/MhDQKbA5yZCRAy67pDSWMM3Ni2VW2wf2WeqeFWbH15MVT+NTnVlV8HYlk2UEbzdIg
         Ac5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793308632; x=1793913432; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8a9VwW/l5pMCLhHvRptqG1Mk1HgWYqAaQdHG97Kg0Qw=;
        b=XXunou9CtC4BEYCQrhuadqzD455LGwx5YXUkteTkPIc0p1H4xkU5+qmZPj5FUGSwXW
         w+qHNOSsu5V1lUCeYVL/voVRJfsHrikg7h0BaZwQKn0N8rYBTWLEgsB6Y0y47VwcsuAt
         Vm4ZsdnMzQacJcGLoXiYmyv/TVBg8yW3FxnBoQfsPvfPFifRPTRgsMTT6e3ira13pnmm
         iPiYYqiLtI3QMFpcYu6fUa613WZ3OMrfgrvxTlcx0B9CHwe8FXWvdE6d7HSwQWjOEcCE
         C0OARVGORSxQ90StHpfZFC8778V7WzJOUSl2BXjYAltrg5d94qy6wVvbHa/0Gup82hjq
         6vbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793308632; x=1793913432;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8a9VwW/l5pMCLhHvRptqG1Mk1HgWYqAaQdHG97Kg0Qw=;
        b=m/u1uO07pBXS2s1FKodWJ1GffCnRNtriwC+5TknGAjAdOn/XPmRn+3qPMMzia6w+Hf
         bWBcTE1e7IzrPZtT1v3KNDbAQZeUJZ4ArRr7CFmYuTE7/9Vxu5dTTU7IqFonZ6fdEGra
         zFEkODoSsrJ+K6Jxxo5enDjYOjx/6OYrWHOQsifx1DUQOnqQ2ikmFBiCicSvUCRP6H5s
         MYXO96R0A5u9mMKxl2DxIRUcfflOylRH/qQGwjKLxZOgLad2ktTXf70ozluXMGKdDUzi
         lLHc8WdnmzdE+D9f+Lhe1QHbsr9u5+DQLxdJALOjCyl5nCBLpK8IL6ZzP0IDEMJ0a/DQ
         eTxw==
X-Forwarded-Encrypted: i=1; AKwUvBw99TcjAYUAQKr40PxE2Jj5O/3Ao42HTnjTwK7/orjDRR2NfdNUfT5V0uywINTtfXA6XFYECAF8BAMhzkY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJB6jASrBBuM/tVqC/ATqFhuED1fDkIqLt8hpvV5whWS3Xp5OJI
	pu18rloVQDAGaZVpnru+PGqPlvcAeax2Fa+oC+u/Glav+UpeKe6YSSpA3T7/lMvM8B6A/J5/4q0
	xhd+VoqH5ke2pS/hs34zewAMCr3k9Wl0=
X-Gm-Gg: AYBFou0LdxRlCF3IeNoJJdZ3Tmb1jFDZ+3JIfqKF34ggYm6KK/oZkMMYagQ3mBpgq0+
	UbJvwq5roe58zKlkEZ/xkg5uRcgjFYctIg9xu8qFUmGbiHzZpx6s57HJSxZEOJZrn2Od7N+p1uJ
	U/2P1UdRugWpQ/ER9AANY5YI+p6lhLyw8slWCgkyrjBDaFCP02FzZG1mJog9YixdFxQCFzNVCvJ
	GgkNiTobKdxe6FoUNzLboTCOFeQI0mLPwtTAXfGSZmr9oILMYyfGRLVVtN+ogiQ7XxTYJ/5yclR
	w/GRieB7Adq9jAMD8QMOSUaoyATmlhhiQwbfCQclsCOHE1VicmZRnLkW1cy1qJx4nFvPeN7BSie
	OjwefwpPneMZWqHMyf+XVqIZ8CudM8QWn8CY6gklozbQ4+pmrS5O2LxZLn8+LSfj72LnsqLwSLx
	gYrJ5n3gVwfEbZf6RpSqnMOljKUn+UOJHP9yDAYbfei4wYQ0QUUGARmK+2/dY2RJGyUsFxxAW7m
	MBq3nvaiPfc9rShSAg9VrEULCY51WPjz/OkeQ==
X-Received: by 2002:a05:693c:6304:b0:369:289a:d31a with SMTP id
 5a478bee46e88-36a42059799mr1167009eec.0.1793308631687; Thu, 29 Oct 2026
 14:17:11 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029180116.49074-1-ojeda@kernel.org> <CAHk-=wjt_ahzkGAwnExc85O5RArzFiAV-SiFzY8eP7RCXqWM1w@mail.gmail.com>
In-Reply-To: <CAHk-=wjt_ahzkGAwnExc85O5RArzFiAV-SiFzY8eP7RCXqWM1w@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 29 Oct 2026 22:16:58 +0100
X-Gm-Features: AclHuK99ulcUIeLAGyYWZlNcI_yrUDHE9haPLMUrL39phORKMUnHZ8VMZILyy08
Message-ID: <CANiq72k2+GeKSdE_pirNLzdkEXUtwO_sDzZZkeMkMuQzneqK3Q@mail.gmail.com>
Subject: Re: [GIT PULL] Rust fixes for 7.4
To: Linus Torvalds <torvalds@linux-foundation.org>, 
	=?UTF-8?Q?Emilio_Cobos_=C3=81lvarez?= <emilio@crisal.io>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 9:47=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Bah. Is there no way to just get bindgen to do this automatically for
> all enums? Would that break something else?

We want exactly that, i.e. for bindgen to do it (among other things in
our "wishlist"). It shouldn't be a hard one to do, and there is a
related, open PR (though slightly different).

There are a few months until the next minimum version cut (Debian
Stable), so we can try to land it.

Emilio (the maintainer, Cc'd) is open to improvements and helps us
when possible / within his bandwidth, so we will see.

Cheers,
Miguel
