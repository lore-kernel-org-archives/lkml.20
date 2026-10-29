Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793316407;
	b=WKlNXAXM0WYGTgyPaTi65tRrz04Ka6kWvCrV+OHLVHgVdnW/5OrJbJRsqryDPwRqzq8M
	 Kni9Umh0hUfEW7KmBdfeyGmjBqTfhuKq3w5eIeovrNAvWz2i2ygQELZXsnzn3bCUFjx1E
	 RrpVWa8LO77C8C125F0yBTMx3UtAY/m5Ct2rNLPksCjCN29uT1wgW1Q6EF/UDzwRDX741
	 SlG2NMilvYLrONrxOD3OM1UvMaxhARJlEG8NVXx4nOzcvf6QYB7Y8zn/M46v5IxbC9P+j
	 sor7O/5Jbi6rr+oAMXY9Zc6837JA7jMcKeqIZ9qXmKsO5mDkTtKTVL99NSv8bYRbE7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793316407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yYH3RocyPgWezXrGK54xrpA6RaOriIdgQYE/bOmcp54=;
	b=0P1rThJEgOYKM4pNA8vedIPIWvTtW58udkVPIP0MB0ymcFnu7ogVnIzqIZ+aarhkuXnP
	 dQoDXUjboR6nMeHEP89kH3SJGYd5vK5nS8yzO1udHkSuSOO7/1tNFWZ3fh4mXwl5rWKfA
	 R4OurbGAPcjYTsLvBmWNdd8a2Rp0fLNTihT6OQVWiooGdHDpOA+XLt+IyxT0EmLG9dLZE
	 rcUjfQn2W97tBOaj4XqUyWyGLiF4KAAMiXYkyyIGfW+3o5BxuHhrK1IGdAAE2625ecoxA
	 MmYlbKhUDICgIHY95SH5m5lvF0TkHbWRtbsz/gpwEbpgThPOIXB6rRps9s1cPxU264Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GoH8Oosm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BB6606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86BB6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GoH8Oosm
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so5067a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:26:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793316405; cv=none;
        d=google.com; s=arc-20260327;
        b=rsiw59yUcdMak+xmsFwsErCZOsATza0dz8+xDTLj8xj8/8Sc9UTzb4EPAlwcgfMHg6
         SBgxvmC4bvdgoxz8gVTrsqCNJCVFcLsaB1w5MhU5BkVvRZiqqfl2Z19gk1jen05fu2bd
         jdftnqnEz4Uxzhn4Jea/oOM2RrGHwxJQpeWTO13PpeqFFeQ8NiwgsR04ECb+1blX641a
         sg4HjB3QOoZ8iA+MkYx3/hMt1VKIofOnRDnEwNnNyVF4R76fOfyXTsqAu/4ISNLhlZOs
         e2E+YsPWbEYWN0PYrfKYjfvl7/OWu3aUIzKzWV24NYd7IQVjOIDpbmk5k2XobZXdiixY
         Ml5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yYH3RocyPgWezXrGK54xrpA6RaOriIdgQYE/bOmcp54=;
        fh=4Qnqzlyu4wPUwZEMaUppu+Cxsu2tVKDPs5hsqJdsy7Y=;
        b=JkJ6yr04nLZ4uOi3HwPB5cRsA+cOIP5PbllQm6AlTlRvfjMb1u57HgJMDMSdnEm5rq
         wPY8qJcxcLPNQhaOivMBieu5FN8p/m8qg13FeJr2ID5JkNJWzwiuzkycl+/tZkggqPIz
         PvgctGWsLSKSGOYdzyDqXVcKXjFUqsIndS2CnkGXFbYl5w+l76CSMap45ulyCj2yaxNT
         dpYn29pHhqumb/+HggrUN3qt8v/Kc+WdUn3qUhLlfRtS0iqyiVKRu7s4pR1tZ1tGZxQ3
         jlUq5fQVAllHfeZIU1lTm8KicgD5G1E/HJqPidAoA8IG9bDu2tPIICpSHztf3sVneeQc
         kMEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793316405; x=1793921205; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yYH3RocyPgWezXrGK54xrpA6RaOriIdgQYE/bOmcp54=;
        b=GoH8Oosmkz9B07pQnR6cX7nTZI8hDA1ULa7uTLwGKAPHj24WbOPMX7wEBnG+APx/0k
         tr+IBvgc3LqD4kWQscyU1PjXkSMGsqTkxf1c6qwvGG7nLJVCh9BwoELCdQVjJ9422ffO
         MlnqXCeD/5JWLe+7znpgRMuNppJF2PATQmI05v3GeXuYp8OJE5OdJQTOShf7r3qrJgWI
         Eg5/8u4Lz3CU5G7YWgZTLiMOfvvm3A6N/CdZtDuum9whwY2g5RzEMXwtm4yt8U8M997v
         MWzGWeTU5t3XpX37E+NrgbmNLL0qZa070TeBQFyLhTdIa2J0QdbsW7QWM5lQTh2zv3ga
         0rZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793316405; x=1793921205;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yYH3RocyPgWezXrGK54xrpA6RaOriIdgQYE/bOmcp54=;
        b=naPSk61sjFxlmPMB9LiVLD61l12T375gGnauCogM8fB/e2ZBLduhONp5Dl8bHRM5jX
         1jyI9RF7qpClOpJVbEmUpmkyXv6ETzUMDtep9XiAAZYGOi56fZKCleQNu4XS+/4VuNOn
         F6bxf8kgj0f5KDvV3oh2s0gT7Q0kiSA/vFckqL5uBoDUptZ6tvA87yGxmBZUnOMMNAqT
         UwI1ezi9ZaphJgAYGvgWhBbZz53PamH9NM6cE9wRDZG3far7BW0gu1neDu+z/4pIJ1NN
         PZdoXFfggz/jkLDP77f+i4Pesv7RDmmwfs7qJ9064yoDHUtftRmUtVrkfwtKe8T0ww23
         rA9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzPX6aleOvvO1mVnnjqh2qfiMLPmcacKsmgUgfBL6wOEklCISR002SN97BS25vj89T8EXBoXZsO0Z+xCrI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYFumQCBOqXarwNCIpJyclWrGw3vxMf8D5jitcgKWIaKOmvfn9
	HwnT879CUaqVcRWuxrQRMKlDZVNsUdtSmExYm3fKlVhFNuxnClGSH2TOjx/zF/sWgd9sQkKU2tA
	qOraNNaSnoA0Mi1p0ldJ/6FOaFn64/nscwMqPubLI
