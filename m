Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C142D488D86
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790329890; cv=none; b=Qn8qnaePA6qUv18plbPIGkLrvd8zXV8KZ7kQaxe/+EXH4Cchqm6Ap7UFZE1nTV22+A4WBZiQD5bX5yHpaLWJDMu0aq79CWSOSEg8HdqwFHsjmugTtUMQF4BSD4oX1tN6RsqG83WKxgnJC/f+JPRzgGBamCDEK+2sMGEDT5WkyWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790329890; c=relaxed/simple;
	bh=nmelBe0rmd37EZkhBked9r9baRkcfjjrnCyRf48iobU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E/9oH30821futxtFajONmq6pISsjl4pkiI0uQCLnvy3/itStLKojd5aWQFL5BcyvqqosiVk0j31turYPviB2MUYutT/ONv4/L3qJfiYkAxfWF2ajJAcMq3yKFBlITc9D8z32q+B5oOMDOKxm1SGZzVJPIwOyFJlGX5oxa2gu1X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MII10lLe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MII10lLe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C4231F000FF;
	Fri, 25 Sep 2026 09:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790329887;
	bh=K+D5INLgXRmSCP8dX1DI2YP9WCAPf2XRP1YftFg3Z8w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MII10lLeWnl76mMmwR6zRYIBDQPFBBLpplp/A1G72hA8hNqWE/KFpBvE8lGBHSGxv
	 p9xWx5JxHALI59tElqwE3PrmzeOAa8ZHbK4hPsP3Du0TnHtQPUwpIro2YQSPqzgBJZ
	 7PvFyIpf3XbqI/j+XMABy2Fi1IgkNGPDfbDN5dYMVe0k8LpcCzyBwfdSyK7U6RlH/9
	 Om4KSie2kQZ9qi6kqA85+W/Yyy+a+8dZYBsv/J0k3ZNZXPS6BhmzbC6uZCFRaMNlQn
	 CkBzQjZjD4OYsjB4VDOsDtyJ2ln6dA5wzbsCBCrlVqWHY8r2CShJqIUl8EviQxpJfq
	 mHmvIzwF2GKGA==
From: SJ Park <sj@kernel.org>
To: Davidlohr Bueso <dave@stgolabs.net>
Cc: SJ Park <sj@kernel.org>,
	Bharata B Rao <bharata@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	jic23@kernel.org,
	dave.hansen@intel.com,
	gourry@gourry.net,
	mgorman@techsingularity.net,
	mingo@redhat.com,
	peterz@infradead.org,
	raghavendra.kt@amd.com,
	riel@surriel.com,
	rientjes@google.com,
	weixugc@google.com,
	willy@infradead.org,
	ying.huang@linux.alibaba.com,
	ziy@nvidia.com,
	nifan.cxl@gmail.com,
	xuezhengchu@huawei.com,
	yiannis@zptcorp.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	byungchul@sk.com,
	kinseyho@google.com,
	joshua.hahnjy@gmail.com,
	yuanchu@google.com,
	balbirs@nvidia.com,
	alok.rathore@samsung.com,
	shivankg@amd.com,
	donettom@linux.ibm.com
Subject: Re: [PATCH v8 0/8] mm: Hot page tracking and promotion infrastructure
Date: Fri, 25 Sep 2026 02:50:38 -0700
Message-ID: <20260925095039.48831-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260925021226.52kpnmvfylw73dz4@offworld>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Davidlohr,

On Thu, 24 Sep 2026 19:12:26 -0700 Davidlohr Bueso <dave@stgolabs.net> wrote:
[...]
> So perhaps any mm interface for this stuff should just not be designed
> around sampling, and instead proper hardware sources?

Makes sense to me.  I proposed [1] damos_add_folios() in LSFMMBPF'25 for a
reason that is similar to your points in my humble view.  To quote from the
slide [2],

    +/**
    + * damos_add_folios - Add a list of folios as highest priority target for given
    + *                    damos.
    + * @scheme:    DAMOS scheme for the specific access-aware operation.
    + * @folios:    List of folios to apply the access-aware operation.
    + *
    + * If a kernel component finds folios that eligible for a specific memory
    + * management operation (e.g., CXL-promotion or demotion), execution of the
    + * operation can be requested to be done by DAMOS using this function.  The
    + * execution of the operation will be asynchronously done by DAMOS worker
    + * thread.  DAMOS features for resource control (DAMOS quotas) will also be
    + * applied.
    + */
    +void damos_add_folios(struct damos *scheme, struct list_head *folios)

> A lot of the complexity in pghot can be removed without this imo (per-pfn
> metadata, accumulate+decay phase). Of course we still have the problem
> to evaluate the cost of replacing a chunk from the top tier(s) with the
> what the low tier is reporting has "hot". And this is particularly true
> with chmu with limited full system memory visibility (as opposed to IBS,
> for example). I don't really have a good answer for this, other than the
> user could use proactive reclaim along with the per-device tunables
> (ie unit sizes and thresholds for chmu) to configure things realistically
> for their use cases - prob. easier said than done.

As the above quote says, the API caller can still use DAMOS features for fine
controls such as quotas, filtrers and quota auto-tuning.  We could add more
optimized features for the API callers.  My rough idea was that such
operation-focused features could help serving this kind of additional
requirements.

We didn' find a real request for damos_add_folios() so far, though.  And hence
no progress has made for that since LSFMMBPF'25, and I have no plan to work on
it for now.

[1] https://lwn.net/Articles/1016525/
[2] https://github.com/damonitor/talks/blob/master/2025/lsfmmbpf/damon_requirements_lsfmmbpf_2025.pdf


Thanks,
SJ

[...]
