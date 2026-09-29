Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A1D38DC62
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790666474; cv=pass; b=fKjOFymJH9D7ocJFJitU2UPPyiXGgGenjCK8AQqnLPumAd3HjpL8p6O64sqv1EdOgGUiccV2hLONaS1OwWH8Y/7SY0A/QBIx2+sjnImUMQGxCmnDCCKCqUUCT0l6ukbSegvGPB0Nq6wxi+jO1t+zHkh109JG6ChuQ2aU3QQt9x4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790666474; c=relaxed/simple;
	bh=5ahjgsld5ebbNV5QvgkIwQyw+eBnwvmrw39XlF/AN8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DmZbhJiUgJcuWRUxdbN6h+ryqpUHNkwoQTFQs3GWeDc02smmxg+Y8UCxNnFTUhDvC3LrKs938J3aAwyTs7pSWpJ1khYjCiX4+0rQDmHWXLLrT5Z1SBlbsS14fTOfv7wDmTcBfnuQtKKj+YDHhvdbEG0EABs7jQmqSk0qEIoDAww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qy5Ubfpe; arc=pass smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qy5Ubfpe"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-342c08bf64dso259768eec.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:21:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790666472; cv=none;
        d=google.com; s=arc-20260327;
        b=VFHiP1TWOO91r149uaCybvwZ4+ZR/VjoXdlPDBEiLtZvSgOn88sPcbZOud+gTzm/29
         Pl8IYw81yaXhbEM1jGk+rWfMzgYZDwOZNE9DdsvMH8svk44p0gVigkDScgjOmw+dAenW
         ydmnQ4wA9k2fjT0L56gt6qdmh7oMkaFFvOf6RNSPl+U/YQx6v9XCP3+LnTByfWRCpIAF
         zDCV0KTQr1KeJY5MlPvXilwwF3pCDRiam7WrR97WaMaZqv71/AnRSheQsO/PaORun0Y9
         kQ2jLfdM0KwqlAmILwMLqVVwRzT48fQ9UGQ4uVZqKN3Asy5W2f2HQUumeMKnHUu5vpR/
         S5XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5ahjgsld5ebbNV5QvgkIwQyw+eBnwvmrw39XlF/AN8A=;
        fh=T0feUSQFjx0bWv4whUCl9350ZssJKixyxIFE510FkZs=;
        b=N1gFw7UzmLBhOi8PtJFjl+KFJO64XIxvJL3ZY/hw0E7N64AcIOTLYkVPXGxEsLLCSz
         LoZZ6k351OKBf/4q2JkK+ZQ5KMW0PMaiVSK7aXTlIubboYZBkGwJhjkxrAx19YOn2Vh0
         ns8Zt84rcJp4Xmt3PFYuAnMqnsbE1b5wAXnkk97UWxgjDuW6fPwgsZt14mUiBIVmu/jp
         HxxJmk8fPgZ7tHxDnER4ARGEdebvc8XUglkO6kC7Z6JdMTDz45h/Wk2wgaBM1FuhRC/o
         +A+e49HFN3TvVXvtHgtcK/buq1TGoMoVtxkkJ0FAtby5p/CPaPOI/SNPJkqo0b7pSnIU
         0Ldw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790666472; x=1791271272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5ahjgsld5ebbNV5QvgkIwQyw+eBnwvmrw39XlF/AN8A=;
        b=Qy5UbfpeRKpRif5sdpmAvOa5lZFU2eTh4uZwSOV6OLmPfiLIozN8q+chmOWnzZafcb
         WawNtsO7OyVDnwfNZKEy36n70Wv1WUDWM0jcHvvm+37Tk6IywCiuj0Ko67cn2+mbbIvy
         eiKRWQGgbf0+M9xp8/6kyXpidn+0W11ovo5eeUAB96HRtwOMNq4yQDj7qoVt5WFH0gJ/
         AnqR8Trp0k0NYM82Y/mKAC/NP5TvYKB/VAH+WcbtIYUvvfeOsexaL7Pwa1Vi5+SONc2f
         fatpVOcMItsn7t9YtLrmjuJsmxFLP0MCBMYljfhZuyMo9S7GIWJZlJHEojOFrPGI08Ht
         135A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790666472; x=1791271272;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ahjgsld5ebbNV5QvgkIwQyw+eBnwvmrw39XlF/AN8A=;
        b=MzAUXH7Ev68PXcFedRnzRUJrQJH0Nj3R3Th31zbLlRwbOUWX7EZhFNdIsPYLSRZHwo
         xFr2OuvnScquNvdD4LpN9PI4J5BqrErqXe4whq38vSedKEka5as21+yhDi5TbWbAIOpN
         yEh1tp5DsMmNorDMmf8IXQ3xP9ZCIA8uXKumGJmM2MU5JBxqqlilWRzNhefjDf7+VL3O
         7ChDARpTZelO4JfCNPuzrcO/0Rh6Mle/NbwCTh+0K+ZKaD0V35+kBp2eku0xIchHyorP
         gkR1aoaR3YseZD62O8HLEbyoIRsrscx6hOcTsj7r+wsvhx31h78EUb5gYgJkLOgWd+/H
         RvIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvzI4OrVs6UvSy0XyCoQmqampWsyUCbTZvDbe/Cogu4we2pvZ88TRZcj7pmYl1fyPcOtRY3E8IrFzdzMY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL35j/6wlEXcvLV3yUB6LdvDkrcw3DX2Cxa7TnFZsnJkKjkgIPk
	2fB+Av/uoV00fP1N0jS+XRrg1i6ugz7Weyg9cKCLjnWBd9SqWpegSIjoqLJdBNH/SnMLvQZXfU2
	JEoJo8B8xk+4iZlgE1ePgweuEUZ3ymeM=
