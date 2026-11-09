Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230317;
	b=U5hK/tlP6h0x/QMU4TH9/1tTymWPQwy1m/oDKH7qYCXxLC28ioRRK1wi5jZ5fB3Yo1Y6
	 um4yabVWGox8fEfmqI28Y0P8VoHhLeHq1Nc/OqTI/L8q9ZPAzB+ZPeCSJyhgfRbQwFGqZ
	 WtfEaCVPaWziPmCeCONUS8KamtzN/3SKn7V5jv7+URaSUePG1OPxSYlwYa17Xnx6NkYb3
	 e2OhR2uXiCTifA56lbaagol72Mq0YLpvg4bPKo9RQRHGPvx+wyPm3PIANcttCCeILTHCT
	 aKH1a11kHDnky6BUyE+wZZ4STVnkhFce/wsO/TyZZ6VxiRY5SA0FT3/r/DH7UTEw1qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230317;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=f9Ly0H2eD+VpB4ntoQnCNH5IaZ4AVMAVdM1dy+tGVBg=;
	b=NuQJnq4zTtrjy4xdhdemw5aUUcw+/UVsr2ItyjuobfwXLIQBTz6TUWwh30Q5W5o9f1EQ
	 LQbDOnv45vJwFEgLvFfGgt6DbajKh01MnBunoiCYCutnEK3IF36BQ4eJT/ACuo4tIIHb+
	 NzcY481RvrSNQTlN+hoaYmQ1cTrTCTyPpRbISuYSqqzrvU2G3CDTv7b9eKDGKcRPmV1Hm
	 QKuWTCkI9yd9M7sM5sspZChzhvnhPksVH7Sr5xk21Z95uFZqO5nUWkWI8Eda3zxrqpciS
	 hjDHeXe96fl9+CYqgtEc6toEUg+MXPwxe0K/eXDcENYFMYjvu3r+uEOVk4PfWMlFb5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PD6hAaI0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WJrJulhc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908F5606A330
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:18:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 908F5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PD6hAaI0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WJrJulhc
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DF8rQ3461074
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 13:18:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f9Ly0H2eD+VpB4ntoQnCNH5IaZ4AVMAVdM1dy+tGVBg=; b=PD6hAaI0nLrQm9uz
	XCzX7+Col9KxUfgrilTFUnFUvNpqmRvwYtuGFnEZiIuepCYs4LKA+ae1LDXy/3je
	OcN8+Gf44pc3um2q6ZOC8id8nsSyzQIouuJ5iIcVRvMZ/vbHRr3Fcycfcbon7yJ7
	jsHHjSh/gU/yRGykgvmJgCvMLCelJjghkpXI5rN6/DINd3q60Ov5SmYhxCwUeADb
	XBTD7zsQmIfmFMiFOU2nudE0Vg1mAoNrDeE+FcRM3/hfBW6qdVJQTzapG4g1lQ5l
	SQp/LKfJSGFaV2ucmVL87hPeYJIutMXOwHole6MZ3SIUd8vYXbv4oBas7W6UxLel
	vZ1E2g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0rr7ef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 13:18:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-945e8a244bfso7270885a.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794230315; x=1794835115; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f9Ly0H2eD+VpB4ntoQnCNH5IaZ4AVMAVdM1dy+tGVBg=;
        b=WJrJulhcBXRT7GyXwi84Uc/eknvHWCajm7BXtOYjZRorNnY9K1it2Z5tPuv3qRW+YO
         6bUR1+aG/Zdh7iktYHB2fyoiEiFhnquF8DDzbtbfVrqVBjutJOtWEKEJINP6cZR4JO39
         5GOXGYFjnDgejJjkhP78adWj0omjBM4gID3NfRAVHvawUvjKUtZnrZK8qoycQhMNbHfW
         EpyEtNrpF1NUvP5bu7/iBIKDWaLP/OwmAobYr3ssYOi7xsxbkwH3OqMBN0hRggPEqSBE
         oMmcFgJlX7uf1BuXgYKxspHFD+BhMRanrGd7eMiSsXC2j2EnJNXlS9EPPrDhn1re9vvY
         4iFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230315; x=1794835115;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f9Ly0H2eD+VpB4ntoQnCNH5IaZ4AVMAVdM1dy+tGVBg=;
        b=Z7hLOBf8wZOF/Pkg+ZALtDlDAeSeghW6AjpVgoZHAK4kxgFv2r6KuNoo9cfCXO0zi9
         1vLGH6IK40nm7uM1yTFG1Xwpjciy68lG7WjDVSjrFu0PdiinIQC+fJ4nzvgfNQtrgpUX
         ZWfBppv8vsfFYoOELv1FAStbrqvZXu+7GL4EBlv6GYy7NXjgS2CSWwRRYGwSPAjnB0Nf
         /CDkN/yimERKRSvfcOMTI1J327GEb2rycviEWyhQ3hEf61OBFgS25XaeuqQo+27dXJHt
         nQfrweDRFdKk0q8DZsjgCFRyJwZeR//ns3NmgEavyShmoIwbDx5KrMlJMbocJVl3QIOo
         o1BA==
