Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A97388E72
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790100362; cv=pass; b=C2Tfl5j0tIrg1Vd9rCKVXUZxUYJwcrjZ83btqxOMX811BkFFXFwgFjrgVzcCeFgs+gt7UoYUbFeCnhm0Sj0zqzteRLF8rAqBQDd40VVQTFPhoyisyQ0KPn7Kd/D2jIAkEqc2yhDeBhz3kJhIP4zaxcd+R8TT0kT2obHZqY5URE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790100362; c=relaxed/simple;
	bh=m++GKzPyuU7UHVuvb7Ivk6mNPNP0mzBVQQ4H9v+ex2g=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OtTv6aia7+2fdINUfCzUC7pzxTR5CJaHNtBAUXyqkxWzQltq90jrqugHDXoMIUPY6PuX8rfRFgBOucqttFk/bbxZrVu6VbIc1lqynlEiCVBVjSeBpltuBvVYfqxaHEitpIaks6noZBP3Wz4Gwattza579muk9bw8I4PBPhPuMhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TF7OwM9d; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TF7OwM9d"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab22370so85776d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:06:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790100360; cv=none;
        d=google.com; s=arc-20260327;
        b=mXtx9L18dnieaX/BksTKoOzgzY+fZARNwvsknQJa7bBCRVl8iLYLNXvD+cWzdIeJgr
         9UwJPBQkGwuZ/3IremeG+djmlD7qiF8bJhvqd1MVzHq3xzPHeKDKv6iDziFSJ8ZQQgpj
         mGpkdfpvx+bV5IumEO/4Ag3p3jC/FrvJj89Q+NPF62b6vhpb/y7ZvhPq/98npXnUuoZN
         2jSlGidMNzmEtBScMm59iTh29yhCYski7VH/EmmLs4mrq5uKSDoZmjqWJWSWiW3E5GPj
         miMbYAegZu7BkPbDwKYMDjtfyxOO/IDmRxsrLGfznEzQlhRshpng0DRWmMtg2I8GO2Us
         5UEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=lf7w8zPr6dt4VhD0eugxOymopbvSQ3RHlj+JN+XDuo8=;
        fh=EJq88jzujv0ISQxWkacJf453jw2lwT3NNd/w696DycA=;
        b=Elox1INW5ygqv7zjRko1D7BztM+bSK+Gi6hBNLXIhw+SMLMPQP4szNHq+shboW6BI9
         fxGeuE+3HGE+5OByQZo1dYuQU63e8di4VYA4EkD+cpoOwgpMR5VUGd3g+B+VYtDyedXY
         MIF0U86BXdqAcMs71oAbQltEkBrfMZqjIeOA9OHWf2wR63h36jej9+dD2B4YC3gM6MJm
         r/Hmd1325hNdDqOqxhtU50p/uD7I7IM/ozTRGIj4jCouJBNkGurSu42A6wsQIGssDIpO
         /vtWlJCY1iZ2Q2PAj90z+LZStVyNJJ6V51SW0nm+HiTD84mX+NZ3UfuDJ4M7HJlLMpyX
         I7tA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790100360; x=1790705160; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lf7w8zPr6dt4VhD0eugxOymopbvSQ3RHlj+JN+XDuo8=;
        b=TF7OwM9d87e88gdlAAFs/xW9gM3CHo5HBAMw7enXZJL9z/zMQ2OzNCPkGpnkH2KlkT
         /Ib0P3bAQchVr1qFiWwCY7LXdJtLxH2kcy1tr1IuFb0RjtKPio+pDBAAUgJeubd2iRoi
         IZzV6OulXPxBgSCJmKwMTz6qlf/uyThW+chdC1HTWp6E7FrjMZ2uIAJL0WRbHN3HbGuT
         +3yVLhjdXs/fkjGPkSGhzgZEfgZhiBlWlhLHjd7lLJ5rQjJVGsf97SnPwGLWIk+ch92x
         BnxFQyYLa5m/T7GI5VP7JSJGaEJHm5BhKasgE5jviAvCklsFDQT+j0FPJ3TmriL7pyLw
         xHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790100360; x=1790705160;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lf7w8zPr6dt4VhD0eugxOymopbvSQ3RHlj+JN+XDuo8=;
        b=ZlsJQ5QPlWaI9AE0StHgQSIoHUXdgHSVLuxkoZc6ki//PS+gxDXlSsCFJitteXnbPK
         gUaheDAnp6dE4HqKETsxWnbaXrfic13okHYS+eqfai9HhxOf6oTVZbjIDjzCOwGCiWMM
         Xv8o9KwpChUnfP68fxfxJ8kWOzM75HmQA00tSOdjHCM2vjrGMr3eWHbmX92WFIFRbrZh
         Xi4p9v2B8QfEbPMwjBYZPsYR0lxEOxdkOpLpULqk5GUIdZbzo86rT47pGiCDUa1PK5hn
         wdZ05o1lr7yh4BYs6CV1/CfOX+4rDHswIjY/vG8jDCWt4qc/mZpQ1Rea3oz2PdQjUT9w
         ttTg==
