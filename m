Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8377E48DB2C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792176762; cv=none; b=q/AVyTBTVIrMOZBbHWbHVtqMvO9jh6UGRrYVM4k2FatdJ91WtxK7nDz/9zeJHJxLmWiS+737xkV96WqXsTTX1BzFUwU5hsPkPLvI8tfbOX8fecsSwtby0OVRlhaJUJRQJ2wwKQx4A7JCx8m9Q56Z6XyYEoR3rcSChGhLblUjBcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792176762; c=relaxed/simple;
	bh=CrHa0q2pgEdRtT6Hq9NbFYzjNU5uxFbQpRpzp53Lxmo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d6ZUaUH28f8Qo1MtHMC9ROLY/I2lmPzu4l37fC5SHzzrvzfiw3H77FvxnunYdAnHOKggwcrxXr5L5mwAvXzl6E1rdfcoBQSTAXQGZ4kSlTGkKb7P7iCG7I0QtucAgYaUF0nLq86TiixOZvHTGDFnnj11NAGVYqnsEWY/msdOD8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=hdqcWmWo; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=fkD4kS6P; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="hdqcWmWo";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="fkD4kS6P"
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GIbwRj1415238
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:52:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=HLzc
	yOFA9B8jdMdzXfvMlEdd0KokvuoLnoCqr8l8IU8=; b=hdqcWmWotaXDPyTKxiHc
	aMTrp6nTieLLfPR/BF662ZzoXdrigD8AB6UXqjHbHI6dhuyYt+QK71wM31C1eCPa
	1k0tgrk3a/0rI99rRs9pzW4cxy8nRc6MPL5vJBItEzH5DNxTd8lwYMme+5mGPTjo
	hdRx5uY3aTEfBtpF2mCTEs0rhJBJeA7YJbfnibO0g697YTHNIJsADjda0HEzQJvd
	VwTKGatk8xMAx/MTFWJaqLLIVBeaM7akJfVV4xpCVldKkR4G0yxetLVZMoxfRx47
	5pHE9EENxilUozZmMi81rCqa4xdvwegcH/ceUNOWrUR3miyZ6q1hgwkc5SARa0hA
	iw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hbbmrd350-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:52:40 -0400 (EDT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917baea8e5dso5075746d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792176760; x=1792781560; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HLzcyOFA9B8jdMdzXfvMlEdd0KokvuoLnoCqr8l8IU8=;
        b=fkD4kS6PUGYLEwhyNjLfEsbP124XqTy+ANYWvNoDRpXKXhFzV1ATxCnreAyS4Etawm
         YxNfH/vvvct0zTbh4Gt0Uh2F7K+WmGNmC0u+g/qph/gmyFNx0Djcq01HupgWIpFkTKvK
         ZrruC6J40EPeENyIldySP36LZnylcr6rzo7mfO+X456oNCCQ4FbvHqt6pxnBaAhX8pAL
         IGxTgzAL9iCUf3QoabjxlN0FEj5dGv83kNyzxRcLd62QVe0UomUriUiGCwkS0AQwM6Xn
         WVKuQPzqXoxLBVTVbgiQZKHKL1GhDMEDDjbeqwMHnPBHz1ezYYeHNFrAuxQpVc3NF5Zq
         DOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792176760; x=1792781560;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HLzcyOFA9B8jdMdzXfvMlEdd0KokvuoLnoCqr8l8IU8=;
        b=vbGhNEb04G7/ifdBGE9Lnh/7RhWkIb2jqqVo3j86fwyL+MB/+W3ThfT0RMiF2Ohgz/
         tCr0Z5OV5I4nKH2xCUJqlFCGiPNebo/GJTmkDXlQB/kSbc1e2gGfI47rSMJY4unJqH/g
         1rK6h02D/DlMiYrtuABn6NR28gEfJdo0CLtBhbQ+rl9KpKWa7Nq8pFP3H5ttEKUy1YVQ
         j1pLg3g0r/8FDGfr29SvYKpdOwdjn/8crLqrmYDzkzN5e5BeqaeoOOAYt1reyc8JWNQz
         5VSaoQypLmjZqPuaO+1Nw1Ru6IeF760CzNAmbnb7tEMz2q59kgH5gXQJw6NyxK2xOttc
         zOXA==
X-Forwarded-Encrypted: i=1; AKwUvBxgVF/sAXhVfH61trNgGyE7qrEAI+XufFxdEW1XRwpte2GB3MVR0VYDpywXaoe/jjPVxNMRrgNVXOY9O+E=@vger.kernel.org
X-Gm-Message-State: AFq9FYISzYrGK2hj1eajHWFiNF2/5JHPMcAY2+BkbZdC0Z3cAJ18sbWx
	rzmupzBfCZVVKc+V3P7QuskjHTHqQSaExs1vlz1p+fO+S3LIoS6BMVdOWqsXJBIigWFNUOhSwHz
	L61Pl0Ifl/VFL0ILzFhNvnO8TSfTBb9XEHEyfHVy/KpG+dm+f+8ZpOkV0REOl3Q==
X-Gm-Gg: AYBFou2liKkUcCOMqVwHPD6FjET39zFnDGcpwNs7GtoQFYmlOClHw9sDLlcdJw7vHr5
	c8dvUCed0EVX2U8tw8HkunfNwo1Rz30RWbZj9bigo0hjBL1zelGwV1fTErW4bAQ9PJRiOFGfwWN
	Orhuk9Yvw0EstlZRRx2cmYWjtVB0U4Q8ltUJPrjhb4YhBjdyR6JD1pmDW2RhtmOFrGHZn/+KUCA
	9zgx0c/vt9Lqd8KeAqSOEfpkYbJnLg5rCWGTUdEgqwI6jK7V3aD10aFMX7nEDku4VVcluyOkrPJ
	Drwyg5xLOY4NY8f340WlZH1QWx8es2AefTZ3CgRkMeHTcG78Dy9UcBqkyl82YBZdKmWkUPkMRlC
	1gQq96DxGiYFSMXGCL3qfoEwoFMaeQwPG/WS/UTcoXoKmTL72
X-Received: by 2002:a05:620a:4515:b0:93c:72d2:ccc0 with SMTP id af79cd13be357-93f29ceee70mr133495585a.17.1792176759719;
        Fri, 16 Oct 2026 11:52:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4515:b0:93c:72d2:ccc0 with SMTP id af79cd13be357-93f29ceee70mr133492585a.17.1792176759158;
        Fri, 16 Oct 2026 11:52:39 -0700 (PDT)
Received: from [10.207.9.0] (nat-128-59-178-241.net.columbia.edu. [128.59.178.241])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a198853sm281236285a.28.2026.10.16.11.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 11:52:38 -0700 (PDT)
Message-ID: <9ca9dba7-ca5c-4920-a807-4c60b5f089b4@columbia.edu>
Date: Fri, 16 Oct 2026 14:52:38 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] mtd: block2mtd: convert to folios
To: =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@barelysecure.org>
Cc: Joern Engel <joern@lazybastard.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261014-block2mtd-folio-v1-0-19d24ae676ee@columbia.edu>
 <atEd1rbZ_TCXpqXd@cashel.logfs.org>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <atEd1rbZ_TCXpqXd@cashel.logfs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TMzQ2Fla c=1 sm=1 tr=0 ts=6ad27278 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=4lNGE6/ihKpdiDSMgFMHRw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=usPcmh10W0ubT8QP8_c3:22
 a=1Hu-8JeRPXiKkjeNRBkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA3NSBTYWx0ZWRfX5RgHmuhTg3gK
 Oi66kEHLcYgmcS0cM5BwG2qfwc2bmgIIzFnUy6VUWHxrgnPvyitZKVhjW5lfnTpiibJpMTzv08T
 Dcz/BNllQ4Xsfz4dmFKMb6xKcfulNS4jhjMjW9oKF5yYZ22Ql7nc1enIQtjeF7NDEGmVsypGKet
 kWZIIdZ9IAau+mLu+4VdP3amb5d3+f7oech0pSLguIe1JufWlD96xnVQRHjO4ADmaUnoWFwMEOJ
 TIF+1WYrFllnEjpXenxivdZ09kI4QzgcLZYAt87qbJoJNNDOtdbvJp0lHOfQibyUplTFFDZ3N4x
 CX3QVQy7YwOcoCUscfz8zMpo7cb6qrwTK7dN6ZaW3v5BBpOn6X99dNcCtvhwRsDPeS60A0jDs4p
 tzv85sDqEMMoEHQcozTgY+W1ci9l8D9n5xkFANLo7+3cFMg3jERWgYJHN0VOMKWUL58tNOSifvT
 wGAjzFb1Hmv9anhMuIA==
