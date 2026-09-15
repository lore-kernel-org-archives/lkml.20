Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097523A9622
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476805; cv=pass; b=SgyP1lF8i9Wf0TNJB5RQ5o/WcSW+st0Fi8otlUcnY1NCk6jByOD0CErMoMUw+O+8eWnVxB0GTkdiPoQstdep1aKAbrmzWkd4A1KE0MO4+AyYW1GcPn4ynTNS7mRgUtGH77oP2dTcjUJynWUnnKwiaqZ8kU2DKqrYtsv8qoljj1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476805; c=relaxed/simple;
	bh=JveBD4NjpdikQ0G4ZFLu6buTCcNw4yCNRgOH8W0zYCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YdhoXa3Ni81twCIlGM5waayWBTTY1ZpAJB9jn9GEBbyVKd8RpErjJoV6jRJOVW88fZ1GVlstxrkLVw+gHjQ4mbsvmJTOY0/XBLf3YOiIG8ErIrQ955gwkjI2AEuE5ltXch7rLKYJqHujDwGD2I1I1g0r8bDSEp7FNmAEC7Ufi14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WrKgrviK; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bDl1dwBz; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WrKgrviK";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bDl1dwBz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789476802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v8YiA/oJGna58idX6bHTg2NXYKQTwPzzs6n49mhKk8Q=;
	b=WrKgrviK0ZpJNvWz6+sVdF+7X9IN/Ikpu5g3yIVJZXpQ0w4Z4Da01i+fehN1ALbOyl8/tw
	VRvMp/MSMtDr3iSK+Z/rPvQfKIpVEzqgYeLSbMHFhHHBe9/QQed1uOi6uFgTFujcJJv6eO
	24rylXF08W3jUgPZoevqWAjvJzNkGYs=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106-uOQJTGuVPymcuzDzgVCXnw-1; Tue, 15 Sep 2026 08:53:21 -0400
X-MC-Unique: uOQJTGuVPymcuzDzgVCXnw-1
X-Mimecast-MFC-AGG-ID: uOQJTGuVPymcuzDzgVCXnw_1789476800
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso4500257a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:53:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789476800; cv=none;
        d=google.com; s=arc-20260327;
        b=QYiWBGarI7K0osmxkCOmSzQBNvYgLt9x8b5ksptI6le6vnF0OBOtu/ZvZO1wbsnkoo
         PUMrRzquQJ/suPqNmQ97xlKeowEEVElOq8nGo3j0byO//Qctteu7VG1ADsmLeQy3y4O7
         PWCkgzwH+nCpGtxTGqdOF3je4ThGy2mncb1VpxnOh2Yhr+fyse2uKQKENXwqLlFeSSe6
         ziEp7kh2tO06EELjy1aXXwEdRSSDDC6Qe2rxhPHYpM2qw6/hltmo4sXHKykKqCCh8cdz
         7SFkE1XRckMPANCtokmYg/w6ZQqHtu4kp79EBQEYX2oOcEZ9XeiLh91xu3QpfARJ+wf8
         Ce5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=v8YiA/oJGna58idX6bHTg2NXYKQTwPzzs6n49mhKk8Q=;
        fh=7vsEYmcUuNpEbIs4nxQHdn4it/ENjtB/0iLC9wawHZk=;
        b=hXog1JgfOzvpbMSU9xjByR6RrWLwPNJwhct3Ng49egbMJv6gu1t2Bs9faEYlOW8/69
         Ug8NbBpPmtPC67234rjvIRnRZYaqD2d2I381PvZSXMF8+I1qXJlPfzxOZIisoo0wYp4q
         OtTy/hmTnmCLJNyPuDXOKdrXs+R1uwli33PDWHSxkog292GuqzSi7DtPQGWj5Scf1K92
         3LKwisBA85FsVMzyEjGtT1nOModg/Hb8aF1rvQGIFaMdmJM3gutiAdfPs8AorW0Z8GCg
         QahjEGSShuMoWVZ01l8TJd7VpImGH4fzWdkgOkNEa6E8unmO/mwO+y1nmm26lHE4CxFN
         Z+ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789476800; x=1790081600; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v8YiA/oJGna58idX6bHTg2NXYKQTwPzzs6n49mhKk8Q=;
        b=bDl1dwBzrfN5ytOiVw92XjWdjdaED8ybQluWTXs/MHiNDPh2peWNMkJHFlvszVyaYn
         OPeIQWfsemGgqJT7Z7uywt6Wpxe0hqmA4rftdkacJ0i8E03sONw3igq1siSbUhg8JH4o
         lD9LjFuBvbP5LANOIwCHGTTQQ6Utqtpa/IlOGt2Q8e+JJlSJAXzwb6bw/9vghmyWe+ie
         1kMcyEm4OSmm4xqxP/GQ2D/8Kiwz8EFahqSpoIsTVdXLi/71nVAA+7Ee9Cb0EKzcBgGN
         xWOgJsMvcCbyrjT8nDoVY2wBEYBu1tt1CLiTiwVxoYJeyOw7mgkzsPAv18rk/TqqOXLH
         adJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476800; x=1790081600;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v8YiA/oJGna58idX6bHTg2NXYKQTwPzzs6n49mhKk8Q=;
        b=v1tk3rnHQrNkHii/kmT4xD6MUmu/s3msZ+qkrB9IuflKI2AoXH2sD7wlfr92AMUA8Q
         hDeT/nbLlwckRR2UjtEo8Msh4V01w97S9+3Jjgz7yMd2pRzjfW00iojESrEXMEePtX5T
         aymfQygPIVlFCeCf6o6xwNaM3lIaraFXCC7e8KQwXOLJVTBDocaf7nsFiBmhT9M317/T
         pAKcSl0SUwwzb1eDYSqey2mFxhJZmx2RyZy3ST7V0qcIQAthwsvsE8PfPYpbp6YsCJjs
         flu+vM6u96Y6pGmCy9Oft40VglYkHkhoaVFOEWkI8eKUUVLW+GVYjZHTse/y5kEp/0wk
         pg2A==
