Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA103F5BE5
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790518142; cv=none; b=CBxP06kif3BhxHXbAHxTyd5V9MfCSzOdn/dTose4LFmDUWUItGm0HdkWfvi7SV/Clt4hWS1fXCYPJfM2YMg56VC/dG8r9/LP9i1ha3060/xKkkupH03u3Bf6rkKAsWe2sOH5Q2D8AJbhXKsqb7YUDihkM5VbqOnzRzL+v7Y8TIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790518142; c=relaxed/simple;
	bh=yhyQ5E5gTwtMoqYqyOj85N/VFjOffiNcf89Kbn3imTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IBggT6JqBxpRlFGoQG9qoET4P8yXw76KzNwBuCIG3EK+3fmsBNC/Kcpa43EuN+ijR+f/uWNLSKthcY2zpBa6TUfQLHudb82uRMu/GKhM+XyenY6ckBPpKnBacfZa98rMyqutIIUCgB45ARuiIX9iTm/RBCIixeryTH/bcK7sZRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk2-f41.google.com with SMTP id af79cd13be357-93bfa7b2093so264126185a.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790518140; x=1791122940;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SEr1x1TudocYne3WCX5MTGLuJSrLgCYH24KPO9XObHo=;
        b=zXBoFs4wCzZesbYEd5ay2IjjKZjoDiLW7BUKzRtGZsWWcHC+jPMayte8LmPCxD0Xe8
         OA5+kzNSc9BGsnFueFDKc+G5NZ6tJRx4VwD8u7NVwAzvCi2Afal2LT06hCcoQg+BrjqQ
         MGb/ufH+sWDuuPmRMhZdpEqH0zDkEJLxPlKRTOuk9RV1LDfkbQvg/+fIHmmQe9ewQXKG
         nWLFKJoD186u0pm8vmmcfGALuCpg7KwW0oEi4W7xvYBXUNDoFSw7gnatl6sM4vgGwTrc
         20gvu++jahjus7g8mh3ma27eZGKkYIMYEAN9aU5KPu5YSfPVQxTmNR2QnvAIupR5bOlf
         SQlw==
X-Forwarded-Encrypted: i=1; AKwUvBwi9XtoimWChswCMt5yz07t6uHLklZVSz+3550e8o+TCB2FfxxTmvEjd4bN9fy/Ieab7Xw7z5LciLIMSUg=@vger.kernel.org
X-Gm-Message-State: AFuF++mKgGICV+OQmJEf1W8CiO4VBimav72aDTzXO22Gpx20iY73JAMX
	cRX+J74dLNccNOZ2rZ2h7ntIDRUl9aYCkycwExG+u95RhcNxo6OzojwHspw8m/26
X-Gm-Gg: AYBFou1USTQE8lBqflbU5negC7cxsfymHK/4Do00HG8rWHpBTzMK11Zm60vuD/TJrCj
	bv3suoZLcmhb74j16mH8w28s2T5kDF29+8xsF4Yx//XnQsH68e7OUEIA6xbKLj/vZh9gsnPLNj1
	yM/FFUJhYJSDAvP2IRgC8Nvhy2oMTYomhr6zcUyFnK69uUkP3Mt8VeRPsuGo0l99ZtSy8h+/UST
	sZ7hlmrPX1Ydy+hEBj9EK2lyi38FFFsaH6Gm73+ac3/kr5M+uu20Ct21ZaQHqcmRNqmdzWxVvbG
	RwWbs+XHI/wlUt441v5733M3j8yd/QjwjytXW2Ujj0DNvMi4hvP7W7oz6JPMK8uQsV4SNgP+UBm
	RXdk2ONsNurVawA2SS5PBeGyAUiMtOJ4OCQb3sy2CBncc+5xPErxcfGw9Xvxen3X5fVpAAxXla9
	yCCVfG/v2js6fPyZ9IlakQh3sAVONRLk/t/euZfuEhAKyKH38dW8EK25UZMav0l17gwjHRAkurG
	/xY9dWntKuqPCwGOlHRIvF7jWmyqsfTgdhlVQ==
X-Received: by 2002:a05:620a:4592:b0:93b:d79a:c467 with SMTP id af79cd13be357-93c43e3e5e4mr1436356085a.63.1790518139980;
        Sun, 27 Sep 2026 07:08:59 -0700 (PDT)
