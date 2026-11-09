Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794210827;
	b=u9Takek9+CEDthBtrdFiM6/6txFOSUHsJmTcuCZK98iU3juneDrdvX39UmrO4Kvgs/PW
	 C+iYdXWuZWDAobmt8rbK7rNvL8rI0wCrUv2dzhz2wGZ57bcp4ibkXn2jbYKdF0EMtb5Vj
	 S5HzQ1JtQ2YXGTEDWhXmZRw/R+GCb9InbeP3g1OwsJ+1RdKWv5ckrjuFyUmQkIk0dQL6f
	 ovp8VD5IZnIeT46CUM739Kvl01MDSZxm58JX7ncHne3sPm7w2WDmaDfVlH+z+ji2LDoUX
	 NNu5nD9Mjcrifm1Lw+7gDkmK2pdVVNhkp/eZEIjDoxGF41jUzcbQ5c3XHiwqKMXTExw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794210827;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:Content-Language:To:Cc:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=o+haZWFojym2Cv7RGNTo1dLDTnfV5B6AZEJXSj/GaWs=;
	b=axNHgBaadu++m03MRFp1BnrNIABebAYhj+2TNIybplm5YgG8xdP8ripBSAL6M7OUbNm3
	 HShnQbUcOHmsFaZxKhSHNyS2sugFNZ7AlxjycvBYPJw8By9xdqMiRrBOihinFpiDzRzDP
	 LgMX528/MWL394hI5pwTxpyY/qHdi4o18zK5Jhqvoj7yOl9vgQU2xCcjDQsLYYrduuRQ/
	 eCdgHotkmC280lFcbt5GtnCzez5d/bZWfNrIfGAjF/YC/7Py2zsQ7Kb0d+8d/BHi2Iifp
	 vsHBrWx14ubJNZBRN7sCsdwpe327Recx9gu/Nkgy45/NE9ZoBSqjU2CIHTPR5uYT2tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mwM0zqzP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b90r7U7d;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C522606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C522606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mwM0zqzP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b90r7U7d
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96AWlp066277
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 07:53:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o+haZWFojym2Cv7RGNTo1dLDTnfV5B6AZEJXSj/GaWs=; b=mwM0zqzPE6GbLpxf
	fPNNojxyfYZePnBTqYOCrYvsGhQc2rrkol1ZfbQ0XXT9kajSnpYIV61DfyfK3c7K
	MK2DX7MjIcC8XkVNr5QrB7PqnqUZfZkErmJ0bfXPAzzl9dnzcxds/J2JRXyWk7IZ
	kFcbBh/orXJNJ+L4Ht6g5UnVWFOKbNy/ad3GI/yDT3o5yyJRyt120Dg/LSe8SeBq
	99U8/4iZI08rtlVGptz09iH2SdFdiUVseuDqxbdDHemspBUeYyyhrn/34rVIwHXc
	4Z2u8GpGTwoGbJgFSBv4wclj6TnnAgcw+0O9FA1baVlD6D8N0WYOnDH45SPMrxtp
	dDG4rQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxdcqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:53:45 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so1766471eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 23:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794210825; x=1794815625; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o+haZWFojym2Cv7RGNTo1dLDTnfV5B6AZEJXSj/GaWs=;
        b=b90r7U7dsFEs2gLNFOEJSRjMDRwLvlfcAfYWu128wF11lkbTstsrnwfb2rkrAAlTbO
         PhwE/dpqBu8m2e9BtGl4PlpbiWYHznMDk4W9LKz22/UHwWa6ktqIDuEsMbSYpQvgLdFu
         xBsziTcclobRIRI736MC/dOt97wLBrF/pfXRzWZ8UGiT76uuPmVKXs0xiGjasJ4x5EXG
         4JRo3PKhaawsJq5PBZJOzgcM7Q8qmXWkLQgqg6Ab41MqKc0M0Hu1C2NcaE5bsfE/w0Cy
         U5xhgbNwN+u/HPsq0WdxJUN+CyKJ2nvWbEc2NCpPlh0+Js73/W6/paHRDJyS98xS9HNo
         rd3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794210825; x=1794815625;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o+haZWFojym2Cv7RGNTo1dLDTnfV5B6AZEJXSj/GaWs=;
        b=aU8huvuEWdBhTzHjfeG2uqLhRZlGW0J/nVgnsRJWt9sLIpqiZES87b1W6W1nPTES+8
         TYqHKlxYUIfEHCEyaMEwhTTfMvuElKZwR7fCVOfsXX2OOJ/txIY2CvT/QdJ+D58DwuwD
         QAsMRy3p0l+I8kl6vGDryatmxupM34jxsbhLTAiiei3DBIs9JlPXeKbuTHfhlS7g2pV3
         hUI61I+8ajfwfpp7jzkbTHua+zXbPb7HZmWY93h/EzQ7DUu9B9aqF9J8gNwucef7qltt
         Cs7/r4mQ6OLIsWqHZjKf+S+FDXbZ2WCKN8G0uKrbWo8IkxUA3wDTNg+yQcsWwBrpsZvy
         rKGg==
