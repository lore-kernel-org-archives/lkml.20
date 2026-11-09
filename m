Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794193136;
	b=rCYghOJUO7KviHA8VR7NT17VxVs3sNKxd0OSAn/lBZHKibelObBcPa+aLTbU23KmjzyZ
	 m2lWQj5XkdszOf1N/pf5VMS6syI/Muj72o4W97YdsGcxXglWe94iIHhe2rEZNvxg/PgQ7
	 WwW2HZS4gntPwECaX+8CHb6+hgPy8m7zxwoH6irEVoy/6u5aFYpI/0od7enrdnTTcEW2k
	 PhOLRSIsak14Mt8BXQ8uKVZ3ZgBNt8icA6Ssr3a88F2d+vFKcdrj0YQBQzNyWs3tsWyMH
	 84Nw6/9xCDML6NRsEV3/H6Fd5dkhb+CxjLvWPpWpf4hPmCZOTV8Ec8JcisDgZlrLaog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794193136;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bcDBZrOIs3/hkAhonk3wtiBmEGG5IWT1pyC7cvmXykg=;
	b=eR1nRkLXb2P3VVxJgQ4Mh5iCAM1FYWCobljid6eLchLjeDbp5SxoIDqjJy3w4dYZ3Doo
	 5Re7qLzYBf48X6t16cJ9/kWFGixT6ZmPmarbNp4mALLyPAUKNmaTqZlbTGbbDXPTSpONT
	 g1/RUxKdbwl5jP86lTWX8ZBxASw9ZhiurlbYwaLqcrCYJQl4zcSj82dOzpCy9PQzCFxTI
	 B7FoGB5kdfRromF+OdNJMKB6PGJziDmJfw4uQJxPZSdvLHEPv53hworWosJ+mHUq/v/qr
	 pAojBp0+T63P3ZKV16lPmfs19xuZOk135a/6NbqGlbXAThlvq16fmkykpDRwbARoMnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F9urwjAT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iyAiFZ16;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB714606A320
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 02:58:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB714606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F9urwjAT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iyAiFZ16
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A90HPtV3514821
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 02:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bcDBZrOIs3/hkAhonk3wtiBmEGG5IWT1pyC7cvmXykg=; b=F9urwjATAQ06/UAO
	sGsXrkVeRNVXWxTNHio7Tw4Vidu/HKUFbOkF4QPJg5zdvkAmmYUllLftBI+5z4rt
	ECr79qbERtnObxGJiGVHpj5uSngfhWLtx5IblCk9O0+QD0orYvT+WbERUhClYiM4
	XhRUhSO+aMW+tHgvVptIxtK5NK3WIkgS5J4tWaTXqaKJstQwwL+7Qnmh4FziYKrB
	JyCt4LIRabiKVgN1FMLmBNArhhgNo94+fyBeC0mbmCIQaa5tkH6lrUQU6ltMjzTN
	R4oaFa7IuZslaTGd3BrDvNJrWzPyH4k1gV3956OFlwKNIJUruxfUY06h2M03tVuq
	HIIG3A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxcfgc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:58:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b08aee6b3eso379741a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 18:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794193134; x=1794797934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bcDBZrOIs3/hkAhonk3wtiBmEGG5IWT1pyC7cvmXykg=;
        b=iyAiFZ16tS5PKD8WnsfhFNsQ6AXQAMwnnjxUmOlJjhEpsePei42TTIceJNlupChO8i
         InVJNhGDHqUBfo48xospYQ/y92xWgUoW4tsyNvi/0lz54MxEl9XDoIE4d0D0eFVVu4WC
         UNrl8lCbncGnMzljIrnbl7IBxsZmvveWcg6onltSNVouphVp+IlhvASEzwH4B5V6y/x8
         hOVsPyBvFb/GHt1UX405yPUbXpE2rhQIzI4yHMAc9nOWRJA9cdYdRbQiHC01QxQIqB2h
         EQMVuvyUpiqABhsHPeIYxXkjPUN8K4hHvXRpBR30VbkNqopfbyY7f5HXvu1nIsahw4uH
         zA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794193134; x=1794797934;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bcDBZrOIs3/hkAhonk3wtiBmEGG5IWT1pyC7cvmXykg=;
        b=CnhobPDgXmfsxjXExJx9RqZs5oFQ1K2OjV2Vj2d//nB80zzymf5oysZm/RvhahTYOq
         IHHzi4sepfyoO5g2VLaNqc9aYWEqRuMTb2l7r9Mq4hUDAbxWjjrcfkpFKnv3pzDkDg82
         1+lcx/bsQFCxXTS9K4UyHWDUliH7PDQB7IUTJn2U+GzOCABy8ZkLn58Vg5VXvSRfmCDd
         TnlZxaJK17kiFssh8gynHwRC6Q+hKtcvlMyMmlGoFtkkpmoal4qx6h8sZf8UqtRZImvB
         fpvBKzWtzcJ4IhQnCMjXQ0AkRb6T5qYuuUqUTR4uCcSc6ypnCnaITVnyIr3hc2wovMJc
         N/Xw==
