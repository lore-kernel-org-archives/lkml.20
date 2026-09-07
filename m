Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392CE48EBD4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788783814; cv=none; b=hPkTk/N+jXJpximv8+6Rm4Ks6DvYM8dp/+PtmxqGILmzhNdUkzMsE4lZ1w/bpsKDYFdqESSK/cW3viTnkMTs3iJOr8SEdtk2TiFenizvSLiUGezijhcIG1xkvHYKB/Ekv09c+8O4yiV/zVM2yUpvfkNxZtSxjWyBTtlukEGqptg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788783814; c=relaxed/simple;
	bh=YgPQAqGAhvGod4elCi6c9RafBPUF1Jnx4Tkb+xELDMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vy25Nx07F6ElmiqYmewRfYVoR1DxR3O0IOM1uzLzb8M1aPJ2vf6UrUTXqilLur+qQWgJGHpxftQb6ylvuEuW4u6u/HrOahvH8vW6OwN6PRbFch1VfK83Cgo0ZFVy/G0xDPFIXiqddm8pYQ7rySUDej4SHeAxRfsGWvbMtuRjJF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Umpnsa+A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e/gMmM0J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Umpnsa+A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e/gMmM0J"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687An1LL3180953
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 12:23:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YgPQAqGAhvGod4elCi6c9RafBPUF1Jnx4Tkb+xELDMU=; b=Umpnsa+At5I+OcpJ
	HrJY1EphneNQ5Wdy1LKbaES1bD0Y3xLT4pF9/G/d5pme8whAsiw7gaAZqhaWI4c9
	ffg7Pn6I/pMCnupSohA5hB8DLQt3W+6VXAQ8P/3VpAcPY1gwxu55MQKiqOcSaWvo
	jDhRoCDiDgBxzGsiRo/VQyyNU32Et2Lc4QHoX2PPCvxh/uqNyDZvdRdr6Kq9WLrj
	nYduZWBPYj7SwhfUJcy343oVXpPkALdqAVWqkooPaCLhEC4iFO+VvxzltJiSb0kb
	WqkrDYxbQCg1AvlxjYafSoGNOrRkB9t8E8vX60DA3ieSmAV0oQer5eEuWoYautil
	0+b1vA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsw20wnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 12:23:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93821883e26so64217485a.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788783810; x=1789388610; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YgPQAqGAhvGod4elCi6c9RafBPUF1Jnx4Tkb+xELDMU=;
        b=e/gMmM0JLSxiuUR6q8eJc4ano1pxnUVDlH34Yl9YgFOSGssMb/oCJiR+4giOtMIYIh
         C0H0vY4Ghy6IhUbHGPckoFglMg/wW2GeCRzTYNFuGy7z0/YX/ljJw/W2tWhzUK3EDm0M
         BzjMlZfk46CJGSb9m5Qpyxd4nUZtOGzwodsiJ7oRaehivVw3CrQcGNGldvz6SUOBC4hL
         SIhd1pYSvrFLTcELYSc+yhDIBc5pAe6cTiwJI0PiE9+n5LvfiyLZ/M3zMuHr81Ow2MM/
         rStn/Ir3Ggn7U7OR3N9OXIPqo88uokIajtwq/ZFWgYXRCYrLJ8oRj/uTI+5KiBiJIRuo
         Xx8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788783810; x=1789388610;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YgPQAqGAhvGod4elCi6c9RafBPUF1Jnx4Tkb+xELDMU=;
        b=IpZn/Yxaw0CA63ljS55x5UVljh3t1p1vparl3VwlmyCDmMkBGw2KDBvq6g/sttu2UG
         Tmfsmu57PY2BNPTCniILaUCgx2+btnF486Y7ByIVl9FoDwq7FZ9bFxa5ohHvMLba22WH
         X1n0j6Ejl8VuM1QLyU8Q6OCQpgohTchLtj3PomKr1Jdc7oExKrF2FknywSz3GnI6plDg
         5YtvWs311VSSwtZMauR7PF5GL2sndUy9zf3SeuOwp5W7S7itYb2Xc/D/tI/gaZFkvjlb
         xavqqPD1sawCH4aPEWgmusdB8tG7zkVK2rnBTWz6k/KQ7eOclCXsMqV0KzPEkXfBR2yl
         Eigw==
X-Forwarded-Encrypted: i=1; AKwUvBwCpYRhQK21/aHuLv/pzZYFI39nNV6pIwZKKiIFLmY7BJ20JVYJ0V7hy35uddjR2+JGn4+QsmiXlRZc92I=@vger.kernel.org
X-Gm-Message-State: AFuF++n0/CSjsII4cBmGmyixHqMiCE7z3ZEL6ftso8Q12IGuztw1kVjF
	/IVSepgMzy1JdCXjgcElQ40wElIzHmtY2m/ohbd4GJ6DfKujqJtaJfRaVwZD73AJSv2K/FF86Rz
	vXwUQG1bVCrlEvttE40qXuacqozKDHSfzjDnNSKFJOr6Tkdth976IzJxgnhj6XKpTahw=
