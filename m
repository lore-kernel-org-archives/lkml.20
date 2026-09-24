Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38F93A9630
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790229683; cv=none; b=CzhSjYMai3amdL1hHQIHH5FWRGF6wGof6DQ+2ccX6M1KS4SQ1SgJX2hWXejDoyGcWROGD3JYnjlgOl0QTbZdmTs4A0HP4rYZ+duZ5H4wluyWQTZSHa9bPu07+E5l3GTLyDWE2dy5QGsqPPi9nilEAVztWLtNMtkxUm5NvfuAw1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790229683; c=relaxed/simple;
	bh=sZH0RG9xYYcnMn17IqWz91Mvah4dkJO5Tvq7b04DPUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a50c+F7UnBugWtxQFaLKl/Z9vwhk3Y/SNRrVf2HmS0fSrmOEGCSdS67E8D5C3Ml29tGH69P58C+DiaJE+lVb/RYIviDNOzkiB56vxY8dKuW93dLYSqe66B/yCH2M4uxY08Bi+h6HPauPZn8Juf9At7waKH1U5FOAPCam2kIJHZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OyPyZurN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JoFx6YLa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OyPyZurN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JoFx6YLa"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eP4m582533
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	36SCu595fBrAhzUja5qO5b1ec1y+vrmrZIti2coMSts=; b=OyPyZurNVLfEgYX7
	baIy/TY8ui3COJ1XpoQJJjMyEFxEU0uoY9zx8zNH7KrXnIqBe/eRJISRLj6O0WbB
	HdwfGHemPvsozsij7TzrIX3gLVFq6OQ778FFMReSHE1Hb1sgdrNg6YuVy9G40x9X
	uaD9A8gVSAZCdU124e1z2QlxNKehVEt99yXwdBS2UsCuyalZAjFnIImc72x68Ud0
	xP6J2qQQmnHBZa6KGB5MUfr7KRISJ9LMnzXbRpaDsSORs+2G+esEvtFzVXf17Vxz
	7SrjtHMYLC1Pt3tJgfGJYc+4LwFSz789AQQ1pI54Rr8ZJWORaYDzttrsSr9PEoBX
	nLa8zg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfmwkgg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:01:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbf293831so2544476a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790229679; x=1790834479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=36SCu595fBrAhzUja5qO5b1ec1y+vrmrZIti2coMSts=;
        b=JoFx6YLaJxvXKHMwbjYfxIoCwQRIogeH5KErtAS2mIPf8wtMHhGBgKIPSfY60pEiP5
         TWlGARlnK5Xaws9Zo/wq7/c8Rg3YKXwxX4EIaBMRc3Wox4ib2F21SujGv5Z4kyvs3kxn
         x4uZmoDj5tPjUbXZMZ1QZNXLsLCsLxaGNeIT184wNtlwzcR7R4KBkFzFzqSrBCOszXKU
         vEo3CBfmRQxfgE33z5XAaDHgk36Xom9CqEn6wCVOyYbEIisAmtb3Gnae49PnrBU/ZffA
         9DPf1PuVsIu6KObIpvZMfMO+90w6w1RQAu2Hs3Tt+In8CpaacsPRBpY9vHlmxtjhn6J+
         Ajzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790229679; x=1790834479;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=36SCu595fBrAhzUja5qO5b1ec1y+vrmrZIti2coMSts=;
        b=VcsgYVt90PNhLnSfBGkquGAAyJe+wKzTxSzzXdYz90WKkDb0flr/tDPCz3v6gHy85N
         B4te+5x/0Lf5GB7bfMla26WMhZdg2g2JRhC9Rr6InISSWt2aFuEhwJAsvPW5KW00xPiO
         rrkarBTyn1EKAn8joAX3DolJsIFelvdsZ72KQnwQLqIXxcWYFfcDoozGTtrCQo3aQk9F
         KLYajr9DwGQqzdD4Ih857nAVRXQC28GJZLRn9riF1jVCcrRqIH8xI0m93mzdz2uiqzFB
         a4Z/+spJxAkVS93ZiNIYdksehxmtWqLgV5wQNuAEXdwPfRCVb5Gh3IBJhcXGyJ+EAHYd
         i+6g==
X-Forwarded-Encrypted: i=1; AKwUvBxIrwqmAYiP2oc9/B7dEZO7lqVRznuezZv6bUo+dCA8YUUUwAL1DFxLcDGKsvk1WCIlSBQfGYwOFSy9nRQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n8L9GfGtnaEbJOkY7124mQH6+WSfj4E4//D8Bgn0rlvarNLO/V
	mdBGZfhawgtS/PK3QOKcTn00IUoEOzKv+zCh01iyHWWWg6MPQd9yRYZJi/U+XBD9DMiiIeNIq8S
	KuXDgeC8uMSgpDBJPMwaFqoNbelR9+CvReS7vSWiV0j+Yz/MYrp3FIW/cDtALdD9EY4U=
