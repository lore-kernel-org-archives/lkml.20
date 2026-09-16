Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DD74BF945
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789584059; cv=none; b=YA2Y80q7wJ4s1bDFai+7H4ZeR0NIpoOOkUpO1rJsAGdQoJfsdsEUDIKdyDvVci8ZGu6rNX1uoH38zM+WJsMV8awhUPWL0Z9/hYiguA9bgMRTK7E+v87cvXNZLt+suNCy6zhCa5juXcoVKVxSSm9wec0w2a5O4Mr7JiTW7Bdbiww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789584059; c=relaxed/simple;
	bh=6gSQWeo0CKsow0qf0I3UnJne8rnvrPZ+CqrCInJ5ikY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sLTwjgEJ28uxp9RbInNgcf4lovKj1R0ONx8jhVdgIUM3I2557e3kpSt9IEKizU6+JY5kQI1fL28iJKW2MzGIDjRKPqvScOO04tMvF4vtFaJUCMpiTgNxgwv5Kv+SxhtLbCF9Z8+s0mQZsX39c5yL2TVITqhqrt5XZhW73T6iYGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hauc1dJC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jJ630MnT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hauc1dJC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jJ630MnT"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFeDGX2470101
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:40:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rChA2pDbGAG7IBP8U/Duy4CYoyeOvtSO+WAyNwQdmIM=; b=hauc1dJCUKmy60Pz
	mTbC4iqbLHdlNE1aVj1s4KLjj5O7c1R7o5yp233lxF9mPlcg8yteVPpHquV7xik2
	gYIxj0u30rYdRDCo8YKs8UfYpXlbG9X6dGFYFGpClZS0y504F9/f/gQBB7G5QmP/
	/WnKsNzNkTvBkvAapHE7OM962pxo/LtKGm4sd9m9HuMEzqJmb7jUPOBBflrbkFe6
	HTjpsvsR0klZv12Q888wZ49BN4wb/ULPO4uP/1nmcr29yaTYbkPLnalP/g1zkZm/
	qFnB6zwYyFjJlMbGb8nZo/Po+eCbucBiDoSfL67NX3twuqbqxQ9CNK0l5hXSfcKt
	Hb/TrA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqtn51tj9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:40:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so5182519a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789584037; x=1790188837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rChA2pDbGAG7IBP8U/Duy4CYoyeOvtSO+WAyNwQdmIM=;
        b=jJ630MnTKfiwHIvtBYrVW1Dd4/lWeW+NUMLappNSDOBIrrY1tseTqRIoLN4GV1MIE3
         f01UOpN8MXXpNNYMpkIIdZzdIGA8ej6sm2Q7XnYb8+dWKQ9rGzAp01Uqte7MxAtgdwDT
         CeSQrodAmYW0vyeLYbeeufyijWmxio7B6xTeLU6AChy2i/gsYCG3JMBYxe0I97tmislb
         vY4H0fMvYMxX/x+F2Aj3kZIa+g93B1OE5smH0FT2QPOAWThlCdKGz3D96GsD9jZ6kFIL
         EHSMJRuW6UYHsjv2n3BXixSLs4YYPtHgSE+Mbk4IF50izL54j3cy2JfiwroXxpqtTvUD
         BycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789584037; x=1790188837;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rChA2pDbGAG7IBP8U/Duy4CYoyeOvtSO+WAyNwQdmIM=;
        b=IHwGdMM0UNSpMApgvsY68COolFTP5q/jf84R2LewKFHTPtGb3LxjUegaTBUZ9XES/G
         Rl5xXJSVFvP5kv7vm+29n6KfUjGIfFfMx13pWnFNtvlNY8QEbSEqH/0G1Bpvg8oE/hrx
         BU00MVdFQp8lxt/fye+y2xKrSjyO14JcWMK5sRqgsKdJ6WpoKWBNjbLEpM3Co08LJmka
         uPPk5Cvfw5gGZJmoiBwL+NjT+fTKGnmCKoAAKq+1rpb7JK256fSffOJOAqWnT16MM0ga
         UrgKbBovyLDiW6/JRoMM7FSv+EudpjCmAqU+T+xabWnWXZxVzEYkeRh/o1Ld5eMgQ115
         PPNw==
