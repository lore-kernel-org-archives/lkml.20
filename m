Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490853;
	b=D5Eap9bBVvTBuNNM75WlAm8GuGV2NoXoKP+PLTFQRxeK7fuPCUx1A89KWWpZNjhCXWrr
	 Bp80ba2PGdO6uI5pPfWQPzQGQlTvkbOlKh9uGIigkXZoXG9wb5VnWEaFlkpf429ig8/UC
	 dnuyembL45k0GvEW9ZlJXgNSIWsAtlvG8IiL/4KhlDwop+FWby+IoLGhMkrOemgJwD2Zv
	 wAIAP0SpN/V9lqmEfHg+g7tfp9BzjLvi4fh76PWWMNoEf08H+ZrZW1rZCbAr9qnXtb6CS
	 mzHlE8OQavtQ+uVg7abL+aJr35TCDqVhQAGjYDg5dCyyVYmheBZqdytccFKgGFFDWYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490853;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qKf18yeaPGfHDQplZJqxsRf6LqNoo+87TaDvh3Wdj9M=;
	b=XJuMrZZddWZY0TdoRozrPYlNxgSVjWzboawa/06DLDeUUOlmPoqxhBhxkTUkaa0AgwGO
	 MOcRPzFw3DUVh4/+1panHPJ/nIT8GF7co2d9v/Qv5kiA9VoH0qcz0wam1QD3dYgmZiAId
	 jehLP6d6Qbwu8s9M/c5dqcljAYh4LY0RQ3yowoeFg4uX5T9GSOFyRQhDQhGdmy9e8i971
	 a0MixRZhwtqMi+b7iNLj4Lxr+s/DGyE28Ho24LTKxE4aBVtKIcVN1BgjOxY1hY5BoNPfB
	 K0A+3tatqT51hB7ZsYK5itQMWlLw/ds3M5HVKSEb2lTpRRmQL3SoGa8mjZbsm0+nhlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MXJW4p4q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J1ka7+F3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870D9606A886
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:40:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 870D9606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MXJW4p4q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J1ka7+F3
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACBDtKI3893693
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qKf18yeaPGfHDQplZJqxsRf6LqNoo+87TaDvh3Wdj9M=; b=MXJW4p4qCPwmk/Nj
	siwIg8CGYz4mbx14lK8b/4E+PnycciVQXlZJAZ8KGyrp72XmYPlT6XINOryUMlVD
	nDORnlOrglRbxPRrD8Ce94CVNek//0daPypSbJ7FrPd+8429gRKZ31NGBbZDFxDb
	CQt1dWund3Qs79JYMVks4RK/cbVJ1/caZ9wFdGJgKC1/BXyL6IZ5rat16Vwp5mnA
	Ec60Smk3bCyg/RuP0INway6N9K9eppnWti6IFvRizqfIFbF5MzmukU1O7+1fLGpe
	z5VKzpKHuTBX5By+fOfQ2f41A0wbe/foYCdXKRmuYzDkNkPVbdMbfQsP3lTXjq54
	YLAyEA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re1t7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:40:51 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c6c1e082bso15249116d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794490851; x=1795095651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qKf18yeaPGfHDQplZJqxsRf6LqNoo+87TaDvh3Wdj9M=;
        b=J1ka7+F3vP3etLz821DEvFnAK9yZKftEAFZobn6gK8xarwo3HbMt7m0B+d+70dk5qK
         Z5OINJiz/T3nDrt9i8OhxCnZwOQIVdTEfmOrXTpjw3C6I5Orpf6YNyr5seinCwoUvj62
         c8K5y4yUDI9DGCZNv8Dqv4MJWga5zRsyVZ0dT0rz7dbEKeJOaNZKQedhfuIRMFLzIalN
         2d8JUbLgddFR1N6WpZEregESKUBxdWucqX31tTirsSCdvMa6POcAO2+Ii0q+O0ILjpvq
         VDKReKW2BKseBzoc21rvm+lddVyxfz5DBDAmOm7c6UiuEWip6iy/7G04UZH5aSQ4hqjF
         ILOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490851; x=1795095651;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qKf18yeaPGfHDQplZJqxsRf6LqNoo+87TaDvh3Wdj9M=;
        b=XhARRqdGLi2LTkZvh7t5merIY97R5iTq/xRIDDYL/SMvsbd/2uJMOUxQAaLP/4kA4+
         h2oaULuui0KxvSR/cnwhuTYdpWMwDR2u7upo7aPrXn3G48s6ZORj7guFfzkGjEL1kSQs
         EaudKA1c/PymRWzmktjGQioH/avlC6tgH7obDIZmPaXncIC1M5EDIqd7sxe17FKFsPOq
         XEBYmByLTB3JZxTZtaXj5JSFkSNXj56WncGk0PZf/KVQgaDwpnAlTYub4zlCzGDImDK9
         d21tOhpL9yH8Sux0xiyIJI97YgxUHELNAXBi52zAtmmhyvlc65xSMdUplgTz99/JSbBy
         2UAw==
