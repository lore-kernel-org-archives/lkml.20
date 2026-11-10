Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794351036;
	b=UskfhhEZEZLVxZ+6BxIz5TWACXti1uJBKKwnlONdXPUiJTFsH1qUyHRA2+d6NdwlxTb5
	 t+1wWDmMSAJGU/sK6GNLY7CvsDXgSfrYFm7P/4VyVjyGD/7/OIxRiZibN5srgAsXEkd1M
	 KqD/B73+P+lijBNOk7uLL2KqbMMEqQzrBEAvu9G5wOwWyMsSBBXEaXQehEV7aGMp8t+II
	 J5djLaMXjF99kPhf3tZKXrRnkv/Q4BVpLSyDUlezY3VERYDONg54YCEZz5rqUbIF0PW30
	 TlueBdRsFfOwWfzhwHo7pskWRT473IlDjs+8s++bjL2WJa1JaDqYSTj4A2/a9REO+rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794351036;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=2rAZbSVR4elz9tWfRB1OhpDE5c8G2VZo7vEvkdHOtIE=;
	b=ewhvjqIesVt6pjJNVumyIi/9GiRw5wd5My62dgqWfQGI/dvN70KDV1zj5BKluLkQSUNP
	 SqCk67G2bpzjJyZFVs6wnANbuAj9BHBp0libhO6mSWyYxMyQ9NGp8db772dRjywpHKbwB
	 /0SqRTatdaBKsYUzJTCRseQks1xvP8Xrjzf/xZ/gg8n5uAD4ZI5eGPLwe5K2Hnf3qqJD3
	 DuNmEdnuNe/uqq+bePwAnGzVNqRm+51FQ6k36aEqzhDv3xaoeriGum2g/l6IgZi0Mc+nT
	 G4WSoCQOp4YTaA2mtt6TeJ5Aup4Uz/U+0YgjPz4JGCgvZVnCrmP2J6J9AzcxLZK73Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QHUhA4Fj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC2E606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QHUhA4Fj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 567261F0093E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794351035;
	bh=2rAZbSVR4elz9tWfRB1OhpDE5c8G2VZo7vEvkdHOtIE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QHUhA4Fj/xQMXxvNGmL5QQIfnLIqWbWmaR6Y3SZYDUZYNnOHONGtIQw0qGT6GG/FD
	 UqFxQiudbziTU6D4BH4p6f6M+quserjylbukzCCOJTS1x/UFYafaYnj63T3lybDIJr
	 R1aD+rgT0Nu4NGkBfUl84Wfg2XWzG0ROdbYyxrir0/8/Vx4/P37a8u2Hn8oKdsePoB
	 SwvyroBDHOctHdTninJFegMNlWsZdO0uKmln3x/TjoNtmQYMfgE8AeuyG63Ig3WSCx
	 hMcQWl6XcsJDXYUubsh+eqwtTy96hD+fS/yLuMA2jRxTYfrn96TcEseWcXhh25aYyQ
	 qVpsWPCfI+2mA==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b581b6b0e9so1425075a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:50:35 -0800 (PST)
X-Gm-Message-State: APuU4Z9eHhenSQXnWlz5dKWV/QIsOzmcjMDdnHqb8/CpiKw5YqHTuMRu
	P5LDYLgUlI4Zq2LoG0DJMwGWsonPA7HqC8Gh5APBCzlPt2HYxnoMgDxhAUYR+6pkt+yBw1/ewmg
	7PVNMjS76DlAkwlSVCbiQtnI0X66e28U=
X-Received: by 2002:aa7:d0d7:0:b0:6b5:65f2:5d7e with SMTP id
 4fb4d7f45d1cf-6b777852839mr357649a12.43.1794351033967; Tue, 10 Nov 2026
 14:50:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <avNHkkbVKqHv0s8Z@sirena.org.uk>
In-Reply-To: <avNHkkbVKqHv0s8Z@sirena.org.uk>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 11 Nov 2026 07:50:20 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-Kznbsmv_nYw0nyk739YDx2vmisBNVsYe+hnBQH5nySA@mail.gmail.com>
X-Gm-Features: AclHuK91YKKZlxU7_xyHcIsQRLJA77ZzimnfR6G5eAIsZmp2G752Gk_PGPjnRmg
Message-ID: <CAKYAXd-Kznbsmv_nYw0nyk739YDx2vmisBNVsYe+hnBQH5nySA@mail.gmail.com>
Subject: Re: Missing signoff in the ntfs tree
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 1:34=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> Commit
>
>   926d2928270a5 ("ntfs: convert a named $DATA stream safely when making r=
oom in a record")
>
> is missing a Signed-off-by from its committer
I have fixed it now:)
Thanks for the report!
