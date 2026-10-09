Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7E22FB0B2
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 02:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791511844; cv=none; b=AsPQnXOcDv3m5W70Y38Vy7ILX8QaGKuiGjjFJZsnPdFRj9nf28HIDvmcVP4GdZJ9m+J7AgNxnnW6tC+JB5sP5eWnI1y8z5IDhBwAWPfG3kiAzNXC3IghLcudbcModXYOtvIk1bia9tAw5T7G+ujZqJ+//TP7kppxarezJSVWAi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791511844; c=relaxed/simple;
	bh=lYnJVV8Wa/TPXz1E2UaJS5GsnqXIu/Z87WsJW2I/vkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R7YmY76Siy8IW6nUwQEwg8m53IBlBVw1SlDmPg4oySmZHSCfpv2NLr92HLs2kRCruN94V1E1A1xGkTpIyZbQypAaLD82q4W0fvntr5GDZ/AXzJ8oVnimQ9/CnPIaghMs8XJZGumC+jfcxDdtTX+GJGPAbnl89F6ZUlt30pBEtJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mwe42raZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eQ5mzmjU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mwe42raZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eQ5mzmjU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6990PmMj2959562
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 02:10:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PWIlfm4eRqEAbTkKamztvUovJLC4/3AeyGiGYlJYH/U=; b=Mwe42raZjspReLOA
	YMh7/+GuNC4lqAeb4vgQOxkG4cTnz/1be8to6aTmg+/+CZm71ExOsdlg80XYas+O
	caE1XLQH6NLPznAp147YmXXa/pV5SY2/Spb27hS9is38ra2jRYLQhbwJT0rpkoyL
	LGIZ5908GzwffY7MyV1bajleE7Mi/YU7k6Rnn7IZS7SKEbneMn60Uo84Aa4LD5mb
	Lnc/qat+rDjTRTNUQW3R/ITBZg+0J017CKK5ilVn7kJdg+EzxIrd5ya1rpxN9dGK
	SXqBtD6QKYQ0LfkXeFcrPmqQ4kZHi3DKRi0jbidZZpEw3tenKVv9186vJVzGIq78
	JXCypA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ev59qpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 02:10:42 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8883dcc671eso4415762b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 19:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791511841; x=1792116641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PWIlfm4eRqEAbTkKamztvUovJLC4/3AeyGiGYlJYH/U=;
        b=eQ5mzmjUAHDnlvXANx9Qcuf6wMLpAR+v2KKVBX/AR15V46R8Tl97O+yDSCZmznqHWe
         QwU0g9nYqwCRaM+dIRNUppkdrT75zZygblQsMsku4oLP4OZqFU2a6tHWm85aIbENiyks
         7UlV1YoP/pkD+22CPYpddjyH5Y4PfJpSN8Gde68LDplCvCnPAf9iv82ii2D+qOSezLDf
         JruAuS/5vWWbeaSZ/DtIYFzzP9QOtGjg6Ko7wNQB/hroQ1NoMZzcn0v0JH2VxHVN/Yai
         n+l84fJoapOqQCfTSIJao9s+nM1OMxLkV7JwOXvA586nu1+9P/XglBe6qmBoM57UNI8S
         sJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791511841; x=1792116641;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PWIlfm4eRqEAbTkKamztvUovJLC4/3AeyGiGYlJYH/U=;
        b=SBUhg+ExQPrkk2uPDnZFYGEWYqz3A+yMtq0vXafJeQAGlJOtcWGJaHDLGaaOF6ttFL
         4+n4XN2RKLg7Ils4fTu+HsaBlJ+rUV2+j++W0AUtaIQUwSMrUF2iRJ6iBH7ULhk7qqpG
         DzMtsZyd+D8tCGTFbHxyKtoWsP0r0KxGrOs/oBPR0xh/eeQ1G9HZ9EaOT1tZRq3oj/Z6
         U68viLaloLEJ+iZPgdY3Ons2CpjLUkB9/qGDZXzWwfIyzA2I+92Lj1NpGbJ6vhE3k8EM
         otyQjOYlj8bx4b20aauX7IaNV71eUhr8mcv5GOMTDjeX0itkJzNFu0EWpFnsk0Gh6VO4
         WcLA==
