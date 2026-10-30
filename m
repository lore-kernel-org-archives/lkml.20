Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793370394;
	b=Uz5oQNbcUgC0Sb50gKzhOUr8sKBl2geFfO3hDZV5yNGkpy9miu8qFniyB3uqazcCZpzJ
	 rfNuTuzNpqrjzgwRSL8YYONRFV1B0AJPlmFqMEJpFzYbX0VL/abu21IgHF0xa4sDuMAOd
	 JEXjYwLDGub7T/vmsKbrp6tFW96xE4n7CYeYokxo1hk0pAUaKiUo8DmLcEPUTnZx36QO9
	 IZG7afAc6bPXpcgt3gjfjNj8QO24GlJSVO0GBr/UpjQwaZXKdmZ2WwhNXJyd3p+vTSE3I
	 w/QO5zhU0FxbZESQWY9SR9FPAC9UFLvFz7GySrYtlA4uXwijrFzfzXcwkFQWzsSr5Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793370394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yYG4TpWP5CQGOegvlqLkoK/4FyE8KxdOkg6JKG40puU=;
	b=GxlQJEjtGXiV7sSCOaUT790lxylq0JYTGeXiegTwQShpA6E96h38rdNOcpdaR5Psfidb
	 x/rINkGkB/RBK8yzxcyLHmQyIlOzvBe23JO8wPOJt+CIvhpUjcBW+dnG8pN7TNvD2UgIB
	 xcWCRMA6lqBp+n9Hheu2cYC00JSM7cUMAv5Z/6waBs45fzZ81OQDhSiKga6urD74CyjQL
	 taqRAjORUROs8TpTcR7w3IbQ0Y4YerJ/IhYBtGh4EJS7UnU6fGe2uoQ80CE+7HvJQc8vt
	 hFTDjgyJgBrf2648Dtb9O+qWtiKAoMWp0EO6kzFpcSstKQvUclCsjPtqO7pdLAo0kwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WnvadyXG;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9174C606A338
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:26:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9174C606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WnvadyXG
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e9ae47b00cso1476495ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793370393; x=1793975193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yYG4TpWP5CQGOegvlqLkoK/4FyE8KxdOkg6JKG40puU=;
        b=WnvadyXGGrMdYZywmz4E7FRaPFe0uYQwczsQEhWGlq9T9cqB65QKUIj3nRfUbitk+l
         cxOd7ULRNzWxx6zI/Qr9R3bXk/pktDMwzZoIXqQf8h4cadqo4KVugcXFZJ7Y9g6TWWpL
         wfBNbs3Jra50FiW7Eo05t2OK/e6tp0MN4F2E+IHUquQb5UXe2v659DTr2Hfbf24qojCu
         76ifXUa+r3Lcu2Undt8vlwmT3Y1K1nTdhKK02FtttnB77NyImJOXfy4Hu4sBKPqkP0/L
         giyDzG6zB7bcfznN3oC1jXWczugk5A/PokqP8T3mEiqhrNucSMm9AbPtbtel0ft+gMXt
         cTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793370393; x=1793975193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yYG4TpWP5CQGOegvlqLkoK/4FyE8KxdOkg6JKG40puU=;
        b=Xbc6+LP0x2QOfJdPzJobqyemeMGukZB57p8E4Y6HFvKuzAjIj7PPeGcgcBieu7yhNZ
         3dMNVMyRyxNymCKcKT0twntmeo42ZfyuGJOkW2ekSRbGtC+heKiKT6KeZbZsBkPrj0pI
         18GY70skxLtM1N8oisVZj8yJxnwc3rlCp23XlqYxa+zw1cmDG/Em8ibESqY12STyl3WE
         lwXLXiNWGHL2xVYYoDLblYke1bEFhV6Y80hdBK4nEH6+rytomuO2AmWqeC26vfPTJkIq
         De9HV4kMN3/3E/uIO6r5ClvVE08V4ulahAPEV41KHHBq+ij7/KHTOM5MvV9pJ+Jloa+X
         ed3g==
