Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556334;
	b=eqSOydba0M4jyZ2rsOECUiSHpCXx2gk3qBirIPt8hc8yppTya8kObPq1t40aVuNusUQ1
	 6/6IjoIMZU2vJuljH5lHIPmYbu3J0WpNmD6gmWZQD24qky3201mM4Q4Evg1s8ijrT2jpA
	 marvZVACTYkMK8Yed47/xPOw/DOw+cpdiaaAFo9qkUk93A6j2mxR+Ah2zyj6dhfuVP5Qe
	 +KMtCKfBVqCRe+I5YPmfyQD6OgEDPRFY18cWeDUXghzSkicY3AJKuPVa7OSireNLxnHNb
	 PGj5CR/SJhcUMa8OCOiZtoKqHJQBt6ZPLK2135ccNbbCD0aZrPCGHFl2CilAyUAzDCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556334;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rCXtwXCy7tgi467/K9+zFDdWPpcGwppTaUAh+YrEspg=;
	b=jCZMWs4eHInglRXqKvUjbbGhy66oMwQrOW6nxNQyeO0kTgVNIDIs4HDev0scJpkBREOv
	 /0c3DH3vqpovRuMvxrBXiDD6LCZ9+tX4rXDD88tjqVSLz6GhYNgASqhUP8J6RW8VF0OYc
	 1fF7CtI4Dl5F7ywtM8+zrtuYZEsyr9iN1GCvnA77/O360Nt4K4tlKplXLneZaKYkIsv/g
	 fNurF1yB7D6Q3cPcbs/5rLhDFxUY7n7dY9rSIartArnGomG1gyN/bUyno4JvUUgpf1NFM
	 Yb1f/rrLNR6za5nmIozQ7K/XVXLZAoz/4O++HiZoD2bxXCI0tXUhoQ8F7AO+qLYoj3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MZuOW4sg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZeMbwW9p;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18B3606A88C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:52:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E18B3606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MZuOW4sg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZeMbwW9p
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD56wim3717191
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rCXtwXCy7tgi467/K9+zFDdWPpcGwppTaUAh+YrEspg=; b=MZuOW4sg5PQHC5L2
	4VDBN9eTZKi8L74ybienDF5TNJYsIHiHGcUYzmDmJ/npqbJLtLd+yWLbWxc9qfE2
	1BnXTMbpxk4+SGrznbWAdDAzTZxA9/EQbO2GjkPP5oMgfXDW66ah6F5t3EcDnL1v
	eY15eOIMffTxDHq4/8sM8L7HrCM2KO9YreYQ1vs6t2YydhbsDYNIiEZdCo81NPeF
	+5tneyhCZWgyz/GpPSJrDyIahyK6n4lfcWwyLcqYRLKLfZI/W99PEBvAVNEVHDof
	06v7fWDexadkbKXZL25ieiexSxIowDHbmg+aNLi5UCeG3AnLGMyqz5tcMQbxwaG1
	VUaf0w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufhc7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:52:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-54e4ecd1b4cso1625041cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794556332; x=1795161132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rCXtwXCy7tgi467/K9+zFDdWPpcGwppTaUAh+YrEspg=;
        b=ZeMbwW9pA1nkAHS75gmmJ1IYp6Wu+u7m38yLOoDJ6IbLa2fS2Nj+H1AkBmAavGn852
         VQ0u2H5Gh2e+Y50DbyOQ0fh5bx9jRbyfGkm+seu1vj4VR2Z+MOzwlr6QEGgX4zoKI31X
         hzYv0/596cL63L4I6vQMHy5xe9Oph/BsHIQJz1/4G8AlxGXrWLd2NNbVll5naEIuE/YG
         gtLmdNWlTlkpnI1h+mSfE07g8DjaYHJEjAwa+Ftic8Fh5+kLmfgUUVCtpmbFrT2cYocV
         91HV12TytzsprRLcUYmYth1S/PVSdsC47FBveYUpxZmpd/tjFF67YL80b23nse4XGgIZ
         LhmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556332; x=1795161132;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rCXtwXCy7tgi467/K9+zFDdWPpcGwppTaUAh+YrEspg=;
        b=BbM4bh652aO309fU0kcWyJ5WZqsXqZ4QLQSCHLa0NTpYy/E6s1zoGY3uyi0u3BLgqt
         80p/kSt1BHtqgx25F0ZI4xEtw2y6WbQxhMYZqyEZ4o9BMRqVLCDfAl5eguOj1CbSjGcP
         CNtdImNEr73NyR/URlRYLnUtWyURJRbu0GQrVqUTCe/mrgEDhbKhu8p0UyyWpHT/yRwt
         otA0RGqdioYr1SEUFK6ja53ZaYnsRpPK8XcJygh9q9YDWzK5gg2SMVOfNGGh4eemX6Hq
         r96oMXLzcKMEWbH8tAbXnLf/9LQKcxk4BNv55oSnzzYm+V8JtumV3M84gwXUQfaLuyHc
         Xx6A==
