Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792433090;
	b=ags+9uOFZq2250TbHZuKtpZnvLPROCZFMVtut0w8T3Ty2m33ekwPS355/7UhE2E2mAoU
	 BJicWjqSQHykCGVzno0OBMIWGPtkjtqOPTkWJQfVz+ug1yx99ood0P2O0wuhYsJvYqDCF
	 Bw8gQvvYQ6oYGoiBac3r+ybgXEIo9+1ZmwhW4HmH+LDiWyHOFeZ5NniDO530zjtnMkUi1
	 tT/vNQRolfjm5416XOrPHkeD3ct/f3pXUNYNDp4AXlOvxNdAtPJZ7JcMJQ55nUri/dKXO
	 Z+HDfW8eygKDQLj7Br+QPBV97+FuG1pMreFtKPLWMcRMKXpUrqRimvJIUhuNtnF2eBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792433090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wrt+8PhfRlQSNIHgSD1lLTqm3eQcjLp2HLFlGFUSVTc=;
	b=WcLLO1p+oWJTBUKd4KvKVc5D63Oa3+cBUyxocUkfTDeNoKyRJbsBruwshJHSbRLo+UUf
	 cxIxbMz9gSEh+rZlTlqsqoYDd1nXGZLe3H+Iqfu7X0ucbKpj4wsZRDy3X1Nqyy6j8yGdb
	 uEyk5lL5h90hWRn+sq3xKKTXeuecQpHWnEmQ96GDG9cR6MD0ZTefZAdGaCizCtNhX+F0M
	 QOlGekuHPFPK8jzrvj1b3g46RI1PAz3kGKM+O4OdmPUpY/zTu5/eEliE/614FqJwiDscZ
	 TA9eWQ1nT/FRTpzlM8OiG50Y/k6jLoTWVvmC/8FQIn+naSzpzO1RH6+oiDQnotNDAGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tql2y07z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C6E606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:04:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04C6E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tql2y07z
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4086e892a4so314395266b.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:04:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792433088; cv=none;
        d=google.com; s=arc-20260327;
        b=kWAgTQyueKlO56rEGjtJOzHVgk40/OBcFlpQu3zGn0cWh2kcvJNiQq8zSvlXCNKr1E
         fAfRlhTq7khHmFQvrmnoPhEVY5FRwEqUK6tndFSjbcodnc+Qvv4nsW2iKZcsi7j3YkIr
         h0vlXqB1hl8P46dFUbbLnfU4+j46uFgtetCgf+Wyy6HPkt3/vPf6qVcbG4k3/gNmprOO
         1xVQHwjfVRpSeo9bwAoW7z67+DRRmv6UnlXXtEXIAP+8QaPgPOuwUQ3f1yrSuylpOL6U
         qxPYQ4A+cRrPAhZ1ziXMfEOJ8gpeLqjDaH22fUETSwTA8xybBBe4DDsxpdjHpN0Ji81X
         WFWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wrt+8PhfRlQSNIHgSD1lLTqm3eQcjLp2HLFlGFUSVTc=;
        fh=dNwHwq27nc7nLNid2Ap5zwcwo+PuDS3eUXuYcknkl7s=;
        b=fMKdHeQuutWd9ONv0kvYPtVfz8Fj2QnR0XVZuI2T/0mKY+D2YPxpO7DZB5oniaOH2n
         anxocXk9y+7GH3MMnCp0KvHanj/Hti7IdRJ0XU6phi3Ux4J1Fq8LzplliKr7vqyS78TU
         YVfYZ55sv0s+ih/tGQlbEpX0oppQh1v+ElWX7adL2FAlDCt1pWleDH9Thdnliaj/xrrm
         4LL1wovPWc9Rb3OkleU4J0xblmpBejuSKgAguVNqMQjwoUMSu/tgmlk/wCKWUUQYhD9u
         Xt0DwizSKuipE+sxm/5XsBZplO+dz1dposOtPShMMa6wSpvPmKW74MUfvXUOwvmx1h/x
         qQCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792433088; x=1793037888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wrt+8PhfRlQSNIHgSD1lLTqm3eQcjLp2HLFlGFUSVTc=;
        b=tql2y07zDPVDJso7yMW3lsi5HQVfJQ5cN03e09ZN1YkZJ3zIiA0JnLqjtsJSlCiz+7
         TOgkKwg3TsMMzyTkMvLbvWqVmaREB/AGOkiwYpWLld/GryqRj6+W55AisKLzxdQ7TpPz
         hBWhFGKFj2sN9VGWx0xQvs+iZsO+g2cQ3j9TX4R+mjXA7zqjIKBRCvciXVpSOtZCVXQj
         Qy6xGp+eG7rSRANHwxz/upwhZRM4SWPc4G79U62j7HmgwAWX5cdmy45jOWVge9s7MXXE
         vud33UE9CPZ/DJzF0yuadtgStlwo0MgIurCnJotC3bUjbTZWzq9zLptPX5MaKUJfc7lK
         b5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792433088; x=1793037888;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wrt+8PhfRlQSNIHgSD1lLTqm3eQcjLp2HLFlGFUSVTc=;
        b=hW10/JzfNz9BIBp4j4/NEu8aLi4gelAR49wjlf3dnRtUK6g9e6rYjJKFdjHh9CTe+O
         ueNB49ST/uQJyi+AO/0h7cgNaXa6Kza8ARYANnYRsv2KTDKfDBQXTCqt+hrDp5nR6a+U
         JcBdSoEbfl1HXBnc2FT/6nUM8PuDePpG1o4J98+t+pGiMZ0kn5yzB5/8ikiv6VJigqyC
         Mm0dMGfO3FFSV6pN1EzKvtM5TYnMkfnUJZz0D/qtnylumHUd20MVQv6/0XyHVhAyTjnn
         ccL7YRK/jZD/HkDNM1CvN85rqSDbd9hyemEJsGuZlQD8lQDXh9jpxFFV74YpcO2R1eY9
         q8ww==
