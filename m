Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792478805;
	b=Tqi+kzlN2bFIobTUlmfjmJEaSR8bBk1CHzY6kcGCsKXCOFWBtVfleI2GVEk8PGxDrzaF
	 Yt1/qun22WtmiSmiVDhxuuwc/QE/84KqmNguNh0I03N1iaZb+xAVVPjTsYiBvlGXVjIpi
	 1yo8fPDJ1Myp1pe7UAjPWLytPRZ1+6ltMrHSRMo8XIUd1IfAvWUqbJbTLOMW1vhHjus46
	 O+jIbeZPcQ8rzjJphHW0MQ7tt+8/ncp9YgHJQ9cTiGUq3IHuWiPaDSpiWBiDCM8cvxopQ
	 t4ckc6ycUlAdYfmhC1F45smquse5+UOgSY0S4ZEp+C9dTuuMdJrNh/RLRbaygX7GE3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Gp9kC/jyVCXmnkxT8i7jFkbo//t/pF13KkkUzx3tMqA=;
	b=mjtqpaxlPvDXNiU8N4EOisqXWPRpkVzuc5En8wRBF3ztx96C9Iqy8r/XO+hi90bRSwam
	 At+ra0YJvHBE/+XbAwogDGwZ7xm4IpJOBUr08eCnOnsS/WQLq7cQYJL1VfQu5hu8PlOtG
	 HNr4U8PACj67/o6ZrVlJQ3UvLUxaXU6Y4czRIx2xmiRQQf7oBALRuDwZfdPIfQ+V1b6Kc
	 gEF9ZHfCLwnd8bQoZGLWVGou6sm3jkUb1R7cczAe226hdObwNz1b+RKMBxgLKuTBft/E8
	 nYd+S9rFjuW7A/4HkoCE47g17tQtgGeTbhdV5Rl7S6t57GvsqIz2FAUclWiKtTwot4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R6pFlZph;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07044606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07044606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R6pFlZph
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1d75f2f11so19703785e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:46:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792478803; cv=none;
        d=google.com; s=arc-20260327;
        b=rtw7tiH8Nd9xt/gc39vCPwUJBHb/zrx/Xun5ZPTYnErvC31btmDd3izdknRYy1QP+c
         No+X8r7gWCMI/qrvl8E/erE09UVbao1OEfKUzD+kg8nHkIXMn7lYnOnCq2vgdHP39I26
         HW14ANaoqLg3CazSw5JGCt7lOx5ZWMw7yCUS6vzhZy3+TtuWVFoDxozDK7Nl+fUeJpTd
         9bsIQxqPxdNgL1OKBpbVaGcxtPuErTB49GpH1aQ1AvsPIV7w5yykJVQbR9cQO/vWoTtl
         EQFoAfc8cS4bSL6hjUOToOnUpAkFEuTS8Ik3L4OSL7aOREkzgqW80mG4zeW9u2syD/PB
         0lXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gp9kC/jyVCXmnkxT8i7jFkbo//t/pF13KkkUzx3tMqA=;
        fh=XhNRGOtQXRACi0bqsnQVjzLtRUnIoTfzBi6GMLl1jIA=;
        b=HWxb8aCJCIfSxZSJtDAWGCQgqdZlxCCjl+EV+gtKdUe+iwEzoElSaai7+lzRDelc5k
         a7nTrE862c/ZsAxQotHMVlYf5x5j+SNFM+cbaiuZEZ8X09qcx5uqSh6g0BKiPpmHK6c0
         a1Xh1VjASEw8QBgVkLE0TWWpTkVHFw+6eSjptyFfabiRZzt5oJv+r3VrrxdKhSwyPnbI
         IpIDDtTbXG6LHSG09fAAYO3tHtiQqf0iURIFZtzmk/4u9hIFU04+Ed/WYANEbfvl8cKF
         +M7fw0GM18WNKNhTmHr+l9rX91KMABFNR4lapcJIkdnymo4f3Nv4EPVMpuxQN3cBCAYn
         Dlew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792478803; x=1793083603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gp9kC/jyVCXmnkxT8i7jFkbo//t/pF13KkkUzx3tMqA=;
        b=R6pFlZph1Mri/k7GyIOxP8kN3IrOWiNY0RqyJZboqcTLNn6JezG9ntaHqYCEkcD0WR
         z2O4Ie21Hv89hyDZv0a9kI3KKhKKs7NvxU9uBezhja6yAVDlA2lSZtzPVszBkChzlO/s
         o0YwcGlZdMjOdmHNKhua1ys9ni70RvLTQ12CVAvDQCi6x16DhaCbWU/73oe63KOYFSsU
         FZ1jyCcp4DTDvebapz4Gtvdv0XrVhJG/6OmFG1VDIynMOOfK/EoQ2PDH+VARvXUP3qEP
         ZR74ou6T+ZcGc2v8VYDo4JjUrXlo03U0jeO7hHnBuSsFYBZZHoQCt4ktcQiwZpl8/1N1
         9t2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792478803; x=1793083603;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gp9kC/jyVCXmnkxT8i7jFkbo//t/pF13KkkUzx3tMqA=;
        b=uqtPddvHdEeO/fFuG057ckAHYk7IurH8e6kJTfQ+QpMJ8/9gR6eR1FV+HFBUMfFgz2
         serb4CMZ+ZB3HWjofCbG6h5AnXFLcn7OZldydw/v74Kh1eZypkCQ/efSp6vTl3P2lD5e
         Xdc586xfg3QpZd7+6atBskgzEScwhdJSwGMJg8QvMYaMlTcrESX97uUhXyaT8oGMWFKQ
         87tS5sRWQQYE6xA8QPvAsV2eYqvN26f/77UD5+HS4fbD3EIoQRp4hl3BFwzYmL3kupVb
         nA2JxvR15YgBSL4/22PT8YWElsLN8MU4GgPmMNwctr3QgFIEkd8e0mjmMQfe632obbtn
         X1Yw==
