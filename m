Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794551256;
	b=d0a6kN5H8y1Pjs3J+c/gQ/Usc34Cf1UGaHodWyRM23UlYWTMGWH4xK/hFBG8YW8a0FV1
	 FDlOcUR/AT+seDnvLzZ5JZTXn37gJYXEUWin/pr2TRqIwVCujn/VDjCKLKb+vqjTdp8Px
	 RYEBTJnG978eEwwqVRp5b7O8u0DOEBUN+4yD+23/GXCyHV5oGktT1ItX2s/1eWNASwJKu
	 760f79yhuUpPQ69sFShdv+4N0wGRDzkx5pP/U99iU66IY752Z3Bhw15AHIdcm3u6kEj/C
	 1puvyOFKD1jOIpva8kzSu6UWwaQfrCuZLVDhWIal1g7FtnDZ/PsBzvk8/VU2SGlepQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794551256;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RBv8eI2ALQLuMpCg5JVUkRO8J5aGKfpo6qj/UyA8v6g=;
	b=XyCg96H33P+S2ETppNfWiDVF6S19Gf8S0/Iy8ZWrBd1FlMYSq26n9/Nyk7ZV6ZiEUcT9
	 LW4LfsJqHUt9pFlwyuNQcBelODydaR1YxSjOKJHW/vx0Y6RyZArSM0E/dBP/ME0PCmppX
	 7drUiP/E9DPvhUb3FRBlVgcWndxoTjs6b0EzloFJbGkBlGiRhll4Pxb0aKPgXE6NOoZVQ
	 h1Mna2I/Az7VHrp7AtEplc5heoQrYOzwMjYOhplQRi64Tdwq37h9akQUiAwUv/AnKoy3c
	 FTrWD2Ah4EVuYQOSxOaG43w7fe/Z53u1YEU+h230wdbZJHhp29Ng0dU2oIF9ST1H64w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aMbPyI1Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="bYTN0G/j";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A70606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91A70606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aMbPyI1Z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bYTN0G/j
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD5akoc3147310
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:27:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RBv8eI2ALQLuMpCg5JVUkRO8J5aGKfpo6qj/UyA8v6g=; b=aMbPyI1ZH0IIIKD4
	bL2vndO6CjQ1X/qpJB4FgKo8Xqe3il4eLi4BpMsR5UYK+AErptattH5H+uJIrdyi
	bNV6HPcY5jLLSrbQYAov5YJVMujZ3efa1nSR7KX7SBVudfAmgerf3bPoyD9JimrS
	9vYhtE9xVB1bgfW5g7fjxpXVcVWPRoF3SM9h+B2wfzfEK1brEeZ5sgte11UZY7kT
	F7GlbPJW0QBXs7jg73Pp4wvZMhv+8QjovgXw7XtMsv1FOkXYB9G4m8bbCs2dqWTX
	nb4A7fvn5EiOJgyEEennuyQQvifsfj0uf1MEZ9QfE7R0FpH2kOEfTM948rhUqf9l
	9BkaWQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvja85d2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:27:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e8e16d22d8so11886295ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794551254; x=1795156054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RBv8eI2ALQLuMpCg5JVUkRO8J5aGKfpo6qj/UyA8v6g=;
        b=bYTN0G/jPIe1PPn4kQwioTeChfWZ5MJmE9dETGJ/FmJnkiOsNnqGkzDMEVkI2TgK/I
         WpJTDgKFRoUhIjAwL0qgthQHkugz8OLBRh+8jMkK1Xss9Cgrdz85R1bz6DJkCyZMrRpN
         MhSTQ1pynuGMZ+GKp2CLb+/LgL7VBDBbmvgnY+MFKbU+O9Z8GLZtgBzxakTrej3WXxpY
         bzE6quu1Q6m9mzOzA22RabDSNxFk/yID+yKtJs8NgN9FOigPOhxfSm9MNk2/6AcMgkl4
         R/BjHo3jQ3n+/kapiCwjE5/hyEzgwOlUkWE9FQyWnTvJEgo1aaqGZVguYDptFrjDfkOA
         PPVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551254; x=1795156054;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RBv8eI2ALQLuMpCg5JVUkRO8J5aGKfpo6qj/UyA8v6g=;
        b=o94e2hSihGuRW9TzOjh/ZBRmJ7f4UyaonzaYa11EeB9r/3kn9kWBMXh0xEMZbYlDXr
         01Tcaw5BozdQ5v+NyA4APH2dOlXSBy8sQKgYWTS6AJEyxihwz7ktgC5BsIJowGwD0/DH
         h/Qj3jKVt82bU8LsMF7YTmNdugIfEE1vDQmu4OF+XFcQtBDBIkX+aG2lPtm7pCanKGkK
         ceny+S8SOpnRDFgmb+L/T+v7q+zb2FR8GGwPA97IyJGy9qw3YD4w4yu2pqAMAGXAgt4i
         2YMpK2hqrfu8ip33suYX0N58gQUezM0xCUAUW0wA/iVqOWmrQMqsBVz6daA0JB2SirXL
         1ZEg==
