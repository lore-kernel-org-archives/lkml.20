Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792984537;
	b=WPifguACXpyvMg6+hYfkmCrPhvQqwmFFhl6lyeMKf1xucPpghMjJplGKO/LHXOn2YeOS
	 LrQQ7OVAJukXvOMhxCIOwjbu6iO/goUmux37NGwZzqABaufK1ozFsvZj78aQYP1//k1px
	 AWCT9Qok/FoYRH2MdVDjoT4grGu73KZECdbCaFZ6IwTKwZtbBKlLbFnZC8/ZH2VJArf2B
	 AE5qlmrWFVXJ9y71oFD+T4dxOPu7JPEuXvc951llBvAuqYMyrCI09Ce7UPkFfLTjZgixf
	 CujxLAVr8UH6oR1DuSK83lMS5bEkORwh5aoaEtisueA1bQ07aSPXE2SvolWiYy8VNAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792984537;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zL+HOVtTShiOnA5Z9yjUoWL/r26J7UkWfw3YA85MUM4=;
	b=ddIgInT3ZlWDrpS3+3OCTK0nE3mm7bSEXVWLJPnlLkl4eZ2QAY1FKxm6oC09C3QXtfwF
	 9x+pdptVLnWjeBzx7w6x5P0n+XiUm024rwllugqbH/LNqTfj8qAAU6ldFeYM7AUNSNRnL
	 coQFeTXIyNLz6uaX1CXut56jQ/Ei/QMeX87+miN2ZJ5exrOMV4hEoNi+Pu+HEcF4jiv4q
	 UEzJ5l72WkF/YQuz47qjqzrSN+uQqpa5Sfgp2rgi7fKfHbCV1XvkOwnl6hWGfe1KV9MbR
	 t8rWR7XHgmLLJS5vz2Ov2l9QhMVgsXdM+EZDSQyqy9fwDjpAAlozqM3MGKC2Hpya7qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oP2bypCd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ikFPqiab;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A20606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92A20606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oP2bypCd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ikFPqiab
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q2KmMA1620318
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zL+HOVtTShiOnA5Z9yjUoWL/r26J7UkWfw3YA85MUM4=; b=oP2bypCdgol5qbs2
	Pn99cR5yhRkfLXEFPRsSqAKL9FslBbFCXY3Ce8qw6XV7Qmy16we60zdfAnGDs6N4
	8MwEawhfPs11Azut97fSpHyyQQuwQf80ZkYs8rOct2RcbKqsQ1cgMl2cdvpcZ3zV
	qLix9NpdRU3ilJbd0vqwi4oz2icmCJORfJg8J+5BngXeBjR0pCamHJ1QeEIFtUNu
	mLWEqnyLc7r0+3mCqfqDCl6aSTeo2OoBwI/VMiR88uQpSbbDCNHf/Bzaj4w3cqUL
	i4UJ2WmMjvwCZhuh+EeOGf2zBjebPx6Bz1XUnhQNI3tDeRzP9m8t0YnU6z/vCXM2
	0a1SiA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm0gmmup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:15:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e954d87b48so40487405ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792984534; x=1793589334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zL+HOVtTShiOnA5Z9yjUoWL/r26J7UkWfw3YA85MUM4=;
        b=ikFPqiabMKpjiWbKP4TGZtXj6YrEwvJ5mf3sXBSn74Dqyyp+HbJby2tIbT9PkAkfnG
         8TBB3vT/B+HDGm8EjZHMIFhxLL5TleX+koCXwcy/aq2VUUebRuyFPVf48UERAqOLPjqu
         2hPthADPoVCJog2iIRJrv12aPSdxzrkePtNBEnpm6jIu01ZmDCrEvmITVmOnAgt15S9w
         U7kNXzRgUF6oMr7DoBctkoA0k6dMRJBogM9y2V9Q+mT0vKpdhvJ7dlZ/JASPNmyzdrh8
         JfaQwmGq4EuOnPfJ8+wXDP/7ZjAfXyXulRUb3YCj/1+xoIWxhkggZkcIHVautwJgQ76a
         O3Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792984534; x=1793589334;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zL+HOVtTShiOnA5Z9yjUoWL/r26J7UkWfw3YA85MUM4=;
        b=f/sq7Fiot+mR8Z980Rk56jrueMJgYBQLzTTDiaa0gxdzBzwd8Q6D86BSYZBnBukPMv
         975aOdt2bw6YaDuysJslHTMWuK8olzXnYsJzliOgxHg7+dadDRnUpKoUu8RJbSsh2Uk6
         cQ+6OnYOW16ht+M2FYWMOFnEN6DIZNqb6JTd8g0dIJQHtDFhHNDKmd3zjcT8K++eiz9/
         Ijqk44lWRqWYsfArqM3tuYEG/VyvmGE/bKJWdRK7X1rQGihvQCYCvCQ6bYAwRQd4BpwO
         r0IexxYsxTyHCjKDfHPecKW+NF0/KvIjMVPiVdNTZtVUuRMkyCpYcW1jMZ6nSFfrdQ6K
         oqIA==
