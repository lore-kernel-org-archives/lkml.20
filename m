Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7070D3EEAE7
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813290; cv=none; b=teyb57H1aDA47/OfYnPWZ18N5irJcvGNeTBHknhqA1T+uNqpPK8AXHOZ6r8fTXJBUz2gl5tsWChE7X3tx3yppOr+YOndxgBSxnFEMxn+42C0FKdxiE4fLjdSEEKQlLUrYH4BkVEY5y8i6f+1GEc8VWvZejuLgfe650ogRjRvog8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813290; c=relaxed/simple;
	bh=58RZ06m5HkndudGPZ5z/6FTzyvzAQ2MwHTbtgryBeWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A8CMAeOuV+jAFVu5pCuBHHzr3+XsZjJcrRGwNSX/2QA3V/mN2yHuqWWl30YzgRcSHEHUcRYIJI97/fF6CY9rZE1YrsIeEUxqZyhRawSllCKXyr2ZfXD2KuiHv1A7GYt7PYwEygaVDMac0w/BURdEoRCqQGvkohgWAew8La3qyyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mqP8BSZ6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vk372UXD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mqP8BSZ6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vk372UXD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0PWi2088492
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:54:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KfHzq7kE4KUw2rk5Isgr8vtG
	bIhjMRZ0o6HxZtX9Gpk=; b=mqP8BSZ69srrTfMwU9Pf4Pxa44hA2aMLH9zVxlMk
	2m1Ez3zsTBqdNAKOUWUKZJBAeni457ZibYdQM9AG+ddNPIa06j8dnQAJ8C7PGWNx
	KStqnkkHQb8HOarFDWkuw+G9W8ZMYzJ3NWRJ5/vJyJBoDQgth+M09oFTfT1XpWhb
	MfxzNAl9PyrLvWDjPlMmhykJZGiDZnQxePO2pnF4wHywBUOTseb4C54AJrg+RpmM
	TmLGT+PUjZp7n00DbS5FGRWn5mAZ3cEP8NUibJWr+q3k3+CAigV7MAnK5NA8sNXg
	O3oAvzbW5qfITrhyrVnqQzLTjA42zlYJ3ardlxr1H7fHSA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu26vv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:54:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb7f9bb86so361748385a.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791813288; x=1792418088; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KfHzq7kE4KUw2rk5Isgr8vtGbIhjMRZ0o6HxZtX9Gpk=;
        b=Vk372UXDOIM2hAkB12S1crlHY5Xv3OzIBAtgbbHFFT1oPq0FiuMpLUzJk6lwT1Y1Ep
         TAZjWUsuGWVmvCpq7gJnZ/Bp8Tn85E353a8YdthwIAuTXrAWfs77LIwOjJ/Tgn6wdVFt
         nZdSD4HAmjMQHI91NN02BXqeQj8woS200HtdAgp+whnLxI4y+wTKc8C3ftltAkk2Y9sK
         9l82JNe5BlSOUaqGGLSwHDmtIwtyrkUbEVowmuOvtHq1TpA+Rlli/bLCRwqxAENQrVoB
         BzWhd00w8XWz7Pyz74fn6zgBT1fn1DOhs3sDI69DnhkkTTfB3Bi6oCJxUO7MOccBKXz4
         EYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813288; x=1792418088;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KfHzq7kE4KUw2rk5Isgr8vtGbIhjMRZ0o6HxZtX9Gpk=;
        b=PAvp0LfifCTqtc4nB+sXpQmgOELKyD0s87mskd1QhEJNalIy7vp4QXN0BTBeCs0FFQ
         NlQ/Rdf507qqMJTuffQlRHlfecZ0jqqYoPDNQQ8GSSqCurKY6FNEKzIAyPkq0YY+9OMS
         CJwBTUqLFd9b2NJTh9gTakz6TgQg5L8Of6qA1qtU9Gc4yaxpwqRuyk4m3uU37j0BwNqR
         +mwqqbgP8EIcmkxC0bU1igWVobXFLHwH1DqZ5S/h18pfopxPpA/wcMGqPLMaYEV6VGO7
         7G6f5bTAR4E9ywjLomdlmjCqCvPmmpW2BEC3kVTAU4eBcs5wN4xwsoPSGb3zu+Zl5575
         /p2Q==
X-Forwarded-Encrypted: i=1; AKwUvBy0qfEDQDCIrtSpi/vR4J+qtZL2vlm6ioWBPyFhm5hKxr4GnLS1R7Wb7WRU+AJkyqUtzSMo8cYzfFiTpEk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3Ww6j4lhmqR+I8WRNsIVqZ8vtFp0nx+RYXjWQjaY3HjamGuTf
	7CkBNvTgZmQZQfmwKYaL9Sk7chgPIvT9TE163ZSgERZ90NUW2y2+AhZrkA1FBfp0zV77nYcSbGE
	O01Lb1ZKA3f8xuxa1cKMH+390mkpaaWiTiSty/uk7qiG/hvItvAi5vI+FK9iqNz1NuG8=
