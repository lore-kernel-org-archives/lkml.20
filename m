Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44612547055
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 05:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789796835; cv=none; b=YISZRvdjx6hHKhXw0TjElOItmc8Hp1AWKJXRXr1zm5nN2E2/RJnzz2BtI2rtTrUxjLUW1vk1BJeNplnFiix0MJuWZySmZrj6lAAIPWxiC7M0qyU36a+0jxmH/8K3MvXpfxo1kMt75jETKI0RfiVqbOG60ropTGXpD07NmwIXWtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789796835; c=relaxed/simple;
	bh=v1XP5r41bgS5MWfSnZiNwpjz+p6BfN1AlYJ8Ofbd0pc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mV4TLdDCGK830PcOOQUeVCwhe9qaTl93RLxAMHn0JgY3wK+tSHSyAM2qi+fJw3dQJFC3mbb/WCuwhD/33uAog+I+8txaWwoobAjZ4tO/5U4IULo90zEhLmjFPEhXWIPzRt685C6PzspAFifQz2gXng5YWVqHkDOitz84+jBy8GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=By0pRn1A; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="By0pRn1A"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d8239so10166085e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 22:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789796833; x=1790401633; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=COKKaSNh5aTClL3pM4Jpjuvdb7nWPK0iDVawAIP9M/0=;
        b=By0pRn1AMBtlgtDeMoMX3IFpmCbKx7YFIl3YdUQD3AFTB7DhTdYAn/ezvf55aKnEsS
         lbL0alUkTlQ+tSRPE0eeH2CHOe1Iew32SB2dYEEWNn6t3VfNpuk9ieUlYjJp0TYGAaW/
         7DS0EDzfuFfKRQ377my/WdodhD1fCbIqt4U+pTYnfkowf059v5AgjNHyfuTAb4Kxjp2d
         YhTr9NqENXUWgaTrAiMQXKOyGLBS/CBsjxhbphpnxzRYuJlCYDrKQ76MSBoWLqsv2Mt+
         6GL6NdRECU8AIl/+OMpbmDiRFTKsT+nOY0xdui6WObiF0GcuDW5NpXIxP1Mz4hX6jhKK
         HQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789796833; x=1790401633;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=COKKaSNh5aTClL3pM4Jpjuvdb7nWPK0iDVawAIP9M/0=;
        b=ofvoej6u2siMM+T12tAJnOL1mMjE4cvYvYbo5R/Zhy5g05+ezIY7nfZKTcf6ijF7Cy
         zD8uGj86BKpEBqYnkfTjx8r2gCbiMsBkYKViUIKhoHlgseBVBDGRYxEMBoT6ODoKkZpd
         B30nwtMYLO22wqcN/oFJXT59mauZHtkt/HT+E/kWT9SZOulF/oriTJRxgsG+FzYlGu8O
         WY1RFNCdh8ErfICvKDmQvN0q+zdujnPuLl/3iarpAfwiTY2LojyJD6f4tzqSCSBLGS+N
         RSAtKRuGi0GLVB1/DLLvjhTdEJ9qe8wSzzoQQZEiik2GGHPBwfoNEtDK5AhMupPc3vB+
         Uefw==
X-Forwarded-Encrypted: i=1; AKwUvBxRJKqvgBvJWITth0YDuFYZgd9hQfQsPfKpTIwNXKF+XvnOslDrryYvYvC6PmN6Set75Bsq1GqPYF6adQM=@vger.kernel.org
X-Gm-Message-State: AFuF++lNRlMp7/FtdPkFWtadyIaAjWcE7aBhKk9mXU745wFF3IvCYGck
	q0/Bws+/1nmRPzUb9cUd9xe/k6gj23HIIVhY0D7RSivLIJZ1JVXJF6WiuTRAciKL
X-Gm-Gg: AYBFou17pULKyqt9OlMZb+ayDJKffsZ1aq1wpGl8pQYvT9Jp/dYMWRiAYiz0JmQE8A/
	rrUc6BUVrlkXK87mqqXlidAHrb0IhRRCKDB1i4NkbPpzWSab+rMLeCzXohGIK1wVfTCRKRmVHWe
	PWxp1eOy1zUYBNCVVLaGyr71Kf7AkRJDRS3zZHqjeXDAHs7HH3/Mu0FXnlDT9Z0nb6zu26VmhEY
	8UXMSpFLvB2pO5oK0VNsZXzsf3r7+/ePFVaS4bOuOsyoM4G0Ipt7NGgODuDIiR2YZFAwW/pz62F
	a7+Zxun6LRUiUoawdwlPBTKprHQaiAMx8/WxMKEUB3VDrmuVi/y6o9HoW8e4p1tcm+QhlQhY9G7
	i7NayLzJvB4DvR/QIdpDAU1aI5ZlV0pHctaH4/2tlRaj32HT7t4Ks0HwBIZJuJoOBDz7nHEBzy8
	bm8b9xw505McN7J15YkiiAGO0hKxBNX0mHAmlCS0rzCqLnG0PxfLtNR25De8jrh6QOGYHEJqtRG
	GOOwj34RVtpjbR+L+B2BEWIjg1G8W2YNyBDSX1MY5CCXwKing4jh62fR0T+QpjjJiJVjYlxxjYQ
	Ee3H4uiLwdlnqlx5PrUMTENbkwN5oI9tPDSpfW3PVibiHkjqujdOvK0d+1ntQa6/y8eWxr18jqU
	T1s9sb5uO0zyPTMlH
X-Received: by 2002:a05:600c:8b61:b0:49e:69ff:c6b1 with SMTP id 5b1f17b1804b1-49fc5749edemr70586425e9.31.1789796832402;
        Fri, 18 Sep 2026 22:47:12 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a017-2b01-05fe-203b-7cd2-a640.310.pool.telefonica.de. [2a02:3100:a017:2b01:5fe:203b:7cd2:a640])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd068059sm46003715e9.5.2026.09.18.22.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 22:47:11 -0700 (PDT)
Date: Sat, 19 Sep 2026 07:47:11 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Lian Wang <lianux.mm@gmail.com>, Kunwu Chan <kunwu.chan@gmail.com>, damon@lists.linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mm/damon/tests/core-kunit: test PSI goal rounds
 under the temporal tuner
Message-ID: <aq4hU5DNjnGELpUT@gmail.com>
References: <20260915060937.3423-3-kmehltretter@gmail.com>
 <20260916002137.101195-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916002137.101195-1-sj@kernel.org>

On Tue, Sep 15, 2026 at 05:21:36PM +0100, SJ Park wrote:
> So, this test depends on the memory pressure level of the testing system?  I
> concern if that could make the test result not very reliable.  Maybe we could
> split out the corner case handling logic to explicitly receive the current
> memory PSI total time.  For example, like what I suggested in the reply to the
> first patch of this series.  With it, we could build a kunit test for only the
> target logic, without depending on the test system's status.
> 

Yes, the second round reads the real PSI total. I used ULONG_MAX as
the target to make it unreachable, but I agree that a test which
does not read system state is better.

For v2 I can test only the helper from your reply to patch 1,
with explicit PSI totals. It would cover both tuners, zero and
non-zero esz for the temporal one, and the last_psi_total value after
each call as Kunwu asked.

Thanks,
Karl
