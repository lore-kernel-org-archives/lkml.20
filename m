Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A791442466A
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 13:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791294534; cv=none; b=ZenGrv5ZnFOT/OY5U4YNFDWpxxPlC3wuhyaj0eoLoGMF9lkAKfnjwBi0X6Brd60XFFG6xsuekPteOSdP5XBAIEAIYt/P1eFjjQ2qWzox3jIFHmKOUvdXHe/Qsk9LVNKwDGuGLy+kG7Ix/rH0kjlsh6wY3eHzFTbHcRdXPUkPglo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791294534; c=relaxed/simple;
	bh=/euIR1cA+vBSmeEG+EUCqPkBFFlpJ6Pj+42dkemZzGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GImxDzYP3Mz+/Wuz6CPT7hELuxtoXp6cVmwSmWZCTfhu5d/Ikbr3EgTUv3uGagRFhQvZUYlfrnx+0mjjiQUltNPwKY771Bc1PJDyICwnPfe0Zp7gymxjmDcFcmnz6lRF8TZFpkR2DEcLIRcSsv6VLqOFB1d1tbLDJAeH+5OLDF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AdVqPmzj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jtoRFye9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AdVqPmzj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jtoRFye9"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696DUXaD359556
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 13:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZsxHYpIVIY0DGWejGQhctU73
	xidBjR73UUkk+4RV14w=; b=AdVqPmzjL0Ap05ch/R1lSXawO/Ve1ilvZS9reygR
	2u3hrmHhxElQTFx72msr8OAgB4CTy4NcnZ3NOWpiGTW5bGZjgEMbqO1N6fkWlGmR
	Z/X1xCwJT05/kEoX7dlMG2kdgs9oH7XYV5kAwQigTqoI+rpSXegprod/bJQtx1sk
	JfUtyIVtEKP2iX1OKZZ7iSi08ndsuRGPbvvAwjVQP/U60xD0zf9mshpsYZbMbKX9
	beke3b99E0O+m6w8FZb8hbl+QK8gymYhL3chYv++4ZwhKcvG+TXb6rNo9rhxuzHo
	JYVp1KPquHdo19U70/AAzAY/1ySE8M7fzjNjSXPCcUXj0w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xf7rvc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 13:48:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93dd3c3badbso566357885a.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 06:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791294526; x=1791899326; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZsxHYpIVIY0DGWejGQhctU73xidBjR73UUkk+4RV14w=;
        b=jtoRFye9N6xHcsvuV4qKruj5mR2Hqb00FAVlYe7kBDCIrmvgnf0DyYLZEMpDcTWaJy
         RKkM2kOcNb+fQ/YDQj7q0ypTPtUIupV8nEEo+afoTlMoON6cFa92ufvK0jja3es6Sqm9
         eCxn7x6i27iiuKqzGIqPh/on7cXZpeEsW2Uc7dD+A/DLa1KZ/bXHKnbR1u4q0CWnz2Ef
         pRbqiWG0KBupb3TM4Ah0Aexeg+zzkErNW+zqNdZgtRNyD869irvrITDVuLb/2mU+KMmy
         bXTL6gYcA1/dbG3lOmxlf1lEV9Rr5Zae+pb3EcLX64cz/DgNMgSnb5mxNeo5wF1spIqU
         7MaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791294526; x=1791899326;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZsxHYpIVIY0DGWejGQhctU73xidBjR73UUkk+4RV14w=;
        b=yJvSk846dPMmx2k5h9D7mBw++LvgshAN2KRpdGXvRTD0xjjPUYtbIKC2EJlOTe+n/J
         52PaHzrjhO2i6NyGD7dp5mkfxJDO/wLi75zEuACi5/ncXoKhU7F0IMQ9hcseFUO9ucZC
         RYtjvyiqrJ8HzGSu2TrjLMS9Rqtll3jmLOIuaBgTn05e19PETdvo/WNb0Uyr/Hwe4fdz
         8f7O3Ui+3buPHN62QqkNwyF+tfZBuUor9uCRBpLy1dsQ1I7Yje3sY2a2eewlQNhGuv+z
         ZGnrDQskoId1eUFSGk4+9Px4/ugmdZKwjywGvZcNqzbQ3ndACmbO+ESrYdEGCfyucL9c
         s+aA==
