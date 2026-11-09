Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794211900;
	b=T+x3E07iPmP60utIWz3m5eUYEmeUR8QEaDFwQtzgjssrZegfmmtwVY2lkpql06/eRP+Q
	 BgjfXAgWmpyAMxna0pjA+2zVjnZHOHhDULDCTnfHMaEITSCgF4rC4u5KEcZPkC7Iyagyk
	 2J5XlCPE7p2EbNgCXXeruSutSabIMEHmy3H6xW4Ic3Z1/BxKc4rFCKFfXHJi9cgUcDTVe
	 H7XDF5ATu2wQz0NpTUUHq6m9VaTUYeeesmvP6fR+DMBbXU6QZIklNgYXc1Bjw/7aUYbxC
	 TmfxcknptQaEB9wJlgi+fGlii0FN2vuU/S80qreufFo6sLQSgdZjwnRnhI2pagltJSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794211900;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3Hyx0HfDdI+qJ8O/EhEf8YHmYreBy/xtMHLhJ3AsflE=;
	b=Sb13Qu7prvpAA7YzHuvcpGIiXlWJ8K2xyX5wyCiFv7LoMFmcL803pKjRxJswhBFEnHRV
	 Qd6Sz6058oApBL+8oOrXt6qyoHD+XMPJ9vBtVqr1VWvA68eEjsaHLHXa09Q5Ji2kOCxHy
	 tZxl/jrAb4p4spVAP8aXLTrJmKySjl7KisOtI5uqPc+uImyePTY1ed0LZl/6RZaMMCYxY
	 hCJ3EEF7ucEedc8iT3akc1xcuyeOu5Neb3MQ7Qeh4Rd7NkBAdZhfddBfpJsk21ml71nUu
	 lItQtdpsQ5gpTC7IdgDLnAIn/YicKf77qzIA902DHrDm72sUxlRVZDBvQBVVMvqW+Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dxgKwV42;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DzzhtEh5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88A3606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E88A3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dxgKwV42;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DzzhtEh5
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A969qUu401314
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 08:11:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Hyx0HfDdI+qJ8O/EhEf8YHmYreBy/xtMHLhJ3AsflE=; b=dxgKwV42aWRHUOy3
	1V+oiGNIp/buFOgQQ0I1HYx04BYakOqtTyDbdkCnoCMjGj9Fd5intuTN9XvNzSu9
	Naczydkg1LfAeRK4oIUwLAZD1sDUIb++pwkOBDj6h5gPUkodWAccWsmAOIFbotyC
	x6TCpRi2uds9+/QIPijt3LxtH8UWQtsBl/9YG5tlhULPn8eyQ4W01E8AIm4SCUoj
	XBwphtvoU9u+KSKK49Y2rg6ZPt7xwZOHOm8V/Stf/+3WGpEfoe55w2BNYayvl5T9
	yAU2IXw3xOnKcci0lsBE+Kmn3OcVa+7MKZ6T+QsnAP1/xxLTiD1sDwdC2Dl/6kFe
	cxpckw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsspf5ptt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:11:38 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so1705270eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794211898; x=1794816698; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Hyx0HfDdI+qJ8O/EhEf8YHmYreBy/xtMHLhJ3AsflE=;
        b=DzzhtEh5hRPqiPsYcwAZV67IGLnt5mMIPLRkI+kKiLny6jhjq5cY09HOTLWUIixlXC
         MVPew4eIMRjXbkm/XztbjFJCTmq9A/l+K/FvX2YU6BnS4NyWJP92lczn0TOFFi6gBfYw
         C7g46EfCNgfBfcFZCrNdX8cX1zpDdr5kSL2T5fR/Ne2eMpdohYgSLTfCeVgLvFF9bp3R
         n8NfgrcryJhMhB8g8+3AycW9pBKlCqHnyKGJ3V+AuPdB4fje0G5nAf/5DSWE4WOTVuUY
         HHuwzyIn0kW8cKEfFu3q1oHM388M5I9deOnTGxvvQw2Xor9RhXZ0xtyREym0HVa4pp3Z
         /dQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794211898; x=1794816698;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Hyx0HfDdI+qJ8O/EhEf8YHmYreBy/xtMHLhJ3AsflE=;
        b=ApjtF93pbhRUQbDmxlz2TmjHcgokSvGK6pXJ7el4HBXFAjzA6Fe/yJ9iPxzSEo08/4
         hd3LnZZveeiLOzLsLFdxSUUxXWAqC2RT8kc5laSmZe0FnM6tvzQ03MtgSyjFInrMxap+
         0xz6qrzCZs458RZVvWg+ysAIfzM8ppHRT6Svaj+wyhIAPmK5q/ccvAoBHO6EosBzxhuP
         wBKoJKQRid1FYCjBP7fX/IqUs4npbtslMay6RnzpIU3zSBc0mvhfBm5HJUa627ivIkUp
         JU7dhApJdZb2k6FCukw135kpxL4MV0epbhoT8T3c0ZjbSzfHb1ipKi5QKlRBoh53efEX
         tUoQ==
