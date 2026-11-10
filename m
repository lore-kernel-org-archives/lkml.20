Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794352455;
	b=H33paR5lVELZ9+kTGUxny1wegJ69Vbn6krXKlH0if2H0GbXrpINyPmPHwLRc+AgRPgle
	 xBGcWgYLxzdQRBd1YNtTldkN+QIRDjZXblwbBpl2lYZbpxIdg7mUVfYRHpvP1o76PoaiO
	 D9+CJLs/QgKEC86hDr/Tpprjwf9UqZ8l+hEo99DELNhIrdZFh8nReZm82vvDrGB6FkY5a
	 TIyaUsPOeJ6TakyNDB6vcMZ7bdgsDWYqnrEX72qbuEGlNcBv8HHmuiQ5FWUzhq0Q9CW7O
	 KxiRjBU40HQxpaZQ31pQwUH2Ny5f6STEmbagCoIFkAUUjcB44HUyQ7V/pKiAgWZ2hPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794352455;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4Xpscwyy3jFhQfYrCqIDewqcILIH2yywXOfnayr7y/Q=;
	b=kg49KeILLBX0G6qOGV9sKbMcaFmcGbvYeOFY8s7G9PrOIS/Na00KP9V6T+hjOuoRcwPy
	 NUM5FrSagiEsvdaW+/jrUIrg4f0j1LrlvdK95rdiWeq7rXq1UAicwmtunWfdbofyN6ktI
	 LNun/0jbPZdw4HpQFUfAR1ZT72H7Hxs1HbgJwYIPHmEXziam1ctMK6PDe/vplygaI0itw
	 UsHcZtEchOwQ7ulqHOd+/mCCqLxFaaZxm/oelWT7yWu1UMAKhSfiYJUsh4bqRTj7TOsYW
	 4nFCrEa63nxy6hKzipJvECdKz13txU+uyy9COc5ILpsCLz5tJRHF/G3wqSepm88ZExw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pg+rAz5n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HbCJyZAO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C454606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C454606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pg+rAz5n;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HbCJyZAO
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMKfxa486484
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Xpscwyy3jFhQfYrCqIDewqcILIH2yywXOfnayr7y/Q=; b=pg+rAz5niP/2exc5
	mmAqnWelZCxUE3DBGcXTX6EVbGMLGuESy8uaJgx+lHzThpBSRau6OQyon1EMXycD
	udel624sixOUdWNg0uBOyMtSEx2Nv+HNd72dxKdA4/wCgjGuD07G+WR3JT4Hxr53
	kKokAUEB84+QcitMbyGAs63fxc/tji9cxc5xDzjTJ5mOA4qMniP89Aauj2DIhFG0
	ePoh6eBPxMXL4SjNjSvk4tMuyPrUD1gk03Ov3MsZANm4LMO3nOeaazXB9tackSm7
	V656QbeY22V1reYdpD11W5klNuwk66jlKkOYfnL3u0p7QWIs0SZDrKQCr4uELWio
	HH4mlg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huvtdc7st-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:14:13 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36efb506f29so3588103eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794352453; x=1794957253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4Xpscwyy3jFhQfYrCqIDewqcILIH2yywXOfnayr7y/Q=;
        b=HbCJyZAOzGB26wi0Yefw3YX+qMZxioxDZ9e/4Z3dcHFJDtV4v3OMdI3eLAY2oim3TQ
         tNcbxFQL4q+RwIjKASEiMQhQWiKZeV8HMbhe7WytuDuZkv2ymIaLtESCcKtgpt7vNKaJ
         B+rhJHOyhAzebbf6iWegu8hpurutWOZ8WMXTska4vANFBVlknvWzS3rAnQCoAn7B+ja7
         I9rSTu4AE3KsiDQ1jp1My9TBpRVi3/GdRu8DRD69nBK7WvYSpMlGyoT6YCbe491zrhyu
         c0TlceAtl9RP1bGNyOsk30up4n5JUsNbYW/K+AdGTatvqX8e64kZp24jINBp4PyggTAf
         bjKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794352453; x=1794957253;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Xpscwyy3jFhQfYrCqIDewqcILIH2yywXOfnayr7y/Q=;
        b=xF2tz28qSdcgVpQZRW5ZkdYU/+nmNVNiz6aYWAyJ7fzYMhPJJUQr8C8zjPSFVxglXC
         h7bUVpPzJPgtfCrJ3HGaYW/dxZLLL/A/RHJq3EZ+hjVuyK8RciT3cmWUFt54a+LpVudI
         iOXEIZRWDVWjVikY29vX77uFXx1sQqQcp5iYRNqDI5ETKn5x7axEk+MD7pS6EuiSUpzx
         bOJoqEFo+/jrfI71J3FQgJg8HpAhEQjmxx1d+aEeWUwryqlCqqtAleRINYBTF6sEzrjl
         7YT6vCbR6q0jBzRzVCtei5gGOxHivqZNAfj+V16eAbojtxskQhQ1msbaXI1vB1rxRHR3
         UAXw==
