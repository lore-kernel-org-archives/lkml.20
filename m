Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA9A30ACF1
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791783494; cv=pass; b=SgRDQv6EQNwYh/4AiDuZKcMt5jj68XIq/NToSijy42kZdX5wX0Tpf7hCNapCGX0QjjC1m9/aN2Pxar8NS9za8DNjxd18viSpsSztRBp2MTPi/I6qCfFJ1/qkdB2gt2ol8D/6ABvCMt/srwbGvXFO8TZQIFCk+E9QCV8m+U3XpYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791783494; c=relaxed/simple;
	bh=q/vsbLDqNIxroouHOirTtynqW4F0e+W2OYo/65wuwR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nhOUaxBCl9sWWFpw1a7LHJGu2XgCL1KyOadKRCe3Cp3cDpZ52xGYt5W+f34hfL69enhKNe0bAULg2/SrRv6udCSqDr1OQTGT0YgPCRq51w790LpDfaooyqCQoqrYM0tQaXNQ1wjM4cFELbTxAHPcdnjbixaZD+BJkMzDqOh/MqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b44z2oPq; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b44z2oPq"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3535dd9a601so106394eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:38:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791783492; cv=none;
        d=google.com; s=arc-20260327;
        b=J/lDkAU2opCaJAB/LNfC2VIHdfANVRazn7Z6a5whQWF+By2d4vQohs6t0pgZtNqT3N
         sJg92QJt3BrwBq8Ggcu/LdHKVmJEJ80g2iqK4jee79wztCdVvXeHjHnh1iPSpFEyD5vf
         GOjLfOWtbXAGZdOMaPB2UOatOwPbyhFE9AsrlmK2TR7wQQy9vBAySjdG0vgsLemRogFO
         fXzBTA5YxlgAqpih7NLLIF7Vsld1pHt8sBWrqbSciBaPX6qFwytjLqsMXTgeyBj6YQDR
         KewW+X8MrgnwmG+jKpjI0j4u7jOoP18KZNtWUDzr09Qr9AaSFLNEEXYRYqL/WF+DLot2
         rQtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KmzHvGtB5TxigZaL/P0x9o6uBl4oEdsxdSjT3gtQ9ks=;
        fh=+uvCeyyoHoVDex4vhPxhaTh4L/qeZR9hRksoKDyYOuw=;
        b=dKVBEAc1kJcnxhQ92iL6rdpQXIrDR5GqytRVxb9tDu0i2d6E/WNHQrnNKKEIHJz/RP
         9TomMOT1IGIVaOg9OGeqN6UX1lQHjiLa36kkBGUvC/VF2UWQNmJd6X1L8oigQEzzRvTx
         9ypgo4I7ZNq34ggsTSpFJXJqxDz2FWIVqwpu9qM24L6BieeLeJOaF8iqlV++nGkMA7CR
         B5vWX2uGJDwbCwuK66X34GeSbSm6w6G8caBqFf9JAYoVxK1V627Tp6L0K4qc6DKRbYON
         4rLsdtOhK6Xat+kE+ONdaHnJDaHlYGes+VHRSxQ3wrXUcjO2t1HwbYSlLp3pXXXZrdzy
         9d4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791783492; x=1792388292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KmzHvGtB5TxigZaL/P0x9o6uBl4oEdsxdSjT3gtQ9ks=;
        b=b44z2oPqys/uKqr5Uye4S3OUHIlaQMAl5dHVfWhHs+s49K7b3kJEoBvXGRmOwHBfBJ
         8W4c0/o5LqfqQ/754MsKytKh39QWGhlZrmDViTK4JivGV9HqYVHuUgp6WLcEw3l1A+9G
         gAMvM6Xps+jb9Pgjm05y7cbXJYOMl5KyXeZ1sOOUprImtA+R6+qL4oglaqKVAByyNgeC
         guUvEV/Y4ntFP+la5HbM5HkW7WhHmhQAoHzfV8zOCXulloGdmS3C2lV/02oOTj0II+BU
         z9Tj+Elpy3wkLNDe2PyowDRAVe193k+XLHtTo/v1rldEm5iRaMe1NlhMGBl4aYZIBmZR
         pYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791783492; x=1792388292;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KmzHvGtB5TxigZaL/P0x9o6uBl4oEdsxdSjT3gtQ9ks=;
        b=m+jHQmypti74Ma7UP4x3QsJUGYubYskkK7hglWOGUkhb9EDz/8SK7xlykycIO0qf66
         B1DLwERGxnRiWPIM0R95hLSY5Y1AF0Z2bgqFyS8Hl5VLQODm3cZTA2KeeWYZsGK4AK8G
         1Z/LYNS4emnQoAjnVOGpCfFw+lqt0L/Lz+9q9sm5RyH4P4x9qFo4s1MMnYfUIcs3nHI0
         KySPHrdG9lh0PG2Yp/AVRHuFbQ1nOfQw6a9iiEaAcsBMqrqxyDU3jcWqa08DSCupWTO8
         QgY+4Tn9MctM8nKMTtjtTKq4RagkElCSHqOzLkqkIYHKGQarLpaz48S3ubpUAsxC5eTv
         QSbA==