X-Forwarded-Encrypted: i=1; AL+hErGGyyZSVJn8uqloGwCFCtRztERrG+8Ou267PzMDN2ApuxTvq3+k3eY9YBAIt/fJKe8ruK4FCeZAe1fW6aY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QyeP43o2K5O2778DE7ayU+nY5ejC0tuQjiJ8TMyCLX2TQrJCK
	EerHw2UrqxmnnC/o6ZvhOeMLmrmeSJ60ArFTtOos6rENulj0daF865B41vh6nyUcrCgJC4P0z9s
	GCTiFQmvEOPuFUmomrfqfEGYe2w88gcMKeey3wFVAxKob5N9GDf66x9bUvQStr9lIuoaWXlEnQG
	g=
X-Gm-Gg: AYBFou1P1tYQwM06aXDd++lgnaZVd2EMyQZHSxKObZss61UG0fymD0fvXkVuT7kAqnk
	5YTHLBbgN/L0JmvPh8KvGsNKNxrE/h6Uco/94QpIohIiHq1l+q2aJU0gcFfj/DQq3QAw70zm+tt
	I8pN5ePfGuRfmDJK2OOzEXWpsLYsTSK8QsurgB4MA8p5m3exb+rwut0qVkzMKBqJHgQ8v9vCBdy
	gWl6AeyVFtOMiXJYYN6vGV6Ogt2gk3zXexCdd2JW34uoiW1MGDAgdTaU76JctCSa1OfIlhz6VFd
	QwLMzgVCI3KTl5S9DQllmZ2QwWbc/IG/wXzClHEkCvp7ap2u0+IXkqNJ1lhFhVrlyZ0CtGdI2tH
	xsTST5yhT1dzA8i/O7JphDUpzjoLkXXy1VbLr7Yrhuy0xbpbzIpfNSeeKtqQlBIeM2ra7H88dXs
	oDxv4d
X-Received: by 2002:a05:7300:b196:b0:36a:75aa:33bc with SMTP id 5a478bee46e88-372570dac20mr6107319eec.24.1794211898124;
        Mon, 09 Nov 2026 00:11:38 -0800 (PST)
X-Received: by 2002:a05:7300:b196:b0:36a:75aa:33bc with SMTP id 5a478bee46e88-372570dac20mr6107272eec.24.1794211897272;
        Mon, 09 Nov 2026 00:11:37 -0800 (PST)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265c0701csm11464358eec.13.2026.11.09.00.11.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 00:11:36 -0800 (PST)
