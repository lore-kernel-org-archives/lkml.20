Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C743E557E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371405; cv=none; b=fVQZuKStSS/VJj6Tv+IQbaWVM1ZQt8T6pkX7zeCP7V6ZDxb7T4vre8o0KqLtMtDZTioq9RToG9RB8N3VDQB5XNkeDGrWs0AdpQZ5A+Nni0Hv4dGFqnTHs+/aNUeL0XZ30RjoulXW4ri7U7fMMWRZixiFzIEFAu60/hrA04xPRv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371405; c=relaxed/simple;
	bh=+O3epdP0hNt8bWCh+m7fHo3yvg6cawjfYlW1RkLSlg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QV7Dyx6YyrcCgh7ebwVK20xANxsfJNA5YRUW4Zi6rnw4GmdxzUR/4Eo1Z2cTVTKFIXjPAHlGk3k9Iu4WipAPtYH5mezrH7p79q/FOno+0n3BysE9wfIq/Kf3QzCGt6iJRaMhFGsFy+/hIjEbPLVi5mAWCyFdZBJ6sBbGKIVRNQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f42.google.com with SMTP id ada2fe7eead31-79028ca939aso1316980137.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371402; x=1789976202;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MdZ0sJe93gFmfPqzjpCmLFmphoDkWj4ooGAcaz6b51Y=;
        b=mWwPV1T5i0V2LoW8ktb7JgW8jA25+HpFQ4sAx2+TkCM+j3Ipq5SMg6f6UjLBxRUldd
         XOkzid03Czo+ghuQ4c1v9wc6LDFz/WYhCWvSyYAGFtNEErrtUIgSNxLBz+mMytHT2NZL
         y1Cbo46pZWSxytsrJAJo6UyXAqL79lYWgm2GDNtqK3Veq3Vz+pOdKCKGh7i1lfm+puQA
         qAOs0FmFKLUX+7JiY5JmET1V2LA3SXCYq5gdu8yJJ41BHuCnVB5lkjbBr+853v0MCKrl
         9JvJ2W+Sz+f9/wNo9rJNJP0wPpXw7fgpQ516HugamhHm8bv/3JNFy3diguz41Ca2Jevj
         Korw==
X-Forwarded-Encrypted: i=1; AKwUvBztOK/Tm8gPZjGJLb2TYvc67i2x6vhqTFBXzDvjTFFnBrw1MyyKJEdQYGXcGGY1O1zgo1cl8PAnfuJ2Kr8=@vger.kernel.org
X-Gm-Message-State: AFuF++luq7d7SMRDbAZimTdDjqphgBkPw/0PM/2+MmKSnEEWsp2ACQsE
	4LcruZpLzlAUCMS5BL6KRt61xbyjaKTHGLzytqoTjtlLLtng+p37H6HhVFeeWFFI
X-Gm-Gg: AYBFou1mmV97VUdewNRD3U6YnArxCviurwdI2FoDMHZsnrmwQS20/8YPo9j5/19cZOw
	zpXx0UAubNCAk9jijajjr33Wi5uw3k8kGfure85nr8IqUe0CMxh1wMHI8ZjXeYOrz0xnQFnCoyZ
	ZcWvgcjDgPFwiz4GfBxJYP5QqvRKxYAnogwVO7uIHVgB02nYKsp9EUc06lYB1kSznmY9sa0n45p
	n+M92WrhbILoK7Yf45NnPe6iCxTBHm7DJp+Uvy9+DoBg/7aVPQ+nJ3c2x4yUAldXZDG81qghy1B
	Jzo5EbiEyytXH1H4pfqYm1CvrelG3jInixABL+Rf9eGNxdqF5vOOUKg+bi2G0Wi+Vj8VNIDe9JU
	PPv7h322Rt7iiVbwumUC+/zASpLByOsxxsPzdl195ZO0JiQ2xefcBGiZ0FZS4oUcOP7JVlYEPbO
	77XzVV1ogLLoXXb+LGgncD0S/RLdGYp2B6mHyZZ+zGWMheFezTdcslVjTZBe6RtycHnKjlukVPr
	mrwi5mEwnH4/83JHvN8+lH89b/8U/TZ+WzXxgNylz7cZXI=
