Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908542;
	b=4vChu7m6/IfGTNH1nHz1MG9ItoPoI4Kt6yUuW78dJnrR89rLkoyqD9ZvKFt45WqN6DU0
	 RNfrmo8F/85jqgKHkyrLLgMuyqLF3mEKJilg96wbJJjL1gk27Vy7KGrllkK82fMPdZht0
	 wQbePZsVzhke5vY5XDIbiCJb7+WfmWwh5noU8Npb3Y3j7Uj/e/iI+mHEQMIwDgkeqGAtB
	 2gVUi4QkS20nA2FinUFp7SurQPVe2Svnf2rVPOlfSamiGskQe5lq8tlIBfUcJiEyXFsNM
	 0YCy+B8CwhJuypOISlni9Dcu/cQmQnXC5/jYrM6vDMOMvyqiEZjo9Pglzy8zzj4PDKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908542;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FR0f5F7yPxxa4E3yXHiVVcQsrkarnwS9sLGa/aVW6YE=;
	b=2Qmr1jpZVjuE2mPLxHe1gceRUazTBUv8QXs0OXPrFUN1XMos49z16ak0rJpIiuFuOa8h
	 CB1AIO0iINrLWYI+IlIGCOQd1tv6KML8wyz4Nc4l2HpjYLkrHir19LXmMqWofcTjXEyB0
	 T1h0C+m/v5utmpuVfH5FQNbqwlhtoyKIVFdXn2Vf+B73gp+4hbmxUAGqU4fRodrsuJ+Xk
	 zINNuKcdIU5/RTo/rb7sMbz/7nvRy8F/5SbvYmzJKdcGVlaWbdjzO1t9HWSOQ7OFfUSOy
	 3oRluXUeJadWFNR+32HGy7k/Zuwm4miK8Td/Tc7ejvQEziPKTyu91gYGSKgPpgOm4TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fOlt6srD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c1XVcWe8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD304606A331
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD304606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fOlt6srD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c1XVcWe8
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6LgjH3980592
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FR0f5F7yPxxa4E3yXHiVVcQsrkarnwS9sLGa/aVW6YE=; b=fOlt6srDR6s+9QNV
	raHd50uRti9e2P8itcOQ+YgNPDJz2rh4x2xz4XYA2gDiA1hDj83jTr6FUTO5VEZf
	zC0Xf12Vcx+etOXBOVGhqukUzp/ZxwrXzuYL10ip77mubOq2nUBLYMfYWmGJFvcm
	m/AQhCua9zSdriOfR0OVsjm4Yl17KO6Vzdmq2hJCpXPXs2wdjKIoaV8vlTLpiXa+
	DGsIXq4ogr807/F6WshzoZ51dFEWNnFQzWfNkQ6ugE6BBQwQGqWZW2YrJpKbqYAC
	Wi/PCT9s5dghS8xq7eRKo1TUVtJgkZjND5etQRQDc3FNzwHmYL2etL7FTLXFpVL8
	fP7vtA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hkd0ru8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:42:20 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdb8931aeeaso2310129a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794908540; x=1795513340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FR0f5F7yPxxa4E3yXHiVVcQsrkarnwS9sLGa/aVW6YE=;
        b=c1XVcWe8ts58GvviucNhJs5LqeOWAihVIIParR7/Y4Q+lc96mY6FE+aC+gChl8IGuM
         DYcYIqm3ZhSeMFLEyHLh48TU0Ey19+YpkBlCjP95/CAQD9e+h++xbXxnHOWmTqGsPaQp
         ZQ6GEqsP5gwqclpZGvG7uGsXRCX4nW9ZgQyOUSPPxogzZGevHJGQ+JQqwhrZO+CSQOI+
         CAwOZHn1lHVyj8qP5LUNzfNG4JhpJzqDdPNh/mGa4PPtzSXYX/bxsJZp4esYADeWX7D3
         vvCOmcz45jDUqj9zrsIwmcKHWS+Ompoyj6kuc85xexQHeIplmCQH/JnjpObPdzHfeYh+
         h1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794908540; x=1795513340;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FR0f5F7yPxxa4E3yXHiVVcQsrkarnwS9sLGa/aVW6YE=;
        b=dlMDMHljuj0g8M+5t4phinBmj7LJj//OdB4Ks+O/0gCwGEOWH0guiY9QcGW+kxRfsu
         DEcsE5TPywQL4BfLPAgXPYjEef52p/R5muY/+cZBLhd8oUoxFWbciRmEPwzKlIATB+Ss
         lqlQauT9ZYdjuSmrMNAoqwzhyseya7M224085EVm76yOIHCS+hMgrSP5PSfD4pIG6N68
         PcN01K3pm/zysyBsuoA+xahGNtNsQjee/PlURLE4Y013hoUWTLdLO9Zl4EMTvb8g4zrA
         b5hDs1zOAp4V82KWEwycX+tkUKDgKk+OLTzGubGk71N9zxHPLGGbMOmk6iDrNXbUAfKx
         1u8g==
