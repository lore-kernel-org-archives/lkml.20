Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242744;
	b=pvUhdZFEepiFZi5e3AgcTPB7ISvzhWXp8E/K7vYZQJH1bOPpNUoXSK1kyYvC+jpZ07Oj
	 g4sY5CIUcfYsbcaXWIQbGf6uw3uIzIn6BorDWsbQcMzQsUULb/WGIUJHQhTj7gw8Pmiwd
	 Lv3+uEPApkBolsSS5alo3DBrHBlyQcUYCiG+Oqsy9HIQ8G44u+mFyl3RoK6cj6CzT6wjS
	 EF74N1Vqc1bZJ3kqq2yRNFcN0Yjee927kWsQSVTZ+CGWRQj8p0ToTcseA3UIMjsvnbjk7
	 sA/eu4m0JB5yiTsSOErawDeKWJRO/iECoVdxIcnmLleWuuT5C6cQqeDy/c9QTXTRBqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242744;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VBx+pQ4H2H3adUQa50cH2AZAKCnEvci20+6PQw1MHT4=;
	b=mKIM/fEGaMPNtBD0T087Fh9Cr1DH1F2L2mGOTBU2MagUE9/t0g/tnuq0N+k/R76G3k6B
	 5wSfs2nxnqWCYznyB9O1WgO26F02E1b5N/SbjQ3IGsf4iRi061SuxrP4mt1PEE0cgjLx3
	 qc4gD9lcs3tM09sGG/DoG8mMR5eO8c/LPf8pvFa7e05S3btJdQPNl6Ewjj7Rck/vSK0Lm
	 ug2hqIgDH+5f2zTxmgnAw/VTSf8J78r326d0iQ9vpgB2M3Fsrk4FKZUwoW+GE8FrcaxXy
	 yCqJGQVQ9UKoNXqZt9ldDjwpyzpccSdIBR8xtL6uPPoe+hvBQVnmkrZfpeRJj7W4ZAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z9znmG26;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kHrtfwZF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C65606A337
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26C65606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z9znmG26;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kHrtfwZF
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DF9et334886
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 16:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VBx+pQ4H2H3adUQa50cH2AZAKCnEvci20+6PQw1MHT4=; b=Z9znmG26EPaUKSEV
	VRmBdJyuq/dFZiiTn1J2Anbbvsi4om2vKXrB51eY2pi22iW3s7MXTtByigsccPqU
	rOTBswiRDzhk1/Pdgh/sPuXwW0bsjZ89D0S0Cueyfs2L2fxwl7NnhCrSulkvepbM
	O2KFLbserTnhvUk7KLKVorj2eQNbC0yS5EpJA8vDz2246cgugo9CWPKNh52oKoha
	QDc0a0ue27Y9ssBfOe8zk7IruUnT3Ku2hSp6rAcOtsCuy7by17IGXgre47d9HMB7
	Qu97Mp2Hz2vxE/OjDX07IPjKVnTA6BJ1JfSXxKZg1wWHYmEnNiqP0y+LOU4awjtX
	MLjTXA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudf594s4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:45:43 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso2381059eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794242742; x=1794847542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VBx+pQ4H2H3adUQa50cH2AZAKCnEvci20+6PQw1MHT4=;
        b=kHrtfwZFqd47WfddUOdWZKA/pr9I3C0Mjh5EpKkgM5wYv+wYIdMAD8eboLskQ2D+OE
         R10tXlf+XCJ3U4KLHiCEIl4WJ0z9k/1rpPcU5sIpQveESP2qbB4AqO3Bew05Yqi6JE8c
         q+Ka8CBpY4U0AFE0+3tw7XK6m9mC5ystpbynrbOYm30NaWyfYNXmQf0OLHUqcDMHU3wl
         9TKdyZ/pQHrVlhpNdTZZmomKW/TTeDZDgq0bCYcHkffvrPve4iNrtpoqV+o/24XlUK/I
         LauKMk9O9JYrYRDetrmmhLEFrSgx7W7PGL438LEvR2bMVoRfOnr/erTr1pVWtZ/LDO2N
         mpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242742; x=1794847542;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VBx+pQ4H2H3adUQa50cH2AZAKCnEvci20+6PQw1MHT4=;
        b=I1pDBR+4iaH1NUpUJTSRQHB2PDr/1KdD2kJQ9FtFYb+6dF4J1MPDJDaMM4bpr/Vef6
         44UbkCyUSN9j4PiCPcMHppX3LLFLwSC0iEnBArQqdgTtZG2WlGvcbMSk2ivILPmjTj0G
         ls7QBaEq0R28TwYtZC00z8z7OXRvUK63VZJCue+mblCK327QhbgqxGB/ht8b88v6tgFB
         f0xqZybWqCIBOTsdIAN/h4CU3pch7UA5ccRqIrAD6kAnxmfIObgztu76PRlUNLn+EJCQ
         WQ+aT/klPhoPhj8ZjJcdgzEMFxvK+A7fQRFyIIPq+y1EYZ42EdZ88mzsdlDQZ7hmwdWc
         AEdg==
