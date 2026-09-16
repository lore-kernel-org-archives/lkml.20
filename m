Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C574E80BF
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565566; cv=none; b=IcUWMT7ztqI1VH8Ta+obT9r/R3XcSfdifZVm0uGp0OUg5yDef6TrysN1rk2la1cnKFXlD3Qst9nfKkiN96Qfp/7p/GOdxcPabHqWNgZk33kMMdcVg3+5NBkjfslL3k4QIlOyqJTxg0kS8fNFPukkYvOFY/dx0u8VQCSfJZoci+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565566; c=relaxed/simple;
	bh=2J7eRse2ylA7RXRuyP+C8aDAe5OYglmpzhcByI0nxjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m6XX00PfmFJeUhXjdyHRRGHp+wLgNgRhneMyAgPiUNRt8XRAqw786G7Uj2Ou5ky3n+rJO+QyJAXlOmHJPylUv2JDhkAgxOauMcODAQZ9xsS8CufCbkihcaFuUQKcKu//SrbBnCJsA5xnyFKTOwHkiiHC41vdYlA9ESLVQRgdHdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iLqrYtAv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iLqrYtAv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D26511F000FF
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789565563;
	bh=2J7eRse2ylA7RXRuyP+C8aDAe5OYglmpzhcByI0nxjk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iLqrYtAvCORrfWkMnaxWGhkFy/obOPO1OQebmIS0SH7yAJQmONQhmO1lIRRNkgfrV
	 v8VHEcDJ/Qr5onPHRQ+CYvKCnAH4pgIL4teOvcTvJlTJ//8/r6Kp86sP1jYC2CXleB
	 2kInprLXPeGnqT0xyJo3XDvRu7aQOmecF2UNUnN6jrEieEx+UT/TZn1oGB2gTtgYop
	 76XIUMODsMXZRz6gFmwoVzUTuA8UBdMh4D8s0aAsg4iWn/HFp+RDQMcVD9lA+PSxUi
	 EsgaxUDuVmWEFWXL5AhgzlIQgcJ2mP4dgJlHO2ITeeNojc8pWeM6POxgWoD7Eihl9i
	 4oT+XrbxnGSRQ==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a318299b38so8614481fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:32:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxr5UL7k4MEf7tamxSyS+8sNE4YZyReEfHx6Asd3gXh4L+Dp1yXb+tMo7ZQAWFFz5PT985OfqVN0R13dOc=@vger.kernel.org
X-Gm-Message-State: AFuF++mrsKq/ijEkVq7TFPjDpFYjfs7l3LZ/JBfqEtEsVqomuJrOYvsW
	4volyarUe9S4wel6ofWKKa1B6gjzOURjmn9aS/gV3J4fbw/7dyFHi7hydSGw0habN/M4wJngZpT
	VbOsML/43kZFDnpNry0I88mT7+1i2ZZs=
X-Received: by 2002:ac2:51ca:0:b0:5b6:1a7c:59d7 with SMTP id
 2adb3069b0e04-5b8b664ffd5mr746249e87.49.1789565562592; Wed, 16 Sep 2026
 06:32:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <55267dce42a63e5210c34e49747f564f5cc0b0cf@linux.dev>
In-Reply-To: <55267dce42a63e5210c34e49747f564f5cc0b0cf@linux.dev>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 15:32:30 +0200
X-Gmail-Original-Message-ID: <CAD++jL=KoKd4gLcyxuTTT904oR=EFeVkqQF-iD6qcc-GwQ39ug@mail.gmail.com>
X-Gm-Features: AcwNN1XIhauDEL53Qu0WeLNzQx2IVlVzXQcgLWnShIejgmghe2oHxiaISiq4Li8
Message-ID: <CAD++jL=KoKd4gLcyxuTTT904oR=EFeVkqQF-iD6qcc-GwQ39ug@mail.gmail.com>
Subject: Re: gpio-hog names
To: Frank Wunderlich <frank.wunderlich@linux.dev>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 9:05=E2=80=AFPM Frank Wunderlich
<frank.wunderlich@linux.dev> wrote:

> Until v7.0, GPIO hogs inherited the DT node name

Where? In debugfs? /sys/kernel/debug/gpio?

> when no line-name
> property was specified. This was implemented as a fallback in
> of_parse_own_gpio().
>
> Commit d1d564ec4992 ("gpio: move hogs into GPIO core") moved hog parsing
> into the GPIO core and removed this fallback.
>
> Consequently, GPIO hogs without a line-name property are now displayed
> with a ? in /sys/kernel/debug/gpio.

It seems like so...

> Is this an intentional change, or should the fallback to the DT node name
> be retained?

No reason to since debugfs is not ABI.

But if you think that *looks better* then by all means send a patch!

Yours,
Linus Walleij
