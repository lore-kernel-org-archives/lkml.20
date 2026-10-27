Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793080416;
	b=h2WY8pLNXcP6jvofENUPBeOhjfHa9RxJeEgPqjCu8gtjfvep5K5VeyjtkhPs6XwWTArk
	 ViWK7dhRh8Hx1zfZdzFtnUKZqCKqVI1Q5TCXBtLwsL0k+nzOoqY4K3Pslm8WwKolDk+zA
	 lbF4IsgnDPQiqF8AWxsE7vB8WVWoxaLgH++uDIZSYE5BcC46zu3n//TD8zKhO1tj+rEIq
	 j60W6Hu5QLFksnHQYQRAB9XTsSeYrbu3Z1p0yVfW8Z40zO85uKxly1mj++DrBKlaEgpcC
	 vGvjPAz2j2sgV1qk5ORP4rR3bks09uKNRG6VhzJAcMsd08fhvJiY0U9mO+ZNDoeF1DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793080416;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jgYHmotmGu91u0ACrPhUo6ozUhf/4pr770wqlo4hPSs=;
	b=XX13IqBTHL8e+1A8pqf5JUykO1eIGwFkqjGY3zJVlKM8EcaUOXyC721paNe/JC7jHYo8
	 Mz8PPNkqE72/XdDBhgkE6SFLVtKMzY422EKylkBAD+oJqS4m55Iq134DXzCP/Ln7sjfeB
	 nYfmHFyDbHBRr7MjkxSmPDiGLvKOr3fhqEHPFy1mDBRr/Og1a7FBITMrFPHbqiUIF/AMm
	 4sJBh1eCZqfYTcHBYqltTIUDOK4iShKvYdk+R8PAw3NcKUudi7kFe2DSPFVfcyCCYUWES
	 A1SSU8KunWjoN9Yy21qH9jheQ5R6DVAVdPkfhq4pFDrrSJ7ggS3M36+y1Ja2gc/5uAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cyqEmaCh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j9aR+rRl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC21606A321
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CC21606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cyqEmaCh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j9aR+rRl
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5ZOpO1850996
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:53:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jgYHmotmGu91u0ACrPhUo6ozUhf/4pr770wqlo4hPSs=; b=cyqEmaCh0aOI+N1/
	/pDcGlpWVdVeutex5VKS0y+znfue/nj9pQumOoDLWWOpn4DWYxPphMJqiROi+q5f
	9cZxyzwI3+gyBKsSpmp88LxvU1430K0LkZxKH+f+zJFu8PBNtk7agDYKvH1cL9io
	UIOz0XgCq75I3jaqE3nUjp3qV5afxAPdZZ7zqK5Rwf6ld0ZxQlsrgvTmiiQ7Bslc
	ec1vH5+SjCBzwsKg6+wxjTmBue2619fAngECyLoA2wzUUDAAEYyYNWlcVQQ+NyQw
	BS7PUuVMteEVWT1huXXaKQbbFdTTSkCFpxk1nvrqtpZzWawHu3yDFlYFhSR0KvzH
	6uVdyA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf3yej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:53:35 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3510d0baf63so10692917eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793080414; x=1793685214; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jgYHmotmGu91u0ACrPhUo6ozUhf/4pr770wqlo4hPSs=;
        b=j9aR+rRl8ciTvZ6BUIFowHccSHx5BDIK4rrKvqRztP7GtikmIOmrvfrhOiJ5AYeyhG
         icMX1/zjzwAlxXwoJ4NQeX8Utey1xc5GGvgehwaMAfe8WKoPmUl03KkkStsBIA9rtXEw
         zfloCEPou4LvauktiHTJooQKbs/+nBP2FP4fvpE1Xza+PoXduY6CZXigvufhUCupTVG+
         civfT2G5A8PwUdR1W27nmGUV1Zg962yebo1Yqeaaboj28CoPf19zVkC59w1WONu0QuvS
         vc+9dWcF2BQrDoWRgtAuK+Jh7aoxHvAGZjtt5EDlDnckDgmIEYA753CH2a54oIRkZbAq
         mzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793080414; x=1793685214;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jgYHmotmGu91u0ACrPhUo6ozUhf/4pr770wqlo4hPSs=;
        b=tiOTM/NgxvjbgxnySR04BOgLif9kiXv49Cqz27DyKnG0nsq29nVhm6l5WY1+a6arNN
         b6ZdhjROI6KVpLD1vtHRptZdD8NMtn2SRMLe/gFXVxSXC6GM/zCSmY0AncfQrHV9enqk
         j5dKs47pGh0w2vM5iX8hWwRPEA5FD3k+YKO0P7g5mjGdodzm2hfJ6qVPhfkeXdayse+d
         uIP67P/uqKiMwncn+tZSgXNxLPFQuuqy0s6avnzoiALxz3rAhXo4L4cCD1Gm8EYTHAvU
         r1AGPC+o+Q8+SZk0hcw9p4jN/NxDd9nYd7+xzwfUH4FOqlbekBUC3CEfbhdQIiOerthU
         O1xw==
