Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC594CEE59
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 16:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791216765; cv=none; b=gj8CxaVnd4Ab2iDUuS6h4QOaThxLQDD5y7F88aFUblqdKZ/nj2b//vU4+o36swdq2GjdrZdzQpK/InmwZyoYAPDYL476UYn2WiXJw7KHwtZnKAIRqGKpL/dnLuAT5ggJ/Ol8/Wyjds8F5oz6Rj3wBYCySUzBTmz7H92qRy4YVaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791216765; c=relaxed/simple;
	bh=pGL7OPUTou100s2Ao9RAWlBCSCF6/32S03caCjf9SXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u2iYLjHxMCFE90hnZ+PWdGLg+zmvjFPB7EkrbuyZ3RH/28YZTGq5erQQzOMAlEbswgMwbkWinEy3xnR6aV+tC7pQAfkHabNBmMflinGLWZSgHO6L/Z+f/CcnWLNXZgiZDmakPIzxqVnIP4Vp+xJ0kbYgVl9Tnt6Wh0/8dLRXyX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YhxtBiJE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eGQZBudJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YhxtBiJE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eGQZBudJ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695EP7tt2515698
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 16:12:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pZuZ1lDBf+lhAoCkovyGqzsT
	No9dAJ7sm4hyDqgMjos=; b=YhxtBiJE0PD7HIsh8JT09+Svv9Ve9wJcUsbOrLFK
	rxSegQ286TGsSG4AaArzLQGDRQUMXcIB2pB5oDvrJQljFZH6SUAdLNPkouCwtYjB
	Cx1QNRSbq2sS0YlisU50NqaGTcqVXHqEryO2bnV6QVlTH2Z+TC1A1N7eA8e2RWir
	un7DNEyZDH0MAxPO0WrE8swC3qjZ7/o2PzCSZiEsdLfx4uGSAaEygn3QgRoQVe2j
	6zXzPIYt/IFhmpeupcJhKk0GJTM1fb2ybtAIcY/gWcjkrE0FGFWS3jGR1nRy2y74
	0uJ2JPOHs4sbCDWcdJCfx1OZMTPOt1/v4Uyfcv4B8yhEbg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4bhg11d8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 16:12:33 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-154e9d2d94fso3474331c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 09:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791216752; x=1791821552; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pZuZ1lDBf+lhAoCkovyGqzsTNo9dAJ7sm4hyDqgMjos=;
        b=eGQZBudJNvB4yKmFbmWQPJO62nSFhmu+t5TSSf4m409ohKJtQVmvIiei/MordFwLvL
         s7FXM44eRgCZU98OVZtNFNxIeOmnJjozUqRTG5arpMf/U7oLFgjMoSvEq4luWz55FsEF
         45h1rf9kzZvBFZSLCHOoc6rcnua9RKnbL3wyUr8VY9PDTgAZPANFy02UrqwE2c8DAzd0
         oXm+XnD/fqTBsB8Ny7SkWgo5yHz6O9/ivKIBQ1MxbjnUsu3l4e5d3p7mz2C6WcTpwd+T
         Qx6YiK9y2+e/B/QXCg9qlSIUpqYLZcNdjWoHIQBO5qjp8yeiiVc3KzAo78rqKbXqSTJX
         hcuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791216752; x=1791821552;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pZuZ1lDBf+lhAoCkovyGqzsTNo9dAJ7sm4hyDqgMjos=;
        b=gQBO8MBai5CU1HOz1Zmd9R8sgtvWb/oBeggtzyJQ+RwS6Y6COezF8uKLmraIEAYMHF
         YR6p0P68UkyGnikcf0dgwxg6pmG8q6gs0c17L1TuvjeZD+3+dZ8siNbHMHxnh1h1yAGB
         1uQD6/vtoNSw1E7l9Uph6UldkrN+veFfrEfA5lq/I+lm6h1Fj2k5sbslzmu0IBdPARHO
         N58QScRfl41RbYIMtVOiMRXgJi94JPvgqHYx2yaNlTVC1iVKaOUVHxAWUfQgFmBnwIJr
         LEURASeRWsiyDhD5NQSqThYgJ5cG9++p7bNy+ym2QeOkgMbyPZLx4jF/Bs0mikUBA1jm
         cWcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZRjkWHoYR15QMv0lSCvVxENthCeRsMdf1A7IGo0NdSR4gRiTSYVBQLjX4tMGsxnGQwJB4ugCJfO/Dqoo=@vger.kernel.org