X-Forwarded-Encrypted: i=1; AKwUvBwtfOi8QVLiTezL4osidLJolxWASPeF5l+2Frule3BJ42h3zNyCVPpXRAVMFwUKwLniG+0zWmw5fllbPGY=@vger.kernel.org
X-Gm-Message-State: AFuF++mFUve/J/mslMpVP3B+ZssOtt3cMN+/v9o6ruVpAXVOmLNwT/I0
	fj9rxh6pKvOzbDdYUkzv/IyHtkzAjexqRZUJEf5E7VK8IMD8tRtBSbTM03zAlzhGTalpzaNYExF
	J3U2FKL2oQ2Jm8kqAAYnrOp2PeE8hCk9/zK9G8+9V
X-Gm-Gg: AYBFou0G6ITNfl5w2gJE6JCUopqAWhwRAGFc3sz303IhEgdEU0xq+0ezGyg0KgSQosQ
	XTwYJIui7NrkFiVxWOay7CCvKoz9aZsVyTdSiA2ytf3o7NDE9ZJEIB9L+9hKvZtHngT5s+j6ZQR
	MQ9upx+XGnx0l0mJev6CDiLT4jX7aC6c4in5Wzf3yDVsLzpU6I5g958LhlbyVZlp8WKquFU2l08
	8+uEZAZkjGMiyZzkHp4zQhsD6AeQzFdlDLmANSztRJKbjO/4iIdIV1l/xZMg6yfXhWF+eu0NJ7W
	WKCDgPLIJXJUmviXVe9DfNhghgTxKdRPSmCktNXqbX+7tyj2yldBMfXEterCUt5ZNIAZttB3o0U
	4xFFBaRP2JUCUJt1PlNVFbsIQFby9jXjhFHSoUIdPhw==
X-Received: by 2002:a05:690e:1286:b0:672:c272:f6ec with SMTP id
 956f58d0204a3-672d59bebf8mr157304d50.80.1790100358515; Tue, 22 Sep 2026
 11:05:58 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Sep 2026 11:05:57 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Sep 2026 11:05:57 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260806170602.4112602-1-seanjc@google.com>
References: <20260806170602.4112602-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 22 Sep 2026 11:05:57 -0700
X-Gm-Features: AcwNN1Vwfxfy5stGyMAgpGhv0mGDDhp716mx7weUKBt_bAXRsWwCzdRg7UtOnP4
Message-ID: <CAEvNRgFZBHqiZuXawTjDU1oPR=u3yqBzXW5ku+B2rvMAbBM3vA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] KVM: TDX: INIT_MEM_REGION fixes
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko Bot <sashiko-bot@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Haotian Jiang <jianghaotian.sunday@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> I completely lost track of this, meant to post these patches weeks ago.
> Compile tested only.
>
> v2:
>  - Fix an off-by-one bug.
>  - Use gpa_t instead of raw u64.
>  - Tweak the order of checks to bundle similar checks together, and to perform
>    the super basic checks (alignment, size, etc.) first.
>
> v1: https://lore.kernel.org/all/ak0skG064rhKUC8d@google.com
>
> Haotian Jiang (1):
>   KVM: TDX: Reject INIT_MEM_REGION if number of bytes would overflow a
>     u64
>
> Sean Christopherson (1):
>   KVM: TDX: Fix a benign off-by-one bug on the end GPA for
>     INIT_MEM_REGION
>
>  arch/x86/kvm/vmx/tdx.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
>
> base-commit: a806d364ef288a6443a1337820ea8410a7ccc6b3
> --
> 2.55.0.679.g6767b8d81c-goog

Looks good to me, just a question on the use of check_*_overflow: I
thought Sean didn't like burying an out-param in an if-statement? [1]

[1] https://lore.kernel.org/all/ag8BmtzxTlcuA_zy@google.com/

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
