Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559933;
	b=FyCCPg+t/LID6oZNPsBRa+EoddLoSBRzT7wspm++G8FFJq8+ZPLM6FZzHFUSxWiXafwQ
	 L9zzkUIT4EuIwOyEKFJWGmMSzbofEBJQyTLXnEcQ+jUu9BA7xjfFQN3mUiE+hrv1DFXvO
	 Wz/u8Dmgk9a48Fppol0m0E0eAjjH1jfAIbfjOqw1WlcajFOHotLBwT37iU/AQ3DJFJmZO
	 RWPU9I3Tc9CPFWxDkjPqtAI6+NXhD4nETZaVegRbANr+wshLzizzEW896dgB18Yluswk6
	 SKZ/3n4FbIQ+rouscRlK/IhLS10gwWeo+Kx2j/cqZblsQ4m2M78o7ZheV2cTr67n9ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559933;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=J3YUrGXSXKZY/bSJltCtfezd+TfrIG0RukF4uztH5NA=;
	b=wGiCCx+BXPKaZg1s93ipWTpQiC/xSEcLoUuRm5WfCNob2v25xPWYKlBrQd+CNw0YkUN3
	 fVJygCuvowu4SjnOpnwr9WN9+75l9YIMxJWZpU0JxFDm94/9kU9eMlwUebQt9d7u177bT
	 Jw/KNNLK25ozQP0tER4yQK936UosUPPbbfl3rYccTSWbz3xdREvdHupWsd6J8B4p0L7Nb
	 fglNZ14dzGKxFTK+ACviIYXzd1kwM4oVeZIxDC0ksDSPlI8lhqDmyW1Z7U7DWaRdyE9dE
	 9sXJtuKK23zWHSYWkCG9Gq3lmzyBML0EyLzNC1rAn0/CNLDQvvX2qk3YF5sXIZGvvSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=DU0YJExw;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF036606A89F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:52:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF036606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=DU0YJExw
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so1005184a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559932; x=1795164732; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J3YUrGXSXKZY/bSJltCtfezd+TfrIG0RukF4uztH5NA=;
        b=DU0YJExwNevdhs6jAs9ShP2CJMProdbfeav9l6bUjM7bIAtefanOcvB6eUeDSeSTIq
         5Bz1qdkBoTenUY2OTXvyOTfz1KOzqRDpQm5Mz2ii1Ndj+0tdudboRxF7Q70u01fn5VhR
         m2xCVGR4ZYPlAa3Yfbpx0rYR21V0KzkxSxbcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559932; x=1795164732;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J3YUrGXSXKZY/bSJltCtfezd+TfrIG0RukF4uztH5NA=;
        b=dDUeIrNTuqjy3YYJ0+LJ7vg2m1OedWwte4NuBvx+d6r8R1hmCHqyoNbsa2RyGkASyt
         +aEAvvUqt5+R4eJ8tqiqUEFT/IXeQJJCv/iWebmWpEBwMr6DhNd2YYRgsx1i+3o8/6W8
         PV31wfD5jIhdEiutZRPnJO70nKdmZCI+gV8Wtae6wEHhP5O7x2DHXMGZB68hm5rrSqqd
         F7nzITYlnM6OwlAoRUl1ARTqOEJMPjju/7k02yrHgoQruHCTpz4L71oLiRxnetegeBkX
         +6KRIFqiVFYRlfEQMvGVoxQ+ul5qi97EnhdLO3JBAClrvHNK4KVVfH5FJUCLCSKZgq3Y
         GYoA==
X-Forwarded-Encrypted: i=1; AL+hErFIxi/l2Ld49/A8yyLM3KUdbvlEip2TO8ugBlkJDA5De6lGctwjJ8yU/ST9QulQkYiZ9APgUVobjcmobos=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YRVYfmSuTN0deEAhY4vw2i+X7iN7v8jBf/OHPYQHLgUh4lqs+
	vq/AQ7ShhefU8MNNtCw7BvXh2wfU6PUENN433nTfIpd2ScvPt5FQ47YM78rq9jTIrGc=
