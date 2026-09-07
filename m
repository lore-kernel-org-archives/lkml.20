Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBC7439F86
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770245; cv=none; b=q9cOCkE+0NoRlZ62AsAndRttWeTbIkRUAaTKO+tIaIcT7WLJjjD5SuO2K+HsaItDlyQyZ9e4nwEFLR9zpUK/IE7ACI7KcAPlQp6eVsFCH+6G9dhBL38URtv/voY2oNi6TyJqwvvYcrUbd063sZZXAtPrwWT9w0rITD3v0K6erKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770245; c=relaxed/simple;
	bh=ISGTU9phKiGuZJOMB/lKhUY8x73F7vPwxlZHgCas4m4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zqb6l9RyNuK4Lpv0FFY+r4p2p2c3WW9doX6+UuowPfWmTnrD+PHConMzUfOcPeZq53wgrccIrbg664qPsGjJ1SBjQVcIbHdf+JTVt9O9E6FhKa3+9Ch1VIRN356XRCA/KyFuEZ1ozcG6pQlOmenaATdj74Z2yanQ1jzCcZMZX2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XmhrzLCB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UfCQDeqC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XmhrzLCB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UfCQDeqC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777dV73903330
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 08:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MRLzrvO6FEqNj9cDHYnJGMFdaDAiDHxtj1Ll3bHtQC0=; b=XmhrzLCBm9dqDXKW
	bZCoDPLIg+3mRZgI+NcNjORKSX4Itt0+y0mkkYmUMPEm0V2cwgz8Wcf9/gNtkvgm
	uvgzcc9wawYcxPhQC6YCXR+KvLZp2+BYHddbiyQQyEvBce5BoYIb3rcxrkwj2l5c
	iCuqF13GA5PaggeK5XN4B6ML0Ly2Q8b2Mb37cHzxQ7CQILg85L5Tes54fICblQNb
	zQ7hf1DkdQhhknj9SMR6nwHvcOJHt1fkdxDBockLhveAyc+e2xD+ryiQp4rVtDCD
	DxBQ97zdUjwpJuHz6SfxGSacgQYL8skH7nNCv+uGotnn5sgpiX6stW0/I7Z4FiAq
	uP2XKQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggany5xqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:37:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939a28482e4so16858885a.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770242; x=1789375042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MRLzrvO6FEqNj9cDHYnJGMFdaDAiDHxtj1Ll3bHtQC0=;
        b=UfCQDeqCqv/v2ujUaN51p+RLl2nG6Dczh+PoQ1Wxwovnc3kmFalFzDtTcYA3hK9xCJ
         hUC+QVFAji3SPE/0+Sxg1iEArmh/O5U4AZraqy66c+/BE5OzsMeBEmhfkE0agBBkwlol
         uI4A0C7eY97hUpb843sLuN8izLyDVdJugnsIsMAjXL3qMhBEHJ26We0yPj86FFXOkjYE
         gWxX2VqT73swgXcOPRe00QDUb1t0EVferkCX3RYNr+kfwVVKxXATJMw5oaIL6QHsrHW/
         4dGF21KLSqJeI58we9L/vCWOQjUFNFZjj6N1xupoX744eI8vseofHNp8jat3cFwo9FGL
         1Reg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770242; x=1789375042;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MRLzrvO6FEqNj9cDHYnJGMFdaDAiDHxtj1Ll3bHtQC0=;
        b=MTBS9m1I3p4gi/BPstnYays/2hOBKMRN6ECxYN3coib1BXLQ6/dAnvmSbbon7ivc8o
         1Ov3k/6HI7VHI+aBTypnFVf+5qmlWBMUL1Rx3Pgm82xMreELP6+vYcwQCSd+AvXFprSj
         AnGN5wwp0BFG9ZrxlfQa/fIWsWVymOOa1tatTLCS1oIwU3uIqnOHVD8oSTmKTULZeMiK
         yIIwrjpV1mMtjj/xX+fiyRecPc8MCqZzQebGInxY7Z7VNb5yiEn3wnnJavJtTc3jPEqU
         ALSFvfCV/pQRmgHA4Erl3MrgpXgfielSaWf/RdPRKciki7pJaeYmRJaqgFZ70XI8LDZS
         1mEQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0mQ8XhLu2prWqaJ/aJPgAyEMA6bUSbuVeYVTv2TfhuYGlOLvjsnDa5g+LpvJNlGQSjT0Ac4k0N4S1Aoc=@vger.kernel.org
