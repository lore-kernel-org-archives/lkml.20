Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90043F107E
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 20:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790886443; cv=none; b=ZPwLEh1cJZ2WGpQLfdl4Wyz7uVaea9uG6Inwp/qwYMsuKXxaLkqeJGEzD749/iUTfDUnBpUwWZjBBachGAbj3IQO+AoBrs6x97PeHREI6Fb4qrHZKNZPisIp2/GQno4clr9bSLx26QOG7J+/+DYK8jfKPVpS3OR/FaiU3d9Ua2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790886443; c=relaxed/simple;
	bh=wVmEFIDLQvEJ1Un315FMH1sKflA3HdQiFPaRfBWSbCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KJGCHCn20CDM/blrAjwtYMRG8Q2DJ9xpmnUEVDI8MnG/0vzVVNVWaG3sozr92Q0o5h+8F6VPNS36jN2VoYZVwYZK5XHL7Z7dOfgAMXqRJh6D6fdDqiA7z/x7Z7V1D8uudaLh5UTujhtmOIfqfNXshvMFnA32WzBTneVDpca+Sns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lv/W6Kls; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F16GfyHD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lv/W6Kls";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F16GfyHD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691FsZNU2886333
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 20:27:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GWv0CTeZ2vuMvNSD1JU+sMxbnaSK0ikbtxrvqbpR3Rs=; b=Lv/W6KlsSr9yxAAn
	dIhtQW+4fOCWHSoO4mKFjwSH183LXVWCVQYci4MBw814SIY/fUZtOlKKvwnFcaiO
	Pz16z+0GWLgaC/4miTtjHNtdxcyNBam/+JMVqXV0mxDEgEUn0SgXMKhPDl261sIp
	iWcwPxnyamU3FwREfmG/2fNLQRgHLxKSDInF+OKVA5YhDHLJW8CefDRS39b1Cc5C
	1TdxYxkerQijPeKKDpZQ+/P57cV5GlO6cq0Za6SnQTwyCybHQmPLsVcdD4RZBBe+
	ZcuGooTQcaIv3eexa9JODYKQWetQvkNqPkcVkGaWuwcrjJdZh2ylV4JPxypgEkRX
	uyUu+A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1sdchn90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 20:27:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce7dff6253so10152715ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 13:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790886439; x=1791491239; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GWv0CTeZ2vuMvNSD1JU+sMxbnaSK0ikbtxrvqbpR3Rs=;
        b=F16GfyHD4YjZgQIRGF2m27VJQVHgUz7zdGLAJmgA3orj0UvJG5KN3TDRHU1OtC0t/j
         /2W7xE0tzVS/eSArNBt3LIcXHQDl7IzflVFLGw/wJ6fx1Y4PB1lBDQNvSKLiOX5c3e0W
         GlQYaFBWbOgyzqol30xyza+YJCJxDMYPHD6topkw56NMCvdcCwmmcfdN1q0RBYpQxCOl
         My4Lu7Rr5dynpJ68utKGZimFILeaLO/i/w3UzG0097Xhgay9urvH7iCrQIPVv2lC/Tzh
         8TeT42pY34hCvg9QXTWjUvM4E/PfZMKdh0fLBvqj9bn90NUOl6771049c4RJJoRFV4Ur
         /ooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790886439; x=1791491239;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GWv0CTeZ2vuMvNSD1JU+sMxbnaSK0ikbtxrvqbpR3Rs=;
        b=fZOgmbk15fw5B60sjeiXergmYVpLoaJZvdyMNT+lOjbZszmgAfgMlTYjhEZhuryByl
         6xlpMl8QdbYUuSg9FfzItldxHQTrGS4trLpgtbjt0lS7U5g0NPOmoXutoywI9rX3nLHy
         12HTLQpGKi4ExXBH4ZIJfdgiwhDrR6zKJta1Y8Xc2O3Y2McLIGRozM1nV3xiTrPxSfnE
         WBGUQH1/DBjTN7Oci9aw74le5Cz8+7/spJfhKmz4p89Wsa0ZRXZKE5U+euA/MzZUMGiJ
         01ah0HT9rFaPbbPdpgPb0TsNJ+93CLFSb0GQnm2JMt/0ezJHXKqn/LmuGSjjt/39hp5J
         j+MA==
X-Forwarded-Encrypted: i=1; AKwUvBxTjh5qPj4HCzP5ErMXjgJxTUHxBy175wEG1H67OlcOD5Kk7E6elrqNczJeKwlXKDoIcGgtANYKcZH5wpQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8pXtEdOMKGBKHZm/rBf3fT5Ss/Ew+QD9hHWQ8ESSlYj6Dwr98
	mttUdZ1NgaOL6aFaJNBSWZLtLM2IElnD7PdTbkYK6tIrE5V+dFKlC9zUQHAdkHPOgbap0vvOC+X
	gdHUFGm7jfCdykuPTH6ac7kAnQlGhbrDDphswyxVmFH2+YDPsSaKcfkOBHQQZi79VbQ==
X-Gm-Gg: AYBFou0SLQggAOPCZ9j1KFXI4eEFJX+eUozWU6u7MvLWRrKas7x+RFQODqdrSXYMBqc
	UWA4tk2bHtAks34+J1neJ3pqMNAhpid+cEEvfdIlprhpwYnJnfQzF21Uxn/i4godXAnRCT6bkej
	oCZYLuADoQZ+tAGe/gFU1rYqiA9i0L3RzqR9/HxJASaSDpt9li7ggTYIqBos80cbPZLgdP/YmB7
	L1dDUwuKVRKCGBau8ppugp/6tTQaOq0qIs95cuQ4/yN9JLjW8nIlktvrWH92WAiCaxjduOo2Umn
	5mGh1SraAp9zK2GPaD18+syECV++A1Qfzx+UPm6JWcQcEjEErqOjqxIzWsxEdjcEEBZqeveBat0
	1fFSKuYI9kkGfZ5TzCWQRaiEhsVIbuW1F
X-Received: by 2002:a17:90b:4ac6:b0:3a4:c673:764a with SMTP id 98e67ed59e1d1-3a6cecac6b7mr358822a91.42.1790886439215;
        Thu, 01 Oct 2026 13:27:19 -0700 (PDT)
X-Received: by 2002:a17:90b:4ac6:b0:3a4:c673:764a with SMTP id 98e67ed59e1d1-3a6cecac6b7mr358807a91.42.1790886438569;
        Thu, 01 Oct 2026 13:27:18 -0700 (PDT)
Received: from [192.168.1.86] ([206.83.119.45])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f439f9f9sm5933422a91.1.2026.10.01.13.27.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 13:27:17 -0700 (PDT)
Message-ID: <27748440-8d0c-4163-bc73-842b77791017@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 06:27:12 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] tee: optee: build the Arm-specific code only on Arm
To: marouene.boubakri@oss.nxp.com, jenswi@kernel.org
Cc: sumit.garg@kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        peter.lin@sifive.com
References: <20260924105145.532787-1-marouene.boubakri@oss.nxp.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <20260924105145.532787-1-marouene.boubakri@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BCn-RNvp8w7C9vFSmjLk7xn1rHrp8gc-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA4MSBTYWx0ZWRfX69UK1LvCUoDN
 8hsu/QwfV9hQhwsAHBL5AxMk1I5tMcp+Uza8f4BNONjIn/tIuKciKNnr37MwKXUa0wBa4ltpRn3
 wnNOL8KItmO32Jd7RinOoLZwXoKMrD4=
