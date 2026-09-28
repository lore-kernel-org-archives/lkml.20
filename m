Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CA14E66AD
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790610905; cv=none; b=bhKap3FALYvm2XZ9xtCpckzWpJcoHWDYqDiB8owB9MxXGNCbY4SmkPjq029mW9pdoq3sHIpkG0oXQ30kRl6cUX4beIDlMFQtix9c3O+/xmbtY1zMHM2e0knpyA6iu6V4CKAGeBj8GQeiSsft9OixSu8rXJDXS9fy9NO5D5jPIj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790610905; c=relaxed/simple;
	bh=YNC2dPejWWJCrvIzjQvWnjPjhFgFgkqk/a9V/LXIx00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X3HGKxraIO55aPtpdLiQnq9LYp1A2ruSQ4HRiekfFTJez9kZ+93eXtp3MRjodyfmMO4t4kx3UOF5cFU52mTOPKNC+u7LRCiH/5bauUGDcdwGo8EVbLXLE41fphh/5Pd073ThloZIXb/X/Z4ljF3Uof5GgaLu4rYgG4JqeOOH4U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AKtc7pSt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WlJIRamT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AKtc7pSt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WlJIRamT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEdugg379019
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:55:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oiM7Id/7T8AcpXTBsrdSOsZ5pYCXgGljuRR69wTdWB8=; b=AKtc7pStN4SszjDx
	RjmGX+EIAFghAIIo8TsDVl4WGoKd9suuC+CjpAQvZWmh7+hiWA0beMOzmtY1+2jE
	7dn+kVNfFFteaQAB2db31PDDKVJFMGdA6hD5RddQEijWY5fNjxfUNeWNJ1bxKo2Q
	xj3Fo1icu7zimzviPVREAvFKyiPM3rv5jH+Wpu/cUzcDtmvGmuGuChMl/bcNcqSE
	J5n9GqQXBK9fXHj9OT85ZYYiWGSwgdqrYlesDr221/JW8TU+dGNltzvSy/fQWnkH
	J4ELy7xLh113IT0iOBBF8DN/8t1ToJxW6Pqq00but3lmT6HinBRP95+FhgcbawJz
	FgwrUw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyqx38xyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:55:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93c5e9c2ec1so300443085a.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790610899; x=1791215699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oiM7Id/7T8AcpXTBsrdSOsZ5pYCXgGljuRR69wTdWB8=;
        b=WlJIRamTkyV+C0EYARJLA00o267HPTpNAZJXDmpZLmrwjl+iV0HIXC3VXwVftmb3+g
         ZlaWvgUb4UIQwtwWskc4PQ4TNKh0RkdpPkuPpCN68+sWaMvSqnsjjLNCzz/CWE8oTOlr
         W0KOOIm9l5/6MWrhhEI/jSmIoUZq7mdj++cOq67pR0OtgMv6qX11LUDxIp3xOFBotNk3
         bzkPltNK53LqlLRbI76XpVpLl8Fh+ZmHC0KF+ea3kdVWtvjM4cjxbpzNcoHXf5CWQzb+
         7vWeWl+Utp2qQcQAXC4wj25z1ZjYMWoOlvUt4QzS9RfggBT3aAlZ3KW0iCvdQViza3BY
         ygvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790610899; x=1791215699;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oiM7Id/7T8AcpXTBsrdSOsZ5pYCXgGljuRR69wTdWB8=;
        b=PIu2kerFgvaDws4Bwvm0APfU1kqd17q4gs6rtGTXy3IVQL4QcTLixAF1RJ9S/Vcrwz
         d2lQhEgtl4UMKQcMkEdOx1o0AWOecPBDHEMNN+QxWWBIgUBhGElx5IFTM5aNihet0uEP
         E8CKoKJsLV2aR6uKpWqMRlK+4xjpEG1OwqTL01PoGjP3kOOeyfP/GD5wzwm3fSsF5hkj
         KZlqTM3u9o1VvhXHgcOQBOUJ9jj9ThrPztx+GdCiU7csdGr3BFXihi0Pr/5vaFlq6yQ6
         WzlIQOJ39kBUL8uDYl4feWNuPEdL7bRPfnR66PNdVU6WOUqAx2qfJPiHpQQoeCE5xDEW
         nfcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqcAFLYiB7mO/a03AXEzRt1mDL/Kz0eKxhM6FZE428z+D23nBAu4AJEhqfDXRevPkNEJ2x2HXP7W/DhPs=@vger.kernel.org
