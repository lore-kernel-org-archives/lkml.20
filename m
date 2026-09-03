Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0C0372EF7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 05:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788414176; cv=pass; b=pLcDrxQ+6S5A5FCiB9Tw7VzXLjsUbtwiQKGmpbqV4a4Jpedr8CMXbSpRPKocTNCbLCuaqno24njFfvd2o5kx4dZY+cStwC+Djl6R8Me99R4DSlIowo2UI3djQZUT/aFgRntdZd6+mxueMwUWnALBJ0MTMoEhREZaILTAsvQigo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788414176; c=relaxed/simple;
	bh=87Zyyw4GFC5ngPT6uAcFPpo1YmyG5KfY5IVxNusfOkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NcN78vNIqcAx6Qe7v4ID9t3lTIV49wjeyPFetCnEFPN/9VuXg0CV2dSwd2LTiK3MCDYrkw+epUUo3GCjmFqW2Yikb88jnR6mgsxzvTnvW3QId+pEYuaeZpjG5PhUELenvcRbOUi++oQYWX2TVOFfeZOu28hOTc8TGGaawupe+RU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V59YVEOA; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V59YVEOA"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a63c610b8dso2942127a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 22:42:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788414174; cv=none;
        d=google.com; s=arc-20260327;
        b=IOmaXfdxJO1CcQkU0cQAwYgkDP8Xt9g7hlv/C5cNGinjmBqRLqA7enEn3Z8zf+m96u
         6s6XZnUBA7gtVEMfQAA5HgLmyoxUTmn6TkCnurgYMNJuTNBdQnebMgUgT9rASC4ERBdx
         QXIBp4etZise+DMDPgJ5nZu7jD625SJAcpuF+CJMt81qKOvBKtf0/qCOuVylJKyr2Rh9
         qBj6EuY1djq32+7RbvgDmywBTb31mI5EDP2Ar3vc5NL8b+RFVAdso70RLXTVW8PqMpk9
         w1elHBHmUnOyBjyLPA09XRYi5F0kuC6jHOd7LAhHijTgDf3uhBMp2XuNTqO4NFraAj2w
         gU5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZCDPRSfQ/uak8RTuOHMHrP0RFeolUV0dQQ05nzSxjgM=;
        fh=ehGxIgaFMIeW2hoDBtgPTdCrBH5KofsH3zwY5htfRUE=;
        b=IfcrppI2s8F+icjgPq5GAQSG0wB1OLMUgD+RkDPA2uh1NFKwmm3pDQtH9AYfRmp/Xy
         48+SluPPiNTbCFjooWtrgRZ1PSJkxi+St962p3e7ivOukzsigy+l3owLzbe8TQknlQX9
         0RJl/HaNvfZrLcMvoLwOnoVoWsossiF0Seo+ewK1/+qvkQwtjhi6wYePNtRqcQ6tVSYs
         931lHR0M9kIs5xUrMkgDVsAQ6NSTCCPqlTIQaRMXN/yc47w2gYNydiD3kmdYVwhBBEBG
         YiUd3l8nKXr5BDiW6dsLyAmN1di3V7xtN3XOAfi+eGhrkGhWtNDp6pqysWyn5VVVizZa
         9Uug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788414174; x=1789018974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZCDPRSfQ/uak8RTuOHMHrP0RFeolUV0dQQ05nzSxjgM=;
        b=V59YVEOAqcUHQXUtHZ0zqQGdfeFvBC0F4OOP1Lkt2ZwZOjxLGesZhH7VZhIUewtycz
         Afl2WPwvYCgM6HmScXJ8ybMHfJgJB//hqvfA15Y7irjF8LcGCzOKfFXxVF2a1vGpCPfK
         K7MBOKn77qjQceeudJjYqIyGcmyifEyitnq6vxcnOSTIk9SY4rDQD3E32Kb4QDek+elA
         p1ckysXL5GSmAORAc2MQ13tAMZlM8voNV+ZtzBKmsP0LCyrU0Rcrlb9MYDhdmIc77xyQ
         a2NBwYV+bRd2O9kKReH9BXnqwSBOPDSEia6sEu5gD/pyDn6T9jf2Lr2z65I4Jzhgj2mR
         pFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788414174; x=1789018974;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZCDPRSfQ/uak8RTuOHMHrP0RFeolUV0dQQ05nzSxjgM=;
        b=pAPARnY2NXbafFRdCv3LcxGxMq1u9oSUTQu0k+Q9fCChSKVMNdjzwjgrv34SCylIqB
         PanxpGTobqNF8sZcxUBFt7zvBOn/bxzGyQyQWqTVTjdoDF8o0pzeIlVtevyx+5ngNseA
         27P9c1bsx3phppbAo2qCqi4Ya3Wd2eJeW2LJN1NOBQPDoUiBF1Wo4DRb5TzQ14OU575p
         3/LZWLfhVJ4lQAnR9PwoMk3+Y0NPhB33FkBu/XVfAweNDAddaL2LHXLNdBg4+Ur9K+BG
         gYa74QZfBAUpitYH72nTOy4lEALYk/ineCIlb4lSuA5kjoM2TXK/lz0jWc5pSxeUkkpO
         Ii3w==
