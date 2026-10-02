Received: from mta0.migadu.com (out-1.mta0.migadu.com [91.218.175.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C84439F75
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 07:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790926648; cv=none; b=fHXL3VoGhNYrWfxU8ysFoXhRH/4IuLrxN36GuRkZl4ehfVC+BEQHnOb5dxqAG1X3qPm3e/JfFQxWX9T79hSVAum8oocRTUkq/ilGxf/MFTcjkQCK+PYpEu6DKnI6XiJzZYiTLpyqklbSAsqLOV4Nhjuha7DOmuruQB/omWrDEXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790926648; c=relaxed/simple;
	bh=VNSQiIS78JUU7jt6pwfNNsQymSeowY/qAakTDZ+Qxos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hOamUBrqjGe/4rEL+FiykehtxU6dCq5f4xAdStS89MD15v1yZyxJnLNuKIj+lPLTZJW3ufpJBkyswxemqt3KByNFeoz5cW1sxyvnWFV+8KG1EQZf+1+L0IYhpOcYi3fWYrLNXqW1PxFENlpYoRMR/aE89FKaBBSmoMpw1riW//Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NRKrm1Eh; arc=none smtp.client-ip=91.218.175.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NRKrm1Eh"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VNSQiIS78JUU7jt6pwfNNsQymSeowY/qAakTDZ+Qxos=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790926644; v=1; x=1791531444;
 b=NRKrm1EhkfYLkEFXQFQnauFXEN/06F8qL2cFZBkaxVNpb4qIwkeIDKoUKIa4AqjVquMA8jhn
 InwY0KXv6JKzPBY3HAtOxV1o91fZ2AERXPee3SoD2+hcb/8OdEodtWJrKLzU3UsxJJ5ZasOmZJT
 v8tSxPlyLT8+dVVNcm94VlR4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id eac74f2a29dc7846;
	Fri, 02 Oct 2026 07:37:23 +0000
X-Mizu-Trace-ID: eac74f2a29dc7846
X-Migadu-Flow: FLOW_OUT
Message-ID: <5363165a-fdc2-451d-96f0-43d2d70e19de@linux.dev>
Date: Fri, 2 Oct 2026 09:36:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] soundwire: qcom: add multi-master support
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 robh@kernel.org, vkoul@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org,
 yung-chuan.liao@linux.intel.com, prasad.kumpatla@oss.qualcomm.com,
 jingyi.wang@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
 quic_srivasam@quicinc.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20261001093806.634862-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261001093806.634862-3-srinivas.kandagatla@oss.qualcomm.com>
 <0ca6ee6a-020a-4705-8323-d524a813d3b5@linux.dev>
 <586046f1-8439-4353-b60d-dab6356de3ba@oss.qualcomm.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <586046f1-8439-4353-b60d-dab6356de3ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/1/26 13:06, Srinivas Kandagatla wrote:
> 
> 
> On 10/1/26 11:53 AM, Pierre-Louis Bossart wrote:
>>
>>> @@ -192,6 +194,13 @@ struct qcom_swrm_ctrl {
>>>  	const unsigned int *reg_layout;
>>>  	void __iomem *mmio;
>>>  	struct reset_control *audio_cgcr;
>>> +	u8 num_lanes;
>>> +	bool is_dependent;
>>> +	struct qcom_swrm_ctrl *peer_ctrl;
>>> +	u8 peer_first_lane;
>>> +	u8 num_peer_lanes;
>>> +	bool is_primary;
>>> +	u32 peer_dpn_offset;
>>
>> nit-pick: do you need both is_dependent and is_primary? One would think
>> that a single variable would be enough, no?
> I did try to do that which made the code bit confusing to read.

ok

>> also without context it's hard to understand if lanes are independent in
>> terms of transport or not, not sure what 'peer' means in a multi-master
>> setup with a primary controller and N dependent ones? Code like this
> For now its one, but Yes, technically we could have more dependent ones,
> I wanted to keep the patchset simple and right now the only have one
> peer and i dont know if we have other setups with more dependent
> controrllers.

even with 2 controllers, the 'peer' naming conveys a concept of equal
status/rank/ability, which isn't quite the case, is it?

>> function below is a bit cryptic...
>>
>>> +static struct qcom_swrm_ctrl *
>>> +qcom_swrm_port_target(struct qcom_swrm_ctrl *ctrl, u8 port_num, u32 *reg)
>>> +{
>>> +	u8 lane = ctrl->pconfig[port_num].lane_control;
>>> +
>>> +	if (ctrl->peer_ctrl && lane >= ctrl->peer_first_lane &&
>>> +	    lane < ctrl->peer_first_lane + ctrl->num_peer_lanes) {

and what I meant here is that it looks like there's a special
distribution of traffic between lanes?

This is not really well-documented in the MIPI spec. On the Intel side
traffic can be moved at will between lanes, but it's not a requirement.
There's also no MIPI guidance on how lanes are used e.g.
a) a new lane is used only when bandwidth is exhausted on existing lanes or
b) all lanes are used and clock is scaled according to bandwidth needs.

>>> +		*reg -= ctrl->peer_dpn_offset;
>>> +		return ctrl->peer_ctrl;
>>> +	}
>>> +	return ctrl;
>>> +}
>>
>>
> 

