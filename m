Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793766983;
	b=XjJgYEcfr9oMREmWgPi9s1zHwzAQNZKvdTovUK0TBk9u9FaG2h82E4V25p58N/jCpvIY
	 aSyVPzwqgi2fQSkkM7xjonXL4dJT+NgZtAZEuKI5XiWDdQvCijkaquHsVQqaTRkIFcvjK
	 Razt3cvC4MB7xQjczYRtsOuf3wrXPSi9kb6zxXFEniETjMMKyygoklNaEJe/kpEbo84k8
	 jgdYlJ/dO8O5R4aP8MC1x1rcfjwtyonCx3AlaaXyDW2rOf53uwhUzlS7Ihqxj6T/n0j22
	 Qvkc0yrV39zAnQ0u4+vcUL2mlcSjn1n1glImL0vy4L8S4jnI6NKwuR6jcOtnUiZL+MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793766983;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3V525maxqjKyk+mej84Kbl6ipEaD1iBYV1Ed7VOLqW0=;
	b=fnom51MwXzcvk+RoBRUqULXF3e3ekTJgCkWy4CqMHhNJThNSlwj14VwTYUdSMcBJIocB
	 +8rZANi/5MMZKXumW9UKvuxNKA7AhYzNIUCkQ/UDQJFtf1TA/Hu8aKldq7mE5Qpbu4tF/
	 bYtx2lR3wzTm2+heblOwSxJZmpA6xxD0pqytKySFfkH8yMclT/I3Z83KduYKry+OMKeLF
	 +ijUXmO2zp4ZuDeaj9E//7JQrZUodK6B1M7tvdIKO22YuLYwRKwazNYYtsjixO6ipneDy
	 tqyaxXfy/7nWg80Qm0zW69Q3qj7SxKa71/QSOS1kocn5isKOCpA9nu6C6Ff6xmPIkwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B+hyv+tS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="bO64/qTI";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED0A606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 04:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ED0A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B+hyv+tS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bO64/qTI
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RK2U1248975
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 04:36:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3V525maxqjKyk+mej84Kbl6ipEaD1iBYV1Ed7VOLqW0=; b=B+hyv+tSKzu5fBJH
	nbGxvLN3dJthWKoHaGlykDB7Uyfe9vZO20IyqlvVtnqkdYtB5BiGt4BcyEojeWUm
	aS2cRx/J+NvrnN2+MM0bUZxT/4S3GGfNVUxsb58lMpAyZT5pqX0by1DWg4BQj03A
	hgavavI3r6yb84zB6k3sEYoZgBHkKsWXS0i0CIwSoXtAPkFqVMyuMiZLtDHIktSq
	IleQiii+G1lI2K4dryFYtCFC0q0OFJVZY2i16nZvu0xR9jSWal4OOWvxPBnyhI5b
	ngwW/b1fGgk0sVlAnBrjA3CyUUtXygx9sXs4P8FVeAn981MXacrg3gF+G7U0B6J1
	0Q1lBA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqpuv9h7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:36:21 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso767760c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 20:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793766981; x=1794371781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3V525maxqjKyk+mej84Kbl6ipEaD1iBYV1Ed7VOLqW0=;
        b=bO64/qTIbsQgskpBDCf3ZCrAfqXP5czjZG/Hu1zvhAI3lflW4Qq5vvnhRpVM3k8KCz
         sr+5V/9Fl6FhjbcBeaPlGIpC7pcPTXKkUo3eYIg0+QCdEHDWtcQ0pZZxCss6bAmKkvyT
         2ErclEvsx/jcQ/Tz4ivA75JzeSRy5Csf6ockuOUDlslZ1DGBRr8arRbND6rBZ+jOo8iv
         rHamREBWRXRiMkB/x6N50EShys4CTnUSl6yjxNFOXEPbhUJjOsiONAxtQbrX8somj4eB
         OpcZM+FN4DINRX8dbiIjVZsPhf0e5BXr3xxQwdkF7pGN/GujpCwB0568jdh3MhhGu7gG
         h74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793766981; x=1794371781;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3V525maxqjKyk+mej84Kbl6ipEaD1iBYV1Ed7VOLqW0=;
        b=qZcEX8ZcltwRN+Ut1/9ZjMoo/50tUzGmzoEUoOtB2layPWwHXeVuU+T4sHCRZXLg0G
         Jhb+P51EhZYGxQ7586Fo+OZdxzRq8+oRURZUxFC+7puDQ7uISdniNeDFKnFeljGH4zQw
         p97ADiMS+HKHi67NqCF8WIC+ojMiI4Bwa59Dfj22tkaYzmHjx7ntDqbSZgusuLkBsjcF
         HkvH1ict2S8fxnF8veRK//CvA6quKXqKKgr3Yk+Z1QAfCnlchdCM73kO3p6i9MH3vnIa
         2xZ0Q5DimAZ3AyTSiAkzD9+YQ6BHF4WLQSpnpKT2A89eA5DwlQxRCbD8fR2ssD3qgE8Z
         dx4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxsk1wlnNTNPl+KNDaCrZxhn64Uo07VsQkimHGH1nbB8eGipaV6BRLKc9xzwR4RrgsmnapBFReP+/gJ63s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CH046kl56Y6ma4UYNkoPRi9jx82aWcyyPXApg2BpAK9j9XmOP
	Zg1TIR1Z0NaK0dlxSQBsk/sotx5LltNoJXTvA3xjkRJT8LUMgJYpPfzxAu7rRH9dtMEQF6rfXfd
	T1baqPSc7HelKw+Jq1G7nUZJdZwALkUOXtNMdZyxTHhfSxKLpDZo2EfXOF/uUxfjOW1c=
