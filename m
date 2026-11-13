Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794558097;
	b=t99632ddiqP4t7bnoArH7sJpgrdSDJI15F99pEFo02ndB66CmEDRPhNmrXSZyDXojFGw
	 oYByeDpLxvEVkgqul9SLO+W0jzVMah6Ko84cM+s7Zn7bCXl5UDE6SOhOQOCc1UKF/yoGq
	 WaR+vJifcvyEavdzf8VWImOxaLUCYu+gXJ6visFY7cvBAa6HmcsM08Dq4CYz2pPCU59hn
	 OMjefI9YR06L/kRS77eJED3icuVhOO0tM7Kg6vE6a9S8oLvvjAt8jpZRus7kNEbPaxYtb
	 mC0RexLkBJ2OblCoKkpg5qJUjlcc3BhzfLISgTAdT/AIRoJCPlWski6T3//hR9LxkHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=rGfzQKRW9n3iDF7EhAvIDmtHZ/Lq1Fi9s79BDzfKfpQ=;
	b=XMGQASXzKEluQ3OJghMOfxPhAPhBMYFgq8CPRJS5qDSFzFM1NdXUXx/08soMfFYhFJZ9
	 OWqs7NW1xxMs+ttBcLdbk+SD0BU+Ru9/Xj6ecwfsgaJgbGhpGCAgIUMN1NNQd56JOMpbf
	 y+nT2jo+6QUwRnZgvVUfQktnNFjBebOxYR3wcoVbcsUm//fuAa66jQgmrTYkJskOya4lP
	 VJegQgSTmQvBtwAGgnIlBUALudjpUPFa+1Sw+//TYUP1NDbI+oB0/6MM/ZfdkXeYyfdAb
	 yU0ngfBYppJ85qdmRZB6I6AHMohHrHKWoyaZbCjXnFbuQmJHh9bXYhALIr0EE4Aw9TQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sHuzErJV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F1D606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18F1D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sHuzErJV
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6d290b10a35so213598eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:21:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794558096; cv=none;
        d=google.com; s=arc-20260327;
        b=VCNliiHaggkKLSI8WaQ0AO9sihtjHDn+oVDYpUjhV6Kz7h3A49GU2St8j6XVpXR3Lu
         CVkL3axsaRanM4zTENYiq8ZJygD1Bjy+G8kGShwDVH7r6QvPWbsxXTOw/S59DItPAEUI
         FlgyQjFK/jbQN/lcJarAsQdx1z2qlvtWujWrCkWYKERrobyZ7IKOVwThmoI5ydJTsBes
         1TkLFI5kszI1fBhtphnIUfdASeBvkt88jwnjE2xod0pCK8LIA8FPnWTIvh12HkwgoUIF
         dVTzwrPpB3/tKYBYdHnhLKrVRT7tSjuBpbaWKakncoPHfBqIonW2c1keW3svYQbCDdOq
         Fx3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rGfzQKRW9n3iDF7EhAvIDmtHZ/Lq1Fi9s79BDzfKfpQ=;
        fh=+GQGUDM2FFJmd0GCHMQ3I782LyZKUVTfBT0SJktvy6Q=;
        b=IuzuNARX33Oqn43dTkFDvZgvUnw/9gD3mOIvc/fANfJYvO8+oGqtJoJ9MzNbeCLapE
         8rzIQ5bAixanf8JiIoMW40NQiloaSwdB4YmoQ0mx9PbDdm5bbsVZCZacnD1JMhulSXml
         8WV1+rWnbcpILGjADkw7EpCrvplpKLsYhAVlNIIq19U4VrP47RXgMk+yvTWZupg3qpIA
         5wxh7ciY6Zz9T9iP0vEGpu4T9ltWTmqSra1v3NhGtRxxQt/U5ZZbhDc7jpvmaipMwbp2
         XJFyq4f/Eod99hnw7F3oPg2v/hv7wcqOIOuzFc0PC+5clAhHDCWCh9oGBAkSF2CdtufX
         J+0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794558096; x=1795162896; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rGfzQKRW9n3iDF7EhAvIDmtHZ/Lq1Fi9s79BDzfKfpQ=;
        b=sHuzErJVzomgiTelK29LPNjE9twCNleZ8A7LRc3j69JutjscPuukUX4px2pZPx/P9J
         mpEn+mntl3hsoHcxJ/kT4G21sknlo2Cxlu2NFh+bjkF2NVExm3h8KiMZIM3nPjo5Ccga
         zFSTwpdxD3GKvqd3Y8cIHoof96hvAormhnb+meK+xCAbtkoZbmWYYYXiTmAvB2R9LN1T
         crOnhPxkoiq/dkFZXZJHHCjZGzP4SYorFUWjfRg3sLcW4kb6LTqK1cqHg4r3lDWDLdEi
         1o/D5N0EB2DNnxa47+RT10QxcpnSvc0xgCSGyDxWrsDTzHIqmG71oLOWnXTXHky8f2PD
         /FSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558096; x=1795162896;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rGfzQKRW9n3iDF7EhAvIDmtHZ/Lq1Fi9s79BDzfKfpQ=;
        b=kXvBLsO+2rP04mSRFPZB1Gzl89dTEmIhoYIc3gZdirWdHar3/ckZTPgctJFYhWDIC7
         ERiJKfkiQXoaAHbzJIJoZAUkkt4ekuTD3P8w+HI2+a3MkfV+bqvblgeSiJ5oc1mD/aQk
         Y4npPOZWayGcgv6JtGaAWHg3cXM0/2pHdIRq8Yol6di7bm8E/JQVSO7E/M38QpZC+L/V
         WcwzqUh2XfKPyoa3b3Uje1ln6tt0BEgH5RY1fvtEVnCo6bCXjh0x6YFKB8EftM2IpQj6
         VKYWLgrnbocLarr3ot7Cx6QAE2g2jclYnwBDgDi1YVL6GFTGve7Q3b0BN6ffgKs2hvOh
         HNpw==
