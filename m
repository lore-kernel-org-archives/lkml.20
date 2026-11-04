Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782879;
	b=MkNVfOEWRwbB1WZlTFLQ/VetpxZODYKcqBTFbfki9FJknQetCy6Loo7pkCYXyhvIbJ48
	 aSvn/Fvr579y1Yfi2bfwxwo6RnBpSOTZVgv/Oy23RTMXqy8xSS4o/m1jKhF9LHEoTDJqd
	 rDxGgFzTuQJ2Y70TUEjc22pnxFWuOZKx138SmigBHZcCSXiMEW70+4BqIAL078pnEqesn
	 G/rLJiV62Xgj5J5LeSb7RMDZSqF3n2uLaCDR2vTA8ux59qWWch/Yu6jYbnKPk2zgm5bxy
	 RZqAi7deuxMixL++RlT+e7w/O67oKzMU7Uojlf4IKUpiZyeDYJBOrWBwD2ysvguhWSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782879;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=Vq93N/5Fq7H6xKbEkagvllKvnuvaRbqOr62To/Bh3PQ=;
	b=ye7sv6G3afy4NcHug5l/IRaQNLQbbGklJ7l2EcWwQWnjR2HPuJ3IEaMLbgv5Mgiu3QHL
	 xIkOIDpxF5sDcvNqkEXlcgkG+K6rNJgIqYcjIfJwFajemIi909ACGz3wLxDpOfXu530/w
	 PiehVx1cPWMICdBNhKLgAu83zHbjUsUL1vN/WdxkgFhOYEp4N70urd5rMhqdicmWO7J6h
	 uRsXXDtYszZG20wJtUd0pinwwHDv6SZQa4aZ/BLYe73g6/M16BNsTxyv1YX4odiWlaGSQ
	 QfrbsDgXCDMwYEl7ek7pUOYwSNdn04CLfDfKIwa1oYDAV69EFyxjRAE70xdOkf64OkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491BD606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 491BD606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id F2D8968BEB; Wed,  4 Nov 2026 10:01:11 +0100 (CET)
Date: Wed, 4 Nov 2026 10:01:11 +0100
From: Christoph Hellwig <hch@lst.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Christoph Hellwig <hch@lst.de>,
	Robson Cassiano <linux@robsoncassiano.software>, kbusch@kernel.org,
	axboe@kernel.dk, sagi@grimberg.me, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, Alexey.Bogoslavsky@sandisk.com
Subject: Re: [PATCH] nvme-pci: add NVME_QUIRK_NO_SECONDARY_TEMP_THRESH for
 WD SN740
Message-ID: <20261104090111.GA30750@lst.de>
References: <WnzOhxjlW7w5jwpSIQmUzrvduOStpoX2h3FS@robsoncassiano.software> <20261103075845.GB3882@lst.de> <b0824cb9-e678-4bb3-934d-a1743b164ca8@roeck-us.net>
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
In-Reply-To: <b0824cb9-e678-4bb3-934d-a1743b164ca8@roeck-us.net>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Nov 03, 2026 at 05:31:29AM -0800, Guenter Roeck wrote:
>>> Mark the controller with NVME_QUIRK_NO_SECONDARY_TEMP_THRESH so only
>>> the sensor inputs are exposed.
>>
>> Given that this is an older device I suspect we're not going to
>> see firmware fixes for it.  But given that we had quite a few devices
>> with issues like this, I wonder why nvme-hwmon can't detect these
>> obviously fake values instead and we could drop the quirk?
>>
>
> Question is if the quirk is really needed. Personally I doubt it.
> Normally the thresholds are simply not set. I see that with the NVMEs
> on my system (Samsung SSD 990 PRO) as well. If I set min and max
> values, they are stored and subsequently displayed correctly.
> That means, no, the hwmon driver can _not_ detect if those values
> are fake because it can not distinguish "not set" from "not really
> supported".
>
> I have not seen the patch, but I strongly suspect that it fixes
> a non-issue, unless it can be shown that writing the values has no
> effect.

So should we drop NVME_QUIRK_NO_SECONDARY_TEMP_THRESH entirely?

Robson: what kind of adverse effects do you see without the quirk?

