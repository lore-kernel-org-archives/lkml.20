Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794255464;
	b=mkAAv8ORDU1UV75szgqs5yPiK+dCRP9tKTduX3fwF1w6ZsuwM3VdUzkjME23jRkRuLNt
	 XYRR+MloVojsFDYSpZPuLT2fR2ornlKjbb9mRf8T/r7Kk+GzebkGHUCgcMwahoFUiXSKz
	 PGIVQM1SMRhX98M+CQfrmHcsWlOCE0RUIXWzX+frZqOvrGlaLjtQ/o0Z2ZuplIvBgmByY
	 WyWgz3T0WxxZJZTccUP/ebJBUBoyNIpSnQeV9fX+Dva7XX44MrZS4bsd2hrETLupp8vza
	 oLOW6KIdYNygHhIUjjAYQlnYCzL6qmcsIakqUlyRISPH0sjovRVq5XcWae4SNw67Lhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794255464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ltRfrvbZQq2u14YHzE9ATEjjt/vP6akccZZlMBuYSXQ=;
	b=A8Ra0WK381xfM2xvf4G6wbfhpES5XwE0WDZ861/bCFLG5vwwRHVWKXLwYxBK5tjgLLEz
	 ayPaI4155Ra4qyGugDhfTkJ/IN1COx4Z7vGlwErFCLYwt9vwlliCXDlIwrVbSm5ksuTvH
	 l0UuLEwOr1rz4I7yHIJRkGoHHYcxnqRU0wQcqnNNvjSKNqTztKpjTUWJLNHT1DjKXxWVR
	 IoSd0fqO0uXNo7zrRNKOiNd1p1SGZTbxmm0kVYz+rtWq/6QeYGBNkcBn05qmRUcP4IiQI
	 1j6GICrhes2653dV9Ic4KTx+LoU6a0qK0ReGbDqnkDCg+YVISpdtcakvcCCcp6H+mEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=P0sZXvsq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89986606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:17:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89986606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=P0sZXvsq
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b579ed8da6so40a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:17:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794255463; cv=none;
        d=google.com; s=arc-20260327;
        b=gM2KcZVVw1L0gH7YT/vIPAFBDIpImvTcGjS7AhuuHMYVedZecAUejdIL/bAZzuykVk
         dtVGVrn5NaCueB2fsh0V6DtlQPrffo/xABNSR3Ebvxc0YoJf8J42T7Clnf3oZAb5b18c
         7OAsQSKhclsmr3/jZ01Zof6odseNmVXybqOF41GEnFZVEFp/5VsMDLzyCZ2AnjBG+S4D
         gix5GxieJnWISHIxwq35VJdehiSb7AUnxwQ06EO8pwmpV0aoZblqik3TFJLNeiVo9/Uv
         8YuGK8gZbaC8EO8gmcef4ZPIEtqC8uZaXHkp9py4gcUSuE1QjdQ3uqZxR9yxYqHB9zV+
         XUoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ltRfrvbZQq2u14YHzE9ATEjjt/vP6akccZZlMBuYSXQ=;
        fh=6BbUFmaBjJS4/7X2bK9zI+IpjKLAvS8hwkP5KPluNt4=;
        b=V86VrAM+AExT6rV1+fJC2nYv3Old7mr24dCJhSYwgR/89vdU9RvU1GX+NmbUuDfMoi
         gQ4c7KJp7inUZitXGejHEwyR0Qe5VaJ8CBFEn2AUjikySUe0etiBIZ5GRXqmiZFSwI1Q
         7xz50C1vBgf6z7fcvrWXvXxluv2IZVkdmEPLzais80zrn9J4sSfwPzJM6lig+7HXEIkb
         W3neNMtv4pq971fKvAis9hKLYRXMeEyO8p8ZgYsF3wbqr4E/rddGIHoF8/5jpXazaRxL
         HazQPs84oa2Y7xV/3G2MvkDPy5kUi+tEdm7EDe3mDs+eX9GGCQDtly2eU6f8ynYipCkg
         fLbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794255463; x=1794860263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ltRfrvbZQq2u14YHzE9ATEjjt/vP6akccZZlMBuYSXQ=;
        b=P0sZXvsqIohLE8Gp0wvO3DZJR6gUx3reQ55TVmSn9CykBgFrZfrQjaLL4smDuM0j1b
         5waQ6jjkuJjTO+9bK6d70m2Utj/Bo3ByzfIn4qpnN36A4OGr4mTtX+4jwHJPIdtm2UYI
         zUcvRkOzUEgrz0Rkzq4ZKf2kebSPB1+kFy/+FfAG7cS+e78EJV0P0VlujXhU9iu9Hp0A
         8i/yBt+1uCLDsBJyHn0CJe6rqPWpfuqyQiS+hb/gskzYbsqtWwWGnajuRq7Q8FrF6ozZ
         eZEXUqvB8fN1LtEJQnXQhyPhUQZhECtR14nfrxmKUEg2/dcOy13bALzuaFxJftMKZ4jM
         dprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794255463; x=1794860263;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ltRfrvbZQq2u14YHzE9ATEjjt/vP6akccZZlMBuYSXQ=;
        b=uQ5nfFPc/BLU24hduz60yvhoMeumZheMGeji7y2XuoZc4ivSZ7PlrFaODZl0VMxH6O
         EFr8u+W8C+cPtDFMe+KsH1PqxXTHThJXhUz4xq7hZbwvEdexQ1c22L0pgrW+MhVfjio0
         ERSPczmKGgoFVagMeP9KhcazANXY9Sa5G+BDA3kbhR1p0SK8J3R+SFFs8dj4xv0uQHnE
         DS7jDXUMyuDgqbPhB8Ntcdj4FZce/Ke9umG+B8Jg2aSkB5vjyg8LrfHVjuTjSUa7xQf2
         4wGkdLWzSVJKylhSkHOWunO+diZ4Ihe9ewHLJh8EYvK27EuvxyWQDWX01dSMK7f3wm7G
         n3JQ==