X-Forwarded-Encrypted: i=1; AKwUvBw3ZsCWN+x7zKvAHfz5h6XSvhY0xoXOqMWBH6OE0q9pTSB8SXOk6cz23/QmlnBFZuzlArSF9wCqHMMdB2A=@vger.kernel.org
X-Gm-Message-State: AFq9FYIULzZ0cSO4UT5lCZewkmB/HLRJOdrPVFPakNl662btgIh5miLw
	3+WSAFd6hpFfMRIeGsoAmIEoW/jxl2fFgCZwHJzQl+OFFO0TEHr88hTZGrGFRodyUDv5JbOLtBu
	0nBPGy3vGZ8jsP9y7bG0nekFAWnBH7Zs94vSfQmlvLsOsXgKfsAPDgyDKaGcIBzqHTQ==
X-Gm-Gg: AYBFou1MuShiKG1NZbWNUv6cLqp3828487a0OfyIvwe/gLG2lghkZ9XMSzJgKhliS1L
	6LgKDkNfZicximRMHUG056LTnN/Xj0Ywoppfe4/lkBB6zHoMI4q12N3QFDEU7arVpJi1iGqQjOK
	Omf9u1lODnOlYuhgIy8D2LaQLq94jv6G2maWcqV3tFkQUxOyXeA3Qltfli0VqXGJfsNj0qDt396
	O1H+006bPbqOdNhU/EOmcZ0+1BL1Z8RR9KXLlClsvKgPv8JyNnbuxwc8dysA3anMXU+BZTONV/G
	9JRuyKxC2LR9NLhmU9iPW330sd3DaiRvuopSYecxnPzPe10TIFakmOO4xMUMndIdy/qoGuZOdPn
	Pl18LO6cLVRFTDmbWJRj2zWZyOzxqLoVF
X-Received: by 2002:a05:6a00:1916:b0:878:3658:23dc with SMTP id d2e1a72fcca58-897c7cd75camr336137b3a.53.1791511841156;
        Thu, 08 Oct 2026 19:10:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:1916:b0:878:3658:23dc with SMTP id d2e1a72fcca58-897c7cd75camr336098b3a.53.1791511840588;
        Thu, 08 Oct 2026 19:10:40 -0700 (PDT)
