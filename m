Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006549;
	b=Uz5EWf6LeQU6/W3BIj3HkjcYruzVEumYr6nVPiU6RWy5E9TgbE5d3yzd7839OyBPTcp4
	 S7eqmnS7Pdw7jMh5UfjCXXxBD7hUM1JT9EF1KRlSAthhKWzuvlHEs5duYWM6TozLY/vzb
	 dMd2e7VlRuE6837ScqmOOBKAkWB6fgwmsLgfkH6NuZniLZ5ZsH+PbdnZqpzkybpqamuvm
	 0xui97ssUyMDzq4vixFdn1hzRxgercKYSVswHn3qcO/g0JzrkkeuTSO9pZ2dqdC1Iat6z
	 B8QhRKmAxu9El678INLY2rW4paeKO4JvSzY/hA+8RreVF2S6fiBedlQZ6EgJCiFpauw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006549;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=qhR5USygJ3CB78JYGZu8Bdj4Ga57gkEWi5cn82mwy+g=;
	b=0jwydRX/Jhxw/NLy2bWVErs/H+x2WUa0wU1ugaTPjkDaS/1p/CNaYxUApLep7qjxBvaY
	 FxfMlHbWVpIvDJk8GTtjGcPJA5IdU1oGpCk6OYv81+kq3w37KPgSp3gGqUDSsyAXoVp5q
	 isbE9HbNfoL29RzsqUNrSlhPKurUWho9V6vFqEUG+R+gIWvhL9oUnEPkN1BFsnyGEgL2C
	 lCcNMnjjI1zsu8TJzpq7a3UqWBjdnPvquDc6IngW2lm4nCI+1+TLHlRBWel1AtPpQsIvu
	 kPoVBE2tEcH+NFwC3216MyhEMQ+9ZOYjE77qEbaMYv6IlNABjjNHGb/mIjbPKhJmMIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="I6YvE/gY";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EB0606A31B;
	Mon, 26 Oct 2026 09:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I6YvE/gY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC9ED1F031E1;
	Mon, 26 Oct 2026 09:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793006548;
	bh=qhR5USygJ3CB78JYGZu8Bdj4Ga57gkEWi5cn82mwy+g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=I6YvE/gYGXgvx/dS51oJ+vhNzxFT/QgIyoyGpK6mHjSAuSnuWw0cBJjHTki1SHsbF
	 aciQZxOgZpZF8rQWeI9JGlEKFa3jS0wX62Lz8zxnwZMfhiLTSX7/AbRR36HWY0t7eO
	 9alwY2VThrpLH3UISHBPp1AaV8IBF+P8wwIiokDBjkjEmW5cDjyuoObmZCephYY4g3
	 rUZZEzGdq5+gjjr68cMHeJBQ7xsbQEQ2xdI3ikjdSdqc4/8gOKPxE/NLRUb/aL92w9
	 Glt7oHfgDRwKajlCm9u/oHhLlagpTuw71DMN06V1wWogpArGYgk96jL0mvRauBbBRU
	 ZZyCdXFS6bDZA==
Message-ID: <f8173d20-3193-45e6-bf27-a05de7187ae7@kernel.org>
Date: Mon, 26 Oct 2026 09:22:25 +0000
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
Subject: Re: [PATCH v2 5/6] media: qcom: camss: sm8250: set the VFE AREG clock
 rate from the VFE
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com>
 <K6MC-msR24ox6sm-W8vHRTvM3_t8Qc0jO6yiVwtqAFBqiFAx7a0PGnTIBDg_cyr5uZmULgOISgoJXMYZrNVeVA==@protonmail.internalid>
 <20261024094027.3095475-6-atanas.filipov@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20261024094027.3095475-6-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/10/2026 10:40, Atanas Filipov wrote:
> The SM8250 VFE AREG clock lists four rates, 100, 200, 300 and 400 MHz,
> in both the VFE and the CSID resources. The VFE only enables it, as
> vfe_match_clock_names() does not match the AREG clock name, so its rate
> is set by the CSID, which always selects the lowest one.
> 
> Match the VFE AREG clock in vfe_match_clock_names(), so that the VFE
> selects its rate from the pixel rate of its lines like for its other
> clocks, and drop its levels from the CSID resources. The AREG clocks of
> VFE0 and VFE1 share the fast AHB source, which then runs at the highest
> rate requested by the two VFEs.
> 
> Signed-off-by: Atanas Filipov<atanas.filipov@oss.qualcomm.com>
> ---

Sets the lowest, isn't necessarily a bug.

Why is 100MHz a problem and if it is, why not just fix to 400MHz ?

areg is a register access / AHB clock - your worst case outcome is 
'register access goes slower' - which to me accepting we don't do 
driver-specific clock-aggregation => raise the clock required across VFE 
and CSID so that nobody looses out on the bus times..

Again instead of having a driver-specific clock aggregation mechanism, 
if we need to solve for two siblings voting for their parent's rate - 
then lets do that in CCF so that every CCF consumer benefits.

That's obviously a separate and potentially large series so for this 
specific case I'd suggest 400MHz iff a problem can be shown.

---
bod
