Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794058647;
	b=G8tb3nfS78oOeca7rpNYCewwgT4XkikUnolK8mPEbuycG4/vpwcIGkmWotg5JZvugmFv
	 W4E2fx746e6F8hrsmazduqHj5QWT0zdtkZpcCQruAsxgNdZbI41XMqLcssDLMgPRnz6Dn
	 zYWVG7z4K1XqgUxXPerh4dKIGE6LcV3h43KjThWj1MHLdZlorA/dCeTSGBxIMe2bU1bCm
	 jFp63bPSDxkAi4xTNTUJB44jl8Bco/V7culnJLmHgZ3v1BtAIMloDbnXdPAFD5OiijvQk
	 lFv6TVIkay5GsMgyBiyUvKqdzlnrF+yarOSFZYWZQGyIWqZJL3zbrD6nIJaKlZeDjdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794058647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=T7ke22l8FEpPHn7frSDMvLxq7KE2Gbyw9fFh18HxQOQ=;
	b=V+foAKmsijLgXwZ8SnLGoMrv/3/EQFVz3iPL0t9vUgKd2gvYxlQiX+v0q1JPT46oiSqt
	 8RnxPFwz64S0HLVnTgm6RP300WhGB2ezjQgwRZiewwRqCrPVfXIf7VwZbiPVbBUrg07/6
	 KiGFGz09yayT/Peo6yqhJUJmfLJuobhP/MddiR3hMAumOvD9jiTD1QNaRSqbapq68kite
	 NOMxBo935UQFgplDgoNNREIt6IiF9MKK3UgyCxMQ2MUUmNFDOS9xT8iiYRx2ms3QsHwzT
	 AC7uV9r5Tl06DyFu9DeGx7ku7QpT3rRTGlRnUSQvuYRiJk2RG0FUuiiRHHrPmdxOX7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FoqQSnbB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9C7606A339
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 13:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E9C7606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FoqQSnbB
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-53653e30353so22474711cf.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 05:37:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794058645; cv=none;
        d=google.com; s=arc-20260327;
        b=I/OaGNmTRNmkrLTv6Ovi1I1s50Ozjw77fHdWKEEguzU8Z9m7hJAh4Sw/8p/6A7uS30
         tPy0q9WlxYSbl8PYZUT814f7XzbjvST+NVKvl+qy7uS/s/HIIxkyao+WX10FW3/eOumR
         YahM6BDLV44qkhUCnX9DF+bECivetqRk2/9Q79O6pY5UbiB1qJogrYBLR4sk7JZ3X2L7
         Y695v2acLP+RzoBKz06JI6tsYqkEX9Et29RS4O6YO4NcRoe7P3yf5Gr+6icGXRgp4lIf
         zeB6S/9/jsbE085D/RUSmej7u4r+BuKV186V1ENhQNK76ZXn1BIRspLfOQx0f0FMNV1s
         a2jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T7ke22l8FEpPHn7frSDMvLxq7KE2Gbyw9fFh18HxQOQ=;
        fh=PTxZKN43P82vZOJGgcP6BEUM08vHrCEg3lm8ZDNtMKU=;
        b=KWqL599drbD7h0HZAUNwFZWpFVTfcnbbmlr8GaHS1XkPYXsGLX32K3c+jxkiSqGp8p
         VUYM82kxqLnwqaf2MeLsoD4qAx+KHetbInbA4vQNukOmSmU/ABtqiC2CT4r6ga82lr/u
         JxnTI0YPDI/mKE05iqqco9qxda1xOVFUjtBJYESHO7Er2MtYjnF7masqSVw79lojx71o
         Zdw1IkcYIagcMzCJ6uSxzXl9IstVHzAooMmfFAuR+CQekkxjir8HeBQbt8RZtVEpmqHG
         XS1xhftWegPHcTV3dSn2/ZSc5PUZpw34Nm0mPNWoo6KPYfbc/Nc0gfvmFARXTzd7NeoH
         AIZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794058645; x=1794663445; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T7ke22l8FEpPHn7frSDMvLxq7KE2Gbyw9fFh18HxQOQ=;
        b=FoqQSnbBa8VthoIWHOtQ41EiYx/xwNGfRMh+BBxTLn4lmSK6/xrXvQfzq7kCy2mYo/
         wGZLvwqGuIUn46D6QOQ4y9+HXLBK/P5ilwjw7ewNHFHJuSt0pGngpw4hyCO4WoslgL0C
         zxNY6UROzxzGpJXzG4NiMwVEIElsVUNcEtzrS2Aop8VesTe7OqF6WA4kxuNFsWE3neqW
         7VkMbdIaMJ2KObBUvC2IW/y8cuMyXEl4M+qq0PQSQjqC5oRr1BwhZwIih7g581Hrv+xr
         ndyMlEDzkdYqpAyit9trdsWyS+T0HAMKWRCOML41M0/qFY7Y2hndR0Q/50sZmkntfX4W
         gp2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794058645; x=1794663445;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T7ke22l8FEpPHn7frSDMvLxq7KE2Gbyw9fFh18HxQOQ=;
        b=Uo1ug8qvG8KnF1mIKuV9P5iZa4PoWfiaHF7V461s3ZxKe5iH+0rrDOWeqfJvZTQ3p+
         NyKqXU7q+Nxg1b6YJ1dxngzwVDosyjx8wqnaC2udrAIP7rzs0hxOi1tLx36RJKOMTB9E
         lkT3JiBXv2NDGl4SCDQ926hF3dqmEUyDoua5SHyRanCW6tLpQl6ZS7nuB8tS2juAP4Um
         zxT6cAsm+QP2FR1R/i5lS7sA51FqeRuZJzFVpktLQDjpqI0Q8DebvJlF0+S76vOcQEM/
         6sTcEDroxjnsF/CvIaezQtACLOU5ISWkdtB6d1QWRiCXTjG/9PLs4fkg8V5iwUYZSWTA
         xwLg==
