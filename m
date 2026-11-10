Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316305;
	b=CPzDz9+8fvrzQJig7op5cWQ9xgLef4ILVGrrtErQvtpjsJOlFjRrOhZ59aSvrKbHN0gh
	 S+WiZ7+PHvFAkKZu43Xh44ABiwXpQj7CrA3Re2twnYEt+OlLmcTV3TJzl4WWtSlp4aKJG
	 UNGpfHvGI+RF/CLdWLAP9VCtFe5IKkf6wexwX3PyYWcnzghhKRoNBkNxPvBjbJwI5CdjJ
	 ULrmz0ZTXlE2wHuiBVZkkmQwVF1PoFYhSoXhLj9ME94TiKu7PvISQ47XG3NxkKnKavDhS
	 klDCa25xpfhcx8pafbUaHyNd3cfM+9dIoUK4EqIpcYHCA28YXMjvQc03V7kjxuIgf0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=v/SgEZWrzJNE/7WZqBg/ymw5X2Lr4Ksekr/q2IUMa7k=;
	b=EnLRqo7KMi6Ue1vbCKQYg4BNwFRlJ3p4EXj7KuZnY+sNNOMCwL/moB8xG8eDiwopg65b
	 SmmHdbge49TZx2tRTN4NVfsPIsgAXuRAWL3DwI0x0WlESVMUIDyrrKnFnx1uQXJDaONiS
	 holjO+weJLKdmS20kWonaWKz67w6av9IylmE4wwHhgCJgjRS7eOYvKdm1jLkOvxk2HxY3
	 Zi2XzPqvrx4ePkoGC4Lapi4TpBcQ4z4/fM6k8G61zN6DIbKfEjmt3883FoqbCY4YzHedp
	 7YonnddhA6+w2CYPVWO2+k+DMqCr27xdJsH7QIlIJ9DjN6nq0MkMhRPppHNyhR1Se9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=r1B8XoXU;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF99606B2DE
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAF99606B2DE
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=r1B8XoXU
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91ec14f4369so21015706d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794316303; x=1794921103; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v/SgEZWrzJNE/7WZqBg/ymw5X2Lr4Ksekr/q2IUMa7k=;
        b=r1B8XoXUdorHTQi31T4QZzQwAdYf3h4O94kZGC3jv3T+Jx5SRjr7FGsuqI5cXgJbuy
         a4Xskj7A4wrzvSdZS9DExIDq+xyu5tsy3fACq1w3Utv6FY5LAMCxJeTfUYkugkcSURlU
         ZCsjXXPIL/Z4QaKPsiHzP2lVg8s+DaMURXSk3YAO5StGiFfPs8XaEn7HvQAQmDVOxF0K
         +4cgcOZ4ZUGxBpTRrk2YwTXg3RkeaX+BRNaRbxPTB+Kw+TPgMU3P08XiJN88xbwrIvpc
         FnRFR4osjUJ354D/5xgkmgEk6S9jGEccJMRKmxluZ4XdNRRCNAyQv4W0zz3bSKwk1CMz
         suvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316303; x=1794921103;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v/SgEZWrzJNE/7WZqBg/ymw5X2Lr4Ksekr/q2IUMa7k=;
        b=WdewjoKOIXdBM0ePGGflwoZj8EYZ1EriIJaikxZCOn2wz/sYNAiAfSpRiiZt0rutgj
         OmooT+fqyRvkgoPPeDwp6ylc9HcY7Jr5GGtDeIhsG37/D7+7X3jlR3qdak3N0NdxPQV5
         TWpZsnXhQaX7fhDcZgeeBzmW6KOAK1qLI915zc+MB3xPs1o2KoB3OhxFcJvbtsHZD1xp
         q59JcahHXiOB8KfnUFE1fhAVHYGedS6cEfvpPcHZEtt2OmlewzZ5QxojW28fwVG6eb/6
         BKpXtL0jusDseR/DPBMDez3oPrze+E8+dV00Q7ULrZ5aAauswwV2ofLEiP5eF1y/UqsE
         GvrA==
