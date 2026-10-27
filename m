Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793110087;
	b=YhW5Og0GW89MTs8JKe+A6dQ31SR70iU0O8GGgcf9RsxiSPep8Y4BHrawzNsgtmdevhD2
	 AkBTxygxjKaugZLZhZhLiWJCHWg9eqld6zbSVDMF724JRrDTtISZXMw6+qMBIJDLIfgGs
	 WVBnV1PSWemoXNUhIBqBZPRVU1KqWa6C1Wl/ypHsj/zPz5AJg6RZsxAJ0ldZOvE59nnCq
	 c08duOLAxp87G4oeWRr9Fq+zhdLViy5Jmqc6faPO4eAdQCG92z1WHHIlc73kBBaB9jr4b
	 CUNCOX/d1WcLtUP6t94+T/mKCMdccJLz5PmxTdGVX8yUVhC8Fnu7So7w9wyWzLh8F+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793110087;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=c1Z/CCgCrrgHYNEhc4GFXM6iDrjf45bsGeiV5sYFsHU=;
	b=T1G1VA1wDE00zMOFakQB5dOIhnta8FlUS+9/rlnwNhof+JqJcL2AqO3jgmYksZshB152
	 N1dedo3Dl8QdVf0PpQWA5RiAcECGCllXmqrzL0W9NypbCSc/sP+P3evXk3n599tcJjXRa
	 OesiYSpK4wRkAksobkziYfHjf3ATv3QXjQDIVni1qa/Ao382fmtPnx8xOf75rcPcyiYYl
	 cPuq7MNctgjZetAy7ARqPD6/rRRudd0l+OXnf1zeX8KA0uwSoQHlwlC+2hNyUEqRcFyyr
	 FEHzTYNNCXPHFwizRZgdxZuJsbwZOObdx94i5XcGfKyc8xLF2AWXAT/tdkBfpU7PKPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CJyGDv1k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PGdaW+61;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C603606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:08:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C603606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CJyGDv1k;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PGdaW+61
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RDoBR52036852
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c1Z/CCgCrrgHYNEhc4GFXM6iDrjf45bsGeiV5sYFsHU=; b=CJyGDv1kfrczv5x+
	zzdeblWPnV2nNUKN7sdqN6M4N4qEmTYV7S/skWsonIPJw2mtEWnbh53MF/gQHttU
	tVJtu/ehaMmUHUTq+Y1C0VCMfVHt/pbflC27WTzfHK9C+sxvfTMIgthUvVSWkFas
	xvKYTVBOdG9uCNpiB+nrmaMdctJQ/oaVj6zupB8I+saDbwR+sgCwccv/M6WDq6DC
	8gF6HPzAuijyJ6ighWZntHCj3WWB0WMHYHLBx4yuA0eYEHyaQY0ObD8ApJuxeX8O
	OMHMF4KJZ6uuPrPTaczxzvKTKa1+ZVrygUkJjtzpNpGPoIeh0muNwt2w+opoDOGf
	7pHYLQ==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqf5sk01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:08:05 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b0a8c1b87dso67113927b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793110085; x=1793714885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c1Z/CCgCrrgHYNEhc4GFXM6iDrjf45bsGeiV5sYFsHU=;
        b=PGdaW+61CvtJ6Ew9w9m2fHhLsj4jOqZHtO/F8DVZgYIjIKo6EzOQPDyGM3MrDt8xLv
         KiwOy7+sRI7UEfYamEl4bn/ztsQulvj3b9jOQE6HdfyQNsZ9sBEQOgbGc2eJSW/Eog0p
         nrAa0tP1FXHiXP+zYngQd+Bph7iaeQ9otsoKkD5YmiHvZtqdWzxNcDkN6qNd9nf/z57D
         en4MTJiyb0FI+PCvbT3f0tC67e4KaOcRTqR8SYFCL2Bghr9JUkhvnu7ufZ9TftWhSdyQ
         XVlSqOjdkh6w5qwB4eCClpfeo+fdXDtEiXMQbQuS6R4LqvbxptGwuCnej5pI01iZKlqi
         P23g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793110085; x=1793714885;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c1Z/CCgCrrgHYNEhc4GFXM6iDrjf45bsGeiV5sYFsHU=;
        b=OKnzlpmg3fZqoJCKK3UUjSCwT61T1ysLwb7+RLscqT6cRQ9JeH3WKUeomJ/NZEw+k4
         7LVhRj2mrYvpPDclfmkwVsF5gG3F+fVnuUzuSqtlV3ibdCVkd8g/os2mpiKOWLs/0BnV
         yXYIVRgpBSv4W70E7OmETS1Ad/7Bi7ktjn3eQNJ1c9tuqTJMDTPSqW4oxzbTMWzk73sf
         rlIjmlvDYiCDaEKzzOWEZlPEjsvL79KzY662Yh1GhweChMv5u6E0fMidA89Z6riXObnO
         6uFIqG7wpDC5VXptsUEb+au5EaFZCrtJi4pfNgI7s5pz81mcGTwXgpim9kpzJC6Bnees
         XVwQ==
