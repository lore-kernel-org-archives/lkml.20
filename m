Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190472;
	b=m+3WqZDvDXLHXILzlcaGv1rasOX7G+kZYEkIenIcY0h1eLCU5rgc2hBYoRIctnV1ekSf
	 XuIhYUe5gHfImRa3mTzgHr+eKwtejovEHAw9J+5Rmz6kD96ZqXBupdXdMRTq81CNgmtLn
	 xKRqPr8VRcXlBVgLTrX+pzD5g3Qcom8wgAUpcg24EM08jvUCiCSBKoEUnQiHlxZGDybHE
	 HuMMDRghNXc5I5A/c1/aVmXUOx/yT7MfxHnIOKQureG2iYIV8JusBrLil9XGG+lIZRlEe
	 8G4l3+QfhfwQfp7lGbf99ma4z1A8fxXr5arZg5kwOXcxLvguNGElxkzXAapxaU4bJ1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190472;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VSigMjbRxPUPU+y0wEyfEBMw1dQi5WR+SlH5DUgFnsY=;
	b=0heK3yqyfAquRVFZ8eVVngPP/5eoj3xU4pIhFtnCL9ycFara/+c8BvLfcIqDlT/RjWjW
	 ZsHUak9qJDwBnu+Osq+BpTfINFkH+83vaYj7mFiNVs1VwvLsBVPPvFffsyO3LDZtzsN6k
	 OD5ojkGFLbJuASPtZSprN4Cfa/jMbCi9XyGMle0JoZEPViU8pQvnOSVlkJVlxC9cK3HjW
	 I9HVBu77hoijtX2coc8Xn9XEeUqMPaS1JgqeOEYVtRPQPs0I/oDGyGJTHrvPLxlmC/0MG
	 Tb/MC0LKXzPd7N81EW67B0U1tuocUdZVPHSE+XVG2oDzfF99pjPaQmGndIJ1AA0qDMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nTzg8f1k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Xni/YqZW";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C503606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:27:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C503606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nTzg8f1k;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xni/YqZW
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeBud1053585
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VSigMjbRxPUPU+y0wEyfEBMw1dQi5WR+SlH5DUgFnsY=; b=nTzg8f1k4cwxhaKx
	5fu60NUzGPhHwKZW1SnkcNjFlFcn5JydUt+hiRDcvRhDGu7StCF+gzSjUBLfP2nT
	O1w8Tfb4ueSXu9PIPwHj6TuSymEjfmMZwR3acfNEiQL44XYiRTAYXMQdKC8yz++X
	ORtxSuVofP6Gp3Tda8nP/hRxrQ2HhfSkjkajIuC5SwxD9LTLaz/l30Y8+irpTGAF
	3pllMWGSTWMBXwr1cgfbu1Y+SyHq+3mp+VQS6q5zpZVP/u+Kofo8ovBMaI5I0yU8
	Z9QgZZzaifv8pUUZmS+unC49ntSZu1qins2SF21iJ5+dm2dWrK/p/xJEaC+l4S2s
	qV7E+g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhw9bwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:27:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb1091fffso12085385a.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793190470; x=1793795270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSigMjbRxPUPU+y0wEyfEBMw1dQi5WR+SlH5DUgFnsY=;
        b=Xni/YqZWlbkz34hpOf74UkWLJ0sry1b2YV+t0hCJsBVVasakAfKlXIfVeGb5r8509k
         P15D8QYwQAPCFW2ZSWAknXXFE+vXJq7Rh+RQ4xyZFjEkWaOCKZ1xV5uklUwIh6BFU+IZ
         iySB1GwMl6+Ri8XwPtHJnd/Vi2o+1zu8X3pjlFWT9GAjmHqHBTPQkt5x8qixmCq91c2N
         q92hQLH81D3KnfU458ntQxde7+cLekoM0lHCZ/Hxm6yGho97f06AXUbMyyY7G6mgvRCk
         tizEzf4DbrXwWlaxlY1fhEQFt8CFH+vct21u/KmJu01fs2b43r4wkTfVuaGKyDDLeiGS
         xSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793190470; x=1793795270;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSigMjbRxPUPU+y0wEyfEBMw1dQi5WR+SlH5DUgFnsY=;
        b=tYHm6kNmOqCD5eHlBXrZv2oWU8IIFuwnZ9frdMHsMs85VLM+Dn5X3OCZbDL6kgazxE
         xR6gg2XVAnqI++tgud7SEbpPT+gheAi3x4bBBYSySjAujj+KNQy/jlt7yg8YOrzd/fgE
         njOCdBTgY+KcO0D6bqey3415BopyFUb2X0FiLceOEKGLy0keScMRxjP/XwLGV9EqM6I4
         3zBczWlqDGt0WxX9pGcF2JPKO6d8uBnKeesqbuPAPuPzXshU5FvKWUSIWmVaw2PS0io3
         I4rs82HlMRb85wH1/zbihPwyKbP6K1OWrUlGvhSGUoak/S3/F0rMiaIN1aO9BZuZMn2c
         EmNA==
