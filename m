Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794473789;
	b=Y9c76U4Kd6afIgY+HUdhMxFmq1nsok2hvonXY5Njl4sAJe3KBjdMHRWCJVzSzt3c1cUj
	 QKf/c7hbkdaYlcDXaLNpANorhxK16Q/KVvkzXB//GcuLjyfwU6yTfFVFX1KVvmG4viGF7
	 sOZVy/9M3sWSFvmuqYw0fL0U2KXU/Gi0S+cY/4E28VzyE3lz8vY//1vAx8uiNW2qb87rT
	 sb+3pGgtNTzspz9vGkirNgeEXFdNuVOeGYw0y5Uk5Q1V3+hBTM5MU1Wwa/pPO/NR8E6cT
	 VqhPzIrzGNXjBKgduM3D46ma08ETkJF6IbPcuD4pmweat4oht0TM8S7mICCjM1iWDTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473789;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dUVtyLCTGUYG156kQ1fkWYumru+iqol7EbuNNIFYg3o=;
	b=CG4KqSpvLbxUtBoXNgtKIOzsoQ0OfkieqY5Cw5O5RPbmujuZIDGNt2gBi8j6tEyr9QtP
	 lqCVLA0NJYOIL8xgOFbAOCTvFHhErxAQYUf5AY3JEMmhjt42Lkuyzo1poFrVRZlENDUGS
	 9cI+XqdmykP+n6ntCb7xAmfkuB3TRHIidDDlkb0DPCuH9IiTMgtm2D8w7TGGGbVqS+KAx
	 0Ax27INfb/Q4phnYZiz9Go6RfawjSOgqk8/PI+4UyMwF2ABDeOVPI8MekLFDjyged1Mmo
	 zvXCAZSuZl7juniVLPYy11rwsgd/xyKS6cCY7eLZivNFgMCy1wnIDaf9cO35XHigb4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dxL+38Ni;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GYOcpOf9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6C3606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E6C3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dxL+38Ni;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GYOcpOf9
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7j2WY126333
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dUVtyLCTGUYG156kQ1fkWYumru+iqol7EbuNNIFYg3o=; b=dxL+38NiG8MbeOfn
	d6aS/acBV1QL2GM0cSBT2zvhDdgYEIyt9EU2f3iIMN1+5SC4YYfxKe22pT/21smo
	/vZuhgeiVy6ZHYe+qSNBzebYS8GepbNjSnA1Ofywm+BmCXcgjMalKwT97cwkiZp0
	5yU+v6xSGWtH6ZGX0vzl7m+lYs6469ZywnH8izxsAfV9KCzisA23ptHToE5ZKXr+
	JXCYsQrw9Yun+RlhJTUo+2eWHtCcttBUvv5nRt4wbiDufWNr8VXIxTeY0FLkfc2V
	NbGuugQQ4iaoBV5al8CwRSnaqK5Oq2a+2yUA8zDEcWWqEzi8nxJQn0X2+gsgmV3O
	huKwRg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9a08964-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:56:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-536540909e5so4411591cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794473787; x=1795078587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dUVtyLCTGUYG156kQ1fkWYumru+iqol7EbuNNIFYg3o=;
        b=GYOcpOf9uI++VBDT19ESYZanxh1dpt0eErTJk8bS3fNiR2lKvAcVNcdFSA3Lqs3lF2
         rmrnvNYmFnGoZF8c5DGl+k7QFsYuADqPqZwaklNZdC2y9QQ3ri1U4PwwNAHDR8erT1iy
         kk6mpDMkvsGh43yTkQzsr+j7eSkkf/8VJDcOcpjMwccoUwLlHSKyePpIW1noiGRvjcjF
         7nYNmwElzDoWplaPKYzXNK4f9ndDvwl/LPFehSwhR5fg9oIMFVkOYpRn7zuk6x1YmmXQ
         fKHf4kb/1JKlkwIug7eKMSC0BqhS7pw9s+IDKzQa91QR5RPOalL4+378v3dCaqkYFROB
         S76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794473787; x=1795078587;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dUVtyLCTGUYG156kQ1fkWYumru+iqol7EbuNNIFYg3o=;
        b=ZGvTXjkAB+fd8Ube/3mHFQWIqlWMpxT4cpZpDdiRVzeMej6xyf5GNc4N/MeFLsbK4p
         m8Z07H0FR72BThFiNhNbUIhIBLtm9zUXJXfxrVXyulvCzxFN9XApjKLgxmQGn+1g1Vsl
         Rw8XI7eCTSToZoHoa6YkYA4R1s0ZsamfeHCgFJPI6iCfbpCE2JFV6dlbMp1EMwIlnwRX
         Uyq748oBEq+ulCBtk8lDpZKg5PriFwJzl5GXeQIipBxHLLElt0EwjML33A6/e6ASM27j
         fRGzfx8b5WSS4t6DLmg5oV7xqnW4IqpQTvl+w/SCok0eINLLtGnfkTVerSTpXdjtKwoY
         vr0g==
