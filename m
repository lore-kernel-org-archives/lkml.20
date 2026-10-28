Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224569;
	b=Q0wBLoira9tVYjrcbhka3RO7er1VzBGKjUspRPJIB6voRXI3bZsHh+QdRwZJ8MPJo+ix
	 PH2zzygEOX7lBbqLe0TaSPqZ73V8zNe4jeBe2a/jZ2oN1vaaFh9yE6qCgq2J/5FoRA/XS
	 ZFBOosqdlis1V0/gQltAaSjUACjwbyYaR/cSB1eVdjHP3h7NhcrfzovyXGLMjFxZnPl9c
	 imOqD087x9PGbs1SX3zbmntHMu2Yyv/oy96WzG97Qk114p0/hGiIc3LX7+T+xeWTxr05P
	 4lc1YjMp1cERGsL6pjgS5irpMF8l2MIKi38s0+5btAW+8n7SlEhs0ehNml8JRHELafw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224569;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vlZeBbTn4X9bi4Ynurx+tgcFaDtcBUgNgkgkjVTl578=;
	b=zKeoNL9yqrBV1VL4+C1abuacn9216Fkuis79BiID/owEmz7hOi9g3IhQWq6zH8oQUXJR
	 Qai2PosHSYVomAp1WSL6T+5KUNSWGcx2wayrzAE3HMUIv7qxinlpISNGzQBvUdVx5HNon
	 8ANcDp3tBskiaRS+uSay7t82JTc2W35tAJ7Nr41mm9rr2Wjg4nn9vlBBhiDIif+8D5pXe
	 iaXbfi0citkWXi4F8uexXN0PODHgZjC4P4O15KBxQPLjO2th9C0EEkjSzlRw2i6KbsDZF
	 Qdra+Rd0sd+KaByg9gjfAQOBZPCbXiF5oMfCfisoSL0b0MKjniaRvoBRCuwqJ1QJ8cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I6+V08SU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NnCOu144;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D88F606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D88F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I6+V08SU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NnCOu144
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIPNun1942145
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:56:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vlZeBbTn4X9bi4Ynurx+tgcFaDtcBUgNgkgkjVTl578=; b=I6+V08SUWFn8OrJj
	/oc980yhRpnBQ54mN3PIWbEuO1FUMEMdNjS6wI+GTpHqI+3erfHUvhl4JPKS6Kyh
	XhsHfvUi5kNq0lg81sAV56Z83lgeiT6GEiSbLDaybfRwh2ryNGLSRimZuF6aWlY2
	A8iBxYUtmYNACwXeCfNOvdcfUEbrXlzoMkHPcPfWRF7RSGM/Pw12Y1dKtxkzhtSf
	6uzsI+/W2xjo7qSi0D6IrzX4P5rMmEcCnlFmWAJ9BbPMRp/bNoUwMiCPC7vBnuzC
	Nyks3CrstZZZvoWl9+kootfOwOkFWsXcXPAgWGuU41nAKgyxrbu2S62G6VbDT98N
	NquHDw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhwbmxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:56:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb98809caso240359185a.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793224568; x=1793829368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vlZeBbTn4X9bi4Ynurx+tgcFaDtcBUgNgkgkjVTl578=;
        b=NnCOu1444bSiyiYhISyWXlFagTvu8hTB2k5OJzIgdwSRkKnN07f/u3bzt0Z6KzcSNA
         KGnWD9IoMoWlpI1zMOyg/ocZEyk/1tkhr/O2G/u3AzmDtT42kobv/3eEUHkN5aA29kcK
         T7qDndE/zHj6abXU4hf54AdHlrVMCnN7Eo8wYrc3W1/F0pGqzBAHv+gJD0ijInl+Y0iU
         wtSPfrK2zgsFOyhRiy6qJODs3+GV70yq2Vrj+bsvqZxhJq2eJa5o15ZmwSU53J/PEmcJ
         06nuOdvhBw3IJg1ayCN8SfOLO820Lst+wHSA6dYMhvBcLL9dtNlZJwUb6gj07a5LJoND
         f5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224568; x=1793829368;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vlZeBbTn4X9bi4Ynurx+tgcFaDtcBUgNgkgkjVTl578=;
        b=dK8w169LKRdkgb8pmdhXDee6KT5RSwSBZU2vHWL93sfTcfyeL6YKzq+oO5ZmETgbgC
         9NWcJKImynMDBbIMMpTH63WoSZGYUR+iwgl1QC0w+kvEE5NYQaPBEucgdsiEN7Lksqnb
         +i2JiUUIxI02paMfSh+KT1ugiV0PNacVCBAuekG7DUevDFc7e+hdtbL7Wp/74kdcWnou
         lZPmJ3w0+0qdXjO73ZyzDuGqGXa2MpjI2GajGMWtpSTjGstMpOj+0FDHd4fj8z1APM6e
         HDW8Ez3J69eAnBVd6V+KzkJ24JU899VV3y96/cZfE5Eq08z/LRH805s5OdfIG/Zod6MS
         EgMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwH7uY1I8kx61tBnuL9zlf+fkqMczTlmr03HIs2qH3R4l122NmGXAnFEWE9fqhREQcLU5pm5XleIKRoiLE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4QkgMhgdibe5nERX8PHDReuyhq/GjIGlZHDvndHMab/XpJywE
	3Ru6pgSyAxDR0U1gPf+yli2OeKvl1nCmCMUb262Q4yjO/dnbDX/qZutm5XV98to7qd5kuWPlcqj
	INFdkaVVLFEhGq0lEe7lPp/7wclXkSki7f2uP64tbntjHZ70s/HNxb7WWcakTvuBnHAc=
