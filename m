Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514576;
	b=ZbYAMMf1XHEpaIUp16exLgdDX/k9MKC0pQ3WpbqG8qa3R0xre1h/6VRR+lAJTMTHpfHx
	 EAqpwYJTrV4Txs6cjNovIadzN6YZ8+h9yQ5qR+H2ZCP5DsNMSHkbiCpRfjLn4OjQa+0mA
	 eY1eTslS3fk2+j69jQOyNT0Wj6YpFscs2GCPCcG2+lArntkXmjC5ACLCrfj7XsH12bs0O
	 eME8QT6a3nHhSgkgFktbVahPCrgYVjIC9Dl06a0p7Dgb0TPiVULaVXOat1bFaMh6cj6j1
	 NLtL5KgWHEI48G9yDfze0pRFceQ6yRmxzTqNh17Dxeqd/yWP7UzIa13ZT2Oppr++lVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=YbI3E9wpo32mpl8w38bTVPHTLpJsQclRJaeIGMppCCY=;
	b=QeZZZnler+qcNJtjI9E+6JIUn5fl9SkX9oUv4bIxpANXjhNLp4rD1zS2MmKG4jp88cFU
	 jx7gbRIaMAf76lif8gK8NjMo7cSvt7ayJ/24CUYWUBLWdXnUCUWHZJ7Yvn+ZxyeZTfiuj
	 Jt6eUMU58khzvYjKKBWkzdM0WUVNjwSF9H9028PonlX3/i2VK90XTa0C42sNzJRLxxFj1
	 Zyb3ba0HRZvs4urz6NvrSewij8RZ1vBjQplqfFr176ZO2m8KrzaOhKY5VJg2KGnhQxNGt
	 /iTnTUWYmJ8dQj8UuJa7omnPpPMIzl3XgZCDngEb2MrkIgtn3kDYUHwZ2ksyTcziefw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZHlKlrM1;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2341C606A328
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:42:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2341C606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZHlKlrM1
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so533285e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792514574; x=1793119374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YbI3E9wpo32mpl8w38bTVPHTLpJsQclRJaeIGMppCCY=;
        b=ZHlKlrM1Qj7f9ziupsQLSfI6saYrZDMCs7hnCXMF7RrG+CpaHxCYRC97K23SIVcgg/
         Sdonjvek8squKoyvDGjl4+zAQz46TJHeFr2xnBtrkoT1eDcnHr9pW6hXzcStcniojJxL
         QY0M7C/l3UyIWq7jH5M15Wn5I8IPIuCBmsblxWfWIQo8iSCqimNwa1Th5W+GUrjTChhb
         vh1h2iL1fCyqks/gny7IUw+3qSqVBnc1wuhu7dWgbeiT9x7SJc8qT3XxbW7x+OsxQRl6
         +qAzYrVRyp7Yn7Veh2b6f+hyBZvTk51ren49WJzWPOzCV9PWJvL7x/mGMJR1WMPPLqxr
         I/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514574; x=1793119374;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YbI3E9wpo32mpl8w38bTVPHTLpJsQclRJaeIGMppCCY=;
        b=lW3RJnspjvg34NfXyTlfHjTL0O1CMv85OTlcsR4WGn/9m8s4RONv2UjI8dFs+AZGbi
         bkrvM0qI76LygU9xEt50UHkrGF2vTGP9N7NtBugaFXd90Q+11sFL+86ssmZ3FIK7drsu
         5Mum7UMXSMBMVnDbP4boPoKm1RIbhUWTSE3B3ZWKabHYvTPtPLaRqu2js62MvkpWwn8H
         TC66+e6obmACmZ8pB3Zh0gPlupNrY3BoTkJVnNlf+II1WMzxnPgk+ju34qqtcSYxVnyw
         4VyByILRBniFrYeucFginiUXJIi9mF8ClIXBmUnIIPyapZAwECi62VK3VKdeNNkIUyMw
         veAg==
X-Forwarded-Encrypted: i=1; AKwUvBxluyhQEEzFm9AqCEaol2ECBAY3mu/Jf7OIV36Hq6t7PP34ruPyG/M23bx/gZ74WH9Ds0+kf0fOzdJgz0c=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9iQmrPj/LDDKae3YXx7YsjZ/LipsYEJp8VBvLQJij6cOHeArO
	NEgJdj337peITthBnSjbYRQVL0UEJzms1XGE4g5xGDwBkVqKP855Bw34
