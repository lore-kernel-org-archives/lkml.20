Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3153264D1
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061508; cv=none; b=XW8XFco+AnSprFFCCgozWDccQ3X5dwBC8iNXdWWxpfIs5iZLBinbWv4Eiy63EmJkkWfFn6ijXY6PiIVw9+2clTIvBVqrQuwzIgco5sk6rRVCtsP3M/KTOTvxfiKuTzQQ5lN2we9K20owI5vOc3Qe9p297fBeRzpTs5EveJ+1Elc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061508; c=relaxed/simple;
	bh=OMY/Xe60UBY968wgbz/CYZ1bEgUa1Cb2nvJ9EExZqTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WkG0cU7AIYA2FgStCnDfeRJaefR+seceuofWcQY3CWR0cQ+p++xQKVodlChK/WQPm0QgnUjRQhj4luyo/0Z9y/E//cE6rzQp1cr984hfvJWSzKuDjQcnd2c9zesuFcTiGfTXXGpvkfBJ84iz85ckVzW9uQ3xEzfqvn1oI77OEj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gI7OFKrk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J79c/P/z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gI7OFKrk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J79c/P/z"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jTk82809323
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:51:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dc0xqqqCiVqo5Myd8N75P9isi+bPJQnuJ8HETB5D8Mg=; b=gI7OFKrkjd41uoc6
	9jwMd++P7C7VOXdaEdLtliukD+2R7T+efvjS68Ia0LuzhTvKIEEuJEuxUlr3bOkK
	aoX5nEf8qwjY5h5yVMwsLjeBWvpICct2Nyplo6xsYtZu11SuxCWLOhqubl6SsjbC
	KPw577Rld5Yo0XrnC5asiEcsrS/DsJOyPNAeHmDDXVOSbH5Xg8Ezc0RYzoiA+0f5
	2q63U0dbv1VnMx/Ktxe6NED6XG3UYVRsaYsnpaV7A5cv4S0bqFgZG3D1rWZrRzTq
	Iavd3JwEsdDiuwvxg2x1Qwpk88tI66musnLfisOgZLGrBVXa1fTFjnEfHrvKhgKB
	2ichkA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54t5wt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:51:37 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917ad3b42eeso12840196d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061497; x=1792666297; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dc0xqqqCiVqo5Myd8N75P9isi+bPJQnuJ8HETB5D8Mg=;
        b=J79c/P/zSkC2DtTh0ZJBZ01esKbWQGsUgWFDHfWzuFDOJqYMw2Nb4Unywq5lwdQI9L
         PgSWDNjLmzDDJkiBl8XHh5ntyyA+w/21yf8Jb33x88RoiC9FzQJRrdL4aq1P+JK53K05
         ZVrMFR9OXntGypCkMlUdJgdnIvUxagvRMOIg8Ewj/qwG4qsIs0D6FaJw+h+XKRRYpG7Y
         lVwgBBiCT7LLdOkzNxE7aEdhhb/2ROxob7zHfe8j18tFjRMdZuH12oIDma1n97NVUYyD
         4tWHocp77mfSUHzO17jI5E+IJfzk2BJeKZLHut28vcxIF6omWLdXpH10PnJqlerb1kDA
         TjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061497; x=1792666297;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dc0xqqqCiVqo5Myd8N75P9isi+bPJQnuJ8HETB5D8Mg=;
        b=gnqQXhQYsQ2k0s+S795F1vv0PV4szIkapsZH1fePuh6sNdQzTDYGa0i3wwIY10v1+z
         h+cTYYhlsgDqgRThkeufEIBQ0JCWorepwKT2NPj3L/7vbI6JZcjU3vFPnRHvRJVxL6jE
         m3ed2RKuStJJweEbPTPqZVsTX3c8DM45SkNCvs3jTx1Camx0fTZNqYvyjqbyDd7354ff
         UNnthczBdVd+0paOW9zpsULf6Vw5S0mJ7GmaDh4U9Re0M7M8p/Xjjr8JKIhnZ9nMbjsz
         6dmvkmN0609t86mHj5molIvX7PKoH/h4E5tq0HlEl5nx+z7iYocmqCnqUwAmUNROVbaF
         sozQ==
X-Gm-Message-State: AFq9FYLVOR9Y7I6aN+d7i6Qk2ZBxPeLfa8LJH/7WtmgZBjtL9PutzmCO
	nxy/r+LT6UQlqinnJPucxNHnCF27L0Npqdzu8OXPpSInNtAIfbS/VYWF+BaLDxrWemOyhGRoDnS
	9yFZTmjsZzBUbqiSU8VIEW8iASeRa74aPnV0PNe7DqwUUQ8DT2+2MJRNBQnJJEB73aSk=
