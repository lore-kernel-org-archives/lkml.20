Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793950785;
	b=mnY3Un5HlQ+wwX2kt19iIrNPoNTTZ8BywiApWivgk+xqYN3SAiUnx73hGvJpjMGX8aRb
	 naiN8SxOiY8/qHmyOZl0Twfqw37jiItb1UD9bVAXxjyX77A4/KKaPHDvTTry09b4aQs/J
	 VsFqH4bnYR7IHPCEJn/Zq9QT7n8yMqY5L+lEQp82coC5WYOvKLhfvOVzWC/5DaokOmYjk
	 WKCoBGEKW+HiZqpg2PVUhMcsVwsmG1xifFnIM1gLr0cARJMugrtzOy6+7hQC+b6Lni/vF
	 uWJ5E4vsOF0W392mX2SG2NLYLnCQRuSKwnI6XtE/Pli8VvhvchU4saWIlIeZ9MHVKsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793950785;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=1LnB0MeeLKel7mrx1PK22qmVuyKJMFV6DF88sqg6kSs=;
	b=EZ3u6NyId2nupO14s1o0QfyABX/5LGRKjiXmikfGpD87jh9muKjF/1/q0iJAlrBpcp0t
	 YoZFmfFuKXAvp/liKgJI+5QdewaNpEnsEwayI07Ezgt1LUIIKbicSDIIEGAxjrOwDt9EJ
	 nJJAEs9iOky03+sXn7EdkPHmVAI2+U+mjMErILIT2g6YxXtTVEBt/vSlX5qMHPHUxrGBg
	 QHfiO49VLACcE7qpSGXlsnLfP7QBNP76030jha1G3iy9m44N/TSUSqO6NPceWPn4K+xoB
	 RfeY+v2zqmezjOhV5gZC18GasKYEYORdV9wBademe6uSeH3YjMwf7src2jHjj+N7eqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Ljr/27uT";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728FA606A326;
	Fri,  6 Nov 2026 07:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ljr/27uT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 742E41F0089F;
	Fri,  6 Nov 2026 07:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793950785;
	bh=1LnB0MeeLKel7mrx1PK22qmVuyKJMFV6DF88sqg6kSs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Ljr/27uT4ZFJvPIv+E8IExj1bSp+ur0cnfqs/5R0WArZFouETDMwR33ibaNLiztpH
	 ima13UfkUkdkx8J5Z+M7Jhklet9u5Ln2a9GIJ9C5cO+gu8A8MxWKIZvikfsggp1B5K
	 7mftB+oWc0AyqzOgZ2BdWnC+LwFDPdfOF/6XfBN6SbMUUn53D1yw0Yq0hndtcpywXw
	 7F58lEDqMJu6RWYQmG2V1xZzNvU08Jg63YrSlRedv+jOj/59Hw2mE7mRu83wm1QtPr
	 WZSD7EKnRkisbvZ2AL7uVgD6Moh2shQwZA6c1QGmQ7DTAerUwCqWtJR3w2cbQtMYHN
	 8OHY9IyrfchUA==
Message-ID: <91d67c5d-d125-4834-b0c4-742951c59af8@kernel.org>
Date: Fri, 6 Nov 2026 08:39:37 +0100
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
Subject: Re: [PATCH v6 1/3] dt-bindings: usb: Add CIX Sky1 USBSSP controller
To: Hongliang Yang <hongliang.yang@cixtech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
 Roger Quadros <rogerq@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 cix-kernel-upstream@cixtech.com, Gary Yang <gary.yang@cixtech.com>,
 Fugang Duan <fugang.duan@cixtech.com>
References: <20261105011803.4058557-1-hongliang.yang@cixtech.com>
 <4d075b70-f2af-4aad-a1d7-cd8ea26387ca@kernel.org>
 <20261106055050.948470-1-hongliang.yang@cixtech.com>
 <8ffdf2f9-dd67-419f-83af-8dd4206d54de@kernel.org>
 <20261106072849.985274-1-hongliang.yang@cixtech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261106072849.985274-1-hongliang.yang@cixtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/11/2026 08:28, Hongliang Yang wrote:
> On 06/11/2026 08:01, Krzysztof Kozlowski wrote:
>> So instead of replying under each comment, you selected a few of them
>> and expect me to map/figure out which ones you ignored?
> 
> No. Compressing eight separate comments into one mail was the wrong way
> to answer a review, and it is what made you match numbered paragraphs to
> quotes yourself. I will answer under the individual messages instead.
> 
>> OK, then find me where did you reply to this:
>>
>> "And do not combine USB patches with other subsystems."
>>
>> "I do not see how you addressed my feedback from v1. I asked, not to
>> combine USB patches with other subsystems, within one patchset. These
>> are separate patchsets."
> 
> The first one, in the v1 thread:
> 
>   https://lore.kernel.org/all/20260902032306.1182941-1-hongliang.yang@cixtech.com/
> 
> where I wrote "Done in v2: the combined bindings patch is split into
> separate patches with dt-bindings: phy: and dt-bindings: usb: subject
> prefixes, one schema per patch". That answer was only half true: v2
> split the bindings into separate patches, but the PHY and the USB series
> were still submitted together. The series were actually split in v4, and
> have been separate since:
> 
>   [PATCH v4 0/3] Add CIX Sky1 USB3 PHY support
>     <20260906032431.470744-1-hongliang.yang@cixtech.com>
>   [PATCH v4 0/4] Add CIX Sky1 USBSSP controller support
>     <20260906032440.470788-1-hongliang.yang@cixtech.com>
> 
> The second one, on the v3 cover (6ca4ba08): I did not reply to it. The
> split went into v4 with no mail saying so. There is no reply I can point
> you to for that message, and I am not going to claim there is.
> 
> What remains are the per-patch comments on the binding that my previous
> mail answered in summary form. I will reply to those under your original
> messages, one at a time, rather than restate them here.

You still combine USB with other subsystem. Identify subsystems here,
please.
1. USB
2. SoC, no?

DTS cannot be placed here.


Best regards,
Krzysztof
