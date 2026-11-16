Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794812079;
	b=kUm7eHpO802I392kCQCVNsJ6uTD9gjBhIScfkvtLbmRd5jsxfNbE8u6f+pXAU1e96iC4
	 /dyAbqHwn3Xota+nM1egM1b0xJ9TPK0RiM1LtwnI2XtUQ9unImcQ9mghE1cjJWH1T2UYe
	 gDgE7th177wtOd6LCBn8lbk8pY6gnj5n9I/Mjn88EOepHYVLIPjsaSdF/gsnOkr4qc7Hl
	 rTBA73wQxvVL2qL5FY8eVCrDBfbiwNzHJt7YdW/SWeWN/w3PgPoj6tMi02nYavzQTVO41
	 83pJ2dc5fh9ZOQZBhBLZERQr6JUFpuAmFt7FOvPl2nHDOVhdDDUncg3CLum5dH2yauw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=GCa22WYDhr12KkfdMsjsskbSmYxoFUogucBL51KQZMA=;
	b=1xXWKB/m1Bx70iIyRWxhlA4eAaxrpN3298BtQZ2+uQdSAmbtjy/rfJhjnRbBa1Uw6kod
	 n1cmY2lQ/lXH+0iJfKT4jpTjb0k/y3/fkcq9445m2arBUgdZzAJ3nPZS+6MP8GWhuu+oN
	 TTxDiCDwtYPoWNFZxYxl6YBcZn+oG1yRtrX9y1DigrclSxoruaGVlVAS0dRnhYpMwcWgq
	 CbKZPzhtGVi8BKWdFe44t/oLQQEoVpjScdJ/cCQgzcobLIlaovZRhSLwt552/NKFosjQ2
	 9Nf1Op6g6CRvqVMcdZraEKTXj8fm9/DXkpMR7GD3gxB6MSJMPoS6E8hmFw3DyGKAYDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CiKObOuX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B14D606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B14D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CiKObOuX
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-86103aaac12so2754051a34.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:54:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794812078; cv=none;
        d=google.com; s=arc-20260327;
        b=pmlq7R3aP5IkhacmQbSFqjogrP65a7vFjZObYVKoeducdfCXdfdE5Sl0/74pC1T77G
         QQdWl6FjDPLjYasY14zeeMkSlzTq2LaffjE3WP4LYyXDzWr9m7G8YFPTuP2RugBjGrXk
         SQ0FV6oOJ5nVf2AGFo3j1f2X+R5Tlmz5c+xoOx5BHe+eceCSwV1SyrxH+XwD/OD9J/jR
         ZPCUytwa58efAU2+44Y3UqsTsGOAHhxSaFgG/Tix0STDhrRS5XA+dxWYaElGHT98jSbg
         FoJxEYQzmjQNv+pGZJlEdDqGjyPQjuN3i7UK7JRBt+LME/kBcax6tyWelnxDoRyoUWJP
         ozag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GCa22WYDhr12KkfdMsjsskbSmYxoFUogucBL51KQZMA=;
        fh=kgzBiAP/gBPUQUaodDGeQr/N9Ncjyow2WNwb6a/6ruA=;
        b=moOYe+2BOy/OSh9VJ3taFbf2ACa5WjKOF7cpSCrDnQpmdZVCK6WxIk9/v16dlyxI5e
         t760R2WqOM6ExhyamonIKQkTxh2umXHAY0VR+4b1/EE9fRyUeiFePlFaIi9obxWTiLQF
         IVOpkXFEg0yMy5NcsBWE4U0ZAtrXDkY/34rIDHDb3VhUohzybAU9sZfqctORmurqK0eo
         lNxy3QUaBIZpTp/XGycOQZMHhpsVhKQ0sUG+NXe0f6vCNTsiVtZ5NQe/dWiVzcRNE+v4
         wD/OYR1Jy67z06XqxnXbBuoGQwaCAhiCdH+ENcCCCAVGzY1X7KbwRYmpu3R2ySZTl78x
         pA7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794812078; x=1795416878; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GCa22WYDhr12KkfdMsjsskbSmYxoFUogucBL51KQZMA=;
        b=CiKObOuX/4GgFxJtLA5I+w2s9HzZVUU1MTFOep6PKcQ26TEV3aGaAp+5bek4fY6riJ
         1Nc2t+DqI9uWpPBQx1VjDwHnV8inaHKKRyzDb0jt40ZsqZ9/NDDmVt9bAFQ7TcyfGxoB
         DULsxSBs1dNMY62iSGuw9AKq0DvKP+1GMqPfAqZvs6WgmwIlOz6sV2Gt0DOjvtDCK29d
         rAO9aLj8g3Xt+fIgNU7Z37gW1tR/FkftyFw5eSZIdivrdkOEw/kl89Xji6yIi1UP6C6s
         cGaN+2j+/v370RqPUbU84HqQHJ7Y+vSaI3H8yzwsEDIwHWuELBUjuFv/HS40M1zrsehs
         os8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812078; x=1795416878;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GCa22WYDhr12KkfdMsjsskbSmYxoFUogucBL51KQZMA=;
        b=Ru1nYuguEvRdHLZOWZFPBlWbLMbDsTysArhn+J4HoCKGt12k/sbC5L2uvCg1YU3Q8o
         lbN7rYxCgrSWdcbmijtPf4Z8yNJ/pHk9NgBaf32Z+hQQwUksU0bZLHAEeYKZL6RzYTha
         F0FKHDJd1CwFuwCKmt99klSGfpytP3bp2KB+xSLecs8987HmeMNBAfEvc5NmAnsOi4cm
         wc4c7+H+PgEQfU7eqq6ZxMt9XUcnKJD5BKRPZILMZH80lSgiSQoQ8gLntyUa8GeQZBeu
         zZlLQmApPusJE73u/z/TxZwKLHRcedY7Zd9pGGnBcy9TPRsM8w4eGzwsxCz/EOeMLEcM
         YPVA==