X-Forwarded-Encrypted: i=1; AL+hErHAiOYZlHAhL3JL/Wyt+Ld/oQwjCkfShr3WjjW8yMbEHWabZKXA9aKI1oQNwiQHum8S46i4/GnuB11DBKY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6AuRoiilaSoKnYX+t6CcJuG9kvzscWCfjYaXV7vgZ30AWh9QF
	Y/+BGhKQQCMK5Xvao8cobv3CtwU4mZ3c6rmuTw7zB6f7iY0Hy0xP9hE9HOdXPfqk7AC/1vSIZYm
	4H7mTE6oO4ZAtooALF5cASlHdMGbcQ2vaI/U+ZYqxDYbw3lZVWjgumYOuzBQTn3tDk9o=
X-Gm-Gg: AYBFou1R0Sxz0MrsfDOta62O9misLn+zKoC4cKnJzOBwHI0eVLVUehYjHY9QSc+GcOI
	VQwMDyxJvLPa1TZyJ0R+dCpumECUuQzf3ixa5NC1zU24dfVXzjTIJh5za7EXCpnVURTBt8PFDKb
	albz4CtvCyjlzm8SlGE5hsg0lCH7U0//jSvU7Lj5m1yGDX7lLVNOMM99otXsNLo7/amK5zlewrw
	a0OaXtexdeAa6ggABIgSYlPgFHiNKBv4ai75ZeXnJE+ujJtcswD/z5WuQ47B2DebTsnXT8tkwW8
	1Ob2nPJhpiWQ8cnR0pI50Wjaw4NPMPulEjNJJz43km9E/P3bHpRGM+rlhXYsQJXneYrGLP2Pwbt
	3Ku1uTXKzMR3xjI2VtOresORJFP5yaTrvSV/HMAjb67gMoAPbcoHWdvkUEZM4RhFn74ZUEcgkNm
	9itsF7
X-Received: by 2002:ac8:5d8f:0:b0:535:b545:e926 with SMTP id d75a77b69052e-55956e5d8a7mr45380871cf.27.1794490850584;
        Thu, 12 Nov 2026 05:40:50 -0800 (PST)
X-Received: by 2002:ac8:5d8f:0:b0:535:b545:e926 with SMTP id d75a77b69052e-55956e5d8a7mr45380501cf.27.1794490850119;
        Thu, 12 Nov 2026 05:40:50 -0800 (PST)
