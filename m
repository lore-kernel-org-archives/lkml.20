Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E38579839
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790193824; cv=pass; b=UbyGs76IXAd1FmLPaNs7/UYUkHllbgUlHHv1CK39l/QRA6RCwqWBTuUi/rtwRtdw4VT1+/IHbn5vkZBt6L8dzo6Zkye9s1mQi2WknFkbmpuW0mTd77jpa4W0Gj5M0eNmiHDYHkpG45Zdnnv2aVyobwOEUPi18Zom38WkQSxjq3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790193824; c=relaxed/simple;
	bh=Iz1BOsxdBuKj477nqSQYHD3rX0TjsoDNNyelP73QuMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VYCEQ4yxKAu1npPeUE412CF7hAnSZsxVVeySwKS/QS48VcBLciyoVulnKAak2aBYvuPBumeiZ2t5Z0JksPySbK425ixqI9MNXU1EeNeJsjfbDoSIH7RWRw+F4iqXrwGGbvegZ5TTyq4HqWtE3w7K/bJrrF3iEmZUGVoV8nEOxJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mqy9yf+m; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qu8qV2NT; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mqy9yf+m";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qu8qV2NT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790193819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=81DZGA9FL/IAuER9hPI/dybgl88+ZKCRPSLQjN963CY=;
	b=Mqy9yf+muVWnuWRl/cwk2VtocOYtsHbxV+UJcxri97zJNM0WiPD1mOslQNFK2duTlpsfBP
	JsfotgWWmtR3FoRUeGrBjtdSLkjQZ55jW/R38Zj/tZd2ET4d6ItOHs0zL+COphSNv8FGg8
	B7klsKw3pBfR7C6H3bcX+MxKCsIovNU=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-urQWUJNUMMWZINCHOLcTGA-1; Wed, 23 Sep 2026 16:03:37 -0400
