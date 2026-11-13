Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794594787;
	b=DeT/UhZ2hDn2CgpdF2AeNZ/CTDPvmh4XKhmq83o4JNZftJSVWHdvPQ7LKeP9MG/oGKky
	 TZ1pIgNApfVv/6AuhgISXQcKGpCmsz4VM+zH2gguSdZvn5Ezn2gYQ7lvw5tXnG+EK4PeK
	 1p++pPNwbPF+Ll6MUwPRh8zHyEekR5uSpa5aXzzmdhsg/wsTi1/CpXhCeXdTVSs9sOA7c
	 36kYRFySSZZq2HhUey7tEfioBIk//ijpaenYXgEIqjnaZ2CMdBnyS301TS6RfZluZ/IE+
	 u+DOuDeDI2quFDKR5/0gv86YVcdefCo5X44Zb++0SV4USAwaR87VLFZmxkMwCrQjhSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794594787;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4tUv5114t+zriGrndIi1jj8Phxwq1uvGYapqkrY4UYI=;
	b=miuJiMqHf+wzsCoA2h4DS0SU2HobiNyDkHbYmXd6TJ8R/YgL1lYLIOUCpEIHAU0eN4sJ
	 eXMkXlHRZK7P0mSrr9bpT8/G2oztb6IyTuR3vCo7KRCp+HQo235MarL/BOGJCcQj7fR0G
	 HtCfHAesVZQKPY6WUvRiuZgcJMwRM0GE6WP4bH+fCv0mtuMa8bBpwbp1d7vWTerlI6iNw
	 3kZiN2kAtFR2I/fU4ZmsvZrfAYkj8qAP4uwoiC1YM6sV3hLKDVptwxGRcSeThZ6TbtXKx
	 v7qkyzEqPZYkgzimXUmGhohucxnORG4OcQKVdl/VgELQejftguA1Dx5VR/SehBqemfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YRZyIDfK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="A/gDixv0";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7051606A887
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7051606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YRZyIDfK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A/gDixv0
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRBUN1190072
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4tUv5114t+zriGrndIi1jj8Phxwq1uvGYapqkrY4UYI=; b=YRZyIDfKqQQoEfwn
	WHoFxHopIowIaQ1yYaiHHxZPYbrEk3/GF/5rYmKTS6zPIR4JnhO1VcpOtkaioU0A
	i43V+/Z3BgKXV567tGlh/LZYEOEBZ3T7aD5s3siAtPujVzmuRx/hNzErNGGVIHrB
	UoxuMuT6QSJwQgI1KmDuAFQAF5X9XtuFUUc+uwhbYTAl1MEVoM8JkpHf8EZJU/kA
	TAR2/tRgApt7C1aA2ZPx2SIL32WoHMqEslM+Gro0LY22/uWiXhvVcoFJ6rZjjwCo
	pLP+ZM0Yf5b2+QCN9MAb0dWGwiV5h+wgXnFPV6j1joTTOQI1dCC4fnIF8+Sh3j/0
	DBmXfQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufkncc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:33:06 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1a5005fd0f8so394391c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794594785; x=1795199585; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4tUv5114t+zriGrndIi1jj8Phxwq1uvGYapqkrY4UYI=;
        b=A/gDixv0pGI4SAurXqQDN0OA7xe3YZ9G6RcD5b6MjyW9rWVhjfmbv9vHidbdE854c4
         XMzzJQWI2FDsTtcYy5ouJpW4pVmouJZCrBV4fmxZm3WpuXMpmZxKACAxM5Kr6O3vfaj5
         NsyJMkUoOg+5jBihmmbaOC7CAyCodqeRgnNA56NWqnJT9PLuQfSY8QksH6wQb+Hk326w
         vjBCqLIumh8TmKMDT8f6RA5Oweo0GyK1grg7QL/gukyX4uVl/66Lphbe4lAh371UZ5oH
         +IxEio2sZzd5xM3pN1apMjSNuUDCksQbgGSSWwzMv7xffIuSzPvUnJpao6CbAkU54RJ8
         jmxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794594785; x=1795199585;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4tUv5114t+zriGrndIi1jj8Phxwq1uvGYapqkrY4UYI=;
        b=vTVc2PTuvWnuI4tHJ1nRlVsJWg4i8Ffoq8715NSfB2SDIljxPsC/yNUebu49AI8kw7
         G1A8FkyEvIv7ryP494D+f4E5BGvuKmS24FXeqKTTBPlhlGp4nFejW4KZWxwME5qvZyJi
         9FU/+dcQ7TniqDUuNPhuM5PmK4GRF626tQJ+7KYxXvI/86QvOGqV3YMjDmn3lb2vgVcg
         Fhwmebe+Lz4NieY07vjN2+/LsETSwkr6GEm66UU7ztVwZGghYMEEo+OTMdt8Rcw4sKz8
         vOCuqq0iCoAAF9pBa8qOL2EUZzudVwGzPhrtym/s+zrryQHSH5iZmiOkT55ah5K8+DJO
         z7iQ==
