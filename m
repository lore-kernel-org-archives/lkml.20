Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792739756;
	b=fnrjAspswzhcb0Zm+r/us7UU1XgzE7FbVwHJIMbvMI2Q6Q5B+mD2T2DOYVnZdcuj/dOU
	 2SBgfIgLOf5Vbo7mf7D0z4oaSkORNDPf9JuaROYgRElmeU0xErp99eB0UN5LJEdSgZqXd
	 UdQVHVAo5g/BD9MvyB2OaanQQnQ70GhsDPAhCxl9uH0bLv+giH18fxxZesgF3bV4h0Z1Z
	 +Gycye5lbzKWz4pDFn2cgbhivk/T4Lfb9aibrEE9eCEojn6LOEMwHDzyu4vbmJV9r/Hfd
	 iJHpCSh6kJDuCmSdEf3AHizW+OLYN9G/mV7sriQP9AiUSpWF4lZqxsMr9v1Ot8LZZRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792739756;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=ZwAW7Da56DRhrTemOd2l4KjznnRsg70oBngmY04ZvYQ=;
	b=BK5RHTw3DH+MqcEvnslCyJ3QDW4j58XpHY7WO2NRbEjfGeSjpGx3S5PA2+VeDUAASe4i
	 rVtrMw/d5/tEtndUzRt0b9ORM1GqF4j0RECw3YqEj1gNQhlxkiIxYXOJ0h0QEl9JIz8CI
	 zR5VXaXjPPz90KsjQOArQZN3ZeGbOHX0A3TUSxtrN0G9g3Iq4ps5PwVHYJrZPDiXx0jwk
	 mck3as6Iq8moLXyZMxk6YKq0pfz0VuEyKxgpOLMNIqun15IUpGNwcrvpcSBeg1X6JvjNl
	 ygNIwHZ0aYcJqcyQuG9u2eR1yLwB58KnfV3mz6LEy03yThbeb7swAsLYaERm28RzT5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695CE606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:15:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 695CE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5eb14d0837fso433008e0c.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792739754; x=1793344554;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZwAW7Da56DRhrTemOd2l4KjznnRsg70oBngmY04ZvYQ=;
        b=0r0gILOULCwpVgTHW1pCd0SgG5RboBGPo+V8vFBMnOE6/UGGcdt2evuoHmvILhYvAg
         fSlH2LTetn7/tze0IbuhUSlkXa8ZoITgNEZK3DiuEXrXrQ9RlM/ver35fjs9yK77rHF+
         le+1KDchZ6XFzu3ywRbfX8wjiBuGPWvYpAUfd3zuofJLGZkRWxvugepquVYxY+eJcJZN
         iHK5iRbUHgBFNCGH7AjvRm5u4MfKblnvVT9xsOWPp/aTtTSxATts6D8Ew9/oeCOZYECg
         S7Ov7mGq96OjEaldU2qtMcs1pKGjDBz5MGx5kSg4vADgNYqBV/Z0PCaK5tqXM8qrJHOZ
         Q3Vw==
X-Forwarded-Encrypted: i=1; AKwUvBy1TuANciBXdjUOLnFQjkR5DvAmgNBWEJmFTdbAyAYEvqQL0jm12AHb3VO4QbRPGjl7Gc4nVJwGvIPrMx8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqmrZJGNYE8Zx2q0xQoga2e7pHP+AyGpZ1FxLQhVl0qr5XWnGH
	D/JYMYu6BEMgjbq6peAvSVoiiyp2z28fdrFQfzFOH9F/scuFbCdM1gE9iFZZu3/D898=
X-Gm-Gg: AYBFou2tQO1YmyFo/HqlXQOCN6ndJhjW0k0wWXuYEvhKGoIm8stC0YVuC1VV3vkYLEN
	YnSYT+ZvRK7w47ijpIRSX4z60u7T4skBL6Hxd99bZJuR3C8P8bfnrA4CbdhsoMPXHsVgTkUXqd7
	z3JjWOI1HUwewjyaP16oLVwUbxttN/YdFRgnDXMEH4wpzL0e8TbOqssBiJuN9HPDeKcF3K56kfo
	3rQpWakbv8tOzNYfCH4HXodTSzsJwfbWgVmL3rMFdlMrCM+ljcvnVWq6Ac23cwhLl/P5B8rPtvz
	9pb5DPQu91L/Cf+b8HWXIG/dNmXLMNopHW/jfS24x3+0pGHFXWzJDzAnzs3JTgJahtsKeVrCF1l
	thcBhPumhrvg0h+eWxopnzxj4f69FpTlFmRCGGeMRiZoPrydpwqycYfF98xKcNONGz8vVg0cE6B
	3Xzptg2tav6pEN46knvenu1uiAVesa2cJZGfD8mUKqM4zXiXwE00/W2qEJnOcJ4s69nztpVyYpC
	d2gnLOzQpij3WKDAElr62DEsZeaIH6JLF6co47ttOq4dQp48zQztdJKwkmnGm3GJmY4sKDQp0mf
	qI+h/wpaCohG12XBRvu8J8/yFbXWUd6qcpEYmi0=
