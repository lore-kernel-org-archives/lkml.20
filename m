Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793004953;
	b=Ni4mNWDkc07JmvsoK/aRo+d5sOKibMTV27ahbtlzauisyvzMIogWw7BtmRmJvCZQmWX8
	 MZ3iMkyYAJAiuukBwYlJbK5pFE0vY1joqdTftWPr5n3FCBgoqdK4uAOmQt5oAYrSJwufU
	 lnoeiFswpBcY+U0RO/pKmLMOh5JTcztb5jBM8SV0nBW4IswLUDsWxbLvf7SU+f/l10Ij/
	 jLR75aaFR2gkfJY14AqPt6QEEjrtL1xXi6Y0lAuR1KgfOjtIpy8ywo8OOk4xYXDZ/PDnD
	 X2wS20Oyz78zEvzAr9tAHTZStJB9NTY/imVWCXEplThJv1RY/uqa8EhcQMMb9RPGDFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793004953;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FXg4xpgpqKJGIQZFyp8YqpU/D9tULXMJ9qr4Kv5LHP4=;
	b=L096WYEcyad9M3s+h5VN2nkVr57cREc3daY9XCpWrgVnsRVswgbdW7oI8V25TZe2LDCU
	 qpayjdlqPnegzO+Jjik60UTIKV72sYSKhc+1kimGFM3ML/mTBpNJ/CpfzTAKp9i7A8XM7
	 BTib3slKumnG75vNbJpNNyDWF0AFk6i0tqwl2BXQ4vvEIztg6Pi6UD9AtQJLnRMhRWK7h
	 tm0iJnoF+FOBdp6d1kTouW1B1rGt5payzb0FJ7wxTqopxlKgUAfW3c/Ex0mHSInglMuXc
	 WW3RfAe9DCAM4v74VPsnGOPTrngK7pnJRfWixvtco0Om+CupB3G6aBw1B7o74q5BizQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="XPq/q2OF";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ORg3rkSf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50ABC606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50ABC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XPq/q2OF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ORg3rkSf
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b2MI2806372
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:55:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FXg4xpgpqKJGIQZFyp8YqpU/D9tULXMJ9qr4Kv5LHP4=; b=XPq/q2OFwelomY31
	7jQqED3q7kO/Cqs3O3TBMuh2NdmHiVYuEeI8yXDtPrCTE8cWgCkIZDM9VBqpqceD
	Bs5TR97unIMvVfETuhEci3sylb4EA2F8OMfihATxiWUaol4oJnKgs6EDij0Ypjvf
	y9fmmIA4fR7neiJBiwIn/TYxF1lVvBL81PMS8gx2n1GF3SJg7UJdJjR/H/N0zgG1
	jdikEkgXRVD5gPQZ+hHSV+cXkqZn+C5aSIQe1bPiohMnlSU2df4+8Rjsu935B8Ha
	g2n79KAFb1NjKwQ1FMt9A5f+UykW6xIbVZF6WqagWLEdrNxKabZXUB8dCNQgWIBq
	8Kkuhg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm8xnnb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:55:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb1091fffso19788685a.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793004951; x=1793609751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FXg4xpgpqKJGIQZFyp8YqpU/D9tULXMJ9qr4Kv5LHP4=;
        b=ORg3rkSfvbQdtlWEgiKmPiv4VXJHsUrR7EkWBk6QHFmbtLeJ+3QRHFY9xer7/pPeDd
         slyt/KINkJG+P0s/6O2x8glw1RsLcy5Reo8soZie8siGdM+elWpYloB6QdAykv45JU/x
         2ZWAdl9p4NgWd3ygKQLXBKg/d5L6XA8XleSVnvEdsYmIzbtgLaayCJiBUq973KwCF5as
         OjIbHlYZymureI5uBDup+IVMdG2mm5NXS3kSJDPCZUL/W7SxuJJDIsGIqKyh9Bbi4tQi
         dC/dNLMCVV8rpu9fg1n2rl/eo0YKTscj4JkUqgEspYC6v8llR/5BmgktH48Q5SyMXdzb
         P9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793004951; x=1793609751;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FXg4xpgpqKJGIQZFyp8YqpU/D9tULXMJ9qr4Kv5LHP4=;
        b=sW6fo0eFD8Wu06fPjAvWC+cc1pK++wk+iQOHrU62pucXVgZJG1GtF71eGwTwW0uSCO
         NPQTRJVySn1ytT/GWuUUx3+rvJY4utLyTVhh832uHVvKcAuIsewKqAWowhNDrqgYYAj4
         NAPxMglWgSOUuOsmMtz6ZpLVc1yf66/UwHaDudYyj/PiPej1NVtQXaREuZL0ufRmQgWu
         kMGhbRm5vUVMNf/qVzqpLkZSGfpIskpoTQzfFUNJrBawiDZ9yzvOvsyMM38o+NHkpK8n
         GJHf6t0SUn8GhXpnZcJZEadRZdnhxI43QJwNc6lq/hDMgCNQbSEter3DvjZrTIhtbA/T
         vFoA==
X-Forwarded-Encrypted: i=1; AKwUvByPfWqeA+ZxBTHx7787KnaWKqKxqcdGzPBk7NnKKSFsebKfnLqZ9SaXGqodDMywXbt7Yyzl6uUYUFGDFxw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLstp+EexA+RbrMErZxqoqtdM74SXK+8ty4y/YVwOjhdmj3j6/s
	uYR7F0M1Hn9INMg03XXlx6Y2unO5eAaeBzSz+IxdjyXdbtGxapUbQu0eoatbQUu0XGEmXpdWddg
	+0U7cLr7jqZbZfSDEZTmXH1soWnOqUWJ2C/Rds3GpgMXm/GvCTfasMsxrPPmtvWaLI90=