X-Proofpoint-GUID: Vy_LLjwYDEu7IeUqED8V4wOvGwwNVNYi
X-Proofpoint-ORIG-GUID: Vy_LLjwYDEu7IeUqED8V4wOvGwwNVNYi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA3NSBTYWx0ZWRfX+PXcfThVWF9o
 gBj30KeTj1znOFre9jtYmrxGcOjZR1vnYUPKOvwi1fT2v1oSnvgrvNRlk8GHGzyUK4AD0nrLT43
 RpXUSuClLdcC2YSnyzeQHG8ge2g9bNfE1hjFtGfypOIxECBlYr1q
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11937
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=10
 adultscore=0 lowpriorityscore=10 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160075

On 10/15/26 2:39 PM, Jörn Engel wrote:
> On Wed, Oct 14, 2026 at 11:34:53PM -0400, Tal Zussman wrote:
>> 
>> The numbers below are from mtd_speedtest, in MiB/s, by folio size,
>> except the last row, which is from the MEMERASE ioctl:
>> 
>> +------------------------------+-------+--------+---------+---------+
>> | Test                         | Folio |   Base | Patched |  Change |
>> +------------------------------+-------+--------+---------+---------+
>> | Eraseblock read (128 KiB)    |   4K  |  12545 |   12863 |   +2.5% |
>> |                              |  16K  |  12998 |   17229 |  +32.6% |
>> |                              |  64K  |  13009 |   19135 |  +47.1% |
>> +------------------------------+-------+--------+---------+---------+
> 
> Thank you!  Code size goes down, code seems subjectively easier to read
> and performance goes up.  Good stuff!
> 
> The one pet complaint I have is that benchmarks should measure badness,
> not goodness.  Humans tend to prioritize the big numbers.  If you
> measure the bad thing (time in this case), they focus on the worst areas
> where most time is spent.  If you measure the good thing, they tend to
> improve things that are already too good to worry about even further.
> 
> Maybe you are immune to such psychological effects, but I am not and
> measuring time instead of throughput makes a difference to my mind.
Understandable :) I just used the output of mtd_speedtest, which
doesn't directly report time at the moment, but with some tweaks...
Results are the time in ms that mtd_speedtest takes for one pass over
a 256 MiB device.

