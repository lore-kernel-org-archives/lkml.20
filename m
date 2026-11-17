Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904240;
	b=oCuocj7ExnhybVC5Ljcfa+iTB0CtvlJvUu+uSADtszrdkMVQN6EHLEQuGWAD0oZmN40G
	 Soirw9uShzL+91WUb2Vjp69d8im3FqsxF5t+X04fMtx7syIZsN71udJCxY7uekV9aewDi
	 l4HBYGyShGh6E5gyNgDc/pKrPrPVHivcG3kLe4uV46TPZYn1h6khqmyEDkHW1lYsDBAVN
	 s1Za/RHqWflCp/3m7/40pprBzes95ekJ4d4jFFnlgz6hbeArCx7mzWqefDTI8ir4DFBq1
	 yGZR2gqsYy0n021wJ3CqkqWud3k4sjqvfSTiKL720mCqUznF9ZwNScvF/oEj7Ka2y/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904240;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=T7SrH+SEDGI5Pc/DX3J27OAmA1Ya6DTNGVrVgDEbF6A=;
	b=NsBPnJvtynPu+qAsC2NT3TogmgAnB3mkzHCFSbzP0XWntbI/kf7mFrpTVgH9Mt2i+I7Q
	 dEaqL7eoBMo6c1ItzT4leHGFJj7ShPD9AWkNEDbMeXAzy0W/SaqHMU/d2wpvutdNAYeE9
	 I8dkv/SUnpo3YpCTI/uamVDW9cXcyvN5oX27QX+6nXwHQReQfAoiUkw9d+44ofDASrRRT
	 lNH/QZyiufWwHBZXF+8/baaLmTTi3EpK5r+tPuQ1UJ7+DyTqr5gUtlEwoCpvWXLefsRFO
	 gUUsAjXHsbbOPMhzn3BVuhQXLKhBGYaswZ/aDGKHN/DSWaRlzcZsjrnOpBXTcVSE2hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fqQZYNU+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KlMrQhfH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E06606A88C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:30:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6E06606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fqQZYNU+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KlMrQhfH
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH55mKN3350219
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T7SrH+SEDGI5Pc/DX3J27OAmA1Ya6DTNGVrVgDEbF6A=; b=fqQZYNU+uHYsiI4o
	vor7DxZHKVjMV4jjY+IramvoLpXUV/f83JZUPMGeqshMPuZZjdLb72CR7DNUtI97
	qBwR/W6dG3inCQh0uE5zmbee4Hf6GiGz/so0f8yB0TImdcZfBxrmyQga7fwk07Bh
	Gi0ks6mKdT71FhPNG4/JJif12NxtXVqxJLzvkjiNcAhwjSKnoH5xO6WHNgyYUwUf
	Zp5yyH7Io0nvlyokdO6we7NVeNHtvt198knfjTtsJO9qc6ZieqSv2hWn8dFsDsOO
	4uHCQHzLsD1JAEbwMVk2wptMvEgSCgJOY1RvfTh3qJ5AjnjCFroUAFZeoR03WVbU
	pPi/YQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0gfr0qau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:30:38 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9210bbc04abso544446d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794904238; x=1795509038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T7SrH+SEDGI5Pc/DX3J27OAmA1Ya6DTNGVrVgDEbF6A=;
        b=KlMrQhfHXPqO6zXT2hBEZcPCZZn9chd2T78TrmvQFcQfqwqbI3cZtynqO34gIgt6A7
         LeJH+vZ9zf6EujS0Y5HfZBF7WI3LRCsX/upkhIqBzUBxxk2xYaiQTY6NTeKzzkC4+yjd
         N8YSAZZuL+n7nOPclqwLPssRfcT0Cqam/x5xHNaCYQb43N4SQFK/yAsybxkNn0RejUla
         gGaMKbVT3JIzkg2F29UMxYcnCpM1eJqAWK/WMkOQolO3qPsiGtk7jSTDjxYqWLu6fmPR
         lzqPyTElZG2w7xW0SPR53ecYCTaVH7E8TmJB4zSwO/J0BUHqfjEirEm3fH8wdHs3oHZB
         NXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904238; x=1795509038;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T7SrH+SEDGI5Pc/DX3J27OAmA1Ya6DTNGVrVgDEbF6A=;
        b=SwPFPVsyiNf7NSTV2KZ9vFvOiw969UOHwcXGyVf1naqZVAbGjPjxnRODfsPURVfLlF
         Car3o9Saa53A2hDHVbyNTVYTJE5HhGV2CFfjjX6aHBLRKRc6Byiu7C7G3mLLK7udtt4n
         8Lmoad0xMQUpQ4hB3U1ApY71mTsW+ZtfZYUFZh0NvGftPK9SnUnHRhSwVUvUdaUwGcWd
         xeX/U1x6OR0kDCxcB8g6ErBcdbYEByYDbL0KgxktqIpbA/s7QN3LalXhPilQZCD/hcM3
         nQQ8xENzBvYWJug6DWWWHd8PwWXI51SKx3M5N3UDHbqnJl2BuxB3k94cqYy1+9T9nLTe
         /jBg==
