Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB9952ED2E
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984666; cv=none; b=bKKvUTgeaOKBOnWkjqioUOo1iLmKo/YaxRn/INlEM/jdvsOQ4zsExQNNdjvy8KTJJMSVY0GvkxIhP9Ss35Nowj7bKDPEmW5lMBqEEAUjSYJutLX7+tKu3nz3C/lcrWFlh1zJg4PwgqkDyBM7TGAIpCDhGWOG9jlFHODryKljm3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984666; c=relaxed/simple;
	bh=kcR/y+XC6oHFlqawXzCOGRhP8B7C74cHje0W8OEDkG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=INM7jea+KE8pUfFuz8UdLCFdHTyUnJ3rLI44/j32SlvL8Ha5LN6ZN9LSxAEdckXk7ahgMdDh0jELKadlLJ/LcOuM64bcyoQzHn0cIRujceZD60wpNaTy/W98kGVDI+bZbyQkrRXZqCI6ASC5a4kNhfufyoOqbtrsaRQLVKhGAdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=gvqYi2LH; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="gvqYi2LH"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-53394bffe0fso11117331cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1791984660; x=1792589460; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yl3/HcMxKzbLRx25aj5CEBdDsA+AcBSsOvkZ317Rc8o=;
        b=gvqYi2LHG7Kuw4Mp5hmi2XN6tXQAmMRTqdD2l2oGH/yerDm0B6958prVJs5xJDrMv3
         1V0rwrTyx8Cppw4cUSBtslR4aoTTeOJSIhsZB9my04Bn8m40Ff7b+g09DSqM7gA5YT1p
         J5M7enDaoVQaXUSGbL6w+2m6EW6SNWJW7bh262yw5nXkGjO5pEgVYvEWniR+rpRSr/uo
         Sbfw5ljOTbSo5ZiQAcnJZrStiHOx55Ar+txdGiNP04SAcsnb2LCeiDtbpHmxxC5wqtdP
         Nia7G+OHfE9Iqz8j8XHQtgwVJVRNDfUp7g1G7ZVGD1CsqwCCpatOj5SHShooqUnzvtV/
         sqQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791984660; x=1792589460;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yl3/HcMxKzbLRx25aj5CEBdDsA+AcBSsOvkZ317Rc8o=;
        b=rvnIdqjdlwX5gMk/DEWocqErIdaL1CtGXcVYlXOr6AWGB2TcunKy3PxEBEwM4T50c4
         zFThyfR/GMa03GX4wI8Jhrp/r0fB2luzOLQH+pzbvsEvtnYZbd1tCbw/aa6zIs7bN1CH
         zPGtFqjHFrqTzcWVzg1A5ISfJ0J8XArP3yQozbrkBSRGssclSUM3qaYNjQQjLSWGkSwn
         nHrbvMonhLpKVseyknJFed4UmgVgwgp+cSJB9Yjdv2eASjLCa+q2stFy6GNrRMVX11o8
         ra+FHXXR9hs+RkJaOmDScl1Ci/9ymfkB1z4g9RCHW/RhY7RXMb9dPXd+sCpjyaos2x2B
         ofsQ==
X-Forwarded-Encrypted: i=1; AKwUvBygqUac/R2232dYgpxL8GLUdtJhit4jXpJvztV3ytwwVbJvOHx60rgGzXRc11r3qL8PZA50p8Ah9KgKcws=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7CDWwRpCYamikUGz1XAORoro6MFA/4/fbtkHrsMl5SeiLFtfv
	DjRCyRiAe2MuD4VWHsfdD47VKAJcDsLmNpbcnt+SC6j37qG+xiKvNo2VTX7MpW6+ImI=
X-Gm-Gg: AYBFou2nFOShr9Ya7KpxMeo07hnxJuaTP867E2EK1ik2my5wggL4RqnFgS6QAAtoROX
	8af320FIgqcRe5DzEQz+NiHh2YhHFbcPe/oWn8SbEtuesUZ6T08Bgyd9sTojdzGTbLIdFjWzNtW
	9be0XobTqzB+uPEAqH0UU14hLBJUKRqWkj4E2CGsWmkhk/N7fq2kKAPhtaKTfliRlK3eWW08h7F
	tIR7chwB0IpeIM19gVAT6SURArRYuBR12h4fuqR7K90JfyNRQiz/q/8dR+lx1ZIbhKZbvX0nwvk
	9XiqboABXwpwMXxpTuNp/qJCDoIGWF+cQVrtR+8HVkZ7QLfs+jKRj+wGqR5kZCkNGGvXI8SjJwk
	3wj+tMUCo0UCmk4KTyGTFETncKOA/+nj8CZ6a17ijE7+nRJ7oBRmn4Rtmbe/wgEIWt4e+YveNZr
	PqXXfCV5EtQU7s3kp85Qkvkj0MadyHC91UA1s5C5cudnU2+5bF3CgbNx8ah8b6W3ZYUwjVLXdHj
	43fXTIewZwR+yT3/awgGPpeNBfuDoV7IHMVldyjmU84M22Seu3Nq8U=
X-Received: by 2002:ac8:570b:0:b0:535:70b3:fa0a with SMTP id d75a77b69052e-535a6294b31mr232930981cf.38.1791984659743;
        Wed, 14 Oct 2026 06:30:59 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53607e1b801sm9569991cf.21.2026.10.14.06.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:30:59 -0700 (PDT)
Date: Wed, 14 Oct 2026 09:30:57 -0400
From: Gregory Price <gourry@gourry.net>
To: Li Zhe <lizhe.67@bytedance.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	joshua.hahnjy@gmail.com, ziy@nvidia.com, mingo@redhat.com, peterz@infradead.org, 
	mgorman@suse.de, riel@redhat.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 6/6] sched/numa: ignore preferred nodes without normal
 balancing
Message-ID: <as-D8ff7oXKX_CwF@gourry-fedora-PF4VCD3F>
References: <20261014094347.99157-1-lizhe.67@bytedance.com>
 <20261014094347.99157-7-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014094347.99157-7-lizhe.67@bytedance.com>

On Wed, Oct 14, 2026 at 05:43:47PM +0800, Li Zhe wrote:
> numa_preferred_nid is normal AutoNUMA task-placement state.
> Memory-tiering-only mode uses NUMA hint faults to drive page promotion,
> not CPU placement.
> 
> Even after tiering-only faults stop updating normal placement statistics,
> a task can still have a preferred NUMA node from earlier normal balancing
> or from previously polluted state. Several scheduler paths consume that
> stale state when the NUMA balancing static key is enabled, including
> explicit NUMA task migration, sched-cache preferred LLC and scan CPU mask
> selection, load-balance locality checks, fbq classification, and wakeup
> group selection.
> 
> Add a small helper for normal NUMA placement being enabled and use it to
> ignore numa_preferred_nid when NUMA_BALANCING_NORMAL is disabled. Keep
> the preferred-node migration retry timestamp update before the normal-mode
> check so accepted non-normal sysctl states do not leave stale retry state
> behind.
> 
> Keep the rq nr_numa_running and nr_preferred_running accounting unchanged
> so runtime mode changes do not make enqueue/dequeue accounting asymmetric;
> the load balancer simply stops consuming those counters while normal
> balancing is off.
> 
> This does not clear numa_preferred_nid and does not change memory-tiering
> promotion decisions.
> 

Same feedback - need to present user-facing performance changes to show
the impact of this change.

Sashiko also has some correctness feedback.

~Gregory
