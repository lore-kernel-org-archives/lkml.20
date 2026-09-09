Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160CD242D89
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 05:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788932791; cv=none; b=L6xNT+9F1tV5yFSNph5oBjCwTUZ0W/zZPOnnWHmKL8+Flu6GwTzvRoBgTik4qrLtQURIBuWKHfvaGMF4VtUEdOJcHgJw/2t2BSVuxVzlwI2jhJuA9u8BvBUu9y2BD9jsIiMZDtzQXD1lkjlxvBBfmhz3EwglTBtv8a8ASBQnIUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788932791; c=relaxed/simple;
	bh=jNVuA5CcInQ7T1L4aHXEj1/uKuOP5TmsrHMPq9jYD0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YaUQmEkwSEz/DboPj5Rm96XKOFgW5dNJHPCXIgOuVHmk3LcPeBIFn7lHqtFWDrdYm/A7jXYqaJLKNC9sm734KQw+onL6JNcAOEeGSW/oJcSeYlk10QFEtvdn6eA6HbhMV9dABBPTDYI2+la91kmpBOH/mJvRxVwuzUKAFYU8o1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=es86Evwr; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="es86Evwr"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688N1WZC2126109;
	Wed, 9 Sep 2026 05:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=yhzONu
	+0ryPKsa5zh39qri01TBZaevZUnSOo80wpfeI=; b=es86EvwrsLyfxN88tUQ0Xo
	Fao6Vh5jEuo7px0c3MT/WaxuukjDIcUaYcbk0wkz58sIVVpYtqvXQR+a6K+nH6o0
	QtsuAdrXGvqcgzAcRqClCcpDL52PUS0fVyPDctsnu/bhdSM7SPs/zykETg1S4J0d
	UARVnrOgugdsvWhFxqZEONT+tJI4CACveSNrNsoKd3aDW6fvGeM/KBFYbJ8aNMsO
	bkkvj18MDBliBTapYP/75xmIm3lWcsQNK0hX7cjJ05YuxGnWg/PgGCxNSCwtq+wv
	UnAhYpjON2Ahq3PlmWp5p7hE0GVBYW+R+6lWyYBzzJs19ZJdc9rR77pBWKcbpi/Q
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ggbj8bj2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 05:46:04 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6895QJvN004381;
	Wed, 9 Sep 2026 05:46:04 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ggwsw8k76-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 05:46:04 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6895k0wY29032828
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Sep 2026 05:46:00 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F283C20043;
	Wed,  9 Sep 2026 05:45:59 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3E35A2004B;
	Wed,  9 Sep 2026 05:45:57 +0000 (GMT)
Received: from [9.123.3.199] (unknown [9.123.3.199])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  9 Sep 2026 05:45:57 +0000 (GMT)
Message-ID: <880fbc4d-c068-4b43-826e-944f14632ce1@linux.ibm.com>
Date: Wed, 9 Sep 2026 11:15:56 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] powerpc/rtas: Handle ibm,open-errinjct return
 format
To: Sourabh Jain <sourabhjain@linux.ibm.com>, mahesh@linux.ibm.com,
        maddy@linux.ibm.com, mpe@ellerman.id.au, christophe.leroy@csgroup.eu,
        oohall@gmail.com, npiggin@gmail.com, tpearson@raptorengineering.com,
        alex@shazbot.org, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        sbhat@linux.ibm.com, harshpb@linux.ibm.com
References: <20260831065441.48654-1-nnmlinux@linux.ibm.com>
 <20260831065441.48654-2-nnmlinux@linux.ibm.com>
 <1abcf248-0d93-4d2d-a3e2-867b0b3dea16@linux.ibm.com>
Content-Language: en-US
From: Narayana Murty N <nnmlinux@linux.ibm.com>
In-Reply-To: <1abcf248-0d93-4d2d-a3e2-867b0b3dea16@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: Sxpf_9tZzPIwLZPmnYAuXa2c0g2yBIU9
X-Proofpoint-ORIG-GUID: cNqMg2Xj6hXwGqV-7uRbDbIhEUt-1Dd6
X-Authority-Analysis: v=2.4 cv=RNCD2Yi+ c=1 sm=1 tr=0 ts=6aa0f29d cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=1mVJ_uiqAAAA:8
 a=gdoT5VGXAAAA:20 a=VnNF1IyMAAAA:8 a=dHVhZm_fqcpgw13XnT0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=h67g7WpEjx8dfGT80pje:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA2MCBTYWx0ZWRfX4zXx3Vc6XAwP
 1ffMtRGwIALAw4w32KSOYSEjUM1IUxbYKmHGmpJ2VD33yC42b5Q8BEOsp23yHbQxAqTqj69vE3O
 TPCZHHeQ+4p4gTK/eeQ5ND7OD8sFbjE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA2MCBTYWx0ZWRfX1evCUdKAF7aG
 4EcaIzfoQ/jEw5Clfc3z/Tv+s4PTbG7bWtfgYe0RXhicWAlenG46rhD9LaTkDreAFhVAdiDwLyj
 0PIev06jzPxpSuFxTzd9ywok8OO+Pm94hTG4aqKOtm/Fyc3sEHtGdeVuLDcbsu+gmPVhrdZIjAH
 e3UKtEWoYrOKMSQ2nYUINSnsGe4ToLrtQUa5lbBO/JsCb3E86mlf4Jsec39XKhayFoKJdAu/FcP
 vPgK6f0+8uFhif5F1UBG1MrpWCOOeNMHVwr4Eh7gLbfBfOcyWmlX7bQ96q5ewzUJ5e2kCo3l6dl
 pzf90zOWvCXptpBQguvGDj8TkDPt1B+yZ+uSbFS4sPWngu4zd0tGHXANdhhiLoPljIMSlibMC6K
 cFzfNWlaVlO2mL6wGXde4xJWYJs40nrvSHG50oxzyDSRJSwifsoA9nimi9IMmJ/13AzrTdOW6JA
 anuxNOBxy9lQaSC+zVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015 spamscore=0
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090060

Hi Sourabh,

Thanks for the detailed review.

