Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8274F68D7
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900117; cv=none; b=aeb6fvRowLDgUTUJON3103w0HT4uNPU5NdQ9XGnp6o8IRjWVVwW8Re1oCsjsIXE+pJeY+Ic8grCv6zJMYTs5VfrfcH2WKLO07ue+PhdUE4/TlT80kEL6BoP9V+NT9yrErCarXmGaSvDo2GgNWtU4bfgrjAgyM7BAKZYGBsfmtP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900117; c=relaxed/simple;
	bh=ssqHTpXGgabYsxdvcp1m8bbcmPreD+147iRzWVW6JUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IjlhpkZVIMBY/g4OohPjO32FGn8V0c0qCrTh/1j4uwImBEfIJDBwRNMfQWnXdrPy68dH38TDzy5+92mGP/lcL9sEz7ZZJQWJMqMhtRVukPIgsdPw7ToIrOHwvrJCcCfz3svC79LQtJvpd4DPVmcPyPLuSRgLIW0ERlRB+IwxwN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wpjj8CGK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O+qPpj3s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wpjj8CGK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O+qPpj3s"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DBHmWc949221
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:01:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cLsYpGybDcFYL54DVjqRniJMNcGDsEoOwITI4R6fhMQ=; b=Wpjj8CGKvd6syAsW
	wtKuWOEMzXdAwfjyWwU63oFbmTGJfc9gDeAOVjepqzpkkwH2dYSgTtltVa7IPRAA
	75SD+S49d5Ta2NT8UQbJavnB1yms8R04z7KGX9/T2o8WZZYRTbsiDOiYK5+X+fbq
	ADm3eslKt96bcRGzrl58ToWkng3HWPaKp5Kxq102O5hvnQJ96HuQ2ghQThOjYg6/
	D2GT8VtVNImIR797Bb40m6XIzGj3ztNJbUjovqtOLzJMGC16JTJK812OFSw4ofAn
	khHOX9hNckkAnRUnuoA1OKmbr2Jm5WZjW0+wrGX+m7dXsNNhbMOnrxOY5Kx52GUt
	ZFBK/Q==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f629xyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:01:53 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5da613f7588so3450083e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791900113; x=1792504913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cLsYpGybDcFYL54DVjqRniJMNcGDsEoOwITI4R6fhMQ=;
        b=O+qPpj3sc3Qsu1ijR5JNfBPshJhgFrbuRtC6V03Hkgxz6wc5tVE1DcXD8KVy0EcHGs
         vX/3FfSTf8DTfpuKMubQwLkVUbJCeKH334VL+CaSarIHRJabGaefXlsTbqkt49yZKnj9
         YxX4BpEBSE76fRwX5TZA5rXiX7E+4y8ZGXaNRUWNujGKwvTKjRcRoShA5W8yrFYN8yfG
         Rk9VkS28qFAnguDFA8EARI+NmxX6ScNyxW2fyUhNOiKt1f/jk1KxCzBiJLtWszJF5eV7
         rQj7k3hdm8q1jXiaNPPLNYJOnUcTiilP4+38ch1ZIm+6gFDH/inbzk59p78KAUvXf+eZ
         0FHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791900113; x=1792504913;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cLsYpGybDcFYL54DVjqRniJMNcGDsEoOwITI4R6fhMQ=;
        b=CQ13ptOPBji9D2+A6nSeDcleneOpJdEDpFhg2itUeEDgUA63rRLTJ4hybVQUuKEKgE
         XLasmhqCxSAsblZ3+SA0aFM+8QfKfgmC2nfocQfLjkEsOE/pqyApAfzuiGR9z7FpTns0
         mWbB40OZZyS1l8dCDUGysygOtUnLafEfPrZ9xPd0AE5hOfKU7yD3m6HC022bqVTlmHUX
         fP4C1/1xPvnLWYKzBuPtsQiBaUKHLfGUu3ikxFq+Yf3JuONOqFmqPzEaonYJhdlmvD6S
         ET+DH0jTVL2h3Q6RtmNlC0jWyViyLzWamy2o7TFJ8/85zKXcyBmXoQK/uTwD8rap34ks
         /dgQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhgUkloE68qD9e7qJt7vrnmXcrKG0H2rb0gPMmcGuAbfHo0lRKv8DUfNIZd/WOwNyPTUUuHl0Riqu3dMs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgYw5ubG4zz3StZP9gIoWywkBcPqVv27b9OUWGQYOQAxi82Au8
	u9/MMxiU1ut8rzd8quxAp8la16XFwHrzhfY1EdcYloCRK9ecsJPaYQy94ur2mP+GsKaNR7AZTDe
	LnstlomkZ79sDe3W3MW7XLqQZof5BuE5c3M8SRY8NQaYlc5UlxoIPPn+v+sX3VmKDUi4=
