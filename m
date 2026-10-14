Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FD1352032
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791950573; cv=none; b=CHp0UbRDEum36XoSJZ/IdBoP87xcVBkT1dquiaIAMhcN3dB+fvDA+pUx71ZyhOg8eIEEUWtH+F7gBNxCclAb3tdw5hVTVQeTu6Fjl0dobsZ+X5GrVN5BPjairq/6uSoPx93p6OxI6qcTu55p4+glXlAzYDePWhm3Qp6VkSgofVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791950573; c=relaxed/simple;
	bh=zyFH7BN9ULbDLnV9+6C+CotRQ6LBNKREOzyRpiZpaDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eppNyoWtvDw/WaEPJdcI3b7LSyGEX6FQc1JRmFQQk2/4lpHlVnZjGdIgZa5VHcMdzlLS9bM5KllG6GjCjbY2UwKSTELNwGsntg3GIEn9rPNNqLU7kGX2JeeVN/Q1YJdmfY99cRKL6fGO6ZaKh/RozOr27ABj8mOdVKIFosVCCvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p52aLg4o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XsXGfdJt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p52aLg4o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XsXGfdJt"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DJaAMV2222099
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VWdbP2YpPS6VQfeV27iDbD/q
	vWCuu42ZlVxsIM4yMqU=; b=p52aLg4oqtWTVq+OGhn1mbuFCCdAblvqzUacGfB0
	U6X48RQ5MqlULeAjZr6+vISYvjeYJszESwFiSAp9TAIlVwKQvVJzUIML7zfIZ7yp
	8f7J7WLfwEgM9ojdBzkMMC6ZpO0mKO3M5v5lNRCEFFA0EXmeNwOG1M3O/1TeBtGD
	du4HXJ3eAwg/aIY+xMLOznrb8aluZFhodl+laqpIGjNsfydnfsKMcg00yI9HUICL
	QXHmP/apS4j/N26cP7DpOnPDY+dUcYtd6LGIhrrKr/ThtFdRiMJsewoZa0YMHr3T
	wRvWhxyZIOgEHBISEXEodQcOo3krDbHteXU0A/KH9M3PyQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9txs9m4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:02:51 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so10060959eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 21:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791950571; x=1792555371; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VWdbP2YpPS6VQfeV27iDbD/qvWCuu42ZlVxsIM4yMqU=;
        b=XsXGfdJtjoOl1k4P6y8NfYE/K5BDKzYObKhcaViAnb4iP7QvKvI7deGKBe/awZHsSR
         LzIbIZNVfCnPXb1sjGaB+wvfEkDA3gCvlyWHCKH/zSCZn54wAQ46fe30sfqZVm97v+W/
         hjjKF02dlmxqIsuNlayl+A7/5ZdS9HS68PAKJfXcCjunAjohL3LjPE17tUv18K0J1yEq
         5UZ/wAOUrXENVxEH5izYDb+t4yk6OLWTgsTBPGd7uO2kVs8qQ4X6kkq7S3VOG5Jk+2r2
         jpHTPV/ijKrjFhjB+XPuoSwcOovt1SDjmj85kn6tTTQ0t1D6XDRPttnhpvoycP9I8Qc0
         QUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791950571; x=1792555371;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VWdbP2YpPS6VQfeV27iDbD/qvWCuu42ZlVxsIM4yMqU=;
        b=wM1fYQx4BEWXt59tID/j3Z7WTSxNNB2YePgHvBglgrJC8ihAOOLspvWzz4wgYOzUGX
         mT57xt432xWjY8t0ubjdgbhroJgfX+NWJ62jEEyaNWZiHcI1i3ZiOYkIbYZrf58kzWxM
         oxsvtmQRfOdptZStucZ+uj54zCpoUiYJt0jLYfvtArHLUHmyoBDULmY6ynlQPbkKWxFo
         fIACUzwnRRmfwE3Ni6mhYmlwtlTB4YsSkvCckcKZ/Yq3/2Xqz38vpo3vuFBkRSv3n0Ne
         v4JYAkMiqwZPHw0cAKiXY19+EnH8oIlv3l7TqxG8KwVDmiKYjUaK8hvet/iIJUjCewZ8
         wJkw==
X-Forwarded-Encrypted: i=1; AKwUvBwbzFEkPUJT53zo7gu2EffUD9a8TRSZQ5s6Z/CD4lqh450Vh5vPDqGvqtoS92frqGq5QfJsdhdBaDT+obE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJL0hWo6tgQOOzateSgSJ/ksMWE4ImPJbwPiQC44IkIV03j4iaa
	sedH6DmalXLqXy6pS3QcKK+Xywl10T7qCgOw364/T4vAPRFzkEOoymtWNL43HXHbeS+PIA6Ipe1
	H2acGRlpMlDepU3USHryYsIzcUsb/Ud2lyo5csEPuCQ2DbsH4RyezJrWZy+5Y6Lglec4=
X-Gm-Gg: AYBFou3tHQvkG168q38sK+goIJgiVAxrKbg6A1mYL4FvDYW8+DuXV1qos7zPOdtWjf8
	y8RJb018WgEYsz/fLGXuk2ljWwOgTR/y6CTLBs/Fn0IK7qqt31NKSI1SzLqBiKzemXgPiiTBinP
	4qTtMgvgZhlGo2xcBRuIu4Rlbrs8sWkkbhFAgpexRZjQ/Ri/osfmHz0p274QyIBvrMCEk/G1/t4
	w+OPiW9SsgBwWMp+cd9jXGUx2HmM7jl2XNJLtftDnTwYmO9YMoJwee6/2mq5YD2Qys5jweQ0nNZ
	Scs3eygWaDGgbh2Ou70dMzpfMk6xlwhQyEAjYyY0/MWXPln6sGvCVnA8dFLVQ+ui5dq28624JVA
	tfXtRB90+yxC4K/75BnqmmT7w8UKzCHIiRN2/B9/r3CfsgYD4aCth6IfWePjrBsCNvoD3X3WRCk
	+sG1I48bpPjeXkRtO7NcugvDJ0
X-Received: by 2002:a05:7300:f0ce:b0:34b:b410:9352 with SMTP id 5a478bee46e88-3537de1ce96mr19572197eec.1.1791950570410;
        Tue, 13 Oct 2026 21:02:50 -0700 (PDT)
X-Received: by 2002:a05:7300:f0ce:b0:34b:b410:9352 with SMTP id 5a478bee46e88-3537de1ce96mr19572147eec.1.1791950569770;
        Tue, 13 Oct 2026 21:02:49 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb61asm50995980eec.21.2026.10.13.21.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 21:02:48 -0700 (PDT)
Date: Wed, 14 Oct 2026 09:32:36 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Conor Dooley <conor@kernel.org>, Anup Patel <anup@brainfault.org>,
        =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
        Yunhui Cui <cuiyunhui@bytedance.com>,
        Atish Patra <atish.patra@linux.dev>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>,
        Yuanzhu <yuanzhu@bytedance.com>,
        Yicong Yang <yang.yicong@picoheart.com>,
        Susheng Yang <yang.susheng@zte.com.cn>,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v10 RESEND 3/9] riscv: sse: mask events during shutdown
 and kexec
Message-ID: <as7-3PbWDxygadnJ@hu-himchau-blr.qualcomm.com>
References: <cover.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
 <03472b45125793a768f3e5bbc168f167e673d4cc.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03472b45125793a768f3e5bbc168f167e673d4cc.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAxNSBTYWx0ZWRfX6S79AvTwzQpW
 5aSNIDmIithr+77HRSU3gpJv7uG5Pm+trgQDWZnRzbG66gKD2Zu4Fg8Pkq1Zv/p13bkpR2nUEKV
 dfPvXsMyuThGt/Q4IBJWNrB2Ac/UDiyLNxrmjlK3J4gmbm7fNVK4cnrLtVI6fBtI3RVdKM/6F2Y
 9ItP5IyQNbQ7C6NdRMxrVlJuSien1TiC+emJUXutcZg/U/KE5wV1a/iTv+Dd3tQwcSIgQjDpFB7
 dwgoFbZLkyDBpMid+BQEWVVckQKLoSeM9oQUvIKJ/AauPGhPzOhcSNDgXJIqbhKfkobw7II5hjY
 80+yWbzMDbh1bAPyCS5MkzjChZFvALQdcGhYn45xyEWKP/scP4v0nImhIHaDNH00nVzeoOO/liT
 fToMoNmCIQVbXNCFbyGS94hCRlj5rxoXO13ZZlUSrN06W2vY+K/cDkw7DNTNLgq/lfliPvjJDua
 3wIF83EDgH/LKQoNoug==