Message-ID: <294563dc-1db3-43d0-8173-7941633bc659@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 13:41:30 +0530
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
 <187f3c63-5550-4a42-892e-ea660247edc9@oss.qualcomm.com>
 <CAFEp6-2nSM6zgyrgxwP=qrE3K7aXk9cSZmhdY2F9N4Zq8SV4Kw@mail.gmail.com>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <CAFEp6-2nSM6zgyrgxwP=qrE3K7aXk9cSZmhdY2F9N4Zq8SV4Kw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzMiBTYWx0ZWRfX1yg++yuiFKGM
 wrE7J6wCHC6iaBBRJjG/XOFnI9HQgX5lzdifA+UyGIvC3e2JjtFwAoSOutMR/78uZt9riTd5apY
 7TJIr+X54MUBQ8qIgALwJWdQjPIApz0=
X-Authority-Analysis: v=2.4 cv=LJzz05W9 c=1 sm=1 tr=0 ts=6af1803b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=DTeBQKu6t0G8_pDimUUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: vdae9REB_klPRIFNee6Lkfr-kOLXLVpq
X-Proofpoint-ORIG-GUID: vdae9REB_klPRIFNee6Lkfr-kOLXLVpq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzMiBTYWx0ZWRfX4KSsodk5KLS6
 IrtMKMYOeNCwGjcssPDBiL17yJ4ZaESVy2pq5DdGsFAs8DthcGzE/r8T7HfIwTeDvpNGzwmHfRy
 2KXOCN3bPkxPigMMMjt14eGS91iFa+2uefj4OR+lLgw0iM+8R5oGclgagE+6BBy/J45xoFbTSPx
 eUnJ8RthrnTzjjKvOzFOo1gyBV7m0LJ0MwgR04Qg8MsvCsq16rzfdDkvbr8saO2ttvIopKGmu0P
 AvnVP8VnB2bDWRoubvZdrXmHvMojotw3sz4/60Rx9vhc6W0JfgxB8OjmPHaaEaWfn5jZc7wwdJf
 rYBbTCCC5fDt9y0ABjrop7WVrI7mcb4tBk/6VNtaubx5ivbfIt7EZCJN+Flz4qrRx3PEzgrvzYw
 KijAmLbaG+KGZQDXEFcjjUXxtkHBaEkBmVRnxHt+EaN4wIq9NtON0S5czH8KUZ0kiemJvtIhKtU
 5PTiNkKg1kg4swgomTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090032


