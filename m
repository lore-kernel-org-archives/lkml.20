Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349360;
	b=UJNORwgfHvwqbRvO0HxVKED9cqvicyjzEW7IbPeahx+6Wr0FsZP8iQqs8QmuFIObEQ1I
	 Uc7M3ADADwdch0UBSdH8iQ0pj2WPsPed7xw4SeWWIPOzqYBCSUklDJVeotYY68gS/wWy+
	 7NoAdFZBPEmBxrfPPUwHWwxCRMDkrfOeGc0ivc5Gw4HgCzibGSfguxnJ3uCfL1L2vpK4u
	 L4w64kktonSwQGQ0fs/39wa8TTB9n+JcJmqAFEyuUh40fq0yd1fooxyQMALF88Xb2jpIZ
	 PuRe+RYy+hQ9u8f/sAXlI9RMiwgTxeim9jEYYUYPw6wXJksVp+jr2pcdY8VOlrihtKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349360;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6J7KmcYhp8MGRmEKR/ajQMu5IWDgP6+2nxjcEbK+xzU=;
	b=0lj3s/6o6PIo147+x47oNqlZy59XpMIAocqU655NOHrbAyuVa/rEMdojIw/NqptIqvN6
	 L2xtBUdktTbgDFcnYwYkdtUYQEnRNrWAyTugGtci9JIfFu682xosb9jygIP3Yqi4onHsD
	 iS9KTyud5aRzMq47nGHxNYc5/0Yakgb7R+WvBEPb0kNadNkEfiuUtoNMBmQdCchHyUnfp
	 NMguPAaPQAOvj9rfdORYcXOAx3ZKYGy9OLU2x5W31aD8v5p8A3w+/6m/Zl18NiVqmJOYm
	 yQKsx5PowBi5/HkngdrkjBWsdfWnW5dgLQwF0dHyiMdWorYtZxji58+Q46WGGE8aTTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MH7riAKZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P4epssvy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0728B606A330
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:35:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0728B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MH7riAKZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P4epssvy
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8FlgI2736556
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6J7KmcYhp8MGRmEKR/ajQMu5IWDgP6+2nxjcEbK+xzU=; b=MH7riAKZSiGO2jEj
	XWVxCXJWjvOyDK46m8K/q/ILwUqX9k6gFaLTogXB/2J8GB79vCfCdnesV59nhls9
	L9MrX8TwCcYGAWDMrRXRsrgUfOwHKeWZmyRLd1Aj6JLLzVKD6r2FEMnQdiOpiCu7
	vYTQRXh5WHeDpg0AYvMZM0PVeyb/YKAE2EFzohUHHmLqpGZpYW+xj2WNsZElYPLG
	h/fthvX3S0HPUPOpNSdJJwT3Yyz+ULZaz61AHXj+u6HBZjnDm1ZdhhYCHQ55QoZv
	QB3BjlYVJQo5Q6nAmiL2N9lDmngunpWR+Gl1zbaccZ2A2qdYXzyoZVSMfLX7NSC7
	ge7BHg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qj0xj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:35:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e629c7b16so9567385a.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793349358; x=1793954158; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6J7KmcYhp8MGRmEKR/ajQMu5IWDgP6+2nxjcEbK+xzU=;
        b=P4epssvyyzCR9tJiEHdnrxI3QZVRIjWS1ca+ICOewbnC7lr9AyP2KWRH1GEM7I33K2
         lsmG4Z8bIn/IDDWTLh72ZjAcn+fT0wLaIws7A+G0GSpii8fjRWvOa25Rg8lJj5bBjmce
         wTA/bQbjTmwgQCbj72fRXtKX5TucOrZ16HYqNLIAg8JT0DppO+HbcW6mrVmzf/UCNAiV
         yjMRXi+pGSm9sA6oFYipSXetlUPw/WnDcE37ZTjlhKgW9HBL/gf5yYiYeVH8AAs+wONf
         Pa+huOUVpX22s8CfOhyDxqD+vcW9ARvvvNQ0pPVlr9jbozGtEaib7cSBTp3mp5FrCag/
         YBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349358; x=1793954158;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6J7KmcYhp8MGRmEKR/ajQMu5IWDgP6+2nxjcEbK+xzU=;
        b=saBHVNt35FV6AkC5Aw+BFoMGHmfriUJTxR9W9x73AG75j5KgqqL5DRo5ZzqAtvN5AJ
         QBWZea3m9F750UzJQnh2X4MovL/LxwWa5AlRYaNlyDJbJFTnSu8qY+yvInILsEVRbsxS
         6C+8Pjz/V5Qe0akLIyo90U72X6yd2fOpg+dRTcmM8qNfKbXo3gGp4IN+GCGKromTRfGW
         VzZwk4G8nM7ookAbQbc4cnjLzsZyv7c3Yv/D4L2OMtFvXF6aegVDt3CmjQ/ZlmqLVbTJ
         56XuC99ZzeCRODgGbgVYF/10J/lnS188VtmdGlD5kIR1cxfssxvwxLY8TrWeYLdcHW0e
         yXOg==
