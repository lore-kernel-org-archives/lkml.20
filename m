Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C836851A157
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066250; cv=none; b=m40e6alDJtSWgGNFbYfb8y8EhfUU18/W+5A88kMOFXm8sZt9ctSc8Xoy+4YLp5mRXysqWfwZLe7Osa/XI7yvAxzgK6Zt5c6vd4pp2H31h2cq116dkr9blM6Nnza2Yt4A4dleT9sH93hj9JHsEz20EY5Uqw5zFFNvib6M74ibh5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066250; c=relaxed/simple;
	bh=kzQwipFJf0iMNZZxRYiBpFViwXjH6Pw4kk4B6GTQOY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DE5v7OKepwsfmpRIEuhi5hyralRGWzvG27lsOY0TKEEKYsRXI1KJDHFSkGM80WqyL31uBDeDEP5zR7MgHsMvYD5w4eOoI3NRbqrY1z45TnvRMeH26cAoj2yCJJZwVsZUbGHI80vJrK8ZO8mzQ7UJ7fp5shGPA3iiXZ3G6NiIi5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oxm1KoHF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AtBBuPG1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oxm1KoHF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AtBBuPG1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9kHuH2999213
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:10:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PXlp0dVi9w0eFYcewB3wyG32JuzPm37vPEQoCTMikrw=; b=Oxm1KoHFfy/3mjhn
	iX1nq9p2KSbvMSZF0O8ySqWMQtrzQDYWH5yofypAhFqi7RbpLcMoNgLmPt9thaZV
	bkIi+1ZMTmJeqRIHka5IMem2p/YsAS7ZDyNxsfBiRE6T1sf+vv2yKq5exnyIcpNb
	KtVElwX1L6d0bBqDNbQs/j/DPLrH0KtE7GA2Z893vdD8ZqmGv7L0CKere55TOxgO
	TsJClzrnLdmgmq0CLEI/jUT2pgd9dCUf2f48R2b1pg+LpoavdUanrSNT3Wa+1h0u
	lvVODCtsEqa4nCFYOPxT0kkTgV27jUNkym8uVS0sn8hR27F5BDd0+q7b9cs/frK5
	5LS/1Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hausm0u7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:10:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934956beec8so282376585a.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792066247; x=1792671047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PXlp0dVi9w0eFYcewB3wyG32JuzPm37vPEQoCTMikrw=;
        b=AtBBuPG1PkUWMNWeCQ68FFbRgeVjyKwkjWHfkfP5u2EU+XmgAR4brdcpsojXZvioOD
         gs5vgXSg3Aozhs+auaFDSQEs1e8zup0rpb5H6tH5MSyGew2O0T8nhrGKx60o9GnuQ8oT
         bLsUrEhQ2wTAvoARZKLePVmpZ3Jl2Iy3C/I2ZYovnxOoX8C0orL9uIUPFVO6yheHHoz7
         fWpffAk6FSN3ohJFuJcXIJ+pWanFQ+s831Uxul4J8HEPVM1IzWJHvKy/gCSOVU8UVc/g
         2NBKnfAbCnks7EYnHBlmEpz3z5MxmLQTRzyqUiSJpj67CRL527iZ5aKt2U6gtBbfwVbY
         ziTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792066247; x=1792671047;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PXlp0dVi9w0eFYcewB3wyG32JuzPm37vPEQoCTMikrw=;
        b=V1efLAYD/+xJCPltt5IHQ5MtuamV3Sf1Yirw1rRVSDgqZhTtD4chS7GDXI7c4XXuZn
         cFeKEa6OMqx9BqCtdeLSyf9z6mcDc/pPjmHEdwdCBWY5dMMrawpPBTvJo7kKv3NyI+gn
         s2Y+X/ddQx41iVmapb2B4OVOsjqTRtjvbF5anpIN3ztbvlqeFVCtSdGEkvrg+W4GA70y
         XeSqQb2NpML6RNiwElL0NVHeTWBuvbd9VqlJt95vPxjs4VBVBCgutxAWiJgf3++NwTGS
         17lR5nHUSAzCJkAQhU9gV0r04gTV7ya415dE/jmd7E7vNkui1f7xsfuTV4eY5r1Fltyy
         jkAg==
X-Forwarded-Encrypted: i=1; AKwUvBzlMv8sEQWyCtIdJkqiIGEqyu+guP7YF/iwrR2kWA4ZeF36WqB5ub3DXqZSMIEp0U+CwSGKv6Ozb8Ugapo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzbo+hSg7ksSYJjAzC2AlIyruR69NSzvYXwd5jGyh4wxGJjTH7
	RI9sVIdjRBczOARhyPPPT1utgmrspvd7fGahZuGC13MLPjTcTXqhZLPfwX38WzppPa64mguojpf
	+/sGBCRvfcvlAkmOYmGV7b4sVMFqhIP4crHqLdb5MIWdiJ/b/LY+INYqSsrRFPqV3nY0=
