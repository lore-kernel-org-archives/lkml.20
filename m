Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2938A4BA1F5
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790958499; cv=none; b=qD4adtZqhpeENLd9bHu08ahDlZAraSpPriC9sfXQNyBu5CIPcCFD+LpyWDCJouFh6pJphVLr5rm3zSHppgk1zNNPAzXB/r5sdcRfJNCZAMVzmaOz226u4ieOYCjPPhlqOvTwrUg4pVNvaZOfZqBZuqcrkOm+Y76THxDY78FMFhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790958499; c=relaxed/simple;
	bh=ILq64lcljnuZ04hVMkyRhIoJhCs9LpMs00deIhwdPTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sZ5QJNPxlOr/bb1mX8kj/OuIo4TQaabV9wc0OZgZKjNtjgKYf6Fop8t+Y3yA063rhJnktCaxSqqifUUu180AMuBKq7NKvUJ3bc82Iurb73kf0i5sn0v9nNEqHZ/J1rsAuDpLH/mapwIIvodegAymw6y4lvT4xsLWUKPvEnh6fSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a1f611461so4691066b.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790958495; x=1791563295;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FacLLzE02J65RIUl3zrfOLyPerjqcD8qYDubJwqNoDs=;
        b=T32lz/2Q9GVYNXppvQxJXsK4IcHiMkp6S0FB5obXC9QtY8hu2H6VM2HQebYrHeu1JE
         JnKplOBbRF58K0XOfTSIpJTPbdZwH30+NAoZZSVPpwYV5LIcF+nJLe9Fg/MPoez0488/
         +rmkriwCOIUPx8UnP93TqzI00s0d4L2LL/fG/GSxhJRfg9IFERleW1er0v8R2fPxuHGC
         R1mgG4mmoKZiMge1pWK8d3u34UWSTkZVos9tHEutGpR38yZkrZ04Z9OI5/JZxw0AoZRL
         i4x8usAUEHkyfhEahvUmMmPuMHnJFPDlzYnXlrcQNz4GhUzjtf+emOyeZAvwCEfaFOBY
         aNGA==
X-Forwarded-Encrypted: i=1; AKwUvBwWEL5+5JWVxQIm8T2Hlv4Ot5VIXZfjBXsRcHJl2c94ul/2lu/kFBJiZSSM+SYrAxbdY7wcd1ariq1QlI8=@vger.kernel.org
X-Gm-Message-State: AFuF++nAbiuVoBDMWpH41ezwRauaS7JKKATzcWP6wg0JDfywFLxiUZIc
	CzFfxlzRR7kXXd882Ukqn0Lp7pWlzXses2S6rBU4tOOsn90tdjsvso2hchaw1BRTh3I=
X-Gm-Gg: AYBFou3WJWGyMUfeKwjg0mN2ShC5JEJojkFjNpjwtTNNuhZVRCPY7xbLQC92J1r0h2R
	syPbeBi3zCoeOPM4ZuPRi9G9Ck44J99DolLm3UcoG4xT4WDar8/2zXzItoTewAmglQbme+YCbPU
	9+/MZ4Cpq/nWDoavwZ1OUalv3NGRu50UlFkowgSjLGKH2qrY4jttPKmCwYfLv8GXdGPo+aKCYv3
	26yd2J4Xwu2M5NdtN41cy8TFt3cWf3G8BM8jMCL1xW9k4GR1gIOzgZ4KIm5c58QS1ytpXm6gvSQ
	lOn+5JgUQnL7Fu1/6Xk8Yar+/TzTzCeRJtz73bg5zNqdVKt+dEtDapgjsesSod6psew4gUP26Dh
	TAR+2PUh2NNVePK60oLeg84A5oMDwDfcQjfswWypCNzk/mFZ6Pkyo5INOk5AHarCX25sjh2YTpE
	eWFWj3Tts70gFj4C4XvteKJr8EcJN15jh6S5YAiknwXeskwPSOq531HIDeJLR8CEv3eim0fEWhY
	yKg0jrFLaEwzJhPw7m6vY4sfZ7S2mU/a6LV
