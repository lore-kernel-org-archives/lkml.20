Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793202221;
	b=DwuNAKvBpT2mOzZ9cg5Djtr3bCIjSr0Ij05bzSxNDRRfaIbvIe1Y1+fQRsr0jRbAjsEg
	 7dLOZZKwfv5ADX2ZRuhXG/EpcskIHKbPGryxCmjsgfMjTZg19WwqbpuaCvo7S22W8w9io
	 D785fwRC6htwiF3tuPXllFumMuMJk6O7494sGA3GXulkQeIuhe4wn7jB48+A9ys9R0kBq
	 GMiQkGAx2GK/gFBoK4ttqpHca2C43MrmMnTx9dDFu1Ga59UF/5Jp3AHApltEUg7mbosI3
	 Y+D7T/22ayGqEyByC9svnyQ3zQs9r43qKzoUnopAbj/d3bLbnXbrC8IiqJe57c2FoVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=DVOOLLsmYNxFDN2neSUnVtuLeg8VjPxhidpQKIzCTQU=;
	b=OvE8ttaPtObEljqLe6rUbb+jeQtKASrSJ+urf8Kj8iAKnQULrUHl8isu51WtNYnB6TIv
	 BB8ochYJwrQJUtOu2nbm9RP3gxMBlbD9jngrjP7va7YtOr5TN+20dUePykbQ2RnuKYClh
	 JinzxRBENK3ZWj7vhOUdWpbh/SA0HOiF06HYPuvGhVmaQIlqMHhP2e/bk6wrrnfhjPSkB
	 B1ck8wlna2sTa2KHUQBzYZil8iAp8G/baVjttCFj9wrfYBHywGDPPxxYzUv+d+4JLMcDb
	 B6+q5HkIm/Yn+Hn5RMhe3pRcmn7IFEPaU/5dFLnwBxnOz9V5k22YWMjlsXzHkbLFZ1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IQqFfx4r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FCF606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61FCF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IQqFfx4r
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso1453084e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:43:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793202219; cv=none;
        d=google.com; s=arc-20260327;
        b=sXyTcBe8V9HvwLpM2du8Ijtx6RTjEZ1DRYhOMpvPvbVZ7oltibCKAe5ELJnqDPX352
         o4+V+M4FSwho9xoA7KBJ0xmF9/qld0+JXGID42xrGRpUSlw6cA6BaUtpEYZACLwZzsUe
         tlq29kVGJLBDqV14NyMfG8KUvlyGHFeeN6aD7i2Xa+n/8oqcKw3G8HAuc6CfNzTyiuPl
         UUt6xybjdV92YnPFcXgMhv5Xtbyucbgq7FPHudyFYjkdo+M+3e2mmjrHmBd4Ak9atpwk
         nYFfF94ZL06K47SufO0g1bGjxsexoyiDlujdBdV80n35PqGzbTZ09Q+b/Xy16N+0XAEW
         gOVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DVOOLLsmYNxFDN2neSUnVtuLeg8VjPxhidpQKIzCTQU=;
        fh=jE7GAj6ffg2GbMma2vq+Ghz30o0Fm1/QjQwsydKrB3c=;
        b=e60WlbnohFJ3/qwNAJSAQwkgeVh6D9Fs04tbyJo1mOeBnwF1i3i+lVA5pYPTsTUbkf
         VMPEhhffaV/LyfRIlp0jmgKMjsrunBQIO8BlIVm29RWASJdzbHHMiGxpwwRLgRPcLBvV
         SrwOntP4Wndz18XaA7QCRy1fM/WOHT1LOBoMQF9VjIMfW+b7R1UlwpHz3433YUIyCnuE
         wPEu+jyVrSf6PV55bAK2NyYx7AuwxLcMVRCEWdsC9ul3nR0QCbLo9n2uhNX1SoUmJRq/
         /9R/ATY2rgOwKO0/XjS/3AY8FKCYf8G0SAcPqc46AXW7VGbNFHFV5MJcYJ27SeIzJq7s
         VU1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202219; x=1793807019; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DVOOLLsmYNxFDN2neSUnVtuLeg8VjPxhidpQKIzCTQU=;
        b=IQqFfx4rbHCH0DIbi12l9QSCcD8sp0iAlKzsIwur+LBHKnWKd/48ZuVFlLQNinGfzr
         9+Jo8u9YjtY2gCbZhM1ugN0iZtjD2W+/ojRI/m6WMJd7z/RrsP9dYE/fZYsxTua4gggJ
         uD6HlfED8L3zw2HF5AnLxho7zYACgkuUk2AqKR5OWARGiCo3LGLkBoqS4CTzllOsB3Z8
         nyjPcVw1WWWKJi9nVqMCFzd7c+B/I5apujBIaHDB+SRM0PPq21JDPnOl97nYfK4/YHl7
         Z9EAWa637ZT6Oh/UFWyyDOjnEVSQR1irS5ClX9iWEAwTJG4MCMNgWf1Ac/Zfl1RNMU0/
         0OwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202219; x=1793807019;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DVOOLLsmYNxFDN2neSUnVtuLeg8VjPxhidpQKIzCTQU=;
        b=Co2RlMtkPdXBZbsw2/kTBDmOBBdUEezfTwSPM17wfQjIAlIf71WI8X0kdwdyXqTI0A
         zDX/sfH6vP1LCQ4VdlQS+aQFlHmY9W1HEB8CLbc0jJizHQGyOKJHKcdGy1GDciIS0sf1
         fQshBOWLiHpHKUyxABrNXdPqtXW27m+eDfuULpbfHQouan0l214jxhVtOxOwFIj5LqXf
         vcN8buWLv5/8xLtuhxWNnc6HFN3+5kaMVTqhjTjHyIqBFO0NVJ/fQxNAoACKSr1YgciO
         T48nWIAR6meNNndh0xrPLPEN3qjdg38Gw1Oj1UbOvnmj1sxz1qexWwcQRTDZWDDMXRTT
         Yg2w==
