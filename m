Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C442D47B408
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788184555; cv=none; b=kiA90EqPDLluj5l25mp+bqh2tPDSSY/AL8OmaPo7MsjFKhWC/eohJSoH1Dqd+Y3P2BuW9fvOVbmUl40WFhBTYDQVXB/4G7u7h4OqTqx98lNs0+vnwlIVG0P/pwz+2V9htr00TCLH4HQShA5AmhJ/GVrrVZkaxHNVxvftD/67Es4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788184555; c=relaxed/simple;
	bh=axzo8aJCFa83NYo0fuGpZ/KVEO6ZVD4PXl3FhGQolrg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fodNH+y5/PNFUsaP/BpwNpkoob2bcVRdCp57czXSNKcGHpCT8mAGDWF1ZD9v2FevEHbn3YwIR9F2Y82IRh7KVWjLjM9Y5+rV+bohekrez9Tkg+F6KeWYq/6sh0bmciAVef+w2d8WUILEuYGK4C/4/GLps1KkDSAKAZFTdkeyqlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X8MJoJ+C; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X8MJoJ+C"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc11a905ba5so2529269a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788184553; x=1788789353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jlQZGfunhhSOxluD44L3CBAxHK1ofhgstjgbuCZgd3o=;
        b=X8MJoJ+C0nd4wnvROTiT+JXK5mQtfE6JSOGFrAp87y1DrCG9BJD3rStoVcxkJhaXfF
         OMc8dxlSZzkP4kR6vH5FDs6KwJMkYiA/RE3l36US8EjKZodGIMbDGRqee1ImaU5jRBUv
         s5osHvThJD+UQsGhFdZne6S4GE1OsjLd4CbbrXuZUTazz9H3l0YvU098pwhs1WW8ssl0
         GeVdi27HsV5PjuEHFs2C0J68UKBDdnRnBqDjuPCDiITSIKd6Q7Vvnq5bW8MFB1woiSwO
         55ssIwhRMED7+dPG0be7Kr6Clui4a8kQtqoNeigkxubFbxI6h7hjoG0XayxUT2Og5ZJB
         9JTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788184553; x=1788789353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jlQZGfunhhSOxluD44L3CBAxHK1ofhgstjgbuCZgd3o=;
        b=onchvoHK1J/SkG665KmWD1Exzn7ioWaGymAOJ6dWDzUOsvQ1YXjB4eq2ilO6NIAw7z
         I3AtPieKG3GVVZJBmssBFYhtapV43jEAmuP1H8LIuZpSKujhTIeFDH9TO9FLxPNaLvNZ
         EL+ndFyRocd4dD1grQ4M1focyKqsU7qK8r2sxxAF9DncnhL0QjZ/UJBEcZMhKV6HnZ3J
         MwhPDVb6JhSsBKihLGWAQFJ8oRUQyP9jQjNAds4CGlxps3o+TX9ffEOucJl5sixkl73C
         Z0DG6B5XEW3eVyUm7lWPAFQkqwO8tkMb4DId37SNg5CI2/5/LwD7k8GOnMzloIBiyVEd
         z8oA==
X-Gm-Message-State: AFuF++nKXRe1lhCMEc1PvcE0ky7yZXPfAPPmINtDHSLiE0CC+kuGVJ6E
	5OgaBXgWgRIhr28f0x1YCPrlI4oIf1VFwOMoq4bbi1JSySGh7e2CTl3TSk1h9g==
X-Gm-Gg: AR+sD12dac0FSANTcZoISVxBhZqNoWGYBFJvnly+ThUnidO3t3MV3zLa64e3qq4ulph
	Q2l6QZ96Vz5uRn0ngg150ygA6I/UED0Z1BuAGEasPnBZvbBnZsx5/H/PpzZ07qT4GJCjOiNkb1A
	B0CrwzCdNmkqYFFRUrY84tujuYZK3aNnQ3T3hnPh6iD8JVkzBkrH+dft5sQcMdLTpPOy9JxCQ8Z
	GNJa519RrBeBMeUfii4LOPLBZQ+KlgPDWAnzngCackNj7WNsa6Ef1iLcSkqqJTdjnF+XLRnhQ6N
	2zQPMwBjdvZ+lyAG98WOB7HqyNKLx6OWs87jOW6WdZlggeXrFIjsghnVOp8XFbdbJ0xzD92OJtU
	noNZHXUsxt6xvVYQHhx/534H99XcaHCw14OWiwjt5qw9WZmNNGuxDawbr/QwWxMl3MTUlJkVQKG
	ZfzOEk88mzoxVLnJ33Y4uyKm54Kb347gKSQ8Ucv3mccHyuIhMbMrCF0e+X/clVYwu+f7ycBy4eo
	QEIY4g=
X-Received: by 2002:a05:6a20:3d82:b0:3cc:b26a:7686 with SMTP id adf61e73a8af0-3d26784f231mr40133026637.6.1788184552749;
        Mon, 31 Aug 2026 06:55:52 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:21dc:72d0:50b1:2f22:32bb:703])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f3312676sm4204321a12.12.2026.08.31.06.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 06:55:52 -0700 (PDT)
From: ThangNN99 <ngocthang2710.1999@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-rt-devel@lists.linux.dev,
	linux-mm@kvack.org,
	Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH v3] mm/slab: don't use kfree_rcu sheaves on PREEMPT_RT in kvfree_call_rcu()
Date: Mon, 31 Aug 2026 20:55:46 +0700
Message-ID: <20260831135546.9929-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831135150.1B4B31F00A3E@smtp.kernel.org>
References: <20260831135150.1B4B31F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks, both are pre-existing and out of scope for this patch:

- The GFP_NOWAIT/wakeup_kswapd() concern in __kfree_rcu_sheaf() applies
  identically before and after this patch on !PREEMPT_RT; this patch
  only changes the PREEMPT_RT branch. It also predates the commit this
  patch fixes: alloc_empty_sheaf() has used GFP_NOWAIT in this call
  chain since the sheaves feature was introduced in ec66e0d59952
  ("slab: add sheaf support for batching kfree_rcu() operations"), not
  since 2a8bb29ec9b2. It's a real question about the sheaf/barn
  allocation design itself, not something a small, targeted fix for
  the syzbot-reported splat should also try to redesign.

- Same as noted for the previous review: kfree_call_rcu_nolock() is
  intentionally left untouched by this patch. Agreed it doesn't fully
  deliver on its 'any context' contract on PREEMPT_RT either, for the
  reasons given (local_trylock ordering, and now also alloc_empty_sheaf()
  reaching zone->lock). That's a separate fix.

Both would be good candidates for their own patches from whoever
knows the sheaf/barn allocation path best; happy to help test if one
gets posted. This patch stays scoped to the specific circular-locking
splat in kvfree_call_rcu() reported by syzbot.

Thanks,
ThangNN99
