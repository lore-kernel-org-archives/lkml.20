Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2E0353A8F
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797771; cv=none; b=qJDoTuhDCFs+vfoIJ+NAyza1i0AVmEJQwN7E88X4E8G56ZACSr50pELuzAhl9Ni9m8akJ+9TvVysIZNzBcY+Iy2Gj+93QAsUC1obIurYU983rj4GUoyx243berUQQ1is1YDslfLBcoIs1TGcgmcgIWuytCqub8+yfN5LLRSVnUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797771; c=relaxed/simple;
	bh=Cd1sz5HqVwywuKmbSEi2GjApynlrMw3/S4hBxggZCtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QwzZEjXhWgRCugGLloLmWQT31q5+oUORT0cOZTY3Rh+tS6NP70uW7pXZnYrZE1PfXi8M6NplOcLoUsWbliLeNNCHylHGyFSlEhWSDgRmKw50iFm5/8ByxNlu39ZUVok0FMv8zyODQcKUtmMzpfGltEBMQdfQy6pvkkOQ4fojac0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SUoBJNe0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RRTuwbtf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SUoBJNe0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RRTuwbtf"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8L8pQ2296412
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:36:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vFI6tpwU01Vx9Ur1mcn8qmOufatJQe19bsiv/JBf6+I=; b=SUoBJNe0eJ8QLDwM
	XVWcB7cO5XkHjsV0YxCtcZpg1Ex9AhGqVqkWaA/gC1XSQlof4xfLYmreJVV0KMzm
	vINpEem1O/EBoCtHU1V5faS+EtIg5Dr53hHTl++L5m3N5YU7/hQ9T08HF/mNpg/d
	ECwQ8WgGr9Qnhbn98hWjTwkPrTDqJqg5Zaa6FtTj4PLiggDJNp4ATCwpHXKeyYKF
	OO3Tos2CYiDLInEd093sYJSBiplCag5/JOz1U/TfeEOdX9dWGF1m2RCtSqE3akmq
	O1iwqs6CL5N9IftG/O31Savzt3RGdme2Wg9f2VWAEHhDZJUOdnpIua5su1blkr6F
	87apPw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cxxp1ds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:36:08 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-88a10162189so2697995b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791797767; x=1792402567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vFI6tpwU01Vx9Ur1mcn8qmOufatJQe19bsiv/JBf6+I=;
        b=RRTuwbtfeH+9RNoqgKoG4E/ueZW/0qeWM1FUdPwTlVcBgCNPZdcmoVUT4kY20XVOlV
         Om67wnNGNDlEqbXj67grflZtKABC04XaYYazExVb6dy647tfcczCPvVJPbenqnVfJpqY
         I+2VON6VLy8NNy93YDJPcxvxjh6uEJOnBDpZr3YhO1+w6L9JJBHvaaaGMllDjP0Lkf5N
         QA9lqYQ11JK9aiKbGtjjKtynEPpU5IUcBzmT3/LTSLxiYfPo/wES84FAlGpzxA7ZFW28
         JE6ndob4PiRwn0ImxJzzq1xoZMehEZ50+IMMMUSwD5KjuOe14O5ZTKmM0Pem9WTb06Fj
         zRwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797767; x=1792402567;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vFI6tpwU01Vx9Ur1mcn8qmOufatJQe19bsiv/JBf6+I=;
        b=sbumPyULzO7FVr6Sr2cejslXKQgCuK9SUOcrtm4hgzWqxEWTwX+zrNjIwxigLkJcv4
         vQop/MscPMRGl4UWj/J6KC64PjwQooPtrqHqtx2HvQzcHdevMzNhCmOty/AXX3d42m+y
         4DMnAwcvyv0FX352+Pv0ViQ2AutM+bH0Rk4JvNTeFEz3LccsZC7wWmzKHrOCvBdmt7nA
         d29MpbXXtxTtexeE2nXGlTqcm1Zbc6ulSBtPNzaOmwqkZmkq8PU7JRllZGZVPQpZpjdY
         jWwfzSmbaBzMUjMLvFTtndx522snUNf838+uqzLs4vLlfdhL+ttmdgrfN+8amaTFBAbV
         H+UA==
