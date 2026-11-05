Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793902814;
	b=ujxWSPeCKS1HjCUlPaTf2NDMGEZCEkxVd+qAwS9ePflJXNo/ZhHs+eKC+V5xFz0aSUz7
	 cbP39l1FlTgcU1IwExQpBkHJOxmwT7ab3OF5hMGBH0u3vUdHdZ+DSly2iX7jOKA+StHlC
	 8NWWWQnOA30mvgs1aO5nx2eiPhVdU0hrG7pkhzxCFf5cgOdABnxTZms4Ma+/eBdf6UBSv
	 pVkenta5rVv1jORxsdYVjRkt6FoqdWiAua+yb4Fb2DkQC00TUwG/NcayJQB++dz/UaT91
	 TOepXMeiGF5O4Z090ORo0rTLUsxS6q4NwPbs7f+iOa+0HbmTq8I6/bbU8Y8Sn3cjgTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793902814;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=C7DFeRi067SwteKZbsvrNELKriQaTYft/5yfog67Pm0=;
	b=Lu5SwZ+mlNkPPuxQImbPijdvnQfvM5G2QExv+0ltw1qi5Jy20BAFUlzZN4pke03Vacw5
	 FcHaCslIsUAl6anya982AGR4gipm0vIAtp8DhGga+lS0KmOWP/CQUB1SH+HMd5FeO1MW6
	 AIcpxx04ZlWsh8Sb9JF0Cz0JjzWwWWk8Pl6hroekEblwWiPYK5s8inGpiwqKaBc/1ye1i
	 y365qG26NhvU5RqWxSpatLrHSVGQH+v1WmyC2KkWIxccO/5beYegUiRvUjkIP0Mt9F9Il
	 cJalTc6Oq4CDPTLiNMZDil7vgv/I5mNy/RQq0uthDA6bbHuglcJ2Xz3aj1yqDnhsT2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zytor.com;
	spf=pass smtp.mailfrom=zytor.com;
	dkim=pass header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026102901 header.b=xBtG9J7b;
	arc=none smtp.remote-ip=198.137.202.136
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B623E606A33F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B623E606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026102901 header.b=xBtG9J7b
Received: from [IPV6:2601:646:8001:6901:cb27:19ed:d7a2:a981] ([IPv6:2601:646:8001:6901:cb27:19ed:d7a2:a981])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 6A5IJcTH3107489
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 5 Nov 2026 10:19:38 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 6A5IJcTH3107489
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026102901; t=1793902779;
	bh=C7DFeRi067SwteKZbsvrNELKriQaTYft/5yfog67Pm0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=xBtG9J7bfbbwqGPTLqu/AzjJ5y9N9DlQa1aG+mNQDEs9NbhFvQP3bc6VpESO4K5ue
	 EhVqE33e1uJKcW+BRK6H71D+Bxsu1UHnoTIjuf4JU4C7Rh5BB2rMmry3cOB+7j1vib
	 1oFpSMJloay+iJNl2FVGylYtcQTyCDlZQ/0oF0NRfM8qsJ2DgSKivg8BXHhJfxhseV
	 ZrUNGNw9o0pVqPNHhSC1pVq60PldDPGwJnCVxwG6XwGv8kW7ev41xnoHfm+pRimtR8
	 hoUs0aoIBVhdqya2diV2JpodftvbGBl/8KiwDp2bIjX5lk7qOnmKmgPbNZT5TIK6mf
	 d/C2HeWm3wcww==
Message-ID: <fee4a2bd-de34-4ad5-ab9a-aa1c5123a26d@zytor.com>
Date: Thu, 5 Nov 2026 10:19:33 -0800
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
Subject: Re: [PATCH] x86/realmode: Use const and u32 for embedded real-mode
 data
To: Thorsten Blum <blum@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Dexuan Cui <decui@microsoft.com>,
        Michael Kelley <mhklinux@outlook.com>,
        "Pratyush Yadav (Google)" <pratyush@kernel.org>,
        Yunhong Jiang <yunhong.jiang@linux.intel.com>,
        "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
        linux-kernel@vger.kernel.org
References: <20261105181008.366331-2-blum@kernel.org>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20261105181008.366331-2-blum@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-11-05 10:10, Thorsten Blum wrote:
> Declare the embedded real-mode blob and relocation table as const since
> they are not modified.
> 
> Also declare the relocation table as a u32 array since it contains
> 32-bit entries, and remove the cast in setup_real_mode().
> 
> No functional change.
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>
Reviewed-by: H. Peter Anvin (RosaicLabs) <hpa@zytor.com>