X-Received: by 2002:a17:907:86a9:b0:c25:8b1e:3750 with SMTP id a640c23a62f3a-c2e4aad65a7mr261980866b.12.1790958495189;
        Fri, 02 Oct 2026 09:28:15 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cd0568esm105754466b.13.2026.10.02.09.28.14
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 09:28:14 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2946aa0d5aso24092366b.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:28:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxkbFWvlLSn7TKNEGND0oBW+vfIXrM43GRJxgpQ5RbqwfyuIrbHapSH6CpiSoJiljyMII+EySVp4Nl7prU=@vger.kernel.org
X-Received: by 2002:a17:906:8d89:b0:c2d:c0ce:8465 with SMTP id
 a640c23a62f3a-c2e337c9b10mr589700566b.0.1790958494239; Fri, 02 Oct 2026
 09:28:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <88e752e0bca92c7b65533cc1b334052dd272f8ef.1790842086.git.fthain@linux-m68k.org>
 <02c53c37-d2ee-4c03-a8f9-0a757c3af59e@gmail.com>
In-Reply-To: <02c53c37-d2ee-4c03-a8f9-0a757c3af59e@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 Oct 2026 18:28:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVbfUH1ZoFcS64t=gyE_cskMWv6gGvL8pjGirSGvAKu2w@mail.gmail.com>
X-Gm-Features: AclHuK8E4OgvQq-AV9E3-ABw9WPWWsAQAUpuZiL_IUUrJh_sBeHzdW-yfYgGkpU
Message-ID: <CAMuHMdVbfUH1ZoFcS64t=gyE_cskMWv6gGvL8pjGirSGvAKu2w@mail.gmail.com>
Subject: Re: [PATCH RESEND] m68k: Handle put_user faults more carefully
To: Michael Schmitz <schmitzmic@gmail.com>, Finn Thain <fthain@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Michael, Finn,

