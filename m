Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCE147126E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249685; cv=none; b=lSOqDGcW0nIIcUfNKZqXyIK+yNXfjNu9I1mv01RdG0U5HzmMjZDJSGe470sugn2R4krqEHyFaIcaxTByDKN2HvKyz/CyXedEjbLZ7UP5vCSWgH0HRmX0tw1Gjxc1rSir4oUzjSj1q+iuCoBTPuLO2usuNRvV/C05dB6l3RqEUp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249685; c=relaxed/simple;
	bh=M+2oV4T/QFC+qsE8RIB5fpV4NNChtc2m5Fpd4TUP2F0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kL70aXFor7J/hnRJ1E8ehT4VjYIyXxrtaab4IpbHxhVIV4kn/xxANYIC7gChkjs8jQ43gAllEw7H0h3N37ox5PO27a//FlvTTnJI28KtcnPILvhMclKNnnIJZU6ZU/WMhXliJh/M1AhGPqoiWq18UfCTwIwvXwRn6JvoMFwS+PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kGMAljy7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OmBPDHb+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kGMAljy7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OmBPDHb+"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179Dvn1892397
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 08:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lp12tstqgfKi05BKhpwsu3Up0U+NU0gCKl7bp55AqZ8=; b=kGMAljy7C2zdsObZ
	iLyGfRf+pkVnlSHRJn7BLfLTcOKGRo3tS2iDFDbe3YrSJtSaDaYP1/yQgmgpa2u+
	s+NGN12ckCafS6mEBcEBLMaAsKScq3Ym5tJNkCGAbK28ONnKjmDN+2d0SK7C1zGq
	NKP77QJtjlr//AHh42XeERcA/NRENMwnZp8ARSNAtmTdiu/pSuNB4FTyD7kZaWtj
	YFg7spjNXvk91gCD1WQlgS57ifocanY9FUawwBAeroTVkRhad1IZFUhB/+6KcfXM
	sdjkZ1bnO+uxOisvrybzD2BB/f6m8SRbS1OHrkOLSHBhgfEeEXpHH+vRfp1oUu/n
	A4nKyA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7c97jt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:01:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-396638f9a18so7615034a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788249678; x=1788854478; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lp12tstqgfKi05BKhpwsu3Up0U+NU0gCKl7bp55AqZ8=;
        b=OmBPDHb+lI5u4eWUgKPwEpCDpv+V0adfhkpV2+rJkPBsq/hPOqg8e01iZgLDfaSrhF
         D1wCS9jC6PF/tzp5x0HBql7fCD9Rc3PVkP0TxSyhKrq80tJ7egNkIXAmh6LxujL1fLqT
         6C0xdqjq+7c6yDwTt87jKih0EEyyxpfjA6dUVKCph6FcjU88Wg3zaEuuUCcXX39aEg2a
         i+k9TBXrsjIacX5UJL+Gv0lq91m6geDTgEMqbC3d2av0oeyq/VKS/Hf1FMZ8bGnR4fgn
         Wfq5vEt9tPFAqppwJN7bM5vcUWIZRXJJ171rm/vrjBZ0gIVKZGjFJPKpQR6sZf06FAR6
         YLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788249678; x=1788854478;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lp12tstqgfKi05BKhpwsu3Up0U+NU0gCKl7bp55AqZ8=;
        b=CJSX4gf7GQgs+31cvkaG0o4VE+PW+DF+/XhQ0wQK/oTwChE26/uf5cfs5snkhzi0/L
         qrFlr0FmeR7QuLrK8K97KB4iT16AlWxf/XX04pQX+f7iuoBR3dEXgywo/1SAWNjV3kQ4
         AknbFZfIQsI0Te3YbizsvE7ZLUqZQkZKmnwS3MWRjnn4HTlrcqyBd3HwUXafdLbZ5MFC
         4b9SrpWd+MSoZU888LdSZSe985f2oyPPD3K4iL4BTrL0KrY+wnyf81MDaFuUreUe6j22
         pDM+50aqY/oIIv7XSKbI1SZVN1db3Y4CAdab+vScZN3PFdC85y8b1HCBhQrgNOmv6JaJ
         BYpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBfH9Tpme7gntjmtX7+x3av94icDdspyIrSHoqhYsiG59ERew0slB2Giz556Xm8IQtT298XyhoSiE+1ZA=@vger.kernel.org
X-Gm-Message-State: AFuF++kTozN+SCJU1fPrXfPkXl5LGznZUSaFMHRCQdwvHO4CknhISjgr
	PxGzPTK0a/tz4kzPfVNvmkvX4250b/Q+jyprFT4+EpBv7nT983HjmCqc5DXYRVcKE5dqZyjsNkO
	pmG7FKq0f2GDksSI2ETXeAZ8T1H9CQ5EVtQP+cwrL7U77Fi37Rm+w1t+v3MoNmJY3I8o=
