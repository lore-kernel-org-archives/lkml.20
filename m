Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35DA3B14C3
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 20:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790541136; cv=none; b=llQHBmnsrT+paesDA6BaidE0gKdVVvLIkSVAGYzivbrksoYGZ3RZZKTDkDRCLrlMxKcd8lfNHye6sNCfFCq9f/qqCBdAjBTnvbK/OdHDA5F2UnD9J9/ELiWBUlw7UUeva2xMLfLiFFfNlnVQD+A8DfaoBbRHkbd4ytJpPmjy+ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790541136; c=relaxed/simple;
	bh=eAw4W6QjTTBXa5GbZrpw+yuYiwhLLXyJOTNrJ0+leFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qN6289fmtbA800dldkwcn5kLIfd8pnWN+OF8D0gu/hBTW1T0+34dUt5hH3Q1ckSpKyI96iMtHvy5+1OaQNW3FRuksUjofDPevBv5L8KhfHzv0DgjsyVPYn8l+wIfh5zx2eCQn553jQUkFj3ktcjbZ9CM6hX1ytyKM8fV/BJPNzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jSad5ng0; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jSad5ng0"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0aa9d356eso1919264a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 13:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790541134; x=1791145934; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eAO6WabpD+y/dCbAwrQTwRbR2CnZ9OTMQukOdgoZcZI=;
        b=jSad5ng0H1Fl2tyE/JiK6+/lazD/g/aum/ZC6XGhUyuJp5qqSDbMSkMxjf8pkZ9FsW
         3zTSWZEH71KuvA/QxXY2/3yHkt/QUE9EWiO48Hcliw3W7b+4aiD02yeIOZ4X7BdBBNy+
         Ut0N07t4FUZ5Us0oNeoGgOnWxpLs2GVZxA0POo6hyvnzJVSCsBKVqKkShtZd7zxgyKPP
         jMzICjGD7FgyX5PW7pn+mPCvvlE2YYzWfPLtgJ63Ui3X/C03d5wG0iKUgxzT7vxLBU+v
         BDNUg3vel8ztmzSzoLA/AfTmUbHrLoj+5eEnIT37tfMFE99w0Qe7fBsSLlpWC3ZHVQo1
         6hcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790541134; x=1791145934;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eAO6WabpD+y/dCbAwrQTwRbR2CnZ9OTMQukOdgoZcZI=;
        b=TQlI8UKt8ZTsIidoAr5VpY3b9Uay3n0B+r8VkDU5mbnmjtLBS3I5JTQWS8rp9riiUh
         +E8NDZfPav/8b0Xsw5sMObMkwFAkUwRiK7W4XdkaGv5g1ctWFnoGkbQxLnUAa5DYYAw1
         J0Qmn50siSmk4tTGvSibdwRy9Kl31oLwqbba5Puu68iSgyzUo2WvsNlNGhCmr/8EJKCj
         xZLjjk65E7SknbRFSiF2BJuVt9IrpXhFr2MIrrBqTsQgMGedTwFPSD8hl5ydgxSFK8+1
         BbUT1KxXeiyPSQWRSBrjcWqPOJ9NfM8OCeT5pOvgVx26GolTklS+HiPjSR0VE7oqOx6Z
         CYZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzfBClMtEHgjWNx9kZLVLBLaRtAi7evHtUVL6YraMKRStsu+4ISeIF6B2NHWGoyT4IGQ1tg5cNIO1Pazzw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLw3sVmEclt5DZ7cj17UGcrKpFvJyP+nN7QxC8aSz18fph+G5jz
	kKQrUYGwyClX3qbA060ACke5ViDi7hGvAlH7iQHR5117VhGEzt85fXh0
X-Gm-Gg: AYBFou3HsV8fr7bU6qhy9a8ww9ZLnqIljbURSreKBAn3E6te3HdP9CHDJgH9r+lwjlW
	w4eFUgdV50fA7QVaeLNOAKmCtuwuK7LViFV+LTU5+7ezTX5B63vpfQM51FfHch1nJiCPfuQ9q65
	GWbDW8K9+Ar2RmVG37yq+cuzJuL7eiPsIeUL3y3XOE89ZcWfzwYc3gvLxvOYvT/rmGTggjw7jNi
	Wn+1dto/Dia3XhPFW1NyZJiObWzgB9ZPJSt9QIs9KT7prqrRImhHsUnt+F0c/7uoT0Wz+bRUDRx
	Vd+zqqtnE4ZtvZ5SIYR2n5Q3jLDrCuNQ3Yg/6UniHNrDB95fU1cu4L0NRN2OQT5IMiYSlTtTip3
	MOgGbCNbz3oGFC7Rv6N6tDlq6XIleWOf9bwos23Zove3XDHGmYBlMTLWbeICnPEP45pVelSM/Et
	3InezPBsBL3pyrA+6cOeOTBfL3q5RWLBrUaNnhtChLCOiRf3NIlB7ymZEUe+jsLYuet9uon54=
