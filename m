Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261561;
	b=d/wvBE6LJxuoYlRRgyUfwRy/mqceqy1MS+aU+VFimwO2RzBGcW/AIUftj2UxqneSzeXn
	 Ro/4TGABPLaL5gjyLbLA3jGppXGTDBjXiEdeoq4sIF6EpLj/1C9kivfmQ1Ye2642AkKAz
	 5c6k4W6nvwj879dMYuClWkWabSQOedhTCF7q8gSQTpS5PC6XX+lqGqJoe3//zByssuxYD
	 nK7+BQO+CRX3g/WluxMsCjnJ/cFQTchJYHys/TRM5C9h4Sx5ZNjOlNjTeFZ0YodUUP8ii
	 BI0luGE/3N1dmVxoxF24G9u+ZxuiyR+ggkX+QMbdR2I1NdiKf6aMY71k1ZPIg74pQUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261561;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4Gx7lqvnG/BvQzcb7FZF75lNrmiCJrQ3HXAWDiqM22g=;
	b=FfqsuhlG3xGKKFaKuSgssLf1l6IZZd8VRVFOzohi5fvLWV+YeRKUGuK3AjA1pQQvOJ34
	 xh233F0m0RnBUgtYhg49mNxBan914M5OTEd5RQ3guB96EaMP9GZ2vrJhHbq1xGuJ6QwXA
	 bq7zi755cuIDwF2cVqxxWmM/LIb4Pdu3FtGMUENtDsgRnKlxDs1D9NhhPx32oD/zeJDra
	 CIm07N+LAmBboeqEOAPtXkm/roE8joFA2FXb7XtUQ8r5RUp/so/835YElmWf2sLYNGc1d
	 1Y/hntvmznzDhOZpE2/jHOoqCMbzcWwwMwjruUQs+TARzWoFfUkKoaXcFd4yTBpBHlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cfNAFbY7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JmXOH2jL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318D0606A321
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:12:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 318D0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cfNAFbY7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JmXOH2jL
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5HXd41793407
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:12:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Gx7lqvnG/BvQzcb7FZF75lNrmiCJrQ3HXAWDiqM22g=; b=cfNAFbY718CdPzs0
	gks9jL3tDCLNUytVxopK0FMhowj8SONPJGzNffluO9R+OYPIH3oS2J4tqtGNYryt
	aTM1g2YJ9xW86cvZXEByPXNnR23RcnKz62chCqSqK7LkQ3jQK4+Os2yH+vm2Z0IF
	4ZfjoZCyN1NBWoWXqHxokEbF6uNX3XSkpCgcYGox/eBdNAsbS2l+WXlVDFwDQSlA
	0/aXAGvJVyfu8SLKejBMJnUo0O4AbRNoJN/q1T+Uj5Ehm37qzVLjeT5bmlAXd3P9
	VJ9E14oHQJBxgMfo/8DwVTmK5tcfVFh132q/UeX/oEZok0/rfuSb7lQSDwdl4XiX
	anYSWg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtnm174-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:12:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1f1f2ecfso42350485a.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793261559; x=1793866359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Gx7lqvnG/BvQzcb7FZF75lNrmiCJrQ3HXAWDiqM22g=;
        b=JmXOH2jLg1uwQv5EuX6ntSNU5SivKZ4oqmfPYQXR4thXk+cAD1DeYJCfhISEZiZE0n
         NfSfKxmc6IwqbTtMZEHdC0gjKYvPoKISox/qt+OwLPOWN/MSx/VqHWBWnRpsflogx9ol
         LZv5UDaVQ1bUhRi6PrJoSADrnxiz2egqZ1H9rpVDVUM+KG54JTk09s9K1fGkdyqFiTpX
         nfQgfBt9VXdlDVef1LQ5gfhHl16khINIqbEvbRm2wixRdL7e+1YBsRop3ZkD1XNJkXzn
         N3yIAj2Uc10gU5TL/pDglV5Mql6MRbO/CNgfe7W0NCAZvXpOFNimyjhnEiyhkM2B7kmj
         tFxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793261559; x=1793866359;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Gx7lqvnG/BvQzcb7FZF75lNrmiCJrQ3HXAWDiqM22g=;
        b=croY30Nyz4U2iKS2iVv0fM87EoyCRV/i1OQ9Fcw14u4PpylJFFjnoEiju42PnWFFvw
         s0ZVR40USWxRwaecdWSuKlo8gVLGxquAbM6u5avIBz8nz0QsgK6fJSKewiv+tmnzvQ9t
         V44o4wd2px5Y4fVbtd9mlYj8I8iK/Zmav82GY7hzRDGihrqJ8LGK7Q8N1i9rSIWOio/I
         boQ3LbMHvc1G4O5tk1Lo8ACe6LYLZoEimFYHCHgqtxlO0TiABgTXpZ6kGNUWax2JbdyW
         kvtpswQ2aN3WODEqHLR+FagOBThjEFQqZWTosBZDgfqf13KC0wwom5VuLqskNqilbd8Q
         kp2w==
