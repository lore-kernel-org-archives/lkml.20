Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792741727;
	b=1asXulQUvd55OQZNLCu73Nd/ylBgr99erwmBfKUDgN3ILh4Lz2hEPR2/18HBG41bL1Xx
	 eL3fIvh7Xg4ET/15MT2MJxyNAX4j+Fa4dhIYqGXhqg9oPNeyy8VyG+0tYaYk+bFLID7Wh
	 ig/doKwQxzUdDcfsgOUWovaM4lyc0FyfyTtEhHLhp7rim/xSebVQ2AdvMXIyqLQAeXTYM
	 U20jF36J4Q4N7sMcALFwl68MDVEfIwdX71Zk9+aHFjHN63m/UAM5nuo1RcZsbo3XURDxd
	 oFKJfcWfL+l+toQ0aRfsyunx0LhmeR6JuFMsgyhRk0aJZp33J2FAENTkCEzxA6A6n2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792741727;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fLv/0ymzeMVr3+DKh8bjeYNHCYO4plYAT47kOv5TlFQ=;
	b=Vhph1TW/3bfks8sDqYJfO0LS8CxGqLqB/LKjy1GyoApe7EI3QxU7JPmkUZTEjzThdyJy
	 4ue/xvhPCvOdgb+dLCPLBaELoTLeWV/kXrKq2VmBHYTjXqlRdw1gKtCmrQmQWCjdaUWl0
	 zgIqAC+6Yo/PRWnd1ziMMs+58FhaU+xBfaOJa+pHr+44E0JEN7U0zXotrEa0gSRb+t8OS
	 2lWHi/0JyCmdjAA8sbW1c1ueG2wO6zKu1MRXJ3rx9Ja4egyx3psvB5QGGRnmZPelE7072
	 oS0BRad/FVrkqKUH/SqjMDdLWr7vqouKUjctYROtvdQy6FlFMcJ7bw7Oo2nwwyuScrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IMlpTlFv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YV8B6wTU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93619606A320
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93619606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IMlpTlFv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YV8B6wTU
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FCXq2092835
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fLv/0ymzeMVr3+DKh8bjeYNHCYO4plYAT47kOv5TlFQ=; b=IMlpTlFvxoBxAxXm
	p7jT6BKYAdbg/r3GC6dbD4v9nGNAARHZ2+Tx1TR5A3OIrPiwtRJGLAJl2Oh7Quka
	h6k4U32a+LB1xV7itulAT83M8UsJXelcubR+kmVW2F8WQk67a11j1g3IuVyVd46J
	8Mlnas7hK4G3tMjIR/b4QeDGlNtKpKcmd8jfPT5o6eqfVhFAmLLj1KRI3EphAR9Q
	pkeWbVRA+jgPEHIe/yVFhj8BHzPt6jt8RVaHA57Smkwu9LnZ+uIieUxnOS5YipMl
	9xPxbDnfDwLdcPxkVavuML/GYIlTa2X7TVssTSUOypEVqpjlcnNHlwrQwKTK0zxd
	RvCnAQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hftyg9s50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:48:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f568dee56so127064385a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792741725; x=1793346525; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fLv/0ymzeMVr3+DKh8bjeYNHCYO4plYAT47kOv5TlFQ=;
        b=YV8B6wTUT4AGdtm5VAQ8KJgYQY7a1Kwo/X9ZGYYZES2D2bELSpEJOkMDBzmH3Vw50G
         LNTtnUga1KbDfRViBAPNHFbS1KDKCcwrn4vmHrVLZveDQYKKy5BB9XA3r1IqouD41wXg
         yZ2bmucqqbWhC50pvYYX5og3pcn0SZcrWIacM6UoXPRGGqvMivdEXd2hwhDj/O4q49x8
         wxvLRlgodiPekVJ6kF01GtdC+7M9yIv8sXfiveYALHmbH9SBFga5kNy6Jd0ZuBr5HHWu
         TLYRc5sQlsfqetbjHxbVBMctHzk6DKVj0ZbAwpK8mwaui7aMomDwNJpLMypQKtSHz2B8
         cg8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792741725; x=1793346525;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fLv/0ymzeMVr3+DKh8bjeYNHCYO4plYAT47kOv5TlFQ=;
        b=v7myirLN4E6Adrq3Ut8KgFQpBPHyTXgi/5lF7VeiZHWO4jf1uhUFJVmP8sWhXXCQUp
         b08baPj8FLkAfzWZNhHqrIMtS3svCXiXDjA1sWGnE99rs8SFNbFP1fqh5s1OksSZxWXW
         2tOSqOQnIwB0EHo0GLAKk5NZdp9N1I85SudTVoGotu8g0rGnKYmiX3WbWX2KoVhBod+e
         ePSNvx2T/YvWEz+ViUvUfjw1FKRebwKaxkx62qjogKM8FVFdUMMSEWi1QTcBDh4stZ9Q
         hOmBOuapRrlQHsKDEZKpTalrExvRK7GZjoLVDWUXZNkz9D0pFPq1CrLm8Umdhl8kadpR
         ezpQ==
