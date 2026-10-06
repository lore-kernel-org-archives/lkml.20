Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91D037E5C7
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 07:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791270632; cv=pass; b=aLJB7k54InBqrk5ZTJmAXB5w9lZU73cB4Q1aZ3xnZiGXRjVAz6qnKmv9U676OYmLjO8ngTJq2IHXNUFB1pEJg4Fxj/wxgekIkDOnwDyaA1LgooyqS+vFAK82OFkOqyFglihbZsHoHWyW951CqKz6NYs/ykyRLfp+fKmowe0PiUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791270632; c=relaxed/simple;
	bh=swDviEAoNYUebctsfW1H636z6Gg9l4LE75WPX7+y2hs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nmUurvLOnAzXJjPq9lykcArfcXkenBo2pOds+jhFh2Ys9YbY8i2BrdMjkD81YknLq/fAlNNmpSYzhgNcUdQ0taPyt/dLJDvP63jkHnbUfs9e9dA7WRpJP0WpTR8as8H0rlbMMkK3DRFAW7n1zWU4LgG80Tw+m125UfuyGElgC/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ttOhTZLQ; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ttOhTZLQ"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6aae147ef9dso7970a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 00:10:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791270629; cv=none;
        d=google.com; s=arc-20260327;
        b=IE21no1p9MY+bthLaM/hcktmD4u0HRIYZ1eR2fR4IuGlSn2MOtNvgyAShzDpFVDYmO
         u5lJ87YSbS/Z/53t3+6QjuhHVwH/M3gaYQ72mDsyHYiA5K9AJDK7Y9etW7vmesawVtk5
         qJ4YowtRaOwy++OtsYn7hZHH1UhRZRaD6Y4VtuaLrqq/pRWd140V6mPvMy2NGTMYQLLZ
         T7r0GNdKN/bj5teNfLxoCVjtr39MbDfkoXBvom0X6RlHjEyTGU8Y76UpzvRFqZY3WYTz
         PFz6KqGtWzzMGJRTJ2F4Y+F8mlEVPcVfwTlQPR0F03DsbcO3FPCuAzG0fDmYdn/j3w8T
         B0wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=swDviEAoNYUebctsfW1H636z6Gg9l4LE75WPX7+y2hs=;
        fh=eFj2qwIOnT2pO+YVI0phDkTPiq4xc16UOz5ZF0W6gKg=;
        b=l8mK0CugfC2NG+kYJIM+VhQyw5NK6GRvmqvMc9eOPb27xURX5lTDR6BL+gMhHGF2fk
         +TbknThBvC5q9QtQ55e2HNE2ZWIj7jVJ4CI/8I29xmAZ4YUvv37Jg8xhAi3aCYf5q5i7
         bpRoQWTT2/UIGoLzH8Y8O6avr5t1Cd4ikRxL8IVfImj9W1k9SQspl8ZouFPBOdNZkwBh
         asFgIhg0oTjMthr44bNWh6G7e+TNQikwlRvBlkd6ovwvQmbhWybezJEMuSfVoGQcCT/D
         lS9o/ZM5KtNIzc3gJ6J2ynS3Wvy4Kqc4hYlv5rIjjSwlfK+8bh/S2pEgMWPV+R8GoJr7
         KvTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791270629; x=1791875429; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=swDviEAoNYUebctsfW1H636z6Gg9l4LE75WPX7+y2hs=;
        b=ttOhTZLQEY5uuBpGx7Y4a6pW4fE59EVqjzO55z2aAwvGYzBliFHBkOrS4lVYYRrAIe
         ieKUv9fV5c6eILop3vQE9BxqKJ1WVHwdg+M7ATTQHk8ZEDQ3cOzNFgSJrwVvkbQ8EWNq
         gSTqcbCtYJ1evWJfoTBawiGff8N/URQu6jsUOHBT3h/GT1UIiZCf3yDoCnCODBPwfZT3
         eMiy+5uwmzMhNFlyXdU0M994sQ3U/x//hr87IkrQKqNGCYcjb2MqzpEEGM/A5rHXDLYM
         jHz1IdyQ01P/3GpGZjC2hWZcVbJpffjR8qk1AOL3tIs/3D/AGacSrR/+1e3Jen7PwhHt
         6eow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791270629; x=1791875429;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=swDviEAoNYUebctsfW1H636z6Gg9l4LE75WPX7+y2hs=;
        b=Tf2Nws66+Mlq8TxQk4/aMYckPvgjbNDQA0wu42/G8SyBNhUaghNPshOJB4xALdVnDI
         FstMDai+g1hIqDSnRW3snNXR+K7NSBNTWWgfDAqN8nRI2TEE8wGWgzjmSj0NX3SDZ+mo
         EIT7Wzh7fgraLPZd8v3SwrQ24Z7SqRewZMKdI3YjhJXev0pDcuRrCEZUK+H5nS0FvUvO
         lcvCMRC/TQpb2v2E6rW85IEJslBAMPeNLtfcUX75WKrw3DsXvobG+ia3zrfwzzC+1UN8
         O12fH65RP6/k72G5pd+rqlfJkoJ5Ol88DE5cvzFRvkEWBjiJR0mxlSxp7iHTTE2XnoFb
         xs4g==
