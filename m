Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D96395AE4
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 23:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789426959; cv=pass; b=YMW5WppYV4E6rsVBFDb1SrCCmurFmceXIaFg+fkIjGG04BCWUeZ+qwl7+9Nj2T53aqNc/mhcHpTKj+5ApaCCsSplXO4YtnQx/6P/YfgK3gwoRsMna1unuVKFXQd/9Ek6aAZQSHta8QLTnFxh4Qs/YaxFIRzIUsWWK+RXmQstXMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789426959; c=relaxed/simple;
	bh=HnZj22pjlGHIEfM6bhLJdkIF85ojkiFcxZaEA0PyVZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t6EGNR4y1PZEfl347Lva842mrJ0JCBpO/W/8xYJpTh+FCEDHJ9Xls0htlJCy6KEZobUitMFr/n3cA+/crEtGwzSPjmN/IgeIN84pLK1g2RcIsvrD1hcVVMonQ+GoKshsHAOZR0yzda7IVaBXfA2Nq0B1GMMUWUWZQek+0gRVVRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=njLUo9f6; arc=pass smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njLUo9f6"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-8049e44d0c3so3594977a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:02:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789426956; cv=none;
        d=google.com; s=arc-20260327;
        b=QPbu6XVsCohvwkqYuQpXFBHcaeGA4G0HAo9L+p8OmtiMswsaoIh/MSH/cmTB+KJsEK
         4/G776PwC/3n7pj96htbe0oJSyyG7Y7oo35PXEINA1Glcj+/lqcobBOBjikktN261f2O
         ryGUnub4RPQwMb05BReP9y7lw2VC0kGl2oxbTuL0pJ0fQxw4pcj/fRakBY2+YKVEctWI
         OPgHJJsbyY67274ZVaHI6Fm9a9RpSx2qwj3pxCf/WChU19tMPKg72/Z5HHjYpcXIqgFt
         loLMybqQelj9wRmlA9LjUDGYHwEK1+77uo4FOe/AkrFeQycXioFr3exf+XIWpT4LZceK
         UoPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pOUFKWLA82ZDA522DpGzRiQP4xIkyg70D3qyVuxPWKQ=;
        fh=LBaB9kizGZcm2IKSPduf95KLu8sxMUzp4Ze9rMaWZJU=;
        b=a/pHc6IQmTUxiioqIw6m50TWFB/TOjgHAT8DDuc1AcwiUROUKzBdcwxdhkq9bNn2bA
         pTfJkJmT/IrjrW1RW3RT3Nb8PsdMLcKWn8NVvmw4JpoZm2o8JLTsPkcvEgK/Uej+6kn8
         fr9/zUj8QAxVKvre5hIZcFBkHYM30dv+ZsxLtx4I8ZYpVLJnOfmAMCzRkBo4TOg8NmSZ
         2GlM1524fUfLcUucgUlL7dsgdRQz5eePH3W9jF6P/C+81dOiE7J0Sc7uUh/bqVTzVpkh
         VG7WGk9167V43eSP/XtTOLL7HlwTG0GWiEQNo8UfoKwhcgTU3R2M75AIsewjnlKiGNvO
         K1Xg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789426956; x=1790031756; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pOUFKWLA82ZDA522DpGzRiQP4xIkyg70D3qyVuxPWKQ=;
        b=njLUo9f613ETcTM0BuZQ/4VcFKGxPrUlgbNcdOnqGn1fpgDzwp1a5Q+vdz6tDUJDrZ
         McuIdpwa0U1GX97oEpWaoSnjchGBZ7wpohw1URwfNZm95eWAWjrRuVaLSWzierLNoTi0
         07PqvdfTBb0sG5IDKXJU5B3jrSJ6LT5fF7Otz6TywYI0cAVi9GHmD5F73G7dSpsA0/UK
         C8Nev/wxrYSqIl1F2SGoL2XAUbw5kndaG/pvZsUAv+fIpulOoU6upAXBL1e4JR1qFzfX
         fdlzqM4JazG9sFpLcubUSpj+hVWNfnpd7fZf5lthjq/189Fw0GAzdh+dQQXrgjGoldfV
         9qFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789426956; x=1790031756;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pOUFKWLA82ZDA522DpGzRiQP4xIkyg70D3qyVuxPWKQ=;
        b=M9t1uZQI0AY9WiL31F796xVeyEbITk8wfhtCpPEMIsjHRGpdsiD5a4NYrbsUrVoA4A
         PDtVBvJdItoUPmbRjdgrUe6T7c1bYC7pR+4VcIgqNvyQB5Na8Q/KXrnNeeveIxcU+nhI
         mZ4G8AZ5jHj0nIaYsZ2LWLql1rWS3p402rVZpjehy/B65pFX1kyHayNNUQaWGL1X4ZEa
         9bb4R0++Mf9bZs3/Uu66jeIW9aCQPTvNv2BSNxgWumLecvnPA+JuAJQ7vhI8KfZv7jzy
         0e7lveDghNad0f2tNgspLBEEDaT/hJG84JoJaYskMhVaXg86o8BydADFHUN+Ag6ffj5v
         Jneg==
