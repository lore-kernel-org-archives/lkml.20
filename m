Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794596939;
	b=dCBWP1Gg0241NNXUvPqWoGPlZEpFShm9vz25vMOY1nmsBOGv/KKtqzTsfCkO+kIMUAGz
	 G6cRGLXZojbszfzgXD5Qi80siTOn+kKwqx4UVkBooxAX7U7g5MBcayOfmh/2XRmyHrT0K
	 +iGhJUD31aTOT8dhwyy/tJGkzYw3pdEVBKy+vwHG6HQMqF4s5YjvzJvy5dYE/4ATBczSK
	 qul+nvKwW8jxGPMMFJ2ojS2bO6KLy3f1WAF8UPi50YQjEUZZazidc5Qxj9af96DfWLwdr
	 IvqtgxEm2sZovj0dbAuB/YFC/qK0cXbjxGrkEG/PYSyBhrOuEk5XSojOJAajFuvPAwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596939;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=wMGf9TKkw2dAolbYMMRxX3h85UEtf4o2yarI4oY4daU=;
	b=dJOH6lCtWzGkYg/RfEYkWOuitYcxOoJHorIIpQrLAXXaRhiFqB5cfiNthopBxcVqRs1R
	 pjq7Y7W/XoUvVNrqCaNilk1T0PWN6QTmJ1W3SYvsJWeovSv+UZnP9ce5/gJSddz2CkhJO
	 UG+l++a56TTZ392/klQWBTmF23UHl8+9nEq0Mb9aLxtSULCvMs/wlBGxvO7b0tR+pc4Oy
	 Qr4UBmh1JP7XsmZn07VmJQmPi1n+6uvK0tM/kUwS6DEM6hpt8YBx+BW+Ae9D2Y9dpMJBa
	 1jbBBF7rEhF4HYEPYLjgXsdWfDSK2wYNBtijFqWMfyHOm7/eZbFtTHEaJBnYi7hUB7A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=nOONlcMC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB65606A884
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BB65606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=nOONlcMC
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
	by m0089730.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6ADIwkrx893066
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:08:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=wMGf9TKkw2d
	AolbYMMRxX3h85UEtf4o2yarI4oY4daU=; b=nOONlcMC8i4eL5z9MdkEXEZlwOx
	Vrvx+jYuO0AU7xRzGRrS3LpEi73YXmUwnlC/dOM+wJ1ODaYOk7bl6zGXh9sfmJfw
	MKNO6Sg6FOBmO6fyVJijB2yweyStubRKYP+YC5sRD+08HFJSgTDbMn2V2e8elqHY
	cir6/wisuzYvGcarXU8Wim98GEnpbLytImhbK0UaDptgWMMAdVa2EzVnCL0Fdt4P
	C8CwU6njpzc16OA1dki1A/QVsYaa2fr1OOoMTrn0yofhzM7HL6RF2Wow7f2tRuaJ
	2PYNcqU0vefF9VfhQZZYt3fhB3NxmITWzERS0MJE8hSc3pgEiPS+lD+uMlQ==
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	by m0089730.ppops.net (PPS) with ESMTPS id 4hw3xjcy5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:08:58 -0800 (PST)
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1f03f2e8aso12090835e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:08:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794596937; cv=none;
        d=google.com; s=arc-20260327;
        b=jn28eYJus16r6Cw8K8KL7YErgPJ71Q2hSwJvHrVVe/aCxe5uVbZqC1Bz0zYSSyJien
         7s/9qvw6w/EVHPCLNqxg49PZCC4zHbKYWKxMWPkLME4YARScdKjunA4/yp0uHNvurvEw
         uiwhFm+X/aCeKCYj8HyyhydY3sTXF/LMtfe/zZ59o16i/O2tLRcHHeTZc+3KigHkqqiA
         ZN89vBBKJaTX2TieBDZOD21BhXsb1T3TyahC3MwRj0B44ye5BKnJ0IxWgOXIXDlK/uRC
         RbbPUJ/T0VPKizwkFrKt+rsYcrgA5f3hhsaMVRmYRJWaTPBLfwsuIITuHFuvlb0Qk3Kc
         Dd8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=wMGf9TKkw2dAolbYMMRxX3h85UEtf4o2yarI4oY4daU=;
        fh=DGwEzVX2/0lO0ItFLBRshUHHykAKveQShIYt1stG3ck=;
        b=EKvJmPtCFBpMSCcOa8mCBfcL+W+mgLZ5NZW1L8Hy08HOVYWQRvXJENxfVHnQpZ4XAf
         ynHvPa+4pm1N39GTp1N//S1hQKVAEuSN3WMt1qcZOpadltgKb90sMHMbxoI5w0u7aj+v
         iIcR8QLsTGkB3Z9YtO+5e46DzVEv5Igqutbqq9o6L/txJxQmOO2OzJ7lJGDOee4kcePf
         UntRRWZXnPNNSMDkokrE5sFSK6Fp6SaaiV9kxKnpRwfE3F//exgWHdql7sNRppKmEFjG
         AeOsV7V7rf6t0B5oEDmqU56ld2qNpwHRXRDwQZouSG2tUdEmcEFGWqkrqNHHKIMcOsIi
         DALA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596937; x=1795201737;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wMGf9TKkw2dAolbYMMRxX3h85UEtf4o2yarI4oY4daU=;
        b=1OMbwPm5pjTpKSsmUDfYEWrVAKR0jlQOteZ2PG348bYrH3+dhHXYUG8knpmSuJUqsA
         FaE/iwycS7JGe3E4kIk3P+y5BtzKI3HFx50DDIQyJ7z6R62LWvGrHghTOnIGkcfwwQ3Z
         pQTxHqnv+gYW6uhO2G5XSJ8sPH/7ZhiBYMpQuvsBOl4APrFCEPJXrpQsSVOXkRE220qJ
         zk6nkeBRmQKZhQv6RaKdIDy4AXFEa7kyvWkI3EfiiEZjbA1Xgfz0zlJ4FaqO9Icu+QyM
         2OmUwU3uF+3qd5JryowUoEwDNGgrKfvHkh1ap++vk+jGU+i8TD7O4Yek3eM1snoSJX6T
         Gg5w==
