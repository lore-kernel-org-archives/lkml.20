Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793170869;
	b=ufkH8BZLVL4ona4ZSNTKYVmnnzzOeyM7ZyHBapuOZ/5qackdBgSNqQIbWMsMT+xqmQvJ
	 eaF3m7IwYN/ZOPJsV4AVoxlEgieA1hqzE6+hPjviRxelKV+m5EPz7ADRjtNXKq1lvBIyq
	 wFJqUixQJvKXZK3CvfcJbZXpew13M8lLVFnAimuJQai2yCZ1fgBexHP4fnl+Y3dp/bLYI
	 IUMx6nk7+5mCeG1sQSbZCjaXCkqyZjU9gkZ2VoKm2b1gvPsiMXb2V5tYsAryCiVC00RQs
	 Mv351Jn8Ey3GMw9p/2nog/5GXkX1xHB5IFG4nFQXRJO6L6XvouccWK9bHc/TH3xo5dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793170869;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9FRLt4KkgBqQmPMg3ZZXr2HUI1ClBesmUd+I8ZCER5Y=;
	b=mjL6BAROXMHw4Y43wVPE6r986gmLVQDL38/jH1E8+P0IklkCfLuY6xxD67FWwRcIvBkF
	 wRHN6kTVHv2Md328D+LPzHCHpm2D3dbtUgQ3mY+tcu70hsjZD+x0qfaSFtGhooG3Arn6N
	 kIXrqNzCphXSIhKsoCMC4apJ0Zc4xlKuA0tIqac3Xrj2Fz4pObRfwXOhBoIx741jYHgKP
	 CKfVcovcxMv0hlcaKfErnZoRG1i2NTY7TCS1fiYyBOOxOmBHwkKMfbGTlOUjpGed0tjZb
	 Pcyjr2LC/i4woqoueNBEKohky2Ww20vBgjPod6f78i7WnRJ/v5PE27wl5TG/6Bqwx3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bMCCRajk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dpFKCs+4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08624606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08624606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bMCCRajk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dpFKCs+4
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4PQrA3381222
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9FRLt4KkgBqQmPMg3ZZXr2HU
	I1ClBesmUd+I8ZCER5Y=; b=bMCCRajk2UoRkhg8aXgnGRd+nW6cHI7/NdezcXN1
	i/3hIm8UScGeG672kUThb3GHCLW89tQUVl3CzzVlev56VQWRDqn6gnahOn6wgV2O
	iUS1OJbejQ5ubyD1SVEGNUiiP7zrcZq2r+r8cTOv540LGfu9FXHSlv8kaGaKqG8h
	5XPrHsznLMKr6BuTqbtEEc4EDFpTxAeEX16GcI8tEa9bfd6HlNZpOvWQuaFc3/5r
	Ivt9b6Vgmj5wHvZvvj3743i5v/8sW6H5xqKbeFuz68zlut9T8kK4+0ARcLUHhsJw
	qACxliQO+65d7cu8oALQPbCvmgz5QvbN/vKNEDWgRpL/EA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f9173n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:01:08 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a01ea9e318so951857b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793170867; x=1793775667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9FRLt4KkgBqQmPMg3ZZXr2HUI1ClBesmUd+I8ZCER5Y=;
        b=dpFKCs+4taeJuOLFx3tM1RPWZSrtvL2wq8/ILE2FliNJDKR4rnkAQ6/BYJVcnS/4Hr
         jNNJ8hJwGx5+ggQdODJGbX2NWHM6IhzcMb3kvLv7p/g+9wul9pfAL/df2cHQvj+zJsva
         np8vyK5CCOI/BfSaYC4ojRMn5SByAYJesVjzOrLGFIyKJXh7tpSDNTrUU6dXiOH++9DD
         2wkMuKwKecxwuSf0n+rwCRfA6Oo/PQlcumhi5HdIQTeWaNWQ2KMEGHyNTmuhMSgweKUf
         2WPWp//FL1BZSCL1fcbJ9AI5SsZaXN+txkkiMaxAWWoFxnDubRUDh9iufm4UHtJVWGFq
         GoEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793170867; x=1793775667;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9FRLt4KkgBqQmPMg3ZZXr2HUI1ClBesmUd+I8ZCER5Y=;
        b=H3kMN6ol0T6bmrqnuKVNEar/slMUPFHbXPqjw/mo8UosMhx2x3t72pdZKzFBkpAmFt
         Mf7PqBp3ATOI68yhak6257N8LpBlkvinuixbE4kCUlC7p4nPfLsn7wyjuSmo4fAr2J+H
         V4xIY0Bgy/67QKcFT0Xy4oYA+bQNmTiE6jwCp4acpBCMwkwOgYfmxjSYgknnkvpgAAah
         fzHBs9JERjdmROYJqA0n0rX4lGf88btH00TA7H2JMmmZOHZDv3P68fMIcnnLlGKCCPA/
         MM94FlySHLvcS5VKYHJF/GSHTWRm86NNTMwzhgMn/yNo/wCaJNn91ekECR8UmwqoJ6hq
         ccQQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+PlC2GeQRWjmg0k57iMDMDSjrgaetG+PC5Sj5ubDc8HJQ0MrmyqSZokesn101Lz3XXdiO/K/xTVutC4w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFZZfW6l2yzSSiPAtS+qYX3o0qmGYZ5FgaEyDYBgwoQOYCcE9M
	s00CrN0atxYP1FZyIRnGqG2XWjg6LRuJLdZdNuD0pGWCjqyH9a8qdlEEwx2z4FdUiudSovHLiee
	H1EhbX1WqcjFh1vdDbblsuwpFAc5TB2X9AzbFzs48BUcyJ9mWU2xctJP+kLXanRumsj0BHkcBPM
	A=
