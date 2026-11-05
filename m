Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883376;
	b=KYRyol/P/OEA24O24+mR4WsrkirVokdR/D2PfmidDJIWqlbJEDiB1nddwBpGWczsDMzF
	 MDvvvG7vIAhvo9Bs5uR9xTE/wssCxpI7lkEYNXTpdaMHSQkxK805T7qt404fBh92IvW9Y
	 g2qPaTDVAQuBlpEjTdVzsFhcHmEJp1mzHTeNr30HVBYfhp28DP8fajx+ggLKFx9hUrINV
	 y6y5GTbGJPViHXhlsJ18y1nkjdA7ZgtywICQXgIh96VvSZhVEpnlTaVIBbBo2/kEfONSi
	 FgpDDb+Qp/iuUJb8Q7NPlEQQuH61mbrFyODIe/9Q5DQjHmrsFd++CCgj6kDvshyQXWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883376;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mp8LFAjwhhq5Xhmtcgd12xfKJEM5jsLCLg8QXgag6Ms=;
	b=NbhdaBHmUBxIF4VOtOZahU0BfiAq2vC9BpzYWc1fF7YMfcvrwfU3YPDBObOhKPwcvGJh
	 LABxhhngqNio/NctO+XsW3zt5FOFXtCvqjk68kLds20ljQ2dU5re8SdM1qguvUXmALzAW
	 HoDEOe1MmeykzeNu5n6t0+WKE+eKYtd+0BDLI9rHblX7niYwT5JWaSsHEnakx21gDlgXo
	 3NxgAaO5xocjv1vbhovUxispsa/6Kumxph+3jnJZEsStrwP4RwnepF+oUaw7GNXHKB7tZ
	 fCQJIxahJkVxoxoiNYaTs0nxzOay48GmrDHiDf/tAJd55zWttCBZzi5H+/fOOuA4lOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nPttzf91;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gLYz0HRP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45999606D806
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45999606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nPttzf91;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gLYz0HRP
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tULE3685694
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 12:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mp8LFAjwhhq5Xhmtcgd12xfKJEM5jsLCLg8QXgag6Ms=; b=nPttzf91CBJQARfW
	bkoo/u/KooN77NvzUJcL78Z+5zV9UhBcykZ77b+f2vavvCFZrs8t+NNmFB+Rl7ib
	Lc1n3CWTljpRRf5TZVqOzf9a9vAcFK7zfZNMCRs9Zwa+UVcj7pqiFyphc9+7aUP/
	W2cLcp0FBEwi4xFwCxCXm2qVBK3haVqxiVd4G/rz52RYs5tjxMxvqEYo8pbtyoUY
	Yha1//v56ES1/jcT9yZSeUPhIP4HsB500NBlEhMWBSOvDHFSV1DJJiR9SfW781Yy
	8ZCE6KJ/UBLlmqHsZVg0yz6+m995dMt+mrpqscg9FXEV9e5J97FdEDUMaN8QT3Ti
	l7Q6Mg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrj43j53m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:56:15 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-990aa76e3daso227579241.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793883374; x=1794488174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mp8LFAjwhhq5Xhmtcgd12xfKJEM5jsLCLg8QXgag6Ms=;
        b=gLYz0HRPCihT9jRPBR0k5DjszsIpORsbv21MwPudWA5rkP1xivSPqwknRV0Fp4ykD9
         saxrgnsDU0tHnd/zReJ7U6hbNvzrN62sBlw0ObCg+F5uWkmK2tgiVSg799lcLIdJHUcn
         8oduvo2tAEqAaCNja/ingtIHhwl8d1kAu6D7len/nlp6bUU5Niq3JzXU8kIlbC90m4o5
         ZsmEkl+0eUqHK1PJtFJk5TNu1++UQWAV/ImlC/oOkZxxwsk7oOJMM+g4Jl4MhGZPXTos
         zOOvS7J+55pSkNoS16CTgZRXAFg1iiRWTSatTXwNJMWflSWCwnHOO7ddd8dOE9hgOCVR
         5RVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793883374; x=1794488174;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mp8LFAjwhhq5Xhmtcgd12xfKJEM5jsLCLg8QXgag6Ms=;
        b=r1U7E/UoRZtiXB2nn3Kxj+vEWPiY0yw2uXcl/2mgNMXUcediH7LM+kDwHbuIsw/ASl
         8ZsxLuWchJoKQxIdRLK3mVBzh4/BC/dLxa2/CbRaKVAiGNe2+UsQtpb8gyFGGbN6AosU
         jps44MPQ6YgWDIpeFJY5n4WSPA4gyVgge7zkPyOYTWFsYAp+T/NaEEU5WxDGwFTQdoZw
         buM4PTrdCMnSSHOKucV3uiPr2I93UZVx+cItaiqRkTdgN8xtii2GDil+hPQdCi9gGBdd
         ahVV8KRT0a5TMvUTvLfvuNATNEBe4ozjFRlkTNc2i0DIyIGcsnVqZrfBm1niuN2NTxZn
         PFqA==
X-Forwarded-Encrypted: i=1; AKwUvByoGOE4ehiQ1eO/43gN5/JWwu8sIytCWlk4nhV0khWfsv0wHY8Hj4rR+LgFlFUDgiTW8RpESJCbOmMzJSw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ajL8UrqtBiyu5suhiobceqrHzgyxanwo4JCqciR89Q3gD11/J
	nDcKgflH6hqKSZgvjxM63GZDUtSfq4YttC+sLNr9MQSSdUSx0us549ileXWQiV8x1HCkERDcCOj
	Yz9I3YsZWdY6J9QwKoIc2AQDIkTiyPGqzPUk8X28GoxabuaX7lJdlXyj31iw9aPB6tYo=
