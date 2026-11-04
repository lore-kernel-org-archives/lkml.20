Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793827462;
	b=o79tUax2G7zlJ274dh/5cGNM0czsQEQgp1KxoCNhPZ0sOL5khfd3cALb+1vF6biDntQm
	 nrOW9A4lZHvBrrlUkwGQS2YyCztUmADcbmrWW5/MpyADLUkcZembfNOvnNMa/TWvjIsXw
	 dBv/c8r9FF40INyKwHmyDlw9gZonuGmfGvS3O6qIwv5Oi13gAqc73eylplBHL+48ngCD/
	 IOq+jInK1hFZTiVmWZcDsDb1SFYUGo6E3Z/qRXqd/gxtrjzyTnUFsjysoqVJeAZhAftQf
	 9JQJfnBAcwly4FI/Tc3+WOj2o30VdoJQsXvc3CSdb+Yz7yiz0Aah52V5acPIGzEenQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793827462;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=FmqVmkvrXgFBO0d2eTVEOzrjPLPKRKtUjX9ui+s4dEw=;
	b=K54IfjsybAzuVPgh9nkvRQlrhBjL8+7T/sLmAsY+R1CuPelftjcHdqHGsHY0KVsZfBN2
	 rMgxTjgjTVU81C5HYLaAAuUS7u++EoTonxgWOmUaRRGsGPcBZJucaxaTJCJ8UAg/FFvcC
	 l23qQXPKBMUCyt9dK6M9PHMQundve5JcnLFNxPt9FVorWEsaWY3vfRd/XWumKqHecLMsx
	 nW4A2+PEhpGmhQWHXf5yvR6WnCPskLZdXi4mrfqHoCBXgJYUbQfRAa/sM/53LZqXoUNFV
	 r2Ji5FU2cNm7oj40QEX0/2+eP1+NJhepSkgzOfGUwGZ+r4QdBby+BqojGYCifWMT80w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=oJ6oEXQ5;
	arc=none smtp.remote-ip=91.218.175.132
Received: from mta0.migadu.com (out-132.mta0.migadu.com [91.218.175.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224EC606B2F9
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 224EC606B2F9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=oJ6oEXQ5
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8Sgmh8+jBx+h+cYd/aQ5qDa2nD/34St3AocupyWUxT0=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793827459; v=1; x=1794432259;
 b=oJ6oEXQ5LSQsraOH3wxd4O/tvDPl4Afynh1Kp3SWfSUFQrnwIdHs0eoAxnjepwIP/II8T/Li
 lgpEaAlnzG+kI0ZgCVs0VqnrQ0h1b04Pf0t3jd85doT4nq8BrtuJTLwV16HNv5YVl8pBAkloDz0
 0jfaFfkvzq0/nJmLNm61w+wipgWcoMM7ctt48f5hWKLN5hsjFhxwbb47XiD9kp1i3nYFoLrl5jK
 AoUjwvvDHTobmSOpNR/GuzIOe8eht0hBSi3beblh41SEEaUfvDva8y560quahSVDJhFfZoO2rDh
 DFf4gzvHQ84uzWJlqdpqqN0ed/xMzf5qj1F+iNq8ukHag==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5365014f21263c45;
	Wed, 04 Nov 2026 21:24:19 +0000
X-Mizu-Trace-ID: 5365014f21263c45
X-Migadu-Flow: FLOW_OUT
Message-ID: <ef120d58-fb97-4c67-a29b-6b9b07839227@packett.cool>
Date: Wed, 4 Nov 2026 18:24:10 -0300
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
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: Add missing CPU7 3.36GHz OPP
To: nacht@dxdmail.cc, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Aaron Kling <webgeek1234@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261104-sm8550-prime-3p36ghz-v1-1-c72630265379@dxdmail.cc>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <20261104-sm8550-prime-3p36ghz-v1-1-c72630265379@dxdmail.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/4/26 4:41 PM, Nizat Mikayilli via B4 Relay wrote:
> From: Nizat Mikayilli <nacht@dxdmail.cc>
>
> The cpufreq LUT on the Samsung Galaxy Tab S9 Wi-Fi has a 3.36GHz boost
> entry for CPU7 without a matching OPP, so the frequency is dropped:
>
> cpu cpu7: Voltage update failed freq=3360000
> cpu cpu7: failed to update OPP for freq=3360000
>
> Fixes: 3f5dcc05cd33 ("arm64: dts: qcom: sm8550: add cpu OPP table with DDR, LLCC & L3 bandwidths")
> Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 03f6d40edea7..ed6e34ac8d56 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -752,6 +752,11 @@ opp-3187200000 {
>   			opp-hz = /bits/ 64 <3187200000>;
>   			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1689600 * 32)>;
>   		};
> +
> +		opp-3360000000 {
> +			opp-hz = /bits/ 64 <3360000000>;
> +			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1689600 * 32)>;
> +		};
>   	};
>   
>   	pmu-a510 {
>
This seems variant/speedbin dependent and does not apply to all sm8550.

In fact a quick web search shows that your device has a "Snapdragon 8 
Gen 2 for Galaxy" which is a customized chip for Smasnug.

You should just add the OPP in your tablet's .dts I think.


Thanks,
~val