X-Forwarded-Encrypted: i=1; AKwUvByDEsl3QBAUBS7GXTKZm7Pl842WdvK6KWuuT2YXDCOw8Fhk+6iMPFrTHZcNoHygOY/jSWA0WjC/W0JI2K8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAicBb+NlUdrfFg3BqnC0MlMz0B2iUlrX1GzPCSYfl+Q6hP/MZ
	K+e8JMg3nxampZ7brWMEB6kizY4HNqRHvgBCuvHPeTW++y2BdefCzgG2bvcvTTjXnOfF/fyRtRQ
	FkE5O+cyqC4JI1XUoUw7E6J3UXadLofCEkyx7OyiwKmR7unmizsBTnhHu+mCzymyyfgk=
X-Gm-Gg: AYBFou2nPxW6kohuanYv5A3JmY9UUHJEWcfHkksXIxQrBDcEBkAhXGjsPWbXl53IAHh
	nnbeXsWTV6xDJgXDZ5/FlcJFWKUB6j8z2uKCEI8E2D4b8SF+diAXTyzVB+AwFCQyAFlIBuWMUGy
	dgx/sSCvVAWaBjkO8Wa9AiE+6edtL4R+capTOGX54CcDMCpopFtVPEDYs8uLyRBACBY65FRML5J
	UGyhIi02k3gy1VILx1CwzfSuWkY5QjNHbGMY71jbUu5HU7mp9Qom9mO9XvvkTUtFSqVuws0+fl1
	uAf754RfqPRCyr3OPk23xFR7l24jvnIV9Wu0q6sRizCik//3sh0WHdnNHk9AgOkSbwxqOwd6hFA
	pCCDdcEq/65q9AnuiOwO4HHvay5FoPaHkdw==
X-Received: by 2002:a53:ac8f:0:b0:679:a650:a09a with SMTP id 956f58d0204a3-67a45188986mr7162436d50.6.1793110084879;
        Tue, 27 Oct 2026 07:08:04 -0700 (PDT)
X-Received: by 2002:a53:ac8f:0:b0:679:a650:a09a with SMTP id 956f58d0204a3-67a45188986mr7162412d50.6.1793110084117;
        Tue, 27 Oct 2026 07:08:04 -0700 (PDT)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a7a07e163sm127917d50.8.2026.10.27.07.07.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 07:08:03 -0700 (PDT)
Message-ID: <acac5cec-6fa2-4465-9f66-a5e533404978@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 19:37:57 +0530
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
Subject: Re: [PATCH v3 2/3] i2c: qcom-geni: Add bus recovery support for FIFO
 mode
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-0-7f2a6e572de9@oss.qualcomm.com>
 <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-2-7f2a6e572de9@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-2-7f2a6e572de9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NiBTYWx0ZWRfX3+C8yFly0Btl
 nY7GwCRJDUlrMi1qdDFgeikL1m0LVH0m7Zl+TB68Gpl8xuQMFOeXT4qRqo7FCC1G2dMLZ8YX4mW
 zdtopK1iHiIaC1KwIW/ru9Ma6b6O+YI=
