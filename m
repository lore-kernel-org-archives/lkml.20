Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE910479891
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790200116; cv=none; b=Ibum3f1Qp0OxXp4ywqiZ5VCCZr4J+1eJRIn+malh7kKujwZmrz/uTBXvr9278GRT0xxQZBPSquu007hLDzQ8clPDI2TQxAxU/P4qRWxxlgIL717ThoUqFMdyUQZE2yZ/VoCDCNe6jeJN6/CHjzydhzue/OGbbzz0VzBea+/gtGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790200116; c=relaxed/simple;
	bh=ArvY7Ct3vvA/TFaJHQ6uFdvMdAPUG+nhb8CAfOIIX58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWsk9wuM2dZAmc+7oO6aX3bzo3GLO2SnO973A8EFngxhSNPpR/kJskCwQ9LuZZ9Qym+RMHHf8o+GIFoLs0PF/e9KQI08AVfcG2xOpaPE9UuvG8UvlUarK0Ih4415uY7K4q7as1K4mugYSwsq9FOrT6b5T6vzoucHP4d4Wp+FQtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h6QBh8V0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h6QBh8V0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0937F1F000FF;
	Wed, 23 Sep 2026 21:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790200110;
	bh=vw5qY40x4C5dklJ73ibDmRnrR0RKgmbPRP29+0wyXUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h6QBh8V05EqLJ+IYPefzsG2aoVf20/NeCh93Ws9r49BOCWzkn14nEUc9cAcyIo+lh
	 lvIMgxuk+dkuKDQ3rN1eMjpY9Kna0PPlKpk/uvUjWzQICRxCiVB9TisW+MfOyeXJH0
	 swGOl12LFGg709dPQgXRkV8lCxBEo9KqLUIyWiJwTBnZfskAAwkOCaaTvwTC9scJna
	 6VvDGwSBOwdNyrQHzR71sugKEqYyDK5dFbYEKYKPDmLtXq8L+0sSwOKA0iSK230s53
	 9/NBx8K1n9h37RahvbnBvnL5eZ3VyjjPyS30hAeOGLGbxj6R+JOttU7cAvgks5cIQt
	 2T26f8YL5xKcw==
Date: Wed, 23 Sep 2026 15:48:28 -0600
From: Keith Busch <kbusch@kernel.org>
To: Krishna Iyer <kiyer@crusoe.ai>
Cc: axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	nilay@linux.ibm.com, sjpark@crusoe.ai, saravanand@crusoe.ai
Subject: Re: [PATCH v3] nvme-multipath: add fail_if_no_path sysfs attribute
Message-ID: <arRJLL4ki-sVQnHf@kbusch-mbp>
References: <20260923004959.88440-1-kiyer@crusoe.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923004959.88440-1-kiyer@crusoe.ai>

On Tue, Sep 22, 2026 at 05:49:59PM -0700, Krishna Iyer wrote:
> When no usable path exists, I/O on a multipath namespace is queued
> until a path returns. With ctrl_loss_tmo=-1 that can be forever:
> during a long fabric outage any process waiting on the I/O is stuck in
> D state. We hit this on virtualization hosts, where a SIGKILLed VM
> process cannot exit while draining I/O to an unreachable NVMe/TCP
> target.
> 
> Nothing can fail this I/O without tearing something down: controller
> deletion takes every namespace on the controller with it.

I agree with Hannes that we shouldn't need a new flag for this. The
current behavior is just broken in a few ways.

We just need to restrict queue_if_no_path to only if there really are no
paths so that we actually respect the failfast_tmo.

And the ANA inaccessible and persistent-loss handling you introduced
here should just be the default without requiring a flag. But I think
you need to add a requeue_list kick in nvme_update_ns_ana_state() too in
case the ANA transition leaves the namespace inaccessible.