On 06-11-2026 01:59 pm, Loic Poulain wrote:
> On Fri, Nov 6, 2026 at 5:36 AM Vishnu Santhosh
> <vishnu.santhosh@oss.qualcomm.com> wrote:
>>
>> On 05-11-2026 07:51 pm, Loic Poulain wrote:
>>> On Thu, Nov 5, 2026 at 11:42 AM Vishnu Santhosh
>>> <vishnu.santhosh@oss.qualcomm.com> wrote:
>>>> Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
>>>> domain with restricted access to system memory. BAM-DMUX DMA mappings
>>>> and BAM descriptor FIFOs must therefore be constrained to a designated
>>>> memory region that can be shared with the modem. Accesses outside that
>>>> region can trigger an XPU violation.
>>>>
>>>> When qcom,vmid is present, require a restricted DMA pool and assign the
>>>> entire pool to both the local and remote execution environments before
>>>> requesting the DMA channels.
>>>>
>>>> This ensures that BAM-DMUX mappings are within the assigned region. When
>>>> the BAM DMA controller references the same pool, its descriptor FIFOs
>>>> are covered by the assignment as well.
>>>>
>>>> Track the assigned execution environments explicitly and reclaim the
>>>> pool for the local environment after DMA channels and mappings are
>>>> released during remove or probe error cleanup. Skip the reclaim and
>>>> leave the pool assigned if the remote side still holds its power vote,
>>>> since it may still access the pool.
>>>>
>>>> Fail probing when restricted DMA pool support is unavailable, when the
>>>> VMID property is malformed, when memory-region is missing, or when the
>>>> restricted DMA pool is not attached to the device.
>>>>
>>>> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>>>> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>>>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>>>> ---
>>>>    drivers/net/wwan/Kconfig         |   1 +
>>>>    drivers/net/wwan/qcom_bam_dmux.c | 108 ++++++++++++++++++++++++++++++++++++++-
>>>>    2 files changed, 107 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/net/wwan/Kconfig b/drivers/net/wwan/Kconfig
>>>> index 958dbc7347fa84ee869439bf8b503037faab8bef..1b133c56231615269698140187ca3141dfe48dbf 100644
>>>> --- a/drivers/net/wwan/Kconfig
>>>> +++ b/drivers/net/wwan/Kconfig
>>>> @@ -65,6 +65,7 @@ config MHI_WWAN_MBIM
>>>>    config QCOM_BAM_DMUX
>>>>           tristate "Qualcomm BAM-DMUX WWAN network driver"
>>>>           depends on (DMA_ENGINE && PM && QCOM_SMEM_STATE) || COMPILE_TEST
>>>> +       select QCOM_SCM
>>>>           help
>>>>             The BAM Data Multiplexer provides access to the network data channels
>>>>             of modems integrated into many older Qualcomm SoCs, e.g. Qualcomm
>>>> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam_dmux.c
>>>> index cc6ace8d64371eb8d00c638a39b234ee540b83c9..0e7ad62f8b4e059264e89837f296ee13c0c31c9b 100644
>>>> --- a/drivers/net/wwan/qcom_bam_dmux.c
>>>> +++ b/drivers/net/wwan/qcom_bam_dmux.c
>>>> @@ -9,14 +9,17 @@
>>>>    #include <linux/completion.h>
>>>>    #include <linux/dma-mapping.h>
>>>>    #include <linux/dmaengine.h>
>>>> +#include <linux/firmware/qcom/qcom_scm.h>
>>>>    #include <linux/if_arp.h>
>>>>    #include <linux/interrupt.h>
>>>>    #include <linux/module.h>
>>>>    #include <linux/netdevice.h>
>>>> +#include <linux/of_reserved_mem.h>
>>>>    #include <linux/platform_device.h>
>>>>    #include <linux/pm_runtime.h>
>>>>    #include <linux/soc/qcom/smem_state.h>
>>>>    #include <linux/spinlock.h>
>>>> +#include <linux/swiotlb.h>
>>>>    #include <linux/wait.h>
>>>>    #include <linux/workqueue.h>
>>>>    #include <net/pkt_sched.h>
>>>> @@ -75,6 +78,9 @@ struct bam_dmux {
>>>>           struct completion pc_ack_completion;
>>>>
>>>>           struct dma_chan *rx, *tx;
>>>> +       phys_addr_t dma_pool_base;
>>>> +       size_t dma_pool_size;
>>>> +       u64 dma_pool_perms;
>>>>           struct bam_dmux_skb_dma rx_skbs[BAM_DMUX_NUM_SKB];
>>>>           struct bam_dmux_skb_dma tx_skbs[BAM_DMUX_NUM_SKB];
>>>>           spinlock_t tx_lock; /* Protect tx_skbs, tx_next_skb */
>>>> @@ -762,6 +768,90 @@ static int __maybe_unused bam_dmux_runtime_resume(struct device *dev)
>>>>           return 0;
>>>>    }
>>>>
>>>> +static int bam_dmux_assign_dma_pool(struct bam_dmux *dmux)
>>>> +{
>>>> +       struct device *dev = dmux->dev;
>>>> +       struct device_node *rmem_np;
>>>> +       struct reserved_mem *rmem;
>>>> +       struct qcom_scm_vmperm dst[2];
>>>> +       u64 src = BIT_ULL(QCOM_SCM_VMID_HLOS);
>>>> +       u32 vmid;
>>>> +       int ret;
>>>> +
>>>> +       if (!of_property_present(dev->of_node, "qcom,vmid"))
>>>> +               return 0;
>>>> +
>>>> +       ret = of_property_read_u32(dev->of_node, "qcom,vmid", &vmid);
>>>> +       if (ret)
>>>> +               return dev_err_probe(dev, ret, "Failed to read qcom,vmid\n");
>>>> +       if (vmid == QCOM_SCM_VMID_HLOS || vmid >= BITS_PER_TYPE(u64))
>>>> +               return dev_err_probe(dev, -EINVAL, "Invalid qcom,vmid %u\n", vmid);
>>>> +
>>>> +       if (!IS_ENABLED(CONFIG_DMA_RESTRICTED_POOL))
>>>> +               return dev_err_probe(dev, -EOPNOTSUPP,
>>>> +                                    "qcom,vmid requires DMA_RESTRICTED_POOL\n");
>>>> +
>>>> +       rmem_np = of_parse_phandle(dev->of_node, "memory-region", 0);
>>>> +       if (!rmem_np)
>>>> +               return dev_err_probe(dev, -EINVAL,
>>>> +                                            "qcom,vmid requires memory-region\n");
>>>> +
>>>> +       rmem = of_reserved_mem_lookup(rmem_np);
>>>> +       of_node_put(rmem_np);
>>>> +       if (!rmem)
>>>> +               return dev_err_probe(dev, -EINVAL,
>>>> +                                            "Failed to look up restricted DMA pool\n");
>>>> +
>>>> +       if (!is_swiotlb_for_alloc(dev))
>>>> +               return dev_err_probe(dev, -EINVAL,
>>>> +                                    "Restricted DMA pool not attached\n");
>>>> +
>>>> +       if (!qcom_scm_is_available())
>>>> +               return -EPROBE_DEFER;
>>>> +
>>>> +       dst[0].vmid = QCOM_SCM_VMID_HLOS;
>>>> +       dst[0].perm = QCOM_SCM_PERM_RW;
>>>> +       dst[1].vmid = vmid;
>>>> +       dst[1].perm = QCOM_SCM_PERM_RW;
>>>> +
>>>> +       ret = qcom_scm_assign_mem(rmem->base, rmem->size, &src, dst,
>>>> +                                 ARRAY_SIZE(dst));
>>>> +       if (ret)
>>>> +               return dev_err_probe(dev, ret,
>>>> +                                    "SCM assign restricted DMA pool failed\n");
>>>> +
>>>> +       dmux->dma_pool_base = rmem->base;
>>>> +       dmux->dma_pool_size = rmem->size;
>>>> +       /* Track the destination VMIDs explicitly for the reclaim operation. */
>>>> +       dmux->dma_pool_perms = BIT_ULL(QCOM_SCM_VMID_HLOS) | BIT_ULL(vmid);
>>>> +
>>>> +       return 0;
>>>> +}
>>>> +
>>>> +static void bam_dmux_reclaim_dma_pool(struct bam_dmux *dmux)
>>>> +{
>>>> +       struct qcom_scm_vmperm hlos = {
>>>> +               .vmid = QCOM_SCM_VMID_HLOS,
>>>> +               .perm = QCOM_SCM_PERM_RW,
>>>> +       };
>>>> +       u64 src = dmux->dma_pool_perms;
>>>> +       int ret;
>>>> +
>>>> +       if (!dmux->dma_pool_perms)
>>>> +               return;
>>>> +
>>>> +       ret = qcom_scm_assign_mem(dmux->dma_pool_base, dmux->dma_pool_size, &src,
>>>> +                                 &hlos, 1);
>>>> +       if (ret) {
>>>> +               dev_err(dmux->dev, "SCM reclaim restricted DMA pool failed: %d\n", ret);
>>>> +               return;
>>>> +       }
>>>> +
>>>> +       dmux->dma_pool_perms = 0;
>>>> +}
>>>> +
>>>> +static void bam_dmux_remove(struct platform_device *pdev);
>>>> +
>>>>    static int bam_dmux_probe(struct platform_device *pdev)
>>>>    {
>>>>           struct device *dev = &pdev->dev;
>>>> @@ -796,6 +886,10 @@ static int bam_dmux_probe(struct platform_device *pdev)
>>>>                                        "Failed to get pc-ack state\n");
>>>>           dmux->pc_ack_mask = BIT(bit);
>>>>
>>>> +       ret = bam_dmux_assign_dma_pool(dmux);
>>>> +       if (ret)
>>>> +               return ret;
>>>> +
>>>>           init_waitqueue_head(&dmux->pc_wait);
>>>>           init_completion(&dmux->pc_ack_completion);
>>>>           complete_all(&dmux->pc_ack_completion);
>>>> @@ -829,8 +923,11 @@ static int bam_dmux_probe(struct platform_device *pdev)
>>>>
>>>>           ret = irq_get_irqchip_state(dmux->pc_irq, IRQCHIP_STATE_LINE_LEVEL,
>>>>                                       &dmux->pc_state);
>>>> -       if (ret)
>>>> -               goto err_disable_pm;
>>>> +       if (ret) {
>>>> +               /* The PC IRQ may already have powered up the RX path */
>>>> +               bam_dmux_remove(pdev);
>>> it's still unclear in the comment and commit message why we can't go
>>> with err_disable_pm?
>> Agreed. I plan to update the comment in the next revision to:
>>
>> /*
>>    * The PC IRQ is already enabled and may have powered up the RX
>>    * path. Use the full remove() teardown so that RX DMA is stopped
>>    * before the pool is reclaimed.
>>    */
>>
>> and add to the commit message:
>>
>> If probe fails after the PC IRQ has been requested, clean up through
>> bam_dmux_remove(), since the IRQ may already have powered up the RX
>> path, which must be torn down before the pool is reclaimed.
>>
>> Does this look fine to you?
> That looks good, yes. Also, could this be avoided by requesting the
> IRQ with IRQF_NO_AUTOEN and only enabling it at the end of the probe
> sequence?

Yes, that is simpler. The PC IRQ then cannot run before probe enables
it, so an irq_get_irqchip_state() failure can use err_disable_pm and
the remove() call and its forward declaration go away.

For v6:

ret = devm_request_threaded_irq(dev, dmux->pc_irq, NULL,
            bam_dmux_pc_irq,
            IRQF_ONESHOT | IRQF_NO_AUTOEN,
            NULL, dmux);

if (ret)
     goto err_disable_pm;

[...]

enable_irq(dmux->pc_irq);

return 0;

Does this look fine?


Thanks,
Vishnu

>>>> +               return ret;
>>>> +       }
>>>>
>>>>           /* Check if remote finished initialization before us */
>>>>           if (dmux->pc_state) {
>>>> @@ -845,6 +942,7 @@ static int bam_dmux_probe(struct platform_device *pdev)
>>>>    err_disable_pm:
>>>>           pm_runtime_disable(dev);
>>>>           pm_runtime_dont_use_autosuspend(dev);
>>>> +       bam_dmux_reclaim_dma_pool(dmux);
>>>>           return ret;
>>>>    }
>>>>
>>>> @@ -879,6 +977,12 @@ static void bam_dmux_remove(struct platform_device *pdev)
>>>>           disable_irq(dmux->pc_irq);
>>>>           bam_dmux_power_off(dmux);
>>>>           bam_dmux_free_skbs(dmux->tx_skbs, DMA_TO_DEVICE);
>>>> +
>>>> +       /* The remote side may still access the pool if it holds its power vote */
>>>> +       if (!dmux->pc_state)
>>>> +               bam_dmux_reclaim_dma_pool(dmux);
>>>> +       else if (dmux->dma_pool_perms)
>>>> +               dev_warn(dev, "Leaving restricted DMA pool assigned to remote\n");
>>>>    }
>>>>
>>>>    static const struct dev_pm_ops bam_dmux_pm_ops = {
>>>>
>>>> --
>>>> 2.34.1
>>>>
