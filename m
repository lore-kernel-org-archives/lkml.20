Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BAD1A9F8C
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 20:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788640771; cv=none; b=EtHfHz+rnewRo7qybRMbPy+WSaF2YhgWNmw7f2VlNT9OfGnvfalvfXyaopSzOrOqTwkFg4jj8+gzW1cu/8ej810uA3J8/yaSDkhxUpy4brNRcyJngJNNKlF3i5KooVCqjl21vPbQdqoggv3fLX/CfDfkTNVPX7DmS2xJ1l6Wj0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788640771; c=relaxed/simple;
	bh=K2/c6QVk4cF19BvQFJD2xMnkHpnFeJ4Bq7t69KMr5zI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=n6ZGZfkXI3XTg56IsbgjpHsMwcxIMH8X6rrSGMOouwKEjUkNo9mtbNQB9erGdBoRo5YYm/QcYUaB4TmPwJwuQG+rYHDN433bBpbyrnWJPKK6PuBv1Z7Klke6QSGpJ34szFfwqlGWBoM6kJmfQ+hs9bHPuD2H5vyadyf5Hgx5L14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a5pZChBA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a5pZChBA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5CCF1F00A3A;
	Sat,  5 Sep 2026 20:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788640769;
	bh=K2/c6QVk4cF19BvQFJD2xMnkHpnFeJ4Bq7t69KMr5zI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=a5pZChBAi0RL8rcAaRdN9oHF1IX/UIj+egPoQHN4ZhoMo5yZk932goJISKMq+0Do9
	 B5CzB/9E8C/yHjrbo8ZoG5ZRNm76z0j0QvNtsI+NUr91TnPgN0RlEUVHYCpbEu2IUB
	 LmBLqIJKwxJdOEKi2T8buP3TKQPCmolTyzpLHBa6lt9F96uZ721xLxnUARJWKUI+go
	 iFJkMegwYV4YhpkX3LQI72CYjI8rVH70qqM7KeE0ZylNt9F/R9HLHJJYEQzd+7DGMw
	 ZNen/tJkbXHTCDnVzYhzh/X4TF/9tnNAaE22VMp6dTA78Lw1b3aKXHMHm0IKmcY2EA
	 bSTkfSjxiwO6A==
From: Thomas Gleixner <tglx@kernel.org>
To: Feng Tang <feng.tang@linux.alibaba.com>, John Stultz
 <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar
 <mlichvar@redhat.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>
Cc: Marc Zyngier <maz@kernel.org>, Petr Mladek <pmladek@suse.com>,
 linux-kernel@vger.kernel.org, Feng Tang <feng.tang@linux.alibaba.com>
Subject: Re: [PATCH] sched_clock: Add option to use absolute time against
 hardware clock reset
In-Reply-To: <20260902082123.95770-1-feng.tang@linux.alibaba.com>
References: <20260902082123.95770-1-feng.tang@linux.alibaba.com>
Date: Sat, 05 Sep 2026 22:39:26 +0200
Message-ID: <8733vn5t6p.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Sep 02 2026 at 16:21, Feng Tang wrote:
> Locally, it did help on chasing some RAS issues which needed cooperation
> between kernel, SCP firmware and ATF, by mapping the actions from each
> players into one timeline based on the timestamps in their logs.

I told you before that we don't care about your bug chasing war stories
at all. Educate your firmware people and stop pestering us with your
firmware debug hacks.
