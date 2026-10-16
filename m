Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3C0563FC1
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171270; cv=none; b=oDR0O+0crYem2DNJXHskhWFCZQc1M2ze6h5MblpoeSXiN4hVhWrimmwzM7UI8QPqxO0S8tKNsxQXW+hWamBsmQTEsi/1bCKBy+WyzL82pRdB0ox7kDeOBtE0PfCLMKlP03lvG5fIYdzUIZ+bauA5kVz/yEEBSbmy5cy7xNd6EVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171270; c=relaxed/simple;
	bh=cWkq4Aim7CA+gFToMhS47jC5bMErdfzTLKdzBxc45xA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o+PhiJ26GlTslz3DJxhCR5/yulHPmWMdgCdhw7ApQlEznd2GHIBhTkCFbvUm0UYIE1UAvthNkRF9oHMDRaGyC9Avh5jaYIc12Qr1gsXOfdsLKh1Xw7+CwKssbgtJElVduWXxOYYxew71cp/AqAqK9PA9V5aeVwqlKuNkm7tvSHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kgnAJfyw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kgnAJfyw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 823661F000C8;
	Fri, 16 Oct 2026 17:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792171268;
	bh=l0G+PF9iekKUhcjUUSia0edCE7gT6DQDtIuZKJxTWyg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=kgnAJfywWdyOQX5PRqQOpkxt0K0BTBra4qRJrIQkf1sftODKmDXfajPCrnGQPVmB6
	 3S21NaGJPqQ9mADTQPwx46UjfZu3yQKrKr3pNWTxOnRAjMXLTH+76kqHtJfFaSgXSS
	 7DX/XHGtHekEQWvExyLBPEk9kzll0nSbws7yjbx5G3N5keJROqgUo6KvG58VHeKTDr
	 FOwPipvIDbkbqWiXXAmWx86F1NoJ8Iu+ah8CuoRmZ9A6Oaus2/xJVhs2XHe5QIkcnz
	 XFeQOcqHjT1psAbtb8WHgQmvOyaXOh9mdFdaiOUIMziFkceAVDLIkFbDtU0MwGAbMb
	 GVVNlC4KeVwrQ==
Date: Fri, 16 Oct 2026 07:21:07 -1000
Message-ID: <9cf4e46be85ea324de482d8a4343e6e2@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>,
 Marco Crivellari <marco.crivellari@suse.com>, linux-kernel@vger.kernel.org,
 kernel-team@meta.com
Subject: Re: [PATCH wq/for-7.4 v3 3/3] workqueue: Rescale max_active domains once CPU topology is known
In-Reply-To: <20261009-wq_final-v3-3-eb0b095b9de3@debian.org>
References: <20261009-wq_final-v3-0-eb0b095b9de3@debian.org>
 <20261009-wq_final-v3-3-eb0b095b9de3@debian.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello, Breno.

The following is a Claude-generated review.

On Fri, Oct 09, 2026 at 05:18:36AM -0700, Breno Leitao wrote:
> per-node max_active. With one CPU online both domains were equal, so
> saved_max_active is still the max_active the workqueue was created with
> and can be passed back as is.

Nothing guarantees that every workqueue on the list was created with one
CPU online. wq_init_max_active() runs before __alloc_workqueue() takes
wq_pool_mutex, so a workqueue can be created while smp_init() brings CPUs
up.

For a percpu workqueue, saved_max_active is the derived unbound limit:
percpu_max_active times the CPUs online at creation, capped at
WQ_MAX_ACTIVE. Passing it back as the percpu argument multiplies the live
per-CPU limit by that CPU count. A create_workqueue() workqueue created
with two CPUs online goes from 1 to 2. The same happens after a
workqueue_set_max_active() on a percpu workqueue in that window. No such
workqueue was found today, but nothing enforces it.

> +		mutex_lock(&wq->mutex);
> +		wq_init_max_active(wq, wq->saved_max_active);
> +		mutex_unlock(&wq->mutex);

Re-running the creation helper also:

1. Resets saved_min_active to min(max_active, WQ_DFL_MIN_ACTIVE), dropping
   any earlier workqueue_set_min_active(). async_init() is safe only
   because it runs right after workqueue_init_topology().

2. Writes the live limits directly with plain stores instead of
   publishing them through wq_adjust_max_active().

3. Takes N from wq_unbound_cpumask instead of wq_nr_effective_cpus(),
   unlike the setters.

4. Takes wq->mutex a second time right before the existing
   wq_update_node_max_active() section.

Maybe, under one wq->mutex section, rederive only the saved limits of the
domain the workqueue isn't using from the one it is, with the setters'
conversion and wq_nr_effective_cpus(), and then call
wq_adjust_max_active()? That could be a helper shared with the setters,
and this patch might then fold into 2/3.

Thanks.

-- 
tejun
