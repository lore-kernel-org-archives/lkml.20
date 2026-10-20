Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500565;
	b=A/ond4WeIhbdx5V78bc+je0CGCE7QNEpGHwdB/4qkzCRDN/OLB9K+HivuF2wovRX5W1F
	 zq78x8+p97luK8FiqgDaz+dRjBmERN0eqP/tuqdew8MlH9heEoBTprgR1jQmx3c7KwtHM
	 aBCmrVQeyza5vk3k7PlX1/ZZC7KSOeqvoqjZpjM82Y1D9IX0eoM/qruB0PmSEybYuiek5
	 cMvt6S/q9ZebVl1QsRKm86Ib+M/laQTddvK3D/W3g4/fdZbXqxr3RfElj0pG73XmqTZRh
	 nYKIielNldRu+51C1juqXOgzz0efItG6AAzHubn2N8l288H7GG18Sm+IThPRYaz165A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500565;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=H7iI6Ga8fhdCz5hq4p7ooE7r+TKpBATYe72xhgVL5z0=;
	b=iEmAUslvYlt6FJa+lpa+jLO94kMN+ceTbQDcNTWa/CHcX3rSaOuK49lpcyzybZLIYLnM
	 C8irfE5QjxsiQOE5pGKBpTZeaIWj9+pMLHEzoF/VY2EuKZ4y3dMziGfyHdgmAfCqbnl6y
	 Lm8EJu+IWgMR3EETs4XH++2goIaLaUmOPkJOQa4/WUVuJv7j97tHxrUhccpFeCpfUHliM
	 u+uqQCzC7F9oLBbKpo/loqiLtzY5SwuPsCor+EdIGfqCTPO2yW8QL7m91/HNl3X2j/r2d
	 fo8v2QLyHWZRLFT03hm3vRAGrCV3EzmuCgSy1jPaUK47rZbXeCBvrFMt+2sNGmo0OUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QkHw0pZh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bbuO0Jp0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610EB606A333
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 610EB606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QkHw0pZh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bbuO0Jp0
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KCIcvG2187241
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H7iI6Ga8fhdCz5hq4p7ooE7r+TKpBATYe72xhgVL5z0=; b=QkHw0pZhkxx5IXtP
	pr4T6IknbQrlmaVytILf2nqc5vtbp5kISlPm7g21GXv/ygAEu2hk2D1Sa+HYnzDL
	hkz/oqdr4iCOdwUdBZTK/HypxCw4Y6B+569OyazuQ5eOCbL3u1FT7vBsx9z9YPWL
	KgzGFOKYZvH98na9CAPYJCXcRclAwpiLPg9ITRQR+knW0Wmef7L1q7vZ6bhOmHDT
	0y7BUnHDm9fI9iMTmRZG13NgQwFX/dk7M9mN8LuRdGpgL46iTyStdYuTNzRvok+B
	3twKc/Z/cqNalE+m7zPCB8Aa3ciGii+ilyVDxTRr5kro1V2D8yt3TxmyEjpWqoRJ
	to78UA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pjh5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:49:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f33438950so834118585a.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792500564; x=1793105364; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H7iI6Ga8fhdCz5hq4p7ooE7r+TKpBATYe72xhgVL5z0=;
        b=bbuO0Jp0tJK79ZGGTk+2JlenUX7f+xQAQZIVTuWHQkDvIiLKdYskqjzJW/Rii3yP5k
         bS0jsKWSraZAV8aSSkdMK0mHSBAt3znrDfFvAUUh++teYBmsgMD72peA7HqVI+6TGXjK
         MzKOoYSMoFaLUAK8XORTg0QNsIaKky7A0+4iHJe/Eu54KSTnetIE0sV0V8oULTsjeXUQ
         cDmNBzJnMPMwyRr4C31caNMJmG81PMdzkwEqqGL0CF0vJ5oSP+/pusWUSPlGO35S0Y+9
         eFZC+7dH/ElslKrPGIW9Hah8K3r7qbeNcdLsKYBTJ9gHUTpH+wbR3zMWpZJGP88JwGkr
         0sgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500564; x=1793105364;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H7iI6Ga8fhdCz5hq4p7ooE7r+TKpBATYe72xhgVL5z0=;
        b=JI0SdL4JG5bH3X28DtRCFibKCBcBq7hDMNE97e2MWvZj0gbuC5PRnebPEw9601AJS7
         frZvxEIO4CnmYrjXfFjBZjfRaXeq57/Gy4h5a247bbi3s6WCYSbE0PFt9vCHpwfGlitg
         vwPb7GFIiuPcPF42rkTpMD3Q6uXRM0bvnov5njQGIh4sXWKoikiu7yGhpV+nq6BHSfIa
         MItv/mA8ARE5JT9bnq5DB8Ay/4BjGxOqup6JYutmNPavcFll1+5eKbHAKrMN7okg8Rzc
         s5BBcXUKI0Hx204gxyELSYTjVBKa206RUU+TpToPlfL8CYmo2MsA/PQUo4BcH/VHMYnB
         8WKA==
