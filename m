Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794335662;
	b=XgWEpEzKcSKrduM2mBynYJNbLtU3KvcvMF3dV7ZA9ZTgJkfF8xT1nAbQGPth5xaaetIr
	 1Hg/3HlA8782G8pGxj324xh6mHCOYnZHSfss+jz3VXGxZsBhZzDe0ULIGG/oGcE2Z/CpG
	 HKJajGttuW8cS+cm5xYZNcMSlhl500KxzZhThI9DJLHX+b9yrRZYmzGziOz2lVQzmRhT2
	 ztepsR6HZYVw+6TEh4qJ14BEgDn2OgX8028JPyUpCu3QOm5VOfkN+0QAknJ/eh2nmftAZ
	 00AYQgNZlQfSMWW0NBJxh16CNFKS94hd8Dicnmuzl6OLFmFhhKv+KuInARGDsOtTydw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335662;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xyV7qBNwckqTtIsssEL9NaExu/jjkMlfPFwS4GdvAeo=;
	b=Ufz31tBVO2EXcfKGgsgLfffQ5QbaVmXE/nltSsSxsroK+F7yWE3Pz76OjLHWL7iEpUTL
	 J5noNBi834gr9ILpdcc+CetiSV/LMNdPyA6wUV7fKGvmOQwRy9SxfNqfrq+AeDwrxGMQm
	 o0d+AvuqqtFygRJdPo5gMrUvi65eRyLf9ojJ9uL6A8XqiAWiKkgDlWB/ifX9kNfqaUiki
	 XA/ExDMFDz/2t/C0SWiSEaLkWcWvTrjopaYGr6D9RFbfilwCX4CLemN9nVnOh0zUtfMbV
	 l8UVJ0WY63YH3C7Ez0yZSSi1YYtL+WWXPZmwWAfs151k30DiKdtRFBYQBSVvr49LMHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SaJ7MQkV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PJWoPU1t;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A8E606A323
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8A8E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SaJ7MQkV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PJWoPU1t
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF04nZ141468
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xyV7qBNwckqTtIsssEL9NaExu/jjkMlfPFwS4GdvAeo=; b=SaJ7MQkVqcEov/Zp
	G6DNO3M5WaRiQEC2W9C8uSRw8U7nBHky9LwKAIU+gO97H5lyVLGNYcciTkXSPaJl
	bw+jay9tS9q3KPO0pMduEhONBECQDouysnAtsX47aDH1aqTkMMpRe7GDzzqTcfBk
	K2JRFIbkGZk1LTqFyGiedJOKy5CedEtaHKH/CvhUbomoePhT26Za/Oy6S5Pv2A/7
	gsm157jneUh2GCVmKUfk1bvMRBbBOpt+Fk+wMTtZ/chSQbNhYmDxSdIhXsVcLtfp
	oeF1h9KrcqRZ+Ie4BJL1a3P1vdci9K6N9LVFk6ZNWAS7Rrn/JwsNrbeosStDljke
	4kRmkw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg4w4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:34:20 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a71dd190b0so397363c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794335659; x=1794940459; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xyV7qBNwckqTtIsssEL9NaExu/jjkMlfPFwS4GdvAeo=;
        b=PJWoPU1t25de2MlhkGiNQ0++f4O/Vwz0xmG6c/jYOEgN0OvyPbewjN/It4VWQ2LEOI
         OPQ3gBKK0iFiD8HJ1gY87GrQ2/nGsZCRdp4bMc8T59bttZQyVnY9Mq5awZ818jmftRlI
         CjA6yjku11xi+Zad27f7ydCqnuQksNzzOf0TR34L5brXGgr95ixa8ZSzQM++ZundG+yY
         yAQ5va75zMJFs7Apih9Hwf99GQWZIL0rGxhecZxeMggIsWnwyZAfNXLFwlj4AZ0HbGAN
         YDLlr7WfaE2oNJj0nfDbzb5xwdhNuc5p9F8aeESVpnquz9ScszQHm7Lv4cizPdCTc5/u
         l7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794335659; x=1794940459;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xyV7qBNwckqTtIsssEL9NaExu/jjkMlfPFwS4GdvAeo=;
        b=smJnOZxGeeLE+5TU9YVZhffbIvPDpI6dv6QsG13rTR8zRJ4lX8rMMiJOoER7CkLtS8
         ysa/hsfKmXfy7vhiCA3djsWWwH6sszf4viX/FgIV62YXd1jjGHNjordIYBtuzpsNHghA
         Ff4TOCIj1pSoLjSWGUI7Cvmlds59R9AurG0p6Yyy4IBT04kZaClUxMeou7vQRi5QUzjV
         vYWmwUUGJqOK1yXb2OVA8Q/OqJwY0724oTPILXfmf03EwLw4tEr1l2ThJ4zwJYg1sJIK
         pBuGUuLJuwZtEOEbh1bRMa9MDpcwre30y42K/UQG+iHHB/Vwr00daPrblZ4wVxn8Sg41
         bcIw==
