Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631D63B05AD
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792041065; cv=none; b=NSFmcHXMRkDbjFUftXdt3fg2e4/EFc8uqEvBWHWF3NR5C1zemaW+bNFDkX/6G/Dz8d0f0Sdm4OIZ48LH3V4XRk9Q39h9fmyobL/6U9iGv3gBfQ525qp98rUus4eF5KeXXLu1Ha2gcc+Nw3qe0qjr7cGcnxGO9P/uSzuxuEfbboE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792041065; c=relaxed/simple;
	bh=sm5TwyuxMbjw2W5KMBmRQ4e5FhlMTD8LsbI3/uKdqXM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Uytj9CU+WmNr8zzq8qdR3lzh3ujmWUyQ1u+DHY98i50//DaZHW0cndacvrUGyGfIp64PdEJsQgcfZKZyeaZai//q9gdnTN0uljdJoSuljrUoLV9WVC3DS38mCZzjRzoshgIhkPnJCc+7lFFMdMwplN+K868UJZOfXvOCXLpz+xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iFiYzgo1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bz5y+WYq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iFiYzgo1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bz5y+WYq"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F00RY22121427
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:11:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jUQL9dOzv2INUxvZeNwYyMv07Pcun4iuIBhgEk/JqT4=; b=iFiYzgo1QWBlPjzE
	RtUHieRmkWw7GaqhtFp5PmLhyulxxtnaTgS3axv4hFmAxYCx1Z+b60Cq/tauSx/b
	l4qrIdg+CuM3dJo4b7EtGxSLru9SAHaIhyMMg1a+KKG2gz4TraHCnyj4LDrZkdD1
	ILCOuRj6N7vUo0uTW9TNg/YlHIy2YawQA5y0N5XuMkrX8AAUjuzHhwy5AtZiLJJh
	yqZvy9lHS0Zq2mYIhbl3N0ezwLvVZ+D9MA8N0jWprEaLpX3XBzuw//i5cFZX2jvB
	eFGdJU8quGVCL8pR2Q49z8o6nKzAyG2RJYDDqm4UxzaUBbgikoUpCOGvzytzWEL1
	89MDvw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn0x5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:11:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3aaee1fc104so6993901a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792041060; x=1792645860; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jUQL9dOzv2INUxvZeNwYyMv07Pcun4iuIBhgEk/JqT4=;
        b=Bz5y+WYqbfeGgH0N/rJcG/KWUZUfStZ8VmlbZMXs7OQsZIbdYtBH+UOXO1VQsc3hu9
         1SEamiQYmZG6553XisHMbqCLH1FnNeQbzNUoAzBLP1GaPbKp66BSUXUTkNPdKM+mEMN5
         W9K5RYr2HV7YTJ+7RuKgErrej5isYCBXJgo4HDl1Jg1kwumxlYy5VfnFZoZLsiaMBN5p
         4wpQfNiwG+gI/XYP4GcwQYXK32QXiPqzR9t0WTG+Y0DOPqyjVSQZ6Ni3Kra0t1LPtTGw
         VwgMp3Vpr3yAXKOWfpDDbPBPpayBE6u4cmgQVZpcoGy3XTGi27+osMYYDPA/iDlSs0P8
         qGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792041060; x=1792645860;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jUQL9dOzv2INUxvZeNwYyMv07Pcun4iuIBhgEk/JqT4=;
        b=KaJMBw/gk43aRjrQKAXV+a0B6wlNV1nkvZodKjZxo/HmwF/OjpKChAG3w7I+YnKsmG
         g+aXxF87R3Q7DUUJ0Et4nlfkSUEdQQIar8j/zJiDhhqXyjaMs0k2BlLqgoxtwHLUaEQu
         INqjprLlqSYsn8dRME0pb1kbOevPoqmBpl527uJVhyjl7bNd87s5JdmapiFKizl779MZ
         ZlaOsoV5zcFqfSdZIhhBoRCrovU1RAztquQShlOyKLWdm2qEzniD29HmJF4t20/fWtDg
         vz953K5+Fm+mdanHMg/xJ39qGjLZtJwBsMi8Rq/2dYoknugR8FgEqQhfZpHYoXfOWDG5
         SLCg==
X-Forwarded-Encrypted: i=1; AKwUvBx7XT3gRFbYVJg9jgJfQkk7JMXOTyxJ4XSawbi7aPxVkKtmBO4BnVpveTfzT/v0HVi2BhfY/XjNnaFZQok=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3nZjwmY7uplTBHf+4G9Cb2l45zYnT6fkNpR6bVOyZgwFT4EMI
	cux+9tDdWRKS9Ed+G4Iu0szuHs6gmv+uv02A7FZmloEgnjE5Y9FR2tLYEiujWiSC1b6W4dh6LG5
	X/j6TIzoTRi9Zk8MHj1hBPFMZjekyoHxmtRMVJICw93ItWmoJxo3MLZYYNnA13HHa+Oc=
