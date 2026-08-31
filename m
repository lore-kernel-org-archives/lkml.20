Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B913DF01C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788174924; cv=none; b=mxZXJEOLWJjcA5cEit1HdZpcIlGDleYv1yNWn28ifO5CVTUtG4tPgrZXKtsw1CqyXJlQAzjA/WGEq//XzVQ47d7ciCPoViRZ7iXQ/2K8H3Q2jc2lFNtd6jmKrbAo2YdC0Z2QwqEuxugwCs6Y8IS2VFwpR5dE/pRYcW4EnLHa/90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788174924; c=relaxed/simple;
	bh=8ULGEUNNJjvyNdM22e7Tq+wJQwAaiE78urMxW652MuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UcizhPFGFAkLUj2G0hHplWH0grBzVlDCPlrCYHqgMs8HprCwe4jQi+f+X9y4LQdkVDPCBFOJvB5tOLwnzZpd2FWBz6C6Z/hLWDTM9MBHCez86aRAi9tu2SYwgbDkI5sPeVLRvaERVIAYn3HXHCQ/cUuusvNQ7Fvul206t9fH6FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i/ixE2zj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XE8Xu8pr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i/ixE2zj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XE8Xu8pr"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VBADa64099248
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:15:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YunmAvG2pE66QhekMLMzUPWMf7nH38ggy6Vr0EmXp94=; b=i/ixE2zjgLMAs+zL
	bcCx3btOx/4Ux2/TNwtwOUaRperJRA9AxSnZPvAg0e1ds4JtnacejfPRsY1lCtW7
	R7xYUn+vxZZq2b4iYWTTO2DiNkCeKFcv0dQR75texHXYCRWilBbZmbBlfYWJEckX
	Q9qM95p10/VnqFlw11AsZeTLExTapTqNriqqJu+bmwOxZ0FEULlOIHRSHMq1JLKb
	7k6qiB4ylYmtzpj5/hNOTj4LxEk6r7bVksPrwg7qHlXruSDoJ9zwH3s/vUEzw6NE
	SZwb8dsQDo83WU/olEoagz8EUeafeYTK3tBj7dX3yBWRNFdj4WvOqniFs75AsmHC
	TBCcOw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4x090bc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:15:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52fa40fed05so6711521cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788174921; x=1788779721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YunmAvG2pE66QhekMLMzUPWMf7nH38ggy6Vr0EmXp94=;
        b=XE8Xu8prFjvfi8eHfXnfYlvvYeLTxIaNPf2gbMA+r+i/4u0cIV2R5EqDU0PGLLCVTM
         i2cE4a6gzxSbBNHhCFD2hPDNq5fOWTGvzZ3y+Q0FO4wpjIPBYIIzDfqFnzMVShe8/NQo
         4O6F/cy4Cg6uL7xmIcIFPvBxYFBBI/aQqsMvJw5W1/cKcyGBOij+Qw2Sl2q94/zSLTLZ
         UYahTeKTC5Q4ztRjzKiJwd3MHX9WUHfbv1abQMPufDvxw8mTKtnHqQY54x5DyIEVheq1
         4OV3/NSa0qUlbFt7DaqSLq4VG7Mq3tbHvcXAjcET7ORGC5ZxlONN8Jrr4FnRS+IcKznB
         jxfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788174921; x=1788779721;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YunmAvG2pE66QhekMLMzUPWMf7nH38ggy6Vr0EmXp94=;
        b=SVE+vJALuyFoBv4STdv3PhY41MD1KJ6d44mVVc8IvFgccaP3HwsC4xDOwEm5324sNm
         c3qi/Rlq7FFfPVp+08yGpYfaE70ZmuQr4BNOtqDHrUIATcGZUIbhBc7GgdXJhcH4VB7k
         YrOuUT2fST8taUvNAhMt8j8+C7E7JPbf2IiFo/H+xpBD64I0ld8p5CiE1n946LttOU4k
         L7Uc4TLhBWs9SeN4jSV3oXApRUxwOey4xKi6Iyzywa18njWUK5V/eJf9zJXwFuCrvSmO
         9U4o3OX47edLVZGKrqgHoCgy4FxtBPi91RIggXEc6HPh3RjiNGnlGze1zY66SHN5AvcD
         UxMA==
X-Forwarded-Encrypted: i=1; AHgh+Rqqi3edUPGk3he1yuw12evxNH69H9hZP82qPaqlvgRFlnsbTLr3lx5SgZvYbFsQBSNTidzE473GU1OPilg=@vger.kernel.org
X-Gm-Message-State: AFuF++kKEtxpkUZff1OgnME1oAFmkOCqm/227xfMzMNgdCA92zo5DdTJ
	dlbzerrHb+wzkFusaa6PLCrWEt4XkTrz5BzuqsZ0T0JgALUq6BaTBFpLy0Qodvi7Lu/rQ1B0o1+
	Jus9zadQnvQCjjJYsuvWI2Oz1I2EjqsSUS8qrccgqJu4312x78bmnUDncaCArVu3/GnI=
X-Gm-Gg: AR+sD12OrkRZ2GqZCbltU/Pe8cT+8zL4Vbtw7+XGszd+qzcRhC2i4rAUlATowF7M9Me
	iwQ9YsJZ6uNDtWv9QPaxIsaZVawIsnYD3pWoCHL17V7Vd3h4JrYUQlxfYlDU26YBRllbqedGG7F
	icDJjkCgE9fxqmHPO+gYPklquHWUd5cmvL5Y+kCKfB1P0RkroPrRoNyIpAZ0yIj1wYKgsSFPKaG
	fwG2qbWi7601an3KKtayyuJ3tZBAohcsjUuR2DwTabNGgxLQj/vvhBxL8ySQ+GJmP2hg4RKm9nW
	NpgCR8MhWs+GOhoy0LGfuUM7o8Gc6UP67lTBcHh2/WcDQyzv8Dc5w0BmVZ9t8ILpvldZzvgFpk/
	xssg5IPtEM20i/vppZkBtHg==
