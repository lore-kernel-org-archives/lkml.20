Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474E429405
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788772534; cv=none; b=XLzWNym8tRFXSjNxam8V81YeGE9v+4/ubPDwf/bK0lfewftYNEsi82/cnL3/c+nMxy/T5OVa2sYFY0mEquExlcffQMuDBZ+RHbunJ1icdzqbWFkPQAaw3luoDHAP9KXIK0URYU5uDVYy5KXotKkLL4Kt7euVqePnvjUBv7PURI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788772534; c=relaxed/simple;
	bh=PoZ+z8P/Re+NlT4D+YmbbUbhcfBRKFIXe5/qVN1RLM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P6jlCmkQSj1xromPjRUg3cYRihb13ymWbuXa2+h1bGQlM5prykaREIF+gJhdTQbDL9vpwr/Gz+u3uFSw7pfKiPYx7LrdOED89bgZKSbqyFf8Zr1oV5PL1gJ7lBGTk8l4N1JR4Xzo6HWEp5vXlK6l0Utjq27XlydNAgyVgF+MuCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=pass smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b=HNvvUGO2; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ursulin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b="HNvvUGO2"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c15cf78d1a2so302990766b.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin.net; s=google; t=1788772531; x=1789377331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xBgijUTK0RaiV4bs4COhasChcigDnWDkUPfx1dw6myY=;
        b=HNvvUGO2QnrtHG6pTPuROEhsrc+QgrYc1Db+v9A9wVIbhCbdjBptgrsqVj+poHFX5G
         TPWie/uG6066SfHVtoR4R9iP+VOwnlvbsZB4BhVXwFjm5//lyv/RkPtfpPmTvibAEERD
         2IMa5risWX+T2uvRC4AidoFbM2sJBMgwJbPCUab/1/sLDsBFrrNKapkZR0DzoOryw3ix
         ahjs6pFx2S+pq7WWLfJNzSfhQX/F5PQr4TaF/HibxogBHD5Ik0eitOqh9EGhzNfSkdFB
         f5jaQJBq074CcDfonmWjJfIY2jzydpT/IAvLrO6eykc+UJKG49fk39nyfvZOt+0HIS2Q
         Fyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788772531; x=1789377331;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xBgijUTK0RaiV4bs4COhasChcigDnWDkUPfx1dw6myY=;
        b=I2AQ1f6DYN4F3So7yvTSNFZR8k1RtGqAM4OAIeLuDL2PJOahbkqHLJuLJemW/R2OFg
         P9p0k8MXAvCQSGmo9r3SKhadctFID4vFr0iwn7zV/Z3B70/RBFxt8EjYGxvQ1m0V8G2s
         A4cLR/U4lX6VUgYdREWpWWPy4vHMJ+UADkhoqhACdFyWopz1QAh3YbpOE5BhzStD8qKw
         8HXdd9SyD2ckq7VcqDq9NABwAahxpjfJ1leqc/gTjxMitqe7Z88FvFRPQZ0E5ubMIcia
         wNBX4SXV3WCd5dhs8OjpyGsklQ0535anhe+E3oLNsO4t5lrQHS7NCmxD8hJ0wk040sn2
         4mBA==
X-Forwarded-Encrypted: i=1; AKwUvByeZUID/XWRC9VLGB+DOQRMPveZ0shqRcYQ2x0W+WLocRdctlxICviySdmz9UgKF5QmPE39xOi4HgmmUhc=@vger.kernel.org
X-Gm-Message-State: AFuF++kGR2Wga9yZLg8KlcE3pHmr4qsOptxXlnvFIGgBW4XTn33x6Hw9
	sffDBryZkPLbGMJfcAiy0q0FogYE3mvXqrCw7FTXeIGBruZ5AZPOdaeO1I8Ru4Q2LAqKsPGb87z
	MsaX4JDo=
X-Gm-Gg: AYBFou2+PBpt6Xs9p+jdLo5xZ9VNBpO30OXmrdfXm7K645uaNYCPR14Zv3cF8byA/VQ
	76JkfD2Nyhu09Vc6b/TsqMubrfaacCal8qb4/w6MWPHP4j5tS1+D38Wdj+Q0gfjoURIRhUB3pg5
	682YunhmIUchuQfwKO2vi8NIfNhw0iC/YwC5NMgWTd4L59seEh6PfTMg/APU33E2myRkXFUocid
	DuhuojcgaBKFC/QJJbJ8NY3lOXjsOjjcUgzNPoIvaH1us505hipfx1p2TGU916m/DmtA3Y2mc6U
	14uwbXXqFA8wD6r6IDr0Ze2dmrRvpN1oWpuWwpB8oEcFQLbMH00f9YPB1m8ilcSIXbgbhJ1rAde
	uusxi+kQT9nwn0FtddH1rqBsROOt8MXOEvsFq7K91M4gQM9jq2QYPCzvw8IVFyGXyHsh8h1hFkk
	xmD3rGZVt/W5G/lBlnXmdCJnXxROIRzwbPkca7t8MOCDEcaYh3UPN/hlfOeTLxrIHgEeW+8u5O6
	kpv
X-Received: by 2002:a17:907:d18:b0:c26:19e3:e98c with SMTP id a640c23a62f3a-c2619e3f016mr677971266b.44.1788772531387;
        Mon, 07 Sep 2026 02:15:31 -0700 (PDT)
Received: from [192.168.0.116] ([81.79.79.1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5b371esm443215066b.54.2026.09.07.02.15.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 02:15:30 -0700 (PDT)
Message-ID: <81e51d72-d608-46d0-a986-390ecd6f468a@ursulin.net>
Date: Mon, 7 Sep 2026 10:15:30 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drm/sched: cache the timeline name to fix a
 use-after-free
To: phasta@kernel.org, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Jonghyuk Kim(MalHyuk)" <malhyuk97@gmail.com>,
 matthew.brost@intel.com, dakr@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mdaenzer@redhat.com, alessio.belle@imgtec.com, luigi.santivetti@imgtec.com,
 stable@vger.kernel.org
References: <20260904080618.2098450-1-malhyuk97@gmail.com>
 <20260904080618.2098450-2-malhyuk97@gmail.com>
 <f25f2a91-b72e-4392-ab53-c11ef60e0fe0@amd.com>
 <ee27d37269f609192cdfd7a217d9731d7dca04c8.camel@mailbox.org>
 <a41a35b8-c78b-4c18-af11-26374918f222@amd.com>
 <7e4497506bb051fd1c25ed54f88a8036084e779c.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <7e4497506bb051fd1c25ed54f88a8036084e779c.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04/09/2026 20:06, Philipp Stanner wrote:

8><

> If you can think of a stupid and simple solution, shoot. The only thing
> I can think of is moving the string into the dma_fence, as a hard copy
> :)
> 
> 
> In the mean time, my proposal is to keep aiming for removing
> sched_fence->ops->release and fixing pvr and amdgpu.

Fixing the drivers sounds like an obvious thing to try indeed. Along the 
same lines as it was done for xe and panthor. It is an already 
established and well understood approach so shouldn't be controversial. 
After that we can discuss in leisurely pace if something better is 
possible in the scheduler core.

I understand its amdxdna, nouveau, and msm. Was it attempted so far? Is 
it significantly more complicated than it was for panthor and xe?

As for regarding the 035219a760ed ("dma-buf: dma-fence: Fix potential 
NULL pointer dereference") sub-thread - I did not manage to penetrate 
the consensus there - whether it was established that it needs adding 
the is signaled check back (with additional memory barriers, like v1 of 
that patch) or not? Regardless of fixing the drivers or what?

Regards,

Tvrtko