X-Forwarded-Encrypted: i=1; AKwUvBzvCyxDPKfoOFhr3nvmXrgySCzpRm4wDyjH9fRXLlabW8xrG4Ds+uaH35qZuxnnYWiGtgMJRm0sPAWAGqc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKR54vzfdpfLYZhoPlfOtFDJgDvPmHAyxOhN34CqJ526WzpBnJC
	bmhiFsiLKqUL5freXLo6QrONWD2EGVNZwLw24Tk+f4Jqr0b50yj7s2KlhbE53HuU5F9fPylx9F/
	JOOkQE80/tiEJRBxH2dXVY9U/qOVA4SSTGAkum0zL
X-Gm-Gg: AYBFou2XpKuo4sDfwzJw6IgOF39Y0p5tOv+JVz+/c+MCYk/fautH0ywUdXTjyXRYUil
	a8ymTRNQjMswBtE/8xQVSpQvHxXqJf+T1csy9NsbEVKy1E/kBVxBWRL7FMvR8XyQqOgc5mFea0k
	1p6gTc0q5r3t1KITPKnastRH2yAF+KZzoX5CQ95UFhLpxXnp/fOcEjvk1vsk0mRuvBIez0fEsFT
	GrrashcH3AhUHfM6DmgXtr17aR6kzbAmGadnoiXvSIFBRqZ0pHkajhBGCP1rgHXyYxta/6fup+S
	V41jzYVt5qxvy9Tc40bBAA4Vdtmfz37SfHp/BCQuGDiw0wnnogk=
X-Received: by 2002:aa7:da0c:0:b0:6af:97c0:ce51 with SMTP id
 4fb4d7f45d1cf-6afdca58f21mr21854a12.13.1791270628368; Tue, 06 Oct 2026
 00:10:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005201822.3060658-1-sdf@fomichev.me>
In-Reply-To: <20261005201822.3060658-1-sdf@fomichev.me>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 6 Oct 2026 00:10:16 -0700
X-Gm-Features: AclHuK_9mrwbKj5FPDFBcTTw9EhGUrGWU1Idbrm2E5hqnsi5uMO4--x8cjtJ5pI
Message-ID: <CAHS8izM0FkjNM4rwmTjWZwyvjPBNmWCXGnY9eJogpuPWgmJAQg@mail.gmail.com>
Subject: Re: [PATCH net-next] net: devmem: remove net_iov_area base_virtual
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, edumazet@kernel.org, horms@kernel.org, 
	sdf@fomichev.me, bobbyeshleman@meta.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 1:18=E2=80=AFPM Stanislav Fomichev <sdf.kernel@gmail=
.com> wrote:
>
> Since commit 083e64a3af77 ("net: devmem: replace gen_pool with
> freelist"), a binding has a single net_iov_area covering the whole
> dma-buf, and base_virtual is always 0. Its only reader is
> net_iov_virtual_addr(), where it adds nothing. io_uring zcrx never
> uses it.
>
> Drop the field and the store, and compute the dma-buf offset from the
> net_iov index alone.
>
> No functional change. From review feedback on:
> https://lore.kernel.org/netdev/asPUZ8DPllHd6Yu9@devvm7509.cco0.facebook.c=
om/
>
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>

Acked-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
