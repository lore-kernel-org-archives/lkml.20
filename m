Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474804;
	b=CGZCYkx9zEdOrF8xP5iAR66+LPcVzpGMxPOwcdu+DAnHB+bEoyVY9L82FUfBlgdPRHh5
	 nYFPpeUhBUoE0X80mYnByMrEgvuihVsebbtDmsN7FBE6nRtbbidY+rEYGzCGxf/vtXH+g
	 sk/VLbpx77K/K4ETCbXsxn9y6C4SW7nN0PcXVPfWCfIN8dVgqyfr5SAahMffMOZ2qgFjF
	 G0yvP+H9JLlMyONHkyEpTdvIlLu6Jh3BELktDzIP6u/IEinZFvu/Qq5/VPaH+tExvxY9n
	 wrO9ZCF0FxnUPS0Ff+UZE265JCMtK4VrsGGaXpg6mkegk8e+x9DtBsG6IKOrtCJ5V6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474804;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MCNJh8pT8rOgmjUfJj9nAXCThtADkidlGo8htqWWKYk=;
	b=NLVyDLceFqpTbIIFamp/mD7KwWPxhiC/V2oqEqdctGuHiN0JYwWT1AON+/qL2nNZya9y
	 TUUdHUrwkjKbyRT+hEnmjB3mOXJ4HY15fndNypE001jDEog+2/zb9yhfilfENZQBkydBN
	 mjkvamwMwsuM19GMM4VfFRWh7pivFxbXM4SmU1xg8zF7vNFK/HVvA+GOcKC5wTfgyA94v
	 uZdpJ2ToAXedPUJp1m+4rR0OwY9rKPqpgU6MDmT+JtKJz1DRlSruj5dHg9Hbk9iDE1K+H
	 cGwOW10xODB5Uy72VPlQFVm2v5mO2iVK0HnOyartBXsvivDJQ9iMP7RjiLcHaOAfZkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X6PkNa0G;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ereeec0I;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F16B606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:13:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F16B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X6PkNa0G;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ereeec0I
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC93geO1475352
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:13:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MCNJh8pT8rOgmjUfJj9nAXCThtADkidlGo8htqWWKYk=; b=X6PkNa0G4dWR3RJS
	1blrDUwv3ESpM8Vby94Lk9zpjM87n/uG+mc/ixzSJ95OKewH04OEXbPE2z0vSqp3
	5DnNFrxPsGKHR6ecQZoZMqoRPV60QZy8guioyaxyw23+tM6j5oXXQJkY9zZfYeWf
	rzN8iCmwCRKOELZ6+g5ngOy+yQVAgTlx8n/oqDYkUz0flHxSbckjsiZ1uYUTkFqp
	Nj7xsuoxrJR1QDC7T4bnIbZ6AtEP5EG09rU2QkyNg9AZlYzpXS0GZTG7+fSWfYXV
	cny444QgDXfb6njHMRQROZFLxizybqj8o4TtS1vvEoaZKxdxVwfoUjKWggZXdk4q
	AsRBzQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvtymun90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:13:22 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a064f294cbso3416353b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794474801; x=1795079601; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MCNJh8pT8rOgmjUfJj9nAXCThtADkidlGo8htqWWKYk=;
        b=Ereeec0IvPyKWdfGPg0zYErwewsPak04NuhbDgxLiskfmE31EsDWkqLnb3IQRBZmOA
         Hgp53bPwhSg9BkmbanudECb6ohrCSxUf4GRBXh/kn1RIQMTsRtdE0BEDefBRLvFeQnp6
         0XRIWNh5AYLZd7Eb5kjSLkQpdEqLaF2XzpsKHDP3YuDXEarYerAC+j9wMZMvQ3RgkHFR
         UqW4TKb7Cjikpxlj6U/8D14j9FmvMTgTg009YLIHvFma6E/WMKqa0BCY1WGGMvvLBvBX
         MlatLOlGS74WG7XExNBhMoIXac6HOoGTTFPcFTjVPPSEjKEOnkOQ1pCDiABV42I3p35F
         I0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794474801; x=1795079601;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MCNJh8pT8rOgmjUfJj9nAXCThtADkidlGo8htqWWKYk=;
        b=fFFvmLmYGNzE7Yq+B5WtPKOiyg95/1xJRi3BKFnzug8aj/vcxlCWWfgElcNIioQ3oE
         oBtZ/VklQf1eFdSxA1gcbpzJqhliarrknMRYTL+DKnB+TWfQw3/XaGOuH2DnDh8qp8rV
         vTghPCzxyM9vdSZGq5rGMd8BC6ilPkn0Xe3ZEx2E3geEgKVAikzHTIGizqUJ7gaISY0x
         qIOqttgBTlMSL1KgfNfC9T9ye4/zu48ekqlLP5AMtoR6qUzrxjppYyvDGiVDIVO7Z1Fb
         svdIyb8Eullt59jlKihtmQnPN9anFOrIrQOTuhGavz3SKHKLUpC4fMM9BoCVNVqAN2n8
         sx6g==
