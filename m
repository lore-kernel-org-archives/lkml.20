Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793606296;
	b=HLaLIYGBa8HsK3RmxncCDXO6MWJtlnTL6bbIsR6TD1svnljvMeaesqwMqyoPIz3vfCTq
	 mL56wbjRIMNMz48dwTC0gu7Vzusb3T0Cz6ZP2QlkKN4sln2mb2bBUijDxXr1Jq++x0KXS
	 FG1Vx1DxDG9CANHGCUVNGp7f2asY1GlogDVaT+LzOoa33hTVcDnDuFHmK4sJXlM6oQ2l0
	 HU69ocJ3p+arlwlfO8UCWjWVqzAZFGip+zSXJ0gZD5i7AtRmzgcUohwLCiCNFZ+N7I4e1
	 fBXU9QRgrP4klOy87frD2oshr+Ui9Iv7QbpLiNVZAPo0vF+qWFKZAUfuNsYFXV2eKsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=s5UC2I4CQm0Z6ciuQ8bM+cONH+EEbufSTZEwfK4K2PY=;
	b=1UVDWYrWnVWm2G3O9lvr8FWS6AkGee57BJP9ofAzl5XxhDrA0dQk7nCiLm71ZcAsd6/3
	 B76EOb5K26OuVagluP4SxeFnsCqMPm7KlWxFHcTuZNyLOHxsyO9Xosaj05r4VjuMMzvFI
	 ZgRYKlhu+qfzvtcauRKlbEmufd3syjViicH6pFbt3HiPXY/DZc4DdFaNnYmYErQMLcpo5
	 j6gaXJ5Ta+52cuR8bNk/EoLNOa7h8/lYMGRlPjfFyFuRYggQ6u5MTv9PxgQpy+ur1Xtfj
	 UWDMKqyZR1Tdqgq0VyPW+1LF/laqX+OoUUF4iyi/mq6WfJqPZaCHgmDjNl9KyoKkkzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KXpgQNl2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38EB606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F38EB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KXpgQNl2
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be4fea434bso3176173e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 23:58:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793606294; cv=none;
        d=google.com; s=arc-20260327;
        b=R0MIDN5wawkbQ0w7iKxBHoGCYyvk8Bo0SoSN8euVW1u2ILD3K0nwba438bgOn1/ebC
         hQZHKu3fIzKKDmUxXvKMxWCzwrTQ9sE1UvtVCXP7BNNopjdIq05TuVAeuSAXnJqlBHBu
         qfraeZj3aSRCclejgNYucTmqbTdBOYxK3kd4mLotPW15sbIPapdcyS5qjtG2j6UkGbxr
         oFaTGrnXaQXn1rF3czKPaWesTA1AQR2x3URdDbiv74C6P2f98YemZZYA4l6dsKApew8/
         h0CwAiLMGZB61b4qumV0NcN9MWuvqxlSxbf103xBnMEfoJD/CR/fh4s1m+PM5EKDCKRh
         yMyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=s5UC2I4CQm0Z6ciuQ8bM+cONH+EEbufSTZEwfK4K2PY=;
        fh=nEx93ml0GVECpj3N7h93N/Z3psAT+VQBfNsVvFMwpS0=;
        b=U1ve+rjL6jWosPlM0Emw1R+VCtdYv1O/2jSmyN7Udnayrz60fSL1IBCZCdDMXe3TOg
         ctSNPhZV3T/YKikD4W5ahFif+qoDeRsjFA4jrAxbAfCPlEptkGiPw82yNS61w8QX/McV
         T8CJ0sUxvZskRgZdTJ16Pp2zbyS1k35aYAPs5DlQvC25Lw/aTkdpfA5BhIbPZq2dVpFq
         Q7K0o2M84H0Yq2AnV4+XrPT4jfpfhWaVQUUHAYFKLyPCfnztaryMoShhhFwCQLoK8Ew5
         PWCxqcpnJbdkzsHA1h/yG70ROTxO+NxM4zIGR4ukFwE3HX0FkpCS2LZaeNQGJFNVKUij
         SfhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793606294; x=1794211094; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s5UC2I4CQm0Z6ciuQ8bM+cONH+EEbufSTZEwfK4K2PY=;
        b=KXpgQNl2gESjCK8S2pYLlOguxWhPx8eGuCwOtddRt4uS8UCTabp3+WEZ5Mct+t8UR9
         fgFYe8Z0ers4XIoDuff56SlnpiuqwLQpJwdIeJ+exXSLtX4Z6uzztJd4ofdxuDlqlW0w
         X1s4kqH887gn3DhWdfMQVgEvh1NFXXp3wP+mWqCyALWKfefUnKVMnPsKrnNqGjan1IFq
         gGOGN9crlbsGAxnxtMqvuhRv+N4JNs5Be+HcwegwlghTi1KyIHcp0f6+q6qqdKuLfSRV
         mytEX70uYtSGP44FjMXeJpPudSZu8pVS5mQDZ0QZAdO8dWrJOEKm3Fq5nPwbSL5isRVb
         6Lfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793606294; x=1794211094;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s5UC2I4CQm0Z6ciuQ8bM+cONH+EEbufSTZEwfK4K2PY=;
        b=0w8yMkJnLOV8dJgzwgbBUeljpt6paUr9nByY7gkluNjSGtUqv9n8oNKs1+INZEBmZa
         Www3Gq0PbTyII9QA69kuOnzq1VujwLgUXSvdtaK/6fkd6tuMSJfMOUv07cbCv++46BFN
         Hi3dp4FMjKLZShQTb7I75c70LydJ4vJvLlzy+rXWx5/klW9pXhLnM+9owG2t8c/OZXli
         SOgUvz/wAoKfh4V2vex4QzJERYMjT/+9SyXGc9bfzVG57bkwVBCLt/GO1w3C2YWRm6GX
         k/igS6Ft/UhErp3uZbLo0Lze4usWLAz6hJZzvIRSITX+AfuQwCFBQ2VIGoVrNzyXx4Jg
         Vpvw==
