Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794780189;
	b=rwM1MNATiK2BwV3BAEJOjayJI+/FyLVHX1/lGHZgLaiNNyVAMKE/m3X3HuLUm9e4PmPf
	 +6lin28/sMp9+myM4pTrPOD6IoqS3ljUFSTfGeE0b9Sf46k5b3ab4Ks1Jwwvr3V531ifN
	 y9+Xr9OrvLOCG1i/y5kwq2zxKAR9Ld+jkivXf/Vy7UJ/23b9igRmohvCSKZjGZT9hlzDG
	 pla3Sam25hiTrhUSHIBfYadfPY3+wzJNsJU0lNnxc+5Y4b65L+EWlW1GfvJezLniBWvkm
	 ErKyTO4sNF9a8GMhkZSuy5LwrhmAdt641KHPRWJgEKAi11APzg0MSK7b7iHskyeR9wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794780189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AvuwrZIWInS/vmhg3MkifAQ2jLu31ynJDcJbkxB/zW8=;
	b=3oecaSEUeFCcrVflfl7Sf8/EGXPNz0QDmMiKeafycbwxTUIYdh//MjnB1EL01F2lNsvE
	 5SJ/+ddiByF9bPEbkkOyKblsvzWKIkOEPGh7N+E3qcbeLnyPN/nPOmakek4Ts07g+dVd9
	 Gqq51OpiYTajFaX+Hg5rnS1G6vgR3An8DiKK2yRmNqGze9CpdoLpw+NwJPb+AvNVQ7/p1
	 d/0u9y3OQTO/+pQ9RkSVw2k3T9Yh/ImfLLJn+r9B8Ot1XvbFTnOxxEYlIHy4rh5zUQSuB
	 LWYdru1ROAx6uyn7SbwBre6eq3GaS1XBaKaBCb1KchURegwszRYpx/oqYUJfGDwEURQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yuzi.co;
	spf=pass smtp.mailfrom=yuzifovich.name;
	dkim=pass header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=FxTfTaD+;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395E0606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:03:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 395E0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yuzi.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yuzifovich.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=FxTfTaD+
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-49318428d98so1074280f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yuzi.co; s=google; t=1794780187; x=1795384987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AvuwrZIWInS/vmhg3MkifAQ2jLu31ynJDcJbkxB/zW8=;
        b=FxTfTaD+v4GNblSlBEZwGf6lcI9KlvsYDoexCMuU7Z5FcfFyb+OxfhKfRWs5Vs6bvW
         yjy17iDAak6jm2ZakavdwYsKT7/qTJhR0hPMZJFFII/exXCptMTdJVBAuX4FcUDOq1z4
         Y60ef8DNp34FJJRUg6qRII5+IN5kSk9ZHtyeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794780187; x=1795384987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AvuwrZIWInS/vmhg3MkifAQ2jLu31ynJDcJbkxB/zW8=;
        b=zuV51IaNive2OjxBRf12HFj4qtBMOAVnw48/2hgISkBbT7Pfb7bJfqTNHNp9X1YDTg
         9Keg3ELiLm9B3gD5nFidDb140l9egKUSOZb4Gm5MBB4cfbA5nQ3Zs71EEl+zI5WnSPLK
         McmIgmtIAw0AoZtUQEmY1lizlJUvDLw9SkyO/heAmC/cH17rLJCS6i9Azsg3XTgieEVh
         /xQwjJAuU40t9RRGzE5cY/MK2jrB0HdQT5zCdT5koJsP8Y/X/+gLGcC2pZTLhKYNWoRV
         gdkrMPxotS04D3s8L47eo+aKR4b8OULfz15yZ/N2f8OgY2Ugmyx3H6xY8toPL9F08ohm
         zL6Q==
X-Forwarded-Encrypted: i=1; AL+hErFsq8rUD58cg+i7/bjxnsA0C1B6uuiur0AXsoqy5X+WCvYuTktLGCeF+VrC29BG94/B2IGz/UggIPjhq6k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ySyIB5Y056ghutOlwON38dokt9AuCuhstK4ksVvC69dWZNRzD
	mCVqKWCDrXUoCNChVE9ISB9QfKInotwcE7H4RehD3Z73Fm/se5MUZ8mwY2C8LKmk/yo=
