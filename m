Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693751;
	b=e8o3lr739iE6QSyQKCwk3ElrzTx+/BOK5G1kEeVWNsSwg/F2MdnMqfW0EPjrsqGYDFus
	 tsXojBQnguyXTmQV2VUiVzBPxgCBVsA4MK8Ogt9+sXaEeiZknOJ+g9s+x5z8aj00+wlw7
	 zCJp3CotG2RlOYR5EkjGQuG3iGRXYiWt3JQYuhFYTnmQPI0Ig79fNGYenr3aw5JiNS0fr
	 peMSGgFYteyxp8yBWxegVcMPoOa7r3jUiO15FZRL4zWQ7spl6Xrk4jREjDObHvdhKzcCs
	 yGt8bfNi3e9L/A42uJSQdGzZpUBMchSMiBWYxezmwrp4xTR6caEemIrvdLse5pJdLrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693751;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=VVI2BEPcphI98oQDYKHMPWx770bBBVfS5vHEb2ZMpdw=;
	b=m5EjAgPgQ5ONY9jlv/oscPnLknHBLml7nOd0bCi0LwWfSIo3mrd8iueb1UGQqzdP1Kbt
	 zdxHU2HU0I20+b41oxFT2IAugUFA7pA7n4hqWzcgXj1agJlWR3KeItL0tzfhNINukp09I
	 /JJB8ASFQLE8s3gBDsPSivRrXc86DVCoO+HDcAsMdACSDuIqnoOfzci5FpCrVISmrNGbk
	 4eHuDkq3VAJS/bjk9lkbM+uLHO8akseb/XnWST7e5MsTFIqYA+HTDQLY4U9nejvDhDaUN
	 7RENp5OW67kGYGKkgVp6N2dnW0kcMwdJh0yLE646x1K+Xsj/SrCDhxV0v7fAJ81fTtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0544A606A32E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:15:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0544A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 8055868CFE; Tue,  3 Nov 2026 09:15:47 +0100 (CET)
Date: Tue, 3 Nov 2026 09:15:46 +0100
From: Christoph Hellwig <hch@lst.de>
To: Qiliang Yuan <odys.yuan@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvmet: drop the extra RCU grace period in
 nvmet_ns_disable()
Message-ID: <20261103081546.GC4301@lst.de>
References: <20261103-bug-nvmet-ns-disable-rcu-v1-1-ff7ac5623923@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103-bug-nvmet-ns-disable-rcu-v1-1-ff7ac5623923@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Nov 03, 2026 at 01:31:25AM -0500, Qiliang Yuan wrote:
>  	 * Now that we removed the namespaces from the lookup list, we
>  	 * can kill the per_cpu ref and wait for any remaining references
> -	 * to be dropped, as well as a RCU grace period for anyone only
> -	 * using the namespace under rcu_read_lock().  Note that we can't
> -	 * use call_rcu here as we need to ensure the namespaces have
> -	 * been fully destroyed before unloading the module.
> +	 * to be dropped.  Rely on that wait for anyone only using the
> +	 * namespace under rcu_read_lock() too: the ref can't drop to zero
> +	 * before an RCU grace period has passed since the kill.  Note that
> +	 * we can't use call_rcu here as we need to ensure the namespaces
> +	 * have been fully destroyed before unloading the module.
>  	 */
>  	percpu_ref_kill(&ns->ref);
> -	synchronize_rcu();

This assumes the percpu_ref is never moved to atomic mode otherwise.
Which we don't do in nvmet, but maybe leaving a reminder of that here
would be useful.

