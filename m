Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF9A49E137
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 22:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789080834; cv=none; b=SLhKkXcWtWe6Jy3D1hAEHr/bsCRWTIe9vaYD+akQ1r5BdwfLvdWniRxIDkipCdnIXZ0AMOvc8CkR1Wumr/3WCexMHVo/sQ9N029SaPSzRGW9uEg/0e3XO0mRQgiR18ahA4AW09jNu/X3BCRDZ5wkGfLJwotZvFx19MoHAHyhbEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789080834; c=relaxed/simple;
	bh=nKUkcEQ7N3O76GbA0Y5pHeHCFrQcs3zdDhqXr9lgOUE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=AKXww3kJGSfhUe95KAxdH4nc4yw51Bn2kGSE47dIuZbVVoNJStaxo+Rynx2vugV5KuOrPU+GMGGwSRVu38cgIADy/njgdg+72VLzc1jHpJOLgoMwverizrb6pl1rf3Uoh6NJ5kH0qof9/q9WCtfq/mNnGGP1pL84hjUyHnDpTuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bRLJXgJq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bRLJXgJq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B0401F000FF;
	Thu, 10 Sep 2026 22:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789080833;
	bh=1DUJYzPPmvSYuTW/roSbtk+FDvwrmkVDKMk8zwIygk4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=bRLJXgJqp1IvF3Kv3Ttx/7/JjzgYpDrzSARMrjwOq7xvRxmwnvLEr0rullanh7QUj
	 8tVTuip0hfBRHMby2XoF9m6MyhWY5vps/ly8a5/aK+1WCF+ToUAi3nyHjVgVx5o8UX
	 ku0j0RCEeCXW2mVMVowLWZhkpAScQrOH1CagtGl4QlfoHuuSXYgo0k075LbA4iZHl4
	 6AJHIXOZC5CvkPh0Q/uqd15jy2BxlEHn7OIsllEjNCpkYciNmN58a4ZWdEK/nieHID
	 FeAAUhAnA0REVCLfuvj/bBUJ7tioyaVMpJ8eSvJR6NTRlePIcOjIgsKvtt3eYVmHh1
	 eHHaOACHGpp3Q==
Date: Thu, 10 Sep 2026 12:53:52 -1000
Message-ID: <cd7d986c8aebb20cda0a96f36ddea0fb@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Marco Crivellari <marco.crivellari@suse.com>,
 linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH wq/for-7.4 0/2] workqueue: give percpu its own max_active
 and derive attrs from flags
In-Reply-To: <20260910-realsplit_last_v2-v1-0-464d64b71b29@debian.org>
References: <20260910-realsplit_last_v2-v1-0-464d64b71b29@debian.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

> Breno Leitao (2):
>       workqueue: give percpu workqueues their own max_active
>       workqueue: derive the standard attrs from the workqueue flags

Applied 1-2 to wq/for-7.4.

Thanks.
--
tejun
