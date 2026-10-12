Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FE149CF59
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819092; cv=none; b=JtCVPMm1HgXi9QsX1IQ3sd6YwwqonW1/z+uojI/DEQCPO5LKF2EJigA8ssszbrvilKNfvjDY3X+/ixnpTCT+o2QTQIkGZqwmv9AtEZi4LK380D4bFqd7PsqxPkhY0G5E94UAoDsTVbzA9ZU7pZRboFkK8zzUisfoj+n9xJIllPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819092; c=relaxed/simple;
	bh=wzwLMct+jxWDcRWFsjfId4DR9r8u7mdmPxs/TknAVIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W1LizaMlNjRTlJ90Gr6syxT8SAxEKn3Co/9hqmGDosQp85ZO2Kepe89JElA7wQfo/w7BpYqGO78RUWCtile4u+m6ucJCIRG03lWjW51fnbZT076D1gGhJkF9DFn/X1s2DE3V8lovn+VzOAAzF5PNRFOiNX86ry089mTvTDZDEJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cCi8Tsa0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jaz7Bbgl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cCi8Tsa0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jaz7Bbgl"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0SX21686704
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FYYo+57QCxwomqCIyB2lSJhXrYPRM7Y/KGfOAmJd5GA=; b=cCi8Tsa0igx6Mba9
	NNSG0X66Wkvx/xuk3B+WPguet89ME/MPmmA1Iu4YI1sfeIWKwGWzme3lbtF2murb
	d43etTsHwsFunGUxKRKYzu/Xz6mDRgt+fJOaHyLftzfyvZhUxBAXf1jqVSTOs6Qt
	xK7xBA7z7obboYI54hlwW6pZXCzXJNbTfafbkZHGjo9BxFlXWdpF93rlDD4mz3hR
	jr84kALGmJBAA6dMD5TyjfztZ1Lt2HTDJOYzzu2bSuZdY30sftLnmxa6D/wCHabi
	WneSMI9hYvP+OqdM8bWzjB+VGocgX/NXjnmrOsJ5w1s8kmvUlyD1rXyNIYuOVAb7
	lQ3y5w==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc1g8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:31:29 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cb9f12d351so29943137.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791819089; x=1792423889; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FYYo+57QCxwomqCIyB2lSJhXrYPRM7Y/KGfOAmJd5GA=;
        b=jaz7BbglyIHpUNyCJ/7rJCoSpOU9kiCk8IdYxRPsL2HbdGfZ5WjU7pSIM72cwXRmW1
         IBfQ+nfXXlazPs7DuJWAvbeqHMK4MpEiDuMZKOOHsGxpSh0gARjHKqXGqeakYW6lkITu
         94MazKRW2a8+06an+ur+BKe9nedlsoQQo+FheWK37SzMowFsGyeUgtUIRRuRF7zoZDGl
         v70bnbiL1Oi06WV2QTQ25uUC2glFdOdx2krPE2kX5gHTQ7cb6S8k5umHdIIQyRElAn6S
         WqIxiJgFkfKjeDN3MSbKcl+LpbMnDIIZq2UyDWIO/L6bm0ROAuS69S6w0N7Oy6xGjqUZ
         Eq1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819089; x=1792423889;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FYYo+57QCxwomqCIyB2lSJhXrYPRM7Y/KGfOAmJd5GA=;
        b=VQ60C76aZg0SWDH8B0Fe08DCRBlYfu8KAqxLHSVq5XhVW74OIP5SVi4Xwbv1TxrfY2
         ODh791l5PuDi7P0CbL6tnItJUiRlTerotEqdZOC+lfjnpvOuJC0i0i8vjQt4GbGlRRys
         jK7SVuFaT4yzxdjAgiDC1BPzVYkhvkCQausnIH/6WJ2GNxVSyNEEtzWEwM0A6YLB3zyI
         fut0HnMKcYgQvpDHMV5FYS9h/67hAPMJDSORJ0vuWmZwoQd+Azuo5vXqc8RX85vIcbUp
         mPEvkzRXHc12e2CDyxH3y+mOR3/vDi9xghpolrZfwklnUklDqzXE+hfolzHfLIkTh8/a
         l5Fw==
