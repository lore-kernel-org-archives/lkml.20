Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6EB3C0A0E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787894900; cv=pass; b=o8i9jqv2lulyYdOKtjs05Np/F5d0PbRF++tsDWVzY+2goHQXs8Co0gjxPbmjVU83DIjT3exDsB1RooYyWMxp9w/tcWxqmcQlSGwrsdCSqeEn9jdrysSEmkEoolg/c9W51QJ7MAfArnDmEwaVS2SdiFJH6RYtL4Shl6PjQdp9dVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787894900; c=relaxed/simple;
	bh=ZPhImy2okdhZDLVACJlNTI6GS2RmF459ZpM5nqUw2qU=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=PL4On2KVmuslx3FkA9pl4x4PnCgcInQfRQp1LY50Um7/TVnySntCM73OL4WWuAZe4wAKXGgTjMEVptWTVgYVGYVCGaRewVLrseJpQhkU1bvIfhkqwWnpDIKUJlS5sZnSLzZhttOPZuh+AEBKbWuxsKayLtgc+IVx5CJ5TvTyJbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=gxxpauik; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="gxxpauik"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc1c9879395so456349a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:28:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787894898; cv=none;
        d=google.com; s=arc-20260327;
        b=RBijTwDxVO9GJZ4vsQEzncwtC0Xx1/bm9wM0KG+h6KEe2nQ+YnHQWKDRqRDBaPc7VA
         8dJBdxyQnPHmgFjwwpbGTocujtl2Lz/dEv3Qti64Ak30CTgUm6nTSqqVAg/pVKvvzumU
         YqW+5hO+0ysv9J1o3bkNLoQ2g39+p/hvG/z+PGKWh2X208YXQyHlbWE4iTZTlRTi6U9/
         vJNzF6WHFgU3OmSh5/PBBow07CgF5FTic7J4liMlnksdvC2PQ9H+Q46sFUcbREwkhMj4
         w1KLhB3a9TwMIboJVAI0+uSrziR2/2Uo6MG5lZLrKbigasqKbeaycWowJLa4FSheV294
         SFzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=69yTTqvZCFloiVCQK0EcvNH+dDyw89z2kOgmpsOD+Wo=;
        fh=7/1cDEnBLfpeZF7AZmUVJ0w+VkagOWFRKBed5DOuNzA=;
        b=puPDoGXRSmZdUtr9LPhdUHvSlzr1DTkFo5qeFMB59dC2h6PZsar8tty7P7FQJN3wp/
         1pcfPW7YyaNO3KxxBWB02F0U2peGRecMxo01l7LcZhryj8MSB9BRAorhBylLVodPisNz
         dduww+svLRgC162yAf1OENxHmNzOKn9K8BmbaWOSVEzRBJ6yXwaC18STUQo5LZKK21l0
         hur0ZKkPi1sio7LF9OvJeYU6PtlWSLe1pynIsvBchM94kb9EY0hvrkqr+oqgFosNLG1/
         RQJytktzcmJAK0M6lGA3tMTe7dvrP2Mi8CgtJq4H+LrJXILZGGp1rDeuELlaQohF9qMx
         EnZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787894898; x=1788499698; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=69yTTqvZCFloiVCQK0EcvNH+dDyw89z2kOgmpsOD+Wo=;
        b=gxxpauik/lQo7gq/nAnE6rmhjPSahRgc7gS+t2sWkqpfjTDOvR53ue1jDRQKDnfA4B
         TYqC92xewQ4uXLvRfHWwF9yBFduSLoDhs0lOK6vNIrILahiT5pvLAv3AfBVzPS3q2u3O
         yOHXXwKZ8/Y5eVbd3oB07K+IHot4wPd7rAM0IB4uYoGfuN1mAEbc5WvpBkozVcd/JzKr
         1YsRc1JrEI7mpCCQJ3oUs/Kh/K0wxaqTgks06fcut+7j8C8G0sX4JK74RwqFtXOQmx0k
         ra6IazWSWY79hLr1mDEI6DzHkpsr9GbMFSNMveuRT8P2HIOo5lJdle/pFSe9MZfs7eGM
         bHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787894898; x=1788499698;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=69yTTqvZCFloiVCQK0EcvNH+dDyw89z2kOgmpsOD+Wo=;
        b=ke5gfGEWa0zSGdTaER4QL1AeFkIjVgRv6NxmUtfVwoHnt1ssYV5s+BqLDYJXqKpTv9
         FlnWdOzWKQ+kfh8PGBGhnzexa/xw38UzeDTW+fIpi+gdobdl6tPw2HNOQ2zGPx7hLTrt
         XHT12pPUQmcJT8grhIFXeTVCXEG8SCgjoyoAR8oll3oEK73j6sVd8pFsdfZohnUJ4Zik
         LuCZitTMZoslxsAvcnZOKLktDeia7k1aMN+wiztGwQb3xxkZK1d6qSQUaJVq/KLUeYLd
         kkEePnUkcznR0eKloE+SYFg8VY4yLOjS7ztV9ORZusbgwqgY5FQPGWG5xf/atZS5VJY1
         qkQw==
