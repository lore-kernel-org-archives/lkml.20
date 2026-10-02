Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CE9328B7F
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 17:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961359; cv=none; b=ulrFOpYaM5SgJ0YXQzZ66+r4ItU96KixzS0L0YVGhZJAWvy9mLTQS8xTwQX/mLmOHSf8TkkhVFIlQquyK7HOqAd4Y26icxleg4feRUYWW6Mw+lq5pneHVrcDbShSCIO8bgJZ+TzIG97jjQU+izptPwUMPYeOQYeKjXy+Rp1m66g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961359; c=relaxed/simple;
	bh=a1pAlJeZ4Uo2A9KGYp6NtqaoIeZN6ga69Qax3b3HzQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=isHmpDn53bivaRfF6WnPw6lV/oSL8iIaoVFa51WTmI2KN5YnBuBvV1xny9Xi+VoYgb7orrSGKUf2drK00x6ZpWxfDV8WNV/STa/9lJin3P8LutVFew56yrVLm7cbIlggqu2bZYmQ35GpdnJ5ZBnxxbXRS0QBRPfILqZPQvnGM50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dXMuxogA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dl+MXLJV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dXMuxogA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dl+MXLJV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692H6f6a2515127
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 17:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zbsnwXTq0OoV45hgow4KHvYsJLjC6m32dKDmrYd1IQA=; b=dXMuxogAwmwYkXVx
	0cXUL2XR4xHSJFDVHtA+Gv3KoP15+/A41yQpq9hkQUyOR9XI98y3WJ1sgCSYmMEr
	aycvq9l4Lv2q2x8aaP29bcR23JkY4u5bLQOqQi/uOZp1rDpcXHPqH5PfrjRyJvED
	W8dt3VWpa03SE4y29Tn48zxZa9uh8z7irBFVLnAUvMT6/jY6sYLB1BI9/AceZPRS
	fW7LY0zFLRxQFLubRmiXeK/vmS8D5f/K70n6H0PkBr1zsBY3IMrb15w3gb9V4DUC
	MiOejtOhwj6XbLTfwojQYn72O4BH9DzsmVs4evwMDSLWi5Suwq9W+i3Y2IXnN/xE
	sNDoVA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2aj01jmr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:15:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so16568978a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 10:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790961339; x=1791566139; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zbsnwXTq0OoV45hgow4KHvYsJLjC6m32dKDmrYd1IQA=;
        b=dl+MXLJVQEiV1x0Qg+p/Qgt+b0NGyHAVKe0xrkSNsQRUdwfcttbEKCHqc2kBqKzESh
         jUvJTPTigKnz7ePro1lLQ9XDAtQjEVvaVdskzVnR0ah4TFzid7oFSZmU6HPgxycp/PGb
         3oUIsZZSorhtOfLbEV8l4K56GTUcrvVpV3wV21/t5jK4nV8Dm6oboFB42CPSbNluYO7/
         APrrOu8p8ezeviGjGnSIcYX7z7S+bE5dDcPE3/aGahghZExIto7KQNbdUqRobJ1oc6mC
         5amkzRpIrOG/+Z1/26XK5Vq+rAfdme8sY+nwC/27W2hzX0MiL2w7+cvyMwZo4Ij6HXu0
         AJLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961339; x=1791566139;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zbsnwXTq0OoV45hgow4KHvYsJLjC6m32dKDmrYd1IQA=;
        b=mmr0LmNhydyEFpZutvm+hc6Tr5n18KWwWVpK23GQe2UV9956nU1v3ZijS8dDlCcVGq
         NY6+Amm4DirY/SYJ+raIqBEehp857rt8y7RYGVduHBSAyC5TxgJfzM24PBjDGz0vxy3a
         q8KgFIismMcWlGgUHZj4uMX0V+OiNc9DzvC0as6xRDQlmQi/358p2U2ET8hVpaSkm/YU
         gSjNelmvQr3Mgw6I4F2Wjrh+GtpWb1ZcbF0uETgsChCez38F7FmmMLF1EpuQUpy4JiR/
         VB4mPPGPU2khFN4tdWyDwGKq/yrDw9yPSO0uZN52keZ4KIu5+ESMWB7UjoUjNiNkkzhq
         tqBw==
X-Forwarded-Encrypted: i=1; AKwUvBwILUvFLH3J7lI1Na7rkmOlVfc0xeMZVxF6K5p9dzPzumUHJgv8pWrfUy7DEQCtVCef3eQLo71gd7ne7mo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdgrDBh3L4SMrMNXcE8Fb5QbUM8ASJvFaAo3EmnGrPTGFefW/m
	QMn7ZQ7qkqM/a6Bp5AOgEA+4uiz8aitdV4jaFve/HSxApFXcc6PRfvc2xXUUsNZxkAqXfdPpI6+
	RCoWGnmG88eHc735GiJtdv81BRNZmTQEwSmgIlLVSHJFz9b53bFIQKTbotLJDJqvKf6wbuC7urU
	I=
