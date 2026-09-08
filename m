Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CA14B488B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 20:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788900141; cv=pass; b=U/9zgEUK7XNOCmLjMy+S771sgJO8Gl+26h9tNYQ5ykUgiciTc7g+vus2XRwCbVigONi9U1+7tF0Py01BZjdzzCeHZFN+cudA0fT4Cl8TOMEnsdkpjM/I26TxFyJSo5QVLwAzvY/JzwY3gFfP0TavtAPIsei+dkeUlZfV5mw8LbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788900141; c=relaxed/simple;
	bh=YXw4xZ0v/Cxtbs8sJocHH1yAxpgZyNfN6cPwywVsllg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JmWI3z5vKjhe0AA0y689E6Y05VMt7rxd82r8KHMpYqZD0vtOXbQcmBYj1wLmdGilN0xQrxiLJnPbVfps0VHT13qwyGJD+9E/HP02zPzKK+7tFEn7MSYNnhODZ6Fi2eAUKAZ0iezzziZa46aC294cbAZaHkcVW5MHa13/Lfx4Sxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IXYM8mcp; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IXYM8mcp"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396672b2569so514113a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 13:42:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788900140; cv=none;
        d=google.com; s=arc-20260327;
        b=fgh/bihSPnTLpUyHggZylCTePoCBuw7FqthC+zaXuNRrB5FEpdVTwnnqWRWYKzl0Lc
         NpWkig6evCHdErjqdVtboi9iBfXDf26ukJq37W7vKq9S6q2zCvUgSqTHqf+pu9ozqYD0
         KIBpCtcSQLE8D852M+sO83Blt0dVdIWUFHEqapJ1u55qpSmyvhk9tjVQBBozfi+PXdZQ
         lOaa/uiCJ2pwk7mByywdO/0VOXwDbsWULEP1KjixfZ2NfGnClFrA4+pLi5A0aQJVuUpE
         01wk2FrLgMdhWqXHOxNOHcmXjrvuMcXfhQZcHV/w2l5hdxm0UCoskuZOXejti2Ea81W7
         3NXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZEaDFgx7MxTWxz3lTSDDdfLwOggUV17sJK/9fefp6L0=;
        fh=B/pXi7f+su+/tncxaxDs5A+Qp5LyNfWa1iXNebyDkTY=;
        b=T9D5PEZHa3rlXuD+iWb2yLeP7GqirraYuIWDNzYex5Ymuw/tRDfJtF8L8LgA29SIdX
         g0aIuC8f/MrEPrnw28IwAwLJkd6d4uEWP9zsQT9wCIBE9lFkfoiFW6OGdb9MRKk4ufPE
         Bm8HiikGw45pePs44QHTDNPkapkeYnAXZ1QmogPzVuiPO5RFGYpkiHUG659CIsN5LpOB
         kvK/sq0/kTGjm3Zf9xUzGQ4sW/c4zZL3vssIrTVfij5Yv48EEzczpU/m6KvjUxSsVIqS
         olM6hHVLDI4hsg3TVbxEUq/7Oy3iXZCf/lVpu9EiHnCiIpHs74uYD3/AyzSjHE9eglDp
         v+ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788900140; x=1789504940; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZEaDFgx7MxTWxz3lTSDDdfLwOggUV17sJK/9fefp6L0=;
        b=IXYM8mcpNhyNz4YzUuAiVnm4sPVeUu16RtkboQc+nSoGYzUj5TeCcWe6juvXwMfEnj
         Rgxqfh8R9dPgo0rBvnozKaDDoYWGbKmMANPaWDdC9i48BQMMzFYkyEEtI1f4BYJOGFyi
         GlPXQ8wDKqoeBzajgrDnDqf5ODVXRhgcXs4vhrgP11+0UMnb8eEMyHc2wcpdgc7ZeYVk
         Gn7U9PnMVDdSFrKZrUt6vYLgIuUwuEpLJMHvtDrj9gp0jfa1hji86O9zakLrUYYM6nut
         Qk8JMvJHlls0r/pHbaIhn31ih/goj83to6basZK4u0I+4jiPbFYI8CWPVQA6LQ76GLY/
         taqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788900140; x=1789504940;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZEaDFgx7MxTWxz3lTSDDdfLwOggUV17sJK/9fefp6L0=;
        b=qkhi5QN0azStXK69RxSSzCiUU+oR7sD7VUTGfBGhzyMvn5BaeascqucaZUk4voSFc7
         BqTbEl7UGs+v0bbt7FufVyhSglVQVU9bGBnzCIs6LQNJTChiLqu+oaDXZf8JChwqa8DQ
         lAhhnMv3KMu78Xy5kvtcTPxS9iGpZu5Jn7NwedZ3Dx9kRkzwD9ff5Yg+ys7RpvMqdw/u
         WV9P4FYXM7qAQ16Um7WLsgI9fPg7JHqZ12hkGJ0ofVrD8pGqiV8t1/AhJCB7E0+M9yB2
         j7hd1WsaQn8yilyeoRP/VmmCCVGbU1kQ8c6NzLh2vfh+4mwXJkgwOQd4k+bwdIm25HSr
         8uzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdm7iDOikQyfdcHpMvR2+KtT9wlTLnm5qqlSuFFv3wS05aT8fp29JDLzzz6pSCcDySFxSyRB6jFSut7WI=@vger.kernel.org
