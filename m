Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794641718;
	b=swDz4sfT0CcRYELC8iDyO0tKflJAPjEY9nl+DKdA58evPrPeymjKBeDMeGOhPZUyQmQR
	 xQUBkllGBq6XrGUvocvIXFkCchX6WT2fsOf/7FHrypXQ4sa7qd8kYcB/nKTHfI4RjKu5d
	 rJkO+dJQ6FLNEEQF9GcO/6fvPm6PnZi6kaXkiFfAM7qG9dqewtbgRu3lmIEZLUA26O/No
	 KldyMLIsngLe6QsSGK9yhYi8GbASgds39OcYjlqB2LwgwyBYRot649o9+xsr/qhs1gwOc
	 GFRsb6qw9f7vJfHC5mKQEJ3DLxJeJ9yhVI9BtUXyVME/8Y9DIB+Buv0rMxG19Hf64EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794641718;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=l2bxq6ple5RWVpikmciXib7wAWIaL5c2jKR3zbAOP9I=;
	b=3nnrD6eLwPw3Xcs/RbPkhqs67Yp4VPEdXQl+rBpdT6X+w7SK9HUSf0WwkRsQqJWExrz8
	 EwGyikG2wpuZEoU3A2cT1oLDxoGLx9u+9QJWk5gOmp5mUf3b8Ff/HoZAplQ3RoKz2b6K/
	 J+cnLj2pj0K+oEZypN9/NqDTVbfV1QIGOJUgedp9UZWIMzhVtY0O/CVG02LbLyzbBsbde
	 jUlKTdAmNpcMrIsWiF5urG0jCwXtAH5q6hu1jDQ+SMu421tmVmeZFReswZIdY9K6txcDb
	 9TL/DnYSvXB+lU3MZvXZC47FqEoLG4JyWb2UmLDousQl1m0xfpD4mrbDv7q8uBoOqdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TNpbNoxZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AA9606A329;
	Sat, 14 Nov 2026 07:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TNpbNoxZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AD341F000C4;
	Sat, 14 Nov 2026 07:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794641718;
	bh=l2bxq6ple5RWVpikmciXib7wAWIaL5c2jKR3zbAOP9I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=TNpbNoxZRA2cu7uMGw7OEeFvhkOzCxL3z080FEZ1UwP0uAOylz4PnASmCiyxnBKg8
	 I8eWn7cUs9QVU0O8WfDn57UDnRLLry7o1VWclPGktnE7RsxgYbCdsDcuqLSpWgnyOt
	 cJ6nZHvv96XHGQKwdM2eiYX6IbIvHC/vpUKcsXDIpbYqcsnAGOltTP67w01t3XfEw4
	 1pnIrBrxGhcemgAdgW64gMf7d5iyCUBHJzFLjEEYewBZRjI+uROvdi1DBEclU05kaQ
	 hXNL6EZK2C2MmEuzniR1QOHbJ7gY4lmpIcOYl/Ii74MuCAzBsk6EIZIM/VqhC1gdw6
	 wFVFh6jKVTCrg==
Message-ID: <ccff0a56-170e-4dbc-bb6c-496abc01f8a1@kernel.org>
Date: Sat, 14 Nov 2026 08:35:10 +0100
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
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_1/2=5D_arm64=3A_dts=3A_qcom=3A_add_device_?=
 =?UTF-8?Q?tree_for_Asus_Vivobook_16_X1607QA_=E2=80=94_v2_series?=
To: Daniel Carter <yass27106@gmail.com>, andersson@kernel.org,
 broonie@kernel.org, srini@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 vkoul@kernel.org, tiwai@suse.com, perex@perex.cz, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com,
 abelvesa@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <5a61c395-9eef-4c97-99a5-30f434ad2c7e@kernel.org>
 <9032798812284dd2842cbf003c75cc0b@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <9032798812284dd2842cbf003c75cc0b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/11/2026 21:33, Daniel Carter wrote:
> Hi Krzysztof, hi all,
> 
> v2 of the series, addressing your review of v1:
> 
> - The binding documentation is now a separate patch (dt-bindings first),
>   as required by Documentation/devicetree/bindings/submitting-patches.rst.
> - The board compatible 'asus,vivobook-16-x1607qa' is documented in
>   Documentation/devicetree/bindings/arm/qcom.yaml.
> - scripts/checkpatch.pl passes with no errors on all patches; --strict
>   leaves only the MAINTAINERS note on the new-file patch.
> - The DCO sign-off is now a real-name sign-off; apologies for the
>   pseudonymous v1.
> 
> Series:
> [1/3] dt-bindings: qcom: document Asus Vivobook 16 X1607QA
> [2/3] arm64: dts: qcom: add device tree for Asus Vivobook 16 X1607QA
> [3/3] ASoC: qcom: lpass macro / soundwire: retry deferred clock acquisition

You removed entire context and still did not fix issues you said you did.

Best regards,
Krzysztof
