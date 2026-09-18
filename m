Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7B2389108
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789734573; cv=none; b=Ekb6B4gFusbBk0WScbOLglHCTq8Tk0t/IiiLK9BMhKYk0VWNv8xZxtGgat2f5lUwYoeu9pkF1mdw2DPvrCK2MOU8r4sK1i8O/hCRIw+MvQCWXK0zZ5x3ipI5kR0iEuHEjGxYCXNkvKUjOGNvlq9GpyRgMYVr2oywLhozS68Euyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789734573; c=relaxed/simple;
	bh=nSwLQCSCwANRAsqBSnLcGPN2DlqL+AmkhbMOH92cits=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bVnPceCs64bRWqPvuY1Htoy5RGYzpI96DTXCjUHd+/843DfthzvPohdE16P10+wsUqbq7/3Wiipwqr7ByH42bmKFMKAmRlGrVzTcwPVXJp6WqFLABQIufZTZZQZ0nRBvREczSvi9kF0NniPiq0vb8InjHThYB4jc1tixninrMGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FR4AK7oq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ECKO2vZt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FR4AK7oq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ECKO2vZt"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9eZch523436
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:29:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SmcR5sjFJKe+lRs3BkZxPHezCF6SKm8GZJtIuEc4KDs=; b=FR4AK7oqDNJSD479
	xKKE92BS4uXWQW3jNtDReDJGnmwyp5z44hNW3w2JgIVliYHTrSu/CHYXw7fxhS3j
	4LxI+JE8yFcXkfwvd9Hg9JqjoWX7hXTl216Qt2FXksAB+1ArIfxB4K1GmPY7UHHW
	aMHoUHAOaE/w/1HqWHmR2cnQmXf1OC6IgjfdSpid3vHkYkGgZVqCz+OXrJybsHsm
	bJlAdgGLGYdHh/f0mmt7nmcV+jvfPJRqYl8weOWrJGWhDKCc/hkzBLVx271cmyIH
	cpgJMV+7JEx3H/ahIz3paRPX99ohIbMbErP/g3vZKKAQiuNDMwa5G0pDLl5kRmT2
	FEnLXw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grnqebwr5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:29:30 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90cd500ad0aso638806d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789734570; x=1790339370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmcR5sjFJKe+lRs3BkZxPHezCF6SKm8GZJtIuEc4KDs=;
        b=ECKO2vZtBmj1LVoQHW0Fnl0dT498AUbbCLvWUhIuTk7FHj89xTbg4mM3+Jo1HA2TCZ
         gt7NhZGKlqy9RkOML53nhYDEB9ri8PCBh1CCkHNLW2+2ZiAiy2/UO3LDt7vCsac1bs4v
         S9UKfvyNjsR19hmwNvzSJPYrb3neTpMYnZ21/1ZHAxhaEUfCsjW/PSN6v4T/TAhTcQwS
         Wi06FtdFAccsgxIFs7hODvQ/2nOUJxPUSlBzSHULxFwWCw9DCV6SeG+Nvw2XmRqy8M4C
         uFPA5NOfuyY3FRt8tx9+C6h/rGzjOvwA55HIvbiTXtG1Le8ge43Zr3MexlPJB9J4dFgn
         Xybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789734570; x=1790339370;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SmcR5sjFJKe+lRs3BkZxPHezCF6SKm8GZJtIuEc4KDs=;
        b=pa3bYX/4VvGubAbR2Tu5hXTPvAX7Eg6LgpwfiH9CfH6XH/rXYxQ+HIK/r+Q/LBACIn
         ts5fR/AcNNm5U6QqyAfZisnIVFW6SAllBJPMqZtTrCmSjcl78BaoJBhMNcCNetyyaxBc
         EfGwmhqH+7G7OjqQignBRw+ce6dMnwnylKpfqA00sH0kPDG6BLUWkydp6OR4NKzbQwzr
         XafLRTqaecYYIjlSvSaPCxJHJYt3/1VxcWAtbuS97g9gYoZO4OAUQH3xtxtjUIE2BK2z
         ZCONYUvCCJfHNYap7UqdKgCEQjP1Nns8BR5WIwRp6t1dD8TlhKsVHidXHL5T9xcQeMEG
         FwLw==
X-Forwarded-Encrypted: i=1; AKwUvBxWsilGOHEThGmXUquhcTv16qjAXxLYIvRkkqRDuBnjegkvuIC1p6odAQ8ObC/LoJcvwNi1uBNwFyb8WqU=@vger.kernel.org
X-Gm-Message-State: AFuF++ldh7MeBpmobk3IFDuaBW3f1jyAIWh1zc3B3YtNI0XTVcSalQtv
	1n5DloJQAQuQEk0eEMYoLbKtM0kZQnLcHoSlkz39AZxHeZXzXYpR8Xz1XwFA4f5OpfsoDRn/OJ+
	BNCQBIUx60Uzu9MBgTWG5jdAU503iA0ajgJw/avWzZ5Q1V9spGig698zfidaZCWNmQTc=
