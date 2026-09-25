Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746B647424F
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790324623; cv=none; b=bNf4bZQN7Uj57yxyLmvnKpxapes4A0//bvryIW1CLQDRUConnUyt5fTKm5ttqId+kpDx9+6pAe8R/HWZB8GLHNAowf5jybb3Zg1JDQ+70C5JhUsuPy9s/8la0J8yPdEW+c3K3kZfo4ldB9VqvqmMpd3NkNLScIHl6jaIEGyqsd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790324623; c=relaxed/simple;
	bh=PvHYSJt7cETPVzZoFjPPJ4GjtobWK7P5ajK4Vcj9hoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oii2BAfjLGZHfFylQG8SyoLTDl3HuNiCjotidyHtNzoncpYwupDg0O8MnhZkKa1YIodYopiNuo9J4AHTYizvMtyw248vBpTOYcVPgL30Mez6x3/wzXfHZpdN2Jo0mROG3Sai391jxaiyIKvkiN+/HfggUurvCBt5TZlWGLi/SP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NFeuBWZH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G9NzBQar; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NFeuBWZH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G9NzBQar"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5JPuR3628311
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zaghAwdXkR/OP/QyyLrcBbjswistzlSbacu32tHxPLk=; b=NFeuBWZHhED9Wue/
	Mh8WAV8yWiw3PVYHTNtIERJ2wd8Lowr4NfheTMuN6S/OAY2+ZAynrg27A1sCLbyd
	0whfifYnkzSUYyAQCClqcP3E3y9mTSs2azauxQTxU0Li0jnMZRcnBZGvG7CnvKzM
	NBIClM9Dgfpm695EyRj+LoyV0ffIucj7TkCFqjSBRClF7MCRP1tmv+NWv29vLPsq
	jjAGdyyjfRgiUGAUag7FbZGa9WU67Hdlkns6WTKQpMaLn1N4qjEO8DGqqM3rkCYT
	FyeyjXY58q0MpQlWjaZtxfPEETh9sOLLT9uQQjaijrIW9VNdo+4RfFDX4lME+4oD
	Qp0kCQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq38h9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:23:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93918756165so132163985a.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 01:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790324615; x=1790929415; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zaghAwdXkR/OP/QyyLrcBbjswistzlSbacu32tHxPLk=;
        b=G9NzBQarVDhttHoeKSDE8Bw8SWptZbIXP7Q+eaU2ToCr85U8L+kZ/x4DoruFpcoft1
         aqusko2G4S9Bd+T8G5thMUQxZsmqETw8dv67tn3PEjQBJf2KtKc58aKaBsa1vFYUa1dw
         kcldYrLKtlqy0t8VFvIf89NiSwD3+VHrH9rPIEI3+cnxbFwQiyrlKi8jSZi9PI0j+y/+
         rIQn3Dvbf5S0m5D18V0ItuqG037+LoVVjQY7dGRytmwo1pEc+2x9t+c/ikCjcXaZAJqg
         AEaTlm6AE8tAfhU9mC2ngdKu7iidoG3b+7tWAyORa5+tr3FrSmDAhS8pfSCp8MxiS6sJ
         XT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790324615; x=1790929415;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zaghAwdXkR/OP/QyyLrcBbjswistzlSbacu32tHxPLk=;
        b=EYhNpFy1K4CJZm6qRZX4CRxQ/qD/05QUonAUKJWMt7PCsjZ23JPFhzEtAQIktSbTYG
         ieJ81j7QxhBR7PL6buGRR/mz35XDa/5G4fDY1n1T8KFYiRWCC2Iw6SQlz1Tdgle8L2/9
         0mGWEH9+9MA1/WYjQKN+GxePsZgWX/tc9hvWPsmpVRYQAfne/rbc6ccSIZ3LTE1qCH02
         LEhVlXRGoBDuM7L5PFE+giqfW82/4PAywDP+wPo+Biw9qf1h2/ZBKl0F1SID39pW26Th
         MnrDmTQ0S95SNYGW5qp8Mq/UhR8nj6JMaxKbl9pcxOR9Ob928Ij3yb8P6IUOt1gh0xDj
         WsUg==
X-Forwarded-Encrypted: i=1; AKwUvBxH1oPhaqp+VsBk7YuRoOuyB7NJ4Nvm9GwT48yjGi18wQaU6o5xjIf0y1CdaDqE2QMwxcR21S4mGVTHWhU=@vger.kernel.org
X-Gm-Message-State: AFuF++m4E8nhipn5k2zuP49lbStX/UOd30s1sZc/rs0dO/XOpLwcr9Vr
	DvluaLisT/SPdqpU78TEngJ7YnIlI6R8R6mfRNpAH8BAUcKUkjJvlj4/0Ds/PXCwuKqQIIbCSnS
	TF3oIF5+E6NFGCSswolGxoINkfsE++UfOdgjMEpP6tYJzB2CGGKVEbOczdWf9xIyH4tg=
X-Gm-Gg: AYBFou3rgY3lpWDTM/mx8hLgQIMIS80lnEkfmJjzR9aXW/aJfphpwtIIYbtBbrG4+C4
	hYOWFTwTZ6KfFT6yiZrt4qAit5LZyekAu/JZZ1rO54+9xb7mVjJeyTRuQ6t0fNzCHVgOM4vefjP
	QK1Rns+SyffAzqyKPNUpfZYClUXH/MI2ixd1ygMsTySJcTTXb2/ZtvCoFYnWQrSaQoXci0K9QZz
	EcCmcOK5OjzeBuRMeVlDJd1zxq1uv8n/y+L23tQfpEv1op8NmYRXaqM87r4T5yRWb82VEHTJIBB
	fnauyWAEecQN92+wbSd56/0q77WPHFIte1yN1rpwP7pGacKwwvbVHJ0nNRYD10sFBRWoxug307Y
	UTLiPzKFA3SxGJtJ7/O8QtKaPpg==
