Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F9D551996
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788956593; cv=none; b=G9EsNlwPJ7b9l5B7fcyLP+RXJZUM2ICZFNa2VOi4vveGlwayfRhukkLJsZK4wXxJGcVWW11K0OFS45JjAoqKJ6ZqL1tcB1es1sA0jlW7VlMTLUy2amgtF3HUlS+GM80lpnM8jeHual5tgTikoPDX3RZVs/pcQUnNoQWAhIN3akA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788956593; c=relaxed/simple;
	bh=I/m51bYBFJMIfVpaVeMrWiBZ03B95wWcbnMIQftSxvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xf7n4d4GqSnOgTKp+WID5wTTbc+003SWYzH5iPNLMzqgzm5hfezx0KK0KU5bH9nPosQQ5WzkM9XGtLoFWV9M50459MkMPbrnlX5Lo3+sjYnNv8r6/cm9lDbvEZRHInXO51slyHj2iKQpYOYYBQk1Z948ZKvJCIIlbICQwFpcyyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hPW3IlBf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CwBbHXat; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hPW3IlBf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CwBbHXat"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU3iU2171596
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 12:23:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	40mifBrIeRbLpVD8ylp/3JFiU+dqxXaEMYvEwiY7oQc=; b=hPW3IlBfKZFmKUS+
	ffM2FgnGgsgP3nq1EAFrAT1ViXYE88EcTRI608VdcLRzmHRpz5w/UjvJaZZoMWpq
	+SvQ0UBf1DCi46g9SXCWJkvuMO3zjJj3D4O0z2Ep+eGcOiPpY07EMgS0fYiXIQQl
	e6NqtxN7r6t6t6rkseRLed04oNv3hvK7Jn7zXQC6XkKfH1jjTnO8dfXGo4sfQRDG
	9HNRcztDEse3o1duqBAYwDH6KeIbOjLBuDa0nX7f4rDW6Jr+bgFx5UeUKFuDf68V
	/+tKbfITucs6YG3cLE6ZC5dM9I7PIWPYCGRbJtXXqSXQHmjKbL5thLbG2oGV3/fd
	qNjtxA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5rggd59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:23:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930bd2bfc45so77379385a.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788956585; x=1789561385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=40mifBrIeRbLpVD8ylp/3JFiU+dqxXaEMYvEwiY7oQc=;
        b=CwBbHXatzfKm1YwegIU9aGgs7+uvaut1cVv5Gn1GaIhCHfm9lyq5EV12lNsqczYexq
         HUIzg+gdwFT+IPyabahNhEQhOA2XcCksPfyNy594v6bNI7LDuGIT3LalfABIbW0R7avE
         RM+s78wxmn5x3FKQoGXTr998W1Dq21yiUG5yyLtsSN3gV7p7hsvWdfB271eNI13BV2/h
         JjVsNpk5SiRhK498Cq+IdfLroPk+CjWKFD6QkgN170QXQpEE2pjHa0osMo9kdQkE+WHV
         IHXa7gUewlofS6jdejC56aP+c7nOdsN42yGRP8N1BZt0fZAzOdk7bsIWok3emeQF1fai
         XKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788956585; x=1789561385;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=40mifBrIeRbLpVD8ylp/3JFiU+dqxXaEMYvEwiY7oQc=;
        b=BgobEwXVQZIp3236O3+PTcB34bVYsitxDPjpeOSqkuGjkvvQN/6Y0i7a8La7T8KovN
         3ubdKxR4ghn6Dnd42GK4q+Y4MeCX/D3iai92STwPexU/aE7WX+nBHZQ4UseXYq6MB2E8
         S61FgEi2rjIPmGdKQwyd0vXkxZ1raxeG8lTdInIPEZW1K7ueWHkkbZKH43DYFWrvAHiQ
         jmdSVPmwzZHjaFwj4ao4meFN7T9M18f/8LNYIxu1BhPDQc4N833p1BjjnowYxOZkXePw
         EPJSaYuuePqbBI5UZh8NlZTWhK4JK0o1VIywlfjfjyFvgWMK20eSLZIZvFZevFOXjAyw
         n7Ag==
X-Forwarded-Encrypted: i=1; AKwUvByP0xGjcZJSJgZtoOf+oLmjEKKGHINVBvFPB/f4aaSvTlHwSUxaUSwjkP/2KmNulk4QpRQCjCfdHXqFr6c=@vger.kernel.org
X-Gm-Message-State: AFuF++msGJz0lf8lGCvrfcsaVvSMWCHxfIqEbkrgu7mqEwT9S+aQ2o4A
	5XeZab4RMJrWre1YkUAd3+bYuhwbNRGzJAF0F+WL14nXNx7RK6jPEHK6HsrA/hXXU6E6cCk52Q6
	a2iZWBKuj+PlyDwxwL0Uo8SwF69EY98dWCt78Z/hKEzco/M6NEyCVxb13cLIggwRvx1o=
