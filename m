Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476047;
	b=xYIJyaxHEdMw9NeRNwFQCnEK+YKQjtxDNbI3jaxeHRLZi81BZSw7Ho2ExWeY3U+qCKWr
	 M2xsUp3cvmaiuZDog26M1y7gUBtUqTpEUONzXkJyRooMjbWThjJRPhsqPYhVxkuJKF215
	 c7rulX9nAYCVAoIRbioZj7P1UcUD9Z+4M0X3/bJU28LS9iZcOZ7NC1dFiL2fZ8H8g9CWC
	 STSANt39yONpMZ1nQXqVB035tYFgXisjNq1soqnyk/MbMWF/T+VI7dkib5KjMOIZ1RxZv
	 AqgdvWMm1ar094AdCSeLE6vyG974B3nCeHqty576guV/FOfMnuXHvPLCBYam2+l/jCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476047;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZEMqREsfmPbH/k7JgWoRxNTtP7MVL9uGc2qOxQ8K0XM=;
	b=bRPQsW/Gku62msrq/rU4uNNVE41inTXDsxVa6hCLt1yMfwZGyO3qAlvCPvCs1wE0NvJE
	 Yjvlg7i6EKEbggINlImSETun9+Mm8Jhdz5eisPuBzCzrOY5641xUzk/RxBhhphdWafAbJ
	 1MP2m5f6thK6WlJJ02P6MKK9iiIf3JvdmpodkJViTE0UUC4k4mpCM5w8YGSQP0+Ez51JN
	 rctHfBZV0uqjXNft6PXLIIs4EWH/gd58AewGXvqR3zKtPCWbTkqXptnWrPqSPDSQOvvBw
	 XTqJJjWo1Emk7p8Qemt+IUJ/TzLL4dozw94OUt8Ok5nON1czPnyZuC3MlnioMj9cZfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jLYxMoQm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R26FPh3h;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF62606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:34:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DF62606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jLYxMoQm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R26FPh3h
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC4m5Nv3893507
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZEMqREsfmPbH/k7JgWoRxNTtP7MVL9uGc2qOxQ8K0XM=; b=jLYxMoQmys93uE7j
	CuWvYbYPmrj1sUfJWh0gLR2ORgt4gpxUk5c2z5SxMWrfjZpHBYvqE2HA5VtTiqP0
	mgYQ37Xgum14mCK2xt/o3GtqLbxHRajXPrsMLXf4n0V/jj6Q/rwlaYcgsvYbOdph
	yObZEvvyhxFU1Q584JHKgmQtXflw75gAe3PKjP8ouo/TOcJOXwRMUiS03cU7ympL
	vdbf6ZHotCbqONNVn4oM3XYS2pNTrKdutcgBsNa47JkvgxN/qgD9uRG53SsFkJFF
	uIj02i+OFMCK9Z0TDa4J3hKi9eGNe6+vYuBhOvcRhathKOQKM6qHiGw0msgn5OY5
	g/lTYw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re0ybt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:34:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0c7ab2427so3441802a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794476045; x=1795080845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZEMqREsfmPbH/k7JgWoRxNTtP7MVL9uGc2qOxQ8K0XM=;
        b=R26FPh3hTODMjYe5LsIcwKRaYEOBRhFtXo4LLszzfjd4FyuMnVcoXYLnE2Hy4gXtdG
         0B7g5eSGb1YIE9Tojms3sGyIDUYK1Er2VsFWq5E2VOCHJsNQA4cjJdSMqPnqS1PkWayr
         d6SNBkFY0IVl4efDzkSYtzt3HlJrsE+8ihCsk7/12FAdyqCt7EnS1unf+V+ooWl0vhEF
         eB79NCjyjB50L+7/crLkY4PolkxLckrr2hAoc68Dplwv1WGyWv7JTnpwAXG2nYBgEbIc
         UtSgItyIgZOOI6NR4Ol7KNaJTwZe/w0IxfXEJACODxZRKeKoFfumTxH7uFy04mJsKHgf
         bJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794476045; x=1795080845;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZEMqREsfmPbH/k7JgWoRxNTtP7MVL9uGc2qOxQ8K0XM=;
        b=zbS6f92u9oY+pnqSp5Hu9HALvARNNA5QUKgV8edpjAph7AqBn4DXeL6USO25BcGLTh
         5aUBftKNxT/2kESlq1BGweTj5t8laoumEdgZmCt+IBBcUbCR7daQbvHY9gAL8+AtHjzy
         jxO8hSn8GUXX3DM1M22eGWpL/1ph08ix6bb6HdKnGk56mcddWQUl1niLj4MHZGDNDaY4
         RXIT4MbNnSBg2GQDNUD25Lzegv/iBw0jMdoKC4pZPImLWn/28BBs/FVmY180gJlwgNuv
         3gGcNujnD9B69aVdyqb/RmPe9N/el09og2bBWdMEkJdKKxktfgZKsxRlWVIRsMp1pro6
         STuw==
X-Forwarded-Encrypted: i=1; AL+hErFQwZnaC9YVmGgMjh6JSEpjaha6vUnHKuN/vsXg+5NXl0a89l6t2Dftc/hEvNwyX+vHZPLNdcquX7o7INo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zj/6pmQpgymX+W+VaHdhw/ZDKKwIdcgqPIf/UoWZDU9hXn9CF
	voXe8iFKifRBn4hOUUHXQXUbJ1yqVaK7qfSBDgNSq28jk2VuMo5Vj7LPSmpOHaXR+z8XB+gZ7xu
	WSo6nBWrlaUBXAHqEaFCmUoaw29jCUajCPDx4KdTur2/blPOhEvRG1mBuAgCGdzfetpE=
