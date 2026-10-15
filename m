Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2053655D1
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792101736; cv=pass; b=sbgUgq02XnBMITwj2d9FptrkSjGOLwuFTOuXz46PgT39ARbcWJnsvJPG+wqPmmdljxdm7PMzcrnNMdbD9kop8Z6yxuRvWF2B2xE75/M2Pp2sPMx17cRdT88FAhDtrZQJSJoWcWA7R2D0fwfwntYIYg5iu2cuYYZz7LHZDeFO3JM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792101736; c=relaxed/simple;
	bh=lRIHYlKk/yaj4fJSnxFwMaWvZPIuM4vHwdBVA9DV4jg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NN4r/+PFMgORADDO8NOV+2Gm7a0iG4LNfU0upely5cw8iUxEYgGF0XSjDmJ4ndwK+vM3V7Xi2/km+Q1HMKHknnuQxVk5ZAFkcoPLMXzzgcD/yEEDBd+SMEwajXS3+sFLsOdXYzqriqMfzkk+/yHhOO6DkN44h1oYLayVSW3KMj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fMlt0tgd; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fMlt0tgd"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so1664a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:02:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792101733; cv=none;
        d=google.com; s=arc-20260327;
        b=WClpqYEGhbaAN5lmK8xzsLf8w+hcMfZ9MO0rQrE1t4h1fbSds2VLhq2dCT5WY6JpyW
         tjsR/hHdwMLxVdaV8W9+HYHwENg2b/suow8gyWxWay9jaY7HW7OqQZq+m1cw6J296ryw
         C+aRdVayYDR8ovaLrRg6XTZG9nnLh0bhZcby0mO7VKL+QMAIGXM4k2q5NzzjcPfVFxjg
         R9x75s2c6ijULoGRNE9S9I98ZzABC6xIHSbWJ6urjM3la5HQkG2xxZB4EGh05UUXX+0G
         i+8SVKxCAuagAe9N0AQqSgtSzGBcwzGOusX7f1ItfXPuCvzk9aWD2X5zT+u2hxn7iz6v
         GIww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lRIHYlKk/yaj4fJSnxFwMaWvZPIuM4vHwdBVA9DV4jg=;
        fh=Jvbav+Cnxzo5cXCycuPuheBT15DL/4ueA8fnvzAJ30M=;
        b=V6M/ADzRzgVUTMcmlBrHoY2c7wSCAOMym0+As8t4J/t3OFVWEhaDK9r1Gz1xO4GLYP
         LCG6nsfJ/PO3UtDZT+pnycXV78+9oY6ggFX6LesELzK2Pkpvnt2fYiEgtCZzLe+W74Ay
         SzuXlNlnwJNrCeujElLV5m6vbuMBTjT+0gEkqKlRTOUK8Ia+naU3ik0UNOoHGjt+T8o+
         2osYQmhUWRdiqqseS4AEcNi73WJVYi7f9P5r5yEHsLkhheo6LS3ZI941HkclsRMO5lkG
         O/A8ZfvdhJUEmPCNaIS10jtOR8R16vumrqCFxdjL9RdvKhEhBfIh1V55YK+7SVUrFW8q
         1n8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792101733; x=1792706533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lRIHYlKk/yaj4fJSnxFwMaWvZPIuM4vHwdBVA9DV4jg=;
        b=fMlt0tgdRUGLNOVVn7YxteYCIBgnvkXlfP/eyLx/rHLV4XtiavZRHeBXMod35Yg53f
         DAtQEaMrNBgq86GeVMd4BldWbC5FKR3X1Fywp3cf3zTDtkVZz3oOf5RHO+xa6vnxhOla
         EY8eOqLnhLBAjUnTHVqlrN5KtwX7t5aBBgQP2fVwUgtXOO4DgJQrjZSD8Ab33Bf+CEki
         3EBgc2+px/olZGUzKeDXC8xauM62IFxoKqf+HMgHroDX3BzKPfslepd8+GxS2zyyKmVh
         YM0bLCBmkz5tgzNQbFUfxV2hznMB/g3FlgieRMgvh+AAowdp6BvMGgJHeta94aZnq+Cz
         n2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792101733; x=1792706533;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lRIHYlKk/yaj4fJSnxFwMaWvZPIuM4vHwdBVA9DV4jg=;
        b=0eWoG7PWpTGI8nFnY26ccRFYYkoiTv5xLELvZdTKzVoDcxbkuxAUop1DxZmEussZUG
         MOzANmtK7YsIV3NiROJ3VOswWsb/Lf5Nu4l0kQVCHbGRvbQqFuFKSG1BbnJgLiU/1VtL
         mc1jBI/I+lnrv1GG0/Qy6n/mzXEAqkp+VpxG8PPQsujpv4WcSc7r6WXFw8kWUzNxOxDV
         qzfk0NcXUphld+qOO4S8ap9A1cRm6KTxGVbGEz7X04lG2ewqfr/Uyv2zkEZg7Jhdij/6
         wkgQAxtnYPBxxd5qTfyjPd1/4B5MS7pctirNBpdli/4swRDNPDhYYndLWIw5LBCFGR+C
         GyvQ==
