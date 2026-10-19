Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792437885;
	b=4ehqWFYmOr73C+KNamfES/5KjBjCizOo0i5XP/o4Kob5sJbU9ODuf9IqWbrOPDknujR/
	 mhYKJPWWuul9+0tfjGBVYqr5agkNJCBEx9Rh5S9Rfe0iKJOimF3mmu2Y14NMDWpXOk1r8
	 q+fHz/QzmEhRlm0yw/H8Brt33J1IprHI03//dJ7/Q5csZhCauk+MYCOTDf/gJkQN67aMK
	 b0Jb1Gw74gy0AYGcdulTuYcDf9zZn7lhBjjzlpGVieDnd6MlOMRha20DpmGbFYK6Lf6uL
	 Wf9bT3ardHPiQoKX9exN+Nw21efGq2tC3AJrtApQUjPtz0l0nCpNChkK40GkSV6J8Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792437885;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BMUhm5+GJQEDK7W/pa/hsK7Ip8Ta9HhXsuNAgIn4IXI=;
	b=N3KQmzozmUGIEYJ3KTDsACULe9p5U9HBCsOMnaKZZKgOcN5FCaFlq+5Vww8AqCip8Jc7
	 IClHFUlvGRQARldYUbbNXb4OWcsw3Ju6D7TDCGum0OGyqDAbBTrOclAiQ+U35chL1JEPK
	 TwlpqqPQAgJ0jLGf6S3KHLZuDrYzFB9ysqFdezCI3hjVA0SwSBk8XRKgdVBub5rPh/bP9
	 sd8ZsZEcV9ShSkMUJDx3vXPPBjMWztmRxZ0xZUd7VQ2wphuB4fUDocfZtnGDQgNkgF7lE
	 wbe/3efsejRBKMkjASC/2VNlE4wiAGHIiiY1/NePKWth13JtgBjohAm2uWvrPCbAQBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CRwJAm+R;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HwYMibNg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D0E606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:24:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37D0E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CRwJAm+R;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HwYMibNg
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JJJqk53103215
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BMUhm5+GJQEDK7W/pa/hsK7Ip8Ta9HhXsuNAgIn4IXI=; b=CRwJAm+RXy3ZPfsk
	5y75LciccvrkroJApArGjvbL3WqdD5rIV/kvilAJo627eH2fu9ELzN90n+3tN3Ey
	OVo88iw9RoigRazM2oaGyz0oBqvnOYctvMHsYT5ECl3xWAX9z08SRLyWomJi3YkD
	MN0Z9pORPMppiZ7oqIQNUz+/YuQiyETnx5R+Kb68NqBNc6tABTfLKwkZ0Nh+eAlc
	tqDlldWEkZOln4AuvvnwKkAfoCi2Ijluszem9JSs+vPvqNoBInQ82Rx7Lp3kGCOV
	PcprY7NqODq584+bgpx5E8Oy4j1rgDS+P52Tqb78AdgH1UJozluk/nnG/QCaKe/R
	eVR16g==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdr4q09u0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:24:44 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-18b5ee75447so3295982c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792437884; x=1793042684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BMUhm5+GJQEDK7W/pa/hsK7Ip8Ta9HhXsuNAgIn4IXI=;
        b=HwYMibNgPmS0T0TZtOxNxsVoiIgehjEEU/TY5O05LL2dnOwIp+UTHW4PQ6ZevTjHKq
         sNC1vQuLh/atS0x/YFc8TCgD5CAa2w4QwjyOlnSjIIfaJ2ck6cwZhA5PLos+KegvVgOA
         aBy2zqkni6aNeLtIQNO+e0WryVMlz3xvQtNUeS/iUXrWEUMTGzu9bv7qUUex7E4XBwC8
         oxJ2MMdx24irMtSda5O5FiKRbckgDOoIj2WxFbUh3N7i45rW4AZEDBK7jQGeiSI3D05x
         CzC8irXB/2nJd3dsd9YvBx/fuEtU/fgU2t1r2BuRdVXU20JSic+8g8iA8JmdT/L/EOD2
         EUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792437884; x=1793042684;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BMUhm5+GJQEDK7W/pa/hsK7Ip8Ta9HhXsuNAgIn4IXI=;
        b=kQeP/uSsx57sFoVGTmhM7bJSzMbtfGFfVJy1oA0HUVd5ueMVEvHBRvo01xZIorN8ZL
         TXGfGd2nqEH2q3B+4oLsmsUW8fOcSOXvddtuejgYhKlIW0drmTq0dw/CoLak6d7UqJFH
         O6p+k1mcnFB4HHNLQO2TTG/6dvAuF+5+R0GNCW5S8UMZlPatKowqhhgbSIIorIRmSYLU
         16voT9in+3soKdzJrBM5k1Y/nUBAmBRlt5GxFUDcwFtu0DUq2SuOrZyl1hU8xmRRhoyN
         pKv/zaqWqB/cSooXY9rJjUNTBPPKKBbQ+hWtGexFphIdSERDbqeFEIReAERCZnp6ydQ8
         rQWw==