X-Forwarded-Encrypted: i=1; AKwUvBwPOqf8FxBk+UYlKmIaLBDdTlylcitQmme7pSqB/9e+cjY2g2arsQBEEQU493XxwAVtSwU6hBBMpyAVzvc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLA1CVj1pmrf4C+vku3ax3j+WjT+jUGb+Dy2FbO99pl8Xrxa+DG
	ElC1yApuMK4ttBo5fna5tJiJ91IKll100P5Kx4RBQGDuYCVF0Spp0ltYFLIC6mF06RxxtK4/q3C
	L/YS5umcIwRjRwZgRwGzuiEurnv/0HDI53oESc5JPWw==
X-Gm-Gg: AYBFou3WpDjcLIL91ZSelg0oC3FOYrNbWyw36pjDnX9V5Prh280S6cuIAva42LLHPcV
	yEHFHtyWLF+HcTTBMjp+XDJMaMJ30s0ZY05GERsIM+QRl/p/VKCoy5qZERoE5mKdnpQjPcxs6Yg
	6CvEI/ovjToL9TbDC2uZNScgOREq9aS4E8JGspbudlArkcPhTKzMjHd0M1v+s7bvD4WAX6qQjJD
	v0wKYB++oN7Oj+tEOyY6KLOGlUdzr7Bfs1s1ty9gPzf/MUv8uCyfZwEBOpvYDUhdJUnMeDSfsOY
	hyMNxhpixVQ9FpyUsTvByWyLk5GjyxIWzI2SRQH804ujs9sKHgEKjQGK0O2aCHdPyeQeOpzRPnt
	g2bK2nFTuk/fmL/zhMiR9WA==
X-Received: by 2002:a17:907:c008:b0:c2d:d408:5d9c with SMTP id
 a640c23a62f3a-c41a0ad38b3mr520648366b.48.1792433088240; Mon, 19 Oct 2026
 11:04:48 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260605105513.354837583@infradead.org> <20260605124052.227463677@infradead.org>
 <58dc8e8a-7260-43ce-aebb-8d9c29a6afc9@okonski.org> <b1002150c3e4f877d04790cd8e85d2149d17722f.camel@gmx.de>
 <atZM6uF0CqCNh__I@vingu-cube> <f1d0fc39-6939-4fb3-a422-273cd5c347c4@okonski.org>
In-Reply-To: <f1d0fc39-6939-4fb3-a422-273cd5c347c4@okonski.org>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 19 Oct 2026 20:04:35 +0200
X-Gm-Features: AclHuK-WA6ulW37B9epeQPoOoobTWCftnzK3P09s14_KqVaqbBfXm4ejwIcrbiM
Message-ID: <CAKfTPtB_gMM7axqM167_Tb=WiChskGPXFDgQ4YjVz4Bj+ZiJ0g@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] sched/eevdf: Move to a single runqueue
To: =?UTF-8?Q?Jakub_Oko=C5=84ski?= <jakub@okonski.org>
Cc: Mike Galbraith <efault@gmx.de>, Peter Zijlstra <peterz@infradead.org>, mingo@kernel.org, 
	longman@redhat.com, chenridong@huaweicloud.com, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, tj@kernel.org, hannes@cmpxchg.org, 
	mkoutny@suse.com, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jstultz@google.com, kprateek.nayak@amd.com, qyousef@layalina.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 19 Oct 2026 at 19:36, Jakub Oko=C5=84ski <jakub@okonski.org> wrote:
>
> Hi Vincent,
>
> Your patch fixes my cpu.idle test case.
>
> On 10/19/26 19:01, Vincent Guittot wrote:
> >  /*
> > - * Preempt the current task with a newly woken task if needed:
> > + * Preempt an idle entity in favor of a non-idle entity (and don't pre=
empt
> > + * in the inverse case).
> > + */
> > +static bool wakeup_preempt_sched_idle(struct sched_entity *cse, struct=
 sched_entity *pse)
>
> This should return enum preempt_wakeup_action. But with that change, on

Argh! Yes I moved from a binary to a ternary value but forgot to
update the prototype

> top of 7.3.0, it still regresses from 7.2.9 if you test with a nice 19
> spinner in the same cgroup. I think it's incomplete.

This patch only aims to fix the sched_idle task group case. I will
have a closer look at the nice 19 case. Have you checked the different
cgroup_mode with nice 19 ?

Vincent
