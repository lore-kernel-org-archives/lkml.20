Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1683F23BD06
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 06:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790835083; cv=none; b=Et9l1leobg/AiwEquhGx7/XM/6GXoTvRGph0691HUR97ud41TLNvg+bsqwAtiML/OcVTEg3MAqE3TfVlzjjV5mDrOHs1iuq/j1/9rSrnrX2j4rJvARqSNRsKUD1DwHbQtOG3MuR9INRu+GfZjlArnZXTpYa8xG8RhDMWe+EaP5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790835083; c=relaxed/simple;
	bh=V+7fq0aIITW4y/H2dS9YpjMAyw1V9R1Ey7YiRCW4oTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KCf9BiWjLpHa4dsWgCMJ+ECxwTRR+/yd2pTmvxOTzTK8GXvmT0+SlQcvJYVSkFoFdyh/FPWVhHy1tew9ieCTpXE3kp9rh+A3AMnAL+mJOaS6DsLLXJV9h80BC1FVMjjabeU1VEJBKYhbNnEKO5aOKiaUC6VMAYCDx+QTFY361j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kuylOZMb; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kuylOZMb"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-33e630052ebso7031945eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 23:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790835081; x=1791439881; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=APRwSvDbSgJ/cF1X+Olcbk7Y4gCP43eD+/63lefDSyc=;
        b=kuylOZMbaTm8sEDuXDeBrd9s52Wi2En15V1n3Y1jCs+Di4GvWbvL8VOsMqsid6+G15
         nNwixxKqaKFCmSfInCjuqQgqnvfNCeRWPHjQN0HTkJokQGXudpNSouUwUnC16l3sVIhv
         t72ZCqkWmoNZTvMP0pLoqPWWDYFFBdU9GTdfeZ4taf+TdbgaOIBGJxIAsSUY5epYZlgQ
         z4O9P1Qkg7XXblbZRgGbyAG12V/+PSZhhvkgsLbr2axQoRCyHlCEVtbvN4/+uj45a/xS
         iNJXRixPR7mH4Z9hbHW+WTX9nZbD5tYNThVRNR1ywKlc+jOnRvJ/MBJnZWcAs03U/0ae
         FGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790835081; x=1791439881;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=APRwSvDbSgJ/cF1X+Olcbk7Y4gCP43eD+/63lefDSyc=;
        b=NnXk8rtozqhYTcox5aJH0ZfOJOJdcYLYsu7KXdyCyqdBx1FlJgcf0dgCQXXLNqw0bp
         usvdcj8c2Y6bpFdjG8R8oO/v4ZSIMIgE45rXNeXVhiVPCeFW0kCAOP/h/a4czY/GFgBt
         lTlL0+DFey0n9+DP3l5ppLwtjR4ze8wRobU15Yh+ALM/n71SW1BtVfCXau9hhPpwuu+D
         /IF/YBIS6mVFmkOwiafg+xMm4POyrSJmWhbrjBDoQZp6dC5sPTYW+PzkJZJbQaUcRwgv
         jsx1WfeTm53448izPullKSMC/bLCYsdHNTl4gN4ctwhUqScBJPcPa2mHuzTxvFVxr5r1
         VPpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAVyJO1i7ZjOs1+UrzjcsY4l4InvEpaWTag7oHIfcdx52ueud7bdxXd+8BeLr3h086qzf2GUySfalCnjs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwHqokDZ2+njMqrxhQpXRtk4rpGgBfrlgASAJ552vgsbppjI3b
	IgN6UNlfWqxQMum2yHWK79jSgH9mQc1i3SYQ89iAsfINHVt0Bm9XPboCLyxxWRa3jZRI1V8goMo
	Rc00m
X-Gm-Gg: AYBFou3ME0coQiXM3tTxq1Z7hoJZVzp5LHUOZS2og3Q/trjKEAPVFTdfa/qjZO7W9Jb
	YFoKGzGBnRoNmVGyD8n6lMX/SWZJZgTY75+T+I4ml1irFve4vvmhTaaIVN2+IAHqFFtYhpXAESI
	l69MlkDvWoVv/zEMpuwbdYxY/8W+9FUJSsJ6I62zc5t0mZchY4f0sIhUMFAnF9r5MklXJSWGDbM
	4Sye2uOyYYRMp+/K9B8yZS1K7GfEeLKSc6Rcu1VF5UHwXTH/d8a38dJGPncEr4xMGVmPHvZkhzL
	L6BntaG/iTOfevMSI1S6OHekGMbay/OzmoeoJzHcwupZKH6w0Oj3JX9tnUkJfm65iMFZL+cy6PO
	qE5itsnAgrQycGEXBUQPT0fJCZokZhbY991le/7mT6HqgBiWuWc6RAJ9HQrWGJW8qdwBFpilX/a
	rMPMv0Hqt6rBV5+Nc7rZfJKHd0N/bwnpD65Dwib5fXxPJK7xaOrn8bkB8cpDrTySI/hrc9jzfJX
	Q==
X-Received: by 2002:a05:7300:f408:b0:34c:b75a:ac21 with SMTP id 5a478bee46e88-34cdcabcc65mr4493118eec.35.1790835080766;
        Wed, 30 Sep 2026 23:11:20 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db5016caasm4237966eec.30.2026.09.30.23.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 23:11:19 -0700 (PDT)
Date: Thu, 1 Oct 2026 11:41:16 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
	Jordan Crouse <jordan@cosmicpenguin.net>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] OPP: Fix the return value in dev_pm_opp_get_of_node()
 kernel-doc
Message-ID: <ar35hDWrzXcqdc45@vireshk-B250M-D3H>
References: <20260911221443.7139-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911221443.7139-1-kmehltretter@gmail.com>

On 12-09-26, 00:14, Karl Mehltretter wrote:
> dev_pm_opp_get_of_node() returns NULL when the OPP is invalid, but its
> kernel-doc says "else 0 on success", which was never true. Say NULL.
> 
> Fixes: e2f4b5f8dc59 ("PM / OPP: Implement dev_pm_opp_get_of_node()")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  drivers/opp/of.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/opp/of.c b/drivers/opp/of.c
> index 2f3bbde9a9e1742a2d6b40be91a65d8fa7365bf3..ea93800795783f0595483742c0c10de42b25518a 100644
> --- a/drivers/opp/of.c
> +++ b/drivers/opp/of.c
> @@ -1409,7 +1409,7 @@ bool dev_pm_opp_of_has_required_opp(struct device *dev)
>   * dev_pm_opp_get_of_node() - Gets the DT node corresponding to an opp
>   * @opp:	opp for which DT node has to be returned for
>   *
> - * Return: DT node corresponding to the opp, else 0 on success.
> + * Return: DT node corresponding to the opp, else NULL.
>   *
>   * The caller needs to put the node with of_node_put() after using it.
>   */

Applied. Thanks.

-- 
viresh
