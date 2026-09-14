Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D065238F253
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371925; cv=pass; b=tw2dbneszT7o9NjNle9zw0tzVvOYDnllWLasn964m85qncw8AdomGYVbpyGH9sH1WDKRo7qgRuQTN6evbC5oF9TLhuHeFM1CJEsYvBh6GP0SZhQ8ORCwJ6BsLJDju7apW6BnuksQdACn/HL+oYTGHANUr8xeGhT2OgwHRrjLMqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371925; c=relaxed/simple;
	bh=5l15B88NLthdQgscQ55G1vqKEjt0lOSt03a8tHYJH8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PdYThpyTTnUXzRMzfbLNzRxmNya9lwsxzdVLLMP5d0fJk/HVRrdGaZnkViK8qK7HHsT/R437D++TX6nkXaD+GWw93GVIRBUo8MNLg1yboKRo6sPxVMejG+M2/tFRpFP42BZYaDBiOL32Ha6M/gtGQGXU8+HnKP90vlLbFQ500oQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=AcClDof8; arc=pass smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="AcClDof8"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469e25187so1223127b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:45:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789371923; cv=none;
        d=google.com; s=arc-20260327;
        b=eVsPvCnMpkJ6KYj4D/JvPAmxuYvJ4fOvd2el2QDFvZ4SXG4s3JU88qzniQ8yrBuyZi
         /3SWjjL+uW4RyNhN9skyZ6KBBwAOyZPX7NJws9T1f5SLH3GDNGMPxGnYILpxBYTpcubq
         jALR1IREcIMXkVqqykoQX5NlzSfoN/8mKj1norLvXHBNKdkzWcns2XhFFNf2sfPdD/eS
         QWI0/L8fxbA7hnMl79kN1heX1JgGrTzj0tPpxl8HOTFXM/bLQOlvTxrLE/hK9K0PveGQ
         muPiro8K+nL8Ob+RvyGfYJCrD+fp+TKqBpbtDr2OtETRymH0YiVqln2bg6I85ikEqYRK
         Zugg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c2o0BwYErT5KRPH9CR8Eo7YP3BfkkFlg34zMmtMPE9U=;
        fh=d6TEymZZLH6G3dtj1zwnzsU0YjPYPQedUqntQP3aoII=;
        b=Fhl0BdfVr0qQhWU+cufDiUpVO4o6uPWsKRwV+TFoi1a1Iu1gAsNw51PJ0w4fN3NIk5
         0shVB/JF1axnfUIXf3LU2F4NOZpsjlx3rx4y8CUxdqBBV8EEyvh18X98YiphkNBfmmxG
         Lj74MrREWs15gCEc95mfCAF8Hd6/zzCMI0TJItpK5tKDM7+cnFxRLmu6QgnIg11wm+hT
         SowCxt3HpAleQq7KOy3EtvRHWNZZIUQxj+sqrXophjGwm0KgwupjZ9PTI4hz3HYgu9Wz
         /WkwbbO241hM4yEG4v4uM3CrAv8ZeFiPwhWDqAiIqB5mAhDC9IcjpUn/X/boBD52qokR
         OrJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1789371923; x=1789976723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c2o0BwYErT5KRPH9CR8Eo7YP3BfkkFlg34zMmtMPE9U=;
        b=AcClDof8f/gt+h0I+R2lwZSWEY3dgyFfQQnjorxjqo8ii3k/gj8eko3rMNWoZHaLcW
         +y0vAHv0xk0VZ7LYjXcnu9NJWuVHJO9pk1VbtufxJlPb/1sF5MvRcSPm9nCptsIuFaRr
         aSHuyctpe91aJ8BnnVx6HZUMkD5/u8Am6TAtrSiGX1QZEs/jOXEVpop1uw5um241xuF0
         prnRio+/Sq/mhRzU6F48i7CiCLrEdx01NLTASk2QRaHDiWD8Q61dAwitqrpOwcVtCnE9
         3B+T7bgGlQztgjCoWsV/0Hgag68xpPKh3OFDLH6IEIBPkVNGi9rWHQ2EsAm9J/65kYzO
         2EGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371923; x=1789976723;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c2o0BwYErT5KRPH9CR8Eo7YP3BfkkFlg34zMmtMPE9U=;
        b=nXGt97VW6kdVzv6Z+VzgV00E/Fy4+81gm8fTy99G6VRSUa9bDdZu4smuJkc32JyS+Y
         Jr01bvnY/1/UckslIdKvE/+QqG77um6u1/M8uNRmfn0Bcs3bnjydSvxytDig9ExeG/aA
         68I+Zpo8+SmYYcXX4cZQy/DPjxMOjO2f/6AH+FCxRF1/EE0nSE+093ThtHGfSoGz64hi
         RWpnpjAuw/S3ZQh0AJ/do6pR9KCNbMk9HnrWazZtHUqw6kunUwfhRpYllYz2oypKSN+x
         tA4MkPl8aMsaMZgLerOboHaozemLkL3UkGphXbD4bZnz13qw+AAtJSw0JnXrxnve+bDA
         sXkg==
