Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD8C3914FE
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 12:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791377491; cv=none; b=l+erh8a0A7D4VCQSzO4vgDHq5uPxMpHNMbFmdGdKM0wiRcn48NBJgWNIN9Ugkpx5bZX8vPf5jGbzFKtIOf1qOyOVLKvhd04auSK31kPxjvO99nFzUBznIW57xIwtGAf8xu0qWr6kLQhWHLjfP0/vn8iyEGWMACdkp30JU5aB9J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791377491; c=relaxed/simple;
	bh=Yh+Qn1FxrRhzwIRz7fKF5WN6g4+iXup778g/Qf1o/OY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PHXkYRY6yoUovb6OjDb9gCmFBT0sOQPfQ6L+He/NULtlQJQLXG06zPDHe4f26153nBL921coe2KhN1Sbk00cFhNORtxQk04sQc3DdPRVE5WtIUQRA1oEfl+1gXVGHzaaBjYTC/RQK5sC4OUus/ECwcd4rd4Kfk3m/TcgN7hDEKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M4ms9/00; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gF7VMDnc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M4ms9/00";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gF7VMDnc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BV94R609887
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 12:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sC6O26SQSLtN/B6et8VWsXOn2YkPcZ8zoEBjKieVz70=; b=M4ms9/00RYMIIzaw
	7wroUm/vK66HpCunxJeKWfwDYkrWHek92yPUPUBXGMlj+dBBaJ9lVpSRRuYrW8sJ
	sOL8xgGYcZabjURvHwYTZKEIeFyaY20dgDkgLflK2MlNhsflcM/HtsGbbF5su9U1
	46PvJnFOaxEO4nrZNcEb0P0VUuIFBxF6MbWziyIYkvlQ6Xqh7gJMAcaIJMZd6d9E
	liIcJky4ahniSvaPYiWJU+nMgtS2sFrwJFtIwhWyxmAU16YArXc9NxapKb+cT9Vv
	T4/fv2nf+mt2THB2owS6G3F1QbxyHrbgvWvWFlcsYlT8r7q5svUzC1sO8wr3bRAO
	ElilxA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fc59gdr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 12:51:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc435388657so4553639a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 05:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791377481; x=1791982281; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sC6O26SQSLtN/B6et8VWsXOn2YkPcZ8zoEBjKieVz70=;
        b=gF7VMDncgyGoKQsjARWaMVj6EXDHWGEH7SUdluzAK1Bb4dECXxLz24a17x921HK6ke
         1mrNAaAvbgFfGKKE/kotgKbSN2Jo99tU4dKoT1Q0h60qCOTdHUKELCAt4plb7q4qrmaL
         n58Jwhis1ZZyHBMlE/7muwA/8OSw0an8rWSMuuEdmgZCEHNCxkLMVZT3l3jTzlsiAhoL
         8cyggkYsBjl9pPexjC8Tnmw4s1dFr/WhxHPoMvsuwaYjRvvZ0YGKrXEHAc8VZnul/cUo
         RKkyeToFCa2CX91cUWiTqO5YwtHkBc+8RC8VuFKlUos+qFTFmLdOZgCuc3pI7wc2HkQU
         S27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791377481; x=1791982281;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sC6O26SQSLtN/B6et8VWsXOn2YkPcZ8zoEBjKieVz70=;
        b=JhpheCoU012CXdpDNbG++t/rDvBm+EB8lCstjOtasKd42SVMBo9mJGSAechgGaITF7
         sxszvR5Igy2bZzklKxM5YtrjyZaidKc+flewpAYDzz4h5phi1WRsSA22MpoESd8+biMt
         SZ5kniEKCi6U26pcPyQrbqaDdwyyEclfkw9+aaIxWbRkHwug3CF+1gzW3h0DFrtKqhKe
         khA+AV9iz7Asbj/nrUYG/noLO8N3giavY7RiCQj7rJKlhgVaAQ0Ki46lwSjlkZc8oW6U
         kqCkG2g0GnIeEaJbYGrlRInVNg6fE5UO9haBjLB7wdoYyqMeYcWf0SRKYxMdaEt1Xki1
         Hgig==
X-Gm-Message-State: AFq9FYIz/Zo+G/sa6ufTD07ZQHmaraFT+YSefTKMqRKjO3slhHCi+F+S
	p1MR1ueijmnVnyaBiJcg66DS5qwlVHiz+4k9+s6lz7z+RaZ+LF9LOnf4yJVTQUM12DXCZhKghfI
	+H+zqWkznxEcbsX2Tp07J5q6tD7hRDc02a5HrC4N8r8z4/oERc9e9Bj2RHhKRRRpzqLg=
