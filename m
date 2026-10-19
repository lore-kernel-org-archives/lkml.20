Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792437194;
	b=GXCuNXmGazU1tAH18aXyg7m2vsR2i4ZCF3e1psbUudFBUQ6k/P6bnBS8wikTA4VQR84D
	 4PU5QkRIIF1E/NBd20paww+dVwsUsnCZ4lzxtcKUVFsQv1Z0Agussu5O4l2C3llq4mB+p
	 cIQRlgjkzn6CcOk7IVydbNI2nfIPMh/DkDoeNOWE7V9TTP3WBj7hpHtyfwZjLw+vKNPWQ
	 TtnME7SSmPhWCjHXLpDvkWYy3KGKfxAKg0YGi69KMrpiMQhS171LkdiZh2+PA3uKkpHmg
	 Os6gQJ1C7P7ED7RHCimR6mzmfROIYUZYX6GNwgA1GsUWD/wlfGfD1VASQYWr5eAikwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792437194;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jS+Bq8s7EUDu4GSq8520KkV5KJNW6foagnSih0NwpR0=;
	b=wnlrW0BPk6J1UjTxyEoPX3b9r8ROAceNhI5IBfoPZTyouPmluSbhDY1FqrMI8B/khdFY
	 Sxuo9jGzwHWXB3wpA9yxCM9QRKjdqNNoTtghdl/cozJm8PQG0dSIZVh/hykvZXJcPiZ6g
	 Q2jJLqE525HGZSVuJoNcuYjBUUoLVJPU+kzNECWvJycxTvN/opZ7sx62h+MmJf+P32Co3
	 HvzcW2rxXTAMboEU9CFzyLvE8u2rMJmcqIb20Svrxw1Q/DYTu/kSCFkmI9dHrwGANsTZa
	 R0cOYdEQZI5graH4Cp4te5g/1PnAtcCbTRq0/719V7d9WK5OeOKzzn8YxTkU7AqKB+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M0fMUZ6F;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XV+ipwTW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A24606A325
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1A24606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M0fMUZ6F;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XV+ipwTW
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JJ5ubT2574975
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:13:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jS+Bq8s7EUDu4GSq8520KkV5KJNW6foagnSih0NwpR0=; b=M0fMUZ6Fb4oNf5TM
	zLzNK2cgNvEfObJYq99kohKPazYP4z8CkhpecWaWG4uSRg/lDykGnxTofvOJFGij
	6is1UhUrjNIFLkzLYxGvLgo7s3t3+ymqXPoigLv8NYw+gIBI26wSaQofbhJO//Xk
	MozR5BsMBJ/nYXNnm68HrQpH9gKFKePu0KbV341ILBBDE/A2hKbmUOjIXFXJVUaj
	D8FEAJkg0Hvb0l/YgQtt3EO8IVJtweE1cWzips2vKQ8gh94OUoXisX85WicpcHZw
	ql7bYEGXh4GI+31H2fl2IDU/DEn1sq4QlnIW0AnbBxaF/NEQySYRHPltk6LadYNt
	hPasyw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdr4a08xa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:13:12 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3510d0baf63so6222816eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792437192; x=1793041992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jS+Bq8s7EUDu4GSq8520KkV5KJNW6foagnSih0NwpR0=;
        b=XV+ipwTWvh2ymM3M1aqtndzNGWzZu1BMu9n6Vn178UfS+z5DHhvwIBB/r2k6uL4RRs
         ENouWcx65itvtcg+8YOu5lfE/pt0OAgSu+EpUEhGe41nzLt1KkSPm87fGeM1wG9TzWfn
         BkgGcwhFObdOaMDd8BnWT1UAIluedbOh8gmPn8qDxk3GnrlKzTPNegjp7t49noXHV1MD
         gZoyh4RbhtlsntHYGMI51FbpzHAPbvdLUMAvLIIIz34LwklqaFOD/XgFJQ5OhRxSayQQ
         8xXOXVQuy+khYKb3JVOd8pyPI6cb24aD18JQD/6Wi9KXPbWv5FOEKp78Y1IBFRCZvTV4
         YA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792437192; x=1793041992;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jS+Bq8s7EUDu4GSq8520KkV5KJNW6foagnSih0NwpR0=;
        b=2HIEuHMkTkcIYGdYHvsdewBQF5VpaIIfn3cA2DNtjlUBhPnIrD7fMB8/TWYxJMJ6am
         FBSIOxZrhxLDW9RWTX3I98la9u2K+fV6tYzDhcsFl0yt+d4/vHuXK0yyj25DzJuMonwi
         kw1BGp7n5X55fZ/pqrCaNamBsli9fRqBk9YIYFTC3TTYlh9szosu1tElWtzP8xY0v85n
         UyRxFTGHkeGV3jKnI33fDKG0ctbt7RkSWbAV3Z2k5WXKQK5XvBjhq7ujRcWinnexjqqq
         jJVorUs7mGhiioGgcHNYQIO3BjbUSp2FUn5P93dOPk8MhKyjG+tZxW9x815llotclOFS
         h5RA==