X-Forwarded-Encrypted: i=1; AKwUvByFKAnq9cHdwR5FmlqSRusJeRw2kZjB6CHEc6M53Tp2ifjcnd2oWVE0DNPMGbzDlYrmo9C08SboyZZ3a9k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqLdApA06PA1NpVklpbaJ2gSv0r2U8eZEatEwRrYlq4YhJj76b
	OcyRQtg302n9KcehwxroOtpZ58uNwwjS/ifXiNAysSYWw2QORlaC6+FyqfGwV+6c8ArKTKPLH6v
	F3YrmCYPmYyvcV9fra4NhhVRihaiBq0a2K2uqJPA=
X-Gm-Gg: AYBFou0ZfAzcL6VBof+Fi6BNsAEMpRvUjVQh6roebvgRah929jQGHXEHgjEUm2K8F7Z
	Vq/njw56hNwuyBT4c0/IsH0ubBkYoLpBy9BIlb+Es24H2aRmhTmcKDv5psO8HLjGX8ACqS6jBwF
	vgE4Y081Y0fEU2geaaHoS7PYMl6eiqgCIcGVUmjVChpEkqGSbtVZ+7TknzqV5bvcX/r4buUEQs9
	JWCPN4h0XZgPdP59hTqb/zdA7rWi6RmK+S1aOD3MI6UqK31z1ugtkOohe4M84sfCDDg/Z84J5Be
	NhvhrdIZSwJDuhZTwnez96wkdpfdZHZVIkiHORQ1fPFJYfZeeG1ReN9jyxuFqOOx+T67B+n3Q+P
	MutLRi2iqDmplJfgLMhrDU5fg4EVYSHzfwL87hMLH7Zu1SLEiq8sQH0E6+OQcmnjg9KhluhUSwU
	WoonR4B6BunK9j0GMmyA9pcosDUF7hlo7nr0x6b+52qab9jjjfBPCi4PgfmYyB5Q==
X-Received: by 2002:a05:7300:d18a:b0:340:f698:fd56 with SMTP id
 5a478bee46e88-3537e04365dmr19340269eec.2.1791783492250; Sun, 11 Oct 2026
 22:38:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ar-cWpOhcuo85ttt@sirena.org.uk> <CANiq72kOB=NuaeUz2i7m=uTmezf5Z_+9D_njCfCK-GsFN+S63Q@mail.gmail.com>
In-Reply-To: <CANiq72kOB=NuaeUz2i7m=uTmezf5Z_+9D_njCfCK-GsFN+S63Q@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 Oct 2026 07:37:57 +0200
X-Gm-Features: AclHuK-FSxZnPKGZMDXDDmFd5BKHyi0oI0Hh_m2npHQ0vI3S09UznDsFRSkUblk
Message-ID: <CANiq72k=gv4FfDii_ivVDL0sAKaLZ6e7XqOc+qaVyXY1heTw1w@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust-timekeeping tree with the
 rust tree
To: Mark Brown <broonie@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 2:24=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Looks good, of course -- thanks Mark!

Actually, now that I was doing a test merge with my new pushes (which
include timekeeping above), I realized the merge currently in
linux-next dropped two lines from the description of
`RUST_BUG_KUNIT_TEST`:

          These are only for development and testing, not for regular
          kernel use cases.

from commit cd56a1c858ff ("rust: bug: add a KUnit test for warn_on!").

I hope that helps!

Cheers,
Miguel
