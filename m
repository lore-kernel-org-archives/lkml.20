Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09933BFE4C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 22:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791500177; cv=none; b=r4ErDF1g9QxYWQOB1NZH5ra0p6qcsq6uG962mG+L4jsJJowDKxCO6OQXxAafvYgR7JVw/zpKcPZgvtkgAqIMW/8drlIvwRgG9xyjJ8x3pvi1OTcHCA82cgys+1M70nGa/zOuFzYtCG0bIQwyX91u38cVxjLO0G9DLy8FbhBo+Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791500177; c=relaxed/simple;
	bh=UeprysSFUyVE4ZYPJKXJLTjE00xRDklP/Q4e0L7Tt7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RKwtRKcQabWD1L/eTSZOIHCVK29niZ9m4mA/HCyfthWlJ6/kETq9yADZHfV6RR/Puwyj/4oay+Jw+65jl000SXzG7H4YTtjedSkHFw+///hQHCnY4Sm++vh4F9r99VYyTS0e8Yt7UB3+ZIcSWpQbWH21DaTZtYoI3zNdMfVdS1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VjcnveP7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I03x3jaO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VjcnveP7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I03x3jaO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698KxoUv3151546
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 22:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x1R3a3lX7xBG1rH21ZiJOz8wd4EF5DgZhVhNu/UOfns=; b=VjcnveP7FcU+lCYS
	Ba/x4qVGtl4f31sLb2fJW9V93vtlaj1jvzXL0GZ60xmRCglZHFQWydv+f95h84j/
	h0fSeuKGvt3SdUE1GRItOYaLsRjsiUrvbdBSn7yOVT7WIl9Ck2vCeK39JV/fmhgk
	f6A1PDe4cvLV97WX9v6QYldbSRF8LkehVPwDZw7QOV7uIMTOQcVL2qgFjEHmr/Ze
	GtH8y9R1W2D6VqBck9isC7qpTqpsQCeICJcUJKoJWg4UeTl3Yq7JBlhFhh3NiBDi
	OeX4nAfMv3Npv+E2OuZNmBKoDPj5E0JhZydE/n/N878MUKtq3oDL8ClFO6E0rOnk
	JMyvDg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxk0y2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 22:56:15 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc7d2ff0087so4534276a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 15:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791500174; x=1792104974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x1R3a3lX7xBG1rH21ZiJOz8wd4EF5DgZhVhNu/UOfns=;
        b=I03x3jaObcrrTFsyISzVHauh34wLJe2tIzcpICXz9lu0PUsqN3HSu0AgjOZ7pw5G1w
         sjIfOYIZDYRZnMcktiifbsfkZe7oSfTX+eqp7YC9c4a0WMu5jUC+cgD/9wyy52s1+oC8
         sCOe1gn1KDLoOA9CDZdbXy+D1USVEBiiJYU6P0EewARSU091MvCLx6oueyo7AAcdhK0a
         oHWod0/NXTdprQvNRcgVoEleNDX1r2OFX48tWQlu8yTaMowqnNmQ3LZt6vjFor/bFQkk
         6ljjlP72eYHzVZpe3KXPXeph8qtX+WCjNp0hIiXrzhabuxQNHqjxauRyoaXgRXLZsgW+
         jcMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791500174; x=1792104974;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x1R3a3lX7xBG1rH21ZiJOz8wd4EF5DgZhVhNu/UOfns=;
        b=0XkcVp4lw/RGjAg8f9s9G4zv3WN3dLyeL9n88GAOBkge2cMupC4Dz/fpLf8RrL37N6
         REJOioEWO1lBFVygBGV0icqcIYyt+XKa5oBbuayfc8ois6gps3yDhzBhT15XysX+LbLS
         34ethHsHs5QpHUyEJQzTQM0U9IzE2rhUmu3ksnx1vfUrywafXvsUmRkXQXwTnQQ1oCpJ
         6lLG25pFCy3m4HxSLH1KFuzL3PbY2Y+avCUmTRNwezHn1eRDHionxlSVYL75YpeY79n8
         1Z9o3/DvwPIL/B2KeYqSX1O5DXvxfviEy6zr9e4bBJfzR78xEnZN8yIrXRwldMQAHjmT
         5Rnw==
X-Forwarded-Encrypted: i=1; AKwUvByfi2r6mdpQo0Yd6us/k99LhGTztXc4jUONaS1pVG+xPqhjWO5tEzYuzbiF/qsKqV6j4zL35usCjiIUU8I=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxcQ44sgBbNBCVTar9IRgz2OCHrtij8uigrBvxY+EkoLZGU707
	r/oDS33mvlDTQzohqkJ9E9QHhkb587lnt+oQPZBvfXdve/sN0H/MwcfEdrQLExEshBZLlOUz/rK
	kPeyer/mzLsWxWLNrvbA2Zw12GsBiwJXH6KT6RUsB8QKrE3or2GrNlancfse/0DzZ9g==
X-Gm-Gg: AYBFou2xOmNcWmTIoLdEnDJwfIvTuTQwefcHB5NsW/F11Fc5UzlUn9KOfc9Z4Z2M7hU
	lXmrHiRMlGeQmQZUZ5S4YxJ3dgXJoxn1qyIAYKQkTIWnmIGpJP4kfikfbNrEA0+OzhGxDVG/b/d
	26AuEQV9U9dZv1/ZR8IhUvaKXHyRiymjGMI/ug6ciebP4tiALErmswaDCqUuSY89Zx1I7M/xWrB
	Z6wWHC6WQTBFff5w7H592PxEbGdigBB0MCCs7tCz5EMkTEjgNPDlxJS40cT/8pl6EC/avYXv401
	vLDZg+OFeH/7VD46rqaSwt0gmVwzrX9nsbatiUi6naY1eZDDTJVcPbqosoVBUIoov0uNu27aZn9
	eHbojwZz53gvktFe0vfkgM6GA7GFTHgHZ
X-Received: by 2002:a17:90b:3b48:b0:3a4:dc2c:be9e with SMTP id 98e67ed59e1d1-3ab3a8d5755mr217299a91.51.1791500174396;
        Thu, 08 Oct 2026 15:56:14 -0700 (PDT)
X-Received: by 2002:a17:90b:3b48:b0:3a4:dc2c:be9e with SMTP id 98e67ed59e1d1-3ab3a8d5755mr217285a91.51.1791500173870;
        Thu, 08 Oct 2026 15:56:13 -0700 (PDT)
