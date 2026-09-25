Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746113B1017
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790355084; cv=pass; b=rPxeFPVlWAu2Dkwdb55TTwve9yom2CepJ3JweLz6KTQuNKujjLp8ng8vSQ4VMpfQDtfSwKLR4AMinJ0eCiYAd8It+oIrV54JZurjZQnQoeuJ/Y3S82M2KeSTrdAQHO1d6xaYfKJoVmPk0ER26PG8TFpy1+q+xGg3ssUmDl/KtdQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790355084; c=relaxed/simple;
	bh=23wAQ5ZWAzix9d03eE68AP/f5zvLg5ULDLy11oTgET8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n7th4mJKgF0LYj4pyhdoRmI9Jp3/plEJluUIxD4IQH1IZTPP7jK+x5j2ykHljY46gjcCY4kh8YuNLX3Aep3ru7yMXsQKLRFVbJUPWnWgOPzyMEMRo8cOaEil52FoH4CY9Jo/Mr3iFY/SeSho8GGYq0jo98mJQoD4T9JTcuXN1UA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qDzFITpr; arc=pass smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qDzFITpr"
Received: by mail-oo2-f39.google.com with SMTP id 46e09a7af769-804ef461aedso602627a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:51:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790355075; cv=none;
        d=google.com; s=arc-20260327;
        b=tBJxiDInPp0s0pPaqi6OaMyd4lby2xsVfS/us1zFVO4e1NExiUVSbGxIJ1Of3suW8T
         F4p1fjS5oXfW6TbontafaDTgUecfsBVTHPcbYRp/UktA0uix94e6ZAKc2be2TTlcRk5L
         EOO3E/OCNlGWGoCyHljyzQmHrDWMdsR4Q0gztA2xiM8nxZYbU777fOhOsuCm40F8XFt/
         fdnOUbOXWWMyQGOVIdls3srJ1mOcL4C4JNxoaMdBM7oygUjs68z4WcrpvwX6p7csMITb
         aDQSO758hpQtDztLvwPbKhNowE8PfLt7pJqBPHrq45pBKs0AAZiFQ3W9RNOQcYdc7p6s
         +MnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9uKAp4yPEgYO485eCZ0g5hxhWjiMqUr198N8wk2031E=;
        fh=cCC4w0OdWA8JUY9wiKwjuEeCZepnG9yfyPUON4+9Yf8=;
        b=eYvXv/tjk0lh/Ssz3lOO0cbcH5W5gPRdKkfOJyFI3/EnbPk6m8ITbGX1LFAzFyrut8
         Mk3TxZc3tfsyywPRVy9z8OVuoaDqwSwanWdng9+tt4qs39Q3gVTw8EdftL6qj60KWH5G
         2JLidzcisYN04NvnbcGug9hFJIU3Fx28fA0hQ6tuZYa8HueXG+2KJVjbq6O/MM35Pfu8
         XEfC9kBG2aNyax5WqBDDDgmSXcV/zHTC6VijAY18I3VIorQrz2dt5MEwV6INZTuk0MLJ
         nJOaYu6fML+AEWP20ftUm8vDY2Q0TuU+i7x7wU6anodosmVkRJl+T/A85hcWE9GqoWt5
         n4EQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790355075; x=1790959875; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9uKAp4yPEgYO485eCZ0g5hxhWjiMqUr198N8wk2031E=;
        b=qDzFITpr2h9zfaSNr52rwXa6QdM72MLLrwI1wgpmP0JK+pTL67cGPrUI6NzW/dr+xk
         9qTFwigIUmnV3yXeWCfFowLm73hV+BuwNvz43ASZFbYJAvDbzLb638F+riYkjwGBWlAy
         3Ax64FsduPORKqNDd11m5K8mpHXdLDZJ4EFtqZACACA9vxuff1Kz71qnvgaktZGOKRM/
         X8dWCTvBsKVDmzstt9FyZPsi9sti5F0HY8776u3wrRKTjbmKrNuqlwWcqd0vQFYLqi2z
         doldIqbP3BjerOodYMA2GF82g6GZWe9tcljuU/jx8UjcHHr+azxIt1UVkDmBFgxyFwAi
         gQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790355075; x=1790959875;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9uKAp4yPEgYO485eCZ0g5hxhWjiMqUr198N8wk2031E=;
        b=R+RDAz02xDHO9tEQVlkt2xvjrvxGRndWaKMTSbp8vma2t2vgCssbOvY8gqptxSdMDY
         PJuwBhupNXMw5UrWX2wHEXlJBGHVvRdePntQ+rcQJMRpdnMoAQtXgfEmQvkQS6cdR7tr
         RdrbWviqnIrjm0IlO9MSf5J733LAKrP5MKLcemTyUlbAsFSBqXdJE02eoR17aUdenYV+
         3eckrI7WiuVU+lZt1h7cR8hKjf3+qg19MYb3irDKXn1vkVcIE2qK6Q8hxQcwgKr5Q8pA
         Yg/rGDq7OJiPU4hjROmrTJPx0eTRWQ1yUdh30JEsAJcl1dP1eZ4BZddm7rCHj384pn3Q
         4VuQ==
