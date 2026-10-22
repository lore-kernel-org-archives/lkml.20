Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792675683;
	b=lIdB2O5f/WsVEZ/o7bSb8kYZuvf5e3agmMw9D2xmj4fdwygAxnDMIVnFGyIEx2KOlZ2Y
	 8hZn6+yJ3oNlsmtCdZEJkj8j5lYEaIK6XAsxd8a/d7Rc2SmmgzoHma5Yv450YxR4nk4kX
	 dKrKUMhaU6XNckeMVePi1xDiG9WHrqvOx+o2p/HGlmxp0WfrpyQUq4pOy9mqFXSbEVYbk
	 RlXAzg9lcGyM2PtBCqRCYZh8aK4TXSHgTLtafjb5rcDXnK9BkRSbYd/21oIiQbHQK4pKX
	 il60xiexxgJUvvuWbw5Ns1yfi/7xzsRRt4AI8X/o8DqpIQQSgTawDDhW8yDdZcLXLiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675683;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Nvs/O17pBoFT0kP/7U9Lwrf/xlPxuaSLW8PaLqTw0yk=;
	b=WOl38gOXqdhY59IOj/9BSl4ltYdojZDq33R+IRZwgYkn7juQHLt89SqW0+wcD2L/eAXJ
	 lSh5+YHI5Ni0dnW1A3299E7VOis7zkxfb+3RxUntQrNje9LmJ8ah+FhiCGRVNEp8+RFvJ
	 PaKOJfiLiDO3wLtZW+sRXS0sZ+IN7/9dIynNdfxGTqUwqBm4sQQ+0GWF3PD0fF7GVA5F4
	 6vtK3+ZG4l46GvkzNdD3SAlxcSMzkroD2wt6AjmVhlxoH29feY/wP1v4tZZToj5HZIn3U
	 Br5fikzmehVn2tkfrLmEGDvwA7STkbdUWR+p5RU3u6NHVpSYWNGJNfFtqmk2tcb3I9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b4f5jMKC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E830606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E830606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b4f5jMKC
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso291537466b.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:28:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792675682; cv=none;
        d=google.com; s=arc-20260327;
        b=sSWEIaCbbAXYNHpL1K+zMgqqE+hZSlAiYvGZW7etwUPwqNmyNbEL1d2uGs0tDCKrG3
         bwUAq1ZhLbIrqomo/DaVZEF4VK8bRc9xXzaoBb4yO1dU17HcnkIDMxhjfD0V3RK5rpJq
         JQBE4OXV7uPan3ZAGfFtZ8HyuCrxbsM8qai/v6droTcBqnU+jCEZEr+rVkeWl8k1hd8g
         Aho412ewzqvk1H86paq+3CqB8/4ifWx3bea9NO9ijs6IJr3TWWapCQ/9h9n5uTkju2W6
         1/0AHT+abuRsLo3v5w3y5sXey/TdeS03qZAQblSRB9QzfUvFURwaopivvjGQyrcNru7o
         AAWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Nvs/O17pBoFT0kP/7U9Lwrf/xlPxuaSLW8PaLqTw0yk=;
        fh=yBuOuVTjmXwGUn9fcgTOXl1mulxmmRR2It4SoMZJyO8=;
        b=TJMC1mJ1U0XoU++r5+eYkrTKuS5RtpENIAlj5b9sLzUXpQGvAqBMnbc8c9j4Ti8ngA
         Ib2EjijXa0R16FPWpl66df0+N85RoTq0fIGpl2RRlzBBCGRLtsyWZYY+QXv+iSeoLwGF
         6BvcLmNDGVJN/Lv/ENkyBp5zCWjFEYRTDG+4BFLiem9MpATIyJfCIufJUi5x8S3YGPaW
         MEbX8qKLLMNfiHkFXYiyhTsRy9ug+03a6+/tDE4RLQyR5WlPP+sMaOsBhIw7XrFkySCm
         ckODaEaXhXPoHcm3WJImN8/rGn6Sl6SfGJz5AioeJmSUeMy8F28LssLa+PEjXKVvd7tK
         6yDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792675682; x=1793280482; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nvs/O17pBoFT0kP/7U9Lwrf/xlPxuaSLW8PaLqTw0yk=;
        b=b4f5jMKCBzdLUNXGV1dGoga57/0B1KjZPufHx7dGbqvdssp85Cj0L9xrt5+a48x/F7
         lwfZE/96c7n5Xg7CjD/NmuJ3JPaMjwJ87oSnORhZ4hCwkpejgprkinY7j+T0w8kZQoZk
         Ps0WZHjNU22axsu1eWU+qrdvU+ukkseoZdFUEvMyh7ITA3J33xlpylUrfoS5xqon8g50
         lCnL8YceTG5RILEvZ4C95u5MltqLdo2Cnz35sdgKh8Ylr9Vu/Z7qTPi5SfnvPgiou8so
         OHXBUlg9e/p4eYFsUDDBw6OEjxD7KWAmGQoCwL8b8G0iNen8AZK4i2+ghXQC1wfHcqip
         rb4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675682; x=1793280482;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nvs/O17pBoFT0kP/7U9Lwrf/xlPxuaSLW8PaLqTw0yk=;
        b=CnM/xRyTKdwaolie/CwRRAXZxlp4aex9gVgq+3cDUb2XgPXILF9a1LrLMimukQ9raG
         N11GnXndJKPuKFqSJvmShYvMjYRA1wYWt/u6MgINC/gtN7jegn13GRyGFGHAzWu1/H3J
         9BgRCkf4TIyjo1RxVh5epduENc4C03nL0oi5oB6ZRd8ON17msx+qaThMLQRd0ne/yW2p
         j6Rw7Oa6441vx9zMDSVbFov60YkKH49Uo6Eo5yQ9wvYp8xfEaTiwzMvZuQSAd4MU08hs
         5YyGfrLjPAvQBkZGekVKVoWcmIhoAhOLoBWGNsSbfEkrX+krUcJiw7cSG9vLDKAEg2M1
         X3wg==
