Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B197B472083
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388886; cv=none; b=OXx8VWTcjDTCXyJKzD3JEbNLH0oFgdo7ELKDg15zT5xH9PQp337IbMMw3APlTNLC7gi5g2LpX1ZGie9r9h7YZhQjTQn4Zjub9V8SZCjBCKrn93QQxRFkl40ssw6g/bL6X6Z22IexV8KdR5Kct18Ztl4aOCnMG3IK1DEEYCzh0oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388886; c=relaxed/simple;
	bh=VpuCNzuMJrwEAHkSgZh2kSxsKdhfDFxxd0rHj0H+4tc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MVRZUHSyo0FTXwyNPMXhwVe40CTvo0p3rQDK962kRcVd8LCutxJZObycGFlcWN5zUaEUu2cmlPwQVAzxagQ1R7z8qfJpAjXAp/AX3fG1y9uOigyqgTBRfM92n79CoAd9aB+ApGcn6rQBwxWXalpKqyF57qipr2R4AtcaTQm0Gag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UDTvICaL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bbhYoaku; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UDTvICaL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bbhYoaku"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm65V3793269
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=; b=UDTvICaLJ+p66lbq
	Fb62PDi5p7UfHd4Mw1RDSvW2nzf8csTMGQHd7EXQ2VOFrDy1s0ZL1FKg90RpP7IB
	5zLK+YeKj+RPhFqrOWuCVjJZzkaXVYCmodgrQlRaCxhMrR7+c4enGMOF2Lhpx5ZG
	w6ZUsevpzCwTMAKXvzMOMoBf/h20LbZ05HlEzuebrtvkycY7qFFR4ZdnZ8ZoxF/A
	uKgr1raYpyYZW+hx//HbSUF20htjHxRqOCcvZXhV1JRg68cA/7PmBXW+xMaCfO2T
	r35wEbGPsbstbFqXkdoxP9RMbgIRGZY5s+BjUhkg+IUnPiSTa7UsmkQnBAhalrno
	3F2PIg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg13gv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:28:03 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-791265014f7so59543137.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388882; x=1789993682; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=;
        b=bbhYoaku4lTLkdwqXa4WXFSs8R2JaoYh1+JgZ6DAlAh7N5IQe1eL+SiW7IR3xZNgUX
         h+xdTLzvO+INHRqDI4cHJZsqfZybIIiGK8pIClmABnDfAlnCvDw72g2aYjqfCjDbZP+r
         mGxuBNaUWIkkIzvbTs0X92UIz1GFv4ivA4TaVpWL9XXDmhZbUWB+IqHjNz9WJ47cebR3
         LJbrcNNnQumRWoarECWfWgPwc0WxKNMv0z6+VSpkF3uBD3n8QOYeQEYz7M4CBN2WjRN6
         DXlbYBimSD+Ad9woUEc/hjc/TtSWFOxsfLNQFgBILiP5po02E8D33reKUXtFjfzLNadk
         EnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388882; x=1789993682;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=;
        b=UGhAmdEV1/YxqHc8Wx/a/H883nl1k2H6PZDgcFX7mML1aAiTyB6uN866kCtVRO3Grn
         8G90evqjIkYuhcoMMtjEHsdYzDiUnoigntuntfZXXI9hHNbFZ7qi21fYGNFfQl/0viQ1
         1zlxbbNjnPofxAFatvLhF2oanp5gwJdKHokMWtXhuhT6lQLSfy4f4oOYqillTVMXpwRE
         QcjVMsfWfcqgq1H8QVMYbyDTBmE18pJQaOLrq830W1BFNWtet81E8ef0ghIkfvJdQJTL
         koLY5aLVzdB6QgteqI0/dX2NbesZZHuYiFzdSQk9QGXsfPq09kOjMdssiorE69/ytHHv
         k8wQ==
X-Forwarded-Encrypted: i=1; AKwUvBygD2hc8Amr0c1FZrWz1BNUzViQbOJCYqdD6bVs1f6/zNV/F3MIvf6IxAJ2IPDiuOPmnBlkXE+N7RQrnIU=@vger.kernel.org
X-Gm-Message-State: AFuF++ncrYQcl9xllvSoEq050XRUngYvpcKcCBCkE4H59hhSVQ+2n4wR
	p1nkyjW8GlEA0DkgoKReOe+DZUWuH9Mx9yzlmxqhAtJlwn6YL3lZmYMTQYaVF7sZ9cLUvvqv8AU
	DISSu+ueg8U3lLuEbmsJa1qX+VGZtepS/Bd2wY0kvW20tSMZRH91ooriQzNvwYt+4nx8=
X-Gm-Gg: AYBFou03cd10U850tHmeDJZPmFo59J5GztMczNFvdcKx4dWmN/UOVNLQik4jLet+HWd
	qUMExUWsxRJiJWyI73W8Cq6ygTyrR3VzxFlBRtJlgT+V80XZRfNJVa9tiOwuqnNTs43TfqhtATd
	e+eFWsvl4ihsU37z5N+T6pMOxS1Evk/jWSYPVRgcW3R3WnHWYR+smeVjOdTc9UTy7XU9Qp+19g+
	/Beoyqn4jNuLDCfTs+xwNBmgS9zCApZs4UiZAdMnMQMXZqiM6Kf1sEMpxwwcFalYGDnbqPqnHQY
	Q4aD82i72/45LIctT9PjIHnrMyYDV9bJlDcLspHLcn2IjsZNNt0g8EtyUXsnOd47DvUg8ru+Vjm
	CdbTcAVEOz6zQJYzPvDr2hQ==
X-Received: by 2002:a05:6102:160b:b0:78f:c6f5:27c9 with SMTP id ada2fe7eead31-79b509df7c8mr376326137.0.1789388882394;
        Mon, 14 Sep 2026 05:28:02 -0700 (PDT)
X-Received: by 2002:a05:6102:160b:b0:78f:c6f5:27c9 with SMTP id ada2fe7eead31-79b509df7c8mr376316137.0.1789388881960;
        Mon, 14 Sep 2026 05:28:01 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a046c5fcsm2388912e87.52.2026.09.14.05.27.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:28:00 -0700 (PDT)
Message-ID: <87b0e681-d497-44af-b052-061ce2afaa3f@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:27:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/31] arm64: dts: qcom: qdu1000: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-25-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-25-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7e853 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: MTZm7ezx6Q7mIpHYiMQfZiBRL1Pnr-_-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX+KUAXA26pdO1
 G5Uyxlf2ql5n3OcqZ1vQ9ToIH8wQycj/0Y0aIdDfIhP6McRLGQ1oAcylP2JKJNFS/avCaNSu1Gc
 RZmUWpQp8mTxvWrtmfb0OSM1WUWp+i0=
X-Proofpoint-GUID: MTZm7ezx6Q7mIpHYiMQfZiBRL1Pnr-_-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX3x9ycFz9HF/T
 XcDjLykuOKoF+MJAUvYIa/q2ubbMJUhMhVGnFGYDwTJauAryF1rdi+ZqcJbRHsUCv8psxNTXct8
 BHcVUSOxjnUFLGXvyPA00e4nmSIvFP6abhyCdg51l1VPoVgfWUhClONz7DyX3qtT1LnQMgusMm2
 LQHXFXiRTtuonUHy1h9Yg1mSVM/dX2VnX93rNJbtWlqXeNNlBozJIMHDWEtqoOAROejdYkFeZcl
 J1kj+WIPMB1h4LCdWbcm9RsNmwAvdWc6omJ/Gkmt2FdBJstQGWQ10bGjc+ImWvegRY2blcuxtxI
 P/ENlM5McPpX5UzBOFz3T72DKRvWB+/saLc6vyAZzynR9eFCtx1KvnDRsglTR2jzkGwSwl5r+yY
 l55rvexpX5PTLlxEObYyRh7kR2iKzE8rN1vxicoTn33ITxhxnE9ifmnhkF7CoZXKJAc7b+4F8no
 H8zLIYHR6XLsq/NTllw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140177

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