X-Forwarded-Encrypted: i=1; AKwUvBzCl7HIIzcHR14UcJlJAjEk0j3xhf+veGXOtfuHzpbvr3c17GAA6Wtf6Xfv7Q4o66E/Eg6tUfowuWsYHFs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfqRO8tiTNJu7szkNMI1bS1l7yjBZVYAIFknzU2GhoPNOHEbAN
	7RVk6AtJc62W0GicYT/836GPY5JBHRtL/vbWFYlhWkleIvE4sNPEq7IbheW4VwQuDxLAUrBuEVo
	SrdffVZl6Ws4mxxfJjTEovkhtJBu5Drw=
X-Gm-Gg: AYBFou2HGRdgcnxhRnC4pHr0p75vyHfhIKPwXxVNsDkwJkVvKkrEY6DEzw97jDFVLnn
	tgUnUZ951QNdfoRAqSry/EOb7fyMRo22Wx4f8yef1pCGza2yzC7Gg/P06nQfkhtqBjLIvhuO2pA
	16CJPR6e2qJGx2et8G+s9cUTzhSTFWwUdh3j8yQ0GgYui9hdA18jEX/xgF0Y7jZZ98bDyjrCgdI
	uUJA3qCegZuDrkOqm8KeNmO4B4H05FgZmsmmUE3eHXH20uubFICFXyHgB0u2f4mhq3M33HztLDl
	eQsLUTF04cj4QlXymXe1AG4bN0Bmr57L0ZxxuHds6KkCdwjDHJPHxu/q+xvWy7GG16nZCYERgB4
	TccUh4mO8E8kIaVyP/ClVM2UvIQNmWG/UrgWk9yYUEUMyGDH7T+NMMFBx0yUg3pSfL7+Cs7O7E5
	8Ev+q4TxzOJBMhm2WYC9RqPxUZMuMRoKiUU+ydPivDuEBoFHV6
X-Received: by 2002:a05:6512:3a93:b0:5be:52d8:f70a with SMTP id
 2adb3069b0e04-5bfcad1f7b2mr1381582e87.34.1793202219168; Wed, 28 Oct 2026
 08:43:39 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028024333.795917-1-ruanjinjie@huawei.com> <20261028024333.795917-3-ruanjinjie@huawei.com>
In-Reply-To: <20261028024333.795917-3-ruanjinjie@huawei.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Wed, 28 Oct 2026 12:43:26 -0300
X-Gm-Features: AclHuK8ctFKN0EMd2E0XLfbEQe99ggeVXVUtiN5LeR_vMR1AjTiWTZfSaXZksYc
Message-ID: <CAMAsx6eMqJdM6BDZB=mxn8JSayyYSv7oMdsM_yy89q+p1xigiQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] docs: sched-preemption: Fix the list of
 runtime-selectable models
To: ruanjinjie@huawei.com
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 27, 2026 11:44 PM, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> CONFIG_PREEMPT_DYNAMIC now depends on CONFIG_ARCH_HAS_PREEMPT_LAZY, so the
> none and voluntary models can no longer be selected at runtime; passing
> either to preempt= is rejected with "Dynamic Preempt: unsupported mode".
>
> Drop them from the table of runtime-selectable models, and describe the
> build-time situation instead of implying the choice simply depends on the
> architecture offering lazy preemption.  Keep the per-model descriptions
> below, which still explain how a scheduling request is honoured under
> models used by other kernels.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  Documentation/scheduler/sched-preemption.rst | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)

Hi Jinjie,

Thanks for the patch. I validated it: checkpatch and the scheduler docs
build (SPHINXDIRS=scheduler) report no errors or new warnings, the table
renders as expected, and the changes match current mainline
(PREEMPT_DYNAMIC depends on ARCH_HAS_PREEMPT_LAZY, d3d16750693b).

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Best regards,
Daniel
