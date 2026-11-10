Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794277622;
	b=rCK/awb/7ifcZY6H6anJXhGAux+tvdyZNxpdRgRohyX3FlH2RraQrngBM6IfgzRhpkxG
	 Tb6glJxUL8E5h61fkVBCS+kCyOJWQrC/hIV/p3opcbaXwe1VxD8sYonC6cN792chVnlBy
	 uvW4I0vCaBotIfWTwq/eV+7HgpSejzReeCUceg8eTgfH6WVjw0hx4gRWkIJ4vtsCqx57W
	 YIp4Q6XLsvjZaIOdRDquUFRy6G/CS6seA2/HSO0JUkSGPzEvCtPg3B7xIwmQDFrbaWPbT
	 RlPb9KFcZ17Yl9h/+5cTt8gid3lWE2uovXymkXIPQ/QmThi4afY5rwP3zfhisa3jf7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794277622;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FbT91i0c5l/KVk+5M9vrjlRuG1+3lI13/QVZcwyokHQ=;
	b=wBDI7KYfbAcAxnz392mEGG26GWS8ZW5EyT8eZ3ewuBZUxAvciWBNMwAfswcIac+xipY7
	 sNBwposhsjXFw/0mcGR3vRpfs5z/vjl4FzkgAe9+Zgelr603kH/sLws0TDRSGW+24Nqoe
	 g+kLgL13u0xoM7sqTL9l7HBAfz2/hCKd/HEilOwop9nrOimuz87JN6UDpfQxvQGb3RAGz
	 byyrdTeo26xpNt9JvyaPGz59uwWnShsEqI6XR7nnMtNb1+zh4uegcqz1kJbYtEiw+3Hfu
	 inrycbouoIVA7LLje5IztZ2mjNCJAPHeNf1JVXhpGte35pBNQTcH1qvzTiztSjOaBCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I9EMFaMW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jeAFw7uL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C24D606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:27:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C24D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I9EMFaMW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jeAFw7uL
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0jEuW2474670
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:27:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FbT91i0c5l/KVk+5M9vrjlRuG1+3lI13/QVZcwyokHQ=; b=I9EMFaMWNtXPYRVj
	L2ts+ZenQ+6nxmUJleNtxEjnkHz3rezskY13a1f6Ez+LRG/wi4LpA+bZj24W8Fwo
	1ijJPzgdw38fMJ1QWN3QIxzttF7uPkpeSW+/SRSD6ncdocrklwIhvPQX7FWz7kyC
	w4Jky8HN+OLUKq4ylqg8FrN0MEGZI6u9FuTXt5Cz4tTulb3IFLKZnZeIxNdQrpJU
	RnhfKxU5N/Bk+uZl8OxuB0dOc2cceLkzXktKRvwKv/iylCDprODwPPWP5QsOtfEM
	/kNYe8W57yTImchU58JQdpk3MHzm5zvkgrDHSQr7IuebKMbqfFU/SeRnfi92IlBl
	GW/ksQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg17yj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:27:00 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-37549877380so427792eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794277619; x=1794882419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FbT91i0c5l/KVk+5M9vrjlRuG1+3lI13/QVZcwyokHQ=;
        b=jeAFw7uLdCxOnVuJR0L6VFhV2e7MM1ia3jxHJXv3/GO92zyHW1d10+G9gjO0De61oJ
         tY2rEny4IbWXmsuZwb7+tO54JQrKe96LVvWi8vRtyuZTO6+Qmq41S6VOxgXFejyQBHGf
         K/9bPmOgSpOBUghNaXWLxek0LNk6HHM0kSjRF9gTP8hE8mk375NECgKpZXdX8cXahMLx
         d2H62h+ZE2INiz+sgDpRoNnFpSR7YdthVmVyF1rgsPeNm9TT5Acu/qCz009MayFkAwMA
         QN4SB8mOuzuK7Fw6J7FTElWBBxStkMmDHJtDmZC8CYULTiMV/Kwjj+3DWk/g5hNvHuyv
         aVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794277619; x=1794882419;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FbT91i0c5l/KVk+5M9vrjlRuG1+3lI13/QVZcwyokHQ=;
        b=ymkSntwITUgdHig2C2YkidPp1DBLnrMog3uWkXAdPMcALSNZrOTUZj9uK5++EX32vF
         wwPI9jgzcQsvd82Zn82u01bYA0Ci2Gsm38Ranf17thDQ7jX17FOGnSpefOO0Vj67t+IM
         9BQh1eMb27htuJGEClBORtbR5rn3nAgFC+Q/vZE65dWu4ifTiRSJWnM3sSxwLnsjKCNh
         H/sD94bmDmsN+C23YRszmB+Re+X/WNDw0BowJYTVRwlbOfrTmaDiBSmSVubH5f4GqrAE
         IREaeHpnnHk1kaWgsVuFHzkh9QayoMPzRu15S6Bb1k+HTNSmKUqGdYiaOUSndejd0UwH
         69uQ==
