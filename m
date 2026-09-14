Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76E93E7BA0
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371488; cv=none; b=fANyNRFr7isVy2ggCgjdmKVXbPdo92tswEBC6MbEZXzRpaYa0B39z/qOXwUbndsnqMggfjDDfiDfSuHl5zcEmcSX/f6yf7Uhf/biVaoyj+qqKixxxvuswpcJ9BrI/pvo0uyUIAZyGsZA0/ST+dL6AniCmsgPl2EH7USCBvZQkrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371488; c=relaxed/simple;
	bh=+mpb4A5u6+KzZjEaVLebnjWUq747ZMbiFGTj5YmPX4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nK054Gkn1OHvfDPqLKpeIc/J7FFvbeVoDj6g5Je9QnBGUmvxm0FVOye72g4LRr3w2hp7CcSfDci7ovkMoVtSSINNc77qDRWNEGBgzXREDOFwtgSLo0MxrlIGQHJdyBCG00tzRZNy0DHyr6ynYhIr3eo0hrautHEmCpYN2cBe5VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iewX+SXA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VSx9/kD2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iewX+SXA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VSx9/kD2"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ireB3369388
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:38:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sesOnjY5IwG/EYJjr/By3L/2
	HHUhUu6qJhwhbmJkicw=; b=iewX+SXAD7uagXkBKeMj+hUwdOz7GuJ5b3PNPk9E
	zFQ/KSIyhZUD6JK83+q7uZbo3KiwGRxBNvqgjNlhJRgnPP8RdfEXTbOvgKjVHV6n
	iFcPkjTcqyuOw+AlaSi8FxR9WEJXWwzR8tOcolWQYp4Vw1MDTD5nkLhkXOqxqA0Q
	0WEpZXFwuodRkcbM6IrllBQPKHtzB4CEuP/Fda9joMqEQVbYuDQ+t7isnLwAVtco
	169gF4s9nzFqOzlmGqRh354UGI2rzKdzQi9XUWjq67fZxm/Odv4gt+QR1YC7IUuh
	CTlEWKzkapCvUHDgXWs7zcamzJEqM1e/TVEcOPs4hC5E0A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd5jr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:38:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a00c70d28so290024985a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371485; x=1789976285; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sesOnjY5IwG/EYJjr/By3L/2HHUhUu6qJhwhbmJkicw=;
        b=VSx9/kD2quylb/aHTaa/aOHVjRt6adyNNPzouCpY5bfVMYd7Q2ZNMIeMv9g2sC0eeA
         MJbse/k2wHWt8k8Y5rCvWSbYlBCt+M12F8fcGosqAw2OoR50y2ZXhD3FBsplsEDHBTWL
         RMqS6VT4fKWn3SF6/KxjlXftXJfHvoTjxUGeEzLgB7Jwjrp0RAUZxNC+i4V0WeT+vjqT
         NQRxxv4SoyydQIggb40wctQI3YlwYwuYJhUMYt+OgWYlBgi3tGGElTVOkYUq5RnX5S3O
         uXdV5q1k8WJy0QCAerY+ktEwp9TuivXCr13sQ5gPbx6P/M1jbdmWsfXTcH948Ht9Ep5E
         Wr0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371485; x=1789976285;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sesOnjY5IwG/EYJjr/By3L/2HHUhUu6qJhwhbmJkicw=;
        b=UoQHJNaIlEag9tPk4J/2TIzWAUWzrJlYWKZweNCnDQ55Tx6jYrz91Ir32xtAH5MtKb
         zLJiTqy7YQcvkHR2mlpa7mgj52ZKF9GuJqNfkXd4gVabP6OuL/coUh/uHVrONR1+E7vN
         XOrlPDY7aMrE0TQL0+sQTIxg2ylnZi2Ftrrc2Q39HKQq84MN0n913qoxlexVqn5FovrK
         iXRjDFO3/uzJ7Sxi9e5N84KQIqCgj4WbPntx2D9j6rKJ/Dit+x0h4+qOUhGQmfECgzWe
         XT6l83lVHBurEXPXe/re9RV+h7T4teRiTxp+HAy9tUiD0F3wLW/vowddwHnfHf7mW1rJ
         XMwA==
