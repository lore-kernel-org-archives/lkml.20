Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792982177;
	b=RjuR+sqjKT/sBouDA9jDnKsykMbLUOlYeUX13GmtZmoHzQwvxMnkAI8LGAHiqP9hJLwc
	 FAsyYfiEgciqFQlqRv3dT777sehWW7/F1rLyin7zy+ap3BrCmZYrfNa7oI16Qo2wp38i6
	 uw7OOTTFNSnYDIpcR245UhmVobfyBGOkdsI9gdGRPNoerNftPwAQNG5G894YoxdGyabt1
	 gGePdrzSkmX5r9wEGYwisE7UnLsRtK3/XfWfdZj9IFenJ/l9GYdAg/tuVhd2HYpzPfbM6
	 GjrqBH99nuLu3o1buyKAemQU/f12cWgY3VOA3Wp5DtNzjbj+feLSdwjYbfALYyQUfKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792982177;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=opVpgEYV9gBtf6yQWstiOV78EVjFTqAa0i4kc/jTqnc=;
	b=aoI1lXOPxN0Hpd8YapQ6wWomqCPbcOQHaupCvjMlDEfuTR7+L9SxjoCa9R6z77XhnopA
	 6uDECRunArx7H57Wu8I5hDElpfq2Ka5sOxgVahX87lp98pjDtLyKUXvl0actgB8X2t0LC
	 Sg6cfxLUlbZ6z75CxOV7l1kPImEHoa3jFvRE36flhNwJ50w75Zm32XnaozNyUCxh4zop3
	 zGz0BYkEE3h74fd0JOTBPMgFmKpC01IBFQI8B7Zq3C7GqljTTL4rvrqJwqA0SfIGBmG5r
	 kIBoG/3IrQaCiz/TItVwIyoRXEYyisjSX/wewA2DBuWZnLhXl4jQwbpJv6iX/KDt4jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=ed83bYUX;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F09F606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:36:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F09F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=ed83bYUX
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6aa8d04fcddso4840222a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 19:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1792982174; x=1793586974; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=opVpgEYV9gBtf6yQWstiOV78EVjFTqAa0i4kc/jTqnc=;
        b=ed83bYUXTCIkrhzksy4x3pzmpKMBgYQHrvFqoBH540ywzekGYs0w8L+Na+thNsrfzu
         gp+m5pREcmBAjD4TTrTfILsxc6CwxgnmqRQG293eNQDvhmXGnSogegooX8jlsr8k/FC9
         qA4Y83KOjl0sUKdoArFVQSHIuyAlTmmpc6634=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792982174; x=1793586974;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=opVpgEYV9gBtf6yQWstiOV78EVjFTqAa0i4kc/jTqnc=;
        b=NgQBCnHYVa101n429pXBsINyXgHZGVjJB6RigCKtjgxeHH7/PZx3ybCllijeMyIrVi
         qbT57zNA0r9y1iQ+BfAqAjf2pKvFZtpZw80JpzjwxNkEG1eRrD/irgFZQxWyjGJ0wa32
         Yu+9WupI24P5+1jze4CeKXggMJne/byIexMXx3Q2oDVnMKpPbVTviuwLry+3CvZyXLrH
         vPqhIU5qsi5jRkFtT1UcxtUx0MXwu0avaBKKBo5El2eu8goDfzBdC+Tv5MzEh9Hmkqpi
         8qgSaHWDYmpAmqd5CKzqrWgV18M4BBcM7BaoOobPPIFDljOJx9PP1gZAcMyIJB8f7eh0
         t+4w==
X-Forwarded-Encrypted: i=1; AKwUvBzm1NAvByYwnCMKxkYy9pGxsXqqP7HLHCYE9gVAT/wCVr949lSt4KPIt3HgrOhSbyPPU9Nw+Qwt1IquHGI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/hEC4XagS1wLuXtIy2BWob0FUZSladqRMLVQGuthRqSZfaafO
	nGBFQAfvL95sUmNxbfVVp9SxpTN4BNk7c8jZrXV2JjEZD7S6HH/U07oGLxAmt1UZsVVLf99B55a
	nH61SZkM=