X-Forwarded-Encrypted: i=1; AKwUvBypYhCeuNu0Pok29Yezo85/b/dKH4R3ohjwrWFQAHHlnal0IJBaUq4c2x7JQijjQUCYpQOpc4vmxrt3JYg=@vger.kernel.org
X-Gm-Message-State: AFuF++l5QMR7hv2SFTV7HfObZK9Xu+dXIZs9Hdqa1Gcs643QSLH6GlF5
	cOVMueN8v1EskvYM3Zt8rSPfEaxvA/jaLR/KWP+7KqUe/l2rSI77D+kkH8Ys5Yrmcs+VC968Zv+
	RmFz2ljV2uub/hRjYO/daqp81EUtNyP5SeiEO3XmE
X-Gm-Gg: AYBFou3oIzwRuL+o8Jpt6DwBE+CFA/cN8CmsuSjvlmbfkoNL1fLhv3PAARw0ZtLX/iN
	Y4I9/aX2p/IjtLiUpSKKlMLZFqkEGpAROND4U6jHRczy7pbwM7/plsRkMddQXDY3PdU7EUTn/4t
	XkFwyE779cf1JR3QS9O8WPLo5yN0kikgoWpmtrRZ7eTvYW56lLq5+cuEFsNxD833tlZga5EuCxJ
	+JcFcCE2P4PinJFVZ22PlR6xyjIkDCe+DlHcIJZC3Ci7bbDgPBLO0QcbVl2XSu9wvNQ/bNNi+SK
	WHrK2kF/Av+niQQ3Sn8xzHkj7zqOcD9uT2kw1T5eSMpb12auTMQ4+PZuqw9XdelQMg0kgzmfy8o
	/CsPlNczyjI95UdKs2A8lFFIBnxZTe4wb1RDYRMpaJ/snH+I=
X-Received: by 2002:a05:6a00:1c90:b0:857:7384:b5fa with SMTP id
 d2e1a72fcca58-86f869a66d1mr3136861b3a.22.1789371923258; Mon, 14 Sep 2026
 00:45:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913000515.2344562-1-xmei5@asu.edu> <87ld95wryb.wl-tiwai@suse.de>
In-Reply-To: <87ld95wryb.wl-tiwai@suse.de>
From: Xiang Mei <xmei5@asu.edu>
Date: Mon, 14 Sep 2026 00:45:12 -0700
X-Gm-Features: AcwNN1U0c9yLgk_gWnRWtStU1D8IPk53vG-om2y9VhOJ5OUm4gxZ4cgjbJLcsMA
Message-ID: <CAPpSM+QhqyPHEg_ygC=8tFVRWeCBzT=z8yGM_+V9qJP7DZyGmA@mail.gmail.com>
Subject: Re: [PATCH] ALSA: 6fire: fix OOB write from device-reported iso length
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, torsten.schenk@zoho.com, 
	co+855929c2df672879@bugs.sh, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 12:06=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote=
