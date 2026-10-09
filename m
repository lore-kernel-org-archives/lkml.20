Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6A54F7CB6
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 18:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791569948; cv=none; b=b8rPPghaxdale/y07fe3wlrnuNLXFmlO7uH7cD0GVapwGry/WvcXvNuTtS4Ql6yOZeDSvVd8risPm1L6QQDMPhKQYAUaItfKCs7NVfMZYKhy1zi4NAdKoLZLxokxKtgP07w0qrMF9mr8qJNXFGBRqTo/psmDFJax6lvOISYirwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791569948; c=relaxed/simple;
	bh=Qvh+KR0Q5Jux2MATytmPh5+5juJq60zRMnUq4HRcvZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ukvlFpeZLomK88WwvtDNzRvW6WTVvFwgcUe18njMRAZZTBfwp21GlPnFiNbe+QsPnJZjFMV4OkGI135unn7rnau/U00GKPvSMQqaw86ZLg+8E2Ac5FrVmmuSxTeWQ0voseKj6DvJK2G/3HT1D5KVqbB3IcXiusAvWmK3awgbpxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BkiQIo85; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e/8b12U6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BkiQIo85";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e/8b12U6"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699HZfK81016267
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 18:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fX8nXEvsmi0VscUpFMXtxoP2
	QzTES/GfQKJn9nHIr60=; b=BkiQIo857Mtx31sgPxo3u+kI528WAZvTZHR41Nya
	nSVYBOCaGXKRFJuk1XvQK9UuTh/FjXnT1X04F619pZMaeJikUG5KtjUgD5wEdcfD
	Pf3OdvI+cc7HuI2/dQXn8Zefc3dntvMFaWT9wB/f+xVJH3hHMJXuZk86my3OKMSE
	MxZWVrohSTGIlX8PZi15gXXygmENk9NWY4XxZ49pUoC9c9LjcoSutAB2d8v3FM5A
	vzWKxe5lI4U8yCz0hf2lp8aNl0J0K9s9/E3ZqG0lkA/L2NOvLndRbxZn8lS0Gdj3
	BwUC9oa2FjaL9PuPBG5OS409mGVYJHrQdTCNXmokQLASZA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t885b7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 18:19:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ce7a85f04so1369566585a.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 11:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791569945; x=1792174745; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fX8nXEvsmi0VscUpFMXtxoP2QzTES/GfQKJn9nHIr60=;
        b=e/8b12U6lfS1wUiLUgG921UShCw+/nVT+aMyYVSxYL6+fkB6C/AquJk+RIuxjBZrYy
         Bkgp6H0BcDXJTCduudbI7PBZjWBKhNY0vXgkuLhPrEkNDfOoczNig8lnQqjaXjWCR8l8
         uqdbJie4ZZC0Cw8RvjoudRFL2zQnGLuh3FPgkG4gJBEF8vyRW1fEp42nVK1QCbFU4aOp
         Wcc7wtuCDshBca6pTgsSZ98/ulurA6c8YFlqmyBJfDOhMht1UnCDErq1qRWCi+ZldR0X
         e1RAYmQbCpTm/mMKWwY35BpljrqSJpBCP/DLXN5vahldsf9Ywxma689ML0L4nBuuDi4L
         GrZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791569945; x=1792174745;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fX8nXEvsmi0VscUpFMXtxoP2QzTES/GfQKJn9nHIr60=;
        b=f0BgzXLKDeOCZEp1QCa+MmXM8Nx2atTJuGIMN3bC4gxrIRUL0I0waXZ/KXdKp93NVJ
         2VGEOvnz0FjeLCZVMvfH9rNSmnNtfN+ZCLH+xrfjKmb4BvvmuD2yKh+4biQz+HsR+O7X
         +bCQLMfUbOH0O2ii7cxACStVmWrFmMKGXqcMZRQyE0dIwqrCakaM+EcseBqsmzLT4dN7
         Oj21LDUvQyEdDKm5fiZ4qnOuH2ASUdtwGFdxEhcZ5+1bp0ZP1VzzemPSA8Tn0yRT1RWk
         nQSwjsS/SHpSvyX1UrY3E96V9k/jUT+0QwUHRdbY4aH91mT4Zwav1Uof+4Dzz3oTxVg0
         H5eQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXTeQR1sTiP9fkw4VxD9Fspan3XRIlCDqNeax4UhhurunkjsAI1rQJthFcdobl92he77qk1Ljw0XQ0Hbc=@vger.kernel.org