X-Gm-Gg: AYBFou2gDSt5s3RaWeZIPd+ysvLMM/uSJ3vZPlqSF0bdEGjC2Fbe5sTc93ngu7r09t5
	XkbkIoQdo9v/WBXxWX4eEAYi4UPAl3ChxwOXSVEx4AU4bU2C4Ee0v9Zz+yg9taNv6+dBxQJK+af
	zJY5qzB0XYwDltjYN3lVM2lp/Y7Ucq26d7fBLN06xOQoMWXiBTO2UOeiuTE8I+lY8pyGX4NNQZC
	yknU3fPjgMDNLuBmXRV+m7RMW5Pid9PVpUuPncOL1sXtXUaLDRdd7O2pVmKAvfRtEaczbGeq+FP
	9TGuioavaiOWRly6hoEiC/uVk3AjiwXoYr1YE0NbwN75bJt2+duqVQW1afhAnrQ/5519VJLjYSS
	8U6yQJamlg3B/KJRQYjfi9w9ysmQgD7ZS9YB2nATkteXxhC/uleHEJlHzLp54tJTVvWhIJgJUFk
	ZOSKgmiwUkqxPRJiDEpF9uYb78iKJtqrFY4kP3X96CHOfShME3yZI=
X-Received: by 2002:a05:7301:1f15:b0:33e:6714:3945 with SMTP id
 5a478bee46e88-34271c88f71mr25962029eec.2.1790666472375; Tue, 29 Sep 2026
 00:21:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <GrS88TFpjifccsmrblR3hAxYF6f4xInMyFabclrH0IMtQKZWF3-tOTg-CWN-ZFKrgHY8G2kAArtkzeGOx2k-OQ==@protonmail.internalid>
 <20260928183925.1315274-1-chenhan0017.work@gmail.com> <87bj9htclg.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87bj9htclg.fsf@t14s.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 29 Sep 2026 09:20:58 +0200
X-Gm-Features: AclHuK-u0NH_HyN32s019c0AYOjT_lc-RO6KMNAKCvsTyCxRB8XaGUCfIRG7xkc
Message-ID: <CANiq72kWg-pX36jrJy9M5eKMqRHUT3UUEKTssPwfYWKoseYd-g@mail.gmail.com>
Subject: Re: [PATCH] rust: time: make Delta division and remainder fail consistently
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: chenhan <chenhan0017.work@gmail.com>, ojeda@kernel.org, boqun@kernel.org, 
	fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 9:12=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> We should probably find a better place for these. How about
> rust/kernel/math.rs? Opinions?

Yeah, they should not be in `time.rs`.

Cheers,
Miguel
