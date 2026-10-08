Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09C03DD86A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 21:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791494389; cv=pass; b=BMZkLqmR2RlCqpycXEP9R3vqmZhuCw3dp8Q/B0zspoR2eZBBw0mdAvthkaaVtppY1hIw7IX8zUkrn2RNoBS5J+oIj0kU5WUHe3oPMx/44PDfVXXm/3Z1HkqoAkF4afSH4saiSBMEjhO+IePpJ1lTHGGLs8UvgZy2IsR5YCGP0NE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791494389; c=relaxed/simple;
	bh=RyQawn+OV1mo2o7XZ+wloEFr6zblvaiDgZw4ztEBr1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fFizwhfdrzrVXVZZc5Wj/pU0JEjs7wbz6y8ai6ZML29t1dpfBilY3Clx40nOfVks4wrHA2p7hvg8TL+bUFw6s5rHiWGJBkzcVzvmq0K4/aIEmOqXklQWZmopJzIr1XG6AZw8Lg2n/Pky5sL/3eXJW5cRaogVDhipNOh2BDbMs/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ja4WD4f8; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ja4WD4f8"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a9bcdf29a6so6023021fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 14:19:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791494385; cv=none;
        d=google.com; s=arc-20260327;
        b=pSh6OTtzqgyXNGgFvK7oINONhVgNJelxSOniRBPVl0HIiu0WGYUvQ6KIsLy/3cobmt
         ptdCT70UzuBOoMOZ3XGn+jC223uUiKIGXy+xraemuqF1V6zXGgH4Zlf+yzp28XF2xv/b
         BTTCCfYBiqoS3jI69e9luH1/WLFcbEZFn7egbzS9T/GPvfkH9Ir26zAzxUNWN6XJ4YIB
         bgwve/cENUkqOtZwWW6jrUD8e1vZOX7+BTaG2df7/Zob/1c4s4Kx0i1nlNctzxAVeTCo
         /tp67s6f/hZdzn/Ip0OuDkqtYXCeKAcZY6A6Ax7OhwIsbWspYJ8jeKP1MdRUlFGolF3G
         mqHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RyQawn+OV1mo2o7XZ+wloEFr6zblvaiDgZw4ztEBr1g=;
        fh=Y6bXrVTeIOroBqj+s3pS44HkC13H/0SlWXYO+49vaFw=;
        b=XAkYoVXuySupzSUsknWenNO5QEWDH/7zSEqT9D7W1C+WbmtAUFTIFzuqSjnERu8TrU
         8/Q/hNVukLW0iNc0kmRcW8u9e4wCCou+K5UBOhDXuMPY79XYhOiHXzLeuWyhPPjNHUIQ
         f2WiNWf6qzayIDX0R/jDHtxY87Pa94a5gIwd+lAz9qakAkyGbHOlIxvPD80ZIVG4RjRM
         SqMIeFupCJJtMLuzDB7blufxu8xP2qJ11gkQxmLt9L0y9NDygTuMU2+r0WKDuq9SMGn0
         ezc863kF04+VKIwCuzZcrN6uH/WZnInU4NuUZ2Oks+FS/C7XQZTun7LoYP3DeCPsVJ37
         yxOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791494385; x=1792099185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RyQawn+OV1mo2o7XZ+wloEFr6zblvaiDgZw4ztEBr1g=;
        b=ja4WD4f8VJBVxV8fTXVRliqcL7E0Vq+0K/yxwnb/VrTN6MYQq41e28iWVPmRc96mYU
         mWp0nHDAMqXBicZPv6Um7S21c8aEXhmpGO4x7Yf2CYKt3+faXpHp6aA7k94gnFtZHq4m
         6YPnKROVnnqnbXaB3/VmOz+1YBXe7fNBjrwrbN7bn/Ux5wIme5P9+8yx7k5FmoxuLOQS
         6mtrt+hvyeGtmIbHHjhFSVNBYjqnzgOrQ+QUyacCOx46whmxdvV3UDNlQfe1mWH4Rm4T
         BnS8MUikQJVmM9wYZpzMPLeKDCvi0/Kpzvxe38dH57GiVyiRsBC1T4sXwgsFVfCvWKMq
         B2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791494385; x=1792099185;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RyQawn+OV1mo2o7XZ+wloEFr6zblvaiDgZw4ztEBr1g=;
        b=bjKW8nxhZylpyku8Rpo4nP6mM34X6WRsIPrp8UW7T2yZ9CW718nNlxh/y4qG22gERV
         YBVwaIhXieZsO+guRuwJq/HS6vFUTzilRW+OzyH755IY45DG/gSvdZz7XVbMRMrOgu0k
         hulObEdhZArMzpA5rSCFso6239niWSw5t2aPK5hEMT116zVerIG7JL0glhgckec556lw
         hOu7uvWjnwmjsdJ09exv/Ogid/tx+Djk33bXDk7vsm0acdxQHJBm3UrG3Yy2Tv8vM62+
         ZX/RucFKKODi5advmAaoHwkFJ1kyIVfFIWDKhCnJAXFnonKC/sM7GM3F9VCllEHLBkVM
         e7pQ==
