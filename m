Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB7C43C047
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790022507; cv=none; b=PW8KMV1PYjddleZSikuw5pzw555mfrmaAl1NhPd/Jdohn35MTEBU8lTHHTE8p2LUtpz6A1WcLSwWyRxUKKDvnKzqU3PyPDBuhTShoXvrhDEUhB6/qbdNY3wOK8j5mZzBpr3rMGSez28TeVobHlXJGVtIfGMnBYAhCcUZRkUmAlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790022507; c=relaxed/simple;
	bh=eFvMaJSP9NxzdmA5FpGFNUYIPQE1wmkjcWoOgddyaEw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=HmkmRdD2KojMhI81Ysp3Ug5Oo6qzFqMFZ6pv28oy3e32gKmY1fqUR2Rw0MY6s1BxkuoREd+BSn8pNe2qrO/VysTalYWMVwR2aUy+wxhVlIts0ibYTBGR4waUNCDs3aeVLjdxj+lAV+PomkNwJwCidM4h59vHqkOv1LfeKFDvtFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jH4Ft6Tm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HlFz2tdJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jH4Ft6Tm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HlFz2tdJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LG77B7351677
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lUxMPqFTkctfTM0ny6G3bUl1Gi6PHwngLAZs5CaMeMI=; b=jH4Ft6TmxNUtpqz3
	GFzeyGCZQLrHj2pW+G4INc88sXK8cm36ZPUPS5XFm4mv7IqOeGooKJr9bsDHli1o
	GZ0MslftByyfTEmaquzDtVWs+nf3NhbAoRr/2iSByYgajXyXEw3TtgFHR4qyxNeL
	WUSAo5QyQVRwgOIUJI8vU01W8GTuroNzrExRD2NtwNttTLopFXuHCm8H0VmR3t4a
	NkKRglJm0AIfmzVgdKhudJZUU998774x2dE31/PFrKGEksBYA1vu1h+x08mVcKbX
	TfjMD0qsn82xfc16IXgSsbP1Q+vfkr3Wu8ll38FhM3wVKi0XyTe6gegc2QQt9PZN
	76Umcw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu7tsh2jk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:28:24 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c89704da8c7so4581818a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790022493; x=1790627293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lUxMPqFTkctfTM0ny6G3bUl1Gi6PHwngLAZs5CaMeMI=;
        b=HlFz2tdJCc8aTBWBhH/1UjBlf1SlDefpbXdtga9ogcg++xV7ZJxg5bKFuO91g/mLHT
         SjZP+fbsbXzaemXXtRfpLXcR5e6URXwRn8oJb50orYN+hpojlTyjalJMF2ULl50duugP
         opCNwt2Oe5VbbDbGU0fgiyOw1eHX9CaDxxFo0H9/G0y+U5pfs8hIZw1xrXhuod6XxNlT
         rJvGcbKa9ogvPYzddxnVswzwRZem4Kdjq34p/GO3srxZvNyp5x6tlBoBCKw2mAH0Hn8M
         U1CI+14Xq/ZCS3j3UTTb2XQsX0+WqGxJXUbFjVgtH8ZDhRLAFkBgzlsqmj+YNWJQtdNp
         TFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790022493; x=1790627293;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lUxMPqFTkctfTM0ny6G3bUl1Gi6PHwngLAZs5CaMeMI=;
        b=TYLko/OeJJS4Sl9Hly/w+tyCCg7F6R1OXbctVxbJgTDbpxW0eyySGK6q1DjQONP6/Y
         TC7eAXZP6FgPAjZPT+HUh6xn/ZraLcoqcmBX1OYAiy1QUK6PRgmog4+meRsWLaiYXRyA
         rMoh4pi7KoC8Mve97izYo16b79JGe8wyStDxTRzUrce5pVjAFa3fj5+U8nkOftDXfmoh
         lXzdeWkv+PFH+TcB4T04FqJNFc53Aygr3gsN4uBxkmpQn42fyGv6ez4oetwN993BO9XS
         TmEzsWykL3SeBHI7DJ8+ZiS1+NK3r9cIgf2BkZX7NgoqJM00DCfGlmj4ss+IP2hhb8Z/
         vCIw==
X-Forwarded-Encrypted: i=1; AKwUvByCnB3E24KI1KEPbr0rQvexx5QaYn7RkPQq719w2mYm255JptkUEIErR+caZ+MVuSP917u3Q6FsSwuTZ9o=@vger.kernel.org
X-Gm-Message-State: AFuF++kAa+EfguImIwz9PQRemiq6pXY1cH88CRyTONojXesSnw92QdVD
	E7hnLdQpQZ9U1N3oOBnSy4Ea5ZYwu30dWaqFtnTe2k5wUWMbzS8bfnBQsJCy5FID/tKz2Tu2On9
	NsMQe1s00jENpIW1Xbj7sbe3Xr9Fwq9QqO/Sx7Ol3icHn6VwJEOEmJVzGN8bGWKMf0LfEwy+FzX
	k7Bw==