X-Forwarded-Encrypted: i=1; AKwUvBwq0cU4POQZuMqGbNciAurNhQUy3FOOY0FytDUu27E5yBdQsELRSclhf5fBPECtfWwiPxyl2VFrelFAb88=@vger.kernel.org
X-Gm-Message-State: AFuF++kGoV4yW5WI92sNY8nBjGsiTVvYlzF21TD64s0XkSWU+tFRRK9x
	PNbqhSTB4pKJ8RRMR7uT3+TNkTI2DBlp5rfJCb5Qr/+2YfJlWJA3pgXTlDALYw4dga6NrSmoiZJ
	5LWkONFbD1YB7SXxta605X9Rj+B1frniLTdWMWAFvF9qac0Lo19cmoDJUjM4gg3e7jMU=
X-Gm-Gg: AYBFou31LAfVp+91y11sAJtaRNIvyt4sK/pHzx7+mwwwuTwedmIxgWccqpDL8KDEhfS
	LaY5aHRcMF0aCytJZPoqofVa14UgSA6Dp9Qrv63804RZ5/T4rvo5WRaDtWhBv7xIfiOr9wzttcd
	lnyCC9ysad06b/FQ8JtBXZgcPcsdmYlqazbegArve4qqFebxtc9CLeNFDMfKm25wFwSHNVPqrCu
	Z3a3GQRA+oiEvkepHJvXjipJwqi8Zcr3zNmE8eA4YQ+tuizyDLEFHWxnYzoivWkeecEY5dypeJo
	tIyd+xsFgybROrmS4cHmVJhsUgOZQg2mArVbwpd9I4ahcekum5KRAh0I7ywe4yXFbnZHpWZU8CE
	JM8k4OE7NCcukMAM=
X-Received: by 2002:a05:620a:43a1:b0:939:1222:b9f1 with SMTP id af79cd13be357-93a29448f5amr200818985a.0.1789371484799;
        Mon, 14 Sep 2026 00:38:04 -0700 (PDT)
X-Received: by 2002:a05:620a:43a1:b0:939:1222:b9f1 with SMTP id af79cd13be357-93a29448f5amr200816285a.0.1789371484322;
        Mon, 14 Sep 2026 00:38:04 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ea4fsm25999935f8f.21.2026.09.14.00.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:38:03 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:38:01 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 09/31] arm64: dts: qcom: sm6115: Add domain idle state
 names
Message-ID: <5ep34detrgxv5yhm6v5vra7e7cenzpohsf32xox2o7kr7to5mv@p7cqpwgwkul4>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-9-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-9-660c31187819@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa7a45d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX4kl5Y8f88zFc
 aVnStNBxaKYZKRnuuFBPn6ugVJRXjpL+kaI0ctk2l3keha8JZzwYQyp+IwzPRaJQqO5u2bIBlHH
 w+r00TfhGhTfI7pOIJyyDbs4b+EypfU0UhsldUdGd/9278qKEOSXfaW9vMCFLgFNda9vFIg6pSs
 cnpYahQGsKk6Y0oOZW9BZsRMN4+JLNnKVsmJjmZHpaypdtT7Y6TUDPetxf8z8bBPpr2UtJdktQ6
 ekwQhNKM3IqyeuOpuWTzlp1O7zWRgJ5ZtP9oWeOw+u9wnvRyK2w6I2jSTF2YOV8L5bURWgWIhrB
 DBiyyfmVVFEFZp9ZbPYK3rrhzKFP4sBA5UnGu6FIm/4RTyFwDHeZAne2QGQQBmxTApsAUdVcT9W
 BBmxHo3ahHcWRhntKWXfl8oG5NIQpVvd+MuAs3iBe/QW4AyIU5UmUhO7PP+5YFhdrsjezBiddYs
 jvYz/RnXspxf38wSeXA==
X-Proofpoint-ORIG-GUID: 5CSfXkLlB6E6U_zpZOkPFHJF-uH2vuov
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfXwWrlRAVUcxkN
 zIlEpoS3RZ6KhRrlfpduRcfMmpxIWuOFYf28fVH1UXsUfH2RIXUP8g+egoY+ddebWC1OmilqnPF
 xYUTJ4gQGR1a/gb51v1jGtFqHmnMPAs=
X-Proofpoint-GUID: 5CSfXkLlB6E6U_zpZOkPFHJF-uH2vuov
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140106

On 26-09-14 12:29:41, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