X-Gm-Message-State: AFq9FYL0pjIoOAq0zJu++OeBebDyyUoCwZR7fbqppZ9xNi53a3BzXKdI
	FviQYy0PvJjqOz8OSuuIwowOMtpfDRTs6n7ctx/CQ4fFL5HvQ49VEt3ohue9ul4aWXU1Ml2vHvP
	TA7feRMa1IA8D6Q7uToZLuHNVSy54d2y6xtMZ18xnoW6H9ia2IjKFjcOTnQkJk5aPVdc=
X-Gm-Gg: AYBFou3IHnL6bf0/wJceNwubJx02n+QDRIz0oiCTES7erEMpzxWdpgR2lLKA+nHXqdG
	IumQd7KQC+WymTFfR/bt1c3tS2gbbIVik4QO86/o/8+vYKtkU8tX94iqfXPlocGs1LEyskvsmJ6
	lc1OP7V1LGttILgHJyxWPJft8oDtqBlxaLUz3B4T7HyCjRWNAL0++hVuK5FT3O+CuCafhaFHpMb
	Z3kUayBOLudRDhR1AdLc4M+SC28ciont3KujnWNtQLe47k/u+dXMZ4uEkMnnhXbTbzHn9NRbhux
	BXqk937XxwbmIjxisBs9RqpEONANsKXkZCcPAHEZkHz8J1sf8t2lfib1MQgZMuGsEYt76zs4XBt
	SLCYlnjeLUrwGVPTy6gSXkBeiepx5DMZgBqyb6uSQsg==
X-Received: by 2002:a05:693c:87ca:b0:35b:c1d2:eab9 with SMTP id 5a478bee46e88-361a2e3d3abmr11230588eec.39.1792437191389;
        Mon, 19 Oct 2026 12:13:11 -0700 (PDT)
X-Received: by 2002:a05:693c:87ca:b0:35b:c1d2:eab9 with SMTP id 5a478bee46e88-361a2e3d3abmr11230522eec.39.1792437190619;
        Mon, 19 Oct 2026 12:13:10 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm42939717eec.20.2026.10.19.12.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 12:13:09 -0700 (PDT)
Date: Mon, 19 Oct 2026 12:13:05 -0700
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
 <leitao@debian.org>, Dan Williams <djbw@kernel.org>,
        Terry Bowman
 <terry.bowman@amd.com>, Ard Biesheuvel <ardb@kernel.org>,
        Morduan Zang
 <zhangdandan@uniontech.com>, linux-acpi@vger.kernel.org,
        linux-edac@vger.kernel.org, acpica-devel@lists.linux.dev
Subject: Re: [PATCH 4/6] cper: add helpers to handle Memory Error Section 2
Message-ID: <20261019121305.0000433f@oss.qualcomm.com>
In-Reply-To: <20261019145643.1877246-5-pierre.gondois@arm.com>
References: <20261019145643.1877246-1-pierre.gondois@arm.com>
	<20261019145643.1877246-5-pierre.gondois@arm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA3NiBTYWx0ZWRfX8ynzQBMJe0Bx
 yO6DtBQXDEtj2mTSv6Zki9mjQfuPkjLoJwbwLEBPh9KFl2/qKtLT+3883z73GbffFmEAnpjYPQm
 U8OxruW9mqBCoJzw4nNKOXMU2xoNFBA=
