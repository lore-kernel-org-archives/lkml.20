Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1321A352016
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 22:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792190106; cv=none; b=E1a+OMa1l94YH9tyykQ/zalAeQfpEhG+SLkoqO6IwRQtfCI/0W3p9MFeynAJEQ26d6UQ8U6/K86GdlAnIr3jHIBsbg4FatdXYtET85nkoHz9C0E5qdIaoJQ7aTQkzlc2llfFxlGFCKWvLw7emXx4KH9GguuXpYeU6vYqu4sHxyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792190106; c=relaxed/simple;
	bh=b7OGKvhsJjjfXr4q4R/UClaDBJvsU704uXuJcvC1Ai0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=aZmHXREw6chmb1rnDKuQwYRuwOVyocqsfG6IuJt7LaVO7XeQgs/F0MD0ciZMgtUk57UZ55UEv36oTFUXo5EYtLQiKfZEakpnl7W1CwM5uSggQafmQ8FpbddBsaBAIMimXwLNAfj7evtLl5zCbIs/vH8ziI222JrzGV3kpxdNFZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mA4Wf2G9; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mA4Wf2G9"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2db33db4de9so25045ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792190104; x=1792794904; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UfiAlLwpckXLSSoGlBblxykTWKXYXbwMTB7pRP0Lj2U=;
        b=mA4Wf2G9wqq1LDU5GVXcqk/GpwFDqCIC5r/1bJsygR5mV3LX8zAZflUoBpT6nFwh/5
         3KvHVoQ3GByMGtHrI1uQ+nP/5ArdMLdnx69xdMGWcRKGEMkeEhse/ggirLeyOKjOd3HW
         8e6TD41CbRVpFuC0D5xsaZ3Rl5IEbidR0qzuAXmzHL9VLN9c7jLzMm4TS8BoTMFMeEcF
         XIzgoliO64aKjHISjjLP7pK6rHCdfRDFfaoDJw4snH0dmP+5u2kI/JPXb3tjy4ON1czu
         +W4Z7xm7y2MeUvLtVa1DjGchLfxwBn+fX/MHJnf/lHS7KS9ltOtuI7GQdOSyoE++TPEr
         nRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792190104; x=1792794904;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UfiAlLwpckXLSSoGlBblxykTWKXYXbwMTB7pRP0Lj2U=;
        b=Hp3M3DaoPwVynqHmUEGKwxzf2yKr61rTbNl7tsHwYi/TfU53/RAIKLTGkBP5B7Glyz
         ZqyyicLe2iy0gPcQ8y7E3L17hR6F971uh3JMVKDYcnDRrUs+kAFcKpVNXZ1bdPceLuSS
         wF8uEj03CzI1Xkm/oKcFawzMe3ihds2d28tqyKDbO53euTvs7rsoQk5vMqfHnh6nO1j6
         NbCSJ5kOmlQVGGsY5/uZ8MuTEbTBpp7BD9uIUv0iSQvX+H6axZSsVwSWC6Gb/czqnRg8
         1wxSbLFwaHUZ8556eRylvSLmILBPEMHKKxu7I1c2DVlKE2hqmure413v1C027kRpoFpB
         h2AA==
X-Forwarded-Encrypted: i=1; AKwUvByv3MVjI2uCbpYMKwDVRh5zJ1dGSpTe8SFfpTuAJdLa60GIM230zGvUYjgNLrhfTFFSyd2MYo5QssHnsPg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvKs8pOt5PZ904maYAg+Qi1sTaTKAcUMjREoKZTcpgO7Vc0eMH
	2W9Wv+vctdN5Gy6/UWVxU6ajcaqD4lLDD1+i5vfi/PxZhUcL97GyXQuUgGA9erf+DQ==
X-Gm-Gg: AYBFou2eOyJpjBwsIcLZ1eMQqPjSBR4RNB3cOEN0VwEmqHmWdu9hMfBTRXAiGNtfZlG
	J29YHTSOcrd4+LloDOHecHSVmpCGza0U6j8oab1YS9T1z7rHZG6gRdHCeyImLqOSucXz89xA6S6
	zRofnbrh/LMTyowHiuHy8Nt57n4JVjNcJmShqG44FzD0SHZUd0HmFfvFVRTbFgEStT3zNlCXByJ
	u+6f+zhz6LoteemFPfhDw1gsVoj+UiCCG4Lj5V0aG6XKqSnKc63IYpsATEzkJE+to1hnmmUhJgY
	drh3dAYGuf87EAYCcz5Cm4k3hLEfsLU7/0AKqCsuHRIbxM/SonqjZ32sCTY8SAOvhxMbGJfH9L2
	O0Kgn0OlrwmAW7iwtKWW81y34R2+9k8ggeVyCXgzVHABdo1OFUSge1PtEZvtATYCyYJw36bfJLe
	lhG6MJnzFcCcODJwFsoltA7/Z0lcjLNeEFbjWK7cypN0AtS9ukNfNCxZiotIZG5JEAUbfRDdeNU
	hkMEzh2yawX+7+BgYVDph7n5/ZHp8YojKWkAdnHXZDi+eE9+zHl+UtBQiY5SX9TvYtG4rlY25QX
	yBuXLV6C0T89Cs6m9hQpAP/jmnDAZNARHsbl3GNAWq9jj+/s5DdVrLAGL/NKMJADPaEpV9NTzOt
	D6yqXoEI=
X-Received: by 2002:a17:902:d48c:b0:2cf:9ec1:ea6e with SMTP id d9443c01a7336-2e9b31afe12mr1007515ad.8.1792190102405;
        Fri, 16 Oct 2026 15:35:02 -0700 (PDT)
Received: from [2a00:79e0:2eb4:9:17ee:cb47:3ad4:ee3c] ([2a00:79e0:2eb4:9:17ee:cb47:3ad4:ee3c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f56c87e66sm1698081b3a.13.2026.10.16.15.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:35:01 -0700 (PDT)
Date: Fri, 16 Oct 2026 15:35:00 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
    "David Hildenbrand (Arm)" <david@kernel.org>
cc: Christoph Lameter <cl@gentwo.org>, Vlastimil Babka <vbabka@kernel.org>, 
    Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
    Sarthak Sharma <sarthak.sharma@arm.com>, linux-mm@kvack.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [patch v5] mm: vmstat_kunit: add synthetic benchmark for mm
 stats
In-Reply-To: <920ba123-077e-c42d-ebdf-a5effccf2073@google.com>
Message-ID: <8b077a83-3f79-cbfa-0273-e086b0e51ae4@google.com>
References: <920ba123-077e-c42d-ebdf-a5effccf2073@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 9 Oct 2026, David Rientjes wrote:

> From: Christoph Lameter <cl@gentwo.org>
> 
> Add a synthetic benchmark that can be used to measure performance of MM
> statistics.  This is used to analyze any improvements or regressions in
> functions that are frequently used in hot code paths.
> 
> This is the first of three tests that measure the execution times of
> critical MM functions anticipated to be used by developers to measure the
> impact of any core changes that would end up causing workload performance
> issues.  Vmstats are embedded into MM hotpaths, so any regression can
> cause performance and scalability impact for users.  Google has carried
> these tests internally and kept them updated since Christoph posted them
> back in 2009 for this purpose.
> 
> This can also be used to detect regressions over time, from kernel
> version to kernel version, independent of development use cases.
> 
> The test is run by KUnit or doing modprobe vmstat_kunit directly.
> 
> Sample output:
>  KTAP version 1
>  1..1
>  KTAP version 1
>  # Subtest: vmstat
>  # module: vmstat_kunit
>       1..3
>       # vmstat_test_inc_dec_zone_page_state: 10000 ops: inc_zone_page_state -> 8 cycles (4 ns/op), dec_zone_page_state -> 9 cycles (4 ns/op)
>       ok 1 vmstat_test_inc_dec_zone_page_state
>       # vmstat_test_interleaved_zone_page_state: 10000 ops: inc/dec pair -> 17 cycles (8 ns/op)
>       ok 2 vmstat_test_interleaved_zone_page_state
>       # vmstat_test_count_vm_event: 10000 ops: count_vm_event -> 4 cycles (2 ns/op)
>       ok 3 vmstat_test_count_vm_event
>  # vmstat: pass:3 fail:0 skip:0 total:3
>  # Totals: pass:3 fail:0 skip:0 total:3
>  ok 1 vmstat
> 
> Assisted-by: Gemini:gemini-3.8-flash
> Signed-off-by: Christoph Lameter <cl@gentwo.org>
> Signed-off-by: David Rientjes <rientjes@google.com>
> ---
> v5:
>  - added dependency on CONFIG_VM_EVENT_COUNTERS
>  - expanded commit description
> 
> Once we're happy with this change, I'll apply the same treatment to the
> proposed pgalloc and slab tests.
> 

I've added the rationale for the change to the commit description as 
primairly being used by developers to benchmark and monitor any 
regressions in functions that are known to be super hot and impact 
workload performance.

This is the simplest of the three tests that Christoph provided back in 
2009, the others are pgalloc and slab tests, see 
https://marc.info/?l=linux-mm&m=178547194364290 and 
https://marc.info/?l=linux-mm&m=178547193264283 for those.  Based on the 
feedback to move to kunit, I forked this one off independently because it 
was the simplest to address all the feedback and pave the way for the 
other two to be upstreamed afterwards.

Is this acceptable for merge?  If we're happy with this, I'll move onto 
the pgalloc and slab variants.