X-Forwarded-Encrypted: i=1; AL+hErERcoCT69jrlNgGtSXCNlm/qD5K4xhl6k4UJr3ce4tF4w9K/VDUwAdbDHpCpBGNSFvjsrYI4f/XAxjSgRs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZS9KGL5m+BngydsT4tb4B2XY3fApETajc0zQ1RpVqyevOPRPi
	io8o76PW6IPgeGKy5CHy2AuLevBbmJlyeyBiCPRVbhgpiNiRoQ5+EhOsC+UAVo7tXs98DFUPWD/
	b5EX6148TzC+dY0ItKtdUvPk4Cu0D5G5DokXxYI4t3XgJq66b2fO/f/5MtkwhBIFwFeM=
X-Gm-Gg: AYBFou3GjIxXhSComknkLfmk038wMfVbC3UIFsbXmc8NVJfNHr7sKPvD+rBhLilAIXK
	F8LyxGneTR54bNANPh+81lGRF8cYzcn7cI2EXZJ5KETtpoyqEaFCh7Ktaz08zISIXu8KVl6Rhrb
	SJOa+ICzl5IuQHndtAYhbn9r3vv5r2QjbxJG2K1d6/OID4T0Rc5ht5sO5FPzW4kAL8UZWdqwx3F
	za187zr6Cv79hre2YKKmLs3XDG3sUZzYlvCzkrvVLDxvKgrrQ/Wc8ojtEsCBZmwnjc3NU03oxku
	z+38mkASMcZbbNK7V10kB3A/xeeNmc0CjNxWP6qeSFE2vonYCcuGJzh3P/1DQ0qFgVfghGowyLm
	GJWxETpBD//HlPZSEuElorrwcWr51fZQvFhVMlMJzgCfFHMYtd4y+8+RmZRdAZrJ1mvBufzTN7d
	CXqFc=
X-Received: by 2002:a05:693c:4003:b0:36a:1f4f:3e9 with SMTP id 5a478bee46e88-3725d782bc5mr5640838eec.20.1794210824261;
        Sun, 08 Nov 2026 23:53:44 -0800 (PST)
X-Received: by 2002:a05:693c:4003:b0:36a:1f4f:3e9 with SMTP id 5a478bee46e88-3725d782bc5mr5640810eec.20.1794210823672;
        Sun, 08 Nov 2026 23:53:43 -0800 (PST)
Received: from [10.204.100.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372669d2826sm11874478eec.29.2026.11.08.23.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 23:53:43 -0800 (PST)
Message-ID: <cf7b6956-90a7-ac3b-1b2b-545f95a14117@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 13:23:37 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/3] media: qcom: iris: Improve diagnostics for system and
 session failures