X-Gm-Gg: AYBFou38prTjcrekw3ebq408MJ/ly8G/q4yj7fCT8cWyjZ3SlE9/3fSlTvF4XeTABo6
	3zGYDWSxBA1XDZ2PAbWJCd7ouPur+jsgjGKGJ1QBMf0DiZ4lg36+VZ6kVIwEv66ciDDW+HLsb9z
	gybuESjRvmwRpTMmOVBqSyu76hG/ST3L7J8SpKSvhwD/WEbYWnAtJ3sDQeSMNFBMOehtnNU/y9a
	Srh9Y3U/XYoko8tTsfCFClYVAoLia/3E5uccowkodT/Ax1VuROXc1AQm8G5fKqd69LYgH54J4KX
	wi4563wMyoJw0uiNyf2EXavt5YljPZF463l8tGAmOI64kyXq4CDpXBAi1pdhXY/RWNdVv2M5p9A
	3RxY5spqkHZFGDiK+CMYk8g==
X-Received: by 2002:a05:6214:21c7:b0:90c:c716:91b5 with SMTP id 6a1803df08f44-91256ef5ad8mr31423396d6.2.1789734569909;
        Fri, 18 Sep 2026 05:29:29 -0700 (PDT)
X-Received: by 2002:a05:6214:21c7:b0:90c:c716:91b5 with SMTP id 6a1803df08f44-91256ef5ad8mr31423026d6.2.1789734569451;
        Fri, 18 Sep 2026 05:29:29 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb423fdsm49488466b.27.2026.09.18.05.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 05:29:28 -0700 (PDT)
Message-ID: <92b7a87a-c086-48d1-8487-883dda7c4d70@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 14:29:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: embedded-controller: Add ASUS Zenbook
 A16 EC
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260917-topic-asus_ec-v1-0-373516d347ae@oss.qualcomm.com>
 <20260917-topic-asus_ec-v1-1-373516d347ae@oss.qualcomm.com>
 <20260918-objective-okapi-from-neptune-cbcabd@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260918-objective-okapi-from-neptune-cbcabd@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -P2oR2TrOAGnkfj7X5S4YovZWiL9DchR
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6aad2eaa cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=osjX1abir8ybeEd1uJ4A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: -P2oR2TrOAGnkfj7X5S4YovZWiL9DchR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE3NiBTYWx0ZWRfXwbABGR1LgOuE
 oS6fkDc2JX6uDlJbBN/5wRih+Zosl2/YP5IgJpoJrHhey+vY+PyKqUzZPN/zOFK9O6sJBUxfDlp
 7u2kaWbLXx5chwK/IxM2/HmGQB27f2xqunuQxjl9nUg4pY3WSvrfIYgCd7euDfi5vwAr/6YdE3Z
 YBbDJ7+P1qybEWH7rtcPyndCErVYz2gFMkQReTA4vFDbNWFoPG+gEWNaN0xezWLJcfAQzPjTNAG
 6HqCinuSQJHVDXkCJEvR+9colZwN+5Gz73zyCauB71fJqVsGe7ZgxiQnn48KoTMDgtVOC46nZPU
 agrApenQmR/PVLaRqFpClOCmJvFrYs3gsHk9NOkRMKJMzW85i8fyJZMQRYxMnsCP/FbAMHwGESe
 MOvi9sL43pbzGQWKcZcCTNwJ0JwUfbajwF228hs0k+l0Bzr+AZD/sW5/dl0VPbn/+OPtJutzDbJ
 hDs/LNUY5XDltb1gXyw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE3NiBTYWx0ZWRfX5vMZ2lO4dom0
 M5DziDtXZm0qibUYOHSlKgFou+HmMswD7H+j9dNT3doygG/AC8hm10dN0RBpWUsVRdG327a7uQd
 0KN6Ue6Spruypl7z4g4snxoMG1YJ9d4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180176

On 9/18/26 1:34 PM, Krzysztof Kozlowski wrote:
> On Thu, Sep 17, 2026 at 12:54:56PM +0200, Konrad Dybcio wrote:
>> +description:
>> +  The Qualcomm Snapdragon X2 series-based ASUS Zenbook A16 (and similar
>> +  machines) come with a custom EC firmware, loosely based on the
>> +  Qualcomm reference ("Hamoa CRD EC") implementation, with a lot of
>> +  customization.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - asus,zenbook-a14-ux3407na-ec
>> +      - asus,zenbook-a16-ux3607oa-ec
>> +
>> +  reg:
>> +    const: 0x76
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  "#thermal-sensor-cells":
>> +    const: 1
>> +
>> +  wakeup-source: true
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - '#thermal-sensor-cells'
>> +  - wakeup-source
> 
> Wakeup source should not be required. If it is, then it is completely
> implied by compatible and there is no need for DT property, right?

I suppose it's not *required* but it's highly desirable.. should I
just drop it from the required list?

Konrad
