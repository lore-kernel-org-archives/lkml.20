Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793407858;
	b=pQD+xgapgy2FKGTdDpMvrx7smUVK7IXiRXjR+OhH1XHYcjMyCl/Ek5h5zRiBVL2ZHAXu
	 GbxvWeUcium1RLKEmZLFcQmila+QEWrAs6ubi+66ouzeRkaLunE33A6hU+CQNKbeVbjJe
	 0hLKx+ADWX3C6sgL4Hj+XkTgXiUXytKEk2KzliFES3taF5UL4urFFuU8cFy4CuBgB2O2g
	 A95Mx2Y55NbuuGoxJsUkxRdc0IYPzNz1JnAti3C121x29ape9ERjt14gebB0Bd4L93ike
	 0TaNrgKbAwtnDxSZNIg0B/ga/KWReL+p4WgQxoZBTUrrWXLArPeZsHX0pxoTKaOf9ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793407858;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6iLbcIK1ROxHAqAZicwghsY26jAXKiGL1CdeUbl58kE=;
	b=Ww4z/PsQ3xzjMqsUaI5KtiGlxATLkYGSrZFJQEUmnmxLk+QR+LkLmZevNUF4t/u+sM7c
	 4zEOzAtEawIsJ22NudbLVLvXFrz6/a19+tOdUzqUHFiVxNQclKSdri2M/0xIuo9daNNSw
	 dtUhbYOzfh3J6d/+pJljAbIU2LfM0qIT3fmGiSa2cUxcthvOrIsYAs9fmalkj5Tb5VBcC
	 gPK1ol/65IC/uJDduvB1y+ErEsZk3sM6cMx0MskCeFNsLz4ZFqSJff2Up3B+Qu43T6w7T
	 Fnt0vRyAdHBaz46QndFgMBQdzBXs6DVRs+bwZd+WCQmZEsaDVNpcIjGoKIuXBceYSrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KaIL1N4Q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g70kZj23;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CE6606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82CE6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KaIL1N4Q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g70kZj23
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULu2ga337620
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:50:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6iLbcIK1ROxHAqAZicwghsY26jAXKiGL1CdeUbl58kE=; b=KaIL1N4QFUwekjB0
	NF5mKnBlnGyRrXJ1omtGRYcwarwxq4ZrntPz0soTHV3AOUis0Mt5DF3Qyo3UJNVI
	kkN75NNzTIav0ikNd+Vx6eVZCToGrR5sCnvvH0mnRBhtgza8xb5tEqTzPm6ud0+G
	IV6plYy/db+vT5uUJwdnT7LrWTtQ59dAbezp2V/B233shL7XnFp+/lakiJIc1mVA
	Y6pqxAU1Kf0tMJWN1Lhxom4uRoEJW8AI4UM3zFv0Mkgx2ylDpCeXxwvr3z8h9iF5
	3zJUCayspo0RPxG9sSB/hcUxnH4VNGGMKiPZEkCYNZ+khxMur3+uzQlsNH3JilDX
	0ik6xA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x00jf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:50:56 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-154e9d2d94fso2539532c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793407855; x=1794012655; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6iLbcIK1ROxHAqAZicwghsY26jAXKiGL1CdeUbl58kE=;
        b=g70kZj23c9RcGdJQi/nhrQELMrN46AT6bpEAXnQSH0vJl4/Oqod5vtwe2YffiouqJ3
         HPN7zV4S0dVrxJFN001CqQvGYsmgSnLrAaseEVsIvFRDn+dqq9Oay6oXcSA62Wupr73T
         hsiuy9y9rlVXP7viAR+cJPWUFoIJMvcc8iKGPdTVxrxctV3m/eo5oegnYZ0mFCVBDjR0
         YE//yvUqTOzO0/GCbcYFRPAzzouwBodgSzNkica5JXLYigwqvJiU3wp854Nn+rkJDh6H
         TKujHSyQ854InDSXRLunsJWSsafWz/cuOyd6+aZCUlzFRIjqIy/KUJCMZ8DllUX91kwE
         nWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793407855; x=1794012655;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6iLbcIK1ROxHAqAZicwghsY26jAXKiGL1CdeUbl58kE=;
        b=LDfN1urom3/OwWuKDDAhhv7mZGigRYgucw3jQQ18GlLIpcCah0rpKB6ru9RcAIBR0d
         Us0a/isgTQxsLR2XzppbPczKkqslvgm2/K4zbmmg35ZfAzvXSgrKB8ghJgSDTn8uI8+N
         VQ6ggZND7fxDuT22nZ0j3JTdo7FebEJkwxYCqLXddPXAoSOMWSgnrt+od6l2IB+Zj2vT
         4TIKzxVbQM14laSXcHeQi+MUNryYvC5JbzMcBTv+NmrEZzMPfdyXwOvjlQB7mPfP8Zbs
         X9m5TAa3ZZR6ePYgcEBTrQZjzo84cF1cANiSDgyIsqHMhJ3tfcCXIHNg1tUf4suNRa1J
         vKew==
