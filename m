Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9904944062F
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790334172; cv=none; b=gqfsClb+BJwe5l1c6x4R+vVkLikmt5aiGMivl+LKq4Y1IPISIpCvmjmoHY3Q6KnxYpnsznsUowyHmFGv1lJhAu+2gsNuNhEvlyDZcYITUf61MfinS1wEE0rYSTRB2oYmmU+oJ3DjMNCCB5Rnl6Ek9tD1FRckywjubcSQFbs0nVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790334172; c=relaxed/simple;
	bh=LNOMjLy6wAcR7Zrv2JQzDuQOs+io2+5LVXSdmKnrQY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nYGqgRHlpYq2sYdDCC+AwFFmb/pyIfaGlt1U4ucUDHkQGxt95c7clLTrkJ1K0htlcjyNsSInkDgMs/hu8JNgxx6VnNfwjEFJvZlBSkZ+oPbpzXn3nAzGpwWB5D9Yvn2KZQq7+rKQKTVRgisCaSCK0tZRG4ASIUAbrnLaK3JAq1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KvFh2CFL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DF+ag7gk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KvFh2CFL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DF+ag7gk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YcbI1193861
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VoIWBlJoo0FiwEjddlsFzE0cCw/HF0hLVfs9qwlvuz8=; b=KvFh2CFL0Ck4gOAb
	oI26+pbdmpqxQbPkecyHre41ejQiajPuhGGBInHpPGWQbdFySia5lL6pZ5F1B3Ma
	GIockcThtNcuuiBI1f0w7/fjjcsAu1GKzdpEgeYCTdOwzYWn4AQvrqeIl0GOA4w/
	5ZS7CAxkvhO5O/KFIuMTcE4xBxWRVDpewgKusJ0S1g5Gslp1tBg8Y1AC91ZVC16C
	I6bTOYJ5eJKQPjb/oE/8dHv85aGJ0OzjRfDTgppuAkWjFdZhjbFrN/W6MERqqKLF
	psjK+AiB+jJ2oD2ZC+/XHxzz7dYFhRGuLavtAkQLoPzyd2yvcW8iY/4TnOJUScbC
	MXKhrw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw874k4s4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:02:44 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so1556548eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 04:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790334164; x=1790938964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VoIWBlJoo0FiwEjddlsFzE0cCw/HF0hLVfs9qwlvuz8=;
        b=DF+ag7gkPspGWPI2YemJ8sCHVuSvAGkNACoWc/5TQIIAMGdxW4LdDpmty77mfik5e2
         K2F+/cMeKr7LSWDR+LuLEOXp55ySPnFuZYKk5r9AkFjkX8B7mkPXEqN48U2u3gybgiAD
         /vpuj3cqcmubMIpj/YTxCf9CmlcgZ3Z6hZrdY9/l+ARC88FXMLScT+PMWzhPQC4pH2DR
         Gk+Bfg9uWdn7mreGuBYicPekbSEII7qxbuZXEMkYkVKDyB1b2HXi/VZVrzySckJANszC
         R6gIAfggFX5jR+QkeaKZ6fsyAYD6Z3m/lUtkrr16dkLjhBz66fb6Wve9RXfnt3fCRtBQ
         7AMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790334164; x=1790938964;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VoIWBlJoo0FiwEjddlsFzE0cCw/HF0hLVfs9qwlvuz8=;
        b=PEFK2nSjtPQadHPY+RZX2Wc3ntf/34zKw4AttZupRvOnZaY23CiKNWw59iNYGS93TZ
         ld2cQTnGN+QqesqnlrczLk4cyInXih2Mf+LLeC8uueyr9soVLNCBur9BlkqTekiHX8uE
         Rk3nvptDzg1hpKUJxttrkyf96BBti63YNPLLmX3QkTOr4i1E4QEZVy8WlTiW/jgccIns
         JoGG0wUd06Q5P1O+zsgrL3ehDsj3ur2uuIMgFV6X3dV+ErDnnAi4DfjvlfxHR7L40S1k
         CZseqRB7M277ur62JhQDQvlYPW/tDYwlQHItnnhSqKxKbABWiouEdL76yjSiTeYx4m4S
         S0Ow==
X-Forwarded-Encrypted: i=1; AKwUvBz+fiyPYRdgFFl3Pu3HgbifUImQS+KAIdD9e1H5HoTKi1TYrYJaY2ue2jkXWNEJpQOy8jAgacimZ6gkqpM=@vger.kernel.org
X-Gm-Message-State: AFuF++kc5iUktSFcQsy0RxX3nUJxh+2Pou4EcNfsUra06lJEm29seFw4
	34LhK6mupLdXdfIpxgyp373vs49EE4PabuketP8nTx6bUKqwSe0RH7phXjFjoOSKGHt7IYfjz6v
	ddG9r3tEsSjJMS2y5sv4AloyJHUw6M7/r7QJwEpoU+KZQeiI1aHqGrYGJHIxQvgpfN28=
X-Gm-Gg: AYBFou3Wylr1sK/OzgcZTyTGnZjp3/mm+Ep+AvrQqL704TP8k7ADceRXKE8Njzx4obn
	Ho8kZijxd3q3wwoA4s9G6SEZRoH6sWUEzx/c0gpvF1pKiEFzPgtp/THUQSAvRbP7NpOIH0mgYTb
	myjtOQJgnKDMptFKvBTMFFd9kIeDncdI2cR8ShIBHVRSQXrT1+GEW5D/kBJ620NBFMlzuO9snJM
	w1Av9FmRIsIM9TS6mRhYDfP/AQ8uVwDj7fAK7VE5jtA8JkBED3YU0CVJ0nXuOq5+F5AqZhuCsIb
	TWLcUBq1GwZyubh2s2HH03RMDZZR2C0YVbNjFdQzhmu4f6nz9hltyIAhhSAhEQa2sWeqyGBHUU5
	vmhcWEUexJT3CCA93RSZXyjdz2Nmt