X-Forwarded-Encrypted: i=1; AKwUvBzeKoUCrTL5abH2UfmbQivCTVJgb3GMD83voYMPE1/AXTkPDclvw78+/sy7/K+lybtBFtmuYY7GBzkmge8=@vger.kernel.org
X-Gm-Message-State: AFuF++lQppX42mfoL/B89yYCTtQaqLu4gP5ri/70QUddlpUCdallxcqc
	WZggcYPIb0iYb8/SniTFQbrYL8YdwoVxAYV1DNIT5fOkzLMgHarqbEp8nGomm9strk8i82E1g0W
	TaVjYo8oLxQKW3rxFGaaZRGzS1IKd63XoqWxH2NIH96m+OrmQFRa8oGvZPigTa3rF67E=
X-Gm-Gg: AYBFou0YX9o8Obzq8Vy3M3kdz8xz912VhBmjTxX3uE4C4sS0m0qI3aURZGZhQ+7qDUB
	uqHY5F0XouPcipBzs0b7HhyJwL/DiyoFUWy6dZ5zCM3D8zyaU8zfAcC8dTYd+bEZVNn2KcfWU+C
	o7968tTzqEN2FMpLXDakYoGIPEuqZ8AOkg/nXCbRFHEUwjFPIAQJEhFPGLzPJF8HLUkCSvyf9Ka
	MamEWsP8HnL+Ga9IHuO/bGa9WTjF1Xz0cWWUnEO3mN51A9o5zFDH6nSZboQue5QgqmmFpr6etXM
	etGOgvxiP+QRLC7cjGuIGsuW4RCJXbV32LMtFseQNRcxLadf+lrndyVvI/9OO1wQ5OgQmnJY7zm
	Jam7FEk7FgnsXIDyzHBDhTMS7AYdwI4aUVglGRMxUInUVo93nu1nnl8Qk8K33
X-Received: by 2002:a17:90b:56cc:b0:39d:eac2:7bb1 with SMTP id 98e67ed59e1d1-39e1e26378amr9823778a91.4.1789584037315;
        Wed, 16 Sep 2026 11:40:37 -0700 (PDT)
X-Received: by 2002:a17:90b:56cc:b0:39d:eac2:7bb1 with SMTP id 98e67ed59e1d1-39e1e26378amr9823664a91.4.1789584036717;
        Wed, 16 Sep 2026 11:40:36 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a175sm9590192eec.9.2026.09.16.11.40.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 11:40:36 -0700 (PDT)
Message-ID: <8c2dbacf-63ec-428c-b283-50198579cb89@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 11:40:35 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath9k: reject short WMI command responses
To: Pengpeng Hou <pengpeng@iscas.ac.cn>,
        =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hy?=
 =?UTF-8?Q?gensen?= <toke@toke.dk>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260814075837.20005-1-pengpeng@iscas.ac.cn>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260814075837.20005-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDI1NyBTYWx0ZWRfX5eBWyBjqZ9gt
 MaDSsRMw6PDv9aJrtS+qsAF0kuov3kz6lvkp/cbt5srPkeB/YRoAeoSdXeWEc9V0llZzwtX9pNF
 bqDFuzkPZ1DOXPQWdcnxxt1PWZU2SSAJVuUGYqc9xoGs+gjxDWWa3he4Tg2PHBj5POuSnSNYxA/
 OSmAQA3z3GZYq+D4HgNcX0NTxPQL9XIyln0V8wkGYSTzMh8dQia3Pp8Olny5OK1t0tdQbKNo+9U
 PMRP+3pDW1bYn1mDKsNQhuEoO+CH5vMhdwKFjvs0+gOVI7++1VZt3Vc/pJGqhVAEjWiNNEBay8b
 baFTuLIYI7wu/Of1gjBojuV9CMcSEZBWZKezdVv3E4vWDqKz5ntAwmAIaX2PWO932oA4loSWLst
 oG2R22KL1sm18bAx4VUniI/Qlvx+EJzkav2TxXqo8nnT65Jo4d8Q7Htupc7vXnf2bJvHqdTYjwF
 nJpcspm1G9Ncyd3Fr2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDI1NyBTYWx0ZWRfXyQJB0TE1Xljz
 c4x81wMIUjx5KJuNelYNjrWknvsxJORNi/vbHoq78ypQHt04yO0PbdYsCRQjUfo+B8QnJyVHl7m
 EEBpBV/GXFZvdNeybEz75wrlko8wcTQ=
X-Proofpoint-ORIG-GUID: f5h2SIAzCNLNIId79PBezDg5VolQTnke
X-Authority-Analysis: v=2.4 cv=K7O3jCWI c=1 sm=1 tr=0 ts=6aaae2a6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=gn-qI1OdAbPOfbCAwS8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: f5h2SIAzCNLNIId79PBezDg5VolQTnke
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160257

