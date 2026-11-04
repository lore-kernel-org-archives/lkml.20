Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821073;
	b=Yv+FrL2qHYPolROAgcSqmia8+gj0pi/AEjmoXSc01l1ucbCbCW2kLgeTxYw1v1ihX+BI
	 gY+Lcf+rZWwHpGoauTd2glR+SZWtsK6DSXNwXEo2EhRqfTjSyEpY2ihYFGgwn8hoABkcd
	 VBY/hke4LgoCPgj6lidhn84NC2QnVmzibriZlQ7pvmRzp5S3jeyrgSVQbw9ipsSD/kcrA
	 phS/Bt4WJMZo8rwM82cKhBGkO6RKsuloBsogrSr86Mucb4Bb/1bu/r8ihX2JeQV13Im8o
	 SyCbD55WhIcdZCXxbXFtAOtKww+N+TWGIGA1Wp6Bt6RLPJeJf6EWbCdxDd5aiDa3gYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821073;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9/OFrJ8GGE9h5yRFJ66Xeugo3H18/5jrLH6ADJy3KDU=;
	b=mbiYyP3VLAVokzqhTFL85IurDv6fJyagsfH2lQMveTlGJVpiGC1kkcLd5M1W2Ldi9HJ6
	 TDkjR+HbOrk18epFi6mi3+2uTCpSxlu3nnQ7O4ONAoTuntDJIdLsmy3gYoRU7iy5vKzAO
	 JgwsIdtxqmqEWI7481EoudET/qinmaxttRFtQBZxTuJ3BcJCALEcKwpXoIyn3WJ/88pc6
	 zsXsYDh7AyKpGRUJAsNprXoqgjo6eyaE8l8Z1UYpGHSbCSVY5mpPFhaed5AopfLSJhUOh
	 HsB8pwuQso7bce/nDN5nG+K8p9dtm+WZz48TX5EROVHzVMKLQlzMxDV8NGxvBZ16gxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=orkRQADS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BVcXMdxe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B5A60B4C0F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:37:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14B5A60B4C0F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=orkRQADS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BVcXMdxe
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FiomN1292199
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 19:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9/OFrJ8GGE9h5yRFJ66Xeugo3H18/5jrLH6ADJy3KDU=; b=orkRQADSaGoJA41q
	M3ucuAKlsyuMkNqB0/eHQR0+sNhCFqnjWtlyeLMDJRZMU06NlUf80dJHdEeqOqcp
	kzp42KOc/OY8+XBtwlEqh5LCaicasOhfM4/ZUr3NIQCmZ5zka/tNYzkQJdGIo3oG
	9NFzvoo0Lq3bEoH82qaWTSjSFEftDL2RRkHVr2UJvfL+IVFZlmW7NkRqNC5k1ZjS
	tDgxpjw69QdCPJ2iCGZlZwtLx7e6jyRpU+uZmExYqICFBDIEUaYiw5gz04kYN2na
	Ic5W9DcrjPCWuIxrdyU7TX5H1vtI+PJ52jWQWg/11U50uIRp5izUpoTzEKVQpXvu
	r5cxAQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr163jrjg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 19:37:52 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a5971cf7ceso1799943b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793821072; x=1794425872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9/OFrJ8GGE9h5yRFJ66Xeugo3H18/5jrLH6ADJy3KDU=;
        b=BVcXMdxel8p1zLqX8GBFTbQQbpqnJet3Xe1hR425mDzvPB+MhP+4CYLIig/Esu7km5
         zThzW9ma+2J64CBfErYWRHcR0JirH0INHwDqEgqVCte2JWg9hHzbsGVsAicZOmCcCrpJ
         UI7VZtqsMVk8TBQPCtxYr8m5HsEF0wZSXXY9Le8Ppa2e7GnRD4gtKoACJgoSaLZT0zin
         uibkS+dfSTq/iuTh6wxDIQpfwwtybJoUCYgL5pT7aSA9RT/10bJyoLOtjVaENgeepd6E
         toQksNDNllbJf4njNL9eOUCy9Ls12pXVezlmlY4UTvgN10bWBoThvo3at/tMtxCy89Lt
         qzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793821072; x=1794425872;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9/OFrJ8GGE9h5yRFJ66Xeugo3H18/5jrLH6ADJy3KDU=;
        b=Wf96GCzrGbOIxqg2leUn0JtYTp7Ul5HI3iN7utNctLzeKOgNh9w3tXvL8E0MqgntIs
         cJZueZ3BQcQFAMeNbxJFcvZsRlPfIIM2Bds4BCpqqPZLuJgoBh2gmnvRfI34Low6TGqT
         tF4O4izYesdLwdsPBe/EIgQiRNLT5r1AUuclB9bQdgpXDSh7xQMRZ4gUk+B68wOPdVjz
         4YOYgHScGwlNbF21EWQozowbwCGyWA//1pfJC12lmOkWv7g1mdUmNNdlXxEZy1WuHYZp
         1rILkfhOVYuv4TpJfi0kR42RlcIrU48Q1Q4i6ceW8Z4qTMOe58AbheCo0Raq4uKmEwkx
         ka6w==
