Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793883918;
	b=KE3yr+Zod0kCbw+SMsyyfLpV3dkI9Fn4l76Qj2iTLYvTdmoAXsBuqKD4KwtCzL5qkDZo
	 flnvCHne5+l/bxUvFatvVMgbjbAfciSmVFesnN8w+2tN9T7hwm2an6CdTr8bD9yAUNZXy
	 ZMcBshRbnpnlKpL/BvmY+Ww8uwSV2F01ob+SCvjBFGCQs6SohF3uP/rQ2pbyL8H9idxoE
	 qKELodc39Xv55FugJ/dm2rfiKr0UGKIrVxm5liSVWHRiG2p+Zp7nRTZ5coinFXoJi4iBA
	 tWDEV1PWUs7soem6TsT6Fl96WHqMiYwvq/BAtHUgvOE7fSmxfNxI63HNNLc/KOuVKzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KcPe3iGsiI8YrNiV78WqkeLTX76FglwKYzDgJ9jRWH0=;
	b=H0nMvr1bhrqJg6boiybFoKRkQ7D3Wyt4F1b99jFgVgBa4lgtNvRUzC7xpi09IMZpX9zf
	 FCe1I6jNow355Yc5/YDttBrDJlPSRl4lYTPAGuP+pcoZnDkm2hTnw2WfNCNYYNHioC639
	 m1ap07qoB8U5N7/Hg9zcaD6AE81AYawUGPBOEvhpU0K/9ZiKDfXeSId/pdTE0OZYjOGFA
	 tQbPVoMzA+4LX+27NF8DWw+QIkCwbA72vqm+iItjC/hWPKicaZxrHwYEubwwRjKnantPT
	 znMg+teicsrJm6Rmb7Rvr1x/znjB1kfl7biiuI8NrRqp91lDVm/LtdKrncmisxtloRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gNu8S3ms;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156C2606A331
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:05:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 156C2606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gNu8S3ms
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4d21051042so137412666b.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:05:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793883916; cv=none;
        d=google.com; s=arc-20260327;
        b=TM7hX8qfOAwXEocCEbpuWi5pRJXvkKqVU3CICsxert0z23gG3Bac0rn66jPBEKHgP0
         nzVYRUjZhyjdK7qoWC0SEoXMQbT5SdMArCrIRPaNMKe1V135UyMCID5Xuz+VHJV0lzZs
         3DfP4IgQjKdyYxbK8VsK1XIQMxvcGKUOT7RkSkqWXxB6K70lbskCy/3Slp45NBWWjf+F
         4Ryp08VnBQTyZGaoimyeRdN5e/3/cB9JUUFSvW5vqRjOEZWKQyGHAlGLbNwrL2qW1Ckj
         cnzM9ztmf0oFwHLDEvT92HXM847psXh8ndbDL8VKzuUeGPnX6ea8i7FYPQWcoNEuS9rR
         LOiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KcPe3iGsiI8YrNiV78WqkeLTX76FglwKYzDgJ9jRWH0=;
        fh=ATrjbn115Y1L2owLYQZrWajiAc+tV9a2Xe/91MHokqA=;
        b=hIJAeE237XfD2r2EwUgho88gTcqatVv5GiNwpatxMizKvepYXa+QUlrHEMTCslB0mt
         9WhtIa3A/e+vGMwPlrEK1EJ1VwajMn0aDA22xxEVZpVC1J5aBfqeJQCBysBfv2OMeO2J
         i/gfXymm73/XLg41McwgYkQJIbmbkPPVk3+5n8pvy8w6wARIBNPgXz5lo8imxdIpAMQg
         ARcIef1A1Ply7mrbkBQrwr24MtCC+b1igioB2teY/F3+TS1emGMd5WtBY1WiDbTMsSbI
         r7z39qE0rpz/zzlAUIgh5t8EZ7uHpLgMyylFUMqmVp2jN8cS2XXx6tGhO27LXcjrna87
         Dhhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793883916; x=1794488716; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KcPe3iGsiI8YrNiV78WqkeLTX76FglwKYzDgJ9jRWH0=;
        b=gNu8S3msZjeqr8t4q72eTqt4qOegePrfBpE550wQsHcjCc8t6vWkeivT8Y13RXJroV
         wIMlsj8r5K4qHul1e7ybj4VbFge1UvBZ/7hTdxSg8JfgcoqqH4cL1pqrXvF9aCBb9C70
         m6wxhqPdAgtMPtJ/JqycaPURobxtsGwO84El+mP7HyiF9G4+Z8zePCtRWIQIKDkl4p/0
         REEUXEa/xfL3VRRLnctg4zZrbX9jEkuJ1D7+zeOdOg8ByfhD4tjwvyooOriL8lbJi2EK
         kED90LotfXMG94Bx0InugHdua9xFvPMhFUbFIFmD/GnBWH7OKRjKXkL/aaCRWlA+ug8S
         QIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793883916; x=1794488716;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KcPe3iGsiI8YrNiV78WqkeLTX76FglwKYzDgJ9jRWH0=;
        b=cjzHv301u/cOyCWE6TptqxVAjZ29hBUkQMkizthapvXDhxiIyYAgqTWvTHDgdro+/B
         DFN/EhQ9vovA96GO53MvoAfmWOdc9FUSeaB5BAfqnXTF0EfCMvc2uuAnjx8l7THdWxOA
         4GUN4tI6+pxWYCNKCfIRL0APCYQZqC5fxJb7c2Rc23wMhzKNCpH0I7lRjIQzklnVhTze
         bFoF3rllj6AnG0aFqCD6bLtJweRR/5X2O3H2DcqoajF7zcT31MkN36i7N36Vhj19T9AG
         MGw8SKgm7DWNc/RHco0Yg89a9/+hDsrekV5CUb7OPrnjY7yf30edlNkAhiyEujLvQl5X
         crUQ==