On 8/14/2026 12:58 AM, Pengpeng Hou wrote:
> ath9k_wmi_rsp_callback() removes the validated WMI header and copies
> the number of bytes expected by the waiting command into its response
> buffer. A device response shorter than that expectation can therefore
> be read beyond the skb payload.
> 
> Record -EMSGSIZE for a short response, complete the waiter, and return
> the stored status from the command path. This also prevents callers from
> consuming stale response bytes as a successful reply.
> 
> Fixes: fb9987d0f748 ("ath9k_htc: Support for AR9271 chipset.")
> Assisted-by: Codex:gpt-5
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
> Changes since v1: https://lore.kernel.org/all/20260704011405.55089-1-pengpeng@iscas.ac.cn/
> - return a stored response error to the waiting command
> - retain acceptance of replies longer than the requested prefix
> - recheck callback synchronization under the existing WMI lock
> 
> The WMI callback and waiter synchronization were reviewed statically; no
> ath9k firmware fault injection was performed.
> 
>  drivers/net/wireless/ath/ath9k/wmi.c | 17 +++++++++++++++--
>  drivers/net/wireless/ath/ath9k/wmi.h |  1 +
>  2 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath9k/wmi.c b/drivers/net/wireless/ath/ath9k/wmi.c
> index 284e8c13b043..06d9975f9717 100644
> --- a/drivers/net/wireless/ath/ath9k/wmi.c
> +++ b/drivers/net/wireless/ath/ath9k/wmi.c
> @@ -206,8 +206,16 @@ static void ath9k_wmi_rsp_callback(struct wmi *wmi, struct sk_buff *skb)
>  {
>  	skb_pull(skb, sizeof(struct wmi_cmd_hdr));
>  
> -	if (wmi->cmd_rsp_buf != NULL && wmi->cmd_rsp_len != 0)
> +	if (wmi->cmd_rsp_buf && wmi->cmd_rsp_len) {
> +		if (skb->len < wmi->cmd_rsp_len) {
> +			wmi->cmd_rsp_status = -EMSGSIZE;

my review agent notes that if this path is taken that there is no debug
message alerting this. see my suggestion on dealing with this below...

> +			goto complete;
> +		}
>  		memcpy(wmi->cmd_rsp_buf, skb->data, wmi->cmd_rsp_len);
> +	}
> +	wmi->cmd_rsp_status = 0;
> +
> +complete:
>  
>  	complete(&wmi->cmd_wait);
>  }
> @@ -300,6 +308,7 @@ static int ath9k_wmi_cmd_issue(struct wmi *wmi,
>  	/* record the rsp buffer and length */
>  	wmi->cmd_rsp_buf = rsp_buf;
>  	wmi->cmd_rsp_len = rsp_len;
> +	wmi->cmd_rsp_status = 0;
>  
>  	wmi->last_seq_id = wmi->tx_seq_id;
>  	spin_unlock_irqrestore(&wmi->wmi_lock, flags);
> @@ -356,9 +365,13 @@ int ath9k_wmi_cmd(struct wmi *wmi, enum wmi_cmd_id cmd_id,
>  		return -ETIMEDOUT;
>  	}
>  
> +	spin_lock_irqsave(&wmi->wmi_lock, flags);
> +	ret = wmi->cmd_rsp_status;
> +	spin_unlock_irqrestore(&wmi->wmi_lock, flags);

in order to have a debug message on length error we could drop the following
"mutex_unlock() and return ret" so that all paths go past out:

> +
>  	mutex_unlock(&wmi->op_mutex);
>  
> -	return 0;
> +	return ret;
>  
>  out:

and here log on error:
	if (ret)
		ath_dbg(...)

>  	ath_dbg(common, WMI, "WMI failure for: %s\n", wmi_cmd_to_name(cmd_id));

suggest adding the errno to the log message since now there are multiple
reasons it can fail

> diff --git a/drivers/net/wireless/ath/ath9k/wmi.h b/drivers/net/wireless/ath/ath9k/wmi.h
> index 5c3b710b8f31..0bb9d31f1a1c 100644
> --- a/drivers/net/wireless/ath/ath9k/wmi.h
> +++ b/drivers/net/wireless/ath/ath9k/wmi.h
> @@ -157,6 +157,7 @@ struct wmi {
>  	u16 tx_seq_id;
>  	u8 *cmd_rsp_buf;
>  	u32 cmd_rsp_len;
> +	int cmd_rsp_status;
>  	bool stopped;
>  
>  	struct list_head pending_tx_events;