X-Forwarded-Encrypted: i=1; AKwUvBzn7RdVm3XuBBDo3JtZkwuUzfRDfQTYN6Pc5hYxhSdWHGBIjCe/o90qVrcFQDD+jfOoQOE3mev6E9WhcAU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsdQDncI46l6gKSpvUJoAIxIOJNO47Hal1e+hjimE4/FL6waCi
	OHWVcYiQxJd2Cgg2IG3Eda+3nT0ohfO2yGuQWLZFjbBcp3vdgS9zaUWzmOaOB+J17m4hirsslAO
	EwR7OULVEdtruzi8Spd1w2H4vj5Fr1mQ85eQKKjLoDXeWfG8JJprb0qgUXVX/ceeZgg==
X-Gm-Gg: AYBFou1rbf6LAS1xD1PbqITdYh3czQZlr5chzZFZQ0oVa92pmU39dbzb0/eOeHOpNkF
	MkecaV6PGvj8hCpr+m67ZUOLD862m3fFFArACIQHcn0i1/KgYF/QAzTZbfdGEc45usHklj1Y1m4
	M6IYtd3WNjWH6221CoqxS0yB0rI6J11Ra/w/x610A3pT5cYaGFcLbgxA8kx1NlTGfshYjCb84Ga
	ML/RRIULC1GRoJeDF7wpSQsEH32cCosoCps2UV40I5Zh0Sv1XzB252R+Xlv6SK8JANu386Gm7PK
	EHcwvYRzI6Y97argU/WctPhf1lArb/l/hWOib3wn1LcTtok273f1/OwSwpf44cITTodlGyrODtu
	AYI8F0TR1yLzPjfSZ4yRzKPHKtIOu63ko
X-Received: by 2002:a17:903:244b:b0:2e9:7719:40f0 with SMTP id d9443c01a7336-2ea9c6205fcmr48433885ad.19.1792984534182;
        Sun, 25 Oct 2026 20:15:34 -0700 (PDT)
X-Received: by 2002:a17:903:244b:b0:2e9:7719:40f0 with SMTP id d9443c01a7336-2ea9c6205fcmr48433635ad.19.1792984533645;
        Sun, 25 Oct 2026 20:15:33 -0700 (PDT)