X-Forwarded-Encrypted: i=1; AKwUvByTNmm81eDq2E14yqAr/X2/ix7GTORHAZoJVhuBUOhfKUER7DLisGGXanPyPH8VWuDLYxQB2s6eYNOITYY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQpd9+dQYSNmDusp0z2flV9UHx2s7d7YEa5MXblUhtrqEQ3AiM
	1G8EKV74xp2+M+h0W62nivR8K4+xUUL6DM/ePE6qYcYBDM2M3TK9ARxiDJNBuoB5Zd6ewf0l7B7
	6RXSMVQjz95QrFu9nlTsqGY6J3y52NHQ=
X-Gm-Gg: AYBFou3O+5cFY2EHFYIXns/lcv9EavBu9hymJr+9xrkzFXghYNwC9mt1BJSRJsYAGUQ
	yEER19u5hRk5IlH9o/UCsKOkNiYy9+YJNkrugnHrTIE6Co68p3dscudm+/DFfZMDOToCYIehWC1
	STqFYTvyFXq+kyg4o0wtrFFcnF8ACIxoB+YoZahALVKBgS0U/ep3OWPsl4/UCs/j0wEFsbLqKFC
	r5v20s1WfcJgTlh/i8L9M1wCVQU4QLxhmxQ5U9AMwHWWPJ4MAZSyRYPLJUtW8qhKEikuphjcKmL
	t66h8AgVFkQKHDHZSqNecRWdllJDLOnFJl1/7+UIeqDMfeJAwl8ssKFNfQA9x1M4VHTOTTrptoI
	+wsOqJtwQf/zKxg==
X-Received: by 2002:a05:651c:a38c:20b0:3a7:e737:c401 with SMTP id
 38308e7fff4ca-3a9c2a6d715mr736611fa.17.1791494384639; Thu, 08 Oct 2026
 14:19:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008195608.965266-1-linmag7@gmail.com> <20261008195608.965266-3-linmag7@gmail.com>
In-Reply-To: <20261008195608.965266-3-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 8 Oct 2026 17:19:31 -0400
X-Gm-Features: AclHuK-dPUM5_kwRdWjxFHFwkBxSpn8txFraCtvQgNDCuna8iJ8OD-319zdUQiY
Message-ID: <CAEdQ38FXFC43UHjh5W_Z4H5BtVxbM8RQS2t9a7jUjzfu93jpRQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] alpha: do not clear remote MMU contexts in migrate_flush_tlb_page()
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 3:56=E2=80=AFPM Magnus Lindholm <linmag7@gmail.com> =
wrote:
>
> After the on_each_cpu() rendezvous, migrate_flush_tlb_page() walks the
> other CPUs and zeroes their mm->context[cpu] when mm_users is at most one=
,
> described as mimicking flush_tlb_mm()'s mm_users<=3D1 optimization.
>
> It is not one. flush_tlb_mm() tests mm_users before deciding whether to
> send the IPIs; here every CPU has already been visited and waited for, so
> nothing is saved. The callback has also just set each CPU's own slot
> correctly, so the loop only overwrites it, and does so while that CPU may
> still be running in the address space.
>
> Remove it. The shootdown shortcuts in flush_tlb_mm(), flush_tlb_page()
> and flush_icache_user_page() clear remote slots too; once the next patch
> removes those as well, every runtime update of mm->context[cpu] is made b=
y
> CPU cpu itself. That patch relies on the invariant when it reads those
> slots to decide whether a shootdown can be skipped, so this one is tagged
> for stable as its prerequisite.
>
> Fixes: dd5712f3379c ("alpha: fix user-space corruption during memory comp=
action")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Magnus Lindholm <linmag7@gmail.com>


Reviewed-by: Matt Turner <mattst88@gmail.com>
