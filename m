Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C231047A88D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051263; cv=none; b=k7sxtpBR23Lp0iidZnaJdPc2Lte9ecd0CKDP5KNSSj3PGDMUNINSDIfoMno2fL40Wn65ijkofwsHDY4o6yonJfAoQCUf51nImJRAKLveDKNojANo4APlKEELwcGxD+RabkUIZmhx0s0kaoIkwAyQMWOqJB5/sTY3KbDszEpF9ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051263; c=relaxed/simple;
	bh=ZGoe7RNQAwBaz2PwJgBJz7q4Nu9oMgKtek/8tdm8EhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qYjGU8nwcmW2aQZeAHuvmSPgjW86H8UjDZ7u1cWaHwjIxPCHKlZSzRb3Z2lj+9EIfcfs7LVam2oZns0jL6Jm+dqe920TxiDTUuy4TgMD2G53vX+FcVZxexy4ITeczlhTVHTTi7WENgjU8A4VPZXV9EMmGBguFDKnpALOy9PDNu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=liQxcyuS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iKJvOR5X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="liQxcyuS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iKJvOR5X"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F1Pnng3468853
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gv/aV23P7UOIz2OLhmRwngNHyWsHnDAuW4uKnTteBNU=; b=liQxcyuStIlyKE+p
	27XR2Bwvyb0u/vgWSGD8S9NIkg4uO2oZM3P/MOIVTrwx9H7l2cGooGvNy68ju1dd
	AYGJsSparnm9zva2oFBn0Ke8d6v8QFe9Poly6kF4gJcti94Zc08w6mYZkahckZ1E
	3R1bIdG46g2oiaVEbG95cKA9R2jVgyudOxoNTznSANM0WdLpXmR1EnouQ8qFAliH
	jp+zRmps+3sKalVKlsiOwUZcs1/cf0f3CeQcZeGHp//DJK3+stwVFEE41p4SV+LU
	qsUudT6yqC8s73gjWXzGvuWECWIzqY8VOyH/ZZw21UW5E1gAxYsWGtQsBcRxzUE0
	PeubsA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hadd7b41s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:01:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5338a4075d3so15990541cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792051261; x=1792656061; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gv/aV23P7UOIz2OLhmRwngNHyWsHnDAuW4uKnTteBNU=;
        b=iKJvOR5Xx/hD0mh5vOa3Jxg7PrBQ74UFAir3BhoKeU1cWXPFw+AEUsh/mj7Ypz9x6h
         DUc9NPfrPz2HFJWb5Ws63Q6PIW9HAaP9JQ0d3S5yHTHWp1BEN/wswGJ5kL1wjQrJjQJA
         WmvN/KMXodChRR6FKfPtFY+w4PC4PSg5i+3lZ5cJfyyccCzUbiN6k4dh61e4qOdsl9dR
         GtUuh1cOzUr9cHnWsWHzhz67rZUsexcZIlpy45HVKJk4h2Jt0y01xTLKyhu1D+xMyNOy
         h4LiT/ZiTHiLoaOQWM1/bLgQyqkjiIMxGSMMBYE+f/xCa4JpKt85jF/WsdU5M2cN8Iwr
         +ajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792051261; x=1792656061;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gv/aV23P7UOIz2OLhmRwngNHyWsHnDAuW4uKnTteBNU=;
        b=PxK7cFcfpDI7p2w1gTEqL1/yBTpzd1pHx7trWGhlSWcNr17/Q/fDUQCMjZJ7PU7C7v
         atgKH3bvKpegX5Nof7I3Dkkomw016uOQmvGsxO5LqKasxAdmGoBjS1/2qTWNh9oro+Rt
         EH9nwlju0QWxZGMq1bFNg6auGSTtCExlUQicQdfy4C6HIAdnJVpJhZKP0RGDTuUYXI17
         U26jKoy+zvNiED5ZA7o7EFvBuy+YVPIm+h66CMif1T5j4OSaU51neNoUqfSOTt+w7R6r
         ZD3uFQnSPhvVBVtgKlfDudwm0NYVf+NzzzaqrauB1gnvZkRKdXMW+8jPVDrUJyjQ0P4K
         RYOg==
X-Forwarded-Encrypted: i=1; AKwUvBxzWdoVqk2pu2UiynbWAzMVnhJOWxtqVXX6ZtoDDDAKpljNf5agxXdX3BJkVN89KeVtXWNzF91Q6lskO58=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgolhwudIMrQki71eCcA3+lFYg3Bu99y3sYHBMjZhu22IlPpVp
	SYQhDLyXglac7cnhA9QuFtbgZVKje5ebAHFminJjepP3fGQ8TgBiuevQiG1B5/PGbhPWq+FoGKG
	4SyLxnhiFhDGWZ3EurQmWOrg+rKmcGMy8exyBbYmETSrYw3o2qHfzMjdrcuOjfczjeqw=
