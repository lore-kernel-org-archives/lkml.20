Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792817397;
	b=IffYRfR2Xb4nHuNj9P9+teVbqC+jtjXKenTtuhy5c9jWlea/Bc6eiHW6zyGBevXAYZm3
	 qPXx6K+/sGfmB+CzG6mqVEMSMb2AbOPHCoK71C5oSVQIKB7W63nta32X3B2nAVuo1UiIn
	 WK3cN+OtA7MN9UdRFq+gLrmnVcJ3lOywuoUadLbAWH6iPIGuY4Iyw0JudcCNSZTEsN/Ws
	 vSFje5jwq1X5ArtEDrexoSTmjkrUvrbcW+KnsoHHUzp+iVx5QSzQpeBx/WvHgFRcu4CaY
	 yLRRle4vUfAV3U+/f1UftcjoRHgjs7ZTdyefg9526iAwaY8okDVDnNLi6ApSxrVdWQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792817397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YxBmcqUyq+7y7gmZ9dBOvMilScJYMeNzGz+wY+G2j1M=;
	b=O2zCy4Lvlz1axFo5HoGfRwZIWof7mzwSNThmtgY3wezkAP505NBv2TsIxEEmT6nDeKOK
	 HWN0Xrd8b2osJTLtgn0HSdPtM/gfT/BbZiQPpoa49MiMRZaHYrVeEXamyEWThaAX80wtp
	 zWZy0alI6Sg/9gbH4bdtulzYnryuCD+WSTaiN4Zsk9c8maUUO0DON2jp2TxKpbKIzUo2q
	 WPcckuuoY5is8ciVMPKoe3TA8vqm+VucKHjHHuJ56Z+z5F+vRGS6+6pxrQZGnvSGcFbhs
	 4kTFFo/8xdKxTTbVA8/412c7HPTijWgXVBEYXVDOxMWd0OLL5zcNiwPXJ1ls7/2sQwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b="dHk/WJ7n";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381A8606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 04:49:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 381A8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=dHk/WJ7n
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so9883255e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 21:49:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792817396; cv=none;
        d=google.com; s=arc-20260327;
        b=WPH2tnCrspkz1EwlJUWaqUNsXQwwcRP1POqBV3cIpBA/YpJXVSf5lcNzsiiwstxS41
         Vk9cr4Co8EYIEpbQi3pVJ20cz3f3qumEEN6gcwuSRy5sMBwgJptHATkZgZfjAftO9zG3
         gG5gA/Dv7zdBI4f7rocPybN9V4pzed8IjYnwU0SyMbFhSVjULUfvhcVVYH7MpBelc2vh
         ydAyUefOYMTeZvlgQMf1eBYpag8D1N+ArvDH4NduEfhdz1HXxmOWbvTAgQaoU7A8r2Mg
         45mQ/phwP9nmAtwOED6VpyEbsj3NElJIZphCRrN9SjXGN52skjiYGKgrnES75clD/xiH
         b98g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YxBmcqUyq+7y7gmZ9dBOvMilScJYMeNzGz+wY+G2j1M=;
        fh=M12wLtJj0kUTHORRyh6tQHraxtnAqe5GEzRqVr0mosg=;
        b=cUY3Ni894fJSpbfl0aypmmRghrU1wkbokb6EfvPH0xIJ5vmU21g30ntSp1Hzw8V9UM
         +fKE0IiZ2oFBFEqMd+gGnImuSqqKY2qzgps8oL7uRhI3tudWsyWkLo77LiJc5w+hywQ5
         zkuml87GMglQqgaFvw85CgO2opYccx1C80sWWQq7cVq/iOeK5clGrZNSu8d9f5OqPLjD
         BREi6nRfQ9PpvCYwQYTWA2SLAyKzCAVM9Bq4IjKLnl00uk61y1f4jhi4q8PCVLdFSS5L
         Axp8u2QE1fJ9nEPS2TLNlIMTlzcwN1jTW9jXYvmPRYhnyBqMqwMTwM7AyMNhaoAZdUvN
         A++A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792817396; x=1793422196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YxBmcqUyq+7y7gmZ9dBOvMilScJYMeNzGz+wY+G2j1M=;
        b=dHk/WJ7nuF4n6s5fi4NtyAD5I7nCSnSZIyyz3kynKii5OHyKDjuTV/+X4jpJky+Nac
         ia5LLsmnz3Br4W0QsB94Sd6cmdKL0RdNt5OGWpwv9MD0gtv51sH4VIYfm8c10yjRuf8S
         4/TQeWGGnjzQkplrHGNtnKdEGeCEk1RptYAiaTycXpSyF8nB67iDdCHPbk9gJIOjoj/u
         r3y85Stzb+OM312MlQJeV4AJo4FAWIX9OpPLcGumaCgefPg8DNgW6EGsJIfpnHu+TW0x
         CVaa9QDHVJ7zOp388zvtY5CGTpzEnjpFTOuEe30TIgg1SaIeNR1yNerUZB5be/qCW5j4
         To4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792817396; x=1793422196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YxBmcqUyq+7y7gmZ9dBOvMilScJYMeNzGz+wY+G2j1M=;
        b=LlJ0+k3zxDvICgswxO5uBAIKmCFaV1Umch3X5riQUFiYIyFo/YO0xF0gmrivvXYbEf
         lIILQ2ndYjizvtqu76N5HEFc8ouPFiWhP4vWay/TGPT85foFw3HUY9aGtDQjhrgqNx+P
         sywPUfxz/V7nHQkmzdqWUVszzkCHqPNIeJXkIdYe1sFVrx2r5ou6rtH624xwVgI3LZUn
         WwAyxkptpQX4eMKbVGmAa7hSe0pY9N5lj9rXgeSUhuXT9tx7IC5VThcdYUkOm9LqzaQT
         aW730FvOamBitaVZFaqWFtQJLjnxhm9Lx9pDYPsWVkccOHelJeu8fLouCTIyTpgRcu/n
         EcmA==
