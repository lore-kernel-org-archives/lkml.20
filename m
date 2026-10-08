Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E24484234
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 23:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791501033; cv=none; b=NPR4AxWcEmEz3CWJuQV1dEMbrDajHKa22TWvhgJmVbTaa5kfbZ8Quv9mIaMDmO52Zg1WCjQcHm4j+X1UC4Ri3oToJIZEpDjyt1Y40ipsU/cFGAg7jgnCOEUbd21uCPeshRYF6lv6R3aG6yiyNDBgR8Bl+gN146F/hoW7+dM0JQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791501033; c=relaxed/simple;
	bh=3JPoUSC2KZfTrEBFZXcobUlut49MAPzO6HJRSmSUFI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hiYp9Or+g48Vr0mOTzlWcv5CUbf8Xy3Efj4VM+ZmGNU8z1W5hjqdZJ4yDYlkwkJ+/bL91KcVsS1YEyNCrOGvljogmJFxqlynf4RCKob+B045ipbA6AFJ5z3Hk+cxuZ7y4Ptg6S4kdC4W9Vvev2YdEF6/ZRHCVQcov4QzMRObMp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SipJQauG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MnEztZO/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SipJQauG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MnEztZO/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698KxvS7921806
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 23:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gSq6/6XQj4OlzZaKrS745qYxJEneJToNIcTrfWhxKIU=; b=SipJQauGRBvUuWV5
	L6+ZVzCDV6B7V9e9dl2SKdn/rt6o9lCtnK5KllBS0naYzeY+QWUskw6ImECe4R4j
	zQgFjCT8T0ICamqGoPV+K01rhiSwZeEehXjXDDaA02tuQEC5ZGeCwR2kIC39N+Yi
	KWie2F5ASFqIXwjwIdRCHhzlu+35vg8BcVvB3ZJBqgx0anTK+SchzgqTkeh030hA
	JhCky7R6TwwKZggr6iBZmPsRCbYFAbQeVeUkFKrF1Pw+leCUndqgPOOYV60xy71G
	2PYxmr9jkyS/D+wMNh5v41WYuLaEdJWB3JhGu6jPTTYSfV9ewMQDt3E+OpK+w4WN
	ahYsbA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxw8yy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 23:10:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a89dd31fdaso2122071a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 16:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791501030; x=1792105830; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gSq6/6XQj4OlzZaKrS745qYxJEneJToNIcTrfWhxKIU=;
        b=MnEztZO/1BBwTmHOolhCPVMRqwCa4ezRneoSMuQewx6ohcApQklsKbgENcBdE5R/gm
         wmQNUFtzhx5L6sDBO+HeY2e9eQ/KD4192HDCXffj4Z7/+oXuslv0Xsl441AwI0I4vKAm
         6I+klL5OmmiA1WE17MSD5eAVJ31p2xejNziw/WX+EOwuigdtSFHlB7CZvpjxbV+iR2Jk
         2xA62QlBXlkRiu4p/sVfgn2bsd0lLtKlH2DKA8/usimWshZdH8v9YrvN3dBlQKLiWlFy
         plRV3kCTZWpv5TvlCKfBWWZC7L07JKtfk2geqknMvLwRVhBAKk3l42R6PxEUP7vbuxiy
         bKGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791501030; x=1792105830;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gSq6/6XQj4OlzZaKrS745qYxJEneJToNIcTrfWhxKIU=;
        b=Kc2bTCzam/KYZ4o3iJV+kuRDlbd0aylOhDDETa7KfGBFU4jYsqtdTrZwofP+IXj7SZ
         gpxKATClkD459Sciw2ObdNx+TOY30az+r7NNYDeLr/WB9aGJMa2mzArK+SIzh97CRI6e
         HWwQs/x8QWIJJbtLUXeKVQaDv16NARWDPVF9uNa6QvF3WY2FWLQxSOHodt59GQUHj5Zt
         wCp4SsgxTlzJbuF2ZBMNiubifXxXKSYLgiunuFUUIsAwQCRq2SXkJZrnBUOvA3V4nfuz
         vlGW4V7nKuTWsvOyQYx0zb1u66xSIxpj4tWCmcoZMbRSNUiWdvCJ3kyQCXkbaz4B7gRn
         dG6g==
X-Forwarded-Encrypted: i=1; AKwUvBzCXA4d2duxKZJgC6ahwi5IiI/q3/PncPgz58rvtnPjURLLoCEiIHe92XeOg1XJJj47Hl/2G6b/J8+HDTo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUTvIZFw8J7th9kbDBphhH8c0LF4fjGrHes0p6hL/QryM8eITp
	WLF+plQevPmo1FwGAR1G1tnXEqp0Cymwsx2fxGxBWKUl9lsHr3LhBL8PrBr+9B5HImIdbMtGRc/
	bE2/IePpG0iY1JCTX258lOxy8XZG9+aAp6fmphj06URT6+hId7Ggz58rcLPm5rceWeDvP3zkYTI
	Sj
X-Gm-Gg: AYBFou3dAmZyvN9Ncnj1ApSU4tertKqCNgks2cZPwSi22NS0vIWU5HQcy2lFFY6MHiS
	mrDslElgHDyqknKTAMCUtjPPprHbKMQqb52MEJftCqz4g/N+qnDqnoEoXqSg/FkT28O7Q7+6qhK
	dbOUnfSxkreFvItaz0R0Z69iSr2Cy+N1MoFn5neLYc/V4tjyrrE+pzkGDY4zr+AWYz98Tyas2ay
	UGXR2mfrG9jISNBvOvVC8edRo28U6RbQji2TR66SBUwD9cH/Jni+uA/To2yN44rTKZYyMYW14qR
	i1jWr0tXMJkTnmtUqV8PvSmTuH/OqjcL+kt8WXrSu4NYUJ3AVqJwPTGaEFa/QdmRyaasnRmnSgE
	G9Xki0/vO9M8AtOsUrPTVkYco0frRC1zo
X-Received: by 2002:a17:90b:4a45:b0:3aa:9a32:504f with SMTP id 98e67ed59e1d1-3ab3a359e32mr241827a91.7.1791501030296;
        Thu, 08 Oct 2026 16:10:30 -0700 (PDT)
X-Received: by 2002:a17:90b:4a45:b0:3aa:9a32:504f with SMTP id 98e67ed59e1d1-3ab3a359e32mr241797a91.7.1791501029663;
        Thu, 08 Oct 2026 16:10:29 -0700 (PDT)
