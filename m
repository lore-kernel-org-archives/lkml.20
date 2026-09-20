Received: from outbound.st.icloud.com (st-2006e-snip4-5.eps.apple.com [57.103.76.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C6E349CF8
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.76.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789902496; cv=none; b=hGlSqT4J2zDk2wpuao5gOedZSdG0SMgZf6j1153+4Dr2WMnmc9Dt0K7wUiJtdm4lG0Th8r9pe885t30PomLtLOgYnEi42qxJeI6QuL2MRAfVHbZ9r5ADgccTpM/LRgWpTEeTmE3c+l6bK0w5vP3dUv1GxTDFTYKfo4l/r5W/Rw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789902496; c=relaxed/simple;
	bh=g5atBXm9PF8xx5q0Mhgfs9Z6K23/OJC23OhQaBVHKaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RYZlkhI0cZUAW/uN8LszzukGJJMZlw8QTKn4SIOflOGQx58Kb53YyxTOuJHyDBTV7H9MCw8hskrwrs8zquXCYqYW65gjE/HRJuJvL/o/I9lcm3sdXyGNWu94dirF335xqmfSn4N4T+OLOfAJi6YIehZQpq04c6clxlW2hHAzE9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=JwDg3oKF; arc=none smtp.client-ip=57.103.76.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="JwDg3oKF"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-9 (Postfix) with ESMTPS id DA17F18001C7;
	Sun, 20 Sep 2026 11:08:09 +0000 (UTC)
X-ICL-RepId: 01a0be80-88ab-75ef-878c-0e161a90d7ec
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGRhGXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJCldTARRVXyNCP2IncBcAXFAqch0KRhMZThtXTVAbXwJCDw==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1789902493; x=1792494493; bh=8TSTNC1sMgPPtpfFFjIy70xzt9wZOR/BkHYkoZ09Gsk=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=JwDg3oKFxxe8PfCe7uHSXo4ndfgweMj/7+UNwB+9ID92VN2Ve85OOxskhZMUWTA9WmYjQmTWmVe9JvRwBVoI46MmbekzRSle4Jp+svLElGBi55XN5yX39lCHUCt7bazr/FXWwP3AYg4y+GOflgYSCRA3XtQEo4EQbPUQG0oQeixPJHRtSHQ1JwAlUR0U1asgb9JWWvRfh4VuzpUfguxDMu6hHggt3DCd5NN4uEGgr1ucXT/fx4ydPrjR9Ddf7wHbI6evonE673kCrTx9Rr9Ty7UOgRNO34kweGbUBy1oRM2zQVnwBD68YmPeJn67X4kgsEOQfsyrix/eqarsEotE+g==
Received: from m3 (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-9 (Postfix) with ESMTPSA id AEB0018001E2;
	Sun, 20 Sep 2026 11:08:06 +0000 (UTC)
Date: Sun, 20 Sep 2026 13:08:04 +0200
From: Sofus Forstreuter <sofus.c@icloud.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 02/14] dt-bindings: media: add apple,avd
Message-ID: <aq--lNuTPWIo31gA@m3>
References: <20260918-avd-v1-0-49977931f455@icloud.com>
 <20260918-avd-v1-2-49977931f455@icloud.com>
 <c8d25275-3c45-4e9a-826c-cf856938d60e@kernel.org>
 <aq-RBuOWrHU07pXS@m3>
 <da42fe72-4351-46f2-8c5b-fc3292f7d8e1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da42fe72-4351-46f2-8c5b-fc3292f7d8e1@kernel.org>
X-Authority-Info-Out: v=2.4 cv=ddCNHHXe c=1 sm=1 tr=0 ts=6aafbe9c
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=W9t2kEz5hZV2X6pE-68A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: KFkVWwZQpZG_Q5zyjYiRPHy_p_knoIpO
X-Proofpoint-ORIG-GUID: KFkVWwZQpZG_Q5zyjYiRPHy_p_knoIpO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDE2MSBTYWx0ZWRfX4emtwNXts4Qh
 5OiJUNquQ9LXLTGdUw3wQhRh0OkHsS2fYO9P/0PzLFz9eRRKD8djlQjP3sxld7xIlaQdXDHRBcA
 ij6Gih0zVTr54EuZcLMkurE2gBFNdgxOxjn03ip/j0MRUnVrh8sittNxL/WzDa3XNVMLsibwkc1
 ChOqdHJ4d2sOL9y34fiwgyMFEXb3Y7ij44+yexcQCFGH2UCKCQuB3Qs2FtNkYP1IHqnaqIbhKJB
 owb84HuNH+dTeoY9X6ND7Pl3axcuDZx+PUgaY2NTKBKsrHikzaomvsXv6Xn9+Q9UaZv8ht2YXcH
 93BbYQ8MMxpUt9OLGcNHbLbCOZtFIaZXN/RHg5IgcgDdhdWaKFN4DgrV2Mm2zA=
X-JNJ: AAAAAAABW+WmnVuHvoLcSh9oRm3/IiydYy5wqs57lvxD73IY8puDgS0Ag+X9Osg4G3WYoB2RHJ+FTPu2uAIjzZZa4q1bbZzy9nXQzdapXhWH167OFAjQA+tD9lQcGMXVmYUFKLD2QsaTYS+oKqKbaWAj8sfiGPImuJLurJRQEx6kiTJUc9HEkhAkmqRxOQiqhLEcUi3VM2fFYiEilUAzyrLIcDNuuq/KJJV49HhBn1ussg05FcDPKgBhGldcig37TiB6hNbsK00ZGQI12gMYnU9bmpbdQcecx9L76xE53KFBd3cuSNbyqQWQbEO3xbywn1pYrdU8WLT+QgByhwiCaOkd08QA3Thbaj8r2R/QsMRF59CgXlLP8fJx5YNdPWSYZ2hs5ZHmAkrYW1mDQ8AUCFavFEi3kdoVlFCuQwqy5FVW8r/oF+1npO55g3vh0L05cK72lNAYF6G49r8JMTkfrDnrrfqgO521kiDVc5qKxuqVi00A66bHWu0oloC/c/Ufy7CNZX8eWVttuGGJTsAPL9BUbLPy9Q0ABC/c2giTLSNczXgupa1p4iBELDsAYdafgKIHUCz9tZood6sbWyHmPI3qepOreWsI75K/s4ZnyJPIJShgEZdrDHk63n7Mqe0QzESmHkU45hyeASY9I5ij6UmF2aV/aukFUZ+O104YMYYViJq5bYta9sO367qKJ4kuvhOXzYajG59Hrd7AbL8VZm4nZVhbcrghtTk0YCwkOndwB3qnbwQ1cmIefc7ccaYmj98i9iOEDc4FEMNvXQz/UOJxMZriB1ZPOo4wDvFjJkwcv8yZ6SJG5JAGjiew0CRGo36R4u62Q8YkejlewmnCTnJ7oD3i9TeOwxbrvbAsOm8SByFveMNn3+hiXeUArexH5bzx64oGGDjpDzgmKRCjjIFp5lvd+eP7GuQ64lWR3bEOfSRW0HRjlx8tu68X1YUHCPjCIgSoSECdHtrVMMVaUQR1/NBt+y0
 5VypQNtBMsthA1Bth/hoYRi+If7ai6LHr/ZOiWTo+PUc0+2bfTXQYDgpMF67vJoHZ2TF9E0RlsIRkrlBP2K2x735egETQEg9LFjisDI05WnNDGl3aNO4J3fB1m5IMl0n9WQ2LKm7fc/bsQfZJ44ChMQSTZtRMFaviHP0DZSEIPI37mBdphqUoz5rbboby4nl/BWrWblfHNmPMQl/zIbkoznLC3uz9bVdypTsMUW/0neEa0l+8CRZt1xRknrzx9uPwxWmurlZ9Dl9ztYP66WXIprkl+9yVl98eBq5ubOzb1qbYG70p57LwLMOQt70CRESUSb1eAEjx+TO6mcMUB1YbX/EZMxi+sYes3SZE8UZnaD46kKPGqjHsoVwZvxrrgy+VvaxunrKgIMot2HHM

On Sun, Sep 20, 2026 at 12:08:02PM +0200, Krzysztof Kozlowski wrote:
> On 20/09/2026 09:53, Sofus Forstreuter wrote:
> 
> >>> +  interrupts:
> >>> +    minItems: 2
> >>> +    items:
> >>> +      - description: mailbox 0
> >>> +      - description: mailbox 1
> >>> +      - description: mailbox 2
> >>> +      - description: mailbox 3
> >>> +      - description: flag 0
> >>> +      - description: flag 1
> >>> +      - description: DMA status
> >>> +    description: |
> >>> +      Notably there are no decode related interrupts. All decode related
> >>> +      interrupts are sent to the CM3.
> >>> +
> >>> +required:
> >>> +  - compatible
> >>> +  - reg
> >>> +  - interrupts
> >>> +  - reg-names
> >>> +  - iommus
> >>> +  - power-domains
> >>> +  - resets
> >>> +
> >>
> >> Why properties are unconstrained per each variant? Why are they flexible?
> >>
> > 
> > There is no reason for this. I will remove the unused interrupts.
> 
> Hardware should be completely described, so if there are interrupts
> there should be here as well. And in DTS. This should not be flexible,
> unless hardware actually is flexible (but rarely is).
> 

Understood, i will make them all required and add them to DTS.

Best regards,
Sofus
