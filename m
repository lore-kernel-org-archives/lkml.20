Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925EF3B8D78
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790663276; cv=none; b=trJXMvzWoifQQ9nSbFRN5x8E3wv5T6VbZAhNnvBxGi3bwHbxfZOCjBuZf3/cD0F6ExrwyXRWg5rAWZosK9Pq5khff1AX2PAENUSfJ5x+loVYxMQSmVj03By/kOZbDuo/PuklA/FlPTwJTkx4LSiBcu3ArwV3QoDJVwcZCG3+cwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790663276; c=relaxed/simple;
	bh=mHq5AtvkEH8OOCTTKtooA5QyWIUV6+CR4Scingzbq54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o2c+PrI5LebQNs+inkpCOpyVxSikrwPXprKKxFVOqpMIne6t/hYmjJP4s2WWAoXgq3A7YT6p4skWgzLkzPownjA4eY3eYNxWqIr3n/W06phw9m0GXC3Qz4O3kXNrMmWwDVEyIaOkTtYIqJ1KWv82TBLTOkicyHV8ImlZAk8wHB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aiuaXYBu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WhH1PKA0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aiuaXYBu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WhH1PKA0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47LKU2127187
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fkg6HeiiW5RKTN6ZHxqHbSLxB7wGEE3Tjdoly/CGbPY=; b=aiuaXYBuq49qryCB
	Aqu1fpOn45GeH7ZvBLR2g7C6TOHGSWW34mcrWXDJNVsInMVBpq4LlDw3OOdBGAFd
	9O9Mm5HIO4S1PnGAqisYPhJTBNxCaVbfZtRznWG/7yD+DjqWs5/lOF3wNiC6E+pL
	yOEfPot4wbHuNmj6JkrdFUZMpHV16/CMjiFOyeoSpdZfV0QF71YGCuPta3NjjZ4K
	xe4f7u+CRqWvR/1s/J9Gw9VtowY8SKt5863klrd4V+eE6S51xTCpaVLINU0jJnmJ
	oPqtam/c7CuAoSEU1blY6F+tHrUrawfZYnXpYZK1hrQNwNA7sRGMzfGGXtXq7Hxs
	dRHSUQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h02mn951h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:27:54 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc21bc2923fso2533699a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790663274; x=1791268074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fkg6HeiiW5RKTN6ZHxqHbSLxB7wGEE3Tjdoly/CGbPY=;
        b=WhH1PKA0MPYsIcJshSK4V91UjP2ov/Up+gBn4br7xV9ukYNRi8CgUDijRO2rYqa0J7
         8p3m/eRMnQNoUKj+Yk9zyAENs+1t0JdVz2yKb6wj08jaPpCohalcxKO+gPmtVPBYt/15
         jIJgx19nVuvvOqGUzgEXEkxs4O6C0dPHYatVxIqBzf3TM+OeG/P7lwSzA8JXsyjhVj4x
         6ZPxqi8O5BvJSWmKQeHbWScpzorDTG3UE/9sqeMnzDb6usgjDm1mYDYNu4WFmpxmNX6+
         sr3UlWFrc6zbyq4ImidTWZngXIbGpKMMKTqCct9SScueCNmTHhYMMuFYjlIR595BU5sP
         mVeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790663274; x=1791268074;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fkg6HeiiW5RKTN6ZHxqHbSLxB7wGEE3Tjdoly/CGbPY=;
        b=m3MsAh7wX7LuGfTor5KcAf1tQudfyUsRTIIagtZqVC5rAkcxl+nqhxxfC4yP7O3uGR
         sGI/Eac8/OaqPcfc1ucNfMYsLeNNcav9+EsDQ4RE48w9f+tiKcFNg9IvLBDJC3nPYfEc
         O3PVWb39UmEmc8bgO8Xm8BVH5zijEqSMb9GhxttWZ5sTZSg338OyasYCReeXgwccDqH8
         t7DFBtQIce3z2o4BC29Q6+BoEm/ku/nOFk9+oJ7kXbtwr3GkYW5LqU7yd1F+z10TSX3/
         s7eravDTt+7udnqQEnHmYhKfTnpGboWG3H+q9Pa+nXpuqTq3XWY79wsotmlfhH2ZOaK/
         h9tw==
