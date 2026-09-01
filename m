Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A774570F8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247384; cv=none; b=SYvl2jfTXc8P29E1bj8bQ98umnwJFjmVy6M5vALSzk0ZQ5HJlJ9sjK1NkKrXTMmVIj7PKhRwYxRJds96cVgsVdJ5JuLQ72KX8yW+ddS8bi9KGOzEemux2WnB1uPewDOMb90dOB70JZqw7wGSNU5wqYP85gt9tZ8xgZ59SCpOba8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247384; c=relaxed/simple;
	bh=JB1VZC+psDUyqIG3dP7N6WDdCIl5oIwjuNbSOeJpUvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hAfkioNQwbtaWuz/QJEsHXdOE92WVJofe/4p4lakV9K9yOX+KEUBj4F+ysFBkuQwWcX5Uy/BLL9Pz5yU4wKo+SuthndNSDO8HD03dZPrMvDmtsI1s8a1ruGdqt+jgcrVtna1aOIHuFnSfgg+hl5xW1ZW/DFcvcVAc0UhpgxqeOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DWR/jrnS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DWR/jrnS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 158CC1F000E9;
	Tue,  1 Sep 2026 07:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788247383;
	bh=Pe8F/Y/8QTfgkrG5uLMZ++MudMQRDOd3PvSYxZZEGWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DWR/jrnSDZPJp1eP3Dcm6CayOzYp/KAXxWB0n2EksMZsUuFGu9uVY5oyvcy+ZbJL7
	 Uzz3xswuG0IQXDkN9EYXewSBC7j8OGGx402znSNjpbZKampBiPSgfolQuRxNYcckGB
	 Cd+c81aKQ3VAKiJLAqRKqVymqRMhFoT7/5v6Ac/4KndtR7YZIMGZy/Jv5r5A5IN0IW
	 MNrVfGAfY7xVD6Owz5MOY1Meed+frmhz0ER5McFlaMQAL49Ywb4yyV+jO2/LAxN3vj
	 OIyXUvndkeZ2KmxVH197YyfClgy08r3LxBLJfetI8MJg7OF5lA9EZvcdUGI5BuI3hq
	 0isKt2AMGFuSw==
Date: Tue, 1 Sep 2026 08:22:59 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Carol Soto <csoto@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	mochs@nvidia.com, Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH] firmware: arm_ffa: Unmap Rx/Tx buffers on shutdown
Message-ID: <20260901-nimble-uber-walrus-7a3ac0@sudeepholla>
References: <20260818224404.3694580-1-csoto@nvidia.com>
 <20260819-aromatic-albatross-of-virtuosity-2406c5@sudeepholla>
 <c5f0fe8e-faa2-48d5-b6a1-370ba36b19bc@nvidia.com>
 <4436a4ae-de40-4355-95b5-f5104ad30dd4@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4436a4ae-de40-4355-95b5-f5104ad30dd4@nvidia.com>

On Mon, Aug 24, 2026 at 11:33:08AM -0500, Carol Soto wrote:
> 
> On 8/19/26 2:13 PM, Carol Soto wrote:
> > 
> > On 8/19/26 2:08 AM, Sudeep Holla wrote:
> > > I had posted a single line patch here[1]. The original
> > > author/reported never
> > > got back.
> > > 
> > > -- Regards, Sudeep [1] https://lore.kernel.org/all/20260729-nostalgic-accurate-raccoon-ab7d7e@sudeepholla
> > 
> > Hi Sudeep,
> > 
> > Thanks for the pointer. I tried your patch from [1] and it fixes the
> > kexec issue on my setup.
> > 
> > I also tried limiting the shutdown patch to just RXTX_UNMAP, but that is
> > not sufficient here.
> > The next kernel can still fail notificaion setup with:
> > 
> > ARM FF-A: Notification bitmap create error -13
> > 
> > So I agree that using the normal FF-A cleanup patch from shutdown looks
> > like the right approach,
> > since it tears down the notification bitmap state as well as unmapping
> > the Rx/Tx buffers.
> > 
> > Are you planning to submit that change to resolve this issue?
> > 
> > Thanks,
> > Carol
> 
> Hi Suddep,
> 
> Just following up on the FF-A kexec issue. Do you plan to submit your
> shutdown cleanup patch, or would you prefer that I send a v2 based on that
> approach?
> 

I was away for a while, I will post it as a proper patch soon. Sorry for the
delay.

-- 
Regards,
Sudeep