X-Forwarded-Encrypted: i=1; AL+hErEDBBq0YP8+v53q9REiN07zxQYkN8tXwpWq977cjy3NVoce5Vxqbg5WssLaVUbHMyCqrXPR01XclzU3JU8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NwJhsbjBunYsLRI43TaMDIyaRvuSMfFQE/YWzmgqkNG2f95PO
	F80S9Kz0hzLyd79my/S6e9jysPxnNwKNYBX8gKnOnHXMbrTZsmr+J8WT3D1j7030TFggquUYFWu
	3S+uxHhGUcJ1jVLfUgDJHTbROCKOeXtDj1seqETF10feOFM2YmAsF3Miy8i+vmEIHgCc=
X-Gm-Gg: AYBFou1Z7621HpNii+oeEZ4/CLOP+burGhA+U6bKqHXl2DCBCygoF89P2yTFTyNCKZx
	XlRUjpKF5MFbrox4P85lM+3zUB9gUYSPjVbPkXq6Vo6f32XXI6N70nEZMWplXhbbQOWyzEqEXd+
	jIbhTITKcKI1xRtlwu1sgD9DAzPhGf1btQthp31vFNFZGbZ+5uce5n/+a+b61HImc4zcHzWDsN9
	7JM/7at9VXvmAaARHf/3TZqrXLeFityvcE8VmpPWYekUHks+kUxpsUrpehfQFb6edYhwwa2a/Ct
	SuHeGVgvEgTZgVhcWcagTKWdsCFisSbub2oKbn5xA9/gigfP611SKeeaXMNQfIQUF9zOopOFlVE
	wgLMeC1KE43yO0R8pyevhfwt+pMPHLN+/D1Hs+sf0B9XadnInaP8YKtpOpAtviqBXtu/5R6XJtR
	ruFDRgrm5EsM8XXaoT+7irgL8yUzjVQTvwSN0B
X-Received: by 2002:a17:90b:540c:b0:3ac:9176:e837 with SMTP id 98e67ed59e1d1-3b12d5b0390mr2589427a91.50.1794193133503;
        Sun, 08 Nov 2026 18:58:53 -0800 (PST)
X-Received: by 2002:a17:90b:540c:b0:3ac:9176:e837 with SMTP id 98e67ed59e1d1-3b12d5b0390mr2589410a91.50.1794193132989;
        Sun, 08 Nov 2026 18:58:52 -0800 (PST)
Received: from [10.133.33.176] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b105864375sm9085247a91.4.2026.11.08.18.58.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 18:58:52 -0800 (PST)
Message-ID: <a645f8e5-302f-4f57-b482-b96eb4fcede7@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:58:48 +0800
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
Subject: Re: [PATCH v4 0/6] arm-mpam: Add basic device tree support for
 resctrl