X-Forwarded-Encrypted: i=1; AL+hErHHW2+D2N4a+W9pOGO7k4oXAcxJZ9XyEANHLZSS8IYRg+l6i4t5nUrU0a+n6ryEKl3Ifufgd75nq2pcRJE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Y+zexRXyiBPaMmaOIOupjYhhYghcLzeX6h8xKpsVf1VizIzMy
	+eYplsTCrDVoumPrNCUk3XWzvlbyEi4j/6RmfG/sY4Sx4YnC7JuOxbR+jA/S6M5FlV0gFRkIf2a
	1/mgKk+NWsj5Lj4mi6/YwTji3bqMpXBd+g30+dVF47+tfOHS1rFg+VEEZ0+vRi1gdWLo=
X-Gm-Gg: AYBFou34UCvbQ6eUNxy5YS4cUElNP3ewqTbaqqvPZmeP2CXQBZR3QUA5DQHJ/m3RjBf
	HRTwqrh7k5wB0VgKOSySdN80h2VmQLLL2qX5Ao74MbHF7ADbGMIPi8QNAeD8IjC/6Fxhzx1JP00
	M15ROatcFB0SMYVuMmjOfb2osir5vT8PuwEsNyUhqVoU/GgrPk3vymrsEJQiGr+BunbKaTrX8GX
	cv5IQ2/5+lFJcIKsrEejHCG8hY2CqBVNnzy9mfyPzsN0i90otzBCr0ZIEDh+Svln01jP/3dHIa3
	6+++Szz7DhdFqZa6zFkfSqkeu4Md7sL9NeFaQOD/SnNOsyI4rHJe/LIs4ndwmBIJeyFHq1zyk2d
	kord3AnPTOK6BuLSXk2W7rEUqazpdr8jqHGoAQLfh1Xn+MxTG6fZp9kqjpoJhpJN9xc38P7s=
X-Received: by 2002:a05:622a:d0f:b0:54f:7ca7:1292 with SMTP id d75a77b69052e-556c1775341mr91984141cf.5.1794473787378;
        Thu, 12 Nov 2026 00:56:27 -0800 (PST)
X-Received: by 2002:a05:622a:d0f:b0:54f:7ca7:1292 with SMTP id d75a77b69052e-556c1775341mr91983821cf.5.1794473786802;
        Thu, 12 Nov 2026 00:56:26 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7834cdc23sm1471774a12.12.2026.11.12.00.56.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 00:56:26 -0800 (PST)
Message-ID: <141d09b6-8635-4e9b-ba50-3c5f352bf045@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 09:56:23 +0100
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
Subject: Re: [PATCH] drm/msm/a8xx: More nonctx list updates
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261110204732.531432-1-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261110204732.531432-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MYEqwRsWmYytz1on1cSo_J1o4o8yvLyy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNSBTYWx0ZWRfX5stWoP9trMGT
 qPMe/iDr9wTBx3aQ43ib1CwbbVC8PQ5yJJsxlSqA0kK6GggXMo+6hr++PSAqM/qxmugPAOq1GnZ
 iXgxee/ResBgNwWr9k/xgqoVC7PNbjptQPAMxUd4ev7Ek5XPfUhpOkiU9DIh9dUEkl9+G6klDOF
 Fdnxrv3EE6itzPoREarW6Dbfjr8NAZIOAaSl6PK00kON5nIF+v4mswSrokV+67bWoxwf6oTbFlU
 xYGJzXA6JimmhhdD53eaVGbOW9kBZ0n0nv2z/s5QkBb0ppQ+SyR8GP1fhj9duqQ/DvxJhFCvCT2
 aaErWA8NxNWkLJDV8uLHqLqTHihZ4SS19ZUvXsvHyypss+RJ1pP6seXu/iVIC5KNwATZYEWpW42
 emJqKDTWkd2+qbUNKVqglAT6V8qgW/6+awE/8E7P/GoapE4cqKMhO4Tszqmfa2AaDhXj1pDxw3L
 mqQKK/CsrLSBmr2OP1g==
X-Proofpoint-ORIG-GUID: MYEqwRsWmYytz1on1cSo_J1o4o8yvLyy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNSBTYWx0ZWRfX1ZWOhJGCos2g
 EAGOTbfCBnQ/1tgBAdJkO8fT0Jpak+KlGi+zjxshyoa8YHaGxukwZYyFwygnp/9ryli2tSqX/3Y
 jEHL0tWXZP01bgbQm3Ldr9LOjjSN5ys=
X-Authority-Analysis: v=2.4 cv=COG/zhrD c=1 sm=1 tr=0 ts=6af57f3c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=aXd3jGBJYShpFBMRRZUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120035

On 11/10/26 9:47 PM, Rob Clark wrote:
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Any dependencies on mesa changes?

Konrad
