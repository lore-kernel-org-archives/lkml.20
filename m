Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792986702;
	b=ai7Al8wIJtfkKVVjgZuAPzonsTn1U50Cvne7cw35L7c6ByHOYCAmy6AKbYoP49sGDO8T
	 hZjjWBcRiOE2kudMbEgM7W7rDsbj8i4X2JFHbhWojfyJh8sgFUcvS3k/JS+bgRRBbo7pv
	 tb7ygxrfSCzLjx7PY75DyeA+l7lgQk2XumjyQA7DH5C3sgEI2n4RwNEyQMFwUv/tU4fNT
	 PAavc/YWmW2RFkvBMdgxL9WjPK2CSBLhXZGOHDGA4pQdzCfuDLogRKGUvViL86nvo3KHh
	 lMLqWKrTXooo11PlqhAEo/+kpwx6pg1P6hn0H8CSaAH/BBS4I/WGPQxPA+VHGxyVfeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792986702;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GgSu1Vcs5L81aLqtTFChBhvjr3xSWDWX+uLKUszi5yI=;
	b=uaxfLSJ9Cawu7596yxBdrN2OwXDcnj1l5Ual80re+pXuC4aq9M3sazCnIolx8qqBIbqw
	 R72pUzIFV0k+reWKyTx9e5j0w73GnkQHMJ7CXCsigqtzllOdeJDEANPIbd7DYXdFNHZID
	 Mz4oh6Weji/IfavuwE1MPV5HT2kyouusM882CpNJdOM9rGFjmqVTwXajj2w0xXOo/chgL
	 z3o5P3M85QXB/lCCMeMEObHqwDmP9qhwh7ZICvZ1cXegr2hlFBdqOP343ScexlQXE79II
	 Q9JT2ud+6kH2GCx8rI7eiU1WnIJBuHxKeiKvA7YWs3XFhTfjLAG8R0CR+7GMxRCU8Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EWY+p4vH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uw4jpowa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDE4606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEDE4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EWY+p4vH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uw4jpowa
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q2Kjw51921088
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GgSu1Vcs5L81aLqtTFChBhvjr3xSWDWX+uLKUszi5yI=; b=EWY+p4vHW/8s6DnF
	Szf9bdY/we6MoAnb6h7AtmbcN2ElVkZc84r9t5xDNrYwKi6yDRC6TdhFEBOKYhkw
	zx3e4VbcdRHxCidhRGqYX1yNQqsWHy7aahWwLd565VGamtk2dA6ZDy0Pj0XpuVWA
	VgsZm1z6YGaRrVUasoueWLYzZA2QTxXtY/jyRg41OpixuuqP0nx9pyILQ1mImbSr
	6ikSQQNYHCpnUhujwQZsaO9kvtGjIHPwcDdE5nMntiJJI66+LaVxRyvfnPw9iNPo
	D+LyIHpxIi8QuWKpa7l0dRNF/seiFU2OM+Blx0y8Y0F11lbeFYhKaFqAc/kBLQyQ
	SDD8KQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmrumn1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:51:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ea381ce04fso27828895ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792986700; x=1793591500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GgSu1Vcs5L81aLqtTFChBhvjr3xSWDWX+uLKUszi5yI=;
        b=Uw4jpowaVkrcqqoQhyvLN0ZV4WGwoHq+54g9fw6cp4L4lmoGeQVHwYR5xXTO20buRB
         nrtGYT30zl741OOIdr3gAqahkTL3S0TDAKw3J/f7Vq3Mv9oJ/zBKmIxqqh/zYCYjlFjO
         tfyn8wDjPgCIEqxN9m3MMjII91qaXO9z9wr9gp/E3dQH17yFptbJLczFhKMXDzg3rp41
         2CigH8OTS8ttkQGmSxwVEo/h9a3v3SaO9ThOOT6yCdyZSoyIQrd26Fy2ZIumAlFp2Z7Z
         hEGfskq4C5nPT/z88hgOyRGKMsKSxzgHmzGTDWi3fGZVzZRUwnUh9TJjlw9Ka2iGFnWp
         jKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792986700; x=1793591500;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GgSu1Vcs5L81aLqtTFChBhvjr3xSWDWX+uLKUszi5yI=;
        b=fIkmGpllqwB5eL2owYYA1zXT5laacZao01dEmRnOA3Q2/1L/y53Sm5KfhyliTtXKGR
         pzvAYzu1nMD8DyU02sSD6uMnFU/zxXxtIGs7U35sspaWZ+XqFyljn6btP6C27W0qhrbZ
         Tif6vFSAYQ6O3dlwArVEfnvOD0cB31+91xtLkLTM/XpJX+AvT6A7rBG0giL6JIfVjzTF
         RgN5L70Vac02L4MC773wGJ0NXR3IVQO9CB8zwX5eaTDtebLdpWlHZ6svyj7AhroyP+q9
         WTgsViWUkh22DDmsibIgYt04I+KnC/zBXhhqXDRqH2//uH3+seHOF44ccDQf+IixJotR
         V/mQ==
X-Forwarded-Encrypted: i=1; AKwUvBzl572O2L9Fqd5d5JPbwNjEyykdtE4vpqjfQOVcol09wj1pThvxpOSBuw5fR8tZE5S73SKuFK01S3/EeDM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+1mUubbrOcuSImpGWMcZHI5yOkvSROX+8P1h55JPi/OIuxbdk
	ww521/LeZDvQHgGwp99MOU1tIebf347Vn8SUcda22nxrcG46mEjedCJuJq1OgSaLjX14g5x3lza
	hW+Yh6yglDyuYtVYKni9W3kE9zDwbPENw5we02GlSUIFlh8lTt6gf+45iD1vxECC44Q==
X-Gm-Gg: AYBFou1xjnCSH5Jc8sD8n3QwTVrzJxd63GM+4LoehEVOuvX6cCDUe0O2BCAsWXRERjY
	ng58s/OT5yr9+DkRgsuFPemlHqMOtzV8IXqkc0Vs9FyW+IwfvpGoJpl2s+ayR/1dx87hkus0IHr
	rz7MYDI+OSRAYkZkz/4SBBX1HNpmWAPbTyJoXPOZzJ1/9i32srk7cD6pJJTwNqAFh3okZvUYHTS
	79J61zHn8Ad9ZTeJJYRjPIpSVliBuhilIVS+GWo7L4SbwWuk3bs7XIAapmR0fRILjUArhIGWiPe
	qeEzGVBlmjGjD0pYhqKKeiExaw2HO4uhVIl4uhiF/qsU4a8/WQUlSdgXHOpW56Hcabei2Rmy/rh
	q82Fbznx7tSI4gSiqkAS7bbRxBbtHq8mQ
X-Received: by 2002:a17:903:37c4:b0:2e9:484d:693 with SMTP id d9443c01a7336-2ea9c0c5881mr32450815ad.5.1792986699702;
        Sun, 25 Oct 2026 20:51:39 -0700 (PDT)
X-Received: by 2002:a17:903:37c4:b0:2e9:484d:693 with SMTP id d9443c01a7336-2ea9c0c5881mr32450725ad.5.1792986699230;
        Sun, 25 Oct 2026 20:51:39 -0700 (PDT)
