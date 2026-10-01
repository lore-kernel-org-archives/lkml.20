Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC9F3164C7
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 23:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790897471; cv=none; b=Rk+TxBG9vFuYUS9hGY2d7kznMH9eIUHXSah8cJcAmOIWV4yrh+SXzcYxl0xmZfyT8mXJPcwPU2OTqq2oY5OoN8atVZafHjg5jgfXZdxji309tpmoRn5VOZSyqaF+nwujqdxGtfVtuQO6OK3YP5w1gfx71D+IFNF6yHVwI6MC+qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790897471; c=relaxed/simple;
	bh=ZQmEmz0suaaKeRGCCiIP5n7gEYp8GKcXm+5PpT01rhg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=mm9tz7+swxPVrGaTKxp/wirfXcJ3gXFFyt4HuO5vylCmUmPgJhsRCQmQzJ23AG5AZZdVVhz/EwK9NB+xtvhPiPiLEJ/JvwxJZbm0cvtm7JOn9AvUwvLkZGpSaIRxxoAjwUg7fyLkDPF0DhLiDFDzeZGAHesuUT9X2t6ppQuasXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bEw3KEpR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iFgPP7cT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bEw3KEpR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iFgPP7cT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691NFG1p810959
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 23:31:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RXmAiNVkT/5aUTPM3qYEmat2B87mxcwDRDaqVNDqBwo=; b=bEw3KEpRuUesEUjX
	rTrx1i82lIr2CdzJo5Q0AKzg4/h9b6AxLEajY1KqyxBsCHmWRpTMX3vQ2R0BhP8X
	XXnBTaSZcVbIT1CoYxkydFmnvXX9bFE4Dqr9/czA7HvKZTs7PxGj7N0X4tyERiGH
	p6/GAmiaNcJqq4Xpcm/EcR3dKwjV11pXO010F/7+1Fxdn+HDMaf0TriCrelgZqSq
	a1cvxTUITlAfcdfq6q/ozB5AqV5JdMp7rhfjw4i28DDdgKTwTmCF0cqFqObLZhnW
	c3vnV8LnDZjrKuCOCKKpSFVd5WqJYNIe4tccoHSIZKqwJJ7xd8l2/Cu++8lGpN/P
	Of+UyQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1p2bb1fg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 23:31:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d7443e0f0bso98512245ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 16:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790897468; x=1791502268; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RXmAiNVkT/5aUTPM3qYEmat2B87mxcwDRDaqVNDqBwo=;
        b=iFgPP7cTqTFTtNLMPeKedJp6VLjxWDVsNnqluYyJrd880RC4g0PkbcXZEAxaqiDqV4
         myCT58lrw310KTfdR2Oa5VavWlIRJKrHa0hPUHUKTY8I4A33UGHyhTzxxgcnqhcgFe9L
         I6p58pAfy5UCXu0qfBCO/cl2SDqofEAQSYnlYPWyt5fuyht9E7xIwQW0CqeJPqa/7xX0
         stHQXcskefVBJkgwjJxxFCge07MMdY8nvymdL2iMcXP7gUyFbxLZdpdJtyBiGxMgTq9a
         BEXB9CLjomepHnc5S7nI7lQ5hJVUKn2hVbpfy2qYTqE86ID2g4UTfT5EtqpxpVy8f/HL
         bmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790897468; x=1791502268;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RXmAiNVkT/5aUTPM3qYEmat2B87mxcwDRDaqVNDqBwo=;
        b=xy8l+EY3YJrq4uheIt3u2fY2bKjN55dO1zn5IKnD6Pt5cIzx99vPK2ytu1l5DOlOAz
         mgYDgvSpxw+euqlZcy5Lyr3H8iOk7bmJdlhSSowz/zb0D2hD4QNWFsyQAHXIke8/IqaV
         0749S6cOObRc7LzoeS2VB4rA6pijyyfEnpbleXpdrkKttZKjciQGaslBzoaYZiD6JOgr
         0me5O9QtxzdoKIIR5brnR796tNo0o6kzgXNYhcYY1LeCckVU85m+LZLdzwoh9ptx3xxO
         AhqJk+j+TDNoPqxIAX+zbqDI+hd9DeQN4pgIhGE1Xt5Nfc4mH6FpmqJLdpIyw2KhOEGD
         HVzA==
X-Forwarded-Encrypted: i=1; AKwUvByJNpwztsSTRTwv0Qb17GiFYOtzUre39p6xfOxrjdVZMHCGO4yauW4hsVYt7AYUIllOlUEpoDQxJ5atJA0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmHuhBNqX7Z745uAMuRK8nVlnvLP6LCR8LGz5A4wvNAbByFZt1
	VRnbrYSjjgYybjnubjIgAdieaC4orHwsOdi12llxxttl1nmBm/z8/IXx7DiSnY6udMXfjitJm4u
	MyCQKJ04LOEkjmn2iHQCQEBlB1MTw0wmagEztLTTIy8P4vQiHTIOOPybBgPfPxHpcJUZf5rtQBA
	==
X-Gm-Gg: AYBFou3CjoL5vLxwwPDDIkIl35fD7a27risRcnjbmHe4UGrHDwj/fgU43/iEiFhaz2T
	av5XzKJHhbya8eCVsVkekQhXLA48MVC//ZlaHwDnvsZXtuQESukKOfVKzBh1z8f7CKCwhM9HqkK
	NPHxkX7qKN6hJqVVgTkD7+xmLBtQnuKC4kx+4DmoTrTCBmitid/ZHZJglbRyr5Mp/3TSRLsfGZh
	cxOyKTENuDXMAuzTPuUJO91rWJBAutDhnCb6KhIxhyQ9nC+qJ7aWsyEcRCDpOuoLeusiwfJgRD3
	vN1qGepkwAY4QnMIo1VozGm1U6NUsRZYQrRmlxcoPPBxkJS00Ev5xW3cnGdHkwyGHLFDozGHQlg
	+lmEdwwuq2kKNG+lojnmYC4K2DWEWX2uE
X-Received: by 2002:a17:903:1a67:b0:2dd:c100:a5de with SMTP id d9443c01a7336-2e49b67e1e9mr7921165ad.50.1790897468322;
        Thu, 01 Oct 2026 16:31:08 -0700 (PDT)
X-Received: by 2002:a17:903:1a67:b0:2dd:c100:a5de with SMTP id d9443c01a7336-2e49b67e1e9mr7920945ad.50.1790897467727;
        Thu, 01 Oct 2026 16:31:07 -0700 (PDT)
Received: from [192.168.1.86] ([206.83.119.45])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6ab2b9sm1766635ad.36.2026.10.01.16.31.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 16:31:07 -0700 (PDT)
Message-ID: <be313b42-64ea-4c0d-b0cd-bbdba92d82f9@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 09:31:02 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] tee: optee: build the Arm-specific code only on Arm
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
To: marouene.boubakri@oss.nxp.com, jenswi@kernel.org
Cc: sumit.garg@kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        peter.lin@sifive.com
References: <20260924105145.532787-1-marouene.boubakri@oss.nxp.com>
 <27748440-8d0c-4163-bc73-842b77791017@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <27748440-8d0c-4163-bc73-842b77791017@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8RlDL-t-LcFV2sYiuQnYfmILPVnr0ufb
X-Proofpoint-ORIG-GUID: 8RlDL-t-LcFV2sYiuQnYfmILPVnr0ufb
X-Authority-Analysis: v=2.4 cv=O8SsLx9W c=1 sm=1 tr=0 ts=6abeed3d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nLoy2YM07uCa/jC45NrMpw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8 a=4o7CPISBijJ24BUE3mwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA5MyBTYWx0ZWRfX/0SWTII35Zyv
 s2YulKw/dhW3FTeFC3pBZF+FlmTA7Mo+wI9sRuozLTPn6Zz+Rby3u2oEwGYfPV7yIRsDBWxWe3T
 0ks8fkm+nhDFtqHxVsx6eewrGcKvKSw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA5MyBTYWx0ZWRfX56juhqNIg0yF
 0wkx4xwF9kci2OGTprZ/ckF24KxE7tz8mPlmIBup/8rbriTcAwab7p/tdnEjLv1u4RvJ8mc5h47
 AMKO2qJoZcueZ9C1BNX6sb1Fp4QVmDkjhUODV/QBeT3JPW+WOucaLYyspSIKIuNSRe5jEgsrzNz
 cNQ384QPAZJdqkX0FEUNlRbS5rGwVXnFEnPo9fTxlUCODJt0hpC2YUsBRWq5JnE5jMC4kg0Uxpc
 gOfdcONIR85BgeWevt9tDpMFYgBiAQZJeMxFRrG/+dvhDzzvgWE+qE1+cjf+eiFGbv0DgskAdaZ
 p27U41fk8OrpX0hj/r/pnbiJNcI+zl61kAzpDTw+PqZZPF2zEqIHwvv9BeLbLlRqZxF/D0UqFng
 YZ2wETjXspXUESB9hyaKJ6GvsSc2RNIRs2HfGzDnyDu4ChSIqFW66/eo3CzR+VOIi1UWT0F1gqs
 5Uryed0++goibHGKrig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_05,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010093


On 10/2/2026 6:27 AM, Amirreza Zarrabi wrote:
> Hi Marouene,
> 
> On 9/24/2026 8:51 PM, marouene.boubakri@oss.nxp.com wrote:
>> From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
>>
>> The OP-TEE driver reaches OP-TEE through the SMC ABI or the FF-A ABI,
>> both specific to Arm, yet builds both unconditionally together with the
>> SMC Calling Convention definitions they rely on: ffa_abi.c is always
>> compiled and only its registration is conditioned on
>> IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT), and optee_private.h includes
>> <linux/arm-smccc.h> and defines the SMC and FF-A specific types for
>> every file of the driver. This is fine as long as the driver depends on
>> HAVE_ARM_SMCCC, but it keeps the driver from being built for an
>> architecture without SMCCC, such as RISC-V.
>>
>> Build smc_abi.c only when HAVE_ARM_SMCCC is set and ffa_abi.c only when
>> the FF-A transport is enabled, and provide stubs for their registration
>> otherwise, so that it fails with -EOPNOTSUPP as the FF-A ABI already
>> does when the FF-A transport is not reachable. Keep the SMCCC header,
>> the SMC invoke function type, the SMC and FF-A specific structures and
>> the SMC RPC register parameters in optee_private.h under the same
>> conditions, and drop the unused <linux/arm-smccc.h> include from
>> notif.c.
>>
>> Make OPTEE depend on ARM_FFA_TRANSPORT || !ARM_FFA_TRANSPORT, as it
>> already does for RPMB, so that the driver is limited to a module when
>> the FF-A transport is one, rather than built in without FF-A support.
>> ffa_abi.c is thus built exactly when the FF-A transport is reachable
>> from the driver, and the IS_REACHABLE() checks in
>> optee_ffa_abi_register() and optee_ffa_abi_unregister() are always
>> true, so drop them.
>>
>> OPTEE still depends on HAVE_ARM_SMCCC, so smc_abi.c is still always
>> built. The only visible change is that OPTEE=y can no longer be
>> combined with ARM_FFA_TRANSPORT=m: such a configuration now resolves to
>> OPTEE=m, with the FF-A ABI available.
>>
>> Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
>> ---
>> Changes in v4:
>> - Make OPTEE depend on ARM_FFA_TRANSPORT || !ARM_FFA_TRANSPORT so that
>>   the driver is limited to =m when the FF-A transport is =m (Jens).
>> - Update the commit message accordingly.
>> v3: https://lore.kernel.org/all/20260922131735.524635-1-marouene.boubakri@oss.nxp.com/
>>
>> Changes in v3:
>> - Dropped the RPMI ABI placeholder and the RISC-V enablement patches,
>>   this is now a single patch (Jens).
>> - Key the FF-A parts of optee_private.h on IS_REACHABLE() instead of
>>   IS_ENABLED(): with OPTEE=y and ARM_FFA_TRANSPORT=m kbuild drops
>>   ffa_abi.o from the built-in optee.o while optee_ffa_abi_register()
>>   was still declared, which does not link.
>> - Drop the now always true IS_REACHABLE() checks in
>>   optee_ffa_abi_register() and optee_ffa_abi_unregister().
>> - Describe the current FF-A conditional compilation accurately in the
>>   commit message.
>> - Posted as a new thread with a proper subject prefix.
>> v2: https://lore.kernel.org/op-tee/20260915020235.507302-2-marouene.boubakri@oss.nxp.com/
>>
>> Changes in v2:
>> - No code change, the testing section of the cover letter was completed.
>> v1: https://lore.kernel.org/op-tee/20260914175435.118303-2-marouene.boubakri@oss.nxp.com/
>>  drivers/tee/optee/Kconfig         |  1 +
>>  drivers/tee/optee/Makefile        |  4 ++--
>>  drivers/tee/optee/ffa_abi.c       |  8 ++-----
>>  drivers/tee/optee/notif.c         |  1 -
>>  drivers/tee/optee/optee_private.h | 39 ++++++++++++++++++++++++++++++-
>>  5 files changed, 43 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/tee/optee/Kconfig b/drivers/tee/optee/Kconfig
>> index 50d2051..891dac6 100644
>> --- a/drivers/tee/optee/Kconfig
>> +++ b/drivers/tee/optee/Kconfig
>> @@ -5,6 +5,7 @@ config OPTEE
>>  	depends on HAVE_ARM_SMCCC
>>  	depends on MMU
>>  	depends on RPMB || !RPMB
>> +	depends on ARM_FFA_TRANSPORT || !ARM_FFA_TRANSPORT
>>  	help
>>  	  This implements the OP-TEE Trusted Execution Environment (TEE)
>>  	  driver.
>> diff --git a/drivers/tee/optee/Makefile b/drivers/tee/optee/Makefile
>> index ad7049c..183cdde 100644
>> --- a/drivers/tee/optee/Makefile
>> +++ b/drivers/tee/optee/Makefile
>> @@ -7,8 +7,8 @@ optee-objs += rpc.o
>>  optee-objs += protmem.o
>>  optee-objs += supp.o
>>  optee-objs += device.o
>> -optee-objs += smc_abi.o
>> -optee-objs += ffa_abi.o
>> +optee-$(CONFIG_HAVE_ARM_SMCCC) += smc_abi.o
>> +optee-$(CONFIG_ARM_FFA_TRANSPORT) += ffa_abi.o
>>  
>>  # for tracing framework to find optee_trace.h
>>  CFLAGS_smc_abi.o := -I$(src)
>> diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
>> index 633715b..08236d8 100644
>> --- a/drivers/tee/optee/ffa_abi.c
>> +++ b/drivers/tee/optee/ffa_abi.c
>> @@ -1212,14 +1212,10 @@ static struct ffa_driver optee_ffa_driver = {
>>  
>>  int optee_ffa_abi_register(void)
>>  {
>> -	if (IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT))
>> -		return ffa_register(&optee_ffa_driver);
>> -	else
>> -		return -EOPNOTSUPP;
>> +	return ffa_register(&optee_ffa_driver);
>>  }
>>  
>>  void optee_ffa_abi_unregister(void)
>>  {
>> -	if (IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT))
>> -		ffa_unregister(&optee_ffa_driver);
>> +	ffa_unregister(&optee_ffa_driver);
>>  }
>> diff --git a/drivers/tee/optee/notif.c b/drivers/tee/optee/notif.c
>> index 6e85f2f..6801422 100644
>> --- a/drivers/tee/optee/notif.c
>> +++ b/drivers/tee/optee/notif.c
>> @@ -5,7 +5,6 @@
>>  
>>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>>  
>> -#include <linux/arm-smccc.h>
>>  #include <linux/errno.h>
>>  #include <linux/slab.h>
>>  #include <linux/spinlock.h>
>> diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
>> index aefe1e6..02d6f79 100644
>> --- a/drivers/tee/optee/optee_private.h
>> +++ b/drivers/tee/optee/optee_private.h
>> @@ -6,7 +6,6 @@
>>  #ifndef OPTEE_PRIVATE_H
>>  #define OPTEE_PRIVATE_H
>>  
>> -#include <linux/arm-smccc.h>
>>  #include <linux/notifier.h>
>>  #include <linux/rhashtable.h>
>>  #include <linux/rpmb.h>
>> @@ -15,6 +14,10 @@
>>  #include <linux/types.h>
>>  #include "optee_msg.h"
>>  
>> +#ifdef CONFIG_HAVE_ARM_SMCCC
>> +#include <linux/arm-smccc.h>
>> +#endif
>> +
>>  #define DRIVER_NAME "optee"
>>  
>>  #define OPTEE_MAX_ARG_SIZE	1024
>> @@ -42,10 +45,12 @@
>>   */
>>  #define OPTEE_DEFAULT_MAX_NOTIF_VALUE	255
>>  
>> +#ifdef CONFIG_HAVE_ARM_SMCCC
>>  typedef void (optee_invoke_fn)(unsigned long, unsigned long, unsigned long,
>>  				unsigned long, unsigned long, unsigned long,
>>  				unsigned long, unsigned long,
>>  				struct arm_smccc_res *);
>> +#endif
>>  
>>  /**
>>   * struct optee_call_waiter - TEE entry may need to wait for a free TEE thread
>> @@ -119,6 +124,7 @@ struct optee_supp {
>>  	struct completion reqs_c;
>>  };
>>  
>> +#ifdef CONFIG_HAVE_ARM_SMCCC
>>  /**
>>   * struct optee_pcpu - per cpu notif private struct passed to work functions
>>   * @optee:	optee device reference
>> @@ -149,7 +155,9 @@ struct optee_smc {
>>  	struct work_struct notif_pcpu_work;
>>  	unsigned int notif_cpuhp_state;
>>  };
>> +#endif
>>  
>> +#if IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT)
>>  /**
>>   * struct optee_ffa -  FFA communication struct
>>   * @ffa_dev:		FFA device, contains the destination id, the id of
>> @@ -170,6 +178,7 @@ struct optee_ffa {
>>  	struct workqueue_struct *notif_wq;
>>  	struct work_struct notif_work;
>>  };
>> +#endif
>>  
>>  struct optee;
>>  
>> @@ -257,8 +266,12 @@ struct optee {
>>  	const struct optee_ops *ops;
>>  	struct tee_context *ctx;
>>  	union {
>> +#ifdef CONFIG_HAVE_ARM_SMCCC
>>  		struct optee_smc smc;
>> +#endif
>> +#if IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT)
>>  		struct optee_ffa ffa;
>> +#endif
> 
> Does this need to be a union if we filter the members?
> 
> Best Regards,
> Amir
> 

Ok, got my answer. We need both support in the binary, like before.
Thanks,

- Amir

>>  	};
>>  	struct optee_shm_arg_cache shm_arg_cache;
>>  	struct optee_call_queue call_queue;
>> @@ -290,6 +303,7 @@ struct optee_context_data {
>>  	struct list_head sess_list;
>>  };
>>  
>> +#ifdef CONFIG_HAVE_ARM_SMCCC
>>  struct optee_rpc_param {
>>  	u32	a0;
>>  	u32	a1;
>> @@ -300,6 +314,7 @@ struct optee_rpc_param {
>>  	u32	a6;
>>  	u32	a7;
>>  };
>> +#endif
>>  
>>  /* Holds context that is preserved during one STD call */
>>  struct optee_call_ctx {
>> @@ -422,9 +437,31 @@ static inline void reg_pair_from_64(u32 *reg0, u32 *reg1, u64 val)
>>  }
>>  
>>  /* Registration of the ABIs */
>> +#ifdef CONFIG_HAVE_ARM_SMCCC
>>  int optee_smc_abi_register(void);
>>  void optee_smc_abi_unregister(void);
>> +#else
>> +static inline int optee_smc_abi_register(void)
>> +{
>> +	return -EOPNOTSUPP;
>> +}
>> +
>> +static inline void optee_smc_abi_unregister(void)
>> +{
>> +}
>> +#endif
>> +#if IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT)
>>  int optee_ffa_abi_register(void);
>>  void optee_ffa_abi_unregister(void);
>> +#else
>> +static inline int optee_ffa_abi_register(void)
>> +{
>> +	return -EOPNOTSUPP;
>> +}
>> +
>> +static inline void optee_ffa_abi_unregister(void)
>> +{
>> +}
>> +#endif
>>  
>>  #endif /*OPTEE_PRIVATE_H*/
>>
>> base-commit: 827751b699b79a6e569983359c02dce67f81b94c
> 

