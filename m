Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793743578;
	b=BRzzjDY82jdOdkP0wXq9Kv9F/qGzZXPW9dIdG+Hhl9GvU3l1LjVkNn1ZWfbdCVn8nanE
	 79aTn9sCmclt4kU81O+Ad2FuShdJIDgodepRFILw0zFE+6jHVOMwIyLXNSAXRQjQpXJWD
	 ZiDlniJWU68dnuvzSmJzTS9Hozfqq8LCuUmjZoMX+Nrj2CAcKEuCkSdjPWNH/yNaL6mOb
	 HlhjLggSJhKUWqYpeIAwc48nO4NxW2O+hPEGP2OfaMbkQw2z1HUppId0Fkrlsec60O+X6
	 DaUiUDbCnwk6Z+iQiRPOll5/hWvF9dlEPmor6XAx+LRj71lgmElaXK5s4B+8JxhRF3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793743578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=hv0Uio0iKv6YWg4emi8XyGAuTMh6jvPk4JOtOEL/kqI=;
	b=NRdfK+veUE1rj9ev1IcMQOqO1ej1CtVRxNm5+Kjgw2/d94PF4lIHUuhOd9h4j7V4cCe0
	 CvVxkCAyBWcf56rhjn+JehrCaL9ck6ZUxJvVmoWRoVOkme2MRmOXQu314QbgkiLyZKtfN
	 cILpcKI+m4xt/D7QQU4aTh74NsNZn1JcFc+Nzhcvqnf4+jvX3jmBtgPVx5YzAJw/TDWgp
	 bR+Qxqgft/9DmAPvdOodrHuZzSqNkGMc/uwZ8ufRpv4Ojv33gwcA7Vu5DZyGX4TG+Jut2
	 NLp2BuZgaxsc3Ti8D9ByxkJXSEf8fSUbGGeAwaYu8OlFNW6REnabE8DhtrPTEhK5+Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VWPaHvnX;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77566606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77566606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VWPaHvnX
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5363316fa0cso56555671cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793743576; x=1794348376; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hv0Uio0iKv6YWg4emi8XyGAuTMh6jvPk4JOtOEL/kqI=;
        b=VWPaHvnXR4QbSC5IyHVKu5R88jNYS/0KrZk5ghuorRGJARgbf8FsaNzpnVC2zLJEdX
         pa9OJ3WVP+4YhQdgWFAwTzIJTVifMCP1ol6riFYHBz7ZMlHr3lBDY9A/+PsoKRCNQFOx
         sligINswxDpSji18Eb/9ET++sAXIUl3P+I9AqvOXKCmnXaWp9JZOO8bgk/K2DZHWGkkP
         CswXp/YDWUFeWiCLCNzlSzODJQBe+lBNurqJxHZAJTVuav4ZUcsx+KO6BOJcYlC+8AEV
         M4+nGfRIKClahBvqOlhLzMDiENOkewQ+hn24ujf1KlZJgz71U8BMNYZnDJwZVIbtu8Zs
         jSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793743576; x=1794348376;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hv0Uio0iKv6YWg4emi8XyGAuTMh6jvPk4JOtOEL/kqI=;
        b=t6c6mkXxi5m8CYGPoWpTfFVNIHoSizO8o0yyu5Dd3IB3pcc/ofKPbBNMvpXx0YXK5t
         00fRoyQkTAFc4weFvJ5sypsuFuE1itE22c53Bm30bO5SmhuIf4xTTuU3IzX4mSekFQSU
         +XRPMtLgUQx7IAb/rKOaaKHYz5oSRn8Ui2jwDomkiVq397LT6+UJZVr+V925Ir2lLRxh
         W1ewYtAJjI0rq1GTbKhpB8yupQCCMPtRXpvRLk2P3BqxtnAfoYNjKUyNf2bUUTUrpLL9
         HdzMlgvuSoztu2KPBBimVGoTqEUQ/BYn9aFamjEy//nEyuJm2AR0yx8kDy4miU1cAooy
         Ttug==
