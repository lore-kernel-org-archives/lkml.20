Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007757;
	b=tRy0AXHxTV9JW62n6P7o9k2/11h//EBDIKJP5Z5Gk25uoa32OCCOkggRDvvNqdIHhC0c
	 jTgwiohT2QpkilNnXv+twvI7tE8/SrfzB2Q/lM+YdjgIVPnFyiM+Y2k72A7y/lzAJ+A1z
	 kCyR9vvj73KbYRVFn1Ip6Ax31I4OXkclJneRTJAUB1O18SFWJfMJUwU2K1M80oasJRJy7
	 WNojVwGBv4X2XyyZJ1V/rcbs/pwL7EQ6lLpD2p3ICO/Ni+o+8xUVwdIMVs1vNmy/bqewj
	 CQyTYqPEQMMydxRNLFjYYqt+FUfiMJxyPNo63vkfX2JCrKd15vatgZvskx6SOPQCZcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007757;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0GCwWFlC5mwyxuD52EKhsC/tATLlio6h2M9vOXP4oJU=;
	b=QkAnxerCvlCxCrNgdxY5ZDPDMR29QbSuQwdIwT3eiYfYE1CU1mjuvEqb3XdtJBqZzevV
	 /rX/71SA0Dx3q1KhCV02OkcmKGD632dmEl8TEuUMzzPt3hrd2eMbl8KQ+qOk7ywnRE9mx
	 Dq1Ou32JCMsChvSZ6JeuF8X6DBOMmyY75fvG/ImQmpIGRY9hCtb0TvG0uhGueJx9tgeSx
	 9XgKEGPlqucw4oqI+5UFZ+UvMTxe05RUxLv6SKXIe2HCAEJOBzFT8EHbtw76zQaqUP077
	 ssl2Wc0bcotcZNfOOtabS+20WbAlh5tl+az8ht2n9E5lWsYo5oZRdS+r9JzE+p5luaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EY8DQQiu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g7AcP0d8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AE9606A329
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29AE9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EY8DQQiu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g7AcP0d8
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4avgh2727079
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0GCwWFlC5mwyxuD52EKhsC/tATLlio6h2M9vOXP4oJU=; b=EY8DQQiuujcIHHAN
	DjSAAdIRKxtBM1vFoPiw9TVlhAlk/BxbatLkUMu2bM7kVMk9fwia2kv/O3enEThf
	cBL8PzWZ/O3r8LrTCzEpYXxi9uHSxtXiYiSnTPkYCoarrog0ZSBgk753Zs4xRAbr
	qsYvbtx/tFpVA/vg0ztq+nhud1PDb3uN1IREQCyoqBN5KfVjFF3XKGTL27L9Q/Gn
	yhVlR8pHHlAjh6jGsKATx8pSurkmFsdFo4dmo46aIM9nCrImZlmCfuBJqrOQxjIK
	ouKu/A1BdiRpMR5x14nDzCpi5Fs5dpNsajOw3rnY78tfvhnJW+rggokAhn7Q490J
	hMURQw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkp6nvnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:42:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5356c6d98cbso10562951cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793007755; x=1793612555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0GCwWFlC5mwyxuD52EKhsC/tATLlio6h2M9vOXP4oJU=;
        b=g7AcP0d8xdsFNrXxvUL+emdBjtwlEaP8+W/CsM9k6W50vaXRvzbLVZqJ81m63jsN54
         fGvBl+jR0k8xG2v5nzzK+OBsWFyOxBFyo+ysBaOGXkBjITnNJAzT/ush/mS76yMEMpdt
         xKLhXMqL8ee4FTpR6huYxDnndB+dWVXEMQ5WwWL3TuK6d/AP1z7NnY38ZytfPrR7UB8v
         DlYt1GQYl74e998zsqa1UNpnZcaYwYuDa/yxMgxVNdmN0QftCcO2a9u2bAKwwVY+i3z1
         uyHYIbyGwESXPJskmSZ27msaivVWZxUvmv9xKICdJAeU4BRTQNSjq8DCmEl/lb0Iu1xw
         fRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007755; x=1793612555;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0GCwWFlC5mwyxuD52EKhsC/tATLlio6h2M9vOXP4oJU=;
        b=k9+TqZ8ga0O2uIRurVN2Xp9PkU6UFFt5Em6M4n0AX5c9CAEwcazb8h5NTrm1zXzS2j
         lZcz+DP0GGLQQmxZqwH3zzKqR6+1eqkcuxqIT85iQgFrMPdQqz37JIdwABhtqp2LFsrv
         Lajyegv2LtkS96GlTIXdWSTIPET9EG+rqoDjoU8QBZLOweYYWW8oWrMZPNgspubJhUsB
         W/SSdUpw7TNn0ab6hmvawYYL8xJnHfKERbdmIgzbWyr79gfviKg5gT7h+2f+bIT+gYJa
         rWV0TqSo8miJdGMlh3wDztOi2RvVZfRLiZ4JU9tAyAS4/Hd8Y0SlyiEmhJZRKxQQ+B3m
         ZESw==