X-Received: by 2002:a05:620a:2849:b0:93a:251c:5337 with SMTP id af79cd13be357-93c43b61aedmr295575585a.4.1790324614562;
        Fri, 25 Sep 2026 01:23:34 -0700 (PDT)
X-Received: by 2002:a05:620a:2849:b0:93a:251c:5337 with SMTP id af79cd13be357-93c43b61aedmr295571185a.4.1790324613997;
        Fri, 25 Sep 2026 01:23:33 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5dc1034sm735531a12.15.2026.09.25.01.23.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 01:23:33 -0700 (PDT)
Message-ID: <39dc6ed0-d0af-4332-bd5f-498831a49511@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 09:23:32 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] ASoC: qcom: sdm845: Use per-speaker RX masks for
 TDM slot assignment
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260924-pixel3-audio-v4-0-85b5d133aa5e@ixit.cz>
 <20260924-pixel3-audio-v4-3-85b5d133aa5e@ixit.cz>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260924-pixel3-audio-v4-3-85b5d133aa5e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzMyBTYWx0ZWRfXy6MYgYp/usIW
 koEYt8+gtLh3rzon8RPAMNQ1RU1uBfEib8IKqJ9Q3UQkQQio6KkGbmemjuSy5eEnO0y+F28sF6Q
 Pzko08GSO6M67PmliAabWgHl1qI5Bdo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzMyBTYWx0ZWRfX2rHhXY1g+hD8
 FwI7BfXG57vfzOzBip9BbwLvu2HDSto8dIx5MMvXnnCjq4Xt9XG0JabJiTU/YVEajcXndvOkefS
 HIDQ8oXuWkQdBax9HBf6jyvkIglY2ClUG+qYFYGr7X89F8VVe+gz7a9ws//cNROtpyBX3Fwf5xW
 jCej9sBU4igdyJEs/h+vF09ArnTwh9MDFtBMsoR0KzNaSWVPG6ThIDtUF7oQjjvr15G1hEvFXB2
 04F2YgphkvHVWpbMVu+YKMXRTXsvbdIDEZBSh5DVzXhbevfCPwk3wb4vgtYh2VmtCw+YT4IK8/y
 j+jvHEE0OV/YMYxOW1L1Ip9dahozUxZNjf1D8TI6hOEAoFFr3vVPwWwIP+FupFu63DYjrcIZjrQ
 sA53rk+sWqB1UQJRh2dQ+sLBEzjxzizVkTrwzI18oIBRDwJA2s0jNeonG8iHqoplcfjyXHR+D/X
 ZJOvkSB3OUx9WcWNkqA==
X-Authority-Analysis: v=2.4 cv=VuO2kO2n c=1 sm=1 tr=0 ts=6ab62f87 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ffX9cber_TX9B_cfV64A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 1ZBuO1nkCFqZ4z1uFjrjwOkrw4NHBOFD
X-Proofpoint-ORIG-GUID: 1ZBuO1nkCFqZ4z1uFjrjwOkrw4NHBOFD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250033

On 9/24/26 2:24 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Both Left and Right codec DAIs were passing the same SPK_TDM_RX_MASK,
> both speakers ended up on slot 0, breaking the one speaker in
> configuration such as on Pixel 3.
> 
> Split SPK_TDM_RX_MASK into per-speaker masks so that the Left codec
> gets slot 0 (rx_mask=0x01) and the Right codec gets slot 1
> (rx_mask=0x02).
> 
> This commit is here, so later CS35L36 receives correct slot for right
> and left speakers.
> 
> Assisted-by: Claude:claude-4.6-opus
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

>  sound/soc/qcom/sdm845.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
> index d1cc825fc5cdc..59cfa3b26cd4d 100644
> --- a/sound/soc/qcom/sdm845.c
> +++ b/sound/soc/qcom/sdm845.c
> @@ -152,29 +152,29 @@ static int sdm845_tdm_snd_hw_params(struct snd_pcm_substream *substream,
>  		}
>  	}
>  
>  	for_each_rtd_codec_dais(rtd, j, codec_dai) {
>  
>  		if (!strcmp(codec_dai->component->name_prefix, "Left")) {
>  			ret = snd_soc_dai_set_tdm_slot(
>  					codec_dai, LEFT_SPK_TDM_TX_MASK,
> -					SPK_TDM_RX_MASK, NUM_TDM_SLOTS,
> +					LEFT_SPK_TDM_RX_MASK, NUM_TDM_SLOTS,
>  					slot_width);
>  			if (ret < 0) {
>  				dev_err(rtd->dev,
>  					"DEV0 TDM slot err:%d\n", ret);
>  				return ret;
>  			}
>  		}
>  
>  		if (!strcmp(codec_dai->component->name_prefix, "Right")) {
>  			ret = snd_soc_dai_set_tdm_slot(
>  					codec_dai, RIGHT_SPK_TDM_TX_MASK,
> -					SPK_TDM_RX_MASK, NUM_TDM_SLOTS,
> +					RIGHT_SPK_TDM_RX_MASK, NUM_TDM_SLOTS,
>  					slot_width);
>  			if (ret < 0) {
>  				dev_err(rtd->dev,
>  					"DEV1 TDM slot err:%d\n", ret);
>  				return ret;
>  			}
>  		}
>  	}
> 