X-Forwarded-Encrypted: i=1; AL+hErENqv1vMlS3bCac3se8PunO1AT31fuB4hg976vU3lUkVLfRh/z7bjtmexz3INMjNrU0f5q0h2/AHXln9Tg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZVYqTX0le1H0ZRDYYeXbWOSazkaOsImkOUz5LXN/rS0OsDdpO
	4m0IZZ8Nj9FxkKRTsas2pGMGyQY8n5weTI4poBW7vJGF0KwJR9TyBtAg5vaHKzxDtCDfIOmvOCK
	FuuvEyUwCTvkv6x8qUbm7tf5kG3qFRb7R2mISg3sCfPUUcY433DpF+ogkUmhyHGuzJiVkWoT4EU
	w=
X-Gm-Gg: AYBFou0UTQZgRrwQ/m0WxDoHo3V7dP/jb1sy3wkutiml1HhddYbZEiF6vLJeoypriTd
	L5Y8OMAlKH3XYIS1XnYQfMbA0kB6AGsHVx3gKANxRKljj7dQqKn/+wsLGrRmB56jARl0693rUO/
	ueJOxgx4dOFuG+eHD40WZ/lVHVehcSbKGPuDJrkeZBYnZSzwSE6p9D2NYT/v2a9/zUwjfj0HlyF
	zJWghOPSFlW8N8Wt4cvQRV64xhIMAi2f7yDPmfgDw/1VwLK9tWregb65liWv1mC5TiGnE45YY1F
	j6lbVIzD6hd4XVPkdla/tDO0FlantbJPbf4Yqti8zARGwjkOFm85eWuflfvKuobJZzjvkYlwzpG
	Cz2PcNC4m/QmqupC1BGpUJ01t0uWL6rO9YzZzsGjIRiYW020aJzEtYz/xvJJRb7OP3Q6ERARvPW
	hJDIpyNdHSgJpF4EMnXNLqJqX9sb0KBsxBq/fYJYj2yQ==
X-Received: by 2002:a05:6300:6684:b0:3eb:abb7:f92c with SMTP id adf61e73a8af0-3f2fd69cff4mr5299816637.22.1794474801108;
        Thu, 12 Nov 2026 01:13:21 -0800 (PST)
X-Received: by 2002:a05:6300:6684:b0:3eb:abb7:f92c with SMTP id adf61e73a8af0-3f2fd69cff4mr5299796637.22.1794474800616;
        Thu, 12 Nov 2026 01:13:20 -0800 (PST)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baa7bf82b1sm3233448b3a.8.2026.11.12.01.13.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 01:13:19 -0800 (PST)
Message-ID: <dcc4d7a7-6408-48c4-8fd3-af96519fbd72@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:43:15 +0530
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
Subject: Re: [PATCH v2] phy: qualcomm: phy-qcom-eusb2-repeater: Fix SMB Power
 leakage issue
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261112-smb-repeater-power-leakage-v2-1-0f8ee55c4962@oss.qualcomm.com>
 <avWB6_hSarfdJV5-@parshuram>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <avWB6_hSarfdJV5-@parshuram>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BDpxUUxoxCN4rjOe-aPpVUb0hvhMQZSQ
