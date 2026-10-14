Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584E52BDC0B
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792020715; cv=pass; b=jQRHZ8M92pdFzwAWs2mG3iwZqbVSuGeZje5ndIAb9XVEZLljmnpJhKdL0OnySNLevLTGX1ImGZhlQX52wubl+Z/WqXMMTl+TWVUsXYfjxGycvP3lqXoayWuNS/ssXWr6yUGbRHeCZiSMYqpu0XKWRutayXmyX41wGOuh14tfl4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792020715; c=relaxed/simple;
	bh=c+5SN4BUGc0cAYOqueGecoLgZhbCt6m/n0efmhJQ8/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KGGR0OAmJyTsxOveBUxRMvxOee1W7ndSRU+a2fgH6ZaZVGANNQdUvCCO6VaDNLLyKmByFjKev5crhTmKUJJQ8tFGHez9farTh++OKIvPpryQaQcteTtSI22co0jxhBmjHMDUWX7Pf89jdb0YLI94Kmajj/frAWGCuVqJ4TNsl5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OSKetn34; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OSKetn34"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso1049a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:31:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792020712; cv=none;
        d=google.com; s=arc-20260327;
        b=TAaGQZpd0CJEhwBPbC1XgYSXYkz6Gi5xQEYbk6/iX6/5GBYLKxpb1mYFYzTDSCGkAz
         JPew2xyTZbknv2mAOdGTn9q1lqRypiH/mWQUzOBo3if+CEZZsVy446bPj4J6adCe8WGf
         aDD3YuWKje2URBadyC5QjzThkvrcJkqxp0qkW9fIywVMN0ikPAoVxorVoHO+3OL5DfTW
         L2EQOV/RFTl9aVYyv8Wmvo27nMltcRux7+jrdWxEemXj/fbMlC3JaK4y7U8TU+Kz7q4r
         6T7rBdg9ofTPr+Tmrbrxl/EjPeggYuVwet2JOIvfHp99j53MTfhGWphs6758i94punOC
         7YbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c+5SN4BUGc0cAYOqueGecoLgZhbCt6m/n0efmhJQ8/A=;
        fh=Ws9aP6wuOD9YGPV1LL8SxIC9EZdzeoYpWdkwx3ipB/A=;
        b=ZF+vB7E7sc2H7o+R5LdpEl2EBxYKpOOw3j+7JIY/r09oQHs2W7OG7Jvt3MwnQlLSnq
         pvDDd7VBDXdJ7xHg4+xa1UGdz+rGjACPC1d7K7dYI5D/lYFnLByWsqPOcDnPDq8b2Ysc
         Y+dkHDva4R/HcAf3EQ/ce1aTr/mkI3YM4DheYir4JkDZDzk4qheNhgmRKKhIZGmrFJJC
         gKvtIAlng8ot6by90ziSz57Ce080txWsaN2praTVcOCAaNAHwRrFEo9XKBBskn4qN3ko
         9uJDnD4Se7hsnqaw0hr/iSXMujVzrqpbTv1W77zzuBIbkWcBRXOdAV3DkXpF4LuzNvny
         BWyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792020712; x=1792625512; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c+5SN4BUGc0cAYOqueGecoLgZhbCt6m/n0efmhJQ8/A=;
        b=OSKetn343/ILNReqXFVfz7BB7Yb2YxRsdHFPS7lHsXtKqtgfHaiXpBDd2qg2uqfwiQ
         YLK68EiDVxvl81HAjhs0OIEeAxy1fUvyU29WfmPmBwGeb9+FN3z5KcqMiJ9g9yGmI8HN
         hcXdkxCfRVLNt66LqtNg3yaOTg8PkQ4iUSjGCogwnKw7gmXl+yw/Q6p6JniEg/MrjNp7
         RdNHNsEflo5H8G5oPUkj33IYhtR4pJ9Viybcdj7d8PJgeTvCeOS/aT0fsfOLddfzpVQ3
         xAPBKrjYORzOeKda07wh1EFcIFlx5VH1x2CqWUYrlh/KV8WDoxwmvnSNnU5GOnofwb9o
         aPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792020712; x=1792625512;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c+5SN4BUGc0cAYOqueGecoLgZhbCt6m/n0efmhJQ8/A=;
        b=Mv28QDbZsZWLKwKmixqDpZqqnWG5q/m825Beq67AY/3WeygskjCtM+SZbyvKrNCcyH
         1MsybVHyFPBY9AH7BD40kOK4yrrPMm/ORu27FikvECsKO9BWVQw+sOcq5syG7ns/MdlI
         i2b2ECYcJZ7itNiMeBGRevugSsP0By1ZAvVBSy5ESD07Qc+ZJPTzDkgLJGmTZloBm4Dl
         FSRZfCpEg8Xots2KeygBoirq08/t5+9MPCKKwB4zf/xFHGAzYMduNq0+x5TnBBzDEkhQ
         r8FQm7GxHL6bTpa/TrcjVVnPKSxjZzoGaktAn2KT/LFece8ptTNxqQSVZhnQsbS29jET
         QjXA==
