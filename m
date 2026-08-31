Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D931335C696
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788154154; cv=none; b=GJJyqEkaplfu2R8/LUkwi4errEWAoYv9QSVOw2G3bhQ9NwXPCg8jTKyfzbmkKtJdDOHIQqkwAo2Z768ptk0ANWY34MCd+k9soOuJLk9Tuzv1yxG8zaX2n53P/xUV0CH2scCt/3WIzbGZpM/llMOirXplE85x0b/t3xYdjPZGMo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788154154; c=relaxed/simple;
	bh=f5j4hIxopVe9dqBkAdMBlPfS2+vnW55+OaBP5zbinTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o/mCSrhRnYW2asjrll/gr5e5nDYZwFdyLA6lS7z8xZ+HqGmOe0yNEHYT5e0oy1xo7OmAbji5sxyQUrL2y5o5ynplJeus/8NDDqvINwRW8otaJ2m88kX2NeRaSs4LZ8zMiQdDHGteLS6TjV8ojhOUDsz4aLWd55INd6XiWa80V7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RqKFnQMD; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RqKFnQMD"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d5335cf904so28933745ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 22:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788154152; x=1788758952; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QEL2VbN1y+PU3YvPygq8npMdJ9wl/ZS6P++bwrOJdII=;
        b=RqKFnQMDBUrLFAC7LXTLhcu3boVbGASnB56TGQ8Pi653msxocylrVrJ11MQM/H2jIE
         VA0Kt6EfCltuKGvT2J6grNW3eJW9qKTiXmw/Bc3N60hjZeHNYxzZHnq35Oj0zK7ZToQt
         LGMFYLBsuRurwbiK0FgwFLU+orCTZ6hr/MHOnKz3Ifgl48EMMwwR/x19YgO7VkaltHG/
         Orwvvb7ywp1Iv1Zj4TqV4Zlp0w+yo/eTF2Yme9/Nylf85O272pEKp1RENbU/d7GtsRAn
         eiW2lZvu4s8jcHoRm9GtW2bY3JgIpXAkwLOY3IbmDlGmBtsga1YaG/WtVTFgP40Z+fSj
         rRJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788154152; x=1788758952;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QEL2VbN1y+PU3YvPygq8npMdJ9wl/ZS6P++bwrOJdII=;
        b=OKb4tPjrFJsU/dxjPUVVFE3OVypHRj88MP74NBvXPtuoWOWtCXbYztD2cAnWTV0790
         qseirujNkJ5NUAtdBZ+q76wcHyAFVYu8mN3cK/avlz4FKGAbnLha+UujiyIVz2z+2UNU
         3Tysj+hw03lxsMWR9iY6MwJzvShzcYylvxe7C1eagAFuC2rPZ1Z5tHVJBCKBfuOcbrU2
         tkTcfl4f6ivvzspKRIe1NAXn4r4ko22IH4eFbDZcQwfq53p43u1xqovchPQTozDOAREy
         cPYfIuBH62IHgEuQsQwUgV50pgErtlrzaWueZTWfAz8T4FBr7+YfVU3t2xIE+hVLxD7V
         u6oA==
X-Forwarded-Encrypted: i=1; AHgh+Rr41doBN6YsW5K8Rl37YXFJ9rRMiabEF2soJRKoJGN6e6RcZeJoC4GstKx96TBj/1ljPz2uPnNu/vviQBU=@vger.kernel.org
X-Gm-Message-State: AFuF++l9+9kgNeaJd9wNJvtm+CldCrqv3xc4BCvFq/uJzVv2Xc6zVy0G
	WtXDocImUEuaGAthz57Def8xHw0GWKBKR2R7vIo9UrDCHufxsK9y3kZHWCzqoGPZmA0=
X-Gm-Gg: AR+sD13jhuyTqNoAqN+uuRMyW8Pj47kuiGPBvas4YE+0edigiziS5yM8vy94ZOMTq6B
	Uu6G0KeUSi2YI0JmNm/eA85sBKPZBAFQCuOQ1nTP8mzWoc7zzqj0Jx+BoerKt2PHRaAy6uLcTDg
	DlS56oCwyc5gAusU2ubTe4GRFFMIv0D+wCYu2qJe7I9s3croFqE+mul0wJnufsbhBqRYGwFPIO8
	J295cqUUJWqsX8EO5LD/W1GipNuGgpBk5v1aR4UYcpeFbWK5DUcTdQZv6Su2xpbxF1tQNzxL9to
	eA2GD0UJoFzrOiFzh+jC4fLsUS2bNe9jeDso4SdFJSX6rdT4Q0kswUJhbB55Y1+AtQGultbZc+M
	0PqrBls/wRP8u0oijwBbmFoTdEimdcqUiIwrbuKfkLEKjkc2yjI1QrboChTQsokPOIW63Dw49fV
	Ro26h1EUA8fnnvAg3XQZALth1TUdd2BWORNz2UiGqbLHAVKzN947Y5jPvengqmO7o=
X-Received: by 2002:a17:903:11c9:b0:2d8:d4cc:be62 with SMTP id d9443c01a7336-2d93fa24005mr12660775ad.15.1788154152024;
        Sun, 30 Aug 2026 22:29:12 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b5bef7683sm12379462eec.12.2026.08.30.22.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 22:29:11 -0700 (PDT)
Date: Mon, 31 Aug 2026 10:59:08 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: rafael@kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn,
	stable@vger.kernel.org
Subject: Re: [PATCH] cpufreq: initialize policy rwsem before sysfs publication
Message-ID: <apURJD6v92pMNKbJ@vireshk-B250M-D3H>
References: <20260830155301.2713780-1-runyu.xiao@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830155301.2713780-1-runyu.xiao@seu.edu.cn>

On 30-08-26, 23:53, Runyu Xiao wrote:
> cpufreq_policy_alloc() initializes policy->rwsem after
> kobject_init_and_add() has created the policy sysfs directory and its
> default attributes. A sysfs access can therefore reach a policy callback
> before the semaphore has been initialized.
> 
> Initialize policy->rwsem before publishing the policy kobject so sysfs
> callbacks always see an initialized semaphore.
> 
> Fixes: ad7722dab729 ("cpufreq: create per policy rwsem instead of per CPU cpu_policy_rwsem")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:GPT-5
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
> ---
>  drivers/cpufreq/cpufreq.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