X-Forwarded-Encrypted: i=1; AKwUvByaQaiZzM6L5cMagHdefUMP9bVzWpuL1t1yIxDAv27FrjxMDrzQGcrAZrSDqIMAPAOanVdlcfg5qb1d2r0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqtWNqb066GQDI6bBpQ0tB1e8K/gGsgVCTEXwwYfSHdmk9cfyq
	L0ZOUv821SAppGL1NAfsNsJMSHqZix8r79tKOTaNEXO/jCSN/8T90MB8
X-Gm-Gg: AYBFou0DrrHv2BRZB6Rh9w5F25PR8bSeI9Fx1Hu0p94kGyJpe7p+MRqeYFQh64Vguh0
	9+pa4W1Wgc+HyTfdqABX22Kfee87D1zS9GnCh+ARb/Yqa/+LpPzitL1Jf6lH5ZJZPJuZDDtM9Jb
	dvCbVIlRYy3H9siQrvjt0BBw7LLgfO9XeNkgDTZNz3C0vjdcqpRl9fZqzAtCiqY4R/UZlH/JGBM
	klBwoyHhs4/MvmmN7L/hlZ/21yZ09lD9Xh+v73nBEah7cRGQtOCGulJyNNK0GkJMGHfq6TZUsxU
	CgfOFFDDb2kYcbEq/myvwBib0bum1uiAKcShcSyC6uAYg1Rddz6afs3bdnvyu4MVPZrU9ax5dsX
	zR+xwPYg3keOm7vtM8OjknREli1AmzelOyNn4qCtq2krM2t8K9TjvW3/Mfrf6bMmpW55MmZTtyl
	KmeVxEPOkGZ4Xw1dT8UbqR3BIlCJ0k1uCNRiCpSWZdbkandl+7hcf+CXn5he5qRDUh90aSzk65L
	XFQN3Nx3Qmpo3LZ2Y5Qv5eby0pKgPzQaoYRei5y2dl5RhL0G9Izeg7RQT1jd5Pu+uecNtX0jsIL
	fyELP7KEhEGnx1PxzlAZBX3Awo1+4ByFTOO4aa0juxPg3ez0E/kftYQq6+H0jnchlE3VRs5xWci
	J85u83tq9Legkil7IsVN6gYqWVX159aPusZNoef0XXFy3+ciXrI/AZbCqSba4c67UfEBEbLB2Iz
	b/pRIAVtlqdRGmM8ItrbY=
X-Received: by 2002:a17:902:cccc:b0:2e9:d00d:1307 with SMTP id d9443c01a7336-2eb3649f10dmr43213015ad.3.1793370392712;
        Fri, 30 Oct 2026 07:26:32 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3923153csm8108695ad.13.2026.10.30.07.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:26:32 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	dan.scally@ideasonboard.com,
	djrscally@gmail.com,
	dmanresa@gmail.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/9] media: i2c: ov7251: Use in-range PLL1 dividers for the 319.2 MHz link
Date: Fri, 30 Oct 2026 23:26:28 +0900
Message-ID: <20261030142628.2235190-1-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAPY8ntArdj338V8bcSxrmwKQecy-pAcCXMbkWy=qLckX=hawNQ@mail.gmail.com>
References: <20261028112154.855185-1-antoine.pichot@gmail.com> <20261028112154.855185-2-antoine.pichot@gmail.com> <CAPY8ntArdj338V8bcSxrmwKQecy-pAcCXMbkWy=qLckX=hawNQ@mail.gmail.com>
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

Hi Dave,

On Thu, Oct 29, 2026 at 07:06:31PM +0000, Dave Stevenson wrote:
> The cleanups do raise the question of what registers 0x3016-0x301c do,
> and which of the 2 variants is preferable (60 and 90fps both use the
> same values). The datasheet SC_CLKRSTx naming isn't exactly
> descriptive. I don't suppose you have any information?

