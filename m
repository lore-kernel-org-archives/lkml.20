Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF2F4A64CC
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790269041; cv=none; b=cQOOV6TGVxXUyJFMKZk5KxqIDDSXaxHzg/sPFrU5XUcptKNxsCMc10QX6Uh+EuLrbbbce3vF35D5ZMpdP28qxeLtqoGVpMN8mG5uFGyb2SA5cqe+Yrig/fH3soo0ZSDilhko8MlOfIH3VqZTh2duWH4Ea4Xy90UsD6cK0J+EjGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790269041; c=relaxed/simple;
	bh=Hzsp1UFzoC59Md1gxeOIU+2qNTd46IkSWC0K1qbvf6w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s9oEORD/uI2exqxe35eRqbwHlsDzg3OPAy2OVrPdPUKYmqJ/kfIkQp0F3TH3p67+UxoF1HsjZIZkuu+dLFq5DJq3SBjwQFwISk0BAfDoSG68BsGDAQARJ8TcvSK8ELYroOiGuGFzuWLkfary7+VcSxlmcYNVXny3z8egOrRN+R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pMi043bE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ph17ss3l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pMi043bE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ph17ss3l"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OFfLHP1279113
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M8tOw3w9WOlBwac6L5boAJMWocybycmH2cMyGQykxKE=; b=pMi043bE6QGr1lII
	pZb0IyUUMlzTpHxw6zL3pxwMkGK8zJVP5wf0pJMCdoiBDmqx+axCDSvvbSt23IG+
	BXfrMC1Wk6A8fjtC5jzeO6bz4MdM8/VtpzpX5o5gQfB8x/IaQ8q666ePw+XLT9jY
	hN4i54agbS8Ri8oQRajPAwr8WtpfK2LI6h4DcFh427uEJSvVII/M1WCRWYDpOEF/
	B+o+xUmeg8peBe8ZjmHPFWGCZMUcUluWBmV5cZiAO5OaeKNYVATURT3c9sJwbHjx
	sxtv395HGmucKB5F44AWHi/W2FjQSSkoJZWovi/F9mNyWsryNblI5zIHqqEqpQPI
	dx6LCw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1sc9rjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:57:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39512608fb1so134474a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790269038; x=1790873838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=M8tOw3w9WOlBwac6L5boAJMWocybycmH2cMyGQykxKE=;
        b=Ph17ss3lkX/8NihAbleoSbEuAxEczN7Fdama9tZtl10UoHU5rHGc5ofOc9z+L1wssO
         s6OH2W/Nje/Er57hCSkPiWPPmmhiuxVsUHwYMrLjx9QJcVQ90fTKUX1M3ha4FtPwtO0Y
         rmVq3ZLo/mCB6/QnMb/6v7yysf99JIlLG2exSwkBHbkX1CulWh6YWABiPE9T7dueikIT
         HD+J2vhemAWlUvSVrI9uGdO31hwoY2L03I0iKtFGOsio3ORHw6Q0hpYD6adIsENMEwpm
         Mcf6Wmpnlbgu2JAVa82HyqqwdhFHX1QDjli6neGQNDyzxFNTyA3fpAIL8Yp3k8NHAN1N
         iBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790269038; x=1790873838;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M8tOw3w9WOlBwac6L5boAJMWocybycmH2cMyGQykxKE=;
        b=tNnHTaETEzbq7cZi0Vx1o5kyDP6qurejDtiwL7TzoeB8C4V0TkiLV9IP5GK27//vzd
         h4yUT4i00YlAmxVmeCupxZUJ3txaEQSg8N6CIac5VeRIuIycIsaIIQolRalzQLCr1aUm
         x4zEWNfBuRBcBQsMzEWSoDJZVTP5xcdAKxDKOGTaYrvvFnlxxAvkUcJGZfs9VhHcKnAV
         uDP7wywfFMF6otWqu4YyeVK+oeBstC3Re4JvDFjU99WIG/VBcrM4GUFNjq7do/1VpmkX
         zGcYDTzm3DPshPqZdCDwMX7OmSGFUMm889WOTYdmkNqjktPcrxVlhhGztV4rpd9b8yKE
         mNXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxaAzHExtwLMa8GOJPXwtaUQJg+AKB1v36+JrRi2jiYr1PdO7KecjXhMRB3Xfrxn6uJnQhVmdx64sHxVR0=@vger.kernel.org
X-Gm-Message-State: AFuF++l2nyXdXW7AJJ+8Wo6XZlgg6v7hnp7S8a7WrLSV7kH7Pl0nMkym
	UyNgmmNauIE0C46pTR1v22mgKv5mPa4NftDqJO3zZug5ThOng0NEFBs5kdsbhMel9XhVZVo7uYA
	3/THESZYtJdeftLoRlVvN7SnD2SO3J7NZGRHNbVnOFxVcdhEkdQx5RMfuIinIroh9Ouw=
