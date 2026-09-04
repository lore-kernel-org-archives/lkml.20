Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2283EDE6C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788510706; cv=none; b=P3x6trUKK2tJeNjZfOm+nwA182DmoD8hwTuG2USOHfokUNUx/cYnNoStpqMhEYXzLrhJh0pQ0gbB+TXuIFc183GadB5EkxQkB3jbFlcduzfmo2KerbhIZGqJqWWLkWj7uKGxDOG5BAlP6Huu5SbNXGm8uR52FXd7EGKZG7x9DJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788510706; c=relaxed/simple;
	bh=PkrClC/tbm7ovIkGhWlqayn7Nnc/7gRjXg0fhHUeqgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MMUnKXOcTBOeo5zmF3wyXx+vgrtOuP7v97jX1sB4lHcdbxTopwLX9b8TdLZMLbC8OFQhBSO6SrSfrhysPb0qPk1AyFpZhHW4sjNl+7M3yG+nhyraOBoANBb98/Y/EaFPfB/pgQHETQLI+Gss3+SUoNYXDK+kvjSAvXYfH+/3EJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XdTiI+Y9; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XdTiI+Y9"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-852c481415fso787996b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788510704; x=1789115504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p4WLi0L/B/Ti355IxU6nG0ELeTToNoFw6PkBrzW0jhc=;
        b=XdTiI+Y9psOUNDMQZyFXoZe7l8e682uKQ/4NYFNcNmlCna3YdetCZ0pKCtIvayzzXN
         bvBL5xKET6K+UYf3c2npN8ybHVKtUdquudFVYl6nkuXh3YlxASlYmu4WKTtK79fVCvMS
         U5RakXGho0H7R+NfCCgAVUxNIAJvp+x8HEOl8arVDJps47wh7+3VsNLN6Fpmma3C076K
         JxxJVJEboV8qoCdhX31LAKt978EmLIFHt4be20lbB+jOLsBDqfhj2Ll0bFXM5WU2OzW6
         btvzqK+Ht+UpTSAqybngIBYG6P9ptxrZ+xgmYKsRT3DD3kS/v2kOq/IZ16kZ3gc9fBBy
         AonA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788510704; x=1789115504;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p4WLi0L/B/Ti355IxU6nG0ELeTToNoFw6PkBrzW0jhc=;
        b=ERrfXOJh4tKvt5UBXHJGDXwmhGY0qnWm9UG0DB0LIYKwHNw8P+c1LJrPPSRu0iYafl
         /B4fACMBQbS7gVR9uZVBQC3YRnl1J496Z3hS397hkUsWjwiBoUTsGu7Q+t0kZnYf1H2J
         dnusrPUzcoXmwjFcju39sGk0sr0jYpvZTZpYL8rLkG/QuBaq4VAcVhQ47WRXg6VSyalL
         1xvD5idSoB87KaDAHI2kFTrLCJHtd0gs4PO8JeGn+GT87YnQzicFNHWyKKAevLYtjPAo
         /RMQV6f0HGWkJElu4/mmK6Ev5hdyqbdnlb6xqg19NZ6t+7tOpdueDn1gwxBaIcv7FSnp
         YVvg==
X-Forwarded-Encrypted: i=1; AKwUvBy4NjD4wrK+8aO834giHJm4Oa/1C2QkSEWbH5OZ/YP/5aAMu81MapcRTEssiSdQ92i15Yfvyvphtb4kVuA=@vger.kernel.org
X-Gm-Message-State: AFuF++mwPcZBSHThs0LJXRHSmwAfdsQi7ZnYwksVxWH09gG0zHf7WEsF
	guA29UtqXsIiqWspOvgoc2IPf0diwXnDXAoMMewhiFM4X2T8fZnKbEE=
X-Gm-Gg: AYBFou1DjULqhTLZLtBlR4DZ02tpNmM8Yofj3SmVG2At6RpBVJxXt7RzMpm0n0YsA4y
	ymmTE/EABNw70Vl7qlO1BrP+7wChaBQgKB9RtGF3L5wlclDfwLVB89xuCUsANXvg+qTXT+s/6s8
	y0LHQOjTplu285M+A0eNdly2OX3ZmBKkyqZQPCXyowhAMmnD+i0HtB1gXJa7v5sBJRnC8oir9Pd
	alDeXypG95YO5gFk8d645xh6dExDYvWj5Wp+nkItblNMsOYBsADvE/2g4FEbS0rYIEWOg1luVgz
	20gmrPbdeh6t7zS8ZD/KToqzlEyn4ng23kOWjjDrMdIDtKw05XIpJOKdzYGnv//UISGE4bYiYGs
	d21S9DtiIN80X8+ONsrnDFreSa+Oz1B65ghN3YGF0ntJ0kZDH/ESJGp+pr4emHDha05h9VHGONW
	qq599D1O1IB2AIMMgIBcY62Uqq0ZODslv3/Qc4snr5OjO9SMStSTG5UU+nNr5ZAlBUOAcij9ti8
	taW4e4LXhCPV54foozRnm/YCy4=
X-Received: by 2002:a05:6a00:300e:b0:857:7337:5dba with SMTP id d2e1a72fcca58-8616b373626mr7144753b3a.24.1788510704466;
        Fri, 04 Sep 2026 01:31:44 -0700 (PDT)
