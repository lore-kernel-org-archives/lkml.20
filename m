Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590797;
	b=jnirAdy21ff6MesGWYq8bym4suW74+M35Zv2Nr0jauzsyQ0UJH09/D/6X+jd0ItDxw10
	 hzagrkkyFooW5gu8/dEBkllSNE7/QDWKGWRTWEgyk1UYgIYrr5BsSgK/Y+3X9bDsLMjvo
	 SjJS+Ye5+GUCyT/cYizUvNkZji9mvAbzAQVvYwxEEslKFN14XMclfDwzY6u2JbTuvOlgg
	 EijMIITFghqH5Y6GeQlVZmQz34ARmnhCogkkG3icnQ0tdCknOz2TExRX0t8PJzv/6Y+z1
	 hjVkdRG/QEwBsN8SOSzgvhRm6xseiaUvBJN9IyQVF66KdslKOi3tk0oDPsRswZLAsyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590797;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cA3qliSiZOiduXdaWhA7g69m50PQzr3b+HkLCh/HevA=;
	b=RgLg05WW8hWEd1wqgCfxGT7o/K1aPKt94Kcyajq5wXWUHnCUgRFbP+TtdwlG/qoVABsB
	 o2SLYOoAzIRUNUsbru5ujSs550rn9aBaV52LGeDOP7wmvV5sOjpibZYmogJW66JJMUB8x
	 Ma495yfaopAhX3+TqqK7S8FXEHDL7+gv/j5Hm9uozwsvAWqh+UPWq2MV0nC5IupwCmmVj
	 AYqIt8XuwFodeo3vvLrjoor+iEYTPSR5v+LacVsnq+tUhHW9w2tcjHHDF26VZ8Nshkw9X
	 7yCLPRsMPSdCUNg/i34OCCSf0bkRBMfKe0Jorg3WtTKmx2ywDzWULowatH0itUXG9Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TPkk6EX1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LDEzQwaK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC737606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC737606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TPkk6EX1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LDEzQwaK
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBfxBp489813
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:53:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cA3qliSiZOiduXdaWhA7g69m50PQzr3b+HkLCh/HevA=; b=TPkk6EX1WQGaj/YI
	C7L0wtDsRhlQPHtZU3CG/xkovzlHbC6Ksv5GcfSlRi/BfKoCgvPSYCOAojzuqxh0
	TYrSHKquaaq8ZwAj4kiRkG68picR23UuJOchkMRHOAbpoqOtvlchOd+j70jURc1w
	z5NSVpq+x9XF0/GyHzXxO4bfCguOM+FWMYEXkVoDeZCy5GkAgsZpCaZ3/baiROXM
	ujA4rApF6Y0c0ZYUpRRyz0UZbTKxuNY/BtjZvNyqfAaXm/+KWnDQ/ASlLhV1OQeJ
	P2WT1WuCI+GgcJGQrm2TOGTu1+g4urBlE5bLl1lk5SGlGW9hdBm7EUyB4nTWCE16
	WIFWQw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r39ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:53:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1440e081so17794985a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792590795; x=1793195595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cA3qliSiZOiduXdaWhA7g69m50PQzr3b+HkLCh/HevA=;
        b=LDEzQwaK03Z4D3OYk1JHT+i07SnUOmrqE5i0ljGOeTiqkSf01v23RVNqGRHC/IZsGA
         1J/0Nhfu9ZPSTAKiBIpFq32nyRxTNdSJkyZy/s4e+oaanX/5TcTUEs55dfHHy1jVvqze
         1GVvhVYK0Yh95C0UkaT6Ds0sjzA9yIw+kS6KjYpy3lPA1Cb/MexEUkgvj3jzmbx/ICxj
         7rhTbiy2nqg18X1tYpIPgjAkzS31YMcNdldx3TBCeNS2Ib9Ic7NVQCWTGTKB2gNS1iMF
         9r2MBlxnw6Cy7f3NRV3RRAg2hqrbwvyPEqnSwVNbS1agk9kT9fGFOBuTAWLjV5JLahfm
         DzFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590795; x=1793195595;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cA3qliSiZOiduXdaWhA7g69m50PQzr3b+HkLCh/HevA=;
        b=VesJC802tltsLuAwuVvi9UNR/EmajCj9PyUtLaKv0zgKODx9fLZMD+JUXBAOZ5Yb4W
         WsRNE1NrFEMT5qQBx+ducBA3tPpNVT/7a/SzDpQs3P0YA9wOq0VtqgJOU6F6t8f6pNLR
         IZAAJRbIZpKsGH2mumZBldMhq8O77n084+eFbFdTD3ja+iPBSYTHesk2IBS7+HgDGpk2
         V2XQNeUZrJoRRZpUB/Mx5cCi7YZkQKS451IUEs9WtfxQFRb4h4V4lgB8q+ttbIyYOj2f
         I2DlFvXGGkC/1HGDNV4r4U6C+hEQL1Hf3mmsznJ+H+OnGC+02rKhX5EyaO7DojXEtDMg
         IbMg==
X-Forwarded-Encrypted: i=1; AKwUvByohVdk09j5Za/gkhOBnCi5ixIE7kYWLs+sbJpYdAWyRaXyWjeZxOu/Beb+BmUQJEHCagdn2qw9uWdoaX0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIblYKlv+eNHg+1vpxQ7cfTuvbaOIWW+u6H+CxCfAewUAPvT35C
	KJdFVfPAfPNJveo5Eml0RM2WrS2I0gA23hKKFrgc32CxyBNgypFw2oHUAanvooKhOUTjMzN324t
	sBNg9t2wr3oyGVrjQoHiBbklvq+KN7Ucewu6xdrjOZuJv4naaAjjPn1RrmdJz2zOdzJs=
