Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792435640;
	b=RwOq3m4mdbqgO4J8uyVKLre2u9iNdoPztY+J/N3koClKLfIlEAnPd8xhHprtTF9S2FcA
	 WMh9aW1nWoRBFwIpCr4y4mXfiF5BrBXuVoxOxi4zSnZWRrg9mXNRWFUJoGujx0C2yLRv9
	 kNW0iARLVXKWJ1vh+Yembpl/vrvnX8AK1Myy2AOQbvw/ZNkkfSfKrhWA7EgS7CsimVWYd
	 WM11UmzjwBQm4O/3CIn45MWc3rFdsDIJg8MwijWeG8Kw+w22Z/uv7ETPF00J/P6WL5xQO
	 auETsP8US5qOQ8yFyWtzUOYLlTZBAlnsskphYJHYxuPUjxZ99KAHpNZXaiplMmt3uHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792435640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=V41ZP6u0L0y50jwnS09ezlAGGz+bWXVLsjSU2rSv7VE=;
	b=DgnEL8MN7ZsjjRHjGFm7Xywkph9gWuFLvOv+0u3tq6tQ4FY/wC7njgVTrE4N4sfuL6M3
	 Sf8cCjGcrlhxcDaMb4zWdrLU3nQdFwjGUyjDIdKN+iaKF618Y1Vw69qS3kSAK/yIhvlBH
	 iQcZxVdYQLeSlGavCLNy2kKzEkwbrgRciX+UFKvZgxlcQVmRmbnAMOviKGqZHiIASpAFu
	 WdsjfA0TkaZtTj88yS8DsErAMsqu5gH4aHxVg1xNsB5yg+VGnkn9ErQ6CANcoclmU5E4f
	 2uISL5bnzT3MX/unoXb7kxw2GrW0qd/+/hZV/lGxLTnFRD5PPAdCYFeSN2OAYZeO/Zw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nuro.ai;
	spf=pass smtp.mailfrom=nuro.ai;
	dkim=pass header.d=nuro.ai header.i=@nuro.ai header.a=rsa-sha256 header.s=google header.b=HdbbqcsN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356EC606A328
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 356EC606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuro.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nuro.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nuro.ai header.i=@nuro.ai header.a=rsa-sha256 header.s=google header.b=HdbbqcsN
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so5230010eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:47:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792435638; cv=none;
        d=google.com; s=arc-20260327;
        b=ohUHaNu5LYq8MOv9/YXmtzmDCP93q6WSjMohYwAkeTF1nv6uaMvrZ6svAdHQbSkB2g
         AjpdHLLkwofIDsYprIuTFuOch3Mxbn/CJXOlSyMja137hgxsKwc62LT9CpfmHfRpkYWj
         uU4hiO7OielMzxxjf2jX3nI5p4zGM9VjPNXEA5HW+h/9X0Iu2/DF72zhEYId2MJKgvga
         iN51FbZjURDYtsGcyWuHnscXMDDWVdO0zKVDgaxSuuSJmi3feKkwqEpx7R+DBQqfBY9+
         Id0VllR3ih7eBq65uFYMXx+kqGDPfa3AVfRYr2TAAGyUg05pePL8yWbgQ8i2Pbnbcd8e
         FFzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V41ZP6u0L0y50jwnS09ezlAGGz+bWXVLsjSU2rSv7VE=;
        fh=ZWhum5diU3e2EhmdhknvKnDxQfSuXGEHVBg5Nrc/r7o=;
        b=JoyNnVNAUPVQzZaoDz60arpYn7C4ArQ0TMH29nxrIYQVPreUdSbr2AwJX8nRrMbGQF
         RXwokAI9WxU/0E+svFhYb9jyqEuIbCGwC7z3kFlmg+Q5Tt0LGLBgk2JRKOy+wzgTCP7A
         +yZauWnKL7EEA7ebDiqPfVFm/uUlNu5ADKU+iy41uqrgWGfP7yJLmc8VkovUBiHBTQZ/
         hlIMKIjAU8dHF7Iju3twnrkdls0WhNqwwSCIH1JtE+3DoEss9VuGXglSynco+4bOKuI5
         H6YtMCzLSBDbomRyh96FJ0HxL2fDjacju9Q52rtDVmrjvN87Y6PnErVYYBeX7hhQXnY1
         orcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nuro.ai; s=google; t=1792435638; x=1793040438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V41ZP6u0L0y50jwnS09ezlAGGz+bWXVLsjSU2rSv7VE=;
        b=HdbbqcsNlbSUxrGK0SmNnBo/A8+7Z+3bpX9YyDHWAVZxEML6XAINgzSNRLVOOXEUQs
         Jt2tpwaSToRL6P1ArM6DBqs5sUhi51b83zmoHDlV5dJYi8u/bxfFd+/X8pWrH2e7e5w7
         ff+XriQfkNLGt/CxhAm/5mtuxZFMI5a9dquBpqYz4sqUy8nzhTxEZqYKJl1FPBoiAXME
         3tmvJCY8a7O/j2VLR/hdUrJMpOhbNikLiFTQRH+ysGzJNaVi6Kx4Sd2jci6bNu75rBGZ
         P7f9HWxX7+q9YalVM3aMYcs9Z/N8wc7HGRjmIUdJNbdkpodeuQUWDgh2xdUUNv5y0cpX
         gdug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792435638; x=1793040438;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V41ZP6u0L0y50jwnS09ezlAGGz+bWXVLsjSU2rSv7VE=;
        b=f0t1kDJ76uO6E2C85JD1jutIRkqpNz5pdC9caTRvLS9VOmBKhlc7F0Y41ZQozuySTL
         bNbjOcMGH+Owxb4fwiUmRYpt/0/mZ2OrV4q9eOZ/LH58MHeN6FPqLtTdLoYUwDTKII/9
         WsbGQaNwOQEOrZAxoSHApJCUdG/in+dQf90CM6gN7Kc/fJRKyPgiKzG1i6hIwKWd9uge
         z/4omEAeV9bLhvHb6z6aZ/V38nSH7dWh38zF3iajL8zC7QjulyEhixkBmD2HPGC99anD
         cYqNd8qrGS26eyZTB5T1G6HwkxyljEkVwfNFOG5iI0OvupgvDCH7GE7KBvpafYQMpCpM
         0J1g==
