Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792584125;
	b=E5Gyg/GXqOmSsVkB5RKeWVnS78A6ofWmOA5EQiznZZxQefLCR0QVtFGIllku+Dk1p1ZK
	 WVvkTGT8S33O+WnfjTaGE7I5NbA3jyiC2JZb3ZxXguJurdeHFqMNg7vCUrAGGT9iwhppb
	 JlIPLTMvVAptrleptF8bHKimiWh4Pk753DQZAk7gSxdgwVwWy1d3P96uNCmvCN4598gYp
	 TweAbMmD7wZZnXb5lGXsZvRrlkiv29+3Db/S20SIxuct/etJVFNcMtOxFT1iHxcVbGkIH
	 t44Z0nIgaoQ2w8u1haCZXlHrj9JWNMTuLCtHycbL4ZeOMvMPE8KlOToELk40HaZVeYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792584125;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EVBWhBNwvJnn7Ws+ijlz2Lxzn6HvU0X/M4KXc1HZ98Q=;
	b=QzU+Qcf6zGqItMxW1jfFy23tEneLGkj1ElesNgrtTf3CLbq4xN2hGyDR1ZZ/a+ska0Kd
	 XnbwQI+TS6e6MKqlHma8N8pFwcMqAnTtT3kqQ211kWxjTJERVrqKzjKxqMh2XcMFGqVkR
	 1ItAkvkLbzm4XjnRx7uv72sU2N8yQLlGl5Afskk2venMCeGIDGS1DEQElpAFRrBjHtH5z
	 rzjthSJY5k2Y9g1QF0L/TifPxAuwNS1B5XK6RmbfdOw0Jn4+F9dU3VQnU8q9zRPSK/4v8
	 lsS8+7UsatMvT+34Usui8IF9srbxgVnApB6zUw7/wYfqCzws9YmWEcqfruJ/aEFb58w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BDmcwGFM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a73dsg16;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BF4606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9BF4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BDmcwGFM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a73dsg16
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg7dG3658160
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:02:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EVBWhBNwvJnn7Ws+ijlz2Lxzn6HvU0X/M4KXc1HZ98Q=; b=BDmcwGFMMdrh1UPm
	HJxhGbjkjI5fXRmTJxaC7CP0Rn7Z+ropIamYnHW8bzwNXwH5sbdOgPBu8gqycnDb
	Lef3X/1wYhbswAOFYi1KWr5yV7uaOXCGzjV7bQSnPf+ch6PKWj0APqKPXYrapx+X
	4DKWROB51R3m4Lq99LK2ZT1rd9XPEkdlSvRrl+ftlc6RdzrqHCR0w8ZHHSu938C2
	et5fNLdv5QSHJFMrnA24FbDNSmxCnvy28qNSQCWj5/3NR535FfNgzWRgm+n0bpBu
	i8P9l9dKr60eTpHgDaYtDuzsRR13kTpv++0op8AwYeK4dVrnkG9Z1D5Ki9ERVXqX
	4CX3pQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb9bk1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:02:03 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a47617a0b3so718884a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792584120; x=1793188920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EVBWhBNwvJnn7Ws+ijlz2Lxzn6HvU0X/M4KXc1HZ98Q=;
        b=a73dsg16FchPeICaCb458DDfGMIwv4XWhn5emHDqjqlgIEq5MnXFljn3BP2cIeGIqW
         Z5uqrbHPxjw71Nd4U64kR9HgV+pn+GWvKA02VHDUoHgZ1MM8B7Wfj4b+0DnpFmZBBGzI
         YIAEseEf0HvcK716/JfBykknYoJyIgswYrYViQX0OcbF9C1sUvL5KDzBLjupmLpTtgtV
         HShfAEgx7JrAixRuJzZRiCH/mW8nhqvojgAT6eTvMMERjxmgPIjaspj5/rDqPIRjZsuP
         AUSRBWfxx5lxiDe8RQ3IeBGjgHePVUzaaF1daHxZEJT0y9DEVdvgtVwb9q23hClc47Fm
         WS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792584120; x=1793188920;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EVBWhBNwvJnn7Ws+ijlz2Lxzn6HvU0X/M4KXc1HZ98Q=;
        b=bhfBWHt7XnpXFlu7zBiwhMXNG3VTAv8wkmKu9P9dcpVM9bHgtGCbon7IkEuu3D2Qc4
         DhWFao0/TvwFBPG4uaFwUrtFa1ikOncaOdZFpXYkpfEHYnrh04bZBh7z+z0YEbyel9Hj
         32yp6kFLsG67dyzVa/6W2TiwJza0aYJ+pdGaj+9luJinBgTJa4fBsGDh+bGwnhE9Pce2
         dTpuy0dALxPMygVbQqPQXEpslksrcPgluXcoJQzwQqAhLbDa4lFGv3g/D4/F4pnxKoAl
         cxbwB4W3mCSw9tFhm+ovzgZFuBjEA+2FGZgk/7bqgwhQvLYCFAAoB1KXtx/nhSsfiuPC
         fJOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvohbAqYkSvhmJNpmToGC602IfAID7UO0Tu9OeC1nCZROTNsMrbb4HBqlWm+Hzi6IHPM72eOaU86GPpUk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBiaJ66xdtMJaf3CzYaxE95hvg8aPAaFkAbfyKFP5r+42H1oyX
	/14tBw3FXI4jaTaYRW2cDn/KY23/0UBvuOPu937+J4tJZkVKAXW5CIxibEpdaE0M+bRdfGCqwVt
	EctlN411Qc0P35SlhBmUbPvFZcdqIR+UfIclYRER4aMMjzwVy5Y/dlEzgFSiXJfHJD17k0sy+bP
	E=
