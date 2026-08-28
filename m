Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD0D3242DF
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787882848; cv=none; b=j0ugR+tZM09f9SWB9ycs+EAfSbRs/hf2sGISQgBaA7fwu0z1wf9EZflIPQpbdAD9KtYRKQ6g4F955w7UCMCUxJVDzz4XNMSRRhVe/q3moVcjQZKsEmy+5hyTUN+9bVWimzyVDif6xYb4CdxiMR2QlR7NsvXtQvhYyq4bhz71YAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787882848; c=relaxed/simple;
	bh=X8aGmSMw0lG8qpwc32EK0asA5kLJGKs7I7Nu2Xyzvq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sw0uXcUc2TAXAZm1QOprktoE8DKWmDLM+uJ3h2ckBkvd7NPZEBHB0iX/IxjjZbfZEYgMiNIK0mueZtEAM2gxzVfR4DDtugj+piI1agW6RRER1giajRabSdk/CVakZhXqNxY5Ix+iWJXumztCf4fubPCjFEd/7p938kawI6O7aDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YxgkTuvP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YxgkTuvP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6A281F00A3D;
	Fri, 28 Aug 2026 02:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787882847;
	bh=7eyYXRUwO3CYA0w+PphgO5XkPG/514TRxReSf2GU674=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YxgkTuvPt7lazpqwaf3eUN8Wz+t0otbNoh8iafDfWBHfu0iqQvkiDuk7/qpkAaNAX
	 1aCwuNiWwEK3O7H4bEFhjYtcD8sdC+wza9qm4wQrAND6nFnIjiXxeocM1QbipKalyx
	 w+Cyp19FlUyjqhUNeD21/LDrzuLC+Fjj8kr6yQzJsYbpc+UQ3LkQNGFcrw3iJT3AXI
	 kXYNTt5key244OiUYLdYLkrV8YpMj8jX//FNEtFQQMBSLIzvGR0WO7oEvq3HRTTLCH
	 hI7No3V+g0SGg70rnOTGIobyqlSuF0D5UNMs+qU9xqHfoS5X+1V4/wZ9CRFpx5f3SI
	 p6vLNa12W5m7w==
From: SJ Park <sj@kernel.org>
To: Yue Haibing <yuehaibing@huawei.com>
Cc: SJ Park <sj@kernel.org>,
	akpm@linux-foundation.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	shikemeng@huaweicloud.com,
	nphamcs@gmail.com,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] mm/swap: Remove unused declaration swapcache_clear()
Date: Thu, 27 Aug 2026 19:07:19 -0700
Message-ID: <20260828020720.122079-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260827082722.1809702-1-yuehaibing@huawei.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 27 Aug 2026 16:27:22 +0800 Yue Haibing <yuehaibing@huawei.com> wrote:

> Commit c246d236b18b ("mm/shmem: never bypass the swap cache for
> SWP_SYNCHRONOUS_IO") removed the implementations but leave this.

Nice catch.

> 
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
