Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854858;
	b=LM6ScORIMWWrNwFy7sLGaIZ+tEEJeDgIXEzwe/1SCbv8oXRF4JXoYHuW6TEesaqmYJGt
	 W4AKkeRP4KTd1lVJk5Z91NpZA8iWzx61PGsNEzStZZabS8bUEGS/2MmRmfjHvoR9ZeHU3
	 7OsJ+qD79O/hLUKakf/AXeoRQuUGYICoIVA3ExqpnkVBSwDfH5rkhJ53eq1m8A4xC7Zh+
	 IwQBNB5+PDkdIbOtfGifdzlxEeYU6qX5KOwIGCjbdEUfVaxKKIwz2pms9QPuCbDzW123H
	 TjWO9qDq40SpDUKI4MfR7pj7a8gznnLLKwoogwvDih2VzQiy3vgp1z8jQ2LvuZeoJdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854858;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wJnv0bUBCxxkF+5/me8K4UOGEYnfBL17cIYCxZ8KEYI=;
	b=qLYfe1o5/qmIrgSDeri+RbYntgIpiYW6xgqOmPUW9m9qk8BwamKoKb0xEKTyOstyNCgp
	 kAbxc7QGDGd6JbnoiLNbU0j/e8P17ENYKpDZCXlu/EvcQLPbkxpzethYoApxcm6R7GDYW
	 HkUlEVjD1rQK/19CcqOVpNoum+Txr3JbN01udD0KPrADdD2I4brNg+y9lhQiqBRqB6YbO
	 U9sM0/obcsxJNiUjhXp16CRDzFVHTlC6F26a3N1ZqCSAJSZqqwmatXzlZIXHhV5u3aAsy
	 nY66PG87zL9lqDjuTX4MKyGqOBydE0T9N4sFo8zFDcy5AHXA+JtFL1iXd5Cbb2+1hRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QxEl4S5O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NgfD96A7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB50606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFB50606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QxEl4S5O;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NgfD96A7
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGKAVF3693036
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wJnv0bUBCxxkF+5/me8K4UOG
	EYnfBL17cIYCxZ8KEYI=; b=QxEl4S5OwYMBpJm14GkNo3mBViG3j7eEQ/LGc+WE
	ytCLEnQDJL4woYbp6IQMvawY0wRDPCaG8f1OwZwJCTOe0/RhhFzYcF/cozvxBk5O
	X/mr2nuazmHjLDSofV1kyyz+sPD3UQQAbhcRjo3ecxCf5eMi8+9VZ2FCQZC9sj6E
	DHt7v5sa+p9xm85raphrjgxy+XPWab7ZL6IUkYq9IZ6lBWWoUycI1ZVtbXqEICsm
	8lEBbum1Pax0R0OZUDqX4oCepPmiqvrjpmuakI4gPbC8wN9LdIlAjn6zOz3b0cd2
	4pWbKf5SCmIReL6zYQI/MdCRQ2u/WxN8FSEn6dtrOV4J3w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j01f81kd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:47:36 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-37158b53d06so72776eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794854856; x=1795459656; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wJnv0bUBCxxkF+5/me8K4UOGEYnfBL17cIYCxZ8KEYI=;
        b=NgfD96A7ObdMBQKuZrOuw3vLEcq52bi/tzatQAI/9IFNeipRgePfCpEEn3U40xgi7B
         2hfaZnbpsnnYl2vKEC7FCpdoQgGrUVnshKmUNwJkNQaCXN7294YsUzMk56ceVUE2+bm3
         S/QJcCiXUNJ/bw9wF1+JfxBGhLCbtCyOfg7nr+TkR15qOzUZ/5crBf/eWto3YBkqUGzc
         f6pjsRMB+8Sj0KYpDb1YOY/D3TM3WNNZfa60GbMAMI4Vl0QQjSFRGUA8g7RdviwUNp0R
         7G5ty+M5/9X1cPEBCf9BR792I1oYhp2IvaWqnam+PlFDxesJPPaP0YCGwRmwQzUfUv1e
         xP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794854856; x=1795459656;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJnv0bUBCxxkF+5/me8K4UOGEYnfBL17cIYCxZ8KEYI=;
        b=ahc1YySk9lxKBl++xiSRbeN7FC8l781tvae2yBPXqtv9MzUSRenhYKtDm3CKkhSJDQ
         bGdCnzeMosDZan9+rZ2ztL79mbas2thShyguBYw9suRtLMr2JHMH3IeU1wwjv8wnBye6
         EqgrEfazgVFQKz/VFRGT7eyXrB65hzstLh7LCl8hV73dgMBOcupV8/HxJchCg4TXNcQY
         qWrrcyITDSMUo4OXZ2UrCovs6GmLov6cEarIJDfB0srNdWb6wygiUkLuNRcGv2ACCj5o
         CVGilrSdPv8zlEirC4dXdaYon8mMKfWAdznNkMpd+SQiPZdUmQputVHqpKx7XsUIkSen
         oGmg==
X-Forwarded-Encrypted: i=1; AL+hErFNytbaDskVPLSFIWp/anAx7TGjZZh3OxOmpLRxYSmqOy4vALdmkhO1OlI4wONei2x1O6CZH6FUxp5fd/I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sL1fWPWnyM28CvD3PjsGOscDRTSsMc/uLnkcXC0kWarJ3zcVB
	/T5q3jWiPwt3ENlxDR01nWIzRs7FVx7pwAzMn7V+SBI6P4gTXLIXxlcQ0zHj5lMpMSn7p3QexEC
	EPep3s4NivT3uPUDXhXpny5ZLM2/LOteRZLtzoNzcc7REJ9gfyCjUfT0ms1hw3gebwhc=
