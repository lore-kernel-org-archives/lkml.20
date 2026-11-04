Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793786845;
	b=EzC7rXib9+pJYQ+2iELKyg53N335Hf0pP/KN+v9uwkmxXIO+pgK6PxhNbwrfY5+byAeT
	 u5qwosnuVpxLAvuYLZO2p9RfJZWjas45eQAOoHz07zV0hhBBa1z29YOz7TmFDlza7pWjR
	 w76mI2yoINLY3hci0WdMkjKzQEghRbZhcJzogY6SQ4YzZ1pCPauGTMOE49x1FcXcXj4eZ
	 PKF21E/U5M7IGJJC1nmxn7jrLO7B61ANhsCnHDFGhrEMQOZjgjqalaXuYEi70TJqGqFBX
	 X5nrEPIKX5hwLSBuDftl+ZbbigJj9D4pRYSmiyojBsz5jXP/RNTarFQ+3HrJErhtpfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=f6mGpkBy9RlN0FEVR7x4Php3XTrxwEWY6tQtidxcE8M=;
	b=LIZTzF8u3ycGuHk9lojUjQLuJuW2FRXldP4cgVrTIHYi+hw5Un4B6hubIETi6rjWsRyy
	 JzWAIbViXGdT9JqGh3M269y7x8XLx7DIwpLFmq+vNLCJOb+sGwJpbJ+CvK0Gs6BjCs7GP
	 LqDf4Z/lXk7Z1DWl3OS/69XIjaGPk8MzT3IV0M0QImtUS6VOSN/5RaTZ+UlJLvsZ2x+YQ
	 LtiKFYKB40knD2bJSnVwIsYfs4C0HbZlCtTE7pD4/xybi0hcP54yEVM3JwP0ZsVI61Hry
	 XshHOojVsWlsM4Gm/4awnqsT3Wa9mVir2lqvnPHhHDcYHr5DR2XhKJ5kf1mM/EF/lpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=INTfXmz0;
	arc=none smtp.remote-ip=74.125.227.132
Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D857606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:07:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D857606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=INTfXmz0
Received: by mail-pj2-f4.google.com with SMTP id d9443c01a7336-2e96b8bfb43so1763915ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 02:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793786845; x=1794391645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f6mGpkBy9RlN0FEVR7x4Php3XTrxwEWY6tQtidxcE8M=;
        b=INTfXmz0SigGufgcm2JKtENEpPaAIxMeHSrWhqq7sFrQxIR2ia6WIPQ7i8STCdRI2z
         uLP6mJjyeQA0av0bw9kMx/6CMmnh5XUY9BCyansyQgH9Mgnao5R6WWOErTUJZGCmjBhe
         hAX+ETAphkEEX/UFEff7wgnCW7WcF1W/gkNHEVmyX0Ew7DMeZqlh4J4APWL0AQjPWCdD
         eQICt7l4+1+XZqHHh9GMFPg+Okt9nCTmlB6vMRiPTixGCLSniRndFIOIyalu0T2t8tX5
         8jH4/g7rDmbLEmr1+O48Lr0Sqvd1KL7CNWr8jlNZ7oCEZItCJ5PKc4CfJrpAUzPXw0Fb
         O3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793786845; x=1794391645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f6mGpkBy9RlN0FEVR7x4Php3XTrxwEWY6tQtidxcE8M=;
        b=d2cUNx25bokjQdkGvUJCIi87D3xthzqMYl4+ykUYJlMioPzNJ9z1znxc+XeRmq065r
         dx47w4uXldEJXR/tA30VMHsXeJ5z/W77BWxxjT/tacCOwtAahHnE67+i2oSOjrF5FNSU
         yaWGG2o8REGrenCtcovr59BCRgwOOJpzCY9xBF2neG0fMVABOMDdkW6CNI8P8YTcYh9f
         W4OZWxMdHGousWfb/C32LAqRFjiQGbvcAFf/G+rzME+t/k1MAmVI3Sz0VbqXGx6HoUaI
         QdZlITi+XsmIbFPm1aaBYgv98loZQiJ9dZP1CleTLMlClS4QHLcH/U5OelByMAP2Ituy
         fwOw==
