Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F68638C438
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466611; cv=none; b=swIWVefd7jVQ8BXTu+HqMTiUGQJCIarpzA49B4SrVaAKMZIGpT9uFNs8tl0Ds3m4vjfYKesGdb07gfFyhIvMGVFMX5ADxxX1oggWOfzYran7AtX+67kXz2dChUWaN9Eddo2dVZAvlJ4Vh94iRIg33wgmSLpj11rZliKtTe7jg14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466611; c=relaxed/simple;
	bh=DqLz3CVaOkJKMiv6I814QjTMGepAW3+QG/w9cl7YcQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WY/pLUKXjMWz2Uc2TXHtNTtsyX53Rc4/VurIOBdCTgwfjUOpRJG7PoXNGtF9Cyq0UMaVuDNh04jQIN/iuRK8Pz5NG0MTF6dcPmDcxu3jBP6pzvH/0TA6e/OtiYq6GjVOnqlMm/jvEFYhcqi2blppGt8GGGKvsSy623nBqXNKzeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IDDzLiDV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DsPyRTa3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IDDzLiDV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DsPyRTa3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hCPA3415896
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=G1ad/3WCjsCTzE/GiZL105ER
	EoUAK6knU7/Mo7EDyCk=; b=IDDzLiDVBmRm8Tssh4tUSuuK1mlIUuqHqJjXLZ7g
	jHsIk9KOW/CtEFwwnOgIKL34dxsoYBwjS8Z4+Dm7brjSee2/IWHSYhX9Laxbk0NH
	wrB3+4V8jYIM3AVzydU7/LRH5sbaBBj7tD3WihJTydeBmKTEvLOderWTbg7Fsa2D
	DqIzlcQwkwETUR/Vhu2hMFXldGyYfGjnZtHoj/esumCzAbwp4XWVecoKjBFgCYsU
	Cuy2HG+jV5kkvOV68bQA4psDIhCH0vBJJIhzjh/za68IPTrS7W1zF6QjEIoKGLvA
	pxC25FTFqjeg6wgjrpP9Y5G5syvxrV4OeNJhSnpNlMthlA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3hc04pm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:03:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so888518185a.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789466608; x=1790071408; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G1ad/3WCjsCTzE/GiZL105EREoUAK6knU7/Mo7EDyCk=;
        b=DsPyRTa3Z5VAg8DAHo5drSONA4XVjTi2EblxCXmBUYV/QInEL3ApV9zGazWEfnHIQz
         GPWbsQEq9Zb6Ims2VXFM2NyO7muBw9GM22OegZBq1mZCIqj9AGj1PpFX85Fzal17vGZs
         3v2BVVHqyMZSCAw6b8qfNiiYBEBQmosBMuEiogWYQXkvu5bVAevms985rUCIAWmoErh8
         VfKzXfNUI2aBdMYG4bzo623HElB+0WY/ZRdeakhRFNofIwt1TskO05pMx9JftJ/Nngcy
         1ayEpG8PUMOPJhHQ2jaQEmNcmMft4dyIsqZiS8jsMEMIyj0GjsHFWxHSynO/jBJb/VNd
         inrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789466608; x=1790071408;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G1ad/3WCjsCTzE/GiZL105EREoUAK6knU7/Mo7EDyCk=;
        b=Zdq7SZQABvVkqHodvvSSTuYPIffC6DcYTBnkevQXmAdEHr/+AF/taaxIS6RPDYJQ3o
         uD+Q+61RJBOm+NPc0PN4hXJ5g29sAlZYriZV8UY11WX8TaF2yDU4nbUvb6FOzXkzFyvN
         FqFlnFDUJbLPYSeFSpNX93dd6JuynHnxKcmFtEvZh6nSrjsVLkyXZjaZZy3fm3yUqjXJ
         GBkHy/qw5RRigjpMD5UPmFXdZ9yqa5h59NPt2QoVlvffAeohRrmqa5j2KuF1XUE8UdL7
         VInjSMqe1r+uUUU+9tLla7Xxwk2TelMomQZQxdQwTApd2c8NVe9kh7nsPgPU0NLJNPPG
         gtyg==
X-Forwarded-Encrypted: i=1; AKwUvBy04j6NtfS4ZK8XpuQXPqpkQ3AkL0pSJV7/QGrX5oLBhzFoiFuQrYNIGHBpMK7f5APWsh7aL/RCHhpOD0U=@vger.kernel.org
X-Gm-Message-State: AFuF++m/ceDKffCgzGLf3iZz1B5I8lH+r53r0tfwGwq3jzJFUuu+pncN
	BckpOxg4PfXkeLaLVN+E+zvPv9M4yGCxFPIEQTamVmM0tYm9hZrBLyu+/x+dQxvRgi5LLhaA7MX
	1v6+CsT9t2nOgzg3a+ddx0PR1WpISYTuc38TZXPvkD58jfKtE7n9LJAA9UhiF2xvnDMo=
