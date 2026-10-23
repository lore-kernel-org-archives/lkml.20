Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792780013;
	b=LpL7axlCJmHdL6R30L5GWFlACtVA4GoKdMrPTH5t1BHCpvc8WUAHw4q3pSCP6xoLWANk
	 Aw3TwUed6mGcZ1WIR8pDl3Px7O1yclj6lBKPXsV/mI0XtRsuDEyQhoLVPhMwiXmQAl+OG
	 j9RkEW7CUE3+w+6AkDybCNk4GCU5JRtYaQubaZawQDtKgx64EWMZN1PxRxNxcJaI7Lhmi
	 uOqNeQAEETR1uJeHBYBEJJ9LZZlh0evQZqSE4+g4GkqNBHeooBbBt+dRFbiMt/dqI0rzZ
	 zv7J8KvK+ehcvn8tQ/eHl7cwLS4MY15E1ExJyAV7G+MKyzFN/h2qaChJ95lDAGnCvsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792780013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=8oxptXPm0UTdO9zxzHdUJQ/03E+e6vl9OPFrHOgj4hU=;
	b=fcPqAkWUxbEpUlASWUo52nM+QVlc+6erPYte/jkgSNAs1jtheIzdQ9ZqvtXt7UzeCW2q
	 dvld0Mntlh3bMu/E3iBDoP7vtO4zel0taL4NzltoH3aqI8XlgnrJ3wbQz1rGABEjfbqxF
	 oWIzv07IXCCcUz2VfgnCVd+XD8oBo+CX1Cv7uMmtwf7LsKVUA2IiYpZe6S90YxlhaPW3g
	 uSikbC+syH5zOyiHbR2DOCKgBoKN3NK8mnSpTUncHWRXNv9rvhd1ASW2iVNL4LshrPHxW
	 xxpBLmrHEZTMCvyQ0qb6/NsCQ9GUAKhRPgDiT+G23kUmmwa+x27nTyPxk0wmk5hgJJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gG04FLN6;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A655606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 18:26:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A655606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gG04FLN6
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c4be28b82so963885f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792780011; x=1793384811; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8oxptXPm0UTdO9zxzHdUJQ/03E+e6vl9OPFrHOgj4hU=;
        b=gG04FLN62SWZJQTWBnAsPFuc6TNGJVms+K0uDPT+IGHd/lC0w+Z+gOyI8iSwPYVYUT
         t23RxuVl4gpUg/wxIsHB1QtA8XLkkSnmQLDsCejf6bMm/w4K1aHPxE7WMbUA2TIE/671
         axqbO+N0BXg6wzRUISaiVONqh181VnHVLcJ6FOu/eVynt3JPiXfaV00Eu/9yENpUn+i0
         mr3sA1dNX/ouAahyt2pcb5O7MEOVJYzPbZHf0jC/XnBZLGB933IRgtj7ehaucC7N2mr+
         Fi74DwEzCtoO/bXcJeFO0yey+Gtevpev5UQ3Kd9Fdzpyy5LsbJFPM6uBRshZ6AAs9DWn
         TEpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792780011; x=1793384811;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8oxptXPm0UTdO9zxzHdUJQ/03E+e6vl9OPFrHOgj4hU=;
        b=eL4Z0zelXzLEwsh2YGoT3j5wky5kEWLOn1B7GFpmapytJna3SwtbxLSmy9X3tVvVj5
         ZuW3zCG3sF4ft8IbC+sYyFonarcZCp7BqeaUJpWJ0E8z3w1yKawbeZARlsq2sdFv54fw
         D3uEJzjTuYmLviLxIjlT3tgI6F2DToOJW023IO9oEZ87u23fc3v9R/Tj66ww4p3HPM44
         +24KE0+d4W3LcbMHTWgvzyAMzczuLSmwdYKV8VblTlThu+UqcqtLEhrN/J4DFia84LMv
         QBUQjEJtsz4UPtgLoottq8tyi0aKQN0DTDubNrMA531Oi9mjAYRGthlILsn8Jx/VO2FN
         SLtg==
X-Forwarded-Encrypted: i=1; AKwUvBy0c3+Mg3+g2OxQD45uePEsc+QEvKaG41lu7ftKmSvlRRabd+lGqQU0hNRCufPAK2hh6yUxWn/wKDgfBuY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzqAJoARGtVcb0NfG2wl2sLJCMsIchfiNrNql+UcELB2MPZb7t
	BaNn2euEnhj/kv7t3INS8aJst2uSUD/WqJEgDeZsgUw1tDHWa+0Y1W45jk1zcg==
