Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5988C4AB1B3
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791822176; cv=none; b=ANU3GhzMEJnAprYhBMueF27spM1VgYirM/Zn3Okx6/uOFx6fsZJ2W7QpKUNowGqlK27ObG447aJq2Kc1Zd0o7hDN7dJE2AApQCzng6+WOMKO8hDq0DL1pEuLvw/22jYCzUyk6MdBgRXi6uv0gafmqhONrK0yNkSuyWRbMrkglBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791822176; c=relaxed/simple;
	bh=na/SWdzUd8e3s7Zx9+08OULjEoTlvLyyETaBrZgmPlw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CfbRl2xV15g5b+qltDu1wmIDzIGn7bM0t2lmrDoP+2B5k37hg4UQktAv+m1PBY9yNQZuQqiYEhZ4ybXTUlRxm6dyfwHo9OXMsJChxP5lZ/Rx+naaTCI24Kjn/1joAc0GkuVZ0iDvF9YnHpNo8HdsKTZinvsiBMidQ/3AZc5Ho7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5e9488480cfso424326e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:22:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791822173; x=1792426973;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X5FLZdPf6RJVfwLd6QiWyg9HD5zORQA0u10QEMu3ZgY=;
        b=tOENm89usDa/D9oZXJq+5iC1zBkOvvOH/OBv9OUvvGdkuhd/vN58eUCiMVD6OvQEHJ
         KnZFldPrr9+Lmrchu0xLrYzilGxG1QnWxivD29p4ULBUQDGzw/ecVzl3hJSnawranWtv
         lEbLpBYQl7Ka7oNRq8UsvEz05fcgoOKNtIspGpaMwD61sS5eBr6HmOhbyt1JNZJgpl+G
         4wHSHyXHiZs6rv0a8Qa9iEjb8ZEJWMEAr6B1NR7S4dpCyXcxJ07gpH5u9aOLG7/TbqAE
         1f9nZCm5Pi71DJ8gt13Yv1ZeiAidWGDWcb9nIi3YSROJSOl4OSyj6mxU2lnxr7KBFHrr
         3Aeg==
X-Forwarded-Encrypted: i=1; AKwUvBxv4MRJB+DjaYf39fBBZPmBwRW6BZdyyt4jUEPTxVNCCvWldSdTZGBiXIwJbb4OZrwuFItvPdToZhHwDJc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIX0uof25PKT1ZKPbwpE+RCoLBXw49/suS0APBfhPC+yYFNMR8R
	oA53EKPeMg5d2pcTz8sTNyjJTDS/DXP8ZTdbWp6Ngkx6El62KxgiaEnrFtK1QYx4
X-Gm-Gg: AYBFou0atzE57Ayw/yqot3aWQOG306+7/edbGMNdNrzuKfz4er5PqQvGfM5lyE0z8Po
	ZPjJo30CCz0FTT7zxJffm+R1XQiunwo3sV+1rpuH4owrQMNDFFKqerEXULStcmmb+mNCuYi4Ia/
	L1gufPVN736kQ2ZNkwQLmWjTtXy71g+N+WdoPSw16aBNhR41x5a/X+1BSE0ftjdY8aEPog9nzjF
	MmKZUrR/jx7rGXwvTMf5+lBeayyNiQNzgllvw9DMuSep8yS9GhMu9VTWiKzZ57266/XY52gDigF
	zJxZ4b2nA53q++0hncl0/D8KijX35x0Y2yIs0Z5JAfcP9V2dc8OIcDLtHiYGRX4ePVoMMQ5en51
	Rhjm+2EJcii7jRy76lHYjYyNVAsSC/qYivAnKUUAKeDXUHCDGK/+ri5SUQ16nW0Z7xy1dcXP8HD
	BY4cEvuFncGXNyPbTyZMD4t3Cs5VBm2P6IOAZ0C+lRlJx/o1mZeFumiGaUl0zSWU5njLHspK057
	9b5HOVGKWbmQmrEjzFTFAZJWStcEP2EcusR