X-Forwarded-Encrypted: i=1; AL+hErHQlm7Q4/b9dBArX6TpS+VJhDXDrreSldCWBETdC+EFM/f/skipPpYDaPxtAWb79cYvLU6yh8Au4np7AI8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8m/BtX2mNZYodYl+3mIqTbcXssZZW8PtFo2XDAunzDzjG2Otoc
	kngvXcaVWM91+WMK5Klejkxzgcmj1AWg3ZJ6lHArc4usdAroH7qLQ8HS1CycjY9ddSdPt5EUr6w
	WnDVpAE0Jdduw7bKIQfhX24FgMJRv/S/Vr3brvQnlUjJ4Jvqy7NFaboBEqkE62esa2xQ=
X-Gm-Gg: AZFdTZd9O7RrortO6zf0luK3Lb0rElDTBYSG1iM/tj4m1Z3kcASdRA7dzj3n7XemEXY
	Rqw99Kf8u8CUq0bxCUgvTbBIUgEZX5FjkGAPqOZIFeohxucDd2ontOjDNGAYJrWCmA7cqOnKyIG
	r2k0YW/noU5Em3NeoCRX+Un8e8ra7+9/SNmdVFa/fERho4UquKE5DO9uErIUUaqU0fHTykSgcxE
	R06gDWdFRqbIKKj7kmJhzRvelR8JfH5A/atp9PDBwGeR2om6+ozeypNjr35kaUlu2vlJsc7bOVt
	lDmZJq2WQbDUHETOryLXjADjY3od71MUQz4NzLP+VSLjHZAalvIgtomdLTK/ULOl114G+iuFEJJ
	wq9Hn8Zr7othdlnofkz5XnHXKgL+WLqxFAB+fGXz5iTARcm/ETm5yGkCc2QJ0TE0DsYCu4OXrG+
	NvCuEQu8exo+AzLdHWbdOFTtKy4HZGqxnnWYomnB5XSdUXVYSCJfkTToOnMAzZ
X-Received: by 2002:a17:90b:4c10:b0:3a4:6e84:e7f6 with SMTP id 98e67ed59e1d1-3b1b07ff57fmr13204634a91.5.1794908539556;
        Tue, 17 Nov 2026 01:42:19 -0800 (PST)
X-Received: by 2002:a17:90b:4c10:b0:3a4:6e84:e7f6 with SMTP id 98e67ed59e1d1-3b1b07ff57fmr13204605a91.5.1794908539106;
        Tue, 17 Nov 2026 01:42:19 -0800 (PST)
