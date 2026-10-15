Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA0352758B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070728; cv=none; b=U29Bur6lOG2f4xH+XmRbAdeKQFGkOllnT9NQFH4bsSFQ+YGQoc9pjmyCL40XaLVqhIN95yFRU2EonCjHtYK64fkugV5d3IkWCKp2vj9evQXyb6XhCAnUf4onUd1pCf1xiprrI0pu8WjBzGi3LQ2+u92VEFqJnwQRQSg5FqOe4mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070728; c=relaxed/simple;
	bh=OKl8FxF8IEbfAFyPdAhMBb2ftzDCnYFKMb5F9NMa5dw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FnpVvok+Z23xUW+FeMSpj0mrI/4L/C+ESLoeUggaQ3+TxTLsACR3oxjYRngg0+7+AG8tYGz5KbdEnYGlBVmsZNbHdvJjEi09qo4sSu5qbuPzLgPyNN/pzWMEm7f6oJx4ol2gkKAtAu9eZCSp9uuQbQ2ldWv0HnKh/iOAjiR4vSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ddDE0uF9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LbK9FDGe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ddDE0uF9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LbK9FDGe"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jfsH1955776
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:25:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gCJfok3rHI2nfv7ozMgYv1Bh87GJoQXCUXkmVH8cksM=; b=ddDE0uF9JmMiZi89
	0pSWhIStLk91p2Oa3mAq/K1DHJ/UGyhTK7OBu9A1DP5NMKgCP1x+0lmeuCgCm2Bu
	Hsp6velGQMQyWu00dsapalMCS0WjjRbF8S2f5a2Scz2e1i/k1pTD5vQmEHhdzAc4
	WVdM0z0TYH09b3weQM+SRt7JJh2Ad1VaxmNtzQnRGkjN/gZv5x9ZLYPJQDy04Nt6
	RupmY9mF3nzlHgRIy0X9bnYJ4P0KH3AAMW+bSDEvcE9kwcR9ircbLGBCyCZ70Ff6
	f+uUBrmaeMyxIuWe+yLHg4gZltdylfDn3As63uqQgvGlgAubXYV5h0e1mQG6eP7e
	J8SkgQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakdeu3ev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:25:25 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c29a61f144so668575137.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792070725; x=1792675525; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gCJfok3rHI2nfv7ozMgYv1Bh87GJoQXCUXkmVH8cksM=;
        b=LbK9FDGeeul3ZXiFJAkavP8OF2Qi8QtX4pI6552Yf3nYGpUXCo9iRTEX7/jYQdsMte
         7LkZqExCS+PfhL4zSwaE/ryRkwTkdvXwNDGAR+TKIikJ+7zBqbFKviPySIrN0eaHfhAa
         42XAfDl7NK6VaTeXiFQKcd+/WbInSJkEyvcqc+RfBPTms7JuZ8c5aI0EHn/+dM6nERsD
         iE5G2FsLU5p9wxXM7M4VlqGsgKEXmvFGIJ6kvWZLgjMy5eOJRCBySpIC3x7HvHupWB1g
         Lurq65BMHtm4rHIiR4fG5snehKFR0Qxwrnfj5gCjoaP0I8pWuU8s1xeN0k1YfJNoG29i
         xOLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792070725; x=1792675525;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gCJfok3rHI2nfv7ozMgYv1Bh87GJoQXCUXkmVH8cksM=;
        b=fFmWh1qMycWqyr+6BDukdtXPlkh7d6FPp2AUxBlRAZi8B2fDmcsxz28a4ghd8UskU+
         Rsz5TZIxhSmG1CwUag2HGssdxpeqKJ0Sj1yk1wRd4mai2p2mg/Rxw7ZfVSkOA0jL8cSG
         0NH0Qs505LtQ3CVrd3l2li7+0T0UGpEfNigriC1VFDg9D+EEaL8KcNjKP4tR23Pgioff
         KqnGn6EZBgOP0HbcJAzRyBRCqN75sw+GEJU38xG0wB76PPheH2KsUGfdUjyLB+4vbsYD
         CZFpamX8mScbfdkWbkm57zmKhmTWnglM7psTYhZh8nNlOvJN0TDhvlQntj6yjUarJwEs
         QEgg==
