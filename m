Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793275515;
	b=DdEUjAiOusJiFf1HuA8INxPgleTc17k6FEApQhV/NlscOxqOzRKZpPJegn6H8YioKdtl
	 wnWH9aAmYZBlz76EfkHFIdHIMKv6D+tUYCTJev2yMqsuAHZhT7Ri58hKt4CO31RbmxnPz
	 97AqCf/VXB506nJdMNK9ffI+Nv+BR8jCm6pjId3sDoV7F70aCUKlI94LXb2NCUTgXVaQs
	 si4mNtDOQrc5DhivHthCS50svV24lKzem7iPVg0xRUxoR1tcOS7LBAoWP03+N8Mbj3Sjy
	 ZmPOWpS+ON2BGL779vYmWkIR4q0ie3VoUiOhn2FocKCUE68ijiGIkQuYB/QVH0gdEyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793275515;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sLpzNdoElMhQ6QaainHoNQa+2HJPLd9vbGUI5B3uIt4=;
	b=U4VbyVRNCS2SylkkwIbPFpS1XAs87RelE9+NznY6K7FsUdR+nAA2FPFVz6reGvbIcBD0
	 vA5vJwdYVzlSxYyAcDkTpTyH6gOfglFUctfS6zXXaXvbfZZiaRU/PgPL4QQZ7f0YUQO8d
	 VCnbI969+Q5CmzRiUmNvdPegd8exIRsWg2kr5cpfwDoDllF/RUpR0iTtpmuTjOWRPXnPS
	 3CKX+6ME76sU5PpuFxoeSZnWpeGX0/R8GVA6aeehG9f3e46EiUFgTMNsx5DE6uKEjeehV
	 6oZZnpAZTamuOZql1d5yrTXmXNjotU5mEyaIiE4+dNcym0KDQedDujL/mhgFhVOUzQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0eIjHmej;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD8D606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:05:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FD8D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0eIjHmej
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-43bf9548df4so1795912fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:05:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793275514; cv=none;
        d=google.com; s=arc-20260327;
        b=OCTTrWaFDcYYFyRsC84kwlucU8x1pkM3w7Dl4MLb+EvvDVkhE3Rhzz4+LCPUdW4Piv
         DJ5y9WJUnP+aokMIEba2aW3OGnQwpkUFV0pxDVyl2lv1upU8QlyAhJ2BXFa3xtQkrlEH
         QeWRMdF1Pvw24mW5HTP/oVdvj+o9I7KdLC8h+KBn0uRSSrdz2sZufTRF9pmGv85gZUNj
         IW4NyYtsFOzJbBOARpNzSUkUoiEuNMxlJQyZyvW2R+7Bmp1hFSclSXC3H8SwdTF1bi7U
         wdhh8l46y8NgRdXYxFiVi5c6IhOuMdS2jJPZfDdQbt6nvo13VsxbtL4FIlseAIaKoGFN
         9USQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sLpzNdoElMhQ6QaainHoNQa+2HJPLd9vbGUI5B3uIt4=;
        fh=TCgJc20jCDXKgxl5AFIg8/81aBX4H0pTNafrhEyzuMI=;
        b=pHMlw9PH+3eqv+wh7HwWbxc62SfcnHqXJRADXMe4L7Yg6APs0kxW9icT30SFfAhsBY
         U6P6YI+GlKmB5hIXGCBieQTTg6R2ncGJVpZVHlbNM1Bm98754MZRW72d0rQQVJMRcPqM
         MpRRG6THEZuamxj/uKX0VwsTfSg8oq58X8gV92gApUiYwQTY8ZgLAHzvnFzqW5Ig4f3I
         DB19kuo5KZom7ox38uTMcClkKgXAVS3y21pgZqHn/gI9yd4fHSSsbZQrPoFXFDw1p9x5
         5RQv2S2j9Dicq1cUmWjULpI9vQswXC9bVrvj4aRYm/Sad2arqXckN/QWbHsIZfSK9X2a
         DADA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793275514; x=1793880314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sLpzNdoElMhQ6QaainHoNQa+2HJPLd9vbGUI5B3uIt4=;
        b=0eIjHmejaUp7aRjz97Gv5XUZehJm8T4WjdCKaoNIe6g1mJZ+asRJkxUQaU0jl47SRP
         0furBWfW79iiyyGPl80iu9d/iAZeOUMEy9OXNRC+WyT1fZGUUzYWEo/gSCCyTLdWZDUe
         4ubvDhhDVEHOgDY7b7ubGPtOzFVvv1nacUIfzEVu/YlO01EOvFr3KEuGblEBUk0yhcY7
         fkVHdHSkjDyClJ+xjxnziE7YM+P7xvxV0oSn+sDffwMh9N0/G2/vCDEj7pkG4D9P9rJQ
         foRmAgMzVLnGktdC80DuZrFMMMPWs0Ejnj6jhGpDXUeoKxLuIAWqJwdPGW1CU1SgxaBR
         IsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793275514; x=1793880314;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sLpzNdoElMhQ6QaainHoNQa+2HJPLd9vbGUI5B3uIt4=;
        b=2IW8NIR6d4rQ0bplOw8vv/KOrmVAPjfXPowe4gQ7/oRTB0mm7Ilt0BEGdg+pnzQQiG
         OBVKwGvSilKcjWT+DnqDV5/bGizz9pLHJ94njyeEsFJ6Nm+3NrIZ74otdywmafF301Wu
         lnEiB1PiAxKZxgiIUmFE6GGYx9L/hy8qU16mH2FQZiHQJPy5wDcruM7aCgOm3gU/yzL8
         CsFFHaiW2GvXONJpqdXWQnTHhEnW/MN5TmwjzCqRBM8axE2/ALDf9IocPei6xUOZsWEh
         vhh5QgkCr/i/V1is/8Thv4McKXRgKu0PX3Bta+FwOAvhW5B7QaHd3sjWE6oRRZo+ofn0
         f46g==
