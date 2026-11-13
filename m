Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794562440;
	b=Mcnc27JwgLpJf66bujc/2aXwabzfm5ZWO/eL4beORSYU4BSd5Tx7KEe9OPhpxJC23qpL
	 pJu0ra9zifGdgnH2oq/E7aiOzS1M6zv968hCvD8ZiQG5gK/swI0tiaPh6bf2sTZ8XuC1q
	 LwWgnkYDTyJqlfyvdL2+kA3/67XwEvnZrFjHX7PwF7y/AmYaSdKNWtRApjLiaJWyEeN6U
	 HDpnBBesTKgNEhYMyM/wdgCMYQqC7QWqAhyLfsY1ZdZh4sjfjZ081ycrwsVPcICIcXyK2
	 tKYMb2NPuTHq222vqrPBmwJnCstRCufRTW9GtjKVP1C9n47vjkbSiHoBW++gSqto6xg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794562440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=u1d+jX7pv4+dKm+uv9IHJgxQaYN/oZbwj0UPraCdJI8=;
	b=siqbaswu/wExnRWt77LbcOKSNrYElsddLf9wiVHGCcvoMIndzFzbill/4XiTpSBJmACD
	 3WBzzMaPRdN9xGqbMuuLHGFWlxnvIZ0q+H9NXJ4KWv/v19M3/5zairidYoIKo/+zr98CP
	 xG+tEt4/8HNqmyfaMKdqn5gL6FwpuQ519hbjaRxFNTr6zBZ9OoCZMRPbXH3mum4TPo0i8
	 CuvJh4EqZPvYKeAkH6wc+Np6DdElMW9n1E8JAe+RtoJL+Ckt6O9lAOwfZrcCaLlYH1qgp
	 3AeZPCqDHRP4wxb+QVoflLQq49jJTeOhQj4Xy52xK+aPvUTd92r2UEbfx8H2ZF2hJXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EMsRLejE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD91A606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD91A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EMsRLejE
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-372bdb942dbso843186eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:33:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794562439; cv=none;
        d=google.com; s=arc-20260327;
        b=NHAMFrs1k5gNTPPGeK/hSVA5gwXr5+ndI+XtM7FuUaf1S1kCkBKAhP0Aq8CkgNn/7W
         21erI5jkWjG6giEER+OJLTlHpgfRUY0s9PegpTRJRVPFl4a99DUl0l9tEpYrlH0MbXFT
         xJr70Pm+vOBbmK5/6D1pYyEoRijNXoNdOqGPRRwLeItXQ6ybGVvMcUNf0YLrQgjtqav7
         rhNGWKOU5w1q+sl6vdzp6pcXCJyRdye/mGiwvQ9QE7dHRv/hGxWh2zAkl/hIaY5vBY+w
         y/UccP/6bFCy0rDAeYDxwGxUGYM9rC730xFrU5o3pTsWlul3Z7Z7lxFduY0q+E9UwCxx
         g5pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u1d+jX7pv4+dKm+uv9IHJgxQaYN/oZbwj0UPraCdJI8=;
        fh=dmneFvkapmEBB2w+4yGfEbZ1tIZ4Pz+FRT1el5SZjc8=;
        b=oh4HezSUDqSxCbmZiEEdDZIdih4KBj0gulKVfa9Anm9kpNomsQaYyMuKuy44uCH2bz
         4FiOvWc/45AOVCtNIVgKq+dCJFalGyzWHjaOepsV2x55n3iGJoRLy0fRDy3Vhyjiv5Yj
         mqNSM8NdrT3zGQSQ9GnPSDsz6GmY6X5YUpWCyljfTxak1qh/lSm+xvEL/NRkKd2+JnUF
         F4VWJu+3hxd+vsnxUdw0qY5NNmhSEZVTT3b11QnSkmCQmk6CFShx3JEKE+Hc9/gViE7E
         qHge/DDrIICxQQmyybBz6w3nJJJP1+dk+7o24aVfTdyO7y9HGS1KXKANnzUsqq+0uHVH
         iHuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794562439; x=1795167239; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u1d+jX7pv4+dKm+uv9IHJgxQaYN/oZbwj0UPraCdJI8=;
        b=EMsRLejECSKve5zKyT/fELnBt1G4eF4EJJaz9wjZ9eLa4XZLaFKjeSAFAVLOiDDy3l
         qEk7iL3pEx4uUb34yWk7dB4gA8hZe0l5s17QOpD3UuaW3NZsTtuieQmmSxMe2HYRww/n
         bsmek53GV53JKg/pZQNNe72dK7/wO1xZX4slOORcTELuVpmyIYeIHw5XO++wfw5m51oD
         OdmQ9ERKMF5QLpAB0u5YmMbJfYz0MGc0JHOgnEnWBHjzoloSpM8W1At3OSlx6EqvweMq
         n3JCH9+TRb5s89yUI2gGtpVabLKgMjc5GjxbX0KaDFhunntNALuGrxwJn0RUptNsYeOq
         Wb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794562439; x=1795167239;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u1d+jX7pv4+dKm+uv9IHJgxQaYN/oZbwj0UPraCdJI8=;
        b=X/3mkGgKJwtYDT6ORMyF3/coNEp+LJsqfODBRdd/RyjPR6WQiJlzpHOed975XsTCAs
         nSd73LQAkPdCJ9P3sL/wDPFSwrfgksv9Vlc+MYYaOFGlWO7wI4retQyAc9EpfQSycmOX
         CxSBGCYjNXdILwBSffT9C/SiKrydnInkGDrkNlqxh3gPCwXjfnk04SIEYXyhIj3vAtgg
         ZxKzAk425oR4GpXDjycH92sY/UOKx/yeeS2F15uUsZtsejF2yiDK873ey8rH+e+baW9V
         1AUd6WLzjS3vx3xE8WIzXDnMb5DpoaARXXYV6rhLdDnAN+fG+fJGvAEwUkMoL7f/NLgi
         zTSA==
