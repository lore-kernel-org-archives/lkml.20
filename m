Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F254DF4BA
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 18:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791397556; cv=none; b=riI3Ikv5cksUUpDIx2cZ8/U2GDQbAZwitbyVhpKbpnPzvij/csyX+3Yak5n5l4//raOZLe/lnzX1QSyS1NyBTY/ZtQBL9w/tWFtrBHNmj5qY07BRJpCAKrDmzK0azXx1ayEHiSBISDVjLKMHayXiCpmSeI1L3PJi2moWgHbxdyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791397556; c=relaxed/simple;
	bh=f7LJdPPGst2ABs92k8Y6jLvaVz3FtBc2OPOggR7SA68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OPvbbnpP4zJlMScL3NYWgbAsVUutHv3hrh5CwSKXDeRKWRt1xfnMYs74bTehgBuroecizzW28d2z5DJFCGIVk0nH/dHqN2A3q6r+zpwVTLVC8nn7F+M4R3WvTaX75AfjJ0g9jDzMunsAwwD1Fp7CeMsbaffEKNrP/vwHGFFzviQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=arjY9/+A; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="arjY9/+A"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93e515769d3so178834585a.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 11:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791397553; x=1792002353; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oBM/k3W16ZFa2deUK8cxyFeMvcY1i1trfri8zjFob3U=;
        b=arjY9/+AY0dpa26u7lqWEUACwzz9Uwp2AB3yWYLNfMjRepiN02R3Z8EE97/KXMfIdV
         b3WnT6Yu+PS78L/ZAV5OWPMf9+JVMphp68mhlFGcm9voLQQYqu1/iVgAxY/Y6NAojx53
         dwep0EyVBmHKgg/1+TtQCRboJwNP4XtY7S2Sb9sAgdeNo3nr3zWY04MVC8eblTGJaqKt
         +r0fOtRAPddZZQEp7vQ00z3dqV6ayv5mZiQwG+LNGEmWI+OwvJKr81ELSNo47Ym0DBRI
         1A2msykTh0eCKUHbe4IWZp3pV7lwCGX73wbfnBq3yzLHg/rOCM46uuCNgH4+xiRvxQZL
         Zmjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791397553; x=1792002353;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oBM/k3W16ZFa2deUK8cxyFeMvcY1i1trfri8zjFob3U=;
        b=OOjlUEJ4Z020ZDMb5tT0dwydvwwWRug1MZ464ZFcUEagGLXlwDzYMtlVrE+M9hauZ2
         NhO0ZlafcmGINOoYXr2mloUqkqt+TWV1ZQS4TfF13+WigcQwlYCtG6gK7wyJejFvAKaN
         EhIBMWpyEgaNvQ/VKJoOm3DRM1d68d+mch9MW45A6aPGwgrwVReVNeORqF3NRB8AGhFv
         7rmJli66aHSflxdUFq9X8R9LRfPpWsgFoud/B9mbLmsK6EESoZd8ydEjAqDs0qbqyN2k
         WjHI+R8lUTmATkACOpFc7wll8B/872ltTYPcO6IJXVje3hFkHccwi1mG/Gtjb5Qm3+Je
         ARVA==
X-Forwarded-Encrypted: i=1; AKwUvBz81vIDPUFOKrYyTCuhN+xdJwi36JM+iz+yyYrZXeB4NnJ4AacvcCIShOMovvzDS1+qpbZdfqRiZTaoZhA=@vger.kernel.org
X-Gm-Message-State: AFuF++l54tYsCFwrsi2GR+Y+06Byec/Djr9cIqRTrV1UAdLRxQzfDBpE
	Ai71PPqvMYPXDPWiWHQheTd8rMCEhiG8P/2cmfay2GZa8vgm/tDcbyW/bvSZRPLrx4hkSvzevNl
	GdwFp5azldw==
X-Gm-Gg: AYBFou2PYVZrPWto/c1ZxuZQRbbwIr8p7wD2dSY3FNPXL3DoE/K9vF3n8ZucgGZIT1O
	brTjUoDSuD22dVi97klHgdo7w7ld1fKA+Q+ahyF4KF7pjZJdOvwvf/gZn0VjSvgCTbX/T+W0Htj
	GteRlHAM0ltkwAo3c8L59RkgjfmBpMSE1BaB1F2lRVMtRqKkomrWTTq6YlPfzAZzxCq+a2HaVDm
	QxPx90jdDvNwz0b8vzj6OyX1HsnR02NmG2F43Smt2zXN5RtzVf2ZBZDAkjQkcb61V7/ztkrO16Z
	1Mhviyd0Dv0In7X1giN/UhiTasdzbTygEER/4NMcUhi5B2IhHg/+witYVDyoj0T4GWW6v3dNl+z
	9wQ31LKRfqHuMZbH6qTR7LqiGMk82BWjFh/obkysWGSpRakAjbjhAKEDE1ufNRRJwvOiMpcYhI2
	o+aL0C/3sf/dxuAR+C6PmeQ8MjvwvOlJ5+ULSZ5yd9iTtiHwBtJe/cpNvBKYEWZwDWHhpLSEemm
	N5aDhbpO8ykkX4=
X-Received: by 2002:a05:620a:84ca:b0:93b:ebd8:9147 with SMTP id af79cd13be357-93e9b71e80cmr544420185a.18.1791397553212;
        Wed, 07 Oct 2026 11:25:53 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93e99157d6asm278314085a.23.2026.10.07.11.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 11:25:51 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
To: netdev-bot+sinfo@kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>,
 Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH net] net: skbuff: don't leave stale bytes in
 skb_copy_and_csum_bits()
Date: Wed, 07 Oct 2026 18:25:08 -0000
Message-ID: <179139750821.4.9072526328443780658@toxicpanda.com>
In-Reply-To: <179139448190.2527009.17897220638829712578@kernel.org>
References:
 <20261007-b4-skb-copy-csum-stale-bytes-v1-1-adbbde033fb3@toxicpanda.com>
 <179139448190.2527009.17897220638829712578@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, Oct 07, 2026 at 05:34:41PM +0000, netdev-bot+sinfo@kernel.org wrote:
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

Found during development.  I was converting the BUG_ON()s in skbuff.c
[1], and the conversion of the leftover-length BUG_ON() in
skb_copy_and_csum_bits() zeroes the part of the caller's buffer it
couldn't fill.  An LLM review of that change pointed out that the
existing unreadable-frags early return in the same function leaves the
buffer unfilled.  I confirmed it by reading the code and with a test
module that marks a nonlinear skb unreadable.  It hasn't been hit in
production that I know of.

[1] https://lore.kernel.org/all/20261007-b4-skbuff-bug-on-v2-0-b9a5f732895b@toxicpanda.com/

Thanks,
Josef