X-Forwarded-Encrypted: i=1; AKwUvByMlKnCzH09PLLk35zs3X5/D+LRQEc/gKsC3HPgKk3ZIiHK16I9HyP63dMbhaf3Iu9Gk5oQqVz0kLjD6b0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8FmdIf/BppmzmeKBB1CODUeonlMWl+vndhJ54Ld7sqA3UYUcZ
	X8T8Zb/W1bojCsQvRusT1bxoI/BzfB9L7L24TomOUsVNq7IotG4+BkX/UAL99DwvWd4mZ5VRgb4
	3TTdXZdM4u3027/so5BDhMidwd07b/ZCX1M5B+i93+Yjp0Rp0Ox0z0ZdJMLadToE5uyKzFV/It1
	c=
X-Gm-Gg: AYBFou2UvCtPKw7imcrN/KCSeh+LdW7Tm4VASot3rFM2Nc2VKD16bCTggnTDkFjGGkq
	uEo9EHA0wfGxLoQoIyY1L+TPd11voQvYTe5/nzXLN9JX9OBsnq7Z1C2gZYY0u8qAQMjj6L2RKre
	sMEAW410S7iCi5joldAXbz4QEmRIINmiWI3V4RmeJyy0rv2z0orFL1mS0fhPIRta++Sz/+JFWST
	aHmr9jL9HE4r9F5joE5XVJ26hXH0fm3gTaMaHwlGOwEH/1C59AyjajPqLjqnXCAR7F7q3jL4DPY
	6nz7aSISzUffgVjePhFgKB8Xl4KcgXVVUbVLD6B5DRwKxIRGOE3WMouCOIJ3ClqaWzZbmxv1FRA
	Zs1y5T2SrfyplLf4xFooSRKnOpcs=
X-Received: by 2002:a05:620a:2948:b0:93b:d7a0:d9e4 with SMTP id af79cd13be357-93f29dc566dmr1638627185a.62.1792500563793;
        Tue, 20 Oct 2026 05:49:23 -0700 (PDT)
X-Received: by 2002:a05:620a:2948:b0:93b:d7a0:d9e4 with SMTP id af79cd13be357-93f29dc566dmr1638623985a.62.1792500563242;
        Tue, 20 Oct 2026 05:49:23 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d820714sm5839957f8f.35.2026.10.20.05.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:49:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: brgl@kernel.org, linusw@kernel.org, Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: cdev: remove redundant direction check in linehandle set values
Date: Tue, 20 Oct 2026 14:49:20 +0200
Message-ID: <179250055867.31470.13231144086896623317.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020080646.45985-1-warthog618@gmail.com>
References: <20261020080646.45985-1-warthog618@gmail.com>
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
X-Authority-Analysis: v=2.4 cv=a7WlZkSF c=1 sm=1 tr=0 ts=6ad76354 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=fYxsPc73JLq1812L9qIA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: JKxGL_lVwbz92uX4T5O1LA00TrTjMcUE
X-Proofpoint-GUID: JKxGL_lVwbz92uX4T5O1LA00TrTjMcUE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MCBTYWx0ZWRfX4Ggsv+a79zj5
 gCKSBLWdLAj6YQOWowmUCOPl6QRVJlpPlHS8VXS9UqgW2TCLVObAcd4oeet38//hS5dqrEWQBQO
 g+ZPM5+pSJLFlO+qHOq03gUdqOWw3BmnpJyHTFH2SPq2DumBPr5Mnp0/v+OMINK9spno+8xHSTA
 0isEAcDF2JV9HHpoDvQIxmdQERb0934ZW1FWJcaflUv3R7ihTv+Ww26z6W+2Tw9a/XYO4xtIDfH
 hZazLLVdT8O7k8wn7etPdJvL45bW55XIKegtqG6JlIKdJUmV0DJJ2LN7oxPZHczuDZwsL5kWnNI
 BOW8gAdLCAdTiQdxqwIFOoCc43dFSbqi4XMVXoipQq2j79ErZEYItCaN0/NidyNqJdkpJBLsNrC
 groHViAWUn6XgQkGUUmOYl46O2h98zoXtDTcoXW5DYhyNegoHVkZcr+avJOX7CjZtfGKCKiZvtm
 OmvkyoUqgRDewwP9bQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MCBTYWx0ZWRfX1jOrKeN4t+Sy
 1jzlc9usPZRbeqZ5cMyRlcAavVlrMBdtOF1bRoG2+cCZ64lF3B0dHwmAjdBunFF1NzxKtBM6gAX
 HOEfp4N+KkZVm6VBECILo9IBkmiNpNQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200050


On Tue, 20 Oct 2026 16:06:46 +0800, Kent Gibson wrote:
> Since commit 92ac7de3175e ("gpiolib: don't allow setting values on input
> lines"), direction checking is performed by gpiolib core code.
> As part of that patch, the now redundant check was removed from uAPI v2
> linereq_set_values(), but the corresponding check in uAPI v1 linehandle
> set values was left. Remove it.
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: cdev: remove redundant direction check in linehandle set values
      https://git.kernel.org/brgl/c/c890f6755369247ecf3c27199ca3c3f4b007fc1d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