X-Gm-Gg: AYBFou3c19FUhfXXCLYJtfRV3TVNkM5CE/1JpG5ai5O3JpVJf2/ULzCiCV7v7r25f7u
	DZJjxfWGD4cRmvm3z0Uep9NPeqWVFaQUEM03Mgh2oRGWGToCKqxSj/pqlI76x7v9i/QtjULU74B
	7RNohIq6avOOtGJDt6HCdYf3Le61LmZEFvaskQt+pJRyOM18yJcgF2jgVBNFHBifwQcDxoxHX+T
	SrvSF+frD2UhlieVGQ6aWV1wEQn6Db0g84JW86zvaVeTIlxpH3D2tAeyFZ8RLQ1nJoUGry4TwQf
	68NkNREVAiums5AMhYItHSrIpRSy4Htj21KR5pdofjdQWdJVLmZTJ2flhlgdOJ0CRkPIJUoF6Hr
	2E90wIsWjJuhZn4lJ34Qrc1d0qBTp+KhiJP1552BZSlTtwpM8b4GafpahOms0oRGxhY7AvzATLK
	Xc6g==
X-Received: by 2002:a17:90b:2f4e:b0:3ac:9176:e82b with SMTP id 98e67ed59e1d1-3b182f42c74mr4784664a91.54.1794476045185;
        Thu, 12 Nov 2026 01:34:05 -0800 (PST)
X-Received: by 2002:a17:90b:2f4e:b0:3ac:9176:e82b with SMTP id 98e67ed59e1d1-3b182f42c74mr4784628a91.54.1794476044726;
        Thu, 12 Nov 2026 01:34:04 -0800 (PST)
Received: from [10.217.216.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c9d7c1sm3881186a91.17.2026.11.12.01.33.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 01:34:04 -0800 (PST)
Message-ID: <d2315dad-ecf5-4838-bbc5-663fc2d3c75b@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:03:57 +0530
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
Subject: Re: [PATCH v2 10/10] arm64: dts: qcom: nord: Add support for TSCSS
 node
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
 <20261108-tscss-v2-10-d5f575010427@oss.qualcomm.com>
 <avGHpvYV2Q6T3vwd@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <avGHpvYV2Q6T3vwd@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iXeG_UZWQDAztiMT9nNnGKtBvag_6qLy
X-Proofpoint-GUID: iXeG_UZWQDAztiMT9nNnGKtBvag_6qLy
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af5880d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=_qMGny95FC9WgreSDIcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNyBTYWx0ZWRfX1z2F01SwnES1
 m1u/bkTdMIBBTYW7rKvMxckXXGwAjXEmjxbE5NWQSdiSsOqKuFu9PjEerOKDhiWUNGBJ8cRb9EK
 g9pr8wsaYA3UsdiAPuhWcWYmPfaZ4qU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNyBTYWx0ZWRfX0Dt9WYi/fvFQ
 CpdObUHhYsA40+IHxHnLr+jtU9QhEjqs/fwLLwwbHkRBCQeIvKj4lYfDJSxz2vxK0HjjmfrwuYz
 kivAeRU7jOIURb1qku3CW40zUYUe/7J4l/8jZ/sEfG3Ho1P61aO/2R5LwpU1wlNAeVlLyf3mwAh
 L2u1qDO9K4L+tq41HhZuY0gIsm8tBsTUkKXEUpYd4g1r5lpvE9yVCqR6oUJcG6Vt+iEJAkXJq7o
 jBUUkY0nSuqlIrYERn7TJCT32Uy6e9Z8PynG5nLJVmPySkQnIt3MAbqFcoSpzRrICfBbtOOYZlD
 vWe+BCZC23m1AUCjmacqONmjvxeONjhEzYIAwv4wXsRZBdpPLTOhYNWzx8Q9zClB7izm0DFB/Kp
 urwmddk4H154TCMbSa71CprY+/SdNTnlSv1zpucOj/lEGjJW/vFtu0V1AG/Q7Zv/3SicLLP4Ul8
 SHPxIhUeHKonTVyXFbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120037



On 09-11-2026 02:13 pm, Shawn Guo wrote:
> On Sun, Nov 08, 2026 at 06:48:31PM +0530, Imran Shaik wrote:
>> Add Timestamp Counter Subsystem (TSCSS) node support on Qualcomm Nord
>> SoCs.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
>> index 1ab7d9bc3cfe..1d5f27336f73 100644
>> --- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
>> @@ -736,6 +736,20 @@ pcie_data_inbound: interconnect@1c00000 {
>>   		qcom,bcm-voters = <&apps_bcm_voter>;
>>   	};
>>   
>> +	ptp@1c80000 {
>> +		compatible = "qcom,nord-tscss";
>> +		reg = <0x0 0x01c80000 0x0 0x2000>;
>> +		reg-names = "tsc";
> 
> The node should probably go to nord.dtsi with nord-embedded.dtsi
> supplementing Embedded specific resources like clocks.
> 

Sure, I will check and move this node to nord.dtsi in next series.

Thanks,
Imran
