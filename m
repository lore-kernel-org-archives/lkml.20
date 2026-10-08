Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768CF3A7F4C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 17:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791481217; cv=pass; b=DyfHxU4k3u8t/kgsm/7LiZUyJyVdGlcQHX6B8Y6vWyM+tVIxdBM0o/GoauTOs0m2W35IwLwLYhv4yo1RStUKYpKPY0c0TWHOp7ljogFrOlZnKl1KO9eWPgQCfsI7sU7frAa3UXBpRIejubwt+CKjP5pHgFheY814UCWBeSU8PD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791481217; c=relaxed/simple;
	bh=XsMGwnJeuIE4BfymYHt2Sa8OULDQXiO0Y08zPXKAnKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tP2Y2WWtY5OZvrWF89ZgB/5BwWDsXgA2ltxNvMGWeKoDIkgt12WWOmWy8Tv4J0w9p8p1lYw0XpvdEIjIEQaf14mv57MBXxAXn2b52K3vTkQeat5XsW6jXVtd327aB08UCTFaTqKbYoakKWDV+cO4x1Pzc+Ix/9IAIX6WQUNmC7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NI+HIhnz; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NI+HIhnz"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bcce2f8681so98690e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 10:40:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791481214; cv=none;
        d=google.com; s=arc-20260327;
        b=cijMkIxdBnKExIhAnkJjDfM6TXrzYL/FNrg3r5UAZXAsSugIa5/+aVm61ny3s/0aGT
         mkPzTPTLP1N01fEUMiNGk/E7vptYheUv13naSd28egLVoPqEUHweIqWNAlowhGOmToai
         qb3Mk5tov9GcrlQCWHoZ5Q5q0cZpKJHRQEdCMHrp5274n5tE4H06kqHKx/dtIZhqMzsZ
         b1+4YFRa4kbsluK+VQpSAO7lskKdn3cIIVTRTNvmbE4U98QTGyeONptOPP0waNYgiuI3
         2DUZjlxgSVYM/kXdC+KHlRhkIezNpv1FhYksjXDzS7vjb9vpqKOZWO5UCZIROWVBgW63
         WhKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XsMGwnJeuIE4BfymYHt2Sa8OULDQXiO0Y08zPXKAnKo=;
        fh=LQsrRMrgknkMlLkfmECO094rK88tf4GlP1NP1CQa0ec=;
        b=FAcfFpqc85Jm8gez4ZUhGOrbVOJztdqbOdrLLs8htmruBl6p/ewmfl7cKPY1nyI/Fd
         rQSm02A4RpPmK6smUokJ9TkhoHFzr9Th7kNP+ruR9kQbaBPxTKUqR8WEYM1E3w8o29j9
         5g6/4JyupVEt59ZGDDfjAN+3ZO09r51Fe+PtaSF5A9D900tAZP/phHevO6vBO/97UAMU
         sFVbESfyoF8AzAxGKjGDj32jZgL6FbEwrrosNk4CzubHNZq0DCjaw2u6SIB2kmpx6YW0
         2jXuEs9wUDQmnCZ28gpbenj2JyaG6CyVYhPVf+Wobq7Y2qTiW4sDlLg3j2CBgAqq+UF5
         CO/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791481214; x=1792086014; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XsMGwnJeuIE4BfymYHt2Sa8OULDQXiO0Y08zPXKAnKo=;
        b=NI+HIhnzgq29EcKNdRN26tOvMAyXP+9f3wvQmqx1OCOo5/pAeVYyBC5N1AXLtFSQeP
         afPGm7WK1y1tt0IUZTSxC6+kIfLpaeteyXwEYOwTfPDHkV4To1PXM8E1oT9YUo0K5FF0
         MvEg8JqKKTdrVW34HSUZDtDo7I3KYuDPJKUTW4/Vka+lpsCp1PTX5r66DFzlJ45SgS7o
         ji87GeyM4fE4IJGCrUIRfprqUC5oPhRhNu4Ud1WaAxiJwxeCaGjfAMrmBBB41g+XZX26
         BCmBGeJYwSxuY/fNfyyK3/DfjPniQ7xqpoENEqdMXQSVJp42kZ12kfSmCjy7X21NuWzi
         ZYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791481214; x=1792086014;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XsMGwnJeuIE4BfymYHt2Sa8OULDQXiO0Y08zPXKAnKo=;
        b=md/GjZlO6oBbN2Q3myTrQ+ZWILXqteqtBOabmqijMjSs/qk5v5YPTK+4P0csv3EoT8
         dW3dEOM4tUxiYlI9Gm7SOptzg1HEx5Xj0rq/UcSi0tHMCbb03le/ZSw1JcNo0RJlyOkR
         Cdv4Chu1Nas4yDnlU+6jPn+mm8KNTRxQJdzp7agoylzWradKIDV9U1Yaj5I6aWvkS85K
         b1srVUrPnsE8NNeT/vWrFs/b6t7l51izXfpLPtMiIS6UgdPjE6BHiqxx8Jl3M6mpg9s7
         zynaHxQ0iroz41JIjJJL+CJdVOupr5ZS4GDLIZ9TcO/mdCm3yKsb7KwbhLuG7rQZm1lb
         ZNPA==
