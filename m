Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793449227;
	b=1JvIXEnpaLpFFh82V3JREjcfAz1pt1Wu4ig12tHbQLBR1RKt21FxByh83yKm7EmdvdE0
	 Ia6EnvYhV4cP6w2gMnwsqv9B4ZCsStvXku4RmmnUz+FD2lxAbRP+M8pVq8fqvqeDM2jb5
	 xX2XQtZryAmG7rZFxvxxsrHN2Xt/g1Fq88ZJQNkppV6a9LWBh5h82mbkJsomWHJwCex3/
	 h3IBPI2enM8cWcZB4MFUkqfIRNxPteVb90esxpiH3pmF0Qe6u6lWGXCwOK3kpzL0qpF7x
	 z6sQ4D0M2wi8Fcd3tjkN5ImAEBHuSo8t8xx+sdlZYMAhJAO1IfDjIQOvcnCbpT3oNdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793449227;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=O6eml6/KMAyx4GGG3XewIb3LC5ArF6kRUP9Bc5QWjbI=;
	b=woQGT23GP/mVnHNzkJe93cIeJQPBNiFOsAFwlJuOTrGYwc9EwDcXF4JtYqnWhxv5Rrs0
	 ex+AGgHAIQnceGDOmUDVjQpqvvpo+UXqKpG7TnleLu2E9+/VSy2BfcsFmXucu6sW382ss
	 518p1rAYEKegqk+RgGdTG1Xs69kQ7GalOdgMquxS4RzdOMaZWCBZzw0cpKNtbo9vgZPhT
	 +3jrwxQDz3wAgdtFEm0yvkKF0fy7EGMjxU82wK2x2Mg//dBRuNXLPtb+zmup/OiO0JWl5
	 QYmqq+KK9gklAT+s1DMyJiOIIS5smF3n5q7hk/7FP4IfQTBG0Kx32SlYIEV/bL5gRxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KgZdjNhW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LGaL3DeU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831C9606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 12:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 831C9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KgZdjNhW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LGaL3DeU
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69V4a53T1175373
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 12:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=O6eml6/KMAyx4GGG3XewIb3L
	C5ArF6kRUP9Bc5QWjbI=; b=KgZdjNhWbZo4YRTv4iA6OSTSK+Hl7xydAMw1sU7z
	r3D5AjRQczY2dV8AD/cp4PGNTlxdYPZ5HGs7qpM6olkd5XV/jHU1hKNUZnjFGfLC
	Au1kRb2U6a+drRG0dM22vuLHXzXzsG24b2dTTv0LkIYOLdbqhaST/09XG616fklb
	KhmqQANvVixgRhkiAt4+T3pSogQTTLAw9MMBlrkJAjs7+pF1rINmQLebnn+j9tZZ
	Oa/+qlka5BBoGxexI3VZ6QogFMb3na67VK1pVq3U/pFfay2qZ0OwkJdYeO2g6Uq4
	qfHaSiuSHlCjeSWt/qOpfRL86JbzCSrrpGHW4CPEqC6jqg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn5pkhe2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 12:20:25 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a3451ea93so2540517eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 05:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793449224; x=1794054024; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O6eml6/KMAyx4GGG3XewIb3LC5ArF6kRUP9Bc5QWjbI=;
        b=LGaL3DeUj5yf2AAtf3+90TY0kCwS7+KrYE7NklMXjTD/LlKB80jUrVguJrPsguI9Q0
         FhEHpR1p8umrXvjxnxByXP9BoeW085fTslBvHvIvM6yKYvAcMvF4Q9Tj6tVwIxpX9WWH
         kELin8/epCLyK4ECOk2dI28R9Negg6x6GCTZpARNHztppqaeZ9Xt4RCWQauvf21m66rK
         rBC+WxE5J3Q4Hoq4At+aAxo8VwemyNBPeJiUl8VtbUwXF3eR9g6g7bpiddcUVyyzDM3n
         kSyOSXgMxqGgI21MntRCXFdUT+PHlY5+i+hygFvLncBWYo7ehXKp2uASf2oPc2VFRURD
         biaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793449224; x=1794054024;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O6eml6/KMAyx4GGG3XewIb3LC5ArF6kRUP9Bc5QWjbI=;
        b=AXv1pGH7LKMGXSAKZbp25fKKmoLrOGdSQfc2110QBzWRFxvkBLHNjOBAPZU8ELUkY7
         WoQIL4qT/OeUCOJS1Fkm/KR2YT0MgKxKIdI95wBgDWiZ8BHdmUNA+ds7ymivWNow204O
         m+tvgekhZkL/VjmyiZK38eKR6z6E+dPGSF1OiqfAk3S3gv+mT/NYW2Om34xHvHEjXbdo
         +AGFWGIPs5VcUT+LJ4ZZh4TvfolpNkg8VmCFqcUhPHyC1VqTvRkOD3D08LxgXbNNr0MN
         fVa0HQSn4NaLg+bE13LjzMNKnvXfH13T0ZlL2sCh81Qono+VwU0kRGfZ41u05fNC41Fe
         eyOQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/qR2ix/O0sQA3/9248P7Jsf+QcxGNUH+MZ+sCkAvx2FUwUpIcct5IZ8JbOdSa87aTZ3p3KbN1iauzMgY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxMWDGbLQ24hcSrDXy9NGQa6uHbRQvWfLYZPkiDnuiS5qjSgDE
	wzeoiwVQeUMAOFWOimP7q07hAyX0GTt5X8U9nCNCX6cLKLoSSZKKK4HdxOdScmJljPpIcQ0NkXS
	Abfp8JaW1yhoZ1hovxHk1Gq08bQ3M08LPpLwes6BHe5sQWNkEckXa5mRUN4L1tyyqRcY=
