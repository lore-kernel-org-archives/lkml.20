Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A523051616F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790793525; cv=none; b=c02AC5n919INjrudRIuvYb+VbuVOwvOx1sMzuQ8p8YOva6STylvB43OciqcPu5Qj92ucyk0J7Td+YPPtjGBrzK4fj2B1juJtriN13/nI/xbvPuZib1SqROmJ4jxO591SjJFhZqHvENlR3y9cFa5Dpp1Onc1gsBjdc9vvf3HZrPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790793525; c=relaxed/simple;
	bh=qIYeVUCO05ZbZhdAAAoZexxaRjrSKWkj1JQrUJwwZr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d+thLkxxXZlhjQWMKKj1D7kjmiIZVJr1uQhMZFeNjhZApeCnpwAjwrpgQ5qTMgCdBgiK5O1EZAsdDn9ADNqLrrg/QA9S+MihdiP6rhWPwzkefIfIWj8lqOzngPzJ3z+20JGQxYsHtG6XCGsrubsHY8dDCwLjnCvgkOpXg4lssGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nyu8+fl+; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nyu8+fl+"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so9716995e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790793522; x=1791398322; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X/kW+42sSDWDUbw6VMWjlova15EUzqflh+DF1qz2pHg=;
        b=Nyu8+fl+9C0oTojAC9MciU8R4YNL7wQ7rEibxddMpIWYU+7X3C+IHEKm791q5fV7sj
         15MTvicEaq6YvPzvZrMICs6c8KIAGtD0dMPuAat3ogEh1iURaeYsrLH9NgsSCQCEq1ry
         Fsx3bI68ZegE9P34gIvRXAkGcdyRpQIaXkJxn+kyNVqfecpD0t/iueq3XpcrNSLd08r8
         F1gHeG25h99CA5yqW9kV8jb7dCI0qe3FnTNptdBJ+IaEf+Wugfx4GwItKE6V9FHRJRJr
         XlG/lxC6xpQDe72NW96eP2BdTF6nsAw0uDj3oj1U1HrSTfx8C8QLylDRyDZln/9EXwtR
         nVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790793522; x=1791398322;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X/kW+42sSDWDUbw6VMWjlova15EUzqflh+DF1qz2pHg=;
        b=pW9EJNXLuJW+/Z9LXgIEP/5hjEBre7T9m7/fk52dRBXx9zqjeXweJ217IuhE4FZofY
         2FRm5lz1ZdbtZCgsC/M4rnCECWitTbD1Je2kaGH+kASBbK257quAwnJR6BTe0TcwqUG3
         SqkJaFxNwmbmH7vbB3FOYo2GwdMjCUsX4KjV/j5BXFIMkiW4pUv0BxlEp1IrSNVgw/qL
         EvDPgXwG8cP8lCXx+sOwtHtEI1UjtkEmOZ9cClI8q3RGeF5tSccu9GdSD8sv7S5qFTyE
         hFBree8TN9P++SfRoXSYfe4yAG4ab3oIyIK6ygzYuU/gmJeFh3c4OSrFeJzAUUxvSWXl
         oF0g==
X-Gm-Message-State: AFuF++nVpZ4McnUFLrsLxBCOdUJLRBZs6MdttyXWAb8zcUzXEkA7C509
	PmPS0eOENZP0eaxyIzfaKQoQKy2mTiqlnfGeGWEIdmi+3m28C8/njolQ
X-Gm-Gg: AYBFou0u4dLgrWkzZsvMIswJ+26OkpHiKWdMWtVQbne98iWkpRTFg/9LjECgsix5wBQ
	SA2GcNf4W3q7x39etLkBPjYp66HUXw4ltfHEomU+FfgqRZZn9Cppyt6teTMsI1YAORl0VdMUVuG
	HMXuXIh/i5MmyHNGdndeKTdHW3Q2hiHcVlJR0HH+qFTfZP6QM5iXpO/2PQh62aOJY0JbkBw0eAg
	iLKJfDoLRCUV+jN4NV312LW5fno4UYr6MI/E1699PLYKFLXIXdPFbilfcGpt6sOBuvFHh3mVPjW
	ue74LKzvW2YqLCFB//us9azPTFNeJlxJBsAxcPB0CtIOyzLEeDNUlGyeGCqRCeG8c3tIc4XIx6u
	0wJAEbTtb9CpzY0SlYJ0Eycs12Y1Hv3eMFoAvmaTItfJAvL9mvyw2E+A9zY1EEqyrSm6DNVZ3zl
	gyNzGM6AHS+c6J6jTvvh2QUKGmEzZcFsWojYzsDVK6hpKmJqltQ1PkAVwu7DPvqsginSoytQ1We
	5yv6b9FZp2um+TfP5EoQH2kxPb68h8eIJlSG1DJdY7/24g5O3GwSY2QvraubL1cTd+66WdEkSWS
	Op4OKIEVr7ALT9/gwSwNN4F8luRxzAy9hLlkHndfkql7ay5MAvMV15tAmlfQNqudeG/GGR3+IQ=
	=
X-Received: by 2002:a7b:ca5a:0:b0:49f:fbad:29ae with SMTP id 5b1f17b1804b1-4a01eb19ffdmr6267285e9.17.1790793521692;
        Wed, 30 Sep 2026 11:38:41 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b2b3-0101-b51c-a607-3dcc-3979.310.pool.telefonica.de. [2a02:3100:b2b3:101:b51c:a607:3dcc:3979])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f979bbcsm1867795e9.5.2026.09.30.11.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:38:41 -0700 (PDT)
Date: Wed, 30 Sep 2026 20:38:39 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	netdev@vger.kernel.org, sashiko-bot@kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Stephen Hemminger <stephen@networkplumber.org>
Subject: Re: [PATCH net 2/2] netpoll: avoid blocking on the transmit lock in
 queue_process
Message-ID: <ar1VeFD4pTgsG0i0@gmail.com>
References: <20260928064239.32456-1-kmehltretter@gmail.com>
 <20260928064239.32456-3-kmehltretter@gmail.com>
 <20260929064307.569CE1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929064307.569CE1F000FF@smtp.kernel.org>

On Tue, Sep 29, 2026 at 06:43:06AM +0100, sashiko-bot@kernel.org wrote:
> > +			schedule_delayed_work(&npinfo->tx_work, HZ / 10);
> > +			return;
> 
> [Severity: High]
> Does this schedule an excessively long delay when encountering a transient
> spinlock contention?

Yes, HZ / 10 is too long for transient TX-lock contention. I've changed
it in v2 to retry after one jiffy. The existing HZ / 10 backoff remains
for a stopped transmit queue or NETDEV_TX_BUSY.

Karl