X-Gm-Message-State: AFq9FYI7SwAILWzK1VWdTQsjLoPb1hNQdjCkJfk3yqV0iZMOLPo3hoH7
	8TdghtSqw+IH3IvUz9DK0Q/RAyz85Hic5Ogu4/NjIDSGCYUTTnK+Hy+gQ2U1PVxrE187oUzi5Oz
	9spa3VsNc2Jn1DQF0whUQBD2l5q10ftIiJZc6ajj596mBpOxHh/u/1qWniPXYxXl9/ko=
X-Gm-Gg: AYBFou3h196GdhwW90K0X4MF/WtKyMHFwokGT4ghcUTe2Sql+3KtH5BmBNfw4JQ/OmV
	nOfAQy8v+epT/7vswExoLZOF1eqCyATujKWK6NB2bW1nYD8zR1DId7sOEbCWk0SGSB8dk1jmjF8
	f8gXPYHC2m1jNo6pvlrcbknWy7qHUthqji+9ayB73TyVcD4xakk9GGR9E2bWnWvvH4ZNtKT+taR
	o07fMaqetQJnHkBnvWgrBium0u40eEvWJiCwbAfs6Fwh4LS4kj6z4OlQxByTJ7bzGOW0B8gzA/G
	1PSEagipmqq6JDYBA73ti/qu2TIasinEEWY5dOCdy2DdgpMxsVdaWNcaAX5xrtmYv63NUNG/cNl
	w9bjTEoGAvcy3+x63xkbMcQJTjxjkL0kmCYOoIK2gMxZA5hceV1inBw==
X-Received: by 2002:a05:701b:4308:b0:15a:2b63:a0cb with SMTP id a92af1059eb24-18511ad8bacmr13577096c88.13.1792437883577;
        Mon, 19 Oct 2026 12:24:43 -0700 (PDT)
X-Received: by 2002:a05:701b:4308:b0:15a:2b63:a0cb with SMTP id a92af1059eb24-18511ad8bacmr13577069c88.13.1792437882911;
        Mon, 19 Oct 2026 12:24:42 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b37ce3fsm27157689c88.14.2026.10.19.12.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 12:24:42 -0700 (PDT)
Date: Mon, 19 Oct 2026 12:24:35 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Pierre Gondois <pierre.gondois@arm.com>
Cc: linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>,
        Mark
 Brown <broonie@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len
 Brown <lenb@kernel.org>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov
 <bp@alien8.de>,
        Hanjun Guo <guohanjun@huawei.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Shuai Xue <xueshuai@linux.alibaba.com>,
        Maciej
 Wieczor-Retman <maciej.wieczor-retman@intel.com>,
        Pawel Chmielewski
 <pawel.chmielewski@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        "Fabio M.
 De Francesco" <fabio.m.de.francesco@linux.intel.com>,
        Breno Leitao
 <leitao@debian.org>, Terry Bowman <terry.bowman@amd.com>,
        Dan Williams
 <djbw@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Morduan Zang
 <zhangdandan@uniontech.com>, linux-acpi@vger.kernel.org,
        linux-edac@vger.kernel.org, acpica-devel@lists.linux.dev
