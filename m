Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792530913;
	b=CCbMSDDiPRoOwBCmrUsBQ79fq3bWaUmSl+VxVsBN6FeEN/PTwWYPJ5G0KybESD+Wy3J6
	 TXRIbFbQwGGBhHxbJ0iCdtMnfSES6rN7FxOmiNhK3+o2yRQI7wo5skM95PHH8x7CuXx9T
	 1QJ/gr5hC4f+nYKFxG40k6wFtPRHnpEYehIlVLvbhA66bK+3N40uGVB7seu95E3lpnLJc
	 iJlFEOR5NY21giReQ3N2Idiqra31bXvqnkwTjTve2QobWcT7+jcXK8eChF3xs3GT+IDrS
	 0oK1hzdoAlFVt2zMI9F3cHSJRqLd2odY8jR/lWGeYrssZDxjw/GOmvXY8j1v8Bd7DsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792530913;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sT7TNT3LgoGrkuy1rFoxBJWa/Cwt6lKP6DMVa4zjFec=;
	b=RAmu5jBQeReInaWPRAEy8HMNHgJjP0Wyr1LEY9tl3jEbEV1iuCzJeabYji4+61xqXCoe
	 jaVhc04RNb3NwtOD7b1eVTDMV79wO48ww8b9RVZNAQenTf3yw3cunwCRHwdsJXdTJYpSc
	 1RD0cpeEiQa5J6XFNX2lkQkkCrxZqOr/ZZcVp0RPdj4DBdtVRqbkQFopHNjC8NtXr5mF9
	 OD/uBXgrVARlCqod7/pxPcOpEHX5KkoOytQ+KEfvM3IShH+tUZLWISlaXDFgKohqqjluX
	 vKDU+KzKK12NIAoRl6YzUTxodwVpAShVVGXZhFGM3ZMtyMAeFf4gkcdKpjhJjaCNKxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C9NNQjG1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HXsHDjSB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BCF606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:15:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2BCF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C9NNQjG1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HXsHDjSB
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KKttxt2442086
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:15:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sT7TNT3LgoGrkuy1rFoxBJWa/Cwt6lKP6DMVa4zjFec=; b=C9NNQjG1dc1jZvhz
	INZ5MeHYvQob7NbXk8rKACFzfVBqvffe3AeZqpaROPWbb1yfW8X42Eoclirq1ggX
	Iv6lahrbPf75YvtY/E+SHxCiGDixLnCRCphhgFyb/867QySF5Jq0o0odIg5FsFbr
	+gIx3aspInNHqeVDdXOKw+8zLjlusYIBeW2z9QCQetCW16+t30L23QL1ApdmfpCa
	Qb5ByE4iyExp5bA062UeZSfrBPY23z7mqxpmUwSdsR5gXaifJ5cZ4a+9cY6BveLI
	GhfhEoTHiMjjau0iJCk1e+dK5mwO82b9J8h/PnN7iDLzdeTljpqUM6cX2C4Hcvhq
	2x9wiQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9hrnv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:15:11 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139b62317d0so155138c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792530910; x=1793135710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sT7TNT3LgoGrkuy1rFoxBJWa/Cwt6lKP6DMVa4zjFec=;
        b=HXsHDjSBN+yDgmGuJrFT/6SYFGrwGDh7Ec+qdvvDvQyS3hID9zJ3maPPULaEgYM9Nx
         eVku8PPfbpIAb415+rUFj7aW9eC8aErrkgcTxLgUpgAylPQ/h65Ct3psJgsJbfVKJBpa
         URBp5k/zAyLaXg508punWFlitzaO9bX+DOxTe2xAvO0wTw9N3fX6ZHZfVQETNxjAU3zY
         zEYvzXudsFNPbXKOVRDZArhwBBS8Cl+PX2oqHkV6Lb8j5+c3t0V7681GG4rqzrJY1G05
         qS+DH2k0Y/kfVtYF2CtVS0wO92eXGitgnIP75MGnT0gV6h7aImEv4v8LOIXiZhElgyUG
         4WBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792530910; x=1793135710;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sT7TNT3LgoGrkuy1rFoxBJWa/Cwt6lKP6DMVa4zjFec=;
        b=mjT7A7nR9FrShlgCy9KUmBGUxjopGFKQtqqZEOWEjNJEf9/j0F4WDNgqz1pnj1xXLq
         9QKsSptcnzzJhateDiOTDtlkGPRMAegCU4o5dAXpP2BB8453rpBijw5dVKuDBIjt/OFr
         5onHrqd+dMw+obAnMUPzdSpt6GDqdJyH7t8LIZhVJ+Buk5Apksffdnmm0F7/HNRnw86t
         vIEhlPV060kuF6Ql0UJigwCmBnvWpHNc2wcLxxcdRYf9oXVNhkGu1vWRuNjsBIOzXtnH
         bGqGoG/tVFc+vZTaIrmFkAMUaUa3YZ4szoZkJelG1vQ9wBQqeLw2d/YQs/X7rH/URULm
         2WRg==
X-Forwarded-Encrypted: i=1; AKwUvBxCKrej4ctjK4VdoZcuDiZ9a3+LhOhXk1luTiJ0c9e5qkaNzQODW/Acxc5NK7aBOt5Cg9n0Kpv6YMpVOSA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKr1WhIIR4h5ocaQHZhICHGCzaZfyvDfc/ONIuZ62WzgRGYQ0Up
	/SGonulZ4p3JP8QFAnpLSeTT1EexkdPcG8TwTwu4o3N52BDfU6Kw3/PTS/3IkNVMtrfMeUX8RvX
	DRk+eqTOqfqBd+y5nIEAy8EXUZSvty7FZH6PtczmBIi6ZnXrifNVMWeZdr47Y7YEYmbs=