X-Gm-Message-State: APuU4Z9tg3LbKfJf0JVvcywO+D1jEdPqlpkQjec1t8a6u2rqwmQs877B
	eGeAHbgTxS5R4Ou5sJbvi8rL4qXyPuTbarVz7Booatux96BfxWXIm/MoVJj7JCcYCMxJJW5Idlo
	RoGkpOnvj5p9k3C2rFqw0n1zMqnFmB2ZIN/uboqbrssLtMg+y9i1ckDxRgXOHpQH+J2w=
X-Gm-Gg: AYBFou2t5zfRU/4HUGObL0V6pJ9gxCJqP+QWJQK8UzZOBbHlppzO3C3sGP9bXar2Igz
	+jqdmrtRg+7sOUx8hXm9GMCBKwhB4QfJ5zunmjckUo6fE9B2PvVYrftr59aDmRPVguqaohwT6xw
	tTYwOQuuiJ4CsgFhSQc3KIUrcJGEITSUL4oidlPmt/dkagyrtT97MU11WU3xUDgliivpBHfG7rQ
	k0KAdrz62KKuaQn56/pGv4Wglcb+Hk/TvnFpt8rWhp0NWGq2ammuWXbquUSTt1blLr+Zjot/Ku9
	cuhksOyUs2kCV/G+SRFmspJnJSCKA9UN+TD8q4C5brxCak8m2oo6v9HhiO/5aTxYd+nJGXYuEeE
	NP8vBj99Ryu9rgZSev3POdJbNr2NH+BOerNh5TWGDssUvPOmFrGAJLktfTNgtf8WEdorgn7Vu6X
	rT5paEaqhoFLMlaj83ezHVZfYQAvc=
X-Received: by 2002:a05:7022:1109:b0:1ac:f84d:403b with SMTP id a92af1059eb24-1b3b6054c1fmr4484103c88.8.1794335659307;
        Tue, 10 Nov 2026 10:34:19 -0800 (PST)
X-Received: by 2002:a05:7022:1109:b0:1ac:f84d:403b with SMTP id a92af1059eb24-1b3b6054c1fmr4484060c88.8.1794335658518;
        Tue, 10 Nov 2026 10:34:18 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm17591012c88.10.2026.11.10.10.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:34:18 -0800 (PST)
Date: Tue, 10 Nov 2026 10:33:56 -0800
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
Subject: Re: [PATCH v15 15/35] firmware: arm_scmi: Add Telemetry TDCF
 parsing for BLK_TS lines
Message-ID: <20261110103356.00003a29@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-16-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-16-cristian.marussi@arm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3MyBTYWx0ZWRfX3wTDX+VBlYkJ
 lqHI+wpq10Y/+YJbRR+CMD8wEvcJmKlUf65v2z1nTtjmqw9yWYq/QMRxSjGQYK+zH9JNu8lzAH0
 ZWkpcWSo2ZZOV2lICbSi95MMZ8VAkgN3BUfZhzEUhRyoCgUQREcaFyssyp84VSdOs2WN52tJ1XD
 bE10y6hMVwF2bSMCiRL9Wr+TJVxcLo+cKG/D6aYMl90eqyH8xpikE4bxWa9i0obqadnqLOAx9Xx
 flR+xgES5Zx0jXmrg7vIXZI/cEWfUWuRb42sOpjPhg4xbbJlhcf3V8hs8JVr3Zxv/o8Pj/+i8/6
 dCZbaOrvlJesK5qh08Aq4YbKmlj91iWG9Ln/A+kyq/KytkUSbdOUS6c2Jpp4/USub53WnThZaEU
 93s/+W2cUzhNfJoifR/TE2JLp4wO4QdMQT86xExiP2Tu+nThdlFczHnG1uyskffe78JDX/ea0o/
 s14S7fvccYTL2KShBNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3MyBTYWx0ZWRfX5SIzJyaC3s4F
 eBUnHV9ATN70NUlrqYk6jFPnN76IB3J+PeJxxDw18V8ZLgOkPhoZtwZmlJ+9Vgy4VKxSSfqPFHB
 MN8f+60Ng1LT0LXJW18JlR6lct6aoFI=
