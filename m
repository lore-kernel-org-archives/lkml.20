Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.177.127.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793847462;
	b=UI0EkWGQPrt4n6Oc+2rmf0MsSXlz3nwZOeJz0cdrYfeGDm3EnDIEGFZojrCmxYJiFX/M
	 9pdAJIeEe+JxiHFpX6NzCQw3vdLiSJShvLBhz1QI5kzeQcFhQrxo++tXR5wIfL0AsrfMO
	 pCg986rOSObm3oR3ou7pHudkbZrY9/qAX589Q5eijar8sRRAMkb4IcGK/LPJgTVMdfLxU
	 E1A22dgzXyiv0NeIKRegRH7n6z67IaV8998fhrPdUbMDJL/JayiHRKmx9SmCZqSIW2sYM
	 ipe78Q9A5/SEK1EBKMAgAkLA05y3PkX39u7XNfAX84mnpgEMjKLhsHTxgQd3d28cVdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793847462;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-Envelope-From;
	bh=l8/0xa3PC32xn5HbMvXsINTXTxxz/3V7tp0GPxGULew=;
	b=tlZlb6+FLjBrtmNZsA0qfPpa0do4EyR8vDIPDW3kt83nmL4IhShz6j+MrNI/bZr1p8cg
	 GvTFg/SdR4m5/hOTHe9GGCZ0Kxnm0cvQw1YlVwWtM0aIvToPOLd0SWe3gn4HgLtKoiYy7
	 tMgoKIiZd3Tm0ikM03kj/rS2RvyOVEqsSrXsV5kq15JT0xQkPTtZdOupQ6L5VWc8WkwPB
	 /DE9Oi1GCjMbT/MSvsJ3qFBWyc6VhUfCa9nC+lTou0r3z0f5A3mSMAoCF9kujpS8hBOnZ
	 ErCWsafV0UHYspzBYPGRCNqHyhi40cdMVHAWFokHdrDw69DFs0InS+bT9hTyeURVw/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tychen.cc;
	spf=pass smtp.mailfrom=tychen.cc;
	dkim=pass header.d=tychen.cc header.i=@tychen.cc header.a=rsa-sha256 header.s=spacemail header.b=PXns6i8N;
	arc=none smtp.remote-ip=198.177.127.221
Received: from out-utut-a221.jellyfish.systems (out-utut-a221.jellyfish.systems [198.177.127.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA295606D811
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 02:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA295606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tychen.cc header.i=@tychen.cc header.a=rsa-sha256 header.s=spacemail header.b=PXns6i8N
Received: from [10.18.116.108] (unknown [151.145.76.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4jKn6B4hgfz2x99;
	Thu, 05 Nov 2026 02:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1793847445;
	bh=l8/0xa3PC32xn5HbMvXsINTXTxxz/3V7tp0GPxGULew=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PXns6i8NDEU0YPdR6SSmzZBfMhMylL4SSMHEJOCAjDv2WIsx73ueFsg3dNgM2oUOs
	 9cvQFjZFtUmoLNQIyHLh4HFN/Mq6G+qYgZMbSAC6ww7kbcaOH9TKe3/djIfr4P+cIm
	 TJYo8isaatovcHfbh6PF4JhvKmRzJh4CAu6JUG/DhtJOmdY7OsO8EsJ6zycG7xRU9l
	 Q8W/7jvD25O8w0juF65wDYA/DcTR4rNLWfqoA5885rpU09ocoLLKzldPMr4iHjlffL
	 hhRGj+h/esJ7fELmi1QuB50OTA6n3Dls3FdooOfFWHh6vaeLVoXnZ1zqSK7eMKqVwv
	 z0UvUZqmU8rTg==
From: Tianyi Chen <hi@tychen.cc>
To: Ido Schimmel <idosch@nvidia.com>, Hangbin Liu <hangbin.liu@linux.dev>
Cc: hi@tychen.cc, netdev@vger.kernel.org, dsahern@kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH net] ipv4: igmp: report interface group allocation failure on join
Date: Thu, 05 Nov 2026 11:57:20 +0900
Message-ID: <179384744061.507013.15578905095186813950.igmp-review@tychen.cc>
In-Reply-To: <20261025105743.GA126003@shredder>
References: <179260356668.911829.6576504063198285556@tychen.cc>
 <20261025105743.GA126003@shredder>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Envelope-From: hi@tychen.cc

Hi Ido, Hangbin,

> Looks like unnecessary churn. The failure is not realistic.

I see your point. I found this through LLM-assisted code inspection and
have only reproduced it with fail-nth, not in normal use.

Hangbin wrote:
> Is there any details about the reproducer?

On loopback, I used fail-nth=2 for socket A's IP_ADD_MEMBERSHIP,
joined B to the same group, then closed A. B stopped receiving multicast.
That cross-socket effect was why I sent the patch.

I'll hold off on reposting. Thanks for taking a look.

Tianyi