X-Gm-Gg: AYBFou3HnOAJrvPd8hJ3fkpQ4UZaowbNROuwdtBNOsq+sUC/+6HmIvjEHtuakDIIt6m
	yFqcSk4LjbNfydF8/EleTET2KvjE4hfCHkxIDRFOvuS03xpTRnjjf5bl0pDtye7srQEl30gjOms
	7QcCgWNLlmwm85PiOME7pmRZYwf1Iy0jzvh7OIx/LKwm9+xgYCTjXoOMwKJO6VDX1AzmsjyXCDQ
	bzNVwqvOni200LBFvvQCmv00hAIVoykp78A6L6BQXoMU3uVa2vY711LlbiK01+tLlbBZgOacuHe
	vIiBpSvzk7viVZsmzy+gcwAg2q6P5u1xdsEK19u8WnNXE9BU6z7nHmfzMXkHD/o0Q5dp3C+K6LU
	ubVsnI58FQ9N6ETs=
X-Received: by 2002:a05:620a:170b:b0:939:fbf8:b5c8 with SMTP id af79cd13be357-93a297f933dmr966329185a.13.1789466608180;
        Tue, 15 Sep 2026 03:03:28 -0700 (PDT)
X-Received: by 2002:a05:620a:170b:b0:939:fbf8:b5c8 with SMTP id af79cd13be357-93a297f933dmr966281185a.13.1789466602867;
        Tue, 15 Sep 2026 03:03:22 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d69555csm59453865e9.4.2026.09.15.03.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:03:21 -0700 (PDT)
Date: Tue, 15 Sep 2026 13:03:20 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Oleg Keri <okerixx@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add the
 camera privacy switch
Message-ID: <6gf4tswitbxhqatwrcdzve3rv3v6boxljnk4hjptwc5js2qzo4@gr2i4zbcehq7>
References: <20260914094201.14009-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914094201.14009-1-okerixx@gmail.com>
X-Proofpoint-ORIG-GUID: 1rrEumlxoAbk1rwDwqvcD2YDTJms8qvx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0NCBTYWx0ZWRfX3ZDKbkWN5x8J
 kgCijBVBQT18gN7ruUiFKuhE758u2kZL6RoaMSioaSoDB+ZM7yK0n9/7ef4OgWXaHzWNFpH7HQO
 ljfepu7XCh1Pwp8x2qeqj08RIiTsveY=
X-Authority-Analysis: v=2.4 cv=dcUVTnXe c=1 sm=1 tr=0 ts=6aa917f1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=FRa0POnFDbIyqkxKNbEA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0NCBTYWx0ZWRfXwtW+Af+MJgV0
 /frb7Knjj93OION08c3EptMPJo3tQ8t7Sk+9i/w77MQQ4MwEzFQMJr0e12sL2rvT9pX0TycIrVe
 YDPSdj27IcZd1kIRW/uttIgTOYNvJgzxUWuB30PTgCJJu2vloDr1D3ONkdX946dDG0Nax3E9WxG
 HkbkfcNoUtxF24MPCG9Cz2hidk7/yY/L/l0WPs7zmdMRVSwlNXGT5UJrUH8eK5LM1v5Q8Dlp87h
 1UTZ++HZEDOoIBRL9MEjunr6DXYlux8TuySTIDtlfK9k8yxJOx5u6NZOSRRPSqqgHPZ1QUg3Kse
 lHO4sqq9I89JNfWb+QvG3vPmDAexTWg0Stl8UJp74dY9Ts2+9pdsSdTAy+47rpu6wVqQAJi0h6P
 x0biTfnbcpAP65Pn6UreeNf6eLdBSg15Kl9lyzf8Ut6wdz3HCu/cy4I0H+uJucOArhcIfMZdiY3
 5vnt4jddCYPgIH4YM3Q==
X-Proofpoint-GUID: 1rrEumlxoAbk1rwDwqvcD2YDTJms8qvx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150144

On 26-09-14 11:42:01, Oleg Keri wrote:
> The laptop has a camera privacy switch on the side of the top case - a
> slider, not a mechanical cover over the lens, and it does nothing to the
> camera itself. TLMM gpio99 follows its position: high with the switch
> open, low with it engaged. Describe it as a gpio-keys switch so userspace
> can act on it.
> 
> SW_CAMERA_LENS_COVER is the only switch code the input layer has for a
> camera privacy state, and it is what the Lenovo WMI camera driver and
> Dell's privacy driver report for the same kind of electronic switch on
> x86 machines, so use it here as well despite the name.
> 
> The embedded controller also raises event 0x29 whenever the switch
> moves, which makes it tempting to report it from the EC driver instead.
> That would be the wrong layer: the pin is a plain level that tracks the
> slider position and needs no EC transaction to read, and the EC event
> carries nothing the pin does not already say.
> 
> Signed-off-by: Oleg Keri <okerixx@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