X-Forwarded-Encrypted: i=1; AKwUvBybRVFe5hrCVrDxqTeD1G60Rlkn1COxGSgX3agQxjPtK7/teC9ydHyh9c2vKX5VAUOoBVhijO5xXgGS9sI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wbQHYrNK+VGOA+/BI3LXUE/jx20Oo26sQXBzKb5qx4oOfh/b4
	5czUw+ASPS0Ne5tt01DFWOG45vlGFaHdj8fdtLBdSJKOdXqqLl3pREdQsD1N99IJYxEqB4b7P9l
	vDJofTyau0CYC25OZ/efjF2UWWREErP34FnnZB6+JxHt2vaUDAfUhysZCfGs+uqc6pw==
X-Gm-Gg: AYBFou0+nNXq7Ky2qp2EeUsyVdXphIVO8riIWGD/5zx8pQpil0XP76VcQKyLM8nL4Ni
	Ppe42X1M2wPrp9CEEAzXHUusLswKCnUEvgyOyTkXML9xPjFUgEaVm+DqxDyfTYmoL/BBiAWOM3x
	PwQdY+CYk78uhIuoaSRGZXHmntbHT3Zd9ZrMjLCKAeUvk3xNScowctgdq1PEte9tBdV9Ed+D5Jk
	r2gaxli1aUTz5c+jP18BBmRE9y0TpCVkqhmL+XAvCStK/P9pqklpAvqw2qxksNE5YDudv2UnoqC
	N6tW/DPiKUIHWkbsWzkZD3SstfDy7IZYOSKonFgJaZol8z3991Ri+SeA300fbU9eqJ6Q20imp6H
	dIPPezNmzANiDLQ0jdtmVjmkS6t0haVV/8YYbr8TN8FvE/5CsC38ZqrdmVl675Kw65hbMNgNDNq
	WUQC+Z
X-Received: by 2002:a05:6a00:1f0b:b0:878:34d7:6a24 with SMTP id d2e1a72fcca58-8a9beb69d9amr14143268b3a.38.1793821071645;
        Wed, 04 Nov 2026 11:37:51 -0800 (PST)
X-Received: by 2002:a05:6a00:1f0b:b0:878:34d7:6a24 with SMTP id d2e1a72fcca58-8a9beb69d9amr14143249b3a.38.1793821071128;
        Wed, 04 Nov 2026 11:37:51 -0800 (PST)
