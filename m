Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793939802;
	b=PQQuW9tkbukhjdhOBI7zFCPDsUFd80X8tCCCOVf/68MCwrvdeNlz3w+tPH5Y7lCF3+GG
	 v+sWG4QXFBIDqaLwOzi4hzXBI/mbSPkpdUJ9JIZfhTksVy5qcQpke6RppjbLAdSWoZPqJ
	 I+NVV/SK9/h52C/32+1sQG/GiOReBWWHYA/XtWoA3kY6qzwDLYlHDlDkyMgrjSwqeitLn
	 Kcb24ozt0eIjbFda+fHY85EblQHPqPibZuomqA1LIFlg6ga6S6Y3iyaJeJDTHKODyrrlD
	 yq3807JHIl1SLWq2lkjdPnK1gw43kGJrs/Z2+JNpF68PSws+cxTOYagRk6CME4mLrNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793939802;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Cyl3IszRXftb9Zsaj929sRYbACZ+gYXwE/XyklBs430=;
	b=s7vhHoOIHnr91RtnwD/R/GFKd5cBcDYbNA5Fwll8P0aaRSXcTMgk9p33SS2F8lHrHGxd
	 RtgxUz6Wh48t2WE/8klsHRDtCSKajgfP1cgOYpzUtv3ochxmzsCWrWwC4D71TfpOjC2ff
	 qEmPfMRiqOArE3laZoTDGJ6sUtXvYTAtZQQsqJj0Vs5xNHJb+aE0BzyoXxdjrwsBxbcFh
	 LPjTr2KNxxxsXIefVOH+Td8AwFBXjsApj2FsNvq6g3vYgTkUmO+fX7ZB6q8KA3oGO1nKc
	 7OPWUbVBwZZIXoahhvIA1eRqQ6/EqPfJ24d5Iim9xGyn80K+/cvCJznSMsEkS5ayLtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Aau6bUqQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PRh6Mjzx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C14606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 04:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7C14606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Aau6bUqQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PRh6Mjzx
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A63xvtm3856517
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 04:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cyl3IszRXftb9Zsaj929sRYbACZ+gYXwE/XyklBs430=; b=Aau6bUqQO6KZlczx
	iiiCouk/R1QQo3vRKygvOLQXrnyXEG8NneCvUy7QrQN10usDDVSGgLZoNbYkv2Zl
	MpCf93hx+Vm0eCtm/t0b0s2p4b9kU4k2XXizk9E1iv9pYCHm8SkV36Sm3qm/8AKG
	P2L9zidBwczr0yec+ntcp+QRI874naqHrt52fkPly4H8y75NjTwMb+H8Q19wNK5S
	yLWVhSvbOhLz8yHEr4MTIKVtUCxVb3jVRv7XmJ3wJDS7cUc8I7VEDaRYuPtD26gV
	TkTe9OokIVTYb2MudM0Sb6g0zSTisKyiaeME55VVTcPhuhWUfdOpc4rO9psgw741
	ZVcGKA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9rwyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 04:36:41 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso469682eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793939800; x=1794544600; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cyl3IszRXftb9Zsaj929sRYbACZ+gYXwE/XyklBs430=;
        b=PRh6MjzxXpSWMI/DFStiJ3ins5vCqFQqN1NKDX3K4XfXwcX/qtG+YX56waMUZNApww
         XlJm31A24CBIHF5px5iFOLAX7ApdXiOQFP1ECSYeZVG+asS7oF62cpOzl39kKjCZGl1F
         vSFAIY0mgGqHHLDT9G33Qo3rx1wJi0gXPQLhKtB1IbmXA4PJWsOudjoJXgiDszPRxObC
         wKjjevRkKnp7Ao1rw8m58/ZrH5bJdykTmNvD6qbd8BmqGEz6+8teYfFmkPV4PTDxOPPo
         XbSG9U9euviWTwFfOlzmkjtJzwj5sfSKuRy1467gyiiqSxL1mHo+Iolri6CNz2/rJakv
         nXWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793939800; x=1794544600;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cyl3IszRXftb9Zsaj929sRYbACZ+gYXwE/XyklBs430=;
        b=k5nIxn23p2USSrifU+hqbN5BiXpymH8UHI8LcdjFpeHDegwybaci078yXfRe4tsm4U
         TM+30fEjeP6rd3fKazgU/5dV1ZcZS1M7eG5jyssXf4cA5OhtwUYKPb9j4VeLaWaEKyVf
         TJjm4GF3NuFW3PoQOU9np4+VOwe++Ew4PAlc/W9juyPt16Sdcnejpwll+H1Ti+Yu8DOF
         qDztIGB+21KslmcxBzWccp+BlQxoR+OYe9Bsawfe9BuvhnObHdahAyTMcN7+U0EkYiaV
         NAoGZ6OwBxPmw5HpsNr7GzWxLun7+Yv12ydlN4ugZfyZI5O0CkXXXic2aC3ec4lSrv8f
         Poyg==