X-Forwarded-Encrypted: i=1; AKwUvBzvpHvYHUbRcfv9eXPpzpXR7hgbNgjtb+R5Ld411EAc6yMUzQ/4kKP/LrNopD7kdX+j7aJtTiQZiaB6vUQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLb8O6DUKhFnKxLKHJdyk0iGKYgMe26aLom3YAc4DkBfUZXk8qO
	qKJUGrr+XItD4bdD3LAzkDse79PbRXWoVx74iGny9RalC1HCAxKv200i7/Kb72bR9lDkZiqoQg6
	9TtxDlGaWgovAR7CPXzJeoiC0T7YfbcY=
X-Gm-Gg: AYBFou0StGJJPF5MDTMwHgpFch+gDVKIOi5ZD4A2i2s/xUq5MolIjn7A2o/pBjLZkff
	HvtQx8ku4cudhyNOY4SVCl6C6Ddb93aF/gns8ZqHrA55zsp4P1ZoKoVMcqXGcpz7+JhChbOCrNF
	cI2t7Cyghgn/cHFlaRbYUc+yEVGlLtIJbMfdU/vHMyZ++C2/yjse0BVK8ES2QJr6PjLsDK4s4R8
	jhgalABu8l/GGm/zBvYytggTugVJPzRtuJ87ks01jTOMn7dOrttIoJYwEDf26lU24GlsKJ9WmFE
	QGUpdoyWI43RcuDwmirhMsv9jgUhrLXAsJ9E9ZNVTUQ9ukB3mma5eT0DI/Y62o21ayVStXZ8wtx
	tm09u+/BO/jjhTQ==
X-Received: by 2002:a05:600c:1d05:b0:4a1:bd69:526f with SMTP id
 5b1f17b1804b1-4a1d75ab235mr196204085e9.4.1792478803164; Mon, 19 Oct 2026
 23:46:43 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261003-damon-perf-rfc-v3-send-2026-10-03-v3-2-0f00417b41bc@gmail.com>
 <20261004091023.630362-1-kunwu.chan@gmail.com> <CALa+Y14isN3HmsY9Mgtdi3O3zxOH33uTtajSbJcxm9FO4Uon=g@mail.gmail.com>
In-Reply-To: <CALa+Y14isN3HmsY9Mgtdi3O3zxOH33uTtajSbJcxm9FO4Uon=g@mail.gmail.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Tue, 20 Oct 2026 14:46:32 +0800
X-Gm-Features: AclHuK_-zTMbJ1JCgYu1ZQ2d8ma027-PdiCf5iSRex2YzMdvVgiIPMhM3aQsSmk
Message-ID: <CAN_Opa_LJNTL5VwjxvWfFuC1dqNa935Aqu9fEmkCJxwOx5oNKA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/9] mm/damon/core: replace the access report
 buffer with per-context rings
To: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Cc: SJ Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Gregory Price <gourry@gourry.net>, David Rientjes <rientjes@google.com>, Wei Xu <weixugc@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Bijan Tabatabai <bijan311@gmail.com>, Ajay Joshi <ajayjoshi@micron.com>, 
	Honggyu Kim <honggyu.kim@sk.com>, Yunjeong Mun <yunjeong.mun@sk.com>, 
	Akinobu Mita <akinobu.mita@gmail.com>, Lian Wang <lianux.mm@gmail.com>, 
	Kunwu Chan <kunwu.chan@linux.dev>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 5:11=E2=80=AFPM Ravi Jonnalagadda
<ravis.opensrc@gmail.com> wrote:
>
> >
> > Hi Ravi,
> >
> > I noticed that ring overflow drops reports and updates an
> > internal counter.
> >
> > Since hardware sampling is used as an access observation source,
> > could userspace get any indication that reports were lost during
> > an aggregation window?
>
> Hi Kunwu,
>
> Not in this RFC.  While developing the series, I used a developer-only
> commit that exposed these counters through debugfs, purely for my own
> testing; it was never meant for upstream, so the RFC keeps only the
> in-kernel accessors that the kunit tests use.  v4 [1] is the same in
> this respect.
>
> > Without such visibility, users cannot distinguish an aggregation
> > result affected by report loss from one collected without loss.
> > This may make it difficult to evaluate the reliability of the
> > observed access information.
>
> I agree that userspace should be able to see dropped reports.  Two
> things to note before exposing them: the counters are global per-CPU
> counters today, not per context, so a per-context interface needs
> per-context accounting first; and when perf throttles a source,
> samples are lost without any drop being counted.
>
> I see two options:
>
> a) a read-only file under the context or probe sysfs directory, once
>    the counters are per context, or
> b) the drop counts through a tracepoint, per aggregation window.
>
> Your PMU-agnostic observability series may be a natural home for (b).
> What do you think?
>

Thanks, Ravi. Are you referring to my earlier
'mm/damon/perf: observability framework for hardware-sampled access reports=
'
series [1]?
[1] https://lore.kernel.org/all/20260818061031.827057-1-kunwu.chan@linux.de=
v/

I developed this framework and shared it in case it might be useful to othe=
rs,
though I'm not sure whether it will eventually be merged.

The tracepoint option seems like a good fit for that work. I'll think
about it and share
any ideas I come up with.

Thanks,
Kunwu


> [1] https://lore.kernel.org/all/20261005-damon-perf-rfc-v3-send-2026-10-0=
3-v4-0-b03452e137f3@gmail.com/
>
> Thanks,
> Ravi
