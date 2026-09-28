Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC94B4F96AD
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790631075; cv=none; b=pk0UUv/L22He8TrCnpWSV35HgTAErJFuU7j26iHEnTvJMYOcMNdbDxqT4iDWPDa7wz87dNiu4RY8nZRllAh040LiQrsozse9RFqcGAUQ2qx8Xq650OS66Qn3Y/PLpQq53PYsThcOMyt3kcmgrF7DAvVT2Or8+sWLweKHX8+YJ88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790631075; c=relaxed/simple;
	bh=14CjeDzlncrsUDvx8meKCe4UR2VXZR8CQ0dWNYgN/bM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=U7nIKMck2jMj5C09kPauXhZJS5+wbU2RiOLqIQxhuZ6NqCIFwxonfLzXvkqlWy8dSK85aZM8zY84w7LN2opbVzWphdzcas7xlsDe7+mMIeegTGv8knGVYcdBLQ+pclkcJ9KnwA/Z3MUir+KsQsn5kbc8e1KJ1rocQXQodkIlsW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IHR0+wcF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IHR0+wcF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1968B1F000FF;
	Mon, 28 Sep 2026 21:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790631072;
	bh=14CjeDzlncrsUDvx8meKCe4UR2VXZR8CQ0dWNYgN/bM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=IHR0+wcFGVH0CZEX+Zv9srriAWE/CH4/abBf2EEo66dg3ew0oHccYcjB7X8ZVrrfV
	 BOsxZV3YLcDP27gO5Y78iItI1OiOiBaZOWx5gcHlOn2RbrgkA5iT9ANWGcvzrILI8+
	 FytYrBRCAHrEc+KQ5TpR7843p9pnTYc0LNQ1vvr7hkfjhb/51rZOI5yaybxg9wiMt1
	 mGHLszv/6LGQsynqsl84e225MMpma07AwEJ5iPLDe+MCf1DR4skdT3Rct0edhcTbeM
	 6UqFkSlgbU7eGpSAsc1vSZzRTJEa572YHpP9YeGPAEjSjlPizpf33kCf4v6aVIiFd2
	 JvZN23xluY/6Q==
Date: Mon, 28 Sep 2026 11:31:11 -1000
Message-ID: <1bcd7a71f382de147d7e26ee14f00ac7@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH wq/for-7.4 v2 3/3] workqueue: add a
 percpu_concurrency_managed workqueue attribute
In-Reply-To: <20260925-wq_final-v2-3-860ee052169e@debian.org>
References: <20260925-wq_final-v2-0-860ee052169e@debian.org>
 <20260925-wq_final-v2-3-860ee052169e@debian.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hello, Breno.

On Fri, Sep 25, 2026 at 06:09:52AM -0700, Breno Leitao wrote:
> Introduce percpu_concurrency_managed, similar to the discussion in [1],
> and use it when deciding to do concurrency management, instead of
> relying on WQ_PERCPU (the only WQ type that does CM as of now).

Once PERCPU is its own scope, the scope picks the backend, and concurrency
management and the per-cpu max_active follow from that. Opting out of
concurrency management on the per-cpu pools is what WQ_CPU_INTENSIVE already
does, and I don't see a need to change that at runtime. How about dropping
this patch for now?

Thanks.

--
tejun
