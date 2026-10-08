Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B873D48E0DF
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 12:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791461037; cv=none; b=uELRrgdnCwfR7wjQ3ZMp6TitHZPjzzFPIp7Apl9XHQ4YfB6frATj3/IiCsVLzrwmNwk/0v47dY58DEB2mKlFmAGlRAD3fjqKXdIqEobmfoOBbZ1kMqKJTDnD8eoHae0l3DuMbACzHl5QSeFYJ08yLxihTCZsVTuTPq6en3SRACs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791461037; c=relaxed/simple;
	bh=/Zdcwly4bpuwYHi4pwV6T6GnqST2wvug7GVi7XeY5xM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M1bspA1QjGogr+f10cUt9IzVZZA3qHyy2ZmjZH8pkBES9UDlJgCfDISC8csrjSc8H/rtdX2oKWRpetM1zA6BVeZxZNPl0u8r8ek6J+PR9FIGVZlY97uAK2kSODibjYG1psqwoffzXv4NUMDsGyTYfre7nfooseuxim9Gy4SyKAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZB8HrEaF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ydw5Rbva; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZB8HrEaF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ydw5Rbva"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BKABL3733035
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 12:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IZKv9cqgH4HTSKDf2wA9wGyhNJ6KF/zvEMsfNsfC2i0=; b=ZB8HrEaFAa5wL3qp
	5OwDbl0eAnpOsGCz0KS+PUlQC9X+zwDXXT8/Ypq/hRXKNAT3kVv26VPPpLubgizT
	5/Cz/MGvgQl7MPjTnIHXVwavRGsNVpVvnuduiQcOCarMI/H1AykaoadZLY5WWyjf
	2FmBkPDWvOiNekarQnVrljgOSOfnfjKyCxI2FsNizaGl8xWQsQZmPjeYe2LL5Xt1
	QjLqXmI2ZyWTtnA9JOVhOnkyBzPkN5lYanvustmEOoceXLsawXLN+IoRQePvrtwb
	8jZAtBACYiyarf5iQDdccfYrqzsdU08vZkKGJ1RV3FFYzVXCOoSiRBEBovuJMpmY
	3pXc5A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe6atfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:03:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so5458471a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 05:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791461035; x=1792065835; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IZKv9cqgH4HTSKDf2wA9wGyhNJ6KF/zvEMsfNsfC2i0=;
        b=Ydw5RbvadaQLi+ZGjAMtdjafyiuIpn+TGKWvLaT5zukKZgEK73200ObfZxCb3CprD+
         iqyRA9kmkMHRV4ZvL2N3tk59eD+nlrz6rpx30dT7JOVlKBULYgJdZCTkMx44O9sluh1Y
         kRZ6eSblkQPCtGztEN/kDJOKJjFQwHRfRSKoIABETgfyahRXmGHZuB+RrakcOSLnnYtd
         ngfbKXJFro9bUPBCNNdH1HZkPNAEyGY8+36iX4V4z1euolJfrKnbRYzlplEbsc9a7V+e
         LhYYN6g2Hecdm6SMTlE91eTRYE4mPLt8GRCpfWY7Sp76bHoa+s9dsclOZJXPem1+flSY
         8JTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791461035; x=1792065835;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IZKv9cqgH4HTSKDf2wA9wGyhNJ6KF/zvEMsfNsfC2i0=;
        b=uQdrJoOpGLxw1v9Vn4u0BN9J51cr/aVO6Xr0euPU/dn2uR5Bn2wZhOcgDV4qy171e2
         JQdHbJksDXierFFeMXqGtdNaxbvG/dLextzRO6gOmbqEh9F54IVa+JexT5VQIJEDlv6B
         Ba6Qr+IUbs6MVY3tnHCgyZ4luRlaEr9Fl4cMKWP2GnE583XN4k434NjgmNXfKAUVbCt7
         RZ50vdOG9Wf7JpVqvt5TDl8EL7mNQ8aE7eefaTRcnlRVjAhIWlnBKTlkXz238vnWIdxB
         BGEBGdYzxzFfMmt9tLr25cOIqETz1+DtCeZguZpG+cfu33FxJeO/GtREfwQC07vddClz
         6DeA==
X-Forwarded-Encrypted: i=1; AKwUvBzcH+2yww+Kv4B+L8J1AkP6XwNdCQYyAGK5tKNVCssXT0riJFxwbhFUQxcUf8vKMLRYE19N+dKNOp40goQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwNRdYNa1IwYonYWbpVh5bxGL7LO49HT+qa8ovbLJr+ble+Axl
	JdgCJzDzSdx3Ja4w1Ot4Ozfissm//A/+Hp3uCQuhP1W2E/YOD0kvyo+n2bIox0pJirDGHHtFR2i
	Pnwpc0pkP09YK0dWeBwPOS+8mui1VE8Mc46pUC6akY8G9GLgr2wd6UNO+f5YscbjlCcA=
