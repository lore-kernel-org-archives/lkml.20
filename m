Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792742791;
	b=Pmi9WWuK2cE6s6RMXl2s6vbMlMyyCmEOuAhfgSKPOpQAkIHOeFOVsBpED/2rkoOZcusu
	 ArDUhZQNj9QVipUycAAX3wMdMhDmfTk2UiF3jtVq4zPJN95oUEbp1m6fGTFw4h+BhFZmn
	 HdRpx6PajUFX1T70bn7Ka1THjyh61w+fu5KuAWj+aZgWwjHUo5tVHdDJEtd4bbNaYlzbZ
	 eEl6VOwyUA7TI5ouqSZaVaCy5fJk4c320qKJscWBKjWxSPIP25ycryna/mwtYaot+CF/j
	 hcrSKwqKNPVvGeJKH2oV6M3NvUUiMcM1Heex00HUXRz7e3YQNh26Xc00Ggj0XdpLlXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792742791;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WkRK8y3p+giH1Dz66bRMZzeRiuELQ+JWzWO1dmY60cA=;
	b=a76fInYRRhy5L28cF2pOX/pXxd5mbbLx9TOjAkUiPD5aBE3hupTY4mtycDMjzHKu30X/
	 gM+4rLCAkRFsSVwzbhLKYBDJPXnRera6fMUTjlWdmTcyLOSPHwC40cv181Q/fgJN1+BeT
	 o3foziJLIgodRLnaSa7zN0f8/U5RURvNPxcDQ7VNkT4FlssPdbORlnOWPYJ1prhFtUVZZ
	 95uJImXA/30AsXFMYOYb7FKBIXNLjdGIqZKfLlTjLCuyQrESH317gj3vz809Rz/YEQKL0
	 /NA/6bgEeA7uWjYhs2m4Ub1/8RLUIHGS8ZFomTowFn/lxonC5aODqiDApA9V97OfVEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U4UQBO7O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BwleiE3Z;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A29606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43A29606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U4UQBO7O;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BwleiE3Z
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FD4U1767184
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WkRK8y3p+giH1Dz66bRMZzeRiuELQ+JWzWO1dmY60cA=; b=U4UQBO7OvfeVT+v0
	++oqPsbyXmrsA7tzlP+uwizroGuKX8cWnNIN1LH0ZJpnDSJ8y88P9EfEQH0Fzxpm
	feBGBzmS4CiQBc1uQCcypry671AEWQ1hKDf+72l3GmdvwMcUC3+CrUV20tfRjkUh
	gWd8QlybeNXQWyHBckO1C7+0hLRQ1djNec1SosahkPj1T4zG0hIlMXvOa3ZEgIGH
	nxlFr8Z0mf/WMpYgyVjRNygIpgBioctlRvXTnY7FpkpnLtV1PcbEkDpfKriXj/N+
	SWa9xsmn9H7fxFsEt0vawjeSWyj7W4D5jbCaCbukP5ddVBOx4rBx4ki7LSBdZFx9
	Pm2hWQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahu2sq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:06:30 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9179ef12a03so3154856d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792742789; x=1793347589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WkRK8y3p+giH1Dz66bRMZzeRiuELQ+JWzWO1dmY60cA=;
        b=BwleiE3Z/ViWpr0qh9l43TJ0Ewbos1tKvEK9vgSbuHqwNrhJ7pWxLM4YLIvKE+xPOz
         kfjJK5kWEWeX3n5sAM7mivRTnhzLFvOSwZvJdHbutzk/WlN1uT+FaTN9kL6ID85iWvp3
         NgPfY/Cv76bMzVTG37G+a4/Is9h/xN2Y55p1vXVeIYzsjo5wE6TeFVdxhtiQCPE4xcM5
         yCQYFMVc4RImqjEowDQ5bWbLDRGynv7t/iMM0xoW4FcyxkfD1lL/+W4GITomh3djl5+3
         VaheoIC7IF+AtvSuXvAhGpHxhx+HPD0AD40VVsjau30MWP6uebCsFNaMeM8Hb33w3cVB
         TdMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742789; x=1793347589;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WkRK8y3p+giH1Dz66bRMZzeRiuELQ+JWzWO1dmY60cA=;
        b=mocXytV0Bv6eIhC+9XOfa0wHQFg/J90Lee79NX4bRBmGMxlHuiTmFQ7NPw0lauT9H1
         gaxbNpCYYiAO1p9J4oWowJ5ndq6521QWBBrRFgvxtfWlcMN/Cb0+60pDkyaMw/fDZ/I1
         /Vk0ojY+bZo+oIC0KGkiFrBENk75WGsUS7ugOdqfnGjE+TGVSFMiZxYVEM80BeOrBvGf
         nMQd2GAkKVVkpweziev6okDY70dRdMxGW7pwuFkJNnSdZiHaE9LgTP3VuZ/OJ8TUmg9W
         oOUtr0014x5wFG262pWrkU0GKO6CpQe2FXRb+AdM2Wu+ip/GgaJyEv9+laxSCARwWwXU
         gfuw==