X-Forwarded-Encrypted: i=1; AKwUvBwOSm0a1RsYgcwJdGB1h2DY6TAFhX7VMzUMaiFPMfQWwZdl0teAmqDC4qDP7Nt9DqXbz/NpPt7h+I69JTM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlgSB37GyZmjwmIupW+i7M94wkeiEY1EuVl3Gc99JrR8O+k/+8
	j7L0Drn52ewFkjX3PDfVSq7G5MwKcQjG3XsV1xQXjYsVCpnHMObXdTWRrCdog/Xk/5NpXdGdUOT
	LAQPemIB4H3mV2ClRTWmx5vfdQvfs37zdMwXGJe2JiiGzdonzr/0pvRI0wm845mMK3Q0=
X-Gm-Gg: AYBFou05zQFneT0kDc0dkcfwCZ07B6wZhnLPDyg+64IAUCL0PbOVJ9xCOQoG1KeAdKA
	hBR4utYNWKUzYU8btUkvg6LHdcLEXXsKQWN47fXn+9tK0djbljUdWRdxIJpQN29nXSKNzvvyYZB
	Qzyth4EdRCFNCWsm6gSc7uiW3mg/eZ28/BquX9CsTfzRrBsVF8fQVHvqCW8ovxahiNGQATNU3s7
	EmVIYwd0W44PWX9GfZU29pcNHFQpLfv3+pjswrWZZ0v3D/2Je1dPu/NRtbn+VIg+TLs/vGPvdV0
	84NUwEEw9i38E1tAwxDS0D8uz/8MzI0qvCzxRHYmxhBtJoyM08+xqWqPoZWmcAEW03nPIIipyDx
	WbZRvKIXDVc4Sofo4v8EBkflEgVWilNTFg3gPbZIVzBSivgp7hjm8jTPqauWJjABUEWZdY1k=
X-Received: by 2002:a05:620a:870a:20b0:944:127d:f192 with SMTP id af79cd13be357-9442179be1fmr261457685a.5.1793349358211;
        Fri, 30 Oct 2026 01:35:58 -0700 (PDT)
X-Received: by 2002:a05:620a:870a:20b0:944:127d:f192 with SMTP id af79cd13be357-9442179be1fmr261455385a.5.1793349357748;
        Fri, 30 Oct 2026 01:35:57 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe0f504sm39083766b.36.2026.10.30.01.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 01:35:56 -0700 (PDT)
Message-ID: <dc2c51b8-41cc-4abd-b52f-ef2072593d1e@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 09:35:55 +0100
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
Subject: Re: [PATCH 2/2] iommu/msm: Use identity domain for GPU and display
To: Rob Clark <robin.clark@oss.qualcomm.com>, iommu@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        open list <linux-kernel@vger.kernel.org>
References: <20261029212344.346069-1-robin.clark@oss.qualcomm.com>
 <20261029212344.346069-3-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029212344.346069-3-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: k5EXBolTWz2CKnHUdRZVa0p6LMtmrxoI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX1zBdm8XHpGmm
 4jRhop0Q9PsMk3SSZD1i/FxAdw1zYmoObRUw71YwcJw/XQm6RxxowqAJQGEumIAIotkW+2x2xY7
 LTPzZo+9Ke5tHJYbSiPRr4aUJR3TCLI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfXwpDB582w1/Im
 RkB/mEj7cW7WbycwjkZMI+NtPpuoAjWDJNT1n8BFWJdLorX5GnO4yB2EN3ed8Pc4XcUK53tFP3B
 eWCRgJ/hcA2grBWrSd2sBI65Hcqa1iqkNCFBr6+t0Bt/aQizZcL7kltvBfRAQr6l72O0CRpargA
 vuAvCtZOBelDBxfTwtEsmJYK8sgrXXV0wvGj8TsKfEyOy9cONKCW5C4lDdIBcx9ZYJ0lIdcmJ8Z
 ksjOB/09Q3iIfSwk3RVZWdx6hev+xovacc7CFx0wY/l+hqkbIoA72RS5FigqthOH005ZUFoipUb
 CLs70KQ5dXpM+w2zKWFrxQetfIIa87H/YoiivH/1dY+imfyJxplTpKOCfnMxnp0/s7S4aVdnlMD
 4ZNOumjBNkFBpOEUelt1TykdfBuaxQ/jKDjIl7WvBlDqrXiR4O6QhVEP+vuZU6SvMY79fMrn7ip
 DaAfsj8jRDkMThMTy9g==
X-Proofpoint-ORIG-GUID: k5EXBolTWz2CKnHUdRZVa0p6LMtmrxoI
X-Authority-Analysis: v=2.4 cv=TpVzFzXh c=1 sm=1 tr=0 ts=6ae456ee cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=nPYanoZRiyYWTCGofB4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300034

On 10/29/26 10:23 PM, Rob Clark wrote:
> Similar to commit 0e764a01015d ("iommu/arm-smmu: Allow client devices to
> select direct mapping") for arm-smmu-qcom, match GPU and display compat
> strings to pick identity domain time.
> 
> The drm/msm driver attaches it's own domain, which it manages directly,
> so we don't want an iommu managed domain interfering.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
