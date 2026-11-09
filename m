Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231720;
	b=J71SwpHBHMGjerCFWSIM0bLQZPX3M4NZEF1ZUIbddmnNGUJhkuZxWWcECUld8MG71PLZ
	 tI6915Qe9wHCpiC8bGPLzHgeWZPlIKq6KcooC09PqrP3AGkgLM7j7TEqaQn4ZH5YC6xPT
	 X6PV9J6BqQbG6burvoaYw5z+baultAWAnozakWqF5oKQvGo1geDMBTLXq+rGVy71bps/O
	 8XtKwKJfOViWdFiGOv3Fps7nAlU+oMxDfgL2Na2uMKTeAVn3HM14tAZwO3xrJUwqBr/+y
	 3OcWvSeGZvo9gNVdQRl9zoNQok/iIa56ZxQiR8GsGtI7cPnGoUjacnW8uRvE4RLLeaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231720;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:Cc:To:From:References:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FSrAy5rmEDU2pXsh6r86g+NaMo527LXaCQJIKoQAQLY=;
	b=NML+1XCJL3l/JxxzjBTJexQZIYJQBWE90p/sgI94I7jHB9CfhcUfxyxqL61TJVbOMX1P
	 P2RBxJk0HsxKtzr/I7DgH7lNCe/7ZjRPczxDWmwjx+MN6yW25kndC6eT/yviYSV78ZPUH
	 nSNOksGv8YOnPcZvvWogbqv0jEbGK37f64jj5KXzFwo7A83LACz5F5YaM0dnJm9XU4pDL
	 jJb6U2lLzbQTqEwqJBCkPDOlD9YqOjH9HmZagYls0op3CkuNfTTEWjZjNDnX99fXaznUC
	 hAIhSiYERByQEIG8Pn/WFVtbkiDYRQUPEdd0ZEg1nxII1daFvqrJdg5LmFdl6ODOQIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ftnJhnp5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Iq+nlsiP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D811C606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D811C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ftnJhnp5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Iq+nlsiP
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFKZs971492
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 13:41:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FSrAy5rmEDU2pXsh6r86g+NaMo527LXaCQJIKoQAQLY=; b=ftnJhnp5+M5McECc
	Y13GHCw+lPg86mSX5CztsUTJiDLJm1FiNOpa6f8fRmvp/RXBeFKx8dzV7dApWdDJ
	duQdQ8ayBFSsR8QIqO0+l07KMxofj5jywvpC9z6LvlOWxY4G/lTsDYQtHbDFr/td
	KsoInf2vLZEm6/spFuChnLNGXpYnusWPdlh7V1KXIsKm72Ktw50FfFoQ/2QdCTBp
	b3q/pdGr2FB7XWDZiQ7YrCWwU6yDBgBY5ZsTN24A0QH7qZIHwK4ZF3+y0FWal1kx
	6nrcW0d7LCZXON+XBDyL3/y16DcbRsJGPJ1J8lJXUs4vhPmOqAiZYFjpGkUlzvlJ
	AsjL9Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4htuqm3btf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 13:41:58 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d2d7d7608dso673708137.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794231718; x=1794836518; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FSrAy5rmEDU2pXsh6r86g+NaMo527LXaCQJIKoQAQLY=;
        b=Iq+nlsiPop7MeKWMNINB4QR+wQrZp7m2OSt9vgexXxhuPwwVNM77K2pRjshH7Q84fq
         cwakPi+2FfPFEN8bOGognb4za90lhkUbTIgOYOy6wHjByR57KguAVbnTTMpddd+NHdn1
         TxCpJ6darFxw2ujXCbkc6sXq3ZBIRFPMbwheC10crjwSD5mgdzGBcuKZ5ZB67RNc9erf
         GePG8SFZFeVoFe2Fvf5JCjNXp0t3Rg+tSDT8zuQvu2K0le+guPKq4C7FNkcRksKUs84g
         PoZ4fSVqsE2teOqbFLhe8Cw/9tvb5uF8ZAKofKOlhUWu8C+K/7qQ9pVGcIMXcvc/tm0p
         rk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231718; x=1794836518;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FSrAy5rmEDU2pXsh6r86g+NaMo527LXaCQJIKoQAQLY=;
        b=p2kuDMs3lIG+53P/xUT1ETm8EzzyfNgfTcqugy8kNMQ9jv2GuHCp+Q0SSgwnnHMIps
         Rxo8VxoJD2kZdMB/A6bdvF9zI0youhJbiK1DAYbyZ3fMwSOR7Tj4p3Y3xId+kCBApoXG
         wJaTpt7AQX6AacHkLnywHt/cleoJWQwd0GJJHBBzDuLekKJUZVG7kt+8WhclNevwkppK
         Idx+NkIOgX5AgYojFOlpRwBZIIRT4yTSKDTJduNeJEWOs3MVvZXvL7GhjXu8ubYE6Cpg
         hBfQV7Z4D/ubNYnrAq0HGZmUMjB99WgUOoYO+6o/JxFqvsvlJpAy4BhT76Vg0csIfyek
         S00w==
