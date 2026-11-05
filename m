Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869925;
	b=KTz1wws42LR9j08yJANvqfR8A3f8/++j3xd4/2IvD2NGooRoilOKpVIYxUL5Jil3x2Xp
	 vxz9J/alyk1r4ZO6+GMu46bchlLcjXha7z+OWOFpkxWHBCnF9B6k92nOS3nuerSpQXD8b
	 ncB9GQQdMIjq/EHsX/t+rlYCpF1DGGbDhGmAbbDflJ6xs0vaMKC05FuG+3TD4KlT+E5Mh
	 MTFH+R6Iae+ertGsxRuWtPSg4ryJFGmpL81vRePYrJIn6gi8CVpxSQ1qTrDudXudiVk41
	 8ow4vtYDcpamHrVDu/X8xXIkk0Gqp3F/jzzpaaG93bvgZCrgIOw1S4cVeVQ6Ec7+Ofw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869925;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7F1vEtwRqRlzZY1ScHWyVwWITpsdI7I1gLtxsYOhBsE=;
	b=Aurw+QuEe9getGby0t+D47FvlyMeK8Y5d3JFt0QH085+jAvrBX9VNk8K+d5DOmaOpjiD
	 PgYHxjqC9Ey3GHhmKwpqj4OCzKZRuHBbvJ9h1PsuCsEKpxdkxsOS4tmYoXUcKAX0ylgUB
	 H6n/+68yYv01ndj6FPzRscrPoOlqlGO2+VbPHslxu1+Hmk6qo04jNQzO404jF5CLFcOaS
	 e/0AdiXQFMc8ky8x0OOgsowD30k5aIKGeZKx1Fuac5oX8SBFHLrP075+EkPnwVQhRVA+Q
	 Bnq9v6TazVuKkcOYooro4NU3uyJjKvWbyosQYtON74ClM8Z7qEVdJIQojquqfZNdvaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fIx4+4IT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HKIRSO33;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CA0606A331
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:12:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58CA0606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fIx4+4IT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HKIRSO33
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UDnp942103
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 09:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7F1vEtwRqRlzZY1ScHWyVwWITpsdI7I1gLtxsYOhBsE=; b=fIx4+4IT8vfCVOMS
	wFTAUxAFjntUZ4EDlNDMSJshBqljGvDk3Vykz10S0+BVAQ5BGSMkfGn4w18ThBTg
	rgf1RcNRTdwEAltLPGrE9N9Fspi0VOK7kwldm/Yrj73vzC02JqLHKEMlv0APM2Ew
	Rpq1uOmzssUc51/n4qJCQaB0PLYjRzrInzalDWMkmpUHkWTKJXgAXHfTBP+0g8Qv
	E0TvXYUSBtqTYvqeSCFa0Y8gjJnbSBmcgsp9cdklTFT6c2GWLbcMm5U+Ze5j+MOZ
	oMimtsYGO4czlaOjf38FyrFFtU3F34F24G2jRw4TV8FTIqFbGLio5X2+3I3c6KEK
	6JPzGA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bj46d3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:12:04 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ec62c05c25so462061e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793869923; x=1794474723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7F1vEtwRqRlzZY1ScHWyVwWITpsdI7I1gLtxsYOhBsE=;
        b=HKIRSO334idm03DlMkgz+K/rlJDZePElkq+FsBQLYlR/uS0omyX7ESW/+vHLbX8kod
         whwX9yHbRL60cW+nLGxoqRLQpSvgggheE9Rhh/HyX6rA/zjm3/UXjgcDvqehn/2Qr7DO
         9ujGbi8Pur+qP1Suvemkf7BbwmLyEB5YSs7OokixzmDPb+a6/u3Dg7QCp4uLcVJu0P8T
         +qXhdUdGZEZGuL3neADxiqMcxMjXh/iMo/l/Vu2P+6sHDLIMlyGjz3TooNxJ3a97dNqd
         rrUVdz6rK7yX7peblnhjY98OUtUH90V1S5xm+cjndUcd8x8yZFGtfocdDyYylTTVdNp6
         X+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793869923; x=1794474723;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7F1vEtwRqRlzZY1ScHWyVwWITpsdI7I1gLtxsYOhBsE=;
        b=HAj4KjL24lC3MYXNqFvD2fZcxcDxcRhMgD/BmjshgdWZDUIfXjmdhYxFwlOtM0UNJT
         gbDYOUuz8Nud1ZBliWbahi1KUy3k9RQPBmvx5AoOkSfo406mlKDiv/c0ud6R28edvmJ3
         QRFRUqj4LWlKlqIzku+DjTYP3e+Mnsne0NDVgWMksxtYJIRuMNOuhs9VgclyA/p1ZCYI
         TjGf0YXI0WvTqQ9CWqw7Nirhx63iMdEIXwlh9pHovShFvS/cpb1659OJdo1Ee6meSwrs
         uJ2x+VRdZDMbW/bIAZwCOdRnjATEDUBinqCXlow2V201O1oYjK3VXosBksnsdYr2eir7
         h/cQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBHS1Z5CEgdkmf84oE2LO6oIh0wtucqqM5+6bBDk0oZ64X39cu3EAlN6tgtQO6twoqYsG1TCrKPLzTIQo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uWoNksXxSU+omeVJlbTPDc2POSefD4SK5G6Sh67PDAcjTYsBp
	uXPU3Hcy8gfr5R06gaLmWAGv9+qaeoRr0TmbPV8G/ef6yqF2a2xpntntKsiat51SwdFF7C7lPLN
	G67xOqn5iSg3gbrw62kTwWziWGWJffZbKbchz6kGvCzIs/fBscl2/HaPiliC/L3ybmcc=
