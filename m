Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57FF3DA7DC
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792049037; cv=none; b=CEsvf5/J55VbFkvATOvKrsTCgN+CSxI9z/Rg+glriDG7MzeURthC50HGVrF1r2+PijbB1KgzMjsY/gMLkKZQI//DINybquM1w7wU0RzMmvrkeLZfijRuXnLwGQ5Jp2LrwXA8pRh1MIrikf6jO5U8fC18cQ+fqWfsa5+KGwRbbdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792049037; c=relaxed/simple;
	bh=9f173kOItJiLe3KNd54FtwIY4ZEnhICWJbrm9zRZhyg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=NGpNAOzGhhDNSUZC0xsrPbj3m0gnqF0ISqMbtoSqokit2AUDVCPZzIIFeN020uOt01PC5nS1mD9PBztNSI9BgWr0nIesKIC0VkdBUB78XUKXq42x9rMYtthPTTA/QQGyySGRQkG/MavjZrrTcE8yVSPX7QEBo3WWpiRehRRn+uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JMJ5+YLa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hsNnBbHn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JMJ5+YLa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hsNnBbHn"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F6rQk71682876
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mtJfSetwh31PB8n4sLwxnkoLiJnmL+MMeqLUG27VtPs=; b=JMJ5+YLaIzbVy7j9
	//LCDFmsdIuDwhGFaKERlabK8A+npe3ZWKWIADgtEzSGzjM6uP8ka9nH2DrCpsUO
	13UX8URCiWZLTqOn1kUchrzaXp2eOX4Kqftmycf0TtLnlb2p8/FHZZ2jMrn8nHG6
	UmCb7P7I62Miz8NL2yh+9yrw2+3sffIOCTXS3BAvjYyx76kl0jO2FRj5YTLi46WM
	yqB37QFk8mFb2sUZrg7xB7mllPfCjMr/wZVyvRAmx8bXrqQTKkT1jzsDtrm6/u22
	kBb2urDHW03qKluogztK2/NybyP1/m+wt0UL97s/e6xe/oWAGB4fAACp+vSUQuFE
	ZsuueA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacb038cs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:23:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917bab67568so146874546d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792049028; x=1792653828; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mtJfSetwh31PB8n4sLwxnkoLiJnmL+MMeqLUG27VtPs=;
        b=hsNnBbHnumgK7p12qv1j7ut9t7S01rujhn7s1Nnx/4wFVWt0j1Ow6qlXr4T9Cf5Vuc
         am56eAmEVUNMAi40qqklLvPhgYh+7d3HBEiTrquDjGOVxwQt1b+dzBC0GIY7GpQ1vfYi
         XFFkY/bcynCgUXB+4RkyK+ua1gD7tTCrwMPu0Mg6v0vO7sitXJFYgrJvfFcm6kyFd52+
         1s27cxsKjafg8S2v+zSCYOypUEszRIZq9jcFLagIn4jgz+rTvSS2u458ohxBRKLym85Q
         zuOZZJoKC14kfxTH0bUtu6wd9QaSr6skSkBEkzQDcwpftTK7KtpDtVRAi/nw+F89hQ1U
         AVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792049028; x=1792653828;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mtJfSetwh31PB8n4sLwxnkoLiJnmL+MMeqLUG27VtPs=;
        b=wEFnqmypJQh+bt8ELtQZnAlOROljoPzvQKB7cim2BOtYKIOB54vbmIM+iAehvdfNeG
         6h856majyP/BWitdEnOhV/qbxwX0mrMgZVgZu0I1iuqjMprjxbHOpOfgh3z9SwPlbRer
         BGlmTIPgegDASoGQxLqa2SAX6oqy4MZhfOjeYo3CmH7Ks8R52UVGjSSU30J2n7fKC1eq
         dGjhDz5smI2TcPEOOisQHROaoDUj6T8yfOGz90EDtLA1g6MyvYFEkKBDCSjvRyk6lAco
         i6BGVPqbcrYEtC51UIlrU90tNgrgNebQiNc3TKlB42yhUO8DcFV0wzKB7ZqesiUB8jej
         On9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxIWydh7YRRnzrJq6evA+2JDU0jOajFaOFSuGOUwa7arSnU0fUJ1wTPzlYcLDQraKPTRbcVv7OLiYNlq54=@vger.kernel.org
X-Gm-Message-State: AFq9FYKW/zbNOAj+fop5eu4WhMp/kyertGTR8eaeWv2RTRrykGw+EGKb
	Q1IExO9RKcZsDFWcYG0zZxTl9IknpwpnrILruDk+iF/ncImo6/l+3LC43LJ2OO00nKfz3Z2980n
	Q/Ie8igsI3rfk7+EkuJgYD8IjRqOScmIey04psMJNdGiuBDtHWi7CbjSViiU39sSgvCE=
