Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978103BA225
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789536624; cv=none; b=AtHk89tqqk39Cdf4MDZNzCJfB6VbKI1txiBzqQaJyyHs0wwo0eiNW8l5uGyQuzvmkoxl0U9b6JzKB1AwkrRdiLMugfwZu4Z0x8m+2aQG262mby8kH6jutaDckLsT7Sj3PRrzrlWu3xwWkK49cCYWdzW6EzPBv0DzHkscUpFVY68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789536624; c=relaxed/simple;
	bh=W+a/JDOjoaE1hUAH1acBJLP7pSsGB05GfTnuEehx8/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gYOAECSg9rEIR9ehNW1GstLKHHSSL8iIxRZaag7D9MIZCqlpxFVE46O+Br5Sgl0sN0uo6szwU0pwY6ZZdHdzNT7H7U/3/eYzMRED5JWri/4ck/6EQ5NpJbiLa/vKK4ZfGolmi/HhpIrhkFVj8jtsheMLUBUy4PH8XVk5NgfBJA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UYrXbv/V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VTMTSbe+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UYrXbv/V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VTMTSbe+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FNZLj61408771
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PeWBUFQKpi9k7BVFmzgyqFxO12My8fWkOb1uwjidszI=; b=UYrXbv/VQwW3H57t
	Z0UA/w7bnzdwE+dSanmAzsdRk6gI/sj++H+ff/fO+Q9t7k2dHX8ErySsMR/cjeqj
	l+/Za20c21hYA/wfmv93J2ezDeIYAwmDKRlgOhe6F7ofLpdRItYwUuja43nD3qn4
	QMy3qBmPT+SYvdotWXdNsjSPEF5e8zujzBlTA+u7OGgjGAnG4fWgPM76B6Z4CkfT
	zqhtTcqmvLvb/7iptDndqOl8lyC4qQHLaHNSCKRfQpKV3ed9fO1OmvVUZAqxMgVV
	913Y3Rhehxxm4XZXl4d+tGPrrR5ROnpYYFlF5b1CNfBV6tC/wMiyAxJHUvmVa6/+
	r0UoLA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqftuh2ku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:30:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39deda201bcso4268483a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789536620; x=1790141420; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PeWBUFQKpi9k7BVFmzgyqFxO12My8fWkOb1uwjidszI=;
        b=VTMTSbe+CfSpYAYUUy9nwg7bY4G/kPDdRQ1Z4p1fxiZhQyXeRD4bEyh0qbgC7LW5BK
         7NQuTnLQkDEBjTJHZLRNzuJN42uFbm+8G3eQ7jcFuN7FkM3C4DRBuC0y//dtQ7ldlWd2
         DhOhSslQvFrlRg5LmzTDRizTkD5BebTDE3feNv5L7NMwhmYkSOprDHOm5kKAHPQ0Ik1D
         yYijh7fKMPRMG5s/xC7gHXklHisZPCDNTh6FckScAWJNnHAJNM7TBfJ23qNsRBweu6m7
         p1FDNA3ccLj2obRbW8sWoKk1OLZbxy6GiyS4UV4a1eJy7sgbrU++ShN+l0+c6vN+FKmQ
         yH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789536620; x=1790141420;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PeWBUFQKpi9k7BVFmzgyqFxO12My8fWkOb1uwjidszI=;
        b=Xfw6XKnEyi+89KkdPRGEz1dE7pepVe4rRkC3hsp2Bsro2npPF1EykFjado4kIxmrw1
         8H7l4d7dHMO4av13UZQETvPTiWEETMBKyuaut1Mc9kuhBwALRiPXY+TN3waxyZjtHE/P
         +8ynore0nRg5XBcsLP4nS1yjkn+IIxBpmGG85stUIxgaOuC8frX3t6hc6uOkr26aVGZ3
         lkEpzNcUB6efRXPtSZQGGNkFwM9TWJO73fPNYq2pGOiM1hDM0fStBwTvFqhS2O/7RWnH
         ZO59uHlh37Bm+F67rGuUJbGpqCl4kie/O8DyU5UZRTGUuN4r2EIue4y+IygVx9UArrbt
         dybg==
