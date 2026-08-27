Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3356D36A033
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787822608; cv=none; b=b13Saoac6FQnbBUb/6r8RtcjByW/TgYd+v6Gqq53tyLh6wA49MscPrXZhu1VI8K0SADJcgHytnFaMb1wvS9n54SiDlOLfDe5/QjEOsq1K/p+0MrNRbcnP4SqNrfdXdIJ6vFFHcqUFjmxxSw5kjj3ucZHSO0Dh7sc8ngtE04UlFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787822608; c=relaxed/simple;
	bh=EFvzre54JxGnezmSd2Zmn1F8pbR7B+VPAVWpl2PZLL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kXSzC4wXfmXRKlpagEq/E8c1UwF3IKVDCGBDMA5wdQ0B4Mc76gMidiYmzbPYTGNkDgY28XC6DbOq6Lg0iSNco9hmTtul9hjTiVYpAN3BDRSMbuN1C1VyDPQ38Oppn8BIqrypS4tlyUrC8EYKGhnATFAmeA/SkVh+jFwQLq0IaPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PDsUonT1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C0TDuZMB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PDsUonT1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C0TDuZMB"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R9Gmb7470825
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GRQ622yfIeZ4mbFm4NRuC4KD
	EWeJhchUHxw/jWrkUso=; b=PDsUonT1qZtgzICr9wkFCgKI4C/dgi11f3zhFSzf
	FQ11tvBWhzR3wObvm+UQOepH1GKHHD6D3401nSawWmMFQWlEGJ6+bgxG2hWPwYw4
	A09NbXFrD4SjftVreF3bzkh6T+gkmWcHAqiJUKuy7dMjm6ePmjOqL4C5B6Ihpbgf
	TPvFWhgt0AX/S7p/bNsE4kiuIYQBHuS76vI6EcIxV9Vqq2N5d638P+FcFvwymkNF
	eeV5AQZ9WMhEddH40HcQZKs3U2FipQJhh3pYDBOrRHpNzlZg+WuhzFZ5HkU6FUFQ
	HhTzzramSIjq/oSQskC/Qpo7W9fdkBoj/4ggMfxzv4JfZg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga8m5j1pb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:23:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-933023a5980so275726285a.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787822605; x=1788427405; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GRQ622yfIeZ4mbFm4NRuC4KDEWeJhchUHxw/jWrkUso=;
        b=C0TDuZMBi0mLJobqzvaI4lCkahAwMvYzd7wAW/gRyEVoRtttigIJ1OzNpcLZ/xZ8/0
         A5Q5yy/BSsatWrsgYYHPbp1qUPDmpoRdmvqjNo6hBgKAwZkvGzOx1FJ7sZRI6q9IJLRr
         696uZ5ACh3IMjYP9ICkDHuQgPuS7lU185rNez+WjMCQVzFV2QANWaLlfxqKswBR7GYwr
         R/jWr+Nhyt72BiaBxKn1VufpEK1/BByaehKYzz4iNks82Y1L31exDjXI2VVqdEBj4KNP
         rA/U+Q0nWCgOqpPvJ0xmgqLrFmQKC+wV2Z04l+hEzy4bC9+fBqzGOmGz28tOXofyk6u2
         sptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787822605; x=1788427405;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GRQ622yfIeZ4mbFm4NRuC4KDEWeJhchUHxw/jWrkUso=;
        b=qICl+/MLq5flF1fRG/ytAGHGTugpYBR5+31AhbTnBy5lZQdjcUIR8PfE+YOfWDG2mI
         pTYHEjwF7VHgDRFKJWxlIV8G5cQ/ulODLBkL2R+hUvIGtFg83hJV0esf2fr+hYOegymr
         NNZs2pVAH0I6+3hGVB/d3r78+dwpYKVNdWwyziE8DJAI4vgqmHzoOrpLi3K8Xn2vOEtz
         U85Temui7NYgXxqK18sYK0ryXenjhsnwL3N2pYfkg2vRbc3KMYsm2UknBLxLrD+jxnOV
         0I7Wv1H9F3+oxe1s5r9Yf9MvWJYN1vtGMIERL5+BRTFrrthjTapIhFtdO3E59Rs17Hz2
         KIOg==
