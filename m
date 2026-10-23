Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792765986;
	b=TiSbbYOyXN/ZhQFVv1+5/v/HOxemOoYXfqSnPXdCG7QnYVQDHK03qfAf77WK1Rv57w2O
	 in4e0z5U7/kTn1zYmXGmCfPowdqPbXid8fSOD4zEJ4eSUhbwisMG+aEvy99GsgnQ3WxfA
	 BzlmoFxa14sVk+PTd4yDVzOKSJbCpkQ+/EkB+VUQTDbQAsYONc+p/diKPcYM+kTYMMc4/
	 9Mmt/u/oguBsapIqCIC4v1fcXtR3I9egiYi5xV8tCc33kjF9wozzlzg0PHupX7RlWiteS
	 yhGkF/HU4Rx1zSMDwx28yK9RmKQlJPboYBzvyvrjCC6H6nqJojY/JD9MJRY30HjDVFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792765986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Z9n1+s+asPmDaBeXYRe4kG+xpLIMptFUgjTnOa8GCY4=;
	b=l1OXlL2G4XYYsZ8+5CKAZ+eeIqj8ORHE+TAwThj8e6sh7KvUWYlIkXy254r/be5vJHSc
	 NkK9Hz4uvDrB8tOxPP4rh07bTQwFb2kqAh6kbMO1JPbZ9IBlZRF3JTJZDKvfg7wF7Chbm
	 P8H36URgulxkv1PR+eaUUraHop9wP1c0rx2VaDRouAaBMoeabbaBYdlgeJHYaeJqbG7DB
	 7gn02RmIFzb9k4k0MPcJ74PkVwVndM/CZoEwGdhUDZmytoYGSX9vlCcDgIt59kaCa1Gen
	 4oj+v5VRfCSBRQYEKdnB9QnhszgUxw28TvCx9LNsV8wgU0XmEFkzsFTcYSi+bovZ0lg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=fsdGyEoA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43975606A323
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43975606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=fsdGyEoA
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso9208895e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:33:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792765985; cv=none;
        d=google.com; s=arc-20260327;
        b=lwMw4h8usdm+q9yBfwaVcvLMU9Flk53IaqWLez1HGJtJBxr/wva7boXJo4PpSpocKZ
         oi9mZGijWeLhAfA8Kv48yGLVCmAMHi+HuHHpuRt855Uhey1o1Q1/uFqRu5Bxhbn2bKKP
         hfa5I6n1kF67OONjzjX0QUf6MzHP+zEPPzoQsg9MTQuo9jnbXGiwRyz8o7yv5Fy/fH/p
         ySvRpGcf0+iwIkEKIxS7MLYh/BIOlGUr4dZQE9Zqb3zvOPChAVSFcn+SCIWPQnHVX2mi
         fgCoQ1+SukTk+ScM+E15iLO5IbNfrtSVUVkTglFVbxmnxuthcvYezE81+cz5A8Eq44NE
         cldw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z9n1+s+asPmDaBeXYRe4kG+xpLIMptFUgjTnOa8GCY4=;
        fh=cjZzARdu/P/CU7ZPR/oMjvvRWu8SDJaP2OGn22lwiew=;
        b=kVBINLH091+gg8l+ZQfAOQkqmugmGYvHDt0yt7QDBgSbzVDqHpekplkUgY4ynQyLtK
         u7mrlxBfk3B734wN7fSVkPEO98wm13S7SZ6zPznHzQFP/DL6kVrbwUKGkZNC7Ifcpjo5
         0UUNqmIRSXhea22xpTu/Ti7BDk8F4FMcybWlLsVrIfnLjNTmCcKtwwFJrBbHsV/LC2ei
         Cqfv6Gs4A2vEG6e7eTBPVg11oRr3cjFwwBRHu6LjUNDt0doWzddW6/jTslIhxU72SWhF
         wkEGkN+DvrqiPfjyi5a/O7k8QKQFo9EatDwtuAkFBzXFc6pnHMc8VNb+VLaWOK2Cea4e
         wMOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792765985; x=1793370785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z9n1+s+asPmDaBeXYRe4kG+xpLIMptFUgjTnOa8GCY4=;
        b=fsdGyEoAoNi9GphXvUJSQQBOizAj9ksNPCJJQuwHlnd5RHHQYkLbpKAoY+uv1IRLzt
         TWuzRRQcxFpgyKv8WFbBHEMHLpHDP2AnNMWQGVIOtekq5t95HCYUjreXwL3LiUjc1y+F
         7yHfwFi+WKk2nBx65TJ57AXzxvo/lHFdrKxzdZiBUbCk/YlcxhV7XeshEFqoug08Z8cj
         ZGzf04fBpN/PcNy3wzdqdgS/Cc7pfg5S2sYcs2naMHWnBYLR+o98FckX8aQ5fwumOaCg
         cAuR+uPp94mAvN56rwKYB9IEgiS7f4Qg6wGQ1UMNbO/v1iBP2GG9Qk3JX3U9OL750701
         xqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792765985; x=1793370785;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z9n1+s+asPmDaBeXYRe4kG+xpLIMptFUgjTnOa8GCY4=;
        b=BWj5ENqMloJTO23Bn8vlvBc4ePW/G1CUhaKMdHc0vtsAFj7A1Jle+EoXM4+oZVq+9I
         giUuEw9qHToUsjzmNYs5G4crKJMHWxVRW8sCHV7xnwlivt9Y71VqznPBfdapv+Fsev0U
         DS/v9H7lbpQc2vIJywUIsIJJ9nvm1X00slJQs8PXL/Z6ZuH6XwihgDfaNd/71yW18KPG
         L/inoW4g//Ft8b9YJlYbgCvlk/mqe8wgHx6ty/wWFkkxok/KV1FgmsIAizg6nrPcjO2b
         iP9DGjwvcbTE8Kft6vfJ4gTW8RthV37s6MfPQ7th0vlmlRkP9yM68NruayU35SIfoRaN
         e2Zw==