X-Forwarded-Encrypted: i=1; AKwUvBzXiFq4/prZthrwg429xAWpBrDufHNc2k2mjIlYSO1HrgANEmOFSnX1PqoElZdYNni3DJt1GUA2aMhEF+w=@vger.kernel.org
X-Gm-Message-State: AFuF++mNpSUakHXTJidBzA967UKBDPv3wl3XR8ov2twUWOSUGTNY0QQ9
	ZtktnQpM+7Rgtuo2tCvuptu4hSS5ar+icAsjuQ2xIIYdDeFATE/lVPXh6aNcPhjEUrFWVWHBIgU
	Chtc41Zqx4bzkWzCUHUtoWI2rVkojy/I2mgk4hQ2HLw9saIYFc+e7qUBp9ss6r5+Z1ck=
X-Gm-Gg: AYBFou2eOgEucbWxJxqppuxqXthCRJLFe7JMUqgrZQadx6lYB2sP2fupoY7TLwhuG0t
	aruowFngnwWJoozEwky/gedTN5LT8Gb1jjpg7jMsyJbvaC8c6npSiNRAMr7J3B37Qh+iz1IBtB2
	wvtEMhlpLADIbXPD6RCz2TOe8j3B/tElqW5VuCELQtySYE7MO91PEXFzZWYqeoVm7GyKOu2BMgF
	j0TzNro+uAEM+hwfxmD0nZS3oqRaqwEJ1IRxsTcLmrQOrLUBud6OoqIWPfAty+eF/6kKsZKIfkO
	EfWeJ5SV8poBPcP3XFG2GQitfP7gmBXuynfFL+euOOBh4+3OGKWyZeVP90cTmFC/cRnEzwE3HmN
	EA8amukLUYAcK3S8IjvvOsQtwDr1IllTO0Gibgw==
X-Received: by 2002:a17:90b:224b:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39e1e4246f7mr3005302a91.13.1789536620509;
        Tue, 15 Sep 2026 22:30:20 -0700 (PDT)
X-Received: by 2002:a17:90b:224b:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39e1e4246f7mr3005220a91.13.1789536619995;
        Tue, 15 Sep 2026 22:30:19 -0700 (PDT)
Received: from [192.168.86.250] ([76.176.48.107])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d13ee7sm3425309c88.8.2026.09.15.22.30.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 22:30:19 -0700 (PDT)
Message-ID: <a9d9aac7-cb2d-46fe-a220-40f61f615b89@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 22:30:17 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/5] optee: riscv: add RPMI TEE service group
 transport
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org
References: <20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com>
 <20260912-rpmi-tee-service-grp-dev-v1-1-1d1d35c2a859@oss.qualcomm.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <20260912-rpmi-tee-service-grp-dev-v1-1-1d1d35c2a859@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA2OCBTYWx0ZWRfX+BJqAYacMMWR
 x/VGXOQ0x0DYg011XIUzF1hexs7jeSpVhWvpNyhBKp7lLqH0FWM8t/mbhjaYstnHnVIQI7esAYN
 Oe3P1xbOXQSZxgzBkeSi4dJnplFLbbqfygbe4QLZSjf4tSeaLCd5moMchRA4q74Uu379kUFDtzw
 NHIOxHSH1SY7AVWOxhv1gazf/7Pj0MDj+dSQjZu1348b5K8TxAwvhymzaZmI5EHwqDsssK3iQMi
 OvR3y7vWVxqgrXRUPqUiwYAsI/E+LeTQv33F8a2F6uLFaVAyuF5QMv/NCqIrS1mT5Barfkpa4BI
 lf2BDfJGvE7fBrT2oBvTPENpfqI631/TvA5mDtdnUwMoeedm3CofhmLhY75KT5eVtKTlV/4oRI9
 JMCD1QA1+kc8EHU+1i/X/5O96i8vttILI4wnK8S//Xzsf87sk1rvwGcCpMH3PLYd72SAHVzes9Y
 4sgmJ1hli9qWPwU2gfQ==
X-Authority-Analysis: v=2.4 cv=a5ulZkSF c=1 sm=1 tr=0 ts=6aaa296d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=v3eslg5cZyQnhgVqE9oA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA2OCBTYWx0ZWRfX4MS8HDVy0jtg
 Si80iQEIfUBc5/aH8gCFHx2CBbdNF/GoisJKUDBL/roeHV/6dr5HbRjLEqqlwgYnnYdRZg0ODWf
 g4gLpSmtxjAcx7Ll2GAYraqcCRUGUe8=
