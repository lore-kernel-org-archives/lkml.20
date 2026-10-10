Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DECF3F8246
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 10:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791629934; cv=none; b=R+jaSosqcUkXP2EnnUpeyzfT4ZEAnMWyuZLZdLhOv0awjEhezsV31olhhXGd9q3OHgm0mLQRAa5nQhsKbfQ+m9OxB3hjpn81Ya1qaleEwC1nefU7YzFRr4Ycda2++5sduWupHiz4bC9xAQs7SGFJrMF+9SmD880gXr7VD3yJw80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791629934; c=relaxed/simple;
	bh=ey2uGSuG3jrWAcctmiGZyGdUCH4Y/JKOYhjHktRVi18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hWwuR6KLCwdOluV8APHuVNu/MtzUJThPJBi923VnMt7mmWhMmTebLItlYQ6Ghu7EfZ0Xo61gpf5MBuhbkaCKbUjgU/ix3E/CZEoIyOOP0F6SP41s9Azu53nkjpmbUuqwIDnpGdHV8wqNVGAj2+XrbZZq+C9RWDu4/kNp8Upr9kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UORYt5yy; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UORYt5yy"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so4487755e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791629931; x=1792234731; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0p+tcFuaad+Ed9GUNOLJGi5vSHUZkfcnyvs2CnZiAAQ=;
        b=UORYt5yyzjPrrVJAI4uPXT4rQkd4pDNL9AAT/KrcCHNj8dqNT+UEB5n1/SYfGvVB0K
         5IipRB0KG8I8nRjikGp9hIiotR/03LuQ8+3KPua6nWMchymndNHWaP5OskIo0o/d9Kk+
         Xlxtk0+7MKlksuiNql6F+UHol10TMducex7Kwb6VJYdme1LVwVmQnp9DBdl1itIwUktI
         Trsalck+4VVT6s8DsG8sfhjamG5uhZeLNkwBBb2gulBF47huEvCOJwUZCjn+N+7ib8V0
         JXxRfAt3kKnWu9jEB14FG0Av/Q/l0iGkvtwV1uhiq9kyCbZFKpKdTh+t4IKInlVVuzlL
         Wp3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629931; x=1792234731;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0p+tcFuaad+Ed9GUNOLJGi5vSHUZkfcnyvs2CnZiAAQ=;
        b=buFFFLrGFSzeZpVay8+E75AA+F6b1+Lbibsm1+h1o+putJD5ovemPG7KvduMMGMsq/
         9i6Mzx2bBWF8QQzhSCW3VcIwMgDXKtDx1FAVsZ0Tc6TO8HEJWEPHWFIPU6MVCxK7u+Pj
         qMuwFah+BOjMFmPpJbrFAUxvywhYfPKdDvLGEdwgVxIuxJ/b2ZszwTfrhi8i7oZ1iaKN
         8uPq0nnPAV8rFDzFqPF7t2wh3X6Dr6Fukzic6UcE04QEcEgcBKDO7+he0EGEEvWGxvBL
         NS7UDpxev7Bqn6uhvjG1s2RyVBKtDc3RLScHub6+M7bgZEFs4HAc0nMsBeQjZTbm/eCD
         eDwA==
X-Forwarded-Encrypted: i=1; AKwUvBwtJ4TJ1OZkiwCMma9XAwvBF4sAT2EBUPJrdM3hTYDB98jbq+pcxxKJboj7pnJ5NbgNHKINk5Q7mqqOYWI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLo5RbsA3xSYDnqNc5HpEFdbqaoAI2mOlo/oM5ERNRJ5WtSL5au
	5Pshh5ZVhLlw2DszAZ5PLH+2Wmo5y0t7CHVU/oAIlTlVlyX6qdXSJb0w
X-Gm-Gg: AYBFou0HWC2FItR+EVwKSgEe9sll7QKVVr3UbijQuxRbkJQ07nhZTlwaVN7cg12w5bq
	6Vf6di8Mvg/vvslbMpzZnprnwtTX54l8Ca4Cjd58DKY7plJsLS9B83Etz4JQYrozNaPMPT62+pd
	lz1U8qkXaMF6bccIagneCwBEgf4rO0iYR3KcEHaifnVBG3T6WEbabLlB/iKcZNkQE/5f5VuV/Q2
	IKq3FPALPeWjJNsgV1xdynhSYYw1uoXTGhdB5QjmEyOITPXLYlG0jW/9hRh1LZp3cdT8R6qbPDn
	YnrGoRXk4kK3MbUHAbnVHvziaMPeDWQQa22jXL+1cXHkCACnX6D+7jDfWZuAMNMgR4DGXRSzKvK
	P+BZpXaY1IUPvsQPgDM6TfC/GYO4xQFqpVQSKrIz407BJHuLOurqCDyCEakg698NvI+etXEpBoT
	bIWB9+LExKGzM58xmDLcUCKFP/1XeEp8k/YirNAsKVfl/eGxhMK3mYxHdgzDMRD1njHilndjryq
	k2Tjjl4b7oQmUh9t3vtArCkvjI+c4sLaRcWFUeuJTH2jvBVvfsrdzig2SCFJo8/jKyJUoMb+Dhs
	pZdMhvdwQMf1wOYIxWw6SE9FMVz5f+dgm00b7+zXRCtX7hZCfCgiRV2OYEIWBgT5YpgweopIAA0
	BBDhY
X-Received: by 2002:a05:600c:3e8f:b0:4a0:263c:704f with SMTP id 5b1f17b1804b1-4a18e4a3fbdmr88482075e9.16.1791629930405;
        Sat, 10 Oct 2026 03:58:50 -0700 (PDT)
Received: from imx93-evk.localdomain (dynamic-2a02-3100-9d3f-0d01-48c7-5d76-0ec6-9dac.310.pool.telefonica.de. [2a02:3100:9d3f:d01:48c7:5d76:ec6:9dac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e4a3b4asm216792105e9.5.2026.10.10.03.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:58:49 -0700 (PDT)
Date: Sat, 10 Oct 2026 12:58:47 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Lukasz Luba <lukasz.luba@arm.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: Changwoo Min <changwoo@igalia.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] PM: EM: allocate the cpumask for every perf domain
Message-ID: <asoaPjyhSAQ5r-lO@gmail.com>
References: <20260910205234.5392-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910205234.5392-1-kmehltretter@gmail.com>

On Thu, Sep 10, 2026 at 10:52:34PM +0100, Karl Mehltretter wrote:
> KASAN reports slab-out-of-bounds reads for both dump and by-ID requests
> against a synthetic non-CPU performance domain.
> 
> GET_PERF_DOMAINS does not require GENL_ADMIN_PERM, so an unprivileged
> request can reach this path when a GPU or another devfreq device has
> registered an energy model.
> 
> Allocate the cpumask for non-CPU domains too.  The zeroed mask remains
> empty, as required for the documented unused field.
> 
> Fixes: d8eef0453132 ("PM: EM: Implement em_nl_get_pds_doit()")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Friendly ping on this patch

Thanks,
Karl
