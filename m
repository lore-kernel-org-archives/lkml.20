Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792617876;
	b=iKlXqTooJaQV/UE0QkIF0BxbZaOCRbzvQz6YAlp6NKBtNhEhPS7xhgfdemmzwiD1sISM
	 EZ45YvEXnXorL4pxXZ5DXAqA8c4+4ShdGaftHcLxBGO/bgpoir6s2IEHKaFCnEcna1u5Q
	 hcNlzo6HuPF9baGtdnLECkB/b2q7UFV/aMsDV8sakBTl3zPMsuxD2W25FyyVjX6lbnd8e
	 vsBp2t7jYjktgTTJZZIbEXESU2CxEioEXoJQF8Kaek0lID+kCEQ0IYAAI0xLTjfRMygfK
	 IORAdoztJ3BURmuOkvbKB3xWg39DfmEa4NcwY9B1gJl7/ZhI6fGOnC0XUtG8F5+E2GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792617876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8IEZ9olq160T2eeN056hVBHNHsrJXJMeuGcg8w/hmqY=;
	b=JfLD9sD5dkBj71nD3mVQg9NfrUWJ4LQvyQ2LmHThwpi0yYAxjvFqx19OTgDpVKsFLgOO
	 WS2/vi8b2yVXrnr+vQOYKyOIV4aMhbG1pfIPgWkRXvTJm/B2Zq+IkNk78ExTjSB7n5TfI
	 Ka4HF609eh6VsLDMkC0tfud0CoKqTHVMs7RGdTFX1uOeFHyer+udZvBf77VOy37OBn7Nm
	 eg5po4s6mNQgwBV+ei7WssvViGEyuV6aBd4oW8uWpDPrW8nse2cpxO3ups/mwK4UCuTRD
	 yxuGbchUZERbqywUb84exfGJ6y6/BHcq6ew2iGqS3/AkeWSVHtrXIyG2KZQ95FtmQng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=TaisdxF7;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FF0606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55FF0606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=TaisdxF7
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93f30660e69so75602785a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792617874; x=1793222674; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8IEZ9olq160T2eeN056hVBHNHsrJXJMeuGcg8w/hmqY=;
        b=TaisdxF7bL6oVi+T0MnL5svDJyrfja+UU17YMr3PigM4Ru03zOtsr//PovAO1RxFGg
         e47haOHhuqUs+p3irN46GBdxDAp4qZoF37PgHBZQvLIxroKgrQPyJqKnrvvkkL1Mlami
         oTLEH6l3CV34DV/zkanFJR9qlJmg68wzkwpc27lSxCJb97pF+OeMPPH5UVpMBcmLWUp3
         5JkHQkySopq9buZEGrPIRQ3gyADpRdoARQJMPp5Je4W4igzpE21P5KxR16jlhdD9jAlE
         a/gb45n5rdSFhAouOCoG1rXTOfO6auFRXBoNxWweBFkVqje9AcwnWt9m3BXaZYZLEr/c
         TyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792617874; x=1793222674;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8IEZ9olq160T2eeN056hVBHNHsrJXJMeuGcg8w/hmqY=;
        b=EbPFXmAvLkg5e5ZXwZfN1SSFEz5Nm7EXb3VVQbZXNKCzvowoB6SQzRizdN8N1C/NIL
         ow7aFNCVpywcs6w7dOQlsvl9zKYlw45g3XFMF35SJur3IdaLaZ7nQIMVvDUNkTSdMJh/
         0mdIvG63e2cf0HnWAjPk0D1latr/mT7IKL8ra5xF59LJd1ItvSg9+uBVKNSnAVmSmr3p
         OtBPVq7veLnzK7IjQFXlgOb5vFmcvki3YTUT3bJxxFu+DtYVaYlCGGb/CyC6wdg1Sx5R
         /5vhJCLB/3/dsHL9KTibStK5cxeiYppeHinM46s1bNkgh3D6baBHOffmrWqpsi3PAQzm
         BQlA==
X-Forwarded-Encrypted: i=1; AKwUvBxPvjmuC99TvaUCmhZCIfEaIBjF5YgR8dpKG5cg7huRJjmMFAdkUMGxwSaT6Y/ChsOkXzB9giPVh+4Aupk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAwj3UYjEISbP12FhyFKPsY8rb6x8Mbs9y2RZrgN8EaApADGe/
	HOxQ5qq1zjOU3Wz7CB69X1ZoWNplKCkYzMSoXXghJjHPH6UFYpRL5+8yFTJgxYbMH7o=
X-Gm-Gg: AYBFou0yo7DfOhzwKNxNfyQJzZxue7TOscQahQiJ3BHbENTv8YiWG11912CLpCQ0/qO
	WUGDX4KTJd5LS0hx4rroMr/f3jxwxFfSMM5jS4fiyitvbQWKbaG4/Y92KEsnlUOL9aJPBQOKmiu
	EjYIlbnnqzfEW3cIbGzb6nlNKl9Iy6UqoSL2/vOr6GInLzvn/RwbRSxguSUNiCVbg/TF2llPEec
	V8U33epKf4vklS/iBxrhfjmA+CQ6+9I47SCRd/fHIT+pshZYfPMbCtw382uFyR+v7kprzKhG27F
	BxXnUKOLvWGPMPzKkget8ZWqqIAMfMzh7vu3bKexMNLcktutmiG8bZPfUUToK68irio34jjKKFd
	087WJnB2+F72hdJmjGQdAQVwpxwndtiax9aSAJs5HnX4VjxXbxBu95H/hVchKs14OxRTLl129ul
	RresiaCMsO4RFyjNtU69JaQfh097g9jmSGdSr/Qp+dUC9vfVHM4eiVxbtOp17Ars1DDiuttAAfK
	AnlxfVtjIsg3+MBmPbKF1qNDw19Zu0FdsPN4j48O+BSxK03QC1Zpk8pgBPaekFA1xR4jmSShUxc
	2Yv9YhV3BR6cOrXQom1yEZtZX2HZZ/kMPlmH
X-Received: by 2002:a05:620a:4414:b0:93f:16d4:3bf0 with SMTP id af79cd13be357-93f57f23fa4mr670081285a.42.1792617874277;
        Wed, 21 Oct 2026 14:24:34 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56df2ad5sm349884785a.27.2026.10.21.14.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:24:25 -0700 (PDT)
Date: Wed, 21 Oct 2026 17:24:20 -0400
From: Gregory Price <gourry@gourry.net>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Chris Down <chris@chrisdown.name>, Meta kernel team <kernel-team@meta.com>, linux-mm@kvack.org, 
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] mm/page_counter: use WRITE_ONCE() for emin/elow when
 parent is the root
Message-ID: <atktYGL3OP088D9P@gourry-fedora-PF4VCD3F>
References: <20261021204818.3431099-1-shakeel.butt@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021204818.3431099-1-shakeel.butt@linux.dev>

On Wed, Oct 21, 2026 at 01:48:18PM -0700, Shakeel Butt wrote:
> page_counter_calculate_protection() runs without locks. Several
> reclaimers can update the same counter's emin and elow at the same
> time, and readers such as mem_cgroup_below_min(), mem_cgroup_protection()
> and the dmem eviction code load them with READ_ONCE().
> 
...
> 
> Use WRITE_ONCE() for these two stores as well.
> 
> There is no functional change. Readers already accept stale values, and
> compilers emit a single word-sized store either way: with GCC 14 the
> x86-64 object code is the same before and after this change.
> 
> Fixes: b3a7822e5e75 ("mm, memcg: prevent mem_cgroup_protected store tearing")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