X-Forwarded-Encrypted: i=1; AKwUvByVlJYkkiQzZCtLH/irWBb4fqZDWKrrXl6OGWqaswhJuiaWDXfx2hcbo0M+AeCy/J0Adm9EqK+z/nS3s9c=@vger.kernel.org
X-Gm-Message-State: AFuF++khKd4OpGQ5yf2svrHbG90BTLvMndxLfs0KYpwKQYZLHZAFXsca
	pGUSwEOW6XAtCp/YSVsdUUKB/SPmDtvYdHoS/KLGh+gbJ4RRCTmcOJCMy9jWX5+s/gV8CLkVrPG
	JpBDrt0epZCszJWTri9KC8Y4WaRjj7K7BS6KGkgJzyMsoCAnKXQnenOJPfgR8jteNKIw=
X-Gm-Gg: AYBFou0yU5KrTBxFPg6u9NJZUBwrT1plza2tbQniFuq03Q2Jls9aXyD/lwnLSjx7Eqm
	h7Nk5J80UYbXq19jMn1GwpZWNlrSZTMvO9sT31kZtpHXOIUv5IC9ZDNSqHgZcCVdZNvphEubHEd
	PMjobOyKZyAZZAI501iRIbNBT3EOMHmXPBCYaESEh3Jz5eXqLkAxu8rOEIg+wCVd7uEBkEXMdjk
	WeunrF+tLyVCDYanHluScz80ZRNXol+pjs7FQHfzIu/zlCZ5ftNPHyvOSs57DjcV0dgKzd6pR61
	Ndd+0xHKp/5v1I2VSOw35mm+c4eDSBccAdmFboaFGVwYkhmGeNplFIN7iLw43FpNkOoEkUTUOTA
	N16fy+ILw9/ZrSYSt9vRvo8To2mi5YV8GIZQJJI3QshU2ni955Htmbcj4/8Tc6QSnaoHuaHEcVY
	iO5oXnetUZYj8M
X-Received: by 2002:a05:620a:459e:b0:937:11c9:37f1 with SMTP id af79cd13be357-93e50f80d64mr1812408685a.16.1791294526449;
        Tue, 06 Oct 2026 06:48:46 -0700 (PDT)
X-Received: by 2002:a05:620a:459e:b0:937:11c9:37f1 with SMTP id af79cd13be357-93e50f80d64mr1812402585a.16.1791294525870;
        Tue, 06 Oct 2026 06:48:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c79dc77sm4084021e87.51.2026.10.06.06.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 06:48:44 -0700 (PDT)
Date: Tue, 6 Oct 2026 16:48:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 6/7] firmware: qcom: Add support for TEE based EFI-var
 client driver
Message-ID: <r7gtspju4cp5iwelv4zs4xoh4d7ambeceptmjtqaf5hcjzmc5n@4msc3ap4yfhz>
References: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-0-bf1c8e2a64ab@oss.qualcomm.com>
 <20261006-qcom_uefisecapp_migrate_qcomtee-v4-6-bf1c8e2a64ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-6-bf1c8e2a64ab@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA1NCBTYWx0ZWRfX6g9+iYy63Vou
 cr1eg6A5sl3duYtMeSs3v/0Q2yieFcEh+wzG6QiK/v3ZrigguYNBpQNAfOm6MJfGA4MN9vYENkr
 OxLfETve6+7NzgCKBz6J0xbIfqJlv54=