X-Gm-Message-State: APuU4Z9+E7WJMRPwG5Rm9qs4rf0xCmdi4N+HQUdQYCMwtA3Y1AB6gypT
	iRZ2rR95dUOLsuJYnK/P+IzvN1CX6vxSkhEhPfNAHBfZQsGD2nzmxWIQw5OXnMSt7952GpEXlZT
	VpsKiqHsKSj8iSKpsaGcmzKJNIpNDqmKhjEG7oceEVWyWCMSVziXlD2lfAeE08JR5Ad0=
X-Gm-Gg: AYBFou24Va+SToDLH7uF7qydDDtUt2K8WjAO8cKLs9k5u6XVSikhKQFArcSKRZkDivy
	1pqzsI5/CzaO7tD3bk/LglHqxR+9ohVeNqQBKIjGEPUGMBtUb+dc4gqgsZSXNl1ACXrkhzmepcZ
	41w83orMhE80HUbcI1uRzaXCyNt3M4y67EJtb3s7HSv24JV92Lk7Ihj0ZiNw2NFIe3HwJSS3snM
	Edp5poSFEkKt+xsk6c1HWwrGRNnQLzIgXtyCyVKt8UQjJlCcF2AKbEv9FG+XiQjjTd+gARXlkTr
	Za718SWwLYbt8AFOu6kouBOIZWSYeBADiLL8J7JXijSX3zGi8F/ul11JWYb3me25hu7d0LPPy8R
	RrKlJozgmY8Hu8v6/2EzsMshdernGvkH75KNseOn9t2isVXdG4q6D26s4vcJFCqPgb6v8vF7Q5w
	/z17Q8jyjwyb9DdHB1rcS9nA92Tw==
X-Received: by 2002:a05:693c:41cc:10b0:369:ef63:ea95 with SMTP id 5a478bee46e88-3751ee7c792mr1574085eec.6.1794277619094;
        Mon, 09 Nov 2026 18:26:59 -0800 (PST)
X-Received: by 2002:a05:693c:41cc:10b0:369:ef63:ea95 with SMTP id 5a478bee46e88-3751ee7c792mr1574034eec.6.1794277618398;
        Mon, 09 Nov 2026 18:26:58 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe32276sm2466798eec.8.2026.11.09.18.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:26:58 -0800 (PST)
Date: Mon, 9 Nov 2026 18:26:54 -0800
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
Subject: Re: [PATCH v15 13/35] firmware: arm_scmi: Add Telemetry SHMTI areas
 enumeration
