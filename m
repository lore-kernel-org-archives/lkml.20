Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793296978;
	b=a7utoyTYjTv2S0t9sWJlojPgvaZgUApYqQnRAcIBCm3OEjonTyEAQu3gLa7uAGY2131z
	 vEJ5vAVAaUMLjjc1HDaOvLBqYjz+FSSW5XLFjaePwEiDZe6PEDOHz+RVVxKn8hMgewxBN
	 mFES9FpFfcNcIvC93h9Rm/knNBl+CHNhLC+G3ZDBr9qS5VMApvTD+OecQMWAVojzVyiXw
	 iTGJNREEQMhZpIZ+uzk5h201O9Mgvjf2CiKfcNHxBTg307RC9vSDnGmTrdR5BvIGlMCva
	 a2PWb06vm/JOQDvgw06K0Hbs9lyNvOuzNbrM4bqS4CDJ83vAh6nV7Y3JrApwYzzi6Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793296978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=p/lwM6aKVbeVX9E+nb8lJFGnESDw/RwCj1wwSe0sy0M=;
	b=0S+d6xuJ1yj94VHx9aefdpxYw7KRzxsoKBV+EDRmu40NeVl3JX0GovbgehW0DGaMXhzF
	 pKrvlTN/9umtN9geOyrkjm6pE2aiJNqqpxTy3j1YGMv6tebl7wdA0GdIncDJ9HtDsk9jr
	 UsiutMMLynex+7tBas2sbrxYFiqlCu+VIcBycEr/scX8xCeBCCjD/+N4SSvoW6PXcvWjj
	 9jXovYMEw8O45hLJWXWcJuwN/PS75jI/dqs08qz88qoSrjZ746SZ3z85kR6Xl6PPvzOw1
	 a95PLY99ImQk8ZwDSZV18kKFNnSL1IiTH9lAEMhXRgjf3ANFHRswgTwSbH7KAQZTqeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=HwHeGpt6;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABE1606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:02:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ABE1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=HwHeGpt6
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-846566246e8so1054267a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1793296975; x=1793901775; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/lwM6aKVbeVX9E+nb8lJFGnESDw/RwCj1wwSe0sy0M=;
        b=HwHeGpt6EFOcB8ApjWct2c02zlx67RnQZXZUwBAbbeOfUH70tNE4CWqx4SM/5tAfFm
         EjsXVWM42yqmTUoibgcYUBlR0fnVv+LN+T4HNMqb8ufogOT0SWLU48i+V2FePct49nBG
         uYRv+k2/EeH/bHALaeNK7NisZZfFeQLRxQzwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793296975; x=1793901775;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p/lwM6aKVbeVX9E+nb8lJFGnESDw/RwCj1wwSe0sy0M=;
        b=VUzrYunRpfXX1K1SGHij2LfxxJ7KIHG6seLNl8BMI+QdjQrZ+jKTpljRBoYn/bTmQ/
         2V4DC+okg7NTai789DGurW/8Z1QWstJBK/AM6XlMQE95hbEmwQAZCFeOXP3W/mV4XNB0
         jRgH3NakSx19rk/xA6Xconx7cwX5PP5OmFloX/nIF8Gu+DiOVYvuSAhb2WsRWPnsSJ/r
         YkBh2YL2xzhV5N6K7gTrpaoDUIzsytF2bvKziAha2cOZ6inBaK2i7nPg46FTgEuuju+D
         GmGZAE/QvMw+L+/ssf6w6ridoeahX4LL3YtFPIV1Y0TTS1KD/J87G721Bmow8jlYktiQ
         VQcg==
X-Forwarded-Encrypted: i=1; AKwUvBwP+sh1Z0ABRgBA4YRB7v4e2rTBMaKznyRrC2ccpk73JvWFpdICeBtKCZrbGp3vTyTmPxntqcMnZ0/4Lhc=@vger.kernel.org
X-Gm-Message-State: AFq9FYILfajhW923mWySAgstkP1fI7F+oRzoNcRLFt7lAovrwDVCZI2p
	stH9ScW3cO6gB2IsXJDkoE+ThZGpEKHvHCq/NSdTw9l/WeM1FET2COjm+6c5Jw23GA==
X-Gm-Gg: AYBFou0DXTIopuYPRCWXMjQtrtXPxVhUCIMSiaRLifhnoKSJ68o8PGKdy7aVzrUqvKN
	krvQo1+RC4SKhq8b3QEfZWjiw4o8xx/AeCe4VX3k3sHWxVKvF7tIUnCdniM0wl4cdw1dKRm5r71
	g7+r+mSfQLV2NZ+Nt81I54j4HVo8sK3PcTeG7GzEHuzWcST19U8btz4dF6KPAc3Nc2/8iP0bOf2
	w9LpneQag/0/R36RVbK7IyNSqZM0Vt64TyQglvUlxL8GWw0kkvV0NyXNmKcGAA7I31Bdft9PPb/
	rhJtH+eDeZcuaWRlk1X9HHSFLSFlztDdq9d5FN82z1e2J1/sC3yPuDc1sOmtI2MAsN6bmIn1pEz
	il9oozi9keFrXWzjE+qu9M1UuDBp7hdsIX2Ept4Nl5LlyGh/gBjZByTziFJeJMfWfunsfXHgKav
	Ae2n8Y23crrZOfooV9DjLTumPY5mC/i+LFzzlEGvvYzSNSgTGPoHDr5JYX3ELyqYoGvRepuwGwT
	9qEdsMMFkYZrmflwZDdOtR88UuQCwb/05TOlW9Cmh3+O54FONM4EPf7TVEKbIln1HzACer0L9aT
	mXfIn5I972Hb7YQWJm/zBIAH