X-Forwarded-Encrypted: i=1; AL+hErG4nzuPwpMvmCn92H69ha/m/VN6oxhS6GTRQZhwomxdGpjoS3a+9eUiGRW5iYjfhcDVK0+s/5dZzMA4jTw=@vger.kernel.org
X-Gm-Message-State: APuU4Z//+a7Po0nnA15Uv92cIQsNjv0DjE2Ynm2tL1h/JRRSgo9aZj0o
	38UecB+Y6uvEWBzlUFg9jsGC3d6jvPmrrrSzMuCtjOb7JK+0+KXKEQaTY086PDnZqowsOQj96G2
	TmaT9Ed3A+QOsefz1z9wTQsKOIoHGAfn4GEKiJFXDxG7ITZOJZjGyJgAz9mGzxmmvrdM=
X-Gm-Gg: AYBFou3QbAg/WIzpXSBvBQzHkHaCtUjUWo+VAXiBC0jrdo0kBRtW8tEn7DDTPRh5PXa
	LDD2vc+nVRrNVGvSknVy/f1hqpnJmeW7MrwkbVN2ttGT6LF6f+fQg9l4g5G89wLVFmJqUSvpbX6
	iv3XbQWHyq0u84jcbzM1tJbS7T1EiB4t6sxsaQDmMv5TAQ99frCtldNHA4YJ5dpkqHV37qeWv21
	rIr952I5pskQTSPIIaE0xlIYoldayd8sDaE9WMw9VMURBL8CmCpGTvPQnB/bgNv7SW8E55tTIug
	aH3YuTRZqb5P0miLrPhPhlmPx4FY9Q8bYC2S6T2D46AJ6ODXKOZAJ0TW0Jx1bUUH/ZzpvLlFMnL
	W5SkQfFKTKp4WcCPlLOlLyMcQr3pRnwijWWtLgnls0WqZptazJNIclF0puMn35usXRU0hiWtjdk
	e3Y85COChbAwn36fzRJf0Y1Ksk7ZGaByPTGuhqpKYU9vVu+8cs9nc=
X-Received: by 2002:a05:7300:6822:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-37256bf17efmr8459348eec.23.1794242742024;
        Mon, 09 Nov 2026 08:45:42 -0800 (PST)
X-Received: by 2002:a05:7300:6822:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-37256bf17efmr8459297eec.23.1794242741349;
        Mon, 09 Nov 2026 08:45:41 -0800 (PST)
Received: from [192.168.1.66] (164-34-238-49.southernonline.net. [49.238.34.164])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372660f385bsm15132197eec.20.2026.11.09.08.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 08:45:40 -0800 (PST)
Message-ID: <37560f54-ee44-48a2-aa33-5229a4087ccf@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 22:15:33 +0530
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
Subject: Re: [PATCH 4/6] soc: qcom: geni-se: Define the QSPI firmware protocol
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
 <20261106-qspi_upstream_series-v1-4-21f43042dd60@oss.qualcomm.com>
 <8015c245-5bdf-4088-bdce-7e81b3fa440e@oss.qualcomm.com>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <8015c245-5bdf-4088-bdce-7e81b3fa440e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eA2L7zeF2_1CReMAGs0XQvoGo8BYhslP