X-Forwarded-Encrypted: i=1; AKwUvBxRqBAw6Yr3hHl9zxUwqIHdq7+RcCXxS1tI202EfknZUncbB0k9EhgrybysMaE/n9zQRTFoENnciOujeoc=@vger.kernel.org
X-Gm-Message-State: AFuF++lOQw/Sf7FkGr4V96RAuog7iOnvd8TKM7Tp7LwyQUAdnIfNrsnu
	vkK4xF7rNaQFbDuIXQOaKXYZuKX+UJpU2lHP8ZXyXr6xkVo9p1+CmxWj/OA01PlT+8doZbHaY3X
	Klm56xDewTx6yQolqStq40Vf78tBBLbM=
X-Gm-Gg: AYBFou0inVVCrIU4szbfbpNcWXQppBFTaN6Bk2nmIjFdN63YoHDF4hLWUNgKG11G0Mn
	ulx0s3CRr2o00EqwFhZCeFKSn55xEDfxHkVngHfPUABPFCdkp3As8C4OhSITZRlNp/iDZYCxHLJ
	7SKuwuY1ZHw8jw1wX8l3T5D4xscQH2+4e5sj7C5lscOswWJ86cHPkU5kGRmRK5cCKUvC/YFUiC/
	zE9LaPD3pe+Z5ft7pRiiBjiixdlty3gi0NNPDcenyPIS6E5HC/5HvGEoIriWGr1ASunK7MrjjnJ
	JbVdJ5RspZnnzprEOfZiqDPbXuPuKBpuZVLLNDFrmz8fnD7l29v184s=
X-Received: by 2002:a05:6820:2226:b0:6ba:1878:2a6c with SMTP id
 006d021491bc7-6c540088554mr2619502eaf.4.1789426956040; Mon, 14 Sep 2026
 16:02:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914073356.791518-1-cui.tao@linux.dev> <20260914073356.791518-2-cui.tao@linux.dev>
In-Reply-To: <20260914073356.791518-2-cui.tao@linux.dev>
From: Amery Hung <ameryhung@gmail.com>
Date: Mon, 14 Sep 2026 16:02:24 -0700
X-Gm-Features: AcwNN1VZkBQqQYfMVd7gQUm6WpRn7TeG3A6jO20_KXpKUTM9cv8b_LakI3YB1JE
Message-ID: <CAMB2axNkTS-UuH-KctiY+5qh-JZZkKsiyQr_KOnGJt1bPoL3eA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/5] blk-iocost: add BPF struct_ops cost model support
To: Tao Cui <cui.tao@linux.dev>
Cc: tj@kernel.org, josef@toxicopanda.com, axboe@kernel.dk, 
	cgroups@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, andrii@kernel.org, 
	ast@kernel.org, daniel@iogearbox.net, linux-kselftest@vger.kernel.org, 
	cuitao@kylinos.cn
Content-Type: text/plain; charset="UTF-8"

I mostly looked from a struct_ops perspective.