X-Forwarded-Encrypted: i=1; AL+hErFP7lXyuMXmMWKwKhoPO2miLbxfmXY1il86F1XBVU02jvDHQGu+f6gRwg/QVA0NY2tlUdwgmpRbemR0JXQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KSst8lSRm0HsuxM7M+oNn3sDZHBKWrCdScvC/xg1ftWAwK2+D
	4ysonckM7S2zEzCAktVRVZSPLAMr7L+brNdQoph4op8QKVyGCm0Bjn8nYe1YZtkPCf5tgl68CHv
	+YcEEJywVFogbZCUKTcbE8Lly7TzBL1+km5lKdx4lFepf4cTRuprYVC46BhFZ71kc+8w=
X-Gm-Gg: AYBFou3N9TRS6mqLIJXu6h0eyZLfc3J9wOmmJvVEw/o+37oWqH5oFTKT0XGYbS/u2Fy
	bZ0AFXLQThW896qGlV4G0nqpCIG2Lphw/4uAvgH05f8PR2HKgr8S7LrDMuaKSivENtwVTgzR4ng
	j9i0vx86xh+IGmHrZbUlNcbeM+C8XoJLCYFQsgoEzJF7S9udjHEHO9OhRNdzFSPHDpZQJPvtwow
	ll4AmL+lHWvbtbrcPuruEgRTglGRQivv5LImlzN2SI0u/uHa72yyBpWH6izLUe6x3EK80lqwg+B
	RJ1isMPqsMmS1DQeLuocObwahWlb28XN3x4yB/7Lg5OPZ55cVYNAAxhLETr0SQ91Enu2v2nlU8i
	cT2h8Smv1s3eDnwSvBE2YVp+PaeXjxqDWnXZntWC8RgXvQbmHA/E19mMhXxmx5wBUVzJ8PIo6vt
	G3f159nA4N30DHyuhRmwFjuFMaPpAZbIAopSZ0c29tqC5SVw==
X-Received: by 2002:a17:90b:4c8b:b0:3b0:9a1b:b6fe with SMTP id 98e67ed59e1d1-3b1b0d75fe2mr1354041a91.62.1794551253982;
        Thu, 12 Nov 2026 22:27:33 -0800 (PST)
X-Received: by 2002:a17:90b:4c8b:b0:3b0:9a1b:b6fe with SMTP id 98e67ed59e1d1-3b1b0d75fe2mr1354027a91.62.1794551253501;
        Thu, 12 Nov 2026 22:27:33 -0800 (PST)
Received: from [10.133.33.220] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc186fc72sm756387a12.5.2026.11.12.22.27.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 22:27:32 -0800 (PST)
Message-ID: <4f680a92-c69c-459b-acc1-c877e88cc265@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 14:27:27 +0800
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
Subject: Re: [PATCH 8/9] cpufreq: tegra194: Add support for Tegra264
To: Sumit Gupta <sumitg@nvidia.com>, rafael@kernel.org,
        viresh.kumar@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, treding@nvidia.com, jonathanh@nvidia.com,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: bbasu@nvidia.com, Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261104181521.3003578-1-sumitg@nvidia.com>
 <20261104181521.3003578-9-sumitg@nvidia.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261104181521.3003578-9-sumitg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oiv0m9lWaj3m7v-S_WYoREa_zW9Wj9_e
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyNSBTYWx0ZWRfXyTDI3h6MV1S7
 hCaO5jWpEbqT7M6AcVi/To2zDvxhbU+CspXTSLODN/vyqGD2dWHu+RaB/4bwiLKu8Ay1nGrcH62
 eYiwo8/xPiFtSJoA+Lz7Xia/NQs2qnw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyNSBTYWx0ZWRfXySmX7+7FUZ3X
 LoqLSBKCLPakilfTelSpWLTOGAHsy3e3lcACl7s+5EKzLo0FmAEfQhApMHwqqo2c9L91/BTpqgN
 04LzfvjSzvitTh5ue2XQVgpPBql55Sk4P6FEePGe7UBxNtrq/1bSX/ext1EpD1DAmYxyiwIKX65
 azm+IrkbZlNqQc832AoligW5otz1M8zgz4TwXhG432jJeUdVHvuTXA9vv0Wn7FWYLyBtnaKNwEa
 a+yaiD2Ycp8xATus2JcAHSWps+DoCqplxpPq2s1yE2Ycst/C5IwfA9UM1pCS8erd2i3hxnqwt/W
 FeUL5odW3QkIfpDMO2OuhfZwEeGj53RuHKqKCNnt2C2Rq2TEShTkeMKW5hnx/rcsNwfCPisEhpi
 65BUjbLJTmKk0VUp++VUXlh0XuEJ7/+uGpUVbEKxxp+ivnzPJAJ2pO2oXwliSNIUm9GZYns/pTR
 /cZDsRwpOw97z45Zb0Q==