X-Forwarded-Encrypted: i=1; AL+hErEJp7+eyU0CU4VGSoNxzyRGKOR3MNcjQB+1c9SKBCBrZ0yPo3QLWHDVPgVVku+uWY49pX71aViArtIFB3o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TSL9yf4QEweDImvtIbiz1CNJxqEgAvv987zR3w6NQ9CTHTXGg
	g3eV2dXhgoeqJAh+2wU1ig0BE8c6hYMqrJKm5umfbWWWEgxjwIX4utuUAUAfzwn0dGVAr+x2fZi
	M/ssHkLtHopPDZfuTrYL6UDdp6SUpz6I=
X-Gm-Gg: AYBFou2IZsd2wChgIT1sMWS+6mKZUVbPQrlUZhtsyCv4++MJTsQV4WJIGqq7CzS5P6O
	iK/VUQq3Pzi7bfKDyXq9bpfmSn4qSDrxNllHTjjNDmBgei+N6QXtp8vxiQhPNo+rEtTOtt0jFA1
	A0pAreRjFo4+B0B1UlpKfHiHjKN0avJW3kGoyRikXPZJLqZMulA7LeZ3Kn9rudBY8e4h+SejDlv
	D7gWiMKwFxzfD8IOoUC2IFxlPQsfNnqhnSSztSMzlU8DLgzaIqxDyuCvosyhFFNLQPPg3sudyq6
	rQZiVwI6+U21/G4K81xM78teMBuZtLkMjIjPw4BsMbpbw2tlgFiZwbHLXJTalmQNqif62jB2zpT
	XK4wO8CmSGakEgFFqsFbMs99mv6xO1qEzqmzLPguwt/9VtI0ZnigmAjDR1PQOql9YPH5pde/Boq
	S5cvwPTmN1g4M0TEjbiz0w+yel+39RRLk=
X-Received: by 2002:a05:6820:891b:b0:70e:2878:8d7f with SMTP id
 006d021491bc7-71ab521aaf4mr673667eaf.90.1794558095789; Fri, 13 Nov 2026
 00:21:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112173246.3201729-1-hjf3108@gmail.com> <20261112173246.3201729-3-hjf3108@gmail.com>
 <19FBDC54-7E87-4A8C-BDD3-E16351EE3CEC@linux.dev>