X-Gm-Gg: AYBFou1twJkDqitZY81Yj2nsD3wkJ8aXyMHsFmJDupLKQQun9D+gi6kwiIyCfJmOdH+
	pYUA0FbOAiaFEDjjTya/jIB7t4yBeDwAsKASwg2EmJqLUSXC+vQBJToEEyieiH7Q51kvPqCfzzj
	nmV3fUFnTCOT19KKKwVfvsGqqHSDwl3vZHURachiyYJVweWfxM9FAIJr1hPWURJ1YLnvmZuW/qA
	rySvjq4mr2/jnuO9kkfAVFLKcSjll+xajSQVFl3vqQRgQM3+F9KTg7IYGN6ZWP9PGgYStyV4yD4
	qctYdnstYtM0Y8wokAokXLLwZkXZtd6gR7zw/l24ylmam3ZrC/1WGdwl1o0oqjhvwzfVbyC6H+o
	vj7fT09IxxsgPddVuQhkM7FhadFr8AdF2Kpy5
X-Received: by 2002:a05:6402:4246:10b0:6b4:2188:97d0 with SMTP id
 4fb4d7f45d1cf-6b4b1106ef0mr117279a12.6.1793316404675; Thu, 29 Oct 2026
 16:26:44 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260918193937.569414-1-zide.chen@intel.com> <20260918193937.569414-6-zide.chen@intel.com>
 <CAO9r8zOY8W6s5U8O_tZ3dERA4h+mnWWjeS2GDgF=gbo+CQDNLg@mail.gmail.com>
 <e5e719ec-7012-413c-a446-86fd35aca33d@intel.com> <CAO9r8zOLCBhWZ5P1BEU24p8++3jVLTPSOdNreBk3RUC10Z79TQ@mail.gmail.com>
In-Reply-To: <CAO9r8zOLCBhWZ5P1BEU24p8++3jVLTPSOdNreBk3RUC10Z79TQ@mail.gmail.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 29 Oct 2026 16:26:30 -0700
X-Gm-Features: AclHuK_4QMg9zYzI7j3e-Iti3pLTo86KYlWly6SV-6Z_xIbdZQsthDMnW1g0dY4
Message-ID: <CALMp9eTOvhiLw7L--DQp_0QaFS=O1TaCQ3q0jPh=70273DA+=w@mail.gmail.com>
Subject: Re: [PATCH v9 05/12] KVM: x86/pmu: Support PERF_METRICS MSR in
 mediated vPMU
To: Yosry Ahmed <yosry@kernel.org>
Cc: "Chen, Zide" <zide.chen@intel.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Zijlstra <peterz@infradead.org>, kvm@vger.kernel.org, 
	Andi Kleen <ak@linux.intel.com>, Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, 
	Mingwei Zhang <mizhang@google.com>, Das Sandipan <Sandipan.Das@amd.com>, 
	Shukla Manali <Manali.Shukla@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Xudong Hao <xudong.hao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 4:19=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> On Thu, Oct 29, 2026 at 4:17=E2=80=AFPM Chen, Zide <zide.chen@intel.com> =
wrote:
> >
> >
> >
> > On 10/29/2026 5:06 PM, Yosry Ahmed wrote:
> > >> diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
> > >> index 448044a2b121..f4d3801b97bc 100644
> > >> --- a/arch/x86/kvm/pmu.c
> > >> +++ b/arch/x86/kvm/pmu.c
> > >> @@ -806,9 +806,16 @@ static bool kvm_need_any_pmc_intercept(struct k=
vm_vcpu *vcpu)
> > >>                pmu->nr_arch_fixed_counters !=3D kvm_host_pmu.num_cou=
nters_fixed;
> > >>  }
> > >>
> > >> +static bool kvm_need_perf_metrics_intercept(struct kvm_vcpu *vcpu)
> > >
> > > The name is confusing, this doesn't control the intercept of
> > > PERF_METRICS (and it wouldn't be correct to use it for that AFAICT).
> >
> > Right, these two APIs do not directly determine whether the mentioned
> > resources need interception:
> >
> > kvm_need_any_pmc_intercept()
> > kvm_need_perf_metrics_intercept()
>
> Jim suggested folding kvm_need_perf_metrics_intercept() into
> kvm_need_any_pmc_intercept(). The name of kvm_need_any_pmc_intercept()
> might be confusing as well, but at least it's one less interface to
> worry about?
>
> >
> > This is different from kvm_need_perf_global_ctrl_intercept() and
> > kvm_need_rdpmc_intercept().
> >
> > How about change them to something like these?
> >
> > kvm_pmu_has_unexposed_pmcs()
> > kvm_pmu_has_unexposed_perf_metrics()
> >
> > Or merge them into one single API? kvm_pmu_has_unexposed_resources()
>
> I don't like this name any better, but I don't have better
> suggestions. Since we already have kvm_need_any_pmc_intercept(), let's
> just use it for now?

How about kvm_pmu_incomplete_passthrough()?
