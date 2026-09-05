Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644E930E82E
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 01:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788571108; cv=pass; b=nITSJZeF2aYCMFFi3bku3EpQ3ZdTXDywiXAKYmwje4HzvRGvUmqEO01lxOakbISs4laC5DIclJEXg85YqkGfVIsQFOxwDSILOMSZqad5o+FatsbJtzQsu1UoK3/nK4zbPS536YrwJXsoRkcAB+1CZ4M4/1YjH8z1ya0l5Naa4hY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788571108; c=relaxed/simple;
	bh=QRWFS+GgSuBuV0EOpOPKRYi+MPqomhFhRkXTuO72POc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HOzBoAd4bWmvON6d6dOK+kxjn+Z336ne+f5KpsMdY7byy22pw7uF3Q/wddNGZa5Y10HFo1Qh6soR6mDQstoUeTQdhAy2bom3dJNbqAqbGt7JVD77GdVxzF7ajucqy7y11xGl4jvNDG33Pqh6GXH8hDxJd6b7a+4wuRJaXf1eF2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=clyso.com; spf=pass smtp.mailfrom=clyso.com; dkim=pass (2048-bit key) header.d=clyso.com header.i=@clyso.com header.b=eAWN2CTo; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=clyso.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=clyso.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=clyso.com header.i=@clyso.com header.b="eAWN2CTo"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c160420289bso195290766b.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 18:18:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788571103; cv=none;
        d=google.com; s=arc-20260327;
        b=SArv2yM+jeTjHl27ulaMM/HOjC3ggvSFkm8JWiS1xojtii7Fe1yG6YmlfX3hyjWhtX
         nXku9V1JoRrdRUwicgGKycMKbUj2InJEE2erEsEmG7xWdLG6bn1H+35bJTQ5CWp31+K3
         hIs82tTnLA3c+EVgT5vexE3bxAXT8pz0NPRpgKSG4EaFWTMwESgRHsQSi3FQL302yKuj
         BTDA+mO+pKz+ucXa2fXhXKlmlrv3qjOaf8cizmDGGVBXlz8eHW/JMbXOOELe3qQNajkm
         JFm3HyvXMWfau4A2XkwypWP/ngPYbn7NexujwPcIbfZkb2qG46rNDhgPSMXM+2KnMF4Q
         +fXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MC2O83yQA370xxba7M3dBk2YHStIU44lILC32r6Jnrk=;
        fh=hLWo9Xxc2BFmkKPtCm7cxzH1PLDca7uYR+8pc7AdyRU=;
        b=j23ahd3wYGnzXr7dI25BxHMM13QHOYsNtxX7x62fYNW8XxcvRtGzOMHv7nAQGKe+n2
         Bm/7USn6/DvFI0oGUnOa+QAGL0gYXkp5BAoVX9jREz92WuDtq0QCxk3S++YnMr53Wtoe
         E6F83qE4zOINuCtcbPOcE0WtmrKJQdedI2/l8kWA1m3E1Kz6FEpwVoKLI8V8URDOa7WY
         kXu1MLwkSPN1t7Hmv8me1HbOI/ML3s5ztBuqMB8bkZp40Mr+zMHU1pNbG4xZj7B096kS
         EZStMwtGzemyaG0a3Fpyq2Zka7awcD4w8RNmUJVx/R0jzpWd1/GWDLOhpjzVP2Gs4eRB
         WA2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=clyso.com; s=google; t=1788571103; x=1789175903; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MC2O83yQA370xxba7M3dBk2YHStIU44lILC32r6Jnrk=;
        b=eAWN2CTow+E996I5x9d1j3DbWJx0UtN8ZH5WYW1MFMlMO/xKXywG29SOt/pOWkUxEn
         fEaNTEKjWtEG0mo3mv5vf1M27dAHBmsVcCuyX3neY7Xb1TIhZ+H7PmpEfHPwjmPt0doy
         sJHPRt+mSEmHUFs74+p5uoDv3ltOOKA9Ff3DJvgbgrxEAx8FvN/SJQgDj0sJYIvEMiBB
         0LnTFqnbElc0MeyBBYW6+v+angPRza+IUinDJIiHs7cFHF+RAdKspnxopXZeIkeInQJr
         v9o8pNJB+DtB0q/4g6aceivClTjOpGfOmZy6WWSt5StJH8+2cTH8b6O1EBM9PybUk/Dg
         NPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788571103; x=1789175903;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MC2O83yQA370xxba7M3dBk2YHStIU44lILC32r6Jnrk=;
        b=oiCOH4Du3l3cyuUU4QQ0avyGaUoOx9NWTdM125isOoa646+HqarsH2+IiGSR78QmdV
         CZ9UTmC6d6CNpQkPym/l6rYmrb1D2Y5wipJVeQbfaJkQvmKsoVGgPJNlvPTUvG8gAsMV
         +EM+dNbtznM1AL0qTy30Dl5apzfpf3UBDW9vmv8k7mj+p5PZddPjasK1ErYRC51+wzvt
         Mpy+mIoDIrlqx1pCjGp3WLuiqC5AEgXoZ6T2JRHWtD22YIPXXTxpM2UEWGl075KPY/US
         XtWxZjoLUNCVHbmNxpYBINQgXkCW4w7VZNbKPVSDiL0MaFzFnUHDs5okWH5aapQ+dHjY
         fZ7g==