Received: from [192.168.1.86] ([65.181.12.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed0daesm717974a91.5.2026.10.08.16.10.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 16:10:29 -0700 (PDT)
Message-ID: <f9e91a7d-1628-4746-b2e7-03c7b1be11cc@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 10:10:19 +1100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 7/8] tee: optee: bind RPMI services and negotiate
 backend capabilities
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Cc: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org
References: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
 <20261005-rpmi-tee-service-grp-dev-v2-7-72f222e23ec1@oss.qualcomm.com>
 <CAGgiveU+8d-MmPL4n_ADimkrthsE1sU4QHJoBeh==sxLZmdrFw@mail.gmail.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <CAGgiveU+8d-MmPL4n_ADimkrthsE1sU4QHJoBeh==sxLZmdrFw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA5MiBTYWx0ZWRfX1HUK9EEb/oIY
 n64x8YqKVFVaVTbI5BLW3NfrZFA0orXr8hUG2uh6iryH599NqPwmAh1/IF3s6BMqmopdE7tVlRl
 RHCCTw7JRK0UTS9ebAtClrIVGSRP4l2CKXAjdOEp1+Wg4u0LeMfCZc991s5HzGeKDRtETJhmyCv
 uqnCchd882hBTN3mbv166YmYJXiyv8OMjZrQZMAR5DUrD+dgUm8ai1fAoPgv/jbrhs61s/AGCsS
 HHECEEo/5VIrZ/LK56PLdiALUQx8gHwtPbsL+/ptTaULLMf69aB4NxQ7fMCh1RGK+Nf75bSTM+m
 ivWW0aQ/zh4T/etyUHnvd/DI/X83IWIR0A86Js2ZDKusngTKCLIdQiMmkb/uVVJZPqHvnDDpZSC
 ceR+Ezmpb1eD2zymKxyfqes3aNHBAIUkTK/c8MhjPvLojSuCh1xXGCM+kSuuxfxNFD4hQ0wlXFt
 JGT2GeDhr/5N7fY/gYA==
X-Proofpoint-GUID: o3pQ1oaxm-xXpFTNlnAyn9KwVDdb6s_8
X-Authority-Analysis: v=2.4 cv=cMB1IVeN c=1 sm=1 tr=0 ts=6ac822e7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=9v5PfQ1E2GNzj2RibJmqVw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=b14n5p5ovfXgHId7m2sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA5MiBTYWx0ZWRfX8aZHWyyu9H1c
 hzSEtuLoOdovPwsIaKahmbaX4c084YpPAYrmuqrr3XrvxUqigU0RiwPy5SlQ32xlYYLUu40vcC+
 lcNTlNaZBsPoXvZ+dkPPscIogm+hD1E=
X-Proofpoint-ORIG-GUID: o3pQ1oaxm-xXpFTNlnAyn9KwVDdb6s_8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_07,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080092

Hi jens,

On 10/8/2026 7:20 PM, Jens Wiklander wrote:
> Hi Amir,
> 
> On Tue, Oct 6, 2026 at 2:40 AM Amirreza Zarrabi
> <amirreza.zarrabi@oss.qualcomm.com> wrote:
>>
>> Register an RPMI service driver matching the OP-TEE service UUID and
>> integrate it with OP-TEE module initialization and removal.
>>
>> Check the service API version, query the trusted OS revision, and
>> obtain the RPC parameter and logical notification counts. Initialize
>> shared-memory tracking, the call queue, supplicant state and internal
>> context before publishing the client and supplicant TEE devices.
>>
>> Connect the RPMI backend to the common OP-TEE operations and enumerate
>> trusted application devices. Enable in-kernel RPMB routing when the
>> RPMB subsystem is reachable.
>>
>> Add removal and probe failure cleanup for the backend resources.
>>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
>>  drivers/tee/optee/core.c          |  10 +-
>>  drivers/tee/optee/optee_private.h |  21 ++-
>>  drivers/tee/optee/rpmi_abi.c      | 286 ++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 312 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
>> index a52c1f498b99..8a44a25ebc66 100644
>> --- a/drivers/tee/optee/core.c
>> +++ b/drivers/tee/optee/core.c
>> @@ -220,6 +220,7 @@ void optee_remove_common(struct optee *optee)
>>
>>  static int smc_abi_rc;
>>  static int ffa_abi_rc;
>> +static int rpmi_abi_rc;
>>  static bool intf_is_regged;
>>
>>  static int __init optee_core_init(void)
>> @@ -245,14 +246,15 @@ static int __init optee_core_init(void)
>>
>>         smc_abi_rc = optee_smc_abi_register();
>>         ffa_abi_rc = optee_ffa_abi_register();
>> +       rpmi_abi_rc = optee_rpmi_abi_register();
>>
>> -       /* If both failed there's no point with this module */
>> -       if (smc_abi_rc && ffa_abi_rc) {
>> +       /* Keep the module if any supported transport registered successfully. */
>> +       if (smc_abi_rc && ffa_abi_rc && rpmi_abi_rc) {
>>                 if (IS_REACHABLE(CONFIG_RPMB)) {
>>                         rpmb_interface_unregister(&rpmb_class_intf);
>>                         intf_is_regged = false;
>>                 }
>> -               return smc_abi_rc;
>> +               return -EOPNOTSUPP;
>>         }
>>
>>         return 0;
>> @@ -270,6 +272,8 @@ static void __exit optee_core_exit(void)
>>                 optee_smc_abi_unregister();
>>         if (!ffa_abi_rc)
>>                 optee_ffa_abi_unregister();
>> +       if (!rpmi_abi_rc)
>> +               optee_rpmi_abi_unregister();
>>  }
>>  module_exit(optee_core_exit);
>>
>> diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
>> index 2422caf3c883..07c27e322a71 100644
>> --- a/drivers/tee/optee/optee_private.h
>> +++ b/drivers/tee/optee/optee_private.h
>> @@ -188,6 +188,8 @@ struct rpmi_tee_device;
>>   * @rdev: owning RPMI service device
>>   * @shm_rht_lock: protects parcel lookup, insertion, removal and publication
>>   * @shm_rht: lookup by the host-endian parcel ID and nonce pair
>> + * @sec_caps: negotiated optional OPTEE_RPMI_CAP_* features
>> + * @notification_count: negotiated nonzero number of logical notification keys
>>   *
>>   * Callers keep their tee_shm alive while using its registration. Lookup
>>   * returns a raw pointer; the mutex does not protect its lifetime after
>> @@ -199,6 +201,8 @@ struct optee_rpmi {
>>         /* Protects parcel lookup, insertion, removal and publication. */
>>         struct mutex shm_rht_lock;
>>         struct rhashtable shm_rht;
>> +       u32 sec_caps;
>> +       u32 notification_count;
> 
> Why are these two needed?
> 

Neither needs to be retained in the instance state: sec_caps is currently unused,
and notification_count is consumed during probe. I'll remove both fields.
I thought it would be nice to keep them.

>>  };
>>  #endif
>>
>> @@ -211,8 +215,8 @@ struct optee;
>>   * @os_build_id:       OP-TEE OS build identifier (0 if unspecified)
>>   *
>>   * Values come from OPTEE_SMC_CALL_GET_OS_REVISION (SMC ABI) or
>> - * OPTEE_FFA_GET_OS_VERSION (FF-A ABI); this is the trusted OS revision, not an
>> - * FF-A ABI version.
>> + * OPTEE_FFA_GET_OS_VERSION (FF-A ABI) or OPTEE_RPMI_GET_OS_VERSION (RPMI ABI).
>> + * This is the trusted OS revision, not a transport ABI version.
>>   */
>>  struct optee_revision {
>>         u32 os_major;
>> @@ -490,5 +494,18 @@ static inline void optee_ffa_abi_unregister(void)
>>  }
>>  #endif
>>
>> +#if IS_REACHABLE(CONFIG_RISCV_RPMI_TEE_TRANSPORT)
>> +int optee_rpmi_abi_register(void);
>> +void optee_rpmi_abi_unregister(void);
>> +#else
>> +static inline int optee_rpmi_abi_register(void)
>> +{
>> +       return -EOPNOTSUPP;
>> +}
>> +
>> +static inline void optee_rpmi_abi_unregister(void)
>> +{
>> +}
>> +#endif
>>
>>  #endif /*OPTEE_PRIVATE_H*/
>> diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
>> index 6e76316794c1..db541f3de425 100644
>> --- a/drivers/tee/optee/rpmi_abi.c
>> +++ b/drivers/tee/optee/rpmi_abi.c
>> @@ -684,3 +684,289 @@ static int optee_rpmi_do_call_with_arg(struct tee_context *ctx,
>>
>>         return optee_rpmi_yielding_call(ctx, &req, rpc_arg, system_thread);
>>  }
>> +
>> +/* Query and store the trusted OS revision. */
>> +static int optee_rpmi_get_os_version(struct optee *optee)
>> +{
>> +       struct optee_rpmi_probe_req req = {
>> +               .op = cpu_to_le32(OPTEE_RPMI_GET_OS_VERSION),
>> +       };
>> +       struct optee_rpmi_os_resp os;
>> +       int ret;
>> +
>> +       ret = optee_rpmi_call(optee, &req, sizeof(req), &os, sizeof(os));
>> +       if (ret)
>> +               return ret;
>> +
>> +       optee->revision.os_major = get_unaligned_le32(&os.major);
>> +       optee->revision.os_minor = get_unaligned_le32(&os.minor);
>> +       optee->revision.os_build_id = get_unaligned_le64(&os.build_id);
>> +
>> +       if (optee->revision.os_build_id)
>> +               pr_info("revision %u.%u (%016llx)\n",
>> +                       optee->revision.os_major, optee->revision.os_minor,
>> +                       optee->revision.os_build_id);
>> +       else
>> +               pr_info("revision %u.%u\n", optee->revision.os_major,
>> +                       optee->revision.os_minor);
>> +
>> +       return 0;
>> +}
>> +
>> +/* Query and store secure-world capabilities and buffer limits. */
>> +static int optee_rpmi_exchange_caps(struct optee *optee)
>> +{
>> +       struct optee_rpmi_probe_req req = {
>> +               .op = cpu_to_le32(OPTEE_RPMI_EXCHANGE_CAPABILITIES),
>> +       };
>> +       struct optee_rpmi_caps_resp caps;
>> +       u32 rpc_count, sec_caps, notif_count;
>> +       int ret;
>> +
>> +       ret = optee_rpmi_call(optee, &req, sizeof(req), &caps, sizeof(caps));
>> +       if (ret)
>> +               return ret;
>> +
>> +       sec_caps = get_unaligned_le32(&caps.secure_caps);
>> +       rpc_count = get_unaligned_le32(&caps.rpc_param_count);
>> +       notif_count = get_unaligned_le32(&caps.notification_count);
>> +       if (!notif_count || !rpc_count)
>> +               return -EPROTO;
>> +
>> +       optee->rpc_param_count = rpc_count;
>> +       optee->rpmi.sec_caps = sec_caps;
>> +       optee->rpmi.notification_count = notif_count;
>> +       optee->in_kernel_rpmb_routing = IS_REACHABLE(CONFIG_RPMB);
> 
> What if OP-TEE is built without RPMB support?
> 

I discussed this with Sumit, and the intention was to make RPMB probing
part of the baseline for the new ABI rather than negotiate it separately.
I can enable the capability bit if it should remain optional.

>> +
>> +       return 0;
>> +}
>> +
>> +static int optee_rpmi_api_is_compatible(struct optee *optee)
>> +{
>> +       struct optee_rpmi_probe_req req = {
>> +               .op = cpu_to_le32(OPTEE_RPMI_GET_API_VERSION),
>> +       };
>> +       struct optee_rpmi_api_resp api;
>> +       int ret;
>> +
>> +       ret = optee_rpmi_call(optee, &req, sizeof(req), &api, sizeof(api));
>> +       if (ret)
>> +               return ret;
>> +
>> +       if (get_unaligned_le32(&api.major) != OPTEE_RPMI_VERSION_MAJOR)
>> +               return -EPROTONOSUPPORT;
>> +
>> +       /* Version 1.0 has no minimum minor revision beyond zero. */
>> +       return 0;
>> +}
>> +
>> +static void optee_rpmi_get_version(struct tee_device *teedev,
>> +                                  struct tee_ioctl_version_data *vers)
>> +{
>> +       *vers = (struct tee_ioctl_version_data) {
>> +               .impl_id = TEE_IMPL_ID_OPTEE,
>> +               .gen_caps = TEE_GEN_CAP_GP | TEE_GEN_CAP_REG_MEM |
>> +                           TEE_GEN_CAP_MEMREF_NULL,
>> +       };
>> +}
>> +
>> +static int optee_rpmi_open(struct tee_context *ctx)
>> +{
>> +       return optee_open(ctx, true);
>> +}
>> +
>> +static const struct tee_driver_ops optee_rpmi_clnt_ops = {
>> +       .get_version = optee_rpmi_get_version,
>> +       .get_tee_revision = optee_get_revision,
>> +       .open = optee_rpmi_open,
>> +       .release = optee_release,
>> +       .open_session = optee_open_session,
>> +       .close_session = optee_close_session,
>> +       .invoke_func = optee_invoke_func,
>> +       .cancel_req = optee_cancel_req,
>> +       .shm_register = optee_rpmi_shm_register,
>> +       .shm_unregister = optee_rpmi_shm_unregister,
>> +};
>> +
>> +static const struct tee_driver_ops optee_rpmi_supp_ops = {
>> +       .get_version = optee_rpmi_get_version,
>> +       .get_tee_revision = optee_get_revision,
>> +       .open = optee_rpmi_open,
>> +       .release = optee_release_supp,
>> +       .supp_recv = optee_supp_recv,
>> +       .supp_send = optee_supp_send,
>> +       .shm_register = optee_rpmi_shm_register,
>> +       .shm_unregister = optee_rpmi_shm_unregister_supp,
>> +};
>> +
>> +static const struct tee_desc optee_rpmi_clnt_desc = {
>> +       .name = DRIVER_NAME "-rpmi-clnt",
>> +       .ops = &optee_rpmi_clnt_ops,
>> +       .owner = THIS_MODULE,
>> +};
>> +
>> +static const struct tee_desc optee_rpmi_supp_desc = {
>> +       .name = DRIVER_NAME "-rpmi-supp",
>> +       .ops = &optee_rpmi_supp_ops,
>> +       .owner = THIS_MODULE,
>> +       .flags = TEE_DESC_PRIVILEGED,
>> +};
>> +
>> +static const struct optee_ops optee_rpmi_ops = {
>> +       .do_call_with_arg = optee_rpmi_do_call_with_arg,
>> +       .to_msg_param = optee_rpmi_to_msg_param,
>> +       .from_msg_param = optee_rpmi_from_msg_param,
>> +};
>> +
>> +/* Keep callback state and memory tables alive until all TEE users release. */
>> +static void optee_rpmi_remove(struct rpmi_tee_device *rdev)
>> +{
>> +       struct optee *optee = dev_get_drvdata(&rdev->dev);
>> +
>> +       optee_remove_common(optee);
>> +       optee_rpmi_shm_rht_uninit(optee);
>> +       kfree(optee);
>> +}
>> +
>> +static int optee_rpmi_probe(struct rpmi_tee_device *rdev)
>> +{
>> +       struct tee_device *teedev;
>> +       struct tee_context *ctx;
>> +       int ret;
>> +
>> +       struct optee *optee __free(kfree) = kzalloc_obj(*optee);
> 
> The cleanup macros should, if I understand it correctly, not be used
> in functions using gotos for cleanup.

I'll remove all cleanup.h related macros as requested.

> 
>> +       if (!optee)
>> +               return -ENOMEM;
>> +
>> +       optee->rpmi.rdev = rdev;
>> +       optee->ops = &optee_rpmi_ops;
>> +
>> +       ret = optee_rpmi_api_is_compatible(optee);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret = optee_rpmi_get_os_version(optee);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret = optee_rpmi_exchange_caps(optee);
>> +       if (ret)
>> +               return ret;
>> +
>> +       optee->pool = optee_rpmi_shm_pool_alloc();
> 
> Perhaps it's just me, but it seems a bit odd to store an err pointer
> in a struct like this.
> 

Ack.

>> +       if (IS_ERR(optee->pool))
>> +               return PTR_ERR(optee->pool);
>> +
>> +       ret = optee_rpmi_shm_rht_init(optee);
>> +       if (ret)
>> +               goto err_pool;
>> +
>> +       optee_cq_init(&optee->call_queue, 0);
>> +       optee_supp_init(&optee->supp);
>> +       optee_shm_arg_cache_init(optee, OPTEE_SHM_ARG_SHARED);
>> +       mutex_init(&optee->rpmb_dev_mutex);
>> +       INIT_WORK(&optee->rpmb_scan_bus_work, optee_bus_scan_rpmb);
>> +       optee->rpmb_intf.notifier_call = optee_rpmb_intf_rdev;
>> +       ret = optee_notif_init(optee, optee->rpmi.notification_count);
>> +       if (ret)
>> +               goto err_common;
>> +
>> +       /* Allocate all keys, then restrict the inclusive bound to the last key. */
>> +       optee->notif.max_key = optee->rpmi.notification_count - 1;
> 
> Why? Do you have any plans for that?
> 

The comment is misleading; there is no additional restriction intended.
The ABI currently reports a key count, while the common notification code uses an
inclusive maximum key. I'll change the ABI to report the maximum key instead
and remove this adjustment.

Thanks Jens for the review.

Best Regards,
Amir

> Cheers,
> Jens
> 
>> +
>> +       teedev = tee_device_alloc(&optee_rpmi_clnt_desc, &rdev->dev,
>> +                                 optee->pool, optee);
>> +       if (IS_ERR(teedev)) {
>> +               ret = PTR_ERR(teedev);
>> +               goto err_notif;
>> +       }
>> +       optee->teedev = teedev;
>> +
>> +       teedev = tee_device_alloc(&optee_rpmi_supp_desc, &rdev->dev,
>> +                                 optee->pool, optee);
>> +       if (IS_ERR(teedev)) {
>> +               ret = PTR_ERR(teedev);
>> +               goto err_devices;
>> +       }
>> +       optee->supp_teedev = teedev;
>> +
>> +       optee_set_dev_group(optee);
>> +
>> +       /* Internal RPC allocation must be ready before userspace can enter. */
>> +       ctx = teedev_open(optee->teedev);
>> +       if (IS_ERR(ctx)) {
>> +               ret = PTR_ERR(ctx);
>> +               goto err_devices;
>> +       }
>> +
>> +       optee->ctx = ctx;
>> +       dev_set_drvdata(&rdev->dev, optee);
>> +       if (optee->in_kernel_rpmb_routing)
>> +               blocking_notifier_chain_register(&optee_rpmb_intf_added,
>> +                                                &optee->rpmb_intf);
>> +
>> +       ret = tee_device_register(optee->teedev);
>> +       if (ret)
>> +               goto err_initialized;
>> +
>> +       ret = tee_device_register(optee->supp_teedev);
>> +       if (ret)
>> +               goto err_initialized;
>> +
>> +       ret = optee_enumerate_devices(PTA_CMD_GET_DEVICES);
>> +       if (ret)
>> +               goto err_initialized;
>> +
>> +       dev_info(&rdev->dev, "OP-TEE RPMI %u.%u initialized\n",
>> +                optee->revision.os_major, optee->revision.os_minor);
>> +       retain_and_null_ptr(optee);
>> +
>> +       return 0;
>> +
>> +err_initialized:
>> +       /* The remove path owns and frees the published backend state. */
>> +       retain_and_null_ptr(optee);
>> +       optee_rpmi_remove(rdev);
>> +
>> +       return ret;
>> +err_devices:
>> +       tee_device_unregister(optee->supp_teedev);
>> +       tee_device_unregister(optee->teedev);
>> +       optee_shm_arg_cache_uninit(optee);
>> +err_notif:
>> +       optee_notif_uninit(optee);
>> +err_common:
>> +       optee_supp_uninit(&optee->supp);
>> +       mutex_destroy(&optee->call_queue.mutex);
>> +       rpmb_dev_put(optee->rpmb_dev);
>> +       mutex_destroy(&optee->rpmb_dev_mutex);
>> +       optee_rpmi_shm_rht_uninit(optee);
>> +err_pool:
>> +       tee_shm_pool_free(optee->pool);
>> +
>> +       return ret;
>> +}
>> +
>> +static const struct rpmi_tee_device_id optee_rpmi_device_ids[] = {
>> +       { OPTEE_RPMI_SERVICE_UUID },
>> +       {}
>> +};
>> +
>> +static struct rpmi_tee_driver optee_rpmi_driver = {
>> +       .name = DRIVER_NAME "-rpmi",
>> +       .probe = optee_rpmi_probe,
>> +       .remove = optee_rpmi_remove,
>> +       .id_table = optee_rpmi_device_ids,
>> +};
>> +
>> +int optee_rpmi_abi_register(void)
>> +{
>> +       return rpmi_tee_register(&optee_rpmi_driver);
>> +}
>> +
>> +void optee_rpmi_abi_unregister(void)
>> +{
>> +       rpmi_tee_unregister(&optee_rpmi_driver);
>> +}
>> +
>> +MODULE_ALIAS("rpmi_tee:486178e0-e7f8-11e3-bc5e-0002a5d5c51b");
>>
>> --
>> 2.34.1
>>