X-Gm-Gg: AYBFou1SUbYI86hy1BGAp/1udNupOdPrwwYnrPJKLmzL/XTRdP2TxKEnGUX9auK2Yiz
	honapraZB8lJes87tc05tKo2o+47cR99vy+7csBiIXHPeVOPwZX7KsmiCtr+1FhsfHYD6r3ufk+
	egnhCZPYuTlnVDyX36XWY4CbMKrSv+lsSUE2twcKkohGsdE8b+BW6Ij3wN4NJpMYEmkDfOrGJeI
	zL09+Fd9KiHWAlfSUPzLp1/zoj1jDidqGyblknafUoEIoSdluOHRLoEA5M8uMAFPvip21A8dkfI
	bHOSekob1yRGgUW5FpA+35kNZJqsd9DdtsVlAWNxcAy+a2dyvx0j+5FfZ0XkcIYAFuESjzu5xei
	vHqOtt1kxf3ujJj+qwM4n4X4Shxc/tnHbe9uX5rCh3vcTiiRe9nUE0JZsuEeeh5kTYkBddUVK
X-Received: by 2002:a17:90b:1d05:b0:396:65dd:4093 with SMTP id 98e67ed59e1d1-396d0ff519cmr49442368a91.14.1788249678055;
        Tue, 01 Sep 2026 01:01:18 -0700 (PDT)
X-Received: by 2002:a17:90b:1d05:b0:396:65dd:4093 with SMTP id 98e67ed59e1d1-396d0ff519cmr49442130a91.14.1788249677126;
        Tue, 01 Sep 2026 01:01:17 -0700 (PDT)
Received: from [10.133.33.141] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d75b540sm4550049a91.10.2026.09.01.01.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 01:01:15 -0700 (PDT)
Message-ID: <4db03770-b410-4298-9e32-d497278e9cfa@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 16:01:11 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 0/5] cpufreq: loongson3: Fix wrong behaviors on
 multi-node servers
To: Huacai Chen <chenhuacai@loongson.cn>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Hongliang Wang <wanghongliang@loongson.cn>,
        zhongqiu.han@oss.qualcomm.com
References: <20260828031201.1500767-1-chenhuacai@loongson.cn>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20260828031201.1500767-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OcyoyBTY c=1 sm=1 tr=0 ts=6a96864f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=mbPrJoAuDWtQQzFn8WUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: Xy0S8OWbsIjKs9XAiouVdl_PpZMlRFo0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MCBTYWx0ZWRfX2VjYY54jBKmm
 OzW4l4Z+MONYBV8ats3mBeJ9491/m4VGoxQVw7RMkhn13etpbOH5b1FLi+5YJAA0MpSDU4Z7Aft
 BYdnaLiV0HMXSqBUxXZ/Bx08VgZwlq8=
X-Proofpoint-GUID: Xy0S8OWbsIjKs9XAiouVdl_PpZMlRFo0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MCBTYWx0ZWRfXysNAYvR9DpJX
 UDmPnWCuAaJrYrXw/cAQvMjXW/3QT+LEiW3WRpGjVKJOzvkGkChoiYI72xmjEd9GkpT3/g+webf
 Nhc/AMQ+oIXUXoDcbGV3wkYuRIS0jhgUso+PF6rdGiyxQBTSNnj0KWSCkB9WenYK1od2bwRy0Vt
 nskAsT8xKXPcz5p7tFbCxvEwGJPzNB5/IXU3kj+/2lYxr7YUWE4OqeMnJxMFXkQ8+WP7Lxpc+os
 8ttOePyzTAUoXagx61Ob928Mc3Vl0KPBSIV3+vg+HZdrGMz3EZ+ztGzD09PU7YMbys9zKTDBx8Q
 eVUWM8tlvbnpYFKZykblJytq2hrEq4ivMBsp7RtV/0T74AdzqZr8jaNOpsFflS2czagsboUb9gH
 eB5T+tG0v+2Nqm/tB8rrbhzKSCClFA/Ovl+Mu7q7mWDPUZZDfBdbHNjbuJ+HhkJQ4OKnELRqom1
 LFRibiWG6czhd7P7Smg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010070

On 8/28/2026 11:11 AM, Huacai Chen wrote:
> Our server productions (e.g. Loongson-3D6000/3E6000) can have multiple
> nodes in one package and SMC mailboxes are also per-node. However, the
> current driver has wrong behaviors on multi-node servers, including: id
> field in smc_message is too narrow, mutex is not per-node, IOCSR read/
> write can only perform on the current node, etc. This series fix all the
> above problems.
> 
> V1 -> V2:
> 1. Fix typos and add Fixes tags.
> 2. Fix loongson3_cpufreq_get() return values.
> 3. Use nid_to_addrbase() rather than hard code.
> 4. Guard some code with CONFIG_SMP to avoid build errors.
> 
> Hongliang Wang & Huacai Chen (5):
>    cpufreq: loongson3: Make this drvier depend on MACH_LOONGSON64
>    cpufreq: loongson3: Adjust the width of id and val in smc_message
>    cpufreq: loongson3: Replace per-package mutex with per-node
>    cpufreq: loongson3: Use global physical CPU ID in get/target callbacks
>    cpufreq: loongson3: Replace IOCSR read/write with MMIO ones
> 
> Signed-off-by: Hongliang Wang <wanghongliang@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>   drivers/cpufreq/Kconfig             |  1 +
>   drivers/cpufreq/loongson3_cpufreq.c | 72 ++++++++++++++++++++++++-------------
>   2 files changed, 48 insertions(+), 25 deletions(-)

The whole series looks good to me.

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>

> ---
> 2.27.0
> 
> 


-- 
Thx and BRs,
Zhongqiu Han
