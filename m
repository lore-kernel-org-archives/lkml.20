Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D98397E86
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345909; cv=none; b=Y2s3nSfmqFJMZkzQ5oBjhFRpnVY1BzH/hQGQx8QGRkpCYcQJWHE6pfpbXDzKp1UoO3NDk9dzWmrQOBsJRXL8Yf9juZuWh4AcfwKmyyI4hcaKPM+MW+n/3Scwb5kCmllTEyq0mk7i8URGPJ+F1F5qow4y5qpKzrjphwvrwQjItx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345909; c=relaxed/simple;
	bh=bNy+MkD4VHSCRXc/Xi1sTBqw/+WFYJipvQY5fEq2S58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a2ET/ek5+LGCxNeHoCcY6RMf2azIpsvlxMxnzukjFgmp+qply03lUyfEm2U+/Z+EQH64kjXLxUB1UuGYa3LZkYMYakYNklhDEQLGnojaZ+z3ASMnQoTou7/rJQHGEGbYnhXpElWgu1svcG8Z6QqqXD2GT+taBG0CFXLjwI0TiXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id B1AFF68BEB; Wed,  2 Sep 2026 12:44:57 +0200 (CEST)
Date: Wed, 2 Sep 2026 12:44:56 +0200
From: Christoph Hellwig <hch@lst.de>
To: raoxu <raoxu@uniontech.com>
Cc: axboe@kernel.dk, hch@lst.de, kbusch@kernel.org,
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
	sagi@grimberg.me
Subject: Re: [PATCH nvme-7.3 3/4] nvme-fabrics: add helpers for subsystem
 and host identity options
Message-ID: <20260902104456.GD8206@lst.de>
References: <29BB44C32FF06823+20260821062142.1932160-1-raoxu@uniontech.com> <450E21059686C852+20260821062529.1936914-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <450E21059686C852+20260821062529.1936914-1-raoxu@uniontech.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Aug 21, 2026 at 02:25:28PM +0800, raoxu wrote:
> +static int nvmf_parse_subsysnqn(struct nvmf_ctrl_options *opts, substring_t *args)
> +{
> +	char *nqn;
> +
> +	nqn = match_strdup(args);
> +	if (!nqn)
> +		return -ENOMEM;
> +
> +	kfree(opts->subsysnqn);
> +	opts->subsysnqn = nqn;
> +	if (strlen(opts->subsysnqn) >= NVMF_NQN_SIZE) {
> +		pr_err("%s needs to be < %d bytes\n",
> +		       opts->subsysnqn, NVMF_NQN_SIZE);
> +		return -EINVAL;
> +	}

I think we should only update opts->subsysnqn after the sanity check. The
current code doesn't do that, but we should use the chance to fix that
up as well.

> +	nqn = match_strdup(args);
> +	if (!nqn)
> +		return -ENOMEM;
> +
> +	if (strlen(nqn) >= NVMF_NQN_SIZE) {
> +		pr_err("%s needs to be < %d bytes\n", nqn, NVMF_NQN_SIZE);
> +		kfree(nqn);
> +		return -EINVAL;
> +	}
> +
> +	strscpy(hostnqn, nqn, NVMF_NQN_SIZE);
> +	kfree(nqn);

This already gets is right.  Also does anyone rememeber why we handled
the host vs subsys NQN so differently?

