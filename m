Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0913557F3
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787815769; cv=none; b=GLaQRa64zC+wTPiilYjKjcxXgtOM7muzFa3OumckfRTj3JrJp53GUsGS0YzYlGnusj4YWMurC8bPA+PagbC5Zd61PwwoiyCktv8gIm2qgq4hyDCTZT6r1Eum321C0rwJojqXwAN6jKxViAiPlBcRZ6/sV3h6inIp8SOnaQq++o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787815769; c=relaxed/simple;
	bh=mP+PND9MZnfOzg3J+drMZ/8E/kF9YudaTPVbTh6JzI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=esyf6BU1tROufjNrZepQ5bHOxd/mU58/GJdCoaQJZiEL8FgGiIIbU8x3ILieyTj9lCz8caieUp9/Q31kFRqz1arDQa6Icv8IDF1EsG3xEWiZYvNvZ7JA8dV7ujrcgSxUFCWiF4Gv45BqrYgJ1nlGXtrs5YDhryGtWIEtln3P028=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5c671456e25so481236e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787815767; x=1788420567;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=A0FUFGzTaYR2pVts5J1GWb7YxO4YjT4Q+LUng3iGalw=;
        b=juh84c84jFVpRQz7kgNrtlkpYPOkYNNAomArGyH/AGq6gG3in+zLWakQfcM2q2zJPY
         oKZMXQsWs3ss3snolYANWN3Ls2G+Ft4Zx5PFZmxajcW0V6r3vh6nCdsEoiM4otdpTXQW
         ysJnNCl0MeIKDGr7U+az01BQbtXeFvG7e6Oinwu7yUYVna15xecutUk/qcyaDtp7Lrmu
         qVJVQGI4tBeVkTjQ9Xi7r7CrlRde6VAC8/aUs1USwy9xO3LyGIMoq4g3jlEs0FI8c3M6
         OKGYhfZn+KC5x7Rvgf7O7wM575LhQHD3KVZeANe5N3HHtgXrvvg3stqjN7+0/RaedOrJ
         d99A==
X-Forwarded-Encrypted: i=1; AHgh+RqMh1CG430/hW1/aJ4kchnw/8KqkmnFbtZkrad9yLorjppb4Rs82mUi8xAuGlVys+481fHb5QuCV0DC0O4=@vger.kernel.org
X-Gm-Message-State: AFuF++mV9ta86gDIyLdgxc9MB8yHd8rx4guc1hyrzov2qZI7SkXFoXeb
	YK0DeQCE157YxhAMHAZ7NW7sCY2bCrG9LPzcGjY2q/K+3cdcL5cr4HGAxLh3FO4c
X-Gm-Gg: AR+sD10LHvAjMwN6p5qSd5k2R8ngGqSSY34OHuZm+jOMnEE9Vh3JeGY66gmz8jiEzQC
	ye61ec7SEDUFu7nGVdl8hN8szP894HjziDUMXQxrhYnrukX49GBp5aWFs1Qrvmj/Jtk2ceUzqIW
	NPSyowe2ykMSOxVDzVsTYVBJLHUDKM5sooZs8IALKE1+Pe9hJEyAZB0qKahupciQb8jg4v4+71N
	N2CDoFZALroZv0hkVNFA/yCSG9JFzFI8Ogk6BsU1EOc5qNa+QY2vcZzW/XEPHcRiFmdXeWZM9/q
	CFzjAc7IW+dbnvSMVgXYdOG1IbHl1mpHTbrdlRbJf22v7xv+ymgeK65IwkkCkG5sZzJocs42dX0
	7AXuACBed/FdfTrPiZd8xbdB+qiJZIuaVNIUS1mkidiFQzrUw8x772K6I2AsNHQW0SnTSpzb/bD
	rgw7Pvt6+GRE9Y6SuMNnULeHDMfFvvf8+S+jrk+PjNSU6zn2xMhG4i/CreuAIM8HLbtUNyleiZs
	P5LFPyhuKYEwXMRmtH/JqAt5Q==