X-Forwarded-Encrypted: i=1; AKwUvByZyU8Qy/RauOD/2BOHKQKpxGSCB3xDG+LWbvhsWz9r3DrRNFUxOiOL6QgqAq1XpKNVkTUIjQ1/wVhGC4w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzJIDca4N2t2TfVs4qApB2RPaeMRmMnA0d24pO1NSutaKePw7D
	JW0uRglJZQO/TsuN688ujmsa5ryAKh0eoyNnKsZ6NTvUMYRdO1oJMGqBS73Kwrtce7DbCVKoDFV
	ZiqLPipeESs5cOleH9MyPnWzn5stSN3M=
X-Gm-Gg: AYBFou17NlRzt9l2iiiVNzFFANtULSMdSBqfX08vVsW31Ol35GtVN0VLiiOSoUYAePk
	0MKsKOos/8qP2ZzmA9S4DjjJLpRW82xzvBNU5Jcgvi6t/PBuJY/fE7ACA1z7aXiOdgrORfrg1Mf
	CLuE4cqdpxe5ZL4vkEEKUamJW6txaRtRF170262qRxMm+HN9wFPUp934ecbhgPo/nmBABjqr4ha
	EuYRhNhyENF1fZPMFj9Ilb2+/9bceO9rBsy1OUMJFvWcAsLByfU3vCKKOta+A7S4PAbTdbIZs1H
	vhXzW1MEjjtQGvcR4Bqi/xvX/qiarJU6sjUatI7tQlH6qGlfUwWEONmdAraSknW6EGjlfeCQSf8
	IjZPAQjRQNaFGJoLCgUK+iIUQkxPy9NYTGASfqQ==
X-Received: by 2002:a17:907:7f91:b0:c43:a881:3f4b with SMTP id
 a640c23a62f3a-c4679a3c145mr527773566b.47.1792675681566; Thu, 22 Oct 2026
 06:28:01 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016141208.2641974-1-e.velu@criteo.com> <atJXYHJa4jkUWJmP@kbusch-mbp>
 <CAL2Jzuz1qFwLSA=iivp5qLCTL6-4rvKmvFzJbOQzjPu6j_7Y2A@mail.gmail.com>
 <atJeazM_rJ0uj3vt@kbusch-mbp> <CAL2Jzux8v6zCxfcdd=MY5n0zQMVSa-_8Lki9z-fz7bFShNf7vw@mail.gmail.com>
 <atJk_2FmzjUZYO_Z@kbusch-mbp> <f665dc3e-fc5c-4352-8e41-a46b7ae97946@criteo.com>
In-Reply-To: <f665dc3e-fc5c-4352-8e41-a46b7ae97946@criteo.com>
From: Erwan Velu <erwanaliasr1@gmail.com>
Date: Thu, 22 Oct 2026 15:27:50 +0200
X-Gm-Features: AclHuK87xiVvc2aaK_iFmR5Fg-1RYRhdWb9X02-8msYtLG7XVWJO_DadPavgGY0
Message-ID: <CAL2JzuwuZp0gg1D7wSn7cdgpnhotnuLP6YpPd-SrdVyqhkeiJw@mail.gmail.com>
Subject: Re: [PATCH] nvme: honor the volatile write cache enable state
To: Erwan Velu <e.velu@criteo.com>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org, axboe@kernel.dk, 
	hch@lst.de, sagi@grimberg.me, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 17 oct. 2026 =C3=A0 06:25, Erwan Velu <e.velu@criteo.com> a =C3=A9c=
rit :
>
> [...]
> > Unfortunately, no: there are contradicting statements here.
[...]
> If you think it makes the commit message clearer, I can send a v2 with
> these numbers, the kernel anitly, and the driver level Flush latency abov=
e.

Hey Keith,
WDYT of these explanations and additional details?
Hope that's better and could be considered for inclusion in the next
releases, maybe as a backport to the stable ones as incorrect
detection of the volatile's cache status can lead to severe
performance impact on this type of drive.
Erwan,