X-Forwarded-Encrypted: i=1; AKwUvByAh7FfFubtOk35zG9KKWYkbGBtiqBzUI9YSwdLBg45tdxBUJedX1y505XQj3ip5y5PdaLyXzEtgdjHBuE=@vger.kernel.org
X-Gm-Message-State: APuU4Z886SmbWm2UKKhEZm329f/cNouW1GOf+iSifxVJ1CSzQJN/Z/1d
	mocIMns/8nVU7ytZ9/9a9ilhEg3yUYR7o+NcvxrmYsxwk0Twtrs6drFB55u3ZAQGZci96Kv5wZC
	Tc0ffTb3DTkXArfButixvkVCtqqersBU=
X-Gm-Gg: AYBFou0atlcE2KxW8GgyHf+fixEUpfjIlZr4I7QUTZUYPoSsfJ+cRgSnuBTX5H7Qd0s
	gwc86QoxS6Hhie1j5tsYHEimXsL1zjyS0F/shNdc/4WFEeJ2b6InRNSxSOUphsaCu55N6Ek1QFM
	GFmCuVD4Sjsr6oLlOT3JnowV3rq/MAg9kiCMrY2z2C/KLOHrJSiQUmPpTVX1nLGFlLzNEO/YhtX
	JYT2sb2wlHrR4+25CXwc92FIdeC/2mTflJbFEKHcHU17+59zMabL4SQ+yNpfcECFYEv6JzLiIil
	yOkgYlh3ENOD/J3tRTY2WNgfYDndyxMPa8V4djQjUVUrRCDu9NXNb2Fgwv8XuUPLfkGsp+1cMkE
	DnyAo4yWMTPOXawLosLdRoZedwzjkxWnqlhzr1b/TS0iQ45DFiVL+GdOaN+Om/FRnVDcw
X-Received: by 2002:a17:906:eec8:b0:c41:4964:90b6 with SMTP id
 a640c23a62f3a-c4ca7ab11b3mr1742173166b.36.1793883916192; Thu, 05 Nov 2026
 05:05:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031175213.704021-1-bestswngs@gmail.com> <20261102111707.484df6f5@gandalf.local.home>
 <CANgPUi1ev7Zb13Z4o=YdHY_JFf=7xXNHNVbR3KBDQ_p1rzUmZQ@mail.gmail.com> <20261102134747.033bf744@gandalf.local.home>
In-Reply-To: <20261102134747.033bf744@gandalf.local.home>
From: Weiming Shi <bestswngs@gmail.com>
Date: Thu, 5 Nov 2026 21:04:39 +0800
X-Gm-Features: AclHuK9Od1HtaH50PjJ3mlGdeYmha5rMEoqz_j3PVBWZG02f-bzcwJ0rLWoI34E
Message-ID: <CANgPUi1K865BrtGoM_5tMR0vDfKrEmzB5VjczhS-HJJvJ6QONA@mail.gmail.com>
Subject: Re: [PATCH v3] ftrace: Complete subops teardown on shutdown failure
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, Xiang Mei <xmei5@asu.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Steven Rostedt <rostedt@goodmis.org> =E4=BA=8E2026=E5=B9=B411=E6=9C=883=E6=
=97=A5=E5=91=A8=E4=BA=8C 02:47=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, 2 Nov 2026 10:31:54 -0800
> Weiming Shi <bestswngs@gmail.com> wrote:
>
> > Hi Steven,
> >
> > Please disregard the v3 patch, as it was sent by mistake.
> >
> > I am still working on a new patch. There are some issues that I am
> > currently investigating, and I will send an updated version once they
> > are resolved.
> >
> > I apologize again for the confusion and for any inconvenience this may
> > have caused.
>
> Ah, no problem. I did see your reply but then saw this email again and
> thought it was different. My mistake.
>
> -- Steve

Hi Steven,

The new patch has been sent:
https://lore.kernel.org/all/20261103175832.3374540-2-bestswngs@gmail.com/

Best regards,
Weiming