Message-ID: <20261109182654.00003f6d@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-14-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-14-cristian.marussi@arm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwOSBTYWx0ZWRfX1fwAZn04K6TC
 Z9a5dXdnN63Wi4EwyAf8cLkyu0gCVX87TnItmLOQv+lMpkopMipsDVc2N6sRh233DgO3dhaiO1/
 H3FDVeNz38Nw+gVmxr/EgapBgrilm0BMINFwgW7s94vocb4low8lw1Keb62FhrLq1cvjpVou6MX
 OZPU5LiDSUlX26FD4Ig8i5qRvmeR1gvhK/ADnPoR4PF+AcissnXyVnyrM4RukS/WWJ1k+2H81qa
 OtkfvRPGcuY+T0qc2hy5pYZhTYnHDI5UVJrNXKDg2vIlspgmMN6QcPXLLnBTV3QrU9Kdg4UVmrs
 24mgi35BNAazlKnn+f3ME5EvTniKkgzvZKgVDbn4csrlZ5kFCJkhqZfOSYX0+1KuMFCg2xlt2Sq
 3OJk4E2gVKwQ4W1TJbFtN2a0QhhQKdrhRuRLTLITm9NQdOEcjHaXa/kBe/Zfkv1Ts809yzWYh9W
 HVoYGbZHVF6z4Tu8WsQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwOSBTYWx0ZWRfX8C8hl3RycWjS
 o0nNcU6GYyK2ni7575k9pTq7vmqjzu0GtInbAQqfxjBJoqNYYH4Xx7nHelgJBmVHUs9u288E82j
 kdM3tMX62kLOQ5/rw/PI9Pey6IOEHAg=
X-Proofpoint-GUID: tnleJnlpFGHVaaLXHIjQeyXCMv7DQ34s
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af280f4 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=UCLCd_48klQTlnfJctoA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: tnleJnlpFGHVaaLXHIjQeyXCMv7DQ34s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100009

On Mon,  9 Nov 2026 09:11:59 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add Telemetry support to enumerate SHMTI areas.

I'd be tempted to leave the local data structures like snaps to
be introduced only when code actually uses them.

> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> v14 --> v15
>  - fix prologue/epilogue endianity fields
>  - rework SHMTI initialization and allocation
>  - add snapshot suppport data structures
>  - added alignment checks on SHMTII length size
>  - fixed error string formatting
>  - warn if less than expected SHMTIs are enumerated
>  - improve memory area sanity checks
> v13 --> v14
>  - splitted out of the old Basic Telemetry patch, contains the
>    SHMTI areas enumeration routines
> ---
>  drivers/firmware/arm_scmi/telemetry.c | 312 ++++++++++++++++++++++++++
>  include/linux/scmi_protocol.h         |  59 +++++
>  2 files changed, 371 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> index e57534c93b26..d9f1a3e3468e 100644
> --- a/drivers/firmware/arm_scmi/telemetry.c
> +++ b/drivers/firmware/arm_scmi/telemetry.c
> @@ -16,6 +16,7 @@
>  #include <linux/limits.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/sizes.h>
>  #include <linux/slab.h>
>  #include <linux/sprintf.h>
>  #include <linux/string.h>

