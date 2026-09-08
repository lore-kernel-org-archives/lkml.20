Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D37B599A51
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 18:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788890430; cv=none; b=bOFU0Rg5uqhdGWHjSDBy1qoAQZElgEi77gB5oPjOSIZQOOYSPtBOWhv5ywRgFOAF5MU5NzB+NIKQ9bSuZl9JaX1sg2d8UuvcVg6b2vRRrLzROrh2hComeVsR6QToqrQ5KKjc8qgGrG9kaOfcz/NmfSFxyjdhg0ZRgVAjW810DFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788890430; c=relaxed/simple;
	bh=u6wdLrwyQiDIzovivnZzvX58qPuV0kVPxqekCK0IXbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sVaXf3ZIPO/ud0Z4iRtVGNd+Z0o3BqPsjZVmQc/G2Ny8QT/VOKqAKv81j4T4IXV/0ngF2UfP3yL8nuD80zUVGkB9s65wCRqIrlupliuo+rwlUSReJDq2+v0GQE5+cLDcCQwWyGCoNlWqS6DzyDeIszZ4U/W8xn6dPTEDdSmfLKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kW8Trzvj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NxME9Uuu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kW8Trzvj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NxME9Uuu"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FdXKj3429794
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 18:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vhI9rygEQ39zKq79+luFBhgAUw/Dcbm5V35+xL/RCJA=; b=kW8TrzvjT2qUPcfu
	rNaAwgnSOWf4omgbMnL0JcwwaNJk2ib3IuRgaJMbQot9CDtjlPRQ7KiE+mPkLChI
	bTeWO13CACG/B9zSVPWyU7xVJpcP7KEgo9HJ5WX5sezviZwANh1RWjYHJWvyG7U3
	F6n0hyqeaq6G8JrSPe6wXKuLygTtreblbatOSxIPmbX9RaZmOfvj75aKv/OoIzXP
	tCVdULIUNuu7GATTgTrWY+lnG92ki36k+vDWXIurtQQR5gudaMmAlgYk6zbuZn1v
	ekCUkWg27fyzJWbcH7EleOYOsEjJFTo4jWQaP4Jwil8IjSk4wGv7/8QnutLq7aVX
	Y3bAQg==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjhkj1v4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 18:00:27 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6a313ec13ceso5997220eaf.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788890427; x=1789495227; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vhI9rygEQ39zKq79+luFBhgAUw/Dcbm5V35+xL/RCJA=;
        b=NxME9Uuubk1j9FgEiklZu/0KeL0SFgb1/GXHOrIxfcc1mVzo3cJ45azEW2dPqHTRPj
         zNpHoIam2mIPQUwaETCA0mYJXYGrnfDOJFv+6XFVGoS4RUUqXVqzJFTVGvWRCYoV/qee
         UxG1Oz32YiCEgvuAtd5raKlqTXjVZssdNdEe2l9ZB+b5QXeEndguNNDBJezgSNRcSIG3
         ceTVjdiwuFjHCFZcxvQhaSxMMvmOecaNfl+RaUIdFmKoGVRZU7t2WqdKQhnwgzhKZVXf
         Z98Y6G3/QNJnX+y/j6kkX5fRkVDT64slzbJ4Z0p3yxjEJt1W5iGiD1zRLMVc3yaTr71M
         fbeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788890427; x=1789495227;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vhI9rygEQ39zKq79+luFBhgAUw/Dcbm5V35+xL/RCJA=;
        b=OM3thV8qwmZwpXkw+xPAIf+c1uKeVtiGWia5sV2MDT4oa+C6tWerHjV6ZcGovICiGa
         PhfLywoHTQDL2D/hcIhG4smunuAI/blYasbPpUhYu65xHqh8ar0QfCW/0F44q3kK3VtR
         /BaHc9mBSR8l/sC5EB8S5hZuJjaJbskVtGJHAGt4tRytGmXbI8DhR9nakb1NCibff+aK
         o/aWr5Be7orZtlFW5HVj4AU9O775mB/Kn5XaZHm0P0R3mxy1eKjtRlAPI4LiGsHRFjF9
         hM7fp25MiqxvMXdMq9ZImTJ7n6KhnRcDzfw0Of5ZunoTU8ZE0ZthmdxDuXCdgA8mORJB
         kxqA==
X-Forwarded-Encrypted: i=1; AKwUvBzSxmilRxaXP215VAHY1Ej/6AVF2DShJpVKciu8U7xB71Qjd1a5bx7EVYlWD8tt6S73CmxBbiidShZeOpE=@vger.kernel.org
X-Gm-Message-State: AFuF++kCXP0ownU7sD4Mnc7gSXQMmKnuuBvO1YZkX1kznRTGdEqORUOK
	CVkUAR/nzk+ChM5GGDjogT9DsnrQwCCTjA/NGt/KO6eZSxKAqgr5k9aIy64nMEd++ErxIu8jFOb
	c+dDl5BuO0RTK0TfgqaIYnzuw2i1Op8qBatLvRwaXtRNAPWAp9M7fFRgbxgbVEsn1Q/k=
X-Gm-Gg: AYBFou3qjsxX7XxyNwsnQWkPD7QAEyncNh3cbv5gaoo1DO0nxjw1T94sSdCcYTLgtK4
	akX2G0twVquNMjyfTDGSb+ZSiPEK9SYmzGCCitqPF6FivICMx9v/nu4zjpL6b160HqBhRLmcgkQ
	CyGLP/EC+AEseA0MjQRlL1nq7m8KvAGhDCNG0E5ibHpDz9kVbYj6LjAdiJ7EsxoSdHgZm2JJafZ
	l3dZpQMKq90KdwDcEQAtN3zcWxnpi0xi5JrpUvpGOmVDWV7hliWAhBQjnVhwGBZcPNj43mj8s+u
	e5RQTafjK/LLGHm6nGOltp9FIRpuB5fcWv1/qC6bBpSY/shSehN/PgdVZo2pDVyZDi45qZm7wMk
	VTkb/rlz/86eZZngX78511uufFaM=