X-Gm-Message-State: AFuF++k3nQXlE15D3H873ChTpsWYPSuMqfQ9+5t8dSEf7LgmqySolrga
	VUslLDdnS9aAzzq7CjAAmg0604u1i9vXjLpoBAdPXP067xOnxWGLbPyAmfZCnDn9NYd3U/9JRgg
	Ier1sQ6j/4fVtpz2T2N7G9cHsC3C4BOIYPoh3D80ZtjqgKm5IpluJdZdY2+x47SrDxjs=
X-Gm-Gg: AYBFou1fzOZm40Zgb7FGqoxQ8A3UY6HAq9u0X3LjUGUomzzHGZnwPNny61qEuclV1Rj
	Rn47x0aIUc2j8Uchc4urlAjWuaH2SYmrWa//zE1gWz9bn8zXtwVkJh/2EnFRQF/NivSRtev84oo
	fMxwMy7ZdxLlxXy11qvcmBoDbII5lPoDXkU0RqJa556m/qPe7CQiiA7FNCC3ZyeMEl+QAm7yyru
	NKim9EBHY21SXk+TWVma/HcHPf0rspL1jwHSu3GtSTiYaIs1TeyQvNLXzZa37KGtomgXiI36Rxk
	Sloz369SARQp7SkC7UHx9NmQR7Ih+MugCJEsXf/0czjzgp6/+NVkTXul1AOxR1ofPNCN6kk85/g
	3j62XZ9B1iRaGY/ssmg==
X-Received: by 2002:a05:620a:488d:b0:93a:1196:ce5 with SMTP id af79cd13be357-93c43db73demr1951460185a.33.1790610899086;
        Mon, 28 Sep 2026 08:54:59 -0700 (PDT)
X-Received: by 2002:a05:620a:488d:b0:93a:1196:ce5 with SMTP id af79cd13be357-93c43db73demr1951438685a.33.1790610896262;
        Mon, 28 Sep 2026 08:54:56 -0700 (PDT)
Received: from [192.168.10.46] ([37.167.7.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349731sm28879319f8f.12.2026.09.28.08.54.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 08:54:55 -0700 (PDT)
Message-ID: <c07dcd3e-7d0f-4c79-9d99-25339f441f10@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 17:54:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal: of: Match trip property helper types
To: "Rob Herring (Arm)" <robh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260612215009.1884665-1-robh@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260612215009.1884665-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2MyBTYWx0ZWRfX6aefMcwVj+NG
 mV4mHM6eAfdCuuv6MIZILstUCXBF1BYXbYr1RehAUQSRFxk8OyfIBbtt4Z+o4BXmSnhpWXS/VHS
 vKzxCy/vL1w8FYT9E96O6rMAIY0Cf6AfUoYRt7TGs4JLneEV61qGmrJXfL0GAU7N0GxNbLPd8uG
 AtTZSwGAMCwhppampoYvEVDyYJ2S5dC24HiOUTyNVIpSvOtP0SEytxiqTSyC4hBPB058QKwJmXJ
 8eV8zZXawVW4puReCtewC5Ha0A55HqbhXwqyY7np9TdfuFgepNurKrCxEmCqjnlmBV/zO0vjlKj
 CkdpfMCKe4PowC8w8TQtjlo1BxPTeidm0bzlLWHwvpAULQd9M7s/Sk+EaPsw3lT7QrDD17VsBHD
 RU/r7TncKPKAUdhZWaS5Z6LyBKPoHPL7/FHLmcPgkat5tFFJL8Xu5uLbJxn/W/f2hm1OYXm94vl
 8WmhwzsTwB5i4GXZp7g==
X-Authority-Analysis: v=2.4 cv=f7jdl+yM c=1 sm=1 tr=0 ts=6aba8dd4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=K71sKCzDSiMJbZmyObbiAA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=aSnnb4sgh-RbRcL0VzAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: qAeFqbUz2B-00lkbSoPlCZqFMM5hDlqC
X-Proofpoint-GUID: qAeFqbUz2B-00lkbSoPlCZqFMM5hDlqC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2MyBTYWx0ZWRfX7uWIlpiiOV2l
 GOUnZqz2z6HlRVrMq5vy7RCP7dVDVqSDQuCD0oyy90O54y279N+nX/V0Iaump3t2oPO5lXTCoBW
 PQNSIIun8RmRKqhdse/1nbDG7A9XqgY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280063

On 6/12/26 23:50, Rob Herring (Arm) wrote:
> The thermal-zone binding defines "temperature" as a signed int32
> value and "hysteresis" as an unsigned int32 value. Using helpers with
> matching types avoids dt_property_check mismatches and preserves the
> signed interpretation needed for trips below zero.
> 
> Read "temperature" with the signed helper and keep "hysteresis" on the
> unsigned helper using separate typed temporaries before storing them in
> the trip structure.
> 
> Assisted-by: Codex:gpt-5-5
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied, thanks

