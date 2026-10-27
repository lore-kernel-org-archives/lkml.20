Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793095013;
	b=ATC8OV19q8nlcx7ZtkNgM12cgbuJbpyzDoPTghHY+vy+Q1LWLVCDcUje6pieT1mtMfiC
	 EExLZWWGV/kT4VC/bqSeFMeWOsE6IKOS+/2oCLf62ygnCaTSeR/I64EMMn/unEIeGpFva
	 08qMEAHcjAiqbWAfbcJHsQqa8CpDFSHe+ElNXtpLMj5Ldeymm3JrGO+6Q8ypsBuoVChBW
	 7NZ1NWM+klpEVu5IFXYjXVpC6UgMXkFQ3CwDhMLdni9cPDePiWmBxoC+czIheBWkCkefp
	 8oJ267NEK8lbS6nxATdLuzT3MPovlIJDfHg6Ziv2i19GhaNgHHut62Pw8ltK3Ge1JDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793095013;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=GP5oharGv0apk4U72jFVlwAbHHN87kFMPLSACqzLjUs=;
	b=c5cs8JWqmG4Ivl4hp2YaARabynYjou7GG4ZpdOS5yA0EuQCoH5A/Mg1rWAe6Y5WoPlQJ
	 /F9x6kuVyLxjrBwZIGowoUAm1O6NwPIU9qcfT/g8FRdm5qpd/b/9ikDTvgQtmqZhcBNEJ
	 jSEjijvdog/ZfgddENzSd5wiSxMiZ1g6wywpI20JixYp8gEv+qIzG2Qu9ekECv86cazXF
	 +CZEALlMQGfbuva/R3JEs09+gCF+EmqiGCReA+A9m+e+ezWH/yCSKuVc/F1mcM/PqykQn
	 l6yIWwUNYutBy3efc/tQfxyekOPlKOiLu0smep4KY89gWfyKff1teZ5oO7hW9mqqaQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NT1znik9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6773606A31A;
	Tue, 27 Oct 2026 09:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NT1znik9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F1791F01825;
	Tue, 27 Oct 2026 09:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793095012;
	bh=GP5oharGv0apk4U72jFVlwAbHHN87kFMPLSACqzLjUs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=NT1znik9uR+3gc3Tt3ZFxzdRSRBStmc3sLNfoepUakyw+eIZeOE1KrHR+tVHWUxYt
	 noAz+K62TqwcKkFrDmnLeeMiv3sKZtc19JKRLql6TM/QtA06HkHJhL3JM7aikHo/76
	 dcB1qRsVBsu24P7qgMKVEqJZFBpLEFp9k/rbhFqtxfraBT7OhZ3aXBwQmsqhc0qCl/
	 2ck0cMkgJa6qxc/PPp2ctQfcHG7a+jBEm79C+T1dJPV/OJZIaZlLKViM/1WLTGHcWG
	 StF0ItbyTTis5VD6Y7i1xChzfTMmo2Oig5gvA715s2a8tdrlLBUaI3y62ALm8LBZzj
	 I+kzJhs3fATIQ==
Message-ID: <7b993a3e-d2b4-417b-90a3-a41d1f454cda@kernel.org>
Date: Tue, 27 Oct 2026 10:56:44 +0100
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
Subject: Re: [PATCH 1/3] dt-bindings: arm: rockchip: Add ArmSoM Sige7s
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: HystericalDragons@proton.me, amadeus@jmu.edu.cn, conor+dt@kernel.org,
 devicetree@vger.kernel.org, heiko@sntech.de, hrushirajg23@gmail.com,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 macromorgan@hotmail.com, michael.opdenacker@rootcommit.com, naoki@radxa.com,
 robh@kernel.org
References: <20261027-angelic-caribou-of-wonder-02ccc8@quoll>
 <20261027085634.380872-1-liujianfeng1994@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261027085634.380872-1-liujianfeng1994@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/10/2026 09:56, Jianfeng Liu wrote:
> Hi Krzysztof,
> 
> On 2026-10-27  7:48 UTC, Krzysztof wrote:
>> Maybe just install the DTB under new name if they are identical?
> 
> Thanks for the suggestion.
> 
> Installing the existing CoolPi 4B DTB under a different filename would
> solve the DTB naming issue, but the model and compatible properties would
> still identify the device as a CoolPi 4B.
> 
> This is my main concern. Users running Linux on a Sige7s would still see
> "RK3588S CoolPi 4 Model B" in /proc/device-tree/model, even though they
> purchased an ArmSoM Sige7s.
> 
> I agree that we should avoid duplicating the hardware description, since
> the boards are identical. However, I think preserving the correct board
> identity in the device tree is useful, especially for a product that is
> still being manufactured and will receive ongoing upstream support.
> 
> Would it be acceptable to share the entire hardware description while
> keeping separate model and compatible properties for the two boards?

Yes, just be sure to capture this in commit msg and maybe Sige7s DTS
comments.

Best regards,
Krzysztof