X-Gm-Gg: AYBFou2q+EphT9LzytBWCUyo2AWohtkXIhuszKkTwK62QSXmn785hDIpPnnPkd3lwb+
	orc6SUXrk+WYfEhhdDb3+y44XgOniUKbuFBC6Yc1ArRjcacFA8o4PigQSW/ypWa9HqBXdz/bJRM
	T+t3Vwtveri8Ks3/v0c2GTqL1nyTV/meXNkub7C9mI3eLJ5+/UGTPOu5+uFsGQE1OPMzpVmxDW5
	Deh/tFdZsik7qnleoc3RP243FqntPsq1+IDQTruztQhoebI6lZ2F6yMp4RwJH9Tg43Vz7OIxSYl
	yfodKosJrjZbE8CI5D+etyREh/zkMj7HWa+Dl/YPoASr9HFusxO65SUfULupwZQi1rDLdpEv8Il
	qQ+RESSfQeccgni49yjAYvw==
X-Received: by 2002:a05:620a:3bcd:b0:939:9ef4:79eb with SMTP id af79cd13be357-940ef96e36amr990259485a.6.1793004951383;
        Mon, 26 Oct 2026 01:55:51 -0700 (PDT)
X-Received: by 2002:a05:620a:3bcd:b0:939:9ef4:79eb with SMTP id af79cd13be357-940ef96e36amr990255085a.6.1793004950822;
        Mon, 26 Oct 2026 01:55:50 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44595d5e8sm3412794a12.6.2026.10.26.01.55.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 01:55:49 -0700 (PDT)
Message-ID: <0453a913-37d9-42cb-bb4a-511c112d21b4@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 09:55:46 +0100
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
Subject: Re: [PATCH v5 01/10] drm/msm: serialise framebuffer pin state
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
 <20261024-fd-kms-fix-smmu-v5-1-a5b0b284aead@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-fd-kms-fix-smmu-v5-1-a5b0b284aead@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fvFo-uClisc3NMKBnxmcrOhtJmTtD9e2
X-Authority-Analysis: v=2.4 cv=Ra0FmFtv c=1 sm=1 tr=0 ts=6adf1598 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=II6hZ13XIzipqfIPTBcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzNSBTYWx0ZWRfX5IJ0Cjwrzm2S
 QCq1N7OuXTmCTx3fY80cJsOGi1AEUHUHyVZqoOsbUzN34Q9plTMnaRJto5HW9GGBzRBgsGG4vVw
 uKs82qtLQnRuru+98Lp7Tm30u7t5pdA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzNSBTYWx0ZWRfXw8Y/jX03h7CE
 caNtjSqm3kwzhWHnyZJkLIaxG5nw5+2MyhrImaNBvtLwvmpMzG9vIMdkD/H+yZ59KdAXWghQhQD
 aFuCM6QND+L3pU8dRwQI6sqbXaVk1FnrzABQqCIcz7Vk6EjMyO+c3OovW8d9/0yC0BuQsnUGeRR
 zqQwthwQSGIrWS7k1kPA5ML/e+XM0Vulz9xZR1fawp7KS+fUbQSCJ9JjS50rqMMzkVd9LmCUPso
 7JZcztvzaaTHu5t6Wx7eT+M+EEon/RVplZ2/D8SDLm0DslRoL/59/etG16ko5zslkeKUYduibQw
 MUmiCHnR2qzJk40dCdarvp/q5bS23ibTB+o3Yl0ir8lGzintG+iZsxkg4B724qskU7r7rRwQhgZ
 LOIuuAqa3IUNS7W8Z1UrA9qMOqBI4gMIgLUI0J5H4NMDj0qU/LmguV4d1YHAWipQnDxp/pV5V0T
 ALqYD0bc/PfXZIXpBSQ==
X-Proofpoint-ORIG-GUID: fvFo-uClisc3NMKBnxmcrOhtJmTtD9e2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260035

On 10/24/26 1:25 AM, Dmitry Baryshkov wrote:
> prepare_count, iova[] and the pins they describe are updated locklessly,
> but drm_atomic_helper_commit() prepares a new state in parallel with the
> completion of the previous one -- stall_checks() only stalls on the second
> previous commit.  Commit N+1's ->prepare_fb() thus runs while commit N is
> in ->cleanup_fb(), and for a double-buffered flip that is the same
> framebuffer:
> 
>   cleanup: prepare_count 1 -> 0
>   prepare: prepare_count 0 -> 1, pins, stores iova[]
>   cleanup: memset(iova, 0)
> 
> leaving the plane programmed with a NULL base address:
> 
>   arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402,
>       iova=0x00000100, fsynr=0x3e0023, cbfrsynra=0x1c00, cb=11
> 
> The opposite order is broken too since commit 8ac37c88f991 ("drm/msm:
> Refcount framebuffer pins"): a prepare which finds the count non-zero
> returns at once, assuming iova[] is populated.

The clanker thinks this is correct and was able to reproduce by doing
something similar with a test program

It also left the following comment:

The mutex approach in patch 1 has a direct precedent in omapdrm, so it's
a sound choice. msm is unusual in caching iova[] per framebuffer and
then zeroing it, which is why it needs the lock at all. If you want a
fix with less state, the amdgpu approach of not clearing the cached
address on cleanup would also avoid the NULL-base hazard. I'd keep
the mutex, though, since patch 2's count-leak fix sits on top of it.

any which way:

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