X-Gm-Message-State: AFuF++nJ6aUU4nB5a7y/l7XHvF7jiwX/WQqb0CkqPbZvAySaN+FlM/RB
	6ibQqlarqYq0OgkLXZ6VekBGMQdnC+F3bSdw7WbiEe/5SeuRjNX2nxYVuP99rr/yc6wo+3Nd7Id
	qI4mTGnJkXXyhq2gtXecTRLE/TdDYIbNor5VC4/EvbtnCWZc8qLqHwKOicorV3XhmwEM=
X-Gm-Gg: AYBFou1zqP27IGLg+usPQRkgFi9Ybc5bvQ9EGZSIU4hCKEvqFGf2UFuGdaLyTctKYhj
	9/K1XQRQ6iMk3EqLbjDPx+NQjF3GPKWuWGfWVuofQ3NopVq5+R7xaQRp5kNeakE0zTCSH/lsfvI
	8fqm0GU99qYDN9zTrpOrnViTvRy2TAqiLOFl1j3pGX/mk36osALTW+r/aNVOiYExmAvM/zYZSzb
	rB5C482l2++D4c0cY07X+jkMyUOUyDiy0IWDxQBlwzIbm7ScAqJbaDn+3DqZBRRqAjzJvNMDmpd
	KbPkw50+OePK1yb7zRVy7VF16hrW33SdMjxvp7UBBb9DnI2IM8FagxbQ62x3624ssoNw4PmC/cT
	sRR09PLlaHyUgHeqjikUyJHVdCQ==
X-Received: by 2002:a05:7023:889:b0:144:f096:4dd1 with SMTP id a92af1059eb24-151c492533cmr11482398c88.41.1791216751885;
        Mon, 05 Oct 2026 09:12:31 -0700 (PDT)
X-Received: by 2002:a05:7023:889:b0:144:f096:4dd1 with SMTP id a92af1059eb24-151c492533cmr11482362c88.41.1791216751113;
        Mon, 05 Oct 2026 09:12:31 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35127021d1esm15885013eec.4.2026.10.05.09.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 09:12:30 -0700 (PDT)
Date: Mon, 5 Oct 2026 21:42:24 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org,
        konrad.dybcio@oss.qualcomm.com, sumit.garg@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: pas: pass no resource table when the
 firmware has none
