Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793687336;
	b=iD6urbCMlQQNkAOlXclWcQWrzwdCwb+6w4CORXRCgfP6/Ps2tGaOvm9XQ5ytTDoDAz2e
	 /iV6O3lf5EtCUTSQmntkmiDmsYdJou9ceQmB6IsYgyYDDAq0ZZjZnh1BsMlCza9lxuR8t
	 NlLz9IsS9yMSC751wfRyU+TjglmCXBShxAWtLTGL4tRxnjoAQZyGt6Ccfa8SfcpSfU2pA
	 L+Q6+mXceW+f7EHu//uyg/3HCv18gngTwLa3k1uIusYRz/zKrvqrsrKnXGTeY1QVI47Uy
	 DxX8+sx4t5XQyVWuBsa9Pb0hz3v983oJosDLOBXsn1Toig7SZqccsIbzeOg7MfPvXOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793687336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=IJdPaPjcw6KM6945s4a205xSGvQ0CD8VKU+jx7vOtyA=;
	b=r5fMm8GzlvlAGr0sHkoyf8T7VF6RuxxDlXaOxiccAIMYZEJPT9JEXiVP21+5BClEEF3C
	 iKWHq6FwjVeKeLAgJIrGFxeVQM/GOz//YDrmJoOlTI3OYYVUFG4feuaHgPHTBCjnVY98d
	 1ICMbZcpV4vcWkaA57u/3tdz10EQbNKemVQz+W0kEhfTyY+eKbQwEUxo3ZFot38N6oNsR
	 /BCkIhhtXmoTkIFrv8nwRKU78Q9OuN5XKadK2ScikVTX8xccap4qGe2jPQFMXIpzc4wNR
	 MO82s4fpJ2S6fvInmnaNvLQG5CNeKyXFlf/gWULn8FzRdzvqgcmtTZyLC6nRUKSp+MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ggLmM6kc;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43295606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43295606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ggLmM6kc
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e6eb21a8fso1476578f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793687335; x=1794292135; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IJdPaPjcw6KM6945s4a205xSGvQ0CD8VKU+jx7vOtyA=;
        b=ggLmM6kctlkClhPvgazfgjnpR41FPu4meieUr8d2i0Zr9wr6S26bdWwNNj56lucKnD
         w0AnKXMM8uYV2WYIZTzfGorw6gsWy3k6opQQ5+5fmf/S48JR4wcX2kUqq8ZFMrKom+65
         KnvZQGaaxSXdsX0eJw/uJ6wezDLb+8xvOt6ErbqaZ7B7RBM4fwxLL8rYV6fCcz+o7FrT
         Yt2xDXBZv+mKlyUdNhBEc29JHaTJDIH6qwWNjxkovYimHIVoMeK1m/1t245C0D4IV3lE
         R5wJx/JoAKL6oTp5TnqurjfCNW+wYJFC1jvx8S88cakSGEfCjnivSYWy791/L5zComo3
         qb7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793687335; x=1794292135;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJdPaPjcw6KM6945s4a205xSGvQ0CD8VKU+jx7vOtyA=;
        b=D4lvA48dMN+ROXLwNzQHufTzoKgZ/PsGmqpDBWKVwz7KZW/9ICxUNoSP5OrNNbeTFE
         CizVHGHaEgQ4SsmFaTq5Bg8y20FjOMxFPgcMvA+AXknKMzYVQdCheDuAuIPX28CvTdK6
         JQFdP6ukKq2o7jpudbrBLaNVFji+UmOhTWq7QlU03ldaN2KjfxgiFuE3xYKvgmvLNcin
         iHT9OfOt11dW2KVCZus6gcdatm1iA3AOt9S8HjCr4vSOEaKVMtpAH6tyyyIDBqTuBDQj
         ZRGVzAPtiSsPylSuoflZBKq5+uYYWFhdpf4QA1SY3tAKA0d5rwOTV1DjybspsIIQupNh
         q8Rg==
X-Forwarded-Encrypted: i=1; AKwUvBw4zHtXyjjeatspGNNNcs+i7uSf53gGGxXfUbuzoQSZvqhzrTywEv6QcsFZDwq8Ikh89BpmJ1yadYRqzAk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ig0w6AeKgbXiIuexKOn6dPFUyiTsIFTpHTrTMgDCvWfUXOS70
	jWi6n48r+2PoJB8pX6qxlX7qbFxHM1BTI2DwbXa2V2L49mtMbdRcMizF2xhNfBSH
