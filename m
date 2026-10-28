Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793176302;
	b=af3yZh3xyDU4ATCMUDYN3uZfhjee+oLFpK81jbMjPtQkSs85mWWBk3vVR2tMcRT0jY6E
	 C8rqcLmSCtIosg6sZKkkh0uEyjWsFaivWGKxJ7lcinbi4G4v70mEk4Xs1b7E4dAGS33fh
	 tb4ECifCtf2cGRaFbgkK5UaZdOQSxPbAVr1uLZVzyAtFAHOmqu8CVLqj8sEffWxj3faS8
	 5l9EbAB1+PfyB9V5epWUk4prH+aNssCreHzsA/uxi3r2RZ7cMOkwZ0n98Ji4p4R1deSPl
	 PnMYJGPQmzOOiSwA42cDXgS04Ql7o5E38rfJeIvE3zfl7hMSmD2lvhbaO4W45QC5YRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793176302;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Wm5c6oDxTUXFgDI7tpfgfJjE81RVl+ZbeydpXbK8vfk=;
	b=WRI8NO8FNkCd6RfaHXgJ89UXLtDVSlV7FPTpagCRZRWYZcE+W2M9RvxUlk9UwIdSZH6n
	 siQM9dx97RMroLIu22KNeW/OGN02GafMxySAQbWij0q2N8pivNRH5Hjl3hqckMNQztOi/
	 XGiPNcxh4l8uD/ulECM95wSl0rJg1OmJuOZhi8y7zryzZTp7AM/AL9Yon15qSIX1hyiCq
	 vq58SQDqPakk+82BsWzA/jlClGVvOWmvKpDy+XdY7DP/XBQi/Bm+qjjJVMIPcBtiPqB9A
	 Y6puAmM8D+FTAhB+IRVqxqKWt9p3n0tyySVzh+O9VkLLgn9f6xqKtnDRqajeVEPrVdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P2zuzFgz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RRZL+54p;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E77606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57E77606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P2zuzFgz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RRZL+54p
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8KtBF1101797
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:31:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wm5c6oDxTUXFgDI7tpfgfJjE81RVl+ZbeydpXbK8vfk=; b=P2zuzFgzcg9j5W1Y
	jU59M3iewI99LKeW1c1IQYAccvVeZikXewKZvyw6u4i18BZSKtVEqAYjDXTMZZbb
	39fkpst11DB90LG5b+FqNx6gOrdf/OJU9Ggx14YLeWmEl471FbugKCU6+/dAN30S
	IP0T41onVq941SU02Idnbgp6ryF6kS2dXrqH8PyfMbxzdpGhfZos3Elh35zq3OU1
	mM2rMe3DH3PfTpesUD95sBjjvYcGnkB5+rRIGOLsDMGPGKlP3K7NsNVHUeHwSZWJ
	Ytqm0S3mMEg/lgbyBB00B73FQCfM7x73ClDt1t9tgT7DYNxgmUsf9jXvgIfDvmKz
	ENk8YQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7r18b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:31:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ca9b53afaso184447785a.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793176299; x=1793781099; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wm5c6oDxTUXFgDI7tpfgfJjE81RVl+ZbeydpXbK8vfk=;
        b=RRZL+54p/7C9Vi0xkMnTXcxfK9CWAolI0gDs9CGQ6Q7cIbhEimVGK0Al18GAPgB0u2
         igtbiqjmoxdk+vCAVDBTpxpnGIV9H8+qbmEt7Ei8YEZOT7aEO/BPQ7XlwP5D2lf6F+D0
         c8PpKQLHR/b/2HlBEIv1fr51NTy+mZg3j8g9pXBX7tnzoMlCikZbZqn2eEAWNzjBHvuO
         IDWK0ryUGc1/kQnIs5Yo4h97tJwl4tf7hM0041kI21ihaNBnT5GFmBaupf7S29WJDoQ8
         l0RMJieFCyVHkPxJKPU2Kqidc3ZxaEbxsJEX2T1kuP8PAxk6T1NuyzMwqZs+pF2rQZ0k
         kD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793176299; x=1793781099;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wm5c6oDxTUXFgDI7tpfgfJjE81RVl+ZbeydpXbK8vfk=;
        b=Mw22b7rMxFw7TpKCPMENPIt6d8CrXgzSzY+fq+EOdYJcLd9SQgvwIQTt4Apx1zO29D
         ciPy1rOvfYPrfuNaIslvlXR6LNevsY+2dJ5gSGElUq8Xsv98qZbHT+79iHCSWpWeWY9h
         CqwnnvVN4q9WHw0+kM+GWm+CG4ZV8HZX8AYn9RoIDRQASW4Blz/3CelDcNPgRyIzdUsf
         5EU+ujz+d6Da66deFU/u9hAkPOBV4t9REHIv7SQoA51tfSkUaKzoHDL09wJcjSR08kTR
         R0giMFhnB4Nzk8wk0kq+eEJcNe0S2WGaSLa+QUiR016XEFShtjLRU/RErQ8mjT5NOBP2
         ZJpw==
