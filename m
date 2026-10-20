Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478254;
	b=KtmNQjAQT/VaalTaT79FlNuB3PxB2Boqx3pjU5b/klelwUa67gAVJsxWIB8mg/Zv3fCS
	 KNmtjzB1gbowTghHra7jr2p2nXxeS30caXGeCYPQZVwG5WtaKb7NIvAEJtdqhSGoqlS9h
	 zaxtu826wkaiZjMDq598E9fLY6to/MUw2hah+QoxD97thLMM9JityTc8baG9lzoi7JC4q
	 ZOcSE5aYRax/WZ1d2LN95q8FXFCjIX0HX42JHUZ1aTfYiWsP7wZOPTpdnhYYSakql7TAZ
	 fqkjjLCQZB5WEmqqKd8DYGtAvEiWn2zFuDj8xH9cTF7IjR26YVlc+DjDmCXGkZogUkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478254;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dkeJ+qlF3OdyfA6H4VacvMWg7dys6I2xj2MZMgj3Yc8=;
	b=3gpRYsdecNe7k+kcYlpJQfVCaibrNKfvjKnltO1wdu+rxwglWHyyx62yZAzy6OV5/KoF
	 6ayd9HEg0fQGROF248vxPNsofM6zuUhu/sjywhEQry4U2+QsytiOUzTlDAr72y4zORgI5
	 V4ZSZwiDIpCDcVUmLOEgrmfxsnRHeK17Su1UTX60Zc1yq6VklrtTTR1Ea/XhjPLNmVrG9
	 yEyAAbMUjReHsxhSdAlJoCNKA0sBmJgzw7qHXWvYwepeofQWeB7LdVCJ2dg+zleHoQG1d
	 FJaQ17g5iM9kQpC/wJvBi4XN2wYtmM8WgbkE9+a44NwTpNdzvpGT0TEGc2evCzMa3vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Hc/kPQ22";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ISrY7ec8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB918606A336
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB918606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hc/kPQ22;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ISrY7ec8
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tP2m1211286
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:37:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dkeJ+qlF3OdyfA6H4VacvMWg7dys6I2xj2MZMgj3Yc8=; b=Hc/kPQ22WkzNYqHX
	LUSP2d3mZ2SIDMy+h1KWfkj6ZYX2dIo0iHTATXCu3cTut1qM7lyyzMjL1ArhMPkm
	D1MVX+yObTqSzih8zfFqsEoNmwnm1GfWWe7yj5gHYHdKH2C6vmsNXLD3TdYF8LME
	Yo0Rnwl0MmJGyuCcmTibxasGLKFVmcQrszrTeoLRMBiGRCh29wzf62WujLhVJmiE
	IwzZHPEnn4eOMNp22CaFkf47tMtQr5wuisDykYXNE6S2TDU8E+FOby3txGI454pI
	4A1t6I0u+qnxUiTcPo7brWpA90qxOAjbBr9b/LR+Z2SuF+/kaP6x5WJN7mkKsKH7
	8MD2Qw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p16xp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:37:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a3f673221so1064675885a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792478247; x=1793083047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dkeJ+qlF3OdyfA6H4VacvMWg7dys6I2xj2MZMgj3Yc8=;
        b=ISrY7ec8LxQiWuc2N9xovB5OGQG2N6beSz+y336Ff6ZG1Ld1iLM7oJxTJtonSii7j6
         rGHb5+xZRlLCrx3OSCk6yZIgpoGn0twE4/WXn8eAFQqzZHpc5Mv1uKkEZKcGPsUo3gdS
         vUZWtjgmB6tZlBOgMP66h09voRlqxZX+pNRF5qtNrkjMsJgtzWAgqYbGP2ywfRGsHsv3
         I5B+FIXOAs+PwDeZxzpYTA201MwNn0QgxRMhGkdnhk+75IwaMh29wTNT9miI1d1CLqY4
         KxAjSW0Fp0V7uamjsIuL2QeHMWaUxrSZ1yBuQjEdGVqLnzgRxeksVfuHEs4qIs1mpRni
         4k6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792478247; x=1793083047;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dkeJ+qlF3OdyfA6H4VacvMWg7dys6I2xj2MZMgj3Yc8=;
        b=hQnFys+/sr0tSgH3EYYOIdE1RsJSjt5CuwWejE9u/qLIlircp/Re4RmP8lot6gLf8L
         2RDvFx4pzvYYVX/QyshEGSLaqz0DbQvlFUE1pBfU0ltp01R3qiPl/uebrpLMwa8SZTg/
         bfSY+VtSiopobINDFoDnwD7Y5oMvlZ2LePRa0hXaYUN8+7nn927K1tOwOmz8hbZ/han8
         CK1ygDHloqe2qiCzU7CD3Pj1oJgvHm5kswDY6X51F9IlU+4fEe3Z43aIxx+/uVR26zLm
         Lx3ZiVLSEzsJB2IPo1qZWR4BBo9LhyGjEhLqEHUKaxHfRAQ7PKJqEAhy5uKGHJKtqw+8
         ZAgA==
X-Forwarded-Encrypted: i=1; AKwUvBwkqgR5yU3UpyW/g+TA4KjgzXc3/ZtERVRnNlD902Pqpm7hfWZyK/g0agdl11NRrT38TvyanN4n7Z4TqAc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsNfmP7P8YXGA7CyZIZupRuOnnS8KjDtw6ptcqslPIZK4weTE5
	s/+NqTfxdqsnDFL3/4oqXGSaU5GM4Q3hO4eB2Cm3X9jHW5woSoJQskarPTXwdIRdt+0B3IjeyqM
	iKq4U8uW8wf8bDGFSQHZBPaOB8wNgAZeoszPr/c4O7SGe12HkuiIqxcj5ch3khRwnj3e3pzxL45
	I=