X-Gm-Gg: AYBFou1Y8ZWfS9kI9HyA1i8EIlyy5yk9tAS0ixj99RIP/xQWk3NCpB2j6BNFBiNNmNZ
	0+O7ZmSQ5uoXTV0EaN9tYNTlFjr3WRu5YjzFiJ0uLp57SjyxcT8bK3kCjp0rBkGXnCByKfOjDJq
	enbKUDoQSttQThzPSxQGiDIoi/tUg6A9vy1YaxPE+N39BmzwumtFDsGwHUL+YVugq/PVUSn0WwR
	TDIqh5lD+x9TssuxxGsTIDsJyUnRfEn9/ywJTHuxtWvkJlzwY8GIdHB7qANi9q+k0R7kkUl96gp
	Ffs70jQMAmFMNwm9urBH89kHE+F46rJbfYYLFW4T5WM1V5Kt9vA9AchUdH04y2c4kdMsunvUm99
	XtVwpr0lKjoKjS1FdY2c5t8bkOVQNc9jtKk+zGosSW8V3SXrPb/LoB9gkHGq4tna9yFPOx7B3La
	+JIfkZ2uqUnTl9mXHsMQQBgwwOBPLQlE67PhASkCCi0wzxMfhXuOkFVjbYUrLS2ZwRZfHooQIt7
	ZGYtvMZjskLBvxCsxYenRzS2igNNvJJSUbkBKDqDgKdeZJS2woPru7Mx7dCfFyXscSy/IcHhoMN
	CYmohJjHZN9ZjA+Xi9TWmGQxouIxi0qRFtYq8IA=
X-Received: by 2002:a05:6000:22c8:b0:48e:f07:160e with SMTP id ffacd0b85a97d-48e6e305c3bmr27453712f8f.38.1793687334595;
        Mon, 02 Nov 2026 22:28:54 -0800 (PST)
Received: from foxbook (bfg124.neoplus.adsl.tpnet.pl. [83.28.44.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d511sm22743032f8f.8.2026.11.02.22.28.53
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 02 Nov 2026 22:28:54 -0800 (PST)
Date: Tue, 3 Nov 2026 07:28:49 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Kuangyi Chiang <ki.chiang65@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xhci: Fix HIK camera control timeout on Etron hosts
Message-ID: <20261103072849.623325cd.michal.pecio@gmail.com>
In-Reply-To: <CAHN5xi3NY2AUQK2=M80RYkx1N-bA8=zPEE6Y5400EYyMv1=aCg@mail.gmail.com>
References: <20260914013033.3938-1-ki.chiang65@gmail.com>
	<20260914130907.749cd8e7.michal.pecio@gmail.com>
	<CAHN5xi0NSJO=V0=eVd4_MGp2Lg5NrwB3D+hsF87ehTSmaeeSbQ@mail.gmail.com>
	<0e4c85e8-77e6-4eb9-aca1-048199f2f0e0@linux.intel.com>
	<CAHN5xi0tN2iWGVfH18SASoP0HVvAaDY4Kgq2U6LCCznGg-1o9w@mail.gmail.com>
	<CAHN5xi1M+g3Sy8YkRKpZuU7EtTxiyi0ZD6y5TCcAZTrpxUpHNw@mail.gmail.com>
	<20261029060335.3ed1fbcf.michal.pecio@gmail.com>
	<CAHN5xi3NY2AUQK2=M80RYkx1N-bA8=zPEE6Y5400EYyMv1=aCg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 3 Nov 2026 09:01:50 +0800, Kuangyi Chiang wrote:
> However, we captured USB traces using a protocol analyzer and
> observed different behavior between the failing and successful
> cases.
> 
> In the failing case, the device ACKed the DATA stage but kept
> NAKing the STATUS stage until the transfer timed out.
> 
> In the successful case, the device initially NAKed the DATA stage,
> then ACKed it, and the STATUS stage completed successfully.
> 
> We haven't determined the root cause yet.
> 
> In our tests, adding a 1 ms delay to both the UAC and UVC
> control request paths prevented the timeouts.

Could it be a device bug triggered by timing? Some xHCI controllers
perform control transfers faster than others - we have seen anything
(IIRC) from complete transfer in a microframe, through one stage per
microframe, up to one stage per frame even for high-speed devices.
We are not aware of any way to influence this, besides delaying URB
submissions. I don't know how fast EHCI controllers are.

> > > So far, we have reproduced the issue with these xHCI hosts:
> > >
> > > ASMedia ASM1142 (1b21:1242)
> > > Etron EJ168 (1b6f:7023)
> > > Etron EJ188 (1b6f:7052)
> > > Intel xHCI (8086:8d31)  
> >
> > I don't know that Intel chip, but the others are quite buggy.
> >
> > Have you tried other HCs? Any successes?
> > IME, chips from NEC, Fresco, Renesas are more reliable.  
> 
> In our recent tests without the delay patches, we did not
> observe any timeouts on the following HCs:
> 
> AMD EHCI (1002:4396)
> AMD xHCI (1022:149c)
> ASMedia ASM1042A (1b21:1142)
> NEC xHCI (1033:0194)

ASM1042A surprises me, because ASMedia in general are among the fastest
ones, except AMD Promontory chipsets which are extremely slow. NEC was
slightly slower than the fastest chips IIRC. I'm not familiar with AMD
Matisse and have no idea what xHCI IP they put inside.

Purely out of curiosity, could you connect a USB 3.0 NIC like RTL8153
or AX88197 to Matisse and see if it breaks after a minute of:

  while :; do ifconfig <xxx> up ; ifconfig <xxx> down ; echo -n . ; done

I found this to be a 100% reliable way to detect ASMedia controllers,
including those in AMD Promontory chipsets. This is the periodic unlink
bug I mentioned, which is mostly mitigated by 7c0c31c66a7f9 in 7.3,
so the test is more effective on 7.2.

Regards,
Michal
