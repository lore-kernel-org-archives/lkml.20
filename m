Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794232623;
	b=kWT69BgVBRbLvuA5Gwv7M8SG8F2JVqP377CzfS4kUWAwK66JMkiKPzYeyAzvFzNu2S64
	 /kleMiw6IxNEroLqhQSyOXQY/gxcKKwFnhwmBR1Po0/yxY5nzev0BF0cp09yOaM7hutvs
	 CCfkxlVVrfO7kAIFrgsQDsiLPMaCzDDCvPGQ3TKvsnaTP90MJv8j1F8ySxe+LujeywaV6
	 KNvmcBvnjUUQUO4POwoivJbTQ4TRNozyTe0sahmabeh5XmlomhiND10wKHTGYAWYi+2jA
	 ZVHgHSaSwUlkglczGnER+1yReTVJC+3tUKswp3v5NAuMyuu2tATtRp23ycvkbV0QEgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232623;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ahdWjaO9CBTxTVWPWfQbIkxMdhbvv1aJvET877LwySE=;
	b=U+2/pe5u77EpzU63zeBu8F0P+hXJ5q6MPs0e7S2iRzoFQGXWT4X7woh3+hPh3wL0MIdg
	 /Yu//j1RzPl9xlQKc+ELsFXb/lch0DA9Tc7WZCiS1eKSC7PYhFMj8bVviRMyQdvXVRoXv
	 nBYQ68MlzpLyr74J9BmW4jriye67zZXIAFTWV/WaD+bb4eI1uwOYaPYnZd8FUPTCNdmZS
	 yPaqsROlEJhIUK7xVvVArNME8Jm0MlX6M7Go3ePcZWEsZWiXdXMxvCTaE/Nbg+C78amgG
	 aSt8ch0PsbS/1aOt6lRPUVaK6sEa+m+LTsWfLrZeXPomV3QB4Uo2dQZUKR18BHeM+Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ssm+gfrs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N3Z6FVc9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E21606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07E21606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ssm+gfrs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N3Z6FVc9
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DF3Kc334839
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 13:57:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ahdWjaO9CBTxTVWPWfQbIkxMdhbvv1aJvET877LwySE=; b=Ssm+gfrsD1ev3JpT
	ihtLKigOBpwpsIOlBx5QTmYQY4VnX+AKrqPHUInLe30mSrde2HDxKnO3Z2Ns+Ze2
	EO7t5nkRA8o/ot4Z5RFQY53LFNoD0MZPJz7Zw3eTD1KT++R8kiF6N35V2typEA8D
	1Q/lnBh4L1GI0dUIS70i1+q4CCAE6fnkUuezvDVKiCMtXyCBTZ1PB5hoGSCYdSNE
	Douzjg+4uMqPnS/EIRy0czCrtzxmGaPWxIJVpg0UPPcSCVMOUpo2WCgKEMgL7YQS
	psBSFB80skxe5u8NrdFkT8OmYY+tbvZFk7rlmTQBDxbpU0WA0GQ9Z2fAWrrYLzz7
	kvBCKA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudf58f2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 13:57:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1f1f2ecfso21162485a.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794232621; x=1794837421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ahdWjaO9CBTxTVWPWfQbIkxMdhbvv1aJvET877LwySE=;
        b=N3Z6FVc9NjRtxPtIpyopph5Ez5wtPf5mfXqnwsjPN+w2a6qPUkNZ2aX4srzVW038Fc
         4AVkpPSIzOfZO+q877R/5oY9buYy4q/UimePBYP2i88sNGlebvOh9MF9z1RmT0MfjZ0S
         +3aIfqz6evsPjsdBoodDlpJDz84/hqpLPYjDu1PJucTPK4WxHYUuOopI9ClKRnxN5EqS
         VSKQliZAITbBfV0lO1pM4Cmgd7cuXFjqpmDvuMDgmkCv5H7taZw8e7+MoBkUQG1w+prq
         o8pwAq6en//8MYBbfdv+9FXS43ojdepyTgMg8DtKruHrMphNRZRuWqEDhONyf9/1Ua9Z
         shFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794232621; x=1794837421;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ahdWjaO9CBTxTVWPWfQbIkxMdhbvv1aJvET877LwySE=;
        b=OqmPP/xoJEdHsOQkpORK8gVXWgknn5u9HtWdP6CfHOJFNbq3+TEZOnhciHZDKAGyO3
         93pvsIp0pERfyIS+KUDZogvwW9AUSHy1zwLzaytUBF5S8RTkO5zVABZocr5zwMwOIRmN
         GW/ahHTbSULQLbSbcJT87h3OC6zSM4SKov213QVh/HVanSdbuB1J7XK+MQx68XI3J54z
         qfHTIRTbG1XVsg0I4w4ttytGBpeySbEbLcyM4asfBKruIAZ8MtKkujWU+Dor7ezAbWMH
         mMRPvB8r+v1/kfKqeVwX4nxd0zq+xzLtyIG4DD0KReQI3QKe6mKSfjFF5htWjXjbtbDl
         HR1A==
