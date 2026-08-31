Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386EA370AD4
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788158034; cv=none; b=ZW+ZSaLj5fWRK2iqPRzBp/EeMf+DWpWhSvJhEeCM6hj//F5yMvZlCjYqLjDKq0SYDTAWs7rXClda9Bs68u4Qa2v02dwS4joszyM3XkPlYEi/d0lboi6Ec4Bte62VWFM5U8s7tGbnMXbCeQBVBPkm4auFpQS/opw9CRL/sh3OYks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788158034; c=relaxed/simple;
	bh=4r4B989XhNn5855KWt3NM6Au1pnhG8E2OSje25w3ack=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pmpZvj3wfX+f4lxXQqrrLPnfku5rFw0dxm3Z1ojyTnfHoSDUYkat3ATLQl03yi9oTSXew8jXV8JsdRi6H0NNUUblVkzQdI+UsYWnvG1afT5U7hNZCwydYzPUCHQdnHJ0F+Pf1oPBeMriqVzs34f1281t1XHixHbN/LvG73BWNO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dxjintou; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dxjintou"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d710632717so25227795ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 23:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788158032; x=1788762832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZdYVDo7588sL82RPlR1GkDzeflr+52xwAeMcbvupztY=;
        b=Dxjintouy+vlBBg9m2UILiw35xJ3JFgjorMdRCnBA0ipez8TI+K00pQ/DBHRYZaxuA
         HfmZNO8t3d7kuBqe4JckIKDGxxZDJMEjix5nn181TOG6yq+kgjPvSLH3CiTja+Odx9Yl
         haPhcytrshKJJ/DjinyEbANNsncmD525zxNzdt0JQMlfnp3FfRRbg5C89wp8MXUHdb0V
         A8P/bgp558Odpqi6pqVRaTvZHjduTzrIN43KPfCy5Kax9V84N8Dfq8lMoiU+9mGrmMut
         mHTzkw8qdtEnGjYsJQVR1P807NOAkaOfFOP/dpbGEl8z7Z9e3Wp6v7f1rDn+LtiEnqMy
         t02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788158032; x=1788762832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZdYVDo7588sL82RPlR1GkDzeflr+52xwAeMcbvupztY=;
        b=AjxfLVm5O5c3ugQIvQ37HDSuHShtZjVO4T0PObpY91D998DqovMPOW924YgHZM+qJ3
         VJFeV3A35vuwu+HwWQTJeuapshl1Tp/+Vc+osBO5/3y21yQIR9YpC2BxNXN80pYKZO1p
         MMOyHtwl0aMdGfHT/8y+GDTmNDF1zBltUBWkA5yYUB8nbp1ByXQV98n3uG6n+GlCOy4j
         kVpJFEO6DPlR1SvU+KfuXb+McXyjVgXurfZDXMkpY4ehZGmykzEcD9nm7+fRdko2yhUW
         n0EeOCpPu87Nv/K/xa5ZZgG+NmkNti0d4Q4Y4Pljy3k+kgpKb859CY9IMMb1Af9UicCX
         N5Tw==
X-Gm-Message-State: AFuF++kWGf2Ddo+nNuzd4Uagqiq7Dn2QGqzZjEBxoGwtzd5Bbs3fbcAj
	SuubYJRT59jt/B1CTSua25FxgNCm5ThGD9Ran7jVgyuR0jFQLFEeQhTD2URCIw==
X-Gm-Gg: AYBFou35X6/xx3ZnOkqeQ4XMdD2YgnfEdhG4jFBRP0i5+UVg4xCYapMYms605Za1h1R
	Zi/VxMkGbU6zyQBK+q3lHm9B34/aRajecD4tyHBnutsoZb0rU8YhaajqXB8kS4xKOgG/dp/xVGS
	oT8H2nOINqUoKZQXdATgJ+kFrDKstxmNg5IliFE8osGRoX4InjwmPtsSK3eNaXwXkrIbrZilHzZ
	adac4MfwFx9N/QjGKYxL3DnpvuNr38pMrE6tSb5grNRAiqcnpQEJRDH1jy/IfAPTmhCFHKZtpJ/
	b4RoUZZN+Pfx2FUMDR5GTwv7jNlAzdsSWquBE4jJ8l0qT8aSSRnYbX7WDCzhh+lWOu0NEbnO3bG
	SeeGWeKRDteV9q8yUEd8RNOy1bYNqo+XEG5AC8sFjrCjeMPZjOC1Z4dnfVwvp3wOSXcww1M9cgs
	GX04Oi26sQn4vTKzo/W0HwXP8qd3GZXGBzucMbGSgjTQ/NHaAFY+sPFh0nXyHQ0ns3Fd3gldX2y
	ZW97Uw=
X-Received: by 2002:a17:903:286:b0:2c8:248a:5dbb with SMTP id d9443c01a7336-2d74dcbe867mr391007535ad.7.1788158030880;
        Sun, 30 Aug 2026 23:33:50 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:21dc:72d0:e0c:d445:c26f:9091])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75963bc14sm29404725ad.32.2026.08.30.23.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 23:33:50 -0700 (PDT)
From: ThangNN99 <ngocthang2710.1999@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-rt-devel@lists.linux.dev,
	linux-mm@kvack.org,
	Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>
Subject: Re: [PATCH v2] mm/slab: don't use kfree_rcu sheaves on PREEMPT_RT in kvfree_call_rcu()
Date: Mon, 31 Aug 2026 13:33:44 +0700
Message-ID: <20260831063344.7933-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831062054.319EA1F000E9@smtp.kernel.org>
References: <20260831062054.319EA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks, both flagged items are pre-existing and out of scope for this
patch:

- The headless kvfree_rcu(ptr) might_sleep()/synchronize_rcu() path is
  never reached by the caller this patch fixes: set_cpus_allowed_force()
  uses the headed two-argument kfree_rcu(ptr, rcu) form specifically to
  avoid it (see its own comment), so it's unrelated to the sheaf-bypass
  this patch adds.

- kfree_call_rcu_nolock() still hitting local_trylock(&s->cpu_sheaves->lock)
  unconditionally is exactly what this patch's commit message already
  calls out as unsafe under a raw spinlock. This patch intentionally
  leaves kfree_call_rcu_nolock() untouched; fixing its 'any context'
  guarantee belongs in a separate patch.

This patch stays scoped to the specific syzbot-reported splat in
kvfree_call_rcu(). Happy to look at the two pre-existing issues
separately if a maintainer wants a follow-up patch for either.

Thanks,
ThangNN99