X-Forwarded-Encrypted: i=1; AL+hErGqlYAqI2xkLutrR/5QCpje3ZDw5Z5xBjpb1v1r9slGK9lcyqzjB1afUmaxAf2nUdulXWoV7b1qvh4tb5Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9azPjQj71KxXSwY0qZ4/0Uy1bwdgFtxYkVkSfF5w8Fhz6zszRL
	KrgaVgr6ITg6ONw0BzPRTxNfnmlhftkEvAYy9j8B3o1FljfsC2dXaHzUK2zr4W5sA+gHc5+gGHV
	gQf0/AShvN8fQjtsrn/jIPD4gyTq/8hw=
X-Gm-Gg: AYBFou3nSzVEDl38o+9liakId+fDFzwOtEet1fAF5jvrJ0/5Fsi0WklGxJaFNnpBCdi
	oGNyk4cF0ahlvhZ5LLcF+xZ27p9LP/yc6ZCmIDl10ZdHOEE+6osngj5FNdIyELflMsncjOxYtEO
	iz4HZPgX/X/wzVu0m5uU0rNf1doZn7unmkjUbEQUFUEUeRO7abK/vKrREQ4pgU7otWlO8vCA29E
	FEeDORNbWD11VRx8B7kGyqGLqwNDMOqLkMYEC+w8eYNFCLFG2ues2mYnGVvSwz3AiA9IdJdtm9K
	ZG3XuJWMaROHbxB0XWeW6/FKmO3L3XQEDQBc7d2f5PM2jhM9WwOZfn/7PWR8qBd+Cp1P/zIWAzN
	l2axA96Fl4w9TFPXqzZsxcvK6NORARqrKnewaVlLLxXd7kchlDry63qvQnGUO
X-Received: by 2002:a05:622a:34c:b0:536:76ef:589b with SMTP id
 d75a77b69052e-54e1496c3a7mr83174021cf.39.1794058645485; Sat, 07 Nov 2026
 05:37:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1778477179.git.caoruide123@gmail.com> <849fb1fdecd1cc241fd5b032602dbffa90f9dd93.1778477179.git.caoruide123@gmail.com>
 <20261031203726.2dca9645bd13ac9c18248380@linux-foundation.org> <20261106141755.5epzadks4mq4ea6e@offworld>
