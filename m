Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793011124;
	b=2WUsum7LNeuh47OAhHU9TPupUKge8i+15KM9YzfACZv5287XliKE0GVdXtR3usVfY2Y5
	 o7ZAXYfbr0GzE9Z2sbW2HNlVZ5znEO0cyqpMQY5tgj8IoZqKMinxLXq4C46VSN7PeZhpY
	 Ad6w/iXcJJ8JUiTBxQOa5LQN2Ht3iFDvbbCeMsV77dXi1xpFwQd++wNGs9VY8nLiyldpA
	 4EVUlfGbqkN+cJK/dZV8hUFRPReu+hnyTUIlkVgMAe6vSuBJ35Gj16lwckK7VdduQuObG
	 jhr9KVyLKx1WEfuf+LvaXmY+IqvcaqvrVtLVNcM/N9BfEcUrfrzvVjRcJsLJA18gmzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793011124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=skVw1yfqLZXOPzWoETXOkA5tQYujR3wIhQszB1NNCeM=;
	b=1vfYOrHKNC5cNPQ7naAavDGIiuYE3ybX1Ax1Rk/lZRI7QvmlQHvt10NgFDsvTvUME45t
	 Mb3yVWzepBgy//I4CwhiyNfHkabW2g12aDXR9dgkrDPxbFRW0Bp0ex/HW2VEQwJ40RzWJ
	 +AX0BR+Jr4C5vOS+0p4Nhr75462NP+WYJDVGY98C4PtwcyKghlaQwQDvULprmFUcXdp6q
	 8rRmlXgC3cAen6pcLUxdeHFNQJdHhZpMilxddfrqJsZsQF7xi8njrBCaMFZuO5v0gVYkW
	 9wRA4cNTxK0RtX13JB4aSPiQ4MYCRiVEXLy3+9f2rMl8O+kGMao2/5kt3ef/4yy6dSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UltD07cl;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CF0606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9CF0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UltD07cl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so16893015e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793011122; x=1793615922; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=skVw1yfqLZXOPzWoETXOkA5tQYujR3wIhQszB1NNCeM=;
        b=UltD07clBw2g+Y1aJYem1Dl1rIWB1uh8fp7BUdxaZ4uc5gMQGC1HSwdgOUYeOP8/dx
         2TkThOJk1VP9OMA2ajX02tpdaLLAa5XG2w8XHnfR99TLeHIhpp4CUSsvJFI/9J5IGG7c
         pGzoT7+hbDmAEe+Lj0blTQX1cy/K3pYIgAmUvAI6NR06P+hLyHXNoYC4EEOjfsP4PddJ
         tykQqtvjlvbunzbk6J5SlUFpbGUQcZwwcJDkjq9SfqJRVTEvOT2Jy/gP/WwtYNTUMPH/
         6Ls8CKv69hJpKI0qEtMEemKuUne4ij183SbEp3ZiQq9ERIHvQ8aSHt7vps2ehiKxt4rM
         jK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793011122; x=1793615922;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=skVw1yfqLZXOPzWoETXOkA5tQYujR3wIhQszB1NNCeM=;
        b=Hl0ABlyx1qSJNfy7an8nq74ec9MPhdafsBRidbIHPoZUNbbhojeTyDWnhm8GiKleSa
         KS+fnHbc5k2/+bmu3IGtZgI80I6lrFwFrDAb5x1R0Q75F7V1G5HzMBlh6uuabsceUhYq
         gmPm+JwOfLszesAj2hJFfLaAKNByJfaV97dMNtJRQexIRS3tmXuX5mdcFY/SizR2nY3U
         KLm5y/rUtUy5aGMC6VIK0Nnxr88qB9Eel9eLq9L/6/ToKPLt7cUyJfngoBxLWyx3Z6Cy
         8IzhyrCi5gNRmZoghcaNrjafiNiR6UKwxNNwLE+NUCennGa81eXKBywYq374Y7DQwaw+
         02kA==