X-Forwarded-Encrypted: i=1; AL+hErHesM113he9H8lqniys77ZuRyZCkgOsNR4cNgb3CUVFrJ8EacG/5iH7NN/7Y/qQ20Eu96s+tlw1a7KuFfE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ngMIP3RemgTUXPpFvFsNBDglrDueObWEZdBn8wXAzZJQxXGQU
	Pvpo6uMWm2KDleIOgYlmuxigmHS2/WduQPUFDHn4vlceOH8K+jwJ5yR5aiwROcKBQpc2MX0xITa
	2hXlel1UXrXPV6H4HZhC3vUvjWi8ZUftJYDYC5eM9kUw3WG6H6RkJcdAEtk288z+aPEV0JboGK6
	5hbMbMuODSRSZK9by1eQWWLwqaEtl1mT+zrnagD7k=
X-Gm-Gg: AYBFou3H+xfpXschgWNZGWGqL8QJmxabLQACQRpneRgZBSRXnDhiKKDnOFoBZRx+HHo
	klgeAzxG9W/AgjboJa9pKPevEWw1s211O4SJNCmIKpb/lHcnAD6wcTOqONpcRm44J/XqVKEPtH5
	JJdBgvjeF1nPYmWwLFwtCbnMZmy5GCuR+nXWHrg1LQWh8BxzGW4vY24BApkwlze6DKN4QItEQaA
	gFJMzY8COLqWg8GqSTZYHA1JoYjjj8fSLsGbu6KUyUbvf614cw=
X-Received: by 2002:a05:600c:c172:b0:4bb:5f07:10d3 with SMTP id 5b1f17b1804b1-4bb5f071385mr25701305e9.21.1794596937151;
        Fri, 13 Nov 2026 11:08:57 -0800 (PST)
X-Received: by 2002:a05:600c:c172:b0:4bb:5f07:10d3 with SMTP id
 5b1f17b1804b1-4bb5f071385mr25700845e9.21.1794596936812; Fri, 13 Nov 2026
 11:08:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-1-toddfreed@meta.com> <CAM0EoMnPM54re5-WKyWgwyoz0cn1uGT6=E96OBG2-4m7M+kx7g@mail.gmail.com>
 <CAM0EoMmrRrmPdXPKyiQgEHQSb=mq3uYfNc69hEKw+Rw1EQAzmw@mail.gmail.com>
