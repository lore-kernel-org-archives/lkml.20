Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD25F3644CF
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439701; cv=pass; b=YNRt1UeHPHds/nBzKqEV1rHSNypbS2W/Zn9CFhJ1QWlwPzBf5EkpxtKZ42IJeKeTje0s2We2I+WyRrVYfRn58px//OfuEsEm93Ok8EaK4GmmS+ElRh/+e6TfortJY/NaPk80ZZhqYAUiTM05oYsn/QW8SAGOCNYNTwpb5hLQmtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439701; c=relaxed/simple;
	bh=YjOAm9SaF8Dv86mEyUdptLpwV1EYOVfOxoE667TUwQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eyt28FRudRExwEtnEh+ezBXPbhZ28o1UXf5NviX4Nm2RI1fzExDjcM0+egUia1E+DoKX1qBxf/Umuy/K8joWaAWg83rS/YEDrhFYx7fUtXVMwHOzDO6YeSZVcXHBJAVy9tNbnnpxCREVmUHNNBTDMUc21bqlg8emkUaL0rP/dnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=N/KSHsW6; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="N/KSHsW6"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-836ce6cbe1eso27593327b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:08:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791439699; cv=none;
        d=google.com; s=arc-20260327;
        b=sm4fU9qNce7R9Wv2j2ne3qbaj366LPy3+SPYJyrGqXSS3NrmXDVz1wrjSHX4Yvj4xL
         I/ehRpj9wM5UD/UHYrUJVmBgBViyS+4iZ0BybXNRC+EF7YrkLkrTsITYaq/mkjdPZ+AZ
         kTZlQ2zF+Sh+niJyPWHtwIicj6mtMnJI4T2pNraAAWq+Ourn0EOEXiMuX/scUnfIENSQ
         RCQZAQ5SpFCcUkq2ESFIXw7exoEoq3igyR5wMJCD0V26UDm1bDgI2OaOblxk3LkbkiGe
         FDTiT8hUIzZkf2bd3zSEALQwOitM2iRH8Lr4m8cK5SBa+Umx0eGIKWLfqZq5y9IpUHIM
         ABXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g8wi6JDwMhJMDwxybg/6cqRql+OVe0VXJNNLkxqpuLg=;
        fh=iskfV28Io2LVwXh8fBkjwzUjlH6d0lLBehbZNlxGHyc=;
        b=e4t3Kj+/DbIJD3vfEfs5/81h5iz+/vvVQ1qdcUFrIXdwgVkr/luAOGb9Ddu9qLjATW
         YNsjZTp/HfDTutUN8DiIBPENIGGobMgv/bNrusLnS3ey09kn8zAdpISfAFsLbJ6lkC4R
         PTalVPqAzVt+G43DisV9NaaEmq9+px1XLsxmVXOTpOEqPQrowlGNALQ6Jz1DIVnKu7Nr
         s1Y+jPPs4OxvB+XZH78dKlYyo7pel4PPC16TAcTHnt+HYPg5tSdDTofaAhPbCoNNFrm+
         9eLdBK6vW/clVz4ogF56aZ3UZ0NCOlKZnYK3CarOcDd5Ggg7/3JIHcmIgRtlZ2izXSt4
         hbfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1791439699; x=1792044499; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g8wi6JDwMhJMDwxybg/6cqRql+OVe0VXJNNLkxqpuLg=;
        b=N/KSHsW6jHABAtv6V+XPcjwIa6wz8a7bYzVoXsU2yW4hIicJM6YJKVwca3jgNSmmcr
         7UsVWtDIU15xScL5pFpuY+QqqSOfiRgPlupIZA9FBJDj1Be2NORBxluDcw06FuPTzN0H
         szyiG2feOtO0used5WDjaA9CSvDQnlKZFWa+YvoWLAx23wCRIolGIEiP90ei8Z0+FpAr
         v8kVMQ0vCnrzGSBUNx5D4mOeXD2j7JXgJDMTk0LL0YGOcjUzXUfHoSR+TA0+Wwl2roqb
         DQOgC5I+6Kda3W73ewuVRnROV8lq/M+0O5AX9YF/CfRfIdXFGgA/8wuCNZachwfAOwFp
         7AqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439699; x=1792044499;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g8wi6JDwMhJMDwxybg/6cqRql+OVe0VXJNNLkxqpuLg=;
        b=LNVXvx5n6mTsy0S4r/zqYekIQAq3+GWtFadVYA4/j3wT6uIfhBuLAytSEAqR47g1Zf
         dO3PPWSU2mGFzAbdV7B27taxIwUH/0JBF92tfv6YzmhD+MwIVdwNqCMl6lZczg0iyBuV
         bcoiLBgcd19ISI9tT9MJATSIuAhitkdESR2PCrbwIIHNZdyOymKP2Ngs/PcBtEoF+88S
         mSHXt6LLuCigB0MskNboTDeImvv4v+K0kVgNAu3kTG2lK2UkJka2Max4xKYbrlrma0Iq
         ROH6aWMS2JBw5y1dI/lCuCB/kAbIC6b+fqKGHh8euGFqF1c9Ld+KG3pZEYiGoUM+BWuU
         Z68A==
