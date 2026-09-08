Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64DC59B686
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 18:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788890498; cv=none; b=GhGDLgMF7Rwwyg3jbA0ao6gcQNyOQTNxPV9GWECfk45NRndElKrAsNFdKVtYnnBsdyqMk5UVhoYTnOnUrmJwGGIcGRLqNf98pAIovpXHt0If6Jgm/HDZxLlyO28RvImOwc+Ij98kk2v6pVYgRJso0pFfEUiOuI5nilk7TutBxag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788890498; c=relaxed/simple;
	bh=fFcmQQtniwQQxt0joP6BwzKHMw3dUPjxaJHNbFfnHv8=;
	h=Message-ID:From:To:Cc:Date:Subject:In-Reply-To:References; b=o1AFNdYTBh6clpadW6l37rReA1pIbce91Nl/D/2bPAVfaL/kuakgRT9CgZNswXaEuexeJEa1n6mSgMWCANIiHCj8OExZOoXT9S4sucHeXVVY1hFaBbss5ocbGzmbxSyq7sgFD3seQaA/V8Pn8rV1c2wifPiUmUsLXJ7sS7jMVhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RrUOZueJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RrUOZueJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C12C1F00A3A;
	Tue,  8 Sep 2026 18:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788890497;
	bh=fFcmQQtniwQQxt0joP6BwzKHMw3dUPjxaJHNbFfnHv8=;
	h=From:To:Cc:Date:Subject:In-Reply-To:References;
	b=RrUOZueJBqTtyThswN6MifebgvgXApXF2whlQqQuPH+ciZNtXdp0uXOwYDj35kZ6g
	 C02HT2v++skrl7CnTJtueAOdnEKUS4vnyYZV+q18z55iLcV5KXUCr0zhYL8mI1iC4e
	 fuNtjD83DmwTQcponsrPqb3ttocSXaAUHOkdIJxqKs+MzQYLrYrbF7upkrx4xcoka9
	 mVyF1KaLc+s8tplmN4hTuIC+O9NY2azuiYS+pV0QSkMPeI/j53TOI2/Qahc9zhLjVP
	 jBjxshLsp0oX1koeyV3C9FjbYi1bo9p2J9XZzrX5LvxjBI82nr2LNjsmsZwPT9f0XW
	 0ijGLGqS/DLgA==
Message-ID: <efe86f4c69a1d9d126ab430a7b0f2eb5@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Yao Kai <yaokai34@huawei.com>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Breno Leitao <leitao@debian.org>,
 linux-kernel@vger.kernel.org, liuyongqiang <liuyongqiang13@huawei.com>
Date: Tue, 08 Sep 2026 07:35:57 -1000
Subject: Re: [QUESTION] workqueue: Reducing flush_workqueue() overhead for unbound workqueues
In-Reply-To: <4b7d4054-633c-4958-9283-2d34f0a0e50f@huawei.com>
References: <0a030145-c108-4365-ba2d-ac1973a1e352@huawei.com>
 <92e520050991ea409925012255480655@kernel.org>
 <4b7d4054-633c-4958-9283-2d34f0a0e50f@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hello,

On Mon, Sep 07, 2026 at 10:19:20AM +0800, Yao Kai wrote:
> After my colleague applied your new patches, the performance of MySQL
> sysbench returned to the level of the 5.10 kernel, so I believe this
> can solve the problem.

Great to hear. Applied the patchset to wq/for-7.4.

Thanks.

--
tejun
