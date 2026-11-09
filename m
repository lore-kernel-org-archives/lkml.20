Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794205378;
	b=zGcR1fERzxbGfPCciwVd4Mzo+MPeEd9zSnwv1BvO66iPFBmNQO0UBtC0wode6kSmxblo
	 srwAdYAESwU5QTg/MTc1DNsZa5BH0FamZ6mi9o0ZexDKlsQ1+BTRTRaCNVVwbGz6cdgUC
	 m4d5LlVFzeCJblW7rn+0XUoz0+thkhrmz6QkcOOgcFHzJ6aYovDxDexIh5Oud6av6DbE8
	 UO8bXThmVSzpWDzDX3V5V018tQu3QZ8qkLYnDZyNd6T8/LKlHV0Eu4lBibaZ5ixGG0kHl
	 woJXl+rymujnJTYQOpJE9UqLp2V2qOmGIFPE9a3r167vUiLYqMA7ekQ80TvV2s1Pqlw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794205378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=URMNcpQ5qqNQl+Xi1BHmKsQnDnwFJRQJWZlQPG3sB+E=;
	b=C8Of5TnaqvpMKVW6jY5CEdxz5MdxEorx98a4ACCLkodHgDG6R372K6m4IBgKGFCuSokN
	 ZPZwOKB2FU3GPmK91ypAnmauhSOC9yNDMJhAKHXFwntT4QDacWiFRLvxM3ghNJfeFlFNE
	 C0/9NudfDU4SkIhMSNaeM2x14/P4MSChSUp+3T3fQcUyE7/YcyDN2zsAW88gBhg08mNiR
	 WTVBAvOZzqqKCDtAMuCdP1Qvd9j1vSd71d0xFXq/GKQbJ6hx/oppyYH+S4Xx72gO52eE1
	 nuz8cMdMaqn4e8Mg5Fmzg8XHYsRbdxVzHfwL9X8d86KRXqa80NajG69F31wUF76684Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oxmlE8U3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427A3606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:22:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 427A3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oxmlE8U3
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67be9601f31so378447d50.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 22:22:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794205377; cv=none;
        d=google.com; s=arc-20260327;
        b=ZWu1Rmz8KyAVbgZazYlirPOP3eTHCiOIRW07obp9Xm868yv+IWqLczWlGd0VPypTby
         Jwguf12iAvZjSOZ2RT3VD/fzVGsexgUvVBL3TQAp0+oQfPWF8BhZUHGGr/d9dlSVq388
         V+gNVurPJP++AvGbbA0P/nJXhbECE8CFvQs3yXjuTJPlZHSCEi1kFVU+xUxqUPhO9VMs
         aIBpWWhAIxKTD1wgoIZ/NWDWSrr3o4rIjMoQn4Cv4eXIpHNz64pVMnxTtf3RrMCaoKox
         T40QkO9yc9c6K28yrs+K7F2HInVDkS+T8zC61g4DGMwSHEb/yHs5dLgrfKGh8v5jlwHX
         0n0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=URMNcpQ5qqNQl+Xi1BHmKsQnDnwFJRQJWZlQPG3sB+E=;
        fh=Mh/HHBPoLp1oGnlzHdWutrhIiWXnNauDMt4p7Rx3u9M=;
        b=oWkOKmOso/Ud0v2/QF7rlGY74QbGBxpC8BNGKWDP6vEXFZp9yRF15UZADmzXun32WH
         Hv8o7TxA9nr+f/Je6eqYuoUXN+P9apMKnhpYomJawNz6MiWQNbAQKcR3jMlek2EaAup+
         YdV1/n3ydt7ql1ZK6ecEdJ3C3oWK9MC7Au938Y2g9IYAAvfd6MpZVDGTATt7rvUFj00g
         pZ46YE8IgQa1GOpe+DPdt+D+vXTBdnZ1L+GX6u2Flon89p7NGi/XtH5TBDUmqaOO0g+5
         Z4mjMcEMalKh5h9hHJMUAd5BgPh7cWthY+YD6dZ4U7IKFw1HTxHD3W0SxXUQmyOGGFQt
         8HWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794205377; x=1794810177; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=URMNcpQ5qqNQl+Xi1BHmKsQnDnwFJRQJWZlQPG3sB+E=;
        b=oxmlE8U3d5SFm+VZiQuPeXsEoGdZIYMlTYvkA/I5/luvTx76xQU26zDe122m0NAZAv
         nb6mWBpfzgo6GYKcS0xe+1quZEEJLleeX3jknhyPVA2f4040l9LAoNAjEo/cVojhXhSV
         kVsFJPZUlT458kmAqyvL7quZmBfpHJBm8Zc2/WNIv71VrFvrgESiSMD9rDKyA4N7MIxl
         PBNxc4FOQrIwa3y+YP/dYuPzKNz8ycAX+EFQujD52srcMBrlR6WenLRwaJqQmkrd4wzD
         JJRKCAtFz/tU1ZypxJy5XRMTNqpFQhivgUhNYpNvedOqWk+HhgjpqWd5d9bmCf1qg2yQ
         jMuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794205377; x=1794810177;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=URMNcpQ5qqNQl+Xi1BHmKsQnDnwFJRQJWZlQPG3sB+E=;
        b=f7TjjTw+U3CWsAB+lsrfnEKmHyMVWuNdtr6roWIQKT483MZhVj+QrWy15AM83CmlQ1
         P+gyqxkInsWi3gI+d56hbWGFBRNVnFd7amzEGqvgg+F05AhVuCo++KFJjMEymJStOGs8
         o4huPS7rwn2Z68pQAb7IiHFSwBoRe4AzFIn3LGsT7InobIug56h13fYCQu7rdPzY7opd
         Xk+e+h55HMVgEhQSLemEzJ39QvZ+09//4ALup69Q7ktfweFFm6L9Vu0gChY1nbQZ8x5C
         ZQi8bp1gqcD6iuB+4VKft89jcdFjOy/yi60cPjzBwV6xySAH45bIvh5Bcb+un3DY7z0t
         rYdA==