X-Proofpoint-GUID: BCn-RNvp8w7C9vFSmjLk7xn1rHrp8gc-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA4MSBTYWx0ZWRfX+0Uc5W1S6Ltm
 QeuCxYmdqvtfZ5G0RQZo2psHOcV8PydGV2hsv1K7SokwXuGcxGyiS0MCQjsncVEyLQZojmntouQ
 DEI9k3QnMD/vBQZOQfJnsRSqYdBZuduY95OqsQbOabU3Mi2M2+Rz9j4WZJRrEffpkPnNxzbZGcz
 RmuJta2p05gMGIltOs27o0drjVJlzHYmI2Xj/rzNgyC84u4dXijx2syCMJIjqEivhR9XqA7MaEA
 fP/izGXSS9mYQugohTYdaQ/omNDa5tFHhcbr4CMxWCPOo/Eqd6vhMAcrgFQBWnv9gOyca1tKbsS
 KpNo9Zace3nkX4riDZayE9jq1EpMxec4PleXxl5M6nPoeawpygEHScu6yVcR3AJmc2QTF+TaD9q
 Y+Y9g5dXr2KtvI1P3I4yhl79dgzEjYdO8Y7MUjA6Msz7Qv3GoOtWUCJo/adaoWkm854BKA4Zn/+
 3T85ZVRSqe3PTTZckdw==
X-Authority-Analysis: v=2.4 cv=D87SufRj c=1 sm=1 tr=0 ts=6abec228 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nLoy2YM07uCa/jC45NrMpw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8 a=uypRWGK5JkTHnb3kk54A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010081

Hi Marouene,

