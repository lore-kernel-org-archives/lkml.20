Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF19F33ADAF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788424464; cv=none; b=hh6Wp/+Bo4apRmcboBrXoSEZwi3mlaSK4w3Eo5uJSI8y/UwGlmthoSD/9CQh75jNNcgR+F/iuZ6EckrbYcFS29t5ohGtwJuWbTEYs1T4jJba+lYfZfYZUyXvveWi2EI8BPmEl5/gRfKZXypbqQoxjFYFXAyMFWExJR/2eS66Fv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788424464; c=relaxed/simple;
	bh=2wtGcDixD5YVV1h3eEW9F9Cx5WliZAPePh5dF/UV8r4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MMWAonUIblezOTlePLU9nK3kOIAVyH3E5oQXj7EnCGMJEZ+b2VPEwD+YS6ZALtlntQCgNanvbA4208rGhN9vD/QN0djYs/vF/M7HeFxt77dOJSgxKQkfYWrJkCshNh14T668ZV1c5bgZ+aR5pSRgyPkHxz2ftzlqDDYgxizb11c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bLWNM8/y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Im7eP4OK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bLWNM8/y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Im7eP4OK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lLVD3113940
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 08:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nolidgfVOoM/xTB4yJhQPfIO
	/30el8PQJoP5vakcvB0=; b=bLWNM8/y08vRNOQ5XWWerJo5HBp3jbUvYWJ8+t9A
	u1yOegjvFZk89YcIIr10e99xsEy+bVubtvet35lRmcUY16CVlG5d9w48qfieIZGn
	bPR3AVT9wzgfR8ggtNocFdVgrpdCTCO32e4H+PYUnD9c3madT6gq0MC4OykAPDRs
	Qz3yaG2EhnLVX4v7OErHOVe2uHhN3NcMv9ZQ12GEAibvFmp0bcXelnIowH8MZQh+
	Vbh/ZJG70OA1mlGFATaEXaVI+hEjDjzEK643zVwON99yB+kqIuiw36cvHg+ubpi4
	N/KeqTB2t0nWVyg55J6ZDl4t4w0aNtFG1uyH0Vs7qQtDdA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf0gjs63f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:34:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9102f07f2fdso13237406d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788424461; x=1789029261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nolidgfVOoM/xTB4yJhQPfIO/30el8PQJoP5vakcvB0=;
        b=Im7eP4OKsNTHYVmSarL659baJgvaZUBnHo8jrRJ4UWq5GXN/6nNWzT68CJKA+AM2FR
         8HaaZe+knbQHm4t22wdyBtPttQlBuWezt/Oi7ohgGHK8RHHTSIpFlQV+g/kQ7koyM3X6
         MsLTwA775R2dgWg0CbPWi+urI6a3C+T31XNtXvkR9/vdRZ535HoFqtzr6hmW9Foch5dk
         uZ2z39lEl5iWEEiwCozC1yJLQcC0PxvrhEl82sAc/bygg8DgZXDSraZ3XRnxBy4hvlrp
         E3GL6yg5Xr2CckYbg9lXI2+OOHOqq8fq6bkojgXFyFme8fSMr3w/xmF17GwE2N0vaXv5
         pvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788424461; x=1789029261;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nolidgfVOoM/xTB4yJhQPfIO/30el8PQJoP5vakcvB0=;
        b=mmR2+ZmIKrYrQHF8bO0jqHeY2E5BWGRnjUdzW3MRXRhpt6I5fDEcWhkyqf5oUzI3dw
         HcHDGuIUlPzczUhX/C3cekaeDmc4zbiMpdtli2Wn0CP3NhJS8pIXsSVwGJjZfg/iOHcN
         ePFXslWYdmHs4W8vlperZ/JM/MXgrhs2pViQs81PPJKtXymJLa84GjP5PxxKc3ik+X72
         E29XCGyQ2JA7XL7B9SH59w5JMhw5wG6m/0LefbYXtut5OJI6xcc2tsOk01ZyykRb6oxj
         8T2V0v0vZYXTeqZhq1wW19q0VJcsV9koSwHmHbifEUuhgkdW678X9dOlevHo42f+1HvD
         gnVw==
X-Forwarded-Encrypted: i=1; AKwUvBwFanyLAzxu5e1zz9frqOZI2tfcxRWbm4DSwUan+H0nrRTI4NL42omeS8MPSHP0L5lPc2CQxMmkgZmUDmM=@vger.kernel.org
X-Gm-Message-State: AFuF++mCGOEwvCUkz9SSN4YlO005CwPoF1wST/nqwMCk8fEF0I78f9pB
	FI2Expt9Ww5/ibmwZtsst1cLGQP8/fOaH3rHwEnDa+sXXr5VnW6aXC3xjbhpq2iWJK82GG5tqXU
	bEUNA7QzYeChGARVkST5qrAlTweWJsUs9KWq1AZQuG/WjE83X2ySKWXiZ1PC06Nz0ygg=