X-Gm-Gg: AYBFou1IoeJrpBrOct9EMIrd3Kf/RGbaK4Kkn9ZHgKFIBLRu+Ho7WeSD5nJiFqHXcyI
	48JSxXH4KRTZj5QbQA1WkQCYmgrxrgXy2Ks4eEizRsBUAeK9sJZiFj9Asp0Npw1HYWFx0/XlQ6f
	pTggFOb6g4fJ9Weg6xI42abPPMveLQLL0n04/7dllLEBzElNb7B0vkWDasBL2D7ap8z41lPq7po
	GBZQ8p5FV7oAu9ppVGKL64H018+d9Q4yrLtjo4KGttr+cDzrPMjgN6X46oX/l/d4jCJ/mxqEMWg
	CsMmGyoNH08trbttvKKDobf2jIANAnfH36L30bZ80ajJsqQqiFxrNJjD7fVEu5a+y0RTLqfC4BO
	b2iTC/xxcg35sj7zmfJR210Beigw6JMStjBehNzaHqFi++gXeZ9UofiqYtolruDPQuG8Yj79FaL
	GF/g==
X-Received: by 2002:a05:7022:ef12:b0:14d:ef19:246f with SMTP id a92af1059eb24-1ac5f36d5cbmr24440346c88.45.1793766980564;
        Tue, 03 Nov 2026 20:36:20 -0800 (PST)
X-Received: by 2002:a05:7022:ef12:b0:14d:ef19:246f with SMTP id a92af1059eb24-1ac5f36d5cbmr24440311c88.45.1793766979896;
        Tue, 03 Nov 2026 20:36:19 -0800 (PST)
Received: from [10.217.219.145] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c57430sm4618852c88.18.2026.11.03.20.36.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 20:36:19 -0800 (PST)
Message-ID: <f9d27fd8-cf33-4e6a-a9fc-6770a933cfb3@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 10:06:15 +0530
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
Subject: Re: [PATCH v2] usb: dwc3: qcom: Defer VBUS override update during
 system suspend
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Vladyslav Tymoshchuk <tvlad744@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20261022224220.480-1-tvlad744@gmail.com> <auqXyUxc9cRIuYou@vbox>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <auqXyUxc9cRIuYou@vbox>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O6SsLx9W c=1 sm=1 tr=0 ts=6aeab645 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=DWlGITjgz4oUXde0rNwA:9 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: F4LSEwOhuNEPULcswj9HJza4_6NVMcK7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAxOCBTYWx0ZWRfX/YZvVVMbL9qc
 4dBwMoeMvtkUuVRW8zp9gZ3WGYNbYOYwpf/+4Id79OEBIhAQIDmatPWw5I/wfZD8UBU4mdwXwAT
 8mN4tRhYxAXRHXqW+1fDoQ3RsOnrGL4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAxOCBTYWx0ZWRfX1zOw/Gplow5/
 wia6m2um/Jnt8Ob5mbwcbxGloTz7TtMdWRXmpvJeIR9RBesWWUs/YO3KxKMUNzGTIGVIHQ4cGrB
 3ZdDERDuZpiP5OV0sKxB0ehuxXkUu5GUAYs4SVbhyoba6546gVjsLv2vjAei22dSJJVIdhJ6t7i
 /nQ61TtpbvuDDrWDsLcD2+YEDLHKAB84rSlMqFM4KB/58T5U1p1WGBgPy9I/UdzIxMbVHrBJXr0
 gl2o0sH7TkTgwPC9jHvM6t16+jXuZExSx86Ka9q3KHYGvnqOA5PVHz9tG5xGE5RDp+z/Gn4r+Ad
 M0UvVl9/hCPuH7zMqq3wbUmn1+/oAsFrsDeSs/gHRFf3+ogn/BWBEIkb6Uvg5i1LdNdUWsTntME
 kSukqdILQrC9bWDDUqIT6+LNj2Z1sTIGydBacW/YXKy32kGpNyZ+IXVApYOfWzqL73VDBLDpvdB
 BJ3CJ2HkWyCbroZzRXw==
X-Proofpoint-GUID: F4LSEwOhuNEPULcswj9HJza4_6NVMcK7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040018



On 11/4/2026 8:07 AM, Thinh Nguyen wrote:
> On Fri, Oct 23, 2026, Vladyslav Tymoshchuk wrote:
>> dwc3_qcom_set_role_notifier() updates the VBUS override in QSCRATCH
>> synchronously, from the context of the usb_role_switch_set_role()
>> caller. The glue assumes that role switches only happen from a
>> freezable workqueue, but that holds for the dwc3 core's mode switch,
>> not for this notifier: the UCSI connector work, for one, runs on the
>> non-freezable system workqueue.
>>
> 
> ....
> 
> Good catch. However, this should be fixed in the dwc3 core. The
> pre_set_role notifier can be called from the freezable __dwc3_set_mode()
> work instead of from the role switch caller. Then glue drivers won't be
> notified while suspended. This is simpler and applies to all glue
> drivers.

I think the problem with that is, dwc3_set_mode doesn't know USB_ROLE
(especially NONE mode).
It only knows the mode which is gadget/host/otg. Thats why vendor hooks
are used in drd.c instead. Perhaps we can cache USB_ROLE into dwc3
struct and use it later on __dwc3_set_mode.

Regards,
Prashanth K