X-Received: by 2002:a05:6122:d9b:b0:5a1:b296:78fc with SMTP id 71dfb90a1353d-5c66e69efbbmr1313673e0c.1.1787815766875;
        Thu, 27 Aug 2026 00:29:26 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c660013fb9sm3256271e0c.12.2026.08.27.00.29.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 00:29:26 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-97cc72fe0f3so552057241.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:29:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpJUOZDTp/CxH5kRbUfxAQ5IFgAI+jxgfrLvoqgzBlOkxIocy5JAniSsPz9OghKr9isskxDQaYeDo6npYI=@vger.kernel.org
X-Received: by 2002:a05:6102:2253:b0:783:c17c:e7de with SMTP id
 ada2fe7eead31-7841d55ca7bmr886817137.9.1787815766141; Thu, 27 Aug 2026
 00:29:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824153339.512487-1-p.pisati@gmail.com> <20260824153339.512487-2-p.pisati@gmail.com>
 <CAMuHMdVBjxXNX19k55Yu4D5GD1nkb31TuBJN0uFDqD9Oe5Gtsw@mail.gmail.com> <b010c98c-ecd5-439c-b07d-3efad26de7f2@gmail.com>
In-Reply-To: <b010c98c-ecd5-439c-b07d-3efad26de7f2@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Aug 2026 09:29:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVqu-ayQYeJTsA8LoAX-=hP1nVJRJDv0ovOM+D3eLxhnA@mail.gmail.com>
X-Gm-Features: AcwNN1WfBH6kKUpC9SplHRabqGM1MYPdaAcm9zslNQlogkHifqiVLaGwh4s0nUM
Message-ID: <CAMuHMdVqu-ayQYeJTsA8LoAX-=hP1nVJRJDv0ovOM+D3eLxhnA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] ata: pata_cswarp: Add Amiga cslab ata support
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Paolo Pisati <p.pisati@gmail.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, linux-ide@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Michael,

On Wed, 26 Aug 2026 at 21:31, Michael Schmitz <schmitzmic@gmail.com> wrote:
> On 25/08/26 19:53, Geert Uytterhoeven wrote:
> >> +static unsigned int pata_cswarp_data_xfer(struct ata_queued_cmd *qc,
> >> +                                         unsigned char *buf,
> >> +                                         unsigned int buflen, int rw)
> >> +{
> >> +       struct ata_device *dev = qc->dev;
> >> +       struct ata_port *ap = dev->link->ap;
> >> +       void __iomem *data_addr = ap->ioaddr.data_addr;
> >> +       unsigned int words = buflen >> 1;
> >> +       u16 *buf16 = (u16 *)buf;
> >> +
> >> +       /* Transfer multiple of 2 bytes */
> >> +       if (rw == READ)
> >> +               raw_insw(data_addr, buf16, words);
> >> +       else
> >> +               raw_outsw(data_addr, buf16, words);
> >> +
> >> +       /* Transfer trailing byte, if any. */
> >> +       if (unlikely(buflen & 0x01)) {
> >> +               if (rw == READ)
> >> +                       buf[buflen - 1] = raw_inw(data_addr) >> 8;
> >> +               else
> >> +                       raw_outw(buf[buflen - 1] << 8, data_addr);
> >> +               words++;
> >> +       }
> >> +
> >> +       return words << 1;
> > This may be one less than the actual number of bytes
> > Why not buflen?
> >
> words = buflen >> 1;
>
> followed by
>
> if (buflen & 0x01) words++;
>
> makes 'words' the correct (i.e. rounded upwards if buflen was odd)
> number of words transferred.

Thanks, I had completely missed that increment.

> The return value is then either correct, or one larger than the actual
> number of bytes?
>
> I believe the template for these functions was
> drivers/ata/libata-sff.c:ata_sff_data_xfer() which follows the exact
> same logic.

Then Life's Good ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