X-Proofpoint-ORIG-GUID: oiv0m9lWaj3m7v-S_WYoREa_zW9Wj9_e
X-Authority-Analysis: v=2.4 cv=AoN7T+9P c=1 sm=1 tr=0 ts=6af6add6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Ikd4Dj_1AAAA:8 a=xaSE4ohpd0vWBzKOhacA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130025

On 11/5/2026 2:15 AM, Sumit Gupta wrote:
> Add cpufreq support for Tegra264. It requests and reads the CPU
> frequency differently from earlier SoCs.
> 
> To request a frequency, the driver writes NDIV to a core_freq_req
> register in the CCPLEX register space. Two clusters share a
> cluster-clock unit and its register, so they always run at the same
> frequency. The driver exposes each pair as one performance domain and
> one cpufreq policy. Each CPU's "performance-domains" property gives the
> domain index, which selects the register. If the CCPLEX node declares
> "#performance-domain-cells", probe fails if any CPU lacks the property.
> 
> To read the frequency, the driver samples the per-CPU 64-bit AMU
> counters through system registers. The AMU constant counter is the
> reference. It ticks at the system counter rate, so the driver takes the
> reference rate from CNTFRQ instead of the fixed 408 MHz clock.
> 
> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> ---
>   drivers/cpufreq/Kconfig.arm        |   4 +-
>   drivers/cpufreq/tegra194-cpufreq.c | 147 ++++++++++++++++++++++++++++-
>   2 files changed, 144 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
> index a441668f9e0c..a5482b12be57 100644
> --- a/drivers/cpufreq/Kconfig.arm
> +++ b/drivers/cpufreq/Kconfig.arm
> @@ -248,9 +248,9 @@ config ARM_TEGRA186_CPUFREQ
>   
>   config ARM_TEGRA194_CPUFREQ
>   	tristate "Tegra194 CPUFreq support"
> -	depends on ARCH_TEGRA_194_SOC || ARCH_TEGRA_234_SOC
> +	depends on ARCH_TEGRA_194_SOC || ARCH_TEGRA_234_SOC || ARCH_TEGRA_264_SOC
>   	depends on TEGRA_BPMP
> -	default ARCH_TEGRA_194_SOC || ARCH_TEGRA_234_SOC
> +	default ARCH_TEGRA_194_SOC || ARCH_TEGRA_234_SOC || ARCH_TEGRA_264_SOC
>   	help
>   	  This adds CPU frequency driver support for Tegra194 SOCs.
>   
> diff --git a/drivers/cpufreq/tegra194-cpufreq.c b/drivers/cpufreq/tegra194-cpufreq.c
> index 1328aa0a1bd1..0767a6fd6bdc 100644
> --- a/drivers/cpufreq/tegra194-cpufreq.c
> +++ b/drivers/cpufreq/tegra194-cpufreq.c
> @@ -14,7 +14,9 @@
>   #include <linux/slab.h>
>   #include <linux/units.h>
>   
> +#include <asm/arch_timer.h>
>   #include <asm/cputype.h>
> +#include <asm/sysreg.h>
>   
>   #include <soc/tegra/bpmp.h>
>   #include <soc/tegra/bpmp-abi.h>
> @@ -36,6 +38,18 @@
>   			(data->regs + (MMCRAB_CLUSTER_BASE(cl) + data->soc->actmon_cntr_base))
>   #define CORE_ACTMON_CNTR_REG(data, cl, cpu)	(CLUSTER_ACTMON_BASE(data, cl) + CORE_OFFSET(cpu))
>   
> +/*
> + * Tegra264 requests a frequency by writing the NDIV to a core_freq_req
> + * register in the CCPLEX register space.
> + *
> + * Two clusters that share a cluster-clock unit form a performance domain.
> + * Each domain has one core_freq_req register. The registers are grouped
> + * in blocks, two domains per block.
> + */
> +#define T264_CORE_FREQ_REQ_BLOCK_SIZE		0x400000
> +#define T264_CORE_FREQ_REQ_BLOCK_DOMAIN0_OFFSET	0x40000
> +#define T264_CORE_FREQ_REQ_BLOCK_DOMAIN1_OFFSET	0x50000
> +
>   /* cpufreq transisition latency */
>   #define TEGRA_CPUFREQ_TRANSITION_LATENCY (300 * 1000) /* unit in nanoseconds */
>   
> @@ -70,6 +84,8 @@ struct tegra_cpufreq_ops {
>   struct tegra_cpufreq_soc {
>   	struct tegra_cpufreq_ops *ops;
>   	u64 cnt_mask;
> +	/* AMU's constant counter ticks at the system counter rate. */
> +	bool ref_clk_from_cntfrq;
>   	int maxcpus_per_cluster;
>   	unsigned int num_clusters;
>   	bool needs_mmio;
> @@ -79,8 +95,10 @@ struct tegra_cpufreq_soc {
>   
>   struct tegra194_cpufreq_data {
>   	void __iomem *regs;
> +	resource_size_t regs_size;
>   	struct cpufreq_frequency_table **bpmp_luts;
>   	const struct tegra_cpufreq_soc *soc;
> +	u32 ref_clk_mhz;
>   	bool icc_dram_bw_scaling;
>   	struct tegra_cpu_data *cpu_data;
>   	enum cpuhp_state cpuhp_state;
> @@ -240,6 +258,78 @@ static const struct tegra_cpufreq_soc tegra238_cpufreq_soc = {
>   	.refclk_delta_min = 16000,
>   };
>   
> +static void __iomem *tegra264_core_freq_req_reg(struct tegra194_cpufreq_data *data,
> +						u32 clkid)
> +{
> +	u64 offset = (u64)(clkid / 2) * T264_CORE_FREQ_REQ_BLOCK_SIZE;
> +
> +	offset += (clkid % 2) ? T264_CORE_FREQ_REQ_BLOCK_DOMAIN1_OFFSET :
> +				T264_CORE_FREQ_REQ_BLOCK_DOMAIN0_OFFSET;
> +
> +	/*
> +	 * clkid comes from the device tree. Reject an index whose 32-bit
> +	 * register does not fit in the mapped region.
> +	 */
> +	if (offset + sizeof(u32) > data->regs_size)
> +		return NULL;
> +
> +	return data->regs + offset;
> +}
> +
> +static int tegra264_get_cpu_ndiv(u32 cpu, u32 cpuid, u32 clusterid, u64 *ndiv)
> +{
> +	struct tegra194_cpufreq_data *data = cpufreq_get_driver_data();
> +	u32 clkid = data->cpu_data[cpu].clkid;
> +	void __iomem *reg;
> +
> +	reg = tegra264_core_freq_req_reg(data, clkid);
> +	if (!reg)
> +		return -EINVAL;
> +
> +	*ndiv = readl(reg) & NDIV_MASK;
> +
> +	return 0;
> +}
> +
> +static void tegra264_set_cpu_ndiv(struct cpufreq_policy *policy, u64 ndiv)
> +{
> +	struct tegra194_cpufreq_data *data = cpufreq_get_driver_data();
> +	u32 clkid = data->cpu_data[policy->cpu].clkid;
> +	void __iomem *reg;
> +
> +	reg = tegra264_core_freq_req_reg(data, clkid);
> +	if (reg)
> +		writel(ndiv, reg);
> +}
> +
> +/*
> + * The AMU counters are per-CPU system registers, so this must run on the CPU
> + * it samples. tegra194_calculate_speed() queues it there with queue_work_on().
> + */
> +static void tegra264_sample_counters(struct tegra194_cpufreq_data *data,
> +				     struct tegra_cpu_ctr *c)
> +{
> +	c->coreclk_cnt = read_sysreg_s(SYS_AMEVCNTR0_CORE_EL0);
> +	c->refclk_cnt = read_sysreg_s(SYS_AMEVCNTR0_CONST_EL0);


AMU is optional, so arm64 core reads these counters only with
CONFIG_ARM64_AMU_EXTN and a per-CPU check (arch/arm64/kernel/
topology.c). Is AMU always enabled on Tegra264, or should this be gated
the same way?


-- 
Thx and BRs,
Zhongqiu Han