X-Gm-Gg: AYBFou3iba7UTKQPOeTaSs/W9zbi/pKHnh3sOETPXx9XI49q6ixV5+CQo64BRc2KFkx
	eamNqlNFwII1a2BW1rX1y82ST6G92h5wtNyD8iMmHqA8rcjhQ3ylPxrRMsfkCeCeGe2bBxQ/AmV
	I61jfZTCAzCImLTOESscy3M0O7I7vvru1sUU51gfzGh05uD92zami/QcVTpxC/Xwzw4Jy/j3YRt
	uTLQaBYNllCBHWi/6q74q2x+Jl+7LKoXN2Vt6zvnJlrUNgZe/b3x4gzDc6WPalduW2kX6eCs1Qy
	RW9lmBpTuNNnhB0GikFVTTYxttBYn9+Ei2iN6czWrxrN0texjOubx+so3ekdza3WackJAdtk3Xw
	xlRNjwNTBkspsRCaN8wiTPaWGb1YKdR1E
X-Received: by 2002:a05:6a21:1b81:b0:3dd:a196:5395 with SMTP id adf61e73a8af0-3dda1965403mr11871511637.55.1790022492691;
        Mon, 21 Sep 2026 13:28:12 -0700 (PDT)
X-Received: by 2002:a05:6a21:1b81:b0:3dd:a196:5395 with SMTP id adf61e73a8af0-3dda1965403mr11871484637.55.1790022492079;
        Mon, 21 Sep 2026 13:28:12 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.229.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5eba13f5sm396926eec.10.2026.09.21.13.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 13:28:11 -0700 (PDT)
Message-ID: <c9c9c069-d8e8-4921-8007-6c6386c8da7c@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 01:58:05 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: i3c: Add support for Qualcomm I3C
 controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Frank.Li@nxp.com, wsa+renesas@sang-engineering.com,
        alok.a.tiwari@oracle.com
Cc: andersson@kernel.org, konradybcio@kernel.org
References: <20250701071852.2107800-1-mukesh.savaliya@oss.qualcomm.com>
 <20250701071852.2107800-2-mukesh.savaliya@oss.qualcomm.com>
 <ce888443-c86e-4353-a4e1-64f2cc62604a@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ce888443-c86e-4353-a4e1-64f2cc62604a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wT-83CacevjMh3GqBSGyMBiDumXgvp7a
X-Authority-Analysis: v=2.4 cv=aqgnmiZV c=1 sm=1 tr=0 ts=6ab19368 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=LKvw4eQ66EqDTtCUdPbf+g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=lq1buquVkbxOhH_QKIUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI5NyBTYWx0ZWRfX8hHwbYLRG6St
 aFiveK28Br8i/M8TUIK53/O794ALm3gyZkhwExTmh1pYwblhqG5cfl3yjd3uLSWrccMgJoTZaof
 QUyToFdkHr0tBZljbrYrWiO2DGDKVcA=
X-Proofpoint-GUID: wT-83CacevjMh3GqBSGyMBiDumXgvp7a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI5NyBTYWx0ZWRfX09U4tyEd0n1H
 bH8Xn8wHi7H6XusahWbi/sHRBGoG2duJUkM8/ptQTX7Xpdyw6qMGS9R6koSb22mr6fxPsPIb3BJ
 DUhVmkRKjWRS75HaDQX68o9pJf9j4nrDU37XaXW+SuZhxFXZYrKEbwkeigwkJsYe9XEAs1XGNj2
 +29ybcz2NhUwmyfTNxGmZHUlm76muVGbjHMAJZlvcHgkRlqJHnpap/bfBxI78MG6TPDHy7Swk0y
 YsD+FG0KbO/8VnjWNeSVTuorpxt0kEYhRCeJwFJA56sE4jWMz8+6dQ2XUmbwxmSuY6a1CfiSvcY
 gp+xL9tt8OOlF+0tj2VtXNTFtoyCSObBk1a+zTtiInXs3uXXQSBQUHIhAHp4Uy90BYpimMEnzRn
 lc7151lhVnz7tM28e2N5lw5isFunw4DECVZE7xTF79BNkZjqEdS/oO0tQi9s8emIc/ZcM4U9+aq
 1SMlOw6cBOk1b732Ieg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210297

Hi Konrad, Apologies for the delayed response. I was waiting to verify 
the changes and ensure all the suggested updates were properly 
incorporated. The effort was further delayed due to some slave-side 
setup issues.

I have now addressed and validated all the suggested changes except one, 
which I have responded to separately below.

On 7/18/2025 2:21 AM, Konrad Dybcio wrote:
> On 7/1/25 9:18 AM, Mukesh Kumar Savaliya wrote:
>> Add device tree bindings for the Qualcomm I3C controller. This includes
>> the necessary documentation and properties required to describe the
>> hardware in the device tree.
>>
>> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> ---
> 
> [...]
> 
>> +properties:
>> +  compatible:
>> +    const: qcom,geni-i3c
>> +
>> +  reg:
>> +    maxItems: 1
> 
> In another patchset, you expanded 'reg', can you coalesce that change
> into here, so that we don't have to worry about backwards compat?
> 
Do you mean as below ?
reg:
   minItems: 1
   maxItems: 2

I did it earlier to add support of IBI feature, but i plan to do it 
later. Right now, i only want to add plain i3c controller support 
without IBI hence.

I shall add expanded reg while adding i3c support. For now, its not 
required. Please let me know if this is fine for now.

> Konrad