X-Forwarded-Encrypted: i=1; AKwUvBzwgB1Yk+k9U1FKwBwT6aIM7CVRJyNxGz5Vu1wXBAeGEP2JFPdYkrHmUcKCllN/1FR/oUFsuX6ULL5tpJM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrRlr3cxPN2L8daL6DoWhK00Acmdp+J5R1YanYWGXobmh0uAA8
	2vCOjwGAByGF2RMdQhMGcZB5kBZ74wxQZyCmK5ePV08XIuXDLfx422bhOqPqnzSv9hzSX9plCSO
	NnydkRXce6xSvrmEAQEB7flQ2iUeLtyNztoBYqO4D3m4N6AgrS3o+1o4ma7lfSa712Hc=
X-Gm-Gg: AYBFou2GrqUfNKQ8XyNDSTv0L5taj3mFtsMMmYNpVaM+6Yx0HAE2JUFN2+8VJKGcGAQ
	AVOmJ/4YOguniwnPeyw/ZndQy260igRLRCUXLumhOLp7CM+IA3MpuY2admEPsTCTVEJPELbCzd2
	RJEH6racuJMsS4b5kvzVuMFbd2eSvMvqTRUBqqT/y5KkeYX1OnUIBSmxVJ1+HtCc5fLR4l5+Mxa
	wJ0/6VoQE+ZlRrGaLGjzA9Iy1pgByIa5e1IkSMa8C4Wj5U2/78m83h+hvZYdRJluYDZ3at82uGB
	AWxf5gwxCRLFN315wHOIXVrVheo9g11MHugTiFnz5J+/9wXeB0wiTDH1pHteOgNaYKSJM4Yk/ky
	0AfO023IkGSOgKfvZNftV69Z3K9DAlg==
X-Received: by 2002:a05:6a21:610e:b0:3dd:a00a:1715 with SMTP id adf61e73a8af0-3e16bebe9c7mr7324455637.48.1791797767420;
        Mon, 12 Oct 2026 02:36:07 -0700 (PDT)
X-Received: by 2002:a05:6a21:610e:b0:3dd:a00a:1715 with SMTP id adf61e73a8af0-3e16bebe9c7mr7324422637.48.1791797766811;
        Mon, 12 Oct 2026 02:36:06 -0700 (PDT)
Received: from [192.168.29.10] ([49.37.155.134])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9d4fc36sm4014405a12.1.2026.10.12.02.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 02:36:06 -0700 (PDT)
Message-ID: <1854d39a-9ef9-4b04-8b5b-3384b8403375@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 15:06:00 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] firmware: qcom: Add support for TEE based EFI-var
 client driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski
 <krzk@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-0-bf1c8e2a64ab@oss.qualcomm.com>
 <20261006-qcom_uefisecapp_migrate_qcomtee-v4-6-bf1c8e2a64ab@oss.qualcomm.com>
 <r7gtspju4cp5iwelv4zs4xoh4d7ambeceptmjtqaf5hcjzmc5n@4msc3ap4yfhz>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <r7gtspju4cp5iwelv4zs4xoh4d7ambeceptmjtqaf5hcjzmc5n@4msc3ap4yfhz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QoB8PJ6T3BPjikPph8VY92kzg_sxWxPn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzOCBTYWx0ZWRfX8hSB0yrIiIeY
 ONAdn5SYZ81OuW+HdUBliyeDLdNPdB5W+4N7UX4uTgG+I/tzFTc9PCBQRG49PeGfYkGAlMBcYok
 oR7Pw+nsRg4muyKRH6joKEJ25IDgf0k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzOCBTYWx0ZWRfX6/haKPuPzK2B
 sfrgWj1BDdFtOWgFrIRJz0hnkjs5OpSLcFKP49awXCMaaqjC07EhQva9lY/528G1NADUC8ZMEiK
 HE4LNJ43OqL8OCFW7eoA9yOsjdlAI31OjNF1/Fal9icFldp4oaPg0MtUBK8L1JwVrjvlHqc3a+Q
 e87QYOCCpeZlpVxALjF1gz3oxJukOHmPDo0A3Yoyl1I3ftVuj2NhRnCpk6SfBfvcgYToNF97qgW
 UjBfieFZWlLaTiWCKgAoxlpbOBP2aDASD9tmip0EN2mrLRDmXHiFHKyJ2ZktgQfJ/r4ToZwCllm
 o03qay2N9e3WCoPpseHwRiY94r34bI0oR3QM0GjoU7QhvzpzJmKO/FhgsoDoW9g+3pP/4cP+hsw
 PFniJl+fTZJMpRfKUad8fs5mmud7INJixUCmF47ezb0xvpbH3x01tvyjYmXvD8+5LhCsVnTQUWT
 H1BBycGa8GbGRCsxDIg==
