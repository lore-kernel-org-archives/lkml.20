Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216120;
	b=SuoBE2P5oEkghhfxiypR+/iPfMnQZJuA6S7QTcZIc0WJOz4vebgyfo/hmtxZY6+1sr/4
	 uXopy4lbx2YDOlXuUoz4YkUgEOCrSQVQFqwDN99I3N2OzXY732MPy9TCnCI6berKV+wEn
	 sZuLyjHgCU9Wl2RiFRz43VZq5WpR6VIAZ4eRmMpgvIMm9ck32z93H5lppsfyHx/Ws9wZ4
	 +Iw29xd4zgMOxy2xAy5okoWtW5RzjMEEzr6gyFk3W1vltbmH1/4l7xzdhIeBx4rA8o1C9
	 yTwnF1F8RymSrjxqUf+q0ZwzZ5Y1Vh9veApbiDNEr0DY94Bu8pMhXkgHTBFO3mydJYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216120;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+4/Tw2/BZgl/GDlD4gANvwDshf9nsMa1DlxhHC1kPEM=;
	b=5dv0pOyzpX/WwdG5+G3ebHjkwZ+M5/TTkvZzppeieRKSM14BtHl+NO95RFsde08kMBPZ
	 y+sRsrqHp8duj3NJQHxTLNvSeiUDusZPdBAaYMBv7++wj6omjJRIe7XPpeBCDVTynqTh2
	 hZmYBBCw/1G+HZuRl+OSAUaNw43ISyekbGHZdR0D571GeOOLnTuk/8/YPCfhdt9s+Y4+q
	 hquBmUCTrUK3/ZXjD6kIfu6oIrqQJZMj9pNzTMv6ujA3DwAfQ1FKy9YhbApUL9CV2Y2EE
	 atTnPwjjRcOEu7nWbtOS2ub99opZy3XHF68ZsBcTeD8WaTXlZqnjkTpWPAIWIinPpww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gk5HEWLd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F60+zxxb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51645606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51645606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gk5HEWLd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F60+zxxb
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A1le3611089
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 09:21:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+4/Tw2/BZgl/GDlD4gANvwDshf9nsMa1DlxhHC1kPEM=; b=Gk5HEWLddCvbNRg7
	F6S5zLwNpdHTXhqPXDQmcJERUtxJqYTZUAYR6fq5CHz6tBAv4SJ6xTMeVq9IoDLv
	Cl8KwIP/HcQUs77bmYl3rdkIAtKb06OT4glPy21fmbwzkRk2ugW8va5jJfNvqwX8
	AjPG2fzQuYcTKtAz0BEFyC5XttO/tRzLYMXhLPOz5K1EAcplY0qK9fYNFPqDPF4m
	o0H0s+RujeC4NuqmQWGMC/k1Zbz5T3/sz/tM/2YhGPA0aPwTEGyTQn+GlER3WtW7
	k+BdkyCdgUDWbeIJIfpS7l1MOGDnLLKC16sGpRby+L1qTV66A1xdurbsDwIQsHiA
	f0rJXg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbnx286-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:21:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93df7a9466bso11536685a.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794216117; x=1794820917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4/Tw2/BZgl/GDlD4gANvwDshf9nsMa1DlxhHC1kPEM=;
        b=F60+zxxb/bj2pVeqRV1me/rbvfq92afsvImtmwRm6LmytjYT4g+pioFFAPNINfGxcF
         L119daqN2FTs9R3V2AG/iynKeN0apoO/nYGmpCfRyt0Tt2hwB8BIWBQRVEGySExucd6E
         prn7wZUINpJ6fQ2ycN7Lp714swurmSM709Ap7C1jX9NMnPTqd8iVWHanbQWISTXY/DMe
         sXp2h3mUXBHd7IKqasoBh2i+jLPM6lcTQwVodlz9XlB01jtEtVw3WLNjV7Iie0WGPHV+
         bUB0qkhlMoXP8f5ELWPMzwh7Pahrz7lKkNXlfZ+AAD0bwmW9WESgCU2WLP2DuI9PpO8q
         eLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794216117; x=1794820917;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+4/Tw2/BZgl/GDlD4gANvwDshf9nsMa1DlxhHC1kPEM=;
        b=0t8P/Pe3Ho9h8quSyLuhttKXbeY+S0LzMuHnTH82NYPqEqWfyd5OCcuV4JQ1AzfhV8
         fSRu82vsDf874F4+i6gUMbOjqhQ6neoVKX70BuTKvh4YkrpB57kaM620NI4vGtUOKCB3
         YLlAh7oJDGRMQZhALd73xao2xbp7l5TJn3c1uGm93EoJg9aZA53aHty97yupi5ANw3mF
         KFYyVKuvITo7CHfiskLfKkDFsyfuRfejMs3HCJKaVctSvJa4GwM27m0gmuoAxwU0KOGs
         KSbt//92uPCkBPcX8+Uq5he6DEiRklFewqHr4WXgsNcu+p4sLPJeIcV1IQge0MsEU2zC
         ctzw==