X-Gm-Gg: AYBFou3wZ+PxZXIB1lvufeuKndE7xhPTVvncoz7ijpfoc86zAA3SZbBp+Ic4GH6doPJ
	cuRWTG57gf22kK4Pnl5Nu3LlUPqw8OpGlFL2SqcYEX/4kLOfXMG0UlV4wG9cK1jN8S6+dqW08Yf
	TGbWJARcUF/mi/LEz1Inxul28euMVJ/Pea414rqNmgyKhFJJyaiExkHw4TmSbDsIVkmzMBnsHmU
	1fDh6CgRL4pGizt2aVO0afmGt04mHXL6ltkoDYABUQhWi+9/IcvNb4ANVtnxyHliQy70aWTEvHA
	nzrrf7QAatbDC/7pkASXc5p7a7LlDsSx83Yy59an+OsFknY/02RoFmj05iEEmRcsznyRnNtrgpY
	P07x+U3EwoXsGli+8JKZ5cEpgj0YOCwW8AHhdMrjL+/BOtzz1/hNPUySVZHNQ3LGlqa33GCP0fs
	lcP8JQkiqcwOQ+CyW962b3C1U+nEciJBnNbQ94DXboOEb316Kwrfd8fJGDH8bMRUY47qmO1va+M
	cfvKvtHXpS0w2pYX+Uq0RZFZXNY5o3r6lFOCA44ToKS2BRVNCXNmiHLIDKmffPk7r7DuFxImyTT
	0tj9Ogw6/WznlHVxnhXizqThw5nqQDqxmEjQUcEhG+1ZxinXhO14tlxMzb0qZp8Nqok46WhH7D6
	xYbKIPZBiYPiX+isguEx0a4JBXb7p7YmRZslX1IxmeXYU+BxcD7LOQgt2Cw1u3YluWOTP4nyjMv
	PmXQ0pc146ffEeMA==
X-Received: by 2002:a5d:5e01:0:b0:493:c0a:507d with SMTP id ffacd0b85a97d-49c6e4a3953mr20083609f8f.1.1794780186868;
        Sun, 15 Nov 2026 14:03:06 -0800 (PST)
