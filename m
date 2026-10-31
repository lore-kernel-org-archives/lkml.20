Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793477992;
	b=Mtj7KEtonEfHqr5CqNkYf3cCi6FFrpa8REmYfij0eG/nphsGj9p+bNaZ8Ecfihv8vWDS
	 Fb13Txv8nZU67b8laTHBFrN0KElsKxngJeUy1t2hQI1hNZ6JkQjuL8/jRdPWUq9lqjIG4
	 XQcb16XQ4ReeKgCzr3OElzogpPBXfVcwmX7nEnIRCyiMAVsPB9743FsisO+RnsD2xnjoa
	 tn5BTyn5GeVJ27LuiNPMkKpnVML0asa/MtAmYsvXtPcqR1ZTsIf/6y1fLYv++q2Xfidbh
	 cmO9Ok1SSF9XI0GScpKd5ARayYDJDjwzAHaDBMUInXohJFN7yGwkOjmO2u1kIY0Mq8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793477992;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+VdHn6TpgZyyeQuYkzHyiAfkE16dWOMnysbVagffdjg=;
	b=ecqVL4PjWVZ9hf5fy2LjBIEFzx54R6cwkniIXw3xCPUp4fz5MavgVMJdloRdpQxHC0QS
	 pdnDPOn67Ku3Oj0ZnF3F+OxksGPGvzYT0Lcelg+9rA4IEt9RPKAWNYsJ7yqghKk8h5F+K
	 /w2zBee0ATHM9ZhP9g6/HyvlR3gup+0DDoeER1SQ4b1EEoSxEAerVzdDYdkJTdmTlKG52
	 8xKMOrlnlb4WXdLETew4/j4TZ1VV+z7Lmd1/NoMKpewrZleXInZt7fYPhjfBSG1a10zCC
	 9Tn+b46mQGxzZPx3wDAr9aX70hIYmEVJ8YQKAQ8vKzmtlkbLFAxR7vw5ACHfZPZlLKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GcCODbWT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z3k1CXZw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24582606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:19:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24582606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GcCODbWT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z3k1CXZw
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJFCbj1357585
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+VdHn6TpgZyyeQuYkzHyiAfk
	E16dWOMnysbVagffdjg=; b=GcCODbWTlGP2km+0+xVTV+4QoNXt90KOyGzd1qpv
	VmEHo6M0wl8AAH4w5jw8veoFojTJxn1cktkgQoCLR8e5FSDZIF4UqA038Cgs5pPM
	4iQxJZ4PRI5ty3Lgb0WFWg64u0dD3AQn0LRPEtudoSjFfR7VCnNioPI7q7fEMCJk
	oq1Whcbp5t9J2HZS7a42gBFJ6tIwCDFJBvdezV/RkGkn1WGujMpqEIdFSUDbKIw5
	5pza7y+5NUgSX8+4hJ/sMXVinn5aCm2ibyQ+Mcydqeg/IP8oJowmE1Luy55OfRbL
	Xzx0O5rJolN4IaDLSGA29XULb88BVxCc2BUlPnHrBRL+0A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9gk1tcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:19:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f2fafeaso219085485a.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793477984; x=1794082784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+VdHn6TpgZyyeQuYkzHyiAfkE16dWOMnysbVagffdjg=;
        b=Z3k1CXZwe2WywFjS4ghAhSbqt3FAajR99rIjlLKx73WPDv0f/fO3QB2/9Kp3UbvtAV
         qNZEaoAtI32I3abgqsq2JaLJLj87wE7ZXL5DGyAkvFf6eQ9GEN8uP/fkhCi8O8sLtLEv
         O6jys5cqZjQzLLCFrKerrNkIONETzGFG9Mj6LmEnJtmEFa0nmBF22V08Reg1XyILCBHy
         n2AZvpstWXh9v2JjuNX8m74hxsjQfeinBBcnzs8z5Xk77WzHtjQspLyoBiU7pL6+k4IN
         j0TyICMD6+93IHwg1r0lO0tVlDQpqVOFGydnE1fxbohKSGv9Wyqgj5VqoIdxsTY7vdrG
         JYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793477984; x=1794082784;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+VdHn6TpgZyyeQuYkzHyiAfkE16dWOMnysbVagffdjg=;
        b=Cpj/+QUL5u20/IMeXAaSt8qhwh8WqtdIKwD92Ca+0pzSaWOeGCupWQZOLMNGt4fwHO
         F7gJZFRnd79U9sy1lNSLer2NdNSjk0SvN7T9oS6L1lRKd6HFJ9p37WWBcD1QrZ7k1buH
         tjtaEHDbsUBVumaFWCQMEiURzRo/vAWnz+x7nD/EuKwNFsLeRE23r/uFoEVBUW9ocFEj
         DsvcqWUBCwkcGNEuBt6gD1s/RIXyF7MOU7ZEGuIyRlV3WJtFFcwuPoLbvQ2LJNCR6xYF
         Q5Vl2f+p5kx848Qwtjq3Os6Mb2+h18hlm1/XRZ1qakMZ4hZ+t9du1Odlh9r4IslWsrpJ
         ooPw==
