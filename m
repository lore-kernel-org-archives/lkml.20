Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D694DD3BF
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 19:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791400825; cv=pass; b=UE0d4U/lDEuTjvwNiGdeqZRzyLnyH71FmuArGwf5KfjgNbc7ZvTF2CdA1MfTBzVidPBTIlG8702Pr3vXulbuqlyIAK3ftWo5jw0x+rnrXgeNFoOAJFr1LHYva19AA4a6cx6bH47dvIIPRLnFxbFoDz+zv3t2UmnGGtdzy24amYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791400825; c=relaxed/simple;
	bh=nJYqS1Nl2QTJz4EXZt9c50F0OG6K9nd0VBFPbWscLzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AHR4djX6LwD18D7HPJvMpX6Uno07+u2YTkZnvZlQX3ka0dYPNsscOey/fgIzOApAHkpAznl7PZwQEk94635cCNN5UONMRkMeHtUqk5Y85l4eHXy90ppx6B0npBig1qLNqHbRTaXp3R8UXgh7Kbr+3TE2mAey5LlTGlPHicdNJ04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qvm1YHNg; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qvm1YHNg"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a601ba6870so7565782a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 12:20:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791400820; cv=none;
        d=google.com; s=arc-20260327;
        b=N87xXyzkiZ+AuOxQJ5ze11B1kvb4nJrz55vmPsLoGX69VNOXJyvkkw0CN5OZBQnljI
         VIRqvJETkcmLXlMga/0tbP9dTvXlqeo4K+Xc38Fr1VukcKWEla4v7PC1UTBLI54yQpsS
         /P7NowTVvjrBW2wf/t/0x2mItPDN3swdIJH+Cv/esTxhePd7pWNNwAuRYcRbuX9+UQxv
         azyavYrxe/WC+bH5F9wrPizazz5q/jWkW0hmBqqHm0rQ6uNiOtBL2jW8y0fL6JgELYmR
         nq5jP9+mThmumM3DxVQtNsrjJWY4Rmd9jpfSEkkopiVkr/R4FZJz97D9OQcUfZZy5j3V
         ThTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tSJl+MTgxNNYk8O6TTKcnazk3cIP4AhXNdFAYCaKSFI=;
        fh=I4F1huBB/ksxNdURhoSqIXdk4SjCpEBPutJNwoojJSo=;
        b=JBNUn5MC3XE5ASed2AppPjT9C/RKTaagG+5uC32BTg8SYK7hC+BftAWYGjF7rlJBlI
         grDLt12q1vrK4ovkAUTphnWP2J9lhtsSKjRRNN1K8tG5FEvss5hgoHIjYWyn1+OT9FQG
         NK2kgL7Qe5hde0RH+QOX4LYxi8sKBFnPSu5KlCcb/rQRaIi+5Pg1bYOpaRlbUg3TC0RY
         wtQyaHEE2NnsnISf5BazYi1niM2NARFnxwcZa8hhpOz8MewhsPz1cIcBAoAkD5BvEo0d
         n5PfKqIQPNh2+6dqFqd7BNrs9KR2EzJgqDCIj65UjrbGv/SmwER/y2ZNO/ebAt11Lyrd
         BJvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791400820; x=1792005620; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tSJl+MTgxNNYk8O6TTKcnazk3cIP4AhXNdFAYCaKSFI=;
        b=qvm1YHNghxQCq+ArAKH4XyXdd0+RU9XAO4HuXJisaDdVvrbqbQI8K0BygxpbnjgSpD
         YR3QnagKCrz+cMI5/1SXNACBAunGrvxLooawsqz63D0WuQZXanCNwH12wo3/pKrzOmIF
         Pu1uYP/90IfIPkApxCiJEXwaQbsemBEKb6Iu8H02GymIw1lfdd5VtVHC0E2PjjkL51+N
         Q6f7EhF5U/4p6rCRzLpTfzy0UAEanCstDNhY8DQYRAe2bUYfJY0kKTyXG3fZZC5an5r6
         eT+efwB4oDXS+oUOsX48TeBn2+UsRSrghAB1A9pQs/KP9QelzOGLGcI3eKXUl9Ql0mav
         hknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791400820; x=1792005620;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSJl+MTgxNNYk8O6TTKcnazk3cIP4AhXNdFAYCaKSFI=;
        b=B5RcvEuiKi78riO1+kmn6WgQuP3f7t2Olcyc/CCyBQ8UtHsunHytL/L90I2fWegUMU
         I1fqrdPFcnrrKRxR7M5g1j2MXikBZFGx0hwDEsb9UNwiTx43PIKfkGfDimzCxpUB4TPl
         BiP31ILiCr1Wotnr4stbA5r75m+JYIa++iC5XVhWLv/D4Bry1WiQSPUKJdL9BZ60BkPM
         R+gFQ/zKjdTErIfMtQeifxYjdfV/k7wJ5DrL2WT6UkAG1sVCG1Kn92i7bmdhEj+G5IHu
         pbGF4JOhG0EeF2nYnFbjO/6kCHvdE8A/jaiYJw6TuZnLjvtbavsu4hSeNpsInUnT6Huh
         Cgig==
