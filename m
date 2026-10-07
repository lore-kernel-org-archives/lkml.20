Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36253D812A;
	Wed,  7 Oct 2026 08:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791362999; cv=none; b=Hwnsxbu99zRRlPZZhnHnfa/0rMrXYt97+X5Jw5mucPWGIdabL3vczsI3zUw91kIumaOffs1o5Z4jQsj7z96WP2735o6Ff/0vtdgo0mGS25/4GSyfOCZ1+WCyP+TvAD6pgrEtMJixx+KtERktu71UjzKq2ZHrZeHjYj/+txzrPps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791362999; c=relaxed/simple;
	bh=t7pJAeBbsQay0/BLlfzL4O/xoVPcCVAR+6qH2fNQU/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jCHP+deq3u3u9qeh8w12WWZHyS11/Wdjev6wXXzPK6TOKUJob9A3zcRmztncrc2qByGe78e6hW7j//txw1jxFuXntsTmfwmVRtFCGlMEm6xupFtxGPaxUGEwayGAG1/omyzal8T/+l5ui+xPNXPNimpjtw/cfHCfVcOIesNGgWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WcfURxFY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WcfURxFY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F0D1F0089B;
	Wed,  7 Oct 2026 08:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791362998;
	bh=o009tS9AkvoFcDLawCQlcRcz/G7SVTAQ5Q8jnK7+Nkw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=WcfURxFYFL3A4q8HJTGbp1MmHDAnDJkuPrUFFjH4HVRRLo5lk5c0uE/SNEzOjSN4s
	 yDiEOTP2emPlO6DsNxL9m2CkKE27bnhLDScg9hDdFhh0k94c0pHOZTM5/geQfAUZGA
	 1tov9xk0yxYRewXaYeXpFS9Xkfglbo0gV4Ns7T9qfYlnhE1eLidvfonyFQ144xEsQ7
	 hrISKU7jQS/vOsAyUVPDSehwL00eibAtwF5TZ1e8R4xoRHbDnueezOn6eeWE/JJ6Tj
	 sRIVmabiuJGt/asXPRanDG3QSvMOjyrpLq+v+q6064IkYxCt8aXYqwV9PscGzFi6bG
	 AlglxEEoOyVCg==
Message-ID: <e9ab618a-1e31-42be-ac3d-64aa4c23458c@kernel.org>
Date: Wed, 7 Oct 2026 10:49:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 66/74] media: qcom: camss: vfe-780: Produce the AEC Bayer
 histogram statistics
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>, Keke Li <keke.li@amlogic.com>,
 Richard Acayan <mailingradian@gmail.com>, Hans Verkuil
 <hverkuil@kernel.org>, Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
 Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>, Robert Foss
 <rfoss@kernel.org>, Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
 <00Bqu1G8ckuMSMUZq4Ph2pF6NhCu2qAmdpfLkZj4-eBLA4WqttxletHtUf4K_xlxVvRHOutfqdnUdaPrN28U5A==@protonmail.internalid>
 <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-66-ed985aefd611@kernel.org>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-66-ed985aefd611@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/10/2026 19:14, bod@kernel.org wrote:
> From: Bryan O'Donoghue<bryan.odonoghue@linaro.org>
> 
> Stream the AEC Bayer histogram on the pixel line's statistics node, as
> the V4L2_META_FMT_QCOM_ISP_STATS block CAMSS_STATS_AEC_BHIST.

One of the 3As - please add the other two :)

---
bod
