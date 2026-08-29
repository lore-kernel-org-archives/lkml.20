Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E523890F3
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 12:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788005459; cv=pass; b=G6XIgXBFlQlgUestzm54kpn3PUVEEDW/de5gT9iWBmsFfWIzDDGHIzY+HR35DTqSELpdxYC9yZuMmWfFQ5/6fSx+8J06XwJL8VKmVlEDiZC23QZZKtXoTELqFYa7SV5irk6UCz27FP01qeqpA2thGeIfr6Nh31AZc04nj24qCQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788005459; c=relaxed/simple;
	bh=YdSf9m2n91aamefLP8qGKuKu6/Pkf1L7aKMLcZgsGmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rwqszpgfBmZqNmzJ/MtmAmlDtTIOQeqYP/oMvNf4mrUezufcOjvwnPEAVp84C6q2Zfv/5SDyT3IKJL4FCas52liOfXZNhwwLov/NMWt5j5letiTYqCYHNpYogyx9NQn/tGUacky+Nhf+gr5rRkzkH/F9ndTQ41L/LUg0PFZLVuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=No0AUXxN; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="No0AUXxN"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b4af730f8aso2013553e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 05:10:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788005455; cv=none;
        d=google.com; s=arc-20260327;
        b=a7ZFHZuhZ43Knmoch9kMCHpuBqwi8B6AiYBqEri4h198mar31WUAvAG7hHJ7JF+Ia/
         1Hk7ZclqMHaLw8SNOeCIO/8gsUtRy+x2qkydb8LhapgEgMaTK4bDxDITTjucUVjmNn3v
         Y7rhL8QULciwiN5j/Hlr6QPgEP3wHfkMkI8S/cFHoR0URzxVbqnmWql4V7iRn1f6Jtwn
         milJg3pLS+feAQhga1foJ8vXyGV3Hl1s0Gra6bnXRdCBER9uNDlC9BPFXbrMvf4y63SD
         YLBZ0iCnkqaVnm5wkNcrY3l6FBeKiQQM8AA9W5ZjmdUNw1jX8ZnEtpi6nd6ffDvRbMFH
         670A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YdSf9m2n91aamefLP8qGKuKu6/Pkf1L7aKMLcZgsGmY=;
        fh=DnViho26vqSnZs0FV/0UfcHZz9/ubv9Gqu5chXTdkc0=;
        b=VpPz9uceApHnD4uawzRsuI9nZGXy8lzcg32lmmMnm0yOiECGhRnuzbcLrXql2Aok6j
         nYPBouhD0832qKffmStw+nntNF8QpudQY6K5tGcKr+0J5h/mdFO3ZNg3PN3glEv1WREp
         N69FTu2P6nzzIZng5XbDEwf7vAegAPoH24Kvb/MxKFBXOkRGxg2eByZGjHEzwFbwbCTG
         R/7tjCoP+x8zT5pWri3AWNXfK5hidvoEhQS+AssR3A0jfV/0FtnGV9bQYYvM3NgjlPy9
         Rb6lXmi97Zgu4zgqSjjtbrfL9BOGIfG5Ws8vFCjuhJ4/vy7Bj+JcRBdAbGPIjnXfKY7s
         9fzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788005455; x=1788610255; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YdSf9m2n91aamefLP8qGKuKu6/Pkf1L7aKMLcZgsGmY=;
        b=No0AUXxNeGVl6ymX84BVUXlVrAvyLZGPLR7tYOGunCTiFTOo8/n8WCIKBDMc/q3x8u
         fTAWeNFKgX0bbyfHIe7jdF+UGX4zWEqbTroz3l5dWAVslDMdamFPZpnUDDpT8gBNn+MK
         iqm/JBTcuC4383xYsEnWAKcEL2WKTKrF/HR+ld5UASAxjLdVX4cBOfAgSFwT9pGRRBbn
         epz/1phjZeUdPujUn1m8rK46bS4+yi3LWW1jITXTHg/JTyeYv0wO8jUR4ioxaZNwaaNG
         WU/PPE72SU7RfgcbgCKkFTbeMCD/ZqrHSZ6bo4p76FVOt7T2Oc8mecemBCMMANAIF5yd
         Z+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788005455; x=1788610255;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YdSf9m2n91aamefLP8qGKuKu6/Pkf1L7aKMLcZgsGmY=;
        b=G4QYv4z4NnDCvTyc9TTxK4dLx7OaIaudvdSlzn0Khp4jYGkos/JFXqwQqHUOX5p5vY
         dlVMRZNx+1P98Naje3qCWp/8VNUbOOVfp2YP3dHrxH+Jufyyh2KlHby2r5p8JCyvmoJM
         nDhsOiTNvpjAOYWF5FwmZo/tZlFTCYdanCJVKyT8Gfkk/6Dxei0cuN19L3G/a4s3/5t3
         5Olk0mo98oJOx2EdFXeyWpx8kgCxdzeLxrqPPyKS4NjZc4thqboEaKbRfzlVXusbB7AX
         aLWxTGO1XemebveXZ64AgZwADCT9HG5ixeAO0aCWyrAtX55zISBYkdheo5djecp6gz1V
         ALCw==
X-Forwarded-Encrypted: i=1; AKwUvBw0Aoq1bG8Hm7F4XZQZtsV22p48kp7RKT6BjWQS2p/YDBV+ehz9nlDe5rRYdvZwyAq4V1qB+J/2aWHxQWg=@vger.kernel.org
X-Gm-Message-State: AFuF++ljhBo00ngtxW7yUfCM1lHTYDHnwpTdR0zYNCNJ/Q4GvFTT+BG+
	K2PvDPDsYxIer7XlTKDhYBoPnUwU0lf30a1VkVZ520zelaGKSP7VZ8bwZ4g3T6uLF0+xxW4nAHf
	E9Sb7mjMWfmEFyVbduwwCFQNS6yCNbW39/82e
