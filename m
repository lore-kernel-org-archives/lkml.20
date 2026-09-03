Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2A24B26F1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 14:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788444120; cv=none; b=ldPIGhqbxW5yktVAgqP7LoDL21iZGkv15JUi93volnf+dCznNdH0COWXaX+NaexocABofUPj4cD1kXZnr+o/wWzwX50VnSBJYpLWEVXMLKscyvpmQmcLXUn5X6AzV1cd/sdUdIH80Dl2pQGDdsNcSSqS+ewbAwM0yLSB6MghZZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788444120; c=relaxed/simple;
	bh=n4XEocIqJ19nHNwUpvF/j3erls8ICoBu9d7tL4Y/X5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C0ZDQt5IEU5v8vHDcXjZk4jxLp4ShaUV1Y7PV7oOF7aM9bWrn7dtSp6HFFC9Ls1gXpdBkLLzpPqDeSR8Wkugaq74/N9D9cDeYogp0r7n03ISgFErFgMwEGpkPxW5vJ4dsSRyR03flJKXbLMD514eg9G6YOB2x5QMMtmH0Op7Fro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LTmSQpl/; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LTmSQpl/"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b96837ca3so17322895e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788444111; x=1789048911; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qQqL94pz1aKeRhaHhlDg5rCITzELovSKECj2UmHlmfM=;
        b=LTmSQpl/Jj4PPOYZjWLSH1W/4CXEjBzpgBdS0gsKLWYai96t+GBHQXvhh8zpFANTwS
         C3vV28nl68/MfgE3FFQqLWC8dAufiu+d0iMLYbUSihY1uN1hyP3D46zibXr9ykGpkk2f
         RlRgtLsIEKpI6HCmIHLqmyIXX0Lz5coou0mub2qQ1XRhdh9hwca6946qVDgYp3pyxSHf
         qnW18es/+NOJaLlsnaj/7i0XCREvSqDbJnZ4K/9KmziBC9MjWQJJdah0QZ6axv63h0zS
         IFCbFPpMzAXmnKBGSF0WTgNUFl+s+xTMvmrYDWiLMcEOKfz45QOx6LpN4t5KS9wo2c6/
         oe2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788444111; x=1789048911;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qQqL94pz1aKeRhaHhlDg5rCITzELovSKECj2UmHlmfM=;
        b=fuYYdPIRWB1NRfiIcUQWQBM6cbeeo56Fo9dL8UYW2j6QfWukvpCYlKJNSriR1lP+f+
         mczf7Gku8wiQmzkBvzMQe43rgt6aL5ipukHMsRJrafeECCDAEVhR5gPUUB4fWXskjVoo
         fkJZGgzxAy9dlTY3/OPRlRm5Qy5Cwz0bUbXQDDHvbB+4GGxBwYCymCkccdH4rxZ1BzgD
         ZFcrUDoTUSdkNInpG2J9xmCeAiIxOdIoy8keeDBTjQ7kgZq0ALsSqOxi1kLHCnaTz+mU
         nPECnYMSyME8Xs7p09EgvnBq6GuSVeB4ROogtgjvMad2MdmOd91ANZ4HIDeFW71fUUn2
         C25A==
X-Forwarded-Encrypted: i=1; AKwUvBwplx04MDODrsnEbwxnCJZdv6i5mpBkwZ1YUnFAlqeQvQPGeNTKvEJV592w+U80jEiFuKqNV15jeDt6rqw=@vger.kernel.org
X-Gm-Message-State: AFuF++liy8PyAfmeJbGF5SuK7+3Nm3KFATSVJH3/vuGTu8UXda42QXo0
	wkuv9zDfmN+71fpWcoMYwws4lIamkQqnrGfi5DNqZjdFhM+j8ghB77fHuQdj50tbBJg=
X-Gm-Gg: AYBFou1hzpy5LZbOMTTvyxEmM7gehZTOcyqrnRO6XgOZZ8noVDRVJk4o88FmvEZPsmr
	ROKja5lWPWEOdQeliSezzOi5d7Zr6kapsCtmFbnuEJDsHIi8aXyrXpz1mxFHEH6K7+LT21uxb8p
	K8NBMNna5EJUEy86GRBxPoAX0I6IDUJ6GoXvH0Odwi+sifCw5Gm8Oe/67c/nEPGKk3MOa7ylVHH
	ObJGSr3fFLSOFxPNJgSGuD/EoAlRPNuBbEZXhq6wOHOcEyMgDBMMLOUz81FjtZ3MyL/CmFWHhtk
	/vSKjyIGdycWhQgjI7+qfzGVPkyYPf+0vjRZLb9wybSNcuM51sGUwQxDeyQgzpm0Rg9e/8QTj6A
	55g7cC1I0FX2BdqxP0G8zSlt/bGTFbdXrJkOzSUrToyAKQ5MSm0aVKkaubqkTFDsbSF0i7h3OBF
	qGgxTjSXTzHOI2vHViBFICZQySjFd3XD/KULHNQzSGLszAwNTzsW3mqUX2xXLt2jjXejTCVoi0i
	VlF
X-Received: by 2002:a05:600c:e557:10b0:49c:e42b:a4ac with SMTP id 5b1f17b1804b1-49ce5822582mr173308705e9.11.1788444109457;
        Thu, 03 Sep 2026 07:01:49 -0700 (PDT)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5f912esm74352975e9.4.2026.09.03.07.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 07:01:48 -0700 (PDT)
Date: Thu, 3 Sep 2026 16:01:46 +0200
From: Petr Mladek <pmladek@suse.com>
To: Feng Tang <feng.tang@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] panic: remove the unneeded panic_print_get()
Message-ID: <apl9yt83vksVL7A6@pathway.suse.cz>
References: <20260902114851.77062-1-feng.tang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902114851.77062-1-feng.tang@linux.alibaba.com>

On Wed 2026-09-02 19:48:51, Feng Tang wrote:
> panic_print_get() was introduced in commit 2683df6539cb ("panic: add
> note that 'panic_print' parameter is deprecated") to print out warning
> message of the deprecation of 'panic_print' on read access.
> 
> Since commit 90f3c123247e ("panic: only warn about deprecated panic_print
> on write access"), panic_print_get() wrapper is not needed anymore for
> read access, so remove it and use param_get_ulong() instead.
> 
> Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>

Nice cleanup.

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