X-Forwarded-Encrypted: i=1; AKwUvBzXOJPU8tKUIq0Jgp8xXTPiy+1aKmKOAf5jKDFfRegWsEiol2bkNHjUeCglB+3dHvU/QtpamgSWJ6MT/cM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtxNIMbr0Ot9GWQyZLqZdRj4JTPpm5L4Fau/7CW0KjLEjOqXx4
	Mq1XtfHUGHM/2RJpCBewz7lcJos/cVXVPtW5vPuZ5at1py1pAE/LEgnUlsczToHknSf58CspvV+
	sReCkwhG+8IVN88h6rsNKpawyTHpzuY0LgrCqPSQq6JU6KNCig2VHsXa1QfhzJZdWJzo=
X-Gm-Gg: AYBFou21x6dHFrHBkiuoWS+TQkq2JHUx+RFtYPyeB3hbP87AHlVWHRLq7SYJSnzb4Rs
	hJ1WSXbeqJsnKwGL2xXXwpVKLHAVuW4sOGEKTPgFm3pOt9DCnrSCPAWCKEjzQFk3pv8xuU+Ro8D
	V7lNMUkkZiiGILmUYkkxU+qo+gxKCcwoDohfcsR+uC/tWOzXC6rvZvnVgH+03R6T0gJZJmz09WO
	SI9ybOMXZGMc420kNA86svJND5qEnAYYNfOcVrQKKWR3lUsq/8qCbEwfMv025xF0YTXE2hZ+gDK
	xrdc/muBaRrjxMrseYw/nDUx/AiMQ80dq96wHa4KcNuNHFFE31y4eoDTeTOiQK/2Jwb/OKRJGEZ
	I0Imlx/BClpK1DMvZbrhLLgXB8DGhhkrShWB+7C1+3rcT/frWKKXBChD6gPm/nyYyl7K5Sps=
X-Received: by 2002:a05:620a:6d4d:b0:93f:211f:7ba4 with SMTP id af79cd13be357-94408d629aamr300071285a.5.1793190469748;
        Wed, 28 Oct 2026 05:27:49 -0700 (PDT)
X-Received: by 2002:a05:620a:6d4d:b0:93f:211f:7ba4 with SMTP id af79cd13be357-94408d629aamr300065285a.5.1793190469165;
        Wed, 28 Oct 2026 05:27:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd350b52sm594839066b.7.2026.10.28.05.27.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:27:46 -0700 (PDT)
Message-ID: <b4f6fe92-6d72-4987-8b87-b66e28e4678d@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 13:27:42 +0100
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
Subject: Re: [PATCH v5 1/3] arm64: dts: qcom: glymur: Add UFS nodes
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>
References: <20261028-glymur_ufs_qcb_enablement-v5-0-09cda5e3bab3@oss.qualcomm.com>
 <20261028-glymur_ufs_qcb_enablement-v5-1-09cda5e3bab3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261028-glymur_ufs_qcb_enablement-v5-1-09cda5e3bab3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RLU-eo3BKjDgMjhhDFkyMbwEPVr7B2uN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0OSBTYWx0ZWRfX8Sw5kfVfQ5W/
 QGJZKglI4DkZPiTvxTzTeuJOy5B4KU6ELj9F8D2S3YzOxFERB1xo7Y858gRl4gAenhF6dggPj6S
 5iuJHFtmEtqMpboMFcb0QnqRfM/XLpo=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae1ea46 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=hjj8zCE6y8JCqPeTDGYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: RLU-eo3BKjDgMjhhDFkyMbwEPVr7B2uN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0OSBTYWx0ZWRfXzTCzU+b6VAQr
 3RzPmD7fXMH35iMeKugW/X25rDwYic853351qeENrkLNv42CBqseWPdkxCAosMB8Pdkh5Ur87+m
 d/SOC8CxklLa7c107Fxf3CPNO9zEzxue2kqM7ISIKvpcT5/1fgtCvyyz4T8DmQNZdNOJmIE+AMm
 a6iIYOkcqx5LI/rav1CPht4EbwRo/7L7eouJtvDl1tOVCo6ssEBsRQtHtDM6IBEfLtsp6I+fREM
 Tj1oH7JuQdF6r7mDiFNIFefolfAcVhurW6YpjQD8/AaATkoOfch0a8F9NiFor/aukeXzMtPuI2R
 33ZU3jJUbb4Fb8PKT+gcSRnXKm/7bpNgnXZe+1VCGCAeZbsKL5Dk+GB42TOLKE8eT6v4K94tRD4
 VsGFm3sAVvkLO8JKvNKMvxVdUeg3n65RzWtO39GpNObXS7hm0HCGn6BZQGbNCqsdH8HzIFWqx9C
 AcSi3HSnMgtVdcAPAIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280049

On 10/28/26 1:24 PM, Pradeep P V K wrote:
> Add UFS PHY and UFS host controller nodes for Glymur SoC.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