X-Forwarded-Encrypted: i=1; AL+hErH1AlYAtfIQNQ1sFjOrS0fC91G9ieUNOxcbKPrTg6TAeiHgrvGhx4Ldq0nWkPXq2Cj/PTU1kYMapzkcqKA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/7VTjUTQf6oT+zE7w0Sw7ZyAyfg67sJykwid9OL7l8Bu10aeX
	d43lfmgxkfQPPmZda7DLHUkXZ/Crz4EuCICCf45ye9FX0BFms3u6g6aUzngI2pWmeAE=
X-Gm-Gg: AYBFou3ei4vX7ZxHgcka549vKpcZEi8I5PT0d1uTJcYXflj8RkzAqrPbalXm9pECLC2
	DTwiHTyunursVCjhUgzf5GX8tM/W0KbX6ZZhPesdpAxKL/TcWJ/FeCz6KQBM9Myi3oJPXmxCewS
	6cfCE/lUYNVheaQ21ArAEALH1lCu2ejWf+FcQCugr4LHc3cO0t25aLzotsjhgH47T/mHrwf4vIs
	8hzhyZlMFUeodcaRYhMSs7FXa50/XWDLCobYQMQwS2t377kFTvJ8Jvk49Jh0pGwj5q9gxKBg0gy
	meZ6lj9q2UhLoqmBlxG44LG3Vd0WP5VR4nHGHfBK5M3xwrDOEsliwWCikLMWbeYqtPrKv59Cqsw
	wvSq31/q9GmzhywrrZXbVOy81C/6N5AKD+XqhiisQheXX4MeV8j0ECRzTiYqdDr4bzUFIfyDXgj
	INGoF4a9ZbXCjK+bi+C/FO9QbT/bFGo6JX3V40ZtzkUiMxyM5fflnVsSAZJyR0gqq8gLsKYc+gn
	gXrILL/ka+Ox0/AHjE2rgjIQXnzlzqYsyKorD3OUQqS3KI87A6OjQzqUenqYpYulYAbfKYwD6Hk
	ifl1lbNaC9AW5lb3vbBYCTP9DF1LoSCHFn8PQoTlAriZu6nO/6db5uUpDJXPC+3wp6kU454KmYN
	IW8tHrd8=
X-Received: by 2002:a05:6214:2266:b0:91c:7a0e:3385 with SMTP id 6a1803df08f44-91eef9b7adamr41656946d6.49.1794316303415;
        Tue, 10 Nov 2026 05:11:43 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef04ada03sm20492646d6.7.2026.11.10.05.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:11:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [RFC PATCH bpf-next v4 1/4] sched: add helpers for numa
 balancing
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
 eddyz87@gmail.com, memxor@gmail.com, mingo@redhat.com, peterz@infradead.org, 
 juri.lelli@redhat.com, vincent.guittot@linaro.org, 
 akpm@linux-foundation.org, david@kernel.org, gourry@gourry.net, 
 tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com, shakeel.butt@linux.dev, 
 roman.gushchin@linux.dev, yu.c.chen@intel.com, zhao1.liu@intel.com, 
 tim.c.chen@linux.intel.com, lizhe.67@bytedance.com, ziy@nvidia.com, 
 mgorman@suse.de, bpf@vger.kernel.org, linux-mm@kvack.org, 
 cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261110032913.71974-2-laoar.shao@gmail.com>
References: <20261110032913.71974-1-laoar.shao@gmail.com>
 <20261110032913.71974-2-laoar.shao@gmail.com>
Date: Tue, 10 Nov 2026 08:11:41 -0500
Message-Id: <179431630193.789062.16833460142171738145.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-10 11:29 +0800, Yafang Shao wrote:
> Introduce task_numab_enabled(), numab_in_normal_mode() and
> numab_in_tiering_mode() to replace the direct accesses to the
> sched_numa_balancing static key and the sysctl_numa_balancing_mode
> bitmask.
> 
> No functional change.
> 
> Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> Cc: David Hildenbrand (Arm) <david@kernel.org>

Agreed with Zi this can be picked up separately.

Acked-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

