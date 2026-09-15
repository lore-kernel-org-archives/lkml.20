Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A38B418362
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789488847; cv=none; b=UO2m3INPX5+qHbpUu50J9P+VvGc+carqddiUHqKvTIqsXS5SDWA007Y/19aJnPKAlxAJyWWg4rZFUf4Gu/P6+gaSw3LqnHc7rCHyDlCKDVX+xXlZPRdqOZMFIJSPrV19F0KhuwqpSKTqspY43a7V9h9MBwiuFoyh/9OreszxA5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789488847; c=relaxed/simple;
	bh=MlHKCIDftQUUiqdo7pY6YogHn8cAYCZTI1TX4Gk+PkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CevC3eVF993RZah+BdkLxwhFPzK7FkWvGUydI9iViW2mvt9wtXp0bkwYyvRV+mRYtD2qf/UP1AdXokrHxh/GhYrPREYRTaXrWQxfN46xx8l4ajtYZ+NprvjrVgUFRahQKLEFZ47oUsB1flhe0RgS0xV+lVAO/j+m/Fcj7bQrHEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NN03Ugo4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bj+U3T/u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NN03Ugo4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bj+U3T/u"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAu9m3349646
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:14:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SEByWohEt8UD32R858BbZHwlO9aNQnUjtPRKe85QaV0=; b=NN03Ugo4Y3iGUuRF
	Qmqams3nA3Ibn7zgg+vgTzwF2RqBy9aJxAmOL5NA4cICe/jPd667j06qmUxOO++A
	L25KlBfYZ6IZX6hqCPfZgUnUhhwi/dAvmiE0Z0QPVjoxh1c+1++ygHTti/ttm7kD
	7ypPfjDhCNsjsalNpmwPE8O1J0eyAYj2kV5rk3lJBZYuuPVfngey6NjSN9AgHdqs
	6vgtiRlQ0WAK3YcYaBHyxoXTzvxvbbpJ613FyeN9GWCSpIZKaEFqhElpWh7eqTow
	mDjQPKKfq66XB4pl7/Bvevv+2gmR9NzvId9krl54yH0B+jEuW5NP7r7t3iQ8qu43
	9FNRjg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpx4sc3ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:14:05 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78fea4e86f5so1057611137.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789488844; x=1790093644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SEByWohEt8UD32R858BbZHwlO9aNQnUjtPRKe85QaV0=;
        b=Bj+U3T/uttpvHTjxz9XPdHX74gKG/FWmSP4xNe40WsrhRm9V0ZzPtZpBu+zJxfUqCb
         BuGn075OiDDm2darbhukr/b55WHBpYlB4RrHdPZhcj4Ow1ic5mScLHu/UzZOx+5NVXpC
         qereGpY9nr2+BhXA7vEeBzUu/lgw8LfjsT7+/max+0JZFzyyfd/F3Usm3Q1XKjZQA+xn
         R99w7ES2ZCfC7XvVG9T9/MVLQS/r7ehSpl9J6lboR/iYGS/uj4ko+YB6q4pxekii7dqk
         P0bfwAlx+gbRpYo9AAjHDgEV5bpmPV7Aq8l6j41kvvLlfoOMWBsG8o/93A8CdWi7cyls
         OR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789488844; x=1790093644;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SEByWohEt8UD32R858BbZHwlO9aNQnUjtPRKe85QaV0=;
        b=BDV/4ot3YYH4ZvrnF9B3WsD913E5wmc9qAR849uZqDJMI78GbcI3GU0+lisoBR0E2Y
         ddgYxzSVQfeod604bd5n7JTW9M2uLr90z2occm0YnvICdFsgaT5jDfotlxnmufqSqAp2
         7uew3cgl6eHvdfhU7WNrjfMOBVKUdtpbMIigYQSs4plUM8Zkaxc7KfWqZLBiL+uMDHO+
         Yh2yVOZtu88l3+NAefBBUpjPLG+e5e7CFiVDbQxOVQZbnMmpai7W1kbus1FxcYKWJ3Lj
         HWpkJRs0Nn99y3mOm/H/X7VEz6c5508bBfh0Z4V9UQpXxxR4NEzVgEJOyuFZotUOellr
         fOLg==
X-Forwarded-Encrypted: i=1; AKwUvBwdeDCGlbgkN3d8gmGDc/FDiX0sVB6snQz4aJCdzuLtd2BB2DXcdgb/YRa/YSOvAC7oJZL9zr7hb0dg3r4=@vger.kernel.org
X-Gm-Message-State: AFuF++kgEHcA4vEdlk45pVWzgwBAzvTHwiWOdfqNNuURWUABeAjWNnQn
	wqMcfeo/4YSCxV2iNebSHcTrI9Y9+qeob7vktjrmgVl6NGxfQFNKtYEyMBw5KxCM0lLorNzMLU2
	rXXQzeTqF4lbYspkvZDWlhAJm18g79mAUujdu1ntnTsREhbo63ffCPv2my6G2vJStV3U=
X-Gm-Gg: AYBFou2CQH7+KXhnNEMiJS1B0rFT/FquCD7hNhcc4PmxLuijVUcsciiQURDmqyDJQkD
	/UdjUyYBAt8+4qpp26I9NDTjSMUrZoEO+L3SJi6CGtI7hRyj5B0a+LDZM87hFOPb/Sh/tsGCmWi
	WhGObBhQBG0ZOZk8mHzt3xTwsxMZZ9Ja5eLfz6B01vzyDa999hd5qgGpiPWH3LW36QlmDWqVrG1
	oqpOdjdy6BJbyGXuiM47cD2do9Y8Z/IkutKG8bDtycBtOSIUjYvLZYT76M6+68ONoLgRtcoUYA5
	zlHejGjMQ7IWLPoP2Nqv+sIoMnJSCznNjbuprxOMsSLJvUUTIdhNSjsKDekzO8BwqW3zrHwhqbL
	HD/4VVEqXGiXCnQSqaUfRQ0i4jp4U
X-Received: by 2002:a05:6102:869a:20b0:78a:5bc0:4b7b with SMTP id ada2fe7eead31-79d29e9c6c5mr2229691137.21.1789488843709;
        Tue, 15 Sep 2026 09:14:03 -0700 (PDT)
X-Received: by 2002:a05:6102:869a:20b0:78a:5bc0:4b7b with SMTP id ada2fe7eead31-79d29e9c6c5mr2229638137.21.1789488843240;
        Tue, 15 Sep 2026 09:14:03 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83a28ba2sm7765205e9.0.2026.09.15.09.14.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 09:14:02 -0700 (PDT)
Message-ID: <f76bee25-df72-4c5f-8434-14b3671f1f8c@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 18:14:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] dtc: dt-check-style: Improvements for handling
 continued lines
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260909-b4-dts-style-checker-continued-lines-v3-0-474bb324ae53@oss.qualcomm.com>
 <20260915142742.GA1926857-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260915142742.GA1926857-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIzNiBTYWx0ZWRfX+6aHVqR8skwO
 FiShiXoi4Qmldf/3JptZTtMxP2n5/kAsqvH3557LzKHSKRkU87JSz6UiBPr6uivQJ1bdQilA+Xx
 Rwv98hOJkuTvSvwdXyXA5JkWM4lAAoM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIzNiBTYWx0ZWRfX+SLE7ffqbRhP
 gklTzxHQRNkWLKd98lGhw3vnakX2YdZRBwT65725CmRlS6QvKJypVYDV/MZHvPLRPEU4vtjhTO3
 XQjyPVnYk+h0cSKjff9QhMD7fGe1nMZdghAQ3AkeNrtOjiw5HxrViCYVNqA99zFO4Ref6HZFrnz
 hTRLQRNs/U8OQVbB/esj8SEh4BW+F9VQlLH2MMcI1l/VegaKPGsogv8j+WvRA6m0+rgcwMBqr9t
 Af1iMPXn0Yt/6iz6Ued+SSnZ8iaFk7mlWW6iYwH5jUP271LM6Z0VMqgnOT7YV7I1ewaE+jT1izl
 CMyahySyuD/redKywa+dVp8g/8W045KEv0jLhRNafj1Dj/UKhcjtkuJRHhvvmCrhroVaAokUg/C
 P4D1qYsZ6Kzn1cpHQLbcnL2BXAhTCajORweF6IyCr8l6lxEP5dtVlLqdt3yE3g1qZoqkrT8LGp+
 AltlPeIV+a9ItpaF3hw==
X-Authority-Analysis: v=2.4 cv=HsDjiETS c=1 sm=1 tr=0 ts=6aa96ecd cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=SUcpoxMgBbu-HAYh0a4A:9
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: K0k9YMUjSyBIjJP0SvKCWp9sC5t0xrBj
X-Proofpoint-ORIG-GUID: K0k9YMUjSyBIjJP0SvKCWp9sC5t0xrBj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150236

On 15/09/2026 16:27, Rob Herring wrote:
> On Wed, Sep 09, 2026 at 03:10:34PM +0200, Krzysztof Kozlowski wrote:
>> Changes in v3:
>> - New commit:
>>   "dtc: dt-check-style: Relax property ordering rules (drop alphabetical)"
>> - Improve commit msg of "Unduplicate checks in
>>   check_mixed_indent_chars()" patch.
>> - Link to v2: https://patch.msgid.link/20260909-b4-dts-style-checker-continued-lines-v2-0-c5cb4c9d9b66@oss.qualcomm.com
>>
>> Changes in v2:
>> 1. Four new commits 1-4
>> 2. Drop last commit
>> v1: https://lore.kernel.org/all/20260906180437.166760-6-krzysztof.kozlowski@oss.qualcomm.com/
>>
>> Best regards,
>> Krzysztof
>>
>> ---
>> Krzysztof Kozlowski (7):
>>       dtc: dt-check-style: Handle continued lines in check_hex_case()
>>       dtc: dt-check-style: Handle continued lines in check_line_length()
>>       dtc: dt-check-style: Handle continued lines in check_trailing_whitespace()
>>       dtc: dt-check-style: Unduplicate checks in check_mixed_indent_chars()
>>       dtc: dt-check-style: Right strip whitespaces, leftovers before comments
>>       dtc: dt-check-style: Properly detect comments in multi-line properties
>>       dtc: dt-check-style: Relax property ordering rules (drop alphabetical)
> 
> Patch 7 doesn't apply.
> 
>> base-commit: 694b801ceb1bea205878f2136e8b25c888e51be7
> 
> And I don't have this commit in my tree to resolve the conflicts.

Ah my bad, I had a WIP commit somewhere in the history used as base for
it. I'll rebase and send a new version

Best regards,
Krzysztof