X-Gm-Gg: AYBFou27QDH8fD19iFwHCgQl2hV3HZY9kCKp7gZfCrL7pFGKCZAxueyMqz1UBMdWN98
	Z0weqYFv52CQSObPXehKBTZz1IsBggXLam161DIBkgvraAzUaQ1pMueIkasN1VsvT/KMX2xaTBa
	bGbtrP0i65sMBOfgNig0KgbfybIkUQok799I912hhq3hfaBCp1MvmGDnc2XbBawuD0933dO2t62
	JVbLRDIQRWleOo2c/BJDuUbZpIqRsZkq3aKzAyvFUCHKnCyVvaQy9bQsoSuxuVJMm7hT+A4DDiU
	zPK5gKiM7NM0A7Xm1Mr06kBEq8hmtKM64ZuRfIPS4DlHiuSCT5xL70GUVv3LZu7nfSnU3079IDn
	3ozWezNpIif/WdBk59ocBFIhxWg==
X-Received: by 2002:a05:620a:1a0b:b0:93f:1af1:7951 with SMTP id af79cd13be357-93f29dad0efmr1717290185a.66.1792478247219;
        Mon, 19 Oct 2026 23:37:27 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0b:b0:93f:1af1:7951 with SMTP id af79cd13be357-93f29dad0efmr1717288985a.66.1792478246827;
        Mon, 19 Oct 2026 23:37:26 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e1d810043sm4079204f8f.16.2026.10.19.23.37.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:37:26 -0700 (PDT)
Message-ID: <5ace1d37-f480-463e-8705-e52ad7f34b0e@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 07:37:25 +0100
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
Subject: Re: [PATCH 2/4] ASoC: SDCA: enable pm_runtime before taking the
 initial reference
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela
 <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20261018192359.287987-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261018192359.287987-3-srinivas.kandagatla@oss.qualcomm.com>
 <atXXQv+d+AGd2VIO@opensource.cirrus.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <atXXQv+d+AGd2VIO@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: j1R3_F4gKV4DqMIPutsJ4rAb8ccgoMtS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNiBTYWx0ZWRfX6HhgajCmSr/V
 kcIrqw5tqzP4Zaw9NQMe+W8jyZpcqLtgt6KssvTeatr8yCtzBOPf9WkXcJjoZWrZUuL5uxF7L1M
 F3FxqxnGwhOUWf+9NBHSx3+U5SffRTA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNiBTYWx0ZWRfX+EvxdDKBqP19
 ZIc+7CYD3358cDRDc4+guTHYt/2EqqVo3LCd2NEr67b28+Huzrvri9jJKJCxitNXUPhA2lbDYAR
 5sGpDsToJzCp2S2Zwko434oS9pdmzbSnHl4vFgaYs02zTN6w6FRMLZ8s0++ZrQIPNg/MSxXXV7u
 ECor3jY39Ux7lPxcvVpJbpGBik62u/yEv+DzarClwXpA97zaha16lp6yBbTglHiNOQ1tZkj7sga
 YFw5/297J1cNjGB+Ifg6t309xOrZ9Ezxcpozi7o/2EGC+CCIb/kW+Uk+GPvRg3Uu5We8jLaLxif
 rR4JC6p/oMp7KRf4fopsF+1VVo9/yhPsGJ1DjbTYqCvvGWzR+/kqADa3wW/2vmZ/9mnjJBfQYAS
 sm9yzYN3QINDPIE7xmJfxshQZ3GKBw8xsbHkTYPnO/ducNVKMEXNKV8wFVvfLad+yT9Aa2LbjrE
 nEZePrhhYFU8KV9CKDw==
X-Proofpoint-GUID: j1R3_F4gKV4DqMIPutsJ4rAb8ccgoMtS
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad70c28 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cEVFgFB53M-sojWUyRkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200026

On 10/19/26 9:39 AM, Charles Keepax wrote:
> On Sun, Oct 18, 2026 at 08:23:57PM +0100, Srinivas Kandagatla wrote:
>> If devm_pm_runtime_enable() failed, the usage count taken earlier by
>> pm_runtime_get_noresume() was never dropped. Reorder so the get only
>> happens once enable has succeeded.
>>
>> Fixes: 2d877d0659cb ("ASoC: SDCA: Add basic SDCA class driver")
>> Cc: stable@vger.kernel.org
>> Assisted-by: LLM
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  sound/soc/sdca/sdca_class.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
>> index bcc660aeb739..3361db188046 100644
>> --- a/sound/soc/sdca/sdca_class.c
>> +++ b/sound/soc/sdca/sdca_class.c
>> @@ -194,12 +194,13 @@ int sdca_class_probe(struct sdw_slave *sdw,
>>  	pm_runtime_set_autosuspend_delay(dev, 250);
>>  	pm_runtime_use_autosuspend(dev);
>>  	pm_runtime_set_active(dev);
>> -	pm_runtime_get_noresume(dev);
>>  
>>  	ret = devm_pm_runtime_enable(dev);
>>  	if (ret)
>>  		return ret;
>>  
>> +	pm_runtime_get_noresume(dev);
> 
> I think it would be better to drop the reference on the error
> path. Doing it this way round there is a very small chance that
> the device auto-suspends between the enable and get_noresume.
> The intention was to keep everything powered on until bring up
> was complete.
Understood, will fix that in v2.

--srini
> 
> Thanks,
> Charles

