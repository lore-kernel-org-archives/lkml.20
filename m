Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555B647ACFA
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131092; cv=none; b=ljUrTkzEg1aqkN1LoReqC7wpSiScw7OuzCmEAFSfYjLh260SUXb9HcPztxIjYt6f7LyRM1wPXZsy79UWEOn/lP62Ml+jSwQM1bcXoTuzWWv8U2gtfRnQvFJhdz0gvnTLn1twJjnjl9qxgip0J8pTprlybwDP2gvwTKOKmPH2a0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131092; c=relaxed/simple;
	bh=RmX6MDJTHl/W1UhzvbFIdzTggc2Ag66li1SQChQQnAs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TVpfG5OAoTG6EGXJosiySxLZIODU73+NarR+Id3xe7hie3e0HPonWJEAJYhrHMca39iV4oN+bMYCanuHaOEZcnHDUAO9EWhlw578l89FHBINxDz5BuMLUdq9rU/5Gc9lg/0J83B9PFxZXASOehEBtm0pl54BxK+bNPb/n3rG1Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nhVHNeXe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nhVHNeXe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C791F000FF;
	Fri, 11 Sep 2026 12:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789131089;
	bh=L6lE1EAVme9K6pCqS7gI5scnwsX5mkLIotKYFpS88Iw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=nhVHNeXepF5HVjOnbpiQEB4RvBUexbLFtHnapxEL3HM1HfdlvquhnGjQWhuVLN7vs
	 5oE+1efe6qVTTHIZ8yoKVZw5EqCj/R6zXtkfpvLlMSC13mc85mUnPpRuvXHaASrTa6
	 YPYKhUMue0L/vXfKoDMeQS+VOM87BwrtSZp4KsUjyv5VvXMHM5MegKH59W5KLDzWjv
	 IzA4YMUYU7YAYBVzYqGpV4fmXN4/qP2PojBZxlt+drhg4WjccghKnyxqqtrzTBQ5nI
	 T+qXpHDz6ANvXiIq8t7MNHVJ9yEKSpeCjK5J09+F0W8w7XsVEyAIgDl1lrEuWNbyP3
	 D7mXUXQYPSgIQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Grzegorz Jaszczyk <jaszczyk@chromium.org>
Cc: linux-kernel@vger.kernel.org, dmaluka@chromium.org,
 vineethrp@chromium.org, chuanxiao.dong@intel.com, Grzegorz Jaszczyk
 <jaszczyk@chromium.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Eric Dumazet <edumazet@google.com>,
 Melody Wang <huibo.wang@amd.com>
Subject: Re: [PATCH] x86/apic: Switch to x2apic driver early if x2apic is
 enabled
In-Reply-To: <20260910090512.1197517-1-jaszczyk@chromium.org>
References: <20260910090512.1197517-1-jaszczyk@chromium.org>
Date: Fri, 11 Sep 2026 14:51:26 +0200
Message-ID: <875x0cymr5.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Sep 10 2026 at 09:04, Grzegorz Jaszczyk wrote:
> To prevent this, check if x2apic is enabled in hardware during early APIC
> call setup in apic_setup_apic_calls() and switch the default APIC driver
> from apic_physflat to apic_x2apic_phys immediately. This ensures that any
> early EOI writes use safe MSR-based accesses. The driver can still be
> upgraded later during the normal APIC probe phase.

That's really the wrong place. Initializing those calls has absolutely
nothing to do with the driver probing.

There is quite some historical ballast in this whole APIC driver
probing, which I never came around to clean up.

I'll have a look how this can be done sanely without replicating half of
the existing code just to paper over the real issue.

Thanks,

        tglx
