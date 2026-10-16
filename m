Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDBD3BB9E1
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792125910; cv=none; b=KqKv/bZEKhsg+sCUF0eZTrtd8jPwZ8Re54Mfb2jIEsJldH0H93Ag3JdVQ7RoInEzalIwHbdqmOc0jXrz9tNb4U4X1e9E+z2hND0WPbfxwVsNAFsgsAcw68L1ixGSx5jcsuwpL15feY9Y/5MDWFqTcwGYIQ4DN8OEGI3WEUvaKJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792125910; c=relaxed/simple;
	bh=82osGwBog73FoyC+XMnxKjbDDJ/fVfR1ZbT8MNVz7X0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I+MJhjj10uq+y9pY+VzEqIaAJadx9TkHFuRtA4kM/Mzco6zHZn6+WGr7qVzYhbvfM8f95AsQWzmuRIKYbczFdnYerE1Y4/PZ9g4reAdvQu+IIU1kW1zvXK5YdMtnDPayD1sYMflR8iN90NrLpogmUlVuZqAWOri62zwVMRuqLjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F0TnffXD; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F0TnffXD"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso43072115e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792125907; x=1792730707; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fy2ljKKgDvlM50wAu3F276eIsSv4r7+LxgXEEBPg3w0=;
        b=F0TnffXDMyycjORpIvJe7sAQzSWHHssn/c9JJIkHuzNmfXNUuSY4J/jxj1N7mcZPSy
         bhbfbd2eMCApXcBlZQlp7v8NAsbg3j4aPDeSm15o1jvwTu84Xv1rNwiTalO0iTrSm5cS
         JZ0EzOt78RpyyBVUcoITEcqduh8LWGw6hsQF743aGS+HzR6/a82L5/HbLdHqP0RFy8Ut
         M6lBC24jQwiu1Ahhgwe7Q55O/FpkVXD3XD40P8Ay2OUI6zfJa2cj2RbAQE8+/K5t3HWv
         t/hKVbDJXs55JaQAY47W0rrvCg/Cgvl1ooY7RF4ak/W5q31Tk9DsW17JMSNx9hlOUEPN
         Sr5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792125907; x=1792730707;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fy2ljKKgDvlM50wAu3F276eIsSv4r7+LxgXEEBPg3w0=;
        b=uo/bNdMMDkrQ6q6rHMaWeJIvLfx4Y2pRjuFoWLyQTqso8pJEEHD5krQc6ivhTuVkz+
         ODD7uv0wUff21ACF2uv4ZB2TG5XbDwQGqxHEf22l5ESe+BL3i4EWG+Fnw0IBJzLFDAJo
         5gcAIqvyrWNMuNIUs/ihzA8wGqWnoLVesWkadHFIX54Ej/zPP+1oRDBEOE0AqnRvD3ga
         uKCsydMyCPuqiKZhha/KUW4StmWOCxX+zzsnOVxsS9n/+fFgBDw5BuxA371/MZncnL6s
         MdCvsjqh3nxzkWBXUVjz4t/OB13L4IZMmL58pVq0qHSRJPyyDVPasiACOXcFdlm4DQIf
         py0g==
X-Forwarded-Encrypted: i=1; AKwUvBzGgetc+rapfMcm3lngIYToHKBZYvzTIOMHXor99B383E40gi1/KG83d/K3QGGneLRxyJpGJOcUranXTBw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIEjRqHamebSbTszSJF5LHIXVA4UTvAcY+hmiJVoTieRqA14dR
	qVI/9N+9Lsf6lf7Yp5h11q+xgE8fK19cl4UVwDikD32S+NlzR7325AMr
X-Gm-Gg: AYBFou1eUUOp08jzCtagXm2FUT3sCp7Rt5eYbM9syLNHCK4KUebCUyBQ/fOLyKL5hAZ
	tFawjkMPfQLhjBFWDSE0uNsWZdu8pnhUGPXkAXptQtJwzk670zuGEflMxwv9xm7CwaS7DuF0t+c
	HWtg8AA5YcC8ta5NLPKjr3IRc8B/eG6zEdWABfZq/SkNoH6Xgq7jIci/7vvnxaT5NVmfKiUsBqQ
	dLQievXyoW0kANK2qwSLJQLh1npmlFYf3qEBmiwlQaI+tteOMUzecI96+Uf+g1JZ9rmGqJhpjYE
	JSELMu+WYEmeJMxBa04BdnNK6lC2UH+bykwl/L27BfmoLcu2m7Nj5gsf9iCN0vMjucpUwcY0MGr
	hC9KV4dpC2hHMyI58OQMg+/wUN2vkLX9yes3yT9iMvSwhOO5SVCXAE1QRAZLiLblZhcE+qDh5BY
	mu0wDYlO8JzeHcvO8Zy+PjJ5q5AxejnHXLRVI4L89JG14c4lGdoFvOvMAsQ2G5nMw+1yvzPes3D
	pniYO+xp3Z0vT8jwLBP1sHD8T6HBjWKIVc3xxAOLk4Tn7THEcHh7c83K2sYJzb9L+02fDc4Bpuu
	9HG97+9NjxQq/WCqe2/ZkyAUm+WQTOzOMs1p9UhhbPpvnSuRKDyFqHqqh4yklz2BleTZU0YwuAU
	=
X-Received: by 2002:a05:600c:138a:b0:4a1:7bd4:d07d with SMTP id 5b1f17b1804b1-4a18e4c85fdmr444490105e9.34.1792125906884;
        Thu, 15 Oct 2026 21:45:06 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a951-9501-1471-d90c-a21f-9dd7.310.pool.telefonica.de. [2a02:3100:a951:9501:1471:d90c:a21f:9dd7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd91c55bsm107355835e9.0.2026.10.15.21.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:45:06 -0700 (PDT)
Date: Fri, 16 Oct 2026 06:45:02 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH next] kunit: Initialize filter error before disabled
 cleanup
Message-ID: <atGqVhQyKowLGOz5@gmail.com>
References: <20260901-kunit-void-v1-1-c91952391d66@linutronix.de>
 <20260914025933.9832-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914025933.9832-1-kmehltretter@gmail.com>

On Mon, Sep 14, 2026 at 04:59:33AM +0100, Karl Mehltretter wrote:
> kunit_run_all_tests() jumps to free_out when KUnit execution is disabled.
> If a boot filter is configured, free_out tests err even though
> kunit_filter_suites() was never called to initialize it.
> 
> Clang's -Wconditional-uninitialized diagnoses this path. KMSAN confirms
> the runtime use.
> 
> With CONFIG_KUNIT_DEFAULT_ENABLED=n,
> CONFIG_KUNIT_DEFAULT_FILTER_GLOB="*", CONFIG_INIT_STACK_NONE=y and
> CONFIG_KMSAN=y, KMSAN reports an uninitialized-value use in
> kunit_run_all_tests() and identifies local variable err as its origin.
> 
> Restore the zero initializer. It remains necessary as cleanup state after
> kunit_run_all_tests() was changed to return void.
> 
> Fixes: e38f53f04824 ("kunit: Return void from kunit_run_all_tests()")
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Friendly ping on this fix. It has Thomas's Reviewed-by tag.

I don't see this fix in the KUnit tree or folded into the original
change.

Thanks,
Karl