X-Forwarded-Encrypted: i=1; AKwUvBwRsm4J2JZdg7JO+soNQEWGO5xX3CEj0neCszTomvQ0GRszXRjt43enGsuuP3jT+kwimT6D2wBKmIKMq5g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAQE06vdW76TWEt+5yDTL64t7wgP+KiKJHBrivnChST2EQoC7V
	/QZCxMRcLTZl9XM9MC1pPnta16kJeK5xJ05kTkqDVVxM4N7xqHNYkFSbj5jdgNd6pGmGRvczW0y
	nR1tN0TvpFpHNZ3XKKbngtiIHpoGOIeSzPlTusG6Jk2Hmw7YRL1PjBmpXncIHBJH6YQ4=
X-Gm-Gg: AYBFou32cL7jo4cauNNxmocI3/WzSAgN9pgR7UZeAvrLa/KblGaUXQFLUfzyvyPr6S2
	T8Fc39UBAqVjtTiEdW3BdGc4/CDPOnAOiuDcVaAXc22foiPwRDEA1gV98haPH2cErqL6HySAhAv
	P3b3x6vix2Z5Xtuw92x0gGRss/wFJcKfIJZ+HrSFQQjFMECEJV6MA5Zvx35trYqHNS2VTjvNTAj
	NXbDyVvnzWeGtsBix2JHPzUW1jGT+03wOkTjsyzGAJ1k1nmKUJQV0Lq3BTLm4yz36yfTmJxJfme
	u3uF+lXSz/zv6qtFbBtL/Cx7CbDOugohItA6IRJUu6R/jWdzgHSuXZEYZ5wztECXfeA6xsBjn7y
	jg3U7aoTNjEag52Cs8sx5ONGTA0eVzw==
X-Received: by 2002:a05:6102:41ac:b0:7cc:1045:610 with SMTP id ada2fe7eead31-7cc10451036mr217344137.27.1792070724731;
        Thu, 15 Oct 2026 06:25:24 -0700 (PDT)
X-Received: by 2002:a05:6102:41ac:b0:7cc:1045:610 with SMTP id ada2fe7eead31-7cc10451036mr217320137.27.1792070724111;
        Thu, 15 Oct 2026 06:25:24 -0700 (PDT)
