Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B425A50E59D
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 18:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790881039; cv=none; b=suZ9iEu4GW8PyI3YNeky+m6XsURsCQOxKrQieK7D7NybgvmZGeAr/GzCHjoMnjxGz/YJDaeqnKIaexk5mj4LZcyOn+pPuNKkJheh6IDgNqBUK9o4ZL3oqotsWK0Q19xgVmN6nuENH1ttE7rhOfYTkQ0M60o0U0AU6HPh3/eLl0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790881039; c=relaxed/simple;
	bh=kIkdLwE+cixyfml44tOXkdOXPut51QPtpwD9Gs28Vqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X+uP1dFyIzt/5yb7hFUgon6HuFAEUE/XcD5NSo9TeVXroE9i5Gi3AExvJmquBX9v6YNrtdZRbKnrGRzjlJzTM+kEZw1opqkvBEzSeM1fqQbI0Vurquuyhtuc6akKEJYZG7wrqd186lNwB35ZHSz4p5hBNQcvPj4PxEz9Dq5keg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sLK2ZhuE; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sLK2ZhuE"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea4bfd1so2991172a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 11:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790881035; x=1791485835; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/2w7rFmprRKcSbo8YeulB3DJob2j9P3/MHFc6fhFv/8=;
        b=sLK2ZhuEaILRVDBN5NZyr1ZWfowqyYxsTZ+eZrjRWSvye5279aBNDAA3wQm6Nj467l
         Cea0IxSs6XRBnAOJOoFvUINt2Cvn5Eju19pV441h8rb0qEYnklyLrVPkEs4h6dMOTgx0
         +yslsQU+mc0/BHyd8wDYWimg05iBDdrVjIiDcaR3UpVtBBF5vzwn4ifqj06FmttyRGCl
         t18yAgTR5wEOu/tH/QeNkNvlmPvAH4GW+UbHjAHATefJinXgBmHcX4/pocHoP88qtxqc
         GEQehTCQrW9p1MRMp2OsKi+XFTDV/yeMl3yoEMj8CAnMgnCT6m6hRT/nDXbdoqk7E9wj
         eyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790881035; x=1791485835;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/2w7rFmprRKcSbo8YeulB3DJob2j9P3/MHFc6fhFv/8=;
        b=VMDQhm9IX8F5CuADFltrtIytV0zg/xlGqObDMiI6+riFKjSXfsxfAmwjp2cAPJ+6+I
         LFPHUhrs//BJkRKCqla6sLlH4mAyYaxFT+YbY8tfCJ07YKnjXddqLPJRAVZ893Emuh+q
         Fo3oTlY/YmjJW8gOA/uovOziKCiBH/reBqxHFpO6NUMI9iDmh8KJGNVX+DwineZwyCy1
         PZaL9YzzrFJwZt0gBZj6WtL+wh10+j7/wXje4vRAg3JsGSYVmh4RDt24XYXzoxlqB1pB
         HWbgl3BFiQlRE2IiukoPUiZAf771IyE/jWy6jmBVGr2c7z+Ny0zogqxB4lIFwJZh+EaE
         yEQw==
X-Forwarded-Encrypted: i=1; AKwUvBw88hFbQWzrCeOKMhEU/vIa4NyKzgJnkvglo8fkePXeG5smDmloPq8lz8ZxgFkAl0uOzJqeJO63I8DmVn4=@vger.kernel.org
X-Gm-Message-State: AFuF++lIw3uwuH+0plSFFTtQhGbSuGoaJtrFExgE+/WfiL7hDq8GSeY+
	768578ql7JngGN73yuK5M0eA2GOEDg75sDnH1GZIzKbqZ2tD21y00GswJkGEdw==
X-Gm-Gg: AYBFou2ly7jN0BBMAhMRHwhIrLSpW/k9Aav+CCseiTxgnqYcyv0terdM1V65WGByKGm
	NnuTbVSrOEqVHyeop9aIdptpS1nSZWdBznTsi084qOj/kuX1E88lxmdJ+4imQHrO273Qrb4L1aa
	Me1ifZ6hSYdKIJgiCisyDnMhSqVFQ0x7xiGmX5rC29mC5gyu6rzii522hv8HL/KsLjyoknaTIuM
	E9mbY6fL73+EQ+aQoHzIueNre+38AEOBsg89spYPILgqCcLbwJ5+VVAOd6tsffLYVofMhaZUJS2
	Auf+tzjSGUjun1HBqf41aicFPlrtueO6UGtp1hFweZm+VdWx9e5cuuBv+7l/IElag+nfyR30GiC
	6wyIFZgSCnwspEynYAyxGGs9qxCnZiovwp1uyOgfFscgrWTUVi6+rNB0jWyInMBY73mzqczISya
	dkWbbh9Y327Izx+SEMBK7KzLBLWxORLG3P3ciUY8CbVJ6viBwL4zo2beeKclOxx1yjzU9JSY3KD
	ViskvFqeWZ6dy9igWk4h8mZX8DR2bd0hqzp/a6Js9SeJpg1PKmzAwxhtaR1Jh2zITwKIAlbw23U
	ktaduJrTHOea