Received: from [10.79.117.97] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b245f0c3sm10640263a91.0.2026.11.17.01.42.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 01:42:18 -0800 (PST)
Message-ID: <2634a358-59a0-45e2-b2bd-2c404db3389c@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 15:12:13 +0530
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
Subject: Re: [PATCH v2 4/4] remoteproc: qcom: pas: Add Glymur OOBMSS PAS
 parameters
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
References: <20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com>
 <20261015-oob-support-glymur-v2-4-715435f52dd7@oss.qualcomm.com>
 <20261116184727.oscwnaurivcxrg5b@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20261116184727.oscwnaurivcxrg5b@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eqFKXYpX c=1 sm=1 tr=0 ts=6afc217c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=P_9HZXhiIeUehgLQJ04A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzOCBTYWx0ZWRfX0Y7u2CyJ3DZb
 MRFusAVKIQePTW/L9xybpuYx3CDlVPyzogrftT4ExR0C3WDLppC64M+urUZ46POVMl1A+GGCQe4
 XnF8HEs1ca7GcmeDgV1wdwdlu8o0x2w=
X-Proofpoint-GUID: lSaXRkrfso2Qfo5SrDuiCX-44vNsdS7I
X-Proofpoint-ORIG-GUID: lSaXRkrfso2Qfo5SrDuiCX-44vNsdS7I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzOCBTYWx0ZWRfX7tnW6P3Yp2ae
 UorgkVXUIdftouReweLt7cu9AYKMCJ7fNpjfafDFKly2QW6Wgs+zPp7cD8ns+onOk0bpvNV0hF8
 S5xHIHLK6kLpPFmk68yjiy8uU/BcPKrgr9liKtzD+NKMaGOrOCR8E5LYyOwCYSt3EIDSj3iVGiw
 /b0Iq1o1nVjzvaMhEvm3Ux/ND02teAChjINSTywiPFucOBNv133BdmFdBYLSWVSiGpcE7tw8U5Z
 zU78lffEzFmwuWbQj1Iz2NPOwEcQ5viIfxD5DwcuoPCvevdstJu2uoJrT+iFroHMokvvw+IsS9Q
 kiv4ggb+2Fw+2MtivCRqm7PvYuHTIQ6JHQi1mfGF+Z0NHmiQkyfycu6TvSr5HjiilrniDjfnx1j
 U+ZIj+gOx2sxrGritfX6W0nP17dhp3z6Y3ZqOdIWlFiL5Z2BrLmNYEOKUDfoK6DnNybyeVlvdOz
 /wviqiJPYgl6AEFLsfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170038



On 11/17/2026 12:17 AM, Mukesh Ojha wrote:
> On Thu, Oct 15, 2026 at 11:25:52AM +0530, Anvesh Jain P wrote:
>> The OOBMSS consists of separate OOB-TEE and OOB-NS Zephyr subsystems,
>> each with its own firmware, DTB, and dedicated PAS ID. Add support for
>> the OOBMSS PAS loader on Glymur platforms.
>>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>  drivers/remoteproc/qcom_q6v5_pas.c | 25 +++++++++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index 374cafd04b62..ecefc6a72fd2 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> @@ -2080,6 +2080,30 @@ static const struct qcom_pas_data glymur_soccp_resource = {
>>  	.needs_tzmem = true,
>>  };
>>  
>> +static const struct qcom_pas_data glymur_oobmss_resource = {
>> +	.crash_reason_smem = 669,
>> +	.firmware_name = "oobmss_tee.mbn",
>> +	.dtb_firmware_name = "oobmss_qc_dtb.mbn",
>> +	.secondary_firmware_name = "oobmss_ns.mbn",
>> +	.secondary_dtb_firmware_name = "oobmss_oem_dtb.mbn",
>> +	.pas_id = 0x42,
>> +	.dtb_pas_id = 0x43,
>> +	.secondary_pas_id = 0x44,
>> +	.secondary_dtb_pas_id = 0x45,
>> +	.proxy_pd_names = (char *[]){
>> +		"cx",
>> +		"mx",
>> +		NULL
>> +	},
>> +	.ssr_name = "oobmss",
>> +	.sysmon_name = "oobmss",
>> +	.ssctl_id = 0x21,
>> +	.auto_boot = true,
>> +	.early_boot = true,
>> +	.needs_tzmem = true,
>> +	.decrypt_shutdown = true,
>> +};
> 
> You can move this alphatically before glymur soccp .

Ack, I will reorder this alphabetically.

> 
> With that change
> 
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 

-- 
Best Regards,
Anvesh