X-Forwarded-Encrypted: i=1; AKwUvBygsxwJHCqNVDSu1E9F2FX+VG+d6hIvPqSsELTt/ymnXjH1qhdL797JQMjehbudUL+dyKHoKx8yrlBYBmk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkDlnVfGKXL44O+j17UmMl4aMuHAv1mx5faekk8r3pNg+np0XM
	qbKVIfXKPDTpETF+bZVJBi7U8mA+w7S58x/c27vcEBX0Z1dafrmx2XqhWkIx7nH/mtOo2ns1WCd
	d1Ul256NmJHj3I+BbqUOxP+GbcGOfRSo=
X-Gm-Gg: AYBFou2J3L9Gj6ucyRpXv4vw6pGi+0YZinVVIlFEDsJpNA/GVvO1UYcGb2SeW75x5vq
	FnbfIut/TaPl2UwKQUAnybSLYsGa/JLdxf+bsholFvTWonSYvW+0ZPxQHY0Mrq6E0YDzUdyUjRX
	6HK3Nwi5mSw/xJd+ZRSywFoCwRpZkCixfcFocqGVgU+m16WRNOj3xghfl872/7IywE2WDB163iQ
	JwtpBbfbwPfzq8d61M+MbRdTCHccf8N03saIGdMJopEY1KIKZhG55THTazkow43TOIFgNZ+EUFG
	NDDdbR/8glFPVCNdYcxhrrjpmHLnV9ZKraMyNsbiL7euEh/HIVUlIZQP4MROaDgkKMdWfxTugj2
	2c0LiDYE+sQ71fwelw5ANK/qUxiW59QUm9Ou8+A==
X-Received: by 2002:a05:6512:2354:b0:5ba:3c46:bc44 with SMTP id
 2adb3069b0e04-5bcd42e4cc5mr1286510e87.4.1791481214176; Thu, 08 Oct 2026
 10:40:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929115956.229610-1-chenyou910331@gmail.com> <asPWQ2ysbTgW9Uib@wyuan.org>
In-Reply-To: <asPWQ2ysbTgW9Uib@wyuan.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 9 Oct 2026 01:40:02 +0800
X-Gm-Features: AclHuK-qJQ_eUnn0n5swdUT0B7x9k5T5hInCfBDUfhqIPKtNFsPf2EXJq_lKTwU
Message-ID: <CAKspUh+hw3oqigFkHkwUiB_7ZmRrpECA2OstRS_jNF0f1uC9ng@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] docs/zh_TW: remove duplicated maintainer contact information
To: Weijie Yuan <wy@wyuan.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Yanteng Si <si.yanteng@linux.dev>, linux-doc@vger.kernel.org, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 06, 2026 at 12:54:27AM +0800, Weijie Yuan wrote:
> So for the whole v2 series:
>
> Acked-by: Weijie Yuan <wy@wyuan.org>

Thanks.

> Offtopic & micronit: What's the point of rephrasing this paragraph?

No change in substance. In v1 all seven patches shared those
paragraphs word for word; when I gave each patch its own message, as
you suggested, 1/7 kept the shared reasoning because it comes first,
and I tightened it on the way. Nothing more to it.

> Oh, forget to meantion. Now "Aissisted-by: LLM" is preferred. But if
> it's not necessary, then that's fine too.

Thanks, I had missed that change. I will use it from now on.

> OK, you prefer no space between CJK and ascii. ;-)

Ha -- that is the glossary as it reads today, which still says no
space, because I still owe you the change we agreed on. I will send
it, and new text will follow it from then on.

Thanks,
Chen-Yu
