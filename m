Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AA23FBB4D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789710894; cv=none; b=aIZYqoxWR5ytR8hG0U/PaalkhcT18STHn/o5fEE66OxazIxvz+Xe05z/IJfJbMYt1Gj1gymBJnPgzmc8NKp+KGNTJyb61RKaLjgeoSdx5OO8+obgCn6e2A/UPwXUhNx6pNzPquXyjzw/At/CPZ6NbbtLtHur49X6YgmsmDZKWZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789710894; c=relaxed/simple;
	bh=zrpDkUQfMRHu0Us/2fqfv8LqW+wKZbN/oHOukJzfpXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXXsgOcYwwuzYz4AXMGFfjrK+bAaQSpkKPseMxPcGnYGEE5wjn7LD5A2cJWi7VYprxJ0p06XMvkUZhV9wdtyHTCiKetAXbbFaesey2S75tcR5QvqGxMpEE36LRoonNjqXyMYROCDNyFCHUbvMNdFqTzgtArYHd6GQsenaGpLVrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=DBk75F8t; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="DBk75F8t"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 9A90240E022C;
	Fri, 18 Sep 2026 05:54:41 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id i6yDuIx6WCdF; Fri, 18 Sep 2026 05:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789710871; bh=pSpxYod43eZw4CXX4s4Wm/tJB/z5NfsUGkSXzuduo3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DBk75F8tI4cYYE37kq243QoW1mkQEvXzmNDB+Zkx+CfRpt1srio76Two6jOnZmIfR
	 KsheWGpuHDzNBs2+q7BI6tDwBiGlSI8VByLyjTW8d+CaPUd6Yw4g6rFuuzP3NTndSR
	 WZ/nzjAXmS8I27ZhNgFz+zdWnPvz0qy7LPHToy9nn3EqDu19axCW9tJiS3JoKi0dQk
	 SDzfIApluv16fyMU6bHg59t7S1FhA5xe6kWl6EBST/l++izRio96EzDK+U7bmiGNL9
	 wTU1Omi9CNW8NNMyWnwzw6D0M9vY7ZDz89NF9Fi+yh4mL1mmzBJcPTnZtSusG1+HN+
	 9xAaCFvgWGGk4rB/o3+Gy2P53fGCAtIccg8mqFxVpZ+U3yXOyVZMXgt2x5LGtA23nt
	 otr4ZIRZ4Vx8q3JH6QdoGnpDSby/bldRg+dysedrh1SvRUsgwhLHMWSh/uvUADPNed
	 3aSZ/FboFVv4IMUy3Va67R8JrhxHe5oeNcu0nQK2DB9v8FcIfY4m/+LQqwQlca5qUc
	 RyXE5EKzBadv2+ValnBkA0UV2nhUT3oLKsgCFgx1LmFOFwj+38yvWRXcVDvQax+HSq
	 /nJTe6fk23T5UA7TYm+UHy8e0paIKUhnjiut7TddOsIwssU984UKDHGw6m3SCx/P7Q
	 l27/Hu8jdE4p8hAIFv7iJL3I=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 360CC40E00B9;
	Fri, 18 Sep 2026 05:54:27 +0000 (UTC)
Date: Thu, 17 Sep 2026 22:54:23 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Aithal, Srikanth" <Srikanth.Aithal@amd.com>
Cc: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	"Nayak, K Prateek" <kprateek.nayak@amd.com>
Subject: Re: [patch 5/5] clocksource: Rewrite watchdog code completely
Message-ID: <20260918055423.GCaqzSDxu2xBB-aXK0@fat_crate.local>
References: <20260123230651.688818373@kernel.org>
 <20260123231521.926490888@kernel.org>
 <20260309154317.GPaa7qlRzYcQY1dBU3@fat_crate.local>
 <87pl5are5q.ffs@tglx>
 <e4a41d43-4d60-4132-aa2d-70e038a3e9dd@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e4a41d43-4d60-4132-aa2d-70e038a3e9dd@amd.com>

On Fri, Sep 18, 2026 at 09:16:19AM +0530, Aithal, Srikanth wrote:
> We have been seeing intermittent early-boot guest hangs in our CI for some
> time. Guests stop making serial progress during the first few seconds after
> SMP bring-up - no panic, no oops, no other error messages the vm just hangs.

Please enable CONFIG_CSD_LOCK_WAIT_DEBUG and run it again. That might tell us
something more about what's going on.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
