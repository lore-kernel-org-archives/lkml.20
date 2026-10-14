Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C90A549397
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791987663; cv=none; b=srLThfFULsDd5xMSvLAlwJjIGCt9e2BGk6Is1l1Y8LLLLGpwcGbvQ2IZxhuouSKJ76yrtwB+xQXwrvzLgfudZfnkC0p74XseVTI5Q2SIA5it5KmmSj5ne61v8he8iwpSHBOAsYPd2064tCDAZyNP2+nTn7FMf0IYGMUrz7z9njU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791987663; c=relaxed/simple;
	bh=XGNrFoZ7MV8C7/dY+VSILAwCYiTvCmyJQJRuuRE54UA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o+gVMwEVENlBm5FuFeP69MFIDfHrS2w68Wmu749U547IFWsC1NxMcN75GJEem4V8IOYwebPzOhX/lZAxqROOZP8P/pgjmlUNChmghr4obPTYJwcPTj3uhLPT/hBkNih4mH0EXKIiTpHYD7H/Ob6dTtnfJZfUY2V2KBQkANjCg1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XQsQ3V2+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zmxg4MYK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XQsQ3V2+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zmxg4MYK"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBFr6P3365499
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:21:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	guDtRT+BFrNgrMr9QvoZtjIgkyZewpK+lc9ir5W7b48=; b=XQsQ3V2+7aeVELol
	Ty82a8+AuF1t9jlkHQFWPGqV0R1T/GK+hcYNI/jB/xE2U98nVKQjh5LTXxgH9Z/p
	vXORGa0AWtbQzyGpze8vXqeSkm/EQSTQUBEDHb4PIce784LMrvhQQisXC/+VrQg1
	uqEXXg1kM64HJJ0Vb6vywpDypIJZ+5ofYbMUUCa6vkaVMV+zhIRGXm+OyNQMYJmA
	tdBDVH3qrmhCc5rDyyGwV2XdSDQ5DWw1QXD1+5F3vt9ggiq/cVRAAQ17B2qEVMLj
	3RbBcP91MMTjRXH7h8bYm0/ezdrYQmBFfkFgDhiK2OgCf5/fzf4oytw483Dyw4iM
	FYpRpg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4622056-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:21:01 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5e915fd8a61so94742e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791987661; x=1792592461; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=guDtRT+BFrNgrMr9QvoZtjIgkyZewpK+lc9ir5W7b48=;
        b=Zmxg4MYKo/Vf6BpjiGU32+iH9JlFOnChl47qhzzUDhEgDct83FrAbY791yHTDWU4B/
         e04244XRbbCnLs7tCWGWqhIL1DQtDFeMBRfMn95judfW6WDkKlUFfDPUbWK28Vj2rHhe
         7exrpbRzX48U67+Bgzde1uZwS6veljbuJ1jLgW0IrTOuDkrsV76AbxehFBfP7WEMfBj/
         PQExJpjE7N7X0odTjCZxRyp0c7uwDCHN7T9WphZGrpGp0W7fAmqngr9/+90JqgjQYWr2
         DRDuOKHLEQlU/VOfHbkPqkfu2GuPEcbONX26w35YmXiwH81BymGzIjHP5uyrk3MpYdai
         iGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791987661; x=1792592461;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=guDtRT+BFrNgrMr9QvoZtjIgkyZewpK+lc9ir5W7b48=;
        b=Vp7dNNX8xFRIwEd01CNl3Hw+ZN4MuJZfkAjjySBhokHRJ4s2JINtPQqEMoMnKg06GL
         cjF2WnxUZaA3BW4G2oERPQ+86NbniTYbYWQzvSc0FiJdeTzOiNaVIIZlku/u8WgnZtnH
         VT9Sk7GutzfD2wxypNnTFNDOz7WxHYCAdu1VNF1HE5fSaQvOCTTcGFBnnUiy9+O84K7i
         nwwy7rXdkZwTowxq8nruLPqpLA39RpmKNcmN8Z5q+fsjuY8bu15zTvTKFRGrJmoPaKF6
         0d1msgYwho+55UmhFrI8oKdhXjQDNB0VyO0VCuF2R80J0iSjNtwnP7eNneSAi8OmNg1X
         pjxg==
X-Forwarded-Encrypted: i=1; AKwUvBw92i9w2pwdjjsDSqr0ytDLmjqUbrPP0AQIx+cFpN/80RYGgBmpL/3XrKvNjL0lAttLxy3KLbaCGeltMaA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpGDrJeIEv5DU8WOdG280tQSnny6qoJY2g2Jm0hchgin9jZsno
	ABJ8eIMy4tG+ZwpoqSzB79CLfIHjMqmQc0MGmCel72z2XHVLD/GP6lRck9En/JKWqK2NxjtfdcB
	tQakPlfnE67sYeXr/VXMPaEg2uD+PDJsIz+1PZF5ehP1FQj8lyX2qnSUmzxktsnulXe4=
X-Gm-Gg: AYBFou2QPH/vNKV6ayKXi3l6mnt/bw9vTI1BrwvObXSgAUOMSFj+i86hGoHcVJqUZdL
	hLe1B3Hih2Dd5C9O1Ib0UnlEiLuVIJZqr6ADrylrS/M4aXp2pktwvkQ3PgbIejBzT8jUd3eGyyQ
	npwDOqNcb19Ek8MhjBR84k2fYaS7He0vcvMpTzouxh3U3pFUpkO2KOnoSCgrhKoTiKC0TVLXyQz
	BO4E3/Vd9KltZhlXGwyi72xAGW09Y1Gv1i6oM5iS7JgifqpqHXu7rZF0yw549Ed9msxFX71BK7Z
	jr9dLBqST7d02mzNxA5XaIsV9PkY9wY5pdnI4MR3j/aW2XZ84mAi6xir29jrJQCgyimpUmitc3o
	bq1Qd72+EXMQaGlQYuC2DzQ==
X-Received: by 2002:a05:6122:4a0f:20b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5e91f49ed42mr3157622e0c.3.1791987660521;
        Wed, 14 Oct 2026 07:21:00 -0700 (PDT)
X-Received: by 2002:a05:6122:4a0f:20b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5e91f49ed42mr3157584e0c.3.1791987659925;
        Wed, 14 Oct 2026 07:20:59 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b20388ad72sm1182036a12.24.2026.10.14.07.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:20:57 -0700 (PDT)
Message-ID: <d82177b4-8e93-4818-bd4d-b4f696396373@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:20:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 11/16] clk: qcom: gdsc: Make GDSC parenting optional
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-11-3041b788e9f7@oss.qualcomm.com>
 <lx5jywz6pnwfcoczp4z6k55qeol3ruqkyfsutngmg6n3xqnynq@6jgoutrnav2f>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <lx5jywz6pnwfcoczp4z6k55qeol3ruqkyfsutngmg6n3xqnynq@6jgoutrnav2f>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mq9xtSZ6kL3H5wWZquU6BpoS69cO1qds
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX0hmIfy0VsO6Q
 hU6wzjUiWj/kZPRmWvt0APjAzk9kFemzl+lSpbNo+BCQdCH25dj0SGo/lngim+P3moRvzOEBSqp
 +ETF1KTbSgPkSg9Lg0MF0ZS7tUzKNoVXI47aqMAs1W52Vo5uD/gxf8WqECzobbAG5/fRqzQAsyr
 3UXnpCDMRBEmm+j8KQ/NJrjPLQ0C2lF/VuQU1rZEVMKs+UjTA9mMgwx1xIFrx3NJb/mHKN2r7bw
 GbElIgEzvpVQerm41ketARJsScQz9gy/JnlOkUcd6bJJtviEwnRUln2A9PWrBnzKU+dBKuicppX
 vmzhokAVh+yFnMBPaFF/j6AYNo30L1YsAUoJNYvGgcZjavoBpPFek5+gETHbXx0mo57f5Old2o1
 wJScGvcahzLbSgObFttV3hrdvxdtdEmhh2DkLAv9p8lnRZ/+i0icbUZ9brvq3GVbhWGv0uzjqjC
 tA6a0vkPxxolrRZn4WQ==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6acf8fcd cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=NbljYO6N7a6c2dGYBmcA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX62TmLpvstoC7
 p1suwxk0vwoignofIsHdwZzIe6UufMBWeiptD8jaFUDle7GgBcaa5by8UMuDlYb64JyU4nDg5bp
 hs5mXdoCEr/me7cme5LYdfgFYWNas+U=
X-Proofpoint-GUID: mq9xtSZ6kL3H5wWZquU6BpoS69cO1qds
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140057

On 10/14/26 4:17 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 14, 2026 at 02:19:11PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Clock controller power-domain attachments currently become parents of all
>> top-level GDSCs exported by that controller. This conflates resources
>> needed to access or operate the controller with actual power-collapse
>> hierarchy.
>>
>> Allow callers of gdsc_register() to suppress parents inferred from the
>> controller device and its attached domain list.
> 
> I think, each GDSC has a parent (in the hardware). If we don't represent
> it in practice, we likely need to fix that.

The next patch allows setting a precise set of parents instead. Perhaps
this commit message could be improved.

Konrad