X-Gm-Gg: AYBFou0GMko1J2Z9TPlUNygl7Z6SDfv5XdASmSrvtwqo8lKpbK9t5OyKU3BSlf/W0NW
	bHjuO/Dlm/V6glwhtSfvKVz7XFQHW15wRx1nQx6DkcifS4lLRAoCNvqPJ6FiyrwdKhIVwsUKje8
	tsXlkvUhtvSyGQ4FkakDHj7D3qKgV/B3NPVALUR1tglFBEuA5EVru/mYlb9HZpvhwXFZ2850vF9
	nCOHWK1+GsXbyjUtqTOBCkn+yPuJZLArOIAjSXD2V8B1mo8W8PGdc0e9n7LNZlxo6dQUwLQoUYX
	5lLXKaJTcKDrkEVB5JhV8C4MOMVsQ5RVYGSojxbfZys5EnoGqvXrBDQ21lBcRBeOgk3aimisKNm
	Km32XIIYD3lxhsw==
X-Received: by 2002:a05:620a:9149:b0:936:78c8:91f3 with SMTP id af79cd13be357-9396e00a9damr362813085a.11.1788424460931;
        Thu, 03 Sep 2026 01:34:20 -0700 (PDT)
X-Received: by 2002:a05:620a:9149:b0:936:78c8:91f3 with SMTP id af79cd13be357-9396e00a9damr362809785a.11.1788424460331;
        Thu, 03 Sep 2026 01:34:20 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d2019sm52402355e9.2.2026.09.03.01.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 01:34:19 -0700 (PDT)
Date: Thu, 3 Sep 2026 11:34:16 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?B?SsOpcsO0bWU=?= de Bretagne <jerome.debretagne@gmail.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH v2 01/16] arm64: dts: qcom: x1-crd: Mark the EC reset
 gpio as reserved
Message-ID: <ygyu3t7o2p2xvm3j5wrxp4svzo2rzymvzgod2szhz4z57elc7a@hznrw2e35oen>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
 <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-1-f4ab7e4bb75d@oss.qualcomm.com>
 <3f26bf2d-19de-4cc3-8af2-c26601da2576@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f26bf2d-19de-4cc3-8af2-c26601da2576@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3MyBTYWx0ZWRfXyfDEt8l5DPA6
 SBB0U4hpKuHRp8I1Jys9iBppATz5WBXM5buJd92PmmZCBpmELMUT8Zvj6rYS0Om0AoUUqA2d/7x
 yutHffotiAAFAzuW4cArwtXlqyRPavFT42E97eFl7ehckxd5ub9GNlvsv8SX6mXBEU5ySULuJst
 vWy0sQfO3VJ0hQm2Vx77uoXJz79wrvbTO1JZs43iKTtlL8VlVAdZ0bQvaM1R65f63e5iaNeTZki
 /aIfUv1HRh3AUc/72CwKqcFHrC8f+NclmaL2h37BlxeTUFcoENJfFx/E547YKfUNaitm0X/z1c9
 h/irT6A2NUMtpeKiTQaCVRzJqdIwNpa1WnpkPlwoglgxIcdPsd2AfO2HyynRSjhMNkzWsSgQUlA
 y0I80zRtA+bfU4lVZl2emvAaex4Ry7pV250fmO7cipA5AoQZ6NzcCXM9ferCwtuVI5osxlC634N
 8HN0RaXASkve/gR4bsA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3MyBTYWx0ZWRfX7tv7nZMnqOC2
 rZZFDk3ex4kosUfpnrdr3DCdDGW7UWcRhlm2cZmZJ/5ZZcatjPDyvE5li/C/Gpz0ANBTxnBBgnr
 mz4hFpmEbBAlAmwvh4ah0olx02ZcIlI=
X-Proofpoint-GUID: xDUc5WWvcGgr0cI4aaIjFQOoi0J1Tm07
X-Proofpoint-ORIG-GUID: xDUc5WWvcGgr0cI4aaIjFQOoi0J1Tm07
X-Authority-Analysis: v=2.4 cv=LZ4MLDfi c=1 sm=1 tr=0 ts=6a99310e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=0yKSSKOl38yrq87U628A:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030073

On 26-09-02 17:53:23, Konrad Dybcio wrote:
> On 9/1/26 10:06 AM, Abel Vesa wrote:
> > GPIO 65 from TLMM is used by the embedded controller as its reset line.
> > 
> > On some devices, toggling the embedded controller reset line makes the
> > device not power up at all, unless the battery is unplugged.
> 
> Have you confirmed that behavior on the CRD?

Toggling it does nothing observable.

However, the documentation says this GPIO is actually tied to EC reset.

I still think we should reserve it, just to be safe.

What do you think?
