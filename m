Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F5F38F95B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 21:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788297123; cv=none; b=Au8KfuukLAJZy5x0x7WoGwEnskGV/E/WtBpQpqGwOpN5fvZKT5baAC12r9CixEYSGo9+Bs/ZsX8smNlcK38HPy3W3ZoUWTKVi8HTqB2zYg1AtJnmnrvltYyUgTNtd7g3M1XgNnNwsFuMsGW4Ow7qHWwX/JqTg9B4/UPsh0D43gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788297123; c=relaxed/simple;
	bh=LITuoE5iRciuw395Oet//i5jt2ETRlXOCw08gIVlDc4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=tXCtDF6uWczEs7S8CqGknLdEEbAjF2UOkiNosfFJcgrOUpAKQ2qjSmHsdklBptf9xYj+1BFtLhUJZjR+vzYn0MaqXVjFQibft9bONjPTS/zH0mi77QvxBu6NVIVnL5xp/EgBvJ/RyRNvY6ay5w4nOWqL5wTCzMrvck2T4X9jR9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=geJuFKbG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="geJuFKbG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D92871F00A3A;
	Tue,  1 Sep 2026 21:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788297119;
	bh=BfOoWegF+Sq6QHrTJQA+JbaGReMIOa+BkItA1J565/A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=geJuFKbGg5n517DmFqdvVUKDwuE2i24h+IAgQbgufzi/fHbO6INK1DwVL4l6E5f5r
	 aapkqhlNgmgQ0j9bzjAEh3hnm+MrEGIgRpy6dXUOiqC5koQ8rYP78PWteXqE1fOodf
	 9cEck7f5b9IzxRUyDlivjvx4+ABpZqkcAhr7xg+r55pujljWdvFWr0jhOIEPdYxIZa
	 1vv8LxXqUsA1LMi3mrqtvJe5hkALJan+2597bhBmqYrmMoDa1oHoyGCd47VmTIZ32X
	 rhQfv8ccp5wvQRwlxcHIZ+Xh1hdTZrAHcCazO4GSJich+VUUVcM7lZyfn7QAgzJeWB
	 dE4A1kyCUJG3A==
Date: Tue, 01 Sep 2026 11:11:58 -1000
Message-ID: <92e520050991ea409925012255480655@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Yao Kai <yaokai34@huawei.com>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Breno Leitao <leitao@debian.org>,
 linux-kernel@vger.kernel.org, liuyongqiang <liuyongqiang13@huawei.com>
Subject: Re: [QUESTION] workqueue: Reducing flush_workqueue() overhead for unbound workqueues
In-Reply-To: <0a030145-c108-4365-ba2d-ac1973a1e352@huawei.com>
References: <0a030145-c108-4365-ba2d-ac1973a1e352@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hello,

On Tue, Sep 01, 2026 at 04:46:06PM +0800, Yao Kai wrote:
> Is there a recommended way to avoid this overhead for such case,
> I would appreciate guidance on how this problem should be solved.

Posted a patchset which makes flush_workqueue() visit only the pwqs which
have been active since the last flush:

  https://lore.kernel.org/all/20260901210929.3092513-1-tj@kernel.org/

Can you please test whether it resolves the fsync latency issue you're
seeing?

Thanks.

--
tejun