X-Received: by 2002:a05:620a:45ab:b0:939:74c:f122 with SMTP id af79cd13be357-939286884f8mr854290685a.1.1788174919571;
        Mon, 31 Aug 2026 04:15:19 -0700 (PDT)
X-Received: by 2002:a05:620a:45ab:b0:939:74c:f122 with SMTP id af79cd13be357-939286884f8mr854275885a.1.1788174918130;
        Mon, 31 Aug 2026 04:15:18 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25895beeb8sm212026866b.31.2026.08.31.04.15.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 04:15:17 -0700 (PDT)
Message-ID: <e7f7f0ea-cb63-41f2-93c6-5d47fe4cca3b@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 13:15:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] firmware: tpm: Introduce tpm-qcom driver
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
References: <20260831-tpm_qcom_driver-v1-0-6f16fa6924fa@oss.qualcomm.com>
 <20260831-tpm_qcom_driver-v1-2-6f16fa6924fa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260831-tpm_qcom_driver-v1-2-6f16fa6924fa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA5NiBTYWx0ZWRfX8tJeyHV+soJX
 wglvzxGtNZpXO6PKpouCLd8xwnSwzetim3KAI1R3wxoEDr8QQs8uDAfKaC8EHt51//FbbKRyCyM
 VXKz1HhQ39ggi2H11YUJpq0feV8pXl4=
X-Proofpoint-ORIG-GUID: mif5ZEJkm5RhBcUgH7-prTA2TlazBlL1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA5NiBTYWx0ZWRfXw94073vamwwJ
 P8EsThMis3P1nu4SLa4Skj82mTf1VAU9BKnZhQsCCOOeoPGrhT/r06d5Ira5mYX5H+bTYqWVsFf
 /X1XE4ZmnEg4+cu7PoAHWkeNEk0kVtI+isvwGGZ9spxEsreYftAEYmphQwkplopYr9MmY4AZyXk
 leMHtmmHOK6F7cIIhqahsQRlvzgwiy1QWUS71x4OepzPtbMSfvMcpzfSZeoWqcZvMZDJkfML8py
 sx1MyC0O90Gb0+TlB1LszRZXhHaAqTrieJDLnTwS+loggjOrUnxovEvVEEyWnN9vzsLaOOhfTff
 xVaFsXkGnvD1OrnAc5aMeCjZDLh5JH6pCxrHh5uEfAxmE3ZdnKDWD9zcHqodZFtMAYHIspXEZQ1
 9Sfd610i4MJSXPgWnkfsNTHecySINzKzN80XakS1yMkNy5CVJ+LvynxLZgRFJsTQtfTzU7JnnFX
 DuyWqxgr39BAcelRHeQ==
X-Authority-Analysis: v=2.4 cv=Iqsutr/g c=1 sm=1 tr=0 ts=6a95624a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=1TzI99NNmMpykW__4ucA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: mif5ZEJkm5RhBcUgH7-prTA2TlazBlL1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310096

On 8/31/26 11:43 AM, Kuldeep Singh wrote:
> Add a TPM chip driver for platforms where a TPM 2.0 instance is
> implemented by a Trusted Application (TA) running in Qualcomm's Trusted
> Execution Environment (QTEE), reachable over the QCOMTEE object-IPC
> transport.

[...]

> +static int tpm_qcom_get_client_env_obj(struct tee_context *ctx,
> +				       struct tee_param_objref *client_env_obj)
> +{
> +	int ret;
> +	struct tee_ioctl_object_invoke_arg inv_arg;
> +	struct tee_param param[2];

nit: Reverse-Christmas-tree would be preferred

> +
> +	memset(&inv_arg, 0, sizeof(inv_arg));
> +	memset(&param, 0, sizeof(param));

You can zero-initialize local struct variables like this:

struct foo bar = { };

[...]

> +static int tpm_qcom_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
> +			 size_t cmd_len)
> +{
> +	struct tpm_qcom_private *pvt_data = dev_get_drvdata(chip->dev.parent);
> +	size_t rsp_len = PAGE_ALIGN(MAX_RESPONSE_SIZE);
> +	size_t copy_len;
> +	int ret;
> +
> +	if (cmd_len > MAX_COMMAND_SIZE) {
> +		dev_err(&chip->dev,
> +			"%s: len=%zd exceeds MAX_COMMAND_SIZE\n",
> +			__func__, cmd_len);

The name of the function isn't helpful here, this is the only time this
message appears, so it's easy to grep

[...]


> +	err = tpm_chip_register(pvt_data->chip);
> +	if (err) {
> +		dev_err(dev, "%s: tpm_chip_register failed with rc=%d\n",
> +			__func__, err);

Likewise

[...]

> +#define QCOMTEE_TPM_GET_TA_VERSION_ID		0x0001000
> +#define QCOMTEE_TPM_TA_VERSION_GET_MAJOR(ver)	((u32)(ver) >> 16)
> +#define QCOMTEE_TPM_TA_VERSION_GET_MINOR(ver)	((u32)(ver) & 0x0000ffffU)

That's FIELD_GET(mask, x)

Konrad
