Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812132;
	b=10WRNT+2TQrQWqCCg8aiRXaPAfBC24RyeGDNbmOOGDSWw2zDbuZpghP1xFIWYTXzMdlt
	 u8+f0kdhmdKE3fRT6NyepVftILxnSz7f6EE4qCBXVYJ/spD8YbATc5TnS2yU+Q3ErgrTb
	 6e9CPJll9ZZmiPB/z+bm+RMi5w2NSPP2tQg6tAR1iikvhNOitYewNJhhXCT8Z7CnvQJh5
	 6RDU2/F1jLY1rXTrJvqDvlcakJvSGhtHNj4/Mzs+bXAjpn07C+Y7pIgjvJT3lTXr6bGkh
	 PJBWlXLFMNMwLW8xbgDlH/dSbGiMQISN41ya8einp0exm/SvHiW3huUBRiooGtp4ebg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812132;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2S9k1KDmjXj6+ft2VRTVkulkYwAMCOYGy6MlND8T/mA=;
	b=12nYVOh7y6utcuGordAr6wzfIwTmBHiYO1vWJ/jWfIkDLjVWpZgF+nJHVSL6blQyQeyb
	 NuSZAWb6xTl5J/bRtMh6J1klGuPNFCqbQenAdoRHhklMBdB1WD3kNsAJ0azzN3EXCz0+O
	 Di5ek5D6H1wlXbHr61dnTxOYhpN4BCZTcj1bSp7I7HIx028qC/xEo+MTjAo2z4EXsVS4p
	 f4CEFJ8gXYQ658Ym0CKlkOnr9nwVm/vi5WDr+TjqX54QoNjLVj61f1dpRtuLmWUwoqR+G
	 Fr1s64dk1oM6Tfekc+5FT/uuL/4t0MpqxklmtG+1C7JKjcwojO/BdAQRk4Y9jKxCr2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U0OaEmZ4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ByS1Voth;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42116606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42116606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U0OaEmZ4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ByS1Voth
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LmfR322973
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:55:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2S9k1KDmjXj6+ft2VRTVkulkYwAMCOYGy6MlND8T/mA=; b=U0OaEmZ49T45GN13
	5D8nLtZtILVSQ+OpE+0c8UPXOk1eI9DQEJ1v2QptQhynR9eSUqISXvRbAoWDW+88
	q3VuEi8BRBs/MfhXZeWjP1ldSVc6mt5huyT2HfNsAqjeyXRi2AfQx9otohAHwvqr
	KMQqF7cOW57/5+z7JO+Tx8X6uY66ybivBGiUP0EIwarxRqkMExVrGexnOr8wm8wH
	z8hnEWDN7BivDnR3WvZwPvCghc0SJL4rCgTWpJtIkWgCgnZHbwuF//fawy/sjW44
	pkacIt+68bHrWFHm5NGpvb1MPxhaJ1pMxTCRzx9YQ3YOvQ2JIYGOoMiYGWUuShqX
	avfQOw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx5ahk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:55:29 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b69d1f2a18so1876488b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794812128; x=1795416928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2S9k1KDmjXj6+ft2VRTVkulkYwAMCOYGy6MlND8T/mA=;
        b=ByS1VothaasQYvwXVzT8n1CMxSIQIOT482mpgMHVnUqa5OpCsAdI5ytBhLoTIq75Rr
         hAbJQKntARRRKejmnmwTBll9iK3VgBjqpubZeLGc4YN86YsahX1M0FptdksFxEuY4nW/
         q8yA2a8I4ZwQGmH7mCrOy4jtxsOI38de7SPlNa9+GXO5suKJm5a664PRZUXgRAhlaKhA
         MXpW50hJRQ/GH9vJT+9/Y8aKX7FpARiCUz3CYNLWQGekt07GB+ncZT9jiraka/H3VjBK
         lfG0EtfHaQswrx6EUEMD1ZFAJDi2gbWQqeJXOHeGOjCcTqw29Xif5UmgD4ojmC0s9UfX
         Y6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812128; x=1795416928;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2S9k1KDmjXj6+ft2VRTVkulkYwAMCOYGy6MlND8T/mA=;
        b=vE827nzVk2ai9eYoKeS6PCLuFF6yPyv3MVjhxUj1/cWPEz9+tpsIAi+2iPtAGLdMjG
         Ep7bekErXJqejJJdpYpkm6c57RxJgMYBiw+Z2P7b5od5lHmsuNCQ/cP2uIogFYW8HdBj
         MYvrYEX325uU9VE/8aoNGNNIpnOzb15tpFrhX+2Lg68MPNI5YS7EWacZkru2EdKjWhRE
         IlrVT/UayD75SLRBdc0ehlGR/NoSsL7y1tupP0aWC/oiyWKYou/Sb8Qv5a4A73yGrvql
         BndoIkK510I2B0qOyvsniRS+D5DClIUC5vEHuY525Ki3eBDTzujQOufceaJHlWwW7j4j
         TRWQ==
X-Gm-Message-State: APuU4Z+fZ8WriJ/wmyuOwncq1BpBHPfyWOQiPre1r4uIoLkKk4kW1OBT
	fxCteBWc9o1nbGjyAk9CQ8CnXn1NrwTvAyAOd4AHnF51qjBly5gRJJH6/lLC3L87NJ6nodT1NAe
	4udXqjL/y1w6heItFwjVUsHgiYrXjW/iK0Bwu0jLTPAWJ7JqZWTPZxFl+uY2CrTNibVc=