X-Gm-Gg: AYBFou3jQyWzc64TqspLH/wdbg48njufz9SOIEjsNKiIaZSJYUo+jS0WDnnvxApx65j
	ooojKdP0VzRS8feWyrW4mPtnw7Xt9JffapGXid08yDgNfQpQGZhpWYGW4Dhby5fR54IqoWUAYQk
	Dmf8nWJJ+YK7ZeC2r+3oxSSgMfdj57NEs9IXNNbVXxZ4x68wCqnwmUOima85R8q8rmLtP4IeshW
	8gJYs/2e3u7n/MoPeQhc1Ci6Q1zUjagTe0hRwUyVp1IaFLVdBCwxnl+PgROuYjj9nzGRABveQhV
	Nd+ApxkxrpATfr+pay3nhSbI6JegUZsLc7TosxYIc7y1752Hqqow2riUSpzi+qJ2au/H1xxY22f
	/xqyASL8t27qaMtRyXWQrWVr04x2T
X-Received: by 2002:a05:6122:d1b:b0:5e7:8bd1:731f with SMTP id 71dfb90a1353d-5e91f4815a8mr4193270e0c.10.1791900112836;
        Tue, 13 Oct 2026 07:01:52 -0700 (PDT)
X-Received: by 2002:a05:6122:d1b:b0:5e7:8bd1:731f with SMTP id 71dfb90a1353d-5e91f4815a8mr4193151e0c.10.1791900111802;
        Tue, 13 Oct 2026 07:01:51 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a195002123sm377260985e9.1.2026.10.13.07.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:01:50 -0700 (PDT)
Message-ID: <8796cfa1-5ae0-41fd-b3f2-c6b588157b12@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:01:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] thermal: samsung: Add support for Google GS101 TMU
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
 <8142519a-0062-4f0f-b978-980e049f99c1@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8142519a-0062-4f0f-b978-980e049f99c1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6ace39d1 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=xpaw9_Cwbs5_s0yaehoA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1NSBTYWx0ZWRfXwel6C8vaNGQ7
 rFZG/FNxsIBtngt0Fd+IQlfy0XPu++0A7TCBQJZJxC2kZ9Wribe1JPBMzTD1y8qRZINWJITCF+Z
 Zh10Nwlb9z6ZOlswhvTBiZlw8ZcTZB8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1NSBTYWx0ZWRfX/ygxs5alp8mM
 /0Vcol7pk23JaA40lgwcirPnDq3HXqNwgxOm2BZvZ0fdK91/cDc10/xlApZa4gSW9bN07Evv8mS
 6nVsfsAqK4k0lG8S8cjzwJ1DD02smQS8Agd5mSxtSapk21Oih2P/5ZscUtDJGoXwDaYxupP3xyk
 pw0szgZKQWP0LLtQoDVSDlH2dg3ruMhQOfRbiHyHjZCyXVn6HnhI7Mh3tDKBlv2opba0PzuYGKD
 KFQPc34aiYNcsUWpuNUP/XZB5JQqQnnUXf70PZUeneca+Ei7b+62T9ajL0pFBeLTb7c+FMfLhkE
 PoTlL7CoKVyOadQi+KQ9w4XIaz91KkPyvQ86u0R0NuOmZfG9S8R/5aO6Zdt895lt3o2g533Aabe
 ntG1PiCEz97CYtxE62mna2SJmniZ2MxZNgte/dUMO9AceKAX8vIid1BnflaQjvhVXscVllZW5z2
 HmV1Gls6DOMYAwl/yyQ==
X-Proofpoint-GUID: YD2YqyyIeG5-e9mZlLcikdnPXDYN_hDP
X-Proofpoint-ORIG-GUID: YD2YqyyIeG5-e9mZlLcikdnPXDYN_hDP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130055

On 13/10/2026 15:33, Daniel Lezcano wrote:
> Hi Tudor,
> 
> I noticed I picked up your series without notifying you
> 
> However, I did not pay attention but picked also the dts files.
> 
> Shall I drop them ? (AFAICS there is one comment) and let you handle 
> them separately ?

Were they reviewed? I think no, so that's another reason not to take
DTS. Anyway, it must not go via driver subsystem, so please drop.

Best regards,
Krzysztof