X-Gm-Gg: AYBFou2bkyFJjfrlyCpE/r+p+QfFu7npDDtKRiBj4d6F0lZqkNbrjUZO7VzRYA10xzH
	fAcegY4EyrlyRF747enpxPjX15WVnt5Nvt8ifHCG3cuehOagqjfBMUdpNMr6ChSC4ZsZMknTu6u
	3AwDhQUhe06rcEXwBlBeG5ktoJeg3zx0Zsm18hsPJ0BX8/+bjRWvfiYWkbUH7W8vi52vjwTFQw5
	rKPFFUbGI73FFmoL/DB6c3A3hXHTdrmqAd7xlvUpKUmRQWzTzS1p/fFP+1urdDENKpLFjBu7t5/
	mZQHsn4UU0OuuydbioLnD966vYFIpIupawA+6pSZcxqZS/RGJlTTflk4rUp+ck2OU+2ChcmdrPr
	iW71XYA6BxANzqU0Dj7j0j1Lhnf6RbtOGFQ==
X-Received: by 2002:a17:90b:510a:b0:3a4:e934:e85c with SMTP id 98e67ed59e1d1-3ad86d500ebmr1395078a91.41.1792584120208;
        Wed, 21 Oct 2026 05:02:00 -0700 (PDT)
X-Received: by 2002:a17:90b:510a:b0:3a4:e934:e85c with SMTP id 98e67ed59e1d1-3ad86d500ebmr1395045a91.41.1792584119294;
        Wed, 21 Oct 2026 05:01:59 -0700 (PDT)
Received: from [10.217.240.81] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad80303567sm4221616a91.14.2026.10.21.05.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 05:01:58 -0700 (PDT)
Message-ID: <984bc755-07f1-4c7e-9efe-ecc6b2ee5d5f@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 17:31:51 +0530
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
Subject: Re: [PATCH 3/4] edac: qcom: add LCP/SRP DDR DRAM ECC support for
 Shikra
To: Jonathan Cameron <jic23@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
References: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
 <20261014-master-v1-3-aba3cfcfbac9@oss.qualcomm.com>
 <20261016182608.65bae12d@jic23-hlaptop>
Content-Language: en-US
From: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
In-Reply-To: <20261016182608.65bae12d@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NyBTYWx0ZWRfXwDjfC4Qbv4JD
 Y2/iTVjDkzqK8botxFLVukIVU5+l5sXAXLIYbYgFopoZg336bHSbVfo60EV2dV3Y9piWyXiqDjr
 0dNpezH1Y9dFtTXnKCl2GUF1SkjLvzs=
X-Proofpoint-GUID: HgXN1Bn-sCkKHUyYBj-QqrlTn7r-dgYS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NyBTYWx0ZWRfX8v3IAebIVl0r
 nfXyLH7TMbA3AQfk7R+YeV6jvyCC3R2RWU6nogke/9rLBiI6aZI/xiYrLBg8o0xTb1tM34WLnaY
 V+D1dgcj5V9CizehqnJWq6CSzb4AFZuaOlu6TETH2ob6BFm3kHbumOn+LmR51N7p7V2D8CMfNfo
 AtdVjD5FDQS5whRYEiR5C+JFkUrir3cr9CyGxz5W8WKmcWJfjpUQIu98lStemYjnTUCi3nsUbny
 Kp5Kwn0zCJR/RIyLnHB7glhOjjmd4JBDM8nCgJWwIUD3V5ENZcY3janY3+Iaxm1jxJa4sqySUvu
 /wv6Gp2qz/Y6rqNh5A+pS9oiz8tg1DxgX0QvKB35o9PL88ojrj8/xt6MksV6bemNJjjNsckAHqM
 Rdxq/UKsphc3rp6ufk3L16DLiWngxAa7h/o/R0ymytTRqWFzT20QvfV+w1SJboSrsw3zOJOYFux
 QnGW0Fe/+WBrHPq2exw==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad8a9bb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=7hEWZ4R0ReQgp7LtlT8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: HgXN1Bn-sCkKHUyYBj-QqrlTn7r-dgYS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210047