X-Gm-Gg: AYBFou2lXhC5zwMLizlvYqFfeOfBLOzFKn39iDU8IFAgua0jRuVQQtiFXDgSTFKZ7uW
	9HOiLZ1E5mJzvaZ6joRMVbrnYWvGEQ0nCeGdKzhpShAKhIBpJ2nzUWQbTUUl/thX9PGi7+Nlf29
	zBuKrHQL8HhaZ6wjnIZMkjqRP4TyMgeHOalZRt0oGDd68YYuUHOhCAlOoKHrlg6aOQjKO3FSqWO
	u9Jt2LSn5leleYHIIx9ZHyRsZZLQD84HSS5A4RRm7EJZsk9XlvPCl/1mR/KOY+NWmMf4h0qN7J0
	8HJUsL3iTnXhU0Smsax37eY8WDwM8IKZ/Mm1g+ZP6El+gXsrUyl83edm8xMFoJX5Z/TlUtoTmjn
	JLlTgQ8PfKeenMKaB1tZV0g==
X-Received: by 2002:a05:620a:43a3:b0:939:b8da:1242 with SMTP id af79cd13be357-939b8da136dmr1176464985a.0.1788956585484;
        Wed, 09 Sep 2026 05:23:05 -0700 (PDT)
X-Received: by 2002:a05:620a:43a3:b0:939:b8da:1242 with SMTP id af79cd13be357-939b8da136dmr1176461385a.0.1788956584896;
        Wed, 09 Sep 2026 05:23:04 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d55b306sm759612866b.36.2026.09.09.05.23.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:23:04 -0700 (PDT)
Message-ID: <179b5e05-b08e-4023-a184-bcd573213be9@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 14:23:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: nord: Add PMAU0102 and PMM8650AU
 PMIC support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>
References: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
 <20260904081619.593602-5-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260904081619.593602-5-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzOCBTYWx0ZWRfXyBCvarB0y2E3
 1jzuOsK5h2mGfRMXYlpAs20Ly0IhK/G3rM+mHk5QRNIjlrqpMm45b3PWXVCXB6zGCC6asI/XAk3
 bjsYtAmTaN3A+6o31ev1eEmzVo5bTWk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzOCBTYWx0ZWRfXwRDbMpOt49vN
 /kimyv2H7t2pZU7ViTAdNPMDqTX7jhgsOOtmNZVPljcHFYjJzcmQZ1ZZa+zi8yrr9EVoRwVbSlL
 2AIblO9mW4eHr6mb7+pXoKALocxxEdoLxSkmnV4fK2EeBJgnpFBVaAnAb9S5vi5R+/c8b4JphWE
 GIOaBNANp1b2ed8FiuCJA4lifq1Sy8LZOzoX+ydhu47q4oCF8iWsihTD5/yTGJxoW7P2W9cn7cz
 WGWIhShCjZgsgrtWKXcmmP+NqjYjmqjoGc017o1AIj4o2pkeEws8tdPKlmMRUnUZCRToHQ83nCe
 sSMSXsKEXKbuV0Rh7O+kbvO4lwmkXN/gFs3Ksi9W8BDDBN6n2VNo4yHaIvwXOHhosIVv1ySrH+9
 yXoxEyB71IjfJNGEYqF56YlERJg5EfO0nCAWH79Wi7cKOTHLTtJolFo6dyLgtn1mQmIO/+BnGT1
 dDnL62MGfPIbm0r4L/A==
X-Authority-Analysis: v=2.4 cv=B6qJFutM c=1 sm=1 tr=0 ts=6aa14faa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=_OBMBAdlUt7QoIKPFOgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Jtg7WTsbDEOJdH-bGXC1al4crMHDX4t_
X-Proofpoint-ORIG-GUID: Jtg7WTsbDEOJdH-bGXC1al4crMHDX4t_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090138

On 9/4/26 10:16 AM, Shawn Guo wrote:
> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> 
> The Nord platform is supplied by two families of PMICs on the SPMI bus:
> eight PMAU0102 devices on USIDs 4 to 11, and one PMM8650AU on USID 0.
> Add one dtsi per PMIC type, following the established one-file-per-PMIC
> convention, and include both of them from nord-rrd.dts.
> 
> The eight PMAU0102 instances are labelled pmau0102_e through pmau0102_l
> after their board designators. Each one provides a GPIO controller, an
> ADC, and an MBG (Master Bandgap) temperature monitor that reads its die
> temperature through a DIE_TEMP ADC channel. The monitors use the
> qcom,pmau0102-mbg-tm compatible with qcom,pm8775-mbg-tm as fallback, and
> each is hooked up to a thermal zone.
> 
> PMM8650AU is the same die as PMM8654AU, so pmm8650au_a reuses the
> existing pmm8654au ompatibles while the file is named after the part
> actually populated on the board. It provides PON with a power key,
> a RTC, and a GPIO controller. The resin is described but left disabled,
> for boards that wire it up to enable.
> 
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