X-Forwarded-Encrypted: i=1; AL+hErGP4JlRbxVgZTf+gNb9384EvVF9+jDyvLC7kteuuZe1iaIPOx2fhoTPrrWAG7abr06rigyof6xKh/M81gM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8I5aqILaX1EoGQPBZr8Oetg4fho+eEy2rvDvLZfi730RyP+bY9
	NS2OMyHMuAKINm1lo++kRyFroLtjOmK4TtKlS8j8htjC5rQzKE6/YR5thziToM/oz9IAgAP6ypI
	XmI0IoZNkZKqS0HJZ30RbQY2GjJiV19qrkQcMJuG52BEU9LlHbW23gxQkM1ly3wHaT6Ek9y9H6R
	c=
X-Gm-Gg: AYBFou1Ykor2Lr5rVZgOhVv8e92L1qN6dCODWFTmIcoJDtLXIa7MJiJckbKKGDGkrl0
	qrYps6H2sHDcAS8zaL8biIZ/EjS/hQebhzCHaRepRJdtLcF4ztnvnY6wfCifp0yqvZQidvYJyuh
	ru+m0Mke0FuO/2tcdWP9PR3jWw45z2H/1m1hTx5LD9N3gJWmA6Eg3YJrIJ2Mo+thcrcqgEJ3BEl
	UmurpTAiTOvXBj11ACkpP1CvERXLHw4ZNd7SZ5qCfxV1wrQr7TB7Xt3eG+Lnqpw+4WHOuDC0GtC
	EfVmDTgMlZnZ8nt9x3HEbF3kzSI26ZEh2EBAKU2hcx4CcOH0jnVxBCUykYKPZvzQ4dQ6DrCvfKV
	XzWxuBaviSzFjGTJpxGmpb0AEuaci2xlQRvChR6RYA+6FHqRu3me5jSugZqTgQedGkI9Stw==
X-Received: by 2002:a05:620a:a897:10b0:945:dc04:c4b6 with SMTP id af79cd13be357-947842e6da9mr595078985a.6.1794232621062;
        Mon, 09 Nov 2026 05:57:01 -0800 (PST)
X-Received: by 2002:a05:620a:a897:10b0:945:dc04:c4b6 with SMTP id af79cd13be357-947842e6da9mr595073985a.6.1794232620528;
        Mon, 09 Nov 2026 05:57:00 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a4aeccasm178463066b.56.2026.11.09.05.56.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 05:56:59 -0800 (PST)
Message-ID: <747061c1-def6-44ed-af18-18c4b7c2df09@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 14:56:57 +0100
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
Subject: Re: [PATCH 1/4] thunderbolt: add platform nhi driver
To: Sven Peter <sven@kernel.org>, Mika Westerberg <westeri@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Chunfeng Yun <chunfeng.yun@mediatek.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
 <20261030082539.1208733-2-chunfeng.yun@mediatek.com>
 <179407827117.165429.11777170722243752189.b4-review@b4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <179407827117.165429.11777170722243752189.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zjMyYtss_vf9B0KqWOQt6SADS01mAGoF