X-Forwarded-Encrypted: i=1; AKwUvBzrZ6icthafgjyLnIe8m2QoYxXeqVVFvcrlKyYo/gWHJt2U7lzIllPC4gJag+KqOULHc1bbl+rSjlb0z4Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z//jHdL088EDYKM0PSbU5dBWYtSPGXtI6f3uCMuSW0lPNna4CnN
	HoJb1ztq2j00IEaiWf4rNJPy0ygEJREpDkoY8oho+7T9tb0Y08l7MIvqTpAKwWRf+hM7M7iyNW4
	cMlSnvuAeeX+p12WOEm8UNGoMRRZNrL8=
X-Gm-Gg: AYBFou1UcAhze6ZqQ2fPAPLJe1+QTn2VuG/BOa6UVPU2ukriiOFWNZpWQpyjIBN82Bu
	Ovy2oc2AzhkyugXjyb/tDLvJc8dt88UK8T16vcBIwjadEsHsm4NebRJ9jk9IIwZvZssTXWdKAUH
	6gRS7R/SHQ3lPfZ+AokSLSjRbje2XUjf4M8gRsfczNdhAldqIPhwszJMjg5PMOIXgxeZG5V69OV
	z+cKEMyeDvEdv7hefWv+n5+D1N+MA0PHDoLV6OzI+qr9kRxrlbf2g5nXL8HM9XscbYAQfoCFZYD
	COxpfFS/SJ1XCy6wn/EHM9lPA0J34g7iz1ZCs7XBcTeRSlzWsUu4F/7fLPLL+xA7i72AlY2dzlR
	oONUTcEgxCSsBE2UVhIAshmwqfbbxMSaORkJ7zK5jaWCEtQirXkpuTvdng0Iizg2cXeHVDvYLD7
	XJi2AHZaDOIeIwg9Xwx28a7nszpGuW
X-Received: by 2002:a05:6512:ac2:b0:5bf:e32c:523 with SMTP id
 2adb3069b0e04-5bfe32c0753mr1442347e87.25.1793606293854; Sun, 01 Nov 2026
 23:58:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CANGjgd=yr4Zy+SMUsDnBSw05hhn9086NVc9g9SaG0y804=WWrg@mail.gmail.com>
 <5ab06e4740bb0fd177a96e0a31f933a27d081012.camel@gmx.de> <CANGjgd=DvO72NiB8SC3hNEadmxgzy1niN-mnWyY-LGMJ4H=J0g@mail.gmail.com>
 <455d642847fdee6e2a8b594597037c5db9791afa.camel@gmx.de>
In-Reply-To: <455d642847fdee6e2a8b594597037c5db9791afa.camel@gmx.de>
From: Chengfeng Lin <lin2530632123@gmail.com>
Date: Mon, 2 Nov 2026 15:58:02 +0800
X-Gm-Features: AclHuK_bV2mW0Ddmi2MRBQ-ZKn6TlkfVHp3-PejXeX-VEOWOi6kObom6KO74mMc
Message-ID: <CANGjgdnS2ZbyvxyeqsYeD_aAH3PYVaQHXfY_A661GeSUwxK4VQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] sched/eevdf: Move to a single runqueue
To: Mike Galbraith <efault@gmx.de>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mike,

Thanks for clarifying the setup. I understand that you see the effect
when pinned wakelat and eight pinned CPU-bound workers compete within
the same cgroup.

If you make further changes in this area, I'd be happy to rerun the
context-switch benchmark across the full range of worker counts and
share the results.

Thanks,
Chengfeng



On Sun, 01 Nov 2026 18:46:43 +0100, Mike Galbraith <efault@gmx.de> wrote:
> On Sun, 2026-11-01 at 22:37 +0800, Chengfeng Lin wrote:
> >
> > Is this the path you had in mind, or were you referring to a different
> > update? I'd be happy to test another candidate change.
>
> Where I see negative impact of the __dequeue_task() update is when
> probe components compete in one cgroup, ie pinned wakelat and 8 pinned
> hogs used to measure the delta between smp and concur CPU distribution
> modes during cgroup vs cgroup testing, all stuffed into one cgroup.
>
> Do whatever you like there, just keep update_curr() far away from
> cfs_rq_of(se) and probe goes silent.  For virgin flat in isolation,
> that was the only signal the probe generated.
>
>       -Mike
