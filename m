Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792512632;
	b=CVKPHjcZGJGrxmp79PryWXyiVBki3533HwA6AejQsDbUmjO/bE7RxghMJnRvPPI78Dit
	 oC3LXuE0BkNMut8780W9dx0BHmGbL1A8D5JRTrKKGT5ydUPijXCAaaZVCyuto8+gHLert
	 SkW0ziE/aBeftO8kSbId4QdICby9M+HDgLiKgxWuSwtc04kPTnaXIEr1FVC5HKtAK64uQ
	 MSk0lSHZsrWA41qUMLX5GMrxPSJsK6mhbSJNV9qZ7GOeRkid6hSIAKcZnezqU6Jz3K6Vx
	 Mruui7NGPv7mCWwDbTABRFENkgGHrfTIcDAatWt7lzAFKVPjKrn4+wQ8nh+zv1cBHZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792512632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Message-ID:Subject:In-Reply-To:References:MIME-Version:
	 Date:Content-Type:Content-Transfer-Encoding;
	bh=c4lo9c1DzgFzppkuIe3m48wNpvzpTiu2Q7BfuVscJUc=;
	b=FdqKsbXLPQsRsGHFLlu520I41nkfTn1UJXEwzhVk21F7OprlOvNh7EwSOS0zEEa5eNkG
	 Z4EfAVwYmwK9a+a/SvLrfP/eIxPCUXWy6wMMMleGkEvqOWZptb6UL83Z4xJxyw5N8+IMw
	 knBkoDcfHRNFhwVvPpbV1zNwcTljEj1eKoCuyfeatXyiFpSqOkZgcpTsuA5klLLV/otCp
	 xG9uM3LMh4q4atg/Q8ApmOAPJ8vmA4YQl+HsJXD/pTRFdLzt+F3+7/OHqw41LWGOt2FCC
	 wP4aEA9gG11XPh/s0Pez+hgag7qtLzZnVd3VQM8UKlYM8uMwhjf69Cj7VbytmDY03uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Yb/qqOgN";
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5110606A320
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5110606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Yb/qqOgN
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3ac749e0719so953973a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792512631; x=1793117431; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:date:mime-version:references
         :in-reply-to:subject:message-id:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c4lo9c1DzgFzppkuIe3m48wNpvzpTiu2Q7BfuVscJUc=;
        b=Yb/qqOgNPajBomQKW9EmdyhHhaDypJ19gFb1YQkJGyaU8/EiIanIBWY5Z4CYza1eOw
         WOXCMNh5jwZKHSDzfYz3GjMvRARFrzLsZW6To0vXXBhPo4YCNCcA04j+Ep7971DsMKI2
         t3Q3OtnOb0kpnUypLntPDAI+ExrDG4I2pjLeag8bfYUPImFJQyUTKuqSkJN/b1NFMP5q
         vOkbfzXE/m2bd9CvdE9FGM1zIQzp/LQ9lfJlDqYRBaNf+30oOAKPuIeTGh/w7+CFCdn9
         ndCvRlALFLuMedVFA/XnbXzP+z28g0ldIE4g1E+Lh2xfMr2yCSX63ec0oNazXXUUL2dU
         F5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792512631; x=1793117431;
        h=content-transfer-encoding:content-type:date:mime-version:references
         :in-reply-to:subject:message-id:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c4lo9c1DzgFzppkuIe3m48wNpvzpTiu2Q7BfuVscJUc=;
        b=dn2BsNxpi5RROt0CJoYmto/tA0qCAAmU/Tk6sN32A0LlS5W1k/Y9HTbzsaMPF4qE3b
         mKU26OzAY0KUTS5nn0aPuyiWGC5K286lWHklZu+Nujtoqo6HdhJOKkDOmcvSG1/ktVeh
         Y2gxWjtCOvZOGERROkaQ5eJrD4Td8fVFgt09zzywcCJ6AQ5QJD9xPgVw7S99aXslpL7u
         fCpY3FbWmHpOv2MRaFRaTLYcc4GJRuGEgDEDJAOnWqudotNrLMGLn2ocC9zuCvfAiGjC
         sRtFfvbxWJ6iZa1Ju1963bnbtDJty8DUuQsfCSksb87Iocazc1ioA0L0u1U90vi6cqcn
         LQhQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYvV6dmT/nBzbJP6rhJzsgVS2eZHYSEXXLfAfkS9xM7KGFDLCXrpfY3jPVK9ZNliCzeB8SFP39n3mmmxM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcz6lFpKVXtr5qY8P5gex+Yk/PBZIcq+oADZg2cuPGR8qp3OsY
	r5TZGxamd9Km29EF+qIuLsdn3EL2D8r/grNgNFEgQo4o1Q9rU9ZPLia8
X-Gm-Gg: AYBFou3ahS4Z+3hcboeTfGcj1eHBvGH1dxaF7dgwEwKG6Cjj9J0XtqtOPgQ767U16wM
	bMbi+G6Y2unNL9AI3QnMg8cqgVS5sNiMpu6AoJyrzMrXOHRgr5lunH2dgHWNw+tCHu2ZGOvaPqv
	7U9blvW4mxou5sryMsM4XtWQ7Vaem0rfT6RtjTk5+ScF0Jjc38thYLbT5Q2w+VPoCfC8trJHRIe
	6ZJB0E9h1zopbJGnXeOZz+3lx2RvXTNtJEC/Pr5t2UT6wjvLvSvreDMYmj4ReEV+c8O0i+0fk8H
	LkqJi3sYbjqizYrXC5FEaaaqZdKwF5bZa/R59ps17Bn4h0Iwn0W6LdClPYzF70VAPVjcxHy7kf9
	huxxGPDLucXke9PIzDputWfcgIuqOghwGyKzH4uGQqOVXMCOGOETQgnUO0eNA26z+8kSy3Nd/6k
	LOwv5tog0WpRX8ezSFiXdsRO3fz2zGz1IOpR1P2+/KdG2J/iYZvYMTMEZkO8QFe5XTkIK5XgjNe
	fLRBk9pAok5komqK05QP5DOodOsTk/r4h8XEAO4LCoGA9u4SWf7ig7Gk0f2haO80z11gZ0=
X-Received: by 2002:a17:90b:5112:b0:3ab:c80:9365 with SMTP id 98e67ed59e1d1-3acef0f47a8mr9810302a91.42.1792512630823;
        Tue, 20 Oct 2026 09:10:30 -0700 (PDT)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad80cbe295sm87743a91.5.2026.10.20.09.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:10:29 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: SJ Park <sj@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, damon@lists.linux.dev, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <179251032453.2.6166799753856435091.damon-watermarks@gmail.com>
Subject: Re: [RFC PATCH] mm/damon/reclaim: allow disabling watermarks to force
 reclaim of cold pages
In-Reply-To: <20261020135822.85334-1-sj@kernel.org>
References: <20261020133233.3920818-1-ruanjinjie@huawei.com>
 <20261020135822.85334-1-sj@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 21 Oct 2026 00:07:00 +0800
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi SJ,

> setting wmarks_high, wmarks_mid and wmarks_low to 100%, 100% and 0%
> effectively disable watermarks? Have you tried that?

That worked in my test with swap enabled. Agree that documenting this
combination might be useful.

Thanks,
Aveline Noir
