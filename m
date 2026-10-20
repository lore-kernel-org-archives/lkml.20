Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792516184;
	b=hH3WfZwmTp1hLsKE/ytjwLn3j7/pggF7GHk10wTLV32fU3OqMDFgjFhdX01F4ccU3lQV
	 449m+fDDEyqoIWX3K7ExrDyuByUIeAikPYTH9rOEe5r3LPcSOdTO7TMaS700rCFF9aNaU
	 kjvZGxrXHqA+9DjuvMkZvaRB1mO+rTWuuUZH14VHJOorMI+rWc2J9Rcj3ztELO7K7MbZw
	 +my+PvPg3w16Uvv3FY3HspdANQw7XxDBeCUe5ULbOplrmKR2s65TLYS/XQG+WVHE+e1U7
	 T2OocudG98K3zsOWpjVHwd2IyGkntUbareDPd9GrJl5OyKFSz2zETs2UgqufkYedknA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792516184;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ohKpVZsSLKBqP3rLFRPbU8Ml4RClO3TAOr5rDUCda/w=;
	b=iHjAkOhO+yrSq5xrMmYX9VIqBArS1OES5kwnSOjidNSUy3W3ci4uru9Amogc7rfAYjDG
	 D/nhojxegMpK0hdxX7XI0Au0ELafj0/228DP21pytoFndpXJjze63dc3yCUlbk7fiz20t
	 7qfI8rpaTlHQOGZmHkWaSauFHqRoAE5yEKvsla0xDmS82N5W/j9MmGXqIFngLUloFLA3m
	 AXaJcLvxfNmIRZTObOdlcwmd4Wp9Cjz3FupMzwK8rXOZuDYZSTlgt7ygJG7jx014azXdQ
	 wO/tQMYrgVsdDSUoS23CcXOBalHPZR8htiCMusWarqUNkzCbaX2MJycbN+6phlEDOZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Q/srjOz3";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BbbaYUS2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FA3606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:09:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70FA3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q/srjOz3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BbbaYUS2
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KGu1c52070236
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:09:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ohKpVZsSLKBqP3rLFRPbU8Ml4RClO3TAOr5rDUCda/w=; b=Q/srjOz30TRKb0h+
	4i5NmNJzhXLuqckNdw/mg0I4BdzGglVTPPTqazzLFsx/Egq97m2DlLg9ue++z7ip
	6WVn7ZjlY/g7VfeucNdjyKyQZBNhpJucWzQD5lIZza3YJBHioVSU/aQsJG5snWE+
	Im9EeDhgIeH6Tr6y7/Qg5R1Kx+t3F746jDmWcVzfNxurlDL8JrmGFSL4mbP/TR6Z
	aQTdpZjm32+Rfs1bQ91lVPuoYRNQ+jDPXKIX7UfBMgGyReFum7adrZOaF813VB8E
	Zsna3eTyugakMRuQrPgQRVqqJkEknK00/GysSDNSK6Mzns/CW3C2UlGAMBjbAmPT
	68aWnQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n3k1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:09:43 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso5118887eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792516182; x=1793120982; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ohKpVZsSLKBqP3rLFRPbU8Ml4RClO3TAOr5rDUCda/w=;
        b=BbbaYUS2cRNi9QeQVnNKHeFbeNS/kGPr/Kq05PzFB/gg5q3R+DgHINNCf0EPaD3YgO
         oH+bdybQ9SADnVWqVOkpRwK/zfqsdggtP3s8+QGnRWwOtPUy6DG46upEB614o2As1Xt7
         i81Jf8r20aV1ux+UNJdno2z4DsCIUYxF7j2ZXox+/4rp4gQzuHpq8uJouwAqQd8qS2G4
         mhK75H3XTxGVXsl90pIAz2DEvVvURweW5agkjT6I7AfHjcyYb6vog2UkkfhU4D7of4ts
         J3N99YBSb5j4ACMz5jPWVUSxozJqBaijd9t7NWtPX8lgWFJ9dx0JAXmjFxL0+LRRvgb+
         VRDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792516182; x=1793120982;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ohKpVZsSLKBqP3rLFRPbU8Ml4RClO3TAOr5rDUCda/w=;
        b=nRCRMhLEu5t1BQP9PSeGj9MhTb6iBTJq3d+XKF4ckCvkSGvUkaGmSYWV9rumbe4fLw
         3Ja65FNuoUAu0PUaARxp8ur02R5lQGP3YH62o88c0PN+0O4kjI+2p/g3wx2qNF5x2vqU
         u0KFXKXouPyedBPGZDNFQRy5y7OFJfL+5Gq7ks9rB88mvHfhpuE6rDbC8FiDSZ7370Df
         c3TFOhbfrm0xrSgd2j1UVubOW/VvcG2YxRoWtCOEXhOUyTUGnxBGc3w6hQffbtuH8oTU
         jIbROIuepVzpYGCqht4zCqZuCX+KV12Wjxl/3ME9QGOpM6Kq/A6qsnDfSLIB8gII97lJ
         N3QA==
