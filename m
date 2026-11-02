Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618147;
	b=3ykCV1rnAnMxCt7iGV5Pca+zM8TEgZzCFoofyfvsucvlsYE8J0OZtuNHSF7OrpN+Wlxn
	 8fpKb9IzAZdzSsqFadYouUEyd3lfyFAMlxxQmaqwHuojHBkChikueyIWbNL/6GEB9ipCr
	 /vZ2gmUG0V5hvPdpU20gR9Z0WqDnb8l6FAX+PemcGPb8OxvP5y+xhPSNMPP2v6UntfEg4
	 e7JF9SNS5eSGYwwEPufU0zmbrCTGeXFtfWDdAJHvN3fElr9vUI7eBOhte1aJP7CSkUG4R
	 nU8m0zatZjaVME+Kc3BnPHszGcSAyMLlsMKnYekySyT/CEKsbK0k3t85KLPPUFZsqqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618147;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=5Atfc5zlyNXW6OtAyRigvyHRys7Tsw1F2mguudvujDk=;
	b=pJ1MYWfV72J3QSV19yJCPKHBQM+c+pZbL6kPFUNH1FpKPKTXt27xwhatRHwZzzpjPjK5
	 Vzr4RE1/esai4KVl7bdOxenFezI22AoxkerCOclldiUprfAEjuYkVSaXaI9T9aAMcZ8mi
	 MgAj+CoiQh66qa61s9YVMIkXVqWQ6mELa/8tsvHefKT3PYokHRlcXpGlwEEPJlv++XsjR
	 oEwjpop+uljjej7b9+lXZ2QBi2vO6L4UlP81DVLIc5ThsoWcsXeWZqxvB9k0yJSNmGUml
	 q74SpvRZ4WZO+Ks3SQA+qEkifT+uhyZbn2YM8yaSvB5Am0jVj6fBwI6ZAL9va+bqPKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ROIf0Llv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18082606A324;
	Mon,  2 Nov 2026 11:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ROIf0Llv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 475CA1F00A1C;
	Mon,  2 Nov 2026 11:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793618146;
	bh=5Atfc5zlyNXW6OtAyRigvyHRys7Tsw1F2mguudvujDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ROIf0LlvIq/LO6HwVZ+PdFeCXRtoyOdDuqnvXVwKml9UfFYCJqB1aZrDN+rEo67DE
	 IV5df7y9wWDpKBf2UV/AZ2Q5Ew6T/8Pv/HjHjYKFbX/y9RSRrq39dA40XxyyAZu0Md
	 nEFc1UreMAxoIsc56gwuojOo9wbrkberwRRmXauE=
Date: Mon, 2 Nov 2026 12:15:44 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, Fei Shao <fshao@chromium.org>,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] usb: mtu3: fix system suspend in gadget mode
 after soft disconnect
Message-ID: <2026110236-game-mandatory-2890@gregkh>
References: <20260929-rbrue-suez-upstreaming-mtu3-fix-suspend-usb-gadget-mode-v1-1-a0ac3b6b2b62@gmail.com>
 <416aaa7a-aebb-4129-8af9-e2895ac9f78a@gmail.com>
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
In-Reply-To: <416aaa7a-aebb-4129-8af9-e2895ac9f78a@gmail.com>

On Sun, Nov 01, 2026 at 09:43:20PM -0600, Ryan Brue wrote:
> Hi Greg,
> 
> Gentle ping on this one, there hasn't been any replies since the resend on
> Sept 29. It fixes system suspend on MT8173 in gadget mode after a soft
> disconnect. I've been running it on an Amazon Fire HD 10 (2017) since
> September.

Sorry, I see no context here :(
