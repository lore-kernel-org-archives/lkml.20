Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610777;
	b=vMcjSADBUfcAlMwACgYuWYCfoaq65rM7BYsq93QB8zyIiy69eYWqIpTDoDj8FlcQ32uR
	 b0DDG37JqA/R4PH/JH2Q8InXtnPW4yU42fcWzoCsKlmNyAt+Zexke3n7TyYgqVjSQ2iO3
	 kJUGD6LNR1TUuwtYJI/4ENg6Gt2saJbuJuhhk8efRDGQ8Mrac/r5oLY6u2J0XsaFVJoPc
	 omB5DfFRCqN5kkzyq7t+uDT8oZsXCOXpxTzuVoBTRJ+6WGXlytnlcLGoGBp8JOpVzCPgR
	 GahiY8eCj3zO9oiDHB8z9o6g19SnL+FDFbnItuJLYtcyJYCjAoD0k+VKv6sxiYs68fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610777;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YuANGxMXB18zd3C6yO64dyenoMbuafZrLrdBNYEuS8E=;
	b=K4GNP/AuuDJiDX4hA99+vWlKo9B5MxNW25ABP6IV7pDTqYP40J5+tZ+mMOCNr7IF4lmI
	 KE2PzF5/2fna4rooUl+TUOA+10tUtvoR+oRC1q5JfTpwyYdNYaSlfmvZF7CZkY2mYsVMt
	 VT11wlb9Ky1UknlLQuzY6niqgEiDNnbL8/5Fl3wut+cs5cjstrcOzHdrPzfwhYmxmvti1
	 o+Q7P7AORexdlWhlng+Pg11Tm68sP2Hx79vF59fpfCCu36nvz7Jg/nLmQk7+pNSSJEQGA
	 pGIxibXvwxfDgOheVFPmws2VlNRwKhCOnd8V6LI0bN6SsIQ8khvgKyUP7y3ZoD7ai+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cZQjO3hw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IhNTpxG6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E692606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:12:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E692606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cZQjO3hw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IhNTpxG6
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A299vMt3402360
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 09:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YuANGxMXB18zd3C6yO64dyenoMbuafZrLrdBNYEuS8E=; b=cZQjO3hw3nLs9dH/
	zSZV9+cgwxZAkEUaGEvBXzh/nOZyind3r8cQZEGYw2hzPJI232zX9ODU2MGqKIlM
	ma0z0l8zvC8ICQqrEzzWnCzmeLhoR3oBwPLGRJzQF05HDuz2tdKx+QHv44SxC9MP
	3XtFf4EeySzCImYOrWpbzaxTLbn0D0pb0oXEAlaPCxxpM60HAdghgzp1A75rXsGA
	9VWbacfWzQ4UeXEDcWTByyY8sd0hDQ58vvaHcY1vdC42pUt8ncFzQkwPoplSnj1N
	GOCAwy3GL/l3vQjWaXnlT2DXX4pBay68dxy80DjxzaBPWLJiBVZFK/TRMZafaHNC
	CClp0Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe8bd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:12:56 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd60e4e8bc3so1706970a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793610775; x=1794215575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YuANGxMXB18zd3C6yO64dyenoMbuafZrLrdBNYEuS8E=;
        b=IhNTpxG6iEuo0W+SxzgA8LXzpfQBQr3+ZnH+IoVk34ZVW2Kv3HUmXzSHJNiiPRbIde
         0/y/yIygfDTz0yT565w5Vev+DnnG13rrJEfi9xgy5uSih3OQ65G5w87J8pInMSV78S37
         Im9SOOSn7eZdFvBnRVGLFuQOASEqO4kYV8UlREWcDC2nnoDRg3UufpitQXDz2hzaDBHs
         EEjg/1X3B1xkhZB3f6UEtlV2C6CoKIMmt06SDsyGV75eKuebs65yVx8y1ih8yF3nVvdj
         Q4Ix59L08qck+ZD5kYEo8c+2OUP6WF+zftIVMqNfsqmnDkHvj1bi/e84lDGdcNO09NpQ
         n/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610775; x=1794215575;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YuANGxMXB18zd3C6yO64dyenoMbuafZrLrdBNYEuS8E=;
        b=Qwdv5gKBZ22EUiKbk1uX71R8Ko5eZsVJ47rCYxbCRODL6x1cAFWQk+XS6H38Xx42N8
         4z+a5wsotk6h8sKIgOfBOPJ2NETWjb45vwKIhUze+757X/VGE3C3VbOZYaaldF6ygReR
         Z7Ihcpucrzwh0+cKBgnXylMIysHFdXk1MrN5fe62rt7vWFV4x8s41BGTkNQFpyWsCGRW
         e25L1C4czJGrenHvMAbqzmMwnIEZSC66uSh/EPJbRqJbfoLN0kc/il2LXxvWtn+AuOOY
         RdidEGo5BrJStUIuHR3ACViopVNVWYLbmTFJyCsUXBYrHj6qwsoU2iv/WsGrE8W5f8R5
         6Gxw==
