Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292717;
	b=AgGVs9pREGFYqNcqjejnMuK9m+/eTmxLOoEgOor99aC/1Nl9VkTvHcyyZiaXTdjdOxV3
	 S/Cse9sGCY7Fug7fQo07RThEuocxnVfFXpDrVUaOm5gyRlvbVBkmciVXiYx/PYmXLJ21z
	 TvlxWfrKoSDZswVye/LePQSS2zKcC/OsQOcTNqKYHAqJarGji2gvDSrJXon1LU5O5hWpp
	 TyIEb2aOimXnkIjlH5VlN44j/cLeKOCRul5Q+OH5JxW7s16rhVxDmjRASO4zSyFU5B0Zf
	 3V5EpdC3JrtF3yPxPHjjGkeEOGXqVdg+21Uh9aiq862mZ97iZ04czn/Hhi2ThRq4Uag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292717;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NGNco0OHUqDONf+FWw3Lj2FmESbwxLF4Nd7bMEWkk1k=;
	b=1sqOMY9qsH8fY4vAcgoYmHjijDoXqC1iQl+hSeFsZ81HvaCiQ8gV4SgOw+v44Z6Xd5AK
	 RyGgZGFDPfFo9PepjSoANe5cUi8yEcFtRow1yYMsPLxzrg29zANUUSh9hWNqaE4vmOAZl
	 n7vNC9yqXcEmIitMLBM9slWKdPBLHWIhJu+oqrX0mUAOXaT+Ak7wxnbAwnyPcOyKL/lHx
	 0Vfe0ELDKbPD8xc01ulfMtQoGFdASa0YEKlpExJaXy5fIHScLXdy0YdCQTp9xtPJ7qI+I
	 DyDb6JFyQTZDat+/k8oIgxhMTzxtPI8ymJ3oh97sBiF/OXuhItUgGVaaIy0nKzbmEyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PwpPArxh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="W5QAz/oK";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937FF606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:38:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 937FF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PwpPArxh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W5QAz/oK
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4AZaW2920169
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:38:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NGNco0OHUqDONf+FWw3Lj2FmESbwxLF4Nd7bMEWkk1k=; b=PwpPArxhS0AqtHRs
	J1qFuiqTyWom642rbBgdiYAy5XDRGXL7aaJRC0CGkDixs/jb/07yTnhN3Pte1gcX
	NCDMDS3hfAqiNN5gzJt+VgyhiPQV0DP8YjFQ7vGwzJ6eydbiQy6QjL0lESTYhxp+
	E8rCJ6eR/+TEvZEDcjuoj92pa8jNToiULCFsPNMF9GIkRpFfmJ4i5XxsVqIZ7AQC
	UKN8SjaQ+4+TFHSQtq6Mpf6roBARVDClZ5vwcwGfalUMeWkxxaMgsJfdZxwoB67l
	E2hy3juy3iz/+H8aLqNpsqlNHl/RYVQJlyDuitbyFGdKGe3L9vIma9ITSI4UCMBl
	ANEYSQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg249n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:38:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f26dd2165so388217185a.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 22:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794292715; x=1794897515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NGNco0OHUqDONf+FWw3Lj2FmESbwxLF4Nd7bMEWkk1k=;
        b=W5QAz/oKzxuUjMb+x07rsIMWxu6TyYrLO/GKiTe58rxPHmKj0io0nmBKggb0N5WsjR
         GdIJqZgH70E2WuBsbh2/i0hngVlzgAUShTsFT6ENHdDfPSlLFT3Hldq0U2xa3Zska1Vd
         aJVKw275xP8/j4thA6a0OssHI1+j4jwWv1OyOAoUFvqUcJlOE14oGen0PKjdMkqvFDG3
         r9aOc+vbBh8uyCk44EKyEqsS/2jsg+i/36R0aRU036Ls0vpjLdhbkfPHtrQB/dhpvW5F
         LgYJfhyW1kG0hkMRZNsHShPlkm3Hexcp9M68DmcNGGKmYPti78ClqAXPg8TuynVrb0/u
         VHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292715; x=1794897515;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NGNco0OHUqDONf+FWw3Lj2FmESbwxLF4Nd7bMEWkk1k=;
        b=d3o4WIxVUvnucXbhSM4QbRNHLPrs2uHhgxgszYJ+CJOyNKAhbO12OCAcn4788ozeke
         fWU5ZndoJYW4ONTXGFemKJMT666b3EYm8RpkVo7hfNLDgxy8I5UaLgHH9V4F1HLu1gyi
         R+sZ+HnhSQvAGfD433HnN1BKnYIJMW1jwDwXe6FhuO+XKCpvhdz1avFOuJpGA/lalg88
         S/at2OtNPxGSq8ar6hST0TG+CuhakQFJtaEDiymyo4scdAAHeGvncNy7VzOgFUyMi2cu
         EwRLE+oxx8RnFkZAPYe6WF2egfuiF8S7SkZwitB6lQieT9XOVwyalCGVEWuC3jHpsl0r
         K4TQ==
