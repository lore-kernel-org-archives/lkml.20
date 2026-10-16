Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0A03161A1
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792151139; cv=none; b=LK390cc3f4Op7t7d6BTq+440ncKgof5PXmTTS7tvKWyBLyHnfVEwnsAaeJ7S6P1i1Os7BcYaBlVgPCYCVG9TeJGOD6etrKVCqQQcQuPxBtSaOU51LsbJ7LboCY5Ss2Y8fp1neXawsMt1U3HBOAftloiiqmPJcimnnMXbB8KhUcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792151139; c=relaxed/simple;
	bh=2MumfEk8W8CTdu+O2msQMf5k6pDvS5u68jVIFNqP2IM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XjRu8AAWaKkMMByGTB9QNOvc5E4Wt0A/FSQmic9t20wXj3Ezs1Y1VG1ypIgg5Ar/jrZuD9ss3OuD+mX/SieJqvDPcn31XFMyKYkAa79c/jIe6oD2wuMfwAyKXKc1mQ6XrLw54w5cWIcyyPpq9ax1qoPfLj6bBaAkmlvuB0UR8BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=OhdJsb5x; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="OhdJsb5x"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QYqbefmWdjRF0eyXJkV6gfjuy2+CHVTcw8iBcm47t4o=; b=OhdJsb5xMAIh6BQVX+DeCByfdW
	HPFs0Bo2RdnyVb/MhR4HC+5dpQbbWBr2oWvfTMoyFNenaJUKsFZm3b2gmN6HtfF8J1iHVTjpWGfS3
	+Uxj/JH7+KXPlnq/KzSx3y6ToUAtYSsRNiCwpMNBaxe3HvSkjB5J4CeiIgNuXH2S0X43nK7p9Wz+9
	H53O5Q+15/sVI5xNbAQMLCOqk98OON0gucdIKVKZ4l1pgoJMP05UHXVINRuCJ55eA3yjq0lkN5329
	83WXkpxAbtpOTYOc9wOH/Ra5X0yaeIhO5dD53o8SoN6nvGZcS3T3Af1xS9akjd7vmugSCTcoKIYB9
	ZsSHWRPw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xHgNM-005wTQ-2n;
	Fri, 16 Oct 2026 11:45:29 +0000
Date: Fri, 16 Oct 2026 04:45:23 -0700
From: Breno Leitao <leitao@debian.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v4 1/2] workqueue: Make alloc_workqueue() unbound by
 default
Message-ID: <atICTHEvXbR2S-5v@gmail.com>
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
> +	if (unlikely(wq_unbound_by_default))
> +		pr_warn_once("workqueue: %s is using neither WQ_PERCPU or WQ_UNBOUND. "
> +			     "Setting WQ_UNBOUND.\n", wq->name);

Why do we need to warn here? With this new approach, shouldn't users be
able to rely on WQ_UNBOUND being the default and leave it out?

Thanks,
--breno