X-Forwarded-Encrypted: i=1; AKwUvBx+F4mPHsdcovKAmYUhBB4Hs5TSlGV/rkSwhMJSeD4rjLGMTxxi+mzYs0NQhHZklb+NQG2T2ilHDavjV+4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUzuGh9CmBbjKrEFQFQXU0iQHfZ+1yLftXCsIUpp8FSpgvbJT6
	pn0pTdTLZ1wEQOM9vbUZiVO0gm+naEs0PabhFTSDCOyzaExGGeqL8aUSmgljmY4CrUtWFqQDjoY
	amCOcEqhNSOeoX4hFOxwcRxtPkUB2uRuqVybmD8wIRhOeOdHDcbGzJXe80ZPNum4ZvtA=
X-Gm-Gg: AYBFou0v+Jv31sNEgUPRpXybcJLkkuHbgHOwtZ/aUvf8r63pciKfcOYor8yM88MdAnX
	b+HcckwzXAgQyqMUG2girMsov8qCioigoD5tjKvlCdgdiwQOiKxiCpo20NkZ7F7kQ0IbL3dMxV2
	iiixx4Ng5f9d4EHaDkyZjGpmT3+lIYCN2q9w20IeacYh5qVp3YHrS28X1eFEGKG1xQzHLIttdrW
	0Mc2qfl047BaLke4GnxG8hdmbrcE8R5yqaX4o/49+enjpWvItUIOW/2WUWBrSR/tE2LxrBlg+Ig
	4VLJhHjvRbiVxKrEw0Tmh4Mq5xkKa59U4YbFFRQ0IrDkcVQR/e+wq0p4egLgZtWVz2h3XOaXUXn
	PYjrBblRvn6ahwzqwYTFZtQ==
X-Received: by 2002:a05:620a:7313:10b0:939:8148:1e3d with SMTP id af79cd13be357-93f6f7f3e78mr296823385a.2.1792742789543;
        Fri, 23 Oct 2026 01:06:29 -0700 (PDT)
X-Received: by 2002:a05:620a:7313:10b0:939:8148:1e3d with SMTP id af79cd13be357-93f6f7f3e78mr296819785a.2.1792742788961;
        Fri, 23 Oct 2026 01:06:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5c4d54dsm73770766b.24.2026.10.23.01.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 01:06:27 -0700 (PDT)
Message-ID: <f3c13144-660d-49f6-9933-9d9cead006ee@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 10:06:25 +0200
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
Subject: Re: [PATCH v2 2/2] iommu/arm-smmu-qcom: Skip PRR setup on SM7250 GPU
 SMMU
To: patches@brar.si, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261023-smmu-sm7250-v2-0-8bb881ce19f5@brar.si>
 <20261023-smmu-sm7250-v2-2-8bb881ce19f5@brar.si>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023-smmu-sm7250-v2-2-8bb881ce19f5@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX7ZbnhQMQUE0Z
 RJPTJp1R4yk7aGhZ6b7fTFgf1xHvUNqFbtp9BN1fG0rSFXutyeTU4H4iAtWZCIdlcIyJbv+beGY
 95FnGalw8LLYvcIbosGCbHuaXSCDF7M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX3cjaomtDvtcq
 Mdqk64PPyx5pcBqgbPPClajWtBGnqw/YMRCZdFyeViTBpDrV6xwJrPB9f7CkrYgmunLMtLH0d9b
 MqIWYoLlVugsfKMbbY5ykNNz7b1m2xZ9KjJHvQ/wyGOhbGJTyybiX/JDAuXA9pMJqNIi5pt2YXg
 uJzQFEgee9O3a9UL5xkfkNuRIUx3VwK8VMWnKicVWdUi3rxDmNw6vfNYSk4flkWp2Zh0mNuv+nS
 RuqUwXhEqwPkUF2QMyDCXn12inZ8VXzTGbtR5OhLvvEhHHWkShR0WZIQVJdj+c3THj/MhyyKE0q
 ksQZvngN/NCqcfL3Py0B1jyQH15+mmm5SPzLmT/XYWTB14uYM/mZxPoJwWvakZQwqNyeOnxqEZ4
 WWjeqcdcgruPI1e5dvcRdf5M1RmESdDMrsYsT1AaTujV2lAsPT21y1PhSlbeoSklYOqvXfZtihG
 wjAwoW7d29mxEv8cbgw==
X-Proofpoint-GUID: 5Nx8hPw2aRwmjqn4ys1iTCxAServrA3o
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6adb1586 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=U7Z_fe4AFx8LFHQn5dUA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 5Nx8hPw2aRwmjqn4ys1iTCxAServrA3o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230032

On 10/23/26 9:54 AM, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> As on SM8250, the firmware on SM7250 resets the device when the Adreno
> SMMU PRR registers are written. This happened as soon as the first
> per-process GPU pagetable was created. Do not install the PRR
> callbacks for the SM7250 GPU SMMU either.
> 
> Tested on a OnePlus Nord (SM7250) with Vulkan.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
