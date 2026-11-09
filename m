Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794229378;
	b=FsQITGAmMD4oI64927Ss9f9RVekOtpyfvXJMdydhTvq96GKSNI6O9bF7HzR+eJSLk+EM
	 sR3By0c89qgxzwOiTedZ2eDblQLuefJdOSlJbFl8ZoTEj4lgrJhPxdI6ApTnZFVHKVelX
	 C1okPKyHXdAkSaC4T6CfsmRJ3fkD4nLmXdvAnvGNiMble+9B0fbfVVDV/JYXXEHmr+doK
	 U35p0VIkLx4+JDkSjnDmLML0HInwRjbD/uKLbDuTU+i6IHv+Uv2p5rUH4cpvPW/w/nNeY
	 Y4ccH0z0YiMJYUmY9pX5WF39hkVSVJLM+Q9BL5i+ZeoKF073cUNB+3UbENYYGZgB3zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=2pqezEh1l4R7qbedrIHueLpYvtHBQ5vBsWVh1r02B6E=;
	b=4SIpo7rNbIhw+361sBzC9t8VsfvcamAsIbO8fFDlyy8nc8VBOavTpEB6Sr6Senl8I3fg
	 XmewMIHgeYwR/cTLQDRxhO8FwUvXlYWRYUmyIhCNUzh0oD+klPzMIOsv86B3YXF0WHPWi
	 HTEQ5qgpumDdMnxNE4Ulv6dIw3yYfoA6Cic+Wb2v9IBErbkotx2RdE1a0TWoWxyAVQnau
	 na6bRJz2vv4KGat+PGUZT5ZFr4eIhKPVwZT7vlkvFbJkWz57EaujZhhalgNuOTQSfAUN2
	 XgPFVt01dr/CRc2shNWqGdQx2HC8RIK8xqP8Ocv162G8wkIPLTSMyzJjpdILJ//igsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nHbFPI7G;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3539606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:02:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3539606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nHbFPI7G
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso120779366b.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794229376; x=1794834176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2pqezEh1l4R7qbedrIHueLpYvtHBQ5vBsWVh1r02B6E=;
        b=nHbFPI7G9w9b2UfLy/acyio+uPB5UJSDX/5bVckxSXib6jXBEuPesS3SMK1LaDgf5d
         axhOQtlHfwRVCW8Q51qgy980+Ph1R0t2RI4HdGB7N7JxPvlcQGAhxBubTSOD3sOEuNbu
         6KTzDmJwQEBj3FtB2LY6HBL7zH3xJSTRnmBYd09yEyMbI0VX79Sm99DRwtRomBsoAU2g
         LAE87/ILTx2slpSx24TJ2eJq6JOee5TzZlsNQHqQTiqrH73nlPaFJhI7ATokG6L5IvgK
         DvgiZ6/M57ekmz44YLk6G+UPXe6hRmrXtrH0Bj5hgQE51a95RCX3gLN9Y3yx5gAy0WpV
         HrEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794229376; x=1794834176;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2pqezEh1l4R7qbedrIHueLpYvtHBQ5vBsWVh1r02B6E=;
        b=QeCSz90ALFVYeeP8V9byujyyvSO1dKOcSV8SVwQEVFLd1z7+ZQLF9M5YWODd1kLhcl
         s8H8luHWNcHUhdDKt5TbVT1v4d0FVnldoWy5R0DduZY2HHGI2oDzZYE14yaLtT6frh4U
         yzxolWWdoloToKPJn8C2rsQXcYlZdvzPTVTPel5b9pDwoLxpvEBfAz4kj+EvP7EqGYRB
         7Dbfhd1VYuOC8mAUvp6anARpNnfpo9QCv9DmciEWhDCP0Sd5DSffutiyEfhmCA9JwuXg
         14LUfQ5xBsn3Ju1MHQ9ryYfEpPq3Cxwb9K1vK/eH0JoucDQRhAGumM58ZRxO6mUD3G0b
         EnXg==
X-Forwarded-Encrypted: i=1; AL+hErG5uUTK35eg0bDlY/VyShZGe8pLDyZelw4UAqYxsxa5nfcqh4pxC7Nt4XDxyDS96/A+hZ2Hb7audLEIwtA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+hR63X4yaZxJ7sRi9Ry6xRT/bX8vsUOO1yzEteQPGIlluUB9F
	fs1rfOYd3aDHpUZ3OrDNEG0fCpeA0jnRhwpDxzlDyONJCw11fxs/yfgYUmM4iD1WOa4=