X-Gm-Message-State: AFuF++ncK8dXUhiEJYJ6v6X3A7hALKfTMrM4/i8cf31TFARSk42J7x4H
	PDMNVx60ucv5TcxYaZ5mc6BdQclb6QozRmPbTJah3SjN4fY2rF4zkU6HS3aWXHT/5bIuBMnf+t2
	B+ZSkzPg2Aub1l3r16ckfvGaB3dBfZyNA28+0qwagIBKF1j/WFoRpuRG/4lQOi+IGmcI=
X-Gm-Gg: AYBFou21kGtB5R9mBuFtRNPgCOw4lSWvkMG1Jv97V4C44NXf6tcu3MGH6VpBwsjvnqE
	RXJZnoT9QGHqUT3EUx0VQuthcbuHhf0Gl9Iw1aWmOS7LperSeEUdBxm4PjkQw5nsB5h3f66NjOM
	FsD8R7bfKNNJpxgsZ6Pmk6YaZXshAtNlYD/F6lSkEvs2Znm6xO6E5KHNH7SdiyA0lWQk/1ZON+K
	cDdx4NrA2wviOvjxSRo8/BLVSBid/0zp4SIS9D2Hq3wcLp8NSUA/bZAUfP38OMyIHUbLDBR4iF+
	wiYgvHzBIv+VukPFGxfsji+lNE9hXoGEaRth2CkwHdMqDaWQ+Vmc/FoavcUggxmHXAiy3DqoMz3
	LZbiyGoHhuVSDDWk=
X-Received: by 2002:a05:620a:1725:b0:93e:94f2:adaa with SMTP id af79cd13be357-93ebd1ff9e0mr444531085a.32.1791569944492;
        Fri, 09 Oct 2026 11:19:04 -0700 (PDT)
X-Received: by 2002:a05:620a:1725:b0:93e:94f2:adaa with SMTP id af79cd13be357-93ebd1ff9e0mr444522385a.32.1791569943753;
        Fri, 09 Oct 2026 11:19:03 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9abd57fsm4937405f8f.37.2026.10.09.11.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:19:03 -0700 (PDT)
Date: Fri, 9 Oct 2026 21:19:01 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] soc: qcom: llcc: Add LLCC configuration for IPQ9650
Message-ID: <3v4w6edwduuayl7wkq2h44iikyx5mtwxer6ihuhsoe3t25rpow@d57gkwe2najp>
References: <20261009-ipq9650_llcc-v1-0-572e40b18522@oss.qualcomm.com>
 <20261009-ipq9650_llcc-v1-2-572e40b18522@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-ipq9650_llcc-v1-2-572e40b18522@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: MjbJSBmHT7XgqJ2j-1TlCmjf23QP7vDI
X-Proofpoint-GUID: MjbJSBmHT7XgqJ2j-1TlCmjf23QP7vDI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA3MiBTYWx0ZWRfX/bg85yhn+kE1
 FCGwxvTbnu5BUpGMaDurqwMgFItL6OYt2JblK3ntYF/ijRndXlFwWwzRm//Do9fSNiGifY7Pkey
 9E02dIF+8JaJtFDBQFwE7gk1sgH3tQc=
X-Authority-Analysis: v=2.4 cv=JuNkP84C c=1 sm=1 tr=0 ts=6ac93019 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=DNjmE0xhf9-nCuXF3MAA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA3MiBTYWx0ZWRfX2r2C+R34/8If
 aaCu/Rf4MdNFRlV0oW+mwNbvciMMW9WgR7jx5W1d6N6OCyrfEOaOUqf1E2hDxcPWOlzok2BRGcr
 yjQMBMIRX76VVUZTb0y6ETiIRiD37MT5mIF9knMu2dWsMaog/FCTShxZNouiHxTkR2aYwId5xw7
 LB/4BioQqyHmnrzPxC9o14vbTcoZ0+krA7e1fI+9cSw0uXs7+NMtCMLNiErmm5JNy3qr/tk7UeT
 sOldM5x6aCjAACCMxgx0jcZMPELPDXDRE17XETN+Q+t+2BK+cgGJCSv9E2lDoivE2N9tKN/CLhg
 fKoe0Hje10FugSZvnokEC0KA6q2/YipaqzB5Fum/wakaueyTqtwewCrfzup2Bn37+q7hQ+rps3G
 o3jrIZYNgpBavXSvCP/LcjV4h6GE+Hub9XraQRYpjSYNEZl5zvdYn9h2yNMk0emd8rFC7/jmezc
 7eCpOUtyjeImCPsI6NA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610090072

On 26-10-09 19:20:32, Kathiravan Thirumoorthy wrote:
> Add the system cache table and configuration for IPQ9650. The LLCC
> hardware version in IPQ9650 is v7.1, but similar to IPQ5424, there is
> no broadcast region since there is only one LLCC instance.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
