Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DC927B340
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 01:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791509008; cv=none; b=UN0C/XWo5Umv8jTJpysmcU+8STDZWlvCfAMtco9td6gVX8hBKh0doPrHwlBb/TYucWK78AOXfiHOSalhFXjTwQ/LUTi1Nuek59o0dfzHtBuHZUNRleBIfsTZ/jBM98ein+uUovcMnbRqlh6CINjIF2L+1mFlKAGBKBxDQJafqb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791509008; c=relaxed/simple;
	bh=Otc1eClTskN36WW/+Q+gSjpPOm/VJC+6FVmSxXljFXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B0FNRL58GHc4HbxUsgil+0lrmJhPFP5Az9/bezcj+dbe3xKbTD5DU9MtQPyksO1MUJ/9mBIRrDNjBiBKin8FPFUtlu7fCINy7QiZqj+D59yahZcJKOS/M++kLlvOymacEtSRJhG4o8hjPqzS46vlTwD2N3t4nebm41qMB+5NsXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aPVnLAYT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aSJff8k9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aPVnLAYT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aSJff8k9"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6990PqrD601759
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 01:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h98iV6Q0aG7lfgYBEOhhB5ZnqHQoTZTm4bLQPavOiIo=; b=aPVnLAYTl0QnqGYi
	8x0b3Fo4zopqvPs0jw4eJPoKv+wqUGMCc1kBpwTEz2gPENIatPiCUGUO+9OMNcG9
	kFhJvbzYa08ID5lSvdX16QIEoTQnx/QLmqtVKo4SRWTJiS9QCJSGiZ+96hYp5j6C
	xCzXtY2RFOxK3JifDGz4muoR+8VcaAPbEZE7p4ALld7rHBq2wbnHEAunxMgxWs1E
	yIPxHASAbVj0+A3O0pHpmq+Hhe7ltZTGot8MWSsfBSBq2ZVHygotohKYMAqhJaij
	A3tRQQHlu/U/lu80Lg9YhcOVfB4P+A0XqIu2q9fW98fg3Se8Le3I3gZi2EHxJLYi
	9dPvwA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fyj199h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 01:23:24 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-88c768886a6so4887136b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 18:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791509003; x=1792113803; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h98iV6Q0aG7lfgYBEOhhB5ZnqHQoTZTm4bLQPavOiIo=;
        b=aSJff8k9AxlbRI7TnqbWvbWnqlgt8Pfe9HcQwM2wUZTa9LjDhQz/EGBJ9gvLQufvfn
         AY3DnxHgzTeirBD2nMhG6A/jATYw3SEktjnUJGHxzV+z0daOaHQG4uOo4KcetU5I1TmJ
         KokE5+RywXMONjFaOMozW1oYbJKyL6dnQFW6V3svgo2GVy8uBQ9xSYrAeuo8jWl90orS
         83gijxitcDfDp5WuPzIElZiYYCRM8tSCsabzgXLzOz+85Lc7+fp/hzpAAiZCoxtepiyg
         9c1i8m0ARikcAoiBV1Fwy8p246Nu7eBAfC1PQ0maSxZAgVeuDgv6Lnd5K6snSMVwlm1o
         /GXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791509003; x=1792113803;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h98iV6Q0aG7lfgYBEOhhB5ZnqHQoTZTm4bLQPavOiIo=;
        b=M4sIBm2a1qSlqSsA767EfUUFIOOzy/mLxkdFfQo7MFUnCi21LDzKQoCuhIrd5Kp1Ma
         2YusV+ltOdr+7aqMiuFdAfNTiz/4chuKmfXA/7jprOVaCTwyVae0SqDGofgSXSV7KNet
         sMcKeuZLFwHgjSG/l/mHbF2kcqisKPm436Mr7sd52BBlHeG/dfTyxPM/nzbT1WrVstHi
         XrgewJf0uAWB3aB8TIWdXPpnBx/IGU5TtxMuAbYd1IWw8FVCD4hg3amhmwb5Oqez8kge
         8W7SgsTnWr4JNywLmQC/2qPCfxOAjQ1OZIJ3MH9CyPYZHTlMbIblZ109z34SebuHRQJn
         deMg==