X-Forwarded-Encrypted: i=1; AKwUvBxik60ehL77jERWuLmGSq2FE5SeLbIoFRp6UdQsBnNA+SxtlR/oHfyvdgFRU8Dbp7w9008FjU64id7ZSYc=@vger.kernel.org
X-Gm-Message-State: AFuF++mdro5q+ziF22rnfBebEWYAVZApV4YkY4+QyiU3WvYppNEAAU2i
	3+ag0PsleM4W2+vUtkNX/dKyc1ig1C7RLCt9YveH/FfQjZ+qqqzrbzu/d4fAOcvtCwvQ7QDsryv
	3/B0H6A72yxVTYQhWhjQYboGQXEXOXbpf4DhT0CYhzZMpldNnNFVQ1DDCAJTvbd7iUPY=
X-Gm-Gg: AYBFou3RtMCcCVObf/4tiCHAVmiEFcTJSqD5cKxF/CCeRtc5zAZE/eJQL6J+Dq4sSo2
	mpXet36L2kLcMv7V7PULF8POzJd+Y5S6pX2BsOLruOkYoZHMGBKXc/W4mdK7n/xYP4zOt2Ysor7
	KcLbv9hIeLIU8xZvTV733NfkiUyNtbNgvxEe7Hj8BpR7KRicVR4D/mHsyU5CKesWX3GGh5+vXln
	VK5V4xdNIxGYAqwczB+Ym3BlFcxlPkF1msrKvoXcjl921mHBOk3i0aGAN2gIjWUXlJmZOi8mkgU
	tQaR8UxchdxE0VfazmLa+K8dbO7Fh+TscbeByV7kMeaDJfancxA0p5J5XLqQvQ/FXwD/NwOUJmb
	ikntqrt+CzQ9CG8F51GTl3et46uk97Xhx
X-Received: by 2002:a05:6a20:6a04:b0:3dd:5844:c95e with SMTP id adf61e73a8af0-3de0e772ee0mr13779075637.27.1790663273723;
        Mon, 28 Sep 2026 23:27:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a04:b0:3dd:5844:c95e with SMTP id adf61e73a8af0-3de0e772ee0mr13779051637.27.1790663273253;
        Mon, 28 Sep 2026 23:27:53 -0700 (PDT)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7a3b8d70csm3523812a12.9.2026.09.28.23.27.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 23:27:52 -0700 (PDT)
Message-ID: <141f72bc-72ad-4e14-ae0c-b221a8e3711b@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 11:57:47 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: nord: add GPI DMA controller
 nodes
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260924-nord-gpi-dts-v3-0-74a85134699f@oss.qualcomm.com>
 <20260924-nord-gpi-dts-v3-1-74a85134699f@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260924-nord-gpi-dts-v3-1-74a85134699f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X9fHu2Te c=1 sm=1 tr=0 ts=6abb5a6a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=svJ9ipqeD9EGsNKrb54A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: LLgnnKpSP4OS77vpsE9wA4vNT-ZNjBJ6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyNSBTYWx0ZWRfX/syK7megKfkX
 UoNCme643wI28XRbcOytx6GbgPXIcOZt7culpHKz8z8RBMkntwNvN3XK4q20ZfGmt0/TjS1X7ob
 Ql13ErNVOjJAXnFsUjIGC4Qi8QooYKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyNSBTYWx0ZWRfXxF2Lbv0R/FXe
 hi2GgiU+SJrw9p6T6zXB7vBjhA2OKSreM6qrE2rYT43F9gRAbzA5GKJ4gLtk2VnwGYkWImI4j06
 d8B3aVx5yAoG9mhyzYx/tIaQi+tvGtgMNEsuWIvEMqRLJF0/mMUidmg4adnizy4lj4OPhtcR0St
 RvzeD/yqEM3csLVFbrhiRaeH0EJE/6KNMtW7S+u2Hv3qyhoxY2sLsc89tpj7F/mLek+OTjTYdBF
 nBtPR86w0UZfjx2OoHgDhWeBlzsHFV0PUzgNb6zp84CBgULsAv9VbmRbqxmB3yMaO2vZgU8ICdT
 m3jVZevww7nrOwu0y7OgpLlEdPHTyO6LiJ/bIreWbBzNGppaJHOkAS/P2xgxWAUtGWTR9wK7Mx1
 G6/sLnf6wiNd+S3t9Lz4PUo/F4Q7zKfCnVFkgoKXZ/LtiFRAI1EWcXHz+LYBh4GXbyQoTHbv1LY
 RNhbZ1TyRFv/aEnJ97A==
X-Proofpoint-ORIG-GUID: LLgnnKpSP4OS77vpsE9wA4vNT-ZNjBJ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290025



On 9/24/2026 5:40 PM, Bartosz Golaszewski wrote:
> Add GPI DMA controller nodes for all three QUPv3 engines.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
