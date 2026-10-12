Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E756A49B5CA
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818710; cv=none; b=DPvcthRoI/8mnkQ3OphRlYawK/vXUut9uLy9I9PFV9iJto1bYCl9OONmlDaQu1JfFibOfIVEFEV9c1oaFai6QrTZ+OPm1b2D4Fb3s/3wrVh0LiVDpyA2LnHA4akwN2tHOyMThvwgDLJCFmEj9tcxv5uxD26Q+bYjQrUryHlSsHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818710; c=relaxed/simple;
	bh=NIV9vhYhi+Bn4r9nXOWmPMXYzPFmJuXkh8mVvNNHbcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r6DRBpSBEjO8rnmXE8hj3W0+2VE6YBfK87b1y9CoK84hpI3M+OmaOXruUPf8F4j/hAk9etLm+o4+jNRUgHcuvtK8ZWIXxTdzNrOIQX1kmPHvRvukrri1ii+w3HszEGFpamNv9BHxq7zOXcOWmMaGkxeAuGMfyuRYY3+kuizWi9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NBHK/CFd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H66r6PfV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NBHK/CFd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H66r6PfV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC09Yn3292333
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NZe5apiwn/op4s13rCf0Ijf+H1F+RrDOUK2IOt7qJyU=; b=NBHK/CFd/ZrBFzWT
	aRJWhS0oEFo8PMHo//Ps1Vs36tFac1tmJGjQN7fgCwtol+OVmP+4/fx5B3BuPFQB
	EbOxccSkp5hFp62ycCh1v5hcteNRPmZR/JRMm1BL37vPh43jSmyTVvHehv3B6Ee5
	OApYBwUAK0nUyTRVLIppWCMuF2AfT6HkuoFvqkv2n87DmIvMPqxjIzyU9e/gWS0b
	Bp5972s/HfKn+OcWI64EQqZuxvJf/12K7b5hzDpBzf3BVk/bEfHDlq3xuL4U2Hzv
	Jv+bZz/GrkxjOB7xUJ/lLN/5PTgf+6HIUGeIHYwd2EAiKlvSqWuWHKbQ/cH4a6al
	WlZ4Lg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3j1pa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:25:06 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7c0e2566d30so38702137.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818705; x=1792423505; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NZe5apiwn/op4s13rCf0Ijf+H1F+RrDOUK2IOt7qJyU=;
        b=H66r6PfVzE2BVRL+0x6sgFSdPLzuO5B+3NHITiAlgXTRE52AHDkCfKnd11umdV+VkF
         8ITZDcoRXVcmO8Ag5QFu2pKzELQTOVcVxVZkTY2GQf8nfKI6/kIJn52EiC6jJcnnewTu
         nu+hWc1GaS04543CvQZnUJtGpXp8Sy5sptGRSdYbi6mlUPjL71ePyNwECgVYK/Eac8Zq
         gH2uFEWH5InnVDKh8y52MDi1UU59w6ebicMDC/F5N7PWrDcU/ntD8I/P0WTd+1wEnowg
         Tm2AJ457yjjnAaOeXDCnLFNrIhPdsi0j91bu9QKXPHKrECzkG1JGwQCeOaqbmEQLvipU
         HWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818705; x=1792423505;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NZe5apiwn/op4s13rCf0Ijf+H1F+RrDOUK2IOt7qJyU=;
        b=dj1VZdDmFOGhG6cvCuw0cfHhuZiHJ8c44kCG3WeYXI1F8Dmr2D+DekfZjAiZ7SVoHk
         yrahvrVuXVRrwz/2jQhuRY6fbOjn1FtZN/vqdUMWPaQUuj6bU5V0m0aL+q5zKtM/3TMI
         6UoRAV3wxgcDmEOAKpFyRMTrSY9klZqCLQvhflAaulL5lLMEelmVdSWxTt++ot9cQ4DU
         51frGUIaacENTEc3sRZbMKgf/qzZ7N8W1qEx+l0P/3faCZPUdUfxpfRqaE0yf/xL9KjG
         WJFzsMs/HT/c5g8C7Sn6CyLpdW034ri17oy9gnJpYbDmMRPBzbPoPT1Bsjf4a04hHPd2
         n3RQ==
X-Forwarded-Encrypted: i=1; AKwUvByeQUOieT0beoQ6W0rLljqrvY8qawzPCZpD9fJNEyMamlnscONx3VvcHTQMMJizZ7yeh+CrJDMu1o/XUVI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5rc3u4unyM7Y52Fe/ULiVrQeeyU6UqGZVdX0ZlKEsaJuZ75gs
	KOhSSuX5CjYyrRQSbIN3BfgUClRF65Rm3NNFPiqEZdKr1wPHT5baiP7gGzzIxhtb10kPPtX+RmY
	LhYybCOKHfmMKYFNyfdU9GpSVDR4Wk9jTg6YhX6TyVg1X8FsFDoZYtXHNnhEEdP27IOw=
X-Gm-Gg: AYBFou3SYVkpqAMdGduBbVbpx1Xro+242vDkNxYUJpRHLF3GSJArhKaXeTlpb+uHlG+
	+Z1JNcLeAtVWslkid9Ev4iAGhjvU2HrVDNCfiaHmhVhSWNgi63zHR/ZRPemq8HwPB451XXlyE+0
	QhWzm25MDBZei7aBkP3mcUd0/Wt7m32t0Y7jLDBy4fcYGWsrgpkomzGvMZbkr8bptoYpCqArl18
	uxKRVcfHKRhNYHZf3bDhAx7Y/KsT/YQHcACHzlUlJ3C1beJoxg+KmYJJkPrYCm1+nWnN5LA/n2S
	XCK5csPNTYBwQu622GrwgRrXlMtvAqVljvaW8olxA1CHsn08rkuerBoFvTZvoh/q3tbETXjzBMl
	IX9RDRrtLIcxB7ng3gIFBWQ==
X-Received: by 2002:a05:6122:a5c8:10b0:5c9:ac9f:b7f8 with SMTP id 71dfb90a1353d-5e91ef9f2b5mr1351487e0c.0.1791818705173;
        Mon, 12 Oct 2026 08:25:05 -0700 (PDT)
X-Received: by 2002:a05:6122:a5c8:10b0:5c9:ac9f:b7f8 with SMTP id 71dfb90a1353d-5e91ef9f2b5mr1351473e0c.0.1791818704381;
        Mon, 12 Oct 2026 08:25:04 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9766209sm479310166b.3.2026.10.12.08.25.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:25:03 -0700 (PDT)
Message-ID: <95de1721-4393-4afa-a973-6ed657a0b69a@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:25:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/38] arm: dts: qcom: ipq4018: Indent closing brace
 properly
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <0436be338751fbbf30d8d6baee9b0eb8ad8d9938.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0436be338751fbbf30d8d6baee9b0eb8ad8d9938.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXzkEGlYcG+6hc
 NtyO5mZS7/rmTNggLdEIAEXOV865UwqeTL5K7zExosgdnKLvrU8jk/Rx/S84NrC3zVBGJ3hCSAU
 KNfXLCtO3mM22I5pIX9CqQw2VFuJRCuP9QMsv43n2stF3kMQoQ+rKQtWKOVUZIPM1/7wF5RDIkN
 dGZHIj/WQc++4LQhB+MAgsa2b7/OrU3DBaLzn9OvoLaxC0NepmmHRH+IekvkhDApvey/2jn1dOF
 xZEgYuBc6FvZIEC5PJNwxoFfu71c+/PSmPTtS1IkvmOl9G+2MG8589jkyLTBOU0dSCatnvXTerQ
 8YdGNLE6HJWm4dIzDfjwu/i8LptggKloLfQz4VUPOM1Ib1nHrdf7K0iVmSF0jENtQct4KHeCPVe
 OvsmSXbppv8QebRK/JOhTQK/ADaa9P6qJztLQP6oIU+vnpLD5j3qeXFpI69SSBavIc/vwuuCjeS
 ZIxYdYXc1Zj29fOO3ag==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXyvKiHUvKytmr
 0nqn2VER8tqhFEEcy+qCzzLECNKkZaiTkzo6J+OLwUn8FobHQqklfZaKgi/KXzy7XUrrS39lQy+
 GMPs4g1cGMjjJfx0S2lNQS/N3sHfWQg=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6accfbd2 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=K5Q5qJNcHL0jdGHZGqYA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: sVMdX1ClbYVLx8YTojxF69eyeC4z1OTX
X-Proofpoint-GUID: sVMdX1ClbYVLx8YTojxF69eyeC4z1OTX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> Closing brace of a node definition should be indented like subnode
> name/reference. Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
