Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793927556;
	b=y5DvHiEANblv39C/ijGgi7aMG3EqPL1pnNRVuYavqePduG5raFeorLZVIDl1fHicOIPP
	 Q+o0Enqrf02cmmA4ku0YL/UPGQfl8efA0XL7REgIbTOPuXXaeFy1XMWOBZFgWEfOIYxoh
	 4rYkLaa7T1qpZSPvDT9BVA8LORLVys0rZ2pUSZdNFc281jpI+qIns1sqHkXKHFQ74T5yt
	 2Qa+excc25vYsn6z34HizYPWa8/X2Je7DUJ8slZGbOhox9XjEVlxkSBy8B43XYM4AY5x1
	 2MoBz2hzIgAcdH6SqJ2aHpu9HaB81BA3w6MDb9siT99lg45v8wDvdUR26vbzB3K+7EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793927556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Br8dhDWTMEC1IX0hIx4rLmHT+plyiVBiJUhQUy7wYRs=;
	b=ZMNempIxPQaMVUPxviCOb2vZKRJyYnFhby0cRIlckCFf76uDMeNa9YGwawrkxSivLYdo
	 8W9oFsb4J69mznrwd19vjsmcqSyCofZVVON+YLvVMBiRwJq71JFQuKA0m7b8B8i9TkxkN
	 euWwPOpGy3wIMmdUJYg3c+za2gj4Cmwdbch2menJuVr1aORBIwiiwLOR1ZmcPSbPrGf/G
	 KbYf3W/Gz1Tj45n283Nfzns9olQ+TrlVx8shk4TTrYZVinql/DVtKx7P3wQb+G4NWtl7r
	 l6Oj1FeQnQxweUgoUFLFaoxSBJN2jo82evxgxdYXNfGeGXD2MxPbSuRzk1fuKQQR9+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jenhaochen.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K+N8WoK1;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8380A606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 01:12:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8380A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jenhaochen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K+N8WoK1
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed216ed20dso1265585ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 17:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793927556; x=1794532356; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Br8dhDWTMEC1IX0hIx4rLmHT+plyiVBiJUhQUy7wYRs=;
        b=K+N8WoK1Btrlgg1twpuR//2hzgh/LirM1LyGpiuo7Axg97lj3p/pwHEaRJCOcs6Swl
         ndxeLGKNmgIt6V2h08tjW1U1IW/QeSdRNb1PfWg3RjzgmcnHPnu1pcmg5My2nwtL+ip5
         ZHquhgVCyEM5jaiJQHcO9o6Y+vSuvPNc4FG8kvDmus4RpBOgb3Njc/tDfThDosGjXXC/
         c1RpcKlSQHiiUAZEGw41WWfuC0O1tswHzGMAeg1K2o/zi+9rbfUWcQ84qop+Oc7//8Rl
         k4UEv0+kf+/RhMBVaiWTLwSCCQM4mqgrkv9G67YFViudBUyORXCzbthop4yJz7xyCOYJ
         sCgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793927556; x=1794532356;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Br8dhDWTMEC1IX0hIx4rLmHT+plyiVBiJUhQUy7wYRs=;
        b=qf2JS5FCHtilADE3j2T4AUcbPUYQnga2az36iAzkXDxNZpmsoOpE5seY8YTjEzLlC/
         LndgA1+n1mFFtf93KasjwzDrPCz4LdLWiQm5Td7SmpHbTuuczOTGZX2Pc747mZ0cYgDb
         ZrRHdwunXvP1Wk7OPI60nvjN7amlj6OPKSwhmDdTVf71Z/yPB/4YK5+NxQrFgOd3+eB9
         9taZLm9xb0W2Fftirr6sZyjbX+Zss2pGmMO7L/+C0Dn3gRiBeS7YHnsklI97DS8bFrvf
         IJ/Lp78Wsk1kGzxNwoHrXEcwF6/Vu0S63WZWno2m61rmWcXnf53Pu5d+1//pE7DhftZI
         sH6g==
X-Forwarded-Encrypted: i=1; AKwUvBwqFKp5+fkV6bW8bP0owiWa01tEw5Ai21bc7cOm2Fkd/tm//E+PiajgT1ait3h6Xa3XwIKAeWPMPKvMJLI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZPzSFWjj7aQuSrCIs5iUNW9gEQDq1O2xNEnU01r8bwfjMfduO
	zodMyJJe5f2X3C/qpGXR2AuMJA+6swoF8ZeMH8KTn6Lgklwq8kuFRYmDCSvdjKh8tW2z+xZlSg8
	FI7ExyEYUKZ9fMaJFsalikA==
X-Received: from plbkh3.prod.google.com ([2002:a17:903:643:b0:2ed:27e1:d579])
 (user=jenhaochen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:cf42:b0:2ed:520:2641 with SMTP id d9443c01a7336-2ed244ecb8emr32394355ad.31.1793927555492;
 Thu, 05 Nov 2026 17:12:35 -0800 (PST)
Date: Fri,  6 Nov 2026 01:12:33 +0000
In-Reply-To: <auxjJapQ4j8518aH@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030121700.260975-1-jenhaochen@google.com>
 <auwR7gnuLsF0lpmG@google.com> <20261105103947.7521-1-jenhaochen@google.com> <auxjJapQ4j8518aH@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106011233.3270937-1-jenhaochen@google.com>
Subject: Re: [PATCH] mm/zsmalloc: inline obj_malloc() and obj_free()
From: Jenhao Chen <jenhaochen@google.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Minchan Kim <minchan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, minchan@google.com, 
	liumartin@google.com, benwei@google.com, Jenhao Chen <jenhaochen@google.com>
Content-Type: text/plain; charset="UTF-8"

On (26/11/05 20:09), Sergey Senozhatsky wrote:
> >    If we also mark obj_write() __always_inline alongside obj_malloc()
> >    and obj_free() (with noinline on alloc_zspage()), the compiler CSEs
> >    those redundant operations across the fast path:
> >    - arm64 (Clang 22): -31.3 (-O2, -4.0%) / -34.7 (-O2 + AUTOFDO, -4.5%)
> >      retired instructions per zs_store() + zs_free() pair (vs. -8.4 for
> >      obj_malloc() alone), shrinking zs_store() under AUTOFDO from
> >      3,144 B to 2,448 B (-22%).
> >    - x86_64 (Clang 22): -26.6 (-O2) / -31.8 (-O2 + AUTOFDO) retired
> >      instructions per pair (~4.0-4.5% latency reduction).
> >    - x86_64 (GCC 15 -O2): -37.1 retired instructions (-5.1%) and -5.3%
> >      latency (-5.5% cycles) per pair, while keeping zs_store() slightly
> >      smaller (1,997 B -> 1,943 B).
> 
> Great, I'd love to see that in v2 commit message.
> 
> > Would you prefer that I send v2 rebased on top of [1] (including
> > __always_inline on obj_write()), or send v2 against current mm-new
> > first?
> 
> If it doesn't trouble you too much, can we finalize [1] first so then
> you can send your patch atop of it?  I can ping you when [1] is done.

Sounds good to me -- no trouble at all. Let's finalize [1] first, and
I'll send v2 on top of it (with __always_inline on obj_write() and the
benchmark numbers in the commit message) once [1] is ready. Thanks for
offering to ping!

Best,
Jenhao
