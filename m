Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3844A4850
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820260; cv=none; b=qsvVweZfADTBdek9g3uaGPgXgylagVMK2RfrziN81ZVFtzAfa+noq3kqOK3UmrciK/uCcTv4r9HZS9uSbsIOAHVVFOhHR0J31NKpPTCPKhgt33577ff4erzqdxGdvzthf2eqKLJNvVsYJrI6iMjHM3DIJH8Xf+o/sUs3IGBMKGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820260; c=relaxed/simple;
	bh=Elu2DUvxB4cGcjtKZawr81rvYGJthLEYsYyNE8ZKy7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c0gscQGae/cfOV7+1YSqPltCnMglhmF7/iGfzousn2BhrLvJpuRrEohkUZZzy2R3XBbYzOuuSy7N9XZt3fmx8DGHDjSk6BxngQlhwkNgDBz2rbvZtLKBjats8rPxxxIqiUYL4J6yQwWXrBhVEJuP77eU/YDMkmjGc7hzE+kejd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ckuxGRwb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=McbP/dTg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ckuxGRwb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="McbP/dTg"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFeviC1895534
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:50:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xELYLGb0jnmIxIf4Qmyj9hiIBGQ7G+MrqGgWqyJ++Mo=; b=ckuxGRwb/0vA0Dpp
	D+GNN9lboCoMTviY3HJ1TJb9OQEYn/SPgJ6CKXQbZjsCKKdr/rZ4GnYrCstp2qB1
	1sne0xAMOYeY/VacUz/CC42MW4ow7rJMb9K1ndurXNRsns1+2E4rPsVwj5uhDqzu
	1UH0MXOH1G/+Z5ZyJ5fIfGqr6QXfPAnjdUr0oAkpkCI+gKpRolR8lEowBtatvn5W
	A8lOdz2mcTrfezJhdvj+hFmOvvsiM9xFYtvR75sA1mJy++KZeUOzSitypl5A+rjk
	2Fprbqm4DCC8xE/OZwiYU1lx6vhPI1gkt6aQvDodlIXNk+/Yj+SIICED9cOVk+md
	zvnFbw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8v7kswf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:50:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93edac58b24so12923385a.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791820257; x=1792425057; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xELYLGb0jnmIxIf4Qmyj9hiIBGQ7G+MrqGgWqyJ++Mo=;
        b=McbP/dTg5wJv1SRdv1f/Zulbl48Ioq3COetra7ameWPRt+Tkhwd+xrecrR0XLXeGgd
         7IdykjQCVzrTUItWl48FQzV9NxkCgF2eei1bCY1qWEeNiuBhQhcuNrr/tPSqMZ7EUasN
         VzsQRZl60lWav39c8nFryezspNNRvA9FbEJAd1xZFavuY1z7ihjrzmRibggQWOiJm2Km
         Xz3vppQa+pvtaOcvdjzMHPpCeWjHmYV0PNm+yR/QMovGQIT7YIqQKv4Epjap/kBDi8/u
         PW01hMyK2uAUoEI0UQwFZCxOHQ+6kGOFHC6homGeWA2ic3ZmlGiu/euDvJlF8fX6mV8c
         nElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820257; x=1792425057;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xELYLGb0jnmIxIf4Qmyj9hiIBGQ7G+MrqGgWqyJ++Mo=;
        b=XDSFWa0/FS4st2pjFOej8uV66/To2cO9n9/D/ZmrXuuCD+mM4SzrHBc9SKWKPxejdh
         thVhZT01DZ5ibDi8BXpDs0yBE9kgFT3/RHjRl3bNjTM2/hyGHScIaA81hNyTxzXOgTDr
         tq2OPItxKESrjhH4QlDb3cf9rt9j5ZUasNSMtTXhVyQJLwPGTmjJURHzVQ9+/sIM4JMY
         aYkn9f/PbD7qGYH4N8LX9cc38y0KmHejqd8wvHvYUKEXh3RW+fPkNDj8wwQRlCLYb0WZ
         3pvqP8giuRQ2j6wjxVzGh5VNiAuG04rU7bHmV8uiQhELd8mCMkyJCeccHUgU/hN4gC15
         1SZg==
