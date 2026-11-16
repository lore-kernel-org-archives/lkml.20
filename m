Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815302;
	b=x/Ld78rSFE6BJ40VHv+WyDftzRBCrf6WycUFOTMIiWaNgLb8m7zn/ZPF+sH7io1ZdcL2
	 ZFb2/ZSs7JUg2h6DoXvqFsHxUQ0EO+BWZ/9UUU+8eM+wDQT6jzcOSJuyG8xlUsBT37+HK
	 PO9/DvoSAwovb4Q3/A/x870b0mMO+3AJ6vFyxEcu4g70pipLdchkBESIrpCtxrjJnwBWk
	 C/esV3hqFevICY8D1qR38A23YiYLRQZoIPzPPQiwdVorVA4nPT8KnknHa7vBBLvc6IuRw
	 EgNOQ4acPZdt9yVXeNsphXgHkw8MSYm66Kumx8AEq2Roo61a9hTdAIPU7UtAl724Ycw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815302;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IGNFYATSTRk0m4sDibX1E1epOFieqLBD3Mxm7XMYiAo=;
	b=uQ+QzasvTp5HrYOA89iMHXQ+We5gYrO0mvZ10a0rfg8kuuNfL1sdqn+wZw3r9xWvI++h
	 xdk1QUmwkgDOaXKyHnOteTVOwac//leEUp0qTU+F1Ya4a4ucMQqRE04TNs8viXtd8759N
	 mIAnvI7+cNkovto0BXeoE2ZMMS+9XWc/gRP6yrfNiCoo9vrV+3+fZSeoTHZbdr53D2pVr
	 KxkdOBg6x+UO1QYmSaruQBmu9R1qYIV5YIJziaHRwr8gKx2NRJBHyWmWSBMfZXVlShgN5
	 edkFhBYS2FqW9s43FJ0Iv6fk19sAwwb+3FzeZCSjYtolG8UWQKheJEUO61QJ52urhbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fkM10zgx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kqH0MXWW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CADA606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CADA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fkM10zgx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kqH0MXWW
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7enOC1109759
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IGNFYATSTRk0m4sDibX1E1epOFieqLBD3Mxm7XMYiAo=; b=fkM10zgxBcivPLtZ
	wRyCEo6iKmL35cEIZXHB1ARHguiqNFBWF1bsYdASwHb5PiS+bgacwG1gXaFq6//1
	kcq6kvbPZrTbtkWGId2MQyBGYE4N6xR28eQaQyUIlvQIJoq52tjwOH+qEISkVb7x
	gOnWkHFxvKe0i2WpgvgqAr3uCl5/DbV5BGusp4MEPGBKGe5IsFexLeCMuS37OOWw
	IFv6oiPCftpvZj9v/QaYS70oe+d4Tk0yyw7y4CMgeIWj8SISH7WqPr9PDHrgMHbe
	3ksEHTxtoGhZXyY/XinY34nDP1vXoqFRZK792U7cO6VWSpzHEe1S+NIH1c7pSUcz
	m9xH6w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyrmc13x6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:48:21 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b60129a46eso4167021b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794815300; x=1795420100; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IGNFYATSTRk0m4sDibX1E1epOFieqLBD3Mxm7XMYiAo=;
        b=kqH0MXWWXRSywgRY65HlZfS5seJiTAOvsG5rQSmQW7hF0NokRE5T1SEgWQMvJhOvmH
         8N44vrnJzmtLq9saAalRCznTRq2EOqnmhvv4ub9/0fWfNEv9OWV7serrcMCluVqPUWx3
         X65hjux3maYMo1Fvzy9m9xJPDfw5IgZnI2vAwlM1FgtOQ/El1Nz457qQlJ92mQdLvl7D
         98kLPFpRpwU0zgW/ReB353dbA952CDgAl+si5G//3lD2T5NUCFWqw4OudqsPZ7LN6CUO
         TU2jzEvmGe/C2jcFnwLIm6Xp3CpChOu4EpewKDr7UnIe0JTvaP5CWCbnDGY9p1PX+Wx7
         5OHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815300; x=1795420100;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGNFYATSTRk0m4sDibX1E1epOFieqLBD3Mxm7XMYiAo=;
        b=yzo1f+bOQ9W7y1Xfj1WhtfOpF2/ZAybdHqBaC5Z7F+5g9cwhUUJD57Gf3xHc3CYbPn
         MfR7jtlbhbHLrhigghtqGhvnCFq+q+EYToFaYG6ShB8tcvMN4SeNzghC/hIndDcP1jug
         EXaUQhKlaLNHrXcKgj9SKTd1mrGloI+FzUcaZMgOVQ+Zl3STrxGGUvtSR5NKu3ycJzEI
         oz35GH7bjkr3KuPEHu+sJxdixxu3emq1+TjahEh/BVNdYQyV/2Okq1PpE/KpGKzQskY2
         pXEj85Jx+Ok3fowQY52Eh3k7i8PVU/0frpulX1KkA3LkVwO199BZWsO/Sof1IhFSdHfQ
         HyVQ==
X-Forwarded-Encrypted: i=1; AL+hErFRyo0k4x6tpo9i01I61/AU4pFajOG1xrozY3/J+E9Zj3RK0cVWPiBKlq4BfFnl8SIv2sVuUp8sl8zbedo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+k4M9H8VSi28Z0ovUASIYpEZ1zH5ARkFjxXUtiJTXGIYyiLX3z
	zHy5QBcmaRHJ5eCod6hG4vntnfjZHhK3QJkjowSqERfd7E+addIud4JQJSwEoGH/4wk2iv/8k4i
	IB9nglMVAH4sqQHXwb4ccjbSD0Wbtw9CrB6CHGatyySUw2XD/M1DMgrgQQMwiUJ3XJb8=
X-Gm-Gg: AYBFou3l3W6WwuU2JjFtLRWhHJW0lveTaNU0/UYmv3WuIgji9Z428d9FaMDmmPSiolQ
	oQzBPSxRgOJ6fseCs3yr11sLbNCLFAO/TTkuFE047DzXV3mVs14gksXytup4Fqyj2YKHE4KALj/
	JB5/U+cPS0O0n8bjCQTEeR9sIdiDzbIfuUJHHpl26fZVXwoPg9JFV3NnwFPly4mmZvuiHOBFCGY
	+t3vKiTD8UoCnCEmt1ohZEnh5Nma2pMDIHjWiridMfutYRW9oHYRl2VgKu9SrJ2ByOz28cyCoN/
	NgGNbzq0TDTifJQpZrZvfUTySqGeg87q6/iL38xtmqDA59tkDSNPWMzvpMw7yHfYMRWJHiFrgqW
	nVWEhw72rI+Z/KNaXZ3M1dVI8KSiG1LbdgV0UhAng+RWLrKf/mekqyoRAiWuE3vbtzorgJzXb/6
	tRJHQ=
X-Received: by 2002:a05:6a00:4f90:b0:886:3827:c4a2 with SMTP id d2e1a72fcca58-8beb20cec9fmr9592568b3a.3.1794815300545;
        Sun, 15 Nov 2026 23:48:20 -0800 (PST)
X-Received: by 2002:a05:6a00:4f90:b0:886:3827:c4a2 with SMTP id d2e1a72fcca58-8beb20cec9fmr9592541b3a.3.1794815299983;
        Sun, 15 Nov 2026 23:48:19 -0800 (PST)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed243e643sm3450597b3a.42.2026.11.15.23.48.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 23:48:19 -0800 (PST)
Message-ID: <8abf16ac-7906-4ff6-ba4c-4e3f2c00b214@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 13:18:15 +0530
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
Subject: Re: [BUG] qcom-spmi-adc-tm5: lockdep reports invalid wait context in
 IRQ handler
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Lee Jones
 <lee@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <1cb6d902-73f3-4d65-96f4-4b3c5217253c@oss.qualcomm.com>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <1cb6d902-73f3-4d65-96f4-4b3c5217253c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzMCBTYWx0ZWRfXxE6X1iN52kUu
 AQqUL2QRbSxCdC0i77hcqiX0azB3WMGOf2R+IbmaXjWR/W2HB8zJtVA8ijHQYiOGJFl0ipguVeJ
 Hs8aBCnTg1hEj1yYFfsRaYMOyo7Ar+4=