X-Gm-Gg: AYBFou3kr292uHXR0zE8df87APbFnPd2six06LBb3Vpb74QZHw3FHfsynZihj7MmAID
	XIGUY83mFcePyRRTtAAR3Zi2woCcGJmBti1dLO46Hwj6bljJ21UU5w9yEkW/ZonqCddR4Rc3rG8
	pmA8sD8J0u/boqTFvfHYG/VCPeHuZJfI7iCeuozox6I/DSvzIHsuXkxa9AxbhzjER4Ks25DiHdU
	lTWPqlx0bU2O/vkuLxcDTiiZ2IyJcqIbJ3GAcfAo7MUHn/cuBTmoiviunct1kA2c8eOEfhm15Re
	HVIyEkC2o/vdhYVJ34R+mQcWAS2k5zG7WndbT2Xw4tTS1NLjRF9VpPfI1dP9K9coJ+GzzkSHDsq
	JivGf8Y8k4jddOX3TYHmvzqBdSL5qnqvkEAeVkavjKKa318cQKJ7FifGFo5N6Jx6pTNzIxcwdwJ
	pTqXpcMswOdnON8W7rAatIwU0xDesn8+94ri2xJcTss2SccrlGXc47SXUs7Al/T7ooo/Bm+dSj/
	VXJPQoQDIbL4IZVN2ag2pVZrcHjwuUaFOt79lMZXNFVPZDwed0avH163lyDKXItc062eRr1eIs6
	CdPfFr2cunhUMF7EAv9enVPttEE0XA==
X-Received: by 2002:a05:6402:42c2:b0:6b3:d0a0:39c9 with SMTP id 4fb4d7f45d1cf-6b443a23971mr8230399a12.6.1792982173889;
        Sun, 25 Oct 2026 19:36:13 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b467e42f75sm932774a12.23.2026.10.25.19.36.13
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 19:36:13 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c46bd7a7345so202292866b.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 19:36:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxO1r8OZXisWzCNNMYYx8LQD+mCCLmobRDL4CNew20qYKEs/DeIEv+NAjCYSFKplU2611rEAPfTc/snpvM=@vger.kernel.org
X-Received: by 2002:a17:907:3e8d:b0:c46:7fa4:9212 with SMTP id
 a640c23a62f3a-c46be5e3d65mr763708766b.23.1792982173252; Sun, 25 Oct 2026
 19:36:13 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016-vfs-v74-41eaf6c4712c@brauner> <20261024-vfs-7.4-rc1.keyring-db88a8f3b5b1@brauner>
In-Reply-To: <20261024-vfs-7.4-rc1.keyring-db88a8f3b5b1@brauner>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 25 Oct 2026 16:35:56 -1000
X-Gmail-Original-Message-ID: <CAHk-=wh0gCvsC7A9z_H7her218kSCmd16dqtd9uMfO5ZrSvxLw@mail.gmail.com>
X-Gm-Features: AclHuK9j_db__idbNB1VD4BAB9oEUCi3kHT1x-yRvpTXB0AMWOknVyDLChen_N8
Message-ID: <CAHk-=wh0gCvsC7A9z_H7her218kSCmd16dqtd9uMfO5ZrSvxLw@mail.gmail.com>
Subject: Re: [GIT PULL for v7.4] vfs keyring
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 24 Oct 2026 at 00:45, Christian Brauner <brauner@kernel.org> wrote:
>
> Neither keyring is linked into any other keyring so request_key() and
> KEYCTL_SEARCH can't find them. Userspace has to scrape the serial out
> of /proc/keys before it can add a key to either of them. That's not
> great as any user can add a key with a newline in its description and
> make /proc/keys show a fake .dm-verity keyring line with whatever
> serial they like.

This explanation reads *very* oddly. It doesn't actually explain at
all what the patches do or why they do it.

Instead it states *another* problem entirely that it doesn't actually
fix, and almost entirely ignores what the patches actually do.

That's not at all helpful.

Yes, yes, that *other* problem is some of the *impetus* for doing
this, but at the same time it is absolutely *NOT* an explanation for
what this code actually does, and why I should pull it. It talks about
what the patches *don't* do, and rambles about the background, but
nary a word about what is actually happening.

The only explanations about what the patches actually do are complete
and utter nonsense. They claim it adds some kind of "well-known key
IDs". That's complete BS. There is absolutely nothing "well known"
about any of that: they are completely new random key IDs that nobody
has ever heard of before, but that are meant to be used as fixed known
key IDs.

To clarify: I'm not pulling this.  The code looks fine, but I had to
*look* at the code to try to even guess at what the hell you asked me
to pull, and that's not fine.

The pull request was an incomprehensible word salad that makes no
sense and doesn't describe anything. Please fix it.

                Linus
