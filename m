Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8FB37FF60
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789365056; cv=none; b=J/GgnpxWT1wi2yK/5xOEQwLMU/coqcmDtRoKRvlyKp7h56m5nvftFGJK788n3JU6bOaWzpLAT56vn/kZS1OfEdy4OujFivz2iJyWeY0nytDhpZKGQ596WwdDNH3GcK7Z0pli0Ro15fyaK9GWZ8hBQZHvzdsb+Rvtt2j4y0mhO7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789365056; c=relaxed/simple;
	bh=GzYGfPLtcnZzEJNjHUF2EGwoE8xR785MG4hRoEqFNEc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PzkUSUrIShy1B1XBItIvDgkTXzRPooUCrMG5Oh1ejho6UKYl5zv0+omEtxvjVCPG6vzH53Z3Eqlt3dhZD3yo8GZjREjHBGAYfxlBx7tELUCpBm5y0rY86p0SuIj+1EvYhUZdfCUb47S0S8DV6kjLuiVjk8RbFz6XwMi4efhiRlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M288KeCs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PQP7OyA5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M288KeCs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PQP7OyA5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jYh5237713
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:50:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p6l+0gLQcnzp1lqxR4kPJgkBMQ80X908dj+Jyrbr2jo=; b=M288KeCsEuYHukvA
	v84DCo+q7FtfzFC04ZNUBLVl5fkYEeinZyZcc/T5bpc9w7IiAxqaHcwW6fjTbpnX
	47B5AT/jVzCP68DKdJIit35hSZiwdNmVxyFysLG2vRNNdox7kZG0jaW4qR7+gCKg
	Bc4sZPnNorNoy4jdcjS26tCynsCEK7kvAlHDt5P5HU0Ls4c6vkedvHLLXa8QilfI
	ztrmbkufWT2yWrfzmpM3czR/q2xSmfA3/wACipEKF01j8z4p/9czXoi/K2alpfev
	4zqWlCsQbDTadEHNSF40/ok9PpkjRB5DWFmXnbdz/CxYVbE1xu4MYTTa8XAGL/Bk
	WgYcBA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dn7vp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:50:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6f80c76e6so53947685ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789365040; x=1789969840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p6l+0gLQcnzp1lqxR4kPJgkBMQ80X908dj+Jyrbr2jo=;
        b=PQP7OyA5xMIPi4EUkMBpC59wUHkGdbfADZkTFONMfsCnPcAAcsz4UhMBYlOw7ZoCsf
         Mwe5aXHCmMUadg3H11aOBB/dzP6YbhuWnW7RQLvi9ytoFKeypTT6BmiCe1wwsEuvRfip
         XJLUHjba28wN9WCudA26dLfL3DSb/VX4lIa58nViIo0IELNoNLxjDao4ADAyGCsUjbbk
         HQR+mqK89VrwN/Td2iRK44BoEu7ae/4NBxLFVSgQcFvQ2xICKAZBo3ZQOE7iXoMAvnr2
         JD/3deBrg7rzL+9sOnpO/i3ZMSNtf2bX5SPpsLq46pi07ZELZayJ4URU9fSXgfxrOVBU
         BT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789365040; x=1789969840;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p6l+0gLQcnzp1lqxR4kPJgkBMQ80X908dj+Jyrbr2jo=;
        b=AU/0Xr61zIRPj7kwAxFK2EH/fvfDRRJ3Q6Nz5BlYdvP+9Ln4cy16xfugncDpcczx2T
         f5W73JHySMMGS5HkiwoEuwL92aH+M370VIFos4jT+nxMA3ogYiUTmKQw8tWO+MvznWMe
         IopDCkUWt0O547N+7jtAiaeKj4dSmMqzM6RL4ua5s505OwivaU1iNpEJMIa7fI+FXgt2
         jJg9tzmHlR/1C7pavcPwP/E1J3HPbEx7lCvm/KI0aj24sMHYCEPYa6JQIRAD6OD0YxHS
         2PwdlaMjPMrEZpwlbC0P7JVa9kzxus48MZPm+W8baQzZYQx+krq39pvruJPfpWRPC0N2
         zkIA==
X-Forwarded-Encrypted: i=1; AKwUvBwZuRT3RJlz3oLNzHRJQ4j4qc+H15pOq7xnghXFF5COb8so0x1uoqmDDv1c0v7qEosyiojKvfddDFYg6e8=@vger.kernel.org
X-Gm-Message-State: AFuF++lbDNyjNGUkHYqmob6lhHZ2AG0pONQtuouXjk6yXkQzZZrUIQV7
	HmucIl2+7Od7zryfKkWt8tjjEH2O1zPhiPZHDSDTqqQ97wlw/DPKi6XGOKWtU59Zui+AOLEA2+S
	krSJwgmtzKJP04GJ+goXA6EEyf16s2TrMIJmRHmTNIdxtKfS7JONxVKaFYYUD0usVW3I=
