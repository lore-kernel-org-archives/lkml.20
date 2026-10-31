Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793424795;
	b=jBdj5nMoyC3WKgq5O6qcYGSgesaIb13ApiRidPeH3RMHAGx9LjDY4yG7jep7G3aOmkRp
	 TroUMeCtJ91xx7Apm+hjE4/tCo3tjrnFWZMNb4fg0BrMWSx5X3nEgdd30LCBe1+ghPtzS
	 /5FQspZghQFyCa5txKBnf/OtUy3blAIGVyE0DyidMyDzYTpoLwihmqAXQQbqVBeMctTX0
	 H1TtoIT5N9Qacja/9x64/nrRZokeIUwHWqaU0ciSl9R+E5rxggzdAvp04pd/On4bc3dXR
	 /A60upsc+uGbkrr7fgiYgnV5kpsViBOKNMFDLfmel8Cf1mtF4vJFy16ygLuRhXcV6+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793424795;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9hA0RtygbyeBTKIUbR1UY8pw3tFoRbmfRyYcN+7ussM=;
	b=o/R+BFslBrzQngjY5RQD0Y/OlfxLTX+jp2BqMlXt/xb0rKKWdkohOq3jEnOFpP/uHxT3
	 7RqIOQDkVaerQ0X9ir4ImDZefOd7h73sM9+UTtj6T0wLL3hVDX4rh77bJ4Le3NwwlokQA
	 OALYx0LydcQu271KGb2+njjymOt+/aCNZSGZ55o5wDt8DnIbjRBRK6UuXetU9lJgtfrwN
	 zPoTn9poNDaBLuHhBZIknTRwlFXQ94T16jsUS66hywbRJZqthihbvJPka111GfMGF5lCj
	 qlvP68gNZIji1FVZkzcGgoR0Bi5C3bd8jKzfSmIRK8Vc4m9qhRYSk51ip9PNHkMkA6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=VZ6gfXv5;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B43606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 05:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86B43606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=VZ6gfXv5
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 86BC640E04D0;
	Sat, 31 Oct 2026 05:33:12 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id CWBewB1VTMUG; Sat, 31 Oct 2026 05:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1793424789; bh=9hA0RtygbyeBTKIUbR1UY8pw3tFoRbmfRyYcN+7ussM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VZ6gfXv59RUewNMWGMmoakQR96OO0EDF1/Yc3XaxwlJHDsC8KOHnxmTtF8YfuMydC
	 XZaQ9dNzc8yMTe7XFbjZJC0nvvXghM1iHD55jufUW9FEckACYi0WSt+bqaK/dzJ+pl
	 c6UU+Ocea5C21hvOUOmqhTO13EpIIwioAc4u2ofKYmkeqKUhBFvb/Eoxo50oGqzIJu
	 ffNShgGyAtfSQQEuBd3hfuIDJ00caat1abbBuNXHAKgjLIvupEccShq9Xx23u5PB6S
	 /0GJ5xGblAdexFf1V/wpqlQu8/dKpTY9lR5EwwdlH2rCTuaE4hbVNAwb/pHKfsptSJ
	 3qgqfpyjVoCFFXiD0i7RyymfWOIP1suvuvH1LV04fm85bw1oP9OrhlYyORqik1F4UD
	 w4odYvyEb2ycNVbAObDsQQwjAmbi1Q7kZEDOTmOc9EOXgwc7Xlw+IvKfIP1MKchngP
	 o54e5fcGYPidwodDXrMjSp901EL4GdnqSWVCAzENBKmCuu8sdoZOh0n1ZciVa8riIM
	 uZvZeVoGIF+NyB5aofJH9tVdcqRsLflSCfKfv2cfI7KxUTKnF4ZxqyI3Qm7XecyEZ2
	 2pwkzpneYVk0WyRMrRcXv0ivGK9sqFsLNL26dn+FI0q73+ChbrAYo78cMYjtp1iUDq
	 a7XiE63P1R0FLsDpdY/T/fEE=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id CD04C40E03BE;
	Sat, 31 Oct 2026 05:33:02 +0000 (UTC)
Date: Fri, 30 Oct 2026 22:32:59 -0700
From: Borislav Petkov <bp@alien8.de>
To: Sohil Mehta <sohil.mehta@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, x86-ML <x86@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"Luck, Tony" <tony.luck@intel.com>
Subject: Re: [RFC PATCH] x86/cpu: Change AMD uarch detection
Message-ID: <20261031053259.GKauV9i_VyDoLdMlwl@fat_crate.local>
References: <20261022040047.GDatmKb9L_fwqBGQ0_@fat_crate.local>
 <auDBUQQ9Ympsobkh@google.com>
 <20261028044653.GBauF-PdTS6gsOOozC@fat_crate.local>
 <auIBRhu4Zs3UgsQ7@google.com>
 <20261028153458.GBauIWIhGKCYhaxl2_@fat_crate.local>
 <20261029175611.GEauOIu-Xi9_DGVXKe@fat_crate.local>
 <2a6f9c90-a6a3-4b4b-a77b-9a3b99d66d4a@intel.com>
 <20261031015500.GGauVKdGNWuqeo0MG_@fat_crate.local>
 <c9984c6e-9829-4e47-a1d1-50886ad9a83d@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c9984c6e-9829-4e47-a1d1-50886ad9a83d@intel.com>

On Fri, Oct 30, 2026 at 10:08:34PM -0700, Sohil Mehta wrote:
> Is the thinking that we could make x86_uarch work with all the VFM
> macros?

No, x86_uarch is separate. I'm using it because I don't want to waste space
unnecessarily and this was a reserved field.

But it probably will have to be a separate member for you, if you decide to
need it because, if it is part of the union, it will botch x86_vfm
comparisons.

Oh well, we'll cross that bridge when we get to it.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