X-Forwarded-Encrypted: i=1; AL+hErEF4sKIM71GXC+Tri7Afh6wz8htnlAnR0HpC93zsVjVuHxEumy/hxl8/ycxXPFTjXnGj20pCoh9b2BYnlQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+y9ujwgwFFCuVG4/YEkQ91znff8R8RjnQpKnnLqB8zI9WYzGn0
	SabP0GzX8879fD+v0vk8OW2i5061lqhzNMpTd5YNp4Y50MXx5TDaU/D3pmL66yu8OJ3Udzd9mlv
	wR6nP13qDe0/lCNMkNLBiKUPbOeK1HHEv0IDZU4b7
X-Gm-Gg: AYBFou15Bgdb0A+BsNuJARdzIKHT6kCMRK5SUeheS1cr2wC7zlvJA3JcEGa7tD3bixG
	57SVthtInSgiu6dB/NgdaFw5fbcsVDUpFpT1ZXYP+477d9JhOOYt7gjGVQFHcyfL8QCAZd36KKg
	4VKtX4zmmw9wNPM8WoRK40/fpgEJtAon7TCctZUlRx1yPe7EtTNccEj8vXPVkFW5S/g355GgGud
	Eb+OxVY/AN9cO4KUxauAnan7h54+JG6oB7/pKv14pO97J6BpkBFzIluKCqu4WdnNgcIPAtwbcmz
	dfYycHUeYFmdwXpKWsv4b4w7EN99Gi1YFOgt7fJHQkEpKJuSiZaA4UyO7jsgX7VzLQRH9db9nwu
	grPz/UUTTjvRHOu21+5QDPeODweJI4aBvT2cYzxixQEYR2V+WT05qDKaMojRnHG2vp9c=
X-Received: by 2002:aa7:d7d3:0:b0:6b1:a517:5bce with SMTP id
 4fb4d7f45d1cf-6b756af180fmr22485a12.16.1794255462346; Mon, 09 Nov 2026
 12:17:42 -0800 (PST)
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
 <CAHS8izPwWT+vbgAe49m5vXsRxT3unbfjLTkVZBScgAPdQTo2dQ@mail.gmail.com>
 <20261021132304.23e0a4e7@kernel.org> <CAHS8izNTbs8ONvjhiw+6cRkZQq+cX3t=BZK9aCr39JNkVbY9gA@mail.gmail.com>
 <20261109104959.181a3b35@kernel.org>
In-Reply-To: <20261109104959.181a3b35@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 9 Nov 2026 12:17:30 -0800
X-Gm-Features: AclHuK_0MFErjqghvOz060hZJCCzy2vAPCeLH5qWi-kHJsJTH_MqHsOjMY4lEMM
Message-ID: <CAHS8izPcFSLdmq16ZrUDKpCqUJf513EMs+Y45brc56s+mUBmeg@mail.gmail.com>
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

On Mon, Nov 9, 2026 at 10:50=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Sat, 7 Nov 2026 22:21:48 -0800 Mina Almasry wrote:
> > So I started looking into whether we can improve test and fuzz
> > coverage with an improved netdevsim. My LLM prototyped full datapath
> > (with devmem) and offload support in netdevsim so the hardware
> > selftests and packetdrill run and pass in a plain VM without physical
> > NICs. I posted the branch at:
> >
> > https://github.com/mina/linux/tree/nsim-devmem-rx-tx
> >
> > The main problem is the total LLM generated diff to netdevsim: 62
> > files changed with 5,525 additions and 672 deletions :( So it's a big
> > change.
>
> Great! Please keep that slop to yourself, tho.
> Upstream isn't built to host people weekend slop.

Understood and sorry for the bad suggestion! I was indeed unsure how
you felt about including that kind of slop in test code. It was a bit
too tempting to suggest it to enable the extra test coverage.

--=20
Thanks,
Mina