X-Received: by 2002:a05:6122:8b14:b0:5ea:e197:702e with SMTP id 71dfb90a1353d-5ec14b51873mr464219e0c.20.1792739754325;
        Fri, 23 Oct 2026 00:15:54 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec13f674c5sm1543504e0c.16.2026.10.23.00.15.54
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 00:15:54 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7cc365db987so436107137.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:15:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByvNRo1gr64hNFDWRsIuoZ/fpMSwY43hF4BS/ju5KZ7PvK8+f7QKzPqLRzCRLQjxao+kg1g06xI7MKuJC0=@vger.kernel.org
X-Received: by 2002:a05:6102:570d:b0:7cc:3eb0:6ef5 with SMTP id
 ada2fe7eead31-7ccc31aac14mr607848137.11.1792739753776; Fri, 23 Oct 2026
 00:15:53 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022233410.2959823-1-fuchsfl@gmail.com> <04cfcbc2-0021-4ba2-b3bf-0da3cc82d046@app.fastmail.com>
In-Reply-To: <04cfcbc2-0021-4ba2-b3bf-0da3cc82d046@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Oct 2026 09:15:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVOA2bo2NTz7L=+W_h_eTmXJY7JeuFdKbh-uB3n-23SDQ@mail.gmail.com>
X-Gm-Features: AclHuK-JE0Oy0Krmvte0ZqAh67zqeVG8GqiC5fJJsd3p3KSKuJHCR4RReR7XRO8
Message-ID: <CAMuHMdVOA2bo2NTz7L=+W_h_eTmXJY7JeuFdKbh-uB3n-23SDQ@mail.gmail.com>
Subject: Re: [PATCH] sh: traps: Fix kernel unaligned access fixup in branch
 delay slots
To: Arnd Bergmann <arnd@arndb.de>
Cc: Florian Fuchs <fuchsfl@gmail.com>, linux-sh@vger.kernel.org, 
	Yoshinori Sato <yoshinori.sato@nifty.com>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Fri, 23 Oct 2026 at 09:09, Arnd Bergmann <arnd@arndb.de> wrote:
> On Fri, Oct 23, 2026, at 01:34, Florian Fuchs wrote:
> > Commit 75d4d29549e5 ("sh: remove CONFIG_SET_FS support") converted the
> > callers' set_fs(KERNEL_DS) sections, but missed copy_from_user() in
> > handle_delayslot() which relied on the caller's address limit. This also
> > broke delay slot instruction fetching through handle_trapped_io().
> >
> > Since the removal of set_fs(), access_ok() rejects kernel addresses, so
> > the fetch always fails for kernel code and the kernel dies with:
> >
> >   delay-slot-insn faulting in handle_unaligned_delayslot: 0000 [#1]
> >
> > The initial instruction fetch in do_address_error() already uses
> > copy_from_kernel_nofault() for kernel mode. So choose the matching
> > instruction-fetch accessor from user_mode(regs) and fetch the
> > instruction.
> >
> > Fixes: 75d4d29549e5 ("sh: remove CONFIG_SET_FS support")
> > Signed-off-by: Florian Fuchs <fuchsfl@gmail.com>
>
> Hi Florian,
>
> The patch looks correct to me, but I find it a little confusing:
>
> > @@ -287,8 +287,10 @@ static inline int handle_delayslot(struct pt_regs *regs,
> >       insn_size_t instruction;
> >       void __user *addr = (void __user *)(regs->pc +
> >               instruction_size(old_instruction));
> > +     struct mem_access *insn_ma = user_mode(regs) ?
> > +             &user_mem_access : &kernel_mem_access;
> >
> > -     if (copy_from_user(&instruction, addr, sizeof(instruction))) {
> > +     if (insn_ma->from(&instruction, addr, sizeof(instruction))) {
> >               /* the instruction-fetch faulted */
> >               if (user_mode(regs))
> >                       return -EFAULT;
>
> The "insn_ma" pointer is always the same as the 'ma' argument
> you already pass, as both are set based on 'user_mode(regs)'.
> Why not just use the pointer you already have?

That would also handle handle_trapped_io(), which passes
&trapped_io_access, right?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
