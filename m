Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F4031E82B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787927676; cv=pass; b=OEK+DTv0STTkaTOaMKdH6dYYQUkHvEQoRYoG1QI/GnMsrkWaBSbT529fBPdZSRahU0v2zkRM+IfoIR9PqjTKx7sEu4E0Pqn0hAbTnvXJeBbii1lDLDern0zahIm2Y1TFLYooJ0WDn3KqZKWFSJTIcWDY3IpqDIA3UFjazFI9HiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787927676; c=relaxed/simple;
	bh=xiyP8E4wV+sMaqs4B/yZCVYaphrCAtJm7nVSylquv8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=snRL9GKrf9mhxkydfZ+HA/rk8Stj5xjd4Qkf8qV+Vcjf74avBtFE3zRGjKd+iS8020AVUGIeIcGzbVUwtoVV4ha2JRir3ePJPioC3Hf3Qix6Uf+Mp2OnQhM7WWdZrtHA7ddDCrDoyGmKE+DdcEKCDtg3marlPmSFhpSSv3WV4CA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A56I2pMP; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A56I2pMP"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-52de178a66aso7720231cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:34:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787927673; cv=none;
        d=google.com; s=arc-20260327;
        b=Uk01z1v91ersEQUnsqw6U8QvUJpgtResOvskRRzsmCTMqz6vFynjUvZC6kG2U4Quf6
         6yhWq1t8imG4jbXjShVKa5duH19HKJLLolGq4OlfFeA47R/ICK+JslB8q+bSnpnn2Lcb
         mF12vPAMdL6JwhkY+FrKnlpqlJwPpxEkwKZ42ohclS3V1sPgLqb9oRAaRafsm45jsX6f
         ViPgJjofhpEUuZKnI4+T2IJs3hvHqEWSsqlwvTJiavCgTz7HmLTp2ucSUBhIIffhzru0
         YDbB/a4nK2TVUE/J1qZnYuRKwwm8/nXqvDWK8d9MBu9T4y7fS2dR1p0zISX0y72Im7J1
         HFKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gUsOtdOdvL1xoenFKHekMoY65j1FyFMLBu32Ho5vB90=;
        fh=j88CEb4UOWErIlbTD/PyC/NPVlJoLHQSWN3Mj/hjQZ0=;
        b=Cp5Jan4QUM9XrWeFydKwzGxuSh+DvnQbqfP7hagR0VrJbDMDuZyOxPbUBN3pcdJ9gH
         VSo99eJvr6V+6Lr3z/gTA6kRGFt1/jrnoLt62qG/8vEsqIeOpI3/KSxJCIt31neIzSof
         K2uIt+MwRkpu0LXvZLWuQ3BKckqaE48P95PaSSYhkxczyqk6/k4RLYdZgNQnn+ORZx+U
         hgLVQqXC73IRRUy2EpprsyXM70aCSYLiFd2P8hNZnh2z8iL4sSO7eMy1hxucR6Aq2I09
         fsIrAq/8WmmMReC5s8QQ04+tLwDabQ0Ll5x67hDFXbFVUqRimwBI/yeIzcZOu9X33aI9
         Q98A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787927673; x=1788532473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gUsOtdOdvL1xoenFKHekMoY65j1FyFMLBu32Ho5vB90=;
        b=A56I2pMPzIBPMpKduBgM6i7FC7hvNRoFv/w1mPNZ++j2gmaG64lBY6N8PZ7IcLgv9F
         IZpKKsKVKjna8J74R0pTOXWVEXU8K06cOtyQ+CGD+Tu7tRIS5PHPfjTobkGbMvznekic
         E5GrP8EI1wAEUmih8CuGMtCV67HeBy6zvAIqDaEgpI6pXv3KBBl1U+Keg8rLLtGNMJ5v
         M5ljjVMjWtH6D5aLyB+EGe/0HE5x0T3p9f/hnBm/yNwwhsFa6VBMVtkNTGY8zU/1qXD+
         EPhiTAJRkpbl5Re7Qx6V/erbO+eeLNfpjutd6MwMpIjaOnVKc2Of8tMk1PqPq+75Bfz0
         Fm0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787927673; x=1788532473;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gUsOtdOdvL1xoenFKHekMoY65j1FyFMLBu32Ho5vB90=;
        b=dDfwDLoksPXrwXhNflEHUfivzD03vheKYXujPl07FJrP8b/xDhiIQFqumTrxDNqe4Z
         hZ29hZ5PAkcExvzZuD75DK4u9AxoEwpUPeUM1iYIiHws0NcGXEGh+ni6JHQBux9K+nOc
         4w2TBEDKMGFeJeCY3ZdtnmBOqdmiQT5FehaOkcajDXM6Pl2KcTW1upkGy+wUZxn93lZu
         /NSods9VAD6Jlm9F34fKhlCxa1J/i61gK9Tsdnr/L03PMWP/0RVYf+XaiOF5OB96s3wR
         +vaa7o1Wu2cNjq+edKHLndKCvMsVtfV5MPOOkKz7gNfTdVYpcchIY+aVQOUXp9+Bws4y
         59/Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr98pQHxphDDnwUu5QkSHBoB3qli0ZO445pCiY+52ZWVp4azHaepX6k81fbNUmraxSYU8I7728MncA5Jrs=@vger.kernel.org