X-Gm-Gg: AYBFou1cAWazUsTAqs92PBYQBLL4HBBX0UqeWkvK9TNxx4CoYqRGInrEeIiQLtrXJ6E
	vvKr+gk3/E1J7puBLk6+UZVM3fDQq6HOJYCom5VjJWPCnSVwDyltKgUnh3+V/TzAgErWAgwfLZE
	0EqMr2n6gAmpiKDYtwJNBPc7IEe0XAX9wF1WDJU15hUxjsBSrfGhqoNH23tl0AyIx3q92oMSEOa
	LSG1aacw8aAif3zr8BZXzT79WpJ9zx8LdAoPATntM2eCJVipAwy/0Pg7sRzCeQj9O1TkkJ2zNmF
	Et4Kden+wKBFsqlwgFZ/McRHK8vvYBjap0328YTpWouoGVyZst878oKaLCvCQKqn3Abg7z1ieUM
	MGgfzyA6kLkegW/Oha0DNfIrI8RQ=
X-Received: by 2002:a17:90b:4fd0:b0:3ab:188b:c5b2 with SMTP id 98e67ed59e1d1-3ab188bc8efmr396406a91.49.1791461034795;
        Thu, 08 Oct 2026 05:03:54 -0700 (PDT)
X-Received: by 2002:a17:90b:4fd0:b0:3ab:188b:c5b2 with SMTP id 98e67ed59e1d1-3ab188bc8efmr396354a91.49.1791461034281;
        Thu, 08 Oct 2026 05:03:54 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd0a9ba4f24sm2810782a12.23.2026.10.08.05.03.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 05:03:54 -0700 (PDT)
Message-ID: <24ffbf82-adad-4153-a2b9-f2123189c722@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 17:33:47 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/14] ASoC: mediatek: mt8195: Fix clock parent error
 handling
To: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        cassiogabrielcontato@gmail.com,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Liviu Dudau <liviu.dudau@arm.com>, Haotian Zhang <vulab@iscas.ac.cn>,
        HariKrishna Sagala <hariconscious@gmail.com>,
        linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
 <20261005110257.50145-15-phucduc.bui@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261005110257.50145-15-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vWO3iavBu8OM36_4A2PgJCOoRe020Rw8
X-Authority-Analysis: v=2.4 cv=HcWB3SE8 c=1 sm=1 tr=0 ts=6ac786ab cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=gEnLFtKB0XLziNsE2NQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: vWO3iavBu8OM36_4A2PgJCOoRe020Rw8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfX974pxAMAxfke
 556nGF8w/t43530lChWvz9bZK2fllkZf1YawFNLsxXugJBB6TWMtypWDdnO+uOm4oJpB3yveNad
 dzrOh4AoSX5c3/sV5t2fQ8IBWGBtQMpvRKGvDK3+oP/f1WyAPshUS4hrKVe4ZCWot9gQH9pcVBz
 tj4TrpIk+1ICW/UNt/nok6QNUmLKDIUbFHC51Wu/XL0O7RAHhZj3Nwg040uza51HbHZ6+33vkkg
 SNtyJZnMFUkaOc3fwBaA4B4d/SQ9QAgxtyNxIny7B7M5IkyJ0tGKAKui+NstMyR+J/5oEjHIYuh
 uF1ZHMoVgxVaSaoATWLEL7RqJgj/tR2UibFGBQVbNHl/G7UiJCvsuS2VsZEJVLrTEt1F8sc378i
 v1qKSEsCUZILHTEfdWmMslNViVMY59ov2B6NeN7kQsrw5rbXHS+alI6xP+t1KaP636yAD0AGPol
 sT3pO7ZVM2WTZqZecdA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfX3hfxXjbRb0kD
 yJ5Kby1gRMi5OyuCTlioZepQpJOW/+Cg7iB0RQ++oUIMExvSrb3fY7rCD/y+UosJ/KRMex+hcNo
 Zt5HWH6LNOiSasMueHR4JE/TPQsZGoY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080047



On 10/5/2026 4:32 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Propagate the error returned by mt8195_afe_set_clk_parent() instead of
> ignoring it.
> 
> This allows clock parent configuration failures to be properly handled
> by the caller.
> 
> Fixes: 3de3eba588bb ("ASoC: mediatek: mt8195: support adda in platform driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   sound/soc/mediatek/mt8195/mt8195-dai-adda.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-adda.c b/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
> index 94abde15ea09..8a58a142064d 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
> @@ -262,9 +262,8 @@ static int mtk_audio_hires_event(struct snd_soc_dapm_widget *w,
>   	default:
>   		return 0;
>   	}
> -	mt8195_afe_set_clk_parent(afe, clk, clk_parent);
>   
> -	return 0;
> +	return mt8195_afe_set_clk_parent(afe, clk, clk_parent);


The commit message says this allows clock parent configuration failures
to be properly handled by the caller, but I don't think the current DAPM
event path propagates this error back to the operation that triggered 
the power change.

mtk_audio_hires_event() now returns the error from 
mt8195_afe_set_clk_parent(), but the caller in the DAPM core is
dapm_seq_check_event(), which is a void helper. It logs a negative event
return with "event failed", but it does not return that error up through
the DAPM sequencing path.

So this looks like it improves error reporting, but not actual failure
handling/propagation. Was the intent only to get the DAPM error log 
here, or should the commit message/code be adjusted so the behavior 
matches the "properly handled by the caller" wording?

Thanks
Ajay Kumar Nandam

>   }
>   
>   static struct mtk_dai_adda_priv *get_adda_priv_by_name(struct mtk_base_afe *afe,