X-Forwarded-Encrypted: i=1; AL+hErGIFktByxFlV0d642O/ea59BOCKSroISlwTzNVnqaIlaGohCKauSojmMsVHwxNpVispoSIOfhTsOE3kMRU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9YYzSGlCMHeWIyXjGAkaVCXTySle3+5OHmBo/1l+7sI2u+qoD
	otTPcK9NvWJ/6ZITp8y8XTHi9iNRR6b+kLKgWQE8M8RbU6G+SCDRv2gq0UrxGuw8MqUI38ca3Wc
	ypPOxDT0s1KxlDpC7Pi7U1Bhc82kwNT/kHwXzbQpQMG/fWqKWHzwU6YWCrRhfq6UPNA==
X-Gm-Gg: AYBFou3+1WBCn+5McXbkdV2rBOEdG4tE+oZpdkTWbaJ8hEmNlyeX9JyC7wrBAPwS8ha
	Sz+oftC11eC2dRC2E6/XF/NXhBXmRolj6QF1jr38tCoUOcrz/gErElF9QluU0juip39FXxltxoW
	PbQSzo1/BzZ0+EvNnZvqglCKPSlh8cZym4fhkNfntw3Fmv8OTmGQzhZF1o5wbCfsaHhaxMzKdOB
	AnaXxzqb73Ce7CQm89czMMrwxHIgTmhrAS6mgk1VM4QkfQ/fvH/8w5FqVjkqw8ubJUAGIiruCU3
	Wq3UYIinHzF4sTTcGNigwz/fHcPVl+hdoMIztCYPV8AL5oJWmpOENK8zQaNsY+Hju4hkzJzINR8
	jkEkU8Ld9YKkywjcL4/FMrYBqB1jEZg6Cv6G1C34bLBV3FAk9jsMFm8V5kO3TewR+mTuRWsXQHc
	BgWc+YlMpvsP3jLrntHuEZr8tsNiMBRvpW/FGHM/gfq2zuLMnRWeF5tYg38WO0vUyY7A==
X-Received: by 2002:a05:701b:2802:b0:1a7:78a3:bda8 with SMTP id a92af1059eb24-1b50318d7abmr3048328c88.27.1794594785218;
        Fri, 13 Nov 2026 10:33:05 -0800 (PST)
X-Received: by 2002:a05:701b:2802:b0:1a7:78a3:bda8 with SMTP id a92af1059eb24-1b50318d7abmr3048314c88.27.1794594784688;
        Fri, 13 Nov 2026 10:33:04 -0800 (PST)