X-Gm-Gg: AYBFou2BD1zKqHjBLcaRmvSum4fDKWkNYaMicExkW+DrskWEiirZFvrgoDBBetlH2NM
	KSA6WBG9+kmk7fsC/15ifUnzwXC9BDHh5yrWPqrm5m89HFntbAKvoq3xe6paDebOowU/OQoRXtF
	NmLoi/YZC7yLo2j25V089UTsOCwhQCHU3iRXKhKGU4mld3/BDH0ywH0GtzmurlG82Jd/VhnfmO8
	D94GIEFss6O+HXZyxL10nsOLz7T7PyK5CSehlZLSnDgJXQ9P1xBDd2kpQmdsT/6TmbG0DTjR3O6
	pMscwhLLpiLTpOWrgngcNDbO5glye6NjNzVbxWPAksZFyM48MPBP66P98cZwBVGn+no0EoAgvSO
	3XKdpMRoSUTnlbNGDulcRtg==
X-Received: by 2002:a05:620a:9c4:b0:939:9205:4d78 with SMTP id af79cd13be357-93992054effmr865346885a.3.1788783810223;
        Mon, 07 Sep 2026 05:23:30 -0700 (PDT)
X-Received: by 2002:a05:620a:9c4:b0:939:9205:4d78 with SMTP id af79cd13be357-93992054effmr865307685a.3.1788783804918;
        Mon, 07 Sep 2026 05:23:24 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c26263cb042sm330890766b.47.2026.09.07.05.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 05:23:24 -0700 (PDT)
Message-ID: <ac8d6fd6-8bc1-45a1-8b3e-a57b437b77b6@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 14:23:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: ipq-cmn-pll: Assign .num before accessing .hws
To: Aamir Ahmed <elb12345@hotmail.co.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luo Jie <jie.luo@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org,
        stable@vger.kernel.org
References: <AS8P251MB0001B905088748016A0965F1C8B42@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <AS8P251MB0001B905088748016A0965F1C8B42@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BXSkaJjotMBAEScLT5ZTmas6TtEl8B9Y
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEzNyBTYWx0ZWRfX0bMmNyqxfuzG
 bF/2qi7EgyKTNr/WUSdOXnXUrOyxB1712diu6U0QILAxSfZMRvXKyUUEK0o2ZuEHhj+XMt5KeYh
 45MoRghA0Z7/rXS/+SuW6RMcCXeaJZs=
X-Authority-Analysis: v=2.4 cv=eKwjSnp1 c=1 sm=1 tr=0 ts=6a9eacc4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=y7GlcLeVpO5nAozT490A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEzNyBTYWx0ZWRfXwDwNT1oJSzCD
 W1eykDX4AbyB1uizupnDPtveO9s+1SjpEW9UVe6F4KaeLVCN21BQhug+eEYYnz0LQxw5rE5r2Vp
 5nWnEs8OncSYUNaR//qD+f95PQl3oEeHb9ip9qyzJ3UPayArPFJZ53Z98iFn2oC8EaZrtnZN5Jk
 iv4lGNSkA6NG6PzgeOZTUP4nERl7HtArFcrf3wsXm1OZ/GzX8oYt/jicVkcfibk/kB/d4z6dsFX
 NHLxqxVqTyTxA2m8t9m1YeV0XG1g2Tl+rXp+oceQP82ejytx8Z6Yy77BezUnhQxs9t9ObZi0a4T
 5zLHzyb+6hZbM984g5Kiec9d6JoJF1wRHkofzYwr/lRX1w6EDySAPJ7pkw2yNnoJby33e3q0AzE
 NTy8eDaKd7Rk9vKepyccIyE/++uytyYMywXhqsZLv4GL94wTRfp+QSiGqZ3vo3ldol65c8BN68l
 XvEfqfzbtd7yFyCWbfw==
X-Proofpoint-GUID: BXSkaJjotMBAEScLT5ZTmas6TtEl8B9Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070137

On 9/5/26 10:48 PM, Aamir Ahmed wrote:
> Commit f316cdff8d67 ("clk: Annotate struct clk_hw_onecell_data with
> __counted_by") annotated the hws member of 'struct clk_hw_onecell_data'
> with __counted_by, which informs the bounds sanitizer (UBSAN_BOUNDS)
> about the number of elements in .hws[], so that it can warn when .hws[]
> is accessed out of bounds. As noted in that change, the __counted_by
> member must be initialized with the number of elements before the first
> array access happens, otherwise there will be a warning from each access
> prior to the initialization because the number of elements is zero.
> This occurs in ipq_cmn_pll_register_clks() due to .num being assigned
> only after the fixed rate output clocks and the CMN PLL clock have been
> stored in .hws[]. If registering one of the fixed rate clocks fails, the
> unwind loop under unregister_fixed_clk reads .hws[] while .num is still
> zero as well. With CONFIG_UBSAN_BOUNDS and a compiler that implements
> __counted_by (GCC 15.1+ or Clang 20.1+), this triggers an
> array-index-out-of-bounds report during probe, and with
> CONFIG_UBSAN_TRAP the first store traps so the CMN PLL clocks are never
> provided.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
