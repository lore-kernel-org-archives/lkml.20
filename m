Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239370;
	b=Ue/7fyEh7tE1Pm9EiFOQpO1gFzWiodG/EJPOB3Riua0OzEhknQd2VEqGjrrwyGcWW4Vz
	 wl8c32H7bzb0SF6t2YtIvWe//QozaI/I9kt4jBtXZljwaCZTIErJym4g6bGFGEDB9ydFa
	 l4P7Bq1KRa9c0kyfDiNfkgl9pd8AStbB6NEvBZ4LLD8820sLAU+uiykzkePpkpGWRqxxG
	 Mp5klZw3pkn9ZcvoZY9MS7fAfzkBLAImZI9RAWITOIXUthbnlTAPBe3sBDFyL7C6P5M47
	 +hPpiN9HngNvFevToJTZVp/v5YnCPGgKDB+nkCOMklS7efm72HtOc8xpZWQZr2oZ8EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239370;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=LUmC7pupp+6flD6iWqGdbBq5uSMsUVJdiyX/xJTa3rQ=;
	b=qsdUFTOYRUOiSTNEPFAGJu8/JZndHIAuUxVSMIJxIQ3Onz3PaejUdPOBHi439id6TFkH
	 8urTtSdaMn+Gk4Mxh8qXnNZhiLmQrTCO2IHVa1Jl2VdCz0T48ILjulN4tntzoXzPCFTNA
	 bQTqoHaGtApbC303xEOs24E7OtOEAbBHCjq+s/S8yIDGUAV99S7eQ5iwW3pr+WYPoAkVG
	 dHgsGXX26Psjcrmxb8jPwR35Wpt6501E8+pUv18ZlndH+TDIPTyzL5oLVWiKF3+attTs1
	 W4bzW0CQnave9lmbwvYtP4sL/SKBpQd8MYadQOl/Zsx0e47i6Q4aXj5G2evp6exrCFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AWeyvyXt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2ED606A332;
	Mon,  9 Nov 2026 15:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AWeyvyXt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F3071F008A1;
	Mon,  9 Nov 2026 15:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794239369;
	bh=LUmC7pupp+6flD6iWqGdbBq5uSMsUVJdiyX/xJTa3rQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=AWeyvyXtRt1eagDS3pzVnhYlLAkyBSL9nIInaVRAVIk0fWhNtfnpBW7pxJGINFWoK
	 RmuvXFsQAj4q2bpBxcog6oRCPZ4ZzsIlLm8M8EaRa2QaCtQQQ6cQUIGNswlzx+hpAU
	 Ega0/f0yNE9ZaPn+8VsLqFP6l+PIu0XK3nQEooKB50bivlJA6VA9xofhgdbXNiKbdy
	 OOBVX3jkRFLp8ykqmvYynJ1h1INC9LpP+nLDVz8vALXxHUipJDs4ydLwIu9uksiJQS
	 elmOwbIL88q1FUl+kdJTPBuqdCpOgfTy5Yow9hPNGCYTWIrdDEabdN9NZ+yYfJbV7p
	 fG5G7qpWFfEuA==
Message-ID: <0ce1e478-83aa-4d5b-845d-4751d597fe72@kernel.org>
Date: Mon, 9 Nov 2026 15:49:27 +0000
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
Subject: Re: [PATCH v3 11/11] media: qcom: camss: Switch on frame_sync_en for
 csid-340
To: bryan.odonoghue@linaro.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
 <r_TOfw9mnkUeBFPsw9y9MrVpLN2bnQ_VdNf5_mE3SP4XLb2-v6NPn96Vwm1cX73dehIOmn26JC2KywS5ClkCLQ==@protonmail.internalid>
 <20261107-v4l2-frame-sync-v3-11-e5bf7073a35d@kernel.org>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20261107-v4l2-frame-sync-v3-11-e5bf7073a35d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/11/2026 01:01, bryan.odonoghue@linaro.org wrote:
> From: Loic Poulain <loic.poulain@oss.qualcomm.com>
> 
> Switch frame_sync_en to true to track and consume SOF/EOF data.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index bfff28e789b04..ac12960264adf 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -733,6 +733,7 @@ static const struct camss_subdev_resources csid_res_2290[] = {
>   		.reg = { "csid0" },
>   		.interrupt = { "csid0" },
>   		.csid = {
> +			.frame_sync_en = true,
>   			.hw_ops = &csid_ops_340,
>   			.parent_dev_ops = &vfe_parent_dev_ops,
>   			.formats = &csid_formats_gen2
> @@ -749,6 +750,7 @@ static const struct camss_subdev_resources csid_res_2290[] = {
>   		.reg = { "csid1" },
>   		.interrupt = { "csid1" },
>   		.csid = {
> +			.frame_sync_en = true,
>   			.hw_ops = &csid_ops_340,
>   			.parent_dev_ops = &vfe_parent_dev_ops,
>   			.formats = &csid_formats_gen2
> 
> --
> 2.56.0
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