X-Forwarded-Encrypted: i=1; AL+hErFCkln6GZrQ51jHy54W6YydzZugLvES5jqshJojcETU0mlLmG4RCMjMPviZxnx3EKeMoS+9rnvrNanFTXo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HRXn/bijZWBPMzyGuSRht6JAEPmGp3qE88t7gQL9uN0a2qWcj
	wtrNzpqlhIJ0jojN+Qvo+BB54ggh19MxMLzMyawe8Y6zlou9rbhP7oh2cBIgLktsgkYysOHvRKc
	PQAp1lJ39ZoLfIx7RzLIbw0PxtpMzgBXHfkuG43uzDyfx5EUmV3ybhwUYxEvJLcUKTN8=
X-Gm-Gg: AYBFou309RWy60XN6MDQaK0pOIIKAITHSeAKzgg9vdqjZOuhZgK8pO6O57nTyhJTapi
	etHZbVgfo4LEstHZh+sMNwLlOnDyeyveZgYitn8NqvrmoQyg4Y+OJEeRvdo7Mwgl1AWJt4p7eoq
	Hf6LT6XeGznH7Cq6LUXQIyKiW+GMXFi50zWwMqoj6NYKrFag74ZvWDoMLMJ7w3+874IKG7arI9u
	tCQJ3hQfYcE6qBDo6QBvZhZXJ3X0Uzh5rI5QkPh8ZRhIP8EFPgMyNcZIrxXFBJR4/r7HdvDiGxH
	6Y7xap9qpbre3+x1vvhJZ0TAL2rqi0/ce0+861hOuikWuxlaZldycx/L0lsjEkO6yXndGLRwXEl
	K2CWyODS2Cm6zVoalIuOGbBJ3WvsV+pY/2t5OK/We4wnb2WRcrj+izBZSN1GcOC6ADsdPgGwhLN
	ulnUXUpB4Vmtxp
X-Received: by 2002:a05:620a:44c9:b0:93f:35a7:cd4 with SMTP id af79cd13be357-9479f3c7b8emr281225385a.67.1794292714753;
        Mon, 09 Nov 2026 22:38:34 -0800 (PST)
X-Received: by 2002:a05:620a:44c9:b0:93f:35a7:cd4 with SMTP id af79cd13be357-9479f3c7b8emr281223185a.67.1794292714280;
        Mon, 09 Nov 2026 22:38:34 -0800 (PST)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02345d22sm48886375e9.1.2026.11.09.22.38.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 22:38:33 -0800 (PST)
Message-ID: <1f09c9ee-393b-4660-945d-8176f823b8f1@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 08:38:31 +0200
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
Subject: Re: [PATCH v3 08/11] media: qcom: camss: Switch on frame_sync_en
 logic for csid-gen3.
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
 <20261107-v4l2-frame-sync-v3-8-e5bf7073a35d@kernel.org>
 <CAFEp6-0t_r7yH3hGRFH6amgfNUK7sTMe68HXQ2WEuUffHMQF2A@mail.gmail.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <CAFEp6-0t_r7yH3hGRFH6amgfNUK7sTMe68HXQ2WEuUffHMQF2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX5kLbPJzs6Nn7
 j9l5+KOuW4+0AnKEUd9hyKKue/P5nqcIUodzK5k4+zaRjj4UfLhr/lSxpr2EELmntzsn5U8EdLZ
 00MqepU2vzWy61ZhfJFXDh3dp+oTN1F08VaFXJvg+0YOzSihf2U+G3nk0PYWhaNZJen7wt+ZXPC
 fRHZ5Pr7Y6ImDbMBu96m3idfxgs4E4teiUCP/IUQsMHXshb6QfqFWM31YQOQ+wymEpIjy+/uOsl
 EaoMUBw+/5TMdPRLTW19qRZSiR/Q21S6nAgW6go8y87zsqD9uRzr1IyVkl41IxaCV2RXr88+0e/
 G7IHRGfwl1obqWxB4qJrzeRaF8lSdwRuVwZxL1wtgPmRgOKkxkOzxS4y+c1nFi9nvgie03BFEak
 0wtu943ylEPaDzIxHlkfZ5qzlEPS0oqXb60u+oCXajSozXnG+znoW8LWchpbnc1Wizp++TeVcR5
 a7xcMBBN9itsHRTfG0w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX8BBjSZwjTEfb
 nBxBf0oa8bpDFYRD2C3myTPExcaMNMDkczxI6qnkYb6OQ0sGtVeFuap4QVZ3NOOV4H1CZ43WlMa
 pPPGXAgJ86JPOzLOvc9mFT4cqABA6iE=
