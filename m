Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512A239AD33
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788214992; cv=none; b=cARClv9ufELJUPq0E/Lwv6iXYVBgsN3xViruaNVsbINTkvBzl9AnLUKSL0pOy3AvdFY3CxpendIYZWup2NAJnWDW9z6g3P+J2X9JV2T7vKlveNHFPmj6Dua6T8qmwDtaCdPIoLcK/T8qg/SOYlMfD7YjQxy6uUByOgyfvV4uro4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788214992; c=relaxed/simple;
	bh=W583EKF7MKZHwngftB6Ubknwgw1nSx2fUYEgFFpkFWk=;
	h=Date:Message-ID:From:Subject:In-Reply-To:References:To:Cc; b=tFXR5deCW+enJq371Kt/S1iLixYoCvKas8Xhcu00xNLeo/mEhSfkzdyk1clqAMkl+5ADhOsV6mL70u/RQFsiWX9HIgUwFrSBdzf0/88jsmycGf7ihpOVmoWbrMABuplm+RQ1bdHAovFvxwrolBL87fyTj+2PA+elu4RwL56Ajo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ddkh1mrp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ddkh1mrp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED5F41F000E9;
	Mon, 31 Aug 2026 22:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788214991;
	bh=pQoG0snfn9ivX4C2NCxIREJVHXKr889cVsqPS4eGD30=;
	h=Date:From:Subject:In-Reply-To:References:To:Cc;
	b=Ddkh1mrp0vuL/cFTIvtYowMi0Xg7OLaKvvaNxLDSKEQzkIAo3DsPhehX5bPG0lNxL
	 YNaJJqvZnZ1lLW/e7pDSUhBEGwSIWupQpZLfY7o9b3sAYLekcv4AoB2wsB9ZxcKP9t
	 2CbmHXRLO+272S+Ld3JgDjRsXDvM3EsnyYhlG13QPBOIVFwY64GD6ayqyclsO2VH90
	 cjihHTjjWssOIASwFBWbrn7yvKU7aTZ97a+D+UUvleEhDzWuY9vlPaVRmEt3rmOS47
	 fHGAQGcOiL+ZHUSur9QAKndTjjYvjk7Jvu2v8bmbDFHycFuJbR2FY1jLjcsGancstN
	 ybUF6+FPtxmKg==
Date: Mon, 31 Aug 2026 12:23:10 -1000
Message-ID: <144b3dc986135ebe34f671cdd02bd8aa@kernel.org>
From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH 4/5] workqueue: build percpu pwqs through the attrs path
In-Reply-To: <20260819-wq_realsplit-v1-4-6ad3c3f48be8@debian.org>
References: <20260819-wq_realsplit-v1-0-6ad3c3f48be8@debian.org>
 <20260819-wq_realsplit-v1-4-6ad3c3f48be8@debian.org>
To: Breno Leitao <leitao@debian.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org,
 pmladek@suse.com, marco.crivellari@suse.com, gustavold@gmail.com,
 david.dai@linux.dev, kernel-team@meta.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hello,

On Wed, Aug 19, 2026 at 07:37:38AM -0700, Breno Leitao wrote:
>  	if (!(wq->flags & WQ_UNBOUND)) {
> -		ret = alloc_and_link_percpu_pwqs(wq);
> +		ret = apply_workqueue_attrs_locked(wq, percpu_std_wq_attrs[highpri]);

Applied 4-5 to wq/for-7.4.

One note: if pwq allocation fails partway through
apply_wqattrs_prepare(), the already allocated pwqs are released through
pwq_release_worker, which isn't created until workqueue_init(). Percpu
workqueues are created before that, so an allocation failure in that
window now oopses instead of failing cleanly. An allocation failing that
early is unrecoverable anyway, so this doesn't need handling, but it
probably deserves a comment.

Thanks.

-- 
tejun