X-Forwarded-Encrypted: i=1; AKwUvBxy3IH/Eacn6rSksTssvg18/1ORSuY224Qu74Pk4ebyJwv+eR01vIoMn9yG2WD+VnTscINC28bsVmcVIms=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6XVNKGrAtaLD1Sfg1CJfYXRYUEouJIxO1Vl8vvl/MmH9FOiFD
	xD80RtLMbwy8huIQ6e6FySvZl7Hl33SLy4WrTCxXmiSZH7r023mK1flOlEXw6fzMm+jfx/VcQxS
	RZJX9XoyW0v9iaO+dxiITRYMucQ543UqYsRe4fjfbePQ9cjsRmAjPljLy1kIERR6EN302G+qZft
	I=
X-Gm-Gg: AYBFou2oYXRhXa2Mbg0dM/fer1HCj3vJuYoSySDjbWectGOSABSdg/f/fIWqcny5hYM
	Nds7kFlK+1iDPPemGrTFzrS5oiYp0g0gysAWfb4ThF/2MlSb/JYWpZi7l+A2G3oH+rXxdF8Btx5
	0huicyVnvm+OiiuqYSRSDhzy3hGGiaNk0fWKHb8dGk7qix411gj4LRmKRgU3B6MLs6t05WNg7cv
	NWYqc1NfkCRKFIM6ZHaAhhmFGY70WrlFRUBAe8gSIp4hTwsvZaih4ktAYBsaHmu8Y9QFMl+3mYz
	B0F4mZyFLKDTS8Raj6sntYj+TbJ2i4OYchbeGNObUVJ1Cw1Cd3QQR0iSs5T6e0eB3+tk4NnHOx6
	JPHI3WA2OPCEw50rw+8ZAICkLFSBs6eL0gHpBEc47emzkHcyTEnotPRP/k1UIxmIaSkl1l9w=
X-Received: by 2002:a05:620a:3bc9:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-94408d42cd1mr786313985a.6.1793261559400;
        Thu, 29 Oct 2026 01:12:39 -0700 (PDT)
X-Received: by 2002:a05:620a:3bc9:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-94408d42cd1mr786311785a.6.1793261558953;
        Thu, 29 Oct 2026 01:12:38 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd34fa1asm706394666b.6.2026.10.29.01.12.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 01:12:38 -0700 (PDT)
Message-ID: <3481d0a0-0d22-454a-91a2-45b983710f83@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 09:12:36 +0100
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
Subject: Re: [PATCH] soc: qcom: pd-mapper: Add support for SM6125
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261028-sm6125-pd-mapper-v1-1-af9a645b4b8a@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261028-sm6125-pd-mapper-v1-1-af9a645b4b8a@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KV0HNQArEZyqbhOc-TYG-dUmDEOHSx0S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMSBTYWx0ZWRfXzFrZ29Ld1vWk
 eOe5HWvsJHdMNtg39Y+JlVkyiCPpVP3WBBvxfVrnAgUhEQuv9n/uxUMDSkZC0MPvhq0c59bHrug
 b8QHoMwBnua1HyUBzs+HvqknVjcFVHsp0TWYZ/YIMz6qeqPwyJCIDhnmtj1WKuZ1gewpo0rkOzl
 6Ho6ie3DMdBAkfqYrQ1CSQUp0ljyuO+3m0qMtKAFkVL8JK8d+/wrpV3vY6sNQMC5W8TH6yAhHu3
 AMEHJBfySYz806sRcxcI0j1MoU0KlSd7mmt/5Vkvx1KfGbBu5zjdpY8tCcYW9AlwLTud+U20wT4
 NlFI7BrcY3YZfrPfDw5Xdv1Rsv401emRNmkjXLhfn+/QK/WxPYCCsfGMDLTHdKzHappYcix1hr2
 gyuWg3sT4bK6/zeA9vRdaufXITIu0e5wEOwqbuBYw9QZm8WY9969nB1Sfl1PClKeeepzRat1XCn
 RxgYq1YNJ8WD37rnGTQ==
X-Authority-Analysis: v=2.4 cv=c/A+0h9l c=1 sm=1 tr=0 ts=6ae2fff8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=5y-B75Cv0MY6F-VHK48A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: KV0HNQArEZyqbhOc-TYG-dUmDEOHSx0S
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMSBTYWx0ZWRfX/H6KXGw/ouVT
 trIL9FRtV4XDlPrcm6XcnzrAwjHo02uGLlMfFNvlLRZN6ad6mjISzs7oaEa+p2TwaDJcvGp4JHc
 g7nj/N+D+17BbeHv7PbJC2VYfgLa76M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290031

On 10/28/26 9:20 PM, Barnabás Czémán wrote:
> Add support for the Qualcomm SM6125 SoC to the protection
> domain mapper. SM6125 shares the same protection domain
> configuration as SM6115.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