X-Gm-Gg: AYBFou14fX8Gsw1wOE2Abtr7dTCEY70s3jXIhMstMzIpm9EWVHmx7KPs6l2g6ZVTgYd
	zk3+tRf6HoeLMkOPCd69Gydhw3OZJBzcPcoBRtlmZcehVnz1KVFFF4kP0ULLzLIRdkNRbVgXRSb
	qBLzohNgHDba0m0JVOd+tzwNjpDV4CFZieB2TCIdG/PFUfCqNJGWM+ItDz+fceKrEAzNLzP12iY
	C04C7rNDC4qiOakqJZCVIsZL8WjYTgme6VCMpnWQ00qodMWDr7ui+orEssWUq6KNaUApBGIfogm
	kdpudIGOR+RGdEb6IY/gobARZafCKyizuc1bpr7pwSZo6GfARczlheXM6Rmdcf1b5L8x2t6ui2A
	KorjL1f4bnO8rwIU0eK9JFAdtpvIga8bVuc4pDe/zBVtvBo9FLnwZrilWPXMnAVNhomJoTvihzc
	g=
X-Received: by 2002:a05:620a:6f03:b0:93c:29b3:3525 with SMTP id af79cd13be357-94408a94fe3mr548789185a.36.1793224567339;
        Wed, 28 Oct 2026 14:56:07 -0700 (PDT)
X-Received: by 2002:a05:620a:6f03:b0:93c:29b3:3525 with SMTP id af79cd13be357-94408a94fe3mr548785385a.36.1793224566702;
        Wed, 28 Oct 2026 14:56:06 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e64ccc693sm1283103f8f.5.2026.10.28.14.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:56:05 -0700 (PDT)
Message-ID: <110e1d54-347f-4186-bbe1-6aa03aa8ff3f@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 21:56:04 +0000
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
Subject: Re: [RFC PATCH 00/23] ASoC: qcom: AudioReach Active speaker
 protection for WSA884x
To: Fabian Renn-Giles <fabian@fielding.dev>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261028163152.26892-1-fabian@fielding.dev>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261028163152.26892-1-fabian@fielding.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Nq7DE4bu_5_5rNvT5rW-lodXtejvOpJE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA4NyBTYWx0ZWRfXziOtrNBR6mK0
 btv1sBXXNxi7z1tGt9tMTk1ZdTjZwt4XwOB7gedqZXC7M/5dWsefsqkjbsWFx29NHqnnHHnQN7F
 lMR1ERaLqVoGOdPKi7AsxOpjznxyKyw=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae26f78 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mQyjg09NGKRehI6BM-EA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Nq7DE4bu_5_5rNvT5rW-lodXtejvOpJE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA4NyBTYWx0ZWRfX2+h4in+Ln4Oh
 2vEuwK7AR3q5xmwDj+LtUpGHwM9TMhlLLQV6b5oTN/mBvABRrbuq7cndzPqCzH0eX/IuIUFsWlS
 5K1gQWvnkBJ7gNzqxdHvJVWph/BUSEm0Gfw6bbME7mhg3jSa2zz71xkJrI8NqvCzkoIN1352cwg
 ZZq0ruDiGFPi96KWbHRJx3X3sOaV2w4fcAlPU4MNI50lWYA2IQJPY/oz8IgWO+1en4eTBIxh4Bw
 7w7Wc+5UOVlCLQDki1YeW9k2L+t+n1NyPyyUySyqGo46anOEOnIdykqEypV+SZYSKjw3flxzd1K
 vtdTRmVNBQJN457DuwIcb3Ai9ltiPDzLH3/Eelu5mwgQ+0dwXhdDwiRt1u7qOMgaoQGhwl0qXU6
 CaMIq6B1oAjloQ/vwHQ9cmSUBpYmtUM5KiCcRnFcti/VCYcNiJT3mEdCIdSW/2L6+kMiJTnemKE
 pIJ8a4qvBW0LR/lBLdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280087

