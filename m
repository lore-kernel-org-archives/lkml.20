Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793363011;
	b=WUOfbUloZ1GGszWZq0hhi0GVtDkh9TDTwqo5qSJI3B3nsBhhTOlp8s8Z9lMGflew2KVb
	 y/jcxaWpMUrgZH6Wzm3VsIcxT69PGNXV/i9IS3VsRzclcKy3Y3u3d9StMjwd/fg45CyGg
	 J/r5u9mC9OC9yt0GGdPWq6HsZ9HcD9hvFTzFUsG1F1lA+lzyvufn+YwhLO2KI5Zp76mnf
	 IUbm7xh/Xla8TCX+sGmSu+Tivy6k7alOtL9JHpR5Y6ABwYpP8D2DhVf4p603wC+z18v05
	 EWsE7XCFrYCZlPoV7Uod8dNUdSqpU/L8A6ux+m2Ffzd34phrm1kyKI95505++N+Bh0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793363011;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=6lG9R4lJJPALXaPZSnu7JMLL8FE4c58m/VBFEDfgMwM=;
	b=cHMt8sIacqoP6SWXH7NPIyTZ2mhhTLFRtR4eSTijjMhT/pKRL470k8A/MFDS+tEoiE2J
	 ypVDkoLq/lkIXgoQt/jS3fKU1PthonE8joCKSk2gwwKxIM3KRRp5xjzFvPLcBNJnm1LMb
	 XZDSruq+MRVmgHgIQ9NXaC/WsmiXHp+k1t3SbMnNH+e4C3fRvhccUUMGhJEiVy44qpJkQ
	 Ds+msF+U/bbNmiz3jzGKxZRWcLF7GGsy0XvaMwAwvt6O2o/DP8ewdSEgr2vrH7wq9loFQ
	 4GaRrKjoU17BNbbHA9ShdUFjQeNIKRMdDXwUiQFDkEv3rXwR15/OhkpVs5rbt0oxLIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CZXtbGi8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07709606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CZXtbGi8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDE761F000C1;
	Fri, 30 Oct 2026 12:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793363010;
	bh=6lG9R4lJJPALXaPZSnu7JMLL8FE4c58m/VBFEDfgMwM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=CZXtbGi8RUOcHn3Nk0VxGeJCgtXUC60eLfbKUaZmEDjndHKvUIm9tFHo++B1Ynhhb
	 hGunlzO2jAKFUDlSnFUfb5XwF/av7rwQg4KEcCQPO6YnWIRn7RZHMWdbr9kofx+kmh
	 tgiiF0rL4H9zR7bG59z+Ki8IXjV0Oy0ci+URtGCFyD25c8zMKDBUED82kW2MYopcfU
	 LWIL9OPh+QmsqHR7BcB0a6up+/jUVNqtkSgTh2hrRzEjrd+NURbTbYYJTG+4eufadQ
	 sc/XnkOgeqqJF45hHUo0142yyME3aOQcCClB0j7hE7VyZeHEDZNx9QALB6153ai9zj
	 SyzP2RjgtLqAQ==
Message-ID: <34280aad-a01e-4f84-ada7-c715b2958cb1@kernel.org>
Date: Fri, 30 Oct 2026 13:23:27 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] w1: use the bus mutex for the "rw" file
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Josef Bacik <josef@toxicpanda.com>, linux-kernel@vger.kernel.org,
 stable <stable@kernel.org>
References: <20261027-llm-char-misc-w1-v1-0-d2e6bfafb6a4@linuxfoundation.org>
 <20261027-llm-char-misc-w1-v1-1-d2e6bfafb6a4@linuxfoundation.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261027-llm-char-misc-w1-v1-1-d2e6bfafb6a4@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/10/2026 17:04, Greg Kroah-Hartman wrote:
> From: Josef Bacik <josef@toxicpanda.com>
> 
> Commit b02f8bede217 ("W1: split master mutex to avoid deadlocks.") gave
> the bus a mutex of its own, because the lock which protects the list of
> slaves is held while a slave is removed, which waits for the sysfs
> callbacks of the slave, so these must not take it.  It converted all the
> slave drivers, but not the "rw" file of the default family in w1.c,
> which still takes the mutex of the master to talk on the bus.  That has
> two consequences:
> 
> - A deadlock.  w1_process() holds the mutex of the master while it
>   searches the bus and detaches the slaves which have gone:
> 
>     w1_process()                        read() of .../rw
>       mutex_lock(&dev->mutex)             kernfs active reference
>       w1_search_process()                 rw_read()
>         w1_slave_detach()                   mutex_lock(&master->mutex)
>           w1_unref_slave()                    waits
>             device_unregister()
>               waits for the reference
> 
>   The file is readable for everybody.
> 
> - The accesses through this file are not serialised with those of the
>   slave drivers, which take bus_mutex, so that two transactions can get
>   mixed up on the wire.
> 
> Take bus_mutex here as well.  It also excludes the search, which takes it
> for every pass.
> 
> Fixes: b02f8bede217 ("W1: split master mutex to avoid deadlocks.")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof
