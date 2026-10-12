Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064243EB818
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798713; cv=none; b=n1jp46cPIsQkfGAkdabAOlNLh5qYHoK8Bxpaa2/ZC2sABezZ+6PfDAYB4L86sY4/d0Zwe0WSES+d4rNPU+tbnfP0NBuMJnNphGGyaJcsIYEsCzbN6VTZi25+IntcLBZLkEE6aONnLKACTvsl5d/BVYYA4qW2b8iFwAHnuQ6xs9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798713; c=relaxed/simple;
	bh=gdXY6ocs+ooCFG9wZMbkuOoRcbHg+nXQL1+SlSQ7HL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hiLYZW9kybrtwk/pGhCo+ZNbIW2VFExMcgawEHKK5q/MRIPXdciWAIuW7P+iBQbmiqf1qXyWaW7m2+RGPlOAvPhBzSHP1RwK7G76Czq1pbJUOXfLFzdwAGr/CsA9p3Kg4gBlku90TzljpSUx8vp4g5BYbFQTzBVGJYtFZ9SSD2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LbLerd0K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ev92agp7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LbLerd0K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ev92agp7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KfXw741647
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2BuzfwYZ2BSJ/dyUB6+ct6jwmWjwONCfoknp1RMYXBE=; b=LbLerd0KldmZYUw9
	Ks1iGhzPNqMY782jF+2ymMH9vF6a8+dvblhc3IWNvLJVGeWlyPL9B6n6OdZ/2LmH
	rX80n3NXn3eJ/o2LhnKXZwRODiInLEvUFToXSbcEiAcPqbh1f9fYcIfpB1l1VoeA
	1yi0jkg37u2foNxf5XmRDUm0HCFTo9yK1M3nLoe5Iwiy30MzIq7UopsRWJod7rx8
	yOk2G5QYH4zRhMSD/J73GVEfv1ubYlhcAm1Dnbhc2bV4LaqH1kclczgIrzC2o9Ws
	Xl/jybFon80bs3q64hRJvJCLxmHCkEHsuTv+AlIMnOu13VuiV7AIqmer6lF0bFz7
	tWQHVQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j6dj683-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:51:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e8ba4757baso6983305ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791798709; x=1792403509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2BuzfwYZ2BSJ/dyUB6+ct6jwmWjwONCfoknp1RMYXBE=;
        b=Ev92agp7h9jYvy0s/NU8rOHdWhhP8fCHZQ71XEqYo4QMi7IXjc1V9AUviyWX/j5WGn
         97BOvTtjmaRCxmD9DStyBxJfUvKlO3EJ6cyZqo48Bi8M4QlG80ATax0Sbn+0zfJv3PK9
         5Blm0FzATdNaSV+Gp/U+bf+zt5CpDgs6As0YUkjNOX7kkEI2dLCuGho5DJD7nJzwmPQe
         pxeFuT3tERqq8YAHFZGkY9d11w4pT70VeeyzsMbPisyRJcNDAPw6JMg9obZE8l26O9aL
         PGN9i8Zmuez0WHjCxcpwVcrUl9PLhsI0bG659jgoTjM/jN0bqf2RBVO+8G7YQzHf/qMx
         tJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791798709; x=1792403509;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2BuzfwYZ2BSJ/dyUB6+ct6jwmWjwONCfoknp1RMYXBE=;
        b=aEING9wzEJq514jdCYtt4OcHKyAywZngj4XDFIJYvtvQZmvtgbIMEOkdeKTGPf3FIV
         uJnHA8i7A8yIkUUdeHCGAp1SXa8ofhhIQ8o57DdUxdGmHA4VkUxB0l31rQ0if/4kDwTr
         5mdCeox/0l5hBM0DLte6LpxslO2Lh91ON6S/MwZnENGkoPNufpe/LeQEL7XhqUzXIHJ5
         2Gp/gZWydr6ThoCcuh4qrbuLPTKA/s44m0o+6XKpkbKn5o3cZLquJPfjGKETW2YzLxYd
         mPI1TAAiunfMXRV9hgdnztBReAfTksHLX1pcW/7vHbOaK9YDg0GVzcYbCGuX3/fjhcR2
         fs8Q==
X-Forwarded-Encrypted: i=1; AKwUvByo1hXOLynfekFpEpPhRMP0TVM08J/ojRkBZaq969CW1GKkagHtOYEdKp+tFb9Ii584Jd8Lcgwal0ACLhc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCNbRp9wmAjxX41ht4beOHLka8dbA+uG9qUs0y6MUIvVRz17BK
	v7y/uczeD8K2t2AJ5pnVTQORFcLLVmRDvdKbg5fvsaBgdJ5bwCMjhYi67S7D2YpynELLNwLA5Wd
	+JHvzn12lhjuOnQ2uLZphGboo0uJBdNGzUwujVmaZoEjYGTVHLDW7Z7mXDiM4mAU8IpY1KYZCju
	E=
