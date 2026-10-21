Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573743;
	b=AaREBcRmdc73MmWh7kVPIvEJ6gnXJzMdYsM/1xml4diwdP/U0NCRE39MinvXSyjaLegt
	 EFNkgQbEkzj/pwutSRmwi+++QlhEyVyIRiYB5J2Rl065fr2dyrK+xzrMf/H/Vu28UM05+
	 eFGgo1CM505KEOzoPCmvrl4j7uPgW2zqmhX24HXIlrEyPm+5DA+kpK6fb0Bs8PCsiXbGM
	 yY/K8ONcLdo1LeeVqlwruUQnfQkgPqJ4YMb+IBWQpbspfu+OYVowBMicJOu1e+P7JR8e8
	 9U45qjmliMLNIPEB1vJ79oEZSy7SLMm26bKegXJA1uBMjNahvOdEqswNULKGq+6UXIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573743;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GsnIM0p86hANMXW1GOBgAJw+27kK75Ae0x3nGj5okmI=;
	b=iwWnM/v5DGw0+sggrr4Ny5HSONS4F8G9pG54I/xssNjHuufEr4szqWzAOt6W6QbY98g3
	 gnPO3MeElFUgdBCujkQMNWmEta6ZHSTX3fPd/njJ8RJK5kANCuru3OxNpZQioR7Rm3yPD
	 0dH9UO1fTwKuYefZELqyXXe6YCQVAF/ILL9gAZPXZKFHY26fKLrVdloi1EPm1+pCuQqnu
	 xJFtyViP4Um9uRygZNZeD1yH2kYWJ/XBHD/vxsforo16H79HUHZCwZb7mbeQmVUQopjZy
	 o8q9rMhMvWZiqPMZeE6VAA66vbiYMrHnj3m6WNPpYYmxogd3pRMz/0BAv3xeHl6BD1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=niKGOsSB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aY6a7838;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E929C606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E929C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=niKGOsSB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aY6a7838
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j2vP165261
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GsnIM0p86hANMXW1GOBgAJw+
	27kK75Ae0x3nGj5okmI=; b=niKGOsSBO1/UkOJ8NdqAATH1RX9CpEKMnBQjtTg4
	WrlzWfxhOyHp11Fy1d9Q4572BZX152ZqdsJTj/TcVaQiCs7Pii9dOjP06XeAvLDo
	PA3u2gqR+sS8Cu/QLwA96oy45BUzA1qUOGECjbYekAcgr01SleVzCu5uEYDXLTzO
	GdCz3ztGZPem7GD+p47Wt1/YHpdKO024LVN70C32iZ/rNNEldBlJGVE/7RbJL8oR
	C2n3niXIUd5Km0pI+imPcnQzfgtzpuIH9KrgUagHjar2InYnsh4O8Cx0+4zkeqeP
	qIlBCh88vdSlVEgUkn1V1uLbma2EoP9aYvLWIwVQrAlnJg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs02csx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:09:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so115149885a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792573741; x=1793178541; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GsnIM0p86hANMXW1GOBgAJw+27kK75Ae0x3nGj5okmI=;
        b=aY6a7838NIJMzyJT7nb8YWgyLwrTnpIi3dN4nvaAv+gjSkme7A0PByQeaf7AoCfkH4
         +iJTHUyyiMNKSNOQj0NX0eHVW5IMU4rTEWMQLLzhNZ4wnx55Y04WXC3QaVXEyMoEqaO1
         5FCG5JeZEdD7vYj9fkP+Uk6neyuuMVPAHtICPLG0oUVbUMZcgNNH6PGpuj167deGOxWE
         WUMz1kiBUcJME/8TWrnRmRxadTWc7rVdNKLekFA3QcuNZ3t3sV+GPnZyZL1vHKdbLsi2
         Dw46zCylfRTE4dRCzWHxYesi/cjJRvdr0FvQ9UfghJqdbji48AO0KMpnd4bbsBZEh64H
         ZX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573741; x=1793178541;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GsnIM0p86hANMXW1GOBgAJw+27kK75Ae0x3nGj5okmI=;
        b=KLTnX9I7/83grYDzScLCJX471HXQeMtqZSuD5wczSW7zw8Wp+bBzbj5XFOoyR9JXoT
         VaYIuYvgJ19D0O4BR+U7jxcUFXcfKFEs9HH5nO1BAkWDVeJoK0vJC6LFHf/FWqiUp6Il
         uYPzdkvU2i6fJ+SajpBMc6zEZnWzwAM2NDSZnlnP2mlk6B0WhUqp92b3aWarvfUXP+qr
         Suks7qWp2dlEQVOj0wI8dU8oRWC3MbI0Li5PN0QkOy4nXB22w/4/+XwJQ5M2aZrESxlG
         l6JD0FChXa8B6jiE7FhZ0Ar/zLab13TTsf1bxP1J5OViHeddqJ2s9059kjpvmnC3Z+GQ
         sCyw==