X-Authority-Analysis: v=2.4 cv=FpSQbGrq c=1 sm=1 tr=0 ts=6ac4fc43 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=UKPZmZIt5rrgs1V1fpcA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA1NCBTYWx0ZWRfX2Lun2V4Q7QUY
 BfKZUU1AwUD6x/UspghMDwsyuqwE+B3hyicDE8ubsePbNHz1VMHeDS4QFegBtQ3SQNGyZPYeoq+
 g15ybAJM5A0vvH9kg7DLOK7+QTqIHlnpgi3Jk64DmTSQHI0zKKxP0kWQLG0rG9QwP3HScydmbWA
 kB8dPi2PmXqrX9wRmYhWMDT1vdKa08hTeAxF7qkCzP7BQnxvGPdVvkckZXteeV7lm4FGCoh52Ss
 hCd4i+LmSk9kNMibVUJzu5NKbbaZAmls9cewxfk3sy1lypavnaM5QZR2+6rP8DXSm3hQaOeYjbh
 3lYBV7D997rA3EnrutgnnqMLzuioWwLYbCwzWjTGBb9mHbqWhP6ItZ/4kBLTwrscVuJu6VUPHmH
 a6LG76fUCxfqULsd5J6P2M2wsiuiBDtTS79SNdQdtTeDum9JlytvkW5Ml2iUGnfHK5RWOvVtWmA
 cJQ8DgeR5JlIvKfr+aw==
X-Proofpoint-ORIG-GUID: qL9yZ_gB9WhRiCviQV_284foLT2R-3IX
X-Proofpoint-GUID: qL9yZ_gB9WhRiCviQV_284foLT2R-3IX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_04,2026-10-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060054