Received: from mail-qv2-f43.google.com (mail-qv2-f43.google.com. [74.125.230.171])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c7b2dc138sm4962185a.42.2026.09.27.07.08.59
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 07:08:59 -0700 (PDT)
Received: by mail-qv2-f43.google.com with SMTP id 6a1803df08f44-914446005e8so12913936d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:08:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwi6iud3y6czOSD6bXBxhJJoVebUk/5zM8xeIQ+uZrzavQAouRBLyLEHdGpigb95rEab68gYXK2Fnhp70k=@vger.kernel.org
X-Received: by 2002:a05:6102:6a8a:b0:7b3:32fe:77bb with SMTP id
 ada2fe7eead31-7b332fec22fmr1341342137.27.1790517806812; Sun, 27 Sep 2026
 07:03:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260823163812.3024812-1-visitorckw@gmail.com> <f89b4e87-12fb-45ae-a2a1-12ebcc483326@polyxeno.com>
In-Reply-To: <f89b4e87-12fb-45ae-a2a1-12ebcc483326@polyxeno.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 27 Sep 2026 16:03:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX6rtJDZUqhLf+-U=9=yTkhJtYUU_Ru1GE=7o0qXu+d6Q@mail.gmail.com>
X-Gm-Features: AclHuK8wpR6y1eZRM9LOMXOTOPARQG0nffPxefCG8RnAkx6men2t0o6U3_-doY4
Message-ID: <CAMuHMdX6rtJDZUqhLf+-U=9=yTkhJtYUU_Ru1GE=7o0qXu+d6Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5] m68k, bpf: Add initial BPF JIT compiler support
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: ast@kernel.org, Greg Ungerer <gerg@polyxeno.com>, daniel@iogearbox.net, 
	andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, 
	song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, 
	emil@etsalapatis.com, ihor.solodrai@linux.dev, jserv@ccns.ncku.edu.tw, 
	marscheng@google.com, eleanor15x@gmail.com, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, bpf@vger.kernel.org, 
	Daniel Palmer <daniel@thingy.jp>
Content-Type: text/plain; charset="UTF-8"

Hi Kuan-Wei,

On Fri, 28 Aug 2026 at 12:50, Greg Ungerer <gerg@polyxeno.com> wrote:
> On 24/8/26 02:38, Kuan-Wei Chiu wrote:
> > Add a BPF JIT compiler for the m68k architecture.
> >
> > The JIT generates m68k machine code targeting m68020+ processors and
> > coldfire parts with an mmu (ISA_B/ISA_C). It excludes plain 68000/68010
> > and non-mmu coldfire processors, as it relies on 32-bit branch
> > displacements (b<cc>.l) to handle large bpf programs.
> >
> > Tested with the test_bpf.ko:
> > test_bpf: Summary: 1061 PASSED, 0 FAILED, [1049/1049 JIT'ed]
> > test_bpf: test_tail_calls: Summary: 10 PASSED, 0 FAILED, [10/10 JIT'ed]
> >
> > Tested-by: Daniel Palmer <daniel@thingy.jp>
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>

Thanks for your (impressive) patch!

> From here it is really up to Geert now if and when he will pick this up.
> I am happy with this patch in its current form.

Who am I to block this feature? ;-)

> > --- a/arch/m68k/Kconfig
> > +++ b/arch/m68k/Kconfig
> > @@ -8,6 +8,7 @@ config M68K
> >       select ARCH_HAS_CPU_FINALIZE_INIT if MMU
> >       select ARCH_HAS_CURRENT_STACK_POINTER
> >       select ARCH_HAS_DMA_PREP_COHERENT if M68K_NONCOHERENT_DMA && !COLDFIRE
> > +     select HAVE_EBPF_JIT if MMU

Pleave move this to the other "select HAVE_*" lines below, to preserve
sort order.

> >       select ARCH_HAS_SYNC_DMA_FOR_DEVICE if M68K_NONCOHERENT_DMA
> >       select ARCH_HAVE_NMI_SAFE_CMPXCHG if RMW_INSNS
> >       select ARCH_MIGHT_HAVE_PC_PARPORT if ISA

I think you should also update
Documentation/features/core/eBPF-JIT/arch-support.txt.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
