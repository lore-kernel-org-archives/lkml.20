Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.110
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779654;
	b=C4m3GeZjRHdVs0OYI7Gv6tpcg+2bog45vGEy0egvbtecEPdGb5xGBsoGE0B9U/sPItzy
	 mToUSurmNx3kP4e6Jp3nCqDLlks2mYn5A9fuzrE85h3e2yE4b/E0ow3BnOyh77dn4Wtm9
	 xBvF1t0T3vfyAak6in8i/uAxzWCd+CA8Otu+q+hHOH0qoQoAJwsDJdaW8DdNcgT1OmKm1
	 jfJv6DNDu5jggjZM3flWiM29kWT+va7Vobtbm8LIKRbvPYjg85bBnzLoHatxWVuPGLdAA
	 cfc+TNHMMJAVXTxxWqLEVXzTWRvGn5Zeo8kRJv6mndUIRRvsjFPBuu8eYykocOyM+5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779654;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=1wbEg7RVw0sJcgK6jo+VuHuQigKauy2ObmwYyN2iIwY=;
	b=ns4SFTnQhGCbFNvdFgejfVl4A7LS/WrGlZ3bWGlVpHOw/cl5nze607TK2BCL41dSz/bq
	 lap++tpSRH7oRVEJvnmmyVyZYgQxjxNy7eAL0c9fiKAKpF3tRuIuFy6b4leI7N2LEVPGC
	 6gsXe1s5XEN80X1WAcUM/8ILIj4CpQ3WHLPkKNDQh07h98rNqgZOax3NxBzawvDNIV6pZ
	 6TBMKaG6gDSYmpqdSI6EYcEDpMAohSPI7IuDFWU3/ERw4DZLxcT5X2900Vrl1u51qBA/1
	 8H6pXhyb9dABI4aM+JI3PPkeyTU5sVJGNyFbQATJk9csCwM7MVKA+W5FDOJkXS5rCYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=KMnS60ME;
	arc=none smtp.remote-ip=91.218.175.110
Received: from mta0.migadu.com (out-110.mta0.migadu.com [91.218.175.110])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26055606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:07:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26055606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=KMnS60ME
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6Wfoa4J0AxWSbhy/+SsM9gBeiOJtqslLCJgg5kOlOSg=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793779652; v=1; x=1794384452;
 b=KMnS60MEqfOkGV4P9k+fvGDemgfC87OFeWgVyZ/bS1FRaRvfngRJ44sdQi/U+VglGiIcZ8HM
 nIc9ZtgM4OorNTcNDGf1RJByLG5HvXRlhxjKvXvooLJdYS+dw43DUal8k13RASDSWKjc6Thk1yo
 b6xEE6+qNoSSVFolE9YSBl/98xfGnggGWvVKVP23W9cWC/WuRuADPcsodEa2wMJ6GZmxvI9Odrr
 bkbdgJllyTQFZf+fQvHfJdnk7xRualHn3CcgnTurokwM4qIDELCaK36xH/x1ys1S6qGytwMy/3Q
 9sTAucR71k+1FgevYJiYjkIubo9HbPyTTLAJCfshPxNTg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ec92a9e29fcfd0d0;
	Wed, 04 Nov 2026 08:07:31 +0000
X-Mizu-Trace-ID: ec92a9e29fcfd0d0
X-Migadu-Flow: FLOW_OUT
Message-ID: <4953dc2f-d998-43fe-b02f-597d5d7b23b4@packett.cool>
Date: Wed, 4 Nov 2026 05:07:22 -0300
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
Subject: Re: [PATCH v2 2/2] remoteproc: qcom: pas: Add SC8180X SLPI compatible
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
References: <20261104080200.135431-1-val@packett.cool>
 <20261104080200.135431-2-val@packett.cool>
 <1f57f491-56a5-42ad-91c0-9c55e1c6ef4b@oss.qualcomm.com>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <1f57f491-56a5-42ad-91c0-9c55e1c6ef4b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/4/26 5:03 AM, Konrad Dybcio wrote:
> On 11/4/26 9:01 AM, Val Packett wrote:
>> The SLPI on the SC8180X is identical to the one on SM8150, reuse the
>> same data SM8150 (and SDM845) uses.
> fallback to 8150?

The current binding for all the remoteprocs (which already mentions 
slpi) doesn't use a fallback..

(in sm8150-pas.yaml only qcs615 uses the fallback right now)

Between editing the bindings and adding the compatible to the driver, I 
chose the option that was consistent with how the others are done..


~val

