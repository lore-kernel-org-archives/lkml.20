Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E24733D4E9;
	Mon, 19 Oct 2026 11:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409063; cv=none; b=YjFC8mSXPfCMT4T47rpw9cET/8J5kyur+HnVA7Bbfi7BMUrfCZsc+p2bHMF28UNlr00gRGttFXQvYXuQVN5nV3wLINBQaGgABnfDdsTXgo7InnIPXkDe/Op+3Xz1jYWKL09kJhefRDQuFy0wPUV3eqAykycyZkHSLAAsm9LicbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409063; c=relaxed/simple;
	bh=mK5//vkxGCMjGmgSS0WchDdkPqMImf50AUAtxpkkxxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JTQC0BNdkfXV2mEi9YdjH+XVbvBlmjVlZ7koTb5OS+PdRH7wEcc3CMR2vxuXwPwBU4493tiil3THC5G9Ki6A5EQMRk8F8vUJzgdDfXb4Dobrb1iDedkBoEjiG5F3fMSCfx+aTZyIS21oPW+nxe1qqY9x8zcFVVGZ8Hwl5wHI3Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eUIhvj9k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eUIhvj9k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEB7D1F000C4;
	Mon, 19 Oct 2026 11:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792409060;
	bh=PKWuic2G/HGRtF1u1BPrf6xxiud57cUAtpu/hY9Z7zk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=eUIhvj9kR4RHH88tNnYvfd3YtdegYy5pr8/ExGG5M+QAXa89Wu/VHIOMqDkGNH5H7
	 Su0qNxZAcoI4sPOCDTf/PxiY0LWkfd5KW+Cc3JbPG1rGUfm5zPuV4leWABc5ubUKLJ
	 91De2w4+/1D8uoMlBbI7QoAMER/bPzXrPY7+u3zvxD+mqHuR3wocWgpsxYSQej76vJ
	 vuxn5SnlroL+QW3ysz/ffBbngUvWCwDvJAqN5E9rFl5Z13cDFOuhnFrprJK6vHHR+9
	 dTEul+HkEyG/A9RKrMkn1PUnkYMNR8uH6xXx1f5JXgB5uvKApIr1RBcedX4DhDUhhR
	 cRJXNcZzXIRDQ==
Message-ID: <324dcc61-6085-446c-8bf7-564486f319bd@kernel.org>
Date: Mon, 19 Oct 2026 12:24:13 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] phy: core: add generic MIPI C-PHY configuration API
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>, david@ixit.cz,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, vladimir.zapolskiy@linaro.org,
 loic.poulain@oss.qualcomm.com, mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
 jigarkumar.zala@oss.qualcomm.com, hariram.purushothaman@oss.qualcomm.com,
 akapatra@quicinc.com, linux-media@vger.kernel.org,
 krzysztof.kozlowski@oss.qualcomm.com, daniel@quora.org,
 konrad.dybcio@oss.qualcomm.com, christopher.obbard@linaro.org,
 alex.vinarskis@gmail.com
References: <20261017041733.3946816-1-anusha.nandi@oss.qualcomm.com>
 <20261017041733.3946816-2-anusha.nandi@oss.qualcomm.com>
 <a6d8514b-269c-441d-b280-4895b5f21fac@linaro.org>
 <xGBkVr2J5eTHzEO_i4LTjdWGRO1MXGiIijMf1PGUbQ2gEYqffgMDMtx4uiNyBldbbiW13zmcxMWZYYjJ1s--Vw==@protonmail.internalid>
 <c6d963f5-a57e-4086-972a-4f04af2c5b42@linaro.org>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <c6d963f5-a57e-4086-972a-4f04af2c5b42@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/10/2026 11:24, Bryan O'Donoghue wrote:
> On 18/10/2026 00:00, Bryan O'Donoghue wrote:
>>> +    unsigned int        lanes;
>>
>> This statement and how you go about using the data aren't consistent.
> 
> Re-reading this.
> 
> unsigned int trios; would be fine too => data_lanes and lane_polarities
> is a multiple of trios - always three - does it imply that the first
> three entries in data-lanes == the first trio ?
> 
> Presumably.
> 
> That would work too.
> 
> data-lanes = <4 5 6 1 2 3>;
> 
> =>
> 
> trios = 2
> 
> =>
> 
> data_lanes[4, 5, 6, 1, 2, 3];
> 
> trio[0]:lanes == [4, 5, 6];
> trio[1]:lanes == [1, 2, 3];
> 
> Probably "trios" instead of "lanes" makes more sense here and the driver
> just always validates that count(data_lanes) % 3 is always false.
> 
> ---
> bod

I'm going to argue with myself.

data-lanes = <1>

=>

lanes = 1; // not trios no need to introduce a new term

=>

three pads on the Soc

=>

The question is - is data_lanes required for the CPHY opts struct ? For 
the qcom CAMSS case the answer ~ always no - we will be attaching a 
sensor and will read-back the positions from that endpoint.

It is conceivable that other systems may want to pass data-lanes down to 
the driver because they won't have a media-graph but, I'd say we should 
arbitrate that then - leave it up to someone who needs the fields to add 
them.

=>

lanes // the CSID and PHY should agree
symbol_rate // so both the CSID and phy agree on symbols per second

Remove:

- lane_positions
- lane_polarities

Since at least for this series, they won't be needed.

The CSID still needs to know the number of lanes and how many symbols so 
that it can calculate bandwidth so .... lets just include the data we 
know we need.

struct cphy_opts {lanes; rate/symbols}; dropping lane_positions and 
lane_polarities.

I've no objection to the low-level timing variables myself but OTOH we 
don't require them at this point in time.

Perhaps drop unless/until someone can show a need for them.

Excellent bod, agree with you now.

---
bod