On Tue, Oct 06, 2026 at 05:03:27PM +0530, Harshal Dev wrote:
> On Qualcomm SoC based platforms, UEFI stores EFI variables within the
> Replay Protected Memory Block (RPMB) located within either the UFS,
> eMMC or SPI-NOR storage. The RPMB key which is one-time programmed into
> the storage controller to allow authentication of the RPMB frames is
> generated by and only available to the Qualcomm Trusted Execution
> Environment (QTEE).
> 
> The legacy QSEECOM protocol used for communicating with the QTEE is
> deprecated and replaced with the use-case agnostic SMCInvoke protocol
> starting with the Qualcomm SM8x50 series. On platforms where the QSEECOM
> driver still probes, it does not support a listener interface with QTEE
> to enable writing of non-volatile EFI variables to the RPMB for UFS and
> eMMC storage.
> Therefore on such platforms, a TEE client driver which communicates with
> QTEE via the SMCInvoke protocol implemented by the QCOMTEE driver (and
> registered with the TEE subsystem) must be used to update such EFI
> variables.
> 
> Add support for a TEE based uefisecapp client driver which installs efivar
> operations after obtaining an object reference to the uefisecapp service.
> This enables the kernel/user-space to access or modify both volatile EFI
> variables stored by the Secure Application (in-memory) and non-volatile
> ones stored within RPMB.
> 
> +
> +static efi_status_t qcomtee_uefi_query_variable_info(u32 attr, u64 *storage_space,
> +						     u64 *remaining_space,
> +						     u64 *max_variable_size)
> +{
> +	int ret;
> +	u32 out_errno;
> +	u64 maximum_variable_storage_size;
> +	u64 remaining_variable_storage_size;
> +	u64 maximum_variable_size;
> +
> +	if (!storage_space || !remaining_space || !max_variable_size)
> +		return EFI_INVALID_PARAMETER;
> +
> +	ret = qcuefi_query_variable_info(attr,
> +					 &maximum_variable_storage_size,
> +					 &remaining_variable_storage_size,
> +					 &maximum_variable_size,
> +					 &out_errno);
> +
> +	if (ret)
> +		return EFI_DEVICE_ERROR;
> +
> +	if (!out_errno) {
> +		*storage_space = maximum_variable_storage_size;
> +		*remaining_space = remaining_variable_storage_size;
> +		*max_variable_size = maximum_variable_size;

Why do we need to copy data? Can we pass pointers directly to the
qcuefi_foo calls?

> +	}
> +
> +	return uefisecapp_err_to_efi_status(out_errno);
> +}
> +
> +/**
> + * qcomtee_release_object() - Release an object returned by QTEE.
> + *
> + * Each object returned by QTEE repesents a secure service exposed to the
> + * client. Whenever an secure service is opened, QTEE may allocate resources
> + * on the client's behalf. Therefore, once the client is done accessing the
> + * secure service, the object representing it should be explicitly released
> + * so that QTEE can release the associated resources as well.
> + *
> + * @ctx: TEE context.
> + * @object: The object to release.
> + */
> +static void qcomtee_release_object(struct tee_context *ctx,
> +				   struct tee_param_objref object)
> +{
> +	struct tee_ioctl_object_invoke_arg inv_arg;
> +
> +	memset(&inv_arg, 0, sizeof(inv_arg));
> +	SET_INVOKE_ARG(inv_arg, object.id, QCOMTEE_MSG_OBJECT_OP_RELEASE, 0);
> +	tee_client_object_invoke_func(ctx, &inv_arg, NULL);
> +}
> +
> +/**
> + * qcomtee_get_uefisec_svc_obj() - Get a UEFI Secure App service object to
> + * begin communication with the service.
> + * @ctx: TEE context.
> + * @client_env_obj: The client environment object returned earlier by QTEE.
> + * @uefisec_svc_obj: The UEFI Secure App service object.
> + *
> + * Returns 0 on success.
> + * Returns < 0 if client environment object invocation failed.
> + * Returns > 0 if client environment invocation was success but UEFI Secure App
> + * service object could not be returned for some other reason (represented by the
> + * returned value)
> + */
> +static int qcomtee_get_uefisec_svc_obj(struct tee_context *ctx,
> +				       struct tee_param_objref client_env_obj,
> +				       struct tee_param_objref *uefisec_svc_obj)
> +{
> +	int ret;
> +	struct tee_ioctl_object_invoke_arg inv_arg;
> +	u64 obj_id = client_env_obj.id;
> +	struct tee_param param[QCOMTEE_GET_UEFI_SVC_NPARAMS];
> +	u32 uefisec_uid = QCOMTEE_UEFI_SEC_UID;
> +
> +	memset(&inv_arg, 0, sizeof(inv_arg));
> +	memset(&param, 0, sizeof(param));
> +
> +	SET_INVOKE_ARG(inv_arg, obj_id,
> +		       QCOMTEE_OP_CLIENT_ENV_OPEN,
> +		       QCOMTEE_GET_UEFI_SVC_NPARAMS);
> +	SET_TEE_PARAM_UBUF(param[0], UBUF_INPUT, TEE_PARAM_UBUF(uefisec_uid));
> +	SET_TEE_PARAM_OBJREF(param[1], OBJREF_OUTPUT, 0, 0);
> +
> +	ret = tee_client_object_invoke_func(ctx, &inv_arg, param);
> +	if (ret < 0 || inv_arg.ret != 0) {
> +		dev_err(uefisec_app.dev, "QCOMTEE_CLIENT_ENV_OPEN invoke ret: %d, err: 0x%x\n",
> +			ret, inv_arg.ret);
> +		return ret ?: inv_arg.ret;
> +	}
> +
> +	*uefisec_svc_obj = param[1].u.objref;
> +	return ret;
> +}
> +
> +/**
> + * qcomtee_get_client_env_obj() - Get a client environment object to begin
> + * object exchange with QTEE.
> + * @ctx: TEE context.
> + * @client_env_obj: The client environment object returned by QTEE.
> + *
> + * Returns 0 on success.
> + * Returns < 0 if root object invocation failed.
> + * Returns > 0 if root object invocation was success but client environment
> + * object could not be returned for some other reason (represented by the
> + * returned value)
> + */
> +static int qcomtee_get_client_env_obj(struct tee_context *ctx,
> +				      struct tee_param_objref *client_env_obj)
> +{
> +	int ret;
> +	struct tee_ioctl_object_invoke_arg inv_arg;
> +	struct tee_param param[QCOMTEE_GET_CLIENT_ENV_NPARAMS];
> +
> +	memset(&inv_arg, 0, sizeof(inv_arg));
> +	memset(&param, 0, sizeof(param));
> +
> +	SET_INVOKE_ARG(inv_arg, TEE_OBJREF_NULL,
> +		       QCOMTEE_ROOT_OP_REG_WITH_CREDENTIALS,
> +		       QCOMTEE_GET_CLIENT_ENV_NPARAMS);
> +	SET_TEE_PARAM_OBJREF(param[0], OBJREF_INPUT, TEE_OBJREF_NULL, 0);
> +	SET_TEE_PARAM_OBJREF(param[1], OBJREF_OUTPUT, 0, 0);
> +
> +	ret = tee_client_object_invoke_func(ctx, &inv_arg, param);
> +	if (ret < 0 || inv_arg.ret != 0) {
> +		dev_err(uefisec_app.dev, "QCOMTEE_ROOT_OP_REG_WITH_CREDENTIALS invoke ret: %d, err: 0x%x\n",
> +			ret, inv_arg.ret);
> +		return ret ?: inv_arg.ret;
> +	}
> +
> +	*client_env_obj = param[1].u.objref;
> +	return ret;
> +}
> +
> +static const struct efivar_operations qcom_efivar_ops = {
> +	.get_variable = qcomtee_uefi_get_variable,
> +	.set_variable = qcomtee_uefi_set_variable,
> +	.get_next_variable = qcomtee_uefi_get_next_variable,
> +	.query_variable_info = qcomtee_uefi_query_variable_info,
> +};
> +
> +static int qcomtee_ctx_match(struct tee_ioctl_version_data *ver,
> +			     const void *data)
> +{
> +	return (ver->impl_id == TEE_IMPL_ID_QTEE);
> +}
> +
> +static int qcomtee_uefisecapp_probe(struct tee_client_device *tee_dev)
> +{
> +	int ret, err;
> +	struct tee_param_objref client_env_obj;
> +	struct tee_param_objref uefisec_svc_obj;
> +
> +	uefisec_app.dev = &tee_dev->dev;
> +	/* Open context with QCOMTEE driver */
> +	uefisec_app.ctx = tee_client_open_context(NULL, qcomtee_ctx_match, NULL,
> +						  NULL);
> +	if (IS_ERR(uefisec_app.ctx))
> +		return -ENODEV;
> +
> +	/* Obtain a reference to client_env object to begin object exchange
> +	 * with QTEE

Nit: check out the preferred block comment format. also, I think these
comments echo the code which pretty obvious here.

> +	 */
> +	ret = qcomtee_get_client_env_obj(uefisec_app.ctx, &client_env_obj);
> +	if (ret) {
> +		err = -EINVAL;
> +		goto err_get_client_env;
> +	}
> +
> +	/* Obtain a reference to the uefisec_svc object which provides access to
> +	 * the EFI var storage.
> +	 */
> +	ret = qcomtee_get_uefisec_svc_obj(uefisec_app.ctx, client_env_obj,
> +					  &uefisec_svc_obj);
> +	if (ret) {
> +		err = -EINVAL;
> +		goto err_get_uefisec_svc;
> +	}
> +	uefisec_app.uefisec_svc_obj = uefisec_svc_obj;
> +
> +	ret = efivars_register(&uefisec_app.efivars, &qcom_efivar_ops);
> +	if (ret) {

If we have both QSEECOM and QTEE drivers enabled (which we hopefully
will in distro kernels) and if QSEECOM has already provided UEFI vars
implementation, this call will print a warning and a probe error in
kernel logs. Similarly, if this driver registers UEFI vars
implementation first, the QSEECOM one will print out the error.

We know that there is this kind of a clash. I think it makes sense to
handle it. Earlier you wrote that QTEE would be a better option if the
platform supports both. Would it be possible to implement this kind of
selection?

> +		err = ret;
> +		goto err_efi_vars_reg;
> +	}
> +

-- 
With best wishes
Dmitry