X-Gm-Message-State: AFuF++lnC8ThZkC+CQ3ZqJBlhvrk0rdznuHoZUlWhbBGt/ZyyRavAFjR
	pLH8pDHbPn4+LpX9CzYx4HAy4DEzXeQUOHA0xyYDufepoboQPFM1nXe+TJQKwDKaI3Z3Pr8Iqr2
	liPStewsKuhyATC2IVEY8WQde9QOUQc/kEqtHzWJ8
X-Gm-Gg: AR+sD127jetd5T1CIL5qfaYhkBPtkXjZzzlRppsJytexkjWmBanqoL1JKiJ9Juu/75q
	ST55X284WrAdKPEKufWKpM0T+RZ0aUk0jhKY4SnVNSx0cAmFz0ZG7ovT0oEsgs6v//BCecPY+fU
	4kYZyMEzZ9ez2eGZJy4feNbg7BNL5T4Y/H/V3zCRJWrSjL/qFuG+S2NRvEcpCwZGlmgFheeMCjb
	zgW5D2v68HixoGPsHiWjCrFhbgaI73e4tkiJ+dDDSmxg20vYEavWsEH/G1zbK61tfuKPD4uTAOY
	dC/cDkO9tE30LHnxfhAEk8M52nGHg4uf3Ie4O/UqQ+KF8Sg6HN4XhHnf1dGDZNJt1xtOpQuf7bi
	s4Bo4exsSnmSrnBsDwDFzSiZ1VJBXPl+QJ6WFBfMOJ84/NW7IM6g1vGhMbUU=
X-Received: by 2002:ac8:7d8f:0:b0:52d:e425:9b83 with SMTP id
 d75a77b69052e-52fb97248b5mr88019541cf.32.1787927672410; Fri, 28 Aug 2026
 07:34:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828073245.126804-1-qingfang.deng@linux.dev> <20260828073245.126804-2-qingfang.deng@linux.dev>
In-Reply-To: <20260828073245.126804-2-qingfang.deng@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 28 Aug 2026 16:34:20 +0200
X-Gm-Features: AcwNN1W8LMMtqWUv4J0NuOtodTTi0QjyatQ1yJx85V2-e2L7wFRRAVaSw3UfPsM
Message-ID: <CANn89iLKco6kcgFRa4PkOsk1TepnCZq6emG=QJdfN+LAWVBoOw@mail.gmail.com>
Subject: Re: [PATCH net 2/2] ppp: ppp_synctty: simplify tty disc_data access
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Kees Cook <kees@kernel.org>, 
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+b503105c2410c3433459@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 9:33=E2=80=AFAM Qingfang Deng <qingfang.deng@linux.=
dev> wrote:
>
> Apply the same simplification as the preceding ppp_async change.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: syzbot+b503105c2410c3433459@syzkaller.appspotmail.com
> Closes: https://syzbot.org/bug?extid=3Db503105c2410c3433459
> Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
> ---
>  drivers/net/ppp/ppp_synctty.c | 83 +++--------------------------------
>  1 file changed, 7 insertions(+), 76 deletions(-)

Reviewed-by: Eric Dumazet <edumazet@google.com>

Thanks!