X-Gm-Gg: AYBFou3QS1qKNZZh9CdDBPGac7dxAqAQxi2c+O1OxJCDvOBYccM34rxXmhWVpr0/pT9
	pNkxOIz6PbJIxES9EdjlbXxdvJKE3d03S/MM7Pbq3vDItzCC/QyeOxx1kHJRsbMAZeNip34LFfW
	LfbFCyA5qfqS+cpCnRrVHPp5APcc/UHicxtqDD0VHoH1X2/mxFTLfXjLETU1CJO7hW/ccDepMf/
	I97ivbqWbOWU6wC5SPDm6RRbAPbAUrrjw/bepNxlJU7MVaHP297TLszoJ+oy7Ip95w/tT6XYNfs
	8jWPmnnDfthYClUlArorQ8U0gjw12907ljlFW1+Rckh7JFzHx5WMgry09wMBUUd0r1h0PwC4S2Q
	6gFJf4NeWB3+Da+WAz/rY8PHvb+8/
X-Received: by 2002:a17:902:e5d1:b0:2e2:e57f:77e0 with SMTP id d9443c01a7336-2e842ac4b98mr80820645ad.24.1791798708537;
        Mon, 12 Oct 2026 02:51:48 -0700 (PDT)
X-Received: by 2002:a17:902:e5d1:b0:2e2:e57f:77e0 with SMTP id d9443c01a7336-2e842ac4b98mr80820515ad.24.1791798707977;
        Mon, 12 Oct 2026 02:51:47 -0700 (PDT)
Received: from [192.168.29.10] ([49.37.155.134])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e84219e525sm42433155ad.16.2026.10.12.02.51.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 02:51:47 -0700 (PDT)
Message-ID: <49911654-d5e0-4b82-a7b8-96f90fb8350c@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 15:21:41 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] tee: qcomtee: Add support for registering QTEE
 services on TEE bus
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
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
 <ff027be4-b473-4deb-a55c-52454129630c@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <ff027be4-b473-4deb-a55c-52454129630c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzOSBTYWx0ZWRfX5ArLS4BipmSx
 lPQXFnb2kSG1iWaBpSdmqS8e7LlIctERac3NinRbMTT3R29PqiRoqOGl8SLapoIuZzU5a1BDRrL
 6KbzRDGt+mNJVktKGNQ7AmeiileZHmxqDzObfJH/RIA+wCms6LHA+H1IKtbyvQBwG86BtU9/kEd
 PyWyN6QwjxjeoSyzWyltcJ9AF6CqDHc19afVXbPuFhii0WiEIVPyg1vhWIo5DZWwJ+idV6d9NX0
 6KYGPJcoOJigIeml9qvOoFcXq1nj1ycJzpp1a3l6cP/yNrNonWNelyPnQ28yEGiKORwGEowT/bc
 CbFPQQn60sJlUQKpi1ufQXVP1X8mOj13kRu+hoLk3Kpm4np9VXvGSaMjmWHwJ+x5xN/zxPlYlM2
 zI/jpOPMb7qtllzGCAv175BlLNiU9ZAZvlk0bgsK/LWr9eUkN8xFmyN7B6najHvDJIHWktnJA+J
 hOE72sdlI5Q8WOEMkWQ==
X-Authority-Analysis: v=2.4 cv=aK5lOr9m c=1 sm=1 tr=0 ts=6accadb5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ivpbP8R7Mhpy7qfOLL/Q+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=STemef23jyuJc82aKJcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: gr2uBDjyXIrf9H3gQy6SN1vLZtz6sBVI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzOSBTYWx0ZWRfX+z3wjO1MFXFk
 2Axo9oq6vdCWy8Anp9IhdjLEUwVSqRguRZll1qvhrXzKZTTlfJuFuGwtqLRyhBHnXC2bEyxKcy9
 FIYo8CCl8UGnc1iKHZZspz+eY0nd6uI=
X-Proofpoint-ORIG-GUID: gr2uBDjyXIrf9H3gQy6SN1vLZtz6sBVI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120039

Hi Amir,

