Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606C442E405
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 12:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791031386; cv=none; b=TzRPqOCkGjjenLk+PchF6qUhQNq7PfPAx92CDXlJZrWDwduHK42QvQEtJeU/TKYWbe5nr/7c+qsNkmqwL5mxMrSbQCYwkh1yIk6uCzewqFQjuw/odHj8OLPZBYbEYrkk+pVvEuwbVY7VJzjc9eKfYavcp6dmdagEWHsw99/ITQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791031386; c=relaxed/simple;
	bh=H4I5nvKjgXUix9M58KBb6gNKwEf1DF9zOhFhla9DTMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EVMFI1mJs75/lLwGyhL3mKkdOuaEPmLP5X47y+pMzAXy+f73HObSZMfKm46VEvxx+s1yZ3hDTEKuCBeVnSsEzVPIeJvFGYYnUIk7XAlyLCxQGoVTHDueuvU4aJkxDGPOc2sDu7g/xywZRLv1kbdew0hJv1fJKM74rshhRYKkJKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e529da9so100163e0c.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 05:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791031380; x=1791636180;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rd3NWbdX+3ZLAQ53roUb71tmzpnlllnH0Ay1BTCnKio=;
        b=uShvB2BJmm5i+4XSD/Oe+7fI7c3S95FE4EbI83u89fi8xnaQoJNV9xGOlhO+lKmZv0
         dcdaPj1y1IZ0TvIKrsUpLDu3lj6HQnLReKBdYSZT2Midxd3p/n5S5C7EMOpFRJ0uArbh
         3BHCungUB5HIveef+EgqAh9VvX95lH0Un8P4LUlDG5zA6vye7nzo8iAffMHoC2Fq35n7
         d0RryDPTHcsylpM72DlenpPb6kPuZCHBYDYyssmWG7QHJrZfFkY/1dEt/oEvSZpL0+If
         JgcrinpGELUirQZ7FQPvGfPRMRw/n6YEeNSWVjN8pqgU5dscw+8qNdyiS8vGHmsXt9Jr
         HDwA==
X-Forwarded-Encrypted: i=1; AKwUvBxZ/rZdzcu0b/1md+D4R7oByH6BGOQ1clHfKmGSioApcZ76yKzt4kQcTq2/vDPY1XElg8znFuwoSRGQ7tQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaf+luQ1p4TdihazXMKt1ajXQdOTkZaKJxNGk2D946F5mcXxW7
	XTxRhlPBj/CsQhKsj7cXZQZvN9lYUDGUclsiAMgVEHmHdwRkG+AoD+gLZ98yiwcS3sk=
X-Gm-Gg: AYBFou2B8CP4O3v/4T4FHIA91z6rlA+6LRVdXM7xvL4Knr/zai/3IVxqLKxl5Iyv2IC
	YxYymxIBcEDxzpK7Ami63rm9V1UouqmUYPmsdKxoX95U9PML33K/1A3uXEvjXoeGlsckqrTxXuv
	eQZfw55H9Og4KGar/Pynj6IUuyWGhSjLP6AhPAgMCkmwrzvQA4fk8/XqGw1pbjx5wErHKznDGKi
	T7tw2Ua5kntKW5fsBFRrPu9Zz9W22GW2sZvyn4W/ugbGkdTyXUIWMYfyik0xwuFxvYaky0G+zny
	8RXkKe7DdVIFbAgXpQ3OR/4462iaT583cBrfz2Nksht6yUDN5vrZw+5gy70ohfAJvBb5IepiV8k
	DVlvZHn1x5u3GLYart5+lF3vnvNz1zLzbigm+Q2nWhwjbfqPb6MRvAR6OrQIHVVo5l9VAf9zuB9
	alrO9RuhWEtQp6G+ljFBBaV1C/T6ynjKEqIo1Mu+/6wKqGKa1jpCc+HCUNuU7wbCKWRwU45NQqw
	uBCssvlEpywgaYBKxJuuBdiOX90I+FBaegyJg==