X-Received: by 2002:a05:6830:3495:b0:846:9414:ded with SMTP id 46e09a7af769-85c1e2b659fmr2055399a34.5.1793296975496;
        Thu, 29 Oct 2026 11:02:55 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-85d3549a2b4sm141226a34.13.2026.10.29.11.02.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 11:02:54 -0700 (PDT)
Message-ID: <97e9474a-f491-4447-b128-e4a5687056ab@ieee.org>
Date: Thu, 29 Oct 2026 13:02:53 -0500
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
Subject: Re: [PATCH net-next] net: ipa: Drop unused qmi_elem_info arrays
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20261029111059.85020-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261029111059.85020-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/29/26 6:11 AM, Krzysztof Kozlowski wrote:
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Did you send this before?  (Why the From:?)

> 'ipa_mem_array_ei' is not used anywhere, so can be dropped completely.
> 'ipa_mem_bounds_ei' and 'ipa_mem_range_ei' are not used outside of their
> units, so they can be narrowed to file-scope.

I wonder why ipa_mem_array_ei was still defined.  It must have
been used at some point...  Anyway, you're right, it's not
used, so good riddance.

Did you find these by inspection?

Reviewed-by: Alex Elder <elder@riscstar.com>

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/net/ipa/ipa_qmi_msg.c | 25 ++-----------------------
>   drivers/net/ipa/ipa_qmi_msg.h |  3 ---
>   2 files changed, 2 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/net/ipa/ipa_qmi_msg.c b/drivers/net/ipa/ipa_qmi_msg.c
> index 51dc13a577a5..e2401d8475b6 100644
> --- a/drivers/net/ipa/ipa_qmi_msg.c
> +++ b/drivers/net/ipa/ipa_qmi_msg.c
> @@ -188,7 +188,7 @@ const struct qmi_elem_info ipa_init_complete_ind_ei[] = {
>   };
>   
>   /* QMI message structure definition for struct ipa_mem_bounds */
> -const struct qmi_elem_info ipa_mem_bounds_ei[] = {
> +static const struct qmi_elem_info ipa_mem_bounds_ei[] = {
>   	{
>   		.data_type	= QMI_UNSIGNED_4_BYTE,
>   		.elem_len	= 1,
> @@ -208,29 +208,8 @@ const struct qmi_elem_info ipa_mem_bounds_ei[] = {
>   	},
>   };
>   
> -/* QMI message structure definition for struct ipa_mem_array */
> -const struct qmi_elem_info ipa_mem_array_ei[] = {
> -	{
> -		.data_type	= QMI_UNSIGNED_4_BYTE,
> -		.elem_len	= 1,
> -		.elem_size	=
> -			sizeof_field(struct ipa_mem_array, start),
> -		.offset		= offsetof(struct ipa_mem_array, start),
> -	},
> -	{
> -		.data_type	= QMI_UNSIGNED_4_BYTE,
> -		.elem_len	= 1,
> -		.elem_size	=
> -			sizeof_field(struct ipa_mem_array, count),
> -		.offset		= offsetof(struct ipa_mem_array, count),
> -	},
> -	{
> -		.data_type	= QMI_EOTI,
> -	},
> -};
> -
>   /* QMI message structure definition for struct ipa_mem_range */
> -const struct qmi_elem_info ipa_mem_range_ei[] = {
> +static const struct qmi_elem_info ipa_mem_range_ei[] = {
>   	{
>   		.data_type	= QMI_UNSIGNED_4_BYTE,
>   		.elem_len	= 1,
> diff --git a/drivers/net/ipa/ipa_qmi_msg.h b/drivers/net/ipa/ipa_qmi_msg.h
> index 644b8c27108b..1924ac2dfa90 100644
> --- a/drivers/net/ipa/ipa_qmi_msg.h
> +++ b/drivers/net/ipa/ipa_qmi_msg.h
> @@ -253,9 +253,6 @@ extern const struct qmi_elem_info ipa_indication_register_rsp_ei[];
>   extern const struct qmi_elem_info ipa_driver_init_complete_req_ei[];
>   extern const struct qmi_elem_info ipa_driver_init_complete_rsp_ei[];
>   extern const struct qmi_elem_info ipa_init_complete_ind_ei[];
> -extern const struct qmi_elem_info ipa_mem_bounds_ei[];
> -extern const struct qmi_elem_info ipa_mem_array_ei[];
> -extern const struct qmi_elem_info ipa_mem_range_ei[];
>   extern const struct qmi_elem_info ipa_init_modem_driver_req_ei[];
>   extern const struct qmi_elem_info ipa_init_modem_driver_rsp_ei[];
>   

