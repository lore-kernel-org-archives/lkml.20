Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5491E29D27D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788881713; cv=none; b=tRTBRPBZWQh4YcR0Ly2FpcaMjXuRk4fZHK/5exFeJFuk2/ou3DTZJuDtLO3cpRPaqBvPvjo9f/OavXFRDHZ1ted1krBPNAQD9WsnjZtcmmdQrFe4M+oMoEwwGsA1VV79B+OQCtxHRGTziSXxLG+bmlp9eZE0IWtNHLpO9Oje/3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788881713; c=relaxed/simple;
	bh=ztsuEXkA78vbJ/cDjG4h6EM6vidYirOFvoPafcKsGyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hQJOvaBVpWpO4Ld+tUQpkd+2TinXv0Wcd4sLWVD5BVMxQ0xcb6g92Y0zMu2u0GIZ20GW2z9/aQk3iEhgb/vp4YTjN7MNFv1TOYlr6qrFIsdm3s9BREFcVaehTHdNoozY9N6gHqhm4/nCWjL7u6+0IsCkpm1lLD2Y2HozX3J7Zsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ku7Qaw9/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=itf0JZSV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ku7Qaw9/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="itf0JZSV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FVMTj3595740
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 15:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jWU/mIfZINgM9vt3ezwIs0OzEJYoe7zBqZ/JKgNh3Co=; b=Ku7Qaw9/RpU9AT7S
	ldYZpRx+ImifiHDmNWZXMsjUjGqnPZB6gQE+dD/3Es5Rkl18unPftyebqqsJs0Ao
	B8y/SbkCz38nATer3K6reBbgwlPZXpXUZFStSyQKqloCRaem2zMMZ3JBINWZ3UrF
	eQXP6I/1b37caaDoXSbScuejX0oYQTqGacX3CB5Cn/BR2CIBCmaW6CXChn1bpgip
	3KPQbs+zGAG7TwVvVOKuop9euNCGi0RCgwBQfZQbikH/uYNB0G+tKUfs9yMFX0aM
	dgxyHRxSZAvpRTncJf31XBtyhOmcUPwcWvPQLFT9F1+AjcqvQDrh9Vp1W49YnlM0
	vP02Rw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjagujvjs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 15:35:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93918756165so799558185a.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788881699; x=1789486499; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jWU/mIfZINgM9vt3ezwIs0OzEJYoe7zBqZ/JKgNh3Co=;
        b=itf0JZSVGvS6NDIH939VH56tlTSzfqlxgI2hWYJBFpC9uC+KInqZ0MlWZj2Gksof/o
         i9InprtXIyPOZEqMJYhHB3OWQeYfi8UeKmladJfA0q9AhyhN9y+c674UUr+GcPiTfDC4
         AOlaWcLhNnEbCq69BbucZHzrlC9imBKx7teVudLinUJXY8wLXzBTOAMgJrUzXVXxJG4L
         586i0RngwyB1zdoNkLVlG1Yz4P2+ZLp6v1FkGmYkFkFzIbDFR4GD3ay+6Sl9vkhh7GQT
         mQD/3I1XvpNt9H+FhrRB0tcRaU6AUhEaaTNTjEeN5QcAQhlTBjCWv9+Ytsa5XZ4ByhIk
         MsoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788881699; x=1789486499;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jWU/mIfZINgM9vt3ezwIs0OzEJYoe7zBqZ/JKgNh3Co=;
        b=jl1xgF2YDWxrZt78KsffuTV+N3JmVSfj3EGyZUnFkUm67JrxU5lwrnzU2S41pYw03Q
         ciVd8lyl5JW62I05scQ0usylwYXvJpPhz87kRZJpRFi3QiTDJv5SD4noZRGzpnUagtAP
         vbtl/aLilxJeDJCJbDgOtd6oI11I3Mueonhw/rvFKL0WNyKcu42OMogv7wv4I2dkHOp4
         bQFGnqTVE+YkTWeRBLn9UDTCA7zggeo93lbHtWUgvo+IQ4wZBa76zJT5Cc1g5wc3SVdk
         9fnKMXxCony8drp+ulR8LStl7hBPXueGPeJtg8XXF/oL7B2Rg5PIKHfqYrLrSj3s80d6
         Diqw==
X-Forwarded-Encrypted: i=1; AKwUvBynYpTQaA4RnFjaCslzikZT2OTsAHz94+fQiAg59TZgsCajp8AQx4s8gtdM4UVzjzuBeLsK86Yn7kyy72U=@vger.kernel.org
X-Gm-Message-State: AFuF++lY6JBS5Np0gX+oByWtnWpHTaHPrMG7/bKRTiusRy21eT92DPq6
	MDWqu0IuGX1VLc4nKYx+eQO0pgUriRU3kna29sep94Ms57+tPqXeSCwQxqJ1hL6BqGtht9usz9d
	coUdbM6kfy390tWJ3UtmpRAk9oi5DVgTv8kGv+7/FLrCyHgJUzUJk7lmRdtzPA34cyqM=
X-Gm-Gg: AYBFou2v7lIxIIUoS5yM4RypInOja0Yc66BAFVLOHVU+AqtHbeAakTj4MV1/OZrVFeP
	vu2fgGm2cV3h7kB9oPPLIZNnIohpr70qu3s23t5Ux9LED6NeLpkwAvMki8oZf2QcZcBM3D0mu95
	ewpKjA4GDKCYdZitWL0GCjJ4EkyGx/k9T/DeZiS62NYM4PB58vuk/h57oA7t1HTNDqeyRzL7EH9
	7WPEYMgncupGtmr0CMJJO+epziKSW3Y0RQVqLdVN/25PFAAbvPdN8/NCwUAg9M6RWTQSZ1+hX2T
	YayIilCtZ/Sw/soAu/bS1IRcFmyYPq+p9ITpGihj1lm5Q9TlOKuK04ODl0W5O5DtVam7sfdgX2d
	LPQQYaux3MHN4zXNW+tPoAcdVRz4=
X-Received: by 2002:a05:620a:6089:b0:938:d7e4:7fe with SMTP id af79cd13be357-939804536d0mr3563035785a.37.1788881699551;
        Tue, 08 Sep 2026 08:34:59 -0700 (PDT)
X-Received: by 2002:a05:620a:6089:b0:938:d7e4:7fe with SMTP id af79cd13be357-939804536d0mr3563025985a.37.1788881698939;
        Tue, 08 Sep 2026 08:34:58 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm35628669f8f.16.2026.09.08.08.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 08:34:58 -0700 (PDT)
Message-ID: <9c0adaab-b725-4ce6-86cc-e57dc33bfa9d@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 16:34:57 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] ASoC: codecs: add Qualcomm Tambora (WCD9378)
 SDCA codec
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
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
References: <7006ad74-334c-41cb-bcc8-9ef5e75dde7e@oss.qualcomm.com>
 <005e3c81-778a-47bc-a8ae-fb5c38ea2e2c@linux.dev>
 <c7fec9d0-b79f-437c-ba8b-37858842c545@oss.qualcomm.com>
 <ap/MFVMHG2Hej8k/@opensource.cirrus.com>
 <a6ae0ad4-6fb4-48f7-9636-7c0e266b6940@oss.qualcomm.com>
 <a6d1f575-2431-4951-ab5b-e5bce5ecc63a@opensource.cirrus.com>
 <af9a7339-1e21-435a-9d58-b29977195520@oss.qualcomm.com>
 <aqALjdlyZfUb5fDu@opensource.cirrus.com>
 <9ed5d56c-9231-407c-ae7b-9c608c603254@oss.qualcomm.com>
 <4d6ed30b-65df-4f29-b0c2-245e854021df@linux.dev>
 <aqAq0TPQ8euPoXXj@opensource.cirrus.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <aqAq0TPQ8euPoXXj@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TqLWQjXh c=1 sm=1 tr=0 ts=6aa02b29 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=UsgDQBPQtW9oUzukNeMA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 8uoKaqaoYpjNr5_gL6Dl0YYGTxVqwSpG
