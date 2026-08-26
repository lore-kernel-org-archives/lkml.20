Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3364C4014AD
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762016; cv=none; b=Fd0J7Bi7DJ9yhZ/iijc2rXdIp6zSyKeKfzIuYY2FwI6Gm+oP2fCNTp2SWeApbLt4Slu//vzkjW9CXMEmKjWyd6TpVln61RrblAo4c1n6or506bjL8uXTIP6iTFYdIBbmgvUa5JzNC/bsf0z5UvGBXYzG6Kfyv5TynNfnG/Tf8Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762016; c=relaxed/simple;
	bh=YGx+V7pIQuOq93oL/Trcd5eZrbxtG4krlAi/6cB7TvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z+xpi7/WF/usyvE+g5r/htV/czGUelcKm6hy9bvn21vTYMYv9eCuWMBSTx8c+Y9GvwSOxQKVk99xbU3fVSt+T293A5vZRwWF28XCYPwhhymJ05ghoz1GNiu9OXNIKtJSOs+gykt8z3qIBvL+KghHzkRgwhtn6DqxS03YplwX+IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=qSRbvBVG; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="qSRbvBVG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description;
	bh=No/l19D9s4saMMwvc+NDYl3m7i3RYz2QsEHuCXxzN2g=; b=qSRbvBVGaoILQllBMB978Bxz/J
	ZEmZczPvS42EgX4aLy4c+LaUXBfmWAv6uBBqJXKl1RMMBThCeC/JAKegxIQtx+SzIaRHer9ZF9h+u
	82jNRmeDYk0jKoZ/u7VDMqBvV6QyFad6uKfxX184WwgLAn3xpUU3xfJtRFiwMW5FA1gPM8mChny4r
	PpKRpxPFLFW9s07PWGpVx3JOzktT6H58q3pLyjHSx5wtFx5n0rNTZdiEu9Y70jKv2JPtl7P0ApVPr
	DY+mK8OUIaQLLmYe/l7KLfQ9Bm20BX9rRaMgM4wrU1LJnUR5b5PuRJszMZqZPEHV2OzMOd7DAhtoJ
	VHOtndmQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wzGZ6-00FLYC-1w;
	Wed, 26 Aug 2026 16:33:28 +0000
Date: Wed, 26 Aug 2026 09:33:22 -0700
From: Breno Leitao <leitao@debian.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	linux-kernel@vger.kernel.org, pmladek@suse.com, gustavold@gmail.com, david.dai@linux.dev, 
	kernel-team@meta.com
Subject: Re: [PATCH 3/5] workqueue: make the default pwq optional
Message-ID: <ao8VMcX-_J_UtkfS@gmail.com>
References: <20260819-wq_realsplit-v1-0-6ad3c3f48be8@debian.org>
 <20260819-wq_realsplit-v1-3-6ad3c3f48be8@debian.org>
 <CAAofZF6fuXO-SGM1k9jeOA4SP+y01TKrcyb69MDVOXGTnhOMZg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAofZF6fuXO-SGM1k9jeOA4SP+y01TKrcyb69MDVOXGTnhOMZg@mail.gmail.com>
X-Debian-User: leitao

On Wed, Aug 26, 2026 at 10:22:52AM +0200, Marco Crivellari wrote:
> Hi Breno,
> 
> On Wed, Aug 19, 2026 at 4:37 PM Breno Leitao <leitao@debian.org> wrote:
> >
> > apply_wqattrs_prepare() always creates a dfl_pwq, the fallback a CPU
> > uses when it has no pwq of its own. This is a CPU unbound field, so, we
> > don't need it for the per cpu affinity version of workqueue.
> >
> > A percpu workqueue has no use for one. Skip the allocation for
> > a WQ_PERCPU workqueue and skip installing what was not allocated.
> 
> What do you think about factoring this code out into a new function?
> So that it can later be called also when a CPU (with the "preferred
> percpu" flag set) is isolated through cgroup. I guess the dfl_pwq
> should be allocated / freed accordingly (?)

Makes sense as a direction: once a percpu workqueue loses a CPU it needs
somewhere to send that CPU's work, and after this patch it has no
dfl_pwq to fall back to.

Thanks for the review,
--breno