X-Authority-Analysis: v=2.4 cv=LPPz05W9 c=1 sm=1 tr=0 ts=6acefeeb cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=968KyxNXAAAA:8 a=a_nq2awA8k5mFBtTUooA:9 a=CjuIK1q_8ugA:10 a=O8hF6Hzn-FEA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAxNSBTYWx0ZWRfX2k4SW8kH0UIe
 KDH3byks7BWTqE1abnurlytCq8hNUCML9bd6AvF1p0+XHWyUtPJM/hsGQHxUlpmNzZHG9fQGSKX
 zGidnl0FVRqul2Q/2BnHOptoLXu6OKE=
X-Proofpoint-ORIG-GUID: 9h_IU1X7ajCbrx2p4jm2vKvykv5O82z8
X-Proofpoint-GUID: 9h_IU1X7ajCbrx2p4jm2vKvykv5O82z8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140015

On Mon, Sep 21, 2026 at 07:15:00PM +0800, Zhanpeng Zhang wrote:
> SSE delivery is independent of normal S-mode interrupts. Firmware may also
> retain an event registration until Linux explicitly unregisters it. A hart
> must therefore stop accepting SSE events before Linux stops servicing the
> registered handler.
> 
> Mask SSE on the local hart before panic stop, CPU stop, restart, poweroff,
> and crash shutdown paths. This prevents firmware from entering Linux-owned
> handler state after the corresponding CPU or kernel context is no longer
> valid.
> 
> A crash kernel cannot identify or take ownership of registrations
> inherited from the crashed kernel. Reject a later normal kexec while such
> SSE state may still exist, rather than transferring unknown firmware state
> to another kernel.
> 
> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
> ---
>  arch/riscv/kernel/machine_kexec.c | 11 +++++++++++
>  arch/riscv/kernel/reset.c         | 18 ++++++++++++++++++
>  arch/riscv/kernel/smp.c           | 17 +++++++++++++++++
>  3 files changed, 46 insertions(+)
> 
> diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
> index 738df176ff6f..24e7affae70b 100644
> --- a/arch/riscv/kernel/machine_kexec.c
> +++ b/arch/riscv/kernel/machine_kexec.c
> @@ -14,10 +14,13 @@
>  #include <asm/set_memory.h>	/* For set_memory_x() */
>  #include <linux/compiler.h>	/* For unreachable() */
>  #include <linux/cpu.h>		/* For cpu_down() */
> +#include <linux/crash_dump.h>
>  #include <linux/reboot.h>
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
>  
> +#include <asm/sse.h>
> +
>  /*
>   * machine_kexec_prepare - Initialize kexec
>   *
> @@ -36,6 +39,13 @@ machine_kexec_prepare(struct kimage *image)
>  	unsigned int control_code_buffer_sz = 0;
>  	int i = 0;
>  
> +	/* A crash kernel cannot tear down registrations inherited from firmware. */
> +	if (is_kdump_kernel() && image->type != KEXEC_TYPE_CRASH &&
> +	    riscv_sse_available()) {

I just realized. This rejects a normal kexec from any kdump kernel whenever firmware
merely advertises SSE, regardless of CONFIG_RISCV_SBI_SSE or whether anything is registered.
Can you check if its breaking kexec() with SSE just being advertised?

Also, there are some shasiko's comments worth addressing.

> +		pr_err("Normal kexec from a crash kernel is unsupported with SSE\n");
> +		return -EOPNOTSUPP;
> +	}
> +
>  	/* Find the Flattened Device Tree and save its physical address */
>  	for (i = 0; i < image->nr_segments; i++) {
>  		if (image->segment[i].memsz <= sizeof(fdt))
> @@ -127,6 +137,7 @@ void
>  machine_crash_shutdown(struct pt_regs *regs)
>  {
>  	local_irq_disable();
> +	riscv_sse_mask_current_hart();
>  
>  	/* shutdown non-crashing cpus */
>  	crash_smp_send_stop();
> diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
> index 14eb08a6db85..fdab37e7ae52 100644
> --- a/arch/riscv/kernel/reset.c
> +++ b/arch/riscv/kernel/reset.c
> @@ -6,6 +6,20 @@
>  #include <linux/efi.h>
>  #include <linux/reboot.h>
>  #include <linux/pm.h>
> +#include <linux/smp.h>
> +
> +#include <asm/sse.h>
> +
> +#ifndef CONFIG_SMP
> +void __noreturn panic_smp_self_stop(void)
> +{
> +	riscv_sse_mask_current_hart();
This function call does SSE probe on every call. Wouldn't it be cheaper to do once?

Regards
Himanshu

> +	local_irq_disable();
> +
> +	for (;;)
> +		cpu_relax();
> +}
> +#endif
>  
>  static void __noreturn default_power_off(void)
>  {
> @@ -18,6 +32,8 @@ EXPORT_SYMBOL(pm_power_off);
>  
>  void machine_restart(char *cmd)
>  {
> +	riscv_sse_mask_current_hart();
> +
>  	/*
>  	 * UpdateCapsule() depends on the system being reset via ResetSystem().
>  	 */
> @@ -30,12 +46,14 @@ void machine_restart(char *cmd)
>  
>  void machine_halt(void)
>  {
> +	riscv_sse_mask_current_hart();
>  	do_kernel_power_off();
>  	default_power_off();
>  }
>  
>  void machine_power_off(void)
>  {
> +	riscv_sse_mask_current_hart();
>  	do_kernel_power_off();
>  	default_power_off();
>  }
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index fa66f9c97d74..7f0d4e7332f1 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -23,10 +23,13 @@
>  #include <linux/irq.h>
>  #include <linux/irq_work.h>
>  #include <linux/nmi.h>
> +#include <linux/panic.h>
>  
>  #include <asm/tlbflush.h>
>  #include <asm/cacheflush.h>
>  #include <asm/cpu_ops.h>
> +#include <asm/sbi.h>
> +#include <asm/sse.h>
>  
>  enum ipi_message_type {
>  	IPI_RESCHEDULE,
> @@ -79,8 +82,18 @@ int riscv_hartid_to_cpuid(unsigned long hartid)
>  	return -ENOENT;
>  }
>  
> +void __noreturn panic_smp_self_stop(void)
> +{
> +	riscv_sse_mask_current_hart();
> +	local_irq_disable();
> +
> +	for (;;)
> +		cpu_relax();
> +}
> +
>  static void ipi_stop(void)
>  {
> +	riscv_sse_mask_current_hart();
>  	set_cpu_online(smp_processor_id(), false);
>  	while (1)
>  		wait_for_interrupt();
> @@ -91,6 +104,7 @@ static atomic_t waiting_for_crash_ipi = ATOMIC_INIT(0);
>  
>  static inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
>  {
> +	riscv_sse_mask_current_hart();
>  	crash_save_cpu(regs, cpu);
>  
>  	atomic_dec(&waiting_for_crash_ipi);
> @@ -254,6 +268,8 @@ void smp_send_stop(void)
>  {
>  	unsigned long timeout;
>  
> +	riscv_sse_mask_current_hart();
> +
>  	if (num_online_cpus() > 1) {
>  		cpumask_t mask;
>  
> @@ -301,6 +317,7 @@ void crash_smp_send_stop(void)
>  		return;
>  
>  	cpus_stopped = 1;
> +	riscv_sse_mask_current_hart();
>  
>  	/*
>  	 * If this cpu is the only one alive at this point in time, online or
> -- 
> 2.50.1 (Apple Git-155)
> 