Content-Language: en-US
To: Dipayaan Roy <dipayaan.roy@oss.qualcomm.com>, linux-media@vger.kernel.org
Cc: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        abhinav.kumar@linux.dev, bod@kernel.org, mchehab@kernel.org,
        p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261106153126.120858-1-dipayaan.roy@oss.qualcomm.com>
 <20261106153126.120858-4-dipayaan.roy@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20261106153126.120858-4-dipayaan.roy@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KmBLV-5XBqPhfjJPaOOOcl2i3BykEw9D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzMSBTYWx0ZWRfX7WpG3Cel5c3Q
 RPE4fiahjFZJjAmFZRRov6hq9SiOg3Kw/as26xVZBT98PFw3KZtV9gAO9o+iIrYIzCxRcnWrBbZ
 Ytk5K2U9YaODS4PbtP4wlWU83oI0j3dXp97A6/6t3pwH18duw/8pGI9k8x1IHCNC5yoLJZywRlr
 6UbFDDl7ApdFTYZMS1EXS3P39RxefqzIwrUkM03JU4Q48jEShlj55b1cGW0+F1HsIslvFazRkaH
 UDUSr8xZvm35ChGeXEfGrftFjFQpzdQxbxVyQH/o1TkkCT8NVHmJlPIRAqRsUfwdpvAxPQ64RIv
 earKG801O9KRFT4YcTlIg4fN4MO3dXn7wA9XhQpHLffNSOGyZyo/Vh0nD9Pia5MYC9a8hrma5VA
 r32oga+UYAEGxMSrpADbC5wtB3PHEYRfD6wAlhYuuS8v0dkZb+ZifZiVh6du5XdlLz3TR527D25
 R47Ef8OgyBv6HeK90bg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzMSBTYWx0ZWRfXz2FePpAKBWXg
 VPmrYTQW7dQMcjl7Ynd5qoxvd9gzcC5X98hp4IBzJNH/IIfmDm/tLhze+SXsHauPKo0RLhkeLvs
 L9NiDferWqMGQuerIO9gCPfgoD/YJlc=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af17c09 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Fb52MO1wo91ysUZOzKQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: KmBLV-5XBqPhfjJPaOOOcl2i3BykEw9D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090031


