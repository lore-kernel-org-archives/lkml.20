Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2184526A80
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687832; cv=none; b=e9HBFwfZjxWZo8hGKDvH6AWoqab7w66HlsuzHsoFarkKLgE8Zm7pGkSnyL+cIk37Uphw3lpjiqi8XU1FiT8TIYIcf8OjV1zFW5PjeC4Ch116AEtBxLglZrVfRkUHU3LqNAZe/Q9tVvHnXgXB+zC+lCHiNrqV2whlU8EbS/D87oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687832; c=relaxed/simple;
	bh=DKWM8SY8JjCsjQcLdsu8gES1odRtwhgfY1WI0Sx22tA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iCMAQDIMqxozXV7W8BNH2V0oc6t/HVqOBZIhRH0p3wNaMtP+exbJPOY/IEVjqmIXs5lVDy41maXlt+dnxjvJ9VzcEfMHf7fvxhnJh9tAaUubNvrgk1YcnlioiIFnrK4ybHdnpGoM3nfkdruY6oI0n9BuhGhf0xGaYKxjx/oK/aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aA+t02bo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ndt5mIGl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aA+t02bo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ndt5mIGl"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqcY51576980
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:17:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NVqNy8N/kAoNJkFDxNi1JrKf
	DmjV7xNsw6U2GUVyTV8=; b=aA+t02boDBtipwf1jH3x/YY2twAROOvzikyrzWxw
	4CWqKIfhFPJYCvRrn/ZE1bjF4rnkLoRfoHVI+iNPaBF7gR1Njgd7pKLEDnUUHl4O
	vHM+8dpRLnSPsNF+k9ybQf3ovnFWsgK7wtmXL8ZHxbXn0jC3s5xiqB9rou7zuSUC
	XMSOo5DVhWSk39DyA5UtL+uaTyjzIhHRYc10f2070eH7Bp8FMiOCYMflsHZKOB9V
	W7wPP9Edj7PfTKjCmahQxcmSOKSImY4G1rZav9Sa36CSO/S7mmzUK6cKWKaTB3vb
	srWRxAXfTcSb+zyxmEjMJ7pD6bI/x8+kdn+VCAChZY/RaA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h09x4s5fu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:17:10 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7a8a773db4eso590265137.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687829; x=1791292629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NVqNy8N/kAoNJkFDxNi1JrKfDmjV7xNsw6U2GUVyTV8=;
        b=Ndt5mIGl0GAy6gAD6VbRcBH4I3MQ7UthTFMsCcE/9xj+14EEzRp+9z5K3GAG+iAegu
         tM6NhMGzYieaeWQzSxy5QXfqRlyD6jbBWo423u0VozRisCwbyynJpjy0T0AdO6fRoeMl
         q+MZkopOoNE9/DD7mqjOqbY1LD0oqTwAChFatPcsqD7PwCcovH98sFpQbyYkElA2f7bj
         fypuBSBx/y8/y+PYMlTPBP1YAM6EWENNJMIrr/apjV+9XK2Xulk/c/7nE699WdOE50ZV
         eeOQCIWwimhGmrDpGfQe5+m8hrQoh4tuqhQSj7zoLw0YQisYI7cNfBN/9HONXU56XR0a
         18Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687829; x=1791292629;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NVqNy8N/kAoNJkFDxNi1JrKfDmjV7xNsw6U2GUVyTV8=;
        b=B6d5ygkNtvjP7GXVMSj9z+1w8X4igF0hgtrfGr1x9OX9JjGIEnAPUZJYz22h1gSdZF
         7RJLHyemRUi5iOmA9bug5qRk9R5XobWT0DMLvUFyXUr86xFgaL5y3ten3vBc4SYR8N6W
         appPzLpNIrNtbstdCGY2v61ujObqRV1+Mm2an3z3qq73Wrnsk/xRBBYfph7UytFl2RB/
         Eayp2Oe5Z6SYfrS46SKLIrVhBk3yEI+8z2AvLxng8doyo5sg4HPmPRNuqbNqnQIjO2ph
         x9upKe/iOVsjAR72raDhY5cv0L/LaQZaERa+HcVWTeWKHbCSJ/6zWRku9psBjx9HDFDd
         xasQ==