X-Forwarded-Encrypted: i=1; AKwUvBwrmKBBJ+BasP/AUSW/AunxQ6kcJRFJinlIBQCn9jDu/Ncbj3QPCZFQnET2APpRnu3UeMKPJFOOktKGcfQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJo3tf0UHNrkq2WJXowRJXenD/NoduV+jxGIHRrvRT8MRvIEV7z
	V2/sDc3OptpIj3fktReXEASrwPlMV7UrpzDv1Z1GGHp9tNm73HZukh3EH0rXkOEZp/k1gXW1D3g
	/WqX7rzLLtMZ/l1oTKsXPcxfv/8naut6K+pu+
X-Gm-Gg: AYBFou3nRcAS0Jk0aGAZ/YF8YwpljGGjWGPvLOkvsRWJLp8xcsiKixdKPOHJcHYPtZv
	kXj2x275L8MZS8/Dx1sdJWtzjwpx1xIZH6rtB4fhSxCFt3plqBFP6eNQZ0VoYcSppcVAWsY1gPh
	7+dmtN8nOPgRVD7mQVJ334dEGImvfozxYhO9MVeMl665klmnUyACtMdlxCNj/hVTKXTOHPewHqy
	nRsxrHfr1Lk5eM3wTcl3aR0xp1HTdq9icJYn7cOwLsO/ZCKFsq5vLALWVTzWzPJgAK9n0aHqYqY
	zVsJc1ed3B8fnwGRwHQfCwKmrq2/yQ9Lzb2u7T36KiPcg73zByU0G5BjlvzzltP0mao4UhIAHD/
	ab096muOmmU6tll5a1NELKBeb75TF9wF/iGd7JHNNBsRIzTSqcbd4Y/EkNBwuE+PCRtIbzn08r0
	NEidexjmBwOihDJOJVCnd9hHMQOY79RLsZUUno0Qka7QhMwTKLnFb3n+620PHTWaCSduW62+H1m
	VDY
X-Received: by 2002:a05:6402:321e:b0:6af:80c4:8981 with SMTP id
 4fb4d7f45d1cf-6aff458ffefmr3001931a12.26.1791400819719; Wed, 07 Oct 2026
 12:20:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007183821.928263-1-rosenp@gmail.com> <179139868898.2527009.7529803204490860855@kernel.org>
In-Reply-To: <179139868898.2527009.7529803204490860855@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 7 Oct 2026 12:20:08 -0700
X-Gm-Features: AclHuK9iuez7wxa3W6hTNTS6tIr3G2hhr83DCxxqavSCFqKV34JPfCinttQW8wQ
Message-ID: <CAKxU2N8QddjJfx377npH94+Uaw4kG4GkAFh-6wofN9iXO-sNZg@mail.gmail.com>
Subject: Re: [PATCH net v3] net: emac: mal: replace devm_request_irq with
 request_irq to fix probe error race
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 11:44=E2=80=AFAM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
LLM tool scan probably.
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
>
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