X-MC-Unique: urQWUJNUMMWZINCHOLcTGA-1
X-Mimecast-MFC-AGG-ID: urQWUJNUMMWZINCHOLcTGA_1790193817
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-672e7c0d4d4so739391d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:03:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790193817; cv=none;
        d=google.com; s=arc-20260327;
        b=oYJtRri/2Yi0q+JUb+HKkKgvXyuWLVTXnIcQcrZqAUh4QKbndkrXs1y5tK8b8Is8jq
         XUBZuhKf6tPrWR0lYgjxWwWvkyjGWwuHDZ7CxuqhgG9qZX2uz/oeaApp/cE3SsXu4js2
         S3yaGgpq6tLAx92OC/Flm2qH62eRtXByPE54lUUoTc9Wbi0ZYj0A2aBCdGVQ5rSp50h9
         Oe8narZqfBesHt45ZC0Sa+YROyriMWV33qmvCXtZue8zKjc3SSE3VEbMqAJoJQivM6jX
         OvwOS/JXEWKiz2jIn/6kXzOzP67wWtEjO8zEQN8HfCLdMepJDSvGpdcehOrjYM4Zs3Gl
         ckEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=81DZGA9FL/IAuER9hPI/dybgl88+ZKCRPSLQjN963CY=;
        fh=3pf63bz/8rbjfI/eL7DKI2T+xDG9HVOyXIKvJ7MwZBk=;
        b=lOEIvCJiUuFgsyQLnEhIFtYrvSPDebAehG3uh7ncte53wuSgPsoZvjK4rDhO/7lfAZ
         +6iTng3P723U5yim9D1ckf/lLbQxEJZ/StatQURHnuXqdyw3vUXex9e9Ad/aJ8qWUlr7
         RAYTPGzL2ns8vGmTVYd6oqES/aEQ1++1bvG+b+F+p4bMtTmAQDQp6OUuK8KE8unejIAI
         Cq9p6Hxdff3ISyB50HfOR+29lcuBL/p5JijwCbFndQzEp/nk3DsBfrkysM2/XvChZUkE
         o38oCzrv2YQdEWbm0B3gkeUJlLlIW7ZgcXxuzj6U5vaBZiJZKEXcrM878mAygYUPeqm8
         2NQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790193817; x=1790798617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=81DZGA9FL/IAuER9hPI/dybgl88+ZKCRPSLQjN963CY=;
        b=qu8qV2NTJgeuzLXA17v5SHoesjXBY5KzN6dTXV6f6lhX7wDU7D9sqCP2syumAYdZ0j
         LgOhjhFKvoIt/O6/ibsnUuMf2uaFZt+Gaf9aBpKN8hHd5dq22YlEJQTd1mrBHrxlqjRP
         BeVEZ0dwHjkOJ/sJJeHi/Pq86oeto9K8mDJEh1fHjU84xidC30BhJ/2vNJryfLBZRaS4
         14E1ROVEwvl8Y7ToTXx+MHGT5opS6MFlvR8OZEOBa6q0OrnuficsGGa60EGNKMjDfAaF
         6UbzditGUAS3O8fiVrizbmzq8q5TT/BpWJPKgU9ULabqr99wz88/nUOAM2o2UTxiJPR1
         wkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790193817; x=1790798617;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=81DZGA9FL/IAuER9hPI/dybgl88+ZKCRPSLQjN963CY=;
        b=pplNeqt/JBsc6XeUR8f2JDpIz7bTMecm0H+EoSyd+y0DxakH/bq8ZkfFmlzh/wmN7s
         7Sy+JAkkrterb8SS7wHdKjEOmWSzKui6a9xCIBqBl5B/JrTgwBFSnahIBOZ7cswhnIFc
         9za0gAW014Xa3wcovui+FKf/Gs0VbKAo8rcs6+RwRFWWC7LrSR6TqcgDEn9R74HrUJHj
         t/9HuKsDNiUWKiaCeRztEPy2rLq8z/AfRwFmM6g8PV1RPJI4sWdoHhMs+EkjbTj028UG
         or+Eb3u9TOL3wnPUv9oLNlxe0Cm7EvB2UBZs1t51RhHci/QUIapLB/czEGGsZ8lHRDor
         uytA==
X-Forwarded-Encrypted: i=1; AKwUvBzBSJXJhcONCmZaRNGjpUp7R7xdJl9oZOO+waLaAvWUSLi517izf5occMcdTg9ub2bYwH6fUJGgWyZKkfk=@vger.kernel.org
X-Gm-Message-State: AFuF++kQmq0m61duAiM/QIKvoI1rdrylI3qY/nCG9OCwFWr6+w6xtdXc
	zg0R3tinkjz7uoa79MXX6bdsQmp2hi0YMiIAQJ2QGoe/as7FbdkPis32D4p1mD6FxwGduG0gt1M
	gVeqecWugqXhzCMiTqHezwGe1vE3v/iBKsx/jDn6i3QPzKCl+4oiRqD0jMfWaSbv1l1xeZO4wE9
	BUakfLmTuU/BXYlgzJy+6sCXg8/uBzLQ8xaP3NxXby
X-Gm-Gg: AYBFou3UxWP3Wqdt+OYqf6jMZPqcCkKT1Da0us6eXv8UUorwNC/F8qFxCR1DHjYRt0g
	SlEu7XoEdhXQqVBLvUIyfSyUjncx681VdXFZYD3j7yE73lAtbfzObPQ/nBwtBoP/H3Lg3xDhJhl
	vwYLpn0vn8BbRnNC/hJdLt7lBI1786oV1B6DxlPmMsgooIm7ViYCzbn6lzKg==
X-Received: by 2002:a05:690e:4805:b0:672:a055:f98a with SMTP id 956f58d0204a3-672ed51a9a9mr116075d50.100.1790193816925;
        Wed, 23 Sep 2026 13:03:36 -0700 (PDT)
