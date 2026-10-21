Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792584505;
	b=5Jb6Wp/iajyyTrvvyZlBYwXf0dVEYiftDb/VHJJJ+kgTmMiT6pECMKv9Ssj8cwRDLwOY
	 LcQf/R6vJQYFeo6g+Z7NcRm/NdHtscUvftTaO9SnICu+WVpiEuEH0DK6xaVrt+Zi0BogV
	 ceq+GybU4td+Ss/Ljgxj7qbhXkFjcQiZZgiwlPAFl0ip5O2aMSLARcksqubSzYS/6FoyQ
	 oP4imPlwp7c767OisxaDAdPycdYv7c99Fm0NFq2T64+dP8C021yDsV8xLb0WwlPReNJEI
	 IQCA8sn8bUjiDubh7K1pvFkdWn0OUdwChH683NIfBD9z95dp9uMT+R1vM37Nib+QLZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792584505;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=qc9sPLphgZ7QSWhmy8R5+v9PeXT7acWu+WtEs/0esaA=;
	b=KuQXiqM/rFn7TA/rnI4GJ4Sx3ktenA9/LZAM1Oh+olXPdMqg1sgj2ZBQM5BRUmzprfRK
	 SL993SJghum0jPpDNQE/uXOGr2nE8L6VZ7UJHqORFz1A6jqMvZTLM/39QfCXhCMSbvH4c
	 tDcLloUHy3yC3+Dg0IUaAc0GR5Nm6XeJG9AacuNQBrTTG43TplpCdTDpJbtR8aqFm5jiY
	 VuJton5dcQ7+OtpcEy2RDQKeLQbv3qw8xDVP2iRQd6Hrh9cRNVx9SXNGQqfvOh4YHrAde
	 WdXj6vAe/kYSIKuqZAsnbl77SOiBs7OfksoMDcHBFYNglG7Cjo/3e7DaEhmA3WDt3ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vq786MKU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02FF606A319;
	Wed, 21 Oct 2026 12:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vq786MKU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B54DA1F000C4;
	Wed, 21 Oct 2026 12:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792584504;
	bh=qc9sPLphgZ7QSWhmy8R5+v9PeXT7acWu+WtEs/0esaA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Vq786MKURiKZ5k195eYF07FNPCGCfvd89jSJNH3in6w/tygog5IdgOCbphRK47a3y
	 nq2r9wBK0Q5wGA9WS1mjHSDRLwvgtpSEWxAAc57z5qasBi5mYcqrKvmcyHNQHtXGDy
	 54RDsqbsH2SNzl9Z3sK1tE7/bn2D7m+k6K9J431YSbro75H1sAW0+ddHJuGQNp0CGD
	 tPogXKa63owmZOjUakOpW6tF1pOBFTOqaZ768yZMN8bHDheXTILfT7W6K6pnnsbSpw
	 nQcnqt1YSzybetkJc+PFQ+o8MmKAFtLg3jC6IslmNI0Ly8f7PDgJvRI8Nhnve6KEdF
	 Hh60LjJjFnmBg==
Message-ID: <95d92a33-df2e-48b4-a2ff-89b00a61aa89@kernel.org>
Date: Wed, 21 Oct 2026 14:08:13 +0200
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
Subject: Re: [PATCH v2 02/13] dt-bindings: display: msm: Document the Nord
 DiplayPort controller
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Ritesh Kumar
 <ritesh.kumar@oss.qualcomm.com>, Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
 <20261012-nord-drv-dt-v2-2-a2ab9af954d2@oss.qualcomm.com>
 <20261013-tangible-wakeful-swift-a38f8f@quoll>
 <20261013-honored-bear-of-cleaning-bd8108@quoll>
 <425ddb41-cfd7-4032-8666-0193ab6b5819@oss.qualcomm.com>
 <565fd4c2-2d5a-4c2a-9ed1-c7bcb17efc9d@kernel.org>
 <dd18e6d5-cb7b-407f-8e7a-2c6fd00359cb@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <dd18e6d5-cb7b-407f-8e7a-2c6fd00359cb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/10/2026 14:00, Nabige Aala wrote:
> 
> On 10/21/2026 5:23 PM, Krzysztof Kozlowski wrote:
>> On 21/10/2026 13:16, Nabige Aala wrote:
>>> On 10/13/2026 2:18 PM, Krzysztof Kozlowski wrote:
>>>> On Tue, Oct 13, 2026 at 09:44:15AM +0200, Krzysztof Kozlowski wrote:
>>>>> On Mon, Oct 12, 2026 at 07:02:12PM +0530, Nabige Aala wrote:
>>>>>> From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>>>>>>
>>>>>> Nord uses MDSS 12.1 with two independent DP controller instances,
>>>>>> each exposing two DP cores at new IO offsets. None of the existing
>>>>>> compatibles match this layout, so add qcom,nord-dp.
>>>>>>
>>>>>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>>>>>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>>>>> Do I understand correctly:
>>>>> Device is fully compatible with qcom,sa8775p-dp, but a simple to fix
>>>>> driver limitation is preventing compatibility?
>>>>>
>>>>> If so, let's fix the driver - just add more addresses to the
>>>>> msm_dp_desc_sa8775p array?
>>>> Or it does not matter, because top-level MDSS anyway cannot use
>>>> compatibility?
>>> For MDSS0, the DP register offsets are same to those used on SA8775P.
>>> However, the MDSS1 DP register offsets differ from SA8775P, and Nord
>>> also utilizes a different MDSS instance. Because of these differences,
>>> we introduced a separate compatible string for Nord.
>>>
>>> Are you suggesting that Nord should reuse the "msm_dp_desc_sa8775p"?
>>> This would also pollute the sa8775p's desc table.
>> What are the differences? Only registers, so no pollution. You just need
>> them to match IDs.
> 
> Yes, only registers are changed.
> 
> Okay, I'll update the SA8775P descriptor table to also support Nord and 
> drop the "qcom,nord-dp" compatible string change.

Well, I am not insisting - see my last question - this just has to be
addressed.

Best regards,
Krzysztof