X-Forwarded-Encrypted: i=1; AKwUvBwVvJxvRRjtSK2kYopcLOE+J5vBvsw04oWH4Jda9oEs1409vIbQfMUkP3BshLz1Lf3eSWTU2Ks4R2/qWUk=@vger.kernel.org
X-Gm-Message-State: AFuF++k8QTawBR1/eKnlqdviSAduZZgqQ7SIJ31ydXImrHesohdAQHpb
	LTypYup0tkG8p1o5AhD5JNta7UESyg83M+UgB2yvdDh/QR9fp9JUkawSV9zKV4zWxCq3sPlCMrz
	YCaYF1LG3xRmPEy1XCUv5P4oNFEu5aqEXjVwviH1bcg==
X-Gm-Gg: AYBFou1hA4mvKC8tz/aZ6OErSQPzWc00q/5U+P7gSNuD+/6JGkobpPCHoqwEeQ1jDB0
	KiRfNBSkHOsoFCaDKg5oxTem27V7cDqqUxoR9VqaxfGx2vMMfBYTtgnLRQzHNp+YzhirDANA2lz
	7zPwVGybR9fTbr1n3cCax4EvMIZ8og0KzU1KV9CKOaFXS7Rt5+ct/AWfRfNy8Ma88HaKO6a8IJu
	Lv8mh+o/sVmzZSuxFrjZevKOfFMQuojupQ7Rag/iaR6z3vV80ybbaaJiY2nOm0UZ/YuE1nyXfyI
	3D+epAEHvHW3AGyCKCFV9KnSDvwPf6SL0HYqg0p8W2l3xQ==
X-Received: by 2002:a17:907:9709:b0:c26:2a5:819 with SMTP id
 a640c23a62f3a-c260ca1f474mr642465966b.18.1788571103585; Fri, 04 Sep 2026
 18:18:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904103351.15357-1-max.kellermann@ionos.com>
In-Reply-To: <20260904103351.15357-1-max.kellermann@ionos.com>
From: Xiubo Li <xiubo.li@clyso.com>
Date: Fri, 4 Sep 2026 18:18:12 -0700
X-Gm-Features: AcwNN1VahgJIxFl-EEQrkp0gkp8R3dSoW-hNCnMZLa2sVOL76dxy0sOlZpB3OjE
Message-ID: <CAOJNxRLfDHmW_+jtUQogRcHCGKAyQJKBkQKQRM1i0Bvj2vkLVw@mail.gmail.com>
Subject: Re: [PATCH] ceph: avoid pending truncate during nonblocking cap acquire
To: Max Kellermann <max.kellermann@ionos.com>
Cc: idryomov@gmail.com, amarkuze@redhat.com, ceph-devel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

LGTM.

Reviewed-by: Xiubo Li <xiubo.li@clyso.com>

On Fri, 4 Sept 2026 at 03:33, Max Kellermann <max.kellermann@ionos.com> wrote:
>
> Readahead acquires caps while the folios are locked.  This can
> deadlock when processing a pending truncate; truncate_pagecache() can
> then attempt to a folio that is already locked.
>
> Return -EAGAIN instead when `NON_BLOCKING` is set, causing the
> readahead to be abandoned.
>
> Fixes: 49870056005c ("ceph: convert ceph_readpages to ceph_readahead")
> Cc: stable@vger.kernel.org
> Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
> ---
>  fs/ceph/caps.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/fs/ceph/caps.c b/fs/ceph/caps.c
> index bcb04c6cb92c..86e195c5fd32 100644
> --- a/fs/ceph/caps.c
> +++ b/fs/ceph/caps.c
> @@ -2889,6 +2889,10 @@ static int try_get_cap_refs(struct inode *inode, int need, int want,
>         }
>
>         /* finish pending truncate */
> +       if (ci->i_truncate_pending && (flags & NON_BLOCKING)) {
> +               ret = -EAGAIN;
> +               goto out_unlock;
> +       }
>         while (ci->i_truncate_pending) {
>                 spin_unlock(&ci->i_ceph_lock);
>                 if (snap_rwsem_locked) {
> --
> 2.47.3
>