:
>
> On Sun, 13 Sep 2026 02:05:15 +0200,
> Xiang Mei wrote:
> >
> > usb6fire_pcm_in_urb_handler() sizes each outgoing isochronous packet as
> > (actual_length - 4) / (in_n_analog << 2) * (out_n_analog << 2) + 4, whe=
re
> > actual_length is the unsigned length the device reported for the matchi=
ng
> > IN packet.  A packet completed with status 0 and actual_length < 4 wrap=
s
> > the subtraction to 0x7fffffec; a zero-length isochronous packet is lega=
l
> > on the bus, and the preceding loop rejects only non-zero status.  The s=
um
> > reaches memset() on out_urb->buffer, a 4832-byte object from
> > kcalloc(PCM_MAX_PACKET_SIZE, PCM_N_PACKETS_PER_URB).
> >
> > Even without the wrap the result is out of bounds: at 88.2/96 kHz the
> > 4-in/6-out scaling turns a full 420-byte IN packet into 628, so eight
> > packets span 5024 bytes of that buffer.  usb_submit_urb() rejects an
> > over-long descriptor only after the memset() and the
> > usb6fire_pcm_playback() copy of user PCM data have run.
> >
> > Guard the subtraction as the sibling usb6fire_pcm_capture() already doe=
s,
> > and clamp to rt->out_packet_size, the OUT endpoint's wMaxPacketSize,
> > which bounds total_length by the buffer size.
> >
> >   BUG: KASAN: out-of-bounds in usb6fire_pcm_in_urb_handler (sound/usb/6=
fire/pcm.c:338)
> >   Write of size 18446744073709551456 at addr ffff88802a3d0000 by task v=
hci_rx/5018
> >   Call Trace:
> >    dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
> >    print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
> >    kasan_report (mm/kasan/report.c:595)
> >    kasan_check_range (mm/kasan/generic.c:186 mm/kasan/generic.c:200)
> >    __asan_memset (mm/kasan/shadow.c:84)
> >    usb6fire_pcm_in_urb_handler (sound/usb/6fire/pcm.c:338)
> >    __usb_hcd_giveback_urb (drivers/usb/core/hcd.c:1657)
> >    usb_hcd_giveback_urb (drivers/usb/core/hcd.c:1741)
> >    vhci_rx_loop (drivers/usb/usbip/vhci_rx.c:107 drivers/usb/usbip/vhci=
_rx.c:242)
> >    kthread (kernel/kthread.c:436)
> >    ret_from_fork (arch/x86/kernel/process.c:158)
> >    ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
> >
> >   Allocated by task 10:
> >    __kmalloc_cache_noprof (mm/slub.c:5563)
> >    usb6fire_pcm_init (sound/usb/6fire/pcm.c:560 sound/usb/6fire/pcm.c:5=
95)
> >    usb6fire_chip_probe (sound/usb/6fire/chip.c:133)
> >    usb_probe_interface (drivers/usb/core/driver.c:399)
> >
> >   The buggy address belongs to the object at ffff88802a3d0000
> >    which belongs to the cache kmalloc-8k of size 8192
> >   The buggy address is located 0 bytes inside of
> >    4832-byte region [ffff88802a3d0000, ffff88802a3d12e0)
> >   Kernel panic - not syncing: Fatal exception in interrupt
> >
> > Fixes: c6d43ba816d1 ("ALSA: usb/6fire - Driver for TerraTec DMX 6Fire U=
SB")
> > Reported-by: co+855929c2df672879@bugs.sh
> > Closes: https://lore.kernel.org/all/gisnub8aWGLbyZLcDCSc7zWsHonMWGcyRgt=
5%40bugs.sh/
> > Assisted-by: Claude:claude-opus-5
> > Signed-off-by: Xiang Mei <xmei5@asu.edu>
>
> There has been already another fix for the packet size calculation
> there in the upstream (already in Linus tree, too).
> Could you check with it and rebase/resubmit if the fix is still
> needed?
>
>
Thanks for your reminder. Sorry for not noticing that. A rebase is made:
https://lore.kernel.org/linux-sound/20260914074324.3590843-1-xmei5@asu.edu/=
T/#u

Xiang
> thanks,
>
> Takashi