X-Forwarded-Encrypted: i=1; AKwUvBzJlS2xt0/lcxMKV2ZycmCoVaYDLQDzn2stseFeIdKmylAkEeeXKWGUEkV6sK1AAkVAFJ/YkKH4elUeROI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2u1ZHNkaghHWJruaLNf2VJtKNirB0A9JE5sXPq7USEPG7BRob
	oYpOOC9UQ5dOJAYbuS6ffWUtBHrmtiX08eR1wwZK3l4vMqfzyCkCOoABsc3YTwUWDfCYldqoZxN
	msJ149pXweJ6p53w8uwYclKBhPfBnw+0=
X-Gm-Gg: AYBFou1QBClcIcWEraueea7JjI4nqsHGy5V6IdI1STfhvfXeSAFsyI6DU51UJmhUl5A
	2cQ3AF5NtqVveIjdGwzgMsbRbdQZaugXZPGbWGpxpPFDy1tZWono3G6Rawpp81AxAOsjYdEmiLy
	qNikyMnXyAJZfodX55XLN9biC9xwllTSH/DpyH4WtuPtff/UlWku9PleDfMubRtZTHwad6Lnv+q
	HfBDs//4PGElTJBZt/j1ow4AbWOnn8e9toQTmJPqkaRWSQpvVvDBE/UgsBMMJeutHFsobC6kBI4
	waKT35+Xp+2rNOYiG63dwFv+wzmPZwySoxCgS/c0TsSqBUsPyCbq5j7TWYI5M8M4CcV1GFbGPCB
	85U0P2TYLnUry0icaw47zjv5aChX98V2LP8iG
X-Received: by 2002:a05:6808:1828:b0:539:c292:8b04 with SMTP id
 5614622812f47-5637ffde0bamr3891526b6e.8.1793275514190; Thu, 29 Oct 2026
 05:05:14 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CALf2hKveij_sHgANY9Aktm1dPa4wfKjKNkHyp9yPbjORWFXagA@mail.gmail.com>
 <auIbEZv5macfZ4aq@kernel.org> <CALf2hKty86GatQ01C30j20oa+TeVdJRvbX=a_+0Rga33woJ6Lw@mail.gmail.com>
 <2026102915-safeness-snazzy-a36d@gregkh>
In-Reply-To: <2026102915-safeness-snazzy-a36d@gregkh>
From: Zhiyu Zhang <zhiyuzhang999@gmail.com>
Date: Thu, 29 Oct 2026 20:05:02 +0800
X-Gm-Features: AclHuK8zRhRPaIrhF4m_S98aD3-pZNqJmm07Lao36pBAALpwRoRGtZ4pi-ZjGic
Message-ID: <CALf2hKv6KAFJTyDBy_yqt7QPvA1ewZHzBxchAUmcFxSeNXghOg@mail.gmail.com>
Subject: Re: [BUG] watch_queue: RCU/info_id overlap leaks kernel stack
To: Greg KH <greg@kroah.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, brauner@kernel.org, dhowells@redhat.com, 
	keyrings@vger.kernel.org, linux-kernel@vger.kernel.org, security@kernel.org, 
	edumazet@kernel.org, ncardwell@google.com, lyutoon@gmail.com, 
	tpluszz77@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

> The documentation also says that a patch should be sent which I can't
> seem to find here, am I missing it somewhere?

I'm sorry for miss-cc you. The patch for the watch_queue bug can be found h=
ere,
which just got reviewed by Bradley Morgan <brads@mainlining.org>:
https://lore.kernel.org/lkml/20261029054136.1174216-1-zhiyuzhang999@gmail.c=
om/

Another patch candidate for the relevant netdev bug, which combined as
the lpe, can be found in this email thread:
https://lore.kernel.org/netdev/CALf2hKtiCaiabDQGpm+jzy7VKgMr78eQTKGsN10aXp0=
JfaOhLA@mail.gmail.com/

I am waiting for the maintainers' approval to send that patch.

Bests,
Zhiyu

Greg KH <greg@kroah.com> =E4=BA=8E2026=E5=B9=B410=E6=9C=8829=E6=97=A5=E5=91=
=A8=E5=9B=9B 14:43=E5=86=99=E9=81=93=EF=BC=9A


>
> On Thu, Oct 29, 2026 at 01:06:28AM +0800, Zhiyu Zhang wrote:
> > We will send the reproducers (including the complete exp for lpe) to yo=
u
> > and the relevant maintainers privately. I understand your point that a
> > similar reproducer can likely be recreated with a few LLM prompts.
> > Nevertheless, Documentation/process/security-bugs.rst says not to
> > publish a reproducer for an AI-assisted finding, so we are keeping it o=
ff-list.
> > The same guidance says that AI-assisted findings must be treated as pub=
lic,
> > which is why the report was posted publicly.
>
> The documentation also says that a patch should be sent which I can't
> seem to find here, am I missing it somewhere?
>
> thanks,
>
> greg k-h
