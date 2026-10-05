Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF0D31B10B
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 13:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791208682; cv=none; b=A3V1WgY8WjSj925ftwnWDPzIX82zppBdI7ddx6nH4ZdH3ipmEbf1zYfCPVWASwz/NdqyaMd+C6gDLur4V3rPZzXJcgCPMSucntdkgqCDGPyuyv+MAkeuqYupwJLJW5luyVanArtlzXY2fTvNkFnwBtaHLPtQ3a9vYyxrAAQmi4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791208682; c=relaxed/simple;
	bh=n+s9MtbJbIy61EhMnMIaXeqKdaN3Tu+2CnCfvkOu8JQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jagUAWp5Iiapp3zrn/vl0kUFZxFy4hoN4/od9pqGmcKp9RG4qVYLyWuLqeYzlkcrGCfUOoP7/vpLFIy8GpALVsJ9ahSxkeaocUeW+tBO2XXU5ARr4ZoL+0yLQ3wP9L3LeFMHGQV+/YtRzYuPv2/chpfVzZgYUSZkU33bXuTasg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e20bb4583so353775966b.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 06:58:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791208679; x=1791813479;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h3WcaI+0O8lHZ4mIArK0RHYpnuN1stMSjlAmB+AjH/Q=;
        b=2TkfQihAbaRqLO6UCkdxUZXGJu7d7Jd45Wu4KWPMXYeDXE/0tVfAOfNgPHJTImPquj
         G2lzfDXMIQIgvNGN3CTukn240B2N3fJFHagfciErVTFCF3gBz2nUE71uWhDhIMyebx+w
         yockzV3R2Dm21m76uMPe0juwfH4990lREGEG0I1r6xjYY8prs7IeHfDhGAnBISWyaaVz
         UyMS6X0g3354vnppCZFKZwassdV2/BaMNIpkxUYaOjAeO/VlbfNTQLdwdU01h+5EKWWb
         OzB81h1BXizSPOcs36+MWZVUSnUETkIm7cTaFgE1/0mViVYyVwQQPzSaqEL3XWRnmBny
         L4+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzm2ZaUpuQdECrVc5OCcJRbw+B3TVkErS934E282MFUNyGAv1Dg6gydFVzJKQteY8TIio+0IF13NqLswDM=@vger.kernel.org
X-Gm-Message-State: AFuF++md9KewL92o0F8SwhKQEdSTvXq8GkHG3aTOvSFAAFcMuksIi0+t
	zLJ29T4+7tuRYchHOgVSJEfJcK6k2CGVTgvIDvFdGiAaxyp8L5Q1ZOcZsmJL4K6rYkk=
X-Gm-Gg: AYBFou2sJATwdT7K3uzeKVzsUDT3xBT12dxCxwuH5ckB4s1EFhW/ixuUxOwLJn/6182
	i3+SEl/WVrin5eP9mXGk2wYSVKi9MjCR/rHejNKHm7Rwti8mFJC+mv32I3lOSj4CF4thHQzHYu1
	fSfJukjILzQyt9ZtvpQ+7SCEAJR7uN9r81jGUaTzNdnssBZoRecQVSw+dhSr1BhpH6DsBw+5syV
	hzl6dq0wzRiXpp1lSF/uxfoEdyPDA2kqj0VxFOtxU+WFpT2vr3NhDMjoDvqMz+JKZzcj1pegI9I
	AxoON0ydjtqJBjwJuBjZ/T18qVbajnzSoZ5kfmdU3VRwJzSa8ixnpSkN8J1Ab4wi/UtEsT2UXYe
	xIYWMUe5P7Sr1PPBah0hnKiG3CDBQhPnbeWPK7RgiZ/4zFcemzqpaCPgsLJA1dCWjvdSnT65S07
	4m1FY24mvDnpvH4aEYlgC1JbCp5g2psU8iOJFfnr/mLD+bItmfG86d5C+yQFW0mZRaYHiYXwJ2B
	CHBklHX60/Kl+5W1ayqS4OzKzkzj+UKehJr
X-Received: by 2002:a17:907:9346:b0:c26:1691:b369 with SMTP id a640c23a62f3a-c2e4b00c16dmr929695766b.34.1791208678398;
        Mon, 05 Oct 2026 06:57:58 -0700 (PDT)
Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com. [74.125.228.98])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31562da32bsm84117866b.34.2026.10.05.06.57.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 06:57:58 -0700 (PDT)
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aaf8415866so2484289a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 06:57:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzM7QA05PT1sdhYLQCd5ReC3FjPmgw4qxqAupDgvsni+q41ls5hJGJEYIIcxmTDyeJEaNFy+YFFGnffmHM=@vger.kernel.org
X-Received: by 2002:a05:6402:4028:b0:6ac:686f:91db with SMTP id
 4fb4d7f45d1cf-6af9e2eea4dmr10193022a12.11.1791208676370; Mon, 05 Oct 2026
 06:57:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002213225.27834-1-kmehltretter@gmail.com>
 <CAMuHMdWEYkBra+3G_+-TfT23BAWPxG5o2KHqGRuHcdp8x0Vskg@mail.gmail.com> <asMl-yIKQoAbpwzA@gmail.com>
In-Reply-To: <asMl-yIKQoAbpwzA@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Oct 2026 15:57:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUqcwZ_YPRB3BZW+=iBHAreDVquWahFn01Z9yoF=yzj4Q@mail.gmail.com>
X-Gm-Features: AclHuK_eb-aU_a3fauOPMQV8VM9j8pv8zjLDNlDNjrpr-8Ij6r8nOCNKtC-t2O0
Message-ID: <CAMuHMdUqcwZ_YPRB3BZW+=iBHAreDVquWahFn01Z9yoF=yzj4Q@mail.gmail.com>
Subject: Re: [PATCH] usb: r8a66597-hcd: fix buffer overflow on odd-length FIFO reads
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-usb@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Karl,

On Mon, 5 Oct 2026 at 06:25, Karl Mehltretter <kmehltretter@gmail.com> wrote:
> > Seriously: a *_rep() function for a single iteration?
>
> I'd like to keep this one. ioread16_rep() does not byte swap.
> ioread16() goes through readw(), which swaps on big endian on most
> architectures.
>
> The words before the last one are read with ioread16_rep(), so reading
> the last word the same way puts its first FIFO byte first in memory on
> every architecture.

Hmm, the version in drivers/usb/gadget/udc/r8a66597-udc.h does use
a single ioread16() or ioread32().

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