X-Forwarded-Encrypted: i=1; AKwUvBwUtgwD9nsIurldP6R3VhHqedWe4D38/hE04XPK/ufeJSOxzLe/I/SYnhsHrDIflda4SZHvQbNK1WTr0WM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVZhgVz160w0fM2Z5PcKjuQW1GjNipa74/DN31KoCI1MXZFm+d
	RymjKRRcL5Sj2CgJCRyJJYEQ6UDofh4SEzRtFewahWgxczUQQAO5LeMcXUiWcBzLNw8JnflXcrn
	O37AJaFiT6tPnVuogYzZjCCG/O3hX8K3ACj9031xrjngW2RJBtA1u9jfwlQU0WYtZMIA=
X-Gm-Gg: AYBFou1ZTieQRlk2+No04gmqP1kQ6tDfkjvSuzjymHsz0XgxZbwv3YDZemzSSmkzbEA
	vQVxaRpHDPRwPmbDxaE80OrtsJHsEIQFgwYy0IBRvQfx0o9LkMD5JxiFXVdFWh1w4jDAzqjdcUy
	/PAYjvMNuTrKkLLggFOJK5LG+FggW7IDRyeCC+x8QeyDmmwQkkqce8Yi2YQG0CT5G9lD7RTfGpU
	QkM1MXRGnq51ij47zLH90SlbBjbl1dusLtIlB23gqDKdj+O3hmK2qNf9DvwJXKRoGpNypszHdcn
	CePHeBVB8HCQm+oxavsZ3IL8szS0JZ0K7uvlqvOrbkQqAUKOaQjVZmrD+fr2T7+PEHEpz1XtYVb
	29Mafhc2K9YsHg9ahTByuVfGIj36E1Sf9eGRUi9w+GqNa+JB70JBo7aZoOizDXTH6sCo953P+nf
	3AVd40chjCNxhfV8+4pnN2N4QpyjijWA0=
X-Received: by 2002:a05:701b:42d2:20b0:1aa:6c3f:2f7b with SMTP id a92af1059eb24-1ac5b3fdef6mr5752353c88.24.1793407854874;
        Fri, 30 Oct 2026 17:50:54 -0700 (PDT)
X-Received: by 2002:a05:701b:42d2:20b0:1aa:6c3f:2f7b with SMTP id a92af1059eb24-1ac5b3fdef6mr5752325c88.24.1793407854248;
        Fri, 30 Oct 2026 17:50:54 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a13652csm11452134c88.17.2026.10.30.17.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 17:50:53 -0700 (PDT)
Message-ID: <e57a8259-6950-4ccd-95e5-d6d1feacce2f@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 17:50:52 -0700
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
Subject: Re: [PATCH] wifi: ath12k: fix wrong register read for RU start index
 of 80_3 segment
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261030090906.298234-1-jtornosm@redhat.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261030090906.298234-1-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDAwMyBTYWx0ZWRfX3OHf4/cZuO22
 LKxXKSTz7nQvUoWWmKG0TZP5oTxW6WcYrJsQUheXUOfuaCkAT8TDyJxk7o+xuOaa4HUdGfMyO4v
 +H94DLfXKLZEOSvKWBvJS3v5aSaX4wRjWKCEN846egnBf7pOu+dAtDC7pt+d37HYe7paepZW8qv
 5CByltD7b9tE48rPNceYMeTWAsxvRKmHo/XlC3UMC3aRtfUpm4I0EnFhOFFBpFkKD5GWqpUaWAZ
 OLpet6uCvoBse0RzsxRMNA0luKGQAzMlHSOf3NneRDPZA9C6wivWtYE3sOSMK3PCeCYjTh+vt7H
 QTZFwB9GWtvG//r5ucE4vLOPcxlvvsYUNmt19h6s6VyDQX85Tym9qqucQKA3pz3nUP0pnFIQjQ7
 jZMCdGZ9LDNFj9n9BeGz1rhTtx4yuw51SB224dKnYG5MOxTroguaTl1ShCf1NeJIJXTDkfmOFDC
 HdQi6NvU5sPjk4clfRA==
X-Proofpoint-GUID: LTiOSQTjh9QFb-kTWPqAPrzlZVmh7eCa
X-Authority-Analysis: v=2.4 cv=FcSiV5+6 c=1 sm=1 tr=0 ts=6ae53b70 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=LQZMuA99dPo4G15aSkQA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: LTiOSQTjh9QFb-kTWPqAPrzlZVmh7eCa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDAwMyBTYWx0ZWRfX1av3fTNPlj8/
 n/zJph/jK/6v5fesFGdJQWuzp/DJ7ayv+9vTPycjsJYmYu4Vwg/a0rnQAtTJ35/jAPOucNlgDlt
 t42P7+lWBJECC7ZFxAwap1twnWoxc+k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310003

On 10/30/2026 2:09 AM, Jose Ignacio Tornos Martinez wrote:
> The RU start index for the fourth 80 MHz segment (80_3) is read from
> rx_usr_info->info2 instead of rx_usr_info->info3. The bitmask used
> (HAL_RX_USR_INFO3_RU_START_IDX_80_3) is correct for info3, so applying
> it to info2 extracts garbage bits, producing an out-of-range shift
> exponent that triggers a UBSAN splat:
> 
>   UBSAN: shift-out-of-bounds in drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c:302:22
>   shift exponent 284 is too large for 64-bit type 'long long unsigned int'
>   Call Trace:
>    ath12k_wifi7_dp_mon_hal_rx_parse_user_info.cold+0x3a/0xef7 [ath12k_wifi7]
>    ath12k_wifi7_dp_mon_rx_parse_status_tlv+0x621/0x990 [ath12k_wifi7]
>    ath12k_wifi7_dp_mon_parse_rx_dest+0xa9/0x2b0 [ath12k_wifi7]
>    ath12k_wifi7_dp_mon_srng_process+0x34f/0x560 [ath12k_wifi7]
>    ath12k_wifi7_dp_mon_process_ring+0x205/0x270 [ath12k_wifi7]
>    ath12k_wifi7_dp_service_srng+0x1b4/0x5e0 [ath12k_wifi7]
>    ath12k_pci_ext_grp_napi_poll+0x43/0x100 [ath12k]
> 
> Read from the suitable info (in this case info3) like the other three
> segments do.
> 
> Fixes: 5db19c488413 ("wifi: ath12k: Move MU user processing to Wi-Fi 7 module")

This is not the correct fixes tag since the issue predates relocating the
code. I had my review agent follow the guidance proposed in [1] and it came
up with:

Fixes: e6fa62bada87 ("wifi: ath12k: Add HAL_RX_PPDU_START_USER_INFO TLV parsing support")

No need to repost since my automation will pick up both tags now.

/jeff

[1] https://lore.kernel.org/all/20261020142534.3533478-1-sashal@kernel.org/
    docs: submitting-patches: say which commit a Fixes tag names


