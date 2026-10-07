Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692EB3C13E0;
	Wed,  7 Oct 2026 08:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791362853; cv=none; b=oMhzFcESELKQNfsUDEhJFYzurZTfUTZFubYYSt+RBb+4ChS7ajlO5p+nwGVJPlwMoQ3PHPXR2m/Y7/ddGScyOS0TdE1AmqLGsnAuAqUUasWsccj35dhfARsiGJWBmk3l0Ak6sLxLX/LBUEnghfPT6QFhMaaT922CTKc5LIM3BiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791362853; c=relaxed/simple;
	bh=hQy7S2f9x6uZLIlrqab5k8HYvxjVLZwt+BI7TRi4F8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pnrt/Fns+21z+do4uoEH38AC+j8cHDAKS8t1Sb5fZKtv2Jg++yQkaNbhMYjPt26Uf7cSf22PJNVkCzYX00cZmX3zhDMNJhJv2EgnCDz9NoYK2urQSZiBZMrWUpztPu7QzZleGSet1Q/+1Ys1M8iAQMic3BOLfyeAoGoFFv96XPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nv5NX0ym; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nv5NX0ym"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D781F0089B;
	Wed,  7 Oct 2026 08:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791362852;
	bh=AhbaAMYOIexO3luvSwjYMbSkAHV1umFIM1bbfMlZNgk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Nv5NX0ympPfVNHVNN1ohbQIYeFIzyZrCXSegTzHiJTvbafzuYjeC7MakpUmGKfsrk
	 c6bGjTh/0YOwRS4AqufBNGq41AlpTT4YdJF+AGfhTf9S7IdfFENDLTIARSvJ973IEd
	 dVX56bJsNP+W49gUmBlqI6brLUw+aWHB8rHjdFRcanWRT3A855psOmx7n7Z3JS21or
	 thatcXAD9WeAyNV3qL3H+itewdP+ldJoi00z0LZDBthbH3TIXrB+ODoY7EqgyNB/N4
	 jjh9IGG+9T+as5TvIlw3ultRr7wjY/8Jimf9kzgx2Ml5sjM7J00Hhsf89U1rX+xYfC
	 q3/v4fiBAsgRw==
Message-ID: <b5165111-4c6b-44f4-a513-7cc3f6b3f362@kernel.org>
Date: Wed, 7 Oct 2026 10:47:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 74/74] media: qcom: camss: vfe: Pass the write master its
 address again
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
 <74xl_UcQezR4se_5kKTWdlbK8tlHduUDbAt84RhQVaLtFbS9ErD4M57hnsPX89IACVk3B4NtVfmGwIvAPM5gMQ==@protonmail.internalid>
 <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-74-ed985aefd611@kernel.org>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-74-ed985aefd611@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/10/2026 19:14, bod@kernel.org wrote:
> From: Bryan O'Donoghue<bryan.odonoghue@linaro.org>
> 
> With vfe-780 programming its planes through vfe_output_update(), no
> backend needs the buffer in vfe_wm_update() any more. Go back to passing
> the write master its address.
> 
> This reverts commit "media: qcom: camss: vfe: Pass the buffer to
> vfe_wm_update()".
> 
> Signed-off-by: Bryan O'Donoghue<bryan.odonoghue@linaro.org>

Note to self - "so drop both"

;)

---
bod