X-Forwarded-Encrypted: i=1; AL+hErHF9tFpeqEotIMNxha3Q37x4AdzBpZVkcE0cAe7rJk5uf4gxAybe8t8FMdlhSzeJi7Yzc6PxzN8dYdDlDg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oVrE0y+x/uaMivWf4xJRR5t3GBw/LNVjl7KgURe7QAx+vu8NM
	Dy17lMiAhJwMzorujgstuoXPRqr3j6tBN5QnUQlpVZUruC+6/PriD6FyvBBZMPmKvjNWIJGmAQ0
	qfX/HyuDhpsctOY+BYFl3p8dDlgJsyQzamT7Nda/dZHQBFuDbcN+B3QbcHGc7XnNc9CJNK4nS4i
	ZoGQ==
X-Gm-Gg: AYBFou3vu6853Ix+bQtg1c9bBVRhmOHztP1avHddW6lyuQLIXL7Fjt8P3y9MbPQMxvl
	zlYWBaLoTeRwSFXxvY7pywLOF0pcsowdcDAYYwkwJcD7clkaKIsyLgoBfDgW+sQDGN0fzxcS+EN
	qbF2l2HjxOPV/nHA4rzbbNz93kimB0JRxarRSwuKvn+js38fREnumez+hQfeWjyGW1rW8ZGbj1b
	NjpevZlk1DjLM5B7M62DVOe1wMwMVMRjBYmra4fP0IMK0Lx0xEtuoirbCZn7GDX/h91p5uQLv6b
	QHKpmZhwvLs6Fo44pbale7/Sqs8AosFHbtkN7R4+MZ5Vekj4QwFmGZ5gtCjzdH9dVFQj983y9Qw
	4mH7XYepP9eTmdR/0/P3ueLFAfqQlPUAWpzaNJ/mP9im0i0z0sw/5nyQU3egOpCq3uxK5p4I4J2
	A=
X-Received: by 2002:a05:620a:4493:b0:949:816f:cff5 with SMTP id af79cd13be357-949816fd1b1mr727763585a.4.1794904237898;
        Tue, 17 Nov 2026 00:30:37 -0800 (PST)
X-Received: by 2002:a05:620a:4493:b0:949:816f:cff5 with SMTP id af79cd13be357-949816fd1b1mr727759685a.4.1794904237455;
        Tue, 17 Nov 2026 00:30:37 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60da0a03sm21613010f8f.53.2026.11.17.00.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:30:36 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, brgl@kernel.org, davem@davemloft.net, asmaa@nvidia.com,
        David Thompson <davthompson@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v1] gpio: mlxbf2: Disable interrupts around the chip lock in direction ops
Date: Tue, 17 Nov 2026 09:30:34 +0100
Message-ID: <179490423029.15574.4911642575575429380.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261113184444.3431-1-davthompson@nvidia.com>
References: <20261113184444.3431-1-davthompson@nvidia.com>
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
X-Authority-Analysis: v=2.4 cv=X/rHu2Te c=1 sm=1 tr=0 ts=6afc10ae cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Q209iurod-_B6gZumggA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: JZvSpiI2r-iwLJNDNK9nmz_60PJN6ndA
X-Proofpoint-ORIG-GUID: JZvSpiI2r-iwLJNDNK9nmz_60PJN6ndA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzMyBTYWx0ZWRfXy6ZLnnZPcN3j
 DuKUkYv4zN6J0egJs7d2HlSqTX2VoCdKqpvb6oBnTLgDfFXBXXH/5ooKdYWmVcgFCMDGEOaDUSV
 FJJTQeKXHzAi+3ePxaI5XYSCEjpQr9JolKXA8QKFH9wpuTOgNGGvYSW/CQCkqPUOLPHuA++OxZ6
 40o1+FZTz7QucMaM6nuk7hj5syS/9Nyf91Juh3ZedvInZy9H6TXifzVRoncLmVYDr6t7zwCLlh1
 mmoMTJa48QP5DDS3clbktqaoNiQOaAVdXFXtr/g+ocPlU9QqyNGwm1m7WevvwuhtoVMEudbN6GN
 lJ9jRlrn2K1WyUKhgjwWcCRIQvOQZYkaPSHx69+pb5Y1Oxm7Xe/y8f9Ogg8pnR56gZ3K6w3U1J/
 FF/8QnnorX6NTx0C/zIYVkAx45rc5xc3td1eXih5Ec5UAUVfVSeyZtNb9xbriSsQtYxegfkCVOq
 Alc4Brr/5TrDY6X8Y7A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzMyBTYWx0ZWRfXyQ0Iu4k3JwNc
 FVz0aA1z3K+dGA/btwJ6jCKgFa/FjX8yvss/p/rSR76JB5mStxc3pQlCim3nNRP+ha9570QFzRS
 nqMvz2LEpjlWttf3ExF3O+g2s5hvd/0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170033


On Fri, 13 Nov 2026 13:44:44 -0500, David Thompson wrote:
> mlxbf2_gpio_lock_acquire() takes the generic GPIO chip lock with
> gpio_generic_chip_lock(), a plain raw_spin_lock() that leaves
> interrupts enabled. The same lock is also taken with the irqsave
> variant by the IRQ callbacks (irq_set_type, irq_enable, irq_disable),
> which run with the IRQ descriptor lock held.
> 
> This creates a possible deadlock that lockdep reports as an IRQ lock
> inversion:
> 
> [...]

Applied, thanks!

[1/1] gpio: mlxbf2: Disable interrupts around the chip lock in direction ops
      https://git.kernel.org/brgl/c/f95bdff1d53471159e3c7112c5de4f6240772521

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