X-Forwarded-Encrypted: i=1; AKwUvBwQzpE9+68JtQcXC5nETqkpeX3Zyq7v6AqAYS80k2iqLg5A1iss3p1v2XkffR0BErLgeNzHsnqF+aEgkpY=@vger.kernel.org
X-Gm-Message-State: AFuF++mF9EgG4rbk6quTKAgbUsz3DgmY7pvWnj/eeWOvlRXoXQn4qruQ
	AeHt7uvpvRtTMjW6Eht3751vj7QDh99/ZqYBak0q1wUv9kXJm0hKtPSXxw4I5OYakWt2BxvstAM
	DmFNETSMoGtVFihLjfy+vX+Cl7No3ZP1BegDkPn25ec8LYxv0jFSUX5Zw5EeaRFt6y94W3468HP
	0UxnQe/wrhUIDriNkHo38Az6NRq5cIDvrye8xq6t+iKY7sgDJQpUs=
X-Gm-Gg: AYBFou3zUUjYSw4eocXVBQDLkJcwC+Y0q+DVHImf1ArYIUn5k8aqXfbbr104jW0SaA2
	HFt7Hj3O1a54FBLNqhgUC4DXdxYkzU8WwuvI+hZCYRWKpVIpKPbmrYcqOWGQN/Oi9eJaXjcuP7K
	EJmVsZHrGsnUukWYkCrW73oVr6kYw5615WNaiuNVsoxr1IRa74oDCRb0vZ4Vy4QcfUuTcPXSQ8D
	jPT/bvppESd/us=
X-Received: by 2002:a17:90b:582f:b0:398:e96a:8999 with SMTP id 98e67ed59e1d1-39dec05fc8emr15169124a91.16.1789476800131;
        Tue, 15 Sep 2026 05:53:20 -0700 (PDT)