X-Gm-Gg: AYBFou0KZe8mmKflIWrkhxGo+BC/XOWrd/EJpts3Nn9qKHLL7UEQJj+eyd0DQqNbP4/
	VZOV0y6byegeRRma3jv4r4oZjYj0TOub/3KsSfpnVkp3tnRGayyGiJ3WdCt2M1/kkgB3ZU3CWej
	S/5vKuqVu7zwIage6qhMR5nr01W7JkSWD6zZeZ6IxhK3X9e8SV7MvMgIKu3D2y6jjKH9eJSaOMH
	SmHy4UL3njpKblYOffd/7jwXDP7g5Be48GDKbZwcTRWIyKOg/EDunzvROyLhkdCFABBvpcAR5yW
	cbVu46UIpTHIUD42A2JJKlMe5/q5gV/1Nclpq/NS+XHUUA6OyXJJzwl7eRk+Ym8LmCCSCTWSSL6
	VbEFqf5cgoyAlDKQzrFnVvTpjg94+S0vIB9GrRuw4qkq1m1STIG5aRmV9Mq+oyw==
X-Received: by 2002:a05:620a:3707:b0:93e:c12c:f13f with SMTP id af79cd13be357-93ec12d0ff6mr2932891685a.73.1792049027771;
        Thu, 15 Oct 2026 00:23:47 -0700 (PDT)
X-Received: by 2002:a05:620a:3707:b0:93e:c12c:f13f with SMTP id af79cd13be357-93ec12d0ff6mr2932889485a.73.1792049027296;
        Thu, 15 Oct 2026 00:23:47 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc50e0sm22600527f8f.49.2026.10.15.00.23.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 00:23:46 -0700 (PDT)
Message-ID: <61fe27a6-d19b-4f5b-b193-77d85ee64dc7@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 09:23:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] timers driver for v7.4-rc1
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>,
        =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>,
        Markus Schneider-Pargmann <msp@baylibre.com>,
        Slavin Liu <bolin.liu@seu.edu.cn>, yaojiale02@163.com,
        l.scorcia@gmail.com, Haotian Zhang <vulab@iscas.ac.cn>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <3a79feac-5b2f-426a-83d7-1e2859d2ea3f@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3a79feac-5b2f-426a-83d7-1e2859d2ea3f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VKpIDNPX c=1 sm=1 tr=0 ts=6ad07f84 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=jaXgDkm_8NzySzmM8WEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyOSBTYWx0ZWRfX/+XcNLJbwLJw
 7OQfsnFtQhwRsPWiYO2JQt+x2LLIL5E6ptbjRp0007/KY8c1I1dhnBr21UqCFonZ8o4kxSqr3s3
 92wNds/4kJRUt1A8wMxzhYGIuJSBYWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyOSBTYWx0ZWRfX2nxjRYNOs4Ts
 /ckOredsn3vsXf2/dE4T7rR0347U/qHwtk8c6BRl30LiqP9VoX6v8hM5/ZRe6xYZ9ZcqDhLUnKt
 SNhpr8ib0J+bbBsmgiA+B5Q8Pg3r+UcK7TW5YxnW3cjFPtO6+09HHZfGY4U3E3MCo7pKWfnxn4A
 y3bFiR/B7mwKGHBXh0WxRpsnZOJjqIw6MbtS4LfKZiI66EfF8wJxZXS+DjAZm3FTHr8F3WwNrJB
 YzMiaKA1ifJnXp13de3j8z5W0KUCbEdw7B7JzR/dEKwPZAhWAuG1oWOh+6xG+fXk0NYpWcA+u7L
 s9s6RIXwEvpzZPwUpVvLvQSIvrRlVPe6opBDer4thp4v6OcNZy2oAJohLHNMZdF1NrSKAfdqgvV
 9J87w7jTBgEgnbUwM/7H0SYBw/CEW+YKrqqVtHZcqm2hu8PNukpYfRfF5qXZT20sU/Fi7ub7GMu
 gcrqmPOqLCVWykQBZXQ==
X-Proofpoint-ORIG-GUID: cv8b_Rl6LbU42cVRdOnf0hAr5SqKRaZ6
X-Proofpoint-GUID: cv8b_Rl6LbU42cVRdOnf0hAr5SqKRaZ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150029


Oops, just noticed I forgot to Cc lkml@


