Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71E1501F28
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788795755; cv=none; b=E5098kLfpioUFnvDFQ/v1wzTYo6ZDicu0Gu1ze/QcHsbwVzqf4wjoGpOuKf0fEKPbWmSIO+OIYAEY7pCmowDBRbxZ5Wnc8bUjoDiY3jsTSXdrawL6HNdcLYg47Ig2GtSnGNoxRfNUZPccrvHTlOWMn2P3ULvcEgYwYFSQrdvDio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788795755; c=relaxed/simple;
	bh=+OOqmbaWCc+bj0drcgwfudfjBi7gFVexonNebA007r0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AlR22U1r3k+0aePCTDi9dj+Hm19dzdWJq6EvkZOeIpaqgyR1SgL1OAX9/ytMPRFJlAb502DyLLeNYanSkyTVIqow/WbLUzya0fQcX2SGzqVgBc3NrUT2VzRMrhWY4RSgXnZvfoYh8f+clj+k+Qv0k7sMJ1WukC4xDzjaBkfJ7a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=OHh6cLfU; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="OHh6cLfU"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-9399daa3d43so127966685a.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788795750; x=1789400550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UsM2t2muwC2t6tub3Lkt0Nmc2lGDELjoRCFL/zUluw0=;
        b=OHh6cLfUBXht4i/yTxJ8QVpNKRpmq3vB2cm8gaXJDVjqQiMk1V+VKm//a63+1U5F8x
         6o2S84OITcyyR4uDp5YfeqOYpI1pthyt0GYYiKNVqTfa9ODK0afQ+1udUrf1lFTKwIoK
         z6CyG2QqgAHt8RQpNIyuGbcsehNevowuddsU0u9YsmJaI0FEb1TOXjPteOxSqTXDY7VO
         2vwCrg8075AW711KL6okd1MZVVr932lxqy4IzbSBXEW3iuofms5sVqOa/l+2uuDPVmZ6
         2sGVpEJULONs7jzuHWSHAaArwL0l8dj5AKO6YBbxjfuKPqYxp4VFq/PfhrSFqocrxzBV
         XPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788795750; x=1789400550;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UsM2t2muwC2t6tub3Lkt0Nmc2lGDELjoRCFL/zUluw0=;
        b=NdtrNeJyUOw1GlaPa14hOoshjCQ97tsrDILAN93DGc4mBd7GOqFpwy1L1IVQ1LLb1A
         nmvbZNmCUYILRj67DFiNhqCb4q0zDKLDqGh1U6GtUzz9gULZRj0rfmXqrzBe8bN+S4y/
         5cjZmMuK9Grte2sqTiBfhqQvKyOyHgd1eYBlpGxB1+b3JPRWzCti2/IHYN/Tcwvi/81B
         +k7Mo6twSGuXn9WMBSm9fE7WKjQaTAsaRcZIbybHGn1lFmQsX1MqflRnlKoxRhL8akoE
         nfSPYla5QRDDJ02dv3wC0hKt0iFdZWV9UvSjuQEEGlnYZWTtMsB+ZpIYGE1pzsfdIsT1
         sgNA==
X-Forwarded-Encrypted: i=1; AKwUvBysTamlQA/madlO4Jz9RjGwNATM+iB5/HG6nrOodJ/pCMr8/FbQ+KXENnuRMyBi3V05+5U7DXZVzTC3Dqc=@vger.kernel.org
X-Gm-Message-State: AFuF++lVPBm7OExAbBTiNq+OXP5iyONEJsg5Nk7TVTDER3URNJ4xh8KW
	s4qK6PeowGI6XpdenijL5M1lYpGmlv9YXmXkj7xx04VLaX8XIgiMZy4eCXTH8W/1/BI=
