Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007209;
	b=j3KQN7hehcQsFJPvoBkE4F85i9XQoq/PMHGG/QoGkAnkqgkDPCX/R+YTHwkmTF6fvoTz
	 uRKKcdzDdnAs1iE0O32wpsDdTQyMZrHMi80eNyl5YCzJCxv68Wc5jD2r0UyNgyg8w7xEK
	 NCpsw2SY9TyoHF6100oqj7Fs+/oR4ES8NzxlnxlZvUn1hFIHtH66sGdPirphrKBQ1QSGK
	 /b3B4ooM+yb4Fw4mFZWJrHCxwbt16+Ivk/tuCLD0vjfd1m/EsP2s4L3wyWG9dA6w+4Bv0
	 4W96QeHyFTbCKYUqnniSm893I0XJN6AIOf9ZZLqYwjRdy76nLxnEYjL1O109mBnGqHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007209;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zpYg908oPalWbYc+H1dirfywabdU7/Y8XdyQuanQWwk=;
	b=jlMYxEMfPXkrEuwieYSt3yKIRItaAhyyhWzIJw2SzdhPzV0N+w3Zwl3sd6x3SrTdaZ7o
	 98E12ngA0kBtq5Q0d8sMjtRVV8pK5FWZ8aISEUTUmPhRKCeuf/U9HvEG8pTbOCMM63+V6
	 NwXSHUWlXdzdIgOfP89+ohiXeDY3vMiaOL3lvIdamenL0j+yLGnzO9hSw5Brih2saBcLK
	 jQg95Wd5E6vLnt67WrQeXl8dZMcPgXsj5cE2qSy9d8pu6w76DLYr2gEqoOjaLMIfaR6xo
	 7Hg7/0p5NRGN2gTJ2/Oq3h3Y4ukIJz7Xy6WaOVVl6RLmXpc+3EIBpKoO+ZeLpVSQdHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U9uvUfmA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d1G+BA4j;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8183F606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:33:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8183F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U9uvUfmA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d1G+BA4j
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b8bD1907971
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zpYg908oPalWbYc+H1dirfywabdU7/Y8XdyQuanQWwk=; b=U9uvUfmAqTvW1Kft
	zuqxAeqbtUtYq1O/K3YYH3qteNs3QjSLk0knW0j1v/4EQiV0qPXt1xrUNTqxuux7
	sBLbjgqVfP9MnfFRmaNM+UyGsOrQ8ToW25Xer2ztcNpmVR8427/kMCCcYpu3MwHB
	9TxwUkkOQ/jxuYAoPwSwdPrqBLqiGLNFQR6gTIjXfVt/by7Wiss0CEnujQqE6RrF
	V630GcmP+gMdozEAT7Ie73TZprMJUbBAhCEi3O2bxhBSsgeG4Q6g3B1LHblUv0EI
	R+G/9ca3LpPWS+fTlXrNeHxIiMnJPhiCSnxTJXdsjdqFMdwKPlmCVl5/zdRR2GMx
	nEVElA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm0gnsta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:33:27 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90c4d46037eso8409376d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793007206; x=1793612006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zpYg908oPalWbYc+H1dirfywabdU7/Y8XdyQuanQWwk=;
        b=d1G+BA4j/gai5g5X9Ae4hNeXbsFQdQA9etCK8NxN8U0Ist3XKo7lS3DitRhe/soyGM
         X0VMb7grEAe7MAtYUhiav20Jpx30P8/O2LSXKi7U95UJPqvJui9hToULHTH3qY0G4ztm
         hWmdF6FO3+kvOZdtj64na/EXaemi39grQjXKChRBnXPR/nCmI5qU0YdmwBODLao509Q+
         R1WKgkjlWdg8OsqFuh+2buHX0neeF8mPWOIhGq6ciBLrAa7Nl0T2NeI3cNC9jiAy9SdZ
         5rjrquQJuQRrNf857sawXgWYlnmnWaPtoys9HFMWL1MM4kl1/a0Neq2gnwCIHQgzwBW4
         Dt1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007206; x=1793612006;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zpYg908oPalWbYc+H1dirfywabdU7/Y8XdyQuanQWwk=;
        b=2FOlNHAFwTsGLDbrXqMXCM0Gy9fwTRalH1vlfls/rdRKDfR7+sP/I9WAEtEtHbv/Ou
         zuomVmFD3f8H3oTvV4mGxRPD49852kaWb9+rY4xDmg0ippYc+TzLf0If0tMPLyY9jt6l
         QnXHLvW5GKVhGLuYysm9DTOadoW5ZA2J1NtecPR6CuAJ1Bvr6FSPup5gJ+OOo3mKRCIS
         TvtxJNBpPUek8XldffdimpYnlXQ2WNvCevh0YURs4hD9QBUdgu8zwGPVE5If4Nxd5evQ
         l8rinHL0TzDnAC2dS8Kvdz4sCz9UXrKGoisbO4DNrAPvlIcg07+db3fqkzWo4ZohQRgt
         sr3A==
X-Forwarded-Encrypted: i=1; AKwUvBylW3fELnACP8qB3O+7d4qzBRNcE6vBuuf4xPkr3I+iZwZIIf/dH5Aqp5WvoNY/t0WURCHNO1ay2+co/aw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTLOo4IjMcznwsNKSMQpGAXMCwVL9sE7LebCzZZclqUBjiH+no
	QSqzTPCPxZeToK9Dx3Ax2S9KPG5MiXt+sTmxZocj+anL1HZWxMsF1jUgz4rsJx8vzbHm8DcOx2d
	LT8me5ClmkGFsQnR9QpIy+xjZH2sYf8nWlvDjt5j0cHLpSOKtdY1E0oZGDHw6UVBYoUo=