X-Gm-Gg: AYBFou1E1GozFYNHbStLRkHLx5+2O85ganaOjrydcz/otYxGq4pFuMLCWOsb2mKz3Iu
	DVrhUbm3bS/ab8iSyFyqiym4mfQoBJSZbPVrElYv3VEnl67NXhfO0n23aNjFxHxTzaQ2tM48gkK
	n5tFpFlx8k20+G/R437JZQDxX3rp91vlOJ3wbl2crRKPPp7uJoZHShwH0fJdtdH/TuTe25KLjrS
	bzuUSW3XDfk/6gE33bi67nLKM0AGeQHdoBw0HYzmeqXitffbXpSTYTrhsSWkgntNXndHWGsXXHq
	0Af3doAu0lW6dVo9ViTPSpmApxUmVcq+j2b0Ds4+3MRNYlSslFjHYodlOJIXHz17K2Xad5SsHON
	bE25V8LZByIQXFwXoRT/ruTOyVgU2IGhzsLdfYamFO/6v4t+DnXTmXZBVOQ==
X-Received: by 2002:a05:7022:3f09:b0:18b:bce0:a227 with SMTP id a92af1059eb24-190a6adcd36mr67549c88.15.1792530910052;
        Tue, 20 Oct 2026 14:15:10 -0700 (PDT)
X-Received: by 2002:a05:7022:3f09:b0:18b:bce0:a227 with SMTP id a92af1059eb24-190a6adcd36mr67516c88.15.1792530909271;
        Tue, 20 Oct 2026 14:15:09 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903d68f2b1sm980129c88.20.2026.10.20.14.15.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 14:15:08 -0700 (PDT)
Message-ID: <7b5392f8-de43-4d31-8f33-5a6d8e0af6a3@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 14:15:07 -0700
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
Subject: Re: [PATCH 5/7] phy: qcom-mipi-csi2: Add qcs8300 CSI2 PHY support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: bod@kernel.org, vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        mani@kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
 <20261016235502.2274268-6-anusha.nandi@oss.qualcomm.com>
 <20261019-elastic-psychedelic-chamois-e8bbae@quoll>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <20261019-elastic-psychedelic-chamois-e8bbae@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad7d9df cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=18DxlMPwXbuUbd9su7wA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4NCBTYWx0ZWRfX8DzmKzngLIN2
 7t1L7NUkLx2K5uIPaKi1nuLQAy5MXf2gN4Bb4ptawg1rFfdSZ6W/jc0yo03af6SHjJisiOXnGbg
 RpjA/mstp34IhOAze5+0f5eMqMrvUlY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4NCBTYWx0ZWRfX+zQI1JUeBXgq
 DgSnw/+ZRPmuzACPVgph6q7F26+sRYJPMDEcGNYI7QN8fDODQvEpZBPRZdWkVG0aR+vGtY8XZSk
 nBMaPyDXcSe2OSuQJNGnidGmpM80jA1IhLf8oL/3lGdGuBPPpwzNNsUztfqVEKcXfD5aY6FMy4S
 iUc1y2IxvfMioeqb1Y01FPavdU9N8+x+gcbomyuBsmI2twCmjoDxROlqIFoAPEBUQhVu0wPvISs
 bsWPZTKCXP5ggvkhDNzo960eB3/aX8CC0udD7+fUQg9CikiPc8vCjQUSG2OFHS1BNd2eTW6xF+g
 kSX5O+fiEmFFHR0BJPr7SLs6uCSD63O66pePgtlnYHI8X9FlMkXjPSGTgDEQqICW2wQvEmXcoCm
 l1BqPPKrQIJlV0WOpGN0Tnxw6JHOXWP+s4ZDquM/gpqBrGfh/EwMCxzaYPzTUIGlUw+qxMMM7zN
 8inOkV+EoFwmiq97Z3A==
X-Proofpoint-GUID: U8BoAXBE3Im79Z9D3NUgbsu4iAutxV1j
X-Proofpoint-ORIG-GUID: U8BoAXBE3Im79Z9D3NUgbsu4iAutxV1j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_04,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200084

Hi Krzysztof,

Since qcs8300 uses the same register settings as sa8775p, I will squash
4/7 and 5/7 patches in the next version drop.

Thank you,
Anusha

On 10/19/2026 12:18 AM, Krzysztof Kozlowski wrote:
> On Fri, Oct 16, 2026 at 04:55:00PM -0700, Anusha Arun Nandi wrote:
>> Bind the new "qcom,qcs8300-csi2-phy" compatible to the existing
>> sa8775p SoC configuration (mipi_csi2_dphy_sa8775p). QCS8300
>> and SA8775P share the same CSIPHY: in the legacy in-tree
>> CAMSS driver (camss-csiphy-3ph-1-0.c) the CAMSS_8300 and CAMSS_8775P
>> cases fall through to the same D-PHY lane_regs_sa8775p[] init sequence
>> and common_regs_offset (0x800), and camss.c gives both SoCs the same
>> pd_name = "top" Titan Top GDSC. No new register data or power-domain
>> wiring is therefore needed; only the compatible string is added.
>>
>> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> index 821c6a0a916c..cef4a90ca539 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> @@ -453,6 +453,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
>>  }
>>  
>>  static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
>> +	{ .compatible	= "qcom,qcs8300-csi2-phy", .data = &mipi_csi2_dphy_sa8775p },
> 
> So devices are fully compatible? Then express it and drop this.
> 
> Best regards,
> Krzysztof