X-Proofpoint-GUID: WCwULPf270ZYpkeFtm1T5z-X5sytjut9
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af363ac cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=JRCmi-Q6nD18N7oa2wEA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: WCwULPf270ZYpkeFtm1T5z-X5sytjut9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100073

On Mon,  9 Nov 2026 09:12:01 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add support to parse, track and link TDCF BLK_TS lines to the related
> discovered DataEvents.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

A few minor things inline.  + I think some of previous patch belongs
in here. Getting patch break up perfect is sometimes a pain, but it
really helps keep things logically together for reviewers and on
a massive set like this, anything that keeps the reviewers happy
is the way to go!

Jonathan

> ---
>  drivers/firmware/arm_scmi/telemetry.c | 317 +++++++++++++++++++++++++-
>  1 file changed, 313 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> index 810195889484..e3fbcb1e6ea7 100644
> --- a/drivers/firmware/arm_scmi/telemetry.c
> +++ b/drivers/firmware/arm_scmi/telemetry.c


> +
> +static inline void scmi_telemetry_line_free(struct telemetry_line *line)
> +{
> +	void *blob;
> +
> +	switch (line->type) {
> +	case TDCF_BLK_TS_LINE:
> +		blob = to_blkts(line);
> +		kfree(blob);
The local variable isn't adding much over

		kfree(to_blkts(line));

> +		break;
> +	default:
> +		WARN_ON(1);
> +		break;
> +	}
> +}


> +
> +static struct telemetry_block_ts *
> +scmi_telemetry_blkts_create(struct telemetry_shmti *shmti, unsigned long offset)
> +{
> +	struct telemetry_block_ts *bts;
> +	int ret;
> +
> +	bts = kzalloc_obj(*bts);

Use a __free() here and then no_free_ptr() on the return.

> +	if (!bts)
> +		return NULL;
> +
> +	ret = scmi_telemetry_line_init(shmti, &bts->line, offset, TDCF_BLK_TS_LINE);
> +	if (ret) {
> +		kfree(bts);
> +		return NULL;
> +	}
> +
> +	trace_scmi_tlm_collect(0, shmti->info.sid, offset, "SHMTI_NEW_BLKTS");
> +
> +	return bts;
> +}