Received: from [10.50.62.158] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50313d8f5sm15122245c88.3.2026.11.13.10.33.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 10:33:04 -0800 (PST)
Message-ID: <18544db8-05e9-43b9-b60b-bf24e97a1225@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 00:03:01 +0530
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
Subject: Re: [PATCH wireless-next v4 10/21] wifi: nl80211/cfg80211: add
 support for querying SMD context for target AP MLD
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
 <20261106-smd-v4-10-62e39487f51a@oss.qualcomm.com>
 <29b38fc6c8a5f1b2b58d81c1a9046308d2ca9e2d.camel@sipsolutions.net>
Content-Language: en-US
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
In-Reply-To: <29b38fc6c8a5f1b2b58d81c1a9046308d2ca9e2d.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: umpGCXJRfWNO_J8mA1d55DE0NuB96Cg7
X-Proofpoint-ORIG-GUID: umpGCXJRfWNO_J8mA1d55DE0NuB96Cg7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3MyBTYWx0ZWRfXwQF/T1UQxFQf
 82/gMOBsCh4UdHo9O0YRWqZ+KUT/YeF42Z9OvHGTf+L80YO2X19v9y4LrEsJ4v7MFI/xn/6WJSd
 4THoLX9cixnEGiDlRB79nstIqyE/bAPx30nizbc2hthEjaaydFv7l4MWN+JjgY7EVaDpOH3AHea
 R8+qQXR7hNqmFm0SneLvHqCbdOfOHRiY0m5RBCxiYf1AWba7IHPGJhao847+rO42lwkitxwI/CJ
 H3odx/dIr2zUC31vR+yHxuk35ZE4STzysq8tOaOi/y6om7ULnSIw7VRT7b9QHdL/AGwZjmpJD3S
 LPQXjYgJ7EF6S20loQ3TYDXcxk2DGu7vypE49LTT5Dhr3Ca1ScLADFrGXkbEzfDB00Kv7zFxWL4
 rnz/Ly/xZLw5MN4rsFaR3jW5a2Dul5aaD0vkAHv4dVHHnSI/tvHH+6XADTLQFz3rUx0DouBH5Yn
 Y3bOc9q+dfdC0AAjsGQ==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af757e2 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=RSDq6vcL7OiZwIkGrs0A:9 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3MyBTYWx0ZWRfX113WU6ecFLCW
 YHvM4elnjYCkE0XVM0T0q/wWM4JqQ8cBP7C8BDQ2zcXpSOBxdVvRp3v//QJm4MdV5LvyU/utrzX
 DXWEk0nHuyNy6NaDFK8wupjmHKzZ8bk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130073



On 11/11/2026 12:30 am, Johannes Berg wrote:
> On Fri, 2026-11-06 at 13:28 +0530, Pooventhiran G wrote:
>>
>> +/**
>> + * struct cfg80211_smd_get_ctx_pending - pending async GET_SMD_CTX request
>> + * @list: linkage on wireless_dev::smd_get_ctx_pending_list
>> + * @sta_addr: non-AP MLD address for which context was requested
>> + * @dev_tracker: tracker object for the netdev referenced
>> + */
>> +struct cfg80211_smd_get_ctx_pending {
>> +	struct list_head list;
>> +	u8 sta_addr[ETH_ALEN];
>> +	netdevice_tracker dev_tracker;
>> +};
> 
> This seems ridiculous, if userspace sets the interface down it might get
> a stale response, but you're writing dozens of lines of code just to
> avoid _that_?
> 
> Maybe also to avoid querying the same STA twice but if the firmware
> can't cope with it then it can still reject it (or the driver), is there
> really a good reason to have all this complexity to prevent it?
> 
> Tracing on the output path, on the other hand, would be useful?
> 

Just the sta_addr alone helps identifying back-to-back requests for the same
STA and it is rejected in nl80211 itself.

The netdev reference is held to prevent invalid accesses to wdev/dev while
reporting the context back to userspace as there are no locks in this path and
another core may be servicing a DEL_INTERFACE unsynchronized with this context
report. Since the collated context report comes from atomic contexts, we
wouldn't be able to take wiphy_lock.

> johannes