Subject: Re: [PATCH 5/6] ACPI: APEI: add separate Memory Error Section 2
 handlers
Message-ID: <20261019122435.000079c0@oss.qualcomm.com>
In-Reply-To: <20261019145643.1877246-6-pierre.gondois@arm.com>
References: <20261019145643.1877246-1-pierre.gondois@arm.com>
	<20261019145643.1877246-6-pierre.gondois@arm.com>
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
X-Proofpoint-ORIG-GUID: tR6G87l2KK3pxsyuNv1iEybR0DwwuoKG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA3NyBTYWx0ZWRfX/XZZO+xnoT1x
 NgQQQF/5bGLnTbH0jdptWUt725ozXEBpfYWWZYuTrkK7OR5KRlRIXeNgoybbmAFC5Rm3glWy82p
 /gBOYpcONzWpj6OBrTFsR8c1U0vabjM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA3NyBTYWx0ZWRfX3cNJd1AagKiG
 raqpEoKm/SIXyqqblMtBnWRP2xZamrJX0s4pVoQq5gKJ7MGvM7w03Sy+uOX9Wl6QPi9rC/az+EP
 dANb09/yGKrl5X3Z6gFhx/55WEJuxy3242JacYOhdmSwgAR/AVwFvZaIfNv+Oo4wn1GX50Y1zlz
 K/k/UA0cZlRPDLm8wu/wOceXT2CjGscnCq+3qrolB56nEFsyZ3UUWo+fRCO/SqqrQc7IvO1pr8w
 d0XtQ3jq7lYSgNbw0i2ncHL2+/L2HV0xTfZ1lx7bmKjZitIJYQNs+4hfTTKNGZeOa3tSTctHW7I
 BJjvlazNlqb5wxuROHn15HwpEjYFdrp4ZwT4UiWj2VPqzo18BTTUNgE9m7x5dSCbMuzPy7I1qBk
 ykJJWlFXs9yMI0uZu40/aEbMDSlWQD9oeN6XxNnWRnjABikrvKwF+DSN9dfjCI0hBGxNzR0rRLq
 aUGE7gYq/8FJms89CpA==
X-Authority-Analysis: v=2.4 cv=aqsnmiZV c=1 sm=1 tr=0 ts=6ad66e7c cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=7CQSdrXTAAAA:8 a=rtJ9AlOumMsWe6EQo_MA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: tR6G87l2KK3pxsyuNv1iEybR0DwwuoKG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190077

On Mon, 19 Oct 2026 16:56:12 +0200
Pierre Gondois <pierre.gondois@arm.com> wrote:

> Add dedicated GHES and EDAC callbacks for Memory Error Section 2
> records. Use a separate GHES notifier chain so existing consumers
> continue to receive legacy memory error sections.
> 
> Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
A few trivial things inline. 

Otherwise I'm fine with this though as you noted before the duplicating
is a bit annoying.

> ---
>  drivers/acpi/apei/ghes.c |  49 ++++++++++++-
>  drivers/edac/ghes_edac.c | 150 +++++++++++++++++++++++++++++++++++++++
>  include/acpi/ghes.h      |   2 +
>  3 files changed, 200 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
> index fe10ab0e02f6..c7fb15543b56 100644
> --- a/drivers/acpi/apei/ghes.c
> +++ b/drivers/acpi/apei/ghes.c


> diff --git a/drivers/edac/ghes_edac.c b/drivers/edac/ghes_edac.c
> index d80c88818691..b18460ba8f40 100644
> --- a/drivers/edac/ghes_edac.c
> +++ b/drivers/edac/ghes_edac.c

