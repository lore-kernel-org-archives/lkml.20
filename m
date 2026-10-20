Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500748;
	b=Kmykd5S0Yk3WUlnzwOpL0Fhr12uJFDdwQHm+KzZHjtUIyRQCgDGvZZuYKSazHrL1Ktxx
	 g6SQUgz8z6sXIMXr1/N1brSeGK2Qurk/sdPmOdIxlFPrBQwdoJkgAjA8sfq/ugt9UQp1g
	 G8ChUOpeFwlAyGKxRS7b9Z5JR32cmiCATEpbS/ZuKYUQrkwlTn4CUfuXqldhoqUyDN5u7
	 Y0uuKtyX8c9d7qORl6x0OCDuuDpfFcQk7evvlO1g6JgGXqmGgaKvlwlVfzSPVhZCISL9A
	 VZ5L0cWtV3qNAIPmnkAeP0BqLSxP7gchHZjNUNPs6h5/kvJpgTLNeIygYFWliRvXImg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500748;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xdCT9mPPml0Q8wxCTcyjG2nS4+iWw9bwXUbx6nWuof0=;
	b=5PptQK5mX/QhS0aqFGjtYGZ17Lsc9gvNDUzGC7Gwyg3TtQYb1XUSESvZnj1jbLNvpXWG
	 sdzlJpEotg9SJLzIn2DKtNBzk71d7aTqZjU/kgSvhA25d9+Bftv4SVmOEpeDKOUkICSCC
	 ropFhXDo5OAxomCUwbGedp0OQ1lhVASHkJ8KfFrnVE/FjcKFFbpQMYhDIPBYDRYKdiaM4
	 KM1OPpZzLWHHH3K2XuxGZ1KECiSrz95C2rgiv2b6yiJIPq+5rszOWDabT2PGIkK25nQTq
	 Vrvo3ZgZ6Oi9gz4DEClwBro2xtrsmW5uNCo+8g/g1kFfBc/pJaSI6QH1MvXnAha/CPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JUvMggwp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NKvotkgg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D597606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:52:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D597606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JUvMggwp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NKvotkgg
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KBWWFf1571800
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xdCT9mPPml0Q8wxCTcyjG2nS4+iWw9bwXUbx6nWuof0=; b=JUvMggwpxL3toZgH
	hutbs4SCJOrpTKJft8P68vKHx/tLNum5fkeLv26k2g6LlQNPIks0jXoou2PGtzXj
	FEn8IO/EqIVxK6mgqQHSvuwr37HqFEyzmm5RVdR2s0n+9QpIISgqI38Tw91G8MIC
	NeE/E6XEeN/T8bk6fYiwDJ3KPRRi96tkKqCFPpim1d1OB62AZclx4QbvKa5TqeQY
	DJVu77NwPGTVxKvRjGM71WjITDk47YQvxwj/Yt0564H6gk+Hg8g1dtgBiMECM4My
	un7NWuvVIkyeFkb6gMunwPXCEeS1OHqadnZlQNiNVZwr6pRdXKq8zZbdmxE+n7ka
	CDzlPw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h288ap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:52:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f2fafeaso442793885a.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792500746; x=1793105546; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xdCT9mPPml0Q8wxCTcyjG2nS4+iWw9bwXUbx6nWuof0=;
        b=NKvotkggs/uunAeiSyukUFvAIPFkm7QjTKUiPq2/ujqpm9Q++FBmTYDWmM43BoYahy
         w3fq8mapMbmjQYBp26KjPg0XFYdjWLE/aIBEFfi2GszvLwRqZNl17Xuod9dJPFPp4MfL
         81QduXHIOJFXgbucnMr8HM5K+Vi7ZYhcp9QHd2QU8SGUMoy3wD2x757DIpXpnP4I3WzC
         ky8RGJBs9+MZk1IZ3Gh4Tdmc4cy6f2yNw3CWHLRJ0sbcFPfC92Xs/rhUednqjp6YRoGQ
         TZtO8IkrVxZgUFHvFlRxwby+bfP86uB28g/Nz1PrO/JHiTsXqkI875TH01QDJs5jW58R
         QQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500746; x=1793105546;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xdCT9mPPml0Q8wxCTcyjG2nS4+iWw9bwXUbx6nWuof0=;
        b=qwkb2yeDMtsePCtCkZjBbl/FIJrliecm/5PdqEZufjcC5KTZRvCRSufB7xpBGHOuvm
         0jraRvGbfUc7YGA7nVh/jVKfnau2n9F3fiqaQ1K40aGzttJi7hawBGphTQ/DCZ42uy7V
         Orkj9oZdIZl+LQh2gBBBJJaOsmIrt6Ynn2Sv2mijRHQnszvza6GXksQx5ENFtOoScxDj
         AJauUyRHcV/gRmyLoT/iJTGvl9pIJtJh8PhzsrTGHRiQMO26hoQi4bTCxez+wzJMINNu
         yl0s3j+wFMkRn/ecr6912gMYoOEBY/Xz5tqz84wsXIjQOE/+IpC35id0i2ihckgJ26uF
         lcYg==
