Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0EE1A6817
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 05:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791177054; cv=none; b=mCWjlhj7pIo60Y2OzCRQiYa6r/rbbcUwwu3X2ZGkk8MxDidqw7E59NkmIArdPhUm5aW42nMYjVm8LBdzrWImiashxmNIWdMMFl/JWqJzbLJ+7k5gcKtyGezgMq8Kmw17ifzsdjymh42U2VGq7LJUzknAuSbXoqSMmSSbkYBIjTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791177054; c=relaxed/simple;
	bh=42ISicUAttK6kM7BrqX1I4+gcA5V3GTtxJBAfR/tRWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uCHf2MxGLWYpmmC+36MJCmiHS4z8bNhtcdCdWOO2DJ6I3XthzpTc/OWJp68XbwdKrjz7mXJREr2FwpQuvMM2PBVc5dS9bx7WmBrteB6LpHK5ssi8KtWHKKmSUgni/9DOpcW32AkU/p0OoC6LQ5VxS/igaJ6g4zC8oLD6AZy6edY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UW/yFvrW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h6jfPLdS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UW/yFvrW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h6jfPLdS"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695104BU3838476
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 05:10:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/7b8lwrUrpdTVDC7N3Q94jn5MLhLuqARhWteZfrlC+w=; b=UW/yFvrWS7kjtl9D
	8fpGEuAkcqvaZAHCAq0Owa2/9mZHaxUCj6Km5eZRVmqFIy0Lw0wkhKgQbZ+xPE6W
	d5vgxMMRm9Ub1JvbxIrhtURyPHMcDWwMU8ae0sqQ9E+y6IcKCzS0PCoDHIMyi5tr
	P/3/T/xh5RaDkQ/dxgHFTQC2QR0MVWmMLa1Vywj5HndBJUFNyYTZRawL7fVvmRDj
	kq7CYCSmZGsxPcWLVa8Qq9D1VBlissIF9Z8qmNrbtxpDkSbG8kL8S5z6Ewike928
	v3oJcbdcpXsfcxNw2+bW2SWLSoFzMhtOUzuud0YMzPwwGVlcDF2k4eqIqtVJIqUA
	RCBvnA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2u08mdu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 05:10:51 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e4ade8670dso19354965ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 22:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791177051; x=1791781851; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/7b8lwrUrpdTVDC7N3Q94jn5MLhLuqARhWteZfrlC+w=;
        b=h6jfPLdSyIUp/oa3KCVZtM0N3V5x1J4gt3DKubEY5gNwAtfRmuqKQPF+dp3Pc0eE61
         nhMwqlAmB4yDSScb2Et3UmrldvaJ13843/09V60R3hg6EiDJ7b3c3aRonR3QZJj6mAG1
         M3j2DHNd8XQz6LKf05EDFB6m/AGOhysJYzVodIhbWSB/Xu35CND5BWAxdVwYBjexQOKM
         HytywI0xjgds6mc2R9YpotXi5a721L1/M1bqmgteU6WGx19hEolZ5e6/A9LIvQOMsrR3
         nWBvkTYzGDz4Tf9U84OC9ASsBa+jG4Mhbd7Y+C5tylNfJEB8Y34vdBUUql4rBbJTNdbW
         Netw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791177051; x=1791781851;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/7b8lwrUrpdTVDC7N3Q94jn5MLhLuqARhWteZfrlC+w=;
        b=Z/6eLb+qQnmGEGBC06jG5iijBShHH3eaY/GGIfqxxkzH+H9Vgd6gbM63m4/uYd9x9f
         E9AbRbHNQ9ka1QGCEHRoWBaCpcMJP3zlCbtUD8ffPeaULRF+8XSjDeECfgc4KizXKHAi
         PXTX2oxRX4nptK7cSWIYi5mj6fEzkekZCDOPapavN6HO6VNHz30XceTNrPNhOaz1gY93
         z0hUBe/ijckW+il/0EDfdah3OBHjgM3DuiKsoBZj5MTEkA2Vp4via0fTQ8UucsANKPE9
         Qcu0BKP53bTZQaroOD6V4wqS81bjb07+wQTCi5lLpO1U5L952NfsBeHA2lQkrHN0G9Bq
         NJYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtyqKNAn7TlVlN3exmeEFx1oy4UQhiiAOE4O+QMAw+mY+ERBc3wV0GIvFEOJ34TdZCz43w68DwVKqt9bQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJh6DIEdZq9swHk0c/q9p0wdBIqpNht2K+RHVVZmmLly09m2pkP
	SvZ5g6MKO8Z9kn2FJGNCFnsUKJxVg6SHq3rcGIb76w7oC0GHvprMgRQ+7RpaC60BKL+7bMrcz7k
	OdbxXFg8sFaMxJRjXzaI3lj8rcsyuN6YcyTsoH/hAZoWFk3Os8Y/l+Ro3LmJO9UkBbQc=