X-Forwarded-Encrypted: i=1; AKwUvBwbXCyBmFev6nlI/EQFstFcqGl4zQlY5ensyAgzjm7kfPIyKFv9xpkOGzx4qDUVdNYNWKFH1ISsYS5oGM8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTwDt7tVdUf9Oh+Aj9SEOckhfSTNcLKprkslwDO1ICmQsd9Jgo
	n2+FIsBc0DX5o06RqqgZdvRiN9PBSld7BdpCnTBVDS/MBY+g4fo+vXI5QpU5KGdac3NlqthE/Z+
	7hHr8vU5RJAWBW4yiK6RxLArssl6qUOQZ4JGOFrN29fuPHcC4jUe7VacGHMtxMTSYKT0=
X-Gm-Gg: AYBFou3giqhdQTMuaFayuCWs7Ecj43ih0QOZ3xZ6K+w3USRF+WvxZ7Q7suxnzX8X20Y
	EqJkl4vNEmSJbI/6iCGgCd5FlCVIIhj0hJ/b2w8SFu7eX5/j8dzQnqNpW7Zs/4m6K0x33Vhup3U
	wJCJsWyIkxbbXpmNiNm0jgv16X10/jGUmJrqmpcrO91wcbZk4KGKMjCde0BhfG1Za+ECzfP1jI2
	0uH5/+wamY3hH7iQma5lV+x2PJk91g2cFomqIgELuj/Au0Z5hyLihfTd5W02be2MrcQS/jrLMtq
	gEc5aQLcWJeT9VBdPm+Rzh1gSVzFBa6Hoi4FUlBKny04AYSrdxL1kmx7q9vmaDI582aqsUymjlC
	bOC4Z6S/uY5lLgRe+ves3Qw==
X-Received: by 2002:a05:620a:a881:10b0:93f:1eb0:88bc with SMTP id af79cd13be357-940ef79d4e1mr938539285a.1.1793007755292;
        Mon, 26 Oct 2026 02:42:35 -0700 (PDT)
X-Received: by 2002:a05:620a:a881:10b0:93f:1eb0:88bc with SMTP id af79cd13be357-940ef79d4e1mr938537585a.1.1793007754867;
        Mon, 26 Oct 2026 02:42:34 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea3aesm303000866b.26.2026.10.26.02.42.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:42:33 -0700 (PDT)
Message-ID: <e41b7af4-42af-497c-8ee7-666fef354306@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:42:31 +0100
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
Subject: Re: [PATCH v3 10/14] drm/msm: tear down only a successfully
 initialised KMS
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
 <20261024-msm-kms-destroy-fixes-v3-10-66a30120a5ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-10-66a30120a5ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QvPuNKOeTfreYBpLnM6OwfVdmlU7vRW0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX46wHwWkfhJHk
 AJBosSNlK8qnz20lb6zlBWSGv1IbI1nVff3zemMBIoQ10q0EybUNcuzwZbULPhc+hzckiiFWvI0
 /JZ/1tDjZajJVDFrCGg0OZQxpPIrh8s=
X-Proofpoint-GUID: QvPuNKOeTfreYBpLnM6OwfVdmlU7vRW0
X-Authority-Analysis: v=2.4 cv=bq/Zl0ai c=1 sm=1 tr=0 ts=6adf208b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=-n9uno-3Oat8RTozT6UA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfXwDSsH18D4hxW
 b3RSJUe8OHVexRkZXi9B4a9OQZ6o49xaFcYMPbcMtYdfCp0QKBZstNdVCMEZi938yFBNZtDRBgl
 yCRAeTEUtMcz46murzidRA/f0WMNB7b87R5r7VnNHthG5xaJ1iLKzlzFg4hhsjJKVXTXHQqjeRp
 3TN1hil2YvjmIZm0LzZPjB+GWvVw88263Dqz35ED0QkHgpBcY+qwV5TcgZpoyuL3e/8MznNlLMt
 aGEtpijtDRnp1fvsC0JM/RW1sGXntvFP5E638igVr9Peu4vwPLAkqGqckk/X10vgQ1noZl5iuFL
 XdGl+/iCAskSIN5tjccM3EcQQ5UEjEQ48cStDFrl+/JIbR4uf1YngHWyRgYl+TYeycj9KJ4dLYO
 l5VK/R1c2ERmRzkt4xdrQSVrifkjzQ1DDGUE0GJF5cWmHSwXIdJjy875j2zC5ptRM3XiEzaAkpn
 +9q0HwDqKJtYVIMvjWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260038

On 10/24/26 1:19 AM, Dmitry Baryshkov wrote:
> All the kms drivers now undo their own failures in kms_init() and have
> folded their hardware setup into it.
> 
> Drop ->hw_init(), call ->destroy() only for a KMS which was initialised
> successfully, and remove the flag which let the drivers opt in to that
> one at a time, as well as the handling of a half torn down KMS in
> msm_kms_destroy().
> 
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