X-Forwarded-Encrypted: i=1; AKwUvBx+ysM0Pedr/4mEZjSdDLPcejAJyZ/zRym1itdeAIyoRXAU/u3zUE5aJyVmBKlVJ55LN+xfem74KXROBhw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeTLpk13q4Kx8eZOse5zxWJNAvNrSnbLtmuAeMobZT6cD952XU
	BZvPmywTRnHCmtRNRy2AjlyJbfunsZzPads28d4dn8QI+i4t7cSQKrRjwiO65K7+FhQOEGIej96
	B3ibZoVCs7Ih5WszNva1KbJDW7A8CuoO9YG4JRCDNtPL/KHepwYJUaJxjMRouASmtQcA=
X-Gm-Gg: AYBFou1P8RFkPXWFCFqr7JNRQ1U8Db6FxmlBA5uHx501dDuUfIGx0JQwOcdJNO/5+HE
	cU2U6q0DoE26zCu8td0tughkE1pwcXBp2HWlyAAMRSLYGGcRNPh7lO1WzjX/UrsRkhXdKjwGa1l
	wfCBSo9LTXWXfUJ4mweSux6ufmlQMwCBRflzA2KhOr3L3iNISZbm0lGJMVcVHB4TdMQ1O2l7EJ0
	lzClz7bocMSPFyt510UcpRHUxN6HLGyoH9kkoS3OjMjS20bdYBOL5t7VHQRB29wUFtg16nEhWxM
	KUcFv60dYuXJj+kwfwX+18mE+tlgKLqNPFMeujGtIuvy6yhBAYZfMjWZqP7RxcFvZ3k1m0YQKaf
	zfoYhAzEnI+5VPrC2
X-Received: by 2002:a05:620a:2948:b0:93e:d364:c9ee with SMTP id af79cd13be357-93f29dd495bmr1630743885a.74.1792500745862;
        Tue, 20 Oct 2026 05:52:25 -0700 (PDT)
X-Received: by 2002:a05:620a:2948:b0:93e:d364:c9ee with SMTP id af79cd13be357-93f29dd495bmr1630737985a.74.1792500745230;
        Tue, 20 Oct 2026 05:52:25 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d80f9b3sm5714688f8f.20.2026.10.20.05.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:52:24 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:52:23 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, gaurav.kohli@oss.qualcomm.com
Subject: Re: [PATCH 2/2] arm64: dts: qcom: shikra: Enable CDSP & Modem cooling
Message-ID: <isldc3mvcyqj3o6dzndztlobwft76zkph2lmlryki3qkpoxset@izxcyvx623vp>
References: <20260911-shikra_qmi_tmd-v1-0-96c1cca82f30@oss.qualcomm.com>
 <20260911-shikra_qmi_tmd-v1-2-96c1cca82f30@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911-shikra_qmi_tmd-v1-2-96c1cca82f30@oss.qualcomm.com>
X-Proofpoint-GUID: vLCRiKlLWPlH8GCFB8iPVk4lO7bd0M5L
X-Proofpoint-ORIG-GUID: vLCRiKlLWPlH8GCFB8iPVk4lO7bd0M5L
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad7640a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=8nJEP1OIZ-IA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=WKeXBwMsz3nlfjH64nsA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfX22JLqK7Yg82i
 1ZfwtjCIk5jLMWWAMFEG4CroHF+VZeeMi+LVHjEsEKKw3tPrx6r5Eb5z7Q12WKaHSW6LsMmdErO
 8n7deOL4cYZfW22EkGYUUrnVjMnRL7I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfX8lXoDiv/atZl
 9TKlxXhfIgJfabhDfoR4pGIT526Fy9LsATG+kLNpWTr0ZxErZ7PEjym4wlN7qkdMsONDxiF36Ep
 fCfuKH4J2OvyotKNuy28wVqjS9FDX4rac81hqppIfXCisPH3or53yfEWxKOy39dp5anelVg/L3m
 UqKKzY/GyO6TW3QSN4Y220+5TrT5RC4DpTsANwPW5HU69h/gZ7qCd9fX8GhH9BAQuNd1SJM0dJy
 jnpJ8iAhyhyewROE5kDFU1Lmg3zIa2KoPMtxRCkm203JDw/gwjTi78et9e05pQZAZPL2kTM+VW6
 sWKHJbjh7lSRQq+bYvcVLcCrapzyRlEV4667pdeGU0oCSheoLGAqaj5GjcvYzgQscMsKG4ihf1Z
 LrUnDOUqD0m6Zl//4NoZtGf5clxdVpFcWBIiSO42P9ZjierYGZx8bMfSqSIvwQ/63ogpMhz4IOU
 Xu6R5gFcOcAui299Fyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200051

On 26-09-11 10:33:04, Dipa Ramesh Mantre wrote:
> Unlike the CPU, the CDSP/Modem does not throttle its speed automatically
> when it reaches high temperatures in shikra.
> 
> Set up CDSP/Modem cooling by throttling the CDSP and modem when they
> reach 115°C using the QMI TMD cooling device framework.
> 
> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