Message-ID: <20261005161224.umj6zzov57tifv7v@hu-mojha-hyd.qualcomm.com>
References: <20261005125411.2151326-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005125411.2151326-1-jorge.ramirez@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 9EnWNBtXt8hHazO6nFI2cLBJnE6iFdvh
X-Authority-Analysis: v=2.4 cv=GMGdgeNK c=1 sm=1 tr=0 ts=6ac3cc71 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=nURcFc7YoTJHLg9ZjdYA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA2MyBTYWx0ZWRfX09nGd+SV2RZX
 uQUOKRU2/hFW07qNu9F4UANcDAr0Mcu/9F/iAHTncSOwOpxaJiZ1I4M0bKjVp95V3JpHLY5e8bR
 P9lqiEt4oV7x7N1QtM/lhSpMuf9Rw+w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA2MyBTYWx0ZWRfX9LQrVGBGALmm
 DR5tY0GQUR9pg6zY8jRjVneHD4DY8ODgeGh8NvB2rZwkUXG5/RXrwWf9FSaPRjp07RROs5JoTAv
 K85Iae46uYGVzfu0qkm41qU2WegRJBFfCx/NAKX6XDWrQ4r6lY5P9TNf/Otpg56OsHuz+pgjYoL
 T08xLGNmYefzVRkIUPXykVbl0TjMLZEK0PJt4fj7OXIT700Fi9T/8CyxAXeSRD7K9TO7kDp12JQ
 HaG/wVqFp5h4PGKEHAbTSfdytOyb+V+OZeg6cVJ7YdVSnPOBHOqufZrYlvfPkPrMCoVCQye9Qev
 1QvytAI96EbIPvFJrmFSF1INb5VpGiE9OMdn+iYc5DO8P9ZRjUroLAjtl7k2FCqbp6c5lGDA0ub
 3V23t1wnltK1bZxvWcHynjx2UhwQkSq+avsPzJMEWLRE6yoVpCGqiHswps5Qzk0XokdwMqSy7Il
 BiU2OiHC5dhQH5CCZIQ==
X-Proofpoint-GUID: 9EnWNBtXt8hHazO6nFI2cLBJnE6iFdvh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_04,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050063

On Mon, Oct 05, 2026 at 02:54:00PM +0200, Jorge Ramirez-Ortiz wrote:
> The firmware resource table is passed to the PAS backend even when the
> firmware carries none. This only works on the first boot, while the
> cached pointer and its size are both zero.
> 
> Stopping the remote processor, or failing to start it, frees the cached
> table and clears the pointer but leaves the size set. The next start
> then pairs a NULL table with a non-zero size.
> 
> The SCM backend substitutes an empty table and hides the problem. The
> TEE backend copies from the NULL pointer:
> 
>   remoteproc remoteproc2: powering up cdsp
>   pc : __pi_memcpy_generic+0x110/0x22c
>   lr : qcom_pas_tee_get_rsc_table+0xf4/0x25c
>   Call trace:
>    __pi_memcpy_generic+0x110/0x22c (P)
>    qcom_pas_get_rsc_table+0x38/0x60
>    qcom_pas_parse_firmware+0xa0/0x100
>    rproc_boot+0x2d4/0x380
>    state_store+0x40/0x100
> 
> Fixes: a4584bff63c8 ("remoteproc: pas: Extend parse_fw callback to fetch resources via SMC call")
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index a005546c265d..e871e03ba794 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -463,7 +463,7 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
>  	struct resource_table *table = NULL;
>  	size_t output_rt_size;
>  	void *output_rt;
> -	size_t table_sz;
> +	size_t table_sz = 0;
>  	int ret;
>  
>  	ret = qcom_register_dump_segments(rproc, fw);
> @@ -476,11 +476,12 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
>  		return 0;
>  
>  	ret = rproc_elf_load_rsc_table(rproc, fw);
> -	if (ret)
> +	if (ret) {
>  		dev_dbg(&rproc->dev, "Failed to load resource table from firmware\n");
> -
> -	table = rproc->table_ptr;
> -	table_sz = rproc->table_sz;
> +	} else {
> +		table = rproc->table_ptr;
> +		table_sz = rproc->table_sz;
> +	}


Earlier code was intentional please read the comment below.. /**...*/

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 2e1e39826ffa..5edb39ad5277 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -504,8 +504,11 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
                return 0;

        ret = rproc_elf_load_rsc_table(rproc, fw);
-       if (ret)
+       if (ret) {
                dev_dbg(&rproc->dev, "Failed to load resource table from firmware\n");
+               rproc->table_ptr =  NULL;
+               rproc->table_sz = 0;
+       }


>  
>  	/*
>  	 * The resources consumed by Qualcomm remote processors fall into two categories:
> -- 
> 2.54.0
> 

-- 
-Mukesh Ojha
