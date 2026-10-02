Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EF724A05D
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 01:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790905342; cv=none; b=YSSPHWlrc9gL+EEp6g5nYW12PYwwVrAUYMBZQA7Y1PPIgMPNwXTxv2G6SD0a77Mi16lLlcbwFgOdsmWv94Xnr84XXg0hVTuKLMBSpaSmDTpqjMNJ44lzQ9yHZueVydvuiQNAT+NEzcflzI4KkDmVnAsg49ff69SLBLVCpuHUfKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790905342; c=relaxed/simple;
	bh=MzsXzPrrydw7IiQe5C8qjcV1u07Y4mvpDYA/CRyG4dk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YVqVInm6xmh/xK+HiuZlYcnqWbbWSTNe2Tkz83piM17eLDjvY4BE+NHfgcYdJOLl+K5q3u6DA0gEWcRNbdf5NaCWBACIt2Ke+rMZofsNJ9uSAmzW0Gz4C7BUg/thLTQ96lqRE/yirMx92Qh0auFF8/8R7A6otEe56bhqloPrAaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KCcE8od0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jq3HcyN+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KCcE8od0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jq3HcyN+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691NFWXH811140
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 01:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M6/g5Dig/y4D43heLCRml/blZ0GrVffiENFzzkVKcb4=; b=KCcE8od0Q/3msmw9
	89nZnhog2TSzrWXXrVxKWRNYWH9sJip/q9/pGwPnH1umWSm9ySijb0XoQ9FkXt4q
	euL1QChifKddQ6I3+uqBTAEQQMVtukkB+uHWCOWzdCRtjfGYRDYxCoS0vJ3eUpBd
	uMmjGnxJ6x+NF4Ou5gXRegwqwgRV70IiV/WX/W5/KRR9fN/m5YjWQovOtb53EFZc
	4sWxXKpLbw6ubjf9adGwT5YPA5tS5G3gJSEUIu/fVud0DTxvd3cWv3suS/Co3/Uk
	XYVeWyG2OW4Yqjz2V7P5G8hEAm753+2l885gQpWjYmfB50WveAw+bkn2cp/eDrR9
	KQHm1A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1p2bbc53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 01:42:20 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34d84114044so6805388eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 18:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790905340; x=1791510140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M6/g5Dig/y4D43heLCRml/blZ0GrVffiENFzzkVKcb4=;
        b=jq3HcyN+ar45JndMMvZv8aAlePGAuaJTWx0QfatnY1htkl2+ihfYUj1A1t5DlljqiD
         PbDdCSstz0hpDoGI1WTxDJ23UUVB5TKbXB+k34acX7IiatsBnhZlUI8hicHLggdEUKxU
         2LC1BRtzhjy9soP/HFtWKGkRzvsMqH0uwavBENsazMP9WXgkLe0nSe6/SCb0sqrS7Rvf
         a2Ny+qmcIrGDiEDIsDs5stKRtLKRSbCOvbaflZyRjotb0uf5CnPHUFgjnHFJToWktzUg
         hsHorlnQ1TaLXNNr4tP5J6fbXWkREoPL0l7gjFRvINArZqQz7PPVUqUWgSQzDBL/DrBQ
         2DEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790905340; x=1791510140;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M6/g5Dig/y4D43heLCRml/blZ0GrVffiENFzzkVKcb4=;
        b=c8vhGCUYXGenAikdvZLJYX0qcmZumpn2y2IbiBzCD/p5vF4hCPnW0MGFTl+yddPOGG
         JIeDnLwQRirSyrWS/miw5I6zUSHQaHCRwmB74feHXyqxJ7VLcKKaqjiNT76OnXygywIc
         8sBOxV/yYxanSz2jSGfwgpe1cDJHfuc2WGMFeBN/QfHTeivZOcGYLUvHK4ZDjp4H1WUF
         hBC7fm8lGNeRupZcEOdRWJoREewZEtYhkFQTF701G9DUkcaX//jU4dRWXkrCMYl7Ux/C
         NxD1ZekHteFkzvnTnWUdNne+IfN3tC6aL+wRXYdxfzaNiPYB9HjW1FTuO7hNJWZFGtWb
         nrlQ==
X-Forwarded-Encrypted: i=1; AKwUvByp3r7gbSIfzJ0KUuj9aK9VY0QRDF18DdXlCgiVRWwOyrgTQGx7ltGX/goITIsjD0zPOZb/1RXDT/bdwsU=@vger.kernel.org
X-Gm-Message-State: AFuF++mQYns198FsqAj9b/yMROwhNvWheAK6cpMnvDlfVrCb9r3WKlVB
	MZ/oe6zcNoKmTd5NZ01WbJpccc8HAtmqJsCkUq7xtuoVNGt/TP+hGbWijZNdHstgTRkkE4hlStQ
	SH20/kUTO73XC6Sz4i5Rk/jsaJCbwwThYPC1sE3Dh7hFM4Hk/Nj+RXixNM89yxHTNW1c=
