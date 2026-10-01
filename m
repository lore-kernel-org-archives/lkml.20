Received: from mail-dl2-f36.google.com (mail-dl2-f36.google.com [74.125.229.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7913C1F41
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 22:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.164
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790893368; cv=pass; b=HT1PN5Jyc7LoT8Mo7KyCxccYrXA7rhyaM2G8+p79bSZiju/gmwDlJECuGr52k/4TzM8stF2eWykc2Z4rGWXtCdNyZXAGkDpVE9AvxlueLUwVKZzAIambPJedEJLe+PTtek43XZHv/VSRrnIEOm6Ek46Jk98mWcoUFdPGFP2cBnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790893368; c=relaxed/simple;
	bh=jRjHDbuXKLMn6PiuB+tFuhgDq4MLCM9aKggiyanaEng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kbECDQOitEptSwdxJJYZXkbTpxo5FAQdPBlQvlvYYBb5g7HBXxa1bqup4LTzHjyW2T+rnXtOvZhpG1O/X3UERuIdK0trqxmZi0l4+YdoHaAWjZFLWHOOoOiNgBBwnbECn0FRDYCArFDC46K8/j0KWeirxt/0vHJxvKnuWlsVBOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P+zscGa9; arc=pass smtp.client-ip=74.125.229.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P+zscGa9"
Received: by mail-dl2-f36.google.com with SMTP id a92af1059eb24-14373bcc010so6349804c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 15:22:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790893365; cv=none;
        d=google.com; s=arc-20260327;
        b=VJTHxjY7l2uybztw/ozSDeUZjOBkPgusKMyOClNyI8tMmTlLQu8xxhxRkh/t0RWqMd
         UrCNK8EHwRfTiI8wXZXcMIIzxfWufKBZAcgXUso6ta4Maa4MSc+l50IgoVysPqokX/i4
         5zT5oJCPVGu4clBMMiX98gmR9Y9pc2v52iCp9BSTZbbZWIM/R8nLYh1aCmiQM8sEocDT
         nDedtsi84RWTAFbSw4EfA4FX5vvhprQgl6NVeDMSYr6jdB134PpKGedONxL4kDhjnx8e
         u8KSsaPW/mBQME2pdzB1l1+lNHSynmebYdtByRqUrBoZaHAj3MD2Av9ep9m1iIRK/Dkf
         tj1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wfKwgJtYMsEYEWlSf+SsfhmhLRaFUNim0MEAFnPkGYc=;
        fh=4czdxzocsnFfi8ULMyPlji2ZxgvywKEejm0X/nnv2wk=;
        b=AeBLHqvaTrVpPQj8ory5CzhXCUmzc3Bh07P23RI8wgnJmMKTec3Ggo5WPcdpwXfokB
         9ya89E1qwjMucgDqxEQ5obWyzTkSL9kE0fcahjLIM84AS/Fp/CzFQfKBKI5+F46E8h2j
         zE5KmWlZ2ZrUAh6r/flWM30wRpo1AnjNMDz/BaPELw6xRbIkNoQ4vL7sC0gDx/TUgxZi
         ctHs/ySbyNvV0FJRnyx9p8pNf8g87LlPTbi/lwfW5ywO5m3W54Q21zkulNtFFZOq7G+p
         gXAfNdG7S5EjhXhEMv5HNjsczSNDxYlIgSKOZscMR2uXNP5ho3VNDADLJsWsexkSW8S4
         9CJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790893365; x=1791498165; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wfKwgJtYMsEYEWlSf+SsfhmhLRaFUNim0MEAFnPkGYc=;
        b=P+zscGa9lQEWDDYzQH23tCBhk8SY7Ae9UmEpjPY5QIrju00GARaRJ4jGspFw+ZYPPA
         +1ivdAVizgRuh0RiNMK2Y/otBtNTzouMToemHllyQ78DhXj050UoZWla7IyN/xgyux/m
         lkfAqOWJMQki+1Ys2UaSdeuqA8KmpWOyPE1L+muBoLj3g8G7dTVcoUgRJxDQiMHMI8xa
         gXcnBeBW73fX6RG4gedP01jr8KPoScfH3m5YcJulwxeMy2FT11jeMHEs0QaPZBjQDH61
         UxeU6b+2peD14qoDOQOpUCzadDioxFwvHTG4Dp3wsuUVAnttWCuyvEHEmSdK5gGpYP/J
         GkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790893365; x=1791498165;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wfKwgJtYMsEYEWlSf+SsfhmhLRaFUNim0MEAFnPkGYc=;
        b=25q9GtUwUy1vPNbgSIp/iy7TeiYF+1oglcLVb+ISQeUgeMgkwv+n09C5fxHs3a685g
         GAi8eenZIjpgLMW7FkT4/F8cectIklM65oCz2673kzc7FTXzf4SrB3/TEs1NdIoWjnns
         imVQpMuZDH0758gISuLjInVx7ZPxODbgRpXO5n/oQ+kuib8D2hAd+nDZCx+yKnrr/XeA
         BDgv7ZmrG2a57Td/d1mtfR90nGrFeH80K8sphhF0TkZDDOwngWDQH6QKwZMfvQoYDrsU
         8E8Zi7ORC+HsZ19p9MCFlpcJcrNVWr3RDVZ36nzYJ9WR3UVLsJwtbj8Z/twibxQPxhzx
         j7ZA==
X-Forwarded-Encrypted: i=1; AKwUvBwj/bL4aQEfcBYTBQWcrErAmcvgaK1CC2f7ejaeVRJaPWXEj4tSTGRhSwpE1bY6ueZE1+wgUSvuIi0Qsho=@vger.kernel.org
X-Gm-Message-State: AFuF++mT3FsESkd5pssFBHZAbfpTe1G5wq+q9/McIKJ6yhYfYEJeMIOI
	P3vOlw28KrQ/rmOuLiD1ANOepAa3jiuKZwaoqSlnC4CYpfbG9gSRMM+4DViWEZlAaQJ1Va9AxUf
	gME4SxkzcG87zk2Y5cdy+qHy+QUaDs22myCY1lDhh
X-Gm-Gg: AYBFou23kWweMuKNxEXmkfQsd7RKlb1sdbGcdk43TGOYzFon96uVMFAnYTH/Wv1LOoG
	CKg5FJ0UcE0cB/k5MR0yVZqW6FYOZQ5HPqzgVB0IwGO0kaATfRpgoQ+Ao+5XyR6HKblq+F7hOcl
	1RJoyln4UFyXrcZQsEDK9Vy3OTQl8W3XWz8cxWqJAS4cBKhuZ5QyLWZGXtMtKwBIvQBbZbo80Mo
	/nb8wzveT6LKp3xhT/SAjhydqJpaO6X0bxgwBqLleZQ0G8W7Ypu8sd8+Zl1qiHwl/yLW6+OufuV
	nSyEWJB9Ir0bvMjU565cq1btaIUH5V1nrRPr2m82GthiZ4mY54+yb7DUG5u4bSbv
X-Received: by 2002:a05:701b:42d3:20b0:143:72b1:9004 with SMTP id
 a92af1059eb24-14f5cbd2c4bmr587221c88.45.1790893363916; Thu, 01 Oct 2026
 15:22:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517114026.6817-1-vasant.hegde@amd.com> <amc-s_W_TjLYnbw0@8bytes.org>
In-Reply-To: <amc-s_W_TjLYnbw0@8bytes.org>
From: Chun-Tse Shao <ctshao@google.com>
Date: Thu, 1 Oct 2026 15:22:07 -0700
X-Gm-Features: AclHuK_pUfvqEqlIhxon9tDrY8mIgK0Ky_lHDUxAV5-XvBm5W49T2B5l4bbA0VI
Message-ID: <CAJpZYjVRRsof8KsgOfGL1ZBE8zM5hTY1+U5PHdz9=gkSfeRw9A@mail.gmail.com>
Subject: Re: [PATCH] x86/events/amd/iommu: Fix cpumask of IOMMU events
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: Vasant Hegde <vasant.hegde@amd.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, peterz@infradead.org, mingo@redhat.com, 
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, 
	adrian.hunter@intel.com, james.clark@linaro.org, x86@kernel.org, 
	dave.hansen@linux.intel.com, tglx@kernel.org, bp@alien8.de, hpa@zytor.com, 
	iommu@lists.linux.dev, suravee.suthikulpanit@amd.com, sandipan.das@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping for attention.

Thanks,
CT

On Mon, Jul 27, 2026 at 4:26=E2=80=AFAM J=C3=B6rg R=C3=B6del <joro@8bytes.o=
rg> wrote:
>
> On Sun, May 17, 2026 at 11:40:26AM +0000, Vasant Hegde wrote:
> > IOMMU performance counters are accessed via MMIO space. Currently IOMMU
> > PMUs uses a single global cpumask (iommu_cpumask) shared across all AMD
> > IOMMU PMU instances. This prevents collecting per-socket numbers
> > (ex: perf stat --per-socket).
> >
> > Fix this by adjusting cpumask based on IOMMUs NUMA node.
> >
> > Signed-off-by: Vasant Hegde <vasant.hegde@amd.com>
> > ---
> >  arch/x86/events/amd/iommu.c | 29 +++++++++++++++++++++++------
> >  drivers/iommu/amd/init.c    |  7 +++++++
> >  include/linux/amd-iommu.h   |  1 +
> >  3 files changed, 31 insertions(+), 6 deletions(-)
>
> Acked-by: Joerg Roedel <joerg.roedel@amd.com>
>
>
