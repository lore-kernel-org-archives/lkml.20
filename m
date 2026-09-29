Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C927543499F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690108; cv=none; b=QC48Cqb7IPCAg+O1ZGdaqCc0+Rdz0q08z1NZG3oMD5ADWdddyexfzVL85+QM+KP5gGG9v71EOcHax4UEChKiAL+jCAH/OyjKROhfkcEzz5LK5BQ53y26jhuDbKOu+rFXecpzmP54sp0Z5NtTabdXMURKOBo6nvO1/I6Rrdqowhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690108; c=relaxed/simple;
	bh=E6VXpq+qZYhv8tNTG9AR+0gEd0oGtsHCFPhCgKyyYsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YZKZ7n3CcerDDB0VNaU61uDyd9UP0WR+sg3Lq2gNbE1C2IBM3I2wxgBI7OjGlaFHZOMVj6RugErHZxpj3nMGOSnu8oED6znZasfYR7mNLW4fPV7GQ9rWDNPiE0gZg0fRjfGB7rZXSUFfzRYuxTAqTFKCbo6GDrAoJ49oW6fcnX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F2X3ibjp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XP0wovkA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F2X3ibjp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XP0wovkA"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqsi81577907
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:55:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TBpZuxpAB/NHE21T+jwIIT0IiDN/7w0EffTqxQ3ZtAQ=; b=F2X3ibjpwHeKsvqR
	QnZpDC274JVHIHnuDE77d/hub77UkWSpJBxKivaemAs0oRjH4AHwkmZR5J2Yrx1N
	Q02efD1KBucNc7QMwPftugSkQ+MjpWIA4lL7/TZtk94QBKHSUC4BTaXaDKYpkfj8
	kly/ktqpcAehUdEoRU3AUlQVOOtoP9IskBv9KqbOYkwl5kkH6XNJ1LWvi+JfqPby
	4ANR7PqoC/wH2q1ZsvZyzO7YVuT/TEm1ghgwKTBwE3xJSknTICd6Cy8W5H9i8onU
	TQLO6jyLOY3/1MeYCjoJd11TF7lTr6A58UuvUOwkq1Iui5IXb8JvvBy9iIBZgh1q
	iIb4Hw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h09x4sb62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:55:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93c5d6c3b21so77783385a.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790690103; x=1791294903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TBpZuxpAB/NHE21T+jwIIT0IiDN/7w0EffTqxQ3ZtAQ=;
        b=XP0wovkAHwywF4w+5A6bn8nD88vzEYlHfaqAdxHxA2soCSXwggLRy3xWRQeT/+gLRm
         dcgKmQqtkqGb5f1n4wFvbtZq/DNTpubMJDVGCxbfmA0eTQbNNzve4oI/EDtYoS9lqYe5
         J12BMb19+2/Y8mMibM2ebE6xG+14IrGRkLhhpnCwNvARihoRzzaLaHvqpqNJHwlvHKLU
         u2upSKzRFMJBdRliTGqi9eBarTYpHWqynvBm81rJ11fci8FUVZ5MAwvpDFNItMmT38DT
         Mu0a+2TlON6RKnQGaSN8LHgXOM7KkLxjmnr6oyj+kazvTURX7QogzY/KlZpwfuIbYxvQ
         vZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790690103; x=1791294903;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TBpZuxpAB/NHE21T+jwIIT0IiDN/7w0EffTqxQ3ZtAQ=;
        b=hCTBtBTE9+e4cuWr0/PkY9nq7VdR/KpT1u0/8GYKV0IgAMnUB3q9xBx5RILT2MCqol
         ZNICANC+mYk2Z8MaIkAddgsg9ZHYkfk78hmfqba4wL41cozVergE8cJMPmAtMbbR/Rr+
         koscc3OOt93i0LB32MXx3+5TANpwyenThW0F1Nxhm2cSthuKeCd7Nv/HBefmpcI/+fhB
         ye+vrWYBqqppd5j6SRtwKScgTEd4pMl4NfmZM9Qq3sqocSRPTcExxN79Zv1a8ai8blww
         mxbbPH/aNSrKdEnr5SDckqEe0oH8P5H+OAHcCyAqDJA455gxDoB8X5PeQ9PEFqDNWOuT
         fTKg==
X-Forwarded-Encrypted: i=1; AKwUvBw1s866UQ3THhARwBkNoF9wWOtP8IaizOHDaCtXRt0WrlNHVtZIG4YNpL91VFqdU/IyysKz9ZHcY/XmDts=@vger.kernel.org
X-Gm-Message-State: AFuF++nmaKkpDFYxXF1EEEgp4siY9rr9XufwJWb7vQT2GlpIt72YZbo6
	l+RqqGJIX1dogZqQWneERgBUlLEkQPZa3IOZ9qv7fiv/V83pQvlyWwoTz2bS7fNutowz0Hjc/VN
	cTktJT4et2tzu+hcgVWXYz6oVRIvGqjFG6U2tQOxgsWTSVvz4WIOdX05Z5swCa+MrFG4=