X-Forwarded-Encrypted: i=1; AKwUvByAloWT/yny3Iarqn1xl6AbJjFA9MWrb/5V/Z23zZ32eA6oREsT/Y3Xpa6n7AIwsQyh20Ve0D3vz7T6Dic=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZ4UAQUyIG2C47SDRNCf37FbsaAWzcX+pzsJxTxEtGOQ6uekCg
	Skq802366Ch5/gp/3JAReKpaLDDMgkzVzZAZPfawx3FU8XXK4LE82O7dr5u/Q3GadxwaOadV0pY
	XJx2I7tNCEvu4Q4e7j//NzpckTzS+sqJsia3HKMKcRA==
X-Gm-Gg: AYBFou1/54IpVX3uxlzG4cRYh0v1mtJ6nAdAl8/zAJqADXxcxSN1hb4FHRkC47r2y8D
	BMPgH1geiXyyiauP+/tO97edahV7QnoJqOLxQd5KEemh22PqAAmN9A1YvcAplk7GcSbFktoF+My
	n2N3k3lLk6SyG1kpsh1uB1yL9x6rDuCR6EAKMnACnrdNatjiIbyHhevD5A7hYlCG6Nd8YCQzA9V
	UDWtlvet3KeVtdQy+FQuXyNJLQt18+gTf4ZZ9HzptVqCYtYPiUYhKICzjsi+5DOncvvluv3V3Sh
	m4oTK4p1jzybqkKadfKdS9JhfetoDn7d32rYuHcJHecPEtChV5HkYU7g+YMlLFe/9JaMBv8/eR3
	2L665uVUhKnH/fExy/JNAdsoEoX95mfUPMFSbz+VgoMz7I8d2boy41/p7emh86+mv/7Gchp2DXJ
	hWlw4O90Cu078SJE3DMeQYE6oFz0hW9H700SB33imYplQSCAHN9hko0A4=
X-Received: by 2002:a05:600c:3e10:b0:4a1:e01e:1927 with SMTP id
 5b1f17b1804b1-4a35ac8d939mr12203795e9.5.1792817395557; Fri, 23 Oct 2026
 21:49:55 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <caplitmus-rv.75b0e9ee82984422ba17d833767912a8.d33@163.com>
In-Reply-To: <caplitmus-rv.75b0e9ee82984422ba17d833767912a8.d33@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 24 Oct 2026 10:19:44 +0530
X-Gm-Features: AclHuK-rwyUpMrCtlF-8OzUUpfS51mxj7irl2dKCroJ9WfO9LDr7DIESO4VEff8
Message-ID: <CAAhSdy1UwajY2P2ca_h0NUd2v00TR18go0gGNwRTxd66HQxS_Q@mail.gmail.com>
Subject: Re: [PATCH] perf/riscv: clear snapshot setup state when a CPU goes offline
To: Pengpeng Hou <hppiscas@163.com>
Cc: Atish Patra <atish.patra@linux.dev>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 9:58=E2=80=AFAM Pengpeng Hou <hppiscas@163.com> wrot=
e:
>
> pmu_sbi_dying_cpu() disables the calling hart's SBI PMU snapshot shared
> memory but leaves snapshot_set_done set. When the CPU comes back online,
> pmu_sbi_snapshot_setup() returns early without registering the shared
> memory again.
>
> Snapshot operations on that hart can then fail because the firmware no
> longer has a snapshot area, while the driver still follows its snapshot
> paths.
>
> Clear the per-CPU setup flag after snapshot disable succeeds. Retain the
> flag and the existing error return if disable fails, so a failed teardown
> does not claim that the firmware registration has been removed.
>
> Fixes: a8625217a054 ("drivers/perf: riscv: Implement SBI PMU snapshot fun=
ction")
> Assisted-by: GPT-5
> Signed-off-by: Pengpeng Hou <hppiscas@163.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
> The issue was found by our static-analysis tool and manually reviewed.
>
>
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 50220f7b..f38a64c7 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -1175,6 +1175,10 @@ static int pmu_sbi_starting_cpu(unsigned int cpu, =
struct hlist_node *node)
>
>  static int pmu_sbi_dying_cpu(unsigned int cpu, struct hlist_node *node)
>  {
> +       struct riscv_pmu *pmu =3D hlist_entry_safe(node, struct riscv_pmu=
, node);
> +       struct cpu_hw_events *cpu_hw_evt =3D per_cpu_ptr(pmu->hw_events, =
cpu);
> +       int ret;
> +
>         if (riscv_pmu_use_irq) {
>                 disable_percpu_irq(riscv_pmu_irq);
>         }
> @@ -1182,8 +1186,12 @@ static int pmu_sbi_dying_cpu(unsigned int cpu, str=
uct hlist_node *node)
>         /* Disable all counters access for user mode now */
>         csr_write(CSR_SCOUNTEREN, 0x0);
>
> -       if (sbi_pmu_snapshot_available())
> -               return pmu_sbi_snapshot_disable();
> +       if (sbi_pmu_snapshot_available()) {
> +               ret =3D pmu_sbi_snapshot_disable();
> +               if (ret)
> +                       return ret;
> +               cpu_hw_evt->snapshot_set_done =3D false;
> +       }
>
>         return 0;
>  }
>
> base-commit: 4d7d9486c04d917265f64c55bd23b2cc4fe7749c
>