X-Received: by 2002:a05:6102:918:b0:786:dfa:c5ea with SMTP id ada2fe7eead31-79b57cb42f6mr638634137.5.1789371402002;
        Mon, 14 Sep 2026 00:36:42 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-982b9ed9257sm10387004241.5.2026.09.14.00.36.41
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 00:36:41 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c83be8db39so1575110e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:36:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzYQL05Ll1rSAbjSo7tpm4Mym86KPfRSdHDG2+z2xlpeFxqz2XjB4Ie/7roaxFgVT1h8yr4VkQcZOAX6Nw=@vger.kernel.org
X-Received: by 2002:a05:6122:4697:b0:5c7:fb4e:2cee with SMTP id
 71dfb90a1353d-5c981a874d4mr600982e0c.1.1789371396752; Mon, 14 Sep 2026
 00:36:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913173049.1168963-1-sashal@kernel.org>
In-Reply-To: <20260913173049.1168963-1-sashal@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 09:36:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVVpAzuUDMn2zQmbOaLxiroyBGeyD9wZWe83dweoVPVqg@mail.gmail.com>
X-Gm-Features: AcwNN1XOZqE79DMSk78qvmSH-H90kBGDh0g78DMpY4SxMOMYafpm345WSAqwPF0
Message-ID: <CAMuHMdVVpAzuUDMn2zQmbOaLxiroyBGeyD9wZWe83dweoVPVqg@mail.gmail.com>
Subject: Re: [PATCH] firmware: qcom: scm: Hide QCOM_SCM instead of depending
 on ARCH_QCOM
To: Sasha Levin <sashal@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>, kernel test robot <lkp@intel.com>, 
	Abel Vesa <abelvesa@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sasha,

On Sun, 13 Sept 2026 at 19:30, Sasha Levin <sashal@kernel.org> wrote:
> imx_v6_v7_defconfig fails to link:
>
>   arm-linux-gnueabihf-ld: drivers/firmware/qcom/qcom_scm.o: in function
>   `qcom_scm_pas_init_image':
>   qcom_scm.c:(.text+0xecc): undefined reference to `qcom_tzmem_alloc'
>   qcom_scm.c:(.text+0x2b0): undefined reference to `qcom_tzmem_free'
>   qcom_scm.c:(.text+0x1514): undefined reference to `qcom_tzmem_to_phys'
>
> QCOM_SCM gained a "depends on ARCH_QCOM || COMPILE_TEST", but it is
> selected from 20 places in the tree and several of those are reachable
> without ARCH_QCOM. DRM_MSM is one of them, via SOC_IMX5, which is how
> imx_v6_v7_defconfig ends up here:
>
>   WARNING: unmet direct dependencies detected for QCOM_SCM
>     Depends on [n]: ARCH_QCOM [=n] || COMPILE_TEST [=n]
>     Selected by [y]:
>     - DRM_MSM [=y] && ... && (ARCH_QCOM [=n] || SOC_IMX5 [=y] ||
>       COMPILE_TEST [=n]) && ...
>
> kconfig still honours the select and sets QCOM_SCM=y, but it does not
> propagate the selects of a symbol whose own dependencies are unmet, so
> QCOM_TZMEM is left unset, qcom_tzmem.c is not built, and the
> unconditional qcom_tzmem_*() calls in qcom_scm.c and qcom_scm-smc.c
> have nothing to bind to.
>
> The point of the dependency was only to stop asking the user about
> Qualcomm firmware interfaces when configuring a non-Qualcomm kernel.
> Express that as a prompt condition, which is what the same commit
> already did for QCOM_PAS: the symbol stays invisible, but it no longer
> carries a dependency that silently drops its selects.
>
> Found by KernelCI builds of the linus-next tree.

linux-next

>
> Fixes: 8fecd3194de3 ("firmware: QCOM interfaces should depend on ARCH_QCOM")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202609120634.g0HMAp3g-lkp@intel.com/
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Thanks for your patch!

> --- a/drivers/firmware/qcom/Kconfig
> +++ b/drivers/firmware/qcom/Kconfig
> @@ -26,8 +26,7 @@ config QCOM_PAS_TEE
>           by the firmware TEE implementation as the backend.
>
>  config QCOM_SCM
> -       tristate "Qualcomm PAS SCM interface driver"
> -       depends on ARCH_QCOM || COMPILE_TEST
> +       tristate "Qualcomm PAS SCM interface driver" if ARCH_QCOM || COMPILE_TEST
>         select QCOM_PAS
>         select QCOM_TZMEM
>         default y if ARCH_QCOM

LGTM for now, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

As the MSM driver is used on non-QCOM platforms, too, in the long run,
the "select QCOM_SCM" and "select QCOM_PAS" for DRM_MSM should probably
gain dependencies on ARCH_QCOM (like "select QCOM_UBWC_CONFIG if
ARCH_QCOM" already has), and the various qcom_*() should gain dummies.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