> +
> +static int ghes_edac_report_mem_error2(struct notifier_block *nb,
> +				       unsigned long val, void *data)
> +{
> +	struct cper_sec_mem_err2 *mem_err = data;
> +	struct edac_raw_error_desc *e;
> +	struct mem_ctl_info *mci;
> +	unsigned long sev = val;
> +	struct ghes_pvt *pvt;
> +	unsigned long flags;
> +	char *p;
> +
> +	/*
> +	 * We can do the locking below because GHES defers error processing
> +	 * from NMI to IRQ context. Whenever that changes, we'd at least
> +	 * know.
> +	 */
> +	if (WARN_ON_ONCE(in_nmi()))
> +		return NOTIFY_OK;
> +
> +	spin_lock_irqsave(&ghes_lock, flags);

Perhaps use a guard so you can simplify error paths a little.

> +
> +	pvt = ghes_pvt;
> +	if (!pvt)
> +		goto unlock;
> +
> +	mci = pvt->mci;
> +	e = &mci->error_desc;
> +
> +	/* Cleans the error report buffer */
> +	memset(e, 0, sizeof(*e));
> +	e->error_count = 1;
> +	e->grain = 1;
> +	e->msg = pvt->msg;
> +	e->other_detail = pvt->other_detail;
> +	e->top_layer = -1;
> +	e->mid_layer = -1;
> +	e->low_layer = -1;
> +	*pvt->other_detail = '\0';
> +	*pvt->msg = '\0';
> +
> +	switch (sev) {
> +	case GHES_SEV_CORRECTED:
> +		e->type = HW_EVENT_ERR_CORRECTED;
> +		break;
> +	case GHES_SEV_RECOVERABLE:
> +		e->type = HW_EVENT_ERR_UNCORRECTED;
> +		break;
> +	case GHES_SEV_PANIC:
> +		e->type = HW_EVENT_ERR_FATAL;
> +		break;
> +	default:
> +	case GHES_SEV_NO:
> +		e->type = HW_EVENT_ERR_INFO;
> +	}
> +

Almost everything down to here is not memerr2 specific maybe factor
out an initialization helper for the edac structure?

> +	edac_dbg(1, "error validation_bits: 0x%08llx\n",
> +		 (long long)mem_err->validation_bits);
> +
> +	/* Error type, mapped on e->msg */
> +	if (mem_err->validation_bits & CPER_MEM2_VALID_ERROR_TYPE) {
> +		u8 etype = mem_err->error_type;
> +
> +		p = pvt->msg;
> +		p += snprintf(p, sizeof(pvt->msg), "%s", cper_mem_err_type_str(etype));
> +	} else {
> +		strscpy(pvt->msg, "unknown error");
> +	}
> +
> +	/* Error address */
> +	if (mem_err->validation_bits & CPER_MEM2_VALID_PA) {
> +		e->page_frame_number = PHYS_PFN(mem_err->physical_addr);
> +		e->offset_in_page = offset_in_page(mem_err->physical_addr);
> +	}
> +
> +	/* Error grain */
> +	if (mem_err->validation_bits & CPER_MEM2_VALID_PA_MASK)
> +		e->grain = ~mem_err->physical_addr_mask + 1;
> +
> +	/* Memory error location, mapped on e->location */
> +	p = e->location;
> +	p += cper_mem_err2_location(mem_err, p);
> +
> +	if (mem_err->validation_bits & CPER_MEM2_VALID_MODULE_HANDLE) {
> +		struct dimm_info *dimm = NULL;
> +
> +		p += cper_dimm_err2_location(mem_err, p);
> +		if (mem_err->mem_dev_handle <= U16_MAX)
> +			dimm = find_dimm_by_handle(mci, mem_err->mem_dev_handle);
> +		else
> +			pr_warn(FW_WARN "Memory Error Section 2 module handle 0x%x exceeds SMBIOS range\n",
> +				mem_err->mem_dev_handle);
> +		if (dimm) {
> +			e->top_layer = dimm->idx;
> +			strscpy(e->label, dimm->label);
> +		}
> +	}
> +	if (p > e->location)
> +		*(p - 1) = '\0';
> +
> +	if (!*e->label)
> +		strscpy(e->label, "unknown memory");
> +
> +	/* All other fields are mapped on e->other_detail */
> +	p = pvt->other_detail;
> +	p += print_mem_error2_other_detail(mem_err, p, e->location, OTHER_DETAIL_LEN);
> +	if (p > pvt->other_detail)
> +		*(p - 1) = '\0';
> +
> +	edac_raw_mc_handle_error(e);
> +
> +unlock:
> +	spin_unlock_irqrestore(&ghes_lock, flags);
> +
> +	return NOTIFY_OK;
> +}


