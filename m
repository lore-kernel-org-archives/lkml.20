Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BA0472F73
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934754; cv=none; b=NeXEB+ugjiZPaykHjlX3cQuF02a7/fq5WBSIgaUDO9+uYNh6Vt3yymXwceE0ykwvgK3Mf5z+H/Gd239ugOaO1CgfO2AAMVeG4Dyr4KRzqdXe9xbWrUUKjQJJmaG1Pw+B+BFWgOv79qcnjNYjMpypPUNe9r3KPZ1PxxxfFI1MkjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934754; c=relaxed/simple;
	bh=Wk003mPRscXKkC2kxK3DF9LhU0/tg9S9WPMvqfiftDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XRdFPUWGTnrfsOwZ/nunw20TCqFb/hw5Mvl328fdJT58Zb5LEtzbeaSJskig5X4TGfk2u+mRv9IapNNIa1kIf9DtxsAfvok5TsJ6v+CJmnaRuCDaP8f88PDROWa4FsjpyJFUD1QVulZDnBrgxhavwg/waoANEIxgAJMBbFBw45Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TZFAZPXJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MOyMwdil; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TZFAZPXJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MOyMwdil"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nQ5x344036
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 09:52:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6m2y1KtWVZtI5Dc4dXOHeD8LNqvt0R4u9wS9uoheMY4=; b=TZFAZPXJvSUNssIP
	kbk4Y3PNfs53YClIJ7NeWTLSU8weFgQIhT0GriEVdsvjpKB5nQqVG2mF18cyI+hj
	TxMj+coha0MF9X5GnZRp0uy44Oi4HleRM+fPsU1qSAfPz7fksKJD7FFLF1ZVF13b
	r8OVcf9DdQ3OG6r/TrU7ZtqsuNAjkYFZyizO+z1/l7vRtJ/mSOPNVCPFy7/4amZg
	rB4V986F0pYY7OEry2uircqTrRflMnOt74soam/7mi5DQLYHbFdDNdAlZk81UyuZ
	8mti8T1dPGhaMMSipI4VKklJ25Psf88ohK304inRExITdggAOZpJ6WTjwj/MpE1g
	pjBHZA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1rvqc27x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:52:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so1831630985a.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790934751; x=1791539551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6m2y1KtWVZtI5Dc4dXOHeD8LNqvt0R4u9wS9uoheMY4=;
        b=MOyMwdilCZtgFK/CyzQ+TNT5LRrlZr6NHF4RfIu8wBr6HgmAXmKcKtQvrYKzZqR4IN
         pN4gE//hzYv5RS/9b531nf9tKVJ81IA48IywJLvUaLs0mCzLdZtC5tFN8vYzRqXNzrge
         cjpv8+S+5DjvRA2W9fiymhPLFnHy0ikH7Lx3irSIvpPnDBsUJB6LREB16lY4Itl0st9Q
         nC6l1MdzXbJUxhQp1mAG4mcfsq87Z2+bkx9bxgiTyq82kaNIHvE1zphQVOqO3Ouwyb/R
         fdUtWvaF0BcLXF/AYZ2Azd/eoiVDCBinAcKfgZ/ZqKXZgVPgYYs152334MXnHefPECfV
         1nQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934751; x=1791539551;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6m2y1KtWVZtI5Dc4dXOHeD8LNqvt0R4u9wS9uoheMY4=;
        b=Qr9OsdEGEKl+2T5/gJUsUNNevH8bw1+wB2lTPolXQaGzyNv6Tk0g+dmJrbFJ0/vEQ/
         f3g2CNSUkIsBqtgQG76muO9mm5GmO8/u/00NsW7iq0Ju0YkiioKOPATJpuLNg5oFI9yz
         Gqeq5nR3sx4+CJmnnHWEh+hTGZUSXcBVaWIZ84ebrqpTrqbixVmvRIf2cLN7XcsLVixd
         6HFQCJ/iskD1lVBIxBsjHGlazqdxnqIufPI4UJ7zCMaktYsa//vweQ4NT86amC85Lgh6
         BuY8kIzVpESGc3YdyJg7wGLhRhkcdbcH/tvr8svIsZioUO+oSEhYh1/hWyFbQ8Rs8Jtb
         yhrw==
X-Forwarded-Encrypted: i=1; AKwUvBzNAVVUSgo8QFw+bABj4QStEY2w1BK4JA+D4iSkja+HyudSmOudxW3U0dQ0d72v+eRsBe6ftHeSnaZ+RT8=@vger.kernel.org
X-Gm-Message-State: AFuF++kLfA+dGcGHB5STyCChMk63fydVw68YvQkU5+8kn96d/dIsUU6X
	9HJAF/FyEhPVFqYdKsrO+sb71M4hY9N7mjywR/ogI+mSEI3E6xeS+acAL9tq0vzaU9vEAb3OfLB
	i1b+ZtqehQJp9hSI69ODNxjMOPZ/lA03wU0ffBEoCxOuC9BlHhqz+/Xfh+ERdUIJLxko=