X-Proofpoint-ORIG-GUID: BDpxUUxoxCN4rjOe-aPpVUb0hvhMQZSQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNiBTYWx0ZWRfX28RQvB3cnjXp
 NBF574Ok/y9Egrxln4fDjc1Gf53Z2v+D83J7DUQpXET0LHfWkX3cRBSSQTdM5LYGhiD7/GAICOS
 AYIr5rdyNMTsEqt7gateUY4PJNXwhOKDA83kcnbw52eBehHcSTCKb774SG0RON6qT8KH3ECrh1d
 NGcu/WtJgTdWdb4KGhVmznr4uhMh/In2SZeluvsEsqBUNqmYBemUFunP/KLSClu2wHQiLFMLhEI
 grOK+/O0tmK1JbGY4QYCEulQggCmKZxVk6Gvavu1KzD6j5wR7quRclIjEzoYa+J5D+C2yLd2lgr
 d/QBcG9xAqNb2LtUE5kw8R0Tt8mF/U7lz9nBeKetfLMH8D7nPENQBErOjLBSGP2vhCKIiXRb9LQ
 NmdsBsBp7BvYOph4j224VHZAGfIfbaPUfRulz5S8XDiyECfOiy6CJGaEJ16MT78cbHfY7+2mQ6O
 cLozPIlAGG7zCaW9jhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNiBTYWx0ZWRfXzWrnQ9x2sbAX
 /Yt+6msKRVrKmbTJPGZC2mpZ36x2VpoD1Cg8GAS3dahF5B6p7qCRBdE0I8X5WDSfJ4Gq8SCOX0M
 5JspQXLwEb4w7NeOWRSu3LDcRTpBhng=
X-Authority-Analysis: v=2.4 cv=Q4BHcI2a c=1 sm=1 tr=0 ts=6af58332 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=E76pol0VjYxlbc1R3GIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120036



On 11/12/2026 2:37 PM, Vinod Koul wrote:
> On 12-11-26, 14:07, Krishna Kurapati wrote:
>> On Glymur, it is observed that although the exit call is done, there is a
>> power leakage seen on SMB2370 charger (which embeds the eUSB2 module as
>> well). As per recommendation of HW team, disable the repeater during the
>> exit call to prevent this power leakage.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Rebased on top of phy-next since [1] removes the base variable in rptr struct
>> - Kept the RB Tags intact since its a rebase
>>
>> Link to v1:
>> https://lore.kernel.org/all/20260917-smb-repeater-power-leakage-v1-1-6d7311c3c03e@oss.qualcomm.com/
>>
>> Compile tested v2.
>>
>> [1]: https://lore.kernel.org/all/20260721093626.96264-10-angelogioacchino.delregno@collabora.com/
>> ---
>>   drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
>> index 89bc1c89fc85..607b5a5a1713 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
>> @@ -227,7 +227,9 @@ static int eusb2_repeater_set_mode(struct phy *phy,
>>   static int eusb2_repeater_exit(struct phy *phy)
>>   {
>>   	struct eusb2_repeater *rptr = phy_get_drvdata(phy);
>> +	struct regmap *regmap = rptr->regmap;
>>   
>> +	regmap_write(regmap, EUSB2_EN_CTL1, 0);
>>   	return regulator_bulk_disable(rptr->cfg->num_vregs, rptr->vregs);
> 
> This fails to build:
> 
> drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c: In function ‘eusb2_repeater_exit’:
> drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c:231:24: error: ‘struct eusb2_repeater’ has no member named ‘base’
> 

Hi Vinod,

  When [1] got merged it removed the base pointer. Hence v1 of this 
patch fails with error saying that base is not present. But v2 has been 
rebased. This v1 gives the issue but not v2. I see that you have applied 
v1. Can you revert that and take in v2.

[1]: 
https://lore.kernel.org/all/20260721093626.96264-10-angelogioacchino.delregno@collabora.com/

Regards,
Krishna,