X-Proofpoint-GUID: zjMyYtss_vf9B0KqWOQt6SADS01mAGoF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NSBTYWx0ZWRfX4zs/ParaJ5yI
 HzdFwWOwqR48zs9iGFq+erjKj8/EKdoUbZZ6ER3lymsE3J8IAlP823vDupEHNEp6klBv2vNrVZ6
 yMK64CdvLEWZ0Yn2or8UwCV0NV2+fyo=
X-Authority-Analysis: v=2.4 cv=bar+w+PB c=1 sm=1 tr=0 ts=6af1d12d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=mpaa-ttXAAAA:8 a=KjD6htFGCqKMDmwFDkwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NSBTYWx0ZWRfX6Hqg3z49dJAK
 vf309PVcLF9JOHm2tSPaAs9lYk+mRNAFFOQEx/sR99C4M360lIIvyAM+jEpae3vBhK/19aGp7dl
 l1s2iTV3dyu7G27PRr9xyPGmmlBy9pwQ6XHXMgRvT1dAHIL3fnsiItG9pSjuPoEJ6Fcb1T+5mXx
 +T9eTTX/Gi9+FBxNTQrii9D0NAatFpTJuAm7cnzIEfIHO41MGqPBAgk13MW+JDNEC8wiJf3Rot/
 aOyDH2on6P8b8bdv9MeysqGETCzR62ZUUDy7OflxZQEFz5Vbzt00xXR1v51BO3KGfQnUjRHcQzR
 /9c1jxndXm2+agapHqCP90GXEM2LirFTzXICs7SwNU3cBdoMp/0i8z8WbzHjBEGHjX1pK+PNdFZ
 ILhL0CzCEOFqGr+1pp+U4UoIMkL4Zos0r4HsMDYJ+8wiR+WSf/HJoQaJvvx6Msjcs5n8VoxZy5E
 iqqab9tfIt8Q7Mk0Ygg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090055

On 11/7/26 8:04 PM, Sven Peter wrote:
>> Add a new file plat.c to register platform NHI driver for MediaTek
>> mt8901/mt8992 SoCs.
>>
>> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>>
> 
> [...]
> 
>> +
>> +static void nhi_plat_shutdown(struct platform_device *pdev)
>> +{
>> +	nhi_plat_do_remove(pdev, true);
>> +}
>> +
>> +
>> +#ifdef CONFIG_OF
>> +static const struct of_device_id nhi_plat_of_match[] = {
>> +	{ .compatible = "thunderbolt-platform" },
> 
> Do you already have hardware that probes via device tree? You'll have to
> write bindings and get them reviewed before adding any compatible here.
> Generic ones like you used here aren't usually allowed.
> 
> If you don't have a dts based platform I'd probably drop this, not much of
> this code here is e.g. re-usable for Apple since they like to think very
> different, see my series in [1] that I can pick up again now that we
> made progress on how to represent connections between the NHI and the
> protocol adapters.
> 
> Not sure about qualcom since I haven't seen a series for the NHI yet but
> I'm sure Konrad can comment there. I kinda expect that it won't have
> much shared code either.

We're in the same boat regarding thinking different. This driver is
for implementations where the underlying hardware is abstracted away
(be it through architecture or intermediate firmware) and the TBT
layer writes are enough to e.g. power sequence the connected buses,
just like on Intel.

For the OF compatible, we definitely do need bindings and I too would
like to know if this is actually exercised - if not, we should cut it
out and trivially bring it back when/if the need comes around.

> Take a look at e.g. more recent drivers in drivers/usb/dwc3: They
> usually add a dwc3-$vendor.c file that takes care of all the
> vendor-specific quirks and that ends up being nicer than a single
> platform.c file with tons of quirks and separate code paths for each and
> every vendor.

Yeah, this is a nice parallel. Adding to it, there not only exist
dwc3-$vendor drivers that take care of the additional registers and
whatnot, but also everything around the USB subsystem - PHYs, perhaps
some NoC drivers, and all the infra that feeds into there, and it
compounds back into the size of some of those dwc3 glue drivers..


That being said, the makers of the spec probably wanted/expected the
hardware to have exactly this neat level of abstraction and I
wouldn't be surprised if more designs end up being compatible. Or if
the platform firmware makes it appear so.

Konrad