X-Forwarded-Encrypted: i=1; AKwUvBz1MRF1VGZ5p5tp1+Wn4oKMxJPeJ99mCAL7T2Xfgh4KoypQpK6Im7uTto82vHb8JeBXg3bS2VL6UxGxBEc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCb/8Vol+fhgzP6npnFDQIOLY+MqCcq4rqVICfkfRLqPFd6puR
	rL0DVQNAy8jrZx2uXar8f0fE/AspCiDqNR91XE4HYjm9Ehby5A/+5hJxtmKqvXkQth6Gk1+tH3w
	Tt1foeO4KT98Cl0HahxyJLOXN8fUzACTNXbODZ14DTA==
X-Gm-Gg: AYBFou1xV4HPBDwgixbHO/vznGtBBrgfdIchYWdy7tiZGkqoZ77UiGEM3zpJN2FuWbt
	AyDvVMeAR/4PDT1aVFBBVplK8ALP9wm+U1F9XXYii+oSTsQh8trczzTQev9JqvS4xIgGWmN7ySB
	MGOLwxfQawrB9jQbH4iCVycYXK8Zk1oJde5HHMli/vJ82ZN8V0j/ERjhJ0T//lpHDEFg+I2xrbn
	0rkhx8chcw/PsgC9ZuPFKUQrsf2Ib4qNhmgcsFmydTBi/bnjAVgjWSvScpV9jYDcWTJGLwSDJ4P
	R19oc0ta5WwL2/TF7ZS6IIutiTDZ38aEH8+RyIJam9VrJAPS9xN/hiS2FLtctyYmdg==
X-Received: by 2002:a05:693c:808c:b0:353:7e28:9c58 with SMTP id
 5a478bee46e88-361a3323b50mr13739930eec.41.1792435638102; Mon, 19 Oct 2026
 11:47:18 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019174258.1375583-1-jkain@nuro.ai> <CAL4WiipkRkOnc_QJ51g6_9uB=pTeCSp6U8L-YVD2ytuZn4g5Qg@mail.gmail.com>
In-Reply-To: <CAL4WiipkRkOnc_QJ51g6_9uB=pTeCSp6U8L-YVD2ytuZn4g5Qg@mail.gmail.com>
From: Joseph Kain <jkain@nuro.ai>
Date: Mon, 19 Oct 2026 11:47:06 -0700
X-Gm-Features: AclHuK8UH1QOH2EFc3ZT-WkryAT5MFnjmPJLltAW_ky2Q_LYaLtOPSHKqrEXEko
Message-ID: <CA+Y90PjRyR2czC_Y8G3wdttj2YoDMb+OfPDR1_KGhbu0rDquxQ@mail.gmail.com>
Subject: Re: [PATCH net v6] net: schedule a purge when the defer queue rejects
 a free
To: Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, kuniyu@google.com, 
	kerneljasonxing@gmail.com, bigeasy@linutronix.de, clrkwllms@kernel.org, 
	rostedt@goodmis.org, linux-rt-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 10:58=E2=80=AFAM Eric Dumazet <edumazet@kernel.org>=
 wrote:
>

> Say not to very verbose changelog, that nobody will read.
>
> Since commit 844c9db7f7f5 ("net: use llist for sd->defer_list"),
> skb_attempt_defer_free() increments sdn->defer_count before testing
> it against skb_defer_max, and keeps the increment when it rejects.
> __skb_defer_free_flush() returns early on an empty list without
> clearing the counter.
[...]

Thanks, I'll use this changelog in v7.