Hi Fabian,
Thanks for trying this out,


On 10/28/26 4:31 PM, Fabian Renn-Giles wrote:
> Hi Srinivas,
> 
> I tried this series on a Lenovo Yoga Slim 7x (X1E80100/Hamoa, 4x
> WSA8845, Linux 7.3.0 based tree). I found one bug and have one open
> problem.
> 
> 1. Over-read in audioreach_get_module_priv_data() (oops on topology load)
> 
Have you looked at
https://lore.kernel.org/all/20261023171316.819857-1-srinivas.kandagatla@oss.qualcomm.com/

this has fix for the exact issue, along with the VI fixes in codec,
please pick them up.

My Next target is X1 T14s Gen6 platform, I have not tried it yet, but am
hoping that it should work.

I will keep you posted.

> The function allocates
> struct_size(pdata, data, le32_to_cpu(mod_array->size)) and then
> memcpy()s from the topology blob. It crashed on the first load of a
> topology containing the speaker protection module config blob. The
> cause is in the size computation. data[] is __le32, so struct_size()
> counts elements while mod_array->size is in bytes. The allocation is
> 4x too large and the memcpy runs past the topology data. This is what
> I used instead:
> 
> 	size_t len = sizeof(*pdata) + le32_to_cpu(mod_array->size);
> 
> 	pdata = kzalloc(len, GFP_KERNEL);
> 	if (!pdata)
> 		return ERR_PTR(-ENOMEM);
> 
> 	memcpy(pdata, ((u8 *)private->data + sz), len);
> 	return pdata;
> 
> 2. Slim 7x bring-up: V/I feedback never reaches the DSP
> 
> DT changes for the Slim 7x:
> - The WSA codec list is extended with the VISENSE ports
>   <&swr0 10>, <&swr0 11> on the left pair and the mirrored ports on
>   swr3. The speaker nodes get #sound-dai-cells = <1>.
> - The static port-mapping is <1 2 3 7 10 13> / <4 5 6 7 11 13>. On
>   Hamoa the din ports are 10 and 11, versus 12 and 13 on Glymur.
> - I cloned the CRD topology and UCM, using 4 speakers, with the
>   WSA_CODEC_DMA_TX_0 VI capture at S32_LE/8 kHz.
> 
Speaker tuning data might be different, but overall it should work.

I will have to recheck on the port-mapping.

> What works:
> - The card probes and the SP/VI controls appear.
> - Normal playback through the SP graph runs without errors.
> 
> What doesn't:
> - Calibration (Operation Mode set to Calibration, then silence
>   played) times out waiting for V/I. R0/T0 stay 0.
> - I read back the SoundWire master and slave port registers, the WSA
>   macro SPKR_PROT TX path enables, and the DSP module config. They
>   all looked as intended.
> - With the SP graph active, the amp stays gated and playback is
>   silent. This matches the calibration never completing.
> 
> Question: is there anything Hamoa-specific on the VISENSE path (din
> port numbers or channel masks, the macro TX decimator routing,
> multi_direction_codecs handling) that I should check? I can run any
> debug patches you want on this machine.
> 
> Unrelated noise: SoundWire parity errors/clash messages appear in the
> logs, but they also show up without the series applied, so I don't
> think they relate to it.

I did hit some soundwire issue related to runtime pm, which was
triggering the timeout too, Can you try to disable runtime pm and give
it a spin.


--srini

> 
> Regards,
> Fabian