X-Gm-Gg: AYBFou2fdgzyDXSkBbfPDhMoAYpxeqfPvF9VYuXZIcDwlyoC9f6Mg9yt75bpmx2nhsC
	8Bqj5amttGrOhYKUwiSS+unQBLrOOqgNhXwELMc6Y7JCWuQ270R/Gn8/lSb7QFDQjoV5nXxcdtp
	VJ3MNXh9Uy33iK06t/Bsd0z6Tk3/KZFnxA8xD+GVneH6iQrE5yK1F/pI53VPaqaFWMXbOWAcWjC
	WTmdgsD689yNliwO6mPdtqYVJwuUkjrpqdkVDMH53hFPmEYEIh1tz5yXaeBkjDxOH4xnwaX2uZY
	4L+EdS5BioAR3kueHr+l9fPvFWnpvEkUKxnejVwaJ5G0orneVN2cmNWgXD9HEiOIgv4+whmLuNh
	ayaYGAaotmAqc9hnaiBKEgw==
X-Received: by 2002:a05:620a:2b95:b0:939:eb09:4458 with SMTP id af79cd13be357-93f57f7af95mr527536685a.3.1792590795128;
        Wed, 21 Oct 2026 06:53:15 -0700 (PDT)
X-Received: by 2002:a05:620a:2b95:b0:939:eb09:4458 with SMTP id af79cd13be357-93f57f7af95mr527528085a.3.1792590794286;
        Wed, 21 Oct 2026 06:53:14 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40313074esm884023a12.27.2026.10.21.06.53.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 06:53:13 -0700 (PDT)
Message-ID: <b667b008-2d2c-4da8-8b1c-3b24b351ea64@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:53:11 +0200
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
Subject: Re: [PATCH 14/38] arm: dts: qcom: apq8064: Align multiple property
 data
To: Waqar Hameed <waqar.hameed@axis.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, kernel@axis.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <c1886d808858a195ec78425b293b2ccd3756cfaf.1790892852.git.waqar.hameed@axis.com>
 <f2bde571-89d2-40c7-9ff6-c23a56b3dacd@oss.qualcomm.com>
 <pndo6ctn350.a.out@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <pndo6ctn350.a.out@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad8c3cb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=3-RhneuVAAAA:8 a=DkxrGzj7WmFQ9Z13Ee8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: U9xqJHtGwggov5tL-zP0lDjJXneTYTDa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX/+BZWh6IUu2L
 XpPFNneDQXaNqyTUCnRTWk+m3h5wo7iRQPpBJP3nbQ/UCeyJxWfW0tA+Iqp5Yjfm0WFmEzggJSq
 dPwD0wgtpPvx2t2JNI45qApyBt0OsTqVcZJV43S73JBNJKLbnVlaoBzy2B3WUz1lkPXwWZeXUi8
 MCrnLvrdC2c4F+4X8y25VB4lAZdE2xYTjbnWK+igMerjg6ihW09xO98vzbD75oY6lsGPixzdb8m
 bM6+0ClA/BsodN0n2Rl1pqLQi8Y/9i0Ub8ZWyKxYxBMD24KzuoIF+wB+W5oV7rKzYspDcTgTAlJ
 +Bca1poA5oFTGIEyPZ1L7cxTzdzXAPORtTRPzciUWWzGPHATR5yIZ7Cisspwgtm4Ed3nJVQCQnf
 Hr5NIBI2Ci8a30Qc9fXxDAokgQZ9ERTmR+fQjDZEzD3tspXMq4nzqFEeE2qNkOpx/AAeJvh1Rm0
 8Snh4w0FTajgrnFd0cQ==
X-Proofpoint-GUID: U9xqJHtGwggov5tL-zP0lDjJXneTYTDa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfXxrtCWW8IKxYK
 0+Pw4S268uoC8/FRDu/vnnvfMjnE1bwYtAsdxMeqw9bn/nqs1QAzIFjWcjiyXE9iVq7uziWkgg4
 32RWPYjcdHAmr4zXTYVHuFQdAXPJ2Ts=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210055

On 10/16/26 4:14 PM, Waqar Hameed wrote:
> On Mon, Oct 12, 2026 at 17:52 +0200 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> On 10/2/26 12:36 AM, Waqar Hameed wrote:
>>> Multiple property data on a newline should be aligned with the first one
>>> or properly indented with tabs. Found/fixed with dtfmt (Devicetree
>>> Source formatter).
>>>
>>> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
>>> ---

[...]

> Which maybe is more clean than allowing the first string to overflow 100
> chars and aligning others to that one:
> 
> 	clock-names = "corecorecorecorecorecorecorecorecorecorecorecorecorecorecore",
> 		      "iface",
> 		      "mem",
> 		      "mem_iface";
> 
> So the question is if we should either "try to fit within 100 chars, by
> adding newline after `=`" or "don't care about property data longer that
> 100 chars, always start first one after `=` on the same line". The
> latter one is of course much easier to implement :)

I have an ultrawide monitor so we can overflow waaay above 100 :D

But more seriously, between the low likelihood of this happening and
the presumed disadvantage of having to scroll sideways but still
being able to read without jumping to a different (line, col) with
your eyesight, letting super long properties overflow seems OK to
me.

Let's see if others agree

Konrad
