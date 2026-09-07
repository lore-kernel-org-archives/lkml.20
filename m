Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696274D2ED9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787902; cv=none; b=Klev+R3UbWdEUhlRXLyedBGR0mHAcko1iSGrnxWMO3UQfew03OGyWmqV9Hyo4lx0uY0vEGFzoGe/3oDVnbUubD5ul2p919ihIEIETOyAM6KlH2rBowvetuOmDgD95D+f/EQTIGVcm41qtc5NPMLRA64nuiQwhOWeul7s1PMmMAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787902; c=relaxed/simple;
	bh=8ZGAGHOr7NVN0KR3XdeIRqRmKRqrF5dgUOgIMwdgrbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YQsrq3Aii+M+mfPblGrQSRFFp5C4AdAkWg9MxvrEC/WtLtLBC5Vd6lnQkshJQHOoVSvIbaA8cqfSnWmKXaEyDMfING8hiMKPyL1CXwBGqgNDEnkL5okmUQHnK/rqtuWtijpORt5uhC7z9EnI8GMFOzGCL7zstYb6c9wHitTO+G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cE0ww8yr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dHFMzpqi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cE0ww8yr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dHFMzpqi"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AvJcp496162
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 13:31:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3kkNuPRvUTyM+QmSb6oELf+9
	QvK3eykU5arY9ibysLY=; b=cE0ww8yrah27Sy5bFMJJ85wijy/lNSSTsb2q731+
	wvxtVR1xfQzd2TFBxLD8XRxIujzFD329MsQS2N14EbaFalOozGYaaGqr3Xe0G0Xf
	QOlqqBMOxdoHo0RKmF/U81n3jZD8PA+raWYfj9pPQySYsWYNA6J+BouhHEH2PrHx
	HYx4ZMXpL1j3c8Bv9DXNSveTaD8Hmuo+3MNtb4YValJ0AlWF9MFZMOGh+N8fI44L
	lcmLKfIOF3jGivuHgOYlvMxCQlW38PRFex1FprNSJ4dVGwq3lExaLflnfzOwSQdF
	m3xNbsa+ToXqq1v8Khtkn8rY3ANdnYpYSi3AOeRL/OYR2g==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghuyk8gy9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:31:40 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7800607543dso3148930137.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788787899; x=1789392699; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3kkNuPRvUTyM+QmSb6oELf+9QvK3eykU5arY9ibysLY=;
        b=dHFMzpqiJD5zzL4IEgeM93W7GuqPWhxrP97/gWXKdujdNd5dsHDl9F6l8AFOergRZ/
         a+6mf2D2k7pkG8WHf8Opz9N0qqb+eV0ZrLsUkaiSXiWTdNJEd6dCyjjBzpQT9AIN4Jab
         95uxIvFphd+6alHDz/yEaOtIZi7zeB1syzGOe25mWgB2FPR0b+DZIFUf0faflqfnfuVQ
         c74EeHnviS/0Z6tJm3m4qo04OFPFCkV6WqClLuK1ER4OaL5va7u4arpPcfgKttP85PZo
         jyUxJ5oaU4dim3CYQ+B+7TgoSMuC/QOZCksh9VArJZaI2WGvM//ugdnX8uMBXEtFf8kW
         CMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787899; x=1789392699;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3kkNuPRvUTyM+QmSb6oELf+9QvK3eykU5arY9ibysLY=;
        b=qoSxU5Ntsm7ArCqIRNVEEisuTAFKp3nYLZ1uF/TPIxT1LP10PpmDs8epkQ0oUah/4C
         V4TlD571pZkdHRjTecu++IhSjfgu1izfJXzrAUBoT+j+JaWjQRBAHUNnlmh8dyGC+i0e
         7LMA3bmx2KYm9uzwHLbQpHxl7QEMmAY+LNvfgudNqlK019d5uIUGJaeIppfeFKJazsdR
         I+dH9UVzS+Kq6SDfdKnak2dXjEA3eyeKmT9gEbqWn9+3rfo2xu4EHiBeMpoKCREFIu8X
         g+OqKiW5lBlhsnaNP+KziwHctpuZiiO90Uliz/a3CqXyDw+2RvXKaEdLhXBHV4KMQCzU
         +bxw==
X-Forwarded-Encrypted: i=1; AKwUvBxqfHRjQOfCJBGH2qv4Bqwch1oXfyvlCExhDIoeWbB06mP1CMPsMVjmDHvNs7qh8v9WSA7cbQh4T/bSOZ4=@vger.kernel.org
X-Gm-Message-State: AFuF++mqqhYBIeJ+WH0zuGmEBNFoxT1pTtLQNr/4BgjYxrqoZiVAsvE+
	ldDq5h7kZ3Md+tHxIZY2Ss0XA0nneDZD5zMKBecO6doMArqdW97Qk8JeXXhrK1A6HsI5dPqdmLG
	RJRTMwlk4ppxuaCZpPP+rJpM/I1oupzBGIQ7xs4rTBXkrCeUzxZ/aQ8V1EHHmKlSKsRA=