X-Gm-Gg: AYBFou1E4EsZpTKszfIQHyZ9Giq6Nu3/wHPwDwat6h7hxs3eSXTp1hReZhBMmLXGn+P
	2W8UprWVlWRMAPbP5QTIW3e2D6+E8j/r1uJheZFiKQUZlZy2vIr15yG8kEQZmabf5marUwWEMB+
	BAAhkkPxjxL6vWJG/hEXlexJ7fe9RCQze/zKP/ruiHTTHayVQCWwThI5+WrGJ1eFu6NCwlKo6LH
	sbccRelOiC1SCs4KHbmNwQOAyVY0dNjs5hgiuYp1BSGdkl0CKajbmNuos2sT4yi0rhhJ3MSIFM3
	7K24jfYNguoJznxv2awVh1RuAOoLPHTnHUnE44+pbMwxjQMoX7exIGC8ShLYiw0vn5amvwhxcYa
	sOXrP2eyzTUfClrf5XSc5BDlcwHJfSpoj7u4dp96MCsJrtB1/8auVSFYP+U/KbELDAQy0/XCYQl
	zMYO/1aSBnaYCqK5w=
X-Received: by 2002:a05:693c:638f:20b0:36a:15ee:c209 with SMTP id 5a478bee46e88-36a423ec1fbmr7213916eec.23.1793449224041;
        Sat, 31 Oct 2026 05:20:24 -0700 (PDT)
X-Received: by 2002:a05:693c:638f:20b0:36a:15ee:c209 with SMTP id 5a478bee46e88-36a423ec1fbmr7213863eec.23.1793449223250;
        Sat, 31 Oct 2026 05:20:23 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm18933983eec.15.2026.10.31.05.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:20:22 -0700 (PDT)
Date: Sat, 31 Oct 2026 20:20:16 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nikunj Kela <quic_nkela@quicinc.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: lemans: Enable
 lemans-sa8255p-ride board support
Message-ID: <auXdADNJMS2mMsuh@QCOM-aGQu4IUr3Y>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-8-shengchao.guo@oss.qualcomm.com>
 <45b54ff8-a2a6-4eaf-9d5b-cfd9bb40c459@oss.qualcomm.com>
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
In-Reply-To: <45b54ff8-a2a6-4eaf-9d5b-cfd9bb40c459@oss.qualcomm.com>
X-Proofpoint-GUID: RVor2y1_SzQzwo04wZPEqJh6HLad6BCq
X-Authority-Analysis: v=2.4 cv=Z4F5j3RA c=1 sm=1 tr=0 ts=6ae5dd09 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=7v2nZd0nDHYtio1KbugA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA0OSBTYWx0ZWRfX1hhzCgyj/4NL
 6rHsLXEa4fyAmFGV+hgyIU+hFdgjJ264q6SAVjs+Voj7B/1MfdRVjEJl+83HE2Kb895u0017Dt3
 uk38+1YrNczWiyb/MNjmmoohz4k6saM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA0OSBTYWx0ZWRfX19HvZRR+wW27
 LIdoRlrf0ebs0Nq+gU8MwHW4Cr1R8VlGtKPBskJMK0MucvmEZasGmn0YEQ4ByU3JcRjkaisIWvn
 v2CGLbTEVk3ojUWV7TCrA3KIQL2KaWEmOhfRXsXzDndykoF5HTb2v0W469k5+aAAfxKROoACzKJ
 PsbRpRBsajOzb6p5BbX38wDUDnmxcxuE3sbWQu09+anMC3FC5HCBmL+7X56EPr1BCwYuHTablfJ
 kuv7893i3i7l7UaN1hN15/B9B2ndNAaRcTWu2GifKCBRRmwy4S1VFOygI1zK9ieWEjBEYu8tvo2
 N1NDEqEzf9JKQFcGzNhc0NmWlcJS/ykWPLOF8paab7z2CA6BZQPBXUAcf0p75FEQ8pOApNtfI5t
 kk5M3TOF61q4bsPt0wiqzPKxX4fSll0XwJNIREM9Awwm6Poosna2fBLGqGZFFmiDdt/GnBak57B
 j4N8wv26zOG0ANuDsxA==
X-Proofpoint-ORIG-GUID: RVor2y1_SzQzwo04wZPEqJh6HLad6BCq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2610310049

On Tue, Oct 20, 2026 at 02:16:27PM +0200, Konrad Dybcio wrote:
> On 10/15/26 4:37 AM, Shawn Guo wrote:
> > From: Nikunj Kela <quic_nkela@quicinc.com>
> > 
> > Add initial device tree support for the Lemans SA8255P Ride board. Enable
> > UFS storage, UART10 as the serial console, PCIe EP interfaces, thermal
> > zones for PMM8654AU sensors, and SCMI protocol nodes.
> > 
> > Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> > Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> > Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> > Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +	thermal-zones {
> > +		pmm8654au_0_thermal: pm8255-0-thermal {
> > +			polling-delay-passive = <100>;
> 
> Do we need the polling, is there no interrupt?

Yes, we need polling. The sensors are exposed via the SCMI sensor
protocol, and the SCMI server on SA8255P doesn't seem to support trip
points. Also on the kernel side, scmi-hwmon driver implements only
.get_temp for the thermal zone and doesn't handle trip-point events
either. So polling is the only way to evaluate the trips.

> 
> [...]
> 
> 
> > +&pcie0_ep {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pcie0_ep_clkreq_default &pcie0_ep_perst_default
> > +		    &pcie0_ep_wake_default>;
> > +	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> > +	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
> 
> This GPIO reference feels like a layering violation - the previous
> commit promised TLMM is abstracted away

I will reword commit message of patch 5 to clarify that kernel-controlled
TLMM GPIOs are not abstracted by firmware.

Shawn