X-Forwarded-Encrypted: i=1; AL+hErHgKLVDzLxkuEEX1soOBWKlB/rYFYUup2vhxOv6cOxhaNn6aCn2CJvD06BTmovnRfz8hATUhrRo380FRR4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ejnp9cv5ZMuJLXTVEuMBZ8JNhw81mmRUAGd7c8a+7VrrmTpfK
	VO/tCiOdASIXHcPXAO3mfTeGYzyL+I9VmzQFbKyEFc7f1UoY7yLaP+EG3E0Hkv4eX1AWC94xNZp
	cSmRKhqN99p8j5WfItNJ9sOAsOe3eRiL3ScCKsBI4fqyd/OMjPLjIOrAfm+ywQCHYNps=
X-Gm-Gg: AYBFou1oTdQNR8o+UHfM/DSTnhoxErEQ3ElyAl6wgMRp6eDWIHjpG6zaj5LMCJ88vsK
	TEreZyCTR3DI9B7DZDNhuXylNjOTbd5Pk3ZFr3R4FEj9hFNZ+7Wxj+TmpUQetiwnEk3kkoLClr0
	u70A9mryQ7xCDHjInqSNU4jK0o+mrhxwKMqMIf3fLtF2Tm6yTwclsU47wB5X9jJVPP4gczH/WAi
	eLVsw6IhyoW2QU8cgSlC9/sA8RuE5X/HWJh7ktCLKVM5YLmxzNwlq6aAY7JrRQCLbXHvKgCs1dJ
	D6M/nzhnDo9m3XF/pBUCqvwX4whSjgV9pAOhgPgCu1HsIbzSChgAtRtWVnZ8BTD8hHcF+KKvD+B
	RBDDPT9BwDrOQ5iTHnqfagAGU6I9++blNtuEzu2phE3K7XpKkbLlZEUTvkIIiBLWzc4pA4Eo9cS
	FMknqeIzelkus=
X-Received: by 2002:a05:6102:292b:b0:7c1:9286:296f with SMTP id ada2fe7eead31-7d2db17accamr1198270137.25.1794231717996;
        Mon, 09 Nov 2026 05:41:57 -0800 (PST)
X-Received: by 2002:a05:6102:292b:b0:7c1:9286:296f with SMTP id ada2fe7eead31-7d2db17accamr1198261137.25.1794231717527;
        Mon, 09 Nov 2026 05:41:57 -0800 (PST)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee247e9sm149396925e9.6.2026.11.09.05.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:41:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 14:41:55 +0100
Message-Id: <DMQQ2772H45H.16UW0C0P9NCTN@oss.qualcomm.com>
Subject: Re: [PATCH 4/6] riscv: hwprobe: Report Supm only when available
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Paul
 Walmsley" <pjw@kernel.org>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        "Alexandre Ghiti" <alex@ghiti.fr>,
        "Samuel Holland"
 <samuel.holland@sifive.com>,
        "Andy Chiu" <andybnac@gmail.com>, "Zong Li"
 <zong.li@sifive.com>,
        "Charlie Jenkins" <thecharlesjenkins@gmail.com>