X-Gm-Gg: AYBFou0G1flrf6lkYKREOQd/3jyZYYAe+VKMf1kvPF4ovu4wW5AmfHihnaT44tJqdVO
	YOow3IOcUhGZGKhbL9QxTrH4kHtRObSlXvQUA0GF5BO4Zlzg2mAxdSKgz/sY6isjJAE8JMC2gcm
	tD8A33xH7EKO1f2+lOhTo2vT2K3lDGjJ765MnWFR//oBhbs8SR5Jmm19pQyyw1Akk70Q2VgVG/a
	pEi4WINNlP9AdK2ESm5nmmnYxzDK1YOD4FWzSv53XC1S2JQX/sQLjJ6G/62EK0ut+LqkUh3cowf
	ZZVfzTUvDJmUlvNHvfRE5/Pqe2ofCSQU2nNikh6deGAnu7qkeMIyc4DbnBHKHbrcM3K/evYkHYW
	VtFKKUSM7GdgwOG1pKd7yyiw8+OjfChpGZ0kQsV0ka5ali6+zUXk1wUJQl8oRN91W76dxHQ6V18
	VkLbp4lyTNKlq3A8DEDdDAQg7BSPraLPn8xEgQRSGMtMOw/IHOPtLJ52M6w8e/RESHaWgL8HUtL
	Kv15oKanlDhWJ4r9NGmyAjyoygUKpw0rPcrYHIeZFkfFsTBQhAoAClQ1X6LKyUec9bGBPS0v3nc
	34QCSX0A9w==
X-Received: by 2002:a5d:5f4b:0:b0:48c:49bd:62df with SMTP id ffacd0b85a97d-48e3854ee8fmr5266476f8f.1.1792780011351;
        Fri, 23 Oct 2026 11:26:51 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d42f884sm1327266f8f.57.2026.10.23.11.26.50
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 23 Oct 2026 11:26:51 -0700 (PDT)
Date: Fri, 23 Oct 2026 20:26:45 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Steve Bayless
 <steve_bayless@keysight.com>, Guido Kiener <guido@kiener-muenchen.de>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [PATCH 0/4] usb: usbtmc: fix undersized high-speed bulk packets
 on xHCI
Message-ID: <20261023202645.7bf4827a.michal.pecio@gmail.com>
In-Reply-To: <cae2e837872be0560f7f46e13651059b@tipi-net.de>
References: <20261020-fix-usbtmc-short-packets-v1-0-903f4d029193@tipi-net.de>
	<20261020184244.69b78d5e.michal.pecio@gmail.com>
	<a642dbc2e4ba0efc381c69e26821762a@tipi-net.de>
	<20261021005654.23517441.michal.pecio@gmail.com>
	<cae2e837872be0560f7f46e13651059b@tipi-net.de>
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

On Wed, 21 Oct 2026 11:34:19 +0200, Nicolai Buchwitz wrote:
> I checked on Windows 11 (Intel xHCI, WinUSB + libusb): same
> descriptors as on Linux (HS, bulk wMaxPacketSize 64), and a single
> 4096 byte bulk IN read returns the complete 110 byte reply, so it
> seems, that Windows programs the 64 bytes into the endpoint instead
> of forcing 512.

Yes, that's what it seems to be doing. I passed a fake storage device
with weird endpoints to Windows 10 in QEMU and with some debug tracing
(slot/ep context hexdumps are my addition) I see this:

usb_xhci_fetch_trb addr 0x0000000139a3c450, CR_CONFIGURE_ENDPOINT, p 0x000000013a18d000, s 0x00000000, c 0x01003001
usb_xhci_slot_ctx addr 0x000000013a18d020, c 0x68000000 0x00000000 0x00000000 0x00000000
usb_xhci_ep_ctx addr 0x000000013a18d0a0, ep 4, c 0x00000000 0x00400016 0x39a3cc01 0x00000001 0x00000000
usb_xhci_ep_ctx addr 0x000000013a18d1c0, ep 13, c 0x00000000 0x00400036 0x375ff001 0x00000001 0x00000000

The 0x0040 in the second field is packet size, and it becomes 0x0400
when I change to 1024, or 0x0002 with 2050. Windows blindly copies
those eleven bits here and only gets upset if they are all zero, then
it resets and enumerates again a few times.

I don't have any out of spec device, so I tunned a Cypress FX2 into
one - it exactly replays every received packet back to the host. I
found that power of two sizes from 1 to 512 work, except on Etron HCs
which only take 512. Guess we could have an exception for those.

So this seems very viable. I will turn it into a proper patch and see
what the maintainers think. Seems better than patching class drivers.

Regards,
Michal
