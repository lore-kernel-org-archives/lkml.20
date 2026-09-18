Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA97325C818;
	Fri, 18 Sep 2026 20:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789762216; cv=none; b=TgtarRD3lRkW+VqgjIEgXeCE9Kvk6EAx16cLxFXeZr8OkcnZUVW0PTj0j1qJaoQ1b/cs77zIUsz3447hVqCTUJCcKWkaxF/IBzusim6KkQYixm5CUcp5YyTe/EvDaYfQadnpSgWCvBbNtQfY6VK4juH+c6Os9yHtRAt1kYpjYyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789762216; c=relaxed/simple;
	bh=5PunqGU+h8hp5OvaViYJT7FIfIMZoaFbFSEBXLk2g2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QaCYM1ZJF5bEbLdMhOeAl/Yhhg3h1vsWTi8CyLhvvRrYVxI84PdGZ6b50z4gAfZZMUWL6gSKNs3YYRmSCG/5Hc0W9ppWupPsvtbPY5e6iaWS/JdujGPSGFi2Z7aeKWqG8fKeX1Fv64jJPAfk11ud5dXsBsSm5zVcR4qyGc+71dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Db7G6tmb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Db7G6tmb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37D441F000FF;
	Fri, 18 Sep 2026 20:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789762215;
	bh=tmOXqQV+7zVBgHMuAkBfRfzCHNcoIovuLaiy1KVB8YQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Db7G6tmb4SfAN4qnTR24wV4mqtFI4f1Ksr/Ht1LhOu46xSzN+Cj671vTZihTpVQKy
	 L3WUGhgdBLmUD9U6t2iSC2GLMCSLk2+8hNF2Cjt356+XgxtqVSOfEqDA8VYCE19a0b
	 MlS3cfLifn9yIGFtt2qmL83vC23525qCnwmptvOvAR1Hd/29fE+WtTFQ8yL51dyjaA
	 YqKd4APIc4rSLzONjEdvbeQ89Hm6+BXmoZSWOAqi/e496bFVi/XYyomNvLUPK0t6YS
	 LDy5CCmQaC+gEG51cBDYqAofdUhjbCrPE+Z6oyLdL+iWRcOhQ5P2jcqowaMl8O2nxG
	 MMdl1nHNxSS4w==
Date: Fri, 18 Sep 2026 13:10:13 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 5/5] riscv_cbqri: Add CBQRI capacity allocation
 platform driver
Message-ID: <aq2apbFvv5mSPc82@thelio>
References: <20260917-dfustini-atl-sc-cbqri-dt-v8-0-7964e8d73fe8@kernel.org>
 <20260917-dfustini-atl-sc-cbqri-dt-v8-5-7964e8d73fe8@kernel.org>
 <20260917171116.1AD781F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917171116.1AD781F000FF@smtp.kernel.org>

On Thu, Sep 17, 2026 at 05:11:15PM +0000, sashiko-bot@kernel.org wrote:
[..]
> > +	ret = of_property_read_u32(dev->of_node, "riscv,cbqri-rcid", &rcid_count);
> > +	if (ret) {
> > +		dev_err(dev, "missing riscv,cbqri-rcid\n");
> > +		return ret;
> > +	}
> 
> [Severity: Medium]
> Does this unconditionally fail probe for valid monitoring-only capacity
> controllers?

Yes, because this is patch is only adding support for capacity
allocation.

The hardware I have access to only implements capacity allocation. I
plan to add monitoring support in a future series - hopefully with
feedback from vendors who are implementing monitoring support in
hardware.

Drew