X-Forwarded-Encrypted: i=1; AKwUvByMUYK6HU39HWdYyp9IgZ5d0qqBb+w8RTiCoor/JulllnBT6Qrk3fVG2NaV6Pd0aw7fr+/cLuM5coS1vaQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ljP9Z6moW9HXWsJuPCcILSl5k6FnrnBSWiUB4A9bG8rRvixASQ
	hCNimUld38WUHzPkAuypQzsu+IycrFYoMKgzGyeTdTdWEs2yywUgPFIf4MdHple83g9FV2nCt97
	oXilA3yBnxV74fHGgVQsihujTv3eYyGLfPU2qs6pjVZlVxyVnrhLUVP4ntPDnMJjlGGmzRPF1vz
	Ts
X-Gm-Gg: AYBFou192VQGCtCJm7GpXBF9pDnoeM3rNgVcJORbrIUAMUSqRc38bpeMToOLCMB+Plu
	i1Gf0Qen369CoKyHMI06l4vNVGu10Mgi/P+xL4E0u5PkLOPYBzkw+T4i1v6aIY5q/2XmIT83ODI
	BxzONqaYo/lLRY9bKqgiX+ej2L9XsxqutiF6XV9yR3gKjDej39E/Vcm4+fAgwUvucLYaffKy/Y8
	yHUeoFR/cGJ8tQ9C/9RVbQk4jcFfHqp3lCG9DrLljYe7reoE54j29RwvROtatmetPSCULbWyroE
	2lyip2lhUVajpYZWjmAP9BrRMgaKE4LdW0Z6WJC/DEmxvjhmqm9lP28alvapA9I1p1QN2CqFoST
	PA8aVP8gtC/psbhsS5b7eXFKjkpcccUnX
X-Received: by 2002:a05:6a20:94c7:b0:3dd:e2e3:30fc with SMTP id adf61e73a8af0-3e16beb6c8bmr220434637.49.1791509003322;
        Thu, 08 Oct 2026 18:23:23 -0700 (PDT)
X-Received: by 2002:a05:6a20:94c7:b0:3dd:e2e3:30fc with SMTP id adf61e73a8af0-3e16beb6c8bmr220416637.49.1791509002735;
        Thu, 08 Oct 2026 18:23:22 -0700 (PDT)
