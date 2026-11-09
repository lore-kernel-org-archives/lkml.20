Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794229889;
	b=nLoD+KJvOrcDnH+scpoJqRvcHoklwfv5UtQcsSPw/7JhoyG5evGaqP3R2QojQbc5BXAH
	 MhZB0OWulsGmTs+IcSJGgT8GeVOj5DA0A/YpqJ//v1bRNxKTDNQAY/9pQcjxe+UVNvAqO
	 OznUdTaXSVVMyDkGlJUhJtt4QsGgUONinBdmBD9P0CZi8P1u6cz/uW0IEanKGmpMWCuJU
	 0sbCnzuncDBVK6YW1EmnHzGvtzEYYwrKeq5cTDWeKeFgwS4C3YqQ6leUI4C+NNC98zW56
	 NbU/ZlYQHkuIafAWYsNZwJVgWJNDpDqKJv5JpSB9TlN/rEQCSjxNB0mlc8Up/7Klp0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=hUJXyPH6zLDpAwnCmjc82BETffXEe/qWcreTBUEPjBk=;
	b=FnRt4RIbTiEcVkUpHF3GSezX9SU2yDFj43V2adKnotvX8QRVJUNfukZwqbZArRPQnz05
	 U00KKl0luK0WcL1rx0DNXrDi4HaKG/yEIHwzETEu84sUUaIeK3zoav8cyPhwfIxk5IPzo
	 AhsunVTsF9bd7lXnBB5v1RDbQWsEwSA5fDMAAkv0cAvVnzxcYu68pOFllBMbkW7g40WJb
	 Lw0kZTlT3WQr65W9TYjT00ZIlr1NVq0GERbOCtmkWIHPhQdDJ1wXVev54a+D58ylKzOgT
	 4SHDzvo1k0FOZPo2SZ0xSeCjA/1Gdhbt+S+JIeIxYo5quGZQPuXaBrdsxzBWaxHfrZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TlYxLweL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C2C606A334
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1C2C606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TlYxLweL
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c00c727a21so27357e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:11:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794229887; cv=none;
        d=google.com; s=arc-20260327;
        b=qVEIGVvlGmLrExMRQEpABSP7o7jylSL2nE4+eO8eAzTaLesInSICmkZjcg7ZMEYk7V
         MXyxHd2BctaujyDSdhw66/oeshovw8FOwl5zT9uaTLIKtBE7tFOyxhOqIfIp28KDhoxj
         eNDYTBY7B/GBVMZsDBNfcCOOjeMCXdLR53Tkp3/bocApWZg4HDKhzI6lFmvAJ+2ahJaC
         VrYkrfKajHvAxpDORWDlW7QUOrCdzTbr/OXjkXowG+j56rZuKe+amKqrRMkihmwqZBcT
         ccfO5RtUWXopt3nw+pKUOpOHE5Fnh12CZdGnblSIjG8gxXhmTusWR17ncOFbWgxrJytP
         SAOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hUJXyPH6zLDpAwnCmjc82BETffXEe/qWcreTBUEPjBk=;
        fh=YJMgXgTH0heqPXZ739WsLnxNdvvitvaQ3jZE4Uzq6Lc=;
        b=QXozQJlTK7DFPtyTIzC820mQuHOV8FqNPstxEQbFHIQK5EIiQh+r0l4YO6kSCZpnFU
         5xB2M1tmzvS5k45cz0c0yj5nBgG9ELsEesmOvq83xsWkmF23kWZwo9SOFYZz5HB7WB1p
         iL/Nxexxh05vXG/6hvlbzdSUQ4kMf7/Y+WTKoVa02aSaEaLHIN5m4WEI6ZMdjQvBwC9q
         1lSRVd+G+1rLwlAvi9aO9EJ+m3p3ZrOp7yBeCPAn/gEwex+uQ1uAnEzG5A8xYTicVJoY
         OVPbyT2mB0y8ZIQH3hdMi3vU8FILg+AiDE00Qanh9fW8LNtRzvlPkAtcoRzsrI43m/4k
         ABvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794229887; x=1794834687; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hUJXyPH6zLDpAwnCmjc82BETffXEe/qWcreTBUEPjBk=;
        b=TlYxLweL5cnGw7kcvkwBnXE496pEYOz46n9I8mIZaOWbRk/zE3gtaI2/aAagwoEzog
         ruIdONyvii0IBixHJQerhe1ly28H2J1eL0F0VAKiDMN1dkerDGBgsfQQ0EbbkWSttfBT
         GddaiTUwWtTnCyzNRnBQv9RDdjSgHc/ww0TxA02ls+6YW8KbrWxpgvTOAnEW7gQIifZj
         FD6X9IqSRTnUHWSHomjUdqbZZ/7/r9YKYi/DjaV05fAWouL+3c/Q3qm5IgVH8OWbdyki
         r23MkJq7UAmHjnMb5+WBrZG9LKBBcOU62C/sXjiPX06EWunaY/1AmJRljyC3vSJvWX5c
         lZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794229887; x=1794834687;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hUJXyPH6zLDpAwnCmjc82BETffXEe/qWcreTBUEPjBk=;
        b=US36BIafGoLQi9M8Lt9neQxqCGct4GFH5tOM52AVU5Syk+zouScH/A881rRZe9oCbL
         95TVBsZ+us6cL6CcZhARdQ5mOxo8dpUqFoiKGiEO8RIIJX+ahnZdfgQj7NdLaqyT0xao
         khrwmNDgqprInqVvc3nlHHdPk70bTjXUXSYsYj9omUhAjZ3nyNtIHekqZjDRwnSq/N9o
         xSj1hKxnuwSQshhP44Z+esyRvLvMyxYoOTAgiVyXgPaVTo0qjSnf4NuOGmQavkNhii+q
         4J/bpeUGMlN4uFEjMykZIi5YpXed7XXO25ls/07wweUwsZhGoTEE/Mjvf6rV0+Vl99qk
         aucw==
