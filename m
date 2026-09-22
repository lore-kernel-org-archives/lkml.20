Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED744E01FF
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790060445; cv=none; b=CqfEbCF9uYxi2X3IddpaUso4R+LQnmC/LlFtx7sltNxscZsSVYXfLa1ELwgHAhuROGp2vF9KYXGu0DbEaFU/cPm1W9nL7jJvNKrjfAX8Ams3+AdzOtC3+yEbRTpNIfMASUqU4UIWl0L0xJqYW+60iIV2qOS3PwkdvGLoyRT2p3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790060445; c=relaxed/simple;
	bh=TCrbWvqf63u8uXM2YiguOWjo1ni+/8UwmnOPk+ac3f4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iFinAURKfdKkIdfSR10Mx24OGEBokkA6cKw8w1hVcUEoGJwMUPsLvKuaDCFIiRpgmvUYskHDSxlmOUjT0KNZ0OHDhs2aVfCd/ccs18qaO/YS8adcsP6fPIDTNY0RGN10JP3QlGtOrWnDiR2BXo9s+grmfKLwPrz5CDyfQF1JF2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kp2LTTKc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kxO4kc4V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kp2LTTKc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kxO4kc4V"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M00XFI2166198
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p5eN7YD3va4RMrrzBayQIdcp
	WFIP8aIvsPpJCSIUZcs=; b=Kp2LTTKcleB60FIKu7DkVnOONOM2SN7ZzVe9Dhev
	ZL+x8nu7BUks5qG3mX4lN2S0xF99Vcst7r2yjN96PbgnvgobXF7j14C3XSw3HNLK
	jtv9fsZ8bdtkL3q9GunHU68eCXsyC6KUNkmwA+vB3FsjY0JffxzFMPWkVkqokRiy
	TB7SDdyHobWBs9EUlQgbHMD9VTdqLUaAXaQxKKO2FqweSTSuDe6t/0+GlzyaA7u8
	rxYJorIdbgkVGk5GWfJc9I6hE3GfD3DTAFEpTxaGIMNZ6qIlUb7t3Spt1XXaO4PZ
	d1gY2jpoud7Me1YNb28XutwMblzsMarqlsW7zkLwlhNDMA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xetphx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:00:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc73f47bdcso62890145ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790060443; x=1790665243; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p5eN7YD3va4RMrrzBayQIdcpWFIP8aIvsPpJCSIUZcs=;
        b=kxO4kc4VWQc6yJepK7Dk9DyIosHs6Q+GCDoTCw3LYCT85PwECrW2Vzfc3jjCDtQmlH
         7w+EM64jrNZSEltswfIv2dGQYPsHgM5zyvRhQlV9NzydMO2GL5tODEwh98nlYrmQU020
         fpbJMyOJ04VP9fGWvmvefGYItOx8R+5BtkjRsPsPKEQq//6mSCDAKyrPzS4/QT/XXXW+
         +7UWFjCTR8HqtXbo2Y66MFi3CTw36BvIAQk+q8/gXTrwOnmthKVcc8wLgA+GNERTw5sL
         0iCh7HwLozXIAfl0MmYku099ADIwWpqzMLZfFVl0J+xSrExGs2WpYqaRACJh8HsriJ+g
         MxiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790060443; x=1790665243;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p5eN7YD3va4RMrrzBayQIdcpWFIP8aIvsPpJCSIUZcs=;
        b=DbaJEUJkTDizEmR4Td8/lgqWR6vlo946CRO0RN8343pzEnyejWb6u2tr2MzdTY/8/e
         rSHCVxQuo7mlnMZ3Z3PKVGJSYVw1sEvf7Eo7GAmCoBdzsJ+ANuPVrXBbgLqvEFyc4HbI
         +//gjzjGZrPs2isjLxTf9tkUAo4n0oZ/gVda40tHVCA2jXPDoKyW5W238eWDtDcqGcQO
         UfaOja9jLXFDkisZehOHZIuhsTgma5t6VaA9bg12Mx92Kx/DmbrS4O8lLY0DYjbkni+Z
         7fRyCTxYArSM/9a/4hPwIiUeZvrLXVq9uMlLbwLwLn63aFOHb81zduf9yc6rANYikehd
         +38g==
X-Forwarded-Encrypted: i=1; AKwUvBxKK+ZVVtSyUE+iZIBBy5YG0A7uAP5hhSU9WKQc5gABwgIcW7dKmdqmsCZ1plbLm3gv6OjqZ9eMg3NbZLM=@vger.kernel.org
X-Gm-Message-State: AFuF++mP7UXomaih5rxph0SZXp4W45Lf4PApEH6782Pvr5hZMizZmcXu
	FtEr9V6Qt/29+Uo5//VA+DGLEJNSVFUmOO5wTMitzdHCAR+a/NIJ1elaik4a5X0wciYL3jUKf5E
	tQ+D/t5QgWddAP4O6uR5qOMJkVvroY2HLcoJ4UGlp3NhN6hCPvQW87exnkixhwWJLEUc=
