Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792767059;
	b=ok2yKPmDuxcK6omIOq00L7g0Pia1jOOJWkypE00s6wlRR7ChNGKzVZBM8mZN5SNevMZ9
	 gluEswahrboA5jXgToH5e8kUD4zvQxc+LSqbkFrvFIO68llBltZbEqiYeVdeBux3MRO1f
	 wTlJUe72w8DJM/ZqZP6c9qqqNV561st4UJeUHCuFZYts1IrKlMV3va3C2ZtLwER0RYZ9U
	 bqanHWxJ9iRAbhT/wzq1DJUUeUFJ5lKqW4mJyhoGD/mQ2YXuqwONdI4u7lKHJ6FKVUT3M
	 bXIrqFhVAZULdt2httR0byoAuf76m7xcnisbN8MtRi/4LdsRGRZoFL7rpQ2bV9sUnvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792767059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uNpmEP5c8VeQ+q4DNjLNP6E92iAqlUq5JqczOkkWF1A=;
	b=R+/w2VWmb036/OPJ5jDy/vaHBs/YDaYsG0uymAdibm59mkDcXFP88xEHyClLCArczvnG
	 ooWBNE7HJHBcyX69yt9m7zJd8imdQsWvTG15srKNV9qQB4sOX9y1Q6B0tOsIqCjaxt9Mo
	 GmX+7Pm5Koa7TB8bvIdK5Lc362uXu4W+B3EOgFt1Ex0v6OcUZKJ4gJHQChnsAwNqpoHw6
	 05HcyOr8FUTY+IWRzAa2JP0YhRfvIdT7oZAuOxWOGPk7p5C6n4acvkGV70uFDuIq4xiWg
	 e8w7SPB+ADkC0MX4mO+7H/3PWkFAG69/31boew8i7krc6rYdEYe/2GNsR9nXJ4ArthA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=GaVKmESF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901BB606A324
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:50:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 901BB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=GaVKmESF
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-70059e4dab6so638460eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:50:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792767057; cv=none;
        d=google.com; s=arc-20260327;
        b=PtkcM0jpaaZVXMSKdw3ROx1+M9uIN2WxMZGBUukNp9HxtCCjCwz4Z06K6E3kLPd7Sm
         0vN3/3fmxEMXnsKH86EQMi6uwVG5gHX3AgIjHHCcoKKyZtt9cxwIt05tLNjVO0n/6AMG
         wlTUZCm4zCWuNawopHlRSP6qXMyBu/yshKp8GhqaplJlyT1HpQGQEtx2w3g1DONX3so2
         FHd2C2ywf8TbXInY6pisjmI+3h43r0ljI0L/xwgdfG41NoLqH+clNXFZNukSx4eZGDsQ
         l4VzTjOxgsHYOSr/x2NnCYa1X8RnJenpUQeegYs/BE1CtksSYNrbj1olAGlr9jzVYaSY
         vYQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uNpmEP5c8VeQ+q4DNjLNP6E92iAqlUq5JqczOkkWF1A=;
        fh=rdYxiS+OZklHRYsEDCjopms/wp+OiwnwxYJ27ME5kt0=;
        b=T0mC2x3UQ+M7C83UY6+ajZbwgLOEEOCdw2iu0+mJeVbWuO3F9CUhWl+aNjvC+NMf1c
         66M9+IXEfZAFbdpjIRxDkM5x4rEWvTLyXleTMs+WdaL5MnsPjynEsIB1R1VHJkqXrhqc
         lgWsnvA5gwvN1xWIBKXeGIttyauq2MZ8mIMh7Cj0Qp389NSuobr7OKbbVWF/UicwjA+h
         ERDNWbrX/VaNJ5JhzUZvRaEUxVmSbCNRk//MteikHhpA6pXcDzsCg3jnS8OOIYFIxWMa
         VBu+rwPjSEp+YqfxJz13T1HGzI3fN8JSyNvmGX/Ajh3UAG8bkp+LJnsjmAAMXBeeDHUg
         ulzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792767057; x=1793371857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uNpmEP5c8VeQ+q4DNjLNP6E92iAqlUq5JqczOkkWF1A=;
        b=GaVKmESFg5N9j7egEf2IT9a7ovcZ4RM6cg6Qoe9+MBgeCbGMonxypKFNiXl0yBunAg
         yddW8V6Zj5uCkRKYYeqGBALkbbHd4Hrwthd3Jwgv7e6iI/lEuuZPpK9myoToaV3tlVKR
         6dUjmecu0xH1DwNmf9U3PkgM+G75srRhug9rz2wpYVohkrTATIAp09wREw5ZdslshnDb
         WluH/R8/NLBWaHZUi+2n7X+JPSHAonvcLfRn2k/q6REujv7ucqtvzE7s6hlhKVgIoicN
         A0tErFasXb/hBR0O7cqgN8nntcWo/jcHTO+nC1CPzfpbjYzcEMT8V8nMoHpuhz1Fs1xA
         +2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792767057; x=1793371857;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uNpmEP5c8VeQ+q4DNjLNP6E92iAqlUq5JqczOkkWF1A=;
        b=GV89U9zjmp28qJsF2ASOgqbhFaBlKhXmQ0mwP5jc2yix7YV3UiPc526QomlWcZyov1
         e8FKatBB4J2vXVFEbv7p7HrRpkjwf5TqDX4CfrCLgggiGaByqPjMe+WQ9clNWOHeFs2a
         e35hVqs2h+Ag+2v+90Y1oCD3W8NOandr+GQN+ae2LxsaGsq+cIzdutOevhXCRC78wwqm
         9ylydNSF5cJFeXVvPiQ/dLcPHS4b8Yr3Pd64JmWrrcjqOqwfjrYjgeKqBw71UjJR20YF
         1sjOWSTlczx6vwvjySmEZQmywwnZtcqrRUZJJTXArZ4nTxDaA7Cv13MUCWmIPcarhpGa
         ZWnw==