X-Forwarded-Encrypted: i=1; AKwUvBycVPoKDGGhLOacQcnt71yMq8YpwajX//Cvz0hsERsazaI05R9LaG6o5OEaojIuWyWfxGaoqDOl56PAPy0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFEeBiHqZb8WDDWufcw4AVc2KkgvDkIDPFUnh8/K53L2VQ/Qbx
	KmaKZuO7ZhPDlqRqlxvTshzP0u/kToIP4R5PuF+r3DAjpnTOMCvUDPoGULH8zZxvSnOKQn8n+IT
	6AQLCb9tnvm7QJZ/h++RtL8CPWc5x+lVg2riZWz9ZOv17aJef+ZxDCjd7ajlXxc/0jOM=
X-Gm-Gg: AYBFou3PppRrEfvFH/LlyZ944ajFdgc/+9OKg0+ldEci8WRg0ODgmfymkxHLPZWLz65
	R9QFU0kmh3gGfPp1YYyhVuG8nvG72qI3ruh13mysvPtPgixkWvaJ2ZWvDM0hl4AEd+ncuxJsTxC
	9+HV92On7MXF25vfik7v2MwVIxShyDtLGj0GpjzCbBXCEQALGlFUqk1I+NHJE7F0K7Dp/e9NHOs
	tH0JwmPQOlWby/FPHEDvHoGGdhGQ3jpFRroptwFF5Yu7YXOBByebf+8svZl7wIyXwYpzLtMJujE
	MLgYNB0ooARBwkdphexU9jrxFEPzqK43QK+4UBCCZuvXMarKIKvk37dRusEz3r+Og1TICvLhkNR
	K9zo8rfAcvmJ7Y2wFMeDfzB/S4rc2b7MZamq5Bk8bdQ4+PHm9I/tbMJVhg3bUFzscdegE1upqSl
	og2fJV3bksdmfbwuTBXCDfNzHF+2jC6H79
X-Received: by 2002:a05:6300:48e:b0:3e2:afda:c37d with SMTP id adf61e73a8af0-3e928dfa35amr6749574637.60.1793610775584;
        Mon, 02 Nov 2026 01:12:55 -0800 (PST)
X-Received: by 2002:a05:6300:48e:b0:3e2:afda:c37d with SMTP id adf61e73a8af0-3e928dfa35amr6749561637.60.1793610775138;
        Mon, 02 Nov 2026 01:12:55 -0800 (PST)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb096b7ba2sm2983347a12.8.2026.11.02.01.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:12:54 -0800 (PST)