X-Gm-Gg: AYBFou1alsGKjHdf22LiXlDStVYQniEJD+9wh1PxuHRQG1S9ZOvrrGzZf3OZv8ANp8M
	VpIPmRfVtqU+A74uynLMl62Z4ZD3WaDWr+zoebNqinJK6Vwhnml7L+FgzaHTk8Fi7GJ0GKN5/2J
	q7Xk0+TgGlV7qXuLbU9+BmaExR/V/qe6BaGe7YyF4Gs/mkL0P0sp03qLudzDTWoIWwd6Ell07IC
	DgQ9Wsh+tHaQ7PakCV2h/onur7VVOByeJEdvZ3tMf6Jngt2VEWEmTDqdMNm8jrUBuL6ppSzBpkG
	AnfncwlWZsRnD9eyId3EVJCRnKHCTmnPepLS3lml3UtjjrR7+P8dlCvMYegK7nYXRpvxwVPk/T6
	wSxZPVrB+5zkPxfQKOCHhZSQJX3nHaJvQ00eqns/gBg==
X-Received: by 2002:a17:903:350f:b0:2dd:c053:82f5 with SMTP id d9443c01a7336-2df60b45f23mr2468555ad.44.1790060442846;
        Tue, 22 Sep 2026 00:00:42 -0700 (PDT)
X-Received: by 2002:a17:903:350f:b0:2dd:c053:82f5 with SMTP id d9443c01a7336-2df60b45f23mr2467075ad.44.1790060440408;
        Tue, 22 Sep 2026 00:00:40 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e610e8439sm3347130eec.3.2026.09.22.00.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:00:40 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:00:34 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: qcom: spmi-gpio: make direction changes
 exclusive
Message-ID: <arInku1hs9nTHd4t@QCOM-aGQu4IUr3Y>
References: <20260915014447.282121-1-shengchao.guo@oss.qualcomm.com>
 <20260915014447.282121-3-shengchao.guo@oss.qualcomm.com>
 <0d0ee38b-8ded-480d-a586-d26b3c292427@linaro.org>
 <aqyPs5d72s80G6b8@QCOM-aGQu4IUr3Y>
 <CAMRc=MeB75OeOLeO8nqLXQJMHcny-fN-0J7QGQaSbof++TqFmg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeB75OeOLeO8nqLXQJMHcny-fN-0J7QGQaSbof++TqFmg@mail.gmail.com>
X-Proofpoint-ORIG-GUID: DbKVbSXsDYZeEkVGlEtO9U0sg6AvAO-W
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab2279b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=OddHCmqlFxd8KxF8cHwA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: DbKVbSXsDYZeEkVGlEtO9U0sg6AvAO-W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA5OSBTYWx0ZWRfX7/SGOARuTrsG
 NZGsWdkY/bsDhkNoz2+zH5n2CFialWgPzpFXfVZEWwoeli2uPm97cdm6rId0WoWFpJBANCHuVnR
 AvYS9dbz7sPXoze3kK/u0r6PHky/RZqeDOQ3C5CIt4UjwQcTXk8bdRGi2eA6q26QSJTIFPvyTf/
 92KNExZ+Fwpx2mA6YB9PiTFHnhWcNauygrarUHKbSDX8Az2Q3itOpzQxn4Uy+c3grxonCJi1/aY
 OzISsl+JL92GGoFVK2u53ADpCHwf7tV8AEGnIs56YX9KIm0z/IZKZaCfKUKi5LoGRBUkv5EMenv
 t6fDNZB8SPcYQxn0D0Fv/MOvLdr87u7J9uOCXibVzz+H6gM3v+CU/MT8Lv3TaIKDHVq2VQZ8/zk
 goV6liHIByZ1C9rY7VNJDRWCiO1Q5m83XFasl87d10Rt5jMXXIfJ7KdEu0rzYoPFavfBNnUZwEj
 251JZaQlPiM9c334KeQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA5OSBTYWx0ZWRfX0nXoy8I53K3o
 5gXjUaumG4hcoW8kljdd+RxVF32mtdxB7jZpCOt7CGnS/qDCJkcIowkhyzoeCEsS6R02odTO7J4
 ybg05g3CjancU5eCrp+M3ozjDAnIyOI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220099

On Fri, Sep 18, 2026 at 03:05:30AM -0500, Bartosz Golaszewski wrote:
> On Fri, 18 Sep 2026 03:11:15 +0200, Shawn Guo
> <shengchao.guo@oss.qualcomm.com> said:
> >>
> >> Personally I would prefer patch 1 instead of this change.
> >
> > As I mentioned in the cover letter, both patches are fixing real bugs
> > existing at different level. So I prefer to merge both. But it's a call
> > up to Bartosz.
> >
> 
> I'd take both but I'm not sure if the ASIS case for shared proxy can be
> addressed without reading back the direction.

Sent v2 by keeping 2/2 only and updating Fixes tag.

Shawn