X-Gm-Gg: AYBFou0iYLeY7LsDibxgHN39GA12qteQRqNALRpYEaMSuMFqf2ixPcQycyx0DPVRGu7
	09UHS9AqU8AX3fyuqJJQphnvK/AttwNb5jBX0u8BllLtuOtRQrNBKNuPbhIVlk+nLXwa8k0t53S
	uzHgMaQmirtKI8KTj2u7+AGc86uPMoIqmqFWxuAq8Oqwx4mwj4deC3tBNsKJlgaehT0/wln4WA8
	vxbGRyUz5BIUmiM4zHL2ATzWVDbG7kNSZNJ/Z4ifXKnM47EC3FupCqSezT087Mh2nlp871SrtJL
	BjMzMh2Ieu3t2Tb9YaiCu01Q1frbh9HZlo/P+7i5w36osOs9Rd0qplKcLYBUB0OoazMwgadExO0
	YYrjjKGx5afBk70ByHpj2jQ==
X-Received: by 2002:a05:620a:8a87:b0:93e:571e:94f0 with SMTP id af79cd13be357-940ef8f51fdmr888588985a.3.1793007206466;
        Mon, 26 Oct 2026 02:33:26 -0700 (PDT)
X-Received: by 2002:a05:620a:8a87:b0:93e:571e:94f0 with SMTP id af79cd13be357-940ef8f51fdmr888586085a.3.1793007205884;
        Mon, 26 Oct 2026 02:33:25 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd77e1e9sm297083266b.67.2026.10.26.02.33.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:33:24 -0700 (PDT)
Message-ID: <1ba88d77-aa7f-4038-bd56-fa6074207ffe@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:33:22 +0100
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
Subject: Re: [PATCH v3 06/14] drm/msm: let the kms drivers clean up a failed
 kms_init()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
 <20261024-msm-kms-destroy-fixes-v3-6-66a30120a5ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-6-66a30120a5ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sQe_F-EVLf_ixhdnva-8_a7f9iAVzQoY
X-Authority-Analysis: v=2.4 cv=UfTE26SN c=1 sm=1 tr=0 ts=6adf1e67 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=qYfICrLDSdKvHRXiKZgA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: sQe_F-EVLf_ixhdnva-8_a7f9iAVzQoY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzNyBTYWx0ZWRfX+jPY/vRvf6+2
 ZjEtOLSEz5cLqxh5YpSzIwT8+0Bgp7Pj9oJa1xzijmdlWaCqd0AW7vz4+UzI1erJn18h+bQ7oTQ
 cuOuoibHyPn0AIfTGiNMP4tMDe382LzZOE4SaIk1Gj0XAkLL7RJ+LqHER51aaAput5lBzynczmG
 BuYpnCoUTRFVd0Ur0LyfbvyCKsQRuiHOBSOB5CMQKPhE3oYUDkFe++6jNISXr5O8pmnkXMIH+Lr
 R9USrJ8BkTBt1kAMOqrYGpxR1n/YpVo0w2w0oUnxXXRhGwKcacfVm8/QjvsAeNeOcuvYCRgm/xD
 FUNowvXTUYdBJeQfGqqX8V0GRy1KhB4i8eHPL+xvW50cztrhNV6R8x2g79n03azWBT7CFl2cqyL
 ISau3+T4IBU4SGk/0qagldhTW1GkBGUNffhhwYXb7GUPrsHrvCLREelo8MN+niPvV0sw9e91UK+
 diRFCcRDx0QCR75n4IA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzNyBTYWx0ZWRfX30Apr5qQ825T
 VIXVK5QxIVNZBPsJ6/Zq0BSoeXmZ84c3xntRZ+qdCVn2ljgClKpA5TSOhtxDMl2jmfI+cp2CapQ
 6Q6kgWAol9YN1F0RRwOo9QN7QBTjBO0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260037

On 10/24/26 1:19 AM, Dmitry Baryshkov wrote:
> A failed priv->kms_init() or ->hw_init() is cleaned up by the ->destroy()
> callback, which makes ->destroy() responsible for tearing down a KMS in
> any state between "not initialised at all" and "fully initialised". The
> kernel convention is the opposite: a function which fails undoes its own
> steps, and the teardown only ever sees a fully set up object.
> 
> Let the kms drivers switch to that convention one at a time: skip
> ->destroy() after a failed kms_init() of a driver which sets
> init_unwinds, and let the drivers fold their hardware setup into
> kms_init() and drop ->hw_init(). Set up the mode config before calling
> kms_init(), so that it is already in place for the hardware setup.
> 
> While at it, tear the snapshot worker down after the KMS, in the reverse
> order of its setup. Nothing queues a snapshot until msm_drm_kms_init()
> has succeeded, so no dump can be pending when the KMS goes away.

LLM:

msm_kms_init_vm() arms the IOMMU fault handler inside kms_init, and
that handler queues dump_work, so a fault during init can queue a dump.

The patch then tears down the KMS before the snapshot worker.
kthread_destroy_worker() flushes queued work, so the pending dump would
run against a destroyed KMS. The original order, snapshot first, avoids
that. Unbind (msm_drm_kms_uninit()) keeps the original order, so the two
paths now disagree.

Konrad:

I don't think it's entirely unreasonable to get a iommu error halfway
through init

Konrad
