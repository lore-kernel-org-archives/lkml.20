Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD6C47F788
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789041331; cv=pass; b=JtJddVjXGjDiV0VrsFcAv6A+CQoWmNBmjE1kMbv6NIDjeujzPYlfUxYbLGetEVOcFk0G4JxuUyKdqu8Qr9KzN2ggMDBQ2dSBD9PnLVUeCVCZz9M0NXGrFRe02BUSc6S3qlTCplylfyOjsfmJEdEA5tl7BbkEr8ZzhYcBnJKp9jI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789041331; c=relaxed/simple;
	bh=S0FLkqwloJK80/wATJskq/ItQstxHs/9zbYL1VDZJe8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NlPv20XHkEKyOdLw4vwnjz22XqPhiN+/eiew9zuZT2ss2e0d7CsDUQ9F/zi7D/97t7EnsbpFPissQ+hbcqXimrw39Qr4oh1WZd2fJXRmqWFe4IyfihDgx98ttB9YwicRIgtt1hGgLIHAgawdOJ8tx3iUpl5e8W9sKJF/ALxeeew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XHPr1df3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V/SX4Qwi; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XHPr1df3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V/SX4Qwi"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8q0Jh427121
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:55:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S0FLkqwloJK80/wATJskq/ItQstxHs/9zbYL1VDZJe8=; b=XHPr1df32s7zoAET
	uTIuamvAgLFXlMPACiKiWZ//xbW0A6kjU/VhM2q6C3c7D6oBVZV2f6aXaCV9lAH6
	5/tSAJ8qOJnm0geGCARPJK8obnAULfLziPc6Z3l7AQrN4onfnVQj9w67MRmVg6Ya
	mge8GSdHsg5mmhf790rp+w14O3dKrUm/hvXIXUfslxlt2bCKNmkdwWVSN+sEQR/q
	KZ6+WnGJUrBcdOo8ldDS9ya/hANMJxBynTBClkoQ0eLSjk6DbC2bYH+ke9WQd0hS
	TadS8ibjvJiSQII1H4szEQl0MtOrpaSAy39Vim+4oA4kZfrgK7zYMhNXoboITier
	abgzEg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyd3mug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:55:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6fb956002so102895125ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:55:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789041327; cv=none;
        d=google.com; s=arc-20260327;
        b=IyeCcys/Apxl4izDE4FsF4zgR2dqJdbya6EgbcLksH7sgbOBmx8C6dT+XrrZXMm5J5
         oWl2E1wxkFI27V0y6n76STt/v49FuldeZx6eforUnVCvygqQKJ+KkEj3Og+6ZYEOr3SG
         r+HjHPfT6UN+r+R5jzfOg8og6YMed+jatrUz682VkHrgQMVcDhejAbuGwGH0ub522aIa
         VQZYfwu8PrQzOnp9omx5sF/VPiRXcjadE9D0h9tXblYNcKEvCfqb/UEdlhmUCzPFjKCy
         cO7wZ3nQk6EiG6CZhhn2r5eDZ6/avARktuXCiK+zdnuo9HaoppDk3udS+0cj/HO+8WOc
         oqtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S0FLkqwloJK80/wATJskq/ItQstxHs/9zbYL1VDZJe8=;
        fh=Kv0hlX6F87jc0E9tf+3ai/khicXRx5hUjrBQVz2XmR8=;
        b=G84L277mY82X5c/8iEHTywPbMdWse9+EZ3MyWzqQ2xBsrZLJ+bQcuLlWG7M7uPPly9
         TCy5jEdojgE7R3qX5/yD69ETy7z1/ptly8AePXobSQsUCJw88Jh5BSMIdhOwfo4kEmRj
         XHK/KfnggDe7yTTG5qHujLWkklqxJBGP1/32vGL99jbCnB1n/G8sQKemKNTiyfJs2P6H
         37FEXEoN1N2sWTccojgRdQAP0Hmn5PauGkJnffHybe3e6uLS83r8SB1TZIDUMbtnMF6V
         Q9pNp4kYkBRwppjOs8+DV4FQvs/69Ozp7FEOEYmsBfTQpX/HcT/3ehJy2KqTMNzEk9QD
         Lrxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789041327; x=1789646127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S0FLkqwloJK80/wATJskq/ItQstxHs/9zbYL1VDZJe8=;
        b=V/SX4QwiKMYIJu8kShQShDZuHOLEghAlBJ86uwtp2ossIGFAWbrS0yZPJzSp0CDlU5
         O5RSXDoD/pftOWPThMEBu7KfXpkvehAdVsN1bAttTGtCvMla/oo7ZVR7cgjYtL5jWMqi
         Br7Qts8pCDn4LBzyoqMtGioKJIje2FxRmP7bEMNsvpXvnG+g5p7ggjiz0B0sendJNjmj
         QLo/riGNlAlzYknALuyFZHDbg+gOxP7MdBn4LqNNRxNLfxFNy+SCGKnF+OAVQD4uEJZG
         q3sFSXfd5K2oQRqeOhUW8VyEyEbbvAf8EBXecmXQJvwB8QcNjQbDNb8FCq2FpK//GVT+
         Xiag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789041327; x=1789646127;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S0FLkqwloJK80/wATJskq/ItQstxHs/9zbYL1VDZJe8=;
        b=jMwFBbV2b13M3XmfRs9GII1RZc3O96iCAC+yk3pxEsjehD056KOBocGh6CKzhXZO8J
         tgsF7U4ZTKEAsZnW0ysE7pwqB8VW0xY9USXNnUC3ACP7jlBKkndqhcqY3vCwj43xfNAf
         bOC5oi4Qtz5/P0J/JT8SSKgfESnKgJ5W886MUYOXo8ldZNtMr4nenWf3RYe+0r/NWNfj
         /mta9ODhxVbp9QIjhpj9QosYxGzeq+hi1sy997UkMV0VF8vqR4a3HIHFAGl6J+7+VfU/
         fbcVRjrqRLGOdqJOOJnisgMw8wgTiW9LZ/VsqYMVao5c1BuAQOYRJhxNSJLrGG6mBUQh
         JwYQ==