X-Proofpoint-ORIG-GUID: R4-rugA4Cd4kPvPNie8y4jNviV_9ibUm
X-Proofpoint-GUID: R4-rugA4Cd4kPvPNie8y4jNviV_9ibUm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NiBTYWx0ZWRfX6PMG0/4LM0yB
 79Yrc8FFNTNe1yjO8EACGcUhjE0d5cZDNTiGevvA6BDeQtPtvxYAk7uALc1UFcEg8LYVEs6s22H
 sembLv/4FAhtijUtpD0n8v/GPJT9cIQDeSmUFSNcclPfBeq/iXVFGC0D7wGkEb/cZJEarozt7tv
 3XM0sX8ejkjfCpRsXg5Vq44rU6JsG3kHlSetd5enM2DMG6Envr9xZDg/DkIkBf1nr6LImEFp/gw
 Vp4ZEKzHBMdot+pkj1lB8R7qFTUQ8lFviVlnRf4K+Gvy3S2ioU8pEfzKouJ34GrVA/MtTEA4kyA
 iCJbMugMuKoQmGjps4bFo8LatDtNdZSePM5owZNuGLJAzwlBnEaUPDGnm30KBfExYuKYSi5/2Xh
 /3ZoX8YncaXcqDqjSeKt70HO8E6BDMv5/byJa1BrLc5KOm0Y4D8KYiVQeHfygm7PAEmQyVO4ZpD
 JUoFCIk9zp5pHNXwQPg==
X-Authority-Analysis: v=2.4 cv=UOFIjyfy c=1 sm=1 tr=0 ts=6ae0b045 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=qTkQnuk-FKC89O0zAyYA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270056



On 10/27/2026 10:43 AM, Aniket Randive wrote:
[...]> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 127 ++++++++++++++++++++++++++++++++++++-
>   1 file changed, 126 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 60b6273f538c..d9e86f110ae9 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c

[...]> +static int geni_i2c_recover_bus(struct i2c_adapter *adap)
> +{
> +	struct geni_i2c_dev *gi2c = i2c_get_adapdata(adap);
> +	u32 ios;
> +	int ret;
> +
> +	ret = pm_runtime_get_sync(gi2c->se.dev);
> +	if (ret < 0) {
> +		dev_err(gi2c->se.dev, "bus recovery failed, error turning SE resources:%d\n", ret);
> +		pm_runtime_put_noidle(gi2c->se.dev);
> +		return ret;
> +	}
> +
> +	ret = gi2c->dev_data->set_rate(&gi2c->se, gi2c->clk_freq_out);
> +	if (ret) {
> +		dev_err(gi2c->se.dev, "bus recovery failed, error setting clock rate: %d\n",
> +			ret);
> +		pm_runtime_put_autosuspend(gi2c->se.dev);
can use goto , jump there at exit with ret updated.
As 4 times i see pm_runtime_put_autosuspend().> +		return ret;
> +	}
> +
> +	if (geni_i2c_bus_is_free(gi2c)) {
> +		pm_runtime_put_autosuspend(gi2c->se.dev);
> +		return 0;
> +	}
> +
> +	/* Bus clear cannot recover a target holding SCL low. */
> +	ios = readl_relaxed(gi2c->se.base + SE_GENI_IOS);
> +	if (!(ios & IO2_DATA_IN)) {
> +		pm_runtime_put_autosuspend(gi2c->se.dev);
> +		return -EBUSY;
> +	}
> +
> +	ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_BUS_CLEAR);
> +	if (!ret)
> +		ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_STOP_ON_BUS);
> +
> +	/*
> +	 * Recovery succeeds only once both bus lines are released. The bus
> +	 * state is the authority, while a clean opcode status with either
> +	 * line low is a failed recovery.
> +	 */
> +	if (geni_i2c_bus_is_free(gi2c))
> +		ret = 0;
> +	else if (!ret)
> +		ret = -EBUSY;
> +

Please simplify with ternary condition ?

> +	pm_runtime_put_autosuspend(gi2c->se.dev);
> +
> +	return ret;
> +}
> +[...]