X-Forwarded-Encrypted: i=1; AL+hErGchwApkqrHnwTYquG5M2pDwXEpNHZ45NeTtsAKp2meuRiP/b1/+/6ES01OylysEqUmOX2RTGXR71kd2OY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Q+ZLhY2+NzGI8aT7lwaBPix/wo5te/MjWEHAuKYVIleqf8Bsj
	MjCo1gIaiuq+FYL9I7DyOKk5lrqb4iZ+2+hiLkDLJKcixVoQokTJw9raCZ2KvL3fnOtZn8nfy1G
	igSaKm2+odRpZ3OBhM/H9ZocK54gtQkE=
X-Gm-Gg: AYBFou3soYV/hZVHKS52nIZN3XMFG6n0Z3smvVl+GxV1ysjBJ1dWPRetiGyjNcWQpfa
	34PHBwUQM9QM5FwM8+l/rPzzNelh825H6MCOV8YLBMqWFTyXcPKakXJHOcpHBez59Sezel83Hxs
	MFbyQ7veIxWLL8vLOEiFaZjem39BnBVoksaYCsFOlyWGB8goSpOHQj2aquNgWuwRmHNWKVcFtQ4
	bLax6hDFOLENkW10/UcD3YZqHXQVsFRF4jWCJQOUuQKDArElgD9obrNM9jE1msTxJnkiT0hMv5Q
	hSBQsclJj4V1bX6ZUjnxPX9TWIVnXKW3zFlLSMDCLiIMM+X2wthDd441hCDwg4f/g5KpiR+0pSp
	Isl5VQpY1t9+qZ/bz6nOhwwJeZFXnMePr/wBibMGT2HTkBuqPX7rLckkTMwFqZ5CSOW+Hl3C/tE
	Byv6YtHfMJv1+AR1s2bpOmisjfHGDW/gD+rckdIvPV/Kde7RTHFg==
X-Received: by 2002:a05:6512:6402:b0:5c0:62:7fc3 with SMTP id
 2adb3069b0e04-5c14c0521a4mr1492621e87.5.1794229886753; Mon, 09 Nov 2026
 05:11:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106113545.708896-1-chenyou910331@gmail.com>
 <3bbce43f-476c-4a21-8da3-2be98a696e9c@hust.edu.cn> <bab86e6c-bbda-4ad0-bd88-5ace76946eb0@hust.edu.cn>
In-Reply-To: <bab86e6c-bbda-4ad0-bd88-5ace76946eb0@hust.edu.cn>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Mon, 9 Nov 2026 21:11:14 +0800
X-Gm-Features: AclHuK8D9gYdXznX6LC4moeS7v-8RvkJxZ4j_oXJHpo9nIA22wV5WJg6HcIkwAA
Message-ID: <CAKspUh+n2giArsUzKeHq1F-D8VkV89kUNevc-hFnpxjWFWNZsw@mail.gmail.com>
Subject: Re: [PATCH 00/13] docs/zh_TW: process: add translations of 13 documents
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Weijie Yuan <wy@wyuan.org>, Yanteng Si <si.yanteng@linux.dev>, Alex Shi <alexs@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> In the current stage, it would be more important
> to fix all severe issues in the translation other than adding more
> translation.

Thanks for sharing your plan.  I think you are right that fixing
existing translations and making them reference each other matters more
than adding new ones, and I'd like zh_TW to work that way too.

zh_TW is at an earlier stage, though: it has only a few dozen
translations, most of them converted from zh_CN, so there are few zh_TW
documents for references to point at yet.  Much of what needs fixing
also only became visible while translating; that is how the terminology
issues and these unused labels came up.

So my plan is to first finish process/, the area the scope RFC commits
us to maintaining.  After that I'll follow your approach: resolve the
references so they point at zh_TW documents where a translation exists,
fix the remaining issues in the existing translations, and only then
add new translations.  The terminology cleanup will go in alongside.