Message-ID: <387c4b13-718b-45c5-905c-31c8e441f759@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 17:12:48 +0800
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
Subject: Re: [PATCH v23 03/15] phy: qcom-mipi-csi2: Add Kaanapali support
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-3-95f250b18612@oss.qualcomm.com>
 <z3oqnmse3plnnntqwxrpi4xozyuxn6a47qc54agspwuzb4djqz@hzz3lbcmkvlv>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <z3oqnmse3plnnntqwxrpi4xozyuxn6a47qc54agspwuzb4djqz@hzz3lbcmkvlv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae85418 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=x06h-Ri-Sg6DD3z3xmEA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX+FLmcPJvMFuZ
 9yP59BUhDdj7BQoN2SWa/wGpAY0YNjQjPRGsOLk4GCoxmLnO7NBMX+pEJMly56Zes6FsIXh1Jlw
 bT6yCLTVIFjcWSepDUoNZXJ3K8XjKKMUUqhNA0v4i6qx57+HTYj30TCXXdL9jWqODU437zNfHll
 Of/WMTJZ305BFe8ch5iVroku0h9jXNzHhnagymrsGctXpN6Ak657dH9E6nmFCgBA1Hk00wjoR3P
 NB1fpUgoo55Nzm1uWJXoohtA/pW9UlIB/v5EScqRSIXLdpSsX7PJjmg6iuGJLCzTxPsuexdHQzF
 WgF9LVypZYzfMXOnTMQC/0cWKn46+I1ShtYJXJHVnWDuUChN7SDP9/tyF82DmUkBO8nHCGcUDIc
 TKkDtfbIT/NkKvlIZMWtmrrk254eV9TNRd6wkpDYiQg7mbF9wopTOSHyR3TYMj3OB7tON042C+v
 LlG0MJfrIKH84bOM6vg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX/tgnVu/zJZas
 IE91XKeSgsgakJpaXWpL9PH+PZpaC/n9/KFAojNgFYT/WVmFP5CNNS4JY9GV+teh4mDTe2Jmsmr
 tGbHDpuNCpWm7D88XULwhCWstjLMtB8=
X-Proofpoint-ORIG-GUID: BdeF-G5g1wzrig8E3CGabzAYIQjzu9hb
X-Proofpoint-GUID: BdeF-G5g1wzrig8E3CGabzAYIQjzu9hb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020036

On 10/28/2026 11:26 PM, Abel Vesa wrote:
> On 26-10-28 08:20:37, Hangxiang Ma wrote:
>> Add the Kaanapali 3nm configuration for the standalone CSI2 DPHY
>> driver, including the Kaanapali common status offset and power domain.
>>
>> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 ++++++++++++++++
>>   drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  1 +
>>   drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
>>   3 files changed, 18 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> index 8cd331cfb4b3..658a39463104 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> @@ -389,3 +389,19 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
>>   	.genpds = x1e_genpds,
>>   	.num_genpds = ARRAY_SIZE(x1e_genpds),
>>   };
>> +
>> +const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali = {
>> +	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
>> +	.reg_info = {
>> +		.init_seq = lane_regs_x1e80100,
>> +		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
>> +		.common_regs_offset = 0x1000,
>> +		.common_status_offset = 0x138,
>> +	},
>> +	.supply_names = (const char **)x1e_supplies,
>> +	.num_supplies = ARRAY_SIZE(x1e_supplies),
>> +	.clk_names = (const char **)x1e_clks,
>> +	.num_clk = ARRAY_SIZE(x1e_clks),
>> +	.genpds = x1e_genpds,
>> +	.num_genpds = ARRAY_SIZE(x1e_genpds),
>> +};
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> index c0a4fa20eaf0..aff9e66f0352 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> @@ -444,6 +444,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
>>   
>>   static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
>>   	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
>> +	{ .compatible	= "qcom,kaanapali-csi2-phy", .data = &mipi_csi2_dphy_3nm_kaanapali },
> 
> Nit: Shouldn't we sort by compatible here?
> 
> The rest looks good to me, so:
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

ACK. Thanks for pointing this out.

---
Best Regards,
Hangxiang