X-Gm-Gg: AYBFou0DUxXK1MOh0rohGkdd6OW0Z+bdXeeGyq10kHVLJ0C6YKlg8waQ3d2dN/K2cjm
	cjPM4k1YSt75qpBq0UK76YMxNmwgR/rtpuznLjkgFNXwBJHaBmbVJB2jlAw0zBaNeGVba5h0GZT
	W2qryTaTsondZtY3Jia21r4HzQEDSXrNSD1Mx6hAwGCtDwyHMtuUWhkSoedtVy4qg2DCWTGyDN+
	pCjyvVcwL+LVAEKIVjbfGnDs4oCe8bEz26kM7lRNjRn1/6UY9DQJVFuGLJ1bXg4UNhiP1wU9i/p
	PC1e91XU2TBv7mZQKQenn0Zrk/J/wZrxomPTMq9jzoeW2ZJC5PNN+S0YR4pZfLdxE8Cdkv7kORW
	fBxJ6obMEs+13
X-Received: by 2002:a05:6102:3a06:b0:77c:6bdc:824f with SMTP id ada2fe7eead31-78a4a90fc19mr9086704137.1.1788787899548;
        Mon, 07 Sep 2026 06:31:39 -0700 (PDT)
X-Received: by 2002:a05:6102:3a06:b0:77c:6bdc:824f with SMTP id ada2fe7eead31-78a4a90fc19mr9086644137.1.1788787899009;
        Mon, 07 Sep 2026 06:31:39 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d084d62b0sm124378275e9.2.2026.09.07.06.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:31:37 -0700 (PDT)
Date: Mon, 7 Sep 2026 16:31:36 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: shikra: Correct QCE node
 configuration
Message-ID: <iow4xf2uflvjduax55tkbhaw2r4436uqvys22u6pbm3ry2gryw@g777gu46cgin>
References: <20260907-b4-shikra_crypto_changse-v6-0-0676f61894b3@oss.qualcomm.com>
 <20260907-b4-shikra_crypto_changse-v6-2-0676f61894b3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-b4-shikra_crypto_changse-v6-2-0676f61894b3@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE1MCBTYWx0ZWRfXyDzc24AiOqhT
 q4eFXx4Dqeq4h68aGiai3uSuc3ah4ep7ZC29UywNVOv2dEP4k0PjaMTQbKE3JOgMebYJBRzz7vT
 IRd8OQAgAJ+7CsHcCdwAz1PcmWFaiI0=
X-Proofpoint-GUID: WGG-9Wloz1vp66KxVZO6Lxl-rV9DBiG8
X-Authority-Analysis: v=2.4 cv=ObSoyBTY c=1 sm=1 tr=0 ts=6a9ebcbc cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=mSLAci9PSNYu4dxlomoA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: WGG-9Wloz1vp66KxVZO6Lxl-rV9DBiG8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE1MCBTYWx0ZWRfXzhThLSoa/zVj
 K3jCr4KVlVNnZrw3LNHfca3y+FcMyHuyJ9U+H+pN9b70Zif3NJQsg7JPL0eVBPcIxebzWIXxyka
 gjTzyQ49tn8GoZDUmn74UVK4JbnlLjNGIg1pAJOIitBbN0Srfi/F1l8iGaGyclJ7JMk8oulVakD
 EhODayj/vvdnArrrWvbfzINs8rxS8uqDbZEyLcZrDkoQJIty7OYfbXLbnphLIs9bw7viTQWi/Ld
 GfJnGt/ydK+HreBrDUU92Q/OAiwcogS9Vh6mq4Vh9CyMaTPOV0kGLNcuUH6t3Anfb7FiDp4aVwO
 gGj16WM4kgzLe0oE24Aum8UI/9cANWkJt02ATECglQbdbz+dt4QJEclU2W/Vmr+b/HJbEK6/+fQ
 1oIq4ARuWkh6zOwKtHW5QPr6MggJHBMKe7TTxXFguhl+6POrJoOmo88cG4ZGxzTG19BqWkI+s0m
 XDqYYmhwUEY0O55nBkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070150

On 26-09-07 17:33:37, Kuldeep Singh wrote:
> Shikra is derived from Agatti and uses the same QCE integration.
> Update the QCE node to match the underlying hardware implementation by
> adjusting the fallback compatible and related properties, including
> clocks and clock-names.
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

No fixes tag ?