X-Forwarded-Encrypted: i=1; AL+hErECQBNXqLGbSeKxWcuJ/F5qvRkxUw8tsofDq0MLUnAbepODYB8PsY9DrHf6sWLJY9hRvYpiulV/dLvgf2k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BNx/AZEysouK/fK2MCBYvBm1gGcqR2qtZcp8FZVpaLQYrrVZV
	7GiS4KRWIt8BKru7gQ3yGlU2xhojP2uoCx4boXH3i7G6NHMd4aNq3so0NS8+IekWGHeMyhSb7gQ
	clUfUS8VkQcM4kdjH1jLeuRaNYEn62Wo=
X-Gm-Gg: AYBFou36oAWck3KtwFQJtdzkuHR/6yKG30oqsR5aFfY7O+iCX1UNO8uy6/ZhuVFoBJG
	3iYS9UppVsSo+b1Kq8rs5zHRnogmKUXG+Le3ugeoNTJOsJpMRXHhVT5uWjtk2lS4Hj3MfNGwouV
	1zfFcVT1Th8PmS7zym27ZyZDl5EP4OPNn4lPQGQvgfL5vz4Xju3E7ZAz+h2PgLVS7EFCqUi4XKh
	6VQLAI1yKcdVDfju2K9afZVf4KAqYw+sPiSYna2SuKb8Q2DcrqPMl/9l1MRWhSAWn3oBvMRPzKi
	ksNQucH6E9oqRHw9khPTq+7DqRhD0Rwppm93d9Fvtb8smk0MEIt3X3N0kDYCs2gO8d6abpRXRCw
	P3SHFI9dGJ2NWz1YkoXD4Klt9msI85XWvX0WBs87s8HzM8wGsJabvmheehhX+1Om8EHlDFEhNAp
	RfYEsn5hvZGeYG+RymTlbY9SEskPGWIQ==
X-Received: by 2002:a05:693c:811b:b0:358:dfed:d0fe with SMTP id
 5a478bee46e88-37964b0992emr1888359eec.5.1794562438756; Fri, 13 Nov 2026
 01:33:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112065037.1800467-1-dmitry.torokhov@gmail.com>
In-Reply-To: <20261112065037.1800467-1-dmitry.torokhov@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 13 Nov 2026 11:33:46 +0200
X-Gm-Features: AclHuK-f5iEwYMAt0ScbOlLfsX82RSmp1G8_ulBxjHo5JqdIzy0PJiY4cj272gw
Message-ID: <CAPVz0n25-LyOFFu-h7Sc0iUcjLMk0njOuAAHr-NepQbnZU6gxg@mail.gmail.com>
Subject: Re: [PATCH 0/5] Input: tsc2007 - drop platform data support and cleanups
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "H . Nikolaus Schaller" <hns@goldelico.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Andreas Kemnade <andreas@kemnade.info>, Johannes Kirchmair <johannes.kirchmair@skidata.com>, 
	Yuki Horii <yuuki198708@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-input@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 12 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 08:5=
0 Dmitry Torokhov <dmitry.torokhov@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Now that all in-tree boards using tsc2007 (including SuperH ecovec24)
> have been converted to generic device properties, this series drops
> legacy platform data support and its header file, removes redundant
> memory barriers, fixes minor coding style issues, skips registering a
> non-functional input device when no interrupt is wired (when the chip is
> used purely as an IIO ADC), and uses IRQF_NO_AUTOEN when requesting the
> threaded interrupt.
>
> Thanks.
>
> Dmitry Torokhov (5):
>   Input: tsc2007 - drop platform data support
>   Input: tsc2007 - remove unneeded memory barriers
>   Input: tsc2007 - fix minor coding style issues
>   Input: tsc2007 - do not register input device without IRQ
>   Input: tsc2007 - use IRQF_NO_AUTOEN when requesting interrupt
>
>  arch/sh/boards/mach-ecovec24/setup.c     |   1 -
>  drivers/input/touchscreen/tsc2007.h      |   5 +-
>  drivers/input/touchscreen/tsc2007_core.c | 183 ++++++++---------------
>  include/linux/platform_data/tsc2007.h    |  23 ---
>  4 files changed, 60 insertions(+), 152 deletions(-)
>  delete mode 100644 include/linux/platform_data/tsc2007.h
>
> --
> 2.56.0.567.gdb80ae8cd5-goog
>

Hello Dmitry!

I have tested this series on top of the latest next/master on the LG
Optimus Vu P895. My device uses this chip as an ADC for battery
temperature measurements.

Your patches works as expected. Input device was no longer registered,
ADC part was present and worked as intended. Thank you!

All series

Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # LG P895