X-Forwarded-Encrypted: i=1; AL+hErFq9qw/1Y5r5sMvsadqjWd5dbY4NQ4igleEErRLNPvpG2uaCHDh9lVm38gxLfQEU4ETaXNOyb/7hkoVftg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Sk2PCaGA1XnWOAA9H6+AwbEXDfsuJorwOROLZWV/b1pK9zDuR
	CFQUIxlUUB33tdfsBiTBq/+jmf01IFzg/Wf89sdr6l+wIQ82AaH2vFsVijF8LxCsdN50BoNT2z3
	oxD9o1DDWYiCK6OeUKlSw2t/sIqPUTx+9AuGauJ0kVdDZn3Y5L1on7GwMKHeQKK6VNVU=
X-Gm-Gg: AYBFou27479TqXjsc+Sb5t4OD8bCwJBD0Eku9tYAm4uqUan2V0IqF9hkEfG7GjVJtKJ
	33yP2Lh5TBFxzWw8289ZOqeswC4o6P6zU3eIdrtnMeKFCtegFu5d+bgWJfADEpJutM+11aQjCz9
	Q4bCQeJUc57WwShaqNIZctZOU6UhGwR+/YCUIDbTgHJCr2mbWewoPH1aG0vUdrTDH9z922NCV71
	ZGsneEdIAmKLGGZ+qN+bOxcAfJoniXgyh4rLT0N5EQEcZ+b9TI8mlBVd3XFiIFNdbOuOLmOVKYz
	7nJVloUejkb00F8iFALRPARFZr55mbBvGWHn1ORwyChSInITB6qWxrl3Hrg7XvZa8YL12HsIunS
	s8cC7YuFOhKzeAEiOVqdhMCCr1rpdJxyGndJKqGQAxM0BqMQ6i5Byuqg0Sjy6vsEMEtWPNQ==
X-Received: by 2002:a05:620a:2253:20b0:939:c7d1:7471 with SMTP id af79cd13be357-947842bd236mr505026285a.4.1794216117422;
        Mon, 09 Nov 2026 01:21:57 -0800 (PST)
X-Received: by 2002:a05:620a:2253:20b0:939:c7d1:7471 with SMTP id af79cd13be357-947842bd236mr505023985a.4.1794216116974;
        Mon, 09 Nov 2026 01:21:56 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ef33f1sm1191344a12.35.2026.11.09.01.21.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 01:21:55 -0800 (PST)
Message-ID: <01375dbc-e497-4ed6-97ad-93280969c54f@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:21:53 +0100
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
Subject: Re: [PATCH] dmaengine: qcom: gpi: convert to subsys_platform_driver()
To: Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261106-dma-gpi-subsys-v1-1-b37dcb4ba3c4@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261106-dma-gpi-subsys-v1-1-b37dcb4ba3c4@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VTctpwwUqnTGGYERsRud4hnmgSIVX7Sj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfX8BuooJkUZyMn
 05LQ4VY2npzFL17zQOh1POqhYvoUs/DNhmIrK9Tt9es3Uy8nHYNH7zAJV+55f3KbScrWUWp6AM9
 tUjHa/qNd9ZfDFFZcsXmBHmEvJJx65AJ0A998EXgnI2W2DpCcUhuRFCdFYvo/sEYqrwDUN8Hrku
 fnYlYrif/Q32AxVgR0PiRZKQZlly4mgfe8ZNPHiT02rX7F5sNlvHWSVMDn7cJvK5X/v6qF1ImFn
 H0LmTVL/1J1UapUuaE1GljJXM7culTLazQXNX20Y750iOPM7nyZ/axlFy/FHRKSmRr2CuS9eOgT
 s5d60j3uM+EYs+qhygV5PHSKH5VaErfRRoQk480140LitvCj4cfhbYphys4h7NbWiFgzmLCk0bh
 QQPnsIOaH37vCB5zyN1qSjyRYivXUNxl1yI0jdPZASrWDGJtTQyAdo3gqzDnCXHwkp77mSjGqfq
 Ksx6QTcT9SXzeOr7MaA==
X-Proofpoint-ORIG-GUID: VTctpwwUqnTGGYERsRud4hnmgSIVX7Sj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfXxBtRZRJePrbe
 dBOrMJ9ThIx9YEtiZnyXj4EK46GNF8qAyaaeBU+cV2gJTJVABVANRIj7DDm27g4NIFqvDQcizU2
 7ZTlSe9GCTt+c9ehAJ51MA9myolO4do=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6af190b6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=0tVWl-7fB1VfZMg2ewEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090037

On 11/7/26 2:00 AM, Brian Masney wrote:
> Reduce boilerplate code in this driver and convert it over to use
> the macro subsys_platform_driver().
> 
> Note that this driver is configured in the Kconfig to be a tristate,
> the driver doesn't have suppress_bind_attrs set, and there is no __exit
> function defined. This change will add an __exit function that
> unregisters the platform driver.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