X-Gm-Message-State: AFq9FYK2Rv59ZOyWxsIgf99Ql9SGdcuet0sxmGo3SRk1bohpsjdUt11P
	SD6DTh+3IOx6ie/es5pg8anawOCvzY30BB/MCUmix9PMyAbPFy+elvVg5IvveSE1ca2NCp1LFCz
	1rLM5rnJEnOfg3VgbN22VgtQmew/SnsLHgdIdBRHK/HKhBbfP064EGOKMHKVxhu9e8ZY=
X-Gm-Gg: AYBFou2w5rUORAISF4unFrF1NrqC51SpxcZ11tF8fNEZvaG75ZoivTpcALM/XJbd4/R
	2xXw5nPwaFoUXl+XG6V+SEGgdj39ZOGhdgeDoUa+20GYTUnwOQZHnYqCi9pEYTPp8AI6+AKDUIu
	yJoWkK5rV88DO+npyzQVCuItQTwQ9YZVpIKygt9S0UbfVpZdUcPOTwZjWJ0O3Yif661M3b8lL/B
	azEzb+CPB+uiv3ccySAQC38W+hpw67VmYsnriD8CnM8Sd4iTASGbEgyP58E1rwWC3XwJZYg/Qm1
	26yNMRfVI3RTSizMmoQw3pixSVQH/0lN/pVZhj9Gtx4TLvZ+A91aZDEZluiFqFtcWlV34kJ7EDy
	es5Vhq/BZDI7usg6lH7tVGAX9fGf8zDD0WkIxULJvNw0=
X-Received: by 2002:a05:7300:10d:b0:351:1e89:66ab with SMTP id 5a478bee46e88-361a0e85fc5mr16354984eec.7.1792516182363;
        Tue, 20 Oct 2026 10:09:42 -0700 (PDT)
X-Received: by 2002:a05:7300:10d:b0:351:1e89:66ab with SMTP id 5a478bee46e88-361a0e85fc5mr16354944eec.7.1792516181614;
        Tue, 20 Oct 2026 10:09:41 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673b1d0ab7sm123492eec.0.2026.10.20.10.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:09:41 -0700 (PDT)
Date: Tue, 20 Oct 2026 10:09:37 -0700
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
Subject: Re: [PATCH v2 4/6] EDAC/ghes: Extract error report initialization
Message-ID: <20261020100937.00000d06@oss.qualcomm.com>
In-Reply-To: <20261019203915.2019037-5-pierre.gondois@arm.com>
References: <20261019203915.2019037-1-pierre.gondois@arm.com>
	<20261019203915.2019037-5-pierre.gondois@arm.com>
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
X-Proofpoint-GUID: Ond34nfMkiHyjr4CUWbP6D_DH0mG7hs9
X-Proofpoint-ORIG-GUID: Ond34nfMkiHyjr4CUWbP6D_DH0mG7hs9
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad7a057 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7CQSdrXTAAAA:8 a=rxnY8KSqnLZGKI4wGMoA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA2OCBTYWx0ZWRfX8xV5IG6bl4G6
 I1IVedlXd/uTt4hab0uAw3F/WCS7CY0jVSo27bN2rqzW0I9hysYh6lKG3huVFrwkgIqkuTiV5r2
 9HIyWpy/n6+JP+A8hTegLtpaEPeEXL+1eRI3DQGliNUReBxVVIfFQ1qIbwXwjwsVKIxFs5CBWTe
 1LrJvi3rVfmbpkIO5rn4IQ5UzsQa1FhZIrppm2U2c7SPRLzp1Gz7ehQMZsfQwIGfmlD1nkQyykN
 P316eF7PeNcXotEeUaZxO90PY3IwhY+Rm9tggBPq8codVhJva1gNc6i8ufTdkNtRM4zg3y+0A2s
 eSDUEN/Nw7ggmYg6jFG2NmBdmuPJLp811dpiT/cC+ao3KtYHbAtv0RJuDrHzCtP2ZRaF77TIMlp
 f/9Qha6uQ+dSVAN79vo+BQ0jJqnVBX7Fdn3QhNgMDcU7Xsfr/MHD9gApHgtNJZ10VE6VJqwFq6U
 e9MqV3ZUlLAwdJchJjA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA2OCBTYWx0ZWRfXx4QqLrlZXRGu
 2GZO5Uq9G+WUyDzkK+HBMwLHkHWnBSQyEthhg4aYqxh9a6Z97e56D9x2cEU/qUtF6V7LxizEFcP
 t8brwuO/dTkYejrFRrPH7KZ8fgDI3mU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200068