X-Forwarded-Encrypted: i=1; AKwUvBxydlyzJdCuVo06iOblxs2b5emXp/Le6sr36hDaj9qrJYEbOuCQFXhIn2+zylh8lWkNCP5DANaaUvz0upQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJ7Th8qZ+ylx78zB13gylmbAiQvyQEJ9Sm9bL/iZKh3MG3TxMm
	CRp8OLtGDUWFq22i6q3kGMNmx5HRJwkLihE2RlrhnUEmN4FgT/IFSMLsQw7r+5OH5svwS8bjYiG
	Dq1bvWOejugtwR+gNG/PbpO9cNwQHG8/EN9aA8F+aiA==
X-Gm-Gg: AYBFou3OiOGWla2gOkISv9m3HZFfyQc8I8q9FUhMYolGseYVmf+a4Q7Dh3Up7qrZg2Q
	6PX6gf54pJl1DNCORWMc59HHhSXK6YzP+0IDcn2dpcF7SSodenjlugVAY7FiQF2TPgCHDTn0cP1
	Aq9QQxav9rWlqVEW5RxzoJ8SqlcUppvPS2drzEn+QguXIyhGtfJplOQxw87lUJEqouavwt5oCle
	/KzGN0vqlshwErbBM7wJiCGHMgd3AMcZ3tG/R3XzRxjTscB4O1X67Jlc8ipO4QtR/e4lqfcaUSU
	8zG0h457P4CV8yC6p8PJZusJDGXW5aoUILXWPq4R6TYXZaEwBP/cG4nI1ZBeglWr0YW0gTYv/I2
	iULtuME1zGCokj/QkpOMGIRmkRhyTtwhvqZ49AEBOfC4H6tcC1Ao9GDKAwcAfQRQJxBN5oZrsPy
	mbh8oLvWv48jmzOXxl0PCHtkk/RQUkYqMxzjL2X3qWWdoIrBHWFoAerh41
X-Received: by 2002:a05:600c:1392:b0:4a1:742e:3 with SMTP id
 5b1f17b1804b1-4a211ecf2d6mr37791005e9.27.1792765984553; Fri, 23 Oct 2026
 07:33:04 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260807-counter_delegation-v9-0-58658104e487@meta.com> <20260807-counter_delegation-v9-15-58658104e487@meta.com>
In-Reply-To: <20260807-counter_delegation-v9-15-58658104e487@meta.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Oct 2026 20:02:52 +0530
X-Gm-Features: AclHuK9X4t2_Wp-iA3viS1hPfBa-r77osa46AUeHd9u6gOQJy4rh2geNlywyhlQ
Message-ID: <CAAhSdy1zHzqf0Ozgoz_nT81_tjg6ojsNgGQMUpeXNaJ6AN4yug@mail.gmail.com>
Subject: Re: [PATCH v9 15/20] RISC-V: perf: Skip PMU SBI extension when not implemented
To: Atish Patra <atish.patra@linux.dev>
Cc: Will Deacon <will@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers <irogers@google.com>, 
	Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jiri Olsa <jolsa@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	James Clark <james.clark@linaro.org>, Namhyung Kim <namhyung@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 1:40=E2=80=AFPM Atish Patra <atish.patra@linux.dev> =
wrote:
>
> From: Charlie Jenkins <charlie@rivosinc.com>
>
> When the PMU SBI extension is not implemented, sbi_v2_available should
> not be set to true. The SBI implementation for counter config matching
> and firmware counter read  should also be skipped when the SBI extension
> is not implemented.
>
> Signed-off-by: Atish Patra <atishp@meta.com>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup


> ---
>  drivers/perf/riscv_pmu_sbi.c | 55 ++++++++++++++++++++++++++------------=
------
>  1 file changed, 32 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index fd4bf8804c9a..f0b8b6eff2ea 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -493,27 +493,32 @@ static void rvpmu_sbi_check_event(struct sbi_pmu_ev=
ent_data *edata)
>         }
>  }
>
> -static void rvpmu_sbi_check_std_events(struct work_struct *work)
> +static void rvpmu_check_std_events(struct work_struct *work)
>  {
>         int ret;
>
> -       if (sbi_v3_available) {
> -               ret =3D pmu_sbi_check_event_info();
> -               if (ret)
> -                       pr_err("pmu_sbi_check_event_info failed with erro=
r %d\n", ret);
> -               return;
> -       }
> +       if (riscv_pmu_sbi_available()) {
> +               if (sbi_v3_available) {
> +                       ret =3D pmu_sbi_check_event_info();
> +                       if (ret)
> +                               pr_err("pmu_sbi_check_event_info failed w=
ith error %d\n", ret);
> +                       return;
> +               }
>
> -       for (int i =3D 0; i < ARRAY_SIZE(pmu_hw_event_sbi_map); i++)
> -               rvpmu_sbi_check_event(&pmu_hw_event_sbi_map[i]);
> +               for (int i =3D 0; i < ARRAY_SIZE(pmu_hw_event_sbi_map); i=
++)
> +                       rvpmu_sbi_check_event(&pmu_hw_event_sbi_map[i]);
>
> -       for (int i =3D 0; i < ARRAY_SIZE(pmu_cache_event_sbi_map); i++)
> -               for (int j =3D 0; j < ARRAY_SIZE(pmu_cache_event_sbi_map[=
i]); j++)
> -                       for (int k =3D 0; k < ARRAY_SIZE(pmu_cache_event_=
sbi_map[i][j]); k++)
> -                               rvpmu_sbi_check_event(&pmu_cache_event_sb=
i_map[i][j][k]);
> +               for (int i =3D 0; i < ARRAY_SIZE(pmu_cache_event_sbi_map)=
; i++)
> +                       for (int j =3D 0; j < ARRAY_SIZE(pmu_cache_event_=
sbi_map[i]); j++)
> +                               for (int k =3D 0; k < ARRAY_SIZE(pmu_cach=
e_event_sbi_map[i][j]); k++)
> +                                       rvpmu_sbi_check_event(&pmu_cache_=
event_sbi_map[i][j][k]);
> +       } else {
> +               DO_ONCE_LITE_IF(1, pr_info,
> +                               "Boot time config matching not required f=
or smcdeleg\n");
> +       }
>  }
>
> -static DECLARE_WORK(check_std_events_work, rvpmu_sbi_check_std_events);
> +static DECLARE_WORK(check_std_events_work, rvpmu_check_std_events);
>
>  static ssize_t rvpmu_format_show(struct device *dev,
>                                  struct device_attribute *attr, char *buf=
)
> @@ -712,6 +717,9 @@ static int rvpmu_sbi_ctr_get_idx(struct perf_event *e=
vent)
>
>         cflags =3D rvpmu_sbi_get_filter_flags(event);
>
> +       if (!riscv_pmu_sbi_available())
> +               return -ENOENT;
> +
>         /*
>          * In legacy mode, we have to force the fixed counters for those =
events
>          * but not in the user access mode as we want to use the other co=
unters
> @@ -999,7 +1007,7 @@ static u64 rvpmu_ctr_read(struct perf_event *event)
>                 return val;
>         }
>
> -       if (pmu_sbi_is_fw_event(event)) {
> +       if (pmu_sbi_is_fw_event(event) && riscv_pmu_sbi_available()) {
>                 ret =3D sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_REA=
D,
>                                 hwc->idx, 0, 0, 0, 0, 0);
>                 if (ret.error)
> @@ -2132,12 +2140,16 @@ static int __init rvpmu_devinit(void)
>         int ret;
>         struct platform_device *pdev;
>
> -       if (sbi_spec_version >=3D sbi_mk_version(0, 3) &&
> -           sbi_probe_extension(SBI_EXT_PMU))
> -               static_branch_enable(&riscv_pmu_sbi_available);
> +       if (sbi_probe_extension(SBI_EXT_PMU)) {
> +               if (sbi_spec_version >=3D sbi_mk_version(0, 3)) {
> +                       static_branch_enable(&riscv_pmu_sbi_available);
> +                       if (sbi_spec_version >=3D sbi_mk_version(2, 0))
> +                               sbi_v2_available =3D true;
> +                       if (sbi_spec_version >=3D sbi_mk_version(3, 0))
> +                               sbi_v3_available =3D true;
> +               }
> +       }
>
> -       if (sbi_spec_version >=3D sbi_mk_version(2, 0))
> -               sbi_v2_available =3D true;
>         /*
>          * We need all three extensions to be present to access the count=
ers
>          * in S-mode via Supervisor Counter delegation.
> @@ -2152,9 +2164,6 @@ static int __init rvpmu_devinit(void)
>         if (!(riscv_pmu_sbi_available_boot() || riscv_pmu_cdeleg_availabl=
e_boot()))
>                 return 0;
>
> -       if (sbi_spec_version >=3D sbi_mk_version(3, 0))
> -               sbi_v3_available =3D true;
> -
>         ret =3D cpuhp_setup_state_multi(CPUHP_AP_PERF_RISCV_STARTING,
>                                       "perf/riscv/pmu:starting",
>                                       rvpmu_starting_cpu, rvpmu_dying_cpu=
);
>
> --
> 2.53.0-Meta
>