X-Proofpoint-ORIG-GUID: 8uoKaqaoYpjNr5_gL6Dl0YYGTxVqwSpG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2NyBTYWx0ZWRfX+wIBlXyatS7X
 gAI1rc5FdEhvEcVulta0s40ceUE9wU2DWKqc4+DAv4CAFtqotp2M8prknoffZg7+S5+U780+5Ut
 EuZrNnUyJKQqXdYeruGXVEM8vXkYXAk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2NyBTYWx0ZWRfX7M7s54RBNXGF
 xjgsLCINUBb86GgfLJPWHms6/2WZKpxxQxAsRXq11+qUY1rqdmpQgy6Do/+aUIM03go7cDPSyig
 coAxsLijEiEkzXDPfeghlWe/GHtK+HrbcjhZuCPALCLjC6aBd0PgfPsvt+MSlXMn9JhvgJWv/ug
 HTuEFBy/ddNdftRKfTV6nKIUVvYWpwWrxT5m49pHxH83Qx7X0QcZte4PTNeO5OsFIwzcn5hthbA
 aSaosreSvJ18GOOhZ8W836HK7fdBKKmCuufuhka4OuZhJ7taIXjnWcjTerzlzOSZIorfr6SH0Vq
 WVecteURJKV+6KlHyLtn/uLBd7boFWNHVCPHgpzyNjCvAsZANEDYNl9ddsttexUeoeYpaF2ATBs
 TP6rvx0AbeiY/ELsZcc4Ky9H0+v0168ZlPQJZJip+rsODxeUKeuCfsKt7054ZtZ/60CTS6is21f
 hqirpIF00OkDtVIvmPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080167

On 9/8/26 4:33 PM, Charles Keepax wrote:
> On Tue, Sep 08, 2026 at 04:22:53PM +0200, Pierre-Louis Bossart wrote:
>>>>> That's why the current series takes the lower-overhead path
>>>>> (mechanical transcription in C) rather than proposing an intermediate
>>>>> DT format as part of this submission.  If the concept-DT direction
>>>>> gets traction at LPC 2026 DT MC, we can revisit.
>>>>
>>>> This part I follow slightly better, I would be happy to proceed,
>>>> pending reviews with the current approach, although if Pierre
>>>> is or not probably remains to be seen.
>>>
>>> @Pierre
>>> Please let us know if you are okay with this approach of C structures.
>> Now that I have more context, I don't have any objections with Srini's
>> proposal. It'd a good step forward to use common class drivers across
>> multiple vendors, we'll probably find a couple of bugs or harden the
>> SDCA core and that'd be good progress for everyone developing or
>> depending on the ASoC/SoundWire/SDCA frameworks.
>>
>> If this means that in an intermediate step C tables are used, that's
>> fine with me. In the long run, things might change with additional
>> options such as:
>> a) ACPI support on all platforms
>> b) DT hybrid mode to reuse ACPI/DSDT tables
>> c) DT native representation of properties.
>> We can review the preferred direction when the platform firmware
>> plumbing improves.
>>
>> I believe the point about binary/opaque data was noted by Srini, it can
>> be handled in multiple ways and there's no reason to block.
>>
>> Best to start small at the SDCA level with incremental changes later on
>> how to fetch DisCo information from platform firmware - that wouldn't
>> change the system behavior, only optimize by making the translation from
>> DSDT to C tables un-necessary.
> 
> Super, thanks Pierre. I will start working through a more
> detailed review of the series.

Thanks Charles and Pierre for reviewing this series.

--srini
> 
> Thanks,
> Charles