X-Forwarded-Encrypted: i=1; AKwUvBye554dJD2fOGrVwS/Hgp6vo1ltu2DcxKFnZw1NX4YZbeyHF1vgmJVsfF/GYHecRKa7AwIR9Ktf9uPycFY=@vger.kernel.org
X-Gm-Message-State: AFuF++lpDn7e33oRuf52dK5m1GDH1IAQBGUAI5h9pEi7L8hUtAo6r/NK
	SEmAOhvqqhuu/m2cVZ/aA8lO4uExGAs5mdqqen/Klfo4JSZ47Vncw0U5MYD/46JL3go8Lxo3DFA
	lJjuquLIEpLG/d6zqBWxp2Vj3FDgOZI4=
X-Gm-Gg: AYBFou396Vfq99c0xnkKTD0wlBYu0L/c8TTnjYU4A33Q1WODsyvZBD0/lde2gI5cOjm
	xcDcV0t9ZOVXFGUgyDXRfkpjttrNh8tTBC3mLe8w1ekyo2EPzA4SLntYSEWl7UfinY7Qyf6A9v8
	pPwLlBm54xU1wjJyKpWYw6h9hvE3OVdUZn3/QkrDIincM6JS5E4ooKc4CV/NTytehQbQo0NCTMX
	fQbcdw3gQ2JQW2h8PcFdAijyPS3pMX7fmg8F/1/QOmHQfUOaN1riZNaoOGo7HnMyBxVAuknktmy
	hxRyINbHL3dhnDrWKbit2lFt1Ysx7zJt340oWa9CPG5gjO1KQvk9mt/w+ATX4nDntWAgd6ksJKr
	ujmPZnME0mcydaf/DcKnAOEsNrRVo8hc=
X-Received: by 2002:a05:6402:5187:b0:69a:b38d:403c with SMTP id
 4fb4d7f45d1cf-6a68257bd0bmr6072430a12.7.1788414173358; Wed, 02 Sep 2026
 22:42:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <46250102699dd2f07b6ee19ca58edf3a9cdfa0de.1788277742.git.mattst88@gmail.com>
In-Reply-To: <46250102699dd2f07b6ee19ca58edf3a9cdfa0de.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 3 Sep 2026 07:42:41 +0200
X-Gm-Features: AcwNN1UnFePPk7eUF6fem1Ufjb7mKKV8jK2wedJp3tRtopOOcvCECK1QmRyMBjk
Message-ID: <CA+=Fv5QG++qpvECKiSovEAqXevCUrBtaFsADvn3B780pYd40vA@mail.gmail.com>
Subject: Re: [PATCH 21/24] alpha: select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:51=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> activate_mm() on Alpha calls __load_new_mm_context() which assigns a
> new ASID and invokes PALcode swpctx. On SMP, an interrupt arriving
> between the ASID update and the page table switch could see
> inconsistent state. Ensure activate_mm() is called with interrupts
> disabled during exec.
>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
> index 827b224f2f8a..bda8443a7323 100644
> --- ./arch/alpha/Kconfig
> +++ ./arch/alpha/Kconfig
> @@ -37,6 +37,7 @@ config ALPHA
>         select GENERIC_PCI_IOMAP
>         select AUTO_IRQ_AFFINITY if SMP
>         select GENERIC_IRQ_SHOW
> +       select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
>         select ARCH_WANT_IPC_PARSE_VERSION
>         select ARCH_WANT_LD_ORPHAN_WARN
>         select ARCH_HAVE_NMI_SAFE_CMPXCHG
> --
> 2.54.0
>

I tested this on a two-CPU Alpha UP2000. I ran 20,000 successive
execve() operations pinned to each online CPU. All executions completed
successfully, with no MMU, ASN, or page-table errors in the kernel log.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>

Magnus
