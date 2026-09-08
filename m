Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E26D53B5FC
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 12:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788870703; cv=none; b=uXHyyRCQGTKArnLAN/wAyYNqvyySS4x5X+x73YxOaAUfguC//a/gHvi8lkCu+HDHsWeuOJDADGQ/0wTo1Yuu3XHEfJv5KRtvVHF0Ux2BsWL3vFcTtMvg7VLe4aAfHDE1NgkHRlMXRTGLJvnLVW/ZfKRC0CHgrVSmb276IoFgAQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788870703; c=relaxed/simple;
	bh=zml/dB/dBKGLIWCnn63+5Q5zty1XxnbbCX9Of2icmSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n3QRWluOeDHJz4Jy3O3FovGpZQ3ElAVZGG94Fe3JxFn5QYo1J/uTOs/QpgxkzLm66Rk8MJ2eZt6lW3RLl3eoAmY/brOG4mCLWMFvcwDassffryDKR83lN3lK8yrePsPRQFXQusaNCuyISzBn7z82WACdTa4UVvzikWOSsfwbwlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jYsaMia6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VZWPaotw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jYsaMia6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VZWPaotw"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688ADV1R3235960
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 12:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OpDBaVXeCrbOdaIdpQjKqF9RqKIJCNC/+XebxKCkHRc=; b=jYsaMia6Xw4dYoIT
	FWGfQ/rO7f/25GQoxViQFeMZBj5UJ0ziS9iDBlk/Ew/KIF0cKnpIuPeIVdhMs19f
	IoOBr/GgSQkUTqKPUQusq5S5Jyi67BOhcDSq+yBaeBnxF8hoSKR6DkXnLpSEg7t0
	SnIKj7qIFCES5HUUnCw8FyOfRbR68Mj7nz9cv++1BJvg9KQJuz7SHlRqZ5CYlA3i
	xQFybiyWEldb1KgaX3exs62WiV57jUydCnURXm8fTcZL70U2po1jZ5zmfCervfLJ
	5y9zcI1bqnts7nKuqdOfynSjVZidvj+J9WvVItlAWwl1HF3ZinnaLtMyNlmy2nFt
	tO/sNg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjfp48pfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 12:31:40 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97e9cc5ac86so317938241.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 05:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788870700; x=1789475500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OpDBaVXeCrbOdaIdpQjKqF9RqKIJCNC/+XebxKCkHRc=;
        b=VZWPaotw3nDTjoZY89FWX6ou/pcu+n47ef+Mc7FGOxQT2GTaleaSMGHIlTnLHvjglm
         ddw8vaoJsm9gA2D1pkZBsNbouticAzddMwww4TCkYHEH7o24odKBzzI3XmcmMYkDGu3/
         wQCRFpaLea8RJvn5cFShtW0N14pXAJWcCt0tU3AwpW0MkvBArzelR43vsVTJt9D9sSvl
         qZDbok0xL+27Fe1qksPd5pWD9njbXSydEbIgroUEBFEMFGOL+mpAoblN9e3ArHPf3trg
         gdxAEpvwcQ6Z3NXU2peFd5uuqfymJVP5EnPN9WMYZF6r2T5ng3bIUnX7Z/Amf+XXKyg8
         bBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788870700; x=1789475500;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OpDBaVXeCrbOdaIdpQjKqF9RqKIJCNC/+XebxKCkHRc=;
        b=XfuoWqIRe4t/HScYVjQK32Q+IAvaXGCBvos6jL0MEwYxWrZyImhmpPS1HH4q8ytt2X
         B53D6gHpofg2hugf8kYtT7JjL1jA+JLl46TxCjAD2N0ZFaHO6Sop7/uZUlTioOXS6M8+
         OQMOLtQGiE1YNzd+qXjOFG4+/ZQNEND6UStsJndYTCAIfZ9Y31cvucyhIjf/l9R/jdF7
         wYfoBpFfRmgL8K0AXpdlxcf+N6kSXnjM84m5nZFBRGYdquZvU7d+aqf53cgP8qFCwq5V
         w6JvwGXbebOtWsrAF2KtgsLWmbECTeRipssBhWqPPedrO8fnNVGPVnM8miZWTDJ1q2lf
         sYGg==