X-Forwarded-Encrypted: i=1; AL+hErHBKV0qU+0ov3I0ZjBkGEPkBqraobGTA5FQHGNixn8BSX5+VeBBf1mNo0r6MW4FAgJN+BXzF3HERN2yBd8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vcMindmY7PxAIQ4zj0yjXC2biMu97Wr5AFMRGo9tVQ7wYSeCY
	4FeIRxChZt5roOcN1WaiG9HMC/H3O5bXaWowGm8lBIqwSmhjYiRSlxWPAspw3z/Tk0kSdAAeRam
	ysmaRUF2ibcRDVtObZ6ShrgV3w4jMMno9dQpPtIm98fYpYCqNsCsjZUkuEAT2l8xY1KE=
X-Gm-Gg: AYBFou0DmjpZZ2cRdJyzwU70NRey+Wbi7qDNYYkMyFq9XYxeWV2OZ8Ewj1/JD2SHlxh
	WGLTwtsXMqg3XtQcmwZNSEJOx/wXSqvnNZjQlZy2uCrFHSS5Fx/EV+1Ek79eDbrNZcZB0kNnKlI
	h9fAkAhB7Fkq/Q1uwehgdr+sfd7xQbX8Ljh3aJvCwQo7Eu3DfP699t7kwPaef1UVeNQHsFjwfRx
	8r9T7jlamqvYeuhvJY9W6o/N9uGgKGmUAVq7jL0gYk/VYzGZ0UzSyod+kuSa22RbvNlRNMqz8eL
	T1GnqL0wTokRZaSDDbrYdUUXJFvSEYXX3w89gi8INFoq3jJcy3zeYhsx11mi9iWj4OMFMP5x/WT
	lrZZa0vf1mKc9Kkvk0oY7xFOgUhxcLlsf4eagDpbBuHAzWtNsefe23ND8/th7j8JznHykFQ==
X-Received: by 2002:a05:620a:a90d:b0:945:c5b3:6356 with SMTP id af79cd13be357-94784143254mr685965085a.2.1794230314768;
        Mon, 09 Nov 2026 05:18:34 -0800 (PST)
X-Received: by 2002:a05:620a:a90d:b0:945:c5b3:6356 with SMTP id af79cd13be357-94784143254mr685958685a.2.1794230314176;
        Mon, 09 Nov 2026 05:18:34 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d69f93858sm167363866b.24.2026.11.09.05.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 05:18:33 -0800 (PST)
Message-ID: <1704850e-c461-4ba1-9a01-7fae3167bf5d@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 14:18:31 +0100
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
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Add SM8550 MDSS compatible
To: nacht@dxdmail.cc, Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261107-b4-smmu-sm8550-v1-1-777d0a41170b@dxdmail.cc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261107-b4-smmu-sm8550-v1-1-777d0a41170b@dxdmail.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RIQb0Dx4-BXMgYdCrAY6s1frbSC7XKMw
X-Authority-Analysis: v=2.4 cv=MpfHeGae c=1 sm=1 tr=0 ts=6af1c82b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=UwK4q1c8QMLSmQHnhC8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MiBTYWx0ZWRfX8rrOdTN54+JQ
 fS1gn+QnqJ/FoE89sgmFXUj1WeKUT1+g1NEwTzzQzDkD8JDMiCj36qw6ZolXGomJFaZoRgGkxz0
 GmhJmLL6RMYfoeAX+tU/yXJe3SWAxiER2tH1PAOl/prWH6YDacD4/cKB45Ip+cqi2CGwW4Qfuzw
 HWZuxYLRhzbmArz/J5l9R+neSUkslVUm8N2YWPMXkOWBBgAtAaLRYdSFF22OnBYOLoKut3rS7QS
 Yjgg0Xi/FVbV3uRfpKO8go8aQgKKjnXzZUdAjxu5BpTkMadZIZx4XaX1AW9S6PeLIoJm3mWZszX
 S3oLqJJqPIhG6iWvMOyu/82dA6fLGNV9pNTMUQ3jTehVbsKHF6I5zeG7kG2zHzAB1pWIOXJtZcC
 oI9Ki/70XuvgAHXONb/3O+MyZRNNQR5wciuSVKmCXRNqjiR60cj7wzj+iudHlJ1Yrkc7gAPz7TN
 P5ErUJje4+6I/bf2ZoQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MiBTYWx0ZWRfX3zgX8aBZ/POr
 q1jOp/muT5T/9F9qohuZKMNyZBT3eQegPMoQXG13BT6b1eQKQF8sD/fDnPiGgpxEld3vUzasKmG
 ahVkoyjOSlz18PUhB2HoWm34rR2kSts=
X-Proofpoint-ORIG-GUID: RIQb0Dx4-BXMgYdCrAY6s1frbSC7XKMw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090052

On 11/7/26 9:00 PM, Nizat Mikayilli via B4 Relay wrote:
> From: Nizat Mikayilli <nacht@dxdmail.cc>
> 
> Add the SM8550 MDSS compatible to the clients list, as it also needs an
> identity domain at boot. Otherwise the scanout of the bootloader's
> splash screen causes unhandled context faults and the screen goes
> black.
> 
> Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