X-Forwarded-Encrypted: i=1; AL+hErGCLi61m2kqhkX8UaH1rBnbC22RPeStqcGCg4lhi909EcDH3So0EF6/+rSIdxqft0XVb8DeRKIk0eLQBgk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7wZHCsvltUkZqwXjLz9Tpcl9KCKLZXyxb711fXmPxvismIA2D
	kQW8Ugx3aUEgBdd8MknPiDao0VVNBBoeMPGZvN0obp0sh8qlbgqsAbUSEKdB2xhNORGDH+l1PnI
	bhwYW2o6ejN8iLGLDT4i4/bcj8PY06wjYGnW9LfD9VKjjiN32Rc/OIGO4tY+lKWGHNqzmh5y/ur
	s=
X-Gm-Gg: AYBFou2DycA28LWm8aDsJMN0fxsREnu7Rs+EE4MIyHesSJ0pByoobZZUyY8t1kCZkKK
	2b2fR717BqGi3tHTEikmODIi+TJlLHNvY183Tlc8MamyyBnsO7bx5T3Or4kaNt/E387PShVxxsZ
	0PDWl5hNScLwqkZNi6sKx7ZRuIE0ug2MsYzKVE5fA5hQL8drF0CSdVPSajPy87dyKPLi++ymY0G
	aY4Sp2mfRQsHF1dn/PWIkWZa43pbdiFvqdpL89eRaTtKf4SwGKgX4bnY2QR73O4g9FQCth7iAJo
	RJRF9YwDzxq6j6AFrXZY6STAKSaU3k8sNopsomFwOsbx8hCI9UxNZmJuwW8UX3Ydl1tvRDdKHTE
	8RTPtTnRz+LeYS96veMC8Rqi5UM4fHXcyX6I56y8pkMsk3fnVYYcy/gyEiRTYqsMUZnQiaos=
X-Received: by 2002:a05:622b:1d1:10b0:552:896d:89b5 with SMTP id d75a77b69052e-55ac6b6e804mr27539371cf.3.1794556332117;
        Thu, 12 Nov 2026 23:52:12 -0800 (PST)
X-Received: by 2002:a05:622b:1d1:10b0:552:896d:89b5 with SMTP id d75a77b69052e-55ac6b6e804mr27539171cf.3.1794556331625;
        Thu, 12 Nov 2026 23:52:11 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b236a6sm61945566b.28.2026.11.12.23.52.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 23:52:10 -0800 (PST)
Message-ID: <45da00b9-c7f5-4c4a-a310-00c2ba94cf6e@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 08:52:08 +0100
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
Subject: Re: [PATCH 0/2] arm64: dts: qcom: Add MSM8996 SAW3 compatible
To: "Rob Herring (Arm)" <robh@kernel.org>, Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261112-dtbs-qcom-v1-0-1978370c7cad@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261112-dtbs-qcom-v1-0-1978370c7cad@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hauN64gLLxtejq9tOz14ptDztSlojyEY
X-Proofpoint-ORIG-GUID: hauN64gLLxtejq9tOz14ptDztSlojyEY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMSBTYWx0ZWRfXzskJuGjWSlOw
 1xXjaR41eD1YVNMHt0UN/SYC4oG9IKa0+sl0S7anVgH4W8Ej4+JZ08Q53eehmUW34ywFK7Q7hQi
 uHkO/BXuf0xBVb2SGU4Jijxi5hF6uP9x9uANEPDfAJeC7D9F4Yco0izsPjT8WMc/7sSZHsU65po
 KsaRpmzD5BTWHd3cKY/MaiMKRtmvgAI9c2539R663kmWswPsNCZvmEsPEkMvdExjCaCD0pVUp2u
 xfg3TzhVUmbLyC+7AcR6FWOixi6x8QYfX+hggTRA90Zr0klIsG4Q9hs1Hox4xq4gpwVx734p5jc
 Ng7EFVBUTjYSnjO3PbKB0j7RjHPzNAWXu8OukoWQALC+5ytNKuVZ+CQzVlxqGDsArITyOT5vu/M
 trEHVf9k9QHY/nINOjxVbpP489+Vfakz9S5QL0XF1UdnR3y9DwYfhrBCHnIhWP6tyDJaWQB+Dog
 +RoqSFAp66V1DJ4n+0A==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af6c1ad cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KM__OpKlO_rSzR-_7FQA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMSBTYWx0ZWRfX7gGu27MCoq86
 Dbf+W2K9xfjVZat03vVvjXUURIrE6XW959ihRppWeqpR7iGLiIB/Ni3OWV8XhlBgxznrVC9kefm
 ECovf8GshQu3ITHJPJR/ixtY0p02rqY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130031

On 11/12/26 9:26 PM, Rob Herring (Arm) wrote:
> 'syscon' nodes are required to have specific compatibles, but the 
> MSM8996 SAW3 nodes are lacking one. This series adds one.
> 
> The binding should be applied with the dts changes to avoid new 
> warnings.
> 
> Rob

I know this has been a thorn in our side for a long long time.

I believe +Dmitry had recently come up with some patches to describe
it "properly" - are they any different from this series, Dmitry?

Konrad
