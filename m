Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793346543;
	b=Y4G9VaY1BHSdfnVmKECa85FmYd1EcfvcPp+2WlBho9D6Gl0d28ZQ0xlzqq5G9Pe9EDvc
	 1Ta3D3vLr5x/6ceRPxRdD3b2xfPayC/nIRbG+AzfGQnl7ipuAwfMyIKZ9iZNZtO22GIJY
	 2/LPg/XvDLKSlRKkPdMqXYaMXq+hg3LdDRhq6BoeXyRx+7CJCDeN3XHyEgpVGg8fp4DZs
	 nEFrrWw4m3tMvz621SgdxY8g5nCAfSdot3aGz9wouqxhCAIpWHkgKb6eXfBjbDfa8NbnG
	 ToZ78SrxI7/Axd+f9hKsS/oKjKsD96j4TshccFLfyI9cdlIkpe9BymTL7nU8ZevMU/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793346543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:From:
	 MIME-Version:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=2HDMqE3IkP7tC+ZYqwwcSMAYlXpSFqYA9LjD5kYCX/o=;
	b=BtSyfwKM3qOu0Tyenpj2mxNaKREtRucDKx13VhzrXDDtKMg6bgedKpdSShfmYfc6TTUw
	 /a9PbWCHGXzZMZXF9vP4pHSfbvoKhTa1+OzBM9Gg4Le/rWTSS/srPAZyrFHU3uoYVZnFz
	 aDDdAbenKS6fNJol9zuApynPnMx8UEVJfE6S240TUSCDja9xwwpQ+BZHZRwE/WAVAkpcz
	 7lNVxv1Ytc4CjsSi9d7UASVmtummRSwu79IqZIWMDfFW/S1wZMEk4AkN6UctSpI3lloYq
	 qSameE5SzlGXHMuhReB3xPGTOTOJYkLWCVPABH/Uduo6c4WP7EzuW2lIu35XumG/OFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bLOdZ8tn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6051606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:49:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6051606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bLOdZ8tn
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso2492242a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:49:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793346541; cv=none;
        d=google.com; s=arc-20260327;
        b=ZsV6jGYg0yzEn0BZhtSVcupGhNVJQUPaScQSipLhLXLeDDKn9sbHZmx+QGAOlOBRJu
         wgA/crvANEeGv69obheyznrbcm4ZKPEt5qBKwdEzP+xzsv+mjIyWv9vGjnCe7vIfUBEQ
         vkyHJ5wjAwi2ZhCTbZhVDKGvg7Vo4A9jMV8FMpuDE1/3hDCvKLjSL7aStl0NXxMVH0ft
         cj7NI24dank0Po60XlPW9yxsYjIaoZ4Qe0EoKI7XugP13GUWE/xUESoW7HC1DdU0utTQ
         Hl79nHUE6e8v948D3ks61+P2GSfbVPLSNxHtgZUhk+BM5wms/YigxN1K0zorEm6m1l+r
         vX0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=2HDMqE3IkP7tC+ZYqwwcSMAYlXpSFqYA9LjD5kYCX/o=;
        fh=gO9/vS+3gtnAcQ7P0i/NbH5QoUDJg7HAuIIbh6SrKgY=;
        b=enetN+JE8F4xkAKE1ECLfMvoQj9Yo+SAAUn9YRjWcrVc8eJ9C2Jw3u30dzOCj8Op5X
         P7UpXjyYWfskUT1xAbV4VXvUhr205tEFmps6Gqp6Z4Ch8Q3/oLykwHq2khLYjqHA+UXZ
         I9feztFOnxOyrfOC1WDdqyokoywSItOg6OwuimpO0ZXlfcAcATMXUy6jZcvSGp40oE8o
         zFPgzMMGODuutybRNGqz8RUSIaroEk8Q+qyuIECFGxPQC9y2Tl53HvT2NQcpNX4c607X
         wt7eaU155UOt8jqPH+ijCw2RyrMig4EOiwbWgyOAf3pz40pJzM4/OotR1zWX97jxx6AT
         RPmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793346541; x=1793951341; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2HDMqE3IkP7tC+ZYqwwcSMAYlXpSFqYA9LjD5kYCX/o=;
        b=bLOdZ8tn8+riGdf7TptBZ9UcNU140zD4L6eFFDvVYeCMFJsiZhFcyqFB9yOOixQN4u
         Qmil5RVe+ygls5Es27kqGXV+vHeg1Fcj7OH8TNb/EGGuTZXKiGYPovDVep6bUd3OKnQt
         bt4oRc3Aj7wMTeyLyJz5VqXyHjfmt5hl+lzYomVrN/Pf95iHPHwLKDlxjsxOtuLXkfCo
         O3yffA9QaBoq/I5KYBd32Af2/0jhp+yOBestAYOQp0K4N+7zI2rdrEmZFC9UJa3Tvddj
         baE08oM552yLvFgXIqLO19nwIzMYPmSMSQmBZU8/EGu4Gw5wVmg0xJHZYn9RqQLPs/Xa
         iXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793346541; x=1793951341;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2HDMqE3IkP7tC+ZYqwwcSMAYlXpSFqYA9LjD5kYCX/o=;
        b=v2OPrMBeYSQZP4tj9sGD0CuzzrK0di6c2Yh/WtZlcNsdzWW2dOFN8Eo/D9mseUdyIc
         9eL4X1XPa++o22+J2vHLB7ZzEYT4IxSCikvLkg7m0RAll/J8Rl/NN/TRl7952masR0Zo
         GRsrtGaWa5A/VBPTyYS+PUqGmtvbxftjPrIdsuixeoG3Mn9Tl3alDmGN6K0IZNrGlrlp
         w5px45JczzK8ZmbGkOKSYChqcFyD/ucLxP2KJMeMjK7oTPZ1IgGMZgsyC+yFcDy/TiMI
         YDLU+BkCCndz6+X73teJvxq3Th+HLTQvJJoMeoFLCHK6yTBplgb3JCsAhmuf7R8426jW
         BGCw==