On Thu, 1 Oct 2026 at 20:57, Michael Schmitz <schmitzmic@gmail.com> wrote:
> On 1/10/26 22:08, Finn Thain wrote:
> > Running 'stress-ng --sysbadaddr -1' on my MC68040 system immediately
> > produces an oops:
> >
> >      Unable to handle kernel access at virtual address f1c422fb
> >      Oops: 00000000
> >      Modules linked in:
> >      PC: [<00005a1a>] do_040writeback1+0xae/0x160
> >      SR: 2010  SP: 96087dc2  a2: 01500000
> >      d0: 00000000    d1: 014e8000    d2: 00000081    d3: 00000000
> >      d4: 00000481    d5: c043dfff    a0: 014e8000    a1: 00632fd5
> >      Process stress-ng (pid: 221, task=1b729d30)
> >      Frame format=7 eff addr=014e9eb8 ssw=0c81 faddr=c043dfff
> >      wb 1 stat/addr/data: 0001 00000481 c043dfff
> >      wb 2 stat/addr/data: 0081 c043dfff 2f746d70
> >      wb 3 stat/addr/data: 0005 014e9ed4 2f746d70
> >      push data: c043dfff 800daa70 00000000 014e9f1c
> >      Stack from 014e9ed4:
> >        2f740000 8017c000 014e9f10 00006830 00000081 c043dfff 2f746d70 2f746d70
> >        0081a000 00000400 c043dfff 800daa70 c043dfff 80016a20 00000003 014e9f88
> >        000026c8 014e9f1c 00000001 2f746d70 0081a000 00000400 c043dfff 0081afff
> >        c043dfff 01500000 00000001 ffffffff 00000000 20000046 41d67008 014e9f58
> >        04810005 00810045 c043dfff 014e9f84 2f746d70 c043dfff 2f746d70 c043dfff
> >        80016a20 8017c000 00000000 0081affb 00000005 014e9fc4 00128bc6 c043dfff
> >      Call Trace: [<00006830>] buserr_c+0x510/0x698
> >        [<000026c8>] buserr+0x20/0x28
> >        [<00128bc6>] sys_getcwd+0xc8/0x15a
> >        [<000027a2>] syscall+0x8/0xc
> >        [<0008800d>] sanity_check_segment_list+0x17/0x11e
> >
> >      Code: 000c 0e90 1800 220f 0281 ffff e000 2041 <2228> 0008 0281 00ff
> >            ff00 67a4 6026 4280 122e 0013 206e 000c 0e10 1800 220f 0281
> >
> > 0000596c <do_040writeback1>:
> >      596c:       4e56 fffc       linkw %fp,#-4
> >      5970:       2f02            movel %d2,%sp@-
> >      5972:       202e 0008       movel %fp@(8),%d0
> >      5976:       4282            clrl %d2
> >      5978:       3400            movew %d0,%d2
> >      597a:       220f            movel %sp,%d1
> >      597c:       0281 ffff e000  andil #-8192,%d1
> >      5982:       2041            moveal %d1,%a0
> >      5984:       2228 0008       movel %a0@(8),%d1
> >      5988:       0281 00ff ff00  andil #16776960,%d1
> >      598e:       6600 0104       bnew 5a94 <do_040writeback1+0x128>
> >      5992:       4e7b 2000       movec %d2,%sfc
> >      5996:       4e7b 2001       movec %d2,%dfc
> >      599a:       0240 0060       andiw #96,%d0
> >      599e:       0c40 0020       cmpiw #32,%d0
> >      59a2:       6700 0084       beqw 5a28 <do_040writeback1+0xbc>
> >      59a6:       0c40 0040       cmpiw #64,%d0
> >      59aa:       6730            beqs 59dc <do_040writeback1+0x70>
> >      59ac:       4a40            tstw %d0
> >      59ae:       6752            beqs 5a02 <do_040writeback1+0x96>
> >      59b0:       4280            clrl %d0
> >      59b2:       220f            movel %sp,%d1
> >      59b4:       0281 ffff e000  andil #-8192,%d1
> >      59ba:       2041            moveal %d1,%a0
> >      59bc:       2228 0008       movel %a0@(8),%d1
> >      59c0:       0281 00ff ff00  andil #16776960,%d1
> >      59c6:       6600 0086       bnew 5a4e <do_040writeback1+0xe2>
> >      59ca:       7201            moveq #1,%d1
> >      59cc:       4e7b 1000       movec %d1,%sfc
> >      59d0:       4e7b 1001       movec %d1,%dfc
> >      59d4:       242e fff8       movel %fp@(-8),%d2
> >      59d8:       4e5e            unlk %fp
> >      59da:       4e75            rts
> >      59dc:       4280            clrl %d0
> >      59de:       322e 0012       movew %fp@(18),%d1
> >      59e2:       206e 000c       moveal %fp@(12),%a0
> >      59e6:       0e50 1800       movesw %d1,%a0@
> >      59ea:       220f            movel %sp,%d1
> >      59ec:       0281 ffff e000  andil #-8192,%d1
> >      59f2:       2041            moveal %d1,%a0
> >      59f4:       2228 0008       movel %a0@(8),%d1
> >      59f8:       0281 00ff ff00  andil #16776960,%d1
> >      59fe:       67ca            beqs 59ca <do_040writeback1+0x5e>
> >      5a00:       604c            bras 5a4e <do_040writeback1+0xe2>
> >      5a02:       4280            clrl %d0
> >      5a04:       222e 0010       movel %fp@(16),%d1
> >      5a08:       206e 000c       moveal %fp@(12),%a0
> >      5a0c:       0e90 1800       movesl %d1,%a0@
> >      5a10:       220f            movel %sp,%d1
> >      5a12:       0281 ffff e000  andil #-8192,%d1
> >      5a18:       2041            moveal %d1,%a0
> >      5a1a:       2228 0008       movel %a0@(8),%d1
> >      5a1e:       0281 00ff ff00  andil #16776960,%d1
> >      5a24:       67a4            beqs 59ca <do_040writeback1+0x5e>
> >      5a26:       6026            bras 5a4e <do_040writeback1+0xe2>
> >      ...
> >
> > The cause is a deliberately misaligned access in the 'bad_end_addr' test
> > case in the 'sysbadaddr' stressor. The location being accessed here,
> > 0xc043dfff, was contrived to span the boundary between a r/w anonymous page
> > and an unmapped page. The address was then passed to the getcwd syscall
> > which faulted in copy_to_user().
> >
> > The fault for the mapped page appears to be handled okay -- up until
> > do_040writeback1() called put_user() which produced a second fault due to
> > the unmapped page.
> >
> > Michael Schmitz helpfully deciphered the oops and explained the exception
> > processing leading up to it.
> >
> >      "regs->pc does point to the PC in the format 7 frame which is the PC
> >      the fault was detected at, but not (in case of a writeback fault)
> >      the PC of the faulting instruction [that is, MOVES.L].
> >
> >      "The writeback would still cross the page boundary, and fault if the
> >      unmapped page still isn't present. We would not see the PC of the
> >      movesl in that case, and fail to find the PC in the exception
> >      table."
> >
> > One solution is to add a NOP instruction after the MOVES.L to flush the
> > pipeline and take the fault. That way, the PC value in the exception frame
> > becomes dependable so the exception table works.
> >
> > Theoretically, there seems to be another bug in the existing code. If
> > the instruction following the MOVES faulted, then after the fixup,
> > execution would resume at the instruction which caused the fault. This
> > appears to be a loop. After this patch, that cannot happen.
> >
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> > ---
> >   arch/m68k/include/asm/uaccess.h | 10 ++++++----
> >   1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/m68k/include/asm/uaccess.h b/arch/m68k/include/asm/uaccess.h
> > index 31d133faa45e..728a6dfb7414 100644
> > --- a/arch/m68k/include/asm/uaccess.h
> > +++ b/arch/m68k/include/asm/uaccess.h
> > @@ -31,11 +31,12 @@
> >   #define __put_user_asm(inst, res, x, ptr, bwl, reg, err) \
> >   asm volatile ("\n"                                  \
> >       "1:     "inst"."#bwl"   %2,%1\n"                \
> > -     "2:\n"                                          \
> > +     "2:     nop\n"                                  \
> > +     "3:\n"                                          \
> >       "       .section .fixup,\"ax\"\n"               \
> >       "       .even\n"                                \
> >       "10:    moveq.l %3,%0\n"                        \
> > -     "       jra 2b\n"                               \
> > +     "       jra 3b\n"                               \
> >       "       .previous\n"                            \
> >       "\n"                                            \
> >       "       .section __ex_table,\"a\"\n"            \
> > @@ -53,11 +54,12 @@ do {                                                              \
> >       asm volatile ("\n"                                      \
> >               "1:     "inst".l %2,(%1)+\n"                    \
> >               "2:     "inst".l %R2,(%1)\n"                    \
> > -             "3:\n"                                          \
> > +             "3:     nop\n"                                  \
> > +             "4:\n"                                          \
> >               "       .section .fixup,\"ax\"\n"               \
> >               "       .even\n"                                \
> >               "10:    movel %3,%0\n"                          \
> > -             "       jra 3b\n"                               \
> > +             "       jra 4b\n"                               \
> >               "       .previous\n"                            \
> >               "\n"                                            \
> >               "       .section __ex_table,\"a\"\n"            \
> >
> Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
>
> in case it helps.
>
> Anecdotally, I've seen similar uaccess faults causing kernel oops on 030
> as well, so this may not merely be an artificial unaligned access issue.

Shouldn't this include
https://lore.kernel.org/20240429030945.22451-3-schmitzmic@gmail.com
?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