X-Received: by 2002:a05:6a21:e082:b0:3c4:2b8b:e88f with SMTP id adf61e73a8af0-3e0bcab20e8mr275549637.5.1790881035139;
        Thu, 01 Oct 2026 11:57:15 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:e5ea:1a30:7c29:cd76? ([2001:df0:0:200c:e5ea:1a30:7c29:cd76])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc9f739cba5sm32631a12.28.2026.10.01.11.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 11:57:14 -0700 (PDT)
Message-ID: <02c53c37-d2ee-4c03-a8f9-0a757c3af59e@gmail.com>
Date: Fri, 2 Oct 2026 07:57:09 +1300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] m68k: Handle put_user faults more carefully
To: Finn Thain <fthain@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
References: <88e752e0bca92c7b65533cc1b334052dd272f8ef.1790842086.git.fthain@linux-m68k.org>
Content-Language: en-US
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <88e752e0bca92c7b65533cc1b334052dd272f8ef.1790842086.git.fthain@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Finn,

On 1/10/26 22:08, Finn Thain wrote:
> Running 'stress-ng --sysbadaddr -1' on my MC68040 system immediately
> produces an oops:
>
>      Unable to handle kernel access at virtual address f1c422fb
>      Oops: 00000000
>      Modules linked in:
>      PC: [<00005a1a>] do_040writeback1+0xae/0x160
>      SR: 2010  SP: 96087dc2  a2: 01500000
>      d0: 00000000    d1: 014e8000    d2: 00000081    d3: 00000000
>      d4: 00000481    d5: c043dfff    a0: 014e8000    a1: 00632fd5
>      Process stress-ng (pid: 221, task=1b729d30)
>      Frame format=7 eff addr=014e9eb8 ssw=0c81 faddr=c043dfff
>      wb 1 stat/addr/data: 0001 00000481 c043dfff
>      wb 2 stat/addr/data: 0081 c043dfff 2f746d70
>      wb 3 stat/addr/data: 0005 014e9ed4 2f746d70
>      push data: c043dfff 800daa70 00000000 014e9f1c
>      Stack from 014e9ed4:
>        2f740000 8017c000 014e9f10 00006830 00000081 c043dfff 2f746d70 2f746d70
>        0081a000 00000400 c043dfff 800daa70 c043dfff 80016a20 00000003 014e9f88
>        000026c8 014e9f1c 00000001 2f746d70 0081a000 00000400 c043dfff 0081afff
>        c043dfff 01500000 00000001 ffffffff 00000000 20000046 41d67008 014e9f58
>        04810005 00810045 c043dfff 014e9f84 2f746d70 c043dfff 2f746d70 c043dfff
>        80016a20 8017c000 00000000 0081affb 00000005 014e9fc4 00128bc6 c043dfff
>      Call Trace: [<00006830>] buserr_c+0x510/0x698
>        [<000026c8>] buserr+0x20/0x28
>        [<00128bc6>] sys_getcwd+0xc8/0x15a
>        [<000027a2>] syscall+0x8/0xc
>        [<0008800d>] sanity_check_segment_list+0x17/0x11e
>
>      Code: 000c 0e90 1800 220f 0281 ffff e000 2041 <2228> 0008 0281 00ff
>            ff00 67a4 6026 4280 122e 0013 206e 000c 0e10 1800 220f 0281
>
> 0000596c <do_040writeback1>:
>      596c:       4e56 fffc       linkw %fp,#-4
>      5970:       2f02            movel %d2,%sp@-
>      5972:       202e 0008       movel %fp@(8),%d0
>      5976:       4282            clrl %d2
>      5978:       3400            movew %d0,%d2
>      597a:       220f            movel %sp,%d1
>      597c:       0281 ffff e000  andil #-8192,%d1
>      5982:       2041            moveal %d1,%a0
>      5984:       2228 0008       movel %a0@(8),%d1
>      5988:       0281 00ff ff00  andil #16776960,%d1
>      598e:       6600 0104       bnew 5a94 <do_040writeback1+0x128>
>      5992:       4e7b 2000       movec %d2,%sfc
>      5996:       4e7b 2001       movec %d2,%dfc
>      599a:       0240 0060       andiw #96,%d0
>      599e:       0c40 0020       cmpiw #32,%d0
>      59a2:       6700 0084       beqw 5a28 <do_040writeback1+0xbc>
>      59a6:       0c40 0040       cmpiw #64,%d0
>      59aa:       6730            beqs 59dc <do_040writeback1+0x70>
>      59ac:       4a40            tstw %d0
>      59ae:       6752            beqs 5a02 <do_040writeback1+0x96>
>      59b0:       4280            clrl %d0
>      59b2:       220f            movel %sp,%d1
>      59b4:       0281 ffff e000  andil #-8192,%d1
>      59ba:       2041            moveal %d1,%a0
>      59bc:       2228 0008       movel %a0@(8),%d1
>      59c0:       0281 00ff ff00  andil #16776960,%d1
>      59c6:       6600 0086       bnew 5a4e <do_040writeback1+0xe2>
>      59ca:       7201            moveq #1,%d1
>      59cc:       4e7b 1000       movec %d1,%sfc
>      59d0:       4e7b 1001       movec %d1,%dfc
>      59d4:       242e fff8       movel %fp@(-8),%d2
>      59d8:       4e5e            unlk %fp
>      59da:       4e75            rts
>      59dc:       4280            clrl %d0
>      59de:       322e 0012       movew %fp@(18),%d1
>      59e2:       206e 000c       moveal %fp@(12),%a0
>      59e6:       0e50 1800       movesw %d1,%a0@
>      59ea:       220f            movel %sp,%d1
>      59ec:       0281 ffff e000  andil #-8192,%d1
>      59f2:       2041            moveal %d1,%a0
>      59f4:       2228 0008       movel %a0@(8),%d1
>      59f8:       0281 00ff ff00  andil #16776960,%d1
>      59fe:       67ca            beqs 59ca <do_040writeback1+0x5e>
>      5a00:       604c            bras 5a4e <do_040writeback1+0xe2>
>      5a02:       4280            clrl %d0
>      5a04:       222e 0010       movel %fp@(16),%d1
>      5a08:       206e 000c       moveal %fp@(12),%a0
>      5a0c:       0e90 1800       movesl %d1,%a0@
>      5a10:       220f            movel %sp,%d1
>      5a12:       0281 ffff e000  andil #-8192,%d1
>      5a18:       2041            moveal %d1,%a0
>      5a1a:       2228 0008       movel %a0@(8),%d1
>      5a1e:       0281 00ff ff00  andil #16776960,%d1
>      5a24:       67a4            beqs 59ca <do_040writeback1+0x5e>
>      5a26:       6026            bras 5a4e <do_040writeback1+0xe2>
>      ...
>
> The cause is a deliberately misaligned access in the 'bad_end_addr' test
> case in the 'sysbadaddr' stressor. The location being accessed here,
> 0xc043dfff, was contrived to span the boundary between a r/w anonymous page
> and an unmapped page. The address was then passed to the getcwd syscall
> which faulted in copy_to_user().
>
> The fault for the mapped page appears to be handled okay -- up until
> do_040writeback1() called put_user() which produced a second fault due to
> the unmapped page.
>
> Michael Schmitz helpfully deciphered the oops and explained the exception
> processing leading up to it.
>
>      "regs->pc does point to the PC in the format 7 frame which is the PC
>      the fault was detected at, but not (in case of a writeback fault)
>      the PC of the faulting instruction [that is, MOVES.L].
>
>      "The writeback would still cross the page boundary, and fault if the
>      unmapped page still isn't present. We would not see the PC of the
>      movesl in that case, and fail to find the PC in the exception
>      table."
>
> One solution is to add a NOP instruction after the MOVES.L to flush the
> pipeline and take the fault. That way, the PC value in the exception frame
> becomes dependable so the exception table works.
>
> Theoretically, there seems to be another bug in the existing code. If
> the instruction following the MOVES faulted, then after the fixup,
> execution would resume at the instruction which caused the fault. This
> appears to be a loop. After this patch, that cannot happen.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> ---
>   arch/m68k/include/asm/uaccess.h | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/arch/m68k/include/asm/uaccess.h b/arch/m68k/include/asm/uaccess.h
> index 31d133faa45e..728a6dfb7414 100644
> --- a/arch/m68k/include/asm/uaccess.h
> +++ b/arch/m68k/include/asm/uaccess.h
> @@ -31,11 +31,12 @@
>   #define __put_user_asm(inst, res, x, ptr, bwl, reg, err) \
>   asm volatile ("\n"					\
>   	"1:	"inst"."#bwl"	%2,%1\n"		\
> -	"2:\n"						\
> +	"2:	nop\n"					\
> +	"3:\n"						\
>   	"	.section .fixup,\"ax\"\n"		\
>   	"	.even\n"				\
>   	"10:	moveq.l	%3,%0\n"			\
> -	"	jra 2b\n"				\
> +	"	jra 3b\n"				\
>   	"	.previous\n"				\
>   	"\n"						\
>   	"	.section __ex_table,\"a\"\n"		\
> @@ -53,11 +54,12 @@ do {								\
>   	asm volatile ("\n"					\
>   		"1:	"inst".l %2,(%1)+\n"			\
>   		"2:	"inst".l %R2,(%1)\n"			\
> -		"3:\n"						\
> +		"3:	nop\n"					\
> +		"4:\n"						\
>   		"	.section .fixup,\"ax\"\n"		\
>   		"	.even\n"				\
>   		"10:	movel %3,%0\n"				\
> -		"	jra 3b\n"				\
> +		"	jra 4b\n"				\
>   		"	.previous\n"				\
>   		"\n"						\
>   		"	.section __ex_table,\"a\"\n"		\
>
Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>

in case it helps.

Anecdotally, I've seen similar uaccess faults causing kernel oops on 030 
as well, so this may not merely be an artificial unaligned access issue.

Cheers,

     Michael