X-Gm-Gg: AYBFou16+ea5+w/ziUG4nhuYSp4WcQph6CFgPxCmFxNaGWmvvGUuQH/W+7OGEoMWTiw
	G77wyjT7HEcVUnK4/hr10wTNqXrkC0nSI1yKbjac+1x1g2EKmqw8Glr1NFRWCIkMoFb7x2LjZ2n
	EE0ooTrCiYgSHh2hcdine4gzQ/1UEQvJOWWGb1VyjjrYDp0M43rYKXKl+UG8pMP1IXI/M2UtHg3
	+EZMqOAKNuVBVsMfCRiFAwSFxjbwXirmFUteQc3ZEFsPArflPyhN15D7DZvrD+XQd2/uiSq0Zt4
	15CByQf289zPxWu+8ofw5iZa91rlCJHOHz1DODHwYwJBdlgrwx14rPz0Mm0m/W/ZSalWPbiVEna
	Vwy6m2j56aa7OAUk3jaqG1ljN9Zlf1K2/fRBfJrEx5uZIT8LWf1uyPO8T4Vb1YQ26LEdpAG4ESD
	Th6oDjXAr/wV0kxlNlCyGH0Vq3tSlhA6QaTEdIExs1+qM=
X-Received: by 2002:a05:6a00:1995:b0:884:831e:d0e3 with SMTP id d2e1a72fcca58-8beb63a2ad1mr6236120b3a.17.1794812128183;
        Sun, 15 Nov 2026 22:55:28 -0800 (PST)
X-Received: by 2002:a05:6a00:1995:b0:884:831e:d0e3 with SMTP id d2e1a72fcca58-8beb63a2ad1mr6236100b3a.17.1794812127686;
        Sun, 15 Nov 2026 22:55:27 -0800 (PST)
Received: from [10.133.33.59] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2829dcdsm3208979b3a.48.2026.11.15.22.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 22:55:27 -0800 (PST)
Message-ID: <c3da00ab-913b-48ee-8af1-eaef26548b4e@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 14:54:59 +0800
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
Subject: Re: [PATCH v17 08/10] coresight: Add CORESIGHT_DEVID2 to
 linux/coresight.h
To: Suzuki K Poulose <suzuki.poulose@arm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, james.clark@arm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
        songchai@qti.qualcomm.com
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
 <20261113024935.3173715-9-songwei.chai@oss.qualcomm.com>
 <9a479160-5bab-42f8-bf50-7b92c40b39c0@arm.com>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <9a479160-5bab-42f8-bf50-7b92c40b39c0@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNyBTYWx0ZWRfX08N2GUtB7Gxc
 VK5gpykJFMevwYDvTd3aub6rI928Ofj/M/kOKzZzBI/tG6orbPtyRl2Q5w4FDwKCBm+/9Fx49co
 9HZotd38WMtr7zvcj1vlmXZvEq7T+tji/FyIlI8S+y2ehM3mtsBOxG0jL8HYB/4+l4F2xGHxu9R
 iA7n0A1VVs4HbdJqor9dsTZaaUT+KQS1QMpPg7AXHLczatJsHlSijvaQlf4qStfWPpV7bnJdZLG
 DpZM2ZBhVPZxRWeE+4RvfpWTJ1COfgbm592MqpN8jTNvjkHJzejgjAZ6+F2S66f/v2qz+d/iSJc
 4626oiKlEoaT+mqV35dT1RKmu/4ASuOh8Ob5z78u22q2s7u1qbrNd/9x5Qh7/CiiRCXP93QE79R
 Wo7mOT/OPHsYxDqSHxmt6TpZBUXuIyY7/woynOjqpcydCoBrE3C6RxX6AFjVlDaMGTBWTPPWbl2
 T9+R4I+3KfcTZHMdOjw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNyBTYWx0ZWRfX28TsY3TFuThW
 3dGAd/NMfhFYzAwDMnpIhVALDrBYRWGoEP/nTNJcuRBvGs740u2e16ULJeFBzRWIKCOgafYnAe+
 wdsE2jwOnWJtf+yrXiDbIlg/JKZ/c64=
X-Proofpoint-ORIG-GUID: HacfWZ9kV_mMDZRm2UO6vhkvDPtdQRLE
X-Proofpoint-GUID: HacfWZ9kV_mMDZRm2UO6vhkvDPtdQRLE
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6afaa8e1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=RG7znLGuzyzmRdsVfVEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160027


On 11/13/2026 6:27 PM, Suzuki K Poulose wrote:
> On 13/11/2026 02:49, Songwei Chai wrote:
>> CORESIGHT_DEVID2 lives at a fixed, architecturally-defined offset
>> (0xfc0) within the generic CoreSight management register block,
>> immediately preceding CORESIGHT_DEVID (0xfc8). Components outside
>> drivers/hwtracing/coresight/ that follow the same register convention
>> (e.g. the Qualcomm TGU, which uses it to detect its timer/counter
>> capabilities) need to read it too.
>>
>> Add it to the public include/linux/coresight.h so it can be shared
>> outside of drivers/hwtracing/coresight/, matching CORESIGHT_LAR and
>> CORESIGHT_DEVID already moved there.
>>
>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>> ---
>>   include/linux/coresight.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
>> index 5286b3606581..7ce0366c7c70 100644
>> --- a/include/linux/coresight.h
>> +++ b/include/linux/coresight.h
>> @@ -37,6 +37,7 @@
>>   #define CORESIGHT_UNLOCK    0xc5acce55
>>   #define CORESIGHT_LAR        0xfb0
>>   #define CORESIGHT_DEVID        0xfc8
>> +#define CORESIGHT_DEVID2    0xfc0
>>     static inline void CS_LOCK(void __iomem *addr)
>>   {
>
>
> Merge it with Patch 1 please.
Moved Patch04 & Patch08 to Patch02
>
> Suzuki