On 09-10-2026 07:40 am, Amirreza Zarrabi wrote:
> 
> 
> On 10/6/2026 10:33 PM, Harshal Dev wrote:
>> QTEE exposes certain secure services implemented either within the QTEE
>> kernel or via pre-loaded Trusted Applications (TAs). Such always-available
>> services can be readily accessed by TEE client drivers via QTEE's
>> object-IPC protocol if the service is registered as a device on the TEE
>> bus.
>>
>> One such service is the EFI-variables service, implemented by the
>> uefisecapp TA which enables kernel clients to access EFI variables at
>> runtime.
>>
>> Maintain a static list of such always-available secure services and add
>> support for the QCOMTEE driver to register these services as devices on
>> the TEE bus during probe.
>>
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> ---
>>  drivers/tee/qcomtee/call.c           | 161 ++++++++++++++++++++++++++++++++++-
>>  drivers/tee/qcomtee/core.c           |   9 +-
>>  drivers/tee/qcomtee/qcomtee.h        |  12 +++
>>  drivers/tee/qcomtee/qcomtee_msg.h    |   1 +
>>  drivers/tee/qcomtee/qcomtee_object.h |   3 +-
>>  5 files changed, 179 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
>> index c97afaa1b4aa..3061bcbd15ab 100644
>> --- a/drivers/tee/qcomtee/call.c
>> +++ b/drivers/tee/qcomtee/call.c
>> @@ -676,9 +676,13 @@ static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
>>  
>>  	/* Get ''FeatureVersions Service'' object. */
>>  	service = qcomtee_object_get_service(oic, client_env,
>> -					     QCOMTEE_FEATURE_VER_UID);
>> -	if (service == NULL_QCOMTEE_OBJECT)
>> +					     QCOMTEE_FEATURE_VER_UID,
>> +					     &result);
>> +	if (service == NULL_QCOMTEE_OBJECT) {
>> +		if (result)
>> +			pr_err("FeatureVersions Service unavailable (%d)\n", result);
>>  		goto out_failed;
>> +	}
>>  
>>  	/* IB: Feature to query. */
>>  	u[0].b.addr = &id;
>> @@ -698,6 +702,156 @@ static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
>>  	qcomtee_object_put(client_env);
>>  }
>>  
>> +/**
>> + * is_qcomtee_service_available() - Check if the QTEE service identified by the UID
>> + * is available
>> + * @oic: context to use for the current invocation.
>> + * @client_env: Client environment object.
>> + * @service_name: Name of the QTEE service.
>> + * @uid: 32-bit UID of the service.
>> + *
>> + * Returns true if the service exists and is available.
>> + * Returns false if a service is not exposed by QTEE.
>> + */
>> +static bool is_qcomtee_service_available(struct qcomtee_object_invoke_ctx *oic,
>> +					 struct qcomtee_object *client_env,
>> +					 const char *service_name, u32 uid)
>> +{
>> +	struct qcomtee_object *service;
>> +	int error = 0;
>> +	bool ret = false;
>> +
>> +	/* Get service object corresponding to the uid. */
>> +	service = qcomtee_object_get_service(oic, client_env, uid, &error);
>> +	if (service != NULL_QCOMTEE_OBJECT) {
>> +		qcomtee_object_put(service);
>> +		ret = true;
>> +	}
>> +
>> +	/* When we fail to get the service, QTEE provides the reason. */
>> +	if (error)
>> +		pr_debug("%s is unavailable (%d)\n", service_name, error);
>> +
>> +	return ret;
>> +}
>> +
>> +/*
>> + * QTEE Service UUID name space identifier
>> + *
>> + * A random UUID that is allocated as a name space identifier for forming UUID's
>> + * representing secure services exposed by QTEE.
>> + */
>> +static const uuid_t qtee_service_uuid_ns = UUID_INIT(0xe1b48857, 0x6154, 0x49f9,
>> +						     0x93, 0x4e, 0xa2, 0xf2,
>> +						     0x0a, 0xba, 0x98, 0x42);
>> +
>> +static const struct qtee_service qtee_services[] = {
>> +	{ "qcom.tz.uefisecapp",
>> +	   QCOMTEE_UEFI_SEC_UID }
>> +};
>> +
>> +static void qtee_release_service(struct device *dev)
>> +{
>> +	struct tee_client_device *qtee_service = to_tee_client_device(dev);
>> +
>> +	kfree(qtee_service);
>> +}
>> +
>> +/**
>> + * qtee_register_service() - Register a given QTEE service on the TEE bus as a
>> + * TEE client device
>> + * @oic: context to use for the current invocation.
>> + * @client_env: Client environment object.
>> + * @service_name: Name of the QTEE service to be enumerated.
>> + * @uid: 32-bit UID used by QTEE to identify the service.
>> + *
>> + * Returns 0 on success and < 0 on failure.
>> + */
>> +static int qtee_register_service(struct qcomtee_object_invoke_ctx *oic,
>> +				 struct qcomtee_object *client_env,
>> +				 const char *service_name,
>> +				 const u32 uid)
>> +{
>> +	struct tee_client_device *qtee_service;
>> +	uuid_t service_uuid;
>> +	int rc;
>> +
>> +	if (!is_qcomtee_service_available(oic, client_env, service_name, uid))
>> +		return -EOPNOTSUPP;
>> +
>> +	tee_generate_uuid_v5(&service_uuid, &qtee_service_uuid_ns, service_name,
>> +			     strlen(service_name));
>> +
>> +	qtee_service = kzalloc_obj(*qtee_service);
>> +	if (!qtee_service)
>> +		return -ENOMEM;
>> +
>> +	qtee_service->dev.bus = &tee_bus_type;
>> +	qtee_service->dev.release = qtee_release_service;
>> +	if (dev_set_name(&qtee_service->dev, "qtee-svc-%pUb", &service_uuid)) {
>> +		kfree(qtee_service);
>> +		return -ENOMEM;
>> +	}
>> +	uuid_copy(&qtee_service->id.uuid, &service_uuid);
>> +
>> +	rc = device_register(&qtee_service->dev);
>> +	if (rc) {
>> +		pr_err("QTEE service registration failed, err: %d\n", rc);
>> +		put_device(&qtee_service->dev);
>> +		return rc;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * qtee_register_services() - Enumerate all the secure services exposed by QTEE
>> + * from the static 'qtee_services' list and register them on the TEE bus as
>> + * TEE client devices.
>> + *
>> + * Not all versions of QTEE support a given service. Hence, we try to
>> + * enumerate as many services from the 'qtee_services' list as possible.
>> + * Not being able to enumerate a service shouldn't cause the driver probe
>> + * to fail since none of the services in the list are mandatory for
>> + * establishing communication with QTEE.
>> + * @ctx: TEE context.
> 
> The doc is a bit unusal. There should be a short description, arguments and the details.
> you details are above the argument.
>

Ack, thanks for spotting will fix. 
>> + */
>> +static void qtee_register_services(struct tee_context *ctx)
>> +{
>> +	u32 idx;
>> +	struct qcomtee_object *client_env;
>> +
>> +	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
>> +		qcomtee_object_invoke_ctx_alloc(ctx, true);
>> +	if (!oic)
>> +		return;
>> +
>> +	client_env = qcomtee_object_get_client_env(oic);
>> +	if (client_env == NULL_QCOMTEE_OBJECT)
>> +		return;
>> +
>> +	for (idx = 0; idx < ARRAY_SIZE(qtee_services); idx++)
>> +		qtee_register_service(oic, client_env,
>> +				      qtee_services[idx].name,
>> +				      qtee_services[idx].uid);
>> +
>> +	qcomtee_object_put(client_env);
>> +}
>> +
>> +static int qtee_unregister_service(struct device *dev, void *data)
>> +{
>> +	if (!strncmp(dev_name(dev), "qtee-svc", strlen("qtee-svc")))
>> +		device_unregister(dev);
>> +
>> +	return 0;
>> +}
>> +
>> +static void qtee_unregister_services(void)
>> +{
>> +	bus_for_each_dev(&tee_bus_type, NULL, NULL,
>> +			 qtee_unregister_service);
>> +}
>> +
>>  static const struct tee_driver_ops qcomtee_ops = {
>>  	.get_version = qcomtee_get_version,
>>  	.open = qcomtee_open,
>> @@ -779,6 +933,8 @@ static int qcomtee_probe(struct platform_device *pdev)
>>  		QTEE_VERSION_GET_MINOR(qcomtee->qtee_version),
>>  		QTEE_VERSION_GET_PATCH(qcomtee->qtee_version));
>>  
>> +	qtee_register_services(qcomtee->ctx);
>> +
>>  	return 0;
>>  
>>  err_dest_wq:
>> @@ -808,6 +964,7 @@ static void qcomtee_remove(struct platform_device *pdev)
>>  {
>>  	struct qcomtee *qcomtee = platform_get_drvdata(pdev);
>>  
>> +	qtee_unregister_services();
>>  	teedev_close_context(qcomtee->ctx);
>>  	/* Wait for RELEASE operations to be processed for QTEE objects. */
>>  	tee_device_unregister(qcomtee->teedev);
>> diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
>> index 60fe3b5776e3..4a523a95bf0e 100644
>> --- a/drivers/tee/qcomtee/core.c
>> +++ b/drivers/tee/qcomtee/core.c
>> @@ -898,19 +898,20 @@ qcomtee_object_get_client_env(struct qcomtee_object_invoke_ctx *oic)
>>  
>>  struct qcomtee_object *
>>  qcomtee_object_get_service(struct qcomtee_object_invoke_ctx *oic,
>> -			   struct qcomtee_object *client_env, u32 uid)
>> +			   struct qcomtee_object *client_env, u32 uid,
>> +			   int *result)
>>  {
>>  	struct qcomtee_arg u[3] = { 0 };
>> -	int ret, result;
>> +	int ret;
>>  
>>  	u[0].b.addr = &uid;
>>  	u[0].b.size = sizeof(uid);
>>  	u[0].type = QCOMTEE_ARG_TYPE_IB;
>>  	u[1].type = QCOMTEE_ARG_TYPE_OO;
>>  	ret = qcomtee_object_do_invoke(oic, client_env, QCOMTEE_CLIENT_ENV_OPEN,
>> -				       u, &result);
>> +				       u, result);
>>  
>> -	if (ret || result)
>> +	if (ret || *result)
>>  		return NULL_QCOMTEE_OBJECT;
>>  
>>  	return u[1].o;
>> diff --git a/drivers/tee/qcomtee/qcomtee.h b/drivers/tee/qcomtee/qcomtee.h
>> index f39bf63fd1c2..66d305a46c0a 100644
>> --- a/drivers/tee/qcomtee/qcomtee.h
>> +++ b/drivers/tee/qcomtee/qcomtee.h
>> @@ -17,6 +17,8 @@
>>  #define QCOMTEE_OBJREF_FLAG_USER	BIT(1)
>>  #define QCOMTEE_OBJREF_FLAG_MEM		BIT(2)
>>  
>> +#define QTEE_UUID_NS_NAME_SIZE	        128
>> +
> 
> This macro seems unused, in the whole series. Drop it.
>

Ack, seems like I missed dropping this when moving from v2->v3.

Regards,
Harshal 
>>  /**
>>   * struct qcomtee - Main service struct.
>>   * @teedev: client device.
>> @@ -39,6 +41,16 @@ struct qcomtee {
>>  	u32 qtee_version;
>>  };
>>  
>> +/**
>> + * struct qtee_service - A secure service exposed by QTEE identified by a 32-bit UID.
>> + * @name: Name of the QTEE service.
>> + * @uid: 32-bit UID used by QTEE to identify the service.
>> + */
>> +struct qtee_service {
>> +	const char *name;
>> +	const u32 uid;
>> +};
>> +
>>  void qcomtee_fetch_async_reqs(struct qcomtee_object_invoke_ctx *oic);
>>  struct qcomtee_object *qcomtee_idx_erase(struct qcomtee_object_invoke_ctx *oic,
>>  					 u32 idx);
>> diff --git a/drivers/tee/qcomtee/qcomtee_msg.h b/drivers/tee/qcomtee/qcomtee_msg.h
>> index 5d7b21fdd368..9278a361dc70 100644
>> --- a/drivers/tee/qcomtee/qcomtee_msg.h
>> +++ b/drivers/tee/qcomtee/qcomtee_msg.h
>> @@ -105,6 +105,7 @@ union qcomtee_msg_arg {
>>  #define QTEE_VERSION_GET_MINOR(x) (((x) >> 12) & 0xffU)
>>  #define QTEE_VERSION_GET_PATCH(x) ((x) >> 0 & 0xfffU)
>>  
>> +#define QCOMTEE_UEFI_SEC_UID            413
>>  /* Response types as returned from qcomtee_object_invoke_ctx_invoke(). */
>>  
>>  /* The message contains a callback request. */
>> diff --git a/drivers/tee/qcomtee/qcomtee_object.h b/drivers/tee/qcomtee/qcomtee_object.h
>> index d3740099fae0..901ba3565a73 100644
>> --- a/drivers/tee/qcomtee/qcomtee_object.h
>> +++ b/drivers/tee/qcomtee/qcomtee_object.h
>> @@ -317,6 +317,7 @@ qcomtee_object_get_client_env(struct qcomtee_object_invoke_ctx *oic);
>>  
>>  struct qcomtee_object *
>>  qcomtee_object_get_service(struct qcomtee_object_invoke_ctx *oic,
>> -			   struct qcomtee_object *client_env, u32 uid);
>> +			   struct qcomtee_object *client_env, u32 uid,
>> +			   int *result);
>>  
>>  #endif /* QCOMTEE_OBJECT_H */
>>
> 