On 16-10-2026 22:56, Jonathan Cameron wrote:
> On Wed, 14 Oct 2026 21:26:18 +0530
> Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com> wrote:
> 
>> Add qcom_llcc_lcp_setup() to enable LCP/SRP interrupt routing when
>> firmware has not pre-configured it, and llcc_lcp_ecc_irq_handler() to
>> report per-bank correctable and uncorrectable DDR DRAM ECC errors.
>>
>> LCP/SRP setup is skipped when ecc_irq_configured is set (e.g. Shikra,
>> where DSF firmware handles IRQ routing). A missing lcp_irq is
>> non-fatal; TRP/DRP ECC reporting continues unaffected.
>>
>> Signed-off-by: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
> Trivial stuff only inline.
> 
>> ---
>>  drivers/edac/qcom_edac.c | 147 +++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 147 insertions(+)
>>
>> diff --git a/drivers/edac/qcom_edac.c b/drivers/edac/qcom_edac.c
>> index f3da9385ca0d..b4f7b2493650 100644
>> --- a/drivers/edac/qcom_edac.c
>> +++ b/drivers/edac/qcom_edac.c
> 
>>  /* Clear the error interrupt and counter registers */
>>  static int
>>  qcom_llcc_clear_error_status(int err_type, struct llcc_drv_data *drv)
>> @@ -334,6 +366,92 @@ static void llcc_ecc_check(struct edac_device_ctl_info *edev_ctl)
>>  	llcc_ecc_irq_handler(0, edev_ctl);
>>  }
>>  
>> +/*
>> + * Handler for the optional LCP/SRP DDR DRAM ECC interrupt
>> + * (ddrss_apps_interrupt[1]).  The LCP/SRP registers live in each LLCC
>> + * instance's address space, so iterate over all banks and read status
>> + * per-instance.  Broadcast-write the clear after the full loop, mirroring
>> + * the TRP/DRP handler pattern.
>> + */
>> +static irqreturn_t llcc_lcp_ecc_irq_handler(int irq, void *edev_ctl)
>> +{
>> +	struct edac_device_ctl_info *edac_dev_ctl = edev_ctl;
>> +	struct llcc_drv_data *drv = edac_dev_ctl->dev->platform_data;
>> +	const struct llcc_edac_reg_offset *reg = drv->edac_reg_offset;
>> +	irqreturn_t irq_rc = IRQ_NONE;
>> +	u32 intr_status, err_status, clr_reg;
>> +	int i, ret;
>> +
>> +	/* Iterate over banks: LCP/SRP status registers are per-LLCC instance */
>> +	for (i = 0; i < drv->num_banks; i++) {
> 	for (int i = 0;
> 
> Fine in modern kernel code and makes scope more explicit.
> 
Done.

>> +		ret = regmap_read(drv->regmaps[i], reg->lcp_srp_interrupt_status,
> 
> I'd use a local variable to hold the regmap pointer.
> 
Done — added struct regmap *regmap = drv->regmaps[i] at the top of
the loop body.

>> +				  &intr_status);
>> +		if (ret)
> 
> A read fail, without any logging seems unwise as you may have just jumped the
> error.
> 
Good point — added edac_printk(KERN_ERR) for the interrupt status read
failure, consistent with the error status read path below it.

>> +			continue;
>> +
>> +		intr_status &= LCP_SB_ECC_ERROR | LCP_DB_ECC_ERROR;
>> +		if (!intr_status)
>> +			continue;
>> +
>> +		irq_rc = IRQ_HANDLED;
>> +
>> +		ret = regmap_read(drv->regmaps[i], reg->lcp_srp_ecc_error_status1,
>> +				  &err_status);
>> +		if (ret) {
>> +			edac_printk(KERN_ERR, EDAC_LLCC,
>> +				    "LCP/SRP error status read failed for bank%u: %d\n",
>> +				    i, ret);
>> +			continue;
>> +		}
>> +
>> +		if (intr_status & LCP_DB_ECC_ERROR) {
>> +			u32 db_cnt = FIELD_GET(LCP_DB_ERR_COUNT_MASK, err_status);
>> +
>> +			edac_printk(KERN_CRIT, EDAC_LLCC,
>> +				    "LCP/SRP DDR DRAM Double-bit ECC error in bank%u: count=%u status=0x%08x\n",
>> +				    i, db_cnt, err_status);
>> +			edac_device_handle_ue(edac_dev_ctl, 0, i,
>> +					      "LCP/SRP DDR DRAM uncorrectable error");
>> +		}
>> +
>> +		if (intr_status & LCP_SB_ECC_ERROR) {
>> +			u32 sb_cnt = FIELD_GET(LCP_SB_ERR_COUNT_MASK, err_status);
>> +
>> +			edac_printk(KERN_WARNING, EDAC_LLCC,
>> +				    "LCP/SRP DDR DRAM Single-bit ECC error in bank%u: count=%u status=0x%08x\n",
>> +				    i, sb_cnt, err_status);
>> +			edac_device_handle_ce(edac_dev_ctl, 0, i,
>> +					      "LCP/SRP DDR DRAM correctable error");
>> +		}
>> +	}
>> +
>> +	if (irq_rc != IRQ_HANDLED)
>> +		return irq_rc;
>> +
>> +	clr_reg = reg->lcp_srp_interrupt_clear ?
>> +			reg->lcp_srp_interrupt_clear :
>> +			reg->lcp_srp_interrupt_status;
>> +
>> +	if (clr_reg) {
>> +		ret = regmap_write(drv->bcast_regmap, clr_reg,
>> +				   LCP_SB_ECC_ERROR | LCP_DB_ECC_ERROR);
>> +		if (ret)
>> +			edac_printk(KERN_ERR, EDAC_LLCC,
>> +				    "LCP/SRP interrupt clear failed: %d\n", ret);
>> +	}
>> +
>> +	if (reg->lcp_srp_ecc_error_cntr_clear) {
>> +		ret = regmap_write(drv->bcast_regmap,
>> +				   reg->lcp_srp_ecc_error_cntr_clear,
>> +				   DRP_TRP_CNT_CLEAR);
>> +		if (ret)
>> +			edac_printk(KERN_ERR, EDAC_LLCC,
>> +				    "LCP/SRP counter clear failed: %d\n", ret);
>> +	}
>> +
>> +	return irq_rc;
>> +}
>> +
>>  static int qcom_llcc_edac_probe(struct platform_device *pdev)
>>  {
>>  	struct llcc_drv_data *llcc_driv_data = pdev->dev.platform_data;
>> @@ -372,6 +490,8 @@ static int qcom_llcc_edac_probe(struct platform_device *pdev)
>>  			edac_op_state = EDAC_OPSTATE_INT;
>>  			goto irq_done;
>>  		}
>> +		dev_warn(dev, "failed to request LLCC ECC irq %d: %d, falling back to polling\n",
>> +			 ecc_irq, rc);
>>  	}
>>  
>>  	/* Fall back to polling mode otherwise */
>> @@ -386,6 +506,33 @@ static int qcom_llcc_edac_probe(struct platform_device *pdev)
>>  		return rc;
>>  	}
>>  
>> +	/*
>> +	 * Set up LCP/SRP DDR DRAM ECC after the EDAC device is published.
>> +	 * Skip hardware routing setup if firmware already configured IRQ
>> +	 * propagation (irq_configured); only request the IRQ handler.
>> +	 * Guard on a non-zero lcp_srp_interrupt_enable offset to confirm
>> +	 * this LLCC variant actually has an LCP/SRP block.
>> +	 */
>> +	if (llcc_driv_data->lcp_irq > 0 &&
>> +	    llcc_driv_data->edac_reg_offset->lcp_srp_interrupt_enable) {
>> +		if (!llcc_driv_data->ecc_irq_configured) {
>> +			rc = qcom_llcc_lcp_setup(llcc_driv_data,
>> +						 llcc_driv_data->bcast_regmap);
>> +			if (rc) {
>> +				dev_warn(dev, "LCP/SRP interrupt setup failed: %d\n", rc);
> 
>> +				goto lcp_done;
>> +			}
>> +		}
>> +		rc = devm_request_irq(dev, llcc_driv_data->lcp_irq,
>> +				      llcc_lcp_ecc_irq_handler,
>> +				      0, "llcc_lcp_ecc", edev_ctl);
>> +		if (rc)
>> +			dev_warn(dev,
>> +				 "failed to request LCP ECC irq %d: %d, DDR DRAM ECC reporting disabled\n",
>> +				 llcc_driv_data->lcp_irq, rc);
>> +	}
>> +lcp_done:
>> +	rc = 0;
>>  	platform_set_drvdata(pdev, edev_ctl);
>>  
>>  	return rc;
>>
> 
Thanks & regards,
Mohammed Faiyaz

