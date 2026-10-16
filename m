Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF494AF691
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163792; cv=none; b=oBKzbyVs+ZGn+xuApvSdnrVg2oAUMx+oQ7I8dZpve/FOWkkH6K2DCYQ3nDA8ozC/m7rifAi0At7SeK5xxqEDvhk6E6k4oqNy+8Cf0dZX7LHOpC6WSZnWFuhO3K1PdY+N9Lmum9ZVQQxZBLcwOu2YIkQL38P5dNlZV8OVn9ekXow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163792; c=relaxed/simple;
	bh=SnsP856WH9EN0f8rzBZpUY00WIfcIXC9VKNA7HXRXR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cc+hWV9/50/zy566I82vVp1DrEzyJ26CeDvfqj3Iv2PEJbHa3h+f5BVObC1SciG1siS3NmtBBtC8LSPhJoGp787rkhR6fhGIZjwa0Fqgn1+yqxz1eGzChSXKOUeq/VRAbnQOJBfmdRbrC/7WoPgyLqlBj57UEjXZMUWIFgUIr0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=IMEJ2Kmc; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="IMEJ2Kmc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xjddH5Y+fsofTaQF3xJna0LdADuPzouwrn9/ok9D37M=; b=IMEJ2Kmc/2fhFDOtOYbpdISPnI
	u1K/3bKq9qK7os2R/z8zr+ziF4Dq5Be0vqqQX01bCUkio45IibcbcExX9BVmn7Bha4MHuN7Wof56+
	obHT15uWuw4H7mSxwOPN8PJS36WaNq3KfnwEtN4B5mZGUQ2b/gn/NGH/5JGbpyc2inRFHprrttlUH
	WOz+qqO/YqeOe6zb7gm8SZWqiiTTjKXOenpH0TCzYK1Dfg0zU/ELEfJh/eLO8H+6MYEEw+z4+p6wU
	dexrk7tMbaYsd6tzt2zYvGHFYHPlel7uOLrO88eVFkfZtmnelBas6HSkKTRHZBNFPoLOuExRUr1RV
	m5tOsgRg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xHjfY-0063WF-0k;
	Fri, 16 Oct 2026 15:16:28 +0000
Date: Fri, 16 Oct 2026 08:16:23 -0700
From: Breno Leitao <leitao@debian.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v4 2/2] doc: Update WQ_UNBOUND and WQ_BH documentation
Message-ID: <atI_vcVR6-CcB5M4@gmail.com>
References: <20261015140148.231126-1-marco.crivellari@suse.com>
 <20261015140148.231126-3-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015140148.231126-3-marco.crivellari@suse.com>
X-Debian-User: leitao

On Thu, Oct 15, 2026 at 04:01:48PM +0200, Marco Crivellari wrote:
> When WQ_PERCPU is not present the default behavior is now WQ_UNBOUND,
> so update the documentation, reflecting this change.
> 
> WQ_BH workqueues are the exception to this rule: they are always
> per-CPU and can't be unbound, so WQ_PERCPU is implicitly set for them
> regardless of what the caller passes. Update the WQ_BH section
> accordingly, as WQ_HIGHPRI is no longer the only additional flag
> involved.
> 
> Link: https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>

Reviewed-by: Breno Leitao <leitao@debian.org>