X-Gm-Message-State: APuU4Z97aYMj48ZnUCThalmb7D4QIE9E38gv/Ep5U8iInxoqmeGXjnrg
	bq1raHX8KTJP6OnnWZa5MULdIEEd3BPnkbdAFKboBlraRBMpe9lDV5b287dLPUhqNPi79a6kbxG
	pHQHNcI912od2B9BQFmGrDXEr2ggnkmSZOSvjsqmJG5ImS7gKSqTyBnRaPgMYi0xOjxc=
X-Gm-Gg: AYBFou3cTC6NlqIpUVocvnoATUNb600E+NIROpwoAW2gsQZwLJEEHvnKKc94rFvvPMY
	lts1q4ZFHiuz/BWyU1Zm6HfI8Pc2/kCS4qBq/vclwRGFu5BKnEP6PFSWqjG9W87pVYuFx7MH0Mm
	J8c+P6FB5b3KF2XAuHJ0tixGXSwPeueKWcvVlDCdFcjCOExf16yF2D+RU6VXi906CzhsWnruAhz
	nWqoaOtUgHyRcBvinoZJM4Y21rvZbOsYbn+nuW6NTVwAdcrNdJs+3OreP85GhSslb1C3vjfNcYN
	TUApQnSkg6yTvVh7kxQ64NJvizDBwrh8Ed/M6YPoC/9JOS7xhs1gjWLj9YPlTSTWmRMR5wNpkyD
	1sBRDnllKpUhoy+65srida8Jrs0lyMCSMCP8E7AOn2FDdMOvknOg8zRJ0Arnme8oqL18Pw9QM+I
	Rn3eamlSWTl8m7oTwJGyKlwnvap7A=
X-Received: by 2002:a05:7300:f78e:b0:36a:12bb:7f8e with SMTP id 5a478bee46e88-37685d7279dmr1026977eec.13.1794352452909;
        Tue, 10 Nov 2026 15:14:12 -0800 (PST)
X-Received: by 2002:a05:7300:f78e:b0:36a:12bb:7f8e with SMTP id 5a478bee46e88-37685d7279dmr1026919eec.13.1794352452279;
        Tue, 10 Nov 2026 15:14:12 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306e3sm10490952eec.7.2026.11.10.15.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:14:11 -0800 (PST)
Date: Tue, 10 Nov 2026 15:13:49 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 29/35] uapi: Add ARM SCMI Telemetry definitions
Message-ID: <20261110151349.00005df7@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-30-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-30-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Onwj1ee4afEjkIvI1n-JNgNMIE2RtwVM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA5MiBTYWx0ZWRfX++UW/4xPrUqp
 M1gDY0YpstLJk9UCMxOQtIIiN81TNir+xY5IS3dFqPpiHJDFA6IKe372uGS/Jm8db2yQHkJSxak
 6tnWpOMFXcSMrBH75vgJhyoTV41OwHc=