X-Forwarded-Encrypted: i=1; AKwUvBzre2c0vSAyQ13uT79RzVVKWg9NH6/frTwqFmOM4maiBW04eRH6OrTHF6WlV/0HpgVB0awuA7w0joDedms=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRrP2ab9vzLsxkxENiAsiTwJc6sdvWXtDAOl5cI06A2sMB0PvO
	pkBbeu4zpNXYWuZCeapU6w71uvpZ11x0u/DF+F9808d3cpzzO5PhzfjZmNt5+DdJvn+yc4/QqyM
	Hl5KYaBXp/KK3Z4XorAGcPUrmcsJzHVaoRW6sSjrLpQ==
X-Gm-Gg: AYBFou2Ef5KaWJ9opfqNInzEUpXwrd4oi9bSJaqo+7U5xMaecadJLsZ7+OUq7Wq4SeD
	CL8T9DFDr2FqLAu880eYhLuqtOuvM/DsCyAP2np6CzeT5qGn8/PPfZnUPVxg21nRAQlVAetrcjp
	fBLKkKpdO+Ykqfqy4lhiqosY6OtvN+BEdb2DlYbhX/noWELY+nTiqe2UalwRvSgMSa6Ix+0UBSy
	GoBrIVWxlHVcKIr91K9rcN+mT8se1HizeSVLDIWbj70Q2666mK3Fp1z43SdPjzdT7sZ0GW+C0QK
	WLOaZCumGxHjmeQVUeSnnEc3szVkgcvJEiUPSbwRdG3kiY50708EQG28mkTIIVM9McXrpfUBfX4
	9/hTkhW2TQivvwRVPuYvph0plxPnXc1W6xzcShKs=
X-Received: by 2002:a05:6820:8597:20b0:6da:29e4:35b1 with SMTP id
 006d021491bc7-70b88a1cc11mr1189394eaf.31.1792767057470; Fri, 23 Oct 2026
 07:50:57 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022083212.84721-1-cuiyunhui@bytedance.com> <atqL1ScMLUg2bM_E@Tao-Chiu's-Mac>