X-Gm-Message-State: AFuF++ltQNS3qoHVv0a7wQArKr1rUsQkDSsqjD0nOpba97qOpWH2l2l+
	pTFBiQhBgfVfrATjhc9lqrDBm1TagCnKGwh5Mb184x+uhbDG43KlUMClNsGDKTk7JdMsjirdck8
	J677bjBbMcXOIV7awXUby2L4NvbTENs0=
X-Gm-Gg: AYBFou2VZh7I3Tvd8GkfrEKQmhHm8HmeukGy15EGVRyzwf6XwGlsOSZV2MLTc0ZB1Is
	YTv5OMw9iCIu0JxeRpiBG03sszLWI7DbfuriMyqEe8Ha6hM7jRkgcd/gwCiicya5pjNnDoRRp23
	UbI3CgAIrkSTiI79fC+WGqOS84nLNQEUpezVdgfbQDpVgEs2PMN/Hy34Q0r1+010bLUI3tEKJAM
	LVf/xq+agia2g3iG6alzgvn3xFU/ZFTwa5Zekof1bqYk9agZZNpjQDQTEb7BxlYQQCmZRin9Rq4
	Ubf5ZeVUli+7wqvcrIsMSWfmqDGchUtD/Rw0jLSt9VYSwtHtQnJCqoKfLuAQGT7zC7FlwieajXm
	isbbQc4rKUvGBjyNuaRuyKZfC9nFGZ+jZd8CKqfkumEMMMkGmFhgZd6jKjgJ9jWn7I8y7ByeUuI
	ctMbONmP5oZtfe9rLKf+xI/waMzqO/jjZexgauSXYnwdYDJMbNylA=
X-Received: by 2002:a17:90b:3a48:b0:38e:480b:99a5 with SMTP id
 98e67ed59e1d1-39b3d5e53d5mr20657459a91.2.1788900139529; Tue, 08 Sep 2026
 13:42:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908203850.952156-1-mohamed.osama189110@gmail.com>
In-Reply-To: <20260908203850.952156-1-mohamed.osama189110@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 8 Sep 2026 22:42:07 +0200
X-Gm-Features: AcwNN1XAlwKznncSyvNy4CeitfiGGzd-Pc1KNtKCx7LJ-xn9WktXMBJqmxmI35U
Message-ID: <CANiq72m_9_mSVZreLA1DAkhKfk6cpDf5AJ5zhENwoaosKy-Gxg@mail.gmail.com>
Subject: Re: [PATCH] rust: print: document safety of printing functions
To: Mohamed Osama <mohamed.osama189110@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 10:38=E2=80=AFPM Mohamed Osama
<mohamed.osama189110@gmail.com> wrote:
>
> Signed-off-by: Mohamed Osama <mohamed.osama189110@gmail.com>

Welcome and thanks for the patch!

The kernel requires a commit message.

In addition, please see (and maybe help review!) previous attempts:

  https://lore.kernel.org/rust-for-linux/20260729175305.723486-1-cianmcguir=
e167@gmail.com/

Finally, the commit message should have the right tags, and Cc all the
maintainers and reviewers of the `RUST` subsystem from the
`MAINTAINERS` file.

Cheers,
Miguel