In-Reply-To: <19FBDC54-7E87-4A8C-BDD3-E16351EE3CEC@linux.dev>
From: Jie Feng <hjf3108@gmail.com>
Date: Fri, 13 Nov 2026 16:20:57 +0800
X-Gm-Features: AclHuK9ZhDXk36FrDyJDIOdq_rY7JNuByJ2PhL4VB5kN5p2s13AgmX_l188dn74
Message-ID: <CABOQOSVz0M4G2mzwtb000Ss86PjoTUwKvfoRQziLwY9DAqdNbg@mail.gmail.com>
Subject: Re: [PATCH rtw-next v3 2/5] wifi: rtw88: 88xxa: receive VHT SU
 beamformed transmissions
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bitterblue Smith <rtl8821cerfe2@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 16:09, Luka Gejak <luka.gejak@linux.dev> wrote:
>
> Hi Jie Feng,
>
> Two more small comments that I missed in my first reply.
>
> On November 12, 2026 6:32:41 PM GMT+01:00, Ho Jie Feng <hjf3108@gmail.com>
> wrote:
>
> > diff --git a/drivers/net/wireless/realtek/rtw88/rtw8814a.c b/drivers/net/wireless/realtek/rtw88/rtw8814a.c
> > index e35c57c9d1..c2a18f6be8 100644
> > --- a/drivers/net/wireless/realtek/rtw88/rtw8814a.c
> > +++ b/drivers/net/wireless/realtek/rtw88/rtw8814a.c
>
> [ ... ]
>
> > +     rtw_bf_enable_bfee_su(rtwdev, vif, bfee);
> > +
> > +     rtw_write32_mask(rtwdev, REG_SND_PTCL_CTRL, MASKBYTE1 | MASKBYTE2,
> > +                      0x0202);
>
> The other values in this function have defines, but 0x0202 is bare. The
> vendor code doesn't name it either, so maybe just a short comment on
> what these two bytes do, if you know it.
Yeah, indeed the vendor code is full of magic numbers, I don't really
know what they mean beyond guessing.

> [ ... ]
>
> > diff --git a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c b/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
> > index 5ffa29d181..128a18ee33 100644
> > --- a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
> > +++ b/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
>
> [ ... ]
>
> > +     if (rtwdev->efuse.hw_cap.nss == 2) {
> > +             rtw_write32(rtwdev, REG_CSI_CONTENT_VALUE, 0);
> > +             csi_param = 0x01090109;
> > +     } else {
> > +             rtw_write32(rtwdev, REG_CSI_CONTENT_VALUE, 0x01081008);
> > +             csi_param = 0x01080108;
> > +     }
>
> [ ... ]
>
> > +     for (i = 0; i < ARRAY_SIZE(csi_rpt_regs); i++)
> > +             rtw_write32(rtwdev, csi_rpt_regs[i], csi_param);
>
> These numbers are hard to follow. As far as I can see csi_param is the
> same 16 bit value twice, BFMER0 in the low half and BFMER1 in the high
> half, with the layout rtw_bf_enable_bfee_su() builds from named fields:
>
>         csi_param = (u16)((coefficientsize << 10) |
>                           (codebookinfo << 8) |
>                           (grouping << 6) |
>                           (nr_index << 3) |
>                           nc_index);
>
> So here codebookinfo and nr_index are 1, and nc_index is nss minus 1.
> Maybe build it the same way, or add a comment. For REG_CSI_CONTENT_VALUE
> the vendor code has "nc = 2" and "nc = 1" comments next to the two
> values, which would already help.
I opted to avoid trying to add more meaning to the vendor code, because
I couldn't be sure if they were correct. Rather than risk incorrect
documentation,
I just put the magic numbers in, since they are used as is without modification.

I can dig the vendor code for some confirmation that the csi param format
is the same for the later chips as 88xxa.

> Best regards,
> Luka Gejak