X-Gm-Gg: AYBFou1Hdmn3crKPwVULZ/veqItaHcXSlQnk2IBjfPec3P2S/DZv4tDRjA89wtDgoW6
	5jEUZPIJYlkEuw//Vp6RsFZhbc1+pGQS8F+Z6fcGfEwU7JJanqgiEYFscL9TJhM0rOxOumizwgR
	TJbK2gjX6LHh5jQwuKN9W5e0V+rN8MnL/tMBvRf2rHCl7uXtVjLYi6cFgYnM56pf9Lo7QxTHvyG
	vmIAfT0mZ1xL2NEaHbEnpMyrFC6ZOk+lOtP3Y9PDtox+Stm+mvBCMatX6rqnCjir4rfFi1e5Io7
	n9q70vnCyAeX4NYBDoDrcpmHLvQdlM7MNXNkmMNZ02pjTD6HeS1pzCtBXwThkNNNlTvS3NIv4mA
	wXHhCr7nAfRvSHiLJe4RrvCijKy6UlVghKWuN6xOUAfvTcg==
X-Received: by 2002:a05:7301:4203:b0:33b:e21e:4a3a with SMTP id 5a478bee46e88-34f2199dee9mr1149659eec.40.1790905339568;
        Thu, 01 Oct 2026 18:42:19 -0700 (PDT)
X-Received: by 2002:a05:7301:4203:b0:33b:e21e:4a3a with SMTP id 5a478bee46e88-34f2199dee9mr1149627eec.40.1790905338652;
        Thu, 01 Oct 2026 18:42:18 -0700 (PDT)
Received: from [10.73.194.28] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14fdfc58sm1759567eec.24.2026.10.01.18.42.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 18:42:18 -0700 (PDT)
Message-ID: <b61c4087-3ccd-409e-8b3d-df75795b014d@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 18:42:17 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add larger page size support for USB audio offload
 path
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
References: <20260909-16k_offload_v1_b4-v4-0-f24a86617597@oss.qualcomm.com>
 <d7ce8b23-64c0-43dd-a8c8-268224b9462c@oss.qualcomm.com>
 <92d80a55-4422-4659-8f2d-e28693d6d9d7@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <92d80a55-4422-4659-8f2d-e28693d6d9d7@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: lL0kDhW9WhHzzbBe2wtNqrC_BHrBXAoc
X-Proofpoint-ORIG-GUID: lL0kDhW9WhHzzbBe2wtNqrC_BHrBXAoc
X-Authority-Analysis: v=2.4 cv=O8SsLx9W c=1 sm=1 tr=0 ts=6abf0bfc cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=QyXUC8HyAAAA:8 a=IW5fbvKdXzPv_-dW0WQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAwNiBTYWx0ZWRfXwf1x4dOAe5cb
 YDYC7QHBzZvxaK8QpEMA3gbqlLyueEhmnG3Wn3gum4+qEqok+60W3vs2eoW5Vh/0eNixryetsGf
 Gs8Wzq4DVKvNas2cJdUtTlhG7ZeUkZY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAwNiBTYWx0ZWRfX8bwyKaBUe/Ox
 mXt//RB2a41olz61R+iHQ8H8b4o6o7uucMnBGgSDilqfJ4ORcaU4ztIPqYih49tYBqcQDgt7oMM
 Ym+gVJjA0ZLjUR2mtLvdZk1s6k+xn0mLsim8Rndl6F+fZY/MhfSq8Ss/J9HKCi0w6vJeKNN5tYk
 xsv78b1awyYzNMj7X4dw2ua66SkaafIwNunQBkKPeBu/g2EWVzvwGHp7SY89yboVB1/fimXW+xZ
 OVqJhy2g67WXrYJ/PsbngKsmv1+jzn0S5dHhpIL0ysuLP2ocZGrKH38RkvvdPgyMrdJy8pZ/RYm
 ROVWer+jkPw1KAi1a1CEvhq7/FAXeOr9poHVuf+2f4Vfwgp8tX9f4UqxCGKo6LjifTIkY/c/elb
 Zc6eLjGDP33hohE9PKk4k7RkfH4k2a7SycSuSXhYQ0gL+IHLuapcpm1F/oFp4mrj6bAlCBn3lJq
 94PPHuXdo62HXtrFFFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_05,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020006



On 10/1/2026 3:33 PM, Mathias Nyman wrote:
> On 10/1/26 01:23, Wesley Cheng wrote:
>>
>> Hi Mathias,
>>
>> Just checking to see if there was anything that we needed to account for 
>> in this series?  I think there was the discussion that came up here:
>> https://lore.kernel.org/all/ 
>> TYUPR06MB6217000B59003EDF233D7246D2B22@TYUPR06MB6217.apcprd06.prod.outlook.com/
> 
> Patch v4 1/5: Looks good, is useful even as a standalone patch. Can be 
> taken immediately.
> Patch v4 2/5: Looks good, not useful as standalone patch, can be taken with 
> rest of series.
> Patch v4 3/5: I need to revisit this and look at new dma pool lifetime vs 
> xHC accessing those DMA addresses.
> PAtch v4 Rest:  ALSA, no opinion.
> 

Great, thanks for the inputs.

>>
>> But, I think your suggestion about adding the sideband check in the 
>> xhci_setup_device() would mitigate that problem.  Esp, if we don't want 
>> xHCI core to really know about sideband ops.
> 
> That would be the bandaid in:
> https://lore.kernel.org/all/c6c9890f-46d8-42f1- 
> a7e7-8a5d551fa22c@linux.intel.com/
> 
> I can turn that into a proper patch.
> Lianqin also gave some preliminary positive feedback, but I'm not sure if 
> the code was
> ever properly tested.
> 

I can chime in a bit here.  I did work with Lianqin offline, and I was able 
to reproduce the problem (w/ this series included in the codebase), and 
your suggestion did work.  I provided some feedback to them, so hopefully 
they can convey that on the other thread.

Thanks
Wesley Cheng