X-Proofpoint-GUID: eA2L7zeF2_1CReMAGs0XQvoGo8BYhslP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2NiBTYWx0ZWRfX7tW94GF5lur1
 B2oqCwZF9iQES7BPU8fgBU3kgIs+dmGEkAmijnQl2H4OIUOyDM2Y2wBxVWs3Q32OU7WWrnlDg1F
 uGJtTrjHnlYBmufQF20PjJypiVh5Ycg=
X-Authority-Analysis: v=2.4 cv=bar+w+PB c=1 sm=1 tr=0 ts=6af1f8b7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=rh678R6S33b4aGV2lqlmMA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=rLV7qYPEkEEFJh5gh6kA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2NiBTYWx0ZWRfX5Ii03Ksp09Gv
 KmpMjN4Vo3jz1J1eypWv8aeG/sFYa8xlghHlswMWSREh6sE/LbkC4LM2np5/ynXVYekGj1e8FES
 oesW0hQ87WPZ3UCR9MaSeQT0Yui3hRSeVTc3AXx4XXBnVFmSGxSmjdCMtjLmCvUsUyw8hfSH65L
 2tNUUVCBGv+YS9MzzQ/m0hdhorsCnZT7HZsh6HZMPwTcxkXc2bmwDsDGhn6UkL8/UewZiKd9BH+
 TKhYv/aSILzKAUmXRZDJv39Wc+5z8i1YZaPcmWFYZ5b5b+lR1gg2DNbCd7X52itiwA55lYDwjrL
 dEJn0WtN+koX4YKGyc8p+UdC59MNuLCc+ddxIxliOHlZCyvnRX14HohZxmB4OVzAjOYYhfrkNer
 Gacs0vEOpNGaCWRkfftzyHaVioLzxSl9GmlUS4piDJl9V0fp58wUsw6CFqsDvI9OcVKCR/e3Dm0
 20d2TVi9+G47gRN7oiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090066



On 11/9/2026 8:17 PM, Konrad Dybcio wrote:
> On 11/6/26 4:01 PM, Jyothi Kumar Seerapu wrote:
>> Add GENI_SE_QSPI with firmware protocol ID 9. The GENI SPI driver uses
>> this value to request QSPI firmware and validate the protocol running
>> on a serial engine.
>>
>> Extend the firmware loader's protocol-name table to accept QSPI.
>> Reject unused protocol IDs in the sparse table before looking up
>> firmware.
>>
>> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>> ---
>>   drivers/soc/qcom/qcom-geni-se.c  | 7 +++++--
>>   include/linux/soc/qcom/geni-se.h | 1 +
>>   2 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
>> index 873bfbd6b2b7..396f3d81d292 100644
>> --- a/drivers/soc/qcom/qcom-geni-se.c
>> +++ b/drivers/soc/qcom/qcom-geni-se.c
>> @@ -122,7 +122,10 @@ struct geni_se_desc {
>>   static const char * const icc_path_names[] = {"qup-core", "qup-config",
>>   						"qup-memory"};
>>   
>> -static const char * const protocol_name[] = { "None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE" };
>> +static const char * const protocol_name[] = {
>> +	"None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE",
>> +	[GENI_SE_QSPI] = "QSPI",
>> +};
> 
> Please use designated initializers for all values here
Hi Konrad,

Agreed. I will use designated initializers for all entries as mentioned 
below in v2.

static const char * const protocol_name[] = {
	[GENI_SE_NONE] = "None",
	[GENI_SE_SPI] = "SPI",
	[GENI_SE_UART] = "UART",
	[GENI_SE_I2C] = "I2C",
	[GENI_SE_I3C] = "I3C",
	[GENI_SE_SPI_SLAVE] = "SPI SLAVE",
	[GENI_SE_QSPI] = "QSPI",
};

Thanks,
JyothiKumar>
> Konrad