X-Gm-Message-State: AFq9FYIVnmExBqUb2ZrtsoBC6VE9BiUFlg8Zjwq4SSp1mLx5NO+5k0Iz
	LdJhJVqr+68gpW+Zwfy71jcC5pU0a5zS9Hf2Pj8zGEu1+WyM2ZNj3egosFtpG+GgtkA5sjrZ0y7
	Wbk5ywRmBhzWkevl1Qjo1AJYYCuCKsQSZfUAssngWJowyvcZfX3GYiI8LqZD9XNvslqc=
X-Gm-Gg: AYBFou0VG9l/cSxViBTLn5zd5R1meMFV2PvV+lw/xL0m98/HmIaX4Q0RTdaTopopGNs
	g5LdEQ6/xrM+8PZ94kNYTzHRe4Cgi9yx3XNHehxrLehyP2z7btXWr8hX7OLyPQpSXgfdfLhUSz4
	Kj4bFAEb8LV/UZtAZdoGgncMwbUAr9Okj0bpmecV0Bmaw/PzBOmfgs2CGxPnqcqw3+cnZ6aUgyr
	0atzbzHoJXpIrbta50oYA+oVGu3VCjF6ylkfqKLE9wySXxOcvzB++6g/FCxcZtqA4lJN7sMT/q/
	Q9pEuVHFPy/Y+Kzd/DkVylnY92qECJzLFSWRV8qLydDHeN7nsl115Qg6CvKSkOR6CuHrbmEn9s+
	G64LuNBHKMXfuyZOzTsF6S1Dge/ei8GjwgKhX8URgTAaukIrK6OKiCyhaxhY+9BtYsd7fYjRLyM
	w0
X-Received: by 2002:a05:620a:600a:b0:93f:61a6:b89 with SMTP id af79cd13be357-944089dce60mr207357585a.7.1793176299467;
        Wed, 28 Oct 2026 01:31:39 -0700 (PDT)
X-Received: by 2002:a05:620a:600a:b0:93f:61a6:b89 with SMTP id af79cd13be357-944089dce60mr207355685a.7.1793176299060;
        Wed, 28 Oct 2026 01:31:39 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97bf5d6besm27476175e9.4.2026.10.28.01.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 01:31:38 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] power: sequencing: add .kunitconfig
Date: Wed, 28 Oct 2026 09:31:36 +0100
Message-ID: <179317629372.6556.15170359641937178329.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023-pwrseq-kunitconfig-v1-1-0576e431565b@oss.qualcomm.com>
References: <20261023-pwrseq-kunitconfig-v1-1-0576e431565b@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae1b2ec cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=VJ3RpJvl78RufH2NLqgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 71LQYFaOsbB29AkSYKfGHzf70q0ShNfs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzMyBTYWx0ZWRfX9xq99VX6nqGX
 WkfTSwR3lqUAVMx/CcEnD0vuTuLOy5mIagpxFQHAU81ZWDXEdnOwUm/ZDpRsWVxl0XsM+mx3k2K
 R02X25BohbD3IWff40OEmrXzcOk0W3Q=
X-Proofpoint-ORIG-GUID: 71LQYFaOsbB29AkSYKfGHzf70q0ShNfs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzMyBTYWx0ZWRfXzabL37EURWjV
 Kus++EZ3IVduAh9eXoYdsMF4sB+AX2/t5pWebfsfTB6/C7gDH7JSpunHq6PANjSCZjU96W+jFF4
 GjQ8Ava1CnShStpqYl+GzeVe+bh0RA+0kRMW0ntS5K9c94GQm9MYWOh2rj2crT1b1M1M8/fMOuy
 V7FSijFse2Q09fcPG/pGSRFKst1kp7GU5oZclAwumWGrEqTaWNJvWfdB2ZNtsgTSubsg8Jb2zqv
 HebInB12M3dcmjDhmhsEjDRdRjlJpehFu7yTkBhsO7QwyuduUMdakO+Zx1wq3qUCWVM0e48/isf
 zHM5CS7OhgGyXnlTYCCQjA2NuroybC1ZZhxvshUwZyseMM17PXYiwUZo8mY+6EhfNYToXBegzEY
 UotdKaznm7VvGOzLu0+Xf8M3sj1ttv8Idi7vSCyPYHcZoQUoQW80v6Qeb09fZSHYWW6Uqu31jl7
 oMt732SHBB2l+Jj+qjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280033


On Fri, 23 Oct 2026 11:59:16 +0200, Bartosz Golaszewski wrote:
> Add the Kconfig fragment allowing to run power sequencing kunit tests
> with kunit.py.
> 
> 

Applied, thanks!

[1/1] power: sequencing: add .kunitconfig
      https://git.kernel.org/brgl/c/f1f9cc4aadd9e1cb47626df5ce1cfb12c455f390

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