X-Forwarded-Encrypted: i=1; AKwUvBywubV1ypiuxBnhVcAw8y71k9fB7aKpwPFNVZRIvGrjdhzZ16VyRk14o7m0h0jMLNLgZjZGRxPYj+m2gjA=@vger.kernel.org
X-Gm-Message-State: AFuF++nb2rc6kwppv5wMrSe4n+0Zq4B4OI7BDnptkseNO3THv/c1X0fh
	q7AGSYZT39w6Ib+fchrLw7oD+BT1qXPFjtGb832C9LAutjPKzcSrX9e3XHiSFIsC23t7cAkOSlO
	G43tYxDIQPIhy6u5rNYp4N/T/juTKqQHmM7JhSVwt5E6CEzboq6wlCjgj/Qa+6lItYefF0KXMzK
	l7cFJ0iCVnZQ+eF39wRQP+9PiSUNUtYUrn1kSOrik4e8PlISDfNA==
X-Gm-Gg: AYBFou1aXLNLc+943a8q7lNYPq7hFtqmZis5pSE088oG0R01NNH4qr4d9vgz55TXsUq
	BPix2Nbx8NkgJjryZ64mmayfhjptRklsm4dMmhoH1kht/2iwtSDDpCcok8WnN8Ee/TnCfyaFDVZ
	2U40EJ3c4BPou3BbF56M6pJuSQIrM2rsbgL/jkJSryQCk+IEVthnAKiIhaCA==
X-Received: by 2002:a17:90b:258d:b0:396:4c63:7193 with SMTP id 98e67ed59e1d1-39b261323e0mr66322492a91.11.1789041327082;
        Thu, 10 Sep 2026 04:55:27 -0700 (PDT)
X-Received: by 2002:a17:90b:258d:b0:396:4c63:7193 with SMTP id
 98e67ed59e1d1-39b261323e0mr66322419a91.11.1789041326634; Thu, 10 Sep 2026
 04:55:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826095217.2885229-1-neeraj.soni@oss.qualcomm.com>
In-Reply-To: <20260826095217.2885229-1-neeraj.soni@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 13:55:15 +0200
X-Gm-Features: AcwNN1X17Z3L39bGH3N9FTd6tOAl9kGgw4CpwVGwNcjsk3O551oqwHOl_exeF0g
Message-ID: <CAPx+jO8hLqgW9aXDcAE2tsWx=tWoxKSJzvs-KQme5UPo4v9kPw@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] mmc: Avoid reprogram all keys to Inline Crypto
 Engine for MMC runtime suspend resume
To: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: ebiggers@kernel.org, ulf.hansson@linaro.org, adrian.hunter@intel.com,
        quic_dmukhopa@quicinc.com, quic_rampraka@quicinc.com,
        quic_nitirawa@quicinc.com, quic_sachgupt@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_gaurkash@quicinc.com,
        quic_sartgarg@quicinc.com, ram.gupta@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: FATd4KZwhOrI2n7jJVEesfOU_E5U1Mr3
X-Authority-Analysis: v=2.4 cv=ef+o7LEH c=1 sm=1 tr=0 ts=6aa29ab0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=f4iapASk6-FZxEQnkJAA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: FATd4KZwhOrI2n7jJVEesfOU_E5U1Mr3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE0MCBTYWx0ZWRfX45VroSjRhfIJ
 pf+HNprOAdfjWX26czaonKkknfrnhgN98SUNmPuWZPf3o+uO3na51N6six8LBfk+KrnMuoSJgL3
 cnnsOZNkEtLwlulyxpbx4a+uQ/17xTA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE0MCBTYWx0ZWRfX/5CONUnInOgf
 WkuhCi787qUKyVoX5/W/zEFsGIhEJre2FW6hooRrBK033ngRg6X8f+65fsS4MiYLoyG7/1oPWri
 xyPUGTQy6FH4PPUyNnw6a/5sZINvcE8sEvob6dBjIGRc2XII5IsCERFOcjSnpdE/gQHjEBKOBuU
 4+bA5xoNEGqQgrxHzR6XyC60uwxiCbO6N6Ld/NgWnteFjDEMBL16mlS/4CNRZV9DXQWzNczUZpt
 ck8C4CC+IsI9M7z6jdxTygZnPd5XuQOltm0QR1348wKcvtV1ZAafltP0wH8ulArnuIHm3lIWIPS
 /tEML9hkCDWl+4jRvbrfV1a4ouhATdcbSsyaFAEYxvpHipEy5fOiBMeYxbTfstXwxsmWJit26DV
 5McO1tQc5xwINylFYGCUcLDGPG+xHMYSb18CZnLnmwvItWNIbpGuGASznLL8IHVj2FeChYUmiE5
 MvcPnPRgeTtovHf3xSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100140

On Wed, Aug 26, 2026 at 11:52=E2=80=AFAM Neeraj Soni
<neeraj.soni@oss.qualcomm.com> wrote:
>
> Crypto reprogram all keys is called for each MMC runtime suspend/resume i=
n
> current upstream design. If this is implemented as a non-interruptible
> call to TEE for security, the cpu core is blocked for execution while thi=
s
> call executes although the crypto engine already has the keys.
> For example, glitches in audio/video streaming applications have been
> observed due to this.
>
> Fix this by allowing host driver to control when to re-program the
> crypto keys.
>
> ---
> Changes in v8:
> - Update the commit message for [PATCH 2/2] to clarify the expected key
> reprogramming behavior following hibernation image creation failures,
> suspend-to-RAM transitions and CQE recovery events.

[...]

The v8 series applied for next, thanks!

Kind regards
Uffe