X-Forwarded-Encrypted: i=1; AKwUvBwn2115xc87vL0X226YmS1SvibgsnzAOUfAsLyZ1BR7UqYoYY5IQkyVUxy0KUxfJctX6lceRstsN4Im1kE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8q9l6iNM8jeRRGJ1pUmbMJ6EU93b2ROwD7hM1KhMP9Rju97eB
	PMKzm9QfuHfx9H1nTEWCvElnkz+PDqKh7l1hGSJ/WX6tD5J0zfx0BknvBpVm2srLlPkYd1YhiQ0
	0V2EjbsUdCWEyH250VigRYp5JPS5xYxY8jYuZy62y
X-Gm-Gg: AYBFou1wzccohbOLjqcgVSr3bpaMLxpTJH9U7RENa2eWTbbsxqirWxT273y6nTjz6GV
	nwNRZOfwq5gyA0U0N+xWhppZ8aBK81+tqj6pLDfVed386Sw5qFNUZZHAp6cw7L4MGrtM5+ZMFZ3
	Guj5VgnavyloDqctaGpV+KAokdrcfSVaUZmEgygciTQ8X4QE0wyT7uux7Tm8zgG+OKIqooq1FYn
	hskcoB9kXKxdUX4cHiANe5kpwD0LGvwU/I96l5BqOhUbCXH2+L0zZpB3Sy9nV/90J3XvchE0Rg/
	bQoM5xdzA/1lwC24ABpBjej5oU8PJvURN93+qx+s95M7ELiBV6GCXuQ=
X-Received: by 2002:a05:6402:512:b0:6b1:bc48:2238 with SMTP id
 4fb4d7f45d1cf-6b3894961d1mr21368a12.11.1792101732235; Thu, 15 Oct 2026
 15:02:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-16-yosry@kernel.org>
In-Reply-To: <20261012233638.2546339-16-yosry@kernel.org>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 15 Oct 2026 15:02:00 -0700
X-Gm-Features: AclHuK-w8w-gun3Ara8xw4uWe-BO5jdjT5uR_3SEXdllXWIlVSRpcYuXf0FuzTo
Message-ID: <CALMp9eSoybGVairftaYg6uyCCoGHwvb9mE9p0V6gJLpm5bbrCw@mail.gmail.com>
Subject: Re: [PATCH v3 15/27] KVM: x86: hyper-v: Allow purging all TLB flush FIFOs
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 4:36=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> Refactor kvm_hv_purge_tlb_flush_fifo() to introduce an inner helper,
> __kvm_hv_purge_tlb_flush_fifo(), parameterized by an optional FIFO. If a
> FIFO is not passed in, all FIFOs are purged.
>
> Note that KVM_REQ_HV_TLB_FLUSH is consumed by
> __kvm_hv_purge_tlb_flush_fifo(), so a selective purge on one FIFO will
> render any subsequent non-selective purge useless. This is not a problem
> because purging TLB flush FIFOs is an optimization (and there are
> currently no users of the non-selective purges).
>
> No functional change intended as a FIFO is always being passed in now.
>
> Signed-off-by: Yosry Ahmed <yosry@kernel.org>
Reviewed-by: Jim Mattson <jmattson@google.com>
