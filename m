Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792519359;
	b=pdmjHOmSCYPRfnODfEQfrgWY32wsLmrKBPm8fnRrxZCCyg5GJcWSj3KUPwiXmGQFizYQ
	 vTWgtYkRHkB6gabwZjYb7CZUd46fPdZnL0f6MDSuEMwD5CPPcpZvp4An9+IJQ0nI0FhTT
	 7c/VIRCdqIfV8OGnfKVpkcL/liDImKeKL4qbtg5fI4mCPGUszOIA2o5uG79ejWSfgSJ23
	 1jCQ7ygkPm181FUffE1jma/EYtGWb3FRnJeAuVkTzYd7xRTsaK6OJCamhuj/EOnfA8Z1u
	 BNJ3IscNZ/m9+4fjHRZ04H8CI4t5XIaCQat6bswdxq7h5tgXdJ4XUOE7S1sdFLBxLrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792519359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=C8rpwcTwhR1wNZ4MDDmn36u6aY9QjfzBpyzkSNu0dN4=;
	b=i7lwohD0i7FTYjYWTSdQn62M1gk/ytzHfxnIminIuBbHAHy3KcFEsZY47B9EwgmjiWkS
	 fqNhPMogetGuMkcxE2gB7AbPT60JHxCf6NYiWInAsMY2Hpzk4aPloss2AvQIrq4smFAMw
	 2LGMkeRceCtA8SlJQwm71Kxaqet/tcGm4IONqIBB3nZSOOqxriWWeffd4HJ5igkjuKUC6
	 Dq7dDgaXJlyAWqscr0EGIyUWnVDwShHywH8TyMA+G2q99D2w/OmM3W3+juoHhObvGCjGF
	 /YJAycUY0OEe5M6Nul6D1LWm8OprQAWRLys7tqXF27lBcgIF8rEEZ/bItMgNq2nVSjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=p8bz6OYg;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B83606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7B83606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=p8bz6OYg
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a0284121c6so28360355e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792519357; x=1793124157; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C8rpwcTwhR1wNZ4MDDmn36u6aY9QjfzBpyzkSNu0dN4=;
        b=p8bz6OYgN2TDkrAYVXnERjp07KlNyo0Boi1qFKJJ1BXDOcDAWohD/7hArdhyZHVqNI
         nmgk7qGRpFKJXqCCUZu/IyNdKR6BJLHSDLCQjBkCdUHQX3exgqk8wgXWagKstnmcy3o+
         2PzdZvoa3eJ4jctzsryM/cLefcus46IqARkXBRGq1NF0uiPaAVv+v0ZSCuWJKOnQowHU
         7nPbo+WHVsM/VQ+cHpU7DU8Cwa2DjL9gQvEvuNF6uzqkM3We3LjquvP+rNhLlpWMw2Ng
         Wc/y/BQawcVNcBeEMIhq7Gc2hb71uPe6j+PXkZ204iHqQRLpQBGcMGJM6eqxB41pt7nN
         h98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792519357; x=1793124157;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C8rpwcTwhR1wNZ4MDDmn36u6aY9QjfzBpyzkSNu0dN4=;
        b=rNDt/qADKEr4aV2WSk+/2glE4rfe9QNIy8OslrI3bruo+irJ4y8rZUo7SRI/u/52tb
         1ipaG5Uw6uTjehBANdE/RN7XctUefAa0CE4Q09bphOSxK+SW7dLcWOEJ01O5dbT5R6if
         xGs+Y4JiLEpHADVUo3c+5KfORoiuyxBWA2Wa6jb9SLL4+zPHS4X0OvWu37riQHYsgOHB
         9Qj1PQL9Ssp5EZvrApXsgBPq/duceK3qTRnB/iipC25Ku8GUqiUA8QnFtH9xVBGefL6i
         F3TyMvE7wKu1wtxGXU4FIDRLfw4rAl+J9zD7eZxGvfOFA54Pj05VPxvAvaFxQ/1y88q3
         rvJQ==
X-Forwarded-Encrypted: i=1; AKwUvByWp4/TD9gF2ZUmugRCKsmPMoVPtNASvt8Cpq3Gugsw94qfOhwpQMNd/sOKNMWKy43MVlEDLhYJvVWPLRM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvO4AEqA3cjqKDl+Qw+Zo1xAvfVnboQjR4oJZ8Mn6IUUpv9qHQ
	0u32aXneleX//rKqV7UGYjDrRfGrD57EyeSa6rdWXKTOQ5Xac7sc4k/IQNT4zBuXYjtE/XVXoiO
	MuwlmZ5tRwmjKqg==
X-Received: from wmfv5.prod.google.com ([2002:a05:600c:15c5:b0:4a1:b6ba:c116])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6289:b0:4a1:dadf:9876 with SMTP id 5b1f17b1804b1-4a1dadf98d1mr226083295e9.23.1792519356899;
 Tue, 20 Oct 2026 11:02:36 -0700 (PDT)
Date: Tue, 20 Oct 2026 18:02:36 +0000
In-Reply-To: <657547efeaea54276c50a0c106399366@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <cover.1792248922.git.jpiecuch@google.com> <20261019144807.1207781-1-jpiecuch@google.com>
 <657547efeaea54276c50a0c106399366@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
Message-ID: <DM9V2QCIFVGI.3VSJXUCU94ICW@google.com>
Subject: Re: [RFC PATCH sched_ext/for-7.4 0/5] sched_ext: Make
 ops.cpu_acquire/release() reliable
From: Kuba Piecuch <jpiecuch@google.com>
To: Tejun Heo <tj@kernel.org>, Kuba Piecuch <jpiecuch@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, David Vernet <void@manifault.com>, 
	Andrea Righi <arighi@nvidia.com>, Changwoo Min <changwoo@igalia.com>, <sched-ext@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Tejun,

On Tue Oct 20, 2026 at 12:31 AM UTC, Tejun Heo wrote:
> I don't really see a lot of utility in ops.cpu_acquire/release(). As it
> currently stands, it doesn't add anything that can't be covered by IMMED,

That's true if the only thing you do from ops.cpu_release() is
re-enqueue the local DSQ. It may not be true if you're trying to do
other things like e.g. kicking the sibling CPU in scx_pair.

Fixing ops.cpu_release() would let us get rid of the sched_switch hack
in scx_pair, which we know isn't perfect at detecting CPU preemption
by a higher sched_class.

> and given how asynchronous the events are, I'm not sure an edge-triggered
> view of CPU availability is particularly useful. IMMED works because it's
> something the kernel can check and enforce. If there are holes in it,
> let's plug them, but I don't think the holes justify keeping or updating
> ops.cpu_acquire/release().

ops.cpu_acquire() is synchronously invoked in the dispatch path, and
ops.cpu_release() would be invoked when the sched_class of rq->donor
goes above ext_sched_class, so either in __schedule() or when changing
the sched_class of a running task. It doesn't strike me as particularly
asynchronous.

Part of my motivation is Google's BPF schedulers, which are composed
of subschedulers, and we explicitly track which CPU is owned by which
subscheduler. Having a reliable CPU preemption callback would help with
porting them over to sched_ext.

> Can you please send the IMMED fixes separately?

Will do.

Thanks,
Kuba