X-Received: by 2002:a05:690e:4805:b0:672:a055:f98a with SMTP id
 956f58d0204a3-672ed51a9a9mr116058d50.100.1790193816473; Wed, 23 Sep 2026
 13:03:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aolxiwRzSDlJt2t5@aurel32.net> <20260824161259141TiMgABa1lW5yLKfzn4DnF@zte.com.cn>
In-Reply-To: <20260824161259141TiMgABa1lW5yLKfzn4DnF@zte.com.cn>
From: Jason Montleon <jmontleo@redhat.com>
Date: Wed, 23 Sep 2026 16:03:24 -0400
X-Gm-Features: AclHuK_kTUkYKrD6IxvGRUy1fLZzftbYinHX455LrTz5v_FdMhIrrFWYdq4Nqn8
Message-ID: <CAJD_bPKrb2Xw16M7E2MB1n3jGPsMTueFPnaex5pOkSU-Y2iTMg@mail.gmail.com>
Subject: Re: [PATCH] riscv: lib: Fix address overflow due to large count
 values in strnlen ZBB path
To: gao.rui@zte.com.cn
Cc: aurelien@aurel32.net, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, jiangfeng@kylinos.cn, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 4:12=E2=80=AFAM <gao.rui@zte.com.cn> wrote:
>
>
> Hi Aurelien,
>
> >On 2026-08-19 16:18, gao.rui@zte.com.cn wrote:
> >> Hi all,
> >>
> >> This patch fixes an issue in the RISC-V ZBB optimized strnlen implemen=
tation.
> >>
> >> Problem description: When using the ZBB optimized strnlen implementati=
on, passing very large count values (such as SIZE_MAX) can cause address ov=
erflow and return incorrect results.
> >>
> >> This issue was observed in device-mapper tests:
> >>
> >> sh-5.2# dmsetup create testname9 --table "0 8 zero"
> >> sh-5.2# cat /sys/block/dm-*/dm/name
> >> testname
> >> sh-5.2# dmsetup remove testname9
> >>
> >> The overflow in strnlen caused failures in string handling during devi=
ce-mapper operations.
> >>
> >> Patch summary:
> >> - Explicitly introduce the strnlen_generic label.
> >> - Simplify the generic implementation loop.
> >
> >This part should be in a separate patch, separated from the bug fix, and
> >if possible with some benchmark.
>
> I agree, I will split the generic implementation changes into a separate =
patch and provide benchmark results
> to show the performance impact.

Hi Rui,
Have you made any progress on an updated patch? This problem appears
to be breaking LVM on recent kernel versions. We attempted to boot an
early riscv64 Fedora 45 image with kernel 7.2.7 under QEMU today and
booting failed unexpectedly.

After some digging we found that LVM was broken because the UUID for
dm-0 was truncated. Since we were using Libvirt/QEMU I adjusted the VM
configuration to disable ZBB after which the VM booted successfully.
```
 <cpu mode=3D'custom' match=3D'exact' check=3D'none'>
    <model fallback=3D'forbid'>rv64</model>
    <feature policy=3D'disable' name=3D'zbb'/>
  </cpu>
```

Reproducer: https://gist.github.com/jmontleon/4cca07e6e5e5aa06b6b3e98ced052=
4e1

Thank you,
Jason Montleon


>
> >> - Add fallback logic in strnlen_zbb to redirect to the generic path wh=
en a0 + a1 overflows.
> >> This ensures correct behavior for large count values and SIZE_MAX case=
s.
> >
> >Is there a way to instead to fix the strnlen_zbb to avoid the fallback?
> >
>
> It is possible to make strnlen_zbb work correctly without fallback, I wil=
l reconsider this point:  if the performance loss
> of the non-fallback version turns out to be small, then using the non-fal=
lback code may be acceptable.
>
> Regards,
> Rui
>
>
>
>