Received: from [192.168.1.86] ([206.83.119.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b121651sm11278175ad.18.2026.10.25.20.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 20:51:38 -0700 (PDT)
Message-ID: <b27834b1-4ed3-4eb1-a8e3-a1239f20ad43@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 14:51:33 +1100
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
Subject: Re: [PATCH v5 5/7] tee: qcomtee: Add support for registering QTEE
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
References: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-0-1460691b35d3@oss.qualcomm.com>
 <20261015-qcom_uefisecapp_migrate_qcomtee-v5-5-1460691b35d3@oss.qualcomm.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-5-1460691b35d3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAxNSBTYWx0ZWRfXwGnY6ibI3JUW
 yU20cCP8V8z7JgYVqCML9Cniji0FkCUFth6Dvn6f2ajPwEGR8Je5tLwixzasa7dfp9RjmnEguAC
 5olTVR7cUncczbadTAuARDUFbJiLODWDZ3HxFZILLq4XgqWLSDYhdYiwkVnNcQRJGKZEb/1Mjrv
 7PBsoDMyjNRivulU4j4OijC1pyzqIzzZ4tX97hyEPFLNhneujZKjy47x66UK+XLAs2uvKZoAKsP
 XbYktVUFUDjtHbIY792pcykJOB2tO1K0xAUYlVS4l0b2zRA7YwkRju5oJbUZdTZjosK+vBbs1gR
 b0UrA5BMqJkTNiUxuV2QbC00MaSYP2WrY7XZfMlLiWfS5JaFLdibcvMkiSPE8dHmfmp0rVRAGre
 BJ8rtH1PRcFdBTZw/boIojE2Ya6ko4R1MNWAytNsZgoy80eE7dqr6feRKb5cp2PrRaM/YcShYXQ
 yYkwvGpQJpQjaObmgTw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAxNSBTYWx0ZWRfXwPzMEMao/0pH
 f6ndR5FNia1n7fU0bkZBRXmN6qWQXNptmKE7eBYMthlVmC6VTa56u4EuiFdt3Ic4ESO0rlRaBEp
 y6b06V5lkFXVjnpkg7UIHmENsge2PyU=
X-Proofpoint-ORIG-GUID: y4ghfQaNFynEPisjgOHUpxDxg017-S4L
X-Authority-Analysis: v=2.4 cv=e+aT2qp/ c=1 sm=1 tr=0 ts=6adece4c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=pnHLkUe0LhHGSDu6DPowAg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=I3J3X--Ozs3p5lJzdqUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: y4ghfQaNFynEPisjgOHUpxDxg017-S4L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260015

Hi Harshal,

On 10/15/2026 10:39 PM, Harshal Dev wrote:
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
>  drivers/tee/qcomtee/call.c           | 160 ++++++++++++++++++++++++++++++++++-
>  drivers/tee/qcomtee/core.c           |   9 +-
>  drivers/tee/qcomtee/qcomtee.h        |  10 +++
>  drivers/tee/qcomtee/qcomtee_msg.h    |   1 +
>  drivers/tee/qcomtee/qcomtee_object.h |   3 +-
>  5 files changed, 176 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
> index c97afaa1b4aa..47d8a4f9a159 100644
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
> @@ -698,6 +702,155 @@ static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
>  	qcomtee_object_put(client_env);
>  }
>  
> +/**
> + * is_qcomtee_service_available() - Check if the QTEE service identified by the UID
> + * is available.
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
> + * TEE client device.
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
> + * qtee_register_services() - Register the secure services exposed by QTEE
> + * as mentioned in 'qtee_services' list.
> + * @ctx: TEE context.
> + *
> + * Not all versions of QTEE support a given service. Hence, we try to
> + * enumerate as many services from the 'qtee_services' list as possible.
> + * Not being able to enumerate a service shouldn't cause the driver probe
> + * to fail since none of the services in the list are mandatory for
> + * establishing communication with QTEE.
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
> @@ -779,6 +932,8 @@ static int qcomtee_probe(struct platform_device *pdev)
>  		QTEE_VERSION_GET_MINOR(qcomtee->qtee_version),
>  		QTEE_VERSION_GET_PATCH(qcomtee->qtee_version));
>  
> +	qtee_register_services(qcomtee->ctx);
> +
>  	return 0;
>  
>  err_dest_wq:
> @@ -808,6 +963,7 @@ static void qcomtee_remove(struct platform_device *pdev)
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

Please initialize *result, otherwise for instance, on mem allocation failure,
qcomtee_object_do_invoke returns with errno. The caller checks the return value + result
and may print garbage.

- Amir

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
> index f39bf63fd1c2..b1fe1d317150 100644
> --- a/drivers/tee/qcomtee/qcomtee.h
> +++ b/drivers/tee/qcomtee/qcomtee.h
> @@ -39,6 +39,16 @@ struct qcomtee {
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
> index a241ab657318..e2f2508aad8f 100644
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