In-Reply-To: <20261106141755.5epzadks4mq4ea6e@offworld>
From: Yuan Tan <yuantan098@gmail.com>
Date: Sat, 7 Nov 2026 21:37:14 +0800
X-Gm-Features: AclHuK8J7thdYSmIIOj778kIq9z3MMRFRq-ZiNtet6mfjXHt4uphXWYqRQwWDgo
Message-ID: <CAPuPA7JhD6RFPb4Xhd=q8PcdWM61RO3wgdpYxP2d_D3PDfhjAg@mail.gmail.com>
Subject: Re: [PATCH 1/1] ipc: sem: fix used_sems overflow in newary()
To: Davidlohr Bueso <dave@stgolabs.net>
Cc: Andrew Morton <akpm@linux-foundation.org>, Ren Wei <n05ec@lzu.edu.cn>, 
	linux-kernel@vger.kernel.org, david@kernel.org, arnd@arndb.de, ljs@kernel.org, 
	kees@kernel.org, schuster.simon@siemens-energy.com, yifanwucs@gmail.com, 
	tomapufckgml@gmail.com, bird@lzu.edu.cn, caoruide123@gmail.com, 
	enjou1224z@gmail.com, Manfred Spraul <manfred@colorfullife.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 10:18=E2=80=AFPM Davidlohr Bueso <dave@stgolabs.net>=
 wrote:
>
> On Sat, 31 Oct 2026, Andrew Morton wrote:
>
> >> On Mon, 11 May 2026 18:42:53 +0800 Ren Wei <n05ec@lzu.edu.cn> wrote:
> >
> >Slight delay, sorry!
> >
> >> From: Ruide Cao <caoruide123@gmail.com>
> >>
> >> newary() checks namespace-wide semaphore usage before creating a new
> >> array, but the current accounting uses a plain signed addition.
> >>
> >> If the accumulated semaphore count overflows, the limit check can fail
> >> open and allow allocations past sc_semmns, breaking namespace semaphor=
e
> >> resource enforcement and potentially leading to resource exhaustion.
> >>
> >> Fix this by using check_add_overflow() before comparing the new total
> >> against sc_semmns, and reject overflow the same way as a true limit
> >> exceed.
> >
> >LLM review tells me
> >
> >: The fix looks correct. The existing writer lock covers the check and
> >: the later used_sems increment, so that increment needs no further
> >: change.
> >
> >and
> >
> >: Please qualify the changelog. Default SEMMNS and SEMMSL cannot trigger
> >: this overflow. It requires raised limits and substantial existing
> >: allocations: sem_alloc() separately bounds each array's size, so one
> >: enormous request isn't sufficient to demonstrate a successful bypass.
> >:
> >: With sufficient memory, semget() can then succeed instead of returning
> >: ENOSPC, exceed the namespace quota and wrap the semaphore usage report=
ed
> >: by SEM_INFO negative. Additional allocations can increase memory
> >: pressure.
> >
> >So I propose this changelog.  Please check:

This patch is from quite a while ago. Sorry, we forgot to follow up on it.

Should we send a v2 with the updated commit message? Or could you
update the commit message when applying the patch?

> >
> >: newary() checks the namespace-wide semaphore limit using a signed
> >: addition of used_sems and nsems. If that addition overflows, the
> >: comparison can fail to reject a request which exceeds sc_semmns.
> >:
> >: The default semaphore limits cannot trigger this overflow. It requires
> >: raised limits and substantial existing allocations. sem_alloc()
> >: separately bounds each array's allocation size, so a single enormous
> >: request is insufficient to demonstrate a successful quota bypass.
> >:
> >: With enough memory, semget() can succeed instead of returning ENOSPC,
> >: allowing allocations beyond the namespace semaphore quota and increasi=
ng
> >: memory pressure. The wrapped used_sems count can also cause SEM_INFO t=
o
> >: report a negative semaphore usage count.
> >:
> >: Use check_add_overflow() before comparing the new total against
> >: sc_semmns, rejecting overflow with ENOSPC. The existing writer lock
> >: covers both the check and the later accounting update.
>
> lgtm
>
> Acked-by: Davidlohr Bueso <dave@stgolabs.net>