X-Forwarded-Encrypted: i=1; AKwUvBw08q7IMIkHHDCtJ219UyV9pRGtRHASBqCaOlLM/B93360CY9qmi9CrV+I5D+4C4Chaex83yVtjZbI5dBg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlxefdw+F6Mxczwpugk51Hpg398D64MLSthKWtJPcRA9kQhhRN
	PwM/F2ZmA3LFov/hzus4s2uEBYtlmW/w2oKVZnNLGO2kewEJq8lW0j2jG5T6nLTrWrW+Z0KiJRe
	68QlQpq+3/WMQ5GbVE9cUgEZ2smzq14vTWM0lLXjSOQ==
X-Gm-Gg: AYBFou3FYR1btR1axVVxhaFcqe5Bfua7UfAWVzXrspQlI410DiH6GQHDy2xCsKU52iW
	1f88R4MC2HpBgn5DF2bPlsdyfEWmrKREkqx1+UBiCQF9TUIuwRhZ8wF8tVJkTQP9q585REr1IGB
	q1JhgRuLGaN8Y+n5SMAVclSsvHHM9hr4pB4UFb9GHnHLW/fNvOS0r0xbuzu7GsOdLJk7wWefwX9
	CaI3Zr1wCXvvDF9zGWRwmpZZnsSOTbxa09XYrANGPOjwy5G0m8S/l6ccUHfjpsDoBg1r0xeeK3L
	w482ItEvitfrFbp1OYTLubZvhQWyVLRg4TT/EUTzWbuQLKLORN3//nqeTG988NEYuGtu
X-Received: by 2002:a05:690c:112:b0:8ab:3fe4:2e64 with SMTP id
 00721157ae682-8b05acc40a3mr33282027b3.8.1791439698649; Wed, 07 Oct 2026
 23:08:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007155748.291814-1-samuel.holland@sifive.com> <20261007155748.291814-2-samuel.holland@sifive.com>
In-Reply-To: <20261007155748.291814-2-samuel.holland@sifive.com>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 8 Oct 2026 14:08:04 +0800
X-Gm-Features: AclHuK9HhR0J7EbrNLoUa0nPmB3mknKzALzsL4XASZvfcGLtl9bza_APMnCqxok
Message-ID: <CANXhq0pwEsZ5C7XopkPRgOv7d6X1m3vLb5ABuxoiXeMrBow2nw@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: cfi: Only write envcfg CSR when task is current
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Paul Walmsley <pjw@kernel.org>, Deepak Gupta <debug@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 11:57=E2=80=AFPM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> set_shstk_status() and set_indir_lp_status() take a task argument, which
> lets them operate on tasks other than current, but they always write the
> envcfg CSR for the current task. Fix this with the envcfg_update_bits()
> helper, which only writes the envcfg CSR when operating on current.
>
> Fixes: 61a0200211d31e ("riscv: Implement arch-agnostic shadow stack prctl=
s")
> Fixes: 8a9e22d2ca5855 ("riscv: Implement indirect branch tracking prctls"=
)
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
>  arch/riscv/kernel/usercfi.c | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
>
> diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
> index 23c4d6d9d8cbc..86141e5bab822 100644
> --- a/arch/riscv/kernel/usercfi.c
> +++ b/arch/riscv/kernel/usercfi.c
> @@ -15,6 +15,7 @@
>  #include <linux/syscalls.h>
>  #include <linux/prctl.h>
>  #include <asm/csr.h>
> +#include <asm/switch_to.h>
>  #include <asm/usercfi.h>
>
>  unsigned long riscv_nousercfi __read_mostly;
> @@ -66,12 +67,7 @@ void set_shstk_status(struct task_struct *task, bool e=
nable)
>
>         task->thread_info.user_cfi_state.ubcfi_en =3D enable ? 1 : 0;
>
> -       if (enable)
> -               task->thread.envcfg |=3D ENVCFG_SSE;
> -       else
> -               task->thread.envcfg &=3D ~ENVCFG_SSE;
> -
> -       csr_write(CSR_ENVCFG, task->thread.envcfg);
> +       envcfg_update_bits(task, ENVCFG_SSE, enable ? ENVCFG_SSE : 0);
>  }
>
>  void set_shstk_lock(struct task_struct *task, bool lock)
> @@ -96,12 +92,7 @@ void set_indir_lp_status(struct task_struct *task, boo=
l enable)
>
>         task->thread_info.user_cfi_state.ufcfi_en =3D enable ? 1 : 0;
>
> -       if (enable)
> -               task->thread.envcfg |=3D ENVCFG_LPE;
> -       else
> -               task->thread.envcfg &=3D ~ENVCFG_LPE;
> -
> -       csr_write(CSR_ENVCFG, task->thread.envcfg);
> +       envcfg_update_bits(task, ENVCFG_LPE, enable ? ENVCFG_LPE : 0);
>  }
>
>  void set_indir_lp_lock(struct task_struct *task, bool lock)

LGTM

Reviewed-by: Zong Li <zong.li@sifive.com>

> --
> 2.52.0
>
> base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
> branch: up/cfi-fixes