X-Gm-Gg: AYBFou0S01vSxOrg7uHL51QXZqkBwAvb2mzeaSuFiWCkMeedtRTQUkl3GpQQ11R1fVu
	2Woxo8il1GtEldEbwMHidw4mv9/V9a/XTR9QQL//3qX+lNiH4bJtcKsxsFZe6xjjfGOewUH4fzY
	ZhRxd2IhrIlTMevGhdU1fFNNmwd4SOe1FNc9mTmna3dQwRM3+v6uPl+jXAqzExiTc8jNf7t0HhJ
	/FbglNHneu2b6ZmsMiZXNtvPVOMrTyRtRmja6UJlpRg6JIoOET+YL318zcbvx4MkjQWizwHkb5h
	QlfrXzY4Ke20tuSa/KuUWJ+raU1P8Z2FLWbYmHfVPygf0SeIr7UsMbV6rLQj1ENLCqk9sbGaxEA
	pNsQHhNUOTJhgwN+OuPd+B1TW8xlLFpMYomZFgJIFXTeNuAnbWHLXRu28XHz1iin0Tiy5FI92RB
	FefRpOR8CiR7DGr4s=
X-Received: by 2002:a05:6a00:997:b0:8a5:7006:1ecf with SMTP id d2e1a72fcca58-8a6e80b67edmr1121111b3a.39.1793170867401;
        Wed, 28 Oct 2026 00:01:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:997:b0:8a5:7006:1ecf with SMTP id d2e1a72fcca58-8a6e80b67edmr1121090b3a.39.1793170866899;
        Wed, 28 Oct 2026 00:01:06 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a662ba00sm759515b3a.23.2026.10.28.00.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:01:06 -0700 (PDT)
Date: Wed, 28 Oct 2026 15:01:01 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v4 3/4] gpio: shared-proxy: Drive the default value when
 no votes are cast
