Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BED45041C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 19:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788548734; cv=none; b=eDIQeh7S0xKzyC9JyZ46k0ey2FZKFWub8dV02b/rQogcxfrUm4FnlFxpYFm/Z4aWB9adW4W5+ewnx5Pl8xe+4zKDZ5ATFQN3l1ehPUe0aNC2F9/XMiBMuQV+peTBsqkNlqJsnIw71otV5zUT2O4WsocVpULJDkXjt2vMevzG8dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788548734; c=relaxed/simple;
	bh=kH7UMUtXXI7733fIMTtbX+a83BGaTXlmYpNtWD6roKA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nYIiDvkBZT8GOYbKHyC+PDKsJ1YXNHVqq2mwwgwDPxnzokUZpPMxMcuaCCJiSpJqCJypG78qEzP8PsWMCkA1lkxhggdHxW4DlobS2Fr/VzVoCege7xXFiljEl3MLEmX7U8mMIdMtJJOI/gmXLk3THGtmXzTPph6ZTXOXxpUs9Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ycd5IXNK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ycd5IXNK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF8A1F00A3D;
	Fri,  4 Sep 2026 19:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788548729;
	bh=l4oluV9/G9PLmnGfv2la1MKCSB8J0OiGBXxd3j3VdUE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Ycd5IXNK4bHPuKh+gT5Ap46UMg8aEB90bdfVskz8YERf6xl7OKbSEEwljwMmAlAos
	 J3Wfg608W3ojSTjndEC/duZnYDGFM9EtVzlvkycgIUsrIXMIjt3XTnLIPNPo5zm5JM
	 0rxjDfW/Yc8hvT5qfny9tMX0nk21v5z3ruIkB4N83olig/w3Pq2SHKoWOtIc17HrSo
	 ig6R/54RNpF0K37rzxzTw17le7laDHaD3xlVRoBCWJAu9LAqIoJ5m8xJK/xJqMiD0K
	 U2NEjOxbR1fvpB3cYbiyt1au2HLZ1uCdycQi1j73yloDJXVZRZvP6sgIKE7cwv4qyE
	 JR7SdPn5GGs6A==
From: Thomas Gleixner <tglx@kernel.org>
To: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
Cc: Farhad Alemi <farhad.alemi@berkeley.edu>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regmap: irq: Free the irqdomain we create
In-Reply-To: <87mrtw7sf3.ffs@fw13>
References: <20260901-regmap-irq-deallocate-domain-v1-1-4bfed4aff559@kernel.org>
 <87mrtw7sf3.ffs@fw13>
Date: Fri, 04 Sep 2026 21:05:26 +0200
Message-ID: <87jyp07s7d.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Sep 04 2026 at 21:00, Thomas Gleixner wrote:
> On Tue, Sep 01 2026 at 22:55, Mark Brown wrote:
>>  err_domain:
>> -	/* Should really dispose of the domain but... */
>> +	irq_domain_remove(d->domain);
>
> That won't work.
>
> The case which is affected is the one which allocates interrupts
> upfront via alloc_irq_descs().
>
> In that case the domain creation will associate allocated interrupts
> because info.virq_base is > 0.
>
> This wont trigger the WARN_ON() in irq_domain_remove() because it's a
> fixed sized linear domain, but irq_domain_remove() will leak the
> interrupt descriptors which still have a reference (pointer) to the irq
> chip and the domain. So the same UAF is still there :)
>
> What you need to do before removing the domain is
>
>      if (irq_base > 0)
>      	irq_domain_free_irqs(irq_base, chip->num_irqs);

Hit send too fast. That stupidly works only when hierarchical domains
are enabled.

So you need:

      if (irq_base > 0) {
      	  for (unsigned int i = 0; i < chip->num_irqs; i++)
          	irq_dispose_mapping(irq_base + i);
      }
      irqdomain_remove_domain();

Thanks,

        tglx