X-Gm-Gg: AYBFou2H4AI4+3A1hGS6dQDE3GuvBrw/ox50lBpsAdukZryBjjMlBy2y5ooF/qQl7pt
	oSJb2DXiJigy8d2iJHj2cMiJE1h+0R2ElAmodc/VS+Uz9UiZQ2JgRVNccZv4jygGTl2p+2lEXxB
	/u3P0YaLG9vZ0GbhGpq0N0nC4+FfB8SipyxqMF3K5StC2Otw7zgBJpY3lZQFm2+qfPtKnMELeBX
	E2GEcwR9UYkWcglISG9uEoEU8jxxI1g7Cq+v17dUY/3cZMub1k13Oib+ueQlVYeG3KD63l79fmx
	EH24uE/KeylOT7+6X1Whph0KQUCgvT1e7/9c77HpwYOHIMjly8ZKKDTB2UTNM7tUNiX+zSP/vg5
	RORBHUXeUk3m4q0wslpwkfeyCeYu/y/Kcgbp4EA4kIJJx0LIfZaD8mDxRzHBLCtauzVFd3adRqg
	==
X-Received: by 2002:a05:6102:50a5:b0:7c3:9b8d:5124 with SMTP id ada2fe7eead31-7d072c2da67mr7071567137.18.1793883374433;
        Thu, 05 Nov 2026 04:56:14 -0800 (PST)
X-Received: by 2002:a05:6102:50a5:b0:7c3:9b8d:5124 with SMTP id ada2fe7eead31-7d072c2da67mr7071534137.18.1793883373890;
        Thu, 05 Nov 2026 04:56:13 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed45d71dsm9850513f8f.36.2026.11.05.04.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 04:56:12 -0800 (PST)
Message-ID: <a0a17a91-02d1-4c54-8989-ff483a3300ab@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 13:56:10 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: submitting-patches: Clarify half-baked review
 tags
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxDTdfMVS3yazCk@shikoro>
 <35983c5a-7deb-4b0e-9bd4-981754343200@oss.qualcomm.com>
 <auxHASG78dTviSz8@shikoro>
 <e1c7e287-ccc9-4705-bd72-e801ba203668@oss.qualcomm.com>
 <auxMOdmFYDYGjqa9@shikoro>
 <8abb2394-5210-495f-8420-a02bd16ff466@oss.qualcomm.com>
 <auxmMrANvWIJi94i@shikoro> <auxuPmopn43wisF9@ashevche-desk.local>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <auxuPmopn43wisF9@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LEB8n2OC3nxNSdNsfZn8s5W9OBMjcLjZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX4yZ1pBN+MTcT
 7aiq5rFQqhGkcZF75oS2PhJhTp3KySuxvfdaWxFr7cibBoMZuB7lv3WWOdVTQu2bU3qwsFz8358
 5Btn5GOXs3va42IJXbimQmc0Y/wXx8oCK0O2YpjgN+43YRRKmMdVaSWdIPacbW0M2E1IX8NSTSC
 w+5+9lHP5wIBDUnaIkWZB+Nj3Cr23YJVsyhZb99376UF+I7R+RS6spH69dp7aoAeB+Ct/lCT678
 c9zAuZTnWHLuhA/zpaz7EiUWxWr6bhv9WYgxSdFRAK5ZOVw60pR3qH15+0B5B9fIw3KvvUIJKk5
 PFnd2xZ1RAno/osdN+ZuK8IpMCjbWWgubk3xcFNh9VKwLhProSOPouNrT8Xq1FIsfzsInuh7XTC
 CjXMoCOS5BDVHNOvlsC4LBf7BtecAvDYPhXxTK9hY4uGxQEt6mviCiF1t/ojR2nRZBCsJhpMGEx
 awMdNd2plaNUJplAPAg==
X-Proofpoint-GUID: LEB8n2OC3nxNSdNsfZn8s5W9OBMjcLjZ
X-Authority-Analysis: v=2.4 cv=SZdi5fRu c=1 sm=1 tr=0 ts=6aec7cef cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=yilv8eCvnXgz7CWaK6cA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX4H2ikQu0y951
 D26nQGMVxPPMptN96HU1B9fBWRKcMwPX3z0DuFlo4ncYSgw+vh//1kpZ+vFF8ZpnM50Uv6jvcbZ
 tK5ONiJOQmUrQGgVW+EUaCsJ1/wUJPg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050051

On 05/11/2026 12:53, Andy Shevchenko wrote:
> On Thu, Nov 05, 2026 at 01:19:14PM +0200, Wolfram Sang wrote:
>>
>>>>> "Reviewed-by:, instead, indicates that *the patch* has been reviewed and
>>>>> found acceptable according to the Reviewer's Statement:"
>>>>
>>>> So, for the SPI patch: if someone spent time and reviewed the complex
>>>> core changes, but only 2 out of dozens of drivers, this would be an Ack
>>>> according to you. I would, however, understand that this person doesn't
>>>
>>> No, and I explained this in this commit msg. That person reviewed the
>>> MAIN concept of the patch.
>>
>> With that MAIN concept emphasized, I am okay with your reasoning and
>> agree. Before (I cite, upmost paragraph) "*the patch*" could be
>> interpreted as 100% of the patch (including dumb driver conversions).
> 
> ...which may lead to discouragement of reviewing such a patch.
> At least that's how I read the point.

Why Ack instead of Review would discourage? Are you saying people give
Reviewed-by tags for incomplete reviews only because they want the credits?

Best regards,
Krzysztof