X-Gm-Gg: AYBFou16PZLlSzaOepGlqd3vmPMH4eXYQsPZphIEU2aPIRaDSa5CncE3VC2AHgNYv/R
	eeadzHrLamGWt4hfVSx+PFkv9MniruM8l7EQEpGRFHwdrkXkhE+2AhQrkGOP5WVMgbG1eIfZOAj
	GPYlWOUGGBVDrhs+oVTDCdFrKLu0pzDc5p8et4JSd7GOPHy75ci1+5pNhnaGtwdrtdv8Yq5qpze
	CbaRJs4B2zI5ndm/qYSVWQw7wzzSOcor3XF2nDV7cE5s0asfEGICpGSVfPCiK6yYLzYaMHR4f0M
	0hfY00TqLWCxuktrvwLYGo/UESKS8gHYVeD+Kv/R7TXZHOzoJshw+I4TXf9w6/lK+6gJkGbt/0E
	=
X-Received: by 2002:a05:6512:400c:b0:5ae:a0b4:5013 with SMTP id
 2adb3069b0e04-5b5e685c15dmr4390991e87.0.1788005455037; Sat, 29 Aug 2026
 05:10:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260815-shrink_zswap_entry_0815_v2-v3-0-0171bd86a667@gmail.com>
 <20260815-shrink_zswap_entry_0815_v2-v3-2-0171bd86a667@gmail.com>
 <CAO9r8zNFYM1bry0DwDRNtpnEL9yyXQ3h=1wcLbGsO1sFtGgvjg@mail.gmail.com>
 <CAJxJ_jgihBLy2mbPAN-uqup2mGq+hurKkH=W4RGo4Ad0Eki5sQ@mail.gmail.com> <CAO9r8zP6+6jZ7qOxOy1fyd=UgR3yYP20Db9KghW1zJ3bNqoREg@mail.gmail.com>
In-Reply-To: <CAO9r8zP6+6jZ7qOxOy1fyd=UgR3yYP20Db9KghW1zJ3bNqoREg@mail.gmail.com>
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Sat, 29 Aug 2026 20:10:44 +0800
X-Gm-Features: AcwNN1VS1whBYUNjVaenQNu2AZucmtbOSqkRNtiG9piXAGBmW3esKLM09pafUWw
Message-ID: <CAJxJ_jh6J5N0vbFfi2139vnTVZEECJoq-AV4VVNew6a0Bkwk_w@mail.gmail.com>
Subject: Re: [PATCH RFC v3 2/3] mm/zswap: replace the zswap_pools list with a
 fixed pools array
To: Yosry Ahmed <yosry@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 27, 2026 at 12:56 AM Yosry Ahmed <yosry@kernel.org> wrote:
>
> Makes sense.
>
> Actually, this led me to rethink the slots reservation mechanism we
> came up with and the issue that Sashiko brought up initially. I
> initially thought it still existed, as two racing threads setting the
> compressor could try to resurrect a newly created pool. However, I
> realized that's not possible because a module-wide mutex is held while
> any module param is set. This also covers zswap_enabled_param_set().
>
> So IIUC, we cannot really have any concurrency here. Pool creation
> either happens through params setting (protected by a module-wide
> mutex) or during initialization. Does this mean that Sashiko's review
> was a false positive and we can go back to directly assigning array
> slots at pool creation? If that's the case I am happy we can avoid the
> complexity (but sorry I led you astray).

Thanks for the patience here. I wanted to check the details before replying.

Agreed, and I confirmed it. param_attr_store() takes
kernel_param_lock(mk->mod) around ->set, and for a built-in module
(zswap) that resolves to the single global param_lock
(KPARAM_MUTEX(mod) -> &param_lock, "Protects all built-in parameters"
in kernel/params.c). So zswap_compressor_param_set() and
zswap_enabled_param_set() are mutually serialized, and the only other
pool-creation path is single-threaded init. There is no window for two
threads to resurrect or create the same pool concurrently. Sashiko's
concern was a false positive.

I also tried dropping the slot reserve and went back to assigning
the real pointer directly at creation. The only invariant that matters
is that the slot store happens after the pool is fully constructed,
it's the last step of zswap_pool_create(). So array walkers only ever
see a NULL slot or a ready pool. zswap_pools_lock
still serializes that store against a retiring pool clearing its slot
in __zswap_pool_empty().

I tested with LOCKDEP + PROVE_RCU + DEBUG_ATOMIC_SLEEP: an e2e
store/load workload + compressor switch (lzo -> zstd -> lzo) that
exercises both the pool-retire and the pool-reuse/resurrect paths. All
passed, no lockdep splats and no suspicious-RCU or sleeping-in-atomic
warnings. These are functional tests only, 2 writer races can't be triggered,
since param_lock already serializes concurrent param writes.

No problem, the discussion made the concurrency model clearer, and we
can drop the complexity. I'll refactor the code and send out the patch
in the next version.

> It also makes me wonder if we can just drop zswap_init_lock, but
> that's a separate project. Most of the zswap init code needs to be
> reworked imo.

Agreed it's separate. zswap_init_lock guards the zswap_init_state
machine and coordinates the two zswap_setup() entry points (the
late_initcall vs. zswap_enabled_param_set()); the param lock doesn't
cover the initcall path, so it can't just be dropped. I'll leave that
out of this series.

Best regards,
Jianyue