X-Forwarded-Encrypted: i=1; AKwUvBwC0gj6fQR+REPa5LRaKQxAqodlFBZsaoLInHyzwuEKU8mq19qvI+JkLAHJ2UvFvLFl0fmpuWpfDDTQaEM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfnMQTeV8jcWI+wEneDwNLMWhyHXDgmrXyViDCe4LgM0QogPJJ
	pCkeLh49bufm9Ah5LEapU6zdZf3N+RU9QYLs4HgrJFdDFiApix3sWEk6SRsweKoWsWs+c/ncILw
	DQdT27UQWLeZIr6GBipkKEIokVzBjXRMfKJ+2O5HcVsYC17fEDTkWV9Vw8R0alGQsdCU=
X-Gm-Gg: AYBFou3/DLa6tgxgVLQlgD3omEMqlyg2Ic9tryuO5EiSC23AlR3ncMVrbem/4vZg8+z
	uliUZnhW0YqYAGjwr3vIDo6aIZwzJoxEByytvnD43Aw1ql9+3DyPEuvBiYdcTNLDJvNwsXL4T4s
	GTtOFtUrmmbW66zwin0pEziixLhF+86Mo7KZ6paxNd8qJRjj222gZWR06OdN7a9aDsQKXF8m92m
	b3XVA/GNo2QMbSjlr0Ppim7qaTaj4C0xliUoDoGRCS3KQtNj5BAtiGkrMQ9zJ+9H/VokL+/Sw0L
	iwn5Wt+88Ik/Y8Re/W96xnGaJuW31Lit+OLj6JFO8U/AbPO8cKy7iR7N+pJOqLdqMqL+M2RXhjg
	BRJpBaqYKEKMqhz4=
X-Received: by 2002:a05:6102:3f4e:b0:779:5049:87b2 with SMTP id ada2fe7eead31-7b1b34d3523mr3489156137.0.1790687828846;
        Tue, 29 Sep 2026 06:17:08 -0700 (PDT)
X-Received: by 2002:a05:6102:3f4e:b0:779:5049:87b2 with SMTP id ada2fe7eead31-7b1b34d3523mr3489137137.0.1790687828182;
        Tue, 29 Sep 2026 06:17:08 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013b8f6f5sm10587355e9.10.2026.09.29.06.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:17:07 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:17:05 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH v3 03/12] arm64: dts: qcom: hamoa-pmic: Enable BCL sensor
 node
Message-ID: <gsod6i4ywwgugsu2matyz25ypdvjz4kddzddxf7atsqaet5r37@66lpgdpejq5p>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-3-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-3-f5ca00889cf7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX5tKQrQqajIRz
 EffFwN2JtZsYb+wN0/eE1NMa+RCd80M/JqsApW2szo12oHVUOu1Iqb4cre9cr04u0lYa11vIRsD
 cOA13Pdu5uoBEHiMMgIqnpMpGdxdyR0=
X-Proofpoint-GUID: RmZ8NcnkAjXt6Sz3shkDkaZ2y35Fm_Bv
X-Authority-Analysis: v=2.4 cv=I5Hw19gg c=1 sm=1 tr=0 ts=6abbba56 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=-LKvvtDxBJcjZvG-X40A:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: RmZ8NcnkAjXt6Sz3shkDkaZ2y35Fm_Bv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX90GIXyK/LYXF
 S/2g+nf5z+nupakw78Vi3PnUe56kbanPvXDv7P7Qd1XyOsq88tnSVRJN+CcQilO0wAUus72H7CN
 lqLYKvJvyDVblwN+ak0IOvX5P1hwEaJEbo+7QaOsBdyYlCqQEhukjq2Gblzy8pStArK6VdVAGK0
 mxxEaxkjfwH4pb63jrC1tUWwmqMxs4dDvAexZ8VgTzKUFDjyO9vUm/g52+e2o87mlJ3KJdp+YUk
 h8N86qwT5YzFDyBTRMYcpHwRHBvZURnfdE880qA0xuRzkm8OJ/q+cPlNBCYAFCN/03NAlkSmRWL
 KRL7notVxxzhgUO5HrlpxWDKKRblyykKUGn/6mHzHwq/EtUyD6KkKxuJfN3hawZ75MocE+lARW0
 V3KajmOqn/lgraOQAiW2xAwVVEkvCIQNRU6qyZCRWLcKE1oH0xDxmSibqkzgIklZpxoNsFsEed+
 N0mkaDfk72SnAZPNJnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

On 26-09-29 18:39:35, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for
> hamoa-pmic. The BCL monitors battery voltage and current, providing
> hardware interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