X-Authority-Analysis: v=2.4 cv=Zt54uN7G c=1 sm=1 tr=0 ts=6ad66bc8 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=sh56xHOc4yr7ZHq0_TkA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: o3RmmmnYpwQFtxjnouKi9NQ6qzIZ7F1T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA3NiBTYWx0ZWRfX1FN6ZPgNrKz6
 sPnBO38dIGBY1JRfM0v85nhcAMDo6Dsxq0phivdVd0j2SeaIkXkVhTOSe+kTaP8jWPu9P4WhDl6
 hX81x2L7Uoab0ms5pSp7/p50osFMtSRdNnb7l8M+KSAYB7aAHZI2RFrwgcMZihCGYl8lGixJ3nd
 Uhv3j6OfOrTG9m5wiRRio/hzZa/CN+LcXpEBjNBDYeVYN+roRphDpOE0q+ktvQUFEuqKdj+rqCf
 PmcFiaS+fa01qJD36m5JCfHhhSc34ThoPOSs0XjjeP4QWCzkv5S/8UvqyxfrEARTiv/t4zBVkdB
 p40RWW2MWk2jVA/pHSvukCynrKNTSR9I24t9g/TpDPgbUcq/1syq62zoKkWtfXsUHesAthN6sb8
 hymHfoKcw68wUEKjB+Hm6SbK5HHzncu/gHBXn4rSxha6kbVESVPrT4A+ThnRyKsQk/masKPDaIk
 i4ZFnafwoSIanHURI1w==
X-Proofpoint-GUID: o3RmmmnYpwQFtxjnouKi9NQ6qzIZ7F1T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190076

On Mon, 19 Oct 2026 16:56:11 +0200
Pierre Gondois <pierre.gondois@arm.com> wrote:

> Add separate location and printing helpers for Memory Error
> Section 2:
> - cper_mem_err2_location()
> - cper_dimm_err2_location()
> - cper_print_mem2()
> 
> Similar functions/logic exists for Memory Error Section (1),
> but require a compact version of the record. To avoid relying
> and propagating a non-standard record format, the new functions
> diretly rely on struct cper_sec_mem_err2.
> 
> Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
A few comments but they are about spec confusion or trivial.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> ---
>  drivers/firmware/efi/cper.c | 108 ++++++++++++++++++++++++++++++++++++
>  include/linux/cper.h        |   3 +
>  2 files changed, 111 insertions(+)
> 
> diff --git a/drivers/firmware/efi/cper.c b/drivers/firmware/efi/cper.c
> index 06b4fdb59917..5c9b832b67a1 100644
> --- a/drivers/firmware/efi/cper.c
> +++ b/drivers/firmware/efi/cper.c
> @@ -445,6 +445,106 @@ static void cper_print_mem(const char *pfx, const struct cper_sec_mem_err *mem,
>  		printk("%s%s\n", pfx, rcd_decode_str);
>  }
>  
> +int cper_mem_err2_location(const struct cper_sec_mem_err2 *mem, char *msg)
> +{
> +	u32 len, n;
> +
> +	if (!msg)
> +		return 0;
> +
> +	n = 0;
> +	len = CPER_REC_LEN;
> +	if (mem->validation_bits & CPER_MEM2_VALID_NODE)
> +		n += scnprintf(msg + n, len - n, "node:%d ", mem->node);
> +	if (mem->validation_bits & CPER_MEM2_VALID_CARD)
> +		n += scnprintf(msg + n, len - n, "card:%d ", mem->card);
> +	if (mem->validation_bits & CPER_MEM2_VALID_MODULE)
> +		n += scnprintf(msg + n, len - n, "module:%d ", mem->module);
> +	if (mem->validation_bits & CPER_MEM2_VALID_RANK_NUMBER)
> +		n += scnprintf(msg + n, len - n, "rank:%u ", mem->rank);
> +	if (mem->validation_bits & CPER_MEM2_VALID_BANK)
> +		n += scnprintf(msg + n, len - n, "bank:%d ", mem->bank);
> +	if (mem->validation_bits & CPER_MEM2_VALID_BANK_GROUP)
> +		n += scnprintf(msg + n, len - n, "bank_group:%d ",
> +			       mem->bank >> CPER_MEM_BANK_GROUP_SHIFT);
> +	if (mem->validation_bits & CPER_MEM2_VALID_BANK_ADDRESS)
> +		n += scnprintf(msg + n, len - n, "bank_address:%d ",
> +			       mem->bank & CPER_MEM_BANK_ADDRESS_MASK);

I guess this makes sense. I couldn't figure out from the spec if there
are rules that say whether expected that VALID_BANK is not set when
VALID_BANK_GROUP and/or VALID_BANK_ADDRESS are set.
Safer to just over print than read stuff into the spec that isn't there.

> +	if (mem->validation_bits & CPER_MEM2_VALID_DEVICE)
> +		n += scnprintf(msg + n, len - n, "device:%u ", mem->device);
> +	if (mem->validation_bits & CPER_MEM2_VALID_ROW)
> +		n += scnprintf(msg + n, len - n, "row:%u ", mem->row);
> +	if (mem->validation_bits & CPER_MEM2_VALID_COLUMN)
> +		n += scnprintf(msg + n, len - n, "column:%u ", mem->column);
> +	if (mem->validation_bits & CPER_MEM2_VALID_BIT_POSITION)
> +		n += scnprintf(msg + n, len - n, "bit_position:%u ",
> +			       mem->bit_pos);
> +	if (mem->validation_bits & CPER_MEM2_VALID_REQUESTOR_ID)
> +		n += scnprintf(msg + n, len - n, "requestor_id:0x%016llx ",
> +			       mem->requestor_id);
> +	if (mem->validation_bits & CPER_MEM2_VALID_RESPONDER_ID)
> +		n += scnprintf(msg + n, len - n, "responder_id:0x%016llx ",
> +			       mem->responder_id);
> +	if (mem->validation_bits & CPER_MEM2_VALID_TARGET_ID)
> +		n += scnprintf(msg + n, len - n, "target_id:0x%016llx ",
> +			       mem->target_id);
> +	if (mem->validation_bits & CPER_MEM2_VALID_CHIP_ID)
> +		n += scnprintf(msg + n, len - n, "chip_id:%d ",
> +			       mem->chip_id);
> +
> +	return n;
> +}
> +EXPORT_SYMBOL_GPL(cper_mem_err2_location);
> +
> +int cper_dimm_err2_location(const struct cper_sec_mem_err2 *mem, char *msg)
> +{
> +	u32 len, n;
> +	const char *bank = NULL, *device = NULL;
> +
> +	if (!msg || !(mem->validation_bits & CPER_MEM2_VALID_MODULE_HANDLE))
> +		return 0;
> +
> +	len = CPER_REC_LEN;

I'd move this to...

> +	/* SMBIOS handles are 16 bits; never truncate a Section 2 handle. */
> +	if (mem->mem_dev_handle <= U16_MAX)
> +		dmi_memdev_name(mem->mem_dev_handle, &bank, &device);
> +	else
> +		pr_warn(FW_WARN "Memory Error Section 2 module handle 0x%x exceeds SMBIOS range\n",
> +			mem->mem_dev_handle);

here just because it isn't used until down here.

> +	if (bank && device)
> +		n = snprintf(msg, len, "DIMM location: %s %s ", bank, device);
> +	else
> +		n = snprintf(msg, len,
> +			     "DIMM location: not present. DMI handle: 0x%.8x ",
> +			     mem->mem_dev_handle);
> +
> +	return n;
> +}
> +EXPORT_SYMBOL_GPL(cper_dimm_err2_location);
> +
> +static void cper_print_mem2(const char *pfx, const struct cper_sec_mem_err2 *mem)
> +{
> +	char rcd_decode_str[CPER_REC_LEN];
> +
> +	if (mem->validation_bits & CPER_MEM2_VALID_ERROR_STATUS)
> +		printk("%serror_status: %s (0x%016llx)\n", pfx,
> +		       cper_mem_err_status_str(mem->error_status), mem->error_status);
> +	if (mem->validation_bits & CPER_MEM2_VALID_PA)
> +		printk("%sphysical_address: 0x%016llx\n", pfx, mem->physical_addr);
> +	if (mem->validation_bits & CPER_MEM2_VALID_PA_MASK)
> +		printk("%sphysical_address_mask: 0x%016llx\n", pfx,
> +		       mem->physical_addr_mask);
> +	if (cper_mem_err2_location(mem, rcd_decode_str))
> +		printk("%s%s\n", pfx, rcd_decode_str);
> +	if (mem->validation_bits & CPER_MEM2_VALID_ERROR_TYPE)
> +		printk("%serror_type: %u, %s\n", pfx, mem->error_type,
> +		       cper_mem_err_type_str(mem->error_type));
> +	if (mem->validation_bits & CPER_MEM2_VALID_STATUS)
> +		printk("%sstatus: 0x%02x\n", pfx, mem->status);
> +	if (cper_dimm_err2_location(mem, rcd_decode_str))
> +		printk("%s%s\n", pfx, rcd_decode_str);
> +}


