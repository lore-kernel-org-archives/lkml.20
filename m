Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793003761;
	b=JbjAhjxCKEEl60+yqHSOXeVdsTcRJyGIsMS+9RbrRpqOWoVkBJeTHbnEXwe3YoRcfGH9
	 7UyvzkjhgK7+l6wK9oKawT8G29eNoVBza9HOrz5NLMsujnAjPsVATO+EHy/lHQcYUe0Bs
	 dr+VBGi1mhDHeIHtDqqG57t+wDMJ3KjjoXaPuFQFE6T/mT1AtSJdtKhUpzG87XSWN/RBT
	 aBsotPLZ1TrFO/G7gD4+x+rR1xzkv4UKfFVkL4IkwLZ96EymXD13sv8iCBWlny+Hod837
	 2hYDltFq91+EqrVFE3SwMhXQiWL+ZKg3EoEHVL4J7BYOQL6V+B8OJWJZE07ZwbOGd6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sPnjwjR+QK9Dk/w8gbYkbbIU9b+DRJJdLLT642WnysY=;
	b=uclRqpEBSYwYzWd+LGG8QYUthFHvMkl0H4WnjeBjpedmYI5Wd+CjQtSwmzNl/aMgPrU/
	 TwLYVI2OBDRV2lvTzTypqnG44klaysQFcJEmu4BmzvMa//xHQTO+1VJTw91oS+IUpIOxg
	 KW9QO+XcjjvQTpaO+E/9jZ7h6Bk2n9U5mR6lIulmtrQZ1igMawhcF3nbGM0QGC0knruAI
	 yMJU2InfI7tmQFJLveotvG5XfxIxOxVLmxA2RDxDeThF70TXxCUrRUgXaw/Ulj9y1WAWo
	 kpePeKjqD1rDPj7OBFgDhQsb1LSWdPQnt/bzjnH7MRtsdC8DauuHeM4H37smY0yK7tA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="YCn/AeQ1";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.180
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB60F606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB60F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YCn/AeQ1
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4ab8cb2a6e4so2097328b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:36:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793003760; cv=none;
        d=google.com; s=arc-20260327;
        b=Pjps7fD0HbnZMogC3wvT2rAxZ8U7dJAbW3qV95x1tFXuuMNI7Irmh2KRD/Wo638lUb
         9umotjXXRx+W4za3s+z531GaoO0/W9vuI8tNRg5JqjAdSm9hDLc5cmaNTNYEf06D0afw
         jdMiaQBAfwgnHwuKYvaLr/rjlO/ZPxvS0CUIrrNGpfkmM9pBVCHA+u2Z37hF+x4HimwE
         sylVIFz+fATol9MHoQ7jFvvV+AENKMMrM81RwHuY9iV5EpvgbLNY3R5U8KqB7H3bcdAf
         /iB6TdLyQfPnEbzs1PkYyVSZbGXmV+1JHb5ulBfxnhrEVY4O/4siZosk+D6sAwjjCXj7
         uBEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sPnjwjR+QK9Dk/w8gbYkbbIU9b+DRJJdLLT642WnysY=;
        fh=b2Wp8J83n7BxFyRd83iECoWmjj85xKEK2MHsK9raftY=;
        b=s3nUZMxGB9JAKs/Q40S+9a7LJ1Ura4hWARz4wdsxDB7XgGet+xrUcVgjJiCfCD3S2T
         526fLjo6J8+WO357SR4VPv7g8KoYGKAhH2VJscyhkjKOeYZCzy0T7T8fAqavx8nrqko3
         HVvF8gH6uy8CB+uMHmwnaSs8sM2hD+SYFSdW+0yMzyNiUNbgh3/FmFORWF8/cpzTaSse
         AssMhu9Ci07fdwQforgRPiIc3JGTo68VzrgaQgohKOAEZFERn0qPdbYbTgJrQ7T0u/Iy
         6rzIqXvFP+MS3NHiSeEPgnD09sl3Na9AJ/7+gr4T8lS+Yp2uawsr6vhabAtZuz39vH/r
         wRIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793003760; x=1793608560; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sPnjwjR+QK9Dk/w8gbYkbbIU9b+DRJJdLLT642WnysY=;
        b=YCn/AeQ166/qZAt28aGak4/A33BlqMdpPB+gSVQNTXcpYIHLizALy0AgHE51r5+n4M
         aOgp8d1+9Du5SCf8UiCVBeRKaqEyhUsxwszfpYdGmrLB8iJSrMuu6PhqGAgG/hcRBVOS
         2G30nEHT+EbPJCNHDYqo1qjWt59SK7irA1m2AH8DdXGvp74WbqsvnAwl4XlHFCz6WQdr
         5wCNCcdRY1lKDjRvzd7RxifVf11GcTkaHpjK8cgx+VR5BjA7GwhN1I7Q0QZV3TuYV4Ym
         KZ/9oVjEwjDhRnIrlr0Z7OCNDNFGL+j8hVNxyp+xSVFkoXfAiPxSEZWV0jrS4l9j9hDU
         7NvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003760; x=1793608560;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sPnjwjR+QK9Dk/w8gbYkbbIU9b+DRJJdLLT642WnysY=;
        b=kNCEnXVu48TZYH0G4mqZ69K2VoGMFKwRDKjM8dFQ7zzLz6Uu5JAvSDL5J+zEB8y8az
         1YYBEvvvVQT0/b2rJXwt5qA67U7MZK8fzIwHUz/i0T30x3gwjZxM44ZJFSByJMX4eq5z
         Q7hPTz+OkIzoeIAq4GmQQtuEc5baUA8zwD6x6aQR3LRLIl6yZg/36VgxoZ3+4/RO5jfC
         tVGJW98I8TCVgPF8brnvBulCN9Cy0eCzwVJxi31pbQIrulbhQoz+wqjM1jxirMKiVR7a
         DCTgYvYa7iVIvO/DVnck+fGESURF+z9TP+8F0OMZaHrpEF0aRfSSjZcWKpK6xAtIu9B7
         0dUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxykNkJ2NV042Yy0FHbCdhu31+W2SpqUisqT2SwS4cHWAbgr5nl9vdHjmkkkCYAvemDTKOtsMlM0jHqkWI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsq1o8OcuIAJlWQVfkbqBM6mxFZpw+3bsdtu8abbd2Etw5KRhq
	k+TXHpEFci5YoiTmchPHgFG7vfbXBSLJVH36djejhcqX11XbWHeQnhYOENI64q9sgCOhbJJh0kI
	wcx4MY8bB1mrqOpJB264FfqDjSGNue/0=
