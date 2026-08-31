Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E52384228
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 20:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788206994; cv=none; b=ClVb6sx+h/LACbD/Tx4LoT4gKG8/s33UAmXOiqUeinGfuQO6Jn6XzI4PPUjhqDhZH44DG+/BQChn9jMJLBWSkZt7w70ewozcrYxrxRuH70PsV/z4fHPwp53zYkaSIyyHK8e1pQIe+U+R+1gcxtFTT4IpXZdbMg/D0G393RpDyN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788206994; c=relaxed/simple;
	bh=ZEs07MMJVpyxi21v4i/1UrGlSnAcAbjy7XZCswUhd7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XS1modjhu1v0AqmLaOykSaf+QqzWY9DlU+Z+UGldb3kB/QD77hrnav2Ipfi/KKMUyevMh0HCLJbmKuKHOQbkuFZaqoBA7wO7C/tFBamGCkufcW+AZPPExYGqk+njsoA0dfVHiwHtGM4njMAUI1Web2KOcd4kFq/Y6XdDBbrZA6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N6kvjYOy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YkqcHYx2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N6kvjYOy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YkqcHYx2"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VIxJXo736679
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 20:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	InNI/EgxIDv82pDIk41rCKlCz4lWV/WsF4UMF6/lt+Y=; b=N6kvjYOyyl1d3Up1
	m7+t9VFKa/VBg+3Q5JSPRALVg/3LadnL6vZxVQV8bHWY6grC7dtO6z3RltnIiaEf
	0/29Vgvi2hTs5WJepVWGQ1XG7kc5Z703ImsCWKQakoX9St33vvEazVQsgnGWxGn8
	1DWShFkuOtcWUV3tqL8W/MeHIvV/n2q8/A4Sx3eHTcm2qu/8jVIZk9ce03l2RrCm
	Ad8sxxAVjhW4rnoFODvjgoTvgvIsD7/waPbJZ0CFv86MYq4FvIa9epVIZmcdJUEt
	vj4dKbTQ/Y/uImHX6Ml5uJC2RDcLJtScM6xjALxS2PbZMsakbBBYrno32SsVcfuA
	jYU63A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdfch8acr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 20:09:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d959904658so641875ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788206989; x=1788811789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=InNI/EgxIDv82pDIk41rCKlCz4lWV/WsF4UMF6/lt+Y=;
        b=YkqcHYx2rsMtmqHHspw4ACFJ+KflbZE3ULsEXcaQylp8tt7hCXBbbSToIglf7/tIv5
         3wgWPnoBpr8Jdy229d6pcZBzK6Y/8dJXi8hL3k6uYmO7TXAdzKMKIjjxGpEmGi4b0g6d
         yclkfsTgdLApdzM6yA024NeHXLOhY19HhS305XL2fsdibshSeJg4LHiW2PPfir0iZJ6T
         DmC1svCz8Q3smc7Isv+nqpBbRiFsJ4WxpSB5ZFA9cVcaBXF6dTR2tJ98nwJSIDESo8mX
         pWpuwSOAkcxRwGctxbQe2TIctc/z8Vx9PisZ3SP+6nBdSM1JepNPFkOC/MyUNnwgZq/i
         9pog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788206989; x=1788811789;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=InNI/EgxIDv82pDIk41rCKlCz4lWV/WsF4UMF6/lt+Y=;
        b=MJF6ppF23bpdE8AL7bWvqp9DLy3X4HjYzbAE9iXOCvLDiWaPW9Bx7PSWSYG3nhOGzF
         P1+XVanTwWRadIAdDxFROuh1BI2vmYM6LG6PGxI9Lul40dtJQLGzRsM7OiJSEOcgpE1p
         BPTfnnkEnK/gxBIPEKtsRmv0Lub23mU/Xu0pzUkQoX6K6OsvvPNUtdmmDI3e0o1/U0Ym
         hNybiWGlQFDOiBMWa4Rc9jkvw22ncy79ZcpLYbf2VURrX+2pnXjCMKOe4/tYQ0C/AKw9
         uhtZ1MRQEkNVKATU5+E6Y2stkLHrYbF9jn/2z5d3BMRUsf5bKj/byTNJI6cxL2maW7tF
         7CWQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8r0Vec876P9GdeFSZhTYXsHlZZjTlch1kMEe1E2jWEj3/sCDO56xqRBFGFU8JWuOP2hwT82k4Fu5lsMI=@vger.kernel.org
X-Gm-Message-State: AFuF++l+D9bugcnLqXPbLVvRGcBsDOnH2zA/JGdWyD2emX5Q1Cm1cI4E
	cwIYv1nFmVPM+EJnmbNA9E5R54Easpww9+kkuWyORXlx0Goi54v3y4Iy2+c5QsdHnTKmZRogD+B
	K0uFzX5IozOXRiz7mTxjpY1sT61113FAZju24I7NJTWW6lr9tGnhNENJRWOQXdH5dwA8=