Message-ID: <auGdrYC_mZeJft0q@QCOM-aGQu4IUr3Y>
References: <20261017043605.1503563-1-shengchao.guo@oss.qualcomm.com>
 <20261017043605.1503563-4-shengchao.guo@oss.qualcomm.com>
 <CAMRc=McoAYKHojJCT6yeTvsMLKDTisD3V42VH5ebRapuG-UGBg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McoAYKHojJCT6yeTvsMLKDTisD3V42VH5ebRapuG-UGBg@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae19db4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=-atq8JDSDYGcsakhjvoA:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAyNyBTYWx0ZWRfX7qIGbnaF5vkm
 +NNG+PDMX9MJwHKcpKZYdQPF3se0/30UeyjW+trk85C0L5snPvyJNX5/53pauX2V578Hy+NkD5l
 qZrCejy2/OUA/CAjgudZv86fAhwpA00=
X-Proofpoint-GUID: AkwkDatRwi9_kwcmKuaBp49rBNMe_Vj3
X-Proofpoint-ORIG-GUID: AkwkDatRwi9_kwcmKuaBp49rBNMe_Vj3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAyNyBTYWx0ZWRfXzuKakaGo+nqD
 4BtM44oRE8zRZy6+QRwYZFTtgfY/8pSU1c/ckpr9hVOPh9uei/a2yPZUbbAr6Jo+FMguFtHKIfn
 EIZSqEhGmZuI/CmlqLDSpX62Nz8tbjRnm+LnUmE99jVsMbiDqhCgiXae058z6p264nZJcVuX0Mn
 GCUIfoxpM9tprWI9a8M4Ls7fp6vN5yL9pHbqjP8/+mro/QUJ2DFyP/dQC6A83BObizwiIkVg8/g
 VkULvRgOo/H+1laVltrE8QhpSDkYQb/UkhNu1xPlg3Mdz05N+X4tYLDol/lTDAdf0vpTrlBO6H2
 Z1DNg/Ax5dzwmIugs/qlu3P/R48yeh+HLyDkFChdz5bhXufcA4MdiOYlhIt3HrsYz/+0a1ieV5E
 2EkYpMtCR1fcbyOxV2XbF3wksRlpu4s+9xr2CVAN2RwPgRtl4SmgUB+3I00XjUox5JIBL6mvGpS
 sur9DPzaC7+cHhzrGqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280027

On Tue, Oct 20, 2026 at 09:17:00AM -0400, Bartosz Golaszewski wrote:
> On Sat, 17 Oct 2026 06:36:04 +0200, Shawn Guo
> <shengchao.guo@oss.qualcomm.com> said:
> > A consumer that requests a shared line with GPIOD_ASIS never calls
> > direction_output(), so def_val keeps its initial value of 0. If the
> > line was left high, for instance by the bootloader, a later
> > gpiod_set_value(0) from that consumer matches def_val and the proxy
> > treats it as withdrawing a vote it never cast. It returns success
> > without writing the hardware, and the line stays high.
> >
> > The consumer has no way to tell. Its request to drive the line low is
> > silently ignored until it first votes for high and then withdraws
> > that vote.
> >
> > When the requested value is the default and no votes are
> > outstanding, write it to the hardware instead of returning early.
> > For lines configured via direction_output() this is a redundant
> > write of the value the line already has. With votes outstanding the
> > request remains a no-op, as the line must stay at the voted value.
> >
> 
> Wouldn't this only matter for a line requested as-is? We could avoid the
> redundant write if we only did it for such lines instead of for all
> unconditionally.

It also matters for a line configured via direction_output(), after
patch 2. When a proxy releases the line and restoring the default value
fails, gpio_shared_proxy_free() still drops its vote. The line is then
at the non-default value with votecnt == 0, so "no votes outstanding"
no longer implies "line is at the default" either way. The unconditional
write lets any remaining user that sets the default bring the line back.
Gating it on as-is lines would leave it stuck there.

The proxy also has no direct notion of as-is; it would need a flag in
gpio_shared_desc tracking whether def_val has ever been written to the
hardware, set and cleared in the init paths of direction_output() and
direction_input().

The write itself is cheap and rare: it only happens when a proxy that
hasn't voted sets the default while no votes are outstanding.

If you still prefer the gating, I can do that in v5 and keep the
free-failure case recoverable some other way. Otherwise I'll add the
reasoning above to the commit message.

Shawn