X-Forwarded-Encrypted: i=1; AKwUvBzQ3aYueEjqjEiOrF5Na292Oa7K5owPTw1BcTMX2FjPBrYGSjJOuYRC0/G9TcG5kDtitT9asXBZ40f/vaA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZ17P/liVW5IMKvNCmLfnbb57GYhZ3GK/SCpVhIcFDwi+mtDer
	OpoBzwDvTFa4dpo4rpcrSlzTd1Gy+3rma/SdiWBZt8vW8zTcTCJIfOSebcj+9kNt2O+jI0kvIbJ
	WvU5Olh7IeeN/sTq/OcP5itUFsnpzwhRDAzuQJLNuOVawiQx0FCY+drsQ
X-Gm-Gg: AYBFou2qtQDIrRkHXoi/u8+Rm+iTC2fY9LIyXZNtBFq2Yw65HfscrN4GCSvv3CgYVc0
	rOBqg3tmIq74o8FQ9/YaSyFBU5RCqAeXhZ9GyHHcV6SryY3Bg55CKELUTyTdKAFdnh3cEf1m8NK
	GQdn/NqJoSwmwPlWzXga5gsDGte1VhAEcUc+z2t5pTVbNn2tCkLXxaZui/xPfMhMCNgkAeobdl2
	FvQftmExIptDSYB6izEvdTXlqj2tfdY7CLaO1St4Dy3POruLdiBORbchJxwLyHbwiRumnjaSL9O
	bfdTWjzaHIkkJIlKsQYc+lfa9UDfoq4vG9PxW3Ng3gbzN+L8CkNywCPW
X-Received: by 2002:a05:6402:5c3:b0:6ae:188e:e119 with SMTP id
 4fb4d7f45d1cf-6b32bb8e2e4mr1000a12.9.1792020711839; Wed, 14 Oct 2026 16:31:51
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-8-yosry@kernel.org>
In-Reply-To: <20261012233638.2546339-8-yosry@kernel.org>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 14 Oct 2026 16:31:39 -0700
X-Gm-Features: AclHuK9EHCeDUZdnrI67mbvozJY-igt-Nb7vmrmchnbUjAve2Tz2b0393hkSlgY
Message-ID: <CALMp9eR7u=oyfYPWuROMyW-2aOPDznTaHHjK8j+5=SCxaKbgFg@mail.gmail.com>
Subject: Re: [PATCH v3 07/27] KVM: SEV: Do ASID initialization at VMCB initialization
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 4:36=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> The per-vCPU ASID does not change for SEV guests, so move the per-vCPU
> (and per-VMCB) ASID initialization to sev_init_vmcb() to do it once,
> instead of setting it before every VMRUN.
>
> No functional change intended.
>
> Signed-off-by: Yosry Ahmed <yosry@kernel.org>
Reviewed-by: Jim Mattson <jmattson@google.com>