X-Gm-Gg: AYBFou2gvuGRtCA8PvNMc4YgsjDZE2i4KvMoDOIuO0LlPwcFncWXaGj3TaGxVPKlPzc
	t7uuQtGRXwkmRU4+PUM5ze3rDggWTh9UxvLJ0wOyU9ddkbqWNDaYVvakaoh80BmRPIz4HDF2pgK
	9Wytyp+nekAAXOtVe51H7UUk2wl+b9qUCVfaHnhK6LoUjAvIUgn/t9GQz0bsLNWqWjUOm7BbouU
	6dRPA/D3j2tZ1oLvYBP2SpPxB6BQe7UMku/THnZTS8lIL1Gm/AHfbtzaerjAQI8+fjcUf3eik8X
	LVmBlB5TKv7RehcPZ++p6Vo8ndySlpc+668H9pL+qGEknoRNJU/eRvIGKPR5rOQo8gaGdH/5SS2
	LsikYycIMVbJnBKJ3icvGk55DlA==
X-Received: by 2002:a17:903:1cd:b0:2e2:e6f1:5e10 with SMTP id d9443c01a7336-2e49a10450emr83557195ad.4.1791177050884;
        Sun, 04 Oct 2026 22:10:50 -0700 (PDT)
X-Received: by 2002:a17:903:1cd:b0:2e2:e6f1:5e10 with SMTP id d9443c01a7336-2e49a10450emr83556935ad.4.1791177050236;
        Sun, 04 Oct 2026 22:10:50 -0700 (PDT)
Received: from [10.218.26.96] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5edb5absm1902835ad.55.2026.10.04.22.10.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 22:10:49 -0700 (PDT)
Message-ID: <95d0aaef-7a7a-48d4-8e07-a53bb4bac56c@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 10:40:44 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] tee: qcomtee: Add support for registering QTEE
 services on TEE bus
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261001-qcom_uefisecapp_migrate_qcomtee-v3-0-13df5c20c2e3@oss.qualcomm.com>
 <20261001-qcom_uefisecapp_migrate_qcomtee-v3-5-13df5c20c2e3@oss.qualcomm.com>
 <ar5YpkQrkxbjVjAz@sumit-xelite>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <ar5YpkQrkxbjVjAz@sumit-xelite>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1Y6yPy-S6zkk4Fc6pPVBbrnHhyU7kNNt
X-Proofpoint-GUID: 1Y6yPy-S6zkk4Fc6pPVBbrnHhyU7kNNt
X-Authority-Analysis: v=2.4 cv=JqlkP84C c=1 sm=1 tr=0 ts=6ac3315b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=hm9Fq86tRsH7fTJdEsMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyMCBTYWx0ZWRfX4o/OawqT/MD5
 xSRHmkyTWILnGHqlA/W5d3AVHEt/PP6qXDPzHeuzInxg/Ffny1olD9j3KqjXM1yPSgZx7cnqzqJ
 4knZFBHWM1n5PGk1NW/3EJpyLHKqFzg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyMCBTYWx0ZWRfX7VJWVmF8XFQN
 CuHi7GVe1+vWCRzjHsv8EGFBMO1StJE+QxtPcPubZrk8Ix2AkACQy2L0POmFnCvyGoya6yq7iB6
 n/RxkFybLqVOH/YiS2NQZYC7cZo7tZQAP2IiQlQuzKcpA/kWGO4LKiLzbOhJYscO76Yw4r2QmH8
 FOE9G9JstT5ydJpBRgFe4c4hIoJJTLYEGJaUnNMp1SZVe1a1Cq5mwtQQPgkYW9JlVHR5EBp2B0e
 rrZeglH6thB4VF5bGncrjRiq2FuKdM43dqZpD2pKvpyJ/f3c5FFhoN9v4YGxvLZgtQZrZp9Obwt
 FZjsqa32hKl6mmzi3C5VX6gtqjYvNT97s4+tMSyi3LwtzZqVmuaXO11Q2gbRRkq5wlSroY/8TmZ
 rHGSsh7Ys5TC2ZKb0Rf3Hwg2jX7HKBM4f6nbEeS9bFQyCbsP8lNC9mrNR9fo7T4TdVUojWa9PNz
 rv/cUct67rUfPCLtRug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050020