X-Forwarded-Encrypted: i=1; AKwUvBxVxBOTclkkWaEpd/kajoSnxAluvw+wrvLflzmzFUYWqIdFg0cv2Sq/KIHpmEEoRal2pjZ7IVzBagIJSWg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHNdYVcMaaD3q5G6opGxItCI1RIs8DywPJowYH/7AisoriuMZ2
	ManXXl3AoPuuKFcXU4VIQDyCT8S+paCr2/7xvYzNERISLOkLin36G4i4Gw+o/c6ubOl3ZONCW7J
	qVH14rq9SYt1QZmeTR0c7g8TLh9M7+abxHchG2UhcIamBYn9wfrmzfRCt/SUagUA7jOA=
X-Gm-Gg: AYBFou1tEmBnfe8S51b9Im8P3LcrSwh8efjVvV8uO/DkVNU1inWuEbup8x15XM5HH8N
	ZsHPpfbynX0WYxdxiuM0OHd+o1YhD00Z3uqzVKaG4CDYgBr0xZuHOkf9oGLT35DLIlE2P+/qpr/
	/6Sd00z4Jhjc4wltYmS32fBtqiXY5+GKyDwoxcQFKXYE9UVvajUd1CXDrZFQjRgBWq5tQMyr/mL
	3K0YQnAgPwlJM1MY0475PcCF76B80XLdpO9lDp6WTgEgtMJ1wVxt1pr6MRRdJDCUBuTctSyNSnT
	z+WTH+IL36StC5Gd527V9pgBOGWv97i0m7fqU9plgw7xpLlDeV2c9HUo/WfTuluTxC/WkauidZn
	BlT5HutHGJl9Bo+l4+QFztA==
X-Received: by 2002:a05:620a:6506:b0:93e:508b:7800 with SMTP id af79cd13be357-93ebcd29970mr1720379585a.0.1791820257282;
        Mon, 12 Oct 2026 08:50:57 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:93e:508b:7800 with SMTP id af79cd13be357-93ebcd29970mr1720374785a.0.1791820256676;
        Mon, 12 Oct 2026 08:50:56 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1b3387932sm2043906a12.12.2026.10.12.08.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:50:55 -0700 (PDT)
Message-ID: <3a189e32-412a-43ec-9160-66acbf471983@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:50:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 31/38] arm: dts: qcom: msm8960: Properly indent subnodes
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <c0ec3d5de24b709ed6103897b9c78a555243dcd7.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c0ec3d5de24b709ed6103897b9c78a555243dcd7.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX1p3NM/Q6WTbn
 teTqk+nqAY+U8tecVY6yu6rH0nAyqgr+L6FT0og5ZVDCss3KVlX44RrBqvVDPzqM4vQE4tTDA0v
 E7Y8Qtub/KgTq444a0pV1k3HNEnZLh5UB5VI9GIKekt16+q82Rm4IWp8V9EEzPPCbE4CvDzYvW8
 GcmeCBsZK6tXc58ioGCmKx/jTTOPFnshk+s/bMeUHcn+oC9azicJdNPMKg/ClxrVwwxOP8kdSX6
 KnyEY0leHVRrLkM5WqDYb/INvc8Z8KvWQkcPWcr6UheoT/snLhYEq/4mMW/r5Wh5Y/n+uqvW0NS
 Lzf0+bgtZgklAZIPdZlSnODUiHwgZIuh5nJBjmE9JrqAVlxQ/pLZtIdNkv6OPHJ7y+galf6Ymao
 z+yY/aBpPhZeRzyLbv21n9L7JYophgVeACwm/lUm/CAjPqE/xX095iYZgvuk5RQLxyHuknfE83k
 hETZBJOhp3qh2NtUjvA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX+QcOdxNFIFvc
 u7nYEX/T+iq10G5HK9oWqewlEuuyH0TZiy9CNC7BNLMfSCboctYzTaMgAEarwqPjsj4Qu9SAZwJ
 pcRqQBH40Ts3+9XDE9Jk5pCKlU/bsqM=
X-Authority-Analysis: v=2.4 cv=VOtIDNPX c=1 sm=1 tr=0 ts=6acd01e2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-GUID: jXuEYIVXvy9lBceCUdT2yXnKbwcovI6X
X-Proofpoint-ORIG-GUID: jXuEYIVXvy9lBceCUdT2yXnKbwcovI6X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120063

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> Subnodes should be indented with tabs only. Found/fixed with
> dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
