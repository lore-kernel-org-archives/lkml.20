Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794510500;
	b=p9ebgQDQ9qDSA0hCCjg2rNt9UDK378y8XlzvuVuC4W7MLGR2iYwcHLlQirX66yaSTrAY
	 g1YzOzKp/53d0A7Bl8fECm526dMenbO1x8z9RACmqBcQ0k+qktChlZuDSnDERuqYiOxQ5
	 fhDPMLzz8+9AZbHxT4cZfL3+LMETG3aAz1JjjmmecXkFmupg4o3/PL4fk6oepgeuWS4rZ
	 QQwCDKQBasZG5JI3aGN8x1xoWjtQyXd+f0k8n8puwBBixnrgoDcJ3QusB9vcWT8hnkux0
	 unLkZf/zaiyF8aN+Ywy25vWyjOMOr9i99k2kbipK0mnh9xrtfW3AMscBzgXtWCQBLTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794510500;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=x7avfF8CE7MQkedzx8waSCJsEYoj4qczcsv6b4mLDHA=;
	b=je0aiEt3OqQcYJAkr1fOGUs6qpU/BFBeF5Cala5VnaOCuQHEW/mAKQYSNz/hyqKulOgj
	 anQY/UYDveunC2AqCH83oqx6BUlO96z3cT1QepIs9STfCvWDtjru+dkr2beEhTJXk9k5E
	 yVyH/GGIEHfmP3qv7w/9oBIy/sgJpp1xsssaTlOXxolsHCi3vASmuB9oh68lc8Wmkl7Ad
	 WPfM/PppXLg4j9IL/pr7vhmxGEIYGf9gwLCcVnUE5KLLhzFZrxGfAH++mkOx3Lx6uyZC6
	 hIAiPcDAagSlS8HxCDhWPAInC6O4prfkyMOJMoHtv+qWkmCoaM58QM09Di1QPhVNz7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.43
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5458606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5458606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-99c0c1d07feso131227241.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:08:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794510499; x=1795115299;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x7avfF8CE7MQkedzx8waSCJsEYoj4qczcsv6b4mLDHA=;
        b=C2JyYq0gALwrvfebN5Rr9w+QBtyRepKfrjQswzHR/UaZcl/9NhFY3SfxombOz1tNga
         1J19GJHzWoFn9au25yUCVWPvbh4WdPq95NJkt6ynW3BuGk9Lqa4/Efx0jFi8XxLU9SKo
         PgDSd+wzVQvehAKia+Yo/xr4W0NvLYAUfwcq4p3SgMt32N2GZIP8WxyLxK9wg0RnAYRu
         VQhod/fC9DKUKqF0LdZeymJT8+Txz1wIADMllWFfJH28MnuioWuO3Ho2fMngjzGus9Q7
         ymlToBVUeo24/IAxaiAblynY/hp96t1Qhj1wnNHlNNclpN4UFblrCRqEr8PzNS5ow6y+
         k+Rw==
X-Forwarded-Encrypted: i=1; AL+hErHPB9xshUYu7N4w5dPiVhrdpN/bLmFWhJVCaqnt/pO1xyQKTFQljFXecLQazRLDd1/8XDeq5Vy/iFcJWp8=@vger.kernel.org
X-Gm-Message-State: APuU4Z93yI3L6kmO+4EbHuX3oKf5XkkkpPG/zytgUqXh/J43E46pDUOg
	mcYDpWRVDwwhTbyrj7c0uyEF86w5VZtvFLFRv1JMJdo8LVO6PbKUnmAWwLvAZ7AwYuM=
X-Gm-Gg: AYBFou2XEKhdP4Qw5NQKaczkNaGc4Py6huGOSJYVgvRMN/ETMrsEXBWlxYqpeNlccBe
	Yc/adRjSOtQh+Re9lyK13pHMZiz090UNULmHPHwo5Es3YTLD+HAIfj3p6EiTcrcJqEtXPpB/XAP
	156TNF6YWkkZGKxurLjcPdjvQsGFLzpc2X+b9Y5IDd3yXRAo70SVdaU7y/vIZmGP9CdR9MTQIrY
	FvJSM4z/2qxyyGNDX0rjrbqkbJHBE67T7g9R7tr85QfWALeVmY8/QKs7Y6KbwFld7E2kAibtLdm
	DFs977ib7IcMgQfCj1pel9aLF9K/3nGLKWK5ojwMBhU8Wqzlt7oFQdXParUbNr2d7RDaQtAc6HK
	YlVehO3wRi7h6EBp1cCu65YYXO9/9AqqlGIpKrpxGus+xDEGr+Fv0c5SktW/Q2uRA8evJHJl562
	HI9wz5ZFl6ygOgv+y7BZxBtDh1r4tK0x0JEAuVQzpjR9HgH6mqyLH+jcxVqgA5SSCkPNRC73T1z
	TmFmNNn2VdkUIV76cJaUFZ9KoGgAibpTAWDu+x5GeU7wt+nbzeTTDK7BTp3DqL8uHe74mbQkVey
	xwUn+g91Y4y2Nmkr0g2cQrZHDKOBIW8XMT2Jzr90fObCgP8TZZJOSDJaexrGiA1MENfohQbFzvE
	OJ3vYFD/uFG1z
X-Received: by 2002:a05:6102:32d2:b0:7cb:bb33:8413 with SMTP id ada2fe7eead31-7d64d6ed86emr72390137.9.1794510498537;
        Thu, 12 Nov 2026 11:08:18 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c84271587sm236470241.6.2026.11.12.11.08.02
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 11:08:06 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-998749fe872so137569241.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:08:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFZNi+mrF7qGmwmn82V+kUuaTMWZPbYDD8AronC9ESiEp7PN5rKq/NSsZPdkuNJ/YlBMvTV6A4/brdBrMY=@vger.kernel.org
X-Received: by 2002:a05:6102:c15:b0:7d2:8dd0:2eb with SMTP id
 ada2fe7eead31-7d64d6ed886mr73919137.8.1794510481935; Thu, 12 Nov 2026
 11:08:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-work-procfs-oldmem-v1-0-ecdcafd99265@kernel.org> <20261112-work-procfs-oldmem-v1-2-ecdcafd99265@kernel.org>
In-Reply-To: <20261112-work-procfs-oldmem-v1-2-ecdcafd99265@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 20:07:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUgOGjwOUMxSabUgtaVeKZW1wx78XOJL8joGKkZEj7RZw@mail.gmail.com>
X-Gm-Features: AclHuK8l5OcVstuPYNpoHJ657hIuMQK5i9ySH9sE9lHb16H-lVuh0fnzCqi0JCs
Message-ID: <CAMuHMdUgOGjwOUMxSabUgtaVeKZW1wx78XOJL8joGKkZEj7RZw@mail.gmail.com>
Subject: Re: [PATCH RFC 2/4] sh/crash_dump: check ioremap() in copy_oldmem_page()
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Breno Leitao <leitao@debian.org>, 
	Chris Mason <mason@kernel.org>, Thomas Gleixner <tglx@kernel.org>, x86@kernel.org, 
	kexec@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Hildenbrand <david@kernel.org>, stable@vger.kernel.org, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Nov 2026 at 17:43, Christian Brauner <brauner@kernel.org> wrote:
> copy_oldmem_page() maps a page of the old kernel with ioremap() and
> copies from it without checking whether the mapping worked. If it
> didn't, the copy reads from an offset into the NULL page.
>
> Return -ENOMEM like the other architectures do. read_from_oldmem() turns
> that into -EFAULT like any other short copy.
>
> Fixes: 4d5ade5b29c6 ("sh: kdump support.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