X-Gm-Gg: AYBFou2QOKflr1cx2wQVPiZxgKf2yfbAJ7GHxuAkx6DhJseVJp9b7DocAm+OMJJwnXq
	U5gZdy66jR/KwgpKdax99ADaIDSXJfB9PMoRqPUEidDSG5X6pQAEPLZ8uPo1IRHQkzl948d5wHh
	tVU27x5ZfkFP9Jvsz3//DYCKswHPjEGKXkHJMpErBfn66Fu61FyTFl25IpVufLHQIrhhs1nwzjX
	o2gvAni5YCcCBhxdyFQZdPllzoARgWYGcI1UB85NOLVX7bkpdInlQOu8wgy6eWkvAbbGvTI817S
	0FiC9SrktrRMlz9lDX5V+Z5qa00Ah0S/LIhWxa0XGEhx+T2c54HOKzo4YpJaGFs0K4C/3VwPyQa
	w50smLOUNqRZxNP/zLG8vwSNXNt1ElkdcTH8FDrY4hkErXhKF68uOHTc=
X-Received: by 2002:a17:903:1a2d:b0:2d8:d4cc:be64 with SMTP id d9443c01a7336-2d94a904ffcmr42727855ad.17.1788206989265;
        Mon, 31 Aug 2026 13:09:49 -0700 (PDT)
X-Received: by 2002:a17:903:1a2d:b0:2d8:d4cc:be64 with SMTP id d9443c01a7336-2d94a904ffcmr42726215ad.17.1788206987234;
        Mon, 31 Aug 2026 13:09:47 -0700 (PDT)
Received: from [192.168.1.20] (163.sub-97-215-3.myvzw.com. [97.215.3.163])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa20e2fsm32698630eec.28.2026.08.31.13.09.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 13:09:46 -0700 (PDT)
Message-ID: <9e22e5ec-70b3-4ec9-ae75-295fc13a23a7@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 13:09:44 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] wifi: ath12k: support calibration-variant from
 device tree
To: Andrew LaMarche <andrewjlamarche@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ernest Van Hoecke <ernestvanhoecke@gmail.com>
References: <20260630133001.1426824-1-andrewjlamarche@gmail.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260630133001.1426824-1-andrewjlamarche@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Ok8pT5h6rbQbNOijpKUgc8ZVoMd4WZ1T
X-Authority-Analysis: v=2.4 cv=G9Ms1dk5 c=1 sm=1 tr=0 ts=6a95df8e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=7QqFuFOOHQR3GLhHC5mhXA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=jTpQxx6w2ecbRakjFwgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: Ok8pT5h6rbQbNOijpKUgc8ZVoMd4WZ1T
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE3NCBTYWx0ZWRfX6wtZcBt7T4ic
 ZEOol/zYFQ06cAZsAZZSDdmcqptiHee6YhY5VKUfJxw0N0aBB5FT+PZnFb31P58HEA+d5Gj17zh
 vAKM31hwYhGy6qtKFDXG9HY7jJtyRIQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE3NCBTYWx0ZWRfX9HjYE0zNMVwz
 mtLkHSCn7yZRCbDC2FmImceZAhxq2EdeiHK2HbNSF2gMBkSOUSi1j78dVpDf5cixmrOymjcLJlx
 Ln1pbphobZFn58307oLsPfxEOafR883cWMgq3jME0SqZ4fOFlXg7FbJgQ27n1iz2xJroQThLpgk
 J4QI9NMcITG6sjCcQz7G0B/IiBxgtFS806mekwHzuxV3PsS8sTF9zBw7Lf6I7tW9egCtZEsPinj
 UU/X31gIoLU/mzc3yAOt13Dl5NihkgW3cHbLfvSFg8diee9f4cPr9WXiQx2Ff5yGqzTHzn2VsA+
 tXD9xzztnLoH3/DA/vpAWEGLh0fvCoC+L3jvQs7184oG273zppDMu4nW7Lzwc9N/2zr5FZWNT7X
 CXbq0h9082UjKZG2nxwV1hS2ZuPlH2OrBiPBITF/GBAA6soWBEsLRYEVfNPwhqHuD23vayE5lXW
 Mout+lmFeBkp6t03WXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_06,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310174

On 6/30/2026 6:30 AM, Andrew LaMarche wrote:
> +int ath12k_core_check_dt(struct ath12k_base *ab)
> +{
> +	size_t max_len = sizeof(ab->qmi.target.bdf_ext);
> +	const char *variant = NULL;
> +	struct device_node *node;
> +
> +	node = ab->dev->of_node;
> +	if (!node)
> +		return -ENOENT;
> +
> +	of_property_read_string(node, "qcom,calibration-variant",

I've fixed the following in the pending branch:
    ● checkpatch.pl: 126: CHECK: Alignment should match open parenthesis

> +			&variant);
> +	if (!variant)
> +		return -ENODATA;
> +
> +	if (strscpy(ab->qmi.target.bdf_ext, variant, max_len) < 0)
> +		ath12k_dbg(ab, ATH12K_DBG_BOOT,
> +				"bdf variant string is longer than the buffer can accommodate (variant: %s)\n", variant);

Also:
    ● checkpatch.pl: 132: WARNING: line length of 121 exceeds 100 columns
    ● checkpatch.pl: 132: CHECK: Alignment should match open parenthesis

https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?id=c9d2d0d1c4a0faaba5f57e3c3350707db9f4f3f3

> +
> +	return 0;
> +}
> +
