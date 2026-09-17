Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDB32EC0A2
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789605927; cv=none; b=fTGWVoxxJ63dcsJeFzE35NlQmt6xVaPwF9bKnOC3k4k4IzzBzczklk/AF7S2CVy8VD1ugRvGiN/DDBFAPKDSiDVxXFphBShCLQ0iyHQKjTfoUy0Vcf8Wov/mrXf8ov3N551V6M8rgLMUxE7uBZVPw1yPULCN/vbA7iab+pPvH8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789605927; c=relaxed/simple;
	bh=pSIUYIx+0OkhedIaRJFFytc27jwrdIPiXSe8d8kKDuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WSLovZ98H5Uh1pHbMsU6MgjFUDPKt5Uim2z71EpIdhJrc970pEy3DkGwyxbX6y5vk+mQot1x8sOnIyRxtDvYlEOPGD/38Ju7Hhk5RoOaEPJ0syXRBm3LMrwErdpjYuIUBDM2h5AJK5plF8nvvYW4vr7uACynEBsc9rS1TCzxHlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ku1amnl1; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ku1amnl1"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469a33c9cso312340b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789605925; x=1790210725; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vK4WS6l3ITRV/oYCqfxSRTjx+VRSZj9i6Ex84U5fmjM=;
        b=ku1amnl1rOi/dNSYnVA2p0mOi5pzTP431ph81+tN5amFHqXTbk8mwhBTq+LNgqYuqJ
         mTm12WgP+ZSQ1NJSanS892fNSAzKxxX5qg6g32LJXpbUr6G6/FaGQSW1V/js+81J5ArG
         9Wl5iERzDpuqkqpStr4tPKIYYaeWaMcpG5hKwZF4Ta8YmkRz5NJ+rYV8NRJiHfoQpft3
         1uFgP18qMuenlIGSrxzB7vFj68kXvXXWtS998CsB/ceoih1kR+IyAeuS+dSKtYbfWXnO
         pJvJClVR9xWd21s+lgkLAt94hAdoDOYfCWgm/A09AF/LhF5RXA3RgYsWobfw4VGFtK0m
         ZRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789605925; x=1790210725;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vK4WS6l3ITRV/oYCqfxSRTjx+VRSZj9i6Ex84U5fmjM=;
        b=UN30Gl8iYv3jxjzIP3FNOOXO7RWSdl1khd9/GcCuWhmDXp6MiT4ZaJLfaGO1LEisoV
         MI40kvXfo+w8BUsW3FET3xFB9svdW+IDf9tOuOyD4yXbANywwDMSYkmy2pE5oPoQO/3O
         3qHGuF/8HnlD4Ap1W1Vyenlhkc6M1aM9WJgCBLjaa2r6vYUr+Z+iMA+2/rkVSHsRGDF6
         d4BUCQLNgTUPsUyvE/9PvoZFp8Kz2/I1lrpSbmshsdJBJ/L8BlA1hi6s+FO7TBjCCb3F
         dGy1E64nBae2niFxjYiQuiFlH3tvEpuQcqAWdqXBElOg92SMCY+blL2a0uZeU2G1vGWK
         BuRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzh26O/YpFFGCKwO4+rS2bTbpVSHwrZLaPYq8tw+Xfnm75LSswleCaE+vXEeMRZlQlZ9JjkpSxH5b6yyrw=@vger.kernel.org
X-Gm-Message-State: AFuF++lWiM8JCmsbycjwlN44h9zZ/shVcw5A5gYSeLlLkKhsR1Z9/qlP
	p8q92feteo+MjhSKyH577zSkQ9TeqV/TUaVaTGJX3erppNhQf96BUzhXoHpFVx3P
X-Gm-Gg: AYBFou09myXivwhP/gQwvn7iRMJ0iNXcCGK6TgZDaEgCR7KfEztOuIaR8gPAuW3k4JO
	Ocvrn9w6X5C1Fh/jUoWZlQGb3sNMN+EiJYIRF+lowce2Ut2XXzGn8V7/rk2UzwKg0Zb0dZQRFB2
	7hV9O2C0ovUVyqRT/1i1A/uHs2ORR1GM5Cnk8ATmlfYWoKworniixqbeQee2MkCM3L1rY9PG1Qn
	663YGPd6o5i7LvTHV3qoend88cG3UMmN34B5bL/m/7WAdTGhgOl7pWN6F6V2qiQ39GR146TJz0K
	/lsI1mb/nfn/eKSc7UKky5YBE9jagk8gCiUmAyhhJFJtHObEvVXkTu2gUjryFiXFOxT+XmQx+CW
	mTAjPm60mbRBui5nSOduuJhE4imEHlmN4Ra/rX9YmCDCk9MuHjPZCwic9pzEn83QoO/IFu48v2e
	65X2sUFOiT0hChwCuC7tYJe3bKNtuAoi7xLdXQ3SazUUVtf/I78W1+gbKEtc+MM4nt2YJZFjwaq
	7sziEIqGy6m
X-Received: by 2002:a05:6a00:4613:b0:851:c2a6:172f with SMTP id d2e1a72fcca58-8723b87eadfmr9178684b3a.7.1789605925335;
        Wed, 16 Sep 2026 17:45:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87201d1da2fsm1952194b3a.52.2026.09.16.17.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 17:45:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Sep 2026 17:45:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: emil.renner.berthing@canonical.com, linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
	xingyu.wu@starfivetech.com, ziv.xu@starfivetech.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] watchdog: starfive-wdt: Fix runtime PM leak in
 starfive_wdt_pm_start()
Message-ID: <dfebf1ef-0496-4b4e-acbe-847064bf09e0@roeck-us.net>
References: <20260916170704.2086331-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916170704.2086331-1-vulab@iscas.ac.cn>

On Wed, Sep 16, 2026 at 05:07:04PM +0000, Wentao Liang wrote:
> starfive_wdt_pm_start() takes a runtime PM reference with
> pm_runtime_get_sync(), which increments the usage counter even when it
> fails, and returns the error without dropping it again.  The watchdog
> core does not invoke the stop callback when start fails, so the
> reference taken on the error path is leaked.
> 
> Use pm_runtime_resume_and_get() instead, which keeps the usage counter
> balanced when the resume fails.
> 
> Fixes: db728ea9c7be ("drivers: watchdog: Add StarFive Watchdog driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Applied.

Thanks,
Guenter