X-Forwarded-Encrypted: i=1; AKwUvBxHa/wkmygs+N24+ZGlqnHB0fE0SekuIRiKZ5vJahj64nTF+ByfqhbtqoGYqTV+iXmWvTV2eslj5fJ1zPA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6e4qr1UgetHKv6/zsCNmovzdGfvNW4Azd5gQ82LSx4Sr3LP5G
	1kM5HHp2FvoL4ttR0X5mVGnlbaiiTgFwnGVS5uexwE2lV//d3IFcYgSH
X-Gm-Gg: AYBFou0RWZ3IzKo9BAxwri6PoC4MTwITBDx6IzkM6hF3S1M43BMgS3ZlRmBbUnwgcHT
	fZ0v3eXCPgKdHqFq2rKlG5mDOYdwxB3ad4Sqb4Kimz9KjwBiaQ8Y2kkKK1rQ0YFXtys9usyxhhX
	K8bEupzZBNvDvXKLCJqnpAKUd3h4mQPziofId8dKy5vsAnyp8bS2B+fjWHkO68SJ7ums+p4NNWn
	z/mAogoJXq9F45+E7UyYPNisAJxdw5mZzkRnSNatAaWXzF0Z1N3Oc1fpiTP2Z33mpB0cSR5wUgO
	6QnnQXAObZjfYQX0XGQjOPTYVQPJ6RjyuNdIvnLLFqZi5hI9F0WHtFT2c3K7s4s6+61LeD4ubmj
	nvCn77pqQm3A2z2CxSEKj1q4YG7v+eiN/ZZQ/jSVGhYfZl230mjPYf3U9h8JBW0f8zCzbyJ51gE
	T/lpdyxvEwRDIV87kzpDmgNDA3SMG+Zxq7B00jp0ji4zMLM2PD2iYGnFZo3m62krGIfBb2+Bpjk
	eQwyuEwxIHS+pBK4bK+nMU9/ySmAj1m1FNZ/s4v676t/dWEVvMt/lY9Bs2q2NtMxePpY7B0HR9j
	Vj8gtbi9BljmSUwYueldzUneXcIdevk2PjSkFa7Nr4YrpmOaWbizhYf0Q1pXnG1e92u1td9SvHw
	rjjy6MW7uxeeLVlqyy0VgFDzKbUrUxe5ZciSme4jfubeFgkE+GC0a+bQp7O8r0FrqsNETmbMjfc
	rfTLRVd6vlkPFau5xWJXV4W+e0RdKCoi1F4q7dwntPvlVq/V4HRMbZk+KpFF5Pew==
X-Received: by 2002:a05:600c:4f56:b0:4a5:a5ca:de1d with SMTP id 5b1f17b1804b1-4a5a5cae166mr78474005e9.30.1793011122095;
        Mon, 26 Oct 2026 03:38:42 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a58a293sm184743375e9.12.2026.10.26.03.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:38:41 -0700 (PDT)
Date: Mon, 26 Oct 2026 11:38:31 +0100
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Arnav Kapoor <kapoorarnav43@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, Gwendal Grignou <gwendal@chromium.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: proximity: sx9360: keep the IRQ balanced across
 suspend and resume
Message-ID: <20261026113831.00007f06@gmail.com>
In-Reply-To: <20261026100450.17023-1-kapoorarnav43@gmail.com>
References: <20261026100450.17023-1-kapoorarnav43@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Oct 2026 15:34:47 +0530
Arnav Kapoor <kapoorarnav43@gmail.com> wrote:

> sx9360_suspend() disables the interrupt first and returns with it still
> disabled if a register access fails. Resume isn't called after a failed
> suspend, so the interrupt is never enabled again. sx9360_resume() also
> returns without enabling it on error. Without an interrupt line,
> client->irq is 0 and both callbacks act on IRQ 0, which the driver
> doesn't own.
> 
> Disable the interrupt only once the device is asleep, always enable it
> in resume, and skip both when there is no interrupt.
> 
> Fixes: 1cdb4c47f7f5 ("iio:proximity:sx9360: Add sx9360 support")
> Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
> ---
> I'm sending the same fix for sx9310, sx9324 and sx9360 as separate
> patches, as the Fixes tags differ.

Shame you didn't send the patches as a series with a cover letter
given it's the same logical change and that it concerns the sx93xx
series.

-- 
Kind regards,
Joshua Crofts