X-Forwarded-Encrypted: i=1; AKwUvByp9Ov2yMI1kfZOw6LjC07CMRxksdge9IhxNZCGSCuYO3TSI1cTDkOjwlJq+5XQqBqRjsDH/Vzr2J424AU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLvrWMqh2TWERTzyNoFEM2D+SUIImKXjh28tzjnIgMfX1wW2+N
	CjY0U2d8dng1Woqk5pbocA+Fvituskn89TFoMo3BKsYM+O7gXSLS5pp8+J2y3gqFt5YjUXESd8m
	2Q/BXbWGqB0A2GZEVS+AkzEuVcxuJIBACvKtX8ZGZJyKSrb0s/O+G+HKppXfIwN9VeJY=
X-Gm-Gg: AYBFou1wHo6x9euzQ+HL6WENxmp8X4xrArHTrUjcX5Ne+f5Hk0orTwgmTAGT44wTKml
	qaGVF4PF+DNvXh8NuHTChardBr7pRyqi0NISfLv3Zmg1KmuoUAvvTDZSPmVGUQxBRRk3P7arSvP
	EnO4ySR91iseiA0IW2layK062wzL2ol1ONm0ahYazEhYEJbaBIEUHjkSc0GVcMvrGlcaq5v+9TK
	CHmiBbqdGZrNh5dft7gBD3+y506+GJjF80oRiTSp3HflpT5wkG3Do0Z8y72LJWv3w8XXeweceXo
	/BVnRDEUQG7Xh6zad/S/bYDwGf6Q2cnyQnC6UkKTPVJqLPSdl1bl6JdRXcrnQ8PZ/1BqXqjKZ4s
	R25tAVwWkaSm48/RUj5BI6f++EPs=
X-Received: by 2002:a05:620a:7102:b0:93e:f9ba:690f with SMTP id af79cd13be357-93f6fa01641mr287675685a.73.1792741724643;
        Fri, 23 Oct 2026 00:48:44 -0700 (PDT)
X-Received: by 2002:a05:620a:7102:b0:93e:f9ba:690f with SMTP id af79cd13be357-93f6fa01641mr287674585a.73.1792741724211;
        Fri, 23 Oct 2026 00:48:44 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38025c67sm3116633f8f.20.2026.10.23.00.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:48:43 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] gpiolib: don't report -ENOMEM for a requested line without a label
Date: Fri, 23 Oct 2026 09:48:41 +0200
Message-ID: <179274171913.5027.9030259966354597736.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022083343.3905973-3-aambrozewicz@nvidia.com>
References: <20261022083343.3905973-3-aambrozewicz@nvidia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cZpHPXDM c=1 sm=1 tr=0 ts=6adb115d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7ofs3B3pnvE7NeEcutwA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMCBTYWx0ZWRfX1JFPvD4hubAN
 m9T49UWWqo/+VY4ws+72uDLleW0qGhZkHt1X/NNylDE7ORi9mlD0bvDsZ20c5cKycI0WbVG9Cj7
 g5zVGN8Tc1d1Fs+R1Hjtm5mFM2DaZ0M=
X-Proofpoint-GUID: hyIh2gsQTAb0sasgHhk3SOsTbAmb9MX2
X-Proofpoint-ORIG-GUID: hyIh2gsQTAb0sasgHhk3SOsTbAmb9MX2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMCBTYWx0ZWRfX7NtwB+XWrHVV
 4AMOkX/kWhkldYUjvXSlABBHCi2L//E5YxqfpdLHfy0gCrfqvfP4F5cbtDB0pKYTIJAtFF131DO
 zJWQ0qlsQYEv7AFX+eu+CuxLGKaRtfzs0XYOYxCHt9BuN2BrJ8sMi5AvrZSGzqdNe3FF/W2e3nF
 c52xUy9wDm/KDNYskkuzrrRK0g0D5Bb+r9orRRx2jZMwM5EqMYMhoHqGyVXtW7MVmGv4wiQA0Xa
 38mpPHYs1DIjdJPjjDovydn41V275QtPNhTXVodUHqugd3H3jgmMrGX0rb/Ky5GyPmvmQYZcBEG
 WwS0MFIV9YGxdY+RHiYcEszw/PmLsK/+yZ3O2mGTVMQlEM/qQs7zICgQCfR3BJ/X6NagY+hq8vU
 s9gMIZbkrcsbPXI7r/6tNHEiXQPXJ4MNCKNHyFkSTvyCCBe2h2sT/gHium+9pCZ1bgi3EU9w2Jp
 uXj8GDHhUtM7MAsPscg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230030


On Thu, 22 Oct 2026 11:33:44 +0300, Adrian Ambrozewicz wrote:
> gpiod_request_commit() sets GPIOD_FLAG_REQUESTED, calls ->request() and
> only then sets the label. A line in between has no label, so
> gpiochip_dup_line_label() passes NULL to kstrdup() and returns
> ERR_PTR(-ENOMEM), which for_each_hwgpio() then passes to kfree():
> 
>   BUG: unable to handle page fault for address: ffcc73074355ffc8
>   Call Trace:
>    gpio_sim_dbg_show
>    gpiolib_seq_show
>    seq_read_iter
> 
> [...]

Applied, thanks!

[1/1] gpiolib: don't report -ENOMEM for a requested line without a label
      https://git.kernel.org/brgl/c/dae739137441667d67fbfcc4d303a0ecc6618662

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
