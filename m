Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2ACF19DF6A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790744252; cv=none; b=SeEiYxdoCkOzoRnvfW48oU4y9o3aktIxkJGaB6KnHoYO7CYh6y/j7wpNXdwHDkR49FAgubz3cwxJrxoFDPGoLbYIYHU216NV5qkBwPKiFFCgQ07exwTOl+Xrf+5pgIOg0HVA3f74twsuVJmjF+7ZYLvjXjsri5T4/jSWLt8VWo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790744252; c=relaxed/simple;
	bh=WMz1SYY9AYH94SZQs17R30ijgQkCs3phclIAQsZcQhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r3bskikvkVtG4A8+qFK35Kc4c8JJvnxyaYnpJV6sCUuTbKCqS9nK7TnmzTFgI/bKckJRUNBIZvV70KE6XpcSsz4Epa0mNdNuij6E30FNteP7PI32wutStf6Z3rX+I4JmCOjgbVxqv8vMV0A4nPhT6HAFlyxet82eqcQg8tfqy44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=hGoBZmH8; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="hGoBZmH8"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 79BAF40E01F9;
	Wed, 30 Sep 2026 04:57:28 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id lVwx6KnDbyW5; Wed, 30 Sep 2026 04:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790744238; bh=DuJpJd+Ily4yKE8DDUsSgR4u7ibq0ab66LllZ+KcdFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hGoBZmH8LV0nH9se89RJqSjTQEsSC9CUThjzRdMZCP+GuBhLDPDBkEgfkOE1h5c3P
	 7ybt/rUGXV9Ol8ko6M2Rnbxv2M8vJU7HFkASlFXP6RnTILMjg82zcNKIJ3cdiJGtou
	 EOZKAotYhajvqpJL+tMqgN6076thMv8VFoVeWz7vWuGF5pZVcJJrqlKlkRn5AOU+YS
	 AXDUTXMInMI/R/axP2HThSvCBDYrRPaG79sbbhhYu+fGKeQV72je15AY2xQDilgYbQ
	 YZpThxZkLP5MBxkfEC94d9xbuIQ5km1YScd4f1l7ntsLwuN/k780X+09AFDtXIY3wW
	 pG9porCgy2Jw1x6iRU1F/IzoV0JfpuNP67PWxWjaCHNQZakRAZxOr9i24ULncwAeDy
	 r4qnNzQoF7Fx7VVBRy8TRu9HFK2sdRMh90r59T2rCxzK7NbI9bRZlhuLB7fMvvUMtc
	 mIk7O5JVaWI0ytYSGO7KFlvlH5UvBoAun5CZe9FmlllcuYozBTELl/4rMh5UAo31tE
	 yEgczbDbeGrClGzbtHORbq6ASrhCat+wqV7kNn6/PPakve9HNmnaDwCEm2LMwRWIId
	 PQfjkgyvpxKffLlwiwbDGhOe6Am7xu9kUF94jSzkV+p+Rd+cRSDQ4Kg4r/dCUDlvpj
	 PjK5JmEKJ/63VRXSxCPsG03I=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id EEEEF40E015D;
	Wed, 30 Sep 2026 04:57:10 +0000 (UTC)
Date: Tue, 29 Sep 2026 21:57:07 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, tglx@kernel.org,
	mingo@redhat.com, dave.hansen@linux.intel.com, kevin.shu@intel.com
Subject: Re: [PATCH RFC v1 1/8] cpu/hotplug: Allow architecture-specific
 primary CPU bringup
Message-ID: <20260930045707.GFaryWo1o5SAYwhs8V@fat_crate.local>
References: <20260912000815.997720-1-chang.seok.bae@intel.com>
 <20260912000815.997720-2-chang.seok.bae@intel.com>
 <20260930002010.GDarxVul0JZDam_-bG@fat_crate.local>
 <67b77f20-53f1-4b3c-8420-f125eaa0fe26@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <67b77f20-53f1-4b3c-8420-f125eaa0fe26@intel.com>

On Tue, Sep 29, 2026 at 09:44:55PM -0700, Chang S. Bae wrote:
> But, OTOH, one may also argue the loading scope should be consistent on both
> ends. So I think it is worth settling down on which approach to go.

Sounds to me you're not really sure what you wanna do but lemme get to the end
of these first. Right now it feels like a lot of noodling for no good reason.
But we'll see.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