On 10/14/26 22:20, Daniel Lezcano wrote:
> 
> Hi Thomas,
> 
> The following changes since commit 
> 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e:
> 
>    Linux 7.3-rc5 (2026-09-27 13:55:01 -0700)
> 
> are available in the Git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/daniel.lezcano/linux 
> tags/timers-v7.4-rc1
> 
> for you to fetch changes up to c40b76c8cf580466d9e56223f7f74beecc165480:
> 
>    clocksource/drivers/timer-ti-dm: Handle runtime resume failure 
> (2026-10-14 20:43:56 +0200)
> 
> ----------------------------------------------------------------
> - Added support for the Renesas RZ/N1 timers, including DT bindings and
>    a MAINTAINERS entry (Herve Codina)
> 
> - Simplified per-CPU clock-event programming in the MIPS GIC timer
>    driver (Benoît Monin)
> 
> - Synchronized MIPS GIC counters across clusters to allow local counter
>    reads, enable VDSO timekeeping and improve sched_clock precision
>    (Benoît Monin)
> 
> - Restricted clocksource and clock-event registration in the TI DM
>    platform driver to AM654, fixing boot regressions on older OMAP
>    platforms (Markus Schneider-Pargmann)
> 
> - Checked timer register mapping failures in the DBX500 PRCMU driver
>    (Slavin Liu)
> 
> - Fixed clock reference leaks in the FTTMR010, Digicolor and EcoNet
>    EN751221 timer drivers (Wentao Liang)
> 
> - Fixed a boot-time crash in the MediaTek timer driver by enabling
>    interrupts only after clock-event initialization (Luca Leonardo Scorcia)
> 
> - Converted the MediaTek timer driver to OF platform probing to handle
>    deferred clock availability (Luca Leonardo Scorcia)
> 
> - Requested and enabled the optional bus clock for MediaTek APXGPT
>    timers (Luca Leonardo Scorcia)
> 
> - Handled runtime resume failures before accessing the TI DM timer
>    counter register (Jiale Yao)
> 
> ----------------------------------------------------------------
> Benoît Monin (2):
>        clocksource/drivers/mips-gic-timer: Simplify gic_next_event() for 
> per-cpu timer
>        clocksource/drivers/mips-gic-timer: Use local counter on synced 
> multi-cluster systems
> 
> Herve Codina (Schneider Electric) (3):
>        dt-bindings: timer: Add the Renesas RZ/N1 timer
>        clocksource/drivers: Add support for the Renesas RZ/N1 timers
>        MAINTAINERS: Add the Renesas RZ/N1 timers driver entry
> 
> Jiale Yao (1):
>        clocksource/drivers/timer-ti-dm: Handle runtime resume failure
> 
> Luca Leonardo Scorcia (3):
>        clocksource/drivers/timer-mediatek: Fix random crash at boot
>        clocksource/drivers/timer-mediatek: Convert to OF probing
>        clocksource/drivers/timer-mediatek: Request and enable the bus clock
> 
> Markus Schneider-Pargmann (TI) (1):
>        clocksource/drivers/timer-ti-dm: Register clocksource/event only 
> for am654
> 
> Slavin Liu (1):
>        clocksource/drivers/dbx500-prcmu: Check timer register mapping
> 
> Wentao Liang (3):
>        clocksource/drivers/fttmr010: Fix clk reference leak in error paths
>        clocksource/drivers/digicolor: Fix clk reference leak on 
> request_irq failure
>        clocksource/drivers/timer-econet-en751221: Fix clock reference leak
> 
>   .../bindings/timer/renesas,rzn1-timer.yaml         |  74 ++++
>   MAINTAINERS                                        |   7 +
>   drivers/clocksource/Kconfig                        |  11 +
>   drivers/clocksource/Makefile                       |   1 +
>   drivers/clocksource/clksrc-dbx500-prcmu.c          |   2 +
>   drivers/clocksource/mips-gic-timer.c               | 138 +++++-
>   drivers/clocksource/timer-digicolor.c              |   2 +
>   drivers/clocksource/timer-econet-en751221.c        |   1 +
>   drivers/clocksource/timer-fttmr010.c               |   2 +
>   drivers/clocksource/timer-mediatek.c               |  47 +-
>   drivers/clocksource/timer-rzn1.c                   | 483 +++++++++++++ 
> ++++++++
>   drivers/clocksource/timer-ti-dm.c                  |  10 +-
>   include/linux/platform_data/dmtimer-omap.h         |   2 +
>   13 files changed, 753 insertions(+), 27 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/timer/ 
> renesas,rzn1-timer.yaml
>   create mode 100644 drivers/clocksource/timer-rzn1.c