X-Forwarded-Encrypted: i=1; AL+hErFsUtnz1CAW2Faw7vfglS/Lw5nESHQAB/7sOAm1d9dPJ+nT/0WR8SLdcIWLUc8PF+9DnRS1epMJIQk+EQU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vY+DR2TJKK/mEJQnDZc8/qrBerbmiJHSkkiAO18t3vfW/y6nU
	oedsVz9l8DK6q2z5KxteYITEvKlYJgq2YE5gORJTdlQrhPsuoCafnx30zT0jQ3SdywKpppHWkAl
	gRBPYybykkoIo5CM4k1C3Xt3qmkgEmHyPiHTknnE=
X-Gm-Gg: AYBFou1dg0ZsP4Jk8CWAzKoY76x/SBLv/jyjWbbCpnpgo4Q/oMigtU14ucBhUPCutYN
	5tK7REyTgBg7r0M2/VQGYXoQbvy9UE/vCuAQTi6tubcjaOtlUbfQoPLnB+hEPJd0N0u2oMBBzE1
	h4CE48k1OmzxN5NCaZlQSusFUhNSyFq+0Yqj8im/De/xcjuUTlu9LaNjB5MeHZYcu50CDC5uhMj
	wfEhNtKFrXCMDeAARvhF2tZ0sYNM6tw+Cb5y6/3qawKZmMfUAR1FTH1CnDlyenzmsZXlFkPS3oM
	nNARjwFZk0+WXurXAYc+JsPx6RB/S+wjPrr6A0MRSwjKxbLL6Yo12z1Z1dOuwNFSXe0kEtpvVQW
	7YlJnfjv5gtUOZuN/5RDi1D3zZNPCCCtewnrRiIV8OltZupFpMr2kyjowoFQQNkQu8tSMifmmJ7
	lPIX4s+UDfCw+od7DPWXoooR93BA4NuW2nkaEA7qklTWYlDYfjog==
X-Received: by 2002:a05:6820:2485:b0:719:d9b:d750 with SMTP id
 006d021491bc7-71ab5228714mr4043224eaf.38.1794812078431; Sun, 15 Nov 2026
 22:54:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115114336.1739863-1-hjf3108@gmail.com> <20261115114336.1739863-2-hjf3108@gmail.com>
 <56FC313D-ADEF-48B2-BBF5-A4DFAC129C3A@linux.dev>
In-Reply-To: <56FC313D-ADEF-48B2-BBF5-A4DFAC129C3A@linux.dev>
From: Jie Feng <hjf3108@gmail.com>
Date: Sun, 15 Nov 2026 22:54:02 -0800
X-Gm-Features: AclHuK_XRmXcfYCSWosOm6Y6HOd1DVl8wfnRRgwwmGcmDHiQhzYvKhagZ-zvSxI
Message-ID: <CABOQOSU4Oebap-U=6oGa_VQsZwm4szumK93XFJ__w0Q4f25=iQ@mail.gmail.com>
Subject: Re: [PATCH rtw-next v4 1/7] wifi: rtw88: 8812a, 8814a: enable STBC
 for HT transmissions
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bitterblue Smith <rtl8821cerfe2@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 15 Nov 2026 at 05:35, Luka Gejak <luka.gejak@linux.dev> wrote:
>
> Hi Jie Feng,
>
> Thanks for the update. Two comments below.
>
> On November 15, 2026 12:43:27 PM GMT+01:00, Ho Jie Feng <hjf3108@gmail.com>
> wrote:
>
> > 8812a and 8814a support STBC, enable it.
>
> Could you mention here that this enables HT TX STBC on these chips? As
> far as I can see, VHT TX STBC was already advertised when more than one RF
> path is available, so that would make the scope clearer.
The commit subject line already mentions HT explicitly, do you think
it will be better
to put it again in the description too?

> [ ... ]
>
> > Tested on RTL8812AU, STBC packets were captured in monitor mode.
>
> Were these HT transmissions from the RTL8812AU, for example on 2.4 GHz
> or with an HT only AP? As far as I can see, we already advertise VHT TX
> STBC on this chip, so a VHT capture would not confirm the change here.
Yes it is a HT only AP, I see HT STBC packets in the capture.

> Best regards,
> Luka Gejak