X-Received: by 2002:a05:701b:2085:20b0:144:eac6:cf37 with SMTP id a92af1059eb24-14503ffef9dmr4634820c88.47.1790334162217;
        Fri, 25 Sep 2026 04:02:42 -0700 (PDT)
X-Received: by 2002:a05:701b:2085:20b0:144:eac6:cf37 with SMTP id a92af1059eb24-14503ffef9dmr4634776c88.47.1790334161284;
        Fri, 25 Sep 2026 04:02:41 -0700 (PDT)
Received: from [192.168.1.25] ([122.183.173.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ac67c0ccsm5428954c88.4.2026.09.25.04.02.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 04:02:41 -0700 (PDT)
Message-ID: <6f2afa91-6355-45f8-b6be-6b556c679813@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 16:32:33 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] ASoC: qcom: lpass: Add support for LPASS codec
 v4.0
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
 <20260922-add_shikra_support-v1-8-6c6cb6444caf@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260922-add_shikra_support-v1-8-6c6cb6444caf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VZ_cnq-FlQdt-_8B93nDkEPu21Bp4xNu
X-Authority-Analysis: v=2.4 cv=MI71C8Zl c=1 sm=1 tr=0 ts=6ab654d4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=uk8ae9/F1LYL5lfeGCaUoA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=vpuhTeqA5xwXINrO_jgA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MyBTYWx0ZWRfX3GYDhes9F77G
 o6WLvf+k+2RH8BZ8fLzVSsN5E5nPzMhb16c9+aWAKBol4l0T7DFGF7APJjyyyqqCeHwL7xs5sPK
 nVF1XiXtgHDEkKwvw9qWpxsfBRhTqaqqnEsAPKLpmDHYb5ex3CRdUO0KyCJNeBlLQJs2oDT17Ai
 6O5+/vUCMkDApc90b60XvntUDBF/DRNgYxNIOrC+9p54ZEG6qwOhww7iZp1EUXYZ+fUQFwLbqWa
 CnUtehRAkZlMXZVWbUtgcphDdxtAKP+UA0/iS0ZV/LB7/wKw/5AYos/aDxb6jXFOMhM0Dfjk1b1
 /JVC43dKz0O4Dzyl5k+w2w2vkH2pWw2fi067FNUZ4NYdewUq1b0WkGy9Bm2HuVmr8qavn15M2NP
 4IO9X4bx3R0mNITpQ5aJl/JMfGZHaFW/qnL9g+qV9iEx0aVbQ+tRM6iAgxWzFMJrIfq9yhCS4jL
 0rO05cg+1zbQ4q7SOIg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MyBTYWx0ZWRfX3kW/Ld4ZgGxn
 fhW0QCuu0V8sCE+GKawNZMpbJNCak/R23EovV7bChCezKmQkbdKnvXmuqAeeO2wheYfkkZtN+E7
 r8nuZgGACT6xB3n7dgmLzt6UlDMRCE4=
X-Proofpoint-GUID: VZ_cnq-FlQdt-_8B93nDkEPu21Bp4xNu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250043


>   		rx->rxn_reg_stride = 0xc0;
>   		rx->rxn_reg_stride2 = 0x0;
> @@ -3959,6 +3962,8 @@ static const struct of_device_id rx_macro_dt_match[] = {
>   		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
>   	}, {
>   		.compatible = "qcom,sm8550-lpass-rx-macro",
> +	}, {
> +		.compatible = "qcom,hawi-lpass-rx-macro",
>   	}, {

Patch 6 documents qcom,hawi-lpass-rx-macro with `clock-names` containing 
`lpr` instead of `macro`:

     clock-names = "mclk", "lpr", "dcodec", "fsgen"

https://lore.kernel.org/all/20260922095522.193FC1F00893@smtp.kernel.org/

However, this patch only adds the compatible string and reuses the 
existing RX probe path, which still requests the clock as `macro`:

     rx->macro = devm_clk_get_optional(dev, "macro");

I do not see any Hawi-specific handling which requests or enables `lpr`.
Should the driver be updated to request `lpr` for the Hawi compatible, 
or should the binding continue to use `macro` if this is the same clock 
from the driver's point of view?

>   		.compatible = "qcom,sc8280xp-lpass-rx-macro",
>   		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
> index 79abbdd158b7..46ae627ca594 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -1896,6 +1896,9 @@ static int va_macro_set_lpass_codec_version(struct va_macro *va)
>   		}
>   	} else if (maj == 4) {
>   		switch (min) {
> +		case 0:
> +			version = LPASS_CODEC_VERSION_4_0;
> +			break;
>   		case 1:
>   			version = LPASS_CODEC_VERSION_4_1;
>   			break;
> @@ -2166,6 +2169,7 @@ static const struct of_device_id va_macro_dt_match[] = {
>   	{ .compatible = "qcom,sm8250-lpass-va-macro", .data = &sm8250_va_data },
>   	{ .compatible = "qcom,sm8450-lpass-va-macro", .data = &sm8450_va_data },
>   	{ .compatible = "qcom,sm8550-lpass-va-macro", .data = &sm8550_va_data },
> +	{ .compatible = "qcom,hawi-lpass-va-macro", .data = &sm8550_va_data },
>   	{ .compatible = "qcom,sc8280xp-lpass-va-macro", .data = &sm8450_va_data },
>   	{ .compatible = "qcom,shikra-lpass-va-macro", .data = &shikra_va_data },
>   	{}
> 