X-Forwarded-Encrypted: i=1; AKwUvBxht6DF6BHSlJ4XyVLifSslA4kSMNugYdkZznFrxExG+t5vFSy67GsZYUWEgpgh+r65+YbBPHEORBn6LqA=@vger.kernel.org
X-Gm-Message-State: AFuF++nxpKFafuF+xjH6wgpeu6v7LrnI9xrEvNKv4vxj0cPKivnLMdoC
	ewfklhY5q4iw8UjWTGeRyxhHNtEqHcz68MrAYJpNKGE316J4hs0l5xpG8ZE8X68BAYl+2BEDHic
	fuiYpLsrfioCzMbjkJgISuLtNYAZ3QuTE7/uYmheC+CSc/7pOgPt0LciUyHzLIS9hGOU=
X-Gm-Gg: AYBFou3v/PG/WmrCO42P7xuAnKMgr4X3tZeK/FMEjeTWxV6ZUGHT1d+OHUNkhJRN1KM
	sbmcLxE0h4uPkIKBMgBIbIUggyiGv19yhp3KgVdaDKK/BtPmW+TSQHq70n2n1triHjZUOP1z9eX
	dBHkaId6XkVblsrdvJUp5EZIf7SOxI5yr7rsrAQ7StOWYGWXJZQaP9RAjTsV5UQcky1Rwe5NAJh
	Amjd2mEfAmehjL2kNLqljaDOFheLIiL4KHLl/3A/4SDBvp09F7uymz0AyPQqJSe3VzTTjwy4Lbv
	5jooLElGpC18BAmpBryYN/1XGdKiS8gLubiOYRjasZjhvBwMjetrXp0SSqZFez/hnd9CIi3u+qT
	nEurolBTfnn7YG/40KQQnWm3x+Q0=
X-Received: by 2002:a05:6102:5487:b0:77a:2268:9fdb with SMTP id ada2fe7eead31-78a4a995f6cmr9965384137.7.1788870699863;
        Tue, 08 Sep 2026 05:31:39 -0700 (PDT)
X-Received: by 2002:a05:6102:5487:b0:77a:2268:9fdb with SMTP id ada2fe7eead31-78a4a995f6cmr9965342137.7.1788870699196;
        Tue, 08 Sep 2026 05:31:39 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6a88b7c04edsm658720a12.15.2026.09.08.05.31.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 05:31:38 -0700 (PDT)
Message-ID: <af9a7339-1e21-435a-9d58-b29977195520@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 13:31:37 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] ASoC: codecs: add Qualcomm Tambora (WCD9378)
 SDCA codec
To: Richard Fitzgerald <rf@opensource.cirrus.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-12-srinivas.kandagatla@oss.qualcomm.com>
 <525f887e-cb3b-4e74-8b93-30c3baeb8018@linux.dev>
 <7006ad74-334c-41cb-bcc8-9ef5e75dde7e@oss.qualcomm.com>
 <005e3c81-778a-47bc-a8ae-fb5c38ea2e2c@linux.dev>
 <c7fec9d0-b79f-437c-ba8b-37858842c545@oss.qualcomm.com>
 <ap/MFVMHG2Hej8k/@opensource.cirrus.com>
 <a6ae0ad4-6fb4-48f7-9636-7c0e266b6940@oss.qualcomm.com>
 <a6d1f575-2431-4951-ab5b-e5bce5ecc63a@opensource.cirrus.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <a6d1f575-2431-4951-ab5b-e5bce5ecc63a@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Qu9uG1yd c=1 sm=1 tr=0 ts=6aa0002c cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=_JhjDt18UGZXRo98LyAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: YXs5Aya31Niecsgg2gMP2RlhGeK_cPta