Received: from [10.206.104.93] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550b942e83sm74301171cf.18.2026.11.12.05.40.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 05:40:49 -0800 (PST)
Message-ID: <dd62aee3-4f23-4904-827c-7f776c4be60a@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 19:10:38 +0530
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
Subject: Re: [PATCH v7 3/5] iommu/of: Make OF_IOMMU depend on OF_ADDRESS
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Vasant Hegde <vasant.hegde@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
        Eric Auger <eric.auger@redhat.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Joerg Roedel
 <jroedel@suse.de>,
        Srinath Mannam <srinath.mannam@broadcom.com>,
        Oza Pawandeep <quic_poza@quicinc.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, kvm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
 <20261106-add_iommu_ranges-v7-3-5c0f72083e52@oss.qualcomm.com>
 <yvkcq3zirv5tz2amfbk52a7smbsqs7jrzdisq3qxzw6xkoxklu@rplx3gvxhcoz>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <yvkcq3zirv5tz2amfbk52a7smbsqs7jrzdisq3qxzw6xkoxklu@rplx3gvxhcoz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WAf6Shk1Ge0YBoetsJwIM5VN8ca4MrWh
X-Proofpoint-GUID: WAf6Shk1Ge0YBoetsJwIM5VN8ca4MrWh
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af5c1e3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UM6UlptfRCpVODDSDqIA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfX6YFloVnZPBdq
 CYFvy1hBUS66f8f/YV/bRnX3QxKxOjWHibywP8GRBTCDH7OSWw/6rTzML1CXBpo6G5x5LWZ6lN7
 6EQJ7vpZ3NOQhqgtuFKX0Q0ziZkV0ds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfXy6c/1sdjW2qX
 +De6+IljykksGWbOtqvXCaVHpGfFMSaEe7i8OmijCVrCnQ+FcYxvZpNj2Id0fKaEhI1GFFME8wT
 3o5rD0iAxRbPH1ziefptfVkJlo1C/z7kUxxFnY0OyjCkrODJJCHddauzAzzMBhuGa1R4NES5bUl
 v2xRA3xraRmowzXKkYRcdwCIzL2/Y596iWu17ZJmHlBn6fLYEDv8/QnT/N73pQoSyP10TPIrysJ
 rc1ODO1Y/pXra49ABPJrUaydzyWdUpVkyMEF6kw4lIw3FKAXzXl1bCifuSeT4vi6Qhiw9wBEEbO
 QsG5i+tOJbf5kES+luzSKjpCmxV9Om25BOBgMc3lWrrttSIAs8Nt0RfQrKgXiCEhjqFDuJpvwKm
 mKXlrRl//kWdsHoRux67lcJOzYH9gUlzPvSBVXUjsXtghyOPDGJVjp+i1B9ZhDnuopq0I6YeHeP
 YNIN1jUZxQtRrOF1bKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120054


On 11/11/2026 6:33 PM, Dmitry Baryshkov wrote:
> On Fri, Nov 06, 2026 at 10:44:26PM +0530, Vikash Garodia wrote:
>> The OF_IOMMU code relies on OF address parsing helpers, but the
>> dependency on OF_ADDRESS is not expressed in Kconfig. As a result,
>> of_iommu.c contains CONFIG_OF_ADDRESS guards and a __maybe_unused
>> annotation to handle configurations where OF_ADDRESS is disabled.
>>
>> Make OF_IOMMU depend on OF_ADDRESS and remove the now unnecessary
>> preprocessor guards and __maybe_unused annotation.
> 
> Why? What's the problem that you are solving? Why is the current code
> bad?
> 

The commit describes the problem as "The OF_IOMMU code relies on OF 
address parsing helpers, but the dependency on OF_ADDRESS is not 
expressed in Kconfig"...and instead the code had checks for config or 
__maybe_unused for cases like sparc.

It was discussed in prior rev
https://lore.kernel.org/all/20261104160346.GD3951195-robh@kernel.org/

Regards,
Vikash
>>
>> The only architecture supporting OF without OF_ADDRESS is SPARC, which
>> does not use OF_IOMMU, so no functional change is intended.
>>
>> Suggested-by: Rob Herring <robh@kernel.org>
>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   drivers/iommu/Kconfig    | 2 +-
>>   drivers/iommu/of_iommu.c | 4 +---
>>   2 files changed, 2 insertions(+), 4 deletions(-)
>>
> 