X-Forwarded-Encrypted: i=1; AL+hErH4uzkGVDNAzTilPCtXUOUGS7zlSQgCT4OQPoppf5cc2Fs54t9QqHckePpIOcT//9CNTud5taCMUiB25rM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/p8bVPtuvs369uktM4xM3hLUp1a8PN265NcEU3U7M0TqKwYUU
	ZZT+eAiuv+pcHMBXdHejDYIkYK5aKzKZnIb59MFURRdQkVP+tL4BKK8Li7IHMp3w6PGqMkv1Ye9
	MKpEVdaDLY4g6w16qUNprwvaoRo8VJ3c=
X-Gm-Gg: AYBFou1hZ5tckxNjoJwDH4GoEU6nK5SJ7HbcwXw29jjk38zkGm1p1yY+FM49uAt6Vnu
	8fEambB4+c1r7Xgtpj4g60cJwHUrd45boe43R4dtha+n9ygOWAUnBMQow4bxxyV1SfSXIHJrFLt
	msesEOUS0gxwquPL50h9lcvOvMpTusKqRyLFIpYiV5thzUrPoRYznqfHR0ZIF5cSlicyiN3nyq4
	xGJrjJyMtvG+upvV7xKf4wobxEt0S2Q8KimsWqIAi7Ysm0BxLS/LibH/bzIqW7tgq3R6Trd5Uty
	doYjwqf3uiU3M4oOHWVGjc/+9SHgJLb0n7+OmQk1h3vN+5tn1mAvVXhvphNhlHkNwQZHgH/f3jV
	6NNuuB6B7PibeqAk/g6BDQMf89Ye698el6gS2
X-Received: by 2002:a05:690e:43c3:b0:67c:1fba:b465 with SMTP id
 956f58d0204a3-67c3d9fbc68mr1052892d50.48.1794205377206; Sun, 08 Nov 2026
 22:22:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102093228.2751576-1-thi.zirnstein@gmail.com>
In-Reply-To: <20261102093228.2751576-1-thi.zirnstein@gmail.com>
From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date: Mon, 9 Nov 2026 11:52:44 +0530
X-Gm-Features: AclHuK_068F5Wc70oWZbpd7SA1pDUlq5xu7WG9r41_d4oinb86Mlf6cH4ArzQug
Message-ID: <CAKfKVtH_SRTSyZnouwz3MEbGrtinbJLN=y7NzuX_mV4+MgKoRQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] i2c: i2c-xiic: fix clearing of bnb irq and
 waiting/ clearing while atomic
To: Thilo Zirnstein <thi.zirnstein@gmail.com>
Cc: michal.simek@amd.com, andi.shyti@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 3:08=E2=80=AFPM Thilo Zirnstein <thi.zirnstein@gmail=
.com> wrote:
>
> Dear all,
>
> This patch-series fixes the clearing routine for the bus not busy (bnb) i=
rq
> plus the waiting and clearing routines while in atomic context.
>
> The bnb is used to indicate that the current transfer is done.
> A high level view of the software flow for tx:
>
> * init i2c controller
> * prepare all registers ( fill fifo, enable irqs, ... )
> * start i2c txfer
> * clear and enable bnb
> * wait for completion
> * ( serve interrupts )
> * ( bnb interrupt ): complete completion
>
> The datasheet ( pg090-axi-iic, Interrupt-Status-Register ISR)
> states that the bnb bit can only be cleared if
> the bus busy bit in the status register is set.
> So the iic controller must have recognized that their is some activity
> on the bus. ( Start condition )
>
> Currently the bnb bit is cleared without checking or waiting for this
> condition. This can lead to spurious bnb interrupts.
>
Reviewed-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

>