X-Gm-Message-State: AFuF++kzqY62CNyg4joElDw7tqCT1ODh8rfs7Lpkq2Vv0rl6N6fTLoEE
	I7pYdFw9s1Z0ICN6tEynf6NeOdEA/hly7MLLVtJ423mPomBELZTHmH0Y16SAUnqRTISFVWyXP+9
	lt4bCf44ayDU8sllIz0u/cGrfzzGwTX/uiIYxOJizcnxKwknXjrWBGzYPZB+nz9nSBLI=
X-Gm-Gg: AYBFou2RWE5Z/blfwYc7CdKx2/f6t6elAYBnCd4fkMhDIyYVDLXHonuFtNuA+R7xu+K
	TgIWn2zIAxcNrNcXBJjqFSVaAHsg7Qcru/hxrpwtXIY+Zsh9UyMQ87ErQzNXo1dFXABFCe3Z1/C
	Z2Uqo8NY1XJTTt5pdRaER380ZNDs+2EnJKOKp/7M2XnHqJhDFG+PfIyI0tsVHd5qoZruwZtfc0K
	1Zp+yzkYKhsOL0INvvcUvjMDfAEW32f7tuch/0xXmdKBeL/lh+vHfyYxDrsPBgkLZXdhu3eSO+6
	GpcgRVgkgjs4NLFTcg+RKQ3EAalHq99vZjmcNQdTATKNuM9FzJHScGQCf4VTabycCMk2snau+BH
	iwgIIA37gSa5DzAiHSQy7gg==
X-Received: by 2002:a05:620a:d93:b0:939:7e96:d296 with SMTP id af79cd13be357-93980964b18mr1680142085a.1.1788770242030;
        Mon, 07 Sep 2026 01:37:22 -0700 (PDT)
X-Received: by 2002:a05:620a:d93:b0:939:7e96:d296 with SMTP id af79cd13be357-93980964b18mr1680138685a.1.1788770241666;
        Mon, 07 Sep 2026 01:37:21 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c262f97f1f6sm265914166b.50.2026.09.07.01.37.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:37:20 -0700 (PDT)
Message-ID: <1fd0036d-7dce-4826-8366-a695c624cbab@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:37:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/4] Add modemsmem for Google phones
To: david@ixit.cz, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Petr Vorel <petr.vorel@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260906-modemsmem-v1-0-a3634b553841@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-modemsmem-v1-0-a3634b553841@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X45i7mTe c=1 sm=1 tr=0 ts=6a9e77c2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pyxf__bKPmsAz4JLUVQA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: MSsg7tva91O88UF4i-ZjiJWeRvouWpKl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX3Rz+diCnx3UA
 Hm+7jUUAo7qC0TDRuTKaOww1kgHiwmpV2+o5vomO5H6aebge1MfkA+VSaeCClnnScR7xoOPGP05
 0iXHCB1yJ4wGN/nOz6q7omma/e2GYJCtdoTjGtlCVgUYcAScDTzR0oAXb6w0wy+CC1l0cWXtCGk
 7MDjr/e5u3X55CDppkFt75cwVod668Im6lXzQ6mrTfWqfVZDYVfJm0wtSMH+o+tovQFJwJkH5bk
 B1NFdL/7ZVMCfbjRez/M7EYhWFeMzaQwDocYrqZ+XMSEFr8TD97hyOXO6kKqxoG/kks1tO8Prjr
 6zhi9vw1DjUHTl0WoBKskjraLYg/0h1harKvSMTNg2Yx2UKvnizFUBuCvE2yzcW3dG7Eqazcl8z
 JPwoLCYiWhrE7pCf3BIZv+LHxFCsjOClaviFziGucSAH8fJjB3y0fzWNsNfKWlXyR3XC80mgJ1X
 uN2e2eDe+0AZXC8Iriw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfXzc9Tk/dwdiKm
 jAek/fmlQd8DfykBOl1u1ZjCDtTCd3lEJb2naHyDoAM4ZruqGFLQW0yICNhftEG9fyym3bWrDW3
 0n/xJhAxww6/k7p+8PQBTXGI6GjeVJs=
X-Proofpoint-GUID: MSsg7tva91O88UF4i-ZjiJWeRvouWpKl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070093

On 9/6/26 2:41 AM, David Heidelberg via B4 Relay wrote:
> Q:
> Where do these types of drivers go? This driver is probably providing
> info to vendor code in the modem firmware, so it might not belong in
> drivers/soc/qcom/.
> 
> Maybe it should go in another directory, like drivers/misc or firmware?
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> David Heidelberg (2):
>       dt-bindings: soc: google: Add modemsmem

Would a list of machine compatibles be better suited here?

Konrad