> +struct scmi_msg_resp_telemetry_shmti_list {
> +	__le32 num_shmti;

Add a comment that this is not actually the number of shmti. 
Not confusing spec name at all.   Maybe just put a pair of
extraction macros right after it like you've had for
some of the other similar cases and that will act as documentation
that not all is what it seems.

> +	struct scmi_shmti_desc desc[];
> +};
> +
>  struct de_desc_fastchannel {
>  	__le32 addr_low;
>  	__le32 addr_high;
> @@ -107,6 +121,72 @@ struct scmi_msg_resp_telemetry_update_intervals {
>  	__le32 intervals[];
>  };
>  
> +/* TDCF */
> +
> +#define _I(__a)		(ioread32((void __iomem *)(__a)))

Is that really worth doing?  I think I'd rather see some long lines
with that expanded out.

> +
> +struct prlg {
> +	__le32 sign_start;
> +#define SIGNATURE_START	0x5442474E	/* TBGN */
> +	__le32 match_start;
> +	__le32 num_qwords;
> +	__le32 hdr_meta_1;
> +#define TDCF_REVISION_GET(x)	(le32_get_bits((x)->hdr_meta_1, GENMASK(7, 0)))

Outer brackets needed?

> +};
> +
> +struct eplg {
> +	__le32 match_end;
> +	__le32 sign_end;
> +#define SIGNATURE_END	0x54454E44	/* TEND */
> +};
> +
> +#define TDCF_EPLG_SZ	(sizeof(struct eplg))
> +
> +struct tdcf {
> +	struct prlg prlg;
> +	unsigned char payld[];
> +};
> +
> +#define SHMTI_MIN_SIZE	(sizeof(struct tdcf) + TDCF_EPLG_SZ)
> +/* An arbitrary upper bound to avoid crazy allocations driven by buggy FW */
> +#define SHMTI_MAX_SIZE	SZ_64K
> +
> +#define TDCF_START_SIGNATURE(x)	(_I(&((x)->prlg.sign_start)))
> +#define TDCF_END_SIGNATURE(e)	(_I(&((e)->sign_end)))


>  	/* Mutex to protect access to @free_des */
> @@ -878,6 +960,211 @@ scmi_telemetry_enumerate_common_intervals(struct telemetry_info *ti)
>  					ti->info.intervals);
>  }
>  
> +static int iter_shmti_update_state(struct scmi_iterator_state *st,
> +				   const void *response, void *priv)
> +{
> +	const struct scmi_msg_resp_telemetry_shmti_list *r = response;
> +
> +	st->num_returned = le32_get_bits(r->num_shmti, GENMASK(15, 0));
> +	st->num_remaining = le32_get_bits(r->num_shmti, GENMASK(31, 16));
I'd move those two into defines above, just to document that num_shmti is more
complex than it seems at first glance. Also for general consistency.
> +
> +	if (st->rx_len < (sizeof(*r) + sizeof(r->desc[0]) * st->num_returned))
> +		return -EINVAL;
> +
> +	return 0;
> +}

> +
> +static int iter_shmti_process_response(const struct scmi_protocol_handle *ph,
> +				       const void *response,
> +				       struct scmi_iterator_state *st,
> +				       void *priv)
> +{
> +	const struct scmi_msg_resp_telemetry_shmti_list *r = response;
> +	struct telemetry_info *ti = priv;
> +	struct telemetry_shmti *shmti;
> +	const struct scmi_shmti_desc *desc;
> +	void __iomem *addr;
> +	phys_addr_t phys_addr;
> +	size_t len;
> +	int ret;
> +
> +	desc = &r->desc[st->loop_idx];
> +	shmti = &ti->shmti[st->desc_index + st->loop_idx];
> +
> +	shmti->info.sid = le32_to_cpu(desc->id);
> +	shmti->flags = le32_to_cpu(desc->flags);
> +
> +	ret = scmi_telemetry_area_check(ph->dev, "SHMTI",
> +					le32_to_cpu(desc->addr_low),
> +					le32_to_cpu(desc->addr_high),

Same as before. I'd do the build of phys_addr and len outside the
call. Keep it to checking validity as it's name suggests.

> +					le32_to_cpu(desc->length),
> +					&phys_addr, &len);
> +	if (ret) {
> +		dev_err(ph->dev, "Malformed SHMTI ID:%u. Abort.\n",
> +			shmti->info.sid);
> +		return ret;
> +	}
> +
> +	if (len < SHMTI_MIN_SIZE || len > SHMTI_MAX_SIZE) {
> +		dev_err(ph->dev,
> +			FW_BUG "Invalid length for SHMTI ID:%u len:%zu. Abort.\n",
> +			shmti->info.sid, len);
> +		return -EINVAL;
> +	}
> +
> +	/* SHMTI base phys_addr SHOULD be 64bit aligned by the SCMI spec */
> +	if (!IS_ALIGNED(phys_addr, 8))
> +		dev_warn(ph->dev,
> +			 "SHMTI ID:%u is NOT 64bit aligned (paddr:0x%llX)\n",
> +			 shmti->info.sid, phys_addr);
> +
> +	addr = devm_ioremap(ph->dev, phys_addr, len);
> +	if (!addr)
> +		return -EADDRNOTAVAIL;
> +
> +	shmti->base = addr;
> +	shmti->info.len = len;
> +	shmti->info.phys = phys_addr;
> +	shmti->info.offset = shmti->info.phys & ~PAGE_MASK;
> +
> +	ret = scmi_telemetry_shmti_validate(ph->dev, shmti);
> +	if (ret)
> +		return ret;
> +
> +	ti->num_shmti++;
> +
> +	return 0;
> +}


> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index f38ca2f8099b..b7b8bd77b37d 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -830,6 +830,57 @@ struct scmi_pinctrl_proto_ops {
>  	int (*pin_free)(const struct scmi_protocol_handle *ph, u32 pin);
>  };
>  

> +
> +enum scmi_telemetry_compo_type {
> +	SCMI_TLM_COMPO_TYPE_USPECIFIED,
> +	SCMI_TLM_COMPO_TYPE_CPU,
> +	SCMI_TLM_COMPO_TYPE_CLUSTER,
> +	SCMI_TLM_COMPO_TYPE_GPU,
> +	SCMI_TLM_COMPO_TYPE_NPU,
> +	SCMI_TLM_COMPO_TYPE_INTERCONNECT,
> +	SCMI_TLM_COMPO_TYPE_MEM_CNTRL,
> +	SCMI_TLM_COMPO_TYPE_L1_CACHE,
> +	SCMI_TLM_COMPO_TYPE_L2_CACHE,
> +	SCMI_TLM_COMPO_TYPE_L3_CACHE,
> +	SCMI_TLM_COMPO_TYPE_LL_CACHE,
> +	SCMI_TLM_COMPO_TYPE_SYS_CACHE,
> +	SCMI_TLM_COMPO_TYPE_DISP_CNTRL,
> +	SCMI_TLM_COMPO_TYPE_IPU,
> +	SCMI_TLM_COMPO_TYPE_CHIPLET,
> +	SCMI_TLM_COMPO_TYPE_PACKAGE,
> +	SCMI_TLM_COMPO_TYPE_SOC,
> +	SCMI_TLM_COMPO_TYPE_SYSTEM,
> +	SCMI_TLM_COMPO_TYPE_SMCU,
> +	SCMI_TLM_COMPO_TYPE_ACCEL,
> +	SCMI_TLM_COMPO_TYPE_BATTERY,
> +	SCMI_TLM_COMPO_TYPE_CHARGER,
> +	SCMI_TLM_COMPO_TYPE_PMIC,
> +	SCMI_TLM_COMPO_TYPE_BOARD,
> +	SCMI_TLM_COMPO_TYPE_MEMORY,
> +	SCMI_TLM_COMPO_TYPE_PERIPH,
> +	SCMI_TLM_COMPO_TYPE_PERIPH_SUBC,
> +	SCMI_TLM_COMPO_TYPE_LID,
> +	SCMI_TLM_COMPO_TYPE_DISPLAY,

Die 0x1d is in the version I'm looking at. Perhaps a comment
for specific version of spec used.  I'd also
be tempted to assign every one of these as it makes
it easy to eyeball an particular one vs the spec.

> +	SCMI_TLM_COMPO_TYPE_RESERVED_START = 0x1d,
> +	SCMI_TLM_COMPO_TYPE_RESERVED_END = 0xdf,
> +	SCMI_TLM_COMPO_TYPE_OEM_START = 0xe0,
> +	SCMI_TLM_COMPO_TYPE_OEM_END = 0xff,
> +};