> +
> +static const struct bpf_func_proto *
> +bpf_iocost_get_func_proto(enum bpf_func_id func_id,
> +                         const struct bpf_prog *prog)
> +{
> +       switch (func_id) {
> +#ifdef CONFIG_CGROUPS
> +       case BPF_FUNC_cgrp_storage_get:
> +               return &bpf_cgrp_storage_get_proto;

This seems redundant. BPF_FUNC_cgrp_storage_get should already be part
of bpf_base_func_proto.

> +#endif
> +       default:
> +               return bpf_base_func_proto(func_id, prog);
> +       }
> +}
> +
> +static int bpf_iocost_check_member(const struct btf_type *t,
> +                                  const struct btf_member *member,
> +                                  const struct bpf_prog *prog)
> +{
> +       /* calc_cost() is called with RCU read lock held */
> +       if (prog->sleepable)
> +               return -EINVAL;
> +       return 0;
> +}
> +
> +static int bpf_iocost_init_member(const struct btf_type *t,
> +                                 const struct btf_member *member,
> +                                 void *kdata, const void *udata)
> +{
> +       struct iocost_model_ops *ops = kdata;
> +       const struct iocost_model_ops *uops = udata;
> +       u32 moff = __btf_member_bit_offset(t, member) / 8;
> +
> +       switch (moff) {
> +       case offsetof(struct iocost_model_ops, name):
> +               if (bpf_obj_name_cpy(ops->name, uops->name,
> +                                    sizeof(ops->name)) <= 0)
> +                       return -EINVAL;
> +               return 1;
> +       }
> +
> +       return 0;
> +}
> +
> +static u64 bpf_iocost_calc_cost_stub(u64 opf, u64 nbytes, u64 sector,
> +                                    struct blkcg *blkcg, u64 model_flags);
> +
> +/*
> + * kdata is seeded from the CFI stubs, so calc_cost is never NULL; a
> + * model which did not implement it inherits the stub, which prices
> + * every IO at 0.  Compare against the stub to reject it.
> + */
> +static int bpf_iocost_validate(void *kdata)
> +{
> +       struct iocost_model_ops *ops = kdata;
> +
> +       if (ops->calc_cost == bpf_iocost_calc_cost_stub)
> +               return -EINVAL;

This should check !ops->calc_cost. CFI stubs are used to construct
trampolines; they are not copied into kdata for callbacks omitted by
userspace. Also, should the reserved name "linear" be rejected here?

> +       return 0;
> +}
> +
> +static int bpf_iocost_reg(void *kdata, struct bpf_link *link)
> +{
> +       struct iocost_model_ops *ops = kdata;
> +       struct iocost_bpf_model *m;
> +       int ret = 0;
> +
> +       if (!bpf_struct_ops_get(ops))
> +               return -ENOENT;

struct_ops core should hold a map reference when calling .reg().
Calling bpf_struct_ops_get() in reg() and bpf_struct_ops_put() in
unreg() doesn't seem necessary.

> +
> +       m = kzalloc(sizeof(*m), GFP_KERNEL);
> +       if (!m) {
> +               bpf_struct_ops_put(ops);
> +               return -ENOMEM;
> +       }
> +       refcount_set(&m->refs, 1);
> +
> +       mutex_lock(&iocost_bpf_reg_lock);
> +       {
> +               struct iocost_bpf_model *other;
> +
> +               list_for_each_entry(other, &iocost_bpf_models, list) {
> +                       if (!strcmp(other->ops->name, ops->name)) {
> +                               ret = -EEXIST;
> +                               break;
> +                       }
> +               }
> +       }
> +       if (!ret) {
> +               m->ops = ops;
> +               list_add(&m->list, &iocost_bpf_models);
> +               list_add(&m->lifecycle, &iocost_bpf_lifecycle);

This seems to contradict what the changelog says: "blkcg
online/offline notifications follow the model binding, not the name
registry"

> +       }
> +       mutex_unlock(&iocost_bpf_reg_lock);
> +
> +       if (ret) {
> +               bpf_struct_ops_put(ops);
> +               kfree(m);
> +       }
> +       return ret;
> +}
> +
> +/*
> + * Unregistering drops the registration reference.  When the last
> + * reference is gone (no device bound), the node leaves the lifecycle
> + * list and is freed; otherwise bound devices keep it alive and it
> + * keeps receiving blkcg online/offline notifications.
> + */
> +static void bpf_iocost_unreg(void *kdata, struct bpf_link *link)
> +{
> +       struct iocost_model_ops *ops = kdata;
> +       struct iocost_bpf_model *m;
> +
> +       mutex_lock(&iocost_bpf_reg_lock);
> +       m = iocost_bpf_model_lookup(ops);
> +       if (m) {
> +               list_del(&m->list);
> +               if (refcount_dec_and_test(&m->refs)) {
> +                       list_del(&m->lifecycle);
> +                       kfree(m);
> +               }
> +       }
> +       mutex_unlock(&iocost_bpf_reg_lock);
> +
> +       bpf_struct_ops_put(ops);

Mentioned above. Doesn't seem to be necessary.

[...]

> +static const struct iocost_model_ops *
> +ioc_bpf_model_prepare(const char *name)
> +{
> +#ifdef CONFIG_BLK_CGROUP_IOCOST_BPF
> +       const struct iocost_model_ops *new = NULL;
> +       int ret;
> +
> +       if (!name[0])
> +               return NULL;
> +       ret = iocost_bpf_model_get(name, &new);

It looks more straightforward if iocost_bpf_model_get() just return
the ops ptr and ERR_PTR on error.

> +       return ret ? ERR_PTR(ret) : new;
> +#else
> +       return name[0] ? ERR_PTR(-ENOENT) : NULL;
> +#endif
> +}
