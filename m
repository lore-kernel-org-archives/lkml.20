Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793832823;
	b=PrcycDWJ0E7gSvSlCkWjU2RQT/pa6MhrgbqjHS6qO49MUAdbmlo6uiQ5kZ6LHKPTCcuW
	 mQl5cJMNTX8+rcAHRy13Nwn6PvdceV+f+WFbLfSbeo/bxKrj7DXULCqL6HYFLuYof4jzQ
	 GqLORyc2RtlkCkYImwPFYdEqpdm3inK26GCrGhCCFvTCGb+daKXoTBjauW+g2QBx37o5A
	 KMj6Adjq9hIpOIO3ERoSCLuTATbFa8gejfQgDgncYbzCNRRSvAmLIpdDWeRGjQVKHKdMS
	 qGk7EpvMsNVrtJ3+fh34Uk6cOn+/hg8OUck//vpY0+TWVG9+4BQbdby1IZx1UQh8hzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793832823;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=ukB5/tT9mWZkYOa7VV6zjxKWYiggvhMatV2j30aZgEY=;
	b=3ci8/Omh7RmOSW/7W9Gg2Yk++KjY2YLYglS/hGWtiNiSos/SoXheq87MJ1FzKBksbePo
	 MIZH+i4z5o8TwBjH+kIZrTsbpI6uRpqIypbwrOlep0iG3YRxxfsK7ch5IzR5WSiNuV2HG
	 cqgfDzs9syQMPV1adNxSOMQSwwBV4CzP23y7lnU8azlRteyRFCxaVw64K0xnxkAlqHaEF
	 nKTGU/qySDUIl4Q6Th35n8T2/npaVhhLkj7axiAFlX2BOQgCBq1R5lh1vBbH6ov8I9fw1
	 /qQnUa8vLZsTfB1MLf+AYzDZcIUxebM72H7bmeMmdfsSYqouPQfc2wpdZWYlyGdx6qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codeconstruct.com.au;
	spf=pass smtp.mailfrom=codeconstruct.com.au;
	dkim=pass header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=YzOy58HK;
	arc=none smtp.remote-ip=203.29.241.158
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B904606A31B;
	Wed,  4 Nov 2026 22:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B904606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=YzOy58HK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1793832819;
	bh=ukB5/tT9mWZkYOa7VV6zjxKWYiggvhMatV2j30aZgEY=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=YzOy58HKk9qmK6ynbPSEyojNDhwDWvKsqmHXDAI3hle9mkAuDkg9ZfGOwZxBEVh+t
	 sAEj14EjY2JMNXBH8qYuvJdS5L/j0ZLpYeUVdtDoKbnaTznZ7aqZBQ+dH33QDrNp/C
	 dbQGeXpWQxIG/jrp/GFONgM9YNbNaUBAdoAAvvb5/3UCVjszj9lyNsFL74K8ygAyvo
	 DYWGKTnsuK+cciDz09YEvfCibtQeUedllj8IkzXVMAQJVrMJ8uVkO5BtuQoNDIX0LH
	 U4+xzH04IJDmDNvvhwP2CPnYLZU+8txfToS25qeR4329a92+OKN4xdTQZ1uwzTvp6t
	 2iqz9Jz+jfLtg==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9E24664698;
	Thu,  5 Nov 2026 06:53:37 +0800 (AWST)
Message-ID: <e5222c01c9f0b43758408451cf195e9adc7ef2f0.camel@codeconstruct.com.au>
Subject: Re: (subset) [PATCH] ARM: dts: aspeed: Correct white-space style
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski
	 <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 09:23:33 +1030
In-Reply-To: <179380380617.180018.5035897143826922583.b4-ty@b4>
References: <20260801210437.384040-2-krzysztof.kozlowski@oss.qualcomm.com>
	 <179380380617.180018.5035897143826922583.b4-ty@b4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, 2026-11-04 at 15:50 +0100, Krzysztof Kozlowski wrote:
>=20
> On Sat, 01 Aug 2026 23:04:38 +0200, Krzysztof Kozlowski wrote:
> > Correct a few white-space issues, like missing space before bracket
> > '{'
> > character or spurious space, which will be flagged by dt-check-
> > style
> > ("redundant-whitespace" warning).=C2=A0 No functional changes.
>=20
> This is waiting for three months without feedback, so just picked it
> up.

Thanks. Apologies for the not getting to it. I've struggled to find
time for upstream kernel work of late.

Andrew