X-Gm-Gg: AYBFou1uay8nk9erUKq/PXtKTkk2J42bByLjBEuJZ6z9+vdodsLAZ06rmBdgOKQ+cva
	6KLnqQuI4IfV6Wd+LBSZQxXy9qStEQCgsZioDWlHHbCdClf9ZuuI7g1Gem9H76eZvgWlueJY95F
	W5O7mzDV7iMzJ9LVWfgHVMBJCWccOwS/mHQrMxrqyhoLPqnhl8ruqu90aU9SUY82SGsHH0mwnNp
	0e7IQ+VzTFGEhqhY1hRLuULXTqjLttFp1rAPajgpq4R3ppkbHEhCUwKNKVWVaNUSe7C3X8CNnbM
	3JHNpP+ucGP58qDo4cOcJPzk5TtDpJBCQirEhh4/OSG6w02LLfNlCQW/RgTrSc1prjRtPi3r9El
	S2QaxMhm2WoOC2q59PBpoaA==
X-Received: by 2002:a05:622a:586:b0:533:96b4:8dd4 with SMTP id d75a77b69052e-5359f4965eamr358237001cf.1.1792051259546;
        Thu, 15 Oct 2026 01:00:59 -0700 (PDT)
X-Received: by 2002:a05:622a:586:b0:533:96b4:8dd4 with SMTP id d75a77b69052e-5359f4965eamr358233581cf.1.1792051257010;
        Thu, 15 Oct 2026 01:00:57 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda044aabsm91788766b.57.2026.10.15.01.00.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 01:00:55 -0700 (PDT)
Message-ID: <9e591ab5-d1f1-4ede-bd0b-ab0241394d4e@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 10:00:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] arm64: dts: qcom: sm8250: Make the ADSP remote
 heap no-map
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
References: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
 <20261015071511.977-4-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015071511.977-4-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BaVNQbt2 c=1 sm=1 tr=0 ts=6ad0883e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CjiZw0He1JKpzbGRn1AA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 1cRRmT31KnE5E8jqC4CXgtgnIxD9K5WC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzMSBTYWx0ZWRfX8jPFBhagzjzL
 JbvtUryiTZuJDz2hFuvslizwgryAx/zml46fyv5NRRwBH4qgiNJCY1jzDg7le6oOC1Wg6pLIPnk
 3bj28pZAC8OVv4i3lWwOVMM/tatFJAeEe8seJGUAF1SS+6VfmISPL/CQnhh/VhXqJb/eYbi1pJ2
 /bz1kfvOt5Wax23Z1MGMG5u4Q1ZYIU9c2+Ex84ISq7ZieWjSscQs8knA29enasFnNtvaFsaN9wX
 J7vjz1vIiBBW9KQj90CIDEtFDHgkCsMghikzPei/SIF7X91PKUuwgYRnnWvvBXnQ8EW6xJhUwN2
 vtiQtIbAB5GT/8VI4lcZWDlNjbijHAbQYm5Db4EGsx+Kkjj+NxAgJMJJ0BRJ70PXks2JBJ8C9y9
 uubT3wYS1WxkAThdXCFfEBTt1OyNT2q7O5rT/mADrvycULwD3EIMg8MfzidusSJKVH1j9zrpq6Y
 +huoPocUAwvgJpCDzAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzMSBTYWx0ZWRfXy8UQ+NVaBCEO
 o7nWqbZquuBknafAjGHYeMH/5TFhJplbWXs7jqvF80HmPeM2b40o05dGlj2Oz4E3503Mv1xecye
 xngfvnaELfdTVZAFg/x6IB3z8MgEQFs=
X-Proofpoint-ORIG-GUID: 1cRRmT31KnE5E8jqC4CXgtgnIxD9K5WC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150031

On 10/15/26 9:15 AM, Jianping Li wrote:
> The ADSP remote heap is declared as a reusable CMA pool. FastRPC
> assigns the entire region to the DSP during probe without allocating
> the pages from CMA. This allows movable HLOS allocations to use pages
> within the region after HLOS access permissions have been revoked,
> potentially causing synchronous external aborts.
> 
> Replace reusable with no-map to prevent the region from being reused
> for normal kernel allocations and exclude it from the kernel's
> standard memory mapping.
> 
> Fixes: 531ce288b6dd4 ("arm64: dts: qcom: sm8250: Add memory-region for audio PD")
> Link: https://lore.kernel.org/all/20260619-sm8250-audio-v1-1-8a76e033e209@oss.qualcomm.com/
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