X-Received: by 2002:a17:90b:582f:b0:398:e96a:8999 with SMTP id
 98e67ed59e1d1-39dec05fc8emr15169052a91.16.1789476799542; Tue, 15 Sep 2026
 05:53:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914143702.915401-1-aharivel@redhat.com> <20260914143702.915401-3-aharivel@redhat.com>
 <aqgRj7mfDhCUqWw4@google.com>
In-Reply-To: <aqgRj7mfDhCUqWw4@google.com>
From: Anthony Harivel <aharivel@redhat.com>
Date: Tue, 15 Sep 2026 14:53:07 +0200
X-Gm-Features: AcwNN1WfdFR9kOF37UhlEyvnuaXz_s8wik_ywIeuUwqJPlrCykEaJJ9xTEj48V0
Message-ID: <CACUOEi8ff_jeA7chF=TQqLc=UPJnf-nVizsq0h4JdqyGepGVOg@mail.gmail.com>
Subject: Re: [PATCH RFC v3 2/3] KVM: x86: add KVM_CAP_CSTATE_POLICY for per-VM
 C-state enforcement
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Sorry, NAK, this doesn't belong in KVM.  Given that the only way this can work
> is if vCPU are pinned 1:1 to pCPUs, then it should be very doable for the cpuidle
> subystem to provide an interface to let (privileged?) userspace restrict the
> maximum C-state on a per-CPU basis.
>
> My apologies for not responding to v1 or v2, I am guilty of Jim's axiom that
> upstream doesn't respond to RFCs without code.
>

Thanks for the review Sean, and no worries about v1/v2, I understand
the "no code, no review" reality.

I agree this belongs in cpuidle rather than KVM. A per-CPU userspace
interface is the right level of abstraction; it works for our pinned
vCPU use case and is useful beyond KVM (DPDK, bare-metal NFV, etc.).


> +      Option B: Use forced_idle_latency_limit_ns on the pCPU.
> +      Same per-CPU limitation, and latency-based rather than
> +      state-index-based, less precise.
>
> Conceptually, (b) seems like the right approach.  Per-task will be a mess because
> similar to a KVM-based interface, it can probably only work if tasks are pinned
> to pCPUs.
>
> And isn't abstracting away the exact C-state via forced_idle_latency_limit_ns a
> *good* thing?  Without that, userspace will need to tune its configuration for
> each individual uarch based on the properties of various C-states for a given CPU.

I also agree that latency-based is better than C-state-index-based. I
mean "Max 10us
wakeup latency" is portable across Intel/AMD/ARM without needing to
know the C-state table for each uarch and that's a real plus.

I looked at forced_idle_latency_limit_ns as a starting point, but it
doesn't quite fit as-is. Currently it is:

  1. Kernel-internal only, set by cpuidle_use_deepest_state(), called
     exclusively from play_idle_precise() (idle injection for thermal).

  2. A governor bypass, not a governor constraint, when set, the idle
     path skips the normal governor select() entirely and calls
     cpuidle_find_deepest_state() directly (in kernel/sched/idle.c).
     This forces the deepest state *within* the limit rather than
     letting the governor choose while *capping* at the limit.

  3. Not exposed via sysfs. No userspace interface exists.

For our use case, I want the governor to keep making its normal
decisions (considering load, predicted idle duration, etc.) but with
an upper bound on the exit latency it can select. More of a ceiling
than a "force deepest" override.

I see two paths forward:

  (a) Add a new per-CPU sysfs attribute under cpuidle, e.g.
      /sys/devices/system/cpu/cpuN/cpuidle/latency_limit_ns
      that sets a governor-respected ceiling. The governor's select()
      would filter out states with exit_latency_ns > limit. This is
      similar to how PM QoS cpu_latency works, but per-CPU rather
      than system-wide.

  (b) Reuse forced_idle_latency_limit_ns but change its semantics
      to be a governor ceiling rather than a governor bypass. This
      would affect the idle injection path though, so might not be
      desirable.

I tend to choose (a). I've already done a PoC that is working as expected.
I'll send a patch queue to the cpuidle maintainers (Rafael Wysocki,
Daniel Lezcano).

Thanks,
Anthony

