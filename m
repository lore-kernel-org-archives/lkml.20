Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794612960;
	b=g4HZHIawU+JQVJr8r3mV66BjpkLrJBOEEceftWi1Cv+8eTeXpgy9Gh1Q6GX4CtqMq+Be
	 e5BPu1E38GZuHW6oPBMMLfBs9QKbUETEwWAB4WFllNQ4BPQ4k/vkRJ4XXyqB9YqI51JZP
	 UjaLntNQpT+OOCn95b/c+AVupGuYWPHfpns5H3ba1xEz1r72JGDjdS3qejHnWzHu52Lsy
	 qq/Hh2B78ma1z2hdaaIg9n6P69uC9gx92+6jGE8kDDVXeUbqNhXMJvHnQJKBbsRPygITO
	 /uONH0ELyr0eN00qkS8RSRQw6VyFp4jQs8v6OaoktyxNFbdLgcqJDrc9XArGM6bm/oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794612960;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=1onknRTcb3fwBFQdXWEqphYJTPnuK96XjIBjd9ShqHE=;
	b=I1NiYpQ+D/79gJ4B9jXx2eULRio2pYC9hyOPq6kSHb3S+FMb0Fyb+1/7NP0AeV1wwxqf
	 HxTUkuji+w4uoURCH+Ghwjln9ht60jn/wJTtPXwUbmnnEejnAeaC6iMQcyejyHMkvmvHZ
	 MHpa9WCFADwZBr679wdfmiI/XGgFZhMnCzSvBkUIiDXEQWhxn86UZ4/IS3hFVqdscIVwT
	 Hz9ugUS0o2ObL8fCUOcHHpIXq/NY173YTWN2UBoygI6lLoaPLW+s7GRtKYMlgm/dZbLeC
	 F1GBA69jeQciIM5ocmgxqxnzAigQvN4ez9kNkYw7zO4WxQbk5U2dqf0+vtbxUhqzKAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=C3z0Cd1v;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C41606A882;
	Fri, 13 Nov 2026 23:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7C41606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=C3z0Cd1v
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 58CCE10E507;
	Sat, 14 Nov 2026 00:35:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794612953; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=1onknRTcb3fwBFQdXWEqphYJTPnuK96XjIBjd9ShqHE=;
	b=C3z0Cd1vAfIygPbS/8heuYyhSvJlYLo3H9yWuEO0OC0fmiqOVwY5pQ61zmYOkj/RWeNxts
	cMwouyCr2q7mh53mt9fTKGdmRHNF3IANt94j/pEsOjB/wfZ/ht1+SVa29YLuQQsy4Pyv5Z
	Wly8UUoR8vqYg4Ib2ruV1hCx2MccQ0f9mnxyych9m7Oh3syLnoiA4x5LSQBTchPoxaM57B
	rVQg3lAit+Moe4UPZd0baLnyuhTDyfD5mgsoHqzhp8F5IHZml970Xd/ZVeu1hhle1JuFhs
	ul4JdD+hxbXMWThYaSxMCsYVDYaPr2OQnONB44UX7aNsOFCmK8pXqoyOD6xZHQ==
Message-ID: <2cfc503c-8da2-478b-bf5e-c4dc87bbb2d3@nabladev.com>
Date: Sat, 14 Nov 2026 00:34:52 +0100
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
Subject: Re: [PATCH] arm64: dts: st: Correct white-space style in
 stm32mp2xxx-dhcos
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261113185402.183367-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20261113185402.183367-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 11/13/26 7:54 PM, Krzysztof Kozlowski wrote:
> Correct minor style issue around white-space - missing space.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Marek Vasut <marex@nabladev.com>

I hope ST can pick up the various fixes for 7.4 .