X-Forwarded-Encrypted: i=1; AKwUvBzaIZx59XCCbm0YpTRKCksUg5NnMWia32ODHAXn9swPcHBRx/c8RaR5NPaBrRW2dJi79FoVa1dSiUyeULA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFy0Moic2QSveVpJDsyw8DFKucWtrIjUqPhppVe/EosIoNuWJk
	R22SGzaYomCRZKk4ckvECdirbGGBM8fCtXPsH2XM9uv7qbHpzAMFZUiYH5T2u00mSvJ2+Cc7RA3
	/9YfqgGARRbbEKEmWmw/8CGF6KmifvYRfYu0tt1LXu76aDVp55IMH/DAMLz3sbQS1Pqk=
X-Gm-Gg: AYBFou1DrwuLv8v7uYw2+3sei+8ABToLzwFmVim9RvRewXXRfzy1LfKw1a0aJ5Oyx6n
	nVfj9sVNVo27/X+Jmn46N7BxiNOPLvvxbn7D+gJflHvuTTCD46lPjXvKM+8OiymayquFKVKOe1c
	SY4GM/1QmnYXipDqbcWWOI4+jVtP6y8kdBMmEA1eeB1M4uvwP+XaDqYUAFO2ACVKU2qvyShURjC
	b8UjNvFjm2ULgwtOIo5Su1RI/vuIYXUBNojTH37lmVZAP1HfNA+WPescdSO5NXS6V3SJCRYSx+K
	hM6Lgzf3y5GaQnLxpa59Ac+3VBnzAwGiw6AkI1JtN3jr2BxhtQTzZt8igsarxQw8xRYfWRCcWYV
	iZYIJBl611Z7wDVPu
X-Received: by 2002:a05:620a:1a1a:b0:93f:2aa8:c555 with SMTP id af79cd13be357-93f57fad39dmr302300385a.57.1792573740997;
        Wed, 21 Oct 2026 02:09:00 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1a:b0:93f:2aa8:c555 with SMTP id af79cd13be357-93f57fad39dmr302296185a.57.1792573740394;
        Wed, 21 Oct 2026 02:09:00 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25841fe4sm4461248f8f.53.2026.10.21.02.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:08:59 -0700 (PDT)
Date: Wed, 21 Oct 2026 12:08:58 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 1/5] soc: qcom: pd-mapper: Add support for Nord
Message-ID: <peg2pnqbptiq7luxtdudddakrzuphe2uc5xlwi3vbifprsm4ww@kd4toenw7b75>
References: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
 <20261021073633.2163128-2-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021073633.2163128-2-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad8812d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=4e35E3TMtzUg7Ff5I74A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfXyFOuFOL3gOsQ
 0kE2w3niOZl6UB74rf053H/c4Ni3I59yJUvbfGBGsD3bkXsU9H4kf5vEH3H899YjWr8VpPbsI0B
 HrgYB51RYL3m7fKDSYgqC06VKmt4VFlvSqv/WMsm6qIkQmcCNToaKHcdxUubnTFG1GVhOs/0vEY
 4JGYBgDog22O5cb4Lz14yHIcFVFk0dEz8X7+cJhbKwCnHmJ55cz76s13s5WCfO4zMOWv7yVQsyN
 D5mhYyt/4lfdjbMWdYqYtIZzY2EYRD/X6L00CCNGaZewdeymS5mRkSjy94RExDt+sCzL6IyNEEQ
 sPGkiuPLa8UmlZrmS73gNshpXMnLsoZTpCQ6npK6gnPyU9OlKntFBsZU6b9JZqyD4fCa28+tBa6
 mJfFWwiMojWl0t5VvNCWQpHaTnYM7S3YFNMpoOSasPWuGdCMX2gvkYf7Xw09nFqQwJnEqYaPNDr
 Tsj3fJKglrbAneVLiuw==
X-Proofpoint-ORIG-GUID: c5TNWbYt82mE0Bi1yh9NL73D_tELplRM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfXyubpl0rPu6q/
 5G9lDxIYFVgiG9kwzPTDe8IxuD0ElGVuP2GpYHIKlK2caXPQhfbFWur1Ww9aqDXKFdCgOraaXxr
 83zO+D7j88V7kpAHcqfDp55Lt1HfufE=
X-Proofpoint-GUID: c5TNWbYt82mE0Bi1yh9NL73D_tELplRM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210036

On 26-10-21 15:36:29, Shawn Guo wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Add support for the Qualcomm Nord SoC to the protection domain mapper.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