X-Forwarded-Encrypted: i=1; AKwUvBxPiMyuzT5Smwy83JdSd/YbF4+yKZb2/WkXcauoKEeYdp8QYjwvejeBDDOIoZXKdVB8kjTewn8foZEutmE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0wGw6TGwJxnjnlBO9ra3naPPpqzpI9tsPFBs1+sa64Rk9pFEj
	F/cvWl5LuWRv0J+EedtJsg++FSy7FEkYR9qkMOgFNOzxBr8Y17hGrz3P
X-Gm-Gg: AYBFou2SNyUr7EuWp6IqJniUix+XA504+y/yIYo/Lnzpv8D+duHcFMMF7yooK4vD/vy
	MIkdiL/rhzI9RuhLfrpWTZ+QAxdxtv0u3DmJF412KTwePPDwqBgupc0x5hSgR/1PDjhNMvtRh5L
	lbFE2h0F9FHo8bOLurnGKpL+bz7UIFe00OiaXr3KQkQeqS4z3eXqzAZlm+EyVYOXZ+56jXO/c52
	26WHrdv0DWzJdKp8h6Q7uSYyyTDG6MO66xC3pIW22vJmCdx1ZlNC716f45nSAjFtZe5vIH6ZUY8
	RJT7Vr6VVzMiDU5yhR+TB5rr+CkmI7rObPszAE53MySaSrX/+C8G4FcYcShre/mU+t7ajMgWKIx
	BdgM5oq0kG7fGA9MQcy2VV2RWyiB4+RTdfjKCa1CNy7NgMK09zza78OHXa/4MchHXzWMlNevkf5
	/di/6wsa0bD/90LhXBYQ921T7ManxrnqH0NjcB/7ROizhA96CG+Tv+eG5s7U7JCK2mG8rvOkGlq
	MGvXY3uKp8IApR9RP7otsMrmQiKWtmsOMPKaG8ckMX/HXOEreS2W8nHnmAgTHDFvb6T9pTUHD+O
	LZ8FId84FPbJGUHFQcHdjajOeMO4NrW4QkLNpfBTUdbckWWgGxFUYmOQ
X-Received: by 2002:a17:902:ec85:b0:2e8:965c:aedf with SMTP id d9443c01a7336-2eb364c5da0mr157401935ad.42.1793786844641;
        Wed, 04 Nov 2026 02:07:24 -0800 (PST)
Received: from lima-ubuntu.hz.ali.com ([47.246.98.214])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fe55c8sm5603145ad.14.2026.11.04.02.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:07:24 -0800 (PST)
From: Qing Wang <wangqing7171@gmail.com>
To: xuhx@hust.edu.cn,
	Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: mm/slub: has_pcs_used() reads remote per-CPU sheaf state from flush_all_cpus_locked() without synchronization (data race; KCSAN  blind spot: slub.o is uninstrumented)
Date: Wed,  4 Nov 2026 18:07:17 +0800
Message-Id: <20261104100717.2666250-1-wangqing7171@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261104094132.2665206-1-wangqing7171@gmail.com>
References: <20261104094132.2665206-1-wangqing7171@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 04 Nov 2026 at 17:41, Qing Wang <wangqing7171@gmail.com> wrote:
> You're right, there is a data race in has_pcs_used() reading the pcs
> fields.  The possible consequences:
> 
> 1. has_pcs_used() observes an empty pcs and sets sfw->skip, so the
>    flush is skipped and the memory is not freed in time.

Sorry, I didn't state point 1 correctly.  It should be:

has_pcs_used() reads main->size as 0 before the concurrent free
increments it, so sfw->skip is wrongly set and the memory is not
reclaimed in time.

--
Best regards,
Qing