Received: from [192.168.1.86] ([65.181.12.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38ddac6dsm549161a91.7.2026.10.08.15.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 15:56:13 -0700 (PDT)
Message-ID: <f5682a0f-a0bf-46f2-a238-faeb1333c071@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 09:56:04 +1100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 6/8] tee: optee: execute yielding RPMI calls
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
 <20261005-rpmi-tee-service-grp-dev-v2-6-72f222e23ec1@oss.qualcomm.com>
 <CAGgiveUzBk0Na13cqPRnQw8y2XdQ9LLktFK5eaJLTMiQZJPc_w@mail.gmail.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <CAGgiveUzBk0Na13cqPRnQw8y2XdQ9LLktFK5eaJLTMiQZJPc_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fKesTpae c=1 sm=1 tr=0 ts=6ac81f8f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=9v5PfQ1E2GNzj2RibJmqVw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=AUF5Mc4sii5JqdCOvnQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: hdkOJUV-vV-Cft2ptYcqIyzTQUVEqzG-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA5MSBTYWx0ZWRfX9jYSdeYMtqAz
 /cFBNNhNQV3PUvl2orSQMDN+5DUR1i/qNXKVG3JZX+sVh+DsDfj5hC71B55v9q//coqFo0qVC4v
 WxZ5uJdOU9fh6rAVlzO0F8FxuPNCfqg=
X-Proofpoint-ORIG-GUID: hdkOJUV-vV-Cft2ptYcqIyzTQUVEqzG-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA5MSBTYWx0ZWRfX5OSGVBDlNhcv
 3uBMWAt9Gc/CXxjtqz+WhWOqmx745QjU2HRyf7FzBOwjqKQ6VvIBf6O0/JrisA11FAqYS5hSv9L
 uNAG1RG/ls0jNcmQA7SDGaa4daRnD/lOhik9I69qp+Pk07eSRWN8DwtDDR3o8Qj2qYeNGi/Uzzq
 XGqGrDqgLCqZxrBOe9bzCNZdHU7FjfTCxClUxP+FW+fGOFk4UuqdK5ulrjQ9+rEQ4SVh9SpHg4q
 CrxKNLNgy/0/IjRimqg4MTDehw3naLc0YYtr9a+KoTKIrJYFu29wAkmruAuQ5uFSQ+vPYLqznKl
 XCCWbKDuo76t7atTWWAjGuDUqBQWPpYRnAlcTgA/KhxcsfwSC6KIQY+aQ9uIS5VB9NLQKS3+jWN
 xgOJ2WD0+Sp53Hod/BKyce2dpZPMkXy0euGxIyg5VH+jkHbnd96HWbQEIFIJMS1QnjVGkhfbdzk
 rbZUsg6105uMoj8FPCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_07,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080091

Hi Jens,

On 10/8/2026 7:11 PM, Jens Wiklander wrote:
> On Tue, Oct 6, 2026 at 2:40 AM Amirreza Zarrabi
> <amirreza.zarrabi@oss.qualcomm.com> wrote:
>>
>> OP-TEE commands can span multiple exchanges with normal world. A call
>> may yield to request an RPC service or allow interrupt processing
>> before continuing execution in secure world.
>>
>> Add the RPMI yielding-call path used by the common OP-TEE session
>> operations. Submit the command and RPC argument buffers as ranges
>> within a shared memory parcel.
>>
>> Handle RPC requests while the call is suspended and resume execution
>> using the token returned by OP-TEE until the command completes.
>>
>> Use the common OP-TEE call queue to wait when an initial request is
>> rejected with RPMI_ERR_BUSY, allowing another active call to complete
>> before retrying.
>>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
>>  drivers/tee/optee/rpmi_abi.c | 124 +++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 124 insertions(+)
>>
>> diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
>> index 58d82678be98..6e76316794c1 100644
>> --- a/drivers/tee/optee/rpmi_abi.c
>> +++ b/drivers/tee/optee/rpmi_abi.c
>> @@ -9,6 +9,7 @@
>>  #include <linux/mailbox/riscv-rpmi-message.h>
>>  #include <linux/overflow.h>
>>  #include <linux/rpmi_tee.h>
>> +#include <linux/sched.h>
>>  #include <linux/slab.h>
>>  #include <linux/unaligned.h>
>>  #include "optee_private.h"
>> @@ -560,3 +561,126 @@ static void optee_rpmi_handle_rpc_cmd(struct tee_context *ctx,
>>                 optee_rpc_cmd(ctx, optee, arg);
>>         }
>>  }
>> +
>> +/* Handle RPC command or interrupt returns from a yielding call. */
>> +static void optee_rpmi_handle_rpc(struct tee_context *ctx, struct optee *optee,
>> +                                 u32 result, struct optee_msg_arg *arg)
>> +{
>> +       switch (result) {
>> +       case OPTEE_RPMI_YIELDING_CALL_RETURN_RPC_CMD:
>> +               optee_rpmi_handle_rpc_cmd(ctx, optee, arg);
>> +               break;
>> +       case OPTEE_RPMI_YIELDING_CALL_RETURN_INTERRUPT:
>> +               break;
>> +       default:
>> +               pr_warn("Unknown RPC func 0x%x\n", result);
>> +               break;
>> +       }
>> +}
>> +
>> +/**
>> + * optee_rpmi_yielding_call() - submit and resume a yielding RPMI command
>> + * @ctx: calling context
>> + * @req: initial command request
>> + * @rpc_arg: shared RPC argument buffer
>> + * @system_thread: caller requests TEE system thread support
>> + *
>> + * Only RPMI_ERR_BUSY rejection of the initial command permits retry.
>> + *
>> + * Return: zero on completion, or a negative error.
>> + */
>> +static int optee_rpmi_yielding_call(struct tee_context *ctx,
>> +                                   const struct optee_rpmi_call_req *req,
>> +                                   struct optee_msg_arg *rpc_arg,
>> +                                   bool system_thread)
>> +{
>> +       struct optee *optee = tee_get_drvdata(ctx->teedev);
>> +       struct optee_rpmi_resume_req resume = {
>> +               .op = cpu_to_le32(OPTEE_RPMI_YIELDING_CALL_RESUME),
>> +               /* resume_token is nonzero after OP-TEE suspends the call. */
>> +               .resume_token = 0,
> 
> I missed this when reviewing "tee: optee: define the RPMI control and
> parcel-reference ABI". I'd prefer if the resume_token was a truly
> opaque value, just as for the SMC and FF-A ABIs. Any reason why it's a
> 64-bit value instead of 32-bit, as is used for the other ABI?
> 

Agreed. I currently use a zero token to distinguish the initial request
from a resume. I'll track that separately with a boolean and treat the token
as opaque, only copying it from the response into the resume request.

There is no specific reason for it to be 64-bit; I overlooked the
existing ABI convention. I'll change it to 32-bit.

>> +       };
>> +       struct optee_rpmi_call_resp resp;
>> +       struct optee_call_waiter waiter;
>> +       u32 result;
>> +       s32 status;
>> +       int ret;
>> +
>> +       optee_cq_wait_init(&optee->call_queue, &waiter, system_thread);
>> +       while (true) {
>> +               if (resume.resume_token)
>> +                       ret = optee_rpmi_call_with_status(optee, &resume,
>> +                                                         sizeof(resume), &resp,
>> +                                                         sizeof(resp), &status);
>> +               else
>> +                       ret = optee_rpmi_call_with_status(optee, req, sizeof(*req),
>> +                                                         &resp, sizeof(resp),
>> +                                                         &status);
> 
> Please fix the too-long lines above.
> 

Ack.

>> +               if (ret)
>> +                       goto done;
>> +
>> +               switch (status) {
>> +               case RPMI_SUCCESS:
> 
> Any particular reason why we aren't using TEE error codes here?
> 

I defined RPMI error codes consistently for all control responses in optee_rpmi.h.
However, these statuses belong to the OP-TEE service ABI rather than the transport.
I'll change them to TEE error codes and keep RPMI errors at the transport layer.

>> +                       break;
>> +               case RPMI_ERR_BUSY:
>> +                       if (!resume.resume_token) {
>> +                               optee_cq_wait_for_completion(&optee->call_queue,
>> +                                                            &waiter);
>> +                               continue;
>> +                       }
>> +
>> +                       fallthrough;
>> +               default:
>> +                       ret = rpmi_to_linux_error(status);
>> +                       goto done;
>> +               }
>> +
>> +               result = get_unaligned_le32(&resp.result);
> 
> Why not le32_to_cpu(resp.result)?

You are right, there are a couple of more of this that I missed.
I'll fix all in the next version.

Thanks Jens for the review.

Best Regards,
Amir

> 
> Cheers,
> Jens
> 
>> +               if (result == OPTEE_RPMI_YIELDING_CALL_RETURN_DONE)
>> +                       goto done;
>> +
>> +               cond_resched();
>> +               optee_rpmi_handle_rpc(ctx, optee, result, rpc_arg);
>> +
>> +               resume.resume_token = resp.resume_token;
>> +       }
>> +done:
>> +       optee_cq_wait_final(&optee->call_queue, &waiter);
>> +
>> +       return ret;
>> +}
>> +
>> +/* The caller supplies SHM with room for command and RPC args. */
>> +static int optee_rpmi_do_call_with_arg(struct tee_context *ctx,
>> +                                      struct tee_shm *shm, u_int offs,
>> +                                      bool system_thread)
>> +{
>> +       struct optee *optee = tee_get_drvdata(ctx->teedev);
>> +       struct optee_msg_arg *arg, *rpc_arg;
>> +       struct optee_rpmi_call_req req;
>> +       size_t arg_size, rpc_size, rpc_offset;
>> +       u32 parcel_id, nonce;
>> +
>> +       arg = tee_shm_get_va(shm, offs);
>> +       if (IS_ERR(arg))
>> +               return PTR_ERR(arg);
>> +
>> +       arg_size = OPTEE_MSG_GET_ARG_SIZE(arg->num_params);
>> +       rpc_size = OPTEE_MSG_GET_ARG_SIZE(optee->rpc_param_count);
>> +       rpc_offset = offs + arg_size;
>> +       rpc_arg = tee_shm_get_va(shm, rpc_offset);
>> +       if (IS_ERR(rpc_arg))
>> +               return PTR_ERR(rpc_arg);
>> +
>> +       optee_rpmi_shm_get_identity(shm, &parcel_id, &nonce);
>> +
>> +       req.op = cpu_to_le32(OPTEE_RPMI_YIELDING_CALL_WITH_ARG);
>> +       req.parcel_id = cpu_to_le32(parcel_id);
>> +       req.nonce = cpu_to_le32(nonce);
>> +       req.arg_offset = cpu_to_le64((u64)shm->offset + offs);
>> +       req.rpc_offset = cpu_to_le64((u64)shm->offset + rpc_offset);
>> +       req.arg_size = cpu_to_le32(arg_size);
>> +       req.rpc_size = cpu_to_le32(rpc_size);
>> +
>> +       return optee_rpmi_yielding_call(ctx, &req, rpc_arg, system_thread);
>> +}
>>
>> --
>> 2.34.1
>>