X-Proofpoint-GUID: 0yzv3bx65EUjpaYIUFW6BqtklLgrKjjh
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af2bbeb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CtbmM4eJ-fP_3bz2-A8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 0yzv3bx65EUjpaYIUFW6BqtklLgrKjjh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100026

Hi Loic, Bryan,

On 11/9/2026 11:56 AM, Loic Poulain wrote:
> On Sat, Nov 7, 2026 at 2:02 AM <bryan.odonoghue@linaro.org> wrote:
>>
>> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>
>> Switch frame_sync_en to true to track and consume SOF/EOF data.
>>
>> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # sm8650-hdk
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> 
> I would have preferred this to be defined directly in the
> corresponding CSID implementations rather than in the resource
> descriptors, so that the component implementing frame synchronization
> is also the one advertising support for it. In other words, something
> along the lines of a csid_hw_ops.features flag or a dedicated
> csid_hw_ops.has_frame_sync callback/field. That said, this is more of
> a design preference than a blocking concern for me, so:

I double that. It make more sense to introduce capability field, only drawback is
that as of today once the feature is validated for the SoC (which may contain
same csid or vfe version) is marked as supported which may not be the case
with caps, however the risk of breaking something is low.
Note that in multistream support we are introducing new field per SoC stream api
which also can be taken based on the caps. 

~Gjorgji