On Mon, 19 Oct 2026 22:38:43 +0200
Pierre Gondois <pierre.gondois@arm.com> wrote:

> Extract a ghes_edac_init_error() function to prepare for
> Memory Error Section 2 support (and re-usage).
> 
> Also use a guard in the caller ghes_edac_report_mem_error()
> function for code simplification.
> 
> Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
> ---
>  drivers/edac/ghes_edac.c | 66 +++++++++++++++++++++-------------------
>  1 file changed, 35 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/edac/ghes_edac.c b/drivers/edac/ghes_edac.c
> index d80c88818691..b90150c67f4b 100644
> --- a/drivers/edac/ghes_edac.c
> +++ b/drivers/edac/ghes_edac.c
> @@ -267,37 +267,14 @@ static int print_mem_error_other_detail(const struct cper_sec_mem_err *mem, char
>  	return n;
>  }
>  
> -static int ghes_edac_report_mem_error(struct notifier_block *nb,
> -				      unsigned long val, void *data)
> +/* Caller must hold ghes_lock. */
> +static struct edac_raw_error_desc *
> +ghes_edac_init_error(struct ghes_pvt *pvt, unsigned long sev)

Slightly unusual to have an init function that doesn't directly take the thing
being initialized. I'd pass it in. The clearly of pvt->msg and pvt->other_detail
is also a bit of a surprise for a function that claims to be initializing something
else so I'd do those outside of the helper.

Or maybe rename helper to something like
ghes_edac_fill_error_from_pvt() 
Not sure that really conveys the modification of pvt data hidden in here though.

Perhaps this refactor was a bad suggestion from me and better to just duplicate
the code.  What do ACPI maintainers think?



>  {
> -	struct cper_sec_mem_err *mem_err = (struct cper_sec_mem_err *)data;
> -	struct cper_mem_err_compact cmem;
> -	struct edac_raw_error_desc *e;
> -	struct mem_ctl_info *mci;
> -	unsigned long sev = val;
> -	struct ghes_pvt *pvt;
> -	unsigned long flags;
> -	char *p;
> -
> -	/*
> -	 * We can do the locking below because GHES defers error processing
> -	 * from NMI to IRQ context. Whenever that changes, we'd at least
> -	 * know.
> -	 */
> -	if (WARN_ON_ONCE(in_nmi()))
> -		return NOTIFY_OK;
> -
> -	spin_lock_irqsave(&ghes_lock, flags);
> -
> -	pvt = ghes_pvt;
> -	if (!pvt)
> -		goto unlock;
> -
> -	mci = pvt->mci;
> -	e = &mci->error_desc;
> +	struct edac_raw_error_desc *e = &pvt->mci->error_desc;
>  
>  	/* Cleans the error report buffer */
> -	memset(e, 0, sizeof (*e));
> +	memset(e, 0, sizeof(*e));
>  	e->error_count = 1;
>  	e->grain = 1;
>  	e->msg = pvt->msg;
> @@ -323,6 +300,36 @@ static int ghes_edac_report_mem_error(struct notifier_block *nb,
>  		e->type = HW_EVENT_ERR_INFO;
>  	}
>  
> +	return e;
> +}
> +
> +static int ghes_edac_report_mem_error(struct notifier_block *nb,
> +				      unsigned long val, void *data)
> +{
> +	struct cper_sec_mem_err *mem_err = (struct cper_sec_mem_err *)data;
> +	struct cper_mem_err_compact cmem;
> +	struct edac_raw_error_desc *e;
> +	struct mem_ctl_info *mci;
> +	struct ghes_pvt *pvt;
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
> +	guard(spinlock_irqsave)(&ghes_lock);
> +
> +	pvt = ghes_pvt;
> +	if (!pvt)
> +		return NOTIFY_OK;
> +
> +	mci = pvt->mci;
> +	e = ghes_edac_init_error(pvt, val);
> +
>  	edac_dbg(1, "error validation_bits: 0x%08llx\n",
>  		 (long long)mem_err->validation_bits);
>  
> @@ -375,9 +382,6 @@ static int ghes_edac_report_mem_error(struct notifier_block *nb,
>  
>  	edac_raw_mc_handle_error(e);
>  
> -unlock:
> -	spin_unlock_irqrestore(&ghes_lock, flags);
> -
>  	return NOTIFY_OK;
>  }
>  