X-Received: by 2002:a05:6122:4f81:b0:5cf:c8dc:7fea with SMTP id 71dfb90a1353d-5dab08e95abmr1629534e0c.11.1791031380250;
        Sat, 03 Oct 2026 05:43:00 -0700 (PDT)
Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com. [74.125.226.235])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5da6120ca33sm6994666e0c.3.2026.10.03.05.42.59
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 05:42:59 -0700 (PDT)
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-988b74e3071so30781241.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 05:42:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwVlmLJo3YHWbRKI29c1H3c6f2aNEKgl5WKLdtMVxkEUe65Obe9gIH04GEBYG3aNRhTjPHOAMc0Aqin7Ng=@vger.kernel.org
X-Received: by 2002:a05:6102:4189:b0:7c3:3c75:db89 with SMTP id
 ada2fe7eead31-7c33c76064dmr62144137.25.1791031379330; Sat, 03 Oct 2026
 05:42:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002213225.27834-1-kmehltretter@gmail.com>
In-Reply-To: <20261002213225.27834-1-kmehltretter@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 3 Oct 2026 14:42:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWEYkBra+3G_+-TfT23BAWPxG5o2KHqGRuHcdp8x0Vskg@mail.gmail.com>
X-Gm-Features: AclHuK9ncaDVCxBtGuESNZ4CSuuG_w1P2OqCJXmqUhxZJrmtDAEjoWxMFSEEOIw
Message-ID: <CAMuHMdWEYkBra+3G_+-TfT23BAWPxG5o2KHqGRuHcdp8x0Vskg@mail.gmail.com>
Subject: Re: [PATCH] usb: r8a66597-hcd: fix buffer overflow on odd-length FIFO reads
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-usb@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Karl,

On Fri, 2 Oct 2026 at 23:32, Karl Mehltretter <kmehltretter@gmail.com> wrote:
> For an external R8A66597 (pdata->on_chip is false), the driver accesses
> the FIFO 16 bits at a time. It rounds an odd byte count up to the next
> word and passes that word count to ioread16_rep(), which stores both bytes
> of every word in the caller's buffer. The final word therefore writes one
> byte beyond an odd-length read, past the end of the buffer when the read
> fills it.
>
> This is visible while enumerating a USB device on an SH7785LCR. The USB
> core allocates nine bytes for the configuration descriptor header, and
> the controller driver stores ten bytes in it. SLUB reports the first
> redzone byte changing from 0xcc to 0x09 in usb_get_configuration().
> Odd-sized HID report descriptors trigger the same overwrite.
>
> Section 2.8.5 of the R8A66597 datasheet requires software to discard the
> excess byte after a 16-bit FIFO read when DTLN is odd. Read the trailing
> byte through a temporary word and copy only that byte.
>
> Fixes: 5d3043586db4 ("USB: r8a66597-hcd: host controller driver for R8A66597")
> Cc: stable@vger.kernel.org
> Reported-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Link: https://lore.kernel.org/all/3bd32eaf159db61ed1d423e1d52a869b3689c682.camel@physik.fu-berlin.de/
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Thanks for your patch!

> --- a/drivers/usb/host/r8a66597.h
> +++ b/drivers/usb/host/r8a66597.h
> @@ -178,8 +178,15 @@ static inline void r8a66597_read_fifo(struct r8a66597 *r8a66597,
>                                len & 0x03);
>                 }
>         } else {
> -               len = (len + 1) / 2;
> -               ioread16_rep(fifoaddr, buf, len);
> +               count = len / 2;
> +               ioread16_rep(fifoaddr, buf, count);

Or just:

    ioread16_rep(fifoaddr, buf, len / 2);

> +
> +               if (len & 0x00000001) {

"len & 1"?

> +                       u16 tmp;
> +
> +                       ioread16_rep(fifoaddr, &tmp, 1);

Seriously: a *_rep() function for a single iteration?

> +                       memcpy((unsigned char *)buf + count * 2, &tmp, 1);

Likewise, this is a just a single byte.

> +               }

Oh, most of this was based on r8a66597_read_fifo() in
drivers/usb/host/r8a66597.h, which has to handle 1 to 3 extra bytes.

>         }
>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