X-Gm-Gg: AYBFou0Yd+84KI+Eivqrf6qrU4TYYbl/Dgi6UJzvx3ETCIj++30H8+f2XqGagxB2zL9
	mcsAtrl2BnmI6YHnH9XHU0C+Cu0XyDqsMo8e5S5UXx2EV8yDva7asHUH3nMp6NxKJVD8f/5gLvB
	AWc6tb2z1qtMZiUAwUAE1BBRSmMQ/kaLDVcK4S8r9blhhBIUjoQeGE7jLAAV3TFQtsOfkA2+oub
	iBOmz3Nk0ZUwashFgiGTlNIIG2dV2/ZG5ZcjQ2dg6N0BJSa8rBYNP1AV7m0IaSTYhF+iTG04YSQ
	YEuPn9F9PN6RDn1SFIvBMYPcZtD4CsEQ74N4tItGs1zQACFUN9ajgSj2UdF0KqxDCrb4T43fhNF
	hqOOwGaHZw00utjObRdVWi6sE7BMNj6FIxhiA8v8fMcWYf3ZAfv0D5AktFn58oso=
X-Received: by 2002:a17:902:e807:b0:2db:3729:22de with SMTP id d9443c01a7336-2dd6c47db6amr26249205ad.0.1789365040517;
        Sun, 13 Sep 2026 22:50:40 -0700 (PDT)
X-Received: by 2002:a17:902:e807:b0:2db:3729:22de with SMTP id d9443c01a7336-2dd6c47db6amr26248635ad.0.1789365040080;
        Sun, 13 Sep 2026 22:50:40 -0700 (PDT)
Received: from [10.133.33.70] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfef639sm41967805ad.71.2026.09.13.22.50.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 22:50:39 -0700 (PDT)
Message-ID: <277c788c-af70-4e56-ab91-9c71cee3cf47@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:50:34 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: resctrl: Catch and propagate error from
 get_cpu_cacheinfo_id()
To: Andre Przywara <andre.przywara@arm.com>,
        James Morse
 <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Tony Luck <tony.luck@intel.com>,
        Dave Martin <Dave.Martin@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260902143757.3469690-1-andre.przywara@arm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <20260902143757.3469690-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Q5YC9ezTjNE-ezySm-uAtd-GZKdfblbQ
X-Proofpoint-ORIG-GUID: Q5YC9ezTjNE-ezySm-uAtd-GZKdfblbQ
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa78b31 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=yq4xWk7HVLGLVt40E_cA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA4MCBTYWx0ZWRfXxoMqXiPMqtTl
 CpcM1AtOS69X5vjLFh+CsMsoOBSHG1ZUGYwNhl9NG67UFcgwSMosKgfyHk5wYuXlMwh/SIj2QSB
 c14yjUZWmoxvSIS+dWxG3vJoTUJNkOw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA4MCBTYWx0ZWRfX58U3gMFP8jYP
 ZLryegtck9ROARD5+78dxLcGgyJck0W4+lsVWoMmE8/vq0BembuBPWO42mgmaa0Qc6LlUZD/AAS
 vHPVBBnpnp5NWgWamC6ghL6kEuJpwNuGj2t5i04rbFz7fBrQpgr+gxoCZA8I2HB+Z4y81bjR5Tr
 yvAdDhmkss0a+UtiTGeWCvH3dTRxLiczxKOlHVLcMoSlwV48BbRuNAo49jqyVbjQb4i4wNxAMg0
 i3vIljr9oowUIc/AgjVY5AqzwdUYKTcWxB7SDqhppKD04rUIWNNqDTMLiZLf4hU4rEFJ/lzEuhi
 xPbgw2+sYxfCpMC0UVLP6wN5TMOIublkMIPBX/kKUGrkfDup8NtV2NmkrJCYZ7/6F+CeVcRQoBF
 dnWULaoezbgdtr4BSToQGtls6SmzTug/w7T1gQopSeSJFoK76wMbj0x6J6i2V8FHrPqnuLtUWKM
 YUjYPK1iO2Prc5DDPuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140080



On 9/2/2026 10:37 PM, Andre Przywara wrote:
> get_cpu_cacheinfo_id() can fail, in which case it returns a negative
> error value.
> 
> Check the returned value for this error condition, before passing the
> value on to other code, which would hide the negative number in some high
> value in the unsigned type.
> 
> Fixes: 36528c7681b8 ("arm_mpam: resctrl: Add support for 'MB' resource")
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>   drivers/resctrl/mpam_resctrl.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 9d223057953ab..a5e661eff86d7 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -786,7 +786,10 @@ static u32 get_mba_min(struct mpam_props *cprops)
>   /* Find the L3 cache that has affinity with this CPU */
>   static int find_l3_equivalent_bitmask(int cpu, cpumask_var_t tmp_cpumask)
>   {
> -	u32 cache_id = get_cpu_cacheinfo_id(cpu, 3);
> +	int cache_id = get_cpu_cacheinfo_id(cpu, 3);
> +
> +	if (cache_id < 0)
> +		return -ENOENT;
>   
>   	lockdep_assert_cpus_held();
>   

Hi Andre

This looks good to me.

Reviewed-by: Yin Li<yin.li@oss.qualcomm.com>

-- 
Thx and BRs,
Yin

