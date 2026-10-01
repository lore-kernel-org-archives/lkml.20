Received: from mta0.migadu.com (out-149.mta0.migadu.com [91.218.175.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED2441611D
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 10:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852058; cv=none; b=YpTd3xW8vWlqvjkg8ZF1l7Fru85Oy8nLrBc9QLSgMttCtSWEf3rJamk+S87ueGM/nNQsIC04as1FuWuLkaMSNSkkrGs2lJztxjskhwyh939CR2fqcwDlEOF2ydwCb3TBKU0WrBg2FZGnWtJDTqWdp61qZeI+WTbZJ21zYOP7bdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852058; c=relaxed/simple;
	bh=PdIdCaC9+u6xQjIon2IGfrMBc8e7uESlYGA7i1+zusA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lr/j35UOeOBU8/tw5Wv5KQSeE9QT3doiZi7QXZZ6mSBDBAUOHVhGTsze1XMR5lxUu2fV/esqZ7ZsWOnV7J44GxYKpdNcG6lDu4JUe8GNZqEJgNYDFIOjJCP/TTnTMGo/tmoYA98xhG82UbW5PBQq6kGN7r+F25U2HHL90b73AxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Z/JaLTVr; arc=none smtp.client-ip=91.218.175.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Z/JaLTVr"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PdIdCaC9+u6xQjIon2IGfrMBc8e7uESlYGA7i1+zusA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790852054; v=1; x=1791456854;
 b=Z/JaLTVr5PHin13JPNCSwXnL+7f/38OCSQ0r8BVDFDZbNN5ZGroKaliR+nByF9hGVhjVrGrc
 XgK1N5XamYPdEr3bym/O+6QP6DMNDL6y4WiyvAbo5qAVDIZs+aDNrozqVZ7HgOHCkImd+TOheZ1
 GjlAIL2DEz0w9rW0TQzIOcRw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0d1059f48ad0f9d0;
	Thu, 01 Oct 2026 10:54:14 +0000
X-Mizu-Trace-ID: 0d1059f48ad0f9d0
X-Migadu-Flow: FLOW_OUT
Message-ID: <0ca6ee6a-020a-4705-8323-d524a813d3b5@linux.dev>
Date: Thu, 1 Oct 2026 12:53:07 +0200
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
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20261001093806.634862-3-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> @@ -192,6 +194,13 @@ struct qcom_swrm_ctrl {
>  	const unsigned int *reg_layout;
>  	void __iomem *mmio;
>  	struct reset_control *audio_cgcr;
> +	u8 num_lanes;
> +	bool is_dependent;
> +	struct qcom_swrm_ctrl *peer_ctrl;
> +	u8 peer_first_lane;
> +	u8 num_peer_lanes;
> +	bool is_primary;
> +	u32 peer_dpn_offset;

nit-pick: do you need both is_dependent and is_primary? One would think
that a single variable would be enough, no?

also without context it's hard to understand if lanes are independent in
terms of transport or not, not sure what 'peer' means in a multi-master
setup with a primary controller and N dependent ones? Code like this
function below is a bit cryptic...

> +static struct qcom_swrm_ctrl *
> +qcom_swrm_port_target(struct qcom_swrm_ctrl *ctrl, u8 port_num, u32 *reg)
> +{
> +	u8 lane = ctrl->pconfig[port_num].lane_control;
> +
> +	if (ctrl->peer_ctrl && lane >= ctrl->peer_first_lane &&
> +	    lane < ctrl->peer_first_lane + ctrl->num_peer_lanes) {
> +		*reg -= ctrl->peer_dpn_offset;
> +		return ctrl->peer_ctrl;
> +	}
> +	return ctrl;
> +}