Received: from [192.168.0.31] ([212.5.153.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd66ab3dsm65873415e9.2.2026.10.15.06.25.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 06:25:23 -0700 (PDT)
Message-ID: <f44df63d-155e-41ad-8652-36d770efcdb6@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:25:21 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] soc: qcom: qpace: Add Qualcomm Page Compression
 Engine driver
To: Krzysztof Kozlowski <krzk@kernel.org>, senozhatsky@chromium.org
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        minchan@kernel.org, axboe@kernel.dk, rostedt@goodmis.org,
        mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, djakov@kernel.org
References: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
 <20260930145215.3380977-3-georgi.djakov@oss.qualcomm.com>
 <20261001-hopping-belligerent-spider-876e7b@quoll>
Content-Language: en-US
From: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
In-Reply-To: <20261001-hopping-belligerent-spider-876e7b@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OdENnRTY c=1 sm=1 tr=0 ts=6ad0d445 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=douLNevBrtimd63D7eljNA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=vTTj8iH6AlmXu0jsvGYA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: ayNARQzxGLzmbFD05mkbLT1gqFJZfd7T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MyBTYWx0ZWRfX8tJsnskkssFu
 CH4ljpU2wJmH/kBMQlzd6rwGpIcckLzrq6l4eQULfenxWdm8dT/yVOBsgRIVA1KQ8Ya7Wl0NHDQ
 r/dO/qoM02WstLzNkHGxjR0DPr3zJyUz5EDGgIC68feoaFJ8fstKC7xpEilE6tUKGMC2IFOB+3s
 BEK9qXP0gUpv3rcUOwwDHx46gPDFX9G75dobWrHetaRMKnMBOZlQvDe3r4dHGlqY1OwZnOHJMYl
 4JIKgswTcohtbNjk2o7ohQ75ndSOAEFfnI95h1R2RKMp/8HujzzaHQUu2yWz2fUvZ3YMGqVuoTW
 g3BBzYkLobk0YmtY7LmIS2JbG5+PmLvewIaW1NKmNQEgGb/H/f9aQxn0K1Qvf+IEjicQAtI4k5q
 AIKFsrs3g7u3J6SmCQL4rZqqorXPtLvs9rWuoNp4IsyRlzUMUwr+OSkd73gtoosqdjfkBdbq8ot
 oKk0ut4kQpDG7f26rkg==
X-Proofpoint-GUID: ayNARQzxGLzmbFD05mkbLT1gqFJZfd7T
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MyBTYWx0ZWRfX3xbsYrF0sfpj
 tlt0mKZIbbOOUom15Hz0ghWViQAGngNkZqB8l/yyxhKwyu8rJpDS83LwRzfCuSsxqXS4r4PxlUO
 p4slAna5Jezy8Id0MN3jGDYNecgmYWc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150053

On 10/1/2026 11:50 AM, Krzysztof Kozlowski wrote:
> On Wed, Sep 30, 2026 at 07:52:11AM -0700, Georgi Djakov wrote:
>> Add a platform driver for the Qualcomm Page Compression Engine (QPaCE), a
>> hardware block that accelerates compression and decompression of memory
>> pages.
>>
>> Provide the urgent command path for synchronous single-page compression and
>> decompression. This exposes the low-latency operations needed by
>> compressed-memory users such as zram, especially for page decompression on
>> the read path.
>>
>> Signed-off-by: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
>> ---
>>  drivers/soc/qcom/Kconfig          |  14 +
>>  drivers/soc/qcom/Makefile         |   1 +
>>  drivers/soc/qcom/qpace.c          | 764 ++++++++++++++++++++++++++++++
>>  drivers/soc/qcom/qpace_internal.h |  84 ++++
>>  include/linux/soc/qcom/qpace.h    | 154 ++++++
>>  5 files changed, 1017 insertions(+)
>>  create mode 100644 drivers/soc/qcom/qpace.c
>>  create mode 100644 drivers/soc/qcom/qpace_internal.h
>>  create mode 100644 include/linux/soc/qcom/qpace.h
>>
>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>> index 535c8619197b..6bcb86dcd726 100644
>> --- a/drivers/soc/qcom/Kconfig
> 
> Sorry, but no. Soc is not a dumping ground. This has clear function of
> compression offload, so it should have some dedicated maintainers like
> other offload engines.

Thanks Krzysztof, and thanks Sergey for the input on the zram side. Before
I respin, let me elaborate on a possible structure, so we can choose the
direction we want to go.

The QPaCE driver splits into one engine and (up to) two consumers, following
the IAA/idxd driver model split where the engine exports an in-kernel API and
the crypto side is a separate, thin layer:

Engine: drivers/soc/qcom/qpace.c + include/linux/soc/qcom/qpace.h - decompress
primitives. It stays under soc/qcom, interacts with LLCC slices etc.

zram: drivers/block/zram/backend_qpace.c - A zcomp backend calling the
engine's in-kernel API directly. The zram intentionally does not use the
crypto API today (917a59e81c34).

zswap (?): drivers/crypto/qcom/qpace_crypto.c - Registers qpace-lz4 as a
crypto acomp algorithm for crypto consumers (zswap maybe?). It will share
the engine's primitives, so this would be a thin wrapper.

If zram switches to the acomp API in the future, zram can use QPaCE through
the acomp algorithm and backend_qpace.c simply goes away - so this will be
compatible with that direction without depending on it.

Krzysztof, does engine-in-soc/qcom + the crypto acomp address your concern?
Or would you still prefer the engine live somewhere other than soc/qcom?
An alternative would be to put it in drivers/crypto/qcom/ as a crypto
driver - register with acomp, but there will be no user, and zram would
still use the exported in-kernel API.

Sergey, is a native backend_qpace.c the right thing for zram now, with
acomp left as the future path rather than something I add to zram core
today?

Thanks,
Georgi
