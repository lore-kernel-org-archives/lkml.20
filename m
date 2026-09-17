Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B208F4D37BA
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789644497; cv=none; b=eVDo2xaHGORBGmUecBm2U75od9b4/h7NPYxM0YtnyTjsirePYcln4px/+NaRZjfoKrQboEE+PyZil1jV7uFEo3Yl/0vkyAMMZ4WNu+fJ6V+M29yuOeXogbgpFKqskkRQQO/jtAHwqjk6GSVwT3eRGo4QJIsRxdULr/VGJ3eXHEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789644497; c=relaxed/simple;
	bh=rkbgMLuM3vm0QjSeOouBx6sDtJtxGAt8tN51h/k1Emg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mouh8PxnDSmDq9Lv3uxKJGmRFKpJKLuMPP42KppkRWrrGYnEzSEYd2WFgVjC4HRIlnt0LhBunrzYyFwGIzzbPRHzrHjItoTOLNeejECzeeeNplPxgN6bn5peoBUUedDQUC9Ih9N+8kfNpwPQsgY0/hx8ujFKrgWxh3Ssga5zX5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cBiVsMop; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cBiVsMop"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e66390995so3854515e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789644493; x=1790249293; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cPQWIr4fS6DSXVaIcQLRpggCO3UERblx+k2pBWKEiyY=;
        b=cBiVsMopEYxIp2v4ZQ0BZHIhPOhv1WkhfZIuu4HsqqQK2T4j917iiq1KN5c/fsjADH
         Lb/DrZRbp2YE8jKyKg5brHB8Ei8fXa9RRsZYJOu9PUMNXzPqiuM3h4y48c4CxnqggowI
         n9DZLWnAay7DQn4gweYncMCfKk8vjh+xGoxaFlpQF5t1SeWlXGSrVkG/lR8LmI6At+OT
         csDVDcxzQJx+0jpORA4Dm24qTlXpudp0AMa3Giks29Rq7Zdn7cEI92OQDOoXbs34Nl4U
         nIxCQyu9PJWh+fO+c4nhXpeAdIWHLIegu4mkkX+nSSnf5HlFlhml2wWtXm6vKZBOhzmk
         RjpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789644493; x=1790249293;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cPQWIr4fS6DSXVaIcQLRpggCO3UERblx+k2pBWKEiyY=;
        b=lMPSIKxpn3blEPRJ38aPxiDx1dlnXPydL8r0/ezVggPcsTXtFYdoOMyNTBvkyu7nYw
         CfgqkmMCS4ro5Y+EpZplFYoHmX65bzsT5pd8I2bOy4rxEZtXPjAJNs3Gi7pKlR+HpvU3
         wN6H7IpCVXtpOYS2cTfaO+EDK1IafMSm6q4FXXmFxhlaPMbipRyNMYNEBeT9U0uhVumD
         pBdw7LM9G69DDqgDk7nY2ARNa1KBEcy9B2+qsUrOXawr+bnHKzMcyE3SiKBrbX9YIt7b
         PHn9ZprDXkpEBZO72w3F9FBEPiDj/IdfYi/2DD/eH84aCuFIuVPD3o2Om6rE6dQ1p4Ol
         03Sw==
X-Forwarded-Encrypted: i=1; AKwUvBwvrKqOkEQoFH8ZMELO45ccn2XQZk4NceleRzSLvMyu0cIifL6bjaxLviwX6vc92x/wDPVn+Qmd9hssIE0=@vger.kernel.org
X-Gm-Message-State: AFuF++kIGWW4QOKATnz7YQz+gSVcPc0/2GQGEL1YNv7AdoOLTaKjEpXC
	DfaCs2tQvjLXCyg4owqYGJv3CWoW+mZtSihM24Q8ElXkFRj+KDt/U0e41DtZTmrWaqU=
X-Gm-Gg: AYBFou0K+651ldtH33914Kgn4OSeJ71vYXrXgvg5nOywKd8YCGN3boMq8JmSp8/5v63
	D2uoZja0qDocpsR8nF937Nf1zQrtLkHbD5EQLdJkzcpe8rQAoY9bBwc1nRVTUgLaDCMCMmivo4E
	3quzga7aYGuHWXCYv8UIjsmVJZixuEiX5+xq/fhKPm3rt2yQjh5U8Uxz6JKY0gVRQEEGd64SEpA
	v/b5jlTxRVlumxnD8ifLPoD++oD8L4xGZhATY2BOBA33HvWOkLOgYHX8cQYIH8VZL5Zp5zKVX3W
	oK5fGZWyHIpBGYCcYuIpdNe01eg520KfxEOtomdyJj3yS21zxpLQ9Xszl7/f4z1WtZoAjdpHh4Q
	dTn5euf4bcOrsE5vi/dl9F9j3hPRTwsd8kHsG5c3dA5JQaPLml9vvaK0Ym3is1J24I+/qB/0w2T
	EvQaHFWGdQ++GtkCkV+5KPdYm7h6JMLQ/OyINc7Pur0lVeP7VbC5D7dl13LgFAgngNAM++4yYO4
	g==
X-Received: by 2002:a05:600c:8a17:20b0:49f:bd0d:59f5 with SMTP id 5b1f17b1804b1-49fbd0d59fbmr28486785e9.18.1789644492945;
        Thu, 17 Sep 2026 04:28:12 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf34440sm14542597f8f.25.2026.09.17.04.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:28:12 -0700 (PDT)
Date: Thu, 17 Sep 2026 13:28:09 +0200
From: Petr Mladek <pmladek@suse.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: bcrl@kvack.org, viro@zeniv.linux.org.uk, brauner@kernel.org,
	jack@suse.cz, tytso@mit.edu, adilger.kernel@dilger.ca,
	libaokun@linux.alibaba.com, ojaswin@linux.ibm.com,
	ritesh.list@gmail.com, yi.zhang@huawei.com, sforshee@kernel.org,
	akpm@linux-foundation.org, rostedt@goodmis.org,
	andriy.shevchenko@linux.intel.com, linux@rasmusvillemoes.dk,
	senozhatsky@chromium.org, kees@kernel.org, tglx@kernel.org,
	linux-fsdevel@vger.kernel.org, linux-aio@kvack.org,
	linux-kernel@vger.kernel.org, linux-ext4@vger.kernel.org
Subject: Re: [PATCH v3 2/8] lib/vsprintf: Use acquire/release for ptr_key
 publication
Message-ID: <aqvOybiwt5ZTBjAG@pathway.suse.cz>
References: <20260902074805.398540-1-ruanjinjie@huawei.com>
 <20260902074805.398540-3-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902074805.398540-3-ruanjinjie@huawei.com>

On Wed 2026-09-02 15:47:59, Jinjie Ruan wrote:
> Replace the smp_wmb() + WRITE_ONCE() and READ_ONCE() + smp_rmb() barrier
> pair with smp_store_release()/smp_load_acquire() on filled_random_ptr_key.
> 
> This expresses the publish/subscribe pattern more clearly and allows
> architectures with native acquire/release instructions (e.g. arm64's
> STLR/LDAR) to avoid the cost of full one-way barriers (DMB ISHST/ISHLD).
> 
> No functional change intended.
> 
> Cc: Petr Mladek <pmladek@suse.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Assisted-by: DeepSeek:DeepSeek-V3
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

JFYI, this patch has been committed into printk/linux.git,
branch for-7.3.

Best Regards,
Petr