X-Forwarded-Encrypted: i=1; AKwUvBwksorZCEMUHo++OwP1vL9njFfLDvD1bw58mAYzw8q+JokSRC+w48KpcW/D4/48CCdPq9Mq7zTiqTXSQk0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLufva6GDI9sKAzTSTxqbRmtHA2N5rrv9cNTdGUsfgCUfgCh5sK
	NrJZxQv4/9FvyWWDFMh4of3n4l6AF/jc1p84msgA6fXOZGhAOVn/qwYgaIPn+kn5pjSg+hx27j4
	Xu6ULGLPsUwitrbkCTwbDuPVUm0kGk08kQsCtXWhx89dsNl3jKxtDnTEOW3cRUqX/5Is=
X-Gm-Gg: AYBFou01ZE5UKxME685FKEZevR3rulyxzEzPYs3Q5kimOfXEwYqe9doKUuZKm+DZ+bt
	vijkk/bQC5vgkAWv4uZ7FlxPID10Oz0DMxVsOEMQw+hPPK7UQbseIDJwmUNto5WiCaOWdQxZgHt
	/v5Poj+BR6WLSv6n28e0SUGTD1NmT/vm51pFYY8ioKwf0C7PFvOXTiBLoxBY2UdzLSlGOvlJnOL
	HNCRTwbw7vZqUBQMS15p9buzM4q144QP0Fq5rm60R0hEwKbgNTDbIznZsdYY+v6UAAzexobRGYX
	YIVMg2ffINOKbZVCK6eM2X2YvSwZtLF+GjfuAh3uzymZljNCeEA3USPfEov6r+TNTRhXDvoG64M
	vRZgZGVtxMVBfC5I4tFvU8g==
X-Received: by 2002:a05:6122:6990:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5e92e3c09b0mr2232317e0c.2.1791819088543;
        Mon, 12 Oct 2026 08:31:28 -0700 (PDT)
X-Received: by 2002:a05:6122:6990:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5e92e3c09b0mr2232246e0c.2.1791819088011;
        Mon, 12 Oct 2026 08:31:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34001fbda1sm203669366b.66.2026.10.12.08.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:31:27 -0700 (PDT)
Message-ID: <2e4f695e-5242-48e7-86f8-1438a0604e0e@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:31:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 28/38] arm: dts: qcom: msm8660: Remove space inside array
 property
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <45014dc590b7a704673610a5059a0e6e572a27c8.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <45014dc590b7a704673610a5059a0e6e572a27c8.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX5lSEfqU0WJnJ
 sztCeL/BE5Yi7pENcBqO7awVus5WbgglNV1MkHsah+eHYDs7LMrJzRIwlbUUtxq4sqAalYFSPJM
 HeZdLiXWPHydobyKxoSetizLxHgqGuY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXxJD7LR/6VKop
 rJ9d7OYWOY7b/RFrfmD6pCCsc45+FQfWluOdr+g3HdCZBbX+CzNf+H2OZqH3usOogjA2QLTxs3V
 2/F2dTg9ij4lZNvPC+thcDtg1LVwt22/fS2QpTQxVDl2JAv4P4c6740UMSxkIhSpKw68mFUFmeF
 QS4oXO2DJF0ROVT77ReYIYWFRtHRvmyo8UWHwke3QeQSfBmN+UK1xmLgL0aQFceQRHfC67D3ddr
 ciQxZu1V7peml9J2RjAlDlm3dkXsTRJG2VIW6x04Z38J2BOcT8S55uO+vBFUB1r4yEHBo3IA+Nu
 ohmbKrAGRrXRe1cGjpngfkOaIk37wFb37WUvqt3yjVB5GKByMuYnTOJ1E7REtVyYSj76+6DAO2u
 JN43e4oBpJ8dChE1LluIMS7KlB6+P+2xc5kPMKPybAggy0/LO2/vvHgOo00l4zaLPHl/hpKNxO+
 2KZOX+x2NtPpcRFIRqw==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6accfd51 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=iLvDT8BEKJY-rmnIixsA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: Ut5A_J9MAzQSkewgXC3G2gdjBoihjR-j
X-Proofpoint-GUID: Ut5A_J9MAzQSkewgXC3G2gdjBoihjR-j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There shouldn't be spaces at the beginning and end of an property array.
> Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
