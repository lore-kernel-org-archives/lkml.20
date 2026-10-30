Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793378243;
	b=XJ34K2cziuz2uBOj9pYj8rgGgRb5ZOCvYDnWgdQkeLYdNJd7++1lmsihiYM1M2uJ8H/I
	 vJiVV4wMxZ5VDn1WRJOCbgS1HfZiezYNLNgGyvvsFLdc2b1pu++aJTVqHD2bz68ZYwG8O
	 r9nmU9ZEufCO5Wm+gJDtlLiVVja2RYk6p/Bv+7+xP0RB3v/I8lxS2bDKaG1hEsikpm3nX
	 xRRzTqZikm7R0zw8nhYggmbiDOUG2uKxPzHFI0eg9bjipim7VgYVmMfBi3SjkKKIiQBk8
	 Er3erobaLQ2iN64san30erXzmPFRYFjB5vkJeOsmO0yHhEaUf9MGToTgTSfI9gLqzSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378243;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GdDJn8/yPENzlbSKGbhxLdOCcVj9F9rnm9o38JMn230=;
	b=fSN/1XXTf+OjyUQabBCOVq4ye7KoM2kehVtYMy70mylXmJypp0yrMpu435F3oaZEyDF0
	 EP1Nk2/hpUUE930ztsmH/noyK+35M2espY+RXnEuVA65as+0yG3yxp/lAoglE+WboRzHO
	 9ABcFqMYs9ZGa6VHIaFuubo+yVA/QMS5iFlgkZI5sY4JlRMQwsh2vMQ7YaBRnSAxj3cEM
	 Wbgaq8ctGOsjNcknzOtx/bTUHBbaFJhhZTSXja/7A7xUmfwR+5gUnyHTwovtsw9ovl7Nv
	 QfJ6QQVybDJSnmJrfY3l0oy/CG9FmNfj/qBQmupgyrwr+cO7ocpZsGvyosy8wYfrigA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RPlKECSu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="bgKx/ncV";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D75606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5D75606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RPlKECSu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bgKx/ncV
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERLeW2495322
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GdDJn8/yPENzlbSKGbhxLdOC
	cVj9F9rnm9o38JMn230=; b=RPlKECSu55BpkSCCITsv2RcSgXO8JJ8CpQsn0dta
	0d4f/IIe7RsF4Jw4LcyAvuNWRBF5EezYD/U/A3Wy+ox+hSy54551dfjrKzdL9zBP
	577lFSfDV5gphtz79AtUJCa+MqOH4+p8m4JplkbNPYqkguI5E6miFptznGwarrs3
	Qpre/W74Dkdu2E0SjQxisWBIPLS2oxNG1Zn2SGDDVUZ08D/s+PcSD/Uc3oQjQHzY
	UMR9IHifDJYAHFaYZUwSw0pGncby2vMiP2CQXyVhY9EtigzBpKRf9hLCOfc81IuY
	KhGj2QS4zUwUOUa8W4HyHPjtrEhsAbA85DyFSp5xWro+qA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p42sb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:37:21 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7bf08dc2fc8so180307137.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793378241; x=1793983041; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GdDJn8/yPENzlbSKGbhxLdOCcVj9F9rnm9o38JMn230=;
        b=bgKx/ncVy+d9XvznfswvfHEfjUfP7vSw7mYUvazgof3i19zkupIGl5262C3IesCK+V
         g8ezeltS/FX7J3hEgB8EUPS6V6yXgU0UT4DeApkGxiVgQBLjVViHUj+g/2aHCLr2SowC
         LxBnQfJgpcm0BVZjh3TV/f2fDPLiFJSzKrOb1YDvy5tIUOwh5wsyvgfnrJOCmIv8X6h5
         2+J7WDSNxBsjkKWAxyGkXycz+uA88eNwgLgJBnZ6G9G7oT6rkqthf2nVrosWimnTkG/X
         p8h3lsGVBs6XKcR6Oeeu584L3nBUMi2hI5KQsedOXSe9gtQaWjzUjWbFN1RwANEyUjUw
         E/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378241; x=1793983041;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GdDJn8/yPENzlbSKGbhxLdOCcVj9F9rnm9o38JMn230=;
        b=nYbSg0kH2lXACp2YUAfvNa5VFO5y43oNSw5pQduNPPnKAe37B6OjmogJV7tEv6u43w
         eS/5cvwvI6MVlCiic3PV2UhfcSRvB6d5xTOS0Gm8/9ZTMMjcFzi9U2FdrRo+vl4xX04r
         xgYAqm+aXSaGhYCXWg3YRuhfAPYTwvLdZ7W77dpGSp3gfBWhMnvpKDrRpmvnmuifILgd
         CzKVw5TzgAGZotffDYJrC4a9SoGns2DjRcDzteR3iG7JsO8UkLgtWYv3GWsCyWlfdaqA
         ac/HsNgifZdFnyhXwr7lfC66eDppzudKZdXtYFrK0hS4G0MF8l3mRAbeNHJMttGEgMPT
         3fJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvErAW+L23M+RUbWmivII6dQOzrVRY0xHRbO9rEzXksrtv6uEyAL7oSCoCfHGD8IT0y44PKTWdyE9zAFs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIofpAS5l3ldoptPWamVFSQQDSIkNkejmvyrI4jNBiYtgBnFdso
	7m7GXcIgjGAoaev1dCz1uZJbg3WQNwdAOR6yRodNuT0Rf3ZUq/OoVy1dDzBJOgWAk1JnkuM9pkb
	Y4jdvPtTPNY4Nq02Ge0TtXLryLadM7+3x7B1YUg9SOPrRpkMqKoXUHKDdRIrHCe4ttWs=