Received: from [192.168.1.86] ([65.181.12.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c4a99b28sm247103b3a.59.2026.10.08.18.23.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 18:23:22 -0700 (PDT)
Message-ID: <4b5d8ee4-4927-4932-963c-19eb76a8f67d@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 12:23:14 +1100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] tee: Export uuidv5 generation for TEE backends
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-0-bf1c8e2a64ab@oss.qualcomm.com>
 <20261006-qcom_uefisecapp_migrate_qcomtee-v4-4-bf1c8e2a64ab@oss.qualcomm.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-4-bf1c8e2a64ab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BfpNQbt2 c=1 sm=1 tr=0 ts=6ac8420c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=9v5PfQ1E2GNzj2RibJmqVw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=_rK1-4A1YL53NBNV8coA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: Flt2bIJ4N6jp61VpAmOfHlXEuvWrA_2L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAwNSBTYWx0ZWRfX/yikw8ktnEVq
 VnTgrw5Gn4b3kgosTDJOQVUQH/APj9NJZmLlSXd6HCFqW8QA7vQdAXbiDZUfOYJLcLkAiZ4jVsV
 U40YfZB+Kvi2ktFqfKzmi45mGEuOqGjKacASvIOyL+9Nz02i8wTBKNuqVwBcVZk0lh0xTiizkJq
 pN1TTZxzzenM6RG9gZT/rWHH2QNPNrwnUTLgTi7XB9kaqQmjaPnSW0rPy+7UMvWCWJBl2p5QiNX
 yPuUJVDwMF/cxImsfJDrYt76bIsGA9301IL0X++Ys+ir3gftOAPggTWQuivszb/n50IOWnsZpj5
 lXS720tk17PMY5l5Vu2oC7pcul2vVNHD2ou8+w3mwIvHViHD2SdvBss8wSETO/y/eWga4uyLQe+
 pwn+Sfi0PLHo+Z9FKEUFEmlqUNP+/eIzRdpaaGfzhYhxalwZyVS4H/6BBgGVu+Rcw1c0btEvEzG
 hNmuj5izcpPk6eE7cfg==
X-Proofpoint-GUID: Flt2bIJ4N6jp61VpAmOfHlXEuvWrA_2L
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAwNSBTYWx0ZWRfX4HrxsRKt3rfi
 PPE9dlFB3t4DoyY/yyos5ghUn7n0jCmOkl/t5Jpu1xRprCE/IrTBIV4O2tLA/nIiqnaQPTHsedb
 K5iyUDL4Tdd1S0/P6EMHr2FDOFeiku8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_01,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090005



On 10/6/2026 10:33 PM, Harshal Dev wrote:
> Export the uuidv5() function defined in the TEE core to all TEE backends.
> This enables the TEE backend drivers to generate a UUID for identifying
> and registering their secure services on the TEE bus.
> 
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---
>  drivers/tee/tee_core.c   |  9 +++++----
>  include/linux/tee_core.h | 15 +++++++++++++++
>  2 files changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> index a03a3d645dd1..2cfd302d1393 100644
> --- a/drivers/tee/tee_core.c
> +++ b/drivers/tee/tee_core.c
> @@ -135,7 +135,7 @@ static int tee_release(struct inode *inode, struct file *filp)
>  }
>  
>  /**
> - * uuid_v5() - Calculate UUIDv5
> + * tee_generate_uuid_v5() - Calculate UUIDv5
>   * @uuid: Resulting UUID
>   * @ns: Name space ID for UUIDv5 function
>   * @name: Name for UUIDv5 function
> @@ -146,8 +146,8 @@ static int tee_release(struct inode *inode, struct file *filp)
>   * This implements section (for SHA-1):
>   * 4.3.  Algorithm for Creating a Name-Based UUID
>   */
> -static void uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
> -		    size_t size)
> +void tee_generate_uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
> +			  size_t size)
>  {
>  	unsigned char hash[SHA1_DIGEST_SIZE];
>  	struct sha1_ctx ctx;
> @@ -163,6 +163,7 @@ static void uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
>  	uuid->b[6] = (hash[6] & 0x0F) | 0x50;
>  	uuid->b[8] = (hash[8] & 0x3F) | 0x80;
>  }
> +EXPORT_SYMBOL_GPL(tee_generate_uuid_v5);
>  
>  int tee_session_calc_client_uuid(uuid_t *uuid, u32 connection_method,
>  				 const u8 connection_data[TEE_IOCTL_UUID_LEN])
> @@ -228,7 +229,7 @@ int tee_session_calc_client_uuid(uuid_t *uuid, u32 connection_method,
>  		goto out_free_name;
>  	}
>  
> -	uuid_v5(uuid, &tee_client_uuid_ns, name, name_len);
> +	tee_generate_uuid_v5(uuid, &tee_client_uuid_ns, name, name_len);
>  out_free_name:
>  	kfree(name);
>  
> diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
> index bcb5418d6fdc..a3f4f88b8423 100644
> --- a/include/linux/tee_core.h
> +++ b/include/linux/tee_core.h
> @@ -272,6 +272,21 @@ void tee_device_set_dev_groups(struct tee_device *teedev,
>  int tee_session_calc_client_uuid(uuid_t *uuid, u32 connection_method,
>  				 const u8 connection_data[TEE_IOCTL_UUID_LEN]);
>  
> +/**
> + * tee_generate_uuid_v5() - Calculate UUIDv5
> + * @uuid: Resulting UUID
> + * @ns: Name space ID for UUIDv5 function
> + * @name: Name for UUIDv5 function
> + * @size: Size of name
> + *
> + * UUIDv5 is specific in RFC 4122.
> + *
> + * This implements section (for SHA-1):
> + * 4.3.  Algorithm for Creating a Name-Based UUID
> + */

I think the functions in the header do not need to replicate the docs from c files.
If you want you can remove it. Otherwise,

Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

- Amir

> +void tee_generate_uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
> +			  size_t size);
> +
>  /**
>   * struct tee_shm_pool - shared memory pool
>   * @ops:		operations
> 

