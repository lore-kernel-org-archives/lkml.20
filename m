Received: from ixit.cz (ixit.cz [84.42.129.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6494A8FC7;
	Thu,  3 Sep 2026 17:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.42.129.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788454975; cv=none; b=qE5W3mHMm+9aTIyLgZOWaiFdMQywosZTrJbUCDo0XMBBlbbODMQgyDimV0S2n4lc4Z51ZrjrqwK94bZci5zzWFHAkrSsAVRyg+SJKEatuJg3kNo3rC3Q6qNUUxUzJzd+rfnJNj7bEwPZexNwnpX3RNXpG1Vxu08GDQuLk5T0PIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788454975; c=relaxed/simple;
	bh=7dS65mLqS5TaYH+jrH1I8s0IhvEwTBq61zxYxCN2BtI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rwnFDEIvi9+TZSGmqXVrvAvNgJ1H3+yuIjax/5YxeJBFyqI7EoxMLbywEJXz9+mowvqo0eu6jT58mZgz/A4GeSAlYn4qH/5yIyXcPPI/txW+GVF+CSXpoKG4gRxayGHGtkrYl5NTaFrTMYb7U5JHAZPTz8/2bYBFjgJ4sOzOfpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=cNSaZdy8; arc=none smtp.client-ip=84.42.129.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="cNSaZdy8"
Received: from [10.0.0.152] (unknown [10.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 55629534032A;
	Thu, 03 Sep 2026 19:02:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1788454970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Q4dUwejdRJI2qLkZSXJEkJxoQfGOS6BIS0QFYJOq8yQ=;
	b=cNSaZdy8kfXM68HQ7QZzyWeDLc5ztf22U/gd+IXjIvg90zLkq7eM4JmaIvUk1sq8XVrwXJ
	+GOA9Uprue3SBsMckV8BneaZkcEMW2tBdRMKBDG2d4gNKbNRtCC/T6eaF1WBQuFpzW++9+
	7UoIdKocS4BdDfz+0EK8QHKzhcsY+h4=
Message-ID: <e4b32a40-4432-40c0-8e57-f5602c98f096@ixit.cz>
Date: Thu, 3 Sep 2026 19:02:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 6/6] arm64: dts: qcom: sdm845-google: Add basic audio
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 David Rhodes <drhodes@opensource.cirrus.com>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
 <20260705-pixel3-audio-v1-6-3b66f33859f1@ixit.cz>
 <71e04eae-7826-4f51-bd6a-318ea1108c08@oss.qualcomm.com>
Content-Language: en-US, cs-CZ
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <71e04eae-7826-4f51-bd6a-318ea1108c08@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/07/2026 14:00, Konrad Dybcio wrote:
> On 7/5/26 10:06 PM, David Heidelberg via B4 Relay wrote:
>> From: David Heidelberg <david@ixit.cz>
>>
>> Introduce support for sound card and wire two CS35L36 audio codecs for
>> top and bottom speakers.
>>
>> Inspired by commit from Joel Selvaraj.
>>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
> 
> [...]
> 
>> +	/* CS35L36, Bottom Speaker */
>> +	cs35l36_bottom: audio-codec@40 {
>> +		compatible = "cirrus,cs35l36";
>> +		reg = <0x40>;
>> +		reset-gpios = <&tlmm 112 GPIO_ACTIVE_HIGH>;
>> +		#sound-dai-cells = <0>;
>> +		sound-name-prefix = "Right"; /* Bottom */
> 
> One comment's enough (either above the node or here)
> 
> [...]
> 
>> +	mm1-dai-link {
>> +		link-name = "MultiMedia1";
>> +
>> +		cpu {
>> +			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
>> +		};
>> +	};
>> +
>> +	cs35l36-dai-link {
>> +		link-name = "Speaker Playback";
>> +
>> +		cpu {
>> +			sound-dai = <&q6afedai QUATERNARY_TDM_RX_0>;
>> +		};
>> +
>> +		platform {
>> +			sound-dai = <&q6routing>;
>> +		};
>> +
>> +		codec {
>> +			sound-dai = <&cs35l36_bottom>, <&cs35l36_top>;
>> +		};
> 
> nit: 'co'dec < 'cp'u < 'p'latform
> 
> also 'c's35l36-dai-link < `m`m1-dai-link

... aaaand **sorting nodes** broke audio.

Moving `mm1-dai-link` behind `cs35l36-dai-link` broke the audio.

For now I'm keeping m1-dai-link at the begging and added the comment why is it 
there, but I guess would be nice to have this solved properly.

---
   What actually happens in the core. In soc_probe_component() the ASoC core 
creates a component's widgets, probes it, and immediately adds that component's own
   routes. Card-level routes, including the DT audio-routing ones, are only 
added after every component is probed. So a component whose routes point at another
   component's widgets, which is exactly what q6routing does with MM_DL* and 
MM_UL*, only works if the other component happens to be probed earlier. Probe 
order is
   the DT link order, so this becomes a hidden DT contract.

   Upstream does not actually sort these nodes. The binding matches .*-dai-link$ 
and the reference boards rely on the order: db845c lists mm1 to mm4 and then
   hdmi-dai-link, sm8250-mtp lists mm1 to mm3 and then wcd-..., wsa-..., 
va-dai-link. Neither is alphabetical. So "sorted by name" is not the convention 
being
   followed for these children, and cs35l36-dai-link sorting before mm1-dai-link 
is precisely why an alphabetical rework breaks.

   Where a fix would belong. Two options, in order of preference:

   - In the ASoC core: defer component routes until after 
soc_probe_link_components() finishes, next to where the card routes are added. 
That removes the dependency
     for every driver with cross-component routes. It is a small change, but it 
touches every card, so it needs a wide audience on alsa-devel.
   - In qcom_snd_parse_of(): it already knows which links are frontends (no 
codec and no platform child, marked dynamic) and which are backends (no_pcm). 
Two passes
     over the children, frontends first, make the order independent of the DT. 
That is local and would be acceptable to the Qualcomm audio maintainers, but it 
papers
     over a core problem.

> 
> otherwise:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>   
> Konrad
> 