In-Reply-To: <CAM0EoMmrRrmPdXPKyiQgEHQSb=mq3uYfNc69hEKw+Rw1EQAzmw@mail.gmail.com>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Fri, 13 Nov 2026 11:08:44 -0800
X-Gm-Features: AclHuK-U0ThzUJNaBNSfjppeRsNnyfVDY_cTKL9afgrilY3k6R5ZNeb33jtLtAI
Message-ID: <CADh2yMyJ7Fgtv2BAyNpKFkBC6YRC=Z7kOHSiBcH6kTqcriWL4A@mail.gmail.com>
Subject: Re: [PATCH net-next v1 00/15] psp: introduce socket-less associations
To: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        bpf@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>,
        Daniel Zahka <daniel.zahka@gmail.com>,
        Donald Hunter <donald.hunter@gmail.com>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Jiri Pirko <jiri@resnulli.us>,
        John Fastabend <john.fastabend@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>,
        Paolo Abeni <pabeni@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>,
        Simon Horman <horms@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
        Wei Wang <weiwan@google.com>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: gFMKlgtfvzR9gWFuLFoCOvy91exXp13z
X-Authority-Analysis: v=2.4 cv=YNIKWhGx c=1 sm=1 tr=0 ts=6af7604a cx=c_pps
 a=IwH782EDBk/vqbJ9rM8UFw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=855S8uPTkML1Oy45N9_h:22
 a=c92rfblmAAAA:8 a=VabnemYjAAAA:8 a=V8I_lJ-4SMfPdcaXHV4A:9 a=QEXdDO2ut3YA:10
 a=GvGzcOZaWPEFPQC_NcjD:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-ORIG-GUID: gFMKlgtfvzR9gWFuLFoCOvy91exXp13z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NiBTYWx0ZWRfXyERfTJx4gWET
 kJcVS6mDy6QUOV/JPnLyRd+ifc30+ptZBWP/QWx3pGvC37qV6jwU+9j3RvwrwCI47+4Nn6iP7Qd
 pUsai/997DKpICJV4+JSSPdClaIWS98=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NiBTYWx0ZWRfXwrAMM30gw9Mx
 RyE2fmZ0R0mEyQXZ5rnQBDshvT6BxqxTX4E5C8aWyBfrYxGQoplLmcWxA72j3o7bICJUpivO3V6
 YbAh9yVmuFRc1ca8vN68sxn5et8a+jchYlMZgd6yS/PJ6YBtWJSmglmfHtMQnKA5oaFyW20CZjY
 vdLMiOGr6nZuLwXzZEpu2ctbZ9cKbVAbV1ux+6o4UGXyqFQ9uAk3mTizQ6XVVI0t579PDyplVxt
 6q8XBh60MG+sWRHZ4ZL9sC2fi5Tdc/vY6wFJ0pqu1BpNH/L/yZyxOO27c9ZD0lFfiWT0VIFCxfJ
 g/XOqfrC9eboiT7R2aeV1sB9IQsVNg4pN+MqnPpFPFio3uTD3BhwtDcPJPtXhMKUlPhTDI3Jtcv
 d1NVNmUm4fSDx+EnAsAoO8awYLeugp51eVIGSsXWAcK7sCvbztE7i3SwyxMGo066iUHddds0NYI
 eT+oWRABG8yyKg2nBIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_06,2026-11-11_03,2025-10-01_01

> My bad - only one of the sashikos (gemini) responded. I suggest you
> wait for the second one. I think it watches this gemini sashiko and
> tries to come up with more clever findings.

Ok, I will wait for that before posting v2. What is the best way to know
if that has happened? This posting is from 3 days ago so I would have
expected all the sashiko reviews to be complete by now. Let me know
if I should adjust my expectation.

I think this is the right place to look

https://sashiko.dev/#/patchset/20261111005533.6436-1-toddfreed%40meta.com

-Todd