X-Gm-Message-State: AFq9FYJpZBETWsooyWPJBiE033pLqwWSwnOC4/PD8rLGmFjzENGNukPM
	nA0FEZwp5mAeEHvzDNhbebW6wYK70/3pcN1EXOMTP6f5+esJuK16eqpe9O1HFavk7lLRJCrbKl5
	sVVuHl+tTFh+SRcTQFjVDGD20eYP0e3dZGw==
X-Gm-Gg: AYBFou06m+wE2HxmCwk72Ru9BlBR000Pa0a5cHNKd8FY55Xk/hsrux2Dw30JFXJVrVj
	HEhUCMwzlMvf1xxSOZErFOypb6s5+agtKMrv8LBPBYBFPekd+yfA18oA5P2ruhoYwEshGoAtP1N
	nBGrswM20YswsYHed4xFIVie1ICLZozDQIVqceQjUQ0aWNrFDFFkExiT9L2XqTM5Zbv5K6c+Rab
	6uKfZ+HOrH3MJKTQKIKU4EcWI4gpdoWXDfv75SsaqCQLrdV1OhaUR4zc4DQM/LivI2pFktfHx5p
	9rtjWqQ/JkyjJGUH6hnzFFL+HPqj/bbBstMECIutMcjAQ5xxE94r/hKMdDec+fYjieCy/x0u/oy
	pwAFZMFf1OHVGXCnmGWeQZnfX/VaxhFrTrMs=
X-Received: by 2002:a05:6402:a6c1:20b0:6b4:1eed:b9f2 with SMTP id
 4fb4d7f45d1cf-6b4d5255a99mr589133a12.10.1793346540786; Fri, 30 Oct 2026
 00:49:00 -0700 (PDT)
Received: from 511566560828 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 00:48:59 -0700
Received: from 511566560828 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 00:48:59 -0700
From: Ivan <ivan.vin.ctf@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 30 Oct 2026 00:48:59 -0700
X-Gm-Features: AclHuK_jVZcZaq6JrQd0aw1ZD31ds5O2IbWeljEgDNBM6-ouNIGoqDlrZFXfOl8
Message-ID: <CA+hZKY+yk6mG54gqbT1Vup0RytMX=PvpqyOU3zietsXtjbPhFQ@mail.gmail.com>
Subject: Re: tty: vt: three wedge paths on 5.15 (paste_selection spin,
 vcs_open hang, do_update_region spin) - family report + backport request
To: linux-kernel@vger.kernel.org
Cc: jirislaby@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

My 26 October report to this list does not appear to have reached the
public archives (most likely held by moderation), and my 29 October
resend was silently rejected because my mail was wrapped with an HTML
part -- apologies for the noise. Resending as plain text. One new data
point since the original: a fourth wedge path was observed in the
meantime -- INFO: task hung in tty_mode_ioctl with agetty as the
blocked victim -- same cascading pattern as (2).

--- original report ---

Hi,

Three related reproducers on 5.15.216 (KASAN) covering the vt/console
family - one already has a fix upstream (not backported), two look
unreported. Together they make a 3-trigger-path family report:

1) soft lockup in tty_ioctl: tioclinux(TIOCL_PASTESEL) -> paste_selection()
   (drivers/tty/vt/selection.c:374). The throttled-tty loop does a bare
   schedule() without timeout; spurious wakeups spin it -> CPU soft lockup.
   The 2024 "[PATCH v2] tty: vt: selection: fix soft lockup in
   paste_selection()" series addresses exactly this and is NOT in
   5.15.216 -> backport request.

2) task hung in vcs_open (drivers/tty/vt/vc_screen.c:763): takes
   console_lock() and blocks in down() forever if the console semaphore is
   held by a wedged console path -> victims pile up (cascading hang,
   /dev/vcs* readers, printk, VT switch all freeze).

3) NEW: soft lockup in do_update_region (drivers/tty/vt/vt.c:664):
   writev() of binary blobs to /dev/tty1 (embedded VT sequences leave the
   VC in a bad state) -> insert_char -> do_update_region loops, CPU stuck
   22s+. Independent site: neither paste_selection nor console_lock.
   C reproducer available (syzkaller-generated + minimized).

Mechanistic link: one wedged paste_selection/console_lock holder freezes
every console consumer; the do_update_region spin is a third, independent
way to wedge the same console. On shared hosting any tenant with a tty can
trigger these -> cross-tenant DoS.

Patches/repros available on request.

Thanks,
Ivan Vinichuk

Reported-by: Ivan Vinichuk <ivan.vin.ctf@gmail.com>
