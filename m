Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039862;
	b=5BpgstfmzarMTNLDk46bOphYmWbvdxUmxSB67PXo8IVUsGRv+m7rROYwuqX01SlD+25n
	 odOVjGqjfQ6SQd58qF0hQFgc5liz0SP5m7DSW7B/4Hb6tYJTCR/G/63KHCsWorYKX0g6G
	 rIPXSF9R5ngL1F6NklSn84SOHFk65Aym2z1LZnhL2o2JxZzZhU9a8/Yyio0BDC3ouSmyb
	 InC+UK9ZSnYVxRW3BqyHTtUz2aUDAXBT4XqUMTwrHwOzdXdZEqDLC58zV8vnGwx/DNbUi
	 Bu+ZaPClGH9ZDJRfm/vJ/IlQS57EDVzHW3oyo9bROEnzfvkr4yZCejQlIx3Q6TrwQGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039862;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=9C4Uluvd0xkYA+zo3dMgPpHbnwkaCgVbnnUTHjmZZJw=;
	b=faDMu6tK7ShAep/JyJlKxN0OhflP7paKUXGBBqICnxPfLhEDWTBLSVyyIiyZ1LKeA61w
	 h+NjDvoe3t3g2pLTF2biBwbLn7mi1tvvEJaR5Et7YT2W+/eWp/PV6XYtjyeNE3BFAAnuU
	 w3XffwId5578D9YhXlIJLHwovJo3gNy757FWQm5C3CQobXqpcZpX0lcNzBrih8fU4dmO+
	 5d6HYZd2Vr+XXz7QfZK7k9rXnR6RakY09mqmALmaV3XKHC/KD1/nMGmlnHNBGWdMDw9OD
	 eACE8FOhrkzwYd6H18kqicmDrncjk9342cBa/dw2X0NeJAkYX6BGHxt+ViPcU15D2/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bC7/Qk0v";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19EF606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bC7/Qk0v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68DE11F01825;
	Mon, 26 Oct 2026 18:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793039861;
	bh=9C4Uluvd0xkYA+zo3dMgPpHbnwkaCgVbnnUTHjmZZJw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=bC7/Qk0vq8cZZc6oEXAbxGsifR5b5IzIAM2Hez33JAZ8gnPVz/6YshFTXzvTQ7q3n
	 ngL+xWSM6a4HEmIxJ4M2eK52LYe2R2cpqO7P8n9zRxwmFjchS9g15FpBrJaAirs4hE
	 OdnDE1U9eruJ5GxYOyUC3nGlhlqnG2NFgPr3NUe4SypJKaBEGXjZA55INW87wIBbty
	 rLAk5KwoSyPUCPwe0Do+8vwH5wbYYQB/Cd5krWQpEnr0iSvIh2t79JFl4GN1gxQe/a
	 tJJb+fTE1PKpr5oeqtnSmVCcg8m9o/MME1pSrMm4xPtwyuQlqEyATnOmGDV0JTWwZH
	 h0MsL+U0xOe8Q==
Date: Mon, 26 Oct 2026 08:37:40 -1000
Message-ID: <7fec5fa8362328bf3356a077a8bd9687@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Bradley Morgan <include@grrlz.net>, Chia-I Wu <olv@google.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Matthew Brost <matthew.brost@intel.com>,
 Steven Price <steven.price@arm.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v7 3/4] workqueue: Add support for real-time workers
In-Reply-To: <9d6add80-2ec9-4f29-a815-ad0e955f7b5a@igalia.com>
References: <20261022093848.5727-1-tvrtko.ursulin@igalia.com>
 <20261022093848.5727-4-tvrtko.ursulin@igalia.com>
 <a3ae9a0f13e3972d0645f555bcc26f4f@kernel.org>
 <9d6add80-2ec9-4f29-a815-ad0e955f7b5a@igalia.com>
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
Content-Transfer-Encoding: 7bit

Hello, Tvrtko.

On Sat, Oct 24, 2026 at 09:33:42AM +0100, Tvrtko Ursulin wrote:
> Can do. I'll get to it the week after next. (Tweaks to other patches in
> the series as well.) Should I switch to a different base branch by then?

I just branched wq/for-7.5. That should work as the base.

> But if you are curious how much better strict
> affinity makes them I can measure, it is not a huge effort.

Yes, numbers with and without strict affinity would be great.

> Hmm.. I could do that, but since the tool ships within the kernel does
> it _need_ to have backward compatibility regarding kernel _internal_
> implementation details?

It's just a nice-to-have, but other parts of the script already support
older kernels, so falling back would be good if it doesn't add too much
complexity.

Thanks.

--
tejun