X-Gm-Gg: AYBFou3KNULAoe3GshRFIybQX4BcGMY5W40K8oslRWnWRrhBmJ/n71GNqHFCWHNnL9u
	wUTjMa/wKvIbJmctaoNBAsc/1VdqbWJCnJzzeboW2P+jneZ1rNk9ycRJiN9pb7GJCYZxW31C0LD
	0UVMZfVU1waSnsjAnQi1kM5swJJ610jmtb1HuSzLXEDWntgmFRYUayJT9rUDnInDDxxHU2jCvv1
	cOFAt5bagUQmrzwY+Hfb04QMWPbvCc+aA2SDi3BuRYu3KO0fG9tNSZ7B9NQfjFsMqPuxfg0tJ86
	6eL8yMEhpWS2RFn2ZCVuKvUuy6pIY/uO6blqQBhTgrn7hxbcBQTFYA40C02oCuO3k4qtPbl9sea
	OF+U/xIlgxn9i4eg=
X-Received: by 2002:a05:620a:28c6:b0:93e:4833:82e7 with SMTP id af79cd13be357-93ebd22491dmr1590004985a.46.1791813287579;
        Mon, 12 Oct 2026 06:54:47 -0700 (PDT)
X-Received: by 2002:a05:620a:28c6:b0:93e:4833:82e7 with SMTP id af79cd13be357-93ebd22491dmr1589998885a.46.1791813286734;
        Mon, 12 Oct 2026 06:54:46 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18beacd2csm315386005e9.14.2026.10.12.06.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:54:45 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:54:43 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: William Bright <william.bright@imd-tec.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Depeng Shao <quic_depengs@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] media: qcom: camss: Add the SM8550 CSI TPGs
Message-ID: <5qabq7hqheokkaim2ebyq4ubhuhwlujuvv47ggk7scrlgjv5m7@2qbh6uvs7hck>
References: <20261012-sm8550-camss-tpg-v2-0-06dbbe36ecd2@imd-tec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-sm8550-camss-tpg-v2-0-06dbbe36ecd2@imd-tec.com>
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6acce6a8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gNcS5RXMAAAA:8 a=6X3vJ2KViZPjrVoEpqIA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=VeqYHxXNbGx7SVBbL1V1:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1NSBTYWx0ZWRfX1zB/UP7/ItxE
 bweFsLe95fhq92OdyvOMYlqsJpRci57ZPi37fz9AqDjDK2kLqkq6wrPn70mAgwnFH7Ri3aKBsCU
 2gk2K2SgXCwlXmTA12JEmZheK2x+2YbayMKBsZTgICdVbKkcng7EnobSutOgT/Hs4aioTgOS3ei
 +WpZedaW19bhyb6p1EGPrCGG8Un1+hFKy5bFF4R2l8gFkqzYZ92l6ydRhEkk3hvzEPQ+mkB6EFQ
 qqalvwCqlH5Nz5vKXmPTBvKJojZhhVxnCoWu9auP9F6BjlyAmN9UdeLihBhKq35jVQ1AYqwXPXl
 4Re9FDx4FQ+wH6NQFfrSSWQnV8J5+8CFylnXWXWey3KMFypxY3pB/b9VdwMJLnjU1VPCET81nnD
 LTeiu2ah742Mjgjknuhw9p4jpmZY85acb6lcGZHU5ZYK4GSYoaYdpYyBJkEtcaOE9+mVtivuoGc
 oQtTcv8VLkvmiTXDyMA==
X-Proofpoint-ORIG-GUID: jgcOEHF8keco6K-Afcrxx0oGmvl2WhOC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1NSBTYWx0ZWRfXz6OojNzXZR6j
 9j8whfVbtJ+t1ZC2rp7/fybhWS3+XePdvCiswP0RsuDF91zg9ItMVFMzNaKZBu9lFJ47kxK2da7
 oUagIIUJ3scDU+4F3zAQFbNl0lzCD5Y=
X-Proofpoint-GUID: jgcOEHF8keco6K-Afcrxx0oGmvl2WhOC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120055

On 26-10-12 14:51:59, William Bright wrote:
> SM8550 has three CSI test pattern generators next to the CSIPHYs. They
> report hardware version 2.1.0, the same as the x1e80100 TPGs, so the
> existing gen1 TPG ops drive them unchanged.
> 
> Describe their register regions in the binding and in sm8550.dtsi and
> add them to the SM8550 camss resources.
> 
> Signed-off-by: William Bright <william.bright@imd-tec.com>

You sent a v2 in less than an hour. Please give reviewers a bit of time
before respinning.