Hi Sumit,

On 01-10-2026 06:27 pm, Sumit Garg wrote:
> On Thu, 01 Oct 2026 at 16:32:37 +0530, Harshal Dev wrote:
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
>> drivers/tee/qcomtee/call.c           | 161 ++++++++++++++++++++++++++++++++++-
>> drivers/tee/qcomtee/core.c           |   9 +-
>> drivers/tee/qcomtee/qcomtee.h        |  12 +++
>> drivers/tee/qcomtee/qcomtee_msg.h    |   1 +
>> drivers/tee/qcomtee/qcomtee_object.h |   3 +-
>> 5 files changed, 179 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
>> index b361d9c04de0..8fadb7b13e61 100644
>> --- a/drivers/tee/qcomtee/call.c
>> +++ b/drivers/tee/qcomtee/call.c
>> @@ -675,9 +675,13 @@ static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
>>
>>     /* Get ''FeatureVersions Service'' object. */
>>     service = qcomtee_object_get_service(oic, client_env,
>> -                         QCOMTEE_FEATURE_VER_UID);
>> -    if (service == NULL_QCOMTEE_OBJECT)
>> +                         QCOMTEE_FEATURE_VER_UID,
>> +                         &result);
>> +    if (service == NULL_QCOMTEE_OBJECT) {
>> +        if (result)
>> +            pr_err("FeatureVersions Service unavailable (%d)\n", result);
> 
> Do we really want to error out if a service isn't available? Is it
> really the case that every QTEE firmware will implement each service?
>

We must error out here, otherwise we would try to query the feature identified
by 'id' by invoking a NULL object below.

Not every QTEE firmware version will implement the 'FeatureVersion' service. But
this function, which is called during probe to print the QTEE version depends on
this service being available.
 
>>         goto out_failed;
>> +    }
>>
>>     /* IB: Feature to query. */
>>     u[0].b.addr = &id;
>> @@ -697,6 +701,156 @@ static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
>>     qcomtee_object_put(client_env);
>> }
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
>> +                     struct qcomtee_object *client_env,
>> +                     const char *service_name, u32 uid)
>> +{
>> +    struct qcomtee_object *service;
>> +    int error = 0;
>> +    bool ret = false;
>> +
>> +    /* Get service object corresponding to the uid. */
>> +    service = qcomtee_object_get_service(oic, client_env, uid, &error);
>> +    if (service != NULL_QCOMTEE_OBJECT) {
>> +        qcomtee_object_put(service);
>> +        ret = true;
>> +    }
>> +
>> +    /* When we fail to get the service, QTEE provides the reason. */
>> +    if (error)
>> +        pr_err("%s is unavailable (%d)\n", service_name, error);
> 
> Ditto here, rather convert this into a debug message.
>

Ack, I will convert this to a debug message since some services might not
be available for a particular QTEE version. 
>> +
>> +    return ret;
>> +}
>> +
>> +/*
>> + * QTEE Service UUID name space identifier
>> + *
>> + * A random UUID that is allocated as a name space identifier for forming UUID's
>> + * representing secure services exposed by QTEE.
>> + */
>> +static const uuid_t qtee_service_uuid_ns = UUID_INIT(0xe1b48857, 0x6154, 0x49f9,
>> +                             0x93, 0x4e, 0xa2, 0xf2,
>> +                             0x0a, 0xba, 0x98, 0x42);
>> +
>> +static const struct qtee_service qtee_services[] = {
>> +    { "qcom.tz.uefisecapp",
>> +       QCOMTEE_UEFI_SEC_UID }
>> +};
>> +
>> +static void qtee_release_service(struct device *dev)
>> +{
>> +    struct tee_client_device *qtee_service = to_tee_client_device(dev);
>> +
>> +    kfree(qtee_service);
>> +}
>> +
>> +/**
>> + * qtee_enumerate_service() - Enumerate a given QTEE service and register
>> + * it on the TEE bus as a TEE client device
>> + * @oic: context to use for the current invocation.
>> + * @client_env: Client environment object.
>> + * @service_name: Name of the QTEE service to be enumerated.
>> + * @uid: 32-bit UID used by QTEE to identify the service.
>> + *
>> + * Returns 0 on success and < 0 on failure.
>> + */
>> +static int qtee_enumerate_service(struct qcomtee_object_invoke_ctx *oic,
>> +                  struct qcomtee_object *client_env,
>> +                  const char *service_name,
>> +                  const u32 uid)
>> +{
>> +    struct tee_client_device *qtee_service;
>> +    uuid_t service_uuid;
>> +    int rc;
>> +
>> +    if (!is_qcomtee_service_available(oic, client_env, service_name, uid))
>> +        return -EOPNOTSUPP;
>> +
>> +    tee_generate_uuid_v5(&service_uuid, &qtee_service_uuid_ns, service_name,
>> +                 strlen(service_name));
>> +
>> +    qtee_service = kzalloc_obj(*qtee_service);
>> +    if (!qtee_service)
>> +        return -ENOMEM;
>> +
>> +    qtee_service->dev.bus = &tee_bus_type;
>> +    qtee_service->dev.release = qtee_release_service;
>> +    if (dev_set_name(&qtee_service->dev, "qtee-svc-%pUb", &service_uuid)) {
>> +        kfree(qtee_service);
>> +        return -ENOMEM;
>> +    }
>> +    uuid_copy(&qtee_service->id.uuid, &service_uuid);
>> +
>> +    rc = device_register(&qtee_service->dev);
>> +    if (rc) {
>> +        pr_err("QTEE service registration failed, err: %d\n", rc);
>> +        put_device(&qtee_service->dev);
>> +        return rc;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +/**
>> + * qtee_enumerate_services() - Enumerate all the secure services exposed by QTEE
>> + * from the static 'qtee_services' list and register them on the TEE bus as
>> + * TEE client devices.
>> + *
>> + * Not all versions of QTEE support a given service. Hence, we try to
>> + * enumerate as many services from the 'qtee_services' list as possible.
>> + * Not being able to enumerate a service shouldn't cause the driver probe
>> + * to fail since none of the services in the list are mandatory for
>> + * establishing communication with QTEE.
>> + * @ctx: TEE context.
>> + */
>> +static void qtee_enumerate_services(struct tee_context *ctx)
>> +{
>> +    u32 idx;
>> +    struct qcomtee_object *client_env;
>> +
>> +    struct qcomtee_object_invoke_ctx *oic __free(kfree) =
>> +        qcomtee_object_invoke_ctx_alloc(ctx, true);
>> +    if (!oic)
>> +        return;
>> +
>> +    client_env = qcomtee_object_get_client_env(oic);
>> +    if (client_env == NULL_QCOMTEE_OBJECT)
>> +        return;
>> +
>> +    for (idx = 0; idx < ARRAY_SIZE(qtee_services); idx++)
>> +        qtee_enumerate_service(oic, client_env,
>> +                       qtee_services[idx].name,
>> +                       qtee_services[idx].uid);
>> +
>> +    qcomtee_object_put(client_env);
>> +}
>> +
>> +static int qtee_unregister_service(struct device *dev, void *data)
>> +{
>> +    if (!strncmp(dev_name(dev), "qtee-svc", strlen("qtee-svc")))
>> +        device_unregister(dev);
>> +
>> +    return 0;
>> +}
>> +
>> +static void qtee_unregister_services(void)
>> +{
>> +    bus_for_each_dev(&tee_bus_type, NULL, NULL,
>> +             qtee_unregister_service);
>> +}
>> +
>> static const struct tee_driver_ops qcomtee_ops = {
>>     .get_version = qcomtee_get_version,
>>     .open = qcomtee_open,
>> @@ -778,6 +932,8 @@ static int qcomtee_probe(struct platform_device *pdev)
>>         QTEE_VERSION_GET_MINOR(qcomtee->qtee_version),
>>         QTEE_VERSION_GET_PATCH(qcomtee->qtee_version));
>>
>> +    qtee_enumerate_services(qcomtee->ctx);
> 
> Rather call it qtee_register_services() matching it's counterpart below.
>

Ack, will re-name.

Regards,
Harshal 
> -Sumit
> 
>> +
>>     return 0;
>>
>> err_dest_wq:
>> @@ -807,6 +963,7 @@ static void qcomtee_remove(struct platform_device *pdev)
>> {
>>     struct qcomtee *qcomtee = platform_get_drvdata(pdev);
>>
>> +    qtee_unregister_services();
>>     teedev_close_context(qcomtee->ctx);
>>     /* Wait for RELEASE operations to be processed for QTEE objects. */
>>     tee_device_unregister(qcomtee->teedev);
>> diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
>> index 60fe3b5776e3..4a523a95bf0e 100644
>> --- a/drivers/tee/qcomtee/core.c
>> +++ b/drivers/tee/qcomtee/core.c
>> @@ -898,19 +898,20 @@ qcomtee_object_get_client_env(struct qcomtee_object_invoke_ctx *oic)
>>
>> struct qcomtee_object *
>> qcomtee_object_get_service(struct qcomtee_object_invoke_ctx *oic,
>> -               struct qcomtee_object *client_env, u32 uid)
>> +               struct qcomtee_object *client_env, u32 uid,
>> +               int *result)
>> {
>>     struct qcomtee_arg u[3] = { 0 };
>> -    int ret, result;
>> +    int ret;
>>
>>     u[0].b.addr = &uid;
>>     u[0].b.size = sizeof(uid);
>>     u[0].type = QCOMTEE_ARG_TYPE_IB;
>>     u[1].type = QCOMTEE_ARG_TYPE_OO;
>>     ret = qcomtee_object_do_invoke(oic, client_env, QCOMTEE_CLIENT_ENV_OPEN,
>> -                       u, &result);
>> +                       u, result);
>>
>> -    if (ret || result)
>> +    if (ret || *result)
>>         return NULL_QCOMTEE_OBJECT;
>>
>>     return u[1].o;
>> diff --git a/drivers/tee/qcomtee/qcomtee.h b/drivers/tee/qcomtee/qcomtee.h
>> index f39bf63fd1c2..66d305a46c0a 100644
>> --- a/drivers/tee/qcomtee/qcomtee.h
>> +++ b/drivers/tee/qcomtee/qcomtee.h
>> @@ -17,6 +17,8 @@
>> #define QCOMTEE_OBJREF_FLAG_USER    BIT(1)
>> #define QCOMTEE_OBJREF_FLAG_MEM        BIT(2)
>>
>> +#define QTEE_UUID_NS_NAME_SIZE            128
>> +
>> /**
>>  * struct qcomtee - Main service struct.
>>  * @teedev: client device.
>> @@ -39,6 +41,16 @@ struct qcomtee {
>>     u32 qtee_version;
>> };
>>
>> +/**
>> + * struct qtee_service - A secure service exposed by QTEE identified by a 32-bit UID.
>> + * @name: Name of the QTEE service.
>> + * @uid: 32-bit UID used by QTEE to identify the service.
>> + */
>> +struct qtee_service {
>> +    const char *name;
>> +    const u32 uid;
>> +};
>> +
>> void qcomtee_fetch_async_reqs(struct qcomtee_object_invoke_ctx *oic);
>> struct qcomtee_object *qcomtee_idx_erase(struct qcomtee_object_invoke_ctx *oic,
>>                      u32 idx);
>> diff --git a/drivers/tee/qcomtee/qcomtee_msg.h b/drivers/tee/qcomtee/qcomtee_msg.h
>> index 5d7b21fdd368..9278a361dc70 100644
>> --- a/drivers/tee/qcomtee/qcomtee_msg.h
>> +++ b/drivers/tee/qcomtee/qcomtee_msg.h
>> @@ -105,6 +105,7 @@ union qcomtee_msg_arg {
>> #define QTEE_VERSION_GET_MINOR(x) (((x) >> 12) & 0xffU)
>> #define QTEE_VERSION_GET_PATCH(x) ((x) >> 0 & 0xfffU)
>>
>> +#define QCOMTEE_UEFI_SEC_UID            413
>> /* Response types as returned from qcomtee_object_invoke_ctx_invoke(). */
>>
>> /* The message contains a callback request. */
>> diff --git a/drivers/tee/qcomtee/qcomtee_object.h b/drivers/tee/qcomtee/qcomtee_object.h
>> index d3740099fae0..901ba3565a73 100644
>> --- a/drivers/tee/qcomtee/qcomtee_object.h
>> +++ b/drivers/tee/qcomtee/qcomtee_object.h
>> @@ -317,6 +317,7 @@ qcomtee_object_get_client_env(struct qcomtee_object_invoke_ctx *oic);
>>
>> struct qcomtee_object *
>> qcomtee_object_get_service(struct qcomtee_object_invoke_ctx *oic,
>> -               struct qcomtee_object *client_env, u32 uid);
>> +               struct qcomtee_object *client_env, u32 uid,
>> +               int *result);
>>
>> #endif /* QCOMTEE_OBJECT_H */
>>
>> -- 
>> 2.34.1
>>