X-Proofpoint-GUID: nM-_204BX3pBlrVwBTA5kqjO00EBmOZ4
X-Proofpoint-ORIG-GUID: nM-_204BX3pBlrVwBTA5kqjO00EBmOZ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160068

On 9/12/2026 3:15 AM, Amirreza Zarrabi wrote:
> Add an OP-TEE transport for RISC-V using the RPMI TEE service group over
> the SBI MPXY mailbox framework.
> 
> Request one mailbox channel per hart and use the channel corresponding to
> the current CPU when issuing a TEE request. Probe the RPMI TEE service
> group and required memory-sharing capabilities before registering the
> transport.
> 
> This provides the basic transport and discovery support needed by the
> following patches.
> 
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
>  drivers/tee/optee/Makefile                 |   1 +
>  drivers/tee/optee/core.c                   |   8 +-
>  drivers/tee/optee/optee_private.h          |  34 ++++
>  drivers/tee/optee/optee_riscv.c            | 312 +++++++++++++++++++++++++++++
>  drivers/tee/optee/optee_riscv.h            | 141 +++++++++++++
>  include/linux/mailbox/riscv-rpmi-message.h |   1 +
>  6 files changed, 495 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tee/optee/Makefile b/drivers/tee/optee/Makefile
> index ad7049c1c107..925b8ec7ef68 100644
> --- a/drivers/tee/optee/Makefile
> +++ b/drivers/tee/optee/Makefile
> @@ -9,6 +9,7 @@ optee-objs += supp.o
>  optee-objs += device.o
>  optee-objs += smc_abi.o
>  optee-objs += ffa_abi.o
> +optee-$(CONFIG_RISCV_SBI_MPXY_MBOX) += optee_riscv.o
>  
>  # for tracing framework to find optee_trace.h
>  CFLAGS_smc_abi.o := -I$(src)
> diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
> index a52c1f498b99..63f1725e646e 100644
> --- a/drivers/tee/optee/core.c
> +++ b/drivers/tee/optee/core.c
> @@ -220,6 +220,7 @@ void optee_remove_common(struct optee *optee)
>  
>  static int smc_abi_rc;
>  static int ffa_abi_rc;
> +static int riscv_abi_rc;
>  static bool intf_is_regged;
>  
>  static int __init optee_core_init(void)
> @@ -245,9 +246,10 @@ static int __init optee_core_init(void)
>  
>  	smc_abi_rc = optee_smc_abi_register();
>  	ffa_abi_rc = optee_ffa_abi_register();
> +	riscv_abi_rc = optee_riscv_abi_register();

Isn't it growing rapidly now? We have two register calls for the ARM,
one for the RISC-V. One more region specific ISA I am aware of and it
may have op-tee support in future? It is time we fix this logic
in the better way. 
 

>  
> -	/* If both failed there's no point with this module */
> -	if (smc_abi_rc && ffa_abi_rc) {
> +	/* If all failed there's no point with this module */
> +	if (smc_abi_rc && ffa_abi_rc && riscv_abi_rc) {

This is started looking ugly in my opinion. 

>  		if (IS_REACHABLE(CONFIG_RPMB)) {
>  			rpmb_interface_unregister(&rpmb_class_intf);
>  			intf_is_regged = false;
> @@ -270,6 +272,8 @@ static void __exit optee_core_exit(void)
>  		optee_smc_abi_unregister();
>  	if (!ffa_abi_rc)
>  		optee_ffa_abi_unregister();
> +	if (!riscv_abi_rc)
> +		optee_riscv_abi_unregister();
>  }
>  module_exit(optee_core_exit);
>  
> diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
> index aefe1e6f5689..8d22d65e087b 100644
> --- a/drivers/tee/optee/optee_private.h
> +++ b/drivers/tee/optee/optee_private.h
> @@ -171,6 +171,31 @@ struct optee_ffa {
>  	struct work_struct notif_work;
>  };
>  
> +/**
> + * struct optee_riscv - RPMI TEE communication struct

do we need to name it optee_riscv? we don't use optee_arm anywhere in this
code I believe. 

More later...