X-Authority-Analysis: v=2.4 cv=C9N8WgP+ c=1 sm=1 tr=0 ts=6afab545 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=j9aXnjOe7kIp99Lnl9cA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: QXxZAGYiTh77e9uM21rBA1_fJkwIC7WZ
X-Proofpoint-GUID: QXxZAGYiTh77e9uM21rBA1_fJkwIC7WZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzMCBTYWx0ZWRfX4rtYQh06NUqO
 6EUeLsc0OsXhZ6BBRtylb7UKhAPU7zOJPLy3UTY2/lMu1TvsYd7/Q9gyP4V66+1ZPChKX08tcDs
 XkskiQUvWpo+MLlf8aLb98/3Bv0akx3f+CjfDHBgiHODaGyrkVDx59OmmjuHdMvBGw47z+6qrZ3
 oFoUmgW25geYS+Phxr4HC/zwzeeT+6I7+PiSUqqcpR7VGoYRYFDHA/9tJ/XtWH11wGPkKqTw5Nr
 Ua2RlrV37bVilvWltk0rXxxuJTnuOq3vFMINhtgeNhpKGcPfaPvxdLWaR+uSH5ZQQ899xo8osU1
 ZvQNkh0P40IadruzRsOEQfGTpX10RpcVRMygwZydauA5yX7FUErwfBKLj0WbsKFp3geHvTj1cwN
 RZsDqZfRcf7dIigPHKOdm/k32awU03S0E97FM1GOBRKHIhfjbmkqHVVYO0sqBdfFjqFUUTQjSF9
 6eDG0zNoVwoMw/C1hcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160030

Hi Pankaj,

On 11/6/2026 11:37 AM, Pankaj Patil wrote:
> Hello,
> 
> I am seeing the following lockdep warning on Linux v7.4-rc1 when
> CONFIG_PROVE_LOCKING is enabled. I can reproduce it on a Qualcomm Glymur
> CRD and so far I have only observed from v7.4-rc1 and only when
> CONFIG_PROVE_LOCKING is enabled.
> 
> The warning is triggered from the Qualcomm SPMI ADC TM5 Gen3 interrupt
> path while adc5_gen3_read() performs a regmap read:
> 

I have pushed a fix for this lock warning here:
https://lore.kernel.org/all/20261113-adctm5_gen3_hardirq_removal-v2-1-a0c9c4800941@oss.qualcomm.com/.

The issue happens due to taking a spinlock in a regmap read during the
primary IRQ handler. The fix moves all the actions of the primary handler
into the threaded handler as having a separate primary hardirq handler
is not strictly necessary.

Thanks,
Jishnu

> swapper/0/0 is trying to lock:
> ffff000b67201018
> (qcom_spmi_pmic:259:(&spmi_regmap_config)->lock){....}-{3:3}, at:
> regmap_lock_spinlock+0x20/0x40
> other info that might help us debug this:
> context-{2:2}
> locks held by swapper/0/0: 0, last CPU#0
> stack backtrace:
> 
> CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 7.4.0-rc1 #1 PREEMPT(full)
> 
> Call trace:
> check_wait_context.isra.0+0x2d8/0x380
> __lock_acquire+0x2ec/0x840
> lock_acquire.part.0+0xe0/0x250
> lock_acquire+0x8c/0x1e0
> _raw_spin_lock_irqsave+0x6c/0xd8
> regmap_lock_spinlock+0x20/0x40
> regmap_raw_read+0x88/0x328
> regmap_bulk_read+0x10c/0x340
> adc5_gen3_read+0x38/0x50 [qcom_spmi_adc5_gen3]
> adctm5_gen3_isr+0x90/0x130 [qcom_spmi_adc_tm5_gen3]
> 
> There is also an ADC timeout around the same time:
> 
> qcom-spmi-adc5-gen3 c42d000.spmi:pmic@0:adc@9000:
> Reading ADC channel pm8550_gpio_02 timed out
> 
> Kernel/platform details:
> 
> Kernel: 7.4.0-rc1 #1, PREEMPT(full), not tainted
> Platform: Qualcomm Glymur CRD
> Firmware: 6.0.260410.BOOT.MXF.2.4-00601-HAMOA-1 (04/10/2026)
> Config: CONFIG_PROVE_LOCKING=y
> 
> The full backtrace is:
> 
> [   12.924146] 7.4.0-rc1 #1 Not tainted
> [   12.927848] -----------------------------
> [   12.931982] swapper/0/0 is trying to lock:
> [   12.936217] ffff000b67201018
> (qcom_spmi_pmic:259:(&spmi_regmap_config)->lock){....}-{3:3}, at:
> regmap_lock_spinlock+0x20/0x40
> [   12.947855] other info that might help us debug this:
> [   12.953060] context-{2:2}
> [   12.955773] locks held by swapper/0/0: 0, last CPU#0
> [   12.960896] stack backtrace:
> [   12.963889] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted
> 7.4.0-rc1 #1 PREEMPT(full)
> [   12.972208] Hardware name: Qualcomm CRD, BIOS
> 6.0.260410.BOOT.MXF.2.4-00601-HAMOA-1 04/10/2026
> [   12.981070] Call trace:
> [   12.983606] show_stack+0x20/0x38 (C)
> [   12.987398] dump_stack_lvl+0x7c/0xb0
> [   12.991180] dump_stack+0x18/0x24
> [   12.994610] check_wait_context.isra.0+0x2d8/0x380
> [   12.999552] __lock_acquire+0x2ec/0x840
> [   13.003514] lock_acquire.part.0+0xe0/0x250
> [   13.007837] lock_acquire+0x8c/0x1e0
> [   13.011530] _raw_spin_lock_irqsave+0x6c/0xd8
> [   13.013256] qcom-spmi-adc5-gen3 c42d000.spmi:pmic@0:adc@9000: Reading
> ADC channel pm8550_gpio_02 timed out
> [   13.025949] regmap_lock_spinlock+0x20/0x40
> [   13.030264] regmap_raw_read+0x88/0x328
> [   13.034227] regmap_bulk_read+0x10c/0x340
> [   13.038368] adc5_gen3_read+0x38/0x50 [qcom_spmi_adc5_gen3]
> [   13.044118] adctm5_gen3_isr+0x90/0x130 [qcom_spmi_adc_tm5_gen3]
> [   13.050313] __handle_irq_event_percpu+0xac/0x4c8
> [   13.055170] handle_irq_event+0x54/0x120
> [   13.059218] handle_edge_irq+0x104/0x1d0
> [   13.063272] handle_irq_desc+0x3c/0x68
> [   13.067152] generic_handle_irq+0x28/0x40
> [   13.071289] periph_interrupt+0xe8/0x1c0
> [   13.075353] pmic_arb_chained_irq+0x148/0x380
> [   13.079860] handle_irq_desc+0x3c/0x68
> [   13.083730] generic_handle_domain_irq+0x20/0x40
> [   13.088503] __gic_handle_irq.isra.0+0x58/0x108
> [   13.093179] gic_handle_irq+0x1c/0x40
> [   13.096976] call_on_irq_stack+0x30/0x48
> [   13.101024] do_interrupt_handler+0x88/0x98
> [   13.105342] el1_interrupt+0x3c/0x60
> [   13.109035] el1h_64_irq_handler+0x18/0x30
> [   13.113268] el1h_64_irq+0x78/0x80
> [   13.116791] cpuidle_enter_state+0x13c/0xa10 (P)
> [   13.121552] cpuidle_enter+0x40/0x60
> [   13.125251] cpuidle_idle_call+0x184/0x270
> [   13.129483] do_idle+0xac/0x150
> [   13.132729] cpu_startup_entry+0x40/0x58
> [   13.136786] rest_init+0x214/0x220
> [   13.140309] start_kernel+0x4c4/0x4d0
> [   13.144097] __primary_switched+0x88/0x98
> 
> Please let me know if additional logs, the kernel config, or testing of
> a proposed fix would be useful.
> 
> Thanks,
> Pankaj