X-Gm-Gg: AYBFou1ZaYWPHf530MOI58mBGsGxw402hWdq4vjQEVCHz78w/W4GS+7eRbCINXg55Oe
	8snPO6v8F4o1ckPeAFsx0TC6+5cc6OeWJL3KTDrl2cmovDRDILezvMFFOvROwE/0EVTIgj/5jWM
	WVh4iqojz5B75o5te0aegvabyp9RBCv7c86NjttJDbE+ddjSQmnmdwMmI5zkmG14pRoycMQkjA3
	l7jj2HjvvDmWUI+bS7XBubHmW349YHv1TYzZZDszMFhSvEBEGAUF5ceOhclHAyHsEyfBjgbVc85
	TriqcbJIOpdiX3zWofDI5BAL+4R+i8VHBhMzA6HmokYOVR3J1HlS1EyanpFhYlFFPyM+S78wtLj
	meCfxKC7yGsir8X95tVhgvaHZAyaHRukOrwaoSYcCi4hx1QbCcDjVuA==
X-Received: by 2002:a17:90b:3c0f:b0:39d:eda9:febf with SMTP id 98e67ed59e1d1-3a098da4171mr3197735a91.18.1790269038443;
        Thu, 24 Sep 2026 09:57:18 -0700 (PDT)
X-Received: by 2002:a17:90b:3c0f:b0:39d:eda9:febf with SMTP id 98e67ed59e1d1-3a098da4171mr3197707a91.18.1790269037987;
        Thu, 24 Sep 2026 09:57:17 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm5687417a91.13.2026.09.24.09.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:57:17 -0700 (PDT)
Date: Thu, 24 Sep 2026 09:57:12 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
        will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
        aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
        joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
        linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
        sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
        WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
        sudeep.holla@arm.com
Subject: Re: [PATCH v19 1/7] firmware: arm_rmm: Add SMC definitions for
 calling the RMM
Message-ID: <20260924095712.00004057@oss.qualcomm.com>
In-Reply-To: <20260924135201.850038-2-suzuki.poulose@arm.com>
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
	<20260924135201.850038-2-suzuki.poulose@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AhxkVtHd3UaAv-vIA5tOwIhcm5ifg6v2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA2OSBTYWx0ZWRfXwg2lGoUVFXi8
 2fjlWKqTNoxZ4yJ+LY30S9ugFl+GzYBD0CdCeSl6E+8blhUdl6xzwhqsthxpXmNItMwbMSR5xPO
 M9xN8nhZZFA1E6YTtsNFKPKqkO/l7RFkILq9BxaksFz4XQ2uLsolhPIRWOyhNm6WCCHeSPcIjDg
 /1NDiXAKBO2FB2/CZvZTZljA69ULZPFaz3MChJneNH0Wwq2zk0FEt+ASl2km69E1TPP7fRG8IEk
 GpnZc/841DRMhdVaYNX2V55rijnyDYTP+VyC0Xohm2Tw7YczQWHYUDzds2COjtJ54YxkUVgVZNE
 rKzYh8Jyb+7UKFVsvhYTuUQ/nPgIg0X7Ac1BQPtOsNz6KgzTyDPULeWcwOP87ZPpkswIIZoGNvm
 DzoexhgYPkAjGY3wscKLM+MqYjKQEehN6k9xz3YbzCFVY/6ab2dzH7sQ9m9lEQfwu334OEdNLK6
 neidyRvnXHdNgxhOriQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA2OSBTYWx0ZWRfX9bnsrc2BQ2U/
 EyMsYFR/jKcIrWydwaiLmHPjKCrjpOQUoxDO80Sv+pO4LPYGTAi+mSx8QHUVhO7icdCflxNlsfM
 h030OI0YrfemPnO6Q74iPV/LII5kd5A=
X-Proofpoint-ORIG-GUID: AhxkVtHd3UaAv-vIA5tOwIhcm5ifg6v2
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab5566f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=SeLr52ClSpxFPvFle8UA:9 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240069

On Thu, 24 Sep 2026 14:51:55 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> From: Steven Price <steven.price@arm.com>
> 
> The RMM (Realm Management Monitor) provides functionality that can be
> accessed by SMC calls from the host.
> 
> The SMC definitions are based on DEN0137[1] version 2.0-bet3
> 
> [1] https://developer.arm.com/documentation/den0137/2-0bet3/
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Hi Suzuki,

One small thing I didn't really care about but where I thought you
said you were going to tweak things.

Either way
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> +struct rec_exit {
> +	union { /* 0x000 */
> +		u8 exit_reason;
> +		u8 padding0[0x100];
> +	};
> +	union { /* 0x100 */
> +		struct {
> +			u64 esr;
> +			u64 far;
> +			u64 hpfar;
> +			u64 rtt_tree;
> +		};
> +		u8 padding1[0x100];
> +	};
> +	union { /* 0x200 */
> +		u64 gprs[REC_RUN_GPRS];
> +		u8 padding2[0x100];
> +	};
> +	union { /* 0x300 */
> +		u8 padding3[0x100];

I thought plan was to fold into the padding above?

https://lore.kernel.org/all/d7ccaf22-5bde-4344-8bf0-a5a17dcac0f3@arm.com/

> +	};
> +	union { /* 0x400 */
> +		struct {
> +			u64 cntp_ctl;
> +			u64 cntp_cval;
> +			u64 cntv_ctl;
> +			u64 cntv_cval;
> +		};
> +		u8 padding4[0x100];
> +	};


