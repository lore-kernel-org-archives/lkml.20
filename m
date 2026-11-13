Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596912;
	b=bOXrvBLxtg+Jm9mkUcl2iPFM7hGu/E1ulPo4gEjEZxFIexpvX1FTIzw7BfZJEEftNDl1
	 tZB5NPqCPzdRqGCBRn3osJTGyImnqIcY3ppzttsEfGIqFa2FFpfHKzrU37dAB/bJLkr1E
	 EFP5/FnsDkUK3YnPq6nPoyKwiJuFz+1wFVSIpwvHTQ4lR8m8JGCCN8tzGZ4fOrOSy4tpA
	 v+RH/YtiQRr/7+SFuQEFRFfBdqmP2pITeDCW066ZJjXpZRv+whkgh5EokWjBy/aZR0Zaz
	 WmkrM3R2nT4pUWYZbovRc+AbSLW/EXSaN8IO8kiuoDvjPeFun4DyE5tgaXuMofOEGxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596912;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=NiMttAxHEHBNM2Bdz60wUAPak8r8g2qu7dmT3GxddHs=;
	b=InuKPdow1LATnKf8uJVC+rZKrwsNhvJmpZ99CDkXCVZb8gxrZ5e8YJvJqWOGsbpVRMb8
	 7xNwEPGGT1MUOtYl0N9gy7duTnevluBihjTHuWKWnnYLOZMwd1NISlp4ZOd9YMoeKeZ/4
	 mlqlX8IJgx9lim3LNdP6i5osD8Vdz+ooNww9CbzMUqekgo7AEeQfbflf+nhpSPTtSx9cP
	 CeeXOif5jDM73p8PA4mVzCGiQOK1UbVKt5ofFJhwDJyAerrG4D6sZkeaJW+8purZLtmNW
	 3CaVSx5G+xXUjEsVKNFBiY7WF2zi9Tz8IWtNu01Jibx+k6KehuxFJAR0IvKvZBXMQTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=oxrguvVQ;
	arc=none smtp.remote-ip=91.218.175.52
Received: from mta0.migadu.com (out-52.mta0.migadu.com [91.218.175.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1300D606A33D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1300D606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=oxrguvVQ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KGxUgSFY69U8aWf7k/qkbKFdiAll7pLEb3REyMKc05U=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794596909; v=1; x=1795201709;
 b=oxrguvVQtVhHPyqX4FZ9pVaaoxVtGAsdLH5lLRE+5aNomFMtQknjE/1xoWSY1O1f1v73siky
 UebY1VJU2KX/TTFsZVAIaPWyVi32MnJxG7xK5zy1gFVIUBHAuqj1Qk5WIrneH832XH8jsRaYH1I
 tsIsQ8SM5nOCKH1MhFWhbOtjV5m/07zrzDcvftUBHrpWyTIIq0YTzD5WDKW1zTNVhREr9w3Hh6S
 uFv0HV4Ia0nxDy3LsDvnDQOMYQkNdJe5ymiwGIcdlQYioMdXRgKEypj27MaC6FrTEaKQOROO7nB
 dGhvccu+v1I0EgIc5j3/KTg0SGoT0R15zgRDdzXhi87LQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6891a72dc87223a4;
	Fri, 13 Nov 2026 19:08:29 +0000
X-Mizu-Trace-ID: 6891a72dc87223a4
X-Migadu-Flow: FLOW_OUT
Message-ID: <f5bc0271-5ecd-49b7-aa5b-d5742bf2fe03@packett.cool>
Date: Fri, 13 Nov 2026 16:08:20 -0300
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
Subject: Re: [PATCH RFC 20/23] arm64: dts: qcom: sm8650: move EL1 Gunyah nodes
 to sm8650-el1.dtsi
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rohit kumar <quic_rohkumar@quicinc.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-gpio@vger.kernel.org
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-20-5183f6aab9fc@linaro.org>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <20261113-topic-sm8650-el2-v1-20-5183f6aab9fc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/13/26 3:38 PM, Neil Armstrong wrote:
> The reserved memory map, remoteprocs, SMP2P, IPA, GPU zap shader and the
> q6prm LPASS clocks only apply when booting at EL1 under Gunyah, and
> boards booting Linux at EL2 had to delete them.

This might be true in practice for this specific SoC just due to these 
being the only devices made,

but in general, "boots Linux at EL2" does not automatically imply "does 
not use smp2p/remoteprocs" (see Glymur; and earlier laptops with hacks 
that happily use ADSP under EL2) so the dtsi that includes all 
remoteprocs being called "el1" is quite strange IMO

> Move them into sm8650-el1.dtsi, included by the EL1 boards, and drop the
> node deletions from the Deckard dts.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      |   1 +
>   arch/arm64/boot/dts/qcom/sm8650-el1.dtsi           | 775 +++++++++++++++++++++
>   arch/arm64/boot/dts/qcom/sm8650-hdk.dts            |   1 +
>   arch/arm64/boot/dts/qcom/sm8650-mtp.dts            |   1 +
>   arch/arm64/boot/dts/qcom/sm8650-qrd.dts            |   1 +
>   arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts  |  21 -
>   arch/arm64/boot/dts/qcom/sm8650.dtsi               | 774 +-------------------
>   7 files changed, 801 insertions(+), 773 deletions(-
> [..]


Thanks,
~val

