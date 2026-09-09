Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DB05540B3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958517; cv=none; b=dd4W0DPBgXKDSxSQwwAcArFApfS/ODcqr7MiZeBwu04aGaazWTXdEelYJOOVt5XdJr4sTcmcth1EDkf9fGgjr3NqUhUIv7w8HnkqI/nL4xbmWG5xYRP8KQup+6OJnaPkzOD3ozCqRo9v/btl9DX+IEqNNFA7v/7qh5/8/A24CJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958517; c=relaxed/simple;
	bh=7TBSuHy5oRrJQVVuqdv6lsELHPKVcaY4yxj5xAtDUds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=acHaGq3tXaDcYFjWD73LZf9ET4Yp+vzun3Ja7lMhpjCV8lYDi+X1PYdKy0VhdfkNC7suoi/nc0B0kK73F8NYx1JtLDVDljDujqdMSc0wgEKq0fjf8qQLpFxj/5mkn2p/bluBnZjP4D1TW4/hClyK6g0G0SEPM4a0EAF1Tm4SKoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XWF2Q6pF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XXU3gHTV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XWF2Q6pF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XXU3gHTV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU64s599754
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 12:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xp0l+FccINUxiHaMdx+4yzVfFMtmM60z+5A5uiSZ3jM=; b=XWF2Q6pFiI8nVG/b
	zSHzCWhm2p7A0JOkmKiYSs/ozFkb2G8Y3EWVn3DbKxhL57A+J/QLKXTZ0qWwsaD1
	PFZa7b1p8Iqo9agHznTq3UzrGIuDMFGRtdtCB8JPeVCgqhahWJ+ZknLGguAU4lOD
	cTrbgXHj57W8BuT2hMhyO6gHaEBsdKcjcnzQTv+8OxJ1ba9fBYLqEaBwGiQL6W5v
	Oai3mhzJDli9cV9nyAxepgEkEZDY+m9bpOxOxtd3v/XSnyt7I5yUwBSdcFZNhdz7
	i6yUJaHvvyYpM0RiyVEeUCiH7Ag8FqRFNbRLrV4ID0cTfpf47s6mGzU5iBAcO1Bn
	1QS2nw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjywr20fv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:55:14 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7819910f8adso4905259137.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788958513; x=1789563313; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xp0l+FccINUxiHaMdx+4yzVfFMtmM60z+5A5uiSZ3jM=;
        b=XXU3gHTVicE2VP1Qv6AeXzbayoN9zca3/X3TZoqLWzV1eq6rVYvRLzjAGfpDE46AyU
         YfYlFY+gLEyd4Qbq99UXozK6es6o9MketAgt2ZQtbRKyKlK4qIyquvayV6QpG1ZfZwWP
         imrvUFd7dAHO0s3EfmoBL8FoVkT+d3YoxnuQ1Gaqfy0M2QkWNXXHbkXZSC60FLB6P2Yf
         7FjCx4GvziuuyNXbAvWn+Of4th5DMwg5lohEeCNUdJJ7a28TOsrdWNBn91jqUkZD3wG3
         WZfN0Up6O3Z5j3AOb51qOGCXVOcHynVM5xEhklQJU0K7CDHIUP6DMWElSIcxtAJEwFws
         1fxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958513; x=1789563313;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xp0l+FccINUxiHaMdx+4yzVfFMtmM60z+5A5uiSZ3jM=;
        b=aMRQdZhfDLe2Za3rPU5B+8IAtuPmrwiQJF4hhSqsv46MNYfXqIFkX9zkj/aViw3QlM
         i6dru7qEe8zOiABm0CaTObpRnoqTsgRd59bvcRq0Hzj8Gdx2hXgA08E5DC++sfgo2WoU
         LYbH3bk6u0u0HeQ6rCEArpwnlz7SnO18YPnqoxkyvQj4ZSZCW2Kd1SqUqthXcoC8DtYo
         rocIWvQuBL17UHwce7qJH+eBSoXvPteg8e31CGq2MElG8P2VBpBpyW21xpyAsYzsH8yb
         sQRnLndfORaEUvqQMDyP+0wyTvrrB7ZGGdXQmPLt3hQk8wE4BM9eP9OAdppt46p5u28L
         fgYw==
X-Forwarded-Encrypted: i=1; AKwUvBz0kKHtEQl/mpiDbsbZ0W3rShiqverRGDtPNkI7ew+dTpWYM2KT55AYF+rycrRlxp7aTdIofE3I4sfoFhY=@vger.kernel.org
X-Gm-Message-State: AFuF++mdTWG+U4rudi275dCYJjYKRZ1zRd8SD8JUZYokoS5yj+P5DwKT
	VorBVsfjbxc/kIr9zT6Cd/z2GWMSMiyMg8v2bhFIyzA0xiSNG9Kicb0u40yf4zRKVrzC4FZh1+5
	6+N4hUvKTwU8++MM6mQGTQxPaGgqWXdqbXPkxzT8AsDtgQjHkPQw6S+AaTX1+7qDFCWs=
X-Gm-Gg: AYBFou3mdEuSiS1SDvX5KeG0Anpm4+4jukdzIv2cR7ZzAJK7YCAD5TGbHpF0Ky/hu5r
	mcnd0uxE0O+xJjAegy+VbnfjMD/2UeJJo4T93U875Gm7XlU63pzTXAqdE+x/8f0TNft6mAEe19j
	TIbEHqkfXlkdmyxUpYkG9m6/5HYSK/PulQHJy6+9fVp2ZXjG3GBO+vhWvbeOK/vHEP5cMEUPYKY
	fRd6UoIvNyjdwNdnhsf85p85tzcEsAVD1qmOLPCvvqEb8yp2wwY2vjmTyomAEniXL1J8Eqh4pkZ
	TlI1pKPL66vwlwVHLY8gGMN6Hzifq0Jg3rM8y4uhv17w0SoRQJH6twGwzswIJ/AYOWqiQY9bzQ5
	cdG32nH31ssNR+WyoTXP8RPFXWlI=
X-Received: by 2002:a05:6102:5e91:b0:784:b882:9567 with SMTP id ada2fe7eead31-78a4a9d9306mr17098745137.6.1788958513381;
        Wed, 09 Sep 2026 05:55:13 -0700 (PDT)
X-Received: by 2002:a05:6102:5e91:b0:784:b882:9567 with SMTP id ada2fe7eead31-78a4a9d9306mr17098714137.6.1788958512927;
        Wed, 09 Sep 2026 05:55:12 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:de8b:7fd5:2738:cc2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883a9234sm43616140f8f.14.2026.09.09.05.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:55:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Wei Deng <wei.deng@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
Subject: Re: [PATCH] power: sequencing: pwrseq-pcie-m2: Support PCIe switch topologies
Date: Wed,  9 Sep 2026 14:55:09 +0200
Message-ID: <178895850666.30743.6753366946500476857.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907122129.1577279-1-wei.deng@oss.qualcomm.com>
References: <20260907122129.1577279-1-wei.deng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a4YAM0SF c=1 sm=1 tr=0 ts=6aa15732 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=iDry_tSsOD4vq6Ch1OYA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0NCBTYWx0ZWRfX7He8IJDbxFeC
 eg4/nNVf7cw12jKG2S21kOdFKbgrkUuy2Ig/yXsq7lem63v5bshBckhCfi+/R/orTAph1FIjjzp
 SoYSHNLKCkxDjJNClVlXkeRwBDRYOFcqbMnU0ybwOnuD8M0kUqxUCeGc6/bKT996a+DpmoxdxxQ
 AJvIdG4PlvIMFvd9koit5gvnmTDJWxeWMvKfrtcfZ4I3qyKXr0LiVp+jHW3tesOUY1NYfSAiPWU
 bxgcfOs17NO+h3RsWL4qWZP50W7S6rPoqBQ76F/QGkPvKZwCB5mR55fxlk8thDbrhK/falQkod2
 VS+CIIAH+9ScYb/UD3dNU83s0zx8+X9yJn5VC4TQsxOWZWcBOlqL27f/8CPRVJPGr7TEse1yLji
 2nVjblfOQZkfkoo6QA+7fdejbvvN9RwCXkABzmjTjMJQZoBT6pzgCycmFl14JhxZKspigNQWy8Y
 RdKbA4VYobmH9NSc0BQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0NCBTYWx0ZWRfX2AORSw/ZVGHr
 Sbr+U9O7Av7GdNuCzfnVFD0850YS7EXjMgxoNm0Ap3EurjF9asq1MnkjnQ5Aw0yAD29vNqBpUwv
 5Jd4K1hQpnEWMof0dx4esd0X4l811Ys=
X-Proofpoint-ORIG-GUID: rBk4u2BQVdxcOI-v2r6-wRlV-s8naRPe
X-Proofpoint-GUID: rBk4u2BQVdxcOI-v2r6-wRlV-s8naRPe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090144


On Mon, 07 Sep 2026 17:51:29 +0530, Wei Deng wrote:
> The PCI parent OF node check in pwrseq_pcie_m2_notify() and
> pwrseq_pcie_m2_create_serdev() only looks at the immediate parent of the
> PCI endpoint device. This fails when a PCIe switch inserts one or more
> intermediate bridges between the root port and the endpoint.
> 
> For example, on lemans-evk with IFP Mezzanine board, the Toshiba TC9562
> PCIe switch creates two bridge devices (upstream and downstream ports)
> without OF nodes, so the WCN6855 BT device appears at depth 3 and its
> immediate parent has of_node=NULL.
> 
> [...]

Applied, thanks!

[1/1] power: sequencing: pwrseq-pcie-m2: Support PCIe switch topologies
      https://git.kernel.org/brgl/c/935ecc5c86c5ae2693b2fbff83fc1bd086a9c915

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