The datasheet calls them the system control clock/reset registers
(SC_CLKRST0-6, table 7-1) and names every bit: per internal block, a
clock gate in bits 7-4 and a reset in bits 3-0. I checked them on the
Book 2 and believe they can safely move to ov7251_global_init_setting
for all three rates with the 60 and 90 fps values, 0x3016 = 0x10 and
0x00 in the other five: timing control clocked, every other gate and
every reset clear. Here is why:

a. Poked bit by bit mid-stream, any reset bit set holds its block
   (frames stop or come out empty), and only one gate matters for
   streaming, the timing control's (0x3016 bit 4): cleared, frames stop
   at every rate. Two other gates matter only to blocks the driver does
   not use, group hold and the OTP. Every other gate and the debug bits
   changed nothing I could see. None of this depends on the frame rate.

b. Written as whole values at 30, 60 and 90 fps, mid-stream and with
   the sensor restarted from software standby, this value, every gate
   set (the 30 fps table's 0xf0), the reset values and a set with only
   the documented gates on all streamed identically to the driver's
   values: same frame rate, lit and dark frame means, black level at
   gain 16 and 1023, test pattern bars, no sequence gaps, errors or
   kernel messages. So did a rebuilt driver started from power-on
   with the six lines in the init table, this value or 0xf0, right
   after the reset or at its end, and with the lines simply removed.
   Every bit clear gave no frames at any rate.

c. It is what the Windows driver for this module (ov7251.sys
   30.18305.6.5127) writes in all four of its modes, 30 fps included,
   what ov6211 and the other vendor tables I found use (Intel Aero,
   NVIDIA CyberDog, Allwinner, Unisoc, Sophgo, Ingenic, Cypress, at
   most one bit apart in 0x3018 and 0x301c), and what your rpi-5.15.y
   commit 63843c4bb331 [1] ran at all three rates. The 0xf0 set I only
   found in 30 fps tables derived from Qualcomm's auto-generated
   sensor library (ov7251_lib.h), which the 2018 driver's tables
   match: its 30 fps mode carried 0xf0 and its 90 fps mode 0x10/0x00,
   so the two variants look inherited, not chosen.

Not writing them at all works too, then; I prefer the value above
because it is the one everybody else runs. A driver that adds group
hold one day sets 0x301c bit 5.

Details follow: block names, bit map, method and results.

[1] https://github.com/raspberrypi/linux/commit/63843c4bb331c07492adcceb7c693fd39c26d88b

Details
=======

Block names, as abbreviated in the datasheet; the expansions are
OmniVision's usual ones, the confidence is mine:

  name    block                                        confidence
  fc      frame control (starts and ends each frame)   high, tested
  tc      timing control (line and pixel counters)     high, tested
  aec     automatic exposure control (unused here)     high
  blc     black level correction                       high
  isp     pixel pipeline                               high
  vfifo   output line buffer                           high, tested
  mipi    CSI-2 transmitter                            high, tested
  otp     one-time programmable memory                 high, read it
  grp     group hold (applies writes at a frame edge)  high, tested
  bist    built-in self-test                           high
  srb     serial register bus (I2C register block)     medium
  asram   asram_tst, internal RAM test logic           medium
  sync    snr_sync, frame sync to an external signal   medium
  ac, src, mipisc (mipi_sc): datasheet names only      low
  dbg     "Debug control", undocumented                n/a

Decoding, from table 7-1 of the datasheet (rev 2.12), which names
every bit: each register holds four blocks, their clock gates in bits
7-4 (sclk_, * = pclk_) and their resets in bits 3-0 (rst_), at the
same position except in 0x301a. The reset column is the value after
the software reset (0x0103), from the same table.

  reg    reset b7     b6     b5     b4     b3     b2     b1     b0
  0x3016 0xf0  fc     dbg    aec    tc     fc     dbg    aec    tc
  0x3017 0xf0  blc    isp    dbg    vfifo  blc    isp    dbg    vfifo
  0x3018 0xf0  dbg    mipi   ac     otp    dbg    mipi   ac     otp
  0x3019 0xf0  dbg    dbg    dbg    dbg    dbg    dbg    dbg    dbg
  0x301a 0xf0  dbg    dbg    vfifo* mipi*  dbg    mipisc dbg    dbg
  0x301b 0xf0  src    dbg    asram  sync   src    dbg    asram  sync
  0x301c 0xf2  bist   srb    grp    dbg    bist   dbg    grp    dbg

Method: v3 driver streaming at 30 fps, where the seven registers read
0xf0 (every gate set, every reset clear), frames captured with
v4l2-ctl, emitter pulsing alternate frames in a dark room or test
pattern on. From user space over I2C, one bit rewritten mid-stream
and the block's visible output compared before, during and after; a
reset bit held for 2 s. Group hold and the OTP, which a stream never
exercises, were driven directly: an exposure write under group hold
then launched, an OTP load into its buffer, one attempt per stream,
bit set against bit cleared. Nothing persists, the driver resets the
sensor at every power-on.

Then whole values, at 30, 60 and 90 fps each: every bit clear; the
timing control gate alone (0x3016 = 0x10, the rest 0x00); every gate
set (0xf0 in all six); every documented gate set and the debug bits
clear; and the reset values of the table above. The six registers
were written mid-stream, and written with the sensor in software
standby (0x0100) and restarted, the nearest thing to the init table
without a driver rebuild. Each run checked the frame rate, the lit
and dark frame means (strobe on alternate frames), the black level
at gain 16 and 1023 with a 1-line exposure, the test pattern bars,
the sequence numbers and the receiver's kernel messages against a
run with the driver's own values. Finally from power-on: the driver
rebuilt with the six lines moved to the init table (this value at
its end and right after the reset, 0xf0 at its end) or removed,
streamed at the three rates with the same checks.

Results (n/m = streams):

  clock gate cleared       effect
  0x301c b5 grp            group-hold write dropped 4/4 (applied 4/4
                           with the bit set), 30 and 60 fps
  0x3018 b4 otp            OTP load works 16/32 (16/16 with the bit
                           set), whatever the wait, rate or the other
                           five registers
  0x3017 b7 blc            none: black level still tracks a gain change
  0x3016 b6 dbg            none: strobe still fires
  0x3016 b4 tc             frames stop, no error, resume when set
                           again (30 and 60 fps)

  reset held for 2 s       effect
  0x3016 b3 fc, b0 tc,     frames stop, no error, resume on clear
  0x3017 b0 vfifo,         (mipi: one CRC error at release)
  0x3018 b2 mipi
  0x3017 b3 blc, b2 isp,   empty frames: a frame sync error and a
  0x3018 b1 ac,            0-byte payload per frame at the receiver,
  0x301b b3 src, b0 sync   sometimes a few CRC errors at release
  aec, otp, asram, bist,   nothing visible
  grp, mipisc, the debug
  bits, 0x3019 at 0x00
  and at 0xff

  whole value (6 runs each)        effect
  timing gate alone (0x10, 0x00)   all four: identical to the driver's
  every gate set (6x 0xf0)         own values in every run, same fps,
  documented gates set, debug      lit/dark means, black level at gain
  clear (b0 d0 70 30 b0 e0)        16 and 1023, bars, no gaps, errors
  reset values (0xf0, 0x301c 0xf2) or kernel messages
  every bit clear                  no frames at any rate; 0x3016 bit 4
                                   cleared alone does it, frames stop
                                   cleanly and resume when it is set

  cold start, rebuilt driver       effect
  this value at the end of the     all identical to the runs above:
  init table or right after the    registers read back as written,
  reset; 0xf0 at the end; lines    same fps, lit/dark means, black
  removed (reset values)           level, bars, no gaps, errors or
                                   kernel messages

(The standby restart itself truncates one frame at the receiver at
60 and 90 fps, with or without new values.)

So a reset bit at 1 holds its block; a clock gate at 1 keeps its block
clocked, and at 0 the chip clocks the image path anyway while
streaming, except the timing control, whose gate stops the frames
like its reset does. Every reset and the timing gate released
cleanly, the receiver never needed a restart.

Thanks,
Antoine