X-Gm-Gg: AYBFou29rxfoUprR/kQT7xCG4rr6dioaVs2oU+1IuS99droU0vzGB65J5IsBkOowCjK
	vN7LErk4lJ0F8k9mEA+7e6AES3bBGx4WRkcU1+v6wM9InfO36Y3C1FLKnGyJW3QG4PpDtZ2+ihF
	jRHGrKEwP1StMNACa1hPivmbUp/8OmTET006uy8d6FkILtMjY8Z5RzNnhafnoujcy/PyoHh2H77
	QGewp6nER99pO/p3B0UsFPEm8lOF6/73NUa89JLhA70Kemng/Z5sWZRwulr3r+0c3fWiEMbMm92
	rrdANUl5VYu/SHHEriJ62N6YeMT2bM6R1oikBRQ8ujUKfPt1NXCChHyeCDYXMwNyGeBzUoijsmK
	krKc+pkUNbpcwdHxuiYiSch7MlyTWJL3JAXkpPRH6u5nEDqIaJfEvamNxCc2ZiYNOSli/gQ==
X-Received: by 2002:a05:6808:138c:b0:4d6:92b3:5c8d with SMTP id
 5614622812f47-55c00426714mr3601843b6e.67.1793003759591; Mon, 26 Oct 2026
 01:35:59 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025024114.1955782-1-mmyangfl@gmail.com> <d841a56b-1ec4-4095-9040-cc67f4f91956@lunn.ch>
In-Reply-To: <d841a56b-1ec4-4095-9040-cc67f4f91956@lunn.ch>
From: David Yang <mmyangfl@gmail.com>
Date: Mon, 26 Oct 2026 16:35:23 +0800
X-Gm-Features: AclHuK9B0zK6RkB8B1KTCp3XjrUylRhgO9yQ4J7sUttU6ozFjpO7qEQI6Yw6uKU
Message-ID: <CAAXyoMOfDKR8iRi21w+h3RrobOFTAHcFgVDtKJ6O0BZm3iP4dw@mail.gmail.com>
Subject: Re: [PATCH net] net: dsa: motorcomm: Report error when FDB fails to add
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 8:44=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Sun, Oct 25, 2026 at 10:41:11AM +0800, David Yang wrote:
> > fdb_add() ignored any errors returned by the hardware (for example,
> > table is full). Return error for that case.
> >
> > Fixes: 186623f4aa72 ("net: dsa: yt921x: Add support for Motorcomm YT921=
x")
> > Signed-off-by: David Yang <mmyangfl@gmail.com>
>
> I'm not sure this deserves a Fixes tag. How many entries does the
> table take before it is full? Typical home networks have what, 10, 20
> devices maximum. A small business network may have a couple of
> hundred?
>
> What happens if it is full, and you don't return ENOSPC?
>
>       Andrew

When full, the error was silently ignored -- the bridge kept the entry
marked offloaded while the hardware never stored it.

May indeed be too minor for a Fixes tag -- could drop it in v2 if you prefe=
r.