X-Gm-Gg: AYBFou0m1RAyELS//bMvSxj7aaP8b+gE2mImHJBdMcyM3KNjj9/QxwwWJf0zH2xcvYM
	3U6R7IN3kCVrV4RwNPWWuAvXb8dVQWI5ZYgA+6+vCs07ujYmjfuVRg2lwZExAA/pSOHnqsNb1/E
	hL1RRkC+frXZIeg7Xq25yC+yYQra66zsLmOisIQmM1S2qJMZuPD68l3BvkSf6d68Hw2gopmZUDD
	HTutiggCBeb6Ee5klQn7522bfw0MW0n8XcGSuNUdLbxkN7enn/+kRFgaqe2TGvzXwKXgDQ2sMHw
	xgx6t7qPg1dMhMTuKuyTjuoS9oxTNgkI2PBy0TciE103+qN4FJeLynBCam8i6MBJvL8BnetN8Mz
	YXru0gMEaFKdnNqmZXE4sgmAg2fA=
X-Received: by 2002:a17:90b:3c0e:b0:39e:4c81:6c95 with SMTP id 98e67ed59e1d1-3a098dbb040mr1336685a91.27.1790229679563;
        Wed, 23 Sep 2026 23:01:19 -0700 (PDT)
X-Received: by 2002:a17:90b:3c0e:b0:39e:4c81:6c95 with SMTP id 98e67ed59e1d1-3a098dbb040mr1336662a91.27.1790229679096;
        Wed, 23 Sep 2026 23:01:19 -0700 (PDT)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a09733f48fsm2861152a91.11.2026.09.23.23.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 23:01:18 -0700 (PDT)
Message-ID: <233a246c-1cb0-42d2-b752-aaa208e1ffe4@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 11:31:11 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 05/15] media: qcom: camss: Add Hawi compatible camss
 driver
To: Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
 <-SfKe1h9v_GKikJ1GpSP9vCzngJ7rE-jLyFCc419KBCuxpKK_kH33Xd65VtCIyoH80D_SMZP306pJZ7aKnpxdw==@protonmail.internalid>
 <20260923-hawi-maili-camss-v1-5-cbbb42e534ef@oss.qualcomm.com>
 <df6d93bc-b0c1-489f-9ca2-7de4d355ceb6@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <df6d93bc-b0c1-489f-9ca2-7de4d355ceb6@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAyNSBTYWx0ZWRfXyI5Aoqd3R8Ns
 dyQ7cyeAjVI9ttorPYedSXQcJx1red8DjIikCCAsK3fdsplP/xe+UL488b8bOsx0LIu7CETIqFV
 8M8ckdeG/Un6buRXEX1jE2Q4ng//STomEqvCw+wpuHudwqQJnt7kPSzXn5Lm0TBT/a92dE32qaU
 t+NqWE9qs0xAsrt0l2LWmS/mUduhfeHCTgJDXLsIkHpncsVa2mAGH+6kAHZ6JcF0JurWjj+1Yv7
 b36ki227OrnhNz0GqVBPNjv9kkl94jnss51gWTWtKODMTjzaO3w+jiJbwQTCCIX9LAZuMM+yu5/
 izApDGwCWXwJ2Cg6TyzM2UM+lMedouRLU7r6apQoUrMqBSCOwLw2j7wPeLEgDjtXDVeD3pttxHD
 Ez8a8aod8w8uUuJU1toBb7BStHrlujF7hqfFaCKuocf4TIGpRqBkLitUKBea7dlbaVm+KrjJU3P
 VjZRAp6Wy37glvMkR1w==
X-Authority-Analysis: v=2.4 cv=WK/qzXsR c=1 sm=1 tr=0 ts=6ab4bcb0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=1yR11Y51etnruO7JmzUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAyNSBTYWx0ZWRfX6Apgyp1YLGJf
 RoOl4exoJYJ1RItXTyPWU2itKKcvkn/siaSyNRXNoVUQeSpSDAt2QUQ7MsNfiNIrMRfFMsD8fSa
 0z3zvqPaWrIvdJMS+Hws+aFmivzGitQ=
X-Proofpoint-ORIG-GUID: xoV92EpnO2gihMOqpiuByR-Ybk96s-mZ
X-Proofpoint-GUID: xoV92EpnO2gihMOqpiuByR-Ybk96s-mZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240025



On 23-09-2026 18:00, Bryan O'Donoghue wrote:
>> Add support for Hawi in the camss driver. Hawi reuses the CSIPHY
>> resource table from Kaanapali and the TPG resource table from
>> X1E80100. The CSID and VFE resource tables are Hawi-specific.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> 
> Missing Co-Developed-by:
> 
Co-developed-by: is for authorship only (submitting-patches.rst). I didn't co-write this patch —
Signed-off-by: alone is correct here.

For patches where I actually co-authored the code, I've already added the Co-developed-by: tag.

>> --- 
...
>> +                { 0 } },
>> +        .reg = { "vfe0" },
>> +        .interrupt = { "vfe0" },
>> +        .vfe = {
>> +            .line_num = 3,
>> +            .is_lite = false,
> 
> You should only have to set is_lite = true when it is true.
> 
ACK

>> +            .reg_update_after_csid_config = true,
>> +            .has_pd = true,
>> +            .pd_name = "ife0",
>> +            .hw_ops = &vfe_ops_gen4,
>> +            .formats_rdi = &vfe_formats_rdi_845,
>> +            .formats_pix = &vfe_formats_pix_845
>> +        }
>> +    },
>> +    /* VFE1 - TFE Full */ 
---
Regards,
Nihal Kumar Gupta