To: Rob Herring <robh@kernel.org>, Ping Li <leeonion.muyu@gmail.com>
Cc: james.morse@arm.com, ben.horgan@arm.com, sdonthineni@nvidia.com,
        andre.przywara@arm.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
 <20261104081302.304667-1-leeonion.muyu@gmail.com>
 <9d370f12-9e4c-4b80-9d28-ff8085ce3aee@oss.qualcomm.com>
 <20261105055347.947416-1-leeonion.muyu@gmail.com>
 <20261106150822.GA3193214-robh@kernel.org>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <20261106150822.GA3193214-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1L3TtaSupd7faxOWRG74obR2O1iwP6JS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAxMSBTYWx0ZWRfXygdpaMcm8bx3
 aJqUE/h55ZC4sR6wBKmpBynE3PP+f4le+LtDu/NaAQoEtFMhaM9EFqO334lhmB+PhQzBRdyxnvw
 UQGYd4dYgaxbTNmoLTdjSdhlbvUw93rwqGk+bVUI52Og7IN7cYYqZ5quM+SwQz1htm3SNUfdsSD
 E4MzP9U5qLccH3iRrai7fmxZDIwJ1j3EmF1tGuNuPPp/UCGo8/MgQbAF4bq8WdQHhfAaKL+FW4H
 oocybW2J8bgJe0GnE4nRNGIKJJB3zYQEf7W90uxxdK0DGGEoWzYsWWCKuHTaR/uMoBeaKRu8lk5
 UGmjcv2RYn3hBJx8MMEDRSgx4E0AklhFxzHrou7wpEg4inHtVI1fZK+sJvH/Zr3JdHXdH+93HG8
 wNudJKuL5Opzw52G1FOzgMXAIO4p+rsR0Wywk3Sb6CpOj8C66LKmbzZIm2stEF/AoBBwtmVlazG
 0oVV9driXgjQKMuTjhA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAxMSBTYWx0ZWRfX28ft+7UosV/s
 7rJ2dJY1aHX5iWPlatFhM9/Zp88ngeEiJhtQuYDO//JNGLxqi9iztBLK18HRU6mA+pl24IzxbN0
 bhlKzuJChK87B8sgH1+cryXsaSCaQU4=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af136ee cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=aeo0eiRZ57vjQv3oqWoA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 1L3TtaSupd7faxOWRG74obR2O1iwP6JS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090011



On 11/6/2026 11:08 PM, Rob Herring wrote:
> On Thu, Nov 05, 2026 at 01:53:47PM +0800, Ping Li wrote:
>> Hi Yin,
>>
>> Sure. Our memory controller MSC is described as a top-level node.
>> The MPAM register window is mapped independently in the SoC (the
>> component sits on the DDR egress path rather than being a sub-block
>> of a memory-controller DT node), so the node is a direct child of
>> the root:
>>
>> 	ddr_msc: msc@2238000 {
>> 		compatible = "<vendor>,<soc>-ddr-qos",
>> 			     "arm,mpam-memory-controller-msc",
>> 			     "arm,mpam-msc";
>> 		reg = <0x0 0x02238000 0x0 0x1000>;
>> 		arm,not-ready-us = <10>;
>> 	};
>>
>> The first compatible in the list is for our platform glue; I have
>> replaced it with a placeholder here since it is not relevant to the
>> binding discussion.
>>
>> Notes on the properties, in case they matter for the binding:
>>
>> - reg: the MPAM register window. Only a subset of the architectural
>>    register space is implemented, so the size is the truncated window.
>> - single RIS: the component reports HAS_RIS=0, so there are no
>>    ris@N child nodes.
>> - no interrupts: the component has no MPAM ESR block, so there is
>>    no interrupts property.
>> - arm,not-ready-us: 10.
>>
>> The verified probe path: the node matches via "arm,mpam-msc", and
>> patch 6/8 in v3 classifies it as MPAM_CLASS_MEMORY and treats it as
>> accessible from all CPUs, which is exactly the behavior we need.
>>
>> One question in return: with the node being a direct child of the
>> root rather than a child of a memory-controller node, is that a
>> form the binding should cover? If the binding expects the MSC to
>> always be a sub-node of a memory controller, we would need the
>> top-level form to be allowed as well.
> 
> This would be why we're not upstreaming the binding without users. We
> need actual h/w to validate the binding works.
> 

Hi Ping, Rob,

Ping, thank you for the detailed description and for confirming this
on hardware.

To answer your question: the top-level form should be supported.
Unlike cache MSCs, where both class_id and component_id are derived
from the parent cache node, memory controller MSCs derive both from
the MSC node itself via of_node_to_nid(). There is no requirement for
the MSC to be a sub-node of a memory-controller node.

Rob, with Ping's hardware-validated use case covering the top-level
form, we would like to restore memory controller MSC support in v5.
We will use Ping's DT as a reference for the binding example.

Ping, a Tested-by from you would be very welcome once v5 is posted.

Thanks,
Yin


> Rob

-- 
Thx and BRs,
Yin