X-Proofpoint-ORIG-GUID: Onwj1ee4afEjkIvI1n-JNgNMIE2RtwVM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA5MiBTYWx0ZWRfXx0Vjhtn0lJtd
 g/F6l37uIcUKwb1PjRnqjAhTDC8vJhIZPQQe7mxmjgjogsWSdyofM3c9C05CtL0yXF5qc8SVtdF
 U8wEI27ZDuIfOjKmaKYeUkc+BCVVb/tSuZgLx57dqxb0i9axpcDwuN2TVEr+L8IaVen4z6NzPpN
 SVP2YMOKt9qXZQmLANXxZ/MR/figZheJpnsYKQD11o+x3IBcC163nyABU0R7Iyl6Kw5bJnUK2LK
 cU2Pt6lOL/NGzS7NgIusEhFDXZplEg46WRH/rViV673kDJkpqS4leDson4UHmY2jIQi180TjijO
 N0laQxSqEOFVhZvASaWUJWfxEzyH6vzMcmKT5GNt6/6jedjnPD7mzBymSiLdio8in3vUa63PWSd
 VRmP5sneay9vIZNLektatT7Ud7f2PcUqRSiaveQ7s6D/AHdLvXeUPBouo5HpUPhN6WOgNGuY4KK
 hf89NQb1cbSKrcU5dyw==
X-Authority-Analysis: v=2.4 cv=ArR7T+9P c=1 sm=1 tr=0 ts=6af3a545 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=XiCDCQztHa5vJwnvm_YA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100092

On Mon,  9 Nov 2026 09:12:15 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add a number of structures and ioctls definitions used by the ARM
> SCMI Telemetry protocol.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---

> ---


> diff --git a/include/uapi/linux/scmi.h b/include/uapi/linux/scmi.h
> new file mode 100644
> index 000000000000..dd78220554a2
> --- /dev/null
> +++ b/include/uapi/linux/scmi.h
> @@ -0,0 +1,531 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * Copyright (C) 2026 ARM Ltd.
> + */
> +#ifndef _UAPI_LINUX_SCMI_H
> +#define _UAPI_LINUX_SCMI_H
> +
> +/*
> + * Userspace interface SCMI Telemetry
> + */
> +
> +#include <linux/ioctl.h>
> +#include <linux/types.h>
> +
> +#define SCMI_TLM_ABI_VERSION_V1			1
> +#define SCMI_TLM_CURRENT_ABI_VERSION		SCMI_TLM_ABI_VERSION_V1
> +#define SCMI_TLM_DE_IMPL_UUID_SZ		16
> +
> +#define SCMI_TLM_SHMTI_ID_INVALID		0xFFFFFFFF
> +
> +/**
> + * struct scmi_tlm_abi_info - Basic information on the ABI/instance
> + *
> + * SCMI Telemetry characteristics like number of DEs, Groups, Intervals and
> + * SHMTIs are statically determined by the platform and do not change within
> + * one boot/session; they are reported here so that they can be used to properly
> + * size the requests on other IOCTLs, without having to discover dynamically
> + * those sizes by issuing a zero-sized IOCTL request at first.
> + *
> + * @size: sizeof this structure - IN
> + * @abi_version: ABI Version - OUT

I'm curious what the plan is for ABI versioning.  Normally to have
any hope of backwards compatibility it needs to be a negotiation between
userspace and kernel (and then hardware if appropriate). Is there any route
to do that?

> + * @abi_features: ABI capabilities bitmap - OUT
> + * @primary_de_impl_version: SCMI Telemetry DE implementation revision - OUT
> + * @num_des: Number of defined DEs - OUT
> + * @num_groups: Number of defined DEs groups - OUT
> + * @num_intervals: Number of available update intervals (instance-level) - OUT
> + * @num_shmtis: Number of discovered SHMTI areas - OUT
> + * @features: Instance specific SCMI feature-support bitmap - OUT
> + * @reserved: Some room for future expansion without the need to resize.
> + *	      Must be zero.

Why?  I'd expect the input size to indicate what userspace supports.
As such what use is this reserved padding?

> + *
> + * Used by:
> + *	RW - SCMI_TLM_GET_ABI_INFO
> + */
> +struct scmi_tlm_abi_info {
> +	__u32 size;
> +	__u32 abi_version;
> +	__u32 abi_features;
> +#define SCMI_TLM_ABI_FEAT_RESET				(1 << 0)
> +#define SCMI_TLM_ABI_FEAT_EVENT				(1 << 1)
> +#define SCMI_TLM_ABI_FEAT_UUID_LIST			(1 << 2)
> +#define SCMI_TLM_ABI_FEAT_BATCH_STATE			(1 << 3)
> +#define SCMI_TLM_ABI_FEAT_BATCHED_CFG			(1 << 4)
> +#define SCMI_TLM_ABI_FEAT_DE_TRACKING			(1 << 5)
> +	__u8 primary_de_impl_version[SCMI_TLM_DE_IMPL_UUID_SZ];
> +	__u32 num_des;
> +	__u32 num_groups;
> +	__u32 num_intervals;
> +	__u32 num_shmtis;
> +	__u32 features;
> +#define SCMI_TLM_SCMI_SUPPORT_RESET			(1 << 0)
> +#define SCMI_TLM_SCMI_SUPPORT_SINGLE_SAMPLE		(1 << 1)
> +#define SCMI_TLM_SCMI_SUPPORT_GROUP_CONFIG		(1 << 2)
> +#define SCMI_TLM_SCMI_SUPPORT_UPDATE_NOTIFICATION	(1 << 3)
> +	__u64 reserved;
> +};
> +