X-Gm-Gg: AYBFou17ohyy9+NA6SrmapFdN3MUpLy6F8xrXM+IKyAUaY2vvcWo74NfTsp22dvrpq3
	RSNq4ayW+7ckPiJnCrHy97SZD059HQCv/35IbC6kDOF0+FNwlFVcYofHKFAd4Y/OqdD7/Tt11nS
	iDG/4Sm+4dYcGv6uZPUo0t0PaLL3vDPC+n9k0bZZqplX8vMCehmxPrVuCiCdjq2fVobwSZ+dvuk
	LiJiKzEfkjD+WuhlxvFdsfUYCHZ1JY/jLj7AI1lA8Xp8CRtwhyRE2uQZLa9c9FL8vjfzXPTLyqx
	tGvGjp/fVNzIef348OwNgSAyBYG6ZQcZRSAbrRP2Rbn5KMM4egvXXu0kGrTewO5FvEw/T2NjKuo
	Uz+ROWiRrsTzrCsbbJoafkqpdR/w=
X-Received: by 2002:a17:90b:3889:b0:3ac:929d:ba5c with SMTP id 98e67ed59e1d1-3ac929de508mr1843007a91.45.1792041060229;
        Wed, 14 Oct 2026 22:11:00 -0700 (PDT)
X-Received: by 2002:a17:90b:3889:b0:3ac:929d:ba5c with SMTP id 98e67ed59e1d1-3ac929de508mr1842976a91.45.1792041059761;
        Wed, 14 Oct 2026 22:10:59 -0700 (PDT)
Received: from [10.204.66.72] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac947cf9a5sm2342462a91.15.2026.10.14.22.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 22:10:59 -0700 (PDT)
Message-ID: <cda2257b-4d7c-42bc-b402-3b720ccbe7d1@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 10:40:50 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: media: Add CAMSS device for Hawi
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
References: <20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com>
 <20261013-hawi-maili-camss-v2-3-fc93222da89c@oss.qualcomm.com>
 <db980e07-adf9-464c-9fee-401581986508@linaro.org>
Content-Language: en-US
In-Reply-To: <db980e07-adf9-464c-9fee-401581986508@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyMCBTYWx0ZWRfX+RPk/h2wpVji
 aKl33uwKzf2sf3ixkzpSJCy6TE0v4Pjuf3/0s3ODwxIsGyq/X0n8gwc5nuS1Awos4hVx0rYtpud
 gIIeuHJnjEv1NCNixkq+oL2wVndZxaCrsFmhWS//NjW/q8KfowNW71iz9oTtQ7PP/bxs4TvWvo0
 yYsrIfa5NDdeNz8Da1KwqAfgSZMqnZMjNs2fPVc90cyc6cc9ia1J6UNeXqpfWHAkuTb+zomqHJ1
 TtwYrzx35mbyP84Jwji0GZzJc0w+06WEQV+x6F0zjjN4HrJSYeSXW0rlAExhAJXKoaMXBfY1w7C
 X3+lgajAaImZtS45LBetYEazSKL222NdcrPdh21LfjqdjXLGZTqsZ6VHXCJyZFx730U+uL/4uf6
 PeVxOGGKanu2N2tbK3lh13w0X8+Sb+HRZJsiZx3OLgqx9ARNQ7vZa31/7/oIdnHUA75yLUd+6P+
 WXVMoZHz3swk50GPYiQ==
X-Proofpoint-GUID: -jJBnAZu6jYn67_ezcDsQofbArihKrrO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyMCBTYWx0ZWRfX7EqxLNbA6hff
 8uHGGhgAGmbA4QKcP+Q7yxWhA5kqhXRMvxEIfIdNPWD+RWMaR9GKXRwNkGBUs2qAOdXyEVBvK21
 8IHOhhqtMOEbMNPbr6FiUQqubWsBCGc=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad06065 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=AlLrfJGOdKqvsMXHV-EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: -jJBnAZu6jYn67_ezcDsQofbArihKrrO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150020




On 14-10-2026 15:07, Bryan O'Donoghue wrote:
> On 13/10/2026 12:02, Nihal Kumar Gupta wrote:
>> +
>> +  iommus:
>> +    maxItems: 1
> 
> Just the one iommu entry ?
Yes, one IOMMU entry contains both IFE and IFE Lite.

> Please:
> 
> - Make sure its just the one
> - Include a comment to name the one in this file
ACK

-- 
Regards,
Nihal Kumar Gupta