X-Forwarded-Encrypted: i=1; AL+hErGvesrIpO9RN8qXPUk2hoscZZK4fKf9bTH59Z8DJlokaFrst0bgcBBLfpFaknr+2Sz7AnAOKZnxNgk6rT0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GdWm/1xky8PNt1zwnaFP5x1moghXjhm6cQ6j4QH2GF8J74BfV
	XJXnpdDvBTVWGecXNaHP3I67dG/j4P3KsPtt4G9tNOgrxdCvrb1IHiz6LxaGaUwEFE8LHEVX4dq
	oJWQYuAmsImVB8SlXNoDUzPODEtNwtac6gYit/HUDkN6/GL5nYBVO48rzQhPVuNKdxy4=
X-Gm-Gg: AYBFou0a1mA7TssXsiBmfNrzbc3V8GochRpjsqBb3nL5mZxwIh4oH8dxPDJVmfTu1qc
	ApLZL5GCW15EPHglZie2YOWheZuNp8ja4ResuwpC1cO1Qta6XjSxK488xqm1eDMTper7YDFr1At
	BeLyoYV/O60j4iOIc6fE/6l/x+vCxHvr3xAf6CMjL/QUdH1VhOSrSKpU30DA3u11pDQLkjJ2Evd
	+6qIVUWP550syNlpjM8xUsWZJq6Be9bBz5TY/Gn9GSNiEspp+bT0EvWyzN5NuaXpbRxWr9B0YE7
	8o8vTR+CbR3a5ZJbLWPykuzzbzM4MlcsNNbmDZY7p3KjMYscUFt9BsxvaFQr0frbGhgIjT+T/Jl
	3Pwlzhip/QqREJGN8gshv9aGEsrpHKRq38ijBY2AMOImVKepHu3tO9r6l9qUjmyyq55mVj7D/t1
	NI/lYwD3tD
X-Received: by 2002:a05:7300:dd49:b0:36f:551:2bd5 with SMTP id 5a478bee46e88-36f7691ac12mr1777949eec.32.1793939800071;
        Thu, 05 Nov 2026 20:36:40 -0800 (PST)
X-Received: by 2002:a05:7300:dd49:b0:36f:551:2bd5 with SMTP id 5a478bee46e88-36f7691ac12mr1777901eec.32.1793939799236;
        Thu, 05 Nov 2026 20:36:39 -0800 (PST)