X-Gm-Gg: AYBFou2E31aaXm7+BmYI0oLTLSwSSsPiB5xsn7sJSf8jiDoicUCRtF7pkxFBfXqCLPC
	PnCv3+CWz1yrYlVhijhYYoUU6rsSWlT5f7roEO5LypJs28eGscWl6llLsqDdjEgX9xvtplHQReG
	5eo/oFYwudqxb23RBf6fgis40ZTqfzJf6Sjp91qXKPYBZGDNoI83esM8ndN29UR+3ycpf9IsMBq
	qCZgvUYwUfANP0M8R2NdhDv7Gd1jDzzrUNPBaeiIoZLp1xO06NllpMqCMFYxQPxSKYnT+PGJChA
	DKJWmYbirKEy3Hr6Yk0XOmxnlM2ukCyURLhxOq65xF3s8HETCmEBxESYzWJzE8RpHgMX1VNP325
	6qs7m4sIIP9bl4iwRwXONvrXJNdUjoW/YLU7seStx4UPum6LxkWZPri+Y59kQ1TzIFewfjeRNzp
	3EOY/EcaN1qL9rKxLHfJRYe+kgQh8lNHL6v/WfBXTbGvDLk1HxLJ3cd8tWp4R7RrxNR8H3QAtdb
	xSDN8rsDg==
X-Received: by 2002:a05:600c:8b51:b0:4a1:da58:1ee with SMTP id 5b1f17b1804b1-4a1da58073fmr212926695e9.31.1792514574361;
        Tue, 20 Oct 2026 09:42:54 -0700 (PDT)
Received: from foxbook (bfd231.neoplus.adsl.tpnet.pl. [83.28.41.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce3302b5sm244278035e9.4.2026.10.20.09.42.52
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 20 Oct 2026 09:42:53 -0700 (PDT)
Date: Tue, 20 Oct 2026 18:42:44 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Steve Bayless
 <steve_bayless@keysight.com>, Guido Kiener <guido@kiener-muenchen.de>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH 0/4] usb: usbtmc: fix undersized high-speed bulk packets
 on xHCI
Message-ID: <20261020184244.69b78d5e.michal.pecio@gmail.com>
In-Reply-To: <20261020-fix-usbtmc-short-packets-v1-0-903f4d029193@tipi-net.de>
References: <20261020-fix-usbtmc-short-packets-v1-0-903f4d029193@tipi-net.de>
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

On Tue, 20 Oct 2026 16:33:37 +0200, Nicolai Buchwitz wrote:
> The Siglent SDM4065A-SC, Rigol DP800 and Rigol DS1000Z (and probably
> others) advertise 64-byte bulk endpoints at high speed. USB 2.0 only
> allows 512, which xHCI correctly implements. Unfortunately this breaks
> usbtmc on these devices. Reads stop after the first packet, and longer
> writes also fail or hang the OUT endpoint until a USB reset:
> 
>   usb 1-1.3: config 1 interface 0 altsetting 0 bulk endpoint 0x81 has invalid maxpacket 64
>   usbtmc 1-1.3:1.0: Device sent too small first packet: 8 < 12
>   usbtmc 1-1.3:1.0: Unable to send data, error -110

Fascinating.

But SDM4065A is apparently pretty modern (2025) gear marketed for
"automatic production lines", so it's odd that it has such issues.
Has anyone looked if the same out-of-spec descriptor shows up on
Windows or (don't laught at my optimism) consulted vendor support?

Maybe Windows xHCI driver tries to enable out-of-spec maxpacket?
We could do that too, though IIRC not all controllers are happy,
so a SW workaround may be unavoidable.

And xHCI doesn't support URB_SHORT_NOT_OK, for the record.

> We ran into this in our factory once we switched some test PCs from
> dwc2 based hardware to xHCI based ones. dwc2 uses the advertised 64
> bytes, so the devices worked fine before.
> 
> This series adds a quirk table to usbtmc and moves one packet per URB
> for the devices in it. The DP800 also wants a ZLP after a write that
> ends on a packet boundary. Only read() and write() change, the ioctls
> behave as before. More devices can go into the table as they turn up.
> 
> The Rigols still have one issue I can't work around. They split
> replies over 500 bytes into several transfers, and a follow-on
> transfer that ends exactly on a packet boundary never arrives. Raw
> libusb shows the same, so I guess it's another firmware bug. Should
> be fine for most use cases though.

What exactly is the sequence of URBs you see vs would want to see?

> 
> Tested on a Raspberry Pi CM4S (BCM2711 xHCI) and a CM5 (RP1 xHCI).
> 
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
> ---
> Nicolai Buchwitz (4):
>       usb: usbtmc: handle undersized high-speed bulk IN packets
>       usb: usbtmc: handle undersized high-speed bulk OUT packets
>       usb: usbtmc: add Rigol DP800 and DS1000Z to the packet I/O quirk table
>       usb: usbtmc: send a ZLP after a full last packet in packet I/O mode
> 
>  drivers/usb/class/usbtmc.c | 87 ++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 76 insertions(+), 11 deletions(-)
> ---
> base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
> change-id: 20261020-fix-usbtmc-short-packets-1c4e233ae407
> 
> Best regards,
> --  
> Nicolai Buchwitz <nb@tipi-net.de>
> 