X-Forwarded-Encrypted: i=1; AKwUvBwTg/CIvVMYl/35NXga+qBTdxLDFiJX5aWwpLpyWm1BF1nQcBOnpmtcGpta/EXTfDSbhXEu2TUBWLfr5lU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLE1bY7F5SPM2xpNxm7VinVVmAw+niwOU5BUlK1d/xX3j5cWfL8
	fck/ZNPNHdrLzT3jX6ifPMZzEOp/Fer062+xyE1oPJ8y6j71FuSnyrbU9+IwOf6Az00V2GHWdyV
	AgBuCUcVNYhC3qAUwTWBqMTGozBhF7vnc9Lcyz02fGI6CrvzC0+mHlRpmQgRN6RvON8/fiA21sr
	0=
X-Gm-Gg: AYBFou31VuqtcHH3si4n7oGnlMb+7FgeGwB0+S5t0AROTP6V2Ju3F1LZA2UjZdHeijx
	LVR7UDOeC3Mp+L2FgLCecMir/PACeozEFW4qb26snc/ZY3v9WR6vaL70N7gfN2R/1bktIvjTeDY
	O3gKGqPBvcnOIPY+Szpu4h5vjuehLUoFzaPP2IPrCBFZ7cgJ3b2KYzhL9I0JzSo+cWsCMFQ5Vjo
	hv2oc39hOJpfXJaJ64sV8GE3+PFnVhgbSS/R8y9GSK1BaDb3BqG1sGGIEHBYYke9NLBIcaS0ECj
	1xUJdHuaS1puLbatIcaJ8coMCrQuAsPhCe8owkdDaK7tSX56Ez+nbEmbDsClFv/E/YPFcvYzOHW
	ms2VqSjK4AT7RWQdA6Zy95ik31FMQurZTxu3zLlw3xBy6G7btmeqoyrzaeqjBfifHiAoqhEabSN
	icEoMM9sjJkMBhp3OjB3znlbgthuymbkoCqTRfBRgEnndBZZdsnz+k9S2eA2QSsQ==
X-Received: by 2002:a05:620a:2b89:b0:93e:c12c:9dd0 with SMTP id af79cd13be357-9442177675bmr987618785a.80.1793477984350;
        Sat, 31 Oct 2026 13:19:44 -0700 (PDT)
X-Received: by 2002:a05:620a:2b89:b0:93e:c12c:9dd0 with SMTP id af79cd13be357-9442177675bmr987615685a.80.1793477983766;
        Sat, 31 Oct 2026 13:19:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe072c0ccsm731601e87.30.2026.10.31.13.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:19:42 -0700 (PDT)
Date: Sat, 31 Oct 2026 22:19:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-glymur: Use PWRSTS_RET_ON flag for USB
 GDSCs
Message-ID: <crsmuaonoizluexbbfjlzaaidtun7gsveps37mhaav7uwpfsr2@xwqtiswnoj4r>
References: <20261016-glymur-usb-ret-on-v1-1-1790a523fd9c@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016-glymur-usb-ret-on-v1-1-1790a523fd9c@oss.qualcomm.com>
X-Proofpoint-GUID: yQ4SZ7DRY6tQCPL9YUD4-zcgl3ZEcNJK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4MSBTYWx0ZWRfXwCOEdEyxw9Sb
 qdOLeWA/xBkODj1ngY5kd7NDNnQFz3hit3Vu7Z3Z+isSs/W+UAWkCWZiY3JZ5K2UJQz1UfyWmJ/
 IHHJyr+ZODEL2dMF5Tn8Fxykl6bHCl4dpNzOYmAg//YTXDuALy1/BTPmYuhatwbQFnhddXAbFER
 NXJF2YcOaUHhCMYV01uIGgzFKcTxUs/s13jen9ZgmdDrg2rsRKqJtmZ/+BDqpw3ea+eHsyKA18X
 DE4DeFlmHJp8Bs+u9McZGU+WCPoqzQ1EuclvEXj1g98WD/Hcehsz//Cn8WJ6dVm7hhfTZNUW965
 /fy57S4eSM5DkCGEx1rzgnpFXp7/Ia8ASiQOnRPQ1DCNKZPq2zfCWJlgAupWMzU60HtJdmUflqq
 1nrgG2JsX5WkeGIVVKLmZwpiI+hiBNixiRFZCUbqqCsBP7bHlD+xA86cnQlMoiErb1X3gtrSzxn
 CrKAKFonT4LOoJMWefA==
X-Authority-Analysis: v=2.4 cv=HNBWhYtv c=1 sm=1 tr=0 ts=6ae64d61 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=XHe_ECugD20tH9J9tGIA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4MSBTYWx0ZWRfX+X9G7cWZMijb
 frJvBjtb6PfIoxUlCaFvhYOZXLe7IfnRMFa4nHGq+TQkLQ0fqH95EoZWRPIzy/b5zDFgpufXm5d
 x++xTnewDvhVb09hMnG2RJH9xnnWAdY=
X-Proofpoint-ORIG-GUID: yQ4SZ7DRY6tQCPL9YUD4-zcgl3ZEcNJK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310081

On Fri, Oct 16, 2026 at 11:58:44AM +0530, Jagadeesh Kona wrote:
> The USB GDSCs on Glymur are currently configured with PWRSTS_OFF_ON,
> which allows the GDSC framework to fully collapse these power domains
> during gdsc_disable(). When these GDSCs collapse, the corresponding USB
> configurations are not retained in USB host mode use-cases and this breaks
> the resume of USB controller from suspend.
> 
> To avoid this, configure the USB GDSC power states to PWRSTS_RET_ON. This
> prevents the GDSC from powering off during gdsc_disable(), and allows
> hardware to retain the USB configurations across USB host mode use-cases.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-glymur.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