X-Forwarded-Encrypted: i=1; AKwUvByj2Ac8rAnWNoymVJrpsrUjQkUlU+SmxRn84/XQtoS6IKrU8M0D24u92Q02GThW5LvGF/JcPDUTaJS+rlI=@vger.kernel.org
X-Gm-Message-State: AFuF++ltWr0rX3EGIGIeZPPfPXfPUwld6dW/1YNq7mIWGiAvf12zqR4j
	0c9fMMfodBAbQA96XukgM0nO3Hn85TReN5ZtGyPIaPanhpX/rufqLHOYsYaT7u2pRkbsFlfs0Mq
	lHG540Eu66CLI1slSqp6QNdwD9flHdM0=
X-Gm-Gg: AYBFou3JIn2X9fQkVTUagASY1TUySj9MY3+WcvZi0cOobmYI+QYo4FFG/WoTh5c++oH
	3VnfVgXYZdy2WzgIFmNx7lvWg2fO8d4NrE8gaF/5LsnKNz+8HpE5snmWeQTWObm5cIEcjyfrF4e
	53AUhep0wWo4U5Lnx+tvafaOr6X92kQ2M8rjnqRRdO6VA4oe6dOELD36bp7O3+SRz90VhEyndtm
	7E2rYtFjUQN9aEEVF6ZX2WV/0WXrMbHd6ytzowfQFc5xG+yN40HkoCjcnhZHw/x05OuuradC6i3
	7e4pxghbSS89cTnOVIIAZg5rqJj7cHIk5vFYnrzFTMjVSWM1PtJWSAYfYJjvQu904A==
X-Received: by 2002:a05:6820:f025:b0:6c7:7668:a2a9 with SMTP id
 006d021491bc7-6d43f2c6ce7mr6782198eaf.26.1790355075127; Fri, 25 Sep 2026
 09:51:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924210121.87032-1-avagin@google.com> <20260924210121.87032-7-avagin@google.com>
 <20260925040215.GAarXyR6cUzn9OH4ZD@fat_crate.local>
In-Reply-To: <20260925040215.GAarXyR6cUzn9OH4ZD@fat_crate.local>
From: Andrei Vagin <avagin@gmail.com>
Date: Fri, 25 Sep 2026 09:51:03 -0700
X-Gm-Features: AclHuK-sn1-sqTjJxX0ASMST64hvgy9ihrDudc6Me32wqncqjDg-lggnEp2N5Ag
Message-ID: <CANaxB-yxzmDr3K4qQ+f-pVyUOjn8jKJeEydR7adi5N+_TiFHZg@mail.gmail.com>
Subject: Re: [PATCH 6/7] x86/fpu: Pre-fault only required size of xstate buffer
To: Borislav Petkov <bp@alien8.de>
Cc: Andrei Vagin <avagin@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	"Chang S. Bae" <chang.seok.bae@intel.com>, linux-kernel@vger.kernel.org, 
	criu@lists.linux.dev, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>, "H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 9:02=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Thu, Sep 24, 2026 at 09:01:20PM +0000, Andrei Vagin wrote:
> > diff --git a/arch/x86/kernel/fpu/xstate.h b/arch/x86/kernel/fpu/xstate.=
h
> > index 38a2862f09d3..c73cf2444de6 100644
> > --- a/arch/x86/kernel/fpu/xstate.h
> > +++ b/arch/x86/kernel/fpu/xstate.h
> > @@ -55,6 +55,8 @@ extern int copy_sigframe_from_user_to_xstate(struct t=
ask_struct *tsk, const void
> >  extern void fpu__init_cpu_xstate(void);
> >  extern void fpu__init_system_xstate(unsigned int legacy_size);
> >
> > +extern unsigned int xstate_calculate_size(u64 xfeatures, bool compacte=
d);
> > +
> >  extern void __user *get_xsave_addr_user(struct xregs_state __user *xsa=
ve, int xfeature_nr);
> >
> >  static inline u64 xfeatures_mask_supervisor(void)
> > --
>
> Hmm, so which tree are you basing your stuff ontop?

It is based on tip/master:
commit 2edcfb3bc04385e287ebc2408be2882842bf6111
Merge: 3a7bb97db232 c9fc85f1e44e
Author: Ingo Molnar
Date:   Wed Sep 23 13:28:15 2026 +0200

    Merge branch into tip/master: 'x86/tdx'


>
> Because in patch 5, xstate_calculate_size() is not static so you must be
> basing it ontop of some tip/master branch from sometime because tip/perf/=
core
> has
>
> b84c96283684 ("perf/x86: Enable XMM register sampling for non-PEBS events=
")
>
> which drops the static qualifier of that function.
>
> But then you're declaring a prototype above in the header while that same
> patch is declaring the same prototype too. So if you were applying ontop =
of
> some tip/master state which has tip/perf/core, then you wouldn't need the
> extern.
>
> Weird.

I started this series before b84c96283684 landed. I put the prototype in
arch/x86/kernel/fpu/xstate.h because I didn't need it outside of x86.
Then the rebase went through cleanly, so I ended up with the duplicate
prototypes without realizing it.

I've sent v8.1, which is based on tip/fpu. In this version, I moved the
xstate_calculate_size prototype to arch/x86/include/asm/fpu/xstate.h.
This matches b84c96283684 to avoid the same problem when tip/x86/fpu and
tip/perf/core will be merged.

Thanks,
Andrei