Received: from [192.168.1.86] ([65.181.12.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c43ad3ccsm277492b3a.47.2026.10.08.19.10.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 19:10:40 -0700 (PDT)
Message-ID: <ff027be4-b473-4deb-a55c-52454129630c@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 13:10:33 +1100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] tee: qcomtee: Add support for registering QTEE
 services on TEE bus
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
        linux-arm-msm@vger.kernel.org
References: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-0-bf1c8e2a64ab@oss.qualcomm.com>
 <20261006-qcom_uefisecapp_migrate_qcomtee-v4-5-bf1c8e2a64ab@oss.qualcomm.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-5-bf1c8e2a64ab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAwOCBTYWx0ZWRfX9lkaEwHmfNgB
 NIMc2GSOR96T8zr6KdMs6L1ziJwKg8tjYGeGSWcGD7nn2pp+nUyGftNtDRq/s/gYgBrWoRmMdQp
 T+uMs22/gZGjI3G2rHyr7JThcax7rlM=
X-Authority-Analysis: v=2.4 cv=MMT1C8Zl c=1 sm=1 tr=0 ts=6ac84d22 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=9v5PfQ1E2GNzj2RibJmqVw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=I3J3X--Ozs3p5lJzdqUA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: SH8PTxBGLrsTBqiPoXMMaWqcvBRFEWF_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAwOCBTYWx0ZWRfX1QftYZcIhUT+
 0o2t7OJfGNsfIk902ZSOZf6IEgtkEmBPrbY4zuekO5FGjxPqWkeJjsPPnVyXxHS9/+lFVCVFFKk
 svED3mlcOI3X7V/SDlwKymL8gJGO3v1qniq6WANGOqZTo9xV2/Rbrp2A109JvuwG3hDyKHBc3bR
 mo6y0qFy6ziuDT8cgGmwA0UMfekvgEZCr5vBObmskz97gtiRSiX0l6pSuIuvausy/1WD+7OD3oK
 ivyLGty2bM5yIXKYWR+6HG9QtPtFvd95swsVxtoA2HtbNpKQLkMmDP2xakzkjcl8ay4v/x9iQaS
 gxUU9uc1shCdV431azOpXhLvy1RAY6iBPlos5Jlm/ujIM5ZgDJiVrOrd7ou5szuw44RBSbrlDKg
 FdWnBvqLOyVK/CbSH9f6giHYrHN5bTGEL60dDQ+xbmUS+BMhPDJxROnh8cZEsjJIQff97wdXaJG
 OISI7POyvnSibh6CBaw==
X-Proofpoint-ORIG-GUID: SH8PTxBGLrsTBqiPoXMMaWqcvBRFEWF_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_01,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090008



On 10/6/2026 10:33 PM, Harshal Dev wrote:
> QTEE exposes certain secure services implemented either within the QTEE
> kernel or via pre-loaded Trusted Applications (TAs). Such always-available
> services can be readily accessed by TEE client drivers via QTEE's
> object-IPC protocol if the service is registered as a device on the TEE
> bus.
> 
> One such service is the EFI-variables service, implemented by the
> uefisecapp TA which enables kernel clients to access EFI variables at
> runtime.
> 
> Maintain a static list of such always-available secure services and add
> support for the QCOMTEE driver to register these services as devices on
> the TEE bus during probe.
> 
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---
>  drivers/tee/qcomtee/call.c           | 161 ++++++++++++++++++++++++++++++++++-
>  drivers/tee/qcomtee/core.c           |   9 +-
>  drivers/tee/qcomtee/qcomtee.h        |  12 +++
>  drivers/tee/qcomtee/qcomtee_msg.h    |   1 +
>  drivers/tee/qcomtee/qcomtee_object.h |   3 +-
>  5 files changed, 179 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
> index c97afaa1b4aa..3061bcbd15ab 100644
> --- a/drivers/tee/qcomtee/call.c
> +++ b/drivers/tee/qcomtee/call.c
> @@ -676,9 +676,13 @@ static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
>  
>  	/* Get ''FeatureVersions Service'' object. */
>  	service = qcomtee_object_get_service(oic, client_env,
> -					     QCOMTEE_FEATURE_VER_UID);
> -	if (service == NULL_QCOMTEE_OBJECT)
> +					     QCOMTEE_FEATURE_VER_UID,
> +					     &result);
> +	if (service == NULL_QCOMTEE_OBJECT) {
> +		if (result)
> +			pr_err("FeatureVersions Service unavailable (%d)\n", result);
>  		goto out_failed;
> +	}
>  
>  	/* IB: Feature to query. */
>  	u[0].b.addr = &id;
> @@ -698,6 +702,156 @@ static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
>  	qcomtee_object_put(client_env);
>  }
>  
> +/**
> + * is_qcomtee_service_available() - Check if the QTEE service identified by the UID
> + * is available
> + * @oic: context to use for the current invocation.
> + * @client_env: Client environment object.
> + * @service_name: Name of the QTEE service.
> + * @uid: 32-bit UID of the service.
> + *
> + * Returns true if the service exists and is available.
> + * Returns false if a service is not exposed by QTEE.
> + */
> +static bool is_qcomtee_service_available(struct qcomtee_object_invoke_ctx *oic,
> +					 struct qcomtee_object *client_env,
> +					 const char *service_name, u32 uid)
> +{
> +	struct qcomtee_object *service;
> +	int error = 0;
> +	bool ret = false;
> +
> +	/* Get service object corresponding to the uid. */
> +	service = qcomtee_object_get_service(oic, client_env, uid, &error);
> +	if (service != NULL_QCOMTEE_OBJECT) {
> +		qcomtee_object_put(service);
> +		ret = true;
> +	}
> +
> +	/* When we fail to get the service, QTEE provides the reason. */
> +	if (error)
> +		pr_debug("%s is unavailable (%d)\n", service_name, error);
> +
> +	return ret;
> +}
> +
> +/*
> + * QTEE Service UUID name space identifier
> + *
> + * A random UUID that is allocated as a name space identifier for forming UUID's
> + * representing secure services exposed by QTEE.
> + */
> +static const uuid_t qtee_service_uuid_ns = UUID_INIT(0xe1b48857, 0x6154, 0x49f9,
> +						     0x93, 0x4e, 0xa2, 0xf2,
> +						     0x0a, 0xba, 0x98, 0x42);
> +
> +static const struct qtee_service qtee_services[] = {
> +	{ "qcom.tz.uefisecapp",
> +	   QCOMTEE_UEFI_SEC_UID }
> +};
> +
> +static void qtee_release_service(struct device *dev)
> +{
> +	struct tee_client_device *qtee_service = to_tee_client_device(dev);
> +
> +	kfree(qtee_service);
> +}
> +
> +/**
> + * qtee_register_service() - Register a given QTEE service on the TEE bus as a
> + * TEE client device
> + * @oic: context to use for the current invocation.
> + * @client_env: Client environment object.
> + * @service_name: Name of the QTEE service to be enumerated.
> + * @uid: 32-bit UID used by QTEE to identify the service.
> + *
> + * Returns 0 on success and < 0 on failure.
> + */
> +static int qtee_register_service(struct qcomtee_object_invoke_ctx *oic,
> +				 struct qcomtee_object *client_env,
> +				 const char *service_name,
> +				 const u32 uid)
> +{
> +	struct tee_client_device *qtee_service;
> +	uuid_t service_uuid;
> +	int rc;
> +
> +	if (!is_qcomtee_service_available(oic, client_env, service_name, uid))
> +		return -EOPNOTSUPP;
> +
> +	tee_generate_uuid_v5(&service_uuid, &qtee_service_uuid_ns, service_name,
> +			     strlen(service_name));
> +
> +	qtee_service = kzalloc_obj(*qtee_service);
> +	if (!qtee_service)
> +		return -ENOMEM;
> +
> +	qtee_service->dev.bus = &tee_bus_type;
> +	qtee_service->dev.release = qtee_release_service;
> +	if (dev_set_name(&qtee_service->dev, "qtee-svc-%pUb", &service_uuid)) {
> +		kfree(qtee_service);
> +		return -ENOMEM;
> +	}
> +	uuid_copy(&qtee_service->id.uuid, &service_uuid);
> +
> +	rc = device_register(&qtee_service->dev);
> +	if (rc) {
> +		pr_err("QTEE service registration failed, err: %d\n", rc);
> +		put_device(&qtee_service->dev);
> +		return rc;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * qtee_register_services() - Enumerate all the secure services exposed by QTEE
> + * from the static 'qtee_services' list and register them on the TEE bus as
> + * TEE client devices.
> + *
> + * Not all versions of QTEE support a given service. Hence, we try to
> + * enumerate as many services from the 'qtee_services' list as possible.
> + * Not being able to enumerate a service shouldn't cause the driver probe
> + * to fail since none of the services in the list are mandatory for
> + * establishing communication with QTEE.
> + * @ctx: TEE context.

The doc is a bit unusal. There should be a short description, arguments and the details.
you details are above the argument.

> + */
> +static void qtee_register_services(struct tee_context *ctx)
> +{
> +	u32 idx;
> +	struct qcomtee_object *client_env;
> +
> +	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
> +		qcomtee_object_invoke_ctx_alloc(ctx, true);
> +	if (!oic)
> +		return;
> +
> +	client_env = qcomtee_object_get_client_env(oic);
> +	if (client_env == NULL_QCOMTEE_OBJECT)
> +		return;
> +
> +	for (idx = 0; idx < ARRAY_SIZE(qtee_services); idx++)
> +		qtee_register_service(oic, client_env,
> +				      qtee_services[idx].name,
> +				      qtee_services[idx].uid);
> +
> +	qcomtee_object_put(client_env);
> +}
> +
> +static int qtee_unregister_service(struct device *dev, void *data)
> +{
> +	if (!strncmp(dev_name(dev), "qtee-svc", strlen("qtee-svc")))
> +		device_unregister(dev);
> +
> +	return 0;
> +}
> +
> +static void qtee_unregister_services(void)
> +{
> +	bus_for_each_dev(&tee_bus_type, NULL, NULL,
> +			 qtee_unregister_service);
> +}
> +
>  static const struct tee_driver_ops qcomtee_ops = {
>  	.get_version = qcomtee_get_version,
>  	.open = qcomtee_open,
> @@ -779,6 +933,8 @@ static int qcomtee_probe(struct platform_device *pdev)
>  		QTEE_VERSION_GET_MINOR(qcomtee->qtee_version),
>  		QTEE_VERSION_GET_PATCH(qcomtee->qtee_version));
>  
> +	qtee_register_services(qcomtee->ctx);
> +
>  	return 0;
>  
>  err_dest_wq:
> @@ -808,6 +964,7 @@ static void qcomtee_remove(struct platform_device *pdev)
>  {
>  	struct qcomtee *qcomtee = platform_get_drvdata(pdev);
>  
> +	qtee_unregister_services();
>  	teedev_close_context(qcomtee->ctx);
>  	/* Wait for RELEASE operations to be processed for QTEE objects. */
>  	tee_device_unregister(qcomtee->teedev);
> diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
> index 60fe3b5776e3..4a523a95bf0e 100644
> --- a/drivers/tee/qcomtee/core.c
> +++ b/drivers/tee/qcomtee/core.c
> @@ -898,19 +898,20 @@ qcomtee_object_get_client_env(struct qcomtee_object_invoke_ctx *oic)
>  
>  struct qcomtee_object *
>  qcomtee_object_get_service(struct qcomtee_object_invoke_ctx *oic,
> -			   struct qcomtee_object *client_env, u32 uid)
> +			   struct qcomtee_object *client_env, u32 uid,
> +			   int *result)
>  {
>  	struct qcomtee_arg u[3] = { 0 };
> -	int ret, result;
> +	int ret;
>  
>  	u[0].b.addr = &uid;
>  	u[0].b.size = sizeof(uid);
>  	u[0].type = QCOMTEE_ARG_TYPE_IB;
>  	u[1].type = QCOMTEE_ARG_TYPE_OO;
>  	ret = qcomtee_object_do_invoke(oic, client_env, QCOMTEE_CLIENT_ENV_OPEN,
> -				       u, &result);
> +				       u, result);
>  
> -	if (ret || result)
> +	if (ret || *result)
>  		return NULL_QCOMTEE_OBJECT;
>  
>  	return u[1].o;
> diff --git a/drivers/tee/qcomtee/qcomtee.h b/drivers/tee/qcomtee/qcomtee.h
> index f39bf63fd1c2..66d305a46c0a 100644
> --- a/drivers/tee/qcomtee/qcomtee.h
> +++ b/drivers/tee/qcomtee/qcomtee.h
> @@ -17,6 +17,8 @@
>  #define QCOMTEE_OBJREF_FLAG_USER	BIT(1)
>  #define QCOMTEE_OBJREF_FLAG_MEM		BIT(2)
>  
> +#define QTEE_UUID_NS_NAME_SIZE	        128
> +

This macro seems unused, in the whole series. Drop it.

>  /**
>   * struct qcomtee - Main service struct.
>   * @teedev: client device.
> @@ -39,6 +41,16 @@ struct qcomtee {
>  	u32 qtee_version;
>  };
>  
> +/**
> + * struct qtee_service - A secure service exposed by QTEE identified by a 32-bit UID.
> + * @name: Name of the QTEE service.
> + * @uid: 32-bit UID used by QTEE to identify the service.
> + */
> +struct qtee_service {
> +	const char *name;
> +	const u32 uid;
> +};
> +
>  void qcomtee_fetch_async_reqs(struct qcomtee_object_invoke_ctx *oic);
>  struct qcomtee_object *qcomtee_idx_erase(struct qcomtee_object_invoke_ctx *oic,
>  					 u32 idx);
> diff --git a/drivers/tee/qcomtee/qcomtee_msg.h b/drivers/tee/qcomtee/qcomtee_msg.h
> index 5d7b21fdd368..9278a361dc70 100644
> --- a/drivers/tee/qcomtee/qcomtee_msg.h
> +++ b/drivers/tee/qcomtee/qcomtee_msg.h
> @@ -105,6 +105,7 @@ union qcomtee_msg_arg {
>  #define QTEE_VERSION_GET_MINOR(x) (((x) >> 12) & 0xffU)
>  #define QTEE_VERSION_GET_PATCH(x) ((x) >> 0 & 0xfffU)
>  
> +#define QCOMTEE_UEFI_SEC_UID            413
>  /* Response types as returned from qcomtee_object_invoke_ctx_invoke(). */
>  
>  /* The message contains a callback request. */
> diff --git a/drivers/tee/qcomtee/qcomtee_object.h b/drivers/tee/qcomtee/qcomtee_object.h
> index d3740099fae0..901ba3565a73 100644
> --- a/drivers/tee/qcomtee/qcomtee_object.h
> +++ b/drivers/tee/qcomtee/qcomtee_object.h
> @@ -317,6 +317,7 @@ qcomtee_object_get_client_env(struct qcomtee_object_invoke_ctx *oic);
>  
>  struct qcomtee_object *
>  qcomtee_object_get_service(struct qcomtee_object_invoke_ctx *oic,
> -			   struct qcomtee_object *client_env, u32 uid);
> +			   struct qcomtee_object *client_env, u32 uid,
> +			   int *result);
>  
>  #endif /* QCOMTEE_OBJECT_H */
> 