On 11/6/2026 9:01 PM, Dipayaan Roy wrote:
> Log system and session response timeouts, firmware-reported failures,
> and failed recovery attempts so the cause of an error is visible.
>
> Add debug messages for unknown sessions, invalid state transitions,
> and successful recovery. Avoid a redundant system init timeout message
> after firmware reports an error, and rate-limit Gen2 session response
> errors.
>
> Signed-off-by: Dipayaan Roy <dipayaan.roy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_core.c              |  2 ++
>  drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c |  8 +++++++-
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 13 ++++++++++++-
>  drivers/media/platform/qcom/iris/iris_probe.c             |  8 +++++++-
>  drivers/media/platform/qcom/iris/iris_state.c             |  5 ++++-
>  drivers/media/platform/qcom/iris/iris_utils.c             |  2 ++
>  6 files changed, 34 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
> index d558475986ff..4224feaf1caf 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.c
> +++ b/drivers/media/platform/qcom/iris/iris_core.c
> @@ -43,6 +43,8 @@ static int iris_wait_for_system_response(struct iris_core *core)
>  	ret = wait_for_completion_timeout(&core->core_init_done,
>  					  msecs_to_jiffies(HW_RESPONSE_TIMEOUT_VALUE));
>  	if (!ret) {
> +		if (core->state != IRIS_CORE_ERROR)
> +			dev_err(core->dev, "system init response timed out\n");
>  		core->state = IRIS_CORE_ERROR;
>  		return -ETIMEDOUT;
>  	}
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> index 1ce7f97d4087..5c411e69e5fd 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> @@ -284,6 +284,8 @@ static void iris_hfi_gen1_sys_init_done(struct iris_core *core, void *packet)
>  	struct hfi_msg_sys_init_done_pkt *pkt = packet;
>  
>  	if (pkt->error_type != HFI_ERR_NONE) {
> +		dev_err(core->dev, "system init failed (HFI error %#x)\n",
> +			pkt->error_type);
>  		core->state = IRIS_CORE_ERROR;
>  		return;
>  	}
> @@ -740,8 +742,12 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
>  			struct hfi_msg_session_hdr_pkt *shdr;
>  
>  			shdr = (struct hfi_msg_session_hdr_pkt *)hdr;
> -			if (shdr->error_type != HFI_ERR_NONE)
> +			if (shdr->error_type != HFI_ERR_NONE) {
> +				dev_err(dev, "session %#x response %#x failed (HFI error %#x)\n",
> +					inst->session_id, hdr->pkt_type,
> +					shdr->error_type);
>  				iris_inst_change_state(inst, IRIS_INST_ERROR);
> +			}
>  
>  			if (pkt_info->pkt == HFI_MSG_SESSION_FLUSH) {
>  				if (!(--inst->flush_responses_pending))
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index b82f50458fe1..d5b4b27e0549 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -296,6 +296,8 @@ static int iris_hfi_gen2_handle_system_init(struct iris_core *core,
>  					    struct iris_hfi_packet *pkt)
>  {
>  	if (!(pkt->flags & HFI_FW_FLAGS_SUCCESS)) {
> +		dev_err(core->dev, "system command %#x failed (flags %#x)\n",
> +			pkt->type, pkt->flags);
>  		core->state = IRIS_CORE_ERROR;
>  		return 0;
>  	}
> @@ -929,8 +931,11 @@ static int iris_hfi_gen2_handle_session_response(struct iris_core *core,
>  	};
>  
>  	inst = iris_get_instance(core, hdr->session_id);
> -	if (!inst)
> +	if (!inst) {
> +		dev_dbg(core->dev, "response for unknown session %#x\n",
> +			hdr->session_id);
>  		return -EINVAL;
> +	}
>  
>  	mutex_lock(&inst->lock);
>  	inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
> @@ -958,6 +963,12 @@ static int iris_hfi_gen2_handle_session_response(struct iris_core *core,
>  			if (packet->type > range[i].begin && packet->type < range[i].end) {
>  				dequeue |= (packet->type == HFI_CMD_BUFFER);
>  				ret = range[i].handle(inst, packet);
> +				if (ret && !(packet->flags &
> +					     HFI_FW_FLAGS_SESSION_ERROR))
> +					dev_err_ratelimited(core->dev,
> +							    "session %#x response %#x failed: %d\n",
> +							    inst->session_id,
> +							    packet->type, ret);
>  				if (ret)
>  					iris_inst_change_state(inst, IRIS_INST_ERROR);
>  			}
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index dd48fa750013..9cefe090466b 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -306,9 +306,15 @@ static void iris_sys_error_handler(struct work_struct *work)
>  {
>  	struct iris_core *core =
>  			container_of(work, struct iris_core, sys_error_handler.work);
> +	int ret;
>  
>  	iris_core_deinit(core);
> -	iris_core_init(core);
> +	ret = iris_core_init(core);
> +	if (ret)
> +		dev_err(core->dev, "failed to recover from system error: %d\n",
> +			ret);
> +	else
> +		dev_dbg(core->dev, "recovered from system error\n");
>  }
>  
>  static int iris_probe(struct platform_device *pdev)
> diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
> index 5552725c614e..bcb138ccf08c 100644
> --- a/drivers/media/platform/qcom/iris/iris_state.c
> +++ b/drivers/media/platform/qcom/iris/iris_state.c
> @@ -56,8 +56,11 @@ int iris_inst_change_state(struct iris_inst *inst,
>  	if (request_state == IRIS_INST_ERROR)
>  		goto change_state;
>  
> -	if (!iris_allow_inst_state_change(inst, request_state))
> +	if (!iris_allow_inst_state_change(inst, request_state)) {
> +		dev_dbg(inst->core->dev, "session %#x invalid state change %x -> %x\n",
> +			inst->session_id, inst->state, request_state);
>  		return -EINVAL;
> +	}
>  
>  change_state:
>  	dev_dbg(inst->core->dev, "state changed from %x to %x\n",
> diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
> index 1096cc4b01c3..5ca4d8e0836b 100644
> --- a/drivers/media/platform/qcom/iris/iris_utils.c
> +++ b/drivers/media/platform/qcom/iris/iris_utils.c
> @@ -78,6 +78,8 @@ int iris_wait_for_session_response(struct iris_inst *inst, bool is_flush)
>  	ret = wait_for_completion_timeout(done, msecs_to_jiffies(HW_RESPONSE_TIMEOUT_VALUE));
>  	mutex_lock(&inst->lock);
>  	if (!ret) {
> +		dev_err(inst->core->dev, "session %#x %s response timed out\n",
> +			inst->session_id, is_flush ? "flush" : "command");
>  		iris_inst_change_state(inst, IRIS_INST_ERROR);
>  		return -ETIMEDOUT;
>  	}

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

