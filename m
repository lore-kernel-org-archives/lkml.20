Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96473E168A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932799; cv=none; b=Suk9qeQSr1dw4xqBrNJPxS54ODXtCDi8fclX2bBUyL+8xvfEjZ0TPPztUuM0F2CTL552CwpAyLARL9PuJ/4zUDb2k90+POKSX5MzqWBepUl96+GYjlIixQ3lndWqSmJllmCwoNImXDgt2XAcQB6oOyxBoGvUva3yw1fefm/czKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932799; c=relaxed/simple;
	bh=SRiJOabsJOJ91REaT9PsxaaJ1Wgcz5xlOzFv109jR3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V5/t4VYp1yMq6WRnvGwkPdO+hNVTqluDQRK3SqZTTFr0zSHUEYuCfaFSh9WTLoGBweanFx0GT53VBaavengIAVKcsolyQzk6Vs5lNu4sLC41hElulqq4+vPw/c3n018ETngykJERj6GY/CBeOo1tgmFbCfNvhJN5/+DwFfR4ZJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M5olVGuG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N7zjUdVA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M5olVGuG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N7zjUdVA"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925js8J3882623
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 09:19:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Xe19vggvY9hInc0pQhls1gOb
	n4wriMNRyAYJGjlvjN0=; b=M5olVGuG2dQeBMy2j1NTuNgSNsdCmVwV1IqP+kqf
	kSzUZQaSa2Go+JLHQaipv/TZ4pbhJ+BM1ZyCnLomT755GMSwp5k+yttRrBZD6MZU
	8bldqJ68qR7Sihw1d2589zSc0+YMHYlQLBjm6hpbOR2F7Diqi/UCVGJWpjHXLmHE
	f6Dn9w69OlJClWgWkp6eTq6hCNTnmXkVE59XlhzNaHxM5zJhjap19v9leE//IBUp
	9ByttGNPCMf7epR1Ef3Fr2szao/E0qjHmYkKRvsnNS+og1i7S3l9dk2+8QtV1jxr
	1O/rejwMI4k5h7ahQYXpqzyqK76RnvAmxhi487vJY5ffog==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1v032vct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:19:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e46c120dfso15534385a.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790932792; x=1791537592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xe19vggvY9hInc0pQhls1gObn4wriMNRyAYJGjlvjN0=;
        b=N7zjUdVA+oc6R7S8h3HNcdjrCKGdxjZ2S79lHNm5FNcKX+zNdqj3j9hnz5GlzEZPO9
         rHLi5IMFVfi5jqZbp1pNZY7sTMM6i95cuWfj0MTN6/iFSgONVTq0Qad3koqS9Vdi2/H0
         LtomywpDp9tqEDx5B/rAAN2dK0c8wHmMRVqEBy8z1bhR8PxNrSmgVqqyJwypKonhB7z/
         WU4VGMWVp5NJ74nIFG87AAGrxiZVsqmR4kqc5wB3RBqBYOnX+D2CT+sLAqTgnbX6KGak
         r/Z1dokaFjcFp1SxDM8Ix2CydJZOBxSKRoGZSZPUJXeDTdiBnxAU2FmbWFmp35YfH9sU
         vYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932792; x=1791537592;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xe19vggvY9hInc0pQhls1gObn4wriMNRyAYJGjlvjN0=;
        b=QqN+lMrcXtpItfu4kfn1MTZ5zOePw47Pb78I5ty7FkcA+rceIALsXzFm3z+1mTiI3M
         YqhRTbglPrU0+Le9UFhX4f4i1As70dFIvCBR4bQRwhj1fDnSY6+yhf+nvAk+qH9qJz81
         AJhtwMu2g9bL721DbJIyQUrxA17CmOWaW+DvWl2LwWa5zk7isnUhJTUCl9BxqrGkVMbo
         6NRPALXOlzbgcCbTrSdCK7G2E0UrHmopGSVcIM0vggvUzOcbW5u7twfD/z1KNKaV87Mz
         SAuX0QjQ0jSefyHiudMYehlLTQidVO5hSeJNJOiOZzTLhaklPI6V0J64iHB8lHtrLqeh
         rIHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEFAFDXRn94p2Zf89hW/7YA/VFhDiKr6KRJFMq/yPKHYzCEEAfP7gm6qB/UZw57Re8zzwX9H3Yi18b0gk=@vger.kernel.org
X-Gm-Message-State: AFuF++miYA3OAh6EQgKUeDSpz2D19cqzh3ONDJtURxBDRuBMXF+fvRBX
	04gmTlqHti1HbqmcFrn2E2FhoFlapzGQHeF7oQWrVymbI6cxTFuFvy/JntZo4ks58QzqpqqVGkb
	jEo1z6ceOmNdzwgDccgqVfdaDjgSNduccUR7JNCiJtPumwDUma0XJ/fWeSXkLghrS+mA=