Received: from terra.lan ([78.83.170.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5fe370f8sm16616543f8f.27.2026.11.15.14.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 14:03:05 -0800 (PST)
From: Vadim Yuzifovich <vadim@yuzi.co>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-usb@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] usb: dwc2: gadget: restart descriptor DMA isochronous OUT endpoints after BNA
Date: Mon, 16 Nov 2026 00:02:58 +0200
Message-ID: <20261115220258.1519467-1-vadim@yuzi.co>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115185335.782678-2-vadim@yuzi.co>
References: <20261115185335.782678-2-vadim@yuzi.co>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please do not apply this patch. It is wrong, and I found that only now,
testing the changes for the Sashiko review. Patches 2 and 3 are not
affected; numbers for them are at the end.

The test: SG2002 (DWC_otg 4.20a), a tone played into the UAC1 gadget,
eight 200 byte requests queued, and interrupts held off for 12 ms once
to cause a BNA. With this patch the endpoint is restarted, as the
changelog says. But from then on it takes one BNA and one restart for
every packet, about 2000 interrupts a second, until the host closes the
stream. Most of the audio still arrives, so the test I did before, which
only looked at whether the stream went on, passed.

A trace of the endpoint interrupt and of the restart shows why (time in
microseconds from the start of the hold; desc0 and desc1 are the status
words of the first two descriptors as the CPU reads them):

  12015 irq      DOEPINT 0211  DOEPCTL 000480c8
  12121 restart  DOEPCTL 800480c8  DOEPINT 2201
                 desc0 8e2d8008  desc1 020000c8
  12129 irq      DOEPINT 0201  DOEPCTL 800480c8
  12630 irq      DOEPINT 0200  DOEPCTL 000480c8  DOEPDMA at desc1
                 desc0 8e2d8008  desc1 020000c8
  12715 restart  DOEPCTL 800480c8  DOEPINT 2201
                 desc0 8e2f8008  desc1 020000c8
  12725 irq      DOEPINT 0201  DOEPCTL 800480c8
  13633 irq      DOEPINT 0200  DOEPCTL 000480c8  DOEPDMA at desc1
  ... and so on, once a millisecond

Right after the restart descriptor 0 is already DMA done, with 192
bytes received, the frame number of the current frame and the L bit
set, while descriptor 1 is host ready and never used. A second trace
point shows descriptor 0 done even before DOEPDMA and EPENA are
written.

So, as far as I can tell from outside:

- After the BNA the core keeps the OUT packet that met it. DOEPCTL
  shows EPENA clear, but the core goes on trying the descriptor at the
  start of the chain and raises BNA each time. That is the repeating
  BNA of the changelog. Flushing the RxFIFO, which
  dwc2_gadget_handle_isoc_bna() does, does not remove the packet.
- The moment descriptor 0 is host ready, the core writes the packet to
  it, without the endpoint being enabled.
  dwc2_gadget_start_isoc_ddma() fills the chain front to back, so at
  that moment descriptor 0 still has L set.
- After that the core is done. DOEPDMA and EPENA are written, the next
  packet finds descriptor 0 used, and there is the next BNA.

What I tried:

- RxFIFO flush just before the restart, clearing DOEPINT.BNA just
  before the enable, reading every descriptor back: no change.
- Global OUT NAK around the restart: GOUTNAKEFF does not come within
  100 us, no change.
- Marking descriptor 0 host ready last, after DOEPDMA is written: the
  chain then runs normally if the core takes descriptor 0 after EPENA
  is set. If it takes it before, the chain again ends after that one
  packet.
- The same, plus: if the core takes descriptor 0 before the enable,
  wait for the packet to land, give the request back, build the chain
  again and enable. No packet is waiting for that second chain. This
  gave one BNA and one restart per hold for 34 holds of 9 to 50 ms.
  Then three runs failed after 10, 19 and 9 restarts, each time on a
  9 ms hold, which is the edge of the eight queued requests: the stream
  stopped, and twice the host reset the port. I have not traced that
  case yet.

Thinh, what does the core expect the driver to do with an isochronous
OUT endpoint after a BNA in descriptor DMA mode? In particular, is
there a way to make it drop the packet it holds, or a defined point at
which the chain may be written again? I would rather do what the core
is designed for than poll a descriptor in the interrupt handler.

The Sashiko findings on this patch (BNA handled after the chain was
restarted in the same interrupt, a BNA latched before the restart) are
real as well and are fixed in what I have, but they do not matter until
the above is solved.

Patches 2 and 3, same board, TEST UNIT READY as fast as the host can
with a 1080p60 H.264 encode running, counters added for the test:

- With the read-back of patch 3 switched off to get BNAs: 368000
  commands in 120 s (3070 a second), 13103 BNAs, 12809 of them
  restarted by patch 2, no port reset. The other 294 were on the bulk
  OUT endpoint, came together with XferCompl and found no request
  current. Two more such runs: one the same, one with a port reset
  whose cause I did not capture.
- With the read-back on: 546000 commands in 180 s, no BNA, no reset.
- In about 40000 BNAs on bulk endpoints the endpoint was disabled when
  the BNA was handled, and no endpoint-disabled interrupt followed. So
  the timing cases Sashiko describes for patch 2 did not occur on this
  core. I do not know what the core guarantees there.
- Patch 2 in that test restarted the request from req.actual, as
  Sashiko suggested, not from its beginning as posted. A BNA on a later
  part of a long request did not occur, so that path is still not
  exercised.

I will send a v2 with the review fixes for patches 2 and 3, and with
patch 1 either done properly or left out.

Vadim