Received: from [192.168.0.116] ([124.123.146.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9fc92fasm2869344eec.19.2026.11.05.20.36.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 20:36:38 -0800 (PST)
Message-ID: <187f3c63-5550-4a42-892e-ea660247edc9@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 10:06:32 +0530
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
Subject: Re: [PATCH net-next v5 2/2] net: wwan: qcom_bam_dmux: Assign
 restricted DMA pool to remote processor
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan@gerhold.net>,
        Andrew Lunn
 <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sergey Ryazanov
 <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Eric Dumazet <edumazet@kernel.org>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20261105-qcom-bam-dmux-vmid-ext-v5-0-5c7903385b4b@oss.qualcomm.com>
 <20261105-qcom-bam-dmux-vmid-ext-v5-2-5c7903385b4b@oss.qualcomm.com>
 <CAFEp6-3rt8yvTd-mMA6y5SqmzmF0zvrvO_Dc_w7G3QSv7oZWng@mail.gmail.com>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <CAFEp6-3rt8yvTd-mMA6y5SqmzmF0zvrvO_Dc_w7G3QSv7oZWng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAxOCBTYWx0ZWRfX81cu7L8neSCt
 vDV4TEu++F3aM5AmeGMOYLlttHeDc5k8ZTi0NQBiAzYhEwiB6H3xM4PJbD+qhZmHCmVtnAgE2d2
 KofMW6rsO14i1U6t5QhWsLgJZVKbevk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAxOCBTYWx0ZWRfX+Qx1quZHQCfA
 tAVHV1mgU5iWhLWGKN8ygayu4mnrrgvUWLChWi/cS0L9vAlftS9Bo8WntZtTHJL44Xa8n7jbOtj
 p5mrkuUM4mEGPdgD/9f1eGrXzRkZtbGePyMhFSA4gAD7heb5HMMxKteGBBVRAiGltAcAM0I/Bca
 CPlkA4LYzwEgOYsnF/MDsNgSGR0+ichT9e4LKf81Nve72b10tDsoWtPBFDCh9pMeoY/xLmN7EZv
 8ngsB59DSq56RG563aBxgUDtmnvZwaUjX4Q+N7in121kOUe75JArzwN3lI2oNFUIGLqsOvksa90
 2jFaQ7yjS3avzDAvYG0cJ4dyOc2W55rO9hzIZyzXT2/NmbeeCoh7RtZ5sj1poRgVDUulpfn87rJ
 x7MtstKj6+mOxD0Kx+33DS6yLoKS/yW8e7rK7iVu9oVR+Aidas/eQ33k0bDhp3HDWegf8xKuY4B
 Vuo20ONC1smSo0e+A9g==
X-Proofpoint-ORIG-GUID: MMbAxq_tDCNIcMVQaamVVCFObpHI1obs
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aed5959 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=K/78aEDNEn2Q/Yuv7mVN5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=fKMpTyM1RLJrecArqiYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: MMbAxq_tDCNIcMVQaamVVCFObpHI1obs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060018


On 05-11-2026 07:51 pm, Loic Poulain wrote:
> On Thu, Nov 5, 2026 at 11:42 AM Vishnu Santhosh
> <vishnu.santhosh@oss.qualcomm.com> wrote:
>> Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
>> domain with restricted access to system memory. BAM-DMUX DMA mappings
>> and BAM descriptor FIFOs must therefore be constrained to a designated
>> memory region that can be shared with the modem. Accesses outside that
>> region can trigger an XPU violation.
>>
>> When qcom,vmid is present, require a restricted DMA pool and assign the
>> entire pool to both the local and remote execution environments before
>> requesting the DMA channels.
>>
>> This ensures that BAM-DMUX mappings are within the assigned region. When
>> the BAM DMA controller references the same pool, its descriptor FIFOs
>> are covered by the assignment as well.
>>
>> Track the assigned execution environments explicitly and reclaim the
>> pool for the local environment after DMA channels and mappings are
>> released during remove or probe error cleanup. Skip the reclaim and
>> leave the pool assigned if the remote side still holds its power vote,
>> since it may still access the pool.
>>
>> Fail probing when restricted DMA pool support is unavailable, when the
>> VMID property is malformed, when memory-region is missing, or when the
>> restricted DMA pool is not attached to the device.
>>
>> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>> ---
>>   drivers/net/wwan/Kconfig         |   1 +
>>   drivers/net/wwan/qcom_bam_dmux.c | 108 ++++++++++++++++++++++++++++++++++++++-
>>   2 files changed, 107 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/wwan/Kconfig b/drivers/net/wwan/Kconfig
>> index 958dbc7347fa84ee869439bf8b503037faab8bef..1b133c56231615269698140187ca3141dfe48dbf 100644
>> --- a/drivers/net/wwan/Kconfig
>> +++ b/drivers/net/wwan/Kconfig
>> @@ -65,6 +65,7 @@ config MHI_WWAN_MBIM
>>   config QCOM_BAM_DMUX
>>          tristate "Qualcomm BAM-DMUX WWAN network driver"
>>          depends on (DMA_ENGINE && PM && QCOM_SMEM_STATE) || COMPILE_TEST
>> +       select QCOM_SCM
>>          help
>>            The BAM Data Multiplexer provides access to the network data channels
>>            of modems integrated into many older Qualcomm SoCs, e.g. Qualcomm
>> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam_dmux.c
>> index cc6ace8d64371eb8d00c638a39b234ee540b83c9..0e7ad62f8b4e059264e89837f296ee13c0c31c9b 100644
>> --- a/drivers/net/wwan/qcom_bam_dmux.c
>> +++ b/drivers/net/wwan/qcom_bam_dmux.c
>> @@ -9,14 +9,17 @@
>>   #include <linux/completion.h>
>>   #include <linux/dma-mapping.h>
>>   #include <linux/dmaengine.h>
>> +#include <linux/firmware/qcom/qcom_scm.h>
>>   #include <linux/if_arp.h>
>>   #include <linux/interrupt.h>
>>   #include <linux/module.h>
>>   #include <linux/netdevice.h>
>> +#include <linux/of_reserved_mem.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/pm_runtime.h>
>>   #include <linux/soc/qcom/smem_state.h>
>>   #include <linux/spinlock.h>
>> +#include <linux/swiotlb.h>
>>   #include <linux/wait.h>
>>   #include <linux/workqueue.h>
>>   #include <net/pkt_sched.h>
>> @@ -75,6 +78,9 @@ struct bam_dmux {
>>          struct completion pc_ack_completion;
>>
>>          struct dma_chan *rx, *tx;
>> +       phys_addr_t dma_pool_base;
>> +       size_t dma_pool_size;
>> +       u64 dma_pool_perms;
>>          struct bam_dmux_skb_dma rx_skbs[BAM_DMUX_NUM_SKB];
>>          struct bam_dmux_skb_dma tx_skbs[BAM_DMUX_NUM_SKB];
>>          spinlock_t tx_lock; /* Protect tx_skbs, tx_next_skb */
>> @@ -762,6 +768,90 @@ static int __maybe_unused bam_dmux_runtime_resume(struct device *dev)
>>          return 0;
>>   }
>>
>> +static int bam_dmux_assign_dma_pool(struct bam_dmux *dmux)
>> +{
>> +       struct device *dev = dmux->dev;
>> +       struct device_node *rmem_np;
>> +       struct reserved_mem *rmem;
>> +       struct qcom_scm_vmperm dst[2];
>> +       u64 src = BIT_ULL(QCOM_SCM_VMID_HLOS);
>> +       u32 vmid;
>> +       int ret;
>> +
>> +       if (!of_property_present(dev->of_node, "qcom,vmid"))
>> +               return 0;
>> +
>> +       ret = of_property_read_u32(dev->of_node, "qcom,vmid", &vmid);
>> +       if (ret)
>> +               return dev_err_probe(dev, ret, "Failed to read qcom,vmid\n");
>> +       if (vmid == QCOM_SCM_VMID_HLOS || vmid >= BITS_PER_TYPE(u64))
>> +               return dev_err_probe(dev, -EINVAL, "Invalid qcom,vmid %u\n", vmid);
>> +
>> +       if (!IS_ENABLED(CONFIG_DMA_RESTRICTED_POOL))
>> +               return dev_err_probe(dev, -EOPNOTSUPP,
>> +                                    "qcom,vmid requires DMA_RESTRICTED_POOL\n");
>> +
>> +       rmem_np = of_parse_phandle(dev->of_node, "memory-region", 0);
>> +       if (!rmem_np)
>> +               return dev_err_probe(dev, -EINVAL,
>> +                                            "qcom,vmid requires memory-region\n");
>> +
>> +       rmem = of_reserved_mem_lookup(rmem_np);
>> +       of_node_put(rmem_np);
>> +       if (!rmem)
>> +               return dev_err_probe(dev, -EINVAL,
>> +                                            "Failed to look up restricted DMA pool\n");
>> +
>> +       if (!is_swiotlb_for_alloc(dev))
>> +               return dev_err_probe(dev, -EINVAL,
>> +                                    "Restricted DMA pool not attached\n");
>> +
>> +       if (!qcom_scm_is_available())
>> +               return -EPROBE_DEFER;
>> +
>> +       dst[0].vmid = QCOM_SCM_VMID_HLOS;
>> +       dst[0].perm = QCOM_SCM_PERM_RW;
>> +       dst[1].vmid = vmid;
>> +       dst[1].perm = QCOM_SCM_PERM_RW;
>> +
>> +       ret = qcom_scm_assign_mem(rmem->base, rmem->size, &src, dst,
>> +                                 ARRAY_SIZE(dst));
>> +       if (ret)
>> +               return dev_err_probe(dev, ret,
>> +                                    "SCM assign restricted DMA pool failed\n");
>> +
>> +       dmux->dma_pool_base = rmem->base;
>> +       dmux->dma_pool_size = rmem->size;
>> +       /* Track the destination VMIDs explicitly for the reclaim operation. */
>> +       dmux->dma_pool_perms = BIT_ULL(QCOM_SCM_VMID_HLOS) | BIT_ULL(vmid);
>> +
>> +       return 0;
>> +}
>> +
>> +static void bam_dmux_reclaim_dma_pool(struct bam_dmux *dmux)
>> +{
>> +       struct qcom_scm_vmperm hlos = {
>> +               .vmid = QCOM_SCM_VMID_HLOS,
>> +               .perm = QCOM_SCM_PERM_RW,
>> +       };
>> +       u64 src = dmux->dma_pool_perms;
>> +       int ret;
>> +
>> +       if (!dmux->dma_pool_perms)
>> +               return;
>> +
>> +       ret = qcom_scm_assign_mem(dmux->dma_pool_base, dmux->dma_pool_size, &src,
>> +                                 &hlos, 1);
>> +       if (ret) {
>> +               dev_err(dmux->dev, "SCM reclaim restricted DMA pool failed: %d\n", ret);
>> +               return;
>> +       }
>> +
>> +       dmux->dma_pool_perms = 0;
>> +}
>> +
>> +static void bam_dmux_remove(struct platform_device *pdev);
>> +
>>   static int bam_dmux_probe(struct platform_device *pdev)
>>   {
>>          struct device *dev = &pdev->dev;
>> @@ -796,6 +886,10 @@ static int bam_dmux_probe(struct platform_device *pdev)
>>                                       "Failed to get pc-ack state\n");
>>          dmux->pc_ack_mask = BIT(bit);
>>
>> +       ret = bam_dmux_assign_dma_pool(dmux);
>> +       if (ret)
>> +               return ret;
>> +
>>          init_waitqueue_head(&dmux->pc_wait);
>>          init_completion(&dmux->pc_ack_completion);
>>          complete_all(&dmux->pc_ack_completion);
>> @@ -829,8 +923,11 @@ static int bam_dmux_probe(struct platform_device *pdev)
>>
>>          ret = irq_get_irqchip_state(dmux->pc_irq, IRQCHIP_STATE_LINE_LEVEL,
>>                                      &dmux->pc_state);
>> -       if (ret)
>> -               goto err_disable_pm;
>> +       if (ret) {
>> +               /* The PC IRQ may already have powered up the RX path */
>> +               bam_dmux_remove(pdev);
> it's still unclear in the comment and commit message why we can't go
> with err_disable_pm?

Agreed. I plan to update the comment in the next revision to:

/*
  * The PC IRQ is already enabled and may have powered up the RX
  * path. Use the full remove() teardown so that RX DMA is stopped
  * before the pool is reclaimed.
  */

and add to the commit message:

If probe fails after the PC IRQ has been requested, clean up through
bam_dmux_remove(), since the IRQ may already have powered up the RX
path, which must be torn down before the pool is reclaimed.

Does this look fine to you?


Vishnu

>
>> +               return ret;
>> +       }
>>
>>          /* Check if remote finished initialization before us */
>>          if (dmux->pc_state) {
>> @@ -845,6 +942,7 @@ static int bam_dmux_probe(struct platform_device *pdev)
>>   err_disable_pm:
>>          pm_runtime_disable(dev);
>>          pm_runtime_dont_use_autosuspend(dev);
>> +       bam_dmux_reclaim_dma_pool(dmux);
>>          return ret;
>>   }
>>
>> @@ -879,6 +977,12 @@ static void bam_dmux_remove(struct platform_device *pdev)
>>          disable_irq(dmux->pc_irq);
>>          bam_dmux_power_off(dmux);
>>          bam_dmux_free_skbs(dmux->tx_skbs, DMA_TO_DEVICE);
>> +
>> +       /* The remote side may still access the pool if it holds its power vote */
>> +       if (!dmux->pc_state)
>> +               bam_dmux_reclaim_dma_pool(dmux);
>> +       else if (dmux->dma_pool_perms)
>> +               dev_warn(dev, "Leaving restricted DMA pool assigned to remote\n");
>>   }
>>
>>   static const struct dev_pm_ops bam_dmux_pm_ops = {
>>
>> --
>> 2.34.1
>>