On 9/24/2026 8:51 PM, marouene.boubakri@oss.nxp.com wrote:
> From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
> 
> The OP-TEE driver reaches OP-TEE through the SMC ABI or the FF-A ABI,
> both specific to Arm, yet builds both unconditionally together with the
> SMC Calling Convention definitions they rely on: ffa_abi.c is always
> compiled and only its registration is conditioned on
> IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT), and optee_private.h includes
> <linux/arm-smccc.h> and defines the SMC and FF-A specific types for
> every file of the driver. This is fine as long as the driver depends on
> HAVE_ARM_SMCCC, but it keeps the driver from being built for an
> architecture without SMCCC, such as RISC-V.
> 
> Build smc_abi.c only when HAVE_ARM_SMCCC is set and ffa_abi.c only when
> the FF-A transport is enabled, and provide stubs for their registration
> otherwise, so that it fails with -EOPNOTSUPP as the FF-A ABI already
> does when the FF-A transport is not reachable. Keep the SMCCC header,
> the SMC invoke function type, the SMC and FF-A specific structures and
> the SMC RPC register parameters in optee_private.h under the same
> conditions, and drop the unused <linux/arm-smccc.h> include from
> notif.c.
> 
> Make OPTEE depend on ARM_FFA_TRANSPORT || !ARM_FFA_TRANSPORT, as it
> already does for RPMB, so that the driver is limited to a module when
> the FF-A transport is one, rather than built in without FF-A support.
> ffa_abi.c is thus built exactly when the FF-A transport is reachable
> from the driver, and the IS_REACHABLE() checks in
> optee_ffa_abi_register() and optee_ffa_abi_unregister() are always
> true, so drop them.
> 
> OPTEE still depends on HAVE_ARM_SMCCC, so smc_abi.c is still always
> built. The only visible change is that OPTEE=y can no longer be
> combined with ARM_FFA_TRANSPORT=m: such a configuration now resolves to
> OPTEE=m, with the FF-A ABI available.
> 
> Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
> ---
> Changes in v4:
> - Make OPTEE depend on ARM_FFA_TRANSPORT || !ARM_FFA_TRANSPORT so that
>   the driver is limited to =m when the FF-A transport is =m (Jens).
> - Update the commit message accordingly.
> v3: https://lore.kernel.org/all/20260922131735.524635-1-marouene.boubakri@oss.nxp.com/
> 
> Changes in v3:
> - Dropped the RPMI ABI placeholder and the RISC-V enablement patches,
>   this is now a single patch (Jens).
> - Key the FF-A parts of optee_private.h on IS_REACHABLE() instead of
>   IS_ENABLED(): with OPTEE=y and ARM_FFA_TRANSPORT=m kbuild drops
>   ffa_abi.o from the built-in optee.o while optee_ffa_abi_register()
>   was still declared, which does not link.
> - Drop the now always true IS_REACHABLE() checks in
>   optee_ffa_abi_register() and optee_ffa_abi_unregister().
> - Describe the current FF-A conditional compilation accurately in the
>   commit message.
> - Posted as a new thread with a proper subject prefix.
> v2: https://lore.kernel.org/op-tee/20260915020235.507302-2-marouene.boubakri@oss.nxp.com/
> 
> Changes in v2:
> - No code change, the testing section of the cover letter was completed.
> v1: https://lore.kernel.org/op-tee/20260914175435.118303-2-marouene.boubakri@oss.nxp.com/
>  drivers/tee/optee/Kconfig         |  1 +
>  drivers/tee/optee/Makefile        |  4 ++--
>  drivers/tee/optee/ffa_abi.c       |  8 ++-----
>  drivers/tee/optee/notif.c         |  1 -
>  drivers/tee/optee/optee_private.h | 39 ++++++++++++++++++++++++++++++-
>  5 files changed, 43 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/tee/optee/Kconfig b/drivers/tee/optee/Kconfig
> index 50d2051..891dac6 100644
> --- a/drivers/tee/optee/Kconfig
> +++ b/drivers/tee/optee/Kconfig
> @@ -5,6 +5,7 @@ config OPTEE
>  	depends on HAVE_ARM_SMCCC
>  	depends on MMU
>  	depends on RPMB || !RPMB
> +	depends on ARM_FFA_TRANSPORT || !ARM_FFA_TRANSPORT
>  	help
>  	  This implements the OP-TEE Trusted Execution Environment (TEE)
>  	  driver.
> diff --git a/drivers/tee/optee/Makefile b/drivers/tee/optee/Makefile
> index ad7049c..183cdde 100644
> --- a/drivers/tee/optee/Makefile
> +++ b/drivers/tee/optee/Makefile
> @@ -7,8 +7,8 @@ optee-objs += rpc.o
>  optee-objs += protmem.o
>  optee-objs += supp.o
>  optee-objs += device.o
> -optee-objs += smc_abi.o
> -optee-objs += ffa_abi.o
> +optee-$(CONFIG_HAVE_ARM_SMCCC) += smc_abi.o
> +optee-$(CONFIG_ARM_FFA_TRANSPORT) += ffa_abi.o
>  
>  # for tracing framework to find optee_trace.h
>  CFLAGS_smc_abi.o := -I$(src)
> diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
> index 633715b..08236d8 100644
> --- a/drivers/tee/optee/ffa_abi.c
> +++ b/drivers/tee/optee/ffa_abi.c
> @@ -1212,14 +1212,10 @@ static struct ffa_driver optee_ffa_driver = {
>  
>  int optee_ffa_abi_register(void)
>  {
> -	if (IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT))
> -		return ffa_register(&optee_ffa_driver);
> -	else
> -		return -EOPNOTSUPP;
> +	return ffa_register(&optee_ffa_driver);
>  }
>  
>  void optee_ffa_abi_unregister(void)
>  {
> -	if (IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT))
> -		ffa_unregister(&optee_ffa_driver);
> +	ffa_unregister(&optee_ffa_driver);
>  }
> diff --git a/drivers/tee/optee/notif.c b/drivers/tee/optee/notif.c
> index 6e85f2f..6801422 100644
> --- a/drivers/tee/optee/notif.c
> +++ b/drivers/tee/optee/notif.c
> @@ -5,7 +5,6 @@
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
> -#include <linux/arm-smccc.h>
>  #include <linux/errno.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
> index aefe1e6..02d6f79 100644
> --- a/drivers/tee/optee/optee_private.h
> +++ b/drivers/tee/optee/optee_private.h
> @@ -6,7 +6,6 @@
>  #ifndef OPTEE_PRIVATE_H
>  #define OPTEE_PRIVATE_H
>  
> -#include <linux/arm-smccc.h>
>  #include <linux/notifier.h>
>  #include <linux/rhashtable.h>
>  #include <linux/rpmb.h>
> @@ -15,6 +14,10 @@
>  #include <linux/types.h>
>  #include "optee_msg.h"
>  
> +#ifdef CONFIG_HAVE_ARM_SMCCC
> +#include <linux/arm-smccc.h>
> +#endif
> +
>  #define DRIVER_NAME "optee"
>  
>  #define OPTEE_MAX_ARG_SIZE	1024
> @@ -42,10 +45,12 @@
>   */
>  #define OPTEE_DEFAULT_MAX_NOTIF_VALUE	255
>  
> +#ifdef CONFIG_HAVE_ARM_SMCCC
>  typedef void (optee_invoke_fn)(unsigned long, unsigned long, unsigned long,
>  				unsigned long, unsigned long, unsigned long,
>  				unsigned long, unsigned long,
>  				struct arm_smccc_res *);
> +#endif
>  
>  /**
>   * struct optee_call_waiter - TEE entry may need to wait for a free TEE thread
> @@ -119,6 +124,7 @@ struct optee_supp {
>  	struct completion reqs_c;
>  };
>  
> +#ifdef CONFIG_HAVE_ARM_SMCCC
>  /**
>   * struct optee_pcpu - per cpu notif private struct passed to work functions
>   * @optee:	optee device reference
> @@ -149,7 +155,9 @@ struct optee_smc {
>  	struct work_struct notif_pcpu_work;
>  	unsigned int notif_cpuhp_state;
>  };
> +#endif
>  
> +#if IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT)
>  /**
>   * struct optee_ffa -  FFA communication struct
>   * @ffa_dev:		FFA device, contains the destination id, the id of
> @@ -170,6 +178,7 @@ struct optee_ffa {
>  	struct workqueue_struct *notif_wq;
>  	struct work_struct notif_work;
>  };
> +#endif
>  
>  struct optee;
>  
> @@ -257,8 +266,12 @@ struct optee {
>  	const struct optee_ops *ops;
>  	struct tee_context *ctx;
>  	union {
> +#ifdef CONFIG_HAVE_ARM_SMCCC
>  		struct optee_smc smc;
> +#endif
> +#if IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT)
>  		struct optee_ffa ffa;
> +#endif

Does this need to be a union if we filter the members?

Best Regards,
Amir

>  	};
>  	struct optee_shm_arg_cache shm_arg_cache;
>  	struct optee_call_queue call_queue;
> @@ -290,6 +303,7 @@ struct optee_context_data {
>  	struct list_head sess_list;
>  };
>  
> +#ifdef CONFIG_HAVE_ARM_SMCCC
>  struct optee_rpc_param {
>  	u32	a0;
>  	u32	a1;
> @@ -300,6 +314,7 @@ struct optee_rpc_param {
>  	u32	a6;
>  	u32	a7;
>  };
> +#endif
>  
>  /* Holds context that is preserved during one STD call */
>  struct optee_call_ctx {
> @@ -422,9 +437,31 @@ static inline void reg_pair_from_64(u32 *reg0, u32 *reg1, u64 val)
>  }
>  
>  /* Registration of the ABIs */
> +#ifdef CONFIG_HAVE_ARM_SMCCC
>  int optee_smc_abi_register(void);
>  void optee_smc_abi_unregister(void);
> +#else
> +static inline int optee_smc_abi_register(void)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline void optee_smc_abi_unregister(void)
> +{
> +}
> +#endif
> +#if IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT)
>  int optee_ffa_abi_register(void);
>  void optee_ffa_abi_unregister(void);
> +#else
> +static inline int optee_ffa_abi_register(void)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline void optee_ffa_abi_unregister(void)
> +{
> +}
> +#endif
>  
>  #endif /*OPTEE_PRIVATE_H*/
> 
> base-commit: 827751b699b79a6e569983359c02dce67f81b94c