X-Gm-Gg: AYBFou2n1erOVOJE92V+sYQYaxQLsXPR/S19lHqV+dGfxthdM02qX1tdyUkq4t4uFJ3
	uxG+QG0c4+lAAWcYDzEY1kB0WCPySiJ7hRapPGDfjaoCPaOmqlm7mTvkWyEamFClA2dL8of2u23
	JiGfjw641tP3Q3aAmg7s9bOoJnYZAJdBbGjdZtT446HMUvBM58zDjq311u0n9+0idL2O1mNQtr3
	OfNz5GVvRcFAW78foKsNJV2nByExuEKjB+tnyKXbbLD3w9uWIwOV6fsEVjb52pG121DigztH6z0
	uwa1VXn5xFXavWrPBA2mAApCpFBeNsZ8+W002sSUb/E/XN8olQHqXg8TWed+Po/Ps4GBAn2iEDx
	KOPladbkm44x8JauSdZgRGuLxbrd8z1x9+CTAnxuzeYsYt3On3LAqIvqhUDwUEZxsMqcmu24r7J
	rLSKGRyXJkRWWg9KEVCWrJuaEayzLTv3tVMxfmQMiXFZb1HQSHbZybMCn2fcprxzbugjBKA22xz
	/z/hk7sxNRFp5bfHwtbEoTLfa+P2NNahVW0COOheoFr
X-Received: by 2002:a05:620a:aa14:b0:939:6c2a:24fd with SMTP id af79cd13be357-9398031b73emr2041569285a.9.1788795745703;
        Mon, 07 Sep 2026 08:42:25 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040646d64sm95118286d6.14.2026.09.07.08.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:42:25 -0700 (PDT)
Date: Mon, 7 Sep 2026 11:42:22 -0400
From: Gregory Price <gourry@gourry.net>
To: Ye Liu <ye.liu@linux.dev>
Cc: Oleg Nesterov <oleg@redhat.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Marco Elver <elver@google.com>, Ye Liu <liuye@kylinos.cn>, 
	Tejun Heo <tj@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Bart Van Assche <bvanassche@acm.org>, Yi Tao <escape@linux.alibaba.com>, 
	Michal Hocko <mhocko@suse.com>, paulmck@kernel.org, mingo@redhat.com, rostedt@goodmis.org, 
	jpoimboe@kernel.org, mic@digikod.net, tglx@kernel.org, akpm@linux-foundation.org, 
	david@kernel.org, linmiaohe@huawei.com, nao.horiguchi@gmail.com, rafael@kernel.org, 
	gnoack3000@gmail.com, ljs@kernel.org, sj@kernel.org, rientjes@google.com, 
	shakeel.butt@linux.dev, xu.xin16@zte.com.cn, chengming.zhou@linux.dev, will@kernel.org, 
	boqun@kernel.org, frederic@kernel.org, neeraj.upadhyay@kernel.org, 
	joelagnelf@nvidia.com, josh@joshtriplett.org, urezki@gmail.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, tony.luck@intel.com, reinette.chatre@intel.com, x86@kernel.org, 
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, pavel@kernel.org, 
	lance.yang@linux.dev, mhiramat@kernel.org, pmladek@suse.com, longman@redhat.com, 
	mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com, qiang.zhang@linux.dev, 
	dietmar.eggemann@arm.com, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, mark.rutland@arm.com, Dave.Martin@arm.com, james.morse@arm.com, 
	babu.moger@amd.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, rcu@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH v2 1/8] sched: introduce for_each_process_rculock and
 for_each_thread_rculock
Message-ID: <ap7bPSbO7UvFSwPf@gourry-fedora-PF4VCD3F>
References: <20260907081334.1152889-1-ye.liu@linux.dev>
 <20260907081334.1152889-2-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907081334.1152889-2-ye.liu@linux.dev>

On Mon, Sep 07, 2026 at 04:13:27PM +0800, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> Introduce for_each_process_rculock(), for_each_thread_rculock() and
> for_each_process_thread_rculock() macros that acquire the RCU read
> lock before the iteration starts and release it when the loop is left,
> so that the RCU read-side critical section is scoped to the loop body
> instead of an externally managed rcu_read_lock()/rcu_read_unlock()
> pair.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> Acked-by: Michal Hocko <mhocko@suse.com>

Lorenzo already picked up the nits, this is really nice otherwise.

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