Received: from [192.168.1.86] ([206.83.119.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b120095sm10620575ad.16.2026.10.25.20.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 20:15:33 -0700 (PDT)
Message-ID: <952816ce-3e37-4628-8308-4208b4359549@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 14:15:26 +1100
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
Subject: Re: [PATCH v5 3/7] tee: qcomtee: Allow object invokes from kernel
 clients
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
References: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-0-1460691b35d3@oss.qualcomm.com>
 <20261015-qcom_uefisecapp_migrate_qcomtee-v5-3-1460691b35d3@oss.qualcomm.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-3-1460691b35d3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1g4y4m9pqneUQdX8bp4IFxzJ9Q2eS-m0
X-Authority-Analysis: v=2.4 cv=UfTE26SN c=1 sm=1 tr=0 ts=6adec5d7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=pnHLkUe0LhHGSDu6DPowAg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=bMymjuXEMpCr_xxdz14A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 1g4y4m9pqneUQdX8bp4IFxzJ9Q2eS-m0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAxMiBTYWx0ZWRfX9JlsjNKNaXAv
 GBnt5vhxy5gtu+ST4fgVC6SEcIKbyd9VYkOBt5OW5VUGSr7wUmnw8IqVaav7+UbHNBX3+VRWhGX
 38s7W+WETAjy/VGol1krdkeibomxZ/ORTO+inUPootFU2NJJZFYPdwQki1h5ALfNc0R8sLyzwTa
 5F3KRD4HB6YSaRwB41M7bkt3BcckP96l9MR9l1+RuzimbZKGrMJAoEESVcjeopN2e9euETfYi3f
 w9WQbYRurnVB+qe/u6vYk0/2dH2ZNIf3Kn1wSq+s2w1yG2vpAYFCwX05mh6QFxzq27/4aE/tSPN
 AHzyh5YPzUaaYKNAnv11HKaNce+zrlB+cehoLauHxqwfqHRTuW1mXkF0+Hb6a+/c8sF8ou6mB4P
 fKdHi76u0TI+52JbOQ17xqWuayGlsVJVohKvHQmCxq1gkngeGvjeXnoC4WBJHqUdcrYsNVJ6H5M
 UPtK/owsBUOZn6FlWxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAxMiBTYWx0ZWRfX9iP4ecHMcVAS
 WrzrHgZ6Zqk47AvYhtr1OGHobsNLWSF5eZ99eO0dDZxpW2TOB4Q27xRRNCCa1k1v7qkvK5rZ9Nz
 5dA2RDD2ZfgHO6ueCpawrZDzgmt4aOs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260012

Hi Harshal,

On 10/15/2026 10:39 PM, Harshal Dev wrote:
> From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> 
> QCOMTEE currently treats UBUF parameters as userspace addresses and
> applies userspace restrictions when invoking the root object. This is
> not suitable for object invocation requests issued by kernel clients.
> 
> Use the kernel_ctx flag to distinguish kernel client requests from
> userspace requests. For kernel contexts, do not mark UBUF parameters as
> user addresses, and allow permitted root-object operations to proceed
> without applying the userspace-only checks.
> 
> This allows in-kernel users of tee_client_object_invoke_func() to issue
> object invocation requests through the qcomtee backend.
> 
> Co-developed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

Same here.

- Amir

> ---
>  drivers/tee/qcomtee/call.c           | 38 ++++++++++++++++++++++++------------
>  drivers/tee/qcomtee/qcomtee_object.h |  5 +++--
>  include/linux/tee_drv.h              |  5 ++++-
>  3 files changed, 32 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
> index 3de54af45719..c97afaa1b4aa 100644
> --- a/drivers/tee/qcomtee/call.c
> +++ b/drivers/tee/qcomtee/call.c
> @@ -193,7 +193,7 @@ int qcomtee_objref_from_arg(struct tee_param *param, struct qcomtee_arg *arg,
>   * @u: QTEE arguments.
>   * @params: TEE parameters.
>   * @num_params: number of elements in the parameter array.
> - * @ctx: context in which the conversion should happen.
> + * @oic: context to use for the current invocation.
>   *
>   * It assumes @u has at least @num_params + 1 entries and has been initialized
>   * with %QCOMTEE_ARG_TYPE_INV as &struct qcomtee_arg.type.
> @@ -202,7 +202,7 @@ int qcomtee_objref_from_arg(struct tee_param *param, struct qcomtee_arg *arg,
>   */
>  static int qcomtee_params_to_args(struct qcomtee_arg *u,
>  				  struct tee_param *params, int num_params,
> -				  struct tee_context *ctx)
> +				  struct qcomtee_object_invoke_ctx *oic)
>  {
>  	int i;
>  
> @@ -210,8 +210,14 @@ static int qcomtee_params_to_args(struct qcomtee_arg *u,
>  		switch (params[i].attr) {
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
> -			u[i].flags = QCOMTEE_ARG_FLAGS_UADDR;
> -			u[i].b.uaddr = params[i].u.ubuf.uaddr;
> +			if (oic->kernel_ctx) {
> +				u[i].flags = 0;
> +				u[i].b.addr = params[i].u.ubuf.addr;
> +			} else {
> +				u[i].flags = QCOMTEE_ARG_FLAGS_UADDR;
> +				u[i].b.uaddr = params[i].u.ubuf.uaddr;
> +			}
> +
>  			u[i].b.size = params[i].u.ubuf.size;
>  
>  			if (params[i].attr ==
> @@ -223,7 +229,7 @@ static int qcomtee_params_to_args(struct qcomtee_arg *u,
>  			break;
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT:
>  			u[i].type = QCOMTEE_ARG_TYPE_IO;
> -			if (qcomtee_objref_to_arg(&u[i], &params[i], ctx))
> +			if (qcomtee_objref_to_arg(&u[i], &params[i], oic->ctx))
>  				goto out_failed;
>  
>  			break;
> @@ -260,7 +266,7 @@ static int qcomtee_params_to_args(struct qcomtee_arg *u,
>   * @params: TEE parameters.
>   * @u: QTEE arguments.
>   * @num_params: number of elements in the parameter array.
> - * @ctx: context in which the conversion should happen.
> + * @oic: context to use for the current invocation.
>   *
>   * @u should have already been initialized by qcomtee_params_to_args().
>   * This also represents the end of a QTEE invocation that started with
> @@ -270,7 +276,7 @@ static int qcomtee_params_to_args(struct qcomtee_arg *u,
>   */
>  static int qcomtee_params_from_args(struct tee_param *params,
>  				    struct qcomtee_arg *u, int num_params,
> -				    struct tee_context *ctx)
> +				    struct qcomtee_object_invoke_ctx *oic)
>  {
>  	int i, np;
>  
> @@ -288,7 +294,8 @@ static int qcomtee_params_from_args(struct tee_param *params,
>  			break;
>  		case QCOMTEE_ARG_TYPE_OO:
>  			/* TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT */
> -			if (qcomtee_objref_from_arg(&params[np], &u[np], ctx))
> +			if (qcomtee_objref_from_arg(&params[np], &u[np],
> +						    oic->ctx))
>  				goto out_failed;
>  
>  			break;
> @@ -304,7 +311,7 @@ static int qcomtee_params_from_args(struct tee_param *params,
>  	/* Undo qcomtee_objref_from_arg(). */
>  	for (i = 0; i < np; i++) {
>  		if (params[i].attr == TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT)
> -			qcomtee_context_del_qtee_object(&params[i], ctx);
> +			qcomtee_context_del_qtee_object(&params[i], oic->ctx);
>  	}
>  
>  	/* Release any IO and OO objects not processed. */
> @@ -357,7 +364,8 @@ static int qcomtee_params_check(struct tee_param *params, int num_params)
>  }
>  
>  /* Check if an operation on ROOT_QCOMTEE_OBJECT from userspace is permitted. */
> -static int qcomtee_root_object_check(u32 op, struct tee_param *params,
> +static int qcomtee_root_object_check(struct qcomtee_object_invoke_ctx *oic,
> +				     u32 op, struct tee_param *params,
>  				     int num_params)
>  {
>  	/* Some privileged operations recognized by QTEE. */
> @@ -366,6 +374,9 @@ static int qcomtee_root_object_check(u32 op, struct tee_param *params,
>  	    op == QCOMTEE_ROOT_OP_ADCI_SHUTDOWN)
>  		return -EINVAL;
>  
> +	if (oic->kernel_ctx)
> +		return 0;
> +
>  	/*
>  	 * QCOMTEE_ROOT_OP_REG_WITH_CREDENTIALS is to register with QTEE
>  	 * by passing a credential object as input OBJREF. TEE_OBJREF_NULL as a
> @@ -430,7 +441,8 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
>  	/* Get an object to invoke. */
>  	if (arg->id == TEE_OBJREF_NULL) {
>  		/* Use ROOT if TEE_OBJREF_NULL is invoked. */
> -		if (qcomtee_root_object_check(arg->op, params, arg->num_params))
> +		if (qcomtee_root_object_check(oic, arg->op, params,
> +					      arg->num_params))
>  			return -EINVAL;
>  
>  		object = ROOT_QCOMTEE_OBJECT;
> @@ -438,7 +450,7 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
>  		return -EINVAL;
>  	}
>  
> -	ret = qcomtee_params_to_args(u, params, arg->num_params, ctx);
> +	ret = qcomtee_params_to_args(u, params, arg->num_params, oic);
>  	if (ret)
>  		goto out;
>  
> @@ -456,7 +468,7 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
>  
>  	if (!result) {
>  		/* Assume service is UNAVAIL if unable to process the result. */
> -		if (qcomtee_params_from_args(params, u, arg->num_params, ctx))
> +		if (qcomtee_params_from_args(params, u, arg->num_params, oic))
>  			result = QCOMTEE_MSG_ERROR_UNAVAIL;
>  	} else {
>  		/*
> diff --git a/drivers/tee/qcomtee/qcomtee_object.h b/drivers/tee/qcomtee/qcomtee_object.h
> index 5f40617361fc..a241ab657318 100644
> --- a/drivers/tee/qcomtee/qcomtee_object.h
> +++ b/drivers/tee/qcomtee/qcomtee_object.h
> @@ -113,8 +113,9 @@ struct qcomtee_buffer {
>   * @b: address and size if the type of argument is a buffer.
>   * @o: object instance if the type of argument is an object.
>   *
> - * &qcomtee_arg.flags only accepts %QCOMTEE_ARG_FLAGS_UADDR for now, which
> - * states that &qcomtee_arg.b contains a userspace address in uaddr.
> + * If %QCOMTEE_ARG_FLAGS_UADDR is set in &qcomtee_arg.flags then it implies
> + * that &qcomtee_arg.b contains a userspace address in uaddr.
> + * Otherwise, &qcomtee_arg.b contains a kernel address in addr.
>   */
>  struct qcomtee_arg {
>  	enum qcomtee_arg_type type;
> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> index 369c87ad0205..367208210a32 100644
> --- a/include/linux/tee_drv.h
> +++ b/include/linux/tee_drv.h
> @@ -83,7 +83,10 @@ struct tee_param_memref {
>  };
>  
>  struct tee_param_ubuf {
> -	void __user *uaddr;
> +	union {
> +		void *addr;
> +		void __user *uaddr;
> +	};
>  	size_t size;
>  };
>  
> 