To: "Guodong Xu" <guodong.xu@oss.qualcomm.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-5-radim.krcmar@oss.qualcomm.com>
 <4879567e977e3f5023c6e7ddca133b1a.guodong.xu@oss.qualcomm.com>
In-Reply-To: <4879567e977e3f5023c6e7ddca133b1a.guodong.xu@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NCBTYWx0ZWRfXx9VuKmBwRaMI
 w7pGB/13enU2hBwKXNDc/t+nHM6An9DIM/lxNZdoiMSsmT3hvZ4hhsVEJXEHLkRWqPxXAROJY33
 jJAIHkbBiLm/82HDTJ2yJ3Swvf2XwEk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NCBTYWx0ZWRfX89fhuxEZBq3s
 iru+TS9e8mQtG8pY/N/Iqw38eK6gKrzmB8FHfKGX9puaYAHYXSqhRm1f/TwskyOoB8N8ZtKMOWI
 H4znc3cS/OUSdIrlIiA5I8n1+yZxh915cDjHZt2H6OLUcl0JKyDvlhiwKtA4ocXWjretNKYMfjT
 wPJppivMFPyW0VzgnrqXIS/yenm0hEZZ1uayRPeuA+6TVwriscGJtsDjc5S6FE7QWl3vIssKsz8
 ErCLqsKB5xElU2CsRirXmdqjgPhQWe+o9cSPjSzXea4eY0Q4Er5BE6L/9Cm7+7NxkzQjpQHOCRz
 94jmzJdeVombPSVZHJ+LMUlCChE5/HPmC3W4zI1qCuoIIiowJuzKawwK8b4DUElx4hLgHC3LfaL
 FYMYFCCYBexNwZRMkgq3ACPWwD8MmUmtjrwxTX8g4GDus1bKU5jHf2mf+bHykrwDoQvZwnFS0Rb
 RU7Hz5OKLV12GNd5/4Q==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6af1cda6 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=TnNrh61NuvM_ujTk5a8A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: y-gRFn_2frb_0dMQbp9aIUxYcN3FBH7M
X-Proofpoint-ORIG-GUID: y-gRFn_2frb_0dMQbp9aIUxYcN3FBH7M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090054

2026-11-08T06:24:53-05:00, Guodong Xu <guodong.xu@oss.qualcomm.com>:
> Hi Radim,
>
> On Tue, 6 Oct 2026 09:53:01 +0200, Radim Krcmar wrote:
>> The RISC-V ISA defines Supm as
>>
>>   "An extension that indicates that there is pointer-masking support
>>   available in user mode, with some facility provided in the application
>>   execution environment to control pointer masking."
>>
>> Our facility always returns -EINVAL unless Supm support is configured,
>> the pointer masking ISA extension is globally present, and the user-mode
>> is running in 64-bit mode.
>>
>> Hiding Supm in compat tasks would add complexity that doesn't seem
>> justified as 32-bit code has no reason to look at Supm anyway.
>> Reporting based on the a global sysctl toggle isn't done.
>>
>> Do not report Supm when some harts lack the extension, because it's not
>> available on any hart in that case.
>>
>> (Reporting Supm when only PMLEN=3D0 is supported isn't great, but doesn'=
t
>>  violate the text of the extension and we ought to have Supm7 and Supm16
>>  extensions if we care about precision.)
>
> Since the kernel already knows whether that is the case, could this
> block use riscv_have_user_pmlen() instead (55458c7347a3 "riscv: Add a
> getter for user PMLEN support")? It exposes the have_user_pmlen_* flags
> that set_tagged_addr_ctrl() consults, so hwprobe would report Supm only
> when the prctl can actually enable a non-zero PMLEN:
>
> 	/* PMM=3D0 is "disabled"; Supm is usable only with a non-zero PMLEN. */
> 	if (riscv_have_user_pmlen(7) || riscv_have_user_pmlen(16))
> 		pair->value |=3D RISCV_HWPROBE_EXT_SUPM;

I'll use that in v2, thanks.
