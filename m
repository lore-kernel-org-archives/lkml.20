Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D2347CC7F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166048; cv=none; b=faK57kTnyOx79RG9wjUBh/QY3cX5V3+Y4vd6rvBUfnCB9virNfFWsLpwN3xEWNjW2oWbBI+GMzWScCn4bESwjuzuXiYQAThkLjnESWk/fXOfxAGwhY4Z7MLWytIW4owo3ov1PJZLWjKCbZbGEyrkIGY92ZPLeiIC1a+1Jo9HKp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166048; c=relaxed/simple;
	bh=l3j+6ldFTuV0kg/g9jq4zlhvRmu3hB/zK9Iir2RD6no=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MEOhH9ph5ddxk5gpbYAk3xK0QCF/Q9COuUj1T9aVK63RtGSSxaWVh++ZP/iEMAt6YCJjcXkgOnckV+BVC3V/rEKDbfpNzzQWXLxuZIMgD0k1RbiZMbkYo+vzCYmAKS2YicsgMSpcKySTQQjKDlm17F+64WDryuEcLbR9ZY3EAJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=jqgV+6HI; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="jqgV+6HI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ID7vaTKZESoafuSaUm7qbg92MHZmbAreGZuXLyAQB0s=; b=jqgV+6HIzeD1rqxniI63TyPXHt
	CxOCxn5s1s+YVlz/O2WXGln1P2Cu5WnMXl4+QdWRpiKCJd8zeEM31rB2EFe3OVTxS+e7l0c9a52IK
	hzq/iCy8kEEbDt+XPmpzCdrELCaTMLjwhW9fF1xTK6MYDSd9r7q7mccNxom1gLGurC1PgZKSHHPLo
	V1680OSNl9SpO+n5+Oso7+BXMIRthHczQByxB+4as4IJ8B6571l8+HOwiCR/CZYU5jN+9v/SSpIXK
	92v6oVwjaW2sIqLUcX2giNLCNI7fAceix0TZFJsGCG0UGUiyYDzh4anD3im2oN4anmqvYFfbnBgHP
	fnNQDooQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xHkFv-0064n8-38;
	Fri, 16 Oct 2026 15:54:04 +0000
Date: Fri, 16 Oct 2026 08:53:59 -0700
From: Breno Leitao <leitao@debian.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v4 1/2] workqueue: Make alloc_workqueue() unbound by
 default
Message-ID: <atI8hifJ8K4BAIPg@gmail.com>
References: <20261015140148.231126-1-marco.crivellari@suse.com>
 <20261015140148.231126-2-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015140148.231126-2-marco.crivellari@suse.com>
X-Debian-User: leitao

On Thu, Oct 15, 2026 at 04:01:47PM +0200, Marco Crivellari wrote:
> Currently alloc_workqueue() ensure that one among WQ_PERCPU or WQ_UNBOUND
> is present. Now every user has one among these two flags.
> 
> In order to achive the future goal of removing WQ_UNBOUND from the code,
> start changing the default behavior making alloc_workqueue() act this way:
> 
>   - if WQ_PERCPU and WQ_UNBOUND are present: remove WQ_PERCPU (as before)
>   - if neither are present: add WQ_UNBOUND
> 
> BH workqueues (WQ_BH) are always per-CPU and can't be unbound, so
> WQ_PERCPU is now unconditionally forced for them before the above
> defaulting logic runs.
> 
> The WARN_ONCE() when neither flags are present has been removed and it has
> been replaced by pr_warn_once(): from now on, every alloc_users()
> without WQ_PERCPU will be considered unbound.
> 
> The pr_warn_once() will be removed along with WQ_UNBOUND in the future.
> 
> Link: https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>

Reviewed-by: Breno Leitao <leitao@debian.org>

> @@ -5895,12 +5895,33 @@ static struct workqueue_struct *__alloc_workqueue(const char *fmt,
>  	struct workqueue_struct *wq;
>  	size_t wq_size;
>  	int name_len;
> +	bool wq_unbound_by_default = false;
> +	bool wq_dropped_percpu = false;

Nit: I think these declarations would look better in reverse xmas tree
order. I know Tejun doesn't feel strongly about it, so it's just a nit.

--breno