X-Forwarded-Encrypted: i=1; AKwUvByqZtyIO0sFm3VUjxZM4CK2ALd4cInhsErY4uuAf1hMz+wqnraycygIljQZ7DQzogMHkz0Rq0NADyAXKRA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqgdE0KRty/b0zEmQcdFU3LAtzOeOlKEOq61zgYRtz+wNgV80y
	LTZHl3RzV3Jk3neNn8h4UNSrOiQ35ElSwnxyaybCZpGgKYVGQC8uNX9f0elahbASzvOJie1kGV5
	h1PDDkqRal2qEVCvC08MpTPIPhzd+bKFID73E1mK4VMB4SONXg5dG3EQvAv0LteGk9nU=
X-Gm-Gg: AYBFou2pFhatCNutr/g6Yq+lERY6LmNCLVC5Gwp1qhETVgo9qNKvxnoDNENABQrrU35
	Mc8RzdQywwfIRLxdKGtSBzB4OlpLnzGFAqIenSnnO9cqEcIsOuMCGw+eC77zJCzya/P1+OzzXKq
	kZX/wdeghgZtHfd/c69UK7f76m/feM5PGMKjdJAaGb4oWNQ6eH+u+6bJmNJMH0Tbznjb2yrhflV
	+pT482M/nvJ+QGoDDAN5ypgGCHlSR5wFnJZivW9Pzkt9M3lT3PUH3iZgV4X5uH4Kl80UPh9FLU2
	6UNcrDZdJiWtT2rbjz3t2uQjSm1r8X00Vkmw0J1rTtdHjHDXJdl01UXhPJlJNPscd2VV50kP60q
	oFLByBCMz8RpSo+gJHuvUJmNybw==
X-Received: by 2002:a05:7301:514a:b0:343:ff9f:26f3 with SMTP id 5a478bee46e88-369e842b597mr12692371eec.9.1793080413974;
        Mon, 26 Oct 2026 22:53:33 -0700 (PDT)
X-Received: by 2002:a05:7301:514a:b0:343:ff9f:26f3 with SMTP id 5a478bee46e88-369e842b597mr12692344eec.9.1793080413423;
        Mon, 26 Oct 2026 22:53:33 -0700 (PDT)
Received: from [10.218.2.197] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d8a690sm30226262eec.12.2026.10.26.22.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 22:53:33 -0700 (PDT)
Message-ID: <114418ab-dab6-4772-994e-5babeed72b65@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:23:25 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] arm64: dts: qcom: sm6375: Do not mark MPM as a
 power domain provider
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-6-ac7f1a0d5638@oss.qualcomm.com>
 <5ad62m2ix47ynkq2ikghkxdqpcyv2tjixtojdobpjpdwbkkab6@gjklpaosvpk7>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <5ad62m2ix47ynkq2ikghkxdqpcyv2tjixtojdobpjpdwbkkab6@gjklpaosvpk7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyMyBTYWx0ZWRfX9s7o78EldHNy
 JyI3dWG9qgKgyA2fITtStdTUcb2OctlKX7r51foX4juPP9Cjrcas/Pjh1/pzGEeCfzJf2urpfl+
 aRHUY7Sb/QBjz+ElEBhWnRzniMIoszo=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6ae03c5f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=UnRI9tf91rfGD_JGq8UA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: DI7YHCiuvQuN5wWyslPKTEQbs9YsbY8c
X-Proofpoint-ORIG-GUID: DI7YHCiuvQuN5wWyslPKTEQbs9YsbY8c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyMyBTYWx0ZWRfX1lKrQ7CUzg99
 2MFNZJDvDsoir5LxF1qh0726ALihHrMoXzklFqvSeq6PatuuoxT81eKrk4d3PGzXjHmpdAZfAuw
 Pf2VDyZOdJ4hCHYiiVR/+m/io2cWscxpacd6RQ2S13B/nXdtYGEpVhzLSSLJ70nFr+ZAoHuTe29
 kws3TtKE11cD7lEhQTAKg/s+/jc4jg4U8jUrv7sisRhV8a2GjJnxlCCTJxLRnjhWh2sW/aEgZ8w
 YIvf75iEo2uDM03MguGRoRVny+XEfes+t72PLJY/k4YqmTJ8MV/d7PuNBQc63tZQIyFD1oM8M9U
 kq43s3AAzv+R5RnEvRXrzuj96Z0O0qHPqQ/SSaH0LufpBCvDjpEYy5fMGjhHqYSEJgCLjA/Oyf9
 OWpJwEO79+98FVNIyAM7zDq5czrkiefcGIR/BLZydGP/OXGjtsdcwXj5brjMqDjyp+zvRvoteeb
 kiee6kpciXa6xOObDLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270023

On 20-10-2026 18:30, Abel Vesa wrote:
> On 26-10-15 15:25:22, Sneh Mankad wrote:
>> To make the MPM design more logical and avoid probe dependencies, the RPM
>> notification is managed by registering for CPU_PM notifications.
>>
>> Remove #power-domain-cells property from MPM device.
> 
> Can you elaborate a bit on how the two phrases above are related?

The MPM driver now supports two ways to handle sending the RPM notification,
either in the genPD's power_off callback as power domain provider, or within
the CPU_PM notification framework. Removing #power-domain-cells instructs MPM
driver to follow the latter path, which as explained in cover letter would
help avoid probe dependencies.

Thanks,
Sneh