X-Gm-Gg: AYBFou2eSi5GwVW7FaWpnCiFx6QeCoeePYxQ3UGU3fOri5mKIJxTgNN3myVWGbUJMa3
	MbaJY1h2krTuDo9/m3lwWvTypgR6TP5q/muvsQ2WABVAkk8TL2DL4Gs4ydcMa2erG14Zvm+1O+4
	jpoP1Ae8NHvT5cv5Eou32vxGIEdN2sEGY85QZCTzFUuNGxcMXqbiT07SdSmMSGkhKuYB3F7p2bA
	L1by+6pNeNMCNwXDmGY0d7o/HpS/XTr9qSfmdeK2BlfazDJ523Pocfurfk8gWlAGqRejD0A2nI3
	r5RNT8V0HdU7mFXZVpa5Cp18DEvg2S2hQotF/2JlvSIAyXUTodgEmmaS5ap84ekX5DThyotXi/l
	PE95lvlz/xE4bwAo=
X-Received: by 2002:a05:620a:8385:b0:93b:e9db:1bab with SMTP id af79cd13be357-93cf188feaamr325458585a.56.1790932791830;
        Fri, 02 Oct 2026 02:19:51 -0700 (PDT)
X-Received: by 2002:a05:620a:8385:b0:93b:e9db:1bab with SMTP id af79cd13be357-93cf188feaamr325455385a.56.1790932791234;
        Fri, 02 Oct 2026 02:19:51 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280bcf0fsm71901235e9.6.2026.10.02.02.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:19:50 -0700 (PDT)
Date: Fri, 2 Oct 2026 12:19:48 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: hawi: add iris video codec node
Message-ID: <ggoarbgjedwjsubpiap6fh2ks7yd35i2unfu2tlbqcitxru3qh@ue5pb435infb>
References: <20260923-add_iris_for_hawi-v2-0-016ec3d24b79@oss.qualcomm.com>
 <20260923-add_iris_for_hawi-v2-6-016ec3d24b79@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-add_iris_for_hawi-v2-6-016ec3d24b79@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzNyBTYWx0ZWRfX4FMAjSz5nkAb
 HEJwfKbS5jmWx8LDpr4nxMZYHDHU5655iBGu0S+OC3biJ3iAm8EAftQ9u34cQOej8u+VGcxamzO
 8d4/o3ncUx6AXWvK2m6BUSAdQDDvnX0=
X-Authority-Analysis: v=2.4 cv=GqfXaU1C c=1 sm=1 tr=0 ts=6abf7738 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=DhuRJU6gBchJA4Z4gf4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: toyTM8rZ1l1de3HZ1FndEKIonnslvgvL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzNyBTYWx0ZWRfX+hhDbE+KAVSk
 073TJb6GJaH7LQCr+b/8nfx+c0xgSg1BAJYLoVfW2SS5qQEXBW6f9oO8ze6CHl3Yo47+2yw+fGK
 b96JE3/qwCOmviC8hr6+EAF/E1ZrQ24c5Z+JKwPv5a8GAFNOj81W+edYvlP2mfRhcCIxrQb8LEy
 VcHn2NkxXdqXFnKpCGGae8ivCCeNdZoE1orCDffD7ucQ6aNbdLcrUKD7UP6+WcKBy3mLmYEPCk7
 OW8HtWy1VTKzJ44VuoEShCTsJNnbHa0px/EkzQCn87Kt76Jhwpzw6NclFVLkujJnINFwAHh3XI9
 07oPQ3q9C3CBaGXThYpBgWuishlrj3s7PkKVY2YdwpBtRYYz8eVPcNGB97srqycYbc/THYc6yPq
 u8jJu2N6wwBag/IznfHtdBk4FM4XEobcU6A6oetVSUUMNqPCczvcvaXJ3ABKebqMBctnsntDpPZ
 Q+E7EFJqyjipOBtyCAQ==
X-Proofpoint-ORIG-GUID: toyTM8rZ1l1de3HZ1FndEKIonnslvgvL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020037

On 26-09-23 11:27:56, Wangao Wang wrote:
> Add the iris video codec device node for the hawi SoC, describing the
> register space, interrupt, nine power domains (including the
> VPU5x-specific mm-int and cx-int domains), thirteen clocks, two
> interconnect paths for CPU config and video memory bandwidth, IOMMU
> mappings, and the operating point table covering 150 MHz through 1000 MHz.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