X-Gm-Gg: AYBFou2XMR0vlLJG2db+m9KM0WMhEenHsSrRI0yU+nFPp7cq1Gx9HFO2h9m2s4tm+x2
	n8DBh4yo7Biah++Imqx3ljCrvutJQLoAh0W72VEJfjJy4WcXtClC+WdUcLKWsR8SMesuW+uJw3j
	fUtpSZ3MwZvBBPAZnhldTsRkC4xe46YGYDHGnSin2AJ8vyHU7pnFDeqkeGgNagdWrFgWPz3p76q
	q7rn2KUdR5f7lL5hVj7JJoqPbm2kAnnJ1OQ8/wvfUxk/CjkI0lqICReR2ynawlt2jtBNAR4N79A
	ZavFUGuz1RSC7bJTlBjOjqJFfWHYCf1h0bYjpiM0cAN9GIR/oXC4D7+g+4gG8ockOkh3MlyLr4y
	UgcngAAVPK+j663HIusWZ2pJ+mS5OjKSQbxrMCBs/pHQ7QjD/mtO+JQdTOSesj5HgZ5spZIFv5n
	bGuWNcuuUHqeKt2jH5ztWtVlocKLcELwnQTDOAtrqY7Vr2n5frMhRhn7wONimQKSPUPBHA0TqtL
	JBUdL1UO1lPwg/smBnH5rzvsCsePyHGTvwYDvwjVHFiVO4qn2wuDdnbTVun0bIv37Pz0MwZUL6V
	3egRQYBO8MfDSNX0juquVpgdubx0qsP+O5zmOUQ=
X-Received: by 2002:a17:907:6e88:b0:c49:bc1f:fe2d with SMTP id a640c23a62f3a-c4d6d4fa5eamr275959166b.28.1794229376222;
        Mon, 09 Nov 2026 05:02:56 -0800 (PST)
Received: from [192.168.0.167] ([109.76.74.9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d69f9483esm163287866b.19.2026.11.09.05.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 05:02:51 -0800 (PST)
Message-ID: <919e9806-5e1b-49ee-a88a-7b6dd6d93c18@linaro.org>
Date: Mon, 9 Nov 2026 13:02:48 +0000
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
Subject: Re: [PATCH v2 3/4] media: qcom: camss: always stop the pipeline in
 stop_streaming
To: Allan Siriani <allan@fatecpompeia.edu.br>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Todor Tomov <todor.too@gmail.com>, Hans Verkuil <hverkuil@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261109112611.94010-1-allan@fatecpompeia.edu.br>
 <20261109112611.94010-4-allan@fatecpompeia.edu.br>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261109112611.94010-4-allan@fatecpompeia.edu.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2026 11:26, Allan Siriani wrote:
> Fixes: 89013969e232 ("media: camss: sm8250: Pipeline starting and stopping for multiple virtual channels")
> Reviewed-by: Bryan O'Donoghue<bryan.odonoghue@linaro.org>
> Signed-off-by: Allan Siriani<allan@fatecpompeia.edu.br>
> ---
>   drivers/media/platform/qcom/camss/camss-video.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index 5de6ff5ec..8341666f9 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -313,12 +313,16 @@ static void video_stop_streaming(struct vb2_queue *q)
>   		entity = pad->entity;
>   		subdev = media_entity_to_v4l2_subdev(entity);
>   
> +		/*
> +		 * Subdevs without .s_stream(), such as a sensor pixel array
> +		 * entity, return -ENOIOCTLCMD, as at stream on. On a real error
> +		 * keep going: the pipeline must be stopped and the buffers
> +		 * returned to vb2 in any case.
> +		 */

this comment is completely redundant - it looks like LLM word-salad.

Please drop.

>   		ret = v4l2_subdev_call(subdev, video, s_stream, 0);
> -
> -		if (ret) {
> -			dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
> -			return;
> -		}
> +		if (ret && ret != -ENOIOCTLCMD)
> +			dev_err(video->camss->dev,
> +				"Failed to stop %s: %d\n", entity->name, ret);
>   	}
>   
>   	video_device_pipeline_stop(vdev);
> -- 2.43.0

