Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88DF374A17
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 07:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788332435; cv=none; b=b5RlaAwHJlVA2ZmiNIl2J3BdxzieeWZHSkqHRROioO88gvcPSe4hmZuabtimg+HBvC6eigr7PfM+jh6S0ikepWdZqOhJ5YEL3luC7WRDQG4DMnIx3RPnsuWzGGLWK73E3UBsCYWClYH+aQgOLqy2BuLolXNjoJeTQMVHw0Wo6+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788332435; c=relaxed/simple;
	bh=fER+gMxgMdx84eTSstOteI3BKITvhY58vYW6TD5RMpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fRQ0fOX3JPUjH2PuxMX8Gq4kKvk9n3FjY22LRnlsYfU3svnqgrMZj2/5WzI2reT9Xw/xnJyI+vtuT31OBZYXXb/Yar2o1SFxnLC+BEt9Y5H8dXfp/z6dYyTdcIu9ledarBvtdmgJiDbpYjcZGwjAeZioJsmgmhOFVHiKprWa6j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AjAPJRyD; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AjAPJRyD"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso7486655ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 00:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788332433; x=1788937233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fER+gMxgMdx84eTSstOteI3BKITvhY58vYW6TD5RMpI=;
        b=AjAPJRyDgHRjtTBNA9l65GsYfuKflDaGRNAYGFaHES0XOxIayMh9OoZuf8X0pvHwjA
         o4mfiqTt527jh9Y0FFQVAEVubDPBQGPAxdju2wNvNQr57NrZtNU+wXVirXFtOeG0JcLR
         OfGAcnI21l+yTgzxGfacScURNlXyzq4cIOyTZGb4BrL4hbGUj05OgICnAGxMIbPvVVJN
         EM60EVVxXNJeWm+tMycj8YIo0m6K1WPTgv30R6BAAt68HzZWSlojUhZqCKMuvH2ZSyZ+
         vkrTvDEQ5ANiB27OZ8gvW49v3fzxdk28t+slNBoPTkphtzUloKZZ2mzzzGLSO5xsxmhR
         dsxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788332433; x=1788937233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fER+gMxgMdx84eTSstOteI3BKITvhY58vYW6TD5RMpI=;
        b=BSk3Y7jHXmgbF9VT9ebEBgf8EQzOmGNjqztRHtRul/7Xpt3Jtzmk1rxOblO2bk3Rcs
         3tMi7wWaHD3eam2FPErl/bBd5NRIJzBGbCU+7ZanZdvFywvLX23MU0s8kqnBzs20zh+L
         hNVqEar+Ah9CTis+m41OCmZb9h3WkoLr4a0Sg78gy3fLjABseQozDU5EFFolj1rTboTN
         vAPByzCZqsFvjqcL80no50a+5YNT7a0/y4SFjpWYYMTQtwPwFi2Ojb8A3JENU3g20i08
         4XCY1Ycn23/1IkVrP+Cxo3zojg5rRaCk8fLdbGLErzKaEdwLChW4WYg5a+wG6zWWCe4u
         JW1w==
X-Forwarded-Encrypted: i=1; AKwUvBybBwIr6IUisq67jNnldJDGErC7AgqvWQKMa1thOJhHs9vbmwatBOBCLkIt0voYAhg9TsN9oyhguRegseo=@vger.kernel.org
X-Gm-Message-State: AFuF++kDl+81L7/1+aA8NargPsD5IiVTqeYLRs8WWkxEPliSkq+qwhRf
	gKOYMjRfVKzfOAfDeeGrcLvG8OKhU1dG0Q1QW/nj/J8y+nL+fqAnU7mE
X-Gm-Gg: AR+sD11M8IirlAZXZE4Dmw21tMgI9lPOGO1DQrtYWRluIn4J8sBuEnwsUjumSQXN7h0
	pgl9cTmAITTt73bLQKCYG/1C9X8Vd08KhGoWL/jUnGhiB8PchnL6gxaF1J4f8/uvhSqNaWhYu8W
	zpCdo56xWHOy5qbZn0S+JSj6YUaxzBPt7cPb+0XtKbiZ6fiDEKly0vhTOZde8eiRJnGbPbjK1ok
	GtyyVqoy60Pe4a4r0pgui68ye02GPH3Nb6j6wATs7sw7jlp+aoKLsZjtJJRuC62L0k3/5+BpDMf
	7VKYWY+CNS0nk0GYlURd1NKrsVHWLDJliEL9PA2yINSY4zwi114AFMAneXNdv3YdIVe32Og1aFu
	DyxSVBrNJ9Sjjryx4hyWNJZTSwTRXS7q/3OcnHHKXsqam/CPwBFRmcQfibBt8BLgZbI1yvF/zjg
	H4BdJWaq07vKm00+Js2MxRlQVbRI7SVxas7bwLfdZCn1QW2hycpFPF9WVCr0cnY2Nqx1iTkb+Gr
	dORGX3QP3MmiSmCqQP254QN7wQSRnITmSR5zT9NF0OQt2bHyFuw
X-Received: by 2002:a17:903:324c:b0:2da:e553:c70f with SMTP id d9443c01a7336-2daec7bc931mr42090935ad.22.1788332432973;
        Wed, 02 Sep 2026 00:00:32 -0700 (PDT)
Received: from secrnd-cstp.tailb7f510.ts.net ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd4a7f1fsm8113065ad.63.2026.09.02.00.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:00:32 -0700 (PDT)
From: Sanghyun Park <sanghyun.park.cnu@gmail.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Sanghyun Park <sanghyun.park.cnu@gmail.com>,
	netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	David Stevens <dlstevens@us.ibm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] vxlan: use one headroom snapshot for neighbour replies
Date: Wed,  2 Sep 2026 15:59:12 +0900
Message-ID: <20260902065911.1177698-3-sanghyun.park.cnu@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <53a67f9a-b8a0-4967-b2c6-be4ee3a09735@redhat.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the review, Paolo.

> if you can observe a splat on the unpatched kernel, please include it,
> otherwise please explain why the issue is not just a theoretical one.

I thought it would make the changelog verbose by putting the evidences of the
bugs (some people like concise changelogs).

If you prefer splats in there, let me add some in v2.

It would be like:

```
/* vxlan_na_create() samples ... */

The race is reproducible on the unpatched kernel. It occurred when
vxlan_na_create() generated a neighbour reply while vxlan_changelink() changed
the link headroom. KASAN caught a four-byte write two bytes beyond a 704-byte
skbuff_small_head allocation.

/* Snapshot the headroom once ... */
```

JFYI, every patch I make is done only after I get real evidence :)

> Also please specify if some LLM has been used.

I used LLM assistance during bug discovery, analysis, etc, but try to review
with my eyes as much as I can.


Plz check the new paragraph of the changelog whether it is ok for v2.

Thanks,
Sanghyun