X-Gm-Gg: AYBFou2qT7hE2ybsS/Q+8cHdmEbgKPxYG50c4dAl/K3FHQ3XzvoekVvf6x7ZNk/Q3Dd
	exOv2URNifq0bAUEzwFDVtuOywfbhIyC6QaaYxGBFfAQ8y05X3/WphZGuZ/HT1yLDmWk4ovJQ8h
	LRNdC7jO8QQ2jZDfZyddxSAYF02fDc1Nu+k10v8CKKmKc37glLs5W/eGu9KfuSz23OmwLea5T2m
	8wn/5YDdwpimJ6CQgOs38I4yxSStNcqIwnB0SpR9pnfv4Mislte8Uf2zGtWA7c1GIWdBzQ7G1Fi
	4GlutO41OXda5Y6iy8K6uBYxQy87R0JgsWs++l7KpUaQUMVJoNcIaiBFqs3TzCxZxMpuxFm/69N
	QPnFIji7kDGHspb6zKB8P3w==
X-Received: by 2002:a05:620a:4503:b0:939:8148:1e3d with SMTP id af79cd13be357-93c43bd1bb0mr2533928385a.2.1790690103033;
        Tue, 29 Sep 2026 06:55:03 -0700 (PDT)
X-Received: by 2002:a05:620a:4503:b0:939:8148:1e3d with SMTP id af79cd13be357-93c43bd1bb0mr2533924285a.2.1790690102568;
        Tue, 29 Sep 2026 06:55:02 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a64c2fa412sm41413991fa.22.2026.09.29.06.54.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 06:55:01 -0700 (PDT)
Message-ID: <9a1e7a4c-3a9b-4233-ab4e-93a9878dfa34@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 15:54:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: shikra-iqs-som: Correct PM8150 L10
 voltage range
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>
References: <20260929-fix_l10_max-v2-1-2fccd87115e7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260929-fix_l10_max-v2-1-2fccd87115e7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1NSBTYWx0ZWRfX88WJKduKyjRh
 q7dhJLufCumOQdbFT8qQkJNdLIfzKi57RrFEKR2PIhUshkDL7gVBcCFGo17v7cYShD7JxlEl4wo
 eoDpjPDfXNS6F1MehvlyrtGoi3LyCbM=
X-Proofpoint-GUID: 9X5NJ7ZzC51uxjVp-Ohh2XH7vEQq8ZMa
X-Authority-Analysis: v=2.4 cv=I5Hw19gg c=1 sm=1 tr=0 ts=6abbc338 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=NkAsgdMbsgjDGuKY8CEA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 9X5NJ7ZzC51uxjVp-Ohh2XH7vEQq8ZMa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1NSBTYWx0ZWRfX6vYxlf0wdPoq
 nUuqh3h+t3k9DfpX2DR0oAK+RgNsZywee98ZwQ47KxwF9xRNx07NExuL0wpeOSwgbjyxvYCiiqx
 mL29ryCErpDPaHmX5q+YVRIEXdFvYGoiVoxFGM7YfRyNujwfBoNK43SQZt6xl6LfDhJHQM/1YuR
 BoAbwDJPq8lf6iuEhE4Gnx37nHdFeiMzMXaZinWdVHFigH/R8Kg/PJAb4dgxZzfF+Y66M/Voq8n
 91u4T+s8fzdCrdIrWhZuu4EWVHJOTaeY2JF0wBMp3kt9/PTOpfShx2CxETxElVSJl7PBakRUaGr
 MFUyI4f/hginbbHU7ZlakffqlZ1GhAo9UOgspq0Wsm3pnRX7ILf9nCqQsunS4wTCZ5r7QdTKtGF
 FbF7ER2soFwtELSjgwOGLXDpq805uwiysLxv02vXULfFjim6AKH09o9rq+gjzg4xXGRZsqyc2Bh
 /pk8IOFEtJ4jQAr38SA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290055

On 9/29/26 10:35 AM, Rakesh Kota wrote:
> On Shikra IQS, the L10 rail supplies the SD card's VMMC. Its maximum
> voltage must be limited to 3.3 V because the derived VQMMC voltage on
> L2 supports up to approximately 3.3 V. Allowing VMMC to reach 3.544 V
> can drive VQMMC beyond its supported range, potentially causing SD
> bus bit errors and resulting in the voltage negotiation failure:
> 
> l2: unsupportable voltage range: 3500000-3296000uV
> 
> Reducing L10's maximum voltage to 3.3 V keeps both rails within their
> supported operating ranges.
> 
> Co-developed-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
> Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