X-Forwarded-Encrypted: i=1; AHgh+RrH1KV1xLWMgVPcdFh+sd+F5yIBUZ9PIHxSuSpZXScijm9F5Y8KSwPri9WvV2mH00cQAICYtSCnxaJN+cI=@vger.kernel.org
X-Gm-Message-State: AFuF++npdohp+nBDBbof2eM6Iy1aKzUJppOD3JtxV6lE7FBVO92G1vMO
	D6SOSrDdgDpsF33qzH4Vw2Im99GTdPTseD8iWhAsSpLbZXLnlbAEM2rPdpfGQ5od4fekjglrQYh
	97vBdhmvVC5HmSx4FuLDosPGUn6yYZvSU0Zdyll7Iv7cFGhwORZVBdQ==
X-Gm-Gg: AR+sD13UJiCILrh/2Rcbxlbs+nrO8mjHnwhDujgT+3CFlIw7RCl+eGzJfrPLHSVChMs
	ZD+5XC4IFgURQ9x3UhRmIS1vQlfqeaLuSXUlhzFiz48Dyon3z3WkEhhP7U8iGKv1cgwdGPnP5f0
	5xm9uGdMdgGHoIBqb4MrRNJxvW43jVvOijOT8haF23p5YY2Z6sQ8vXWw+gWfSY0IbMxVa5DR1eE
	RF80YoUpfOY69eTI+f0qWFTa7WDzHcyhGTSn4rEp1mxDemN34/MJnTlSKNB7y9GZIX/O1NapRbE
	W//j80QKMJqo4t0Pp+pbaqNRduhe7P0yxNdqKkHko5RVEQs+HpUZ+y150WlPcwAkKrDzEEROFfR
	50P8HVUTYSK5z6bMLpg==
X-Received: by 2002:a17:90b:54c5:b0:395:4de4:92c7 with SMTP id
 98e67ed59e1d1-396d0e5ccc7mr9782509a91.3.1787894897403; Thu, 27 Aug 2026
 22:28:17 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:28:17 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:28:17 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:28:17 -0700
X-Gm-Features: AcwNN1VZfQemsY1TUaz2msSv5y7mAdDZwFh9qw0JgmQOXUjmrSpC6I7705TZl-U
Message-ID: <CA+0ovCgnjGvPEtuXO+XH6o1ndK3d-KdBytApquWmsWnhLRg3MA@mail.gmail.com>
Subject: [BUG] media: cx231xx: NULL-deref in cx231xx_audio_init() --
 actconfig->interface[] indexed without a bounds check
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: falemi@asu.edu, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/144-media-cx231xx-audio-init-null-uif/

  cx231xx 5-1:1.1: Registered video device video0 [v4l2]
  cx231xx 5-1:1.1: Registered VBI device vbi0
  Oops: general protection fault, probably for non-canonical address
0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
  KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
  RIP: 0010:cx231xx_audio_init+0x48a/0xcd0
  Call Trace:
   cx231xx_audio_init+0x48a/0xcd0
   cx231xx_init_extension+0x6c/0xc0 drivers/media/usb/cx231xx/cx231xx-core.c:120
   cx231xx_init_dev drivers/media/usb/cx231xx/cx231xx-cards.c:1504 [inline]
   cx231xx_usb_probe+0x10dd/0x2140
drivers/media/usb/cx231xx/cx231xx-cards.c:1819
   usb_probe_interface+0x657/0xc70 drivers/usb/core/driver.c:396
   really_probe+0x267/0xaf0 drivers/base/dd.c:709
   __driver_probe_device+0x1ef/0x380 drivers/base/dd.c:871
   driver_probe_device+0x4f/0x240 drivers/base/dd.c:901
   __driver_attach+0x346/0x640 drivers/base/dd.c:1295

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