X-Gm-Gg: AYBFou3BsMOTdlVo2p+T0HfcSr5yiEt1auQ4pEJVNEZVrUgNIRq+m51lWiyt8iqDLT4
	duHceH5xw8MQ6jFLde4Jws9igv31hO9hnifxD//L0kqdCY5a6r1d5dGQkfh1hV7uYQufNkujawD
	JkQp3qT/60RK0X7RGfzFcmf8MmUb8/0y+ttZa4SgtRyYXQiD2C7cBVH0kMySbEE8i0RPtyroPwd
	5t30VFV9kOdg+1UL7x9LC1CUZmAnBxOuwvm4nlaOXtNMdLkdaNjl/YugyODaeyJcaRlPmdPEJuW
	HogjizyeSuQKC4LNLKZyGP7uPiWFHJcJtEQj71+ArasTCc+cwD3IP4JhC8aM451Evw26f4i79Y5
	qq768ZGKC6k4qwlsfotbo+ECQ1cFxl0937Vd3oJzohT0AxwqqwTUGr9GKCch9zgEm/5sD+ZTVfb
	HeUSkkJVLYElNb94h7z0CVH4ckxlTJ19rW77GQs9Xxb6Ku7KkARQGQE/OX2jdePItLGu1i/TDEG
	Va5iH/pdKzjvvD8x/Fhb0OwQETkhPwpymm9t/RkwlJufhsb9vPsw5CAQGWP/64TWpjZKFuPjM8M
	0BtWeNdDHsi/7Rs1L0IOiRKz0+nOrv1ldNdVnSkVyQ03aYTBRbR7i0DvmOoz0B9jGN+CXmedwmQ
	2T0o/sJ6uvUT2uQfz12lnl/xpbKnojgdx1YonI0Wwo30QMYPJjUalBagHAu25IXaRs/DNtr1cy7
	PbimShVKolo+nuCbKm2/jAv7cawksdjNLHvt0t/9BlntdX16mXYJwEjk0Ls3TDbV9W+Ut0APKWd
	pAPlnfH
X-Received: by 2002:a17:90b:48ce:b0:3ae:5572:c4e2 with SMTP id 98e67ed59e1d1-3b1b0a4e8aemr1576928a91.57.1794559932319;
        Fri, 13 Nov 2026 00:52:12 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d35525sm8662027a91.16.2026.11.13.00.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:52:11 -0800 (PST)
Date: Fri, 13 Nov 2026 00:52:05 -0800
From: Chris Down <chris@chrisdown.name>
To: Kees Cook <kees@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, Marco Elver <elver@google.com>, GONG Ruiqi <gongruiqi@huaweicloud.com>, Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org, linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2 4/6] slub_kunit: Add a test for the slab_buckets boot parameter
In-Reply-To: <202610302117.74D1EB1@keescook>
References: <cover.1793253633.git.chris@chrisdown.name> <47c0b11109203640122a9b5b030d3f41bfbac609.1793253633.git.chris@chrisdown.name> <202610302117.74D1EB1@keescook>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261113005205.440863a59b460786@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Kees,

Kees Cook writes:
>Please don't ifdef to drop a test. If you have to do any ifdef, use it
>for test skipping instead.

Sure. In v3 the test is always built, and it calls kunit_skip() when
CONFIG_SLAB_BUCKETS isn't set. The kmalloc_partition test in 6/6 gets the
same treatment.

>This feels messy. Any reason not to just export it entirely and avoid
>all the ifdefness?

No good reason. In v3 it's a normal global, declared in mm/slab.h
without any #if. It's still only exported with EXPORT_SYMBOL_IF_KUNIT,
since nothing other than the test needs it. kmalloc_partition_enabled
gets the same change.

Thanks!

Chris