X-Forwarded-Encrypted: i=1; AKwUvByjK/vAey+dQJQwu5wncpp/th6Lkn6Lv4Z4Ay8XmYwCiY4khwOB9ycwP+uvhXa91+GgnLeW52kLMFk/cCM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tg7OeJZ1WSf5fQkA76p/oYwLrCIz5OuTAUMreF9868Mt+kiNK
	koNP7T7aaU4PdendHJ0DTK6RDtq3bemae3fGehF7X6CBRhH+GnXsAMaU
X-Gm-Gg: AYBFou3PBjIgyLjP2iG4ZNTljpgUixjAHeAm3irSJ1oCJyT8eJRm7sLujHRDj8qm8Hd
	Rjk6TTXSa4VOfNcERCXfLzuu9YkUbQmBimOETaLyEE9YnVzAJn2n9u1t294+fRu41jmZBlQrTR4
	AwX61xyx/0Wl5YHVzbDaU7Z284YLjgOCOFI99l9HdQ/mzpPbGV8ryePr1d7OdByPVpz6ax1bRkF
	xMD1H14u4H/zBK417OwOCx1XOBLC5oZncH8jWdyi3r5H3jJSZ46KhrhWuY1Aj6qrGl2lwqWtuBK
	AjqhZQVCzRkRm4GVsNEf9EXNY/FtdFiBtJVvbEHcXm99E/gQW6pX29dmcNdRb/+nVS/snFZQO84
	hZ3/sWCr1oGwOEGuRYDAcveKfuSxdSDeSL3JEoxzHvn9UFIiCBT52RwFMgGXotql+JRXN84wO/s
	h3+u1i/5Nd7Ib+IxDCLyG2EGTs4hIp+SHRJU8rfq0yMBc0tFO9OwSyEwsS1R+rJOWGHe7FGkeAj
	P9EueyTrlPx6h1IintY2BlKxUz3AO21F7hZ24lJsF6msJme9Ts5toaYseGnwP2FmJNQVpb6EwOx
	ALI5URzsnoMF9QzDAhCggzlZBAhUKgIyUyt52Ai/I/JDJYhj+h9TjHM=
X-Received: by 2002:a05:622a:1f90:b0:535:a5fb:645b with SMTP id d75a77b69052e-542b83f7705mr214523681cf.70.1793743576258;
        Tue, 03 Nov 2026 14:06:16 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b10cf31desm6749061cf.23.2026.11.03.14.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 14:06:15 -0800 (PST)
Message-ID: <9a6429d6-ecd5-45df-bcb3-6bfa235008a9@gmail.com>
Date: Tue, 3 Nov 2026 14:06:13 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] serial: sb1250-duart: Fix console message
 clobbering at channel resets
To: "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <alpine.DEB.2.21.2608060322360.55540@angie.orcam.me.uk>
 <alpine.DEB.2.21.2608060337580.55540@angie.orcam.me.uk>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <alpine.DEB.2.21.2608060337580.55540@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/6/26 03:54, Maciej W. Rozycki wrote:
> Ensure any characters outstanding have been sent before issuing channel
> resets so as to prevent messages issued to the bootconsole from getting
> clobbered.
> 
> Contrary to device documentation at the time the transmitter empty bit
> is set only the transmit FIFO has been drained and there is still data
> outstanding in the transmitter shift register, so wait an extra amount
> of time for that register to drain too.  This also prevents subsequent
> messages produced to the console from getting clobbered, owing to what
> seems a transmitter synchronisation issue.
> 
> When called from sbd_serial_console_init() it is too early for fsleep()
> to work and even before lpj has been calculated, and therefore neither
> udelay() works.  Therefore delay by hand, observing that roughly 170
> iterations over an Input Port Register read are sufficient for the
> transmitter to drain with the BCM1250 SoC clocked at 800MHz, so using
> 2048 iterations should give enough margin including in particular for
> the faster BCM1480 SoC clocked at 1GHz.
> 
> Fixes: b45d52797432 ("sb1250-duart.c: SB1250 DUART serial support")
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Cc: stable@vger.kernel.org # v2.6.23+

Tested-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