Received: from MalHyuk.localdomain ([211.201.32.99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-861537284c6sm861515b3a.49.2026.09.04.01.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:31:42 -0700 (PDT)
From: "Jonghyuk Kim(MalHyuk)" <malhyuk97@gmail.com>
To: christian.koenig@amd.com,
	phasta@kernel.org,
	tursulin@ursulin.net,
	matthew.brost@intel.com,
	dakr@kernel.org
Cc: "Jonghyuk Kim(MalHyuk)" <malhyuk97@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	mdaenzer@redhat.com,
	alessio.belle@imgtec.com,
	luigi.santivetti@imgtec.com
Subject: Re: [PATCH v4 1/3] drm/sched: cache the timeline name to fix a use-after-free
Date: Fri,  4 Sep 2026 17:31:38 +0900
Message-ID: <20260904083138.2135429-1-malhyuk97@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <f25f2a91-b72e-4392-ab53-c11ef60e0fe0@amd.com>
References: <20260904080618.2098450-1-malhyuk97@gmail.com> <20260904080618.2098450-2-malhyuk97@gmail.com> <f25f2a91-b72e-4392-ab53-c11ef60e0fe0@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/4/26 10:20, Christian König wrote:
>> +	return fence->sched_name;
>
> I don't think that this actually solves the problem, the sched_name still
> needs to be kept alive until all fences are destroyed and that is something
> drivers don't want/can do.

Agreed, and that is the same objection Tvrtko raised against v1. Caching the
pointer only moves the lifetime requirement from the scheduler to the string,
and the documentation hunk I added just pushes that requirement onto drivers.
I will drop that patch.

>> +/*
>> + * TODO: Both fences implement .release, so dma_fence keeps their ops attached
>> + * after signalling. Dropping the callbacks would let dma_fence detach the ops,
>
> That sounds like a bad idea as well.
>
> Dropping the fence->ops is to detach the fence from the module which
> originally issued it and not solve lifetime problems between the scheduler
> and the driver.

Understood - ops-detach is about producer/module decoupling, not about the
scheduler's lifetime relative to the driver, so framing it as "the complete
fix" for this bug was wrong. I will drop the TODO patch as well.

> I think we should rather re-consider patch 035219a760edb35ae9a9e96beba7f122e26a997b
> ("dma-buf: dma-fence: Fix potential NULL pointer dereference"):
> [...]
> The problem is that we didn't considered that there a fence implementations
> which still have a release or wait callbacks but rely on not needing to
> return a string for a signaled fence.

That matches what I see in the code, thanks - this is the actual root cause and
it is not drm/sched specific.

dma_fence_signal_timestamp_locked() only clears the ops pointer for fences that
carry neither .release nor .wait:

	ops = rcu_dereference_protected(fence->ops, true);
	if (!ops->release && !ops->wait)
		RCU_INIT_POINTER(fence->ops, NULL);

drm_sched_fence implements .release, so its ops survive signalling. Before
035219a760ed the helpers gated on the signaled bit, so such a fence returned
the static string and the producer callback was never reached. Since that
commit they gate on the ops pointer alone, so get_timeline_name() /
get_driver_name() are called on a long-signalled fence - which is exactly the
window my report hits, with ->sched already freed.

To be clear, I am not suggesting a revert: 035219a760ed fixes a real problem,
namely that "set signaled bit, then NULL the ops" and "load ops, then check the
signaled bit" can be reordered on weakly ordered platforms, and using the ops
pointer as the synchronization point solves that elegantly. That property
should stay.

What seems to be missing is that the ops check answers "may I dereference the
pointer", not "may I call into the producer". The dma-fence rules say the
latter is not allowed once the fence is signalled, so I think both conditions
are needed:

	ops = rcu_dereference(fence->ops);
	if (ops && !dma_fence_test_signaled_flag(fence))
		return (const char __rcu *)ops->get_timeline_name(fence);
	else
		return (const char __rcu *)"signaled-timeline";

The ops load keeps the RCU/ordering guarantee from 035219a760ed, and the
signaled check restores the contract. That fixes every implementation which
keeps .release or .wait and assumes it is not called after signalling, rather
than just drm/sched, and it puts no lifetime burden on drivers.

Philipp, since 035219a760ed is yours - do you agree with adding the signaled
check back on top of the ops check? I would rather have your ack on that before
I respin.

One thing I noticed while checking the callers: the tracepoints in
include/trace/events/dma_fence.h and drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
call fence->ops->get_driver_name() / get_timeline_name() directly instead of
going through the helpers, so they are not covered by the above. That looks
like a pre-existing and much narrower exposure (tracing only), but let me know
if you want it addressed in the same series or separately.

So for v5 I plan:

  1. dma-buf/dma-fence: add the signaled check back to dma_fence_driver_name()
     and dma_fence_timeline_name(), Fixes: 035219a760ed, Cc: stable.
  2. Keep the KUnit regression test - it exercises exactly this path through
     dma_fence_timeline_name() and needs no change; it also picked up the
     teardown issue the review bot flagged, which I have fixed locally by
     using kunit_add_action_or_reset() + kunit_release_action().

and drop the drm/sched caching and TODO patches. I will wait for your and
Philipp's input before sending it.

Thanks,
Jonghyuk