X-Authority-Analysis: v=2.4 cv=AsJ7T+9P c=1 sm=1 tr=0 ts=6accaa08 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ivpbP8R7Mhpy7qfOLL/Q+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=P-IC7800AAAA:8 a=VwQbUJbxAAAA:8 a=sfOm8-O8AAAA:8 a=LDF6XqZlvw75vdSADQcA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: QoB8PJ6T3BPjikPph8VY92kzg_sxWxPn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120038

Hi Dmitry,

On 06-10-2026 07:18 pm, Dmitry Baryshkov wrote:
> On Tue, Oct 06, 2026 at 05:03:27PM +0530, Harshal Dev wrote:
>> On Qualcomm SoC based platforms, UEFI stores EFI variables within the
>> Replay Protected Memory Block (RPMB) located within either the UFS,
>> eMMC or SPI-NOR storage. The RPMB key which is one-time programmed into
>> the storage controller to allow authentication of the RPMB frames is
>> generated by and only available to the Qualcomm Trusted Execution
>> Environment (QTEE).
>>
>> The legacy QSEECOM protocol used for communicating with the QTEE is
>> deprecated and replaced with the use-case agnostic SMCInvoke protocol
>> starting with the Qualcomm SM8x50 series. On platforms where the QSEECOM
>> driver still probes, it does not support a listener interface with QTEE
>> to enable writing of non-volatile EFI variables to the RPMB for UFS and
>> eMMC storage.
>> Therefore on such platforms, a TEE client driver which communicates with
>> QTEE via the SMCInvoke protocol implemented by the QCOMTEE driver (and
>> registered with the TEE subsystem) must be used to update such EFI
>> variables.
>>
>> Add support for a TEE based uefisecapp client driver which installs efivar
>> operations after obtaining an object reference to the uefisecapp service.
>> This enables the kernel/user-space to access or modify both volatile EFI
>> variables stored by the Secure Application (in-memory) and non-volatile
>> ones stored within RPMB.
>>
>> +
>> +static efi_status_t qcomtee_uefi_query_variable_info(u32 attr, u64 *storage_space,
>> +						     u64 *remaining_space,
>> +						     u64 *max_variable_size)
>> +{
>> +	int ret;
>> +	u32 out_errno;
>> +	u64 maximum_variable_storage_size;
>> +	u64 remaining_variable_storage_size;
>> +	u64 maximum_variable_size;
>> +
>> +	if (!storage_space || !remaining_space || !max_variable_size)
>> +		return EFI_INVALID_PARAMETER;
>> +
>> +	ret = qcuefi_query_variable_info(attr,
>> +					 &maximum_variable_storage_size,
>> +					 &remaining_variable_storage_size,
>> +					 &maximum_variable_size,
>> +					 &out_errno);
>> +
>> +	if (ret)
>> +		return EFI_DEVICE_ERROR;
>> +
>> +	if (!out_errno) {
>> +		*storage_space = maximum_variable_storage_size;
>> +		*remaining_space = remaining_variable_storage_size;
>> +		*max_variable_size = maximum_variable_size;
> 
> Why do we need to copy data? Can we pass pointers directly to the
> qcuefi_foo calls?
>

Ack, this function can have this optimization, no need for copying.
 
>> +	}
>> +
>> +	return uefisecapp_err_to_efi_status(out_errno);
>> +}
>> +
>> +/**
>> + * qcomtee_release_object() - Release an object returned by QTEE.
>> + *
>> + * Each object returned by QTEE repesents a secure service exposed to the
>> + * client. Whenever an secure service is opened, QTEE may allocate resources
>> + * on the client's behalf. Therefore, once the client is done accessing the
>> + * secure service, the object representing it should be explicitly released
>> + * so that QTEE can release the associated resources as well.
>> + *
>> + * @ctx: TEE context.
>> + * @object: The object to release.
>> + */
>> +static void qcomtee_release_object(struct tee_context *ctx,
>> +				   struct tee_param_objref object)
>> +{
>> +	struct tee_ioctl_object_invoke_arg inv_arg;
>> +
>> +	memset(&inv_arg, 0, sizeof(inv_arg));
>> +	SET_INVOKE_ARG(inv_arg, object.id, QCOMTEE_MSG_OBJECT_OP_RELEASE, 0);
>> +	tee_client_object_invoke_func(ctx, &inv_arg, NULL);
>> +}
>> +
>> +/**
>> + * qcomtee_get_uefisec_svc_obj() - Get a UEFI Secure App service object to
>> + * begin communication with the service.
>> + * @ctx: TEE context.
>> + * @client_env_obj: The client environment object returned earlier by QTEE.
>> + * @uefisec_svc_obj: The UEFI Secure App service object.
>> + *
>> + * Returns 0 on success.
>> + * Returns < 0 if client environment object invocation failed.
>> + * Returns > 0 if client environment invocation was success but UEFI Secure App
>> + * service object could not be returned for some other reason (represented by the
>> + * returned value)
>> + */
>> +static int qcomtee_get_uefisec_svc_obj(struct tee_context *ctx,
>> +				       struct tee_param_objref client_env_obj,
>> +				       struct tee_param_objref *uefisec_svc_obj)
>> +{
>> +	int ret;
>> +	struct tee_ioctl_object_invoke_arg inv_arg;
>> +	u64 obj_id = client_env_obj.id;
>> +	struct tee_param param[QCOMTEE_GET_UEFI_SVC_NPARAMS];
>> +	u32 uefisec_uid = QCOMTEE_UEFI_SEC_UID;
>> +
>> +	memset(&inv_arg, 0, sizeof(inv_arg));
>> +	memset(&param, 0, sizeof(param));
>> +
>> +	SET_INVOKE_ARG(inv_arg, obj_id,
>> +		       QCOMTEE_OP_CLIENT_ENV_OPEN,
>> +		       QCOMTEE_GET_UEFI_SVC_NPARAMS);
>> +	SET_TEE_PARAM_UBUF(param[0], UBUF_INPUT, TEE_PARAM_UBUF(uefisec_uid));
>> +	SET_TEE_PARAM_OBJREF(param[1], OBJREF_OUTPUT, 0, 0);
>> +
>> +	ret = tee_client_object_invoke_func(ctx, &inv_arg, param);
>> +	if (ret < 0 || inv_arg.ret != 0) {
>> +		dev_err(uefisec_app.dev, "QCOMTEE_CLIENT_ENV_OPEN invoke ret: %d, err: 0x%x\n",
>> +			ret, inv_arg.ret);
>> +		return ret ?: inv_arg.ret;
>> +	}
>> +
>> +	*uefisec_svc_obj = param[1].u.objref;
>> +	return ret;
>> +}
>> +
>> +/**
>> + * qcomtee_get_client_env_obj() - Get a client environment object to begin
>> + * object exchange with QTEE.
>> + * @ctx: TEE context.
>> + * @client_env_obj: The client environment object returned by QTEE.
>> + *
>> + * Returns 0 on success.
>> + * Returns < 0 if root object invocation failed.
>> + * Returns > 0 if root object invocation was success but client environment
>> + * object could not be returned for some other reason (represented by the
>> + * returned value)
>> + */
>> +static int qcomtee_get_client_env_obj(struct tee_context *ctx,
>> +				      struct tee_param_objref *client_env_obj)
>> +{
>> +	int ret;
>> +	struct tee_ioctl_object_invoke_arg inv_arg;
>> +	struct tee_param param[QCOMTEE_GET_CLIENT_ENV_NPARAMS];
>> +
>> +	memset(&inv_arg, 0, sizeof(inv_arg));
>> +	memset(&param, 0, sizeof(param));
>> +
>> +	SET_INVOKE_ARG(inv_arg, TEE_OBJREF_NULL,
>> +		       QCOMTEE_ROOT_OP_REG_WITH_CREDENTIALS,
>> +		       QCOMTEE_GET_CLIENT_ENV_NPARAMS);
>> +	SET_TEE_PARAM_OBJREF(param[0], OBJREF_INPUT, TEE_OBJREF_NULL, 0);
>> +	SET_TEE_PARAM_OBJREF(param[1], OBJREF_OUTPUT, 0, 0);
>> +
>> +	ret = tee_client_object_invoke_func(ctx, &inv_arg, param);
>> +	if (ret < 0 || inv_arg.ret != 0) {
>> +		dev_err(uefisec_app.dev, "QCOMTEE_ROOT_OP_REG_WITH_CREDENTIALS invoke ret: %d, err: 0x%x\n",
>> +			ret, inv_arg.ret);
>> +		return ret ?: inv_arg.ret;
>> +	}
>> +
>> +	*client_env_obj = param[1].u.objref;
>> +	return ret;
>> +}
>> +
>> +static const struct efivar_operations qcom_efivar_ops = {
>> +	.get_variable = qcomtee_uefi_get_variable,
>> +	.set_variable = qcomtee_uefi_set_variable,
>> +	.get_next_variable = qcomtee_uefi_get_next_variable,
>> +	.query_variable_info = qcomtee_uefi_query_variable_info,
>> +};
>> +
>> +static int qcomtee_ctx_match(struct tee_ioctl_version_data *ver,
>> +			     const void *data)
>> +{
>> +	return (ver->impl_id == TEE_IMPL_ID_QTEE);
>> +}
>> +
>> +static int qcomtee_uefisecapp_probe(struct tee_client_device *tee_dev)
>> +{
>> +	int ret, err;
>> +	struct tee_param_objref client_env_obj;
>> +	struct tee_param_objref uefisec_svc_obj;
>> +
>> +	uefisec_app.dev = &tee_dev->dev;
>> +	/* Open context with QCOMTEE driver */
>> +	uefisec_app.ctx = tee_client_open_context(NULL, qcomtee_ctx_match, NULL,
>> +						  NULL);
>> +	if (IS_ERR(uefisec_app.ctx))
>> +		return -ENODEV;
>> +
>> +	/* Obtain a reference to client_env object to begin object exchange
>> +	 * with QTEE
> 
> Nit: check out the preferred block comment format. also, I think these
> comments echo the code which pretty obvious here.
>

Ack, I'll just drop this comment. And update the other ones to the preferred
block comment format.

>> +	 */
>> +	ret = qcomtee_get_client_env_obj(uefisec_app.ctx, &client_env_obj);
>> +	if (ret) {
>> +		err = -EINVAL;
>> +		goto err_get_client_env;
>> +	}
>> +
>> +	/* Obtain a reference to the uefisec_svc object which provides access to
>> +	 * the EFI var storage.
>> +	 */
>> +	ret = qcomtee_get_uefisec_svc_obj(uefisec_app.ctx, client_env_obj,
>> +					  &uefisec_svc_obj);
>> +	if (ret) {
>> +		err = -EINVAL;
>> +		goto err_get_uefisec_svc;
>> +	}
>> +	uefisec_app.uefisec_svc_obj = uefisec_svc_obj;
>> +
>> +	ret = efivars_register(&uefisec_app.efivars, &qcom_efivar_ops);
>> +	if (ret) {
> 
> If we have both QSEECOM and QTEE drivers enabled (which we hopefully
> will in distro kernels) and if QSEECOM has already provided UEFI vars
> implementation, this call will print a warning and a probe error in
> kernel logs. Similarly, if this driver registers UEFI vars
> implementation first, the QSEECOM one will print out the error.
> 
> We know that there is this kind of a clash. I think it makes sense to
> handle it. Earlier you wrote that QTEE would be a better option if the
> platform supports both. Would it be possible to implement this kind of
> selection?
>

This has been on my mind since the beginning. We could have a central
hub layer which both the QCOMTEE and QSEECOM drivers register with during
their probe and pass a list of services they can communicate with. This
one for example:
https://elixir.bootlin.com/linux/v7.3-rc5/source/drivers/firmware/qcom/qcom_qseecom.c#L86

When the hub realizes (at QCOMTEE registration) that a service is available
via both QSEECOM and QCOMTEE, it could call an API such as qcomtee_check_service()
to check if the current QTEE firmware OS version supports it. If so, it would
call qseecom_client_remove() for this service:
https://elixir.bootlin.com/linux/v7.3-rc5/source/drivers/firmware/qcom/qcom_qseecom.c#L30
and then call qtee_register_service().

This is a high level view of how such a framework could work. But since
only uefisecapp currently fits this scenario it feels like an overkill to
push it along with this series. I can see that Kuldeep's series which is adding
TPM service support also fits the scenario of a service being available via both
QSEECOM and QCOMTEE:
https://lore.kernel.org/all/20261001055029.1960743-1-zeroknots@protonmail.com/

I am fine with investigating the feasibility of such a framework in more
depth if everyone here feels that it is now required. Amir's inputs on this
would be welcome since he is the maintaiiner for QCOMTEE.

And this would have to be a separate patch series after this one lands.

Regards,
Harshal 
>> +		err = ret;
>> +		goto err_efi_vars_reg;
>> +	}
>> +
> 