X-Gm-Gg: AYBFou0wI43qnlT/aAzXzqqPXk7E4KhAvWmKnEQ7XVQ48o3L4AY2eiNcGxD1O2E/Uon
	AJWDRJS0myHuqglxzxZYv7RM/gSdWV4l6wlUhHJ5UFz5wUIIv2Sm9eeFljRUo33N+gH/QpBTPDM
	b1YU0dmCvfs/Sr1uBJvVCz7JSqiMHexqtxkz8cg2dX5KQeh+fZOX4sx00nSU30zCKd/mfKTlDeS
	nNixhQb/VkQard9q48Me11WEoLDVV3rgz7kmvOg2en4uPEUY8HjhyjGC2230Cn/eQecPP3DUIzA
	dkmvIdU7aDN5CsgOwz+knWc5tiov2ADrBN4gby5piwuYwiYcgmXQa08L0iDVwf55qbbvLOMuxdR
	TZa9MzM/DzFZYEbiDuihhLHMOSaYia58AsokEZ26mq9J8dpT+iw==
X-Received: by 2002:a17:90a:d2cf:b0:3a4:e635:a8b8 with SMTP id 98e67ed59e1d1-3a6cecf86aemr3187607a91.60.1790961338760;
        Fri, 02 Oct 2026 10:15:38 -0700 (PDT)
X-Received: by 2002:a17:90a:d2cf:b0:3a4:e635:a8b8 with SMTP id 98e67ed59e1d1-3a6cecf86aemr3187588a91.60.1790961338379;
        Fri, 02 Oct 2026 10:15:38 -0700 (PDT)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dd1c308csm1772910a91.2.2026.10.02.10.15.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 10:15:38 -0700 (PDT)
Message-ID: <656b3e9e-4668-4369-8bde-d17bda52bd2f@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 11:15:36 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: tolerate absent crashdump state during
 cleanup
To: Slavin Liu <bolin.liu@seu.edu.cn>, ogabbay@kernel.org
Cc: carl.vanderlip@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260913125201.109964-1-bolin.liu@seu.edu.cn>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260913125201.109964-1-bolin.liu@seu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2OCBTYWx0ZWRfX4Ib1nzVZeAH7
 HNg1ymuIp0ExtEDp99f3yhfq11dq1UXb4iXEKzJzQ6sQA3p+MMJkAGaGwYF31BBYZDKp0jQ8X1K
 H/yZSGAeI9zOdlFwdOUoWTbhZga68YQ=
X-Proofpoint-GUID: ijEie-bTM2NgL6_YV4d6tIQdLPmqdWmm
X-Authority-Analysis: v=2.4 cv=UJZIjyfy c=1 sm=1 tr=0 ts=6abfe6bb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=GiR1NQjo400kaVoCfNoA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2OCBTYWx0ZWRfXyTqacmRXgPOX
 36gPAGj5OnX0m5MQlkCD237gNBdZjUGtk11sK6zpx50r2y59ogeOzo1+YFyCC59WTkV9o2CVC0T
 usqLcaCexD20AoGVdpMgtXvKZWhMrEEp2430Oc+6OKFE9xC61oKFHlr3D+0CNu9wxHxeq8DPQnS
 bs9z9CYBjYv3wInTCbqteAS475oamDG2Hi/WMds5EYZgKqH5FfPmTg9KYZ3wXae+4gf5edMVSQc
 vLbg1R60I3VXsFh8zewFWExxcWCY/izGSUERSQCyur2R0/bbj8hYM30TYWnHM0FwNOUnzioBTm4
 M9fPKr42SDWB65HjZRXknXY4DQGWWU6NC94FHMOYJSmMmX8qOfqDZUyrZh95zo7ypzLL7mAU1fW
 JOAgLUaY2bnRVHi8l/qWJhDyrT+BGsqb5xYYkCZi+rDR0AULtBMPoxqbPMYQ4BMzQl8zj4jeIl1
 74oCX8oSQ+Cb1NQUzYQ==
X-Proofpoint-ORIG-GUID: ijEie-bTM2NgL6_YV4d6tIQdLPmqdWmm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020068

On 9/13/2026 6:52 AM, Slavin Liu wrote:
> A negative response can be sent before crashdump state is assigned.
> If queuing that response fails, cleanup receives NULL. Treat that as
> no owned crashdump resources instead of dereferencing it.

Please describe the exact sequence of functions which triggers this 
scenario.  I don't see it.

The change clearly protects against the ssr_crash parameter being NULL, 
but that doesn't occur in relation to queuing responses.

> Detected by static analysis and reviewed with AI-assisted source auditing.
> 
> Fixes: 6bc1fe6c748c ("accel/qaic: Collect crashdump from SSR channel")
> Assisted-by: LLM
> Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
> ---
>   drivers/accel/qaic/qaic_ssr.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/qaic/qaic_ssr.c b/drivers/accel/qaic/qaic_ssr.c
> index a98928654959..d9ba1d333cdb 100644
> --- a/drivers/accel/qaic/qaic_ssr.c
> +++ b/drivers/accel/qaic/qaic_ssr.c
> @@ -194,7 +194,11 @@ struct dump_file_meta {
>   
>   static void free_ssr_dump_info(struct ssr_crashdump *ssr_crash)
>   {
> -	struct ssr_dump_info *dump_info = ssr_crash->dump_info;
> +	struct ssr_dump_info *dump_info;
> +
> +	if (!ssr_crash)
> +		return;
> +	dump_info = ssr_crash->dump_info;
>   
>   	ssr_crash->dump_info = NULL;
>   	if (!dump_info)