X-Gm-Gg: AYBFou3qLOfCgF7UWFXMYRwH1Bi9BT0+7e17/si+3QnUf07zoD+0syvvknxH6UTkdyp
	nHASfpBUARD/3J+ABj26yUbkc8sA1FEcrLhpIMTgYaurLQ8WCqrVgb4+s4BEoAVjw2il1vbUH/9
	Bihv764QnhiDHciVGnYHcm/VX+UxRHAdexojzOZcHuvhBF9a6N7BaBKKTY5HCkB20racgqrCe6r
	f+sC08BQbaOwYuA0lxIk4+C0NG2HgL2gkp8yfJDGKMb21QtGRGV32fUUWVRLmdrHDiyuB1s7N6i
	b/ed6p9VPfsqUteIjuM1lGOcxtr9U7j5Nt7xwjC40Uh6A52Jbpfv+/vZGIMdgT1yyU6UP9JpJam
	ISGHNnztAt1otRgag4RBUdUDOslSKS/0u7eK65zOcUiJteZi9hMSLXp1vLsaBq2sp
X-Received: by 2002:a05:6102:5494:b0:7cc:56a:58da with SMTP id ada2fe7eead31-7d072ca43d8mr1277916137.23.1793378240440;
        Fri, 30 Oct 2026 09:37:20 -0700 (PDT)
X-Received: by 2002:a05:6102:5494:b0:7cc:56a:58da with SMTP id ada2fe7eead31-7d072ca43d8mr1277904137.23.1793378239872;
        Fri, 30 Oct 2026 09:37:19 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba5dc2sm3957322f8f.54.2026.10.30.09.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:37:19 -0700 (PDT)
Date: Fri, 30 Oct 2026 18:37:18 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: vamshi gajjela <vamshigajjela@google.com>
Cc: sboyd@kernel.org, abelvesa@kernel.org, jwylder@google.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] spmi: core: Rename spmi.c to spmi-core.c
Message-ID: <kmxzieqtwbby2mzjo3s7yl4yt272ldylmvepurtsbu5jsxgfwx@zfco2h2tvvu2>
References: <20261030045947.3049598-1-vamshigajjela@google.com>
 <20261030045947.3049598-2-vamshigajjela@google.com>
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
In-Reply-To: <20261030045947.3049598-2-vamshigajjela@google.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2NiBTYWx0ZWRfX+ZKCyf1jACkW
 1Itxy/fPWnSlQClaubHtzeJ1w5pgDto6aCkOdGQx4DV99IfIeylSKLPGOA/LtttgA8oweX9Djfv
 qiazOZws45bqoHykjJ4m1vreW3aP4eD357x87KbFDPj6bgwmVfsIM7TSqoReGiOsk3XtKJlMbfK
 KLffTwYuvHzZH/i3AN/FzQ16KnxHmi/raSZ56Pd1TD52lAqDMK2qHS3V5FJRzAt3AkIQ+edIGoc
 9AUBCVmFenI5oESpLA4leI0qvknocUYC+eEkgxHl5rbxajhyH8gvzfL8ultiFDw0gIISnhqMVtd
 V6JXxAWb5ZqSwSYlWffBVJhqM25aHKby2x9YzGA7C91+ZTtvNQuxcg00Andta920dpsEC2wiabX
 nnypFZjOFvaDXmahbJU9OxXnKOMsWHpGZujtKTYn96HPKCrErcmZoFFf+GDNQWyk/GwN8aJtZ+S
 BtmcQhR+ot9WrP3d5xA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2NiBTYWx0ZWRfXxwF4cuLH4yFs
 mwMsYhi+jyATftrGV+ewBgFzYciB7y0+1BrXGRPNy0r+tdmHxAcH3Ecwf+T+XXeGF8bBeJgRJ2T
 Z6kU0r58qvrq5Jnp9C+JxyI5e/7i0rU=
X-Proofpoint-ORIG-GUID: nzqflLFgQLCuEXvJdVMR1vTC4MXtU3PB
X-Proofpoint-GUID: nzqflLFgQLCuEXvJdVMR1vTC4MXtU3PB
X-Authority-Analysis: v=2.4 cv=TL3Q2Fla c=1 sm=1 tr=0 ts=6ae4c7c1 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=1XWaLZrsAAAA:8 a=EUspDBNiAAAA:8 a=CfHLt7jyb1YQYF4RJS8A:9 a=CjuIK1q_8ugA:10
 a=QYH75iMubAgA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300066

On 26-10-30 10:29:46, vamshi gajjela wrote:
> From: Vamshi Gajjela <vamshigajjela@google.com>
> 
> Rename drivers/spmi/spmi.c to spmi-core.c and build it into the
> composite spmi.o object to allow linking multiple files into the
> spmi core module.
> 
> Signed-off-by: Vamshi Gajjela <vamshigajjela@google.com>

Subject prefix for SPMI core is just "spmi:", please drop the "core:".

I should've spotted that earlier. Sorry.

With that fixed:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