Received: from [192.168.1.86] ([65.181.14.223])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09a7cc082sm1275492b3a.12.2026.11.04.11.37.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 11:37:50 -0800 (PST)
Message-ID: <6f2f8357-59ef-491b-95f2-d58feb362ba7@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 06:37:45 +1100
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
Subject: Re: [PATCH] tee: qcomtee: user: check the parameter count from the
 supplicant
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        HyeongJun An <sammiee5311@gmail.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
References: <20260730062219.2836938-1-sammiee5311@gmail.com>
 <CAGgiveUc+TkGyGDxuuCLpHO=i22-4fn1CqjqnnmWLdWWYOZfPA@mail.gmail.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <CAGgiveUc+TkGyGDxuuCLpHO=i22-4fn1CqjqnnmWLdWWYOZfPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: b67qYFIqcF9qKX65iz94A1GsXybHi4mf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA3OCBTYWx0ZWRfX3Q7o8DKgoeMV
 yBHPGBTFV088Gpe46xI0eUjOiS4y2W0fHIjpeqGgr/F50xeUIEhwg0tsN8SE0CzZlXuwTR8tYc+
 kebss9LZM/9TeWU+o2Sv+w4UvLcAF68=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA3OCBTYWx0ZWRfXzJtfnp8Rn6p8
 3Nhm54s5tDVVdQ2TrRKJQJ3eBW8JmQQfJTa8wx10sl+WuKBE/QzN+HqBO+/3FNmWKTTt+4rYydp
 D2ezTn18E+qBVWe/gxWuPmS8CxASwthEqhfyLCUpfgMCX5xcNBmnmqt4AyIBNA1/D9AU/6gU1pP
 ohvUMSlcKEncY+2vpF6ZqbE9XMilXJm88hxj0Ly4EFURg4pZb54QPIW/51jmgwmqcrXGfJQr/Hc
 TIjDYJtgNcGF5nvMBCZHFcs2W+nz9zuB49bfvG+hULWtU63un4fUUcZtqK5TmXOyfntZT+BwiHd
 AOxwhbCQiou2N6K1dcoRjkKkKSZyaPL4FIQhVecvp8RXV68k3Yqr5PcbNrJuNHzw3aJHJW5yBXB
 C0QBGxLEziDshMwf+a/UQNYWTdhBYKQwYdiu8VEIvDqAcNPGvBaCQ4JpuOGG68gS+i+s/sjAO8R
 07zGAAtQM1GhkImzsVw==
X-Proofpoint-GUID: b67qYFIqcF9qKX65iz94A1GsXybHi4mf
X-Authority-Analysis: v=2.4 cv=O5OsLx9W c=1 sm=1 tr=0 ts=6aeb8990 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=YVmDP9EW+FTsGeEl22X1ng==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=47U92Yqy_zLrgJxgMLYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040078

Hi Jens,

On 11/4/2026 4:58 AM, Jens Wiklander wrote:
> Hi,
> 
> On Wed, Aug 5, 2026 at 11:23 AM HyeongJun An <sammiee5311@gmail.com> wrote:
>>
>> The qcomtee_cb_params_to_args() walks the argument array QTEE asked for and
>> indexes the parameter array the supplicant supplied, but it never looks at
>> num_params. A supplicant that answers TEE_IOC_SUPPL_SEND with fewer
>> parameters than the request needs makes that walk read past the end of the
>> allocation.
>>
>> To fix this, reject a response that is too short, the way ureq_select()
>> already does for the receive direction.
>>
>> Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
>> Assisted-by: Claude:claude-opus-5
>> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
>> ---
>>  drivers/tee/qcomtee/user_obj.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/tee/qcomtee/user_obj.c b/drivers/tee/qcomtee/user_obj.c
>> index 10452fcc7ccb..2a594ae299da 100644
>> --- a/drivers/tee/qcomtee/user_obj.c
>> +++ b/drivers/tee/qcomtee/user_obj.c
>> @@ -507,6 +507,10 @@ static int qcomtee_cb_params_to_args(struct qcomtee_arg *u,
>>  {
>>         int i;
>>
>> +       /* Supplicant can not send fewer parameters than requested. */
>> +       if (num_params < qcomtee_args_len(u))
>> +               return -EINVAL;
>> +
>>         qcomtee_arg_for_each(i, u) {
>>                 switch (u[i].type) {
>>                 case QCOMTEE_ARG_TYPE_IB:
>> --
>> 2.43.0
>>
> 
> Looks good. Amir, do you agree?

Yes. It's correct. The check is missing.

Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

Best Regards,
Amir

> 
> Cheers,
> Jens