+------------------------------+-------+--------+---------+---------+
| Test                         | Folio |   Base | Patched |  Change |
+------------------------------+-------+--------+---------+---------+
| Eraseblock read (128 KiB)    |   4K  |  20.25 |   19.55 |   -3.4% |
|                              |  16K  |  20.19 |   14.55 |  -27.9% |
|                              |  64K  |  20.21 |   13.24 |  -34.5% |
+------------------------------+-------+--------+---------+---------+
| Eraseblock write (128 KiB)   |   4K  |  26.37 |   25.01 |   -5.1% |
|                              |  16K  |  26.10 |   17.62 |  -32.5% |
|                              |  64K  |  25.69 |   15.45 |  -39.8% |
+------------------------------+-------+--------+---------+---------+
| Page read (512 B)            |   4K  |  75.70 |   72.02 |   -4.9% |
|                              |  16K  |  76.50 |   73.00 |   -4.6% |
|                              |  64K  |  76.44 |   72.96 |   -4.5% |
+------------------------------+-------+--------+---------+---------+
| Page write (512 B)           |   4K  | 113.57 |  109.59 |   -3.5% |
|                              |  16K  | 114.42 |  109.73 |   -4.1% |
|                              |  64K  | 114.39 |  109.57 |   -4.2% |
+------------------------------+-------+--------+---------+---------+
| 2-page read (1 KiB)          |   4K  |  48.42 |   46.40 |   -4.2% |
|                              |  16K  |  48.96 |   47.07 |   -3.9% |
|                              |  64K  |  48.59 |   47.07 |   -3.1% |
+------------------------------+-------+--------+---------+---------+
| 2-page write (1 KiB)         |   4K  |  63.61 |   61.28 |   -3.7% |
|                              |  16K  |  63.96 |   61.20 |   -4.3% |
|                              |  64K  |  63.82 |   60.85 |   -4.6% |
+------------------------------+-------+--------+---------+---------+
| Erase, blocks hold data      |   4K  |  15.40 |   14.13 |   -8.3% |
| (mtd_speedtest)              |  16K  |  15.28 |   10.48 |  -31.4% |
|                              |  64K  |  15.22 |   10.13 |  -33.4% |
+------------------------------+-------+--------+---------+---------+
| Erase, already erased        |   4K  |  23.86 |   15.11 |  -36.7% |
| (2x multi-block)             |  16K  |  24.14 |   11.46 |  -52.5% |
|                              |  64K  |  23.63 |   10.53 |  -55.5% |
+------------------------------+-------+--------+---------+---------+

Thanks,
Tal
