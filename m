Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5723A4F59
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 18:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050553; cv=none; b=U5faxkwr7BeanmvHywogifSkdnK6ArTXypF/HYy8yZT6wV/BzB2GtZT3GMA4KC5ftJWvoxWYQkRgM0auj/5Aq8Sf6r4QIsN0MuquX8o4fmBhy6zcuC1XQ22sNP6ISNluerfCApz/cvrjjbYi6n5IVcUukmyyLl8T7XaNvI19aBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050553; c=relaxed/simple;
	bh=1fA35AzLMLI8IsjeYb5yaRW8LrQiraBlfHGAy9JiyXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lpV+6NfhpgBiPASYDXtf706ICuA2dVNYGkkDvJhFTEn6JlkcKV1gJNGeU+2Pb8S+pufKDz3gFmTK6RfYLHeabBsCYK18i1MW+rLJ158EwBu5wfbWosGT40ZUMux17wAeHahTVnmsaSwoQrWF/LWWJOjb3Ncu/mU6yEJ9NYc8nQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=truenas.com; spf=pass smtp.mailfrom=truenas.com; dkim=pass (2048-bit key) header.d=truenas.com header.i=@truenas.com header.b=AmJNRO1t; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=truenas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=truenas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=truenas.com header.i=@truenas.com header.b="AmJNRO1t"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so4391605e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 11:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=truenas.com; s=google; t=1791050550; x=1791655350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1fA35AzLMLI8IsjeYb5yaRW8LrQiraBlfHGAy9JiyXU=;
        b=AmJNRO1t6oWi0aOw+mT2mVndfXFuJ5Z3Czm2jr9X34mIMdbbTcJl/yp2donqbXgOSm
         G96nGc/CthyG2os9pHyHhLnnf116S8eB+e4brYmVuYDOnydOgqUOrLlwFDkJxDkd+hAp
         2Ov77RcTStcZLUrsXEawI4yClLqZdHzF5xPFVeQD18OdFqzcqpxLzsxo6JTHYElnjJEc
         1ZU11YzqcNtEKUslhyPm7dm+mYbzA4ttiCa9M4wMYvhmhBpuf5sQvGp4Y4dW8I/0sbcc
         lmX2ac8IpmIppGN2TQPhjq9m56ONpQ+9YQF3louEVH+qwUcLdSLbxrFNxWBO9mfDigrK
         0AFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791050550; x=1791655350;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1fA35AzLMLI8IsjeYb5yaRW8LrQiraBlfHGAy9JiyXU=;
        b=AbpDeQWLk7tE7en0Em6Jz8CjlHwMptnvs1VE94x2/GdYmIMnxQN8aLdmcF5Ov56VAp
         PVVorWSChXb1CFUnpt2IUgIZd6kUQEOFZOd8EG9+r4NJp5vA49+l11VdajMTGYFdgMwb
         O03OIm2kLdFHe2+d0UdrDXyZp/0WIUV+QKRnFEx3hnCnmN5tu+8XCL7ADFHC3pnM5XWa
         iolj7Kimj7DWxaBQTMGXZQtzOqVscWb38XY9cTvxYpvX5Vr0/F3ow39oVKcnv6MKllwJ
         ytJYI7s46azNTA94euiHjHRU6VWlKWdYVYbHUHIpinkLDtH8gMlyY/XxuQ5Gr/UVSot/
         BBwA==
X-Forwarded-Encrypted: i=1; AKwUvBw5qXuENkBmccsFvI2Z1rJJVKGTxgJBJQp56GCrSzC+Te3rOyOvn+LgC/tQTTXex5whlRaFj1icol+LwYc=@vger.kernel.org
X-Gm-Message-State: AFuF++kG5GBXp/WvSK0flM2SB00Gb05dBw/SWoW+f+eaU2WuDgbVhN58
	2ICUzeRsFjYM49wD/shOc4RqaestMSdRlqYdHGAFtSEPx9v92zvRoOdTGFWp0fjmJA==
X-Gm-Gg: AYBFou1r5HmSDO9kcW2aUIJzrIWWbRWLYLZpKu1312u41XxkmNtqeUAhhbx8/fjSkuu
	ybpv3QI7OLpN3JCkR8T0AeD50aUSKAS5Lebg+CoGQh1Jzj7W7resNNhXVR8hfT4510m9nDo5HkR
	C+Fpwi4+E9g7GXpWtsPepw8hU4U9xFRBJnltp6q6ivXnxJdBidzbmZHgoJzUfeEaB+oh9yHqbpT
	GEQP4k0C+Liw3sjXWiBCWujFyqDDesBHyqZkcVm2xKKRFTHY8ogyQ1Qx33hmUuicO+eybUAquQX
	b9dqFXXZD/dFHqbBEWNxP4TWhwQ1gHVp6H0aK1xmxtpoISF6ZMcpAEar4Lkow09A4KIDYNGU10D
	OwW3ROOS6hefO6B/XYWarruqzY5D4Q3E66F40/d+AcyDoaWOXcXJi1tEJmSB/7/44Kt8iwTTW0T
	aZn0Rqsin23qFCHDfXyp/xPkjINVceMLtx89Uq35jLLlKkxbLU2A==
X-Received: by 2002:a05:600c:4e55:b0:49e:823a:9dec with SMTP id 5b1f17b1804b1-4a0274e9c4amr107646605e9.3.1791050550421;
        Sat, 03 Oct 2026 11:02:30 -0700 (PDT)
Received: from hamza-PC ([2400:adc1:158:c700::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f89c3sm12646948f8f.34.2026.10.03.11.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 11:02:29 -0700 (PDT)
Date: Sat, 3 Oct 2026 23:02:24 +0500
From: Ameer Hamza <ameer.hamza@truenas.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: rppt@kernel.org, peterz@infradead.org, akpm@linux-foundation.org, 
	david@kernel.org, mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, 
	linux-mm@kvack.org, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org, 4ncienth@gmail.com, sashal@kernel.org, 
	alexander.motin@truenas.com, caleb.stjohn@truenas.com
Subject: Re: [REGRESSION] secretmem: SIGBUS on memfd_secret() pages while
 perf record runs
Message-ID: <asFC2Oryo2-9ww5r@hamza-PC>
References: <20261002175651.811343-1-ameer.hamza@truenas.com>
 <asEllR7if-J3wteg@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asEllR7if-J3wteg@gremlin>

On Sat, Oct 03, 2026 at 04:56:32PM +0100, Lorenzo Stoakes (ARM) wrote:
> So this is a bug in perf, which should use its own counter for this,
> AFAICT.

Agreed, and the report's closing question pointed the same way, since
the commit itself closes a real hole. Glad the longstanding perf bug is
getting fixed as a result. Thanks for the analysis and for turning the
fix around so quickly.

Thanks,
Ameer Hamza