X-Proofpoint-GUID: YXs5Aya31Niecsgg2gMP2RlhGeK_cPta
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDEzNCBTYWx0ZWRfXz3V+rCQKStD4
 Ofd4iKK06C/bLL5M4Sgm1GR0oCC84ZF/UYk6fQeEVVvAghySD5OHJ8lXsxl8iXANxraXW7cybw0
 JQ0IBJMx9r9pKj8k8JTovj2aaHm41kanE/qIiNFk/5y0TlZORf7juRe42YC1Vy/3rcHdMqkp0Tl
 9G4BBfWrlrii3noe6a8RUZ8+plKxlEBUM6jKI1HB5uj1Wzv1CwlwC6nFL1ljK5e6nSXP1CO83LE
 fEnzZXIVuIuH7uWmlYtaJF6BL8axasLH7eoK1ZvjQzZB401Do/SH+7RRcmpyQco+C2aZCaB/JQZ
 ISWfrlm8LSDyyag0xHUq/SzeyJwNj0ecumhJIpOHbaXLd8Buvlw1ZVyzDpKOVSo68D64RFwhLbj
 ap5yOphic9toE7THEjkfOEWUULCqjGllCrz3sx4fRsH1WRu4pU/RxQbwpDcMkqGkIKfBFWghVCP
 jEZ+b6Ko5o0YA1/6G6w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDEzNCBTYWx0ZWRfX2Pr6T1plWcD1
 5il08xb0gcpUU+rSXQn4iHQF8Ielzy9Y09NdrFrnAOm6Bd974jjRvIKAdXLzIwLOR7OyZXo5Vtr
 sPE4CHFU0DH4a5tirQARhn5LREqctlE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080134

On 9/8/26 11:37 AM, Richard Fitzgerald wrote:
> On 08/09/2026 10:09 am, Srinivas Kandagatla wrote:
>> On 9/8/26 9:49 AM, Charles Keepax wrote:
>>> On Mon, Sep 07, 2026 at 11:37:49PM +0100, Srinivas Kandagatla wrote:
>>>> On 9/7/26 8:47 PM, Pierre-Louis Bossart wrote:
>>>>> My take is that rather than encode all properties in C, it's probably
>>>>> worth exploring a DT representation of the concepts that *can* be used
>>>>> fairly easily and make the life of codec vendors easier - not as a>
>>>>> literal translation of ACPI.
>>>>
>>>> I agree a DT expression of the *concepts*  not a literal DisCo
>>>> mirror would be a better A.  I want to bring that back to LPC 2026
>>>> DT MC as a concrete proposal grounded in the earlier DT-maintainer
>>>> feedback rather than re-litigating it inline on this series.  Because
>>>> B stays put, switching A later is a change inside populate_function,
>>>> not an ABI break. so landing this series does not close the door on
>>>> the representation you're asking for.
>>>
>>> I am still not sure I really see what the value is in a
>>> completely different DT representation of the DisCo information,
>>> all it does is give us potential issues with future spec versions
>>> and create a whole bunch of new code than needs maintained. The
>>> ACPI representation translates perfectly well to DT, should work
>>> perfectly fine using the existing code.
>>
>> I totally agree with both of your comments, there is no way we can
>> replicate MiPi spec into an different DT representation, this brings
>> both maintenance overhead and is fragile. This a very big effort.
> 
> But in your previous message in this thread you said the opposite:
> 

Yes I did say that, and I still think an intermediate DT
representation would be a better A in principle.  What I'm
highlighting is the cost side, any intermediate representation, by
definition, deviates from the original MIPI representation.  That
deviation has to be kept in sync with the SDCA spec, tracked across
spec revisions, and translated back to struct sdca_function_data at
runtime.  It's a real overhead, not a blocker, just something to
weigh against the "concepts read cleaner in DT" benefit.

That's why the current series takes the lower-overhead path
(mechanical transcription in C) rather than proposing an intermediate
DT format as part of this submission.  If the concept-DT direction
gets traction at LPC 2026 DT MC, we can revisit.

> "I agree a DT expression of the *concepts*  not a literal DisCo
> mirror would be a better A."
--srini