> +
> +/**
> + * scmi_telemetry_tdcf_blkts_parse  - A BLK_TS line parser
> + *
> + * @ti: A reference to the telemetry_info descriptor
> + * @bts_payld: TDCF payld line to process
> + * @snap: A reference to the working SHMTI snapshot that will be processed
> + * @active_bts: Input/output reference to keep track of the last blk_ts found
> + *
> + * Process a valid TDCF BLK_TS line and, after having looked up or created a
> + * blk_ts descriptor, update the related data and return it as the currently
> + * active blk_ts, given that it is effectively the last found during this
> + * scan.
> + */
> +static void scmi_telemetry_tdcf_blkts_parse(struct telemetry_info *ti,
> +					    struct payload *bts_payld,
> +					    struct shmti_snap *snap,
> +					    struct telemetry_block_ts **active_bts)
> +{
> +	struct telemetry_block_ts *bts, *previous = *active_bts;
> +	struct telemetry_shmti *shmti = snap->shmti;
> +	u32 meta = PAYLD_META_RAW(bts_payld);
> +	unsigned long offset;
> +
> +	/* Check for spec compliance */
> +	if (BLK_TS_INVALID_RAW(meta)) {
> +		trace_scmi_tlm_access(0, "BLK_TS_INVALID", 0, meta);
> +		return;
> +	}
> +
> +	offset = TDCF_OFFS(snap->base, bts_payld);
> +	/* A BLK_TS descriptor MUST be returned: it is found or it is created */
> +	bts = scmi_telemetry_blkts_get_or_create(shmti, offset);
> +	/*
> +	 * On error processing the new BLK_TS bailout taking care to clear
> +	 * the previous last active BLK_TS to avoid mistakenly binding to the
> +	 * next data lines.
> +	 */
> +	if (WARN_ON(!bts))
> +		goto out;
> +
> +	/* Update the descriptor with the lastest TS */
> +	scmi_telemetry_blkts_update_snap(ti, bts, bts_payld, snap->magic);
> +
> +out:
> +	/* Drop one refcount on the previous active since we found a new one */

I'd have this mention where the reference was taken as then it's clear why
it makes sense to drop one here. Something like
	/*
	 * Drop one refcount on previous active to match with the one take
	 * in creation as no longer need to keep it around for potential new
	 * users.
	 */

> +	if (previous)
> +		scmi_telemetry_line_put(&previous->line);
> +
> +	*active_bts = bts;
>  }
>  
>  static inline struct telemetry_de *
> @@ -1561,7 +1801,8 @@ scmi_telemetry_line_data_parse(struct telemetry_de *tde, struct shmti_snap *snap
>  		*tstamp = 0;
>  		if (USE_BLK_TS_RAW(meta)) {
>  			/* Read out the actual BLK_TS */
> -			*tstamp = scmi_telemetry_blkts_read(magic, tde);
> +			*tstamp = scmi_telemetry_blkts_read(magic, tde,
> +							    bts_payld, snap);

Noted in review of previous patch that I'd just have all the parameters
back there rather than adding these two here.  It isn't consistent in that
some parameters were used and others not, as in that patch magic wasn't used
either!

>  		} else if (LINE_TS_VALID_RAW(meta)) {
>  			/*
>  			 * Note that LINE_TS_VALID implies HAS_LINE_EXT and that

> @@ -1906,6 +2187,15 @@ scmi_telemetry_shmti_refresh(struct telemetry_shmti *shmti, int *idx)
>  	return work;
>  }
>  
> +static inline void
> +scmi_telemetry_reset_active_lines(struct telemetry_block_ts **active_bts)
> +{
> +	if (*active_bts) {
> +		scmi_telemetry_line_put(&(*active_bts)->line);
> +		*active_bts = NULL;
> +	}
> +}
> +
>  /**
>   * scmi_telemetry_shmti_scan  - Full SHMTI scan
>   * @ti: A reference to the telemetry info descriptor
> @@ -1976,6 +2266,7 @@ static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
>  		qwords -= used_qwords;
>  	}
>  
> +	scmi_telemetry_reset_active_lines(&active_bts);

It's only resetting one.  Maybe reset_active_line?

>  	srcu_read_unlock(&shmti->srcu, idx);
>  
>  	if (ret)
> @@ -2120,6 +2411,22 @@ static void scmi_telemetry_resources_free(struct telemetry_info *ti)
>  	dev_dbg(ti->ph->dev, "SCMI Telemetry resources freed for instance\n");
>  }
>  
> +static void scmi_telemetry_lines_cleanup(struct telemetry_info *ti)
> +{
> +	for (int id = 0; id < ti->num_shmti; id++) {
> +		struct telemetry_shmti *shmti = &ti->shmti[id];
> +		struct telemetry_line *line;
> +		unsigned long idx;
> +
> +		guard(mutex)(&shmti->lines_mtx);
> +		/* Drop all remaining currently unbound lines and their containers */

I'd avoid the comment.  It's a _put so should be clear there may be references
held that keep it alive for now. The comment kind of invites questions about what
it means to drop unbound ones here, and what the lifetimes of others look like.

> +		xa_for_each(&shmti->xa_lines, idx, line)
> +			__scmi_telemetry_line_put(line);
> +
> +		xa_destroy(&shmti->xa_lines);
> +	}
> +}