> 
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> 
>> ---
>>  drivers/media/platform/qcom/camss/camss.c | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index 52bb19f5fbf3b..b7821019241d7 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -3120,6 +3120,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
>>                 .reg = { "csid0" },
>>                 .interrupt = { "csid0" },
>>                 .csid = {
>> +                       .frame_sync_en = true,
>>                         .is_lite = false,
>>                         .parent_dev_ops = &vfe_parent_dev_ops,
>>                         .hw_ops = &csid_ops_gen3,
>> @@ -3135,6 +3136,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
>>                 .reg = { "csid1" },
>>                 .interrupt = { "csid1" },
>>                 .csid = {
>> +                       .frame_sync_en = true,
>>                         .is_lite = false,
>>                         .parent_dev_ops = &vfe_parent_dev_ops,
>>                         .hw_ops = &csid_ops_gen3,
>> @@ -3150,6 +3152,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
>>                 .reg = { "csid2" },
>>                 .interrupt = { "csid2" },
>>                 .csid = {
>> +                       .frame_sync_en = true,
>>                         .is_lite = false,
>>                         .parent_dev_ops = &vfe_parent_dev_ops,
>>                         .hw_ops = &csid_ops_gen3,
>> @@ -3165,6 +3168,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
>>                 .reg = { "csid_lite0" },
>>                 .interrupt = { "csid_lite0" },
>>                 .csid = {
>> +                       .frame_sync_en = true,
>>                         .is_lite = true,
>>                         .parent_dev_ops = &vfe_parent_dev_ops,
>>                         .hw_ops = &csid_ops_gen3,
>> @@ -3180,6 +3184,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
>>                 .reg = { "csid_lite1" },
>>                 .interrupt = { "csid_lite1" },
>>                 .csid = {
>> +                       .frame_sync_en = true,
>>                         .is_lite = true,
>>                         .parent_dev_ops = &vfe_parent_dev_ops,
>>                         .hw_ops = &csid_ops_gen3,
>> @@ -3433,6 +3438,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
>>                 .reg = { "csid0" },
>>                 .interrupt = { "csid0" },
>>                 .csid = {
>> +                       .frame_sync_en = true,
>>                         .parent_dev_ops = &vfe_parent_dev_ops,
>>                         .hw_ops = &csid_ops_gen3,
>>                         .formats = &csid_formats_gen2,
>> @@ -3447,6 +3453,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
>>                 .reg = { "csid1" },
>>                 .interrupt = { "csid1" },
>>                 .csid = {
>> +                       .frame_sync_en = true,
>>                         .parent_dev_ops = &vfe_parent_dev_ops,
>>                         .hw_ops = &csid_ops_gen3,
>>                         .formats = &csid_formats_gen2,
>> @@ -3461,6 +3468,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
>>                 .reg = { "csid2" },
>>                 .interrupt = { "csid2" },
>>                 .csid = {
>> +                       .frame_sync_en = true,
>>                         .parent_dev_ops = &vfe_parent_dev_ops,
>>                         .hw_ops = &csid_ops_gen3,
>>                         .formats = &csid_formats_gen2,
>> @@ -3476,6 +3484,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
>>                 .reg = { "csid_lite0" },
>>                 .interrupt = { "csid_lite0" },
>>                 .csid = {
>> +                       .frame_sync_en = true,
>>                         .is_lite = true,
>>                         .parent_dev_ops = &vfe_parent_dev_ops,
>>                         .hw_ops = &csid_ops_gen3,
>> @@ -3492,6 +3501,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
>>                 .reg = { "csid_lite1" },
>>                 .interrupt = { "csid_lite1" },
>>                 .csid = {
>> +                       .frame_sync_en = true,
>>                         .is_lite = true,
>>                         .parent_dev_ops = &vfe_parent_dev_ops,
>>                         .hw_ops = &csid_ops_gen3,
>> @@ -3790,6 +3800,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
>>                 .reg = { "csid0" },
>>                 .interrupt = { "csid0" },
>>                 .csid = {
>> +                       .frame_sync_en = true,
>>                         .is_lite = false,
>>                         .hw_ops = &csid_ops_gen3,
>>                         .parent_dev_ops = &vfe_parent_dev_ops,
>> @@ -3807,6 +3818,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
>>                 .reg = { "csid1" },
>>                 .interrupt = { "csid1" },
>>                 .csid = {
>> +                       .frame_sync_en = true,
>>                         .is_lite = false,
>>                         .hw_ops = &csid_ops_gen3,
>>                         .parent_dev_ops = &vfe_parent_dev_ops,
>> @@ -3825,6 +3837,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
>>                 .reg = { "csid_lite0" },
>>                 .interrupt = { "csid_lite0" },
>>                 .csid = {
>> +                       .frame_sync_en = true,
>>                         .is_lite = true,
>>                         .hw_ops = &csid_ops_gen3,
>>                         .parent_dev_ops = &vfe_parent_dev_ops,
>> @@ -3842,6 +3855,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
>>                 .reg = { "csid_lite1" },
>>                 .interrupt = { "csid_lite1" },
>>                 .csid = {
>> +                       .frame_sync_en = true,
>>                         .is_lite = true,
>>                         .hw_ops = &csid_ops_gen3,
>>                         .parent_dev_ops = &vfe_parent_dev_ops,
>> @@ -3859,6 +3873,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
>>                 .reg = { "csid_lite2" },
>>                 .interrupt = { "csid_lite2" },
>>                 .csid = {
>> +                       .frame_sync_en = true,
>>                         .is_lite = true,
>>                         .hw_ops = &csid_ops_gen3,
>>                         .parent_dev_ops = &vfe_parent_dev_ops,
>> @@ -3876,6 +3891,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
>>                 .reg = { "csid_lite3" },
>>                 .interrupt = { "csid_lite3" },
>>                 .csid = {
>> +                       .frame_sync_en = true,
>>                         .is_lite = true,
>>                         .hw_ops = &csid_ops_gen3,
>>                         .parent_dev_ops = &vfe_parent_dev_ops,
>> @@ -3893,6 +3909,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
>>                 .reg = { "csid_lite4" },
>>                 .interrupt = { "csid_lite4" },
>>                 .csid = {
>> +                       .frame_sync_en = true,
>>                         .is_lite = true,
>>                         .hw_ops = &csid_ops_gen3,
>>                         .parent_dev_ops = &vfe_parent_dev_ops,
>>
>> --
>> 2.56.0
>>
> 