On 01/09/26 2:52 PM, Sourabh Jain wrote:
> 
> On 31/08/26 12:24, Narayana Murty N wrote:
>> ibm,open-errinjct uses a non-standard RTAS return layout:
>>
>>    rets[0] = session token  (output parameter)
>>    rets[1] = status code
>>
>> Unlike all other RTAS functions which use:
>>
>>    rets[0] = status code
>>    rets[1..] = output parameters
>>
>> Add rtas_token_is_open_errinjct() to identify this call, and
>> rtas_status_from_args() to extract status from the correct position.
>>
>> Add an early guard in rtas_call() that rejects ibm,open-errinjct
>> invocations where nret < 2, since reading rets[1] would be out of
>> bounds:
>>
>>    if (rtas_token_is_open_errinjct(token) && nret < 2) {
>>            WARN_ON_ONCE(1);
>>            return RTAS_INVALID_PARAMETER;
>>    }
>>
>> Adjust the output-copy loop so that for ibm,open-errinjct:
>>
>>    return value = rets[1]   (status)
>>    outputs[0]   = rets[0]   (session token)
>>
>> For all other functions the existing convention is preserved:
>>
>>    return value = rets[0]   (status)
>>    outputs[0..] = rets[1..] (non-status outputs)
>>
>> Move the "/* A -1 return code... */" comment immediately before the
>> ret == -1 check so it documents the check it guards.
>>
>> Also fix sys_rtas() last-error status detection: ibm,open-errinjct
>> places status at rets[1], so the -1 sentinel check must use rets[1]
>> for that function rather than always using rets[0].
>>
>> Reference: OpenPOWER PAPR documentation
>>             https://files.openpower.foundation/s/XFgfMaqLMD5Bcm8
>> Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>
>> ---
>>   arch/powerpc/kernel/rtas.c | 78 +++++++++++++++++++++++++++++++++-----
>>   1 file changed, 68 insertions(+), 10 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
>> index 8d81c1e7a8db..7131870655c6 100644
>> --- a/arch/powerpc/kernel/rtas.c
>> +++ b/arch/powerpc/kernel/rtas.c
>> @@ -1117,6 +1117,28 @@ static bool token_is_restricted_errinjct(s32 
>> token)
>>              token == rtas_function_token(RTAS_FN_IBM_ERRINJCT);
>>   }
>> +/*
>> + * ibm,open-errinjct uses a non-standard return layout:
>> + *   rets[0] = session token  (output parameter)
>> + *   rets[1] = status code
>> + *
>> + * All other RTAS functions use the standard layout:
>> + *   rets[0] = status code
>> + *   rets[1..] = output parameters
>> + */
>> +static inline bool rtas_token_is_open_errinjct(int token)
>> +{
>> +    return token == rtas_function_token(RTAS_FN_IBM_OPEN_ERRINJCT);
>> +}
>> +
>> +static int rtas_status_from_args(int token, struct rtas_args *args, 
>> int nret)
>> +{
>> +    if (rtas_token_is_open_errinjct(token))
>> +        return be32_to_cpu(args->rets[1]);
>> +
>> +    return nret > 0 ? be32_to_cpu(args->rets[0]) : 0;
>> +}
>> +
>>   /**
>>    * rtas_call() - Invoke an RTAS firmware function.
>>    * @token: Identifies the function being invoked.
>> @@ -1198,6 +1220,16 @@ int rtas_call(int token, int nargs, int nret, 
>> int *outputs, ...)
>>               return -1;
>>       }
>> +    /*
>> +     * ibm,open-errinjct returns rets[0]=session_token, rets[1]=status.
>> +     * We need nret >= 2 to read status from rets[1].  Reject early if
>> +     * the caller forgot to account for the extra return cell.
>> +     */
>> +    if (rtas_token_is_open_errinjct(token) && nret < 2) {
>> +        WARN_ON_ONCE(1);
>> +        return RTAS_INVALID_PARAMETER;
> 
> Nit: I would prefer -EINVAL instead. RTAS_INVALID_PARAMETER is RTAS 
> error code but here kernel is validating the parameter so I think - 
> EINVAL would be better.
I agree this is a kernel-side validation before entering RTAS, but for
rtas_call() I think keeping RTAS_INVALID_PARAMETER is safer.

The return value from rtas_call() is normally interpreted by callers as 
an RTAS status code. If we return -EINVAL from rtas_call(), the caller 
may still treat it as an RTAS return value. Since this is an invalid 
RTAS call layout for ibm,open-errinjct, I would prefer to keep the 
return value as RTAS_INVALID_PARAMETER in rtas_call().

>> +    }
>> +
>>       if ((mfmsr() & (MSR_IR|MSR_DR)) != (MSR_IR|MSR_DR)) {
>>           WARN_ON_ONCE(1);
>>           return -1;
>> @@ -1213,15 +1245,33 @@ int rtas_call(int token, int nargs, int nret, 
>> int *outputs, ...)
>>       va_rtas_call_unlocked(args, token, nargs, nret, list);
>>       va_end(list);
>> +    ret = rtas_status_from_args(token, args, nret);
>> +
>>       /* A -1 return code indicates that the last command couldn't
>> -       be completed due to a hardware error. */
>> -    if (be32_to_cpu(args->rets[0]) == -1)
>> +     * be completed due to a hardware error.
>> +     */
>> +    if (ret == -1)
>>           buff_copy = __fetch_rtas_last_error(NULL);
>> -    if (nret > 1 && outputs != NULL)
>> -        for (i = 0; i < nret-1; ++i)
>> -            outputs[i] = be32_to_cpu(args->rets[i + 1]);
>> -    ret = (nret > 0) ? be32_to_cpu(args->rets[0]) : 0;
>> +    /*
>> +     * Copy non-status outputs to the caller's buffer.
>> +     *
>> +     * For ibm,open-errinjct the layout is:
>> +     *   rets[0] = session token  -> outputs[0]
>> +     *   rets[1] = status         (returned, not copied)
>> +     *
>> +     * For all other RTAS functions:
>> +     *   rets[0] = status         (returned, not copied)
>> +     *   rets[1..nret-1] -> outputs[0..nret-2]
>> +     */
>> +    if (outputs != NULL) {
>> +        if (rtas_token_is_open_errinjct(token)) {
>> +            outputs[0] = be32_to_cpu(args->rets[0]);
>> +        } else if (nret > 1) {
>> +            for (i = 0; i < nret - 1; ++i)
>> +                outputs[i] = be32_to_cpu(args->rets[i + 1]);
>> +        }
>> +    }
>>       lockdep_unpin_lock(&rtas_lock, cookie);
>>       raw_spin_unlock_irqrestore(&rtas_lock, flags);
>> @@ -1942,10 +1992,18 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user 
>> *, uargs)
>>       do_enter_rtas(&rtas_args);
>>       args = rtas_args;
>> -    /* A -1 return code indicates that the last command couldn't
>> -       be completed due to a hardware error. */
>> -    if (be32_to_cpu(args.rets[0]) == -1)
>> -        errbuf = __fetch_rtas_last_error(buff_copy);
>> +    /*
>> +     * A -1 return code indicates that the last command couldn't
>> +     * be completed due to a hardware error.  ibm,open-errinjct
>> +     * places status at rets[1] rather than rets[0]; check the
>> +     * correct position for the -1 sentinel.
>> +     */
>> +    {
>> +        __be32 status_cell = (token == 
>> rtas_function_token(RTAS_FN_IBM_OPEN_ERRINJCT) &&
>> +                      nret >= 2) ? args.rets[1] : args.rets[0];
>> +        if (be32_to_cpu(status_cell) == -1)
>> +            errbuf = __fetch_rtas_last_error(buff_copy);
> 
> Do we know what happens when the ibm,open-errinjct RTAS call is made
> with nret < 2?
> 
> The reason I’m asking is that, even with the above changes,
> args.rets[0] is used as the return code if the ibm,open-errinjct call
> is made with nret < 2.
> 
> I like the approach you took in rtas_call() of pre-validating nret for
> the ibm,open-errinjct RTAS call and returning early if it is less than
> 2. I think we can use a similar approach here as well. If we do that,
> the above code changes will be much cleaner. In that case, we don't
> have to figure out how RTAS processes ibm,open-errinjct with nret < 2.
> 
> The only concern I have is that this change would alter the system
> call behavior. Right now, the kernel accepts nret < 2 for
> ibm,open-errinjct and makes the RTAS call, but with the above suggested
> change, the kernel would return early if nret < 2.
> 
> The prominent user of this system call is librtas, which passes
> nret = 2 for ibm,open-errinjct:
> 
> https://github.com/ibm-power-utilities/librtas/blob/ 
> d321a1f5ae3d528ba027fc748d1cc1123dd4ae29/librtas_src/syscall_calls.c#L488
> 
> Also, as per PAPR, users are supposed to pass nret = 2 for this RTAS
> call. So I think it should be fine to validate nret in sys_rtas for
> ibm,open-errinjct and return early if it is found to be less than 2.
> 
> Since this is a change in system call behavior, I want to be a
> little cautious. So, I’d like to hear your thoughts and would also
> like to know what others think about making the above change.
> 
Agreed.

For ibm,open-errinjct, rets[0] is the session token and rets[1] is the
status. So when nret < 2, we should not fall back to rets[0], because 
that can interpret a session token as a status code.

I will add an early validation in sys_rtas() before entering RTAS for 
this case and return -EINVAL there, since sys_rtas() is the userspace 
syscall boundary.

So the split will be:
rtas_call(): return RTAS_INVALID_PARAMETER for invalid RTAS return layout

sys_rtas(): return -EINVAL for invalid userspace syscall arguments

This should not affect the valid librtas path, since librtas already 
passes nret = 2 for ibm,open-errinjct, as required by PAPR.

Thanks,
Narayana

> Thanks, Sourabh Jain
>> +    }
>>       lockdep_unpin_lock(&rtas_lock, cookie);
>>       raw_spin_unlock_irqrestore(&rtas_lock, flags);
> 