X-Received: by 2002:a17:90b:574d:b0:3a0:2900:f584 with SMTP id 98e67ed59e1d1-3a099230a7fmr10493566a91.46.1790541133971;
        Sun, 27 Sep 2026 13:32:13 -0700 (PDT)
Received: from google.com ([118.150.148.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b99dcd78sm16818220a91.15.2026.09.27.13.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 13:32:13 -0700 (PDT)
Date: Mon, 28 Sep 2026 04:32:07 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: ast@kernel.org, Greg Ungerer <gerg@polyxeno.com>, daniel@iogearbox.net,
	andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com,
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev,
	jserv@ccns.ncku.edu.tw, marscheng@google.com, eleanor15x@gmail.com,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	bpf@vger.kernel.org, Daniel Palmer <daniel@thingy.jp>
Subject: Re: [PATCH bpf-next v5] m68k, bpf: Add initial BPF JIT compiler
 support
Message-ID: <arl9R1pfMU1k7-Ur@google.com>
References: <20260823163812.3024812-1-visitorckw@gmail.com>
 <f89b4e87-12fb-45ae-a2a1-12ebcc483326@polyxeno.com>
 <CAMuHMdX6rtJDZUqhLf+-U=9=yTkhJtYUU_Ru1GE=7o0qXu+d6Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX6rtJDZUqhLf+-U=9=yTkhJtYUU_Ru1GE=7o0qXu+d6Q@mail.gmail.com>

On Sun, Sep 27, 2026 at 04:03:15PM +0200, Geert Uytterhoeven wrote:
> Hi Kuan-Wei,
> 
> On Fri, 28 Aug 2026 at 12:50, Greg Ungerer <gerg@polyxeno.com> wrote:
> > On 24/8/26 02:38, Kuan-Wei Chiu wrote:
> > > Add a BPF JIT compiler for the m68k architecture.
> > >
> > > The JIT generates m68k machine code targeting m68020+ processors and
> > > coldfire parts with an mmu (ISA_B/ISA_C). It excludes plain 68000/68010
> > > and non-mmu coldfire processors, as it relies on 32-bit branch
> > > displacements (b<cc>.l) to handle large bpf programs.
> > >
> > > Tested with the test_bpf.ko:
> > > test_bpf: Summary: 1061 PASSED, 0 FAILED, [1049/1049 JIT'ed]
> > > test_bpf: test_tail_calls: Summary: 10 PASSED, 0 FAILED, [10/10 JIT'ed]
> > >
> > > Tested-by: Daniel Palmer <daniel@thingy.jp>
> > > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> 
> Thanks for your (impressive) patch!
> 
> > From here it is really up to Geert now if and when he will pick this up.
> > I am happy with this patch in its current form.
> 
> Who am I to block this feature? ;-)
> 
> > > --- a/arch/m68k/Kconfig
> > > +++ b/arch/m68k/Kconfig
> > > @@ -8,6 +8,7 @@ config M68K
> > >       select ARCH_HAS_CPU_FINALIZE_INIT if MMU
> > >       select ARCH_HAS_CURRENT_STACK_POINTER
> > >       select ARCH_HAS_DMA_PREP_COHERENT if M68K_NONCOHERENT_DMA && !COLDFIRE
> > > +     select HAVE_EBPF_JIT if MMU
> 
> Pleave move this to the other "select HAVE_*" lines below, to preserve
> sort order.

Ack. Will fix in the next version.

> 
> > >       select ARCH_HAS_SYNC_DMA_FOR_DEVICE if M68K_NONCOHERENT_DMA
> > >       select ARCH_HAVE_NMI_SAFE_CMPXCHG if RMW_INSNS
> > >       select ARCH_MIGHT_HAVE_PC_PARPORT if ISA
> 
> I think you should also update
> Documentation/features/core/eBPF-JIT/arch-support.txt.
> 
I wasn't aware of this doc.
Will update it and send out v6 shortly.

Regards,
Kuan-Wei