X-Received: by 2002:a05:6820:81f:b0:6b3:697f:9f1c with SMTP id 006d021491bc7-6b6fc7d2ba9mr29068681eaf.8.1788890426711;
        Tue, 08 Sep 2026 11:00:26 -0700 (PDT)
X-Received: by 2002:a05:6820:81f:b0:6b3:697f:9f1c with SMTP id 006d021491bc7-6b6fc7d2ba9mr29068622eaf.8.1788890426281;
        Tue, 08 Sep 2026 11:00:26 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-4760cec8679sm10736429fac.5.2026.09.08.11.00.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 11:00:26 -0700 (PDT)
Message-ID: <f1e80aa7-2d92-455c-b7d6-484fb353e01f@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 19:00:22 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/11] ASoC: SDCA: add populate_function hw_op for DT
 function data
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-6-srinivas.kandagatla@oss.qualcomm.com>
 <aqA29pv18mXzTR0G@opensource.cirrus.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <aqA29pv18mXzTR0G@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE5NSBTYWx0ZWRfX9qB0qQ+oiv0+
 3LgZijH9ek+ZdM26AekawQpuUs1rgyeA872kxFzI6JzEIze7FMFuNVh2BtVNog0JoCqIq4M1rCv
 potGeXU0CFvi/KIeK3cKglj3NRHQk3k=
X-Proofpoint-GUID: gANMU1qudUThLWPXmFuIxEj1IDTPKD-T
X-Authority-Analysis: v=2.4 cv=VYjH+lp9 c=1 sm=1 tr=0 ts=6aa04d3b cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VczNHz_CLEaalHvbfdcA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-ORIG-GUID: gANMU1qudUThLWPXmFuIxEj1IDTPKD-T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE5NSBTYWx0ZWRfX9WfbjeKNA84G
 dN5zGUSyGW/2Xq9+DJVuzuacQCRAJ+STZLHfgqfsxB99ae0D4hZqGG2fK4Ft64Ls8N8nytpThnB
 Zb5whBCxO0bUgFnEppGVTOKgBljRXb/U/8yrtRoxU07+9yYs9RkbE9WNsWAYEF2M41IU008KSqy
 eRTs4dWKXvvXCX3yMeRMyT/slueFz8ZZ9NwKsAkFtgvbeM7lchnZbIiHbjtuPxNhkCsSlbi4B0Y
 WuiTLCVmP2ZhbADQNKOyZSpFbE1EAJ3UzXiXj0j3/MkOHF19Z+Y1Y/plXtU0yu5XC5txNAvL/Au
 T60BdyRPj/VyPjCv7+cWIOwpLPI5v26gVsxjyTim5+DKJLBeAo3NnJnm4Ov1OOQxoRezgwxeGrO
 sAf07Op++Vy62cQuhyL07DytjDCNAgf+BXrQjwJuPTIEQHUP5NeJ0KvvlMc/WA5izY+ZU6eumEV
 axLNGiOAH1A7YcKtJfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080195

On 9/8/26 5:25 PM, Charles Keepax wrote:
> On Mon, Sep 07, 2026 at 09:37:19AM +0100, Srinivas Kandagatla wrote:
>> sdca_parse_function() walks a firmware node, but on DT there is no
>> DisCo node -- sdca_lookup_functions() is a no-op and the SDCA
>> function descriptors come with a NULL fwnode.
>>
>> Add a populate_function hw_op that the class function driver falls
>> back to when @function->desc->node is NULL: it fills the caller-owned
>> sdca_function_data (entities, clusters, init_table, delays) from the
>> codec's static tables, matching by function type.  Leave
>> @function->desc alone -- the framework owns the per-instance
>> descriptor, so devices with more than one function of the same type
>> keep their per-instance SoundWire address.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>> diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
>> index 10a2b031b572..8bca88865a4d 100644
>> --- a/sound/soc/sdca/sdca_class_function.c
>> +++ b/sound/soc/sdca/sdca_class_function.c
>> @@ -329,7 +329,14 @@ static int class_function_probe(struct auxiliary_device *auxdev,
>>  	drv->core = core;
>>  	drv->function = &sdev->function;
>>  
>> -	ret = sdca_parse_function(dev, drv->function);
>> +	if (drv->function->desc->node) {
>> +		ret = sdca_parse_function(dev, drv->function);
>> +	} else if (core->hw_ops && core->hw_ops->populate_function) {
>> +		ret = core->hw_ops->populate_function(core->sdw, drv->function);
>> +	} else {
>> +		dev_err(dev, "no firmware node and no populate_function hook\n");
>> +		return -ENOENT;
>> +	}
> 
> Is this the right logic here? I feel like if we have a
> populate_function() callback we should call it regardless of if we

something like this?
-------------------->cut<---------------------------------
if (drv->function->desc->node)
	ret = sdca_parse_function(dev, drv->function);

if (core->hw_ops && core->hw_ops->populate_function)
	ret = core->hw_ops->populate_function(core->sdw, drv->function);

if (ret)
	return ret;

-------------------->cut<---------------------------------

> have a node. That would help with the use-case where this is
> being used to work around bugs in the firmware, and
> populate_function() can always call sdca_parse_function() if it
> wants too.
+1

--srini
> 
> Thanks,
> Charles