X-Gm-Gg: AYBFou26p4CGqFdnZKk3WsGPxUQlu5VmCsvgz1t1mBpPc9AD19KRAYCVyz6/AUx80l4
	OiTFgth6KOhcv3znclANQtuda4sp7aZ8l0Y9wuGrfdnvB1ufV7KWvZvUINtN3LwKTJLgEiPB4bV
	gXfLATAi3t58o24R/v2669wM+6kdzKy5N+8S0Nw7nz4TzGdHkW+fXr37St4tIxmxJfvpxBQJMXj
	90rx5V8QbxClg2aQDOO3ayyLNYzkVBRhTjUdqW+c1cxABCgyer9NpBWGKHFbiKyUN4heWccUQD5
	aK3v48a1TUGbxkgZs0fTSGPTgIURPgpmqPWvH2R5cnWPjNEycyWjH8deK8KBJpJXzZjHQKXEPPV
	ZY43O2dBD9nXNqaom+g1s1IyJnBQlLa2AgAhDnuGRCTvIZjczXJyAuTMT/npLbQ==
X-Received: by 2002:a05:620a:a790:20b0:93c:bb75:d8f0 with SMTP id af79cd13be357-93cf170b54cmr237248085a.27.1790934751372;
        Fri, 02 Oct 2026 02:52:31 -0700 (PDT)
X-Received: by 2002:a05:620a:a790:20b0:93c:bb75:d8f0 with SMTP id af79cd13be357-93cf170b54cmr237245885a.27.1790934750933;
        Fri, 02 Oct 2026 02:52:30 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:f14c:b716:c104:4712? ([2a05:6e02:1041:c10:f14c:b716:c104:4712])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280d1e38sm55681315e9.13.2026.10.02.02.52.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 02:52:30 -0700 (PDT)
Message-ID: <94e3f42c-4ffd-417a-9bee-69c504360af9@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 11:52:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] clocksource: clint: Use IPI_MAX for IPI muxing
To: "GUO Ren (XuanTie)" <guoren@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Anup Patel <anup@brainfault.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
 <20260911-ipi_max-v2-3-a77826ff189e@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260911-ipi_max-v2-3-a77826ff189e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzOSBTYWx0ZWRfXyo6hOpMSj1wu
 /b5bxECq7gycWUrJ38ALmWECAykNdnHrD+JvTINECyWXzy/ss5kqbTEDephY/AeEPzdctCGcN5R
 juqHQmBqyM7sDp540eD7mlMpZori/sawWv1zlKTdAcgFlQaWQOFNGw9xYgDcobVoiOm3rvX72H7
 eQJS3GlqteijE/fcBkdK7XK32SGrkCEMpq8Nmn/3EMMY+YQ9SYxeZg8t4sUXdIm/Qvz39PEtSgu
 mfFMOQaFPgkUestyL+GCeQC6B8nLQgvw1OOHcBEUrj+PrdZ/p1ZLCp4IrPESO1COP6l+nuNgZJl
 iR3+DDzGkrz8Vf7AAR1MD7H1MRIL0BHIx3u3Y0JiI1gnaimgOwSQ8cu6BTOV9iu6L+rFgdMnPMh
 UEdlr31H+1miuBRDpuWxCeTyP5NGnd1+K0+h+pmZTvoqBWy2sPDfpqSgtV7oHeLbOBD5EQaJ9Qs
 oplwzFyMgfarv9E+INA==
X-Authority-Analysis: v=2.4 cv=JIauIMKb c=1 sm=1 tr=0 ts=6abf7ee0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=uCLItbk5GdqmTsIkEKsA:9 a=QEXdDO2ut3YA:10 a=Dn0JnjMMefUA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 5ELqEjgZ9M_SI5wwBNeF19V2QiJHTyfG
X-Proofpoint-ORIG-GUID: 5ELqEjgZ9M_SI5wwBNeF19V2QiJHTyfG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzOSBTYWx0ZWRfX3I8hYmAb4Wkk
 /4+BlyOZhcXRHTfCjdnpqJkK2/T5n2kNX1xBuUbhtsrAMLYxy7b7uyVpvZZ1858zGnX7HxYAc9o
 dUpuN6GQajLQSPhuy6sgPUx2BJf+TF4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020039

On 9/11/26 05:27, GUO Ren (XuanTie) wrote:
> Replace the hard-coded BITS_PER_BYTE with IPI_MAX now that the
> constant is exported from riscv asm/smp.h.
> 
> Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
> ---
Acked-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