> +/**
> + * struct scmi_tlm_config  - Whole instance or group configuration
> + *
> + * @enable: Get/Set Telemetry enabled state for the whole instance or the
> + *	    group specified in @grp_id - IN/OUT
> + * @t_enable: Get/Set timestamp state for the group specified in @grp_id - IN/OUT
> + * @flags: Bitmask to represent special characteristics - IN
> + * @pad: Padding fields to enforce alignment
> + * @grp_id: Identifier of the target group upon which this configuration will
> + *	    be applied: ignored if not marked as a group in @flags - IN/OUT
> + * @active: Get/Set currently active update interval for the whole instance
> + *	    or the group specified in @grp_id - IN/OUT
> + * @reserved: Some room for future expansion. Must be zero.

I'd add a size field for this one too to make it easier to expand.
Probably the same applies to all others.


> + *
> + * Used by:
> + *	RW - SCMI_TLM_GET_CFG
> + *	WO - SCMI_TLM_SET_CFG
> + */
> +struct scmi_tlm_config {
> +	__u8 enable;
> +	__u8 t_enable;
> +	__u8 flags;
> +#define SCMI_TLM_CONFIG_GROUP		(1 << 0)
> +#define SCMI_TLM_CONFIG_FLAGS		(SCMI_TLM_CONFIG_GROUP)
> +#define SCMI_TLM_CONFIG_IS_GROUP(f)	((f) & SCMI_TLM_CONFIG_GROUP)
> +	__u8 pad;
> +	__u32 grp_id;
> +	struct scmi_tlm_update_interval active;
> +	__u64 reserved;
> +};
> +
> +/**
> + * struct scmi_tlm_intervals  - Update intervals descriptor
> + *
> + * @grp_id: Identifier of the target group upon which this configuration
> + *	    will be applied: ignored if not marked as a group in @flags - IN
> + * @flags: Bitmask to represent special characteristics. When the interval
> + *	   is NOT marked as SCMI_TLM_INTERV_DISCRETE, @intervals will
> + *	   contain a triplet: min/max/step - OUT

I'd have a reference to this in the num_intervals text. What happens if the input
only allows for two intervals?

> + * @pad: Padding fields to enforce alignment
> + * @num_intervals: Number of entries of @intervals. On input this represents the
> + *		   size of @intervals, while on output carries the effective
> + *		   number of entries filled-in.
> + *		   On input this has an upper-bound determined as:
