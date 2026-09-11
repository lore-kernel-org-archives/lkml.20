Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F76348382C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131881; cv=none; b=hOGEmPVZKuKGrNNJP5dMgiKgF/OyM7MZjkP+2IO5QnpAEJPKsAjLg6qdsHAR0b9+hd0RNKJ0jtez3F2YxPNuW10VB8h1p9uxzTlJwkoCk09R1Cxv9ZzKinQJsJhWmPVImsrcAbl/mwRwSP6yXx8JChgic2LD2FVXZIZgXn5K1n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131881; c=relaxed/simple;
	bh=h7uaEdpf9sUum2k+80y1Sa8T6lUuI7EvoE41U+RDQMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N7NaTI+ed/Wo+k0FwuS/5T5e9JwGoEENcLmVwS+YXpvvqbdwCprgEQiUrCKv7fsLdNFGF++tGNIxFayc62/qOuw3ervtG+bW4m9QlSjpeVHmBsol6/xraXL/r4XiVgGYu7LtXpK3ggYBcyUyj6ePQONyhsqkdptH2viwCJbMsfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MUflGMsi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VOklx/78; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MUflGMsi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VOklx/78"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCiVCD3505447
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h7uaEdpf9sUum2k+80y1Sa8T6lUuI7EvoE41U+RDQMg=; b=MUflGMsijBiHpNRf
	z1BbcZz/sWk8sb6u84LRZCyYWjhyGku+/8V0IPAcMVa4StptWJihLnVP2m8uVDUp
	Dca2teLhrf6iuqPbyLIYjDdnoavpNZTCrPQ0AlT4WaKs8dK9y0M6rQK+h2uQOM/p
	kYrhiCWSuHDe/Bur3vuaAROHQioKMurgL9xpPt1hjPVI0k8MkaiObhebnbL1kv4s
	QraRTFevRxdnSYBHnorSaCIPKDhVtRB6mgG1rG5I5CA/x42V38qSOLA5qYkOzzYw
	mM+7e+AcxoTkurHOeLPD73NEf5pDuKcAMr4KpI1mDJXpUAjwqB8ufPFWCCRAbmVg
	/jVPfg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmcgfhhv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:04:39 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-385d2703b64so2314227a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789131878; x=1789736678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h7uaEdpf9sUum2k+80y1Sa8T6lUuI7EvoE41U+RDQMg=;
        b=VOklx/78vf7lOLSKcVj6ScbssLxs+YK59zAumQMzUbH9YRRZcG8JQWV4YPBb2eP261
         notOrrAbKHPB9wYl7B3umAmZTfOo7ZbbO5JDKKxuybFWrLf+uhQJa7QOnXbPBm1oNwe8
         FGZiAFgxyo5VuJ5h0VRx16wRBRsDk6RkSENY7W9vM0HnzivtHo4HhA+XtFTUfhaHBZ8u
         wT49apVvpprHg5bQOAPEl+/WEM0oXONY6Arkc0lfCgNmkPWxlNvovoXxn73kGWaUaaLI
         s96XZH79VsnTA/o3MjIxBws9BtpPk3lyN5YmSPgmcORtbLH4xj+2gzIj+fQRNavlyVRX
         8MzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789131878; x=1789736678;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h7uaEdpf9sUum2k+80y1Sa8T6lUuI7EvoE41U+RDQMg=;
        b=FCfKHD+ESr281OhG2fzXIjDRLZayQWT+YcTGaZQsW+ocV2jObaK0FQjUi3QZzy1WNv
         BvOk8MAVmiuY89oMpTUsJfs14ye7dm/3hWhwmQigWMVZW1EkE6B42AQGem6nKl0p/l+J
         pfKAV+00RjVDY2quhL9g7vJyZ0Ejh8grJvP2sW31gqRgFc9LVxUE7Ute/64AUs3ACUBH
         u1eplOt/Kn8Wq0E1GyxGaKIAR7k9rvSJa5/oDYM75EoBqHANNRAMBdx6HPCpWHI2b3g8
         ywbfpKhwXq0aAVCNu7ZfI992CoCkC2JwwjvK+hyv8PvjhsvfW7fgq7bifQ8N1CoRiYeZ
         3KGg==
X-Forwarded-Encrypted: i=1; AKwUvBxd95RCL7NqeX2E9lnqvkcRAhZu1XInXgkYORh3SRi3eCxLzUEeyi26Y/tDVkl7E8grz3TZYX2JQPVivWU=@vger.kernel.org
X-Gm-Message-State: AFuF++mcY8SM1+ySPnw4V6HWSmbIcjFrRHigPCablrJlbF+6038R+J4e
	IMUzBZQxaFkk0ljDoekQM5K1YE/4kMey9KLRis6GvNSi433zrqiFsfzVhEsPhxywFAcVtRJEQpS
	cPdXesGHwZiwCKX6psrGQ9RBsXKG8IxpNVzBErlyEhJK8MnJ5Qb8VWYBdQbRrGDn7TRE=
X-Gm-Gg: AYBFou08da/ViVsk8avO7J/66J8tU5lt4ix8rLTpg3sn29hxRp2gcIJWeLlp6jU/Aho
	qTxqLlfIDrQiVF6XglO50OPMOsyYE6ymp8yLLW0Is+pSUzTzJ3pOkYjYUvtkb3f+iXxrgNfTpuQ
	TmmpC0VugVsB9Wff0r6r+K663CD53fIIN4k/EW2PzoIOD3gaN2md3gqH522YLSbLDALoA+JOw0D
	nm2Ninb3PZWA9RBUVtny/REYgNDlnHGIu+rhCPY7CRKCJZEMr0LXe5SmKIUlzaNlZPz4Reh+SGr
	jy5l2c8nGBtmHyVyf4RY1BA85pQNrQrA/uSluNU6BWbcfAqrzfmBt2ZYgvV1c2XJE2yrhEEbT+a
	y8UZgnZfVP8Lh/xtqiz1vS8wsB3uF
X-Received: by 2002:a17:90b:3c8b:b0:398:9beb:a2b6 with SMTP id 98e67ed59e1d1-39d77b7b11bmr12888207a91.24.1789131878056;
        Fri, 11 Sep 2026 06:04:38 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8b:b0:398:9beb:a2b6 with SMTP id 98e67ed59e1d1-39d77b7b11bmr12888140a91.24.1789131877497;
        Fri, 11 Sep 2026 06:04:37 -0700 (PDT)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50efsm7387462eec.28.2026.09.11.06.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 06:04:36 -0700 (PDT)
Message-ID: <59dafd2d-ed87-4d31-ba2a-546c8d903d44@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 18:34:29 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: cache: qcom,llcc: Add Nord compatible
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, zhangfei.gao@oss.qualcomm.com,
        shengchao.guo@oss.qualcomm.com
References: <20260910-nord_llcc-v1-0-30fd1cca65fe@oss.qualcomm.com>
 <20260910-nord_llcc-v1-1-30fd1cca65fe@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260910-nord_llcc-v1-1-30fd1cca65fe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE4MyBTYWx0ZWRfXwEtpALhEfFwX
 9TnVyeYbcnu/y0t1ECcqzUpQSofFNywV6FLC9Q4Kthoave27VhwoqR9CMPmd2hMCD+AF5k8ITh8
 kXAB+Mi96Wm7dyJV2JQREHJ56wri68MkfjE05rc0xpQirrEOOLz1HwjINvJeJR21dNncE3CyE3c
 38iMJX9icF0lC/zIufnRzAUD0TXfuuUanziudsf5pwgOE4GrZy2OHZARpyKw2W/Y4xQk7niuMKE
 VStTiGgSQPDeoiXojB1jobUPAvNHZgKWfqxNmJ72VvLnoNEOn3BLeBJcfLbHYBaKhZQrAz3P7Zk
 rNeUzcrisfftN0cbgdbP8uR/ELbYiDi0UfMGR2EEMUgn/LloMY/69oM4/S61xpxJaoO4EY/VaDC
 5nZ5BjxQ37qK+l2R0bhhVWEhpJEibl1udcn75tCZQe/iFgkdpMyBdKn4slWhRAFwR3SeVn0DuNF
 ykynxNO8h/hbW/8ZTlQ==
X-Proofpoint-GUID: Wt5X8SQ4-15B8Sr_sbbbm60yMUtL5UKT
X-Proofpoint-ORIG-GUID: Wt5X8SQ4-15B8Sr_sbbbm60yMUtL5UKT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE4MyBTYWx0ZWRfX7DL8xYP0CvdV
 DuOkrOu8GDGPF+Honkul2AsokWaMMeSveef/I923lB+dgA3FOFmX2FrtWeckBZLf/lo9WiA6OiX
 f24zEsQccum2tH0BbQDONCgq8dF3PA4=
X-Authority-Analysis: v=2.4 cv=ULtIjyfy c=1 sm=1 tr=0 ts=6aa3fc67 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=zkjlvTYbJJQcmHsFOKQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110183


On 9/10/2026 6:30 PM, Anurag Pateriya wrote:
> Nord has four DDR slices with four MACH9 LLCC banks each, so it exposes
> sixteen bank regions plus the shared broadcast OR/AND pair. Add its
> compatible with a matching reg/reg-names group and raise the top level
> maxItems to eighteen.
>
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Reviewed-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