X-Gm-Gg: AYBFou3ELoTiFd5NV1LqOFh+GfNDx9Zgevw2KLHhPny4cMCQio61GQPwL/he/tS4k9R
	j6sCrGMNMDbxbRE5rA4JTvEuNZ5Joi/5JQLqTHV10D+RsRhC248fgDXx3CcptsEq8uD1Kcw7s+m
	hhKdsr9T12Dsu3SRor8qjOK0yR9cHuuKBuSH6lzzHE+XzXEHu+hN5kxYAuxr4op4Pjr0CBi49ne
	MTqnbSrKQktCe6AcXzacqwX9+51z8W+pTM2petP+PfK4MHTPl6pX24pr1evuydyPGtL1bifKbTj
	SS2AD56sz7n2Z914qsE2Vnlk34k4ykoklCKt/vj82/jI1pBPbfxEv6A6gyO5hRI2Nb1f/uIFTut
	dO1iLOsmhUKOKWMp6PYs1Y8Pm/IQ=
X-Received: by 2002:a05:620a:198d:b0:93e:4e1e:aafc with SMTP id af79cd13be357-93ebd2598b6mr2904521885a.36.1792066246742;
        Thu, 15 Oct 2026 05:10:46 -0700 (PDT)
X-Received: by 2002:a05:620a:198d:b0:93e:4e1e:aafc with SMTP id af79cd13be357-93ebd2598b6mr2904516385a.36.1792066246200;
        Thu, 15 Oct 2026 05:10:46 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac4f65sm18599946f8f.39.2026.10.15.05.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:10:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: brgl@kernel.org, linusw@kernel.org, Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        ukleinek@kernel.org, aambrozewicz@nvidia.com,
        Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] gpiolib: fix memory leak in gpiod_set_array_value_complex() on error paths
Date: Thu, 15 Oct 2026 14:10:43 +0200
Message-ID: <179206624090.9766.14775829225106044242.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261015025749.47039-1-warthog618@gmail.com>
References: <20261015025749.47039-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6L6ybt04nQaihHrZlQFiFp_N-NzTjgoF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0OCBTYWx0ZWRfXyfQifxjybG5S
 AB721C/3rDVCepJTyGp6tgXWUco01ay4f7BcghmxChQdPT3S3vT3VR4HeYRFp/X3wkC3Sdpbgfx
 vBC8NPpFWhrjISBE26f+2ZkDxHA7xS7Z5LiPXUix/egdoZ04gfO5q9fr2XKcQ2rZj8pcJHESJGl
 o6Nkfyep5xogzTq7qHYRxysvppsQWx8K0Aw/p5c/NUSOsVJnTyEvBb98/VcvNuLT1R0AjM7XlEt
 dmp7N2aqnNZkhiP6fV3JeyHIMFazpwAQCnj4zq2iiT+4nQUnNwPWNyuHkKVW3PVSVDxB0eqChTK
 m/wrqWL13UTa3mXMvdVtkeGV2swOhyoKaho79EtCtFeeQ9pI5iywhTiMz0qkYP5D8CsUuhJfyje
 asqjaW9eF/ITkrC2r12HixGhQl3wNRLWCvSuiBsjHkLnou4z/A+UEKmYpIJAPsxfx7bUGpnsALK
 t83+M8jZFnasWNxaipg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0OCBTYWx0ZWRfX/zgEthqUAoL+
 Th0bTlXAnFQ8K8KMwzK8rITxx5qHyF1RfdnN8CYjukQzSReZjzHj1BPmKw2eSbI3A2hLmL4aiEQ
 mdFrxMeOYPafArJ+uP3L1fxWJbo5Km4=
X-Authority-Analysis: v=2.4 cv=Eb5d0/mC c=1 sm=1 tr=0 ts=6ad0c2c7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=mxsbtTdqVfBe0W_QvYgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 6L6ybt04nQaihHrZlQFiFp_N-NzTjgoF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150048


On Thu, 15 Oct 2026 10:57:49 +0800, Kent Gibson wrote:
> A drive-by review by Sashiko reports that, after a failed call to
> gpiochip_set_multiple(), gpiod_set_array_value() returns abruptly,
> bypassing the freeing of possibly alloced bitmaps, potentially leaking
> memory. It is an unlikely error path, but is possible.
> 
> Defer the return code check until after the bitmap_free() block.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: fix memory leak in gpiod_set_array_value_complex() on error paths
      https://git.kernel.org/brgl/c/c28846ca1ac6134881114d272314623c8433e372

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