X-Forwarded-Encrypted: i=1; AHgh+RoVauIJKHSeSs6Irxmrf2kO33JNfmBjxIyUJ69h+PWaOcP0QjMdW/RJI/YjRtw90UIR72TtmnICzpYmNKw=@vger.kernel.org
X-Gm-Message-State: AFuF++nsA13tpTQ2ncQmqLrsb0l1I9WBA7ono3V8FYZVCkqvMgsg36Gs
	3B9SNpm0S6zOVmGn5xrrapNTSRuJbBW7e6bl/kLsc+od5VW7f72TrQe+hUhZm40qKTnSv3ba47C
	xx+6OuctHb/+D/ZdndzykSqur+y6id0/Z0sXJL++JeNNh9vbsKd7TSqffFzgHO0K1aFTv8+MN13
	s=
X-Gm-Gg: AR+sD10hrg0JS6lhSINF28mLuXfVPXUFGuTcpay0YyVPRtuajeZ2NGjA4efgaeFSgiV
	V2V2usgfWYmpxVZ+od/BPUsF7kC5bqnw6HKoMNS3i2Nr0gWMn04IcHbpF08AnFrZgK+pk1vAOSu
	0xSZRMgEIMUQLlkfdiCrJ9y8I4I9ThEmirmiqypMhB4Mt6gFHxGrYEdUdyr8/se9P/21qh/yA7+
	iMJIEuKGd6Z43pyr8BBf/s/6ynXo00oMeinR0FGWn7OsfT6tRdDYqTyzOdeexWyCZEcroUkeV8q
	aGgHSBXlwZ9J89tn7Y01NVA5MjBTEQDmC0HFqU9+l12nSXp3u6b2qy4IvJfgKTy/p3j8R1odTVK
	RpQ4BqA/4IpiDNg==
X-Received: by 2002:a05:620a:3723:b0:936:6911:38ed with SMTP id af79cd13be357-9377fec4c48mr1254384485a.0.1787822604761;
        Thu, 27 Aug 2026 02:23:24 -0700 (PDT)
X-Received: by 2002:a05:622a:4815:b0:51c:61a:50fa with SMTP id d75a77b69052e-52e42472cd1mr153279081cf.39.1787822164661;
        Thu, 27 Aug 2026 02:16:04 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd5616f7sm60354455e9.2.2026.08.27.02.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 02:16:03 -0700 (PDT)
Date: Thu, 27 Aug 2026 12:16:01 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Danila Tikhonov <danila@mainlining.org>,
        David Wronek <davidwronek@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150
 into SM6375
Message-ID: <u5ewh6gl367sc4f3x5f7xxyvzf54vznnuevjfztlgqhpjcpp6f@xvn43ih4qxtb>
References: <20260827063940.44497-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827063940.44497-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: QPfYeKvICGDbPkgrVJovVTpxGvJ2ta0b
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA3NiBTYWx0ZWRfX7OI63C410cfm
 CUbQvSGF4Ww1ontfBJEs4v5TZWyctGclrlmhgazIV1Tujs6OHMNio6ASj/qmKouOrQQPTGa0U7k
 DO0/OARzvQs7wWJ5KCAkxZlcuBaV5kg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA3NiBTYWx0ZWRfXxdFXsio24/u5
 NsHf6RSivrXU8XYVinIepzdh+49jKEjPNw59QLQqaCySBYvdmJBvseC06iFJniYoKsBr18XY+M4
 3XYN74vWIbrs1a0VNE6Urhj+b70mQK5kSMXwGYEVOW61HsX8PjLoO07kyqSg+C4IluypfmU/UDa
 ZMt5xLJ38wIJVMwAPQcN55vLO/yeElz7NozpUy8Ua/aUhOaU4SqS8D1ZVuzofJu+f72nIJzAVUF
 kSvBcpdjBI3FsTeQxT4zhRQcWfDDDVRue0Mt95QXO405eD2LdSpnVF37aTUDiZOf4+gNYtjF2jB
 MeQp8Y/WnKfYEpDZxjeFkTDF8DapaDsis7TKxHDvLTSJQ3IUdIARYg8m+L55dzZiKLVU6ln7xrE
 uds2/WvlrHndTdVLVq58bf/NoOLE4S278XkhO8SIuUmTdelgIjP9r36hoCtjhLHW69j1kYy5FpQ
 7Po4Rc0vMWAMYhQl63Q==
X-Proofpoint-GUID: QPfYeKvICGDbPkgrVJovVTpxGvJ2ta0b
X-Authority-Analysis: v=2.4 cv=SomgLvO0 c=1 sm=1 tr=0 ts=6a90020e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=wAkbjeueQAX_hA7IGqgA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270076

On 26-08-27 08:39:41, Krzysztof Kozlowski wrote:
> Bindings for Qualcomm SM7150 and SM6375 GCC clock controllers are
> identical, so this could be one file for less handling and encouraging
> future grouping of similar devices (like SM7250 which also would fit here).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