X-Gm-Gg: AZFdTZfff6couZAZ6UOn91CY26kG8lcSmr6jpk4Jv8c1duiHFsYzydDAu/kxeo1AMxv
	VhjRQNES/ihaUOwFAknJAUfQpvlZqpWgFEIWG7lvF2ezDkqoLIbvPR49y9H4zC6quGoT8GGQcCh
	7omublsIM1olv+RQdb82kkXYp9p9FUhw5D7KQAyDFWYQ7plh/WzmtN986GlLF3Q4craZoMpsAzq
	AC/IKme7fAHsABpzjLu+SbQQCGUGUXQQZ8jNg3TVsxQXQLjtTrdnyCJWb92g/lXBTNrxP6Dp8RA
	/sX6sAIbku5EOs2BeHTm762bXWpsQFOhTni+zE2x3+WoTn3dxh4Z8OKxHbpREOenkETfx3zyv/S
	DsJhnGKhClHPPyejD77uEx8bH01HJEH7SyB346fjPIoQeRw9RUuyMUxV7h+TUQrYackWTmwMQFe
	9K
X-Received: by 2002:a05:7300:e922:b0:381:120a:c7e6 with SMTP id 5a478bee46e88-381121a0e13mr291433eec.26.1794854855596;
        Mon, 16 Nov 2026 10:47:35 -0800 (PST)
X-Received: by 2002:a05:7300:e922:b0:381:120a:c7e6 with SMTP id 5a478bee46e88-381121a0e13mr291406eec.26.1794854854961;
        Mon, 16 Nov 2026 10:47:34 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm34761572eec.22.2026.11.16.10.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:47:34 -0800 (PST)
Date: Tue, 17 Nov 2026 00:17:27 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/4] remoteproc: qcom: pas: Add Glymur OOBMSS PAS
 parameters
Message-ID: <20261116184727.oscwnaurivcxrg5b@hu-mojha-hyd.qualcomm.com>
References: <20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com>
 <20261015-oob-support-glymur-v2-4-715435f52dd7@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-oob-support-glymur-v2-4-715435f52dd7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA3NCBTYWx0ZWRfX3luEqNbgdCFm
 9ga8doBPnP6e2fex7g5z1Ry6jpZt//8rWOMqoL/u1iXeqXXAc4XETAiln/EqW2afm6CWe3abp47
 Fz+L6trZHpST7jxWIGNl3Rc+X7fR4cBwo8GNANDFS9JXkTamDhHYys1U0gl+lLPRmJ3cpNU+UZ4
 HcGtIHXYcery0MTUjtbwd0k/YbQP+ZnxLN2LQ3C0eUKAIw4eLvHHGPbILL+TBZJxvvlOHjlsfxY
 bME3Z1eAmmFRU8jFQRU65yj/3knRbyfTVJZc4QedEdhoVMZmsc/GEIx1102EgUW49o9ewAeXq4j
 xLLwyPDZzqmIbzhZgAACRXH4tH74brf3I2mwa2/r0KikSS/f2pWb8BfBiSGtv45fmv998javyLt
 qZ2/6vOZvi+H4mOJstBjRgBcym73uBX0AxNEoAhNP7ngezLFtR4xu3HUWz5qlX22Zfb4e0lxXa8
 hzqeEi3C1B8kQLAC6AA==
X-Proofpoint-GUID: RSHjPRwPAObdCVUg0BxfL87dcFADhuaC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA3NCBTYWx0ZWRfX4+i+jnVSpSuE
 2WGvre9u/jEJ6sbfG8XH256mJXtKy4VzkaU9Gz5UAwzUvQNADYHkSuwtQUSOuRtJJuMRAbpnEVO
 Ory8EmL6cZH24fJBYE6F63gb4P2rrws=
X-Proofpoint-ORIG-GUID: RSHjPRwPAObdCVUg0BxfL87dcFADhuaC
X-Authority-Analysis: v=2.4 cv=VMpIDNPX c=1 sm=1 tr=0 ts=6afb4fc8 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=HDZkkxcUch80iLduT3YA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160074

On Thu, Oct 15, 2026 at 11:25:52AM +0530, Anvesh Jain P wrote:
> The OOBMSS consists of separate OOB-TEE and OOB-NS Zephyr subsystems,
> each with its own firmware, DTB, and dedicated PAS ID. Add support for
> the OOBMSS PAS loader on Glymur platforms.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 374cafd04b62..ecefc6a72fd2 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -2080,6 +2080,30 @@ static const struct qcom_pas_data glymur_soccp_resource = {
>  	.needs_tzmem = true,
>  };
>  
> +static const struct qcom_pas_data glymur_oobmss_resource = {
> +	.crash_reason_smem = 669,
> +	.firmware_name = "oobmss_tee.mbn",
> +	.dtb_firmware_name = "oobmss_qc_dtb.mbn",
> +	.secondary_firmware_name = "oobmss_ns.mbn",
> +	.secondary_dtb_firmware_name = "oobmss_oem_dtb.mbn",
> +	.pas_id = 0x42,
> +	.dtb_pas_id = 0x43,
> +	.secondary_pas_id = 0x44,
> +	.secondary_dtb_pas_id = 0x45,
> +	.proxy_pd_names = (char *[]){
> +		"cx",
> +		"mx",
> +		NULL
> +	},
> +	.ssr_name = "oobmss",
> +	.sysmon_name = "oobmss",
> +	.ssctl_id = 0x21,
> +	.auto_boot = true,
> +	.early_boot = true,
> +	.needs_tzmem = true,
> +	.decrypt_shutdown = true,
> +};

You can move this alphatically before glymur soccp .

With that change

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
