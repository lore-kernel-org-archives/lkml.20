Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660033B27F3
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 09:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791538165; cv=none; b=MPUK/OaSPR/zkSLXnsY8jYKb79HB6Fx/2lEPH/DOhaBKnUmPwEY5OzurktQlLNJLLJrVSAl7iVverbwibZePMskRCIYX0BFqX6ltI8zQ5Z6PVxpVcuw9BYFBtqnA8ScOI7v2mRiMeAVoNJZVJJ6y26plZKMGDqzq42utPStBZAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791538165; c=relaxed/simple;
	bh=qyJA/7nwl3OSaIXJDB1WKzr1+yP75suMFvmwmo2iG1M=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=KAgmyrVAfsrzHbdH9goMHNt92A2jivFed1lhu6NU5I3DpGBhybyqFgESVwM08MG2ByIq4Bvzt/hKHsnrPn/0MflG63jBmXM3ykwghxwOH7P2hjmP6i4gSMGVtU1zWYwIq9evPzmrcoA3YHiZyn8guZcQ7s/WltzzFWT15/plDE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=V2mv9vpd; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="V2mv9vpd"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id AFA90240028
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:29:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1791538160;
	bh=qyJA/7nwl3OSaIXJDB1WKzr1+yP75suMFvmwmo2iG1M=;
	h=MIME-Version:Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Transfer-Encoding:From;
	b=V2mv9vpd2gCnzjevmVssg0dfsMqWV4aLhz5lNQwSzH+CkftEuG7xkvAd5eci3ZYN1
	 oEURgfs+ZBymS2YD6zCvbuglQjijOcNY2YETg+2LWjWhYf+TM7bxc5ReJdBMZYLtZe
	 k0AS+Sah6FhyqrDKbS7nffRK5TLk7RL8pE7Cj46bFm9lBges20A+aeEQ6N5AcPBN/T
	 neMWBpY2JI3/T/U6Ct5lzxcAgdpc/Z0iG726GZTX1LIsyfDioVCxbRWyu6Gu3gDylJ
	 nQfNL9cBSBhXEOiX7AClwiWR98tBtQ+bS5192KhFInuN5T+4E32eTL0gZsZPyPJGUb
	 4Fm5nvNxc6oWQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4j1M4t6pvBz6v13;
	Fri,  9 Oct 2026 11:29:18 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 09 Oct 2026 09:29:20 +0000
From: mateusz.nowicki@posteo.net
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: st: mark main supplies always-on on
 stm32mp257f-dk
In-Reply-To: <2b17d398-0581-4b15-8c3e-dd87883667c9@foss.st.com>
References: <20261004112421.47158-1-mateusz.nowicki@posteo.net>
 <aaedc962-63ab-431b-8b27-b4ac9c11d16e@foss.st.com>
 <1baaa8cb024104ee6d201d55467f6718@posteo.net>
 <2b17d398-0581-4b15-8c3e-dd87883667c9@foss.st.com>
Message-ID: <d5f43cb2615f5968eba98129356935fd@posteo.net>
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi Patrick,

On 09.10.2026 10:17, Patrick DELAUNAY wrote:
> At this stage, we can probably live with that, no need to specific
> treatment for v1v8 and v3v3 and you can drop the patch.

Thanks for the detailed explanation, that clears it up. I'll drop
the patch.

Thanks,
Mateusz