X-Gm-Gg: AYBFou3hkLMfhpqiMLk2i98z3g5sUp5n5cXIw61fMklJcy/8MfdW1lzdlPeBSy4BJRZ
	cXtyin6mdi7eUHW+O4+bY7TqbYgX3FPO5PHMGpHCXovOW878NXQZx7LLdcQMZyI4VcUSRP66tzz
	J1UqYgza2ttv5Y+PqB1vT5ysJd0BxHVJa1oJ8uPLA8FA16kZa+kbAvfCK+GT+be00snQn8vUA6Z
	HUTewjjVUEn69WwJ2U29ItulfXkS5Ovj4klmjf1qU9QiiH4brOjqEgrFywuX7PQPYMUmwdFKLMv
	ASSmKjc+og9/+gAhFY4IS4D5ZAuNgbDFRmWJNHf8JiOZxTME3zwbMj7OVZMBdfY++vg/0692x+N
	ZBAKOc0DssykLRlJXLp5DSA==
X-Received: by 2002:a05:620a:45a1:b0:939:9205:4d78 with SMTP id af79cd13be357-93ebd1ff38fmr3642744185a.3.1792061496651;
        Thu, 15 Oct 2026 03:51:36 -0700 (PDT)
X-Received: by 2002:a05:620a:45a1:b0:939:9205:4d78 with SMTP id af79cd13be357-93ebd1ff38fmr3642741585a.3.1792061496206;
        Thu, 15 Oct 2026 03:51:36 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed9640488sm108759866b.25.2026.10.15.03.51.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:51:34 -0700 (PDT)
Message-ID: <512837f3-597a-413f-a8de-612e26c8c78c@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:51:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] arm64: dts: qcom: sm6350-lena: Enable wifi
To: erebion <erebion@erebion.eu>, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260926-pdx213-upstream-3-v2-0-b4612e3eb536@erebion.eu>
 <20260926-pdx213-upstream-3-v2-6-b4612e3eb536@erebion.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-pdx213-upstream-3-v2-6-b4612e3eb536@erebion.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad0b039 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=JgZe5hknAAAA:8 a=EUspDBNiAAAA:8 a=If3Kxn03tZdP4ytwtUoA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=ODtDA1adfiiB3BH7YLNA:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX7n93QaaGwTUi
 KX49avN3GRY8dTHpMzZa3OoeWkYrjixSjIF/L73A+QSShQ+afx5ce5DhXV721bL+ulVSfJyd3HB
 BUDzYWkxMrO7bPw0PCoQYnQYTeqcvfzwlK4HHI/YjK4s/1J+PMsf2SKvwIggAbJJBzUeh8lAHq7
 27uSbbucpKdWFzdd40v/GNkMDfYWAkvUjugaLK1sw/39BficpZPI70KGTj9WyAquia4t5K9XvMX
 d//IW2vsAd6fZiKsQXAbETsTCzO9egUk3VUTYLtthP0FfacD9xxGsrYUaj9T9MTDecLCDBhVHkV
 HS8oSUzOfXFaAMwbsQ3oxXLLOPRt8gVZEbLK7P4CwmGFE/rz5ZUn+O150wpleuLGDX5Rn3XGGg5
 miOiJJcUxh+Cb6Lkbv8lzvDwe2oTlOHy3JXAzLT6e2tjfZSl9qw7JhjYvWxpTuG0GxYj00iAbga
 CABY6/bCUHqQCoaQbIw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfXxWiE0RrXQ6rj
 l2l249BDzKwp7QM7TusyI2HWHWVi91oPDmojDvCArAJpzJWDNejGF9oIFqm4TEPH7NGAHxYINNY
 MrAISgpELDRKSky08XiJwqgsG2enGTs=
X-Proofpoint-GUID: azknMNx_G4dEFsH56gOx38j3tfrr4E6B
X-Proofpoint-ORIG-GUID: azknMNx_G4dEFsH56gOx38j3tfrr4E6B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150043

On 9/26/26 4:00 PM, erebion wrote:
> Configure regulators and enable it for the Xperia 10 III
> 
> Signed-off-by: erebion <erebion@erebion.eu>
> ---

It would be nice to have some more details (chip id, etc.)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