X-Gm-Gg: AYBFou3nzMcA73outo+h4jWSUj4ty5UhjXQhxy5j8W0zxfx0B+68xQHOQPDC/dQsy7M
	LWA402iWq6hOAmw93MzdEqoKhaxsGyV5k743r2z8ci6oEvg/QXFUt0W3h2NkpbSkzYm8loEYL5X
	FA6hAjlShCFOg41gd8HJXEBv+RrQbHhmCMf6SaGsUeTZOzGgoA7Gw6uj4FLoSdFkwn6TcczZwA4
	qnP4XkBpO6v5eEg3kKmQUlM3KlQCbxVxlZIChNmDXaeKzTbM3RionFFuERJqRnQ9hCKwDCvimfs
	/lnip2JhiVu+BGtwaw6dlXrNQDEg7LAueganYycV/0f2pMkj7zR7nNbLN9FjCWqH0T1UL6rft+x
	c625SRGiYpcrVTDM4vWeCB32+cLHoQdxb1gwKX3QaAsshvelbCQmfF9Jk7QjjJ7E0ROgyYOLkhg
	==
X-Received: by 2002:a05:6102:2c81:b0:7b9:5abb:eb17 with SMTP id ada2fe7eead31-7d286744eddmr1262925137.3.1793869923400;
        Thu, 05 Nov 2026 01:12:03 -0800 (PST)
X-Received: by 2002:a05:6102:2c81:b0:7b9:5abb:eb17 with SMTP id ada2fe7eead31-7d286744eddmr1262909137.3.1793869922991;
        Thu, 05 Nov 2026 01:12:02 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fece99a5dsm8705164f8f.21.2026.11.05.01.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:12:02 -0800 (PST)
Message-ID: <e1c7e287-ccc9-4705-bd72-e801ba203668@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 10:12:00 +0100
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
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxDTdfMVS3yazCk@shikoro>
 <35983c5a-7deb-4b0e-9bd4-981754343200@oss.qualcomm.com>
 <auxHASG78dTviSz8@shikoro>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <auxHASG78dTviSz8@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNiBTYWx0ZWRfXx9T5LPlQmiX8
 VHvU0pl6B1SoGm5UlU9ihlGaZeeHFS1CW2NbeplAu47y1zSsbFAdlDUJxm+BUZEN300IGOXi1rM
 8V2/DB76WG3xoB4BBFfrqMg300IKkkarqLtqfyutdYLGkZXbT0eRJF2zP5SCQav9zI5FWsfQYIi
 SCJL4aQopWwzJIa8abnlM2LQ1NyZEWUB9FWZXiwXKfiYNjWqUpUh5eh7Q3t0ckeT73kBXWjLE/e
 1xwfwmf40NqmI1kiF+dxeSZISnW9gGiVQRdit5j8gAwy/fr6qJpn1s760l+YQN6fbmIS2u7awna
 HJtk56NqjdXhV0xAJOYKxaNgdB7gVDw0SJdaaLmM59eocA3xhSjn6zQ0ZMp2EJFDCjiQhFFQ2uR
 ar7JLLII5t60Cr9iJ+y6zw7ZJuMmnnASsof7wbcKI/zTBd+F/dVr4dcwCdNZq0qbt1GRJ+bmthB
 wd0uMq3B6ZioZ+1Y9YQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNiBTYWx0ZWRfX/0s3qELFCFWU
 95Sfra5284GtNzAEr234opH36K7F/O8lX9d0lJY6GpBOzFg7NW8e9SBzbiEqzqbR0EZvvbn113g
 bih0i7RlqTGKB3EtZwlgCC3AB6XjAvQ=
X-Proofpoint-ORIG-GUID: WjcPZ3PAkWyc_rNd6agdU9W2abALL4-D
X-Proofpoint-GUID: WjcPZ3PAkWyc_rNd6agdU9W2abALL4-D
X-Authority-Analysis: v=2.4 cv=N/u8hG9B c=1 sm=1 tr=0 ts=6aec4864 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=AWKtBJF-UzVMBMTKnHQA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050036

On 05/11/2026 10:06, Wolfram Sang wrote:
> 
>> Reviewed-by even with the "# subpart" still appears in person's credits
>> and reviewing entire patch of 700 lines of diff code (like Frank's SPI
>> patch) is not the same as 10 diff codes for one driver.
> 
> Yes, if you want to spoil that, you'd need to introduce
> 
> 	Partly-reviewed-by: ...
> 
> or something.

Ack is for that, no need for a new tag, quoting:

"Acked-by.... user may not have carried out a technical review of the
patch, yet they may be satisfied ..."

"Reviewed-by:, instead, indicates that *the patch* has been reviewed and
found acceptable according to the Reviewer's Statement:"

Note that there is little sense in reviewing - as in statement of
oversight credit review - pieces of patch in context I discuss here,
e.g. one big complex rework combined with updates of drivers. Who cares
about the drivers? The complex rework is important and should be
reviewed, but people skip bigger picture and put their stamp of approval.

Stamp of approval is Ack, no need to mix it with reviewer's statement of
oversight.

Best regards,
Krzysztof