X-Gm-Gg: AYBFou3J6NuRg2ETif3EkymIb6kn1FJdu0P3Fe0pnPywKGWiyKxTFUdBcNfq8D4gNDg
	j+4OVQlrEWCGq1kdExyUlHq+0vsJnnir86MK6gYMH/wISbznKnf5anlU/dm2qBKTMSl9/XZ/A8u
	q9HoZ8skL5QNVyWzfggmJpk6w9s/XjhC4jmTHqXAcKbBu4YlzzmizhOW5RAue2YHbYh16DKdc1j
	x7anpKO0c79HlOj1mZhwRTgNr9pMd91XfJ/xRAq0Upnv+nOe+4tc4jQ37M3dYyJ1YsHOCH5+1/x
	/GRUIX0mrvJMB4OrvDVFfMcCGA/IIjVmpWg+O0GdiJx/MaF6bcH8d1RjIIuWWKkVR7H3lgE7oAC
	kTjZGG7zCZclh3lXPe35CsBFE8hhCpiwg
X-Received: by 2002:a17:903:4588:b0:2e4:b37a:d573 with SMTP id d9443c01a7336-2e600545f0emr23100865ad.47.1791377480555;
        Wed, 07 Oct 2026 05:51:20 -0700 (PDT)
X-Received: by 2002:a17:903:4588:b0:2e4:b37a:d573 with SMTP id d9443c01a7336-2e600545f0emr23100655ad.47.1791377480120;
        Wed, 07 Oct 2026 05:51:20 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e604852079sm9721535ad.60.2026.10.07.05.51.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 05:51:19 -0700 (PDT)
Message-ID: <c333f1a3-39e7-49f1-b0e0-f3bc0348a242@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 18:21:15 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] arm64: defconfig: Enable Hawi LPASS LPI pinctrl
 driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261006053717.3455143-1-prasad.kumpatla@oss.qualcomm.com>
 <20261006053717.3455143-4-prasad.kumpatla@oss.qualcomm.com>
 <1072f38f-8dd5-4e70-a583-c06e402ee90c@kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <1072f38f-8dd5-4e70-a583-c06e402ee90c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA1MSBTYWx0ZWRfX73jQKCvUk1vT
 HPiwJDC9FOBDcYRmyhUmmYsqeGViydyZx2+o4n4UX3INypvVLuIprflorCkvJAOGNe4DWKhsVqG
 dCl53pjn6WVimUECIOInCHQ9DK2nW8Y=
X-Proofpoint-GUID: 2nnt1HCRLXrK-iEA-ZoBw2tmYQdw5zx5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA1MSBTYWx0ZWRfX2JN98icX977f
 xBXWkWG8GEmrBszJ+w825Stu8HRDlSct6zsZdWbzzdpSMKKDQ7yzA9wO4cqnG3uNkhIokqAJ6+j
 e31NxRY8rJcv21jVk2CfqHmmzOCmCKOBU5T/k+rW77pxs4WHNo1RHIfJvXlLoJGlkr/qoNa0Ua9
 1ZNZ7bGdk2SQSUpYSF7cCX27mpqPdrVhOhfyU89plfpgzWWE1sH4cRmzxjGrCmNPruc57dcTrVi
 8wIfxXwWzoZGeBPOayFmHJ+bXhM2ZBKLW21kpJkLFU4vybjiUvzFhf5hTkjpTMLuAIaV1P+0Tz1
 Yk5KATYwjBkZw6fwoRpvQbhzwmQDoKs6m+M7KrSUPP7DWlnrsFvv+BXy3GmD1fxUuRoL8LbZbk2
 x8rZBvTiF/4Tsz1so4Y6C64VQ8vE5zPAYVzRJM/SiQXoaQxIHWO7d3orE9+YyCj6p65Ie0ztPzM
 0LUNKH4RGra6RRSo8qw==
X-Proofpoint-ORIG-GUID: 2nnt1HCRLXrK-iEA-ZoBw2tmYQdw5zx5
X-Authority-Analysis: v=2.4 cv=a6+lZkSF c=1 sm=1 tr=0 ts=6ac64049 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Ii1R4P4Ja65leNuhIA0A:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070051


On 10/7/2026 1:15 PM, Krzysztof Kozlowski wrote:
> On 06/10/2026 07:37, Prasad Kumpatla wrote:
>> Build the LPASS LPI pinctrl driver as module, as required by the Hawi
>> and Maili platforms to control all the LPI GPIOs.
> You already sent it two weeks ago, so this is not v1.


Thanks for the note.
This patch was previously posted as part of the earlier Hawi/Maili 
series. I'll update the versioning in the next revision to reflect its 
posting history correctly.

>
> It wasn't picked up and this won't be either.
>
> Same comments as for every other defconfig patches. Missing proper
> description, missing rationale why. Hawi and Maili do not need that.

Thanks for the feedback.

I understand your concern regarding the defconfig change.
The defconfig change goes along with the Hawi/Maili DT updates in the 
original series, so I'll keep it there and improve the commit 
description and rationale.
Thanks,
Prasad

>
> Best regards,
> Krzysztof