In-Reply-To: <atqL1ScMLUg2bM_E@Tao-Chiu's-Mac>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 23 Oct 2026 22:50:45 +0800
X-Gm-Features: AclHuK-Du3zkiCNN0XfX5mHWLP_GAo3ZNGA4wWa5MNg3SjlqsiC6OFMlcOn_PSQ
Message-ID: <CAEEQ3wkS2niNwzS25jhvT55fSDWF_anYkLW5PZS0MsvUOq2vBQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] riscv: Fix SR_SUM leakage across context switches
To: Andy Chiu <tchiu@tenstorrent.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	zong.li@sifive.com, wangruikang@iscas.ac.cn, debug@rivosinc.com, 
	qirui.001@bytedance.com, guoziyi114@gmail.com, samuel.holland@sifive.com, 
	ben.dooks@codethink.co.uk, cyrilbur@tenstorrent.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Fri, Oct 23, 2026 at 6:19=E2=80=AFAM Andy Chiu <tchiu@tenstorrent.com> w=
rote:
>
> Hi Yunhui,
>
> On Thu, Oct 22, 2026 at 04:32:12PM +0800, Yunhui Cui wrote:
> > __switch_to() saves the sstatus value of prev and restores the SR_SUM b=
it
> > of next with csrs. However, csrs only sets bits. If prev has SR_SUM set
> > and next has SR_SUM clear in its saved state, the old SR_SUM bit remain=
s
> > set in sstatus.
> >
> > This lets next run with user memory access enabled even though its save=
d
> > SR_SUM state is clear.
> >
> > Use csrrc to save the sstatus value of prev and clear SR_SUM from the
> > live CSR before restoring the saved SR_SUM state of next. This keeps
> > prev's SR_SUM state intact, while preventing it from leaking to next.
>
> Do you have a way to trigger this bug on existing code or is it the cae
> where the bug could happen but we never experienced it in real life?
>
> If I understand correctly, this can only happen when the user access
> routing volutarily makes a schedule() call mid-flight, or a code fogets
> to turn off SR_SUM right after an user access and has a live SR_SUM when
> calling schedule some time after. Both case should be a bug as SR_SUM
> shouldn't live in the kernel code that is not doing user access.
>
> A trap-introduced context switch would interrupt a code that have SR_SUM
> set. However, since the bit is cleared at every exception entry, the
> context switch code would not see a live SR_SUM. Seeing the bit set in
> this case means something is not turning SR_SUM off properly.
>
> I aggree that this is the better way to handle SR_SUM in a context switch
> but attaching a call trace or stating that "We have not caught this in
> real world due to ..." in the commit message would be appreciated.
>

I don't think we need a "better way" to justify this. This is a bug in
__switch_to(). One possible path to hit it is
user_write_access_begin() ... local_bh_enable().

Thanks=EF=BC=8C
Yunhui

> Cheers,
> Andy
>
> >
> > Fixes: 788aa64c01f1 ("riscv: save the SR_SUM status over switches")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> > ---
> >  arch/riscv/kernel/entry.S | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> > index 61b7a77166971..628b85e3915a7 100644
> > --- a/arch/riscv/kernel/entry.S
> > +++ b/arch/riscv/kernel/entry.S
> > @@ -443,15 +443,15 @@ SYM_FUNC_START(__switch_to)
> >       REG_S s10, TASK_THREAD_S10_RA(a3)
> >       REG_S s11, TASK_THREAD_S11_RA(a3)
> >
> > -     /* save the user space access flag */
> > -     csrr  s0, CSR_STATUS
> > +     /* Save and clear the user space access flag. */
> > +     li    s1, SR_SUM
> > +     csrrc s0, CSR_STATUS, s1
> >       REG_S s0, TASK_THREAD_SUM_RA(a3)
> >
> >       /* Save the kernel shadow call stack pointer */
> >       scs_save_current
> >       /* Restore context from next->thread */
> >       REG_L s0,  TASK_THREAD_SUM_RA(a4)
> > -     li    s1,  SR_SUM
> >       and   s0,  s0, s1
> >       csrs  CSR_STATUS, s0
> >       REG_L ra,  TASK_THREAD_RA_RA(a4)
> > --
> > 2.39.5
> >