X-Received: by 2002:a05:6122:d0a:b0:5c9:c60e:3a43 with SMTP id 71dfb90a1353d-5e91f57914emr3203520e0c.21.1791822173139;
        Mon, 12 Oct 2026 09:22:53 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e91cab57c8sm7280141e0c.5.2026.10.12.09.22.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 09:22:52 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7cb6983cb9bso115204137.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:22:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByQowEQjHjPWSHGEtqAO3cxBLdSax2RBV+GHRJsLzj0xJEfX7We/iB0oxeDSVnAowrkESbQyrRraNnY6Z8=@vger.kernel.org
X-Received: by 2002:a67:e706:0:b0:79c:99ea:2c9a with SMTP id
 ada2fe7eead31-7cb37255716mr2460381137.11.1791822172375; Mon, 12 Oct 2026
 09:22:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005212823.55737-1-kmehltretter@gmail.com>
In-Reply-To: <20261005212823.55737-1-kmehltretter@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Oct 2026 18:22:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXr+2=wvRQyXMj6LoyevvZ1wSWGsgMzbajj0OGqJRnLsg@mail.gmail.com>
X-Gm-Features: AclHuK91kK71gtIrwgy9MEJ3x0a9HocKnRnE0a0NaQiVQriI1uAFOcMNBTCeXz0
Message-ID: <CAMuHMdXr+2=wvRQyXMj6LoyevvZ1wSWGsgMzbajj0OGqJRnLsg@mail.gmail.com>
Subject: Re: [PATCH v2] usb: r8a66597-hcd: fix buffer overflow on odd-length
 FIFO reads
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-usb@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Oct 2026 at 23:28, Karl Mehltretter <kmehltretter@gmail.com> wrote:
> An external R8A66597 (pdata->on_chip is not set) is read through a 16-bit
> FIFO port. r8a66597_read_fifo() rounds the byte count up to whole words
> and passes that word count to ioread16_rep(), which stores two bytes for
> every word. For an odd byte count the last word puts one byte more into
> the buffer than packet_read() asked for. When the data ends at the end of
> the URB's transfer buffer, that byte is written behind the buffer.
>
> Enumerating a device is enough to trigger it. The USB core reads the
> configuration descriptor header into a 9-byte kmalloc() buffer and the
> driver stores 10 bytes. An SH7785LCR board booted with slub_debug=FZPU
> reports:
>
>   [kmalloc Redzone overwritten] 0x820c4229-0x820c4229 @offset=553. First byte 0x9 instead of 0xcc
>   BUG kmalloc-32 (Not tainted): Object corrupt
>   Allocated in usb_get_configuration+0x12c/0x11d8 age=51 cpu=0 pid=10
>   Object   820c4220: 09 02 20 00 01 01 00 80 fa 09 cc cc cc cc cc cc
>
> Odd-sized HID report descriptors are overrun in the same way. Without
> slab debugging the byte ends up in the unused tail of a kmalloc() object.
> A transfer buffer that is embedded in a larger object has the byte after
> it overwritten.
>
> Section 2.8.5 of the R8A66597 datasheet tells software to discard the
> excess byte of the last 16-bit FIFO read when DTLN is odd. Read only the
> whole words into the buffer. Read the last word into a temporary and
> store only its first byte. Use ioread16_rep() for that word as well, so
> that the byte is taken in the same byte order as the words before it.
>
> Fixes: 5d3043586db4 ("USB: r8a66597-hcd: host controller driver for R8A66597")
> Cc: stable@vger.kernel.org
> Reported-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Closes: https://lore.kernel.org/linux-sh/3bd32eaf159db61ed1d423e1d52a869b3689c682.camel@physik.fu-berlin.de/
> Tested-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>
> v2:
> - Simplify the handling of the last byte as suggested by Geert: no count
>   variable, len & 1, and a plain byte store instead of a 1-byte memcpy().
> - Reword the commit message and add the SLUB report from Adrian's board.
> - Add Adrian's Tested-by. It was given for v1. The FIFO accesses are the
>   same in v2, only the copy of the last byte changed.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
