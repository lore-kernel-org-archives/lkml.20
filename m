Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E86A44A409
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789546094; cv=none; b=oQZp4ApPmpO+r8sarzdwJ07Vxt24EAkWLcUKSYmqUo9AspsRBc8YNhSwQOFAl0B0s+mkQ8y9qyoIfe0GsBj3rKFqf4kKsa+a6zVYwoCq1UY498J8Oj9IqM4+8c47hFrhJymCOB8Mb/2O5U3ppJ9kknRjyA4Q4TI7GtDHKqNWj5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789546094; c=relaxed/simple;
	bh=yLnOagV+pT8eAzSsdk6JR1MTvfu3QPXw3QIDFR8KAo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jynp/qr+D8LdSyBmjZ+nbVwWErKvThEFnWCHvg7dpL2gjmUdmOYtTyFEuYkrNaSIwNlbmvu+OWQ36LPx8GYdJJiI9WJgC0N+/UqV1d9UYOJoQlAwooB3TkO0YS//IUelVKaNrFZjXZG5gjETEXgFEf+Q1Se/8S6rrNViOOF3VC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jYJo9uha; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jYJo9uha"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f7dbeso90498666b.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789546086; x=1790150886; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cJf22ij+JQ2jMGLbFA1R+j1lqSUaO3cpmGjQBuD64T8=;
        b=jYJo9uhaS00BaRERJ68n2phfJZhMK5tlAOlpmR7za6vywdJjm8TAb+R4dHNvDN9ssK
         OV0QA+zwSr+HYk6vrgfQJHUKpRRLs1arQvzrnB6o7zkG4jcwy8T9S0H8rdIhAU1tVpFa
         eMSQd8qUlVVfaoiBrTM5W/zQ/S7Gj0IF4Kte/MYM5aoKtEqc3Bboo8lDSUGRRgQqXO+/
         6xtsi3ZkyBk+xuLo5sHnVnGHKcSBS6T8xEgVFqvDriw2WMqwxUFsW+iRB4JLnPT3uApD
         F3nTGt8wdhBDOx9SkZdXsdWLomg/T9kymHmjbelV3c1v6TdwQIt90URDFzDl8BEuaofj
         4iwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789546086; x=1790150886;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cJf22ij+JQ2jMGLbFA1R+j1lqSUaO3cpmGjQBuD64T8=;
        b=Tq7B8RXEPwHuq5YMmdEKr7h2nRc9yQB0Pcnvoln1oxDArUF7Zi/nxhKoM8ADWBFesc
         ILQlnJLyrvODoRO8pxBQr8KmIUeWSHRplwTDuAcbf+sdprf9C9DUPBzwOoK6FpAoHZwz
         Q3lAYkuGFXIAxL/YcDfsuNccU7mF/TSU2yyy9SbxR+XhHdhuppNtBMGdf7nZx8/kykov
         66WWLql6Liig3zJuNpZe+KW7z5SPE1P8Ewk/Rty7ONjJwrTYm9KgSyVD7tPqAeMrpxS4
         d+NhDuyPA7B9C7QC4oc3av665tCImDWm90AI9GQbb2GG4zE8G36NSPP/zKnEOolMyF2n
         0fGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUGE/90a/DHxpfmc2xTPkHr2uZyG5CZ7sK8beKeGnub57tlR6Zs3zVbJg2ak1khEjii+IFBhh1y5U58rQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kSTviKjHYwzODWU57fgQ1EQmcVPKohfiv8b8bUusleL0ULxqSN
	2sj/Fc8XbKHJFv5wigGerKgalra9k+TbJCeXVUhLTLgI39xzXaA8yw1o/u+x22VyuRQ=
X-Gm-Gg: AYBFou0qU9igtA78IB6TTEkavKrlkve/zEYnjmtq2pnbyzjtlrFyuBkJ63i42iwjoNI
	/BZ+q7Zz/UDW1LkqulorceZwgOkco2VHOQG1A43vUeqSuDmPltB3zasjgQBzkMuQ6D1u7OYI/c1
	BDRs24MQM9+2JVLwFOyhwrxSxoqwQgoz/Utw2/0S5/DvxAxespw+QljnV4xYyE1FE7VTtEIPcMf
	SzXkvw3fUAoEUYSGimYkW0DDH/A+eRB/g8NAXwwyf2NRPwZ5yz2iz4FE/CvAM2+JeLSndt7Ydlp
	RYyBxjAl0XgzgqZmA8DCxvB4Oc58HCQw2gKcKN7A8rJjyFLmnxCH44ha1jBY5Ftw1aJ9xsq7OIX
	xLvFLFZm1wNMYU8RWnmFiENiqFfD4j7wuXaBkW29pxwu1HPrE3V7PorGLnHHJAenAsa9NR2zgwL
	DrpD6ckCNyEarURC6sGlJ73GOboOKUbtxVtWfEB2wrdyeh85h9LLymi53crtXNsjH2/KPgFST5H
	knN5YsurDlqywtevspUPGM=
X-Received: by 2002:a17:907:6091:b0:c29:5340:1837 with SMTP id a640c23a62f3a-c29e52b6aedmr98025366b.16.1789546086423;
        Wed, 16 Sep 2026 01:08:06 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.116.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de4866d9sm83158966b.23.2026.09.16.01.08.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 01:08:05 -0700 (PDT)
Message-ID: <fcf04e15-d47c-4b42-a94b-077486cf634a@linaro.org>
Date: Wed, 16 Sep 2026 09:08:04 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: qcom: camss: Enable the streams API on SC7280
To: Hitesh Patel <hitesh@ebytelogic.com>,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, ravi@ebytelogic.com
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20260915121536.19207-1-hitesh@ebytelogic.com>
 <20260915121536.19207-2-hitesh@ebytelogic.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260915121536.19207-2-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/09/2026 13:15, Hitesh Patel wrote:
> Set streams_enable on every CSIPHY, CSID and VFE line of SC7280, as
> done for SM8250.
> 
> Tested on RB3 Gen2 (QCS6490) with two GMSL cameras behind a MAX9296A
> deserializer, one camera per CSI-2 port, so two independent pipelines
> share the deserializer subdev: both cameras stream concurrently, and
> each can be started and stopped repeatedly while the other keeps
> streaming, without the WARN in call_s_stream() and without the second
> pipeline tearing the first one down that the legacy s_stream path
> produces. The CSID test pattern generator keeps working.
> 
> Signed-off-by: Hitesh Patel<hitesh@ebytelogic.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 0201debd4..2023c0df2 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2280,6 +2280,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
>   		.reg = { "csiphy0" },
>   		.interrupt = { "csiphy0" },
>   		.csiphy = {
> +			.streams_enable = true,

Set it @ the SoC not for each csiphy and csid.

---
bod
