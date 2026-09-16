Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32A44E236C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568933; cv=none; b=ihQ04OPo2Q6cCtFU91BiKF5daLt4Fukyi1AIoFAO5ATG8QI5kWDSr7FdHcVm8Ms1OV6pbyxbf9lz9em40YVKMAmAYUlUA0zKS+DcUMUx1JvDZv4KALs6o2cQFNNyzB9BJYQbVCd+bxxv/mJZQr44aB1MpppLV7ZD9hWqA10r1Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568933; c=relaxed/simple;
	bh=9ghc6tZH/4fPr2oKxlI7fOcbF0TkM4CiGrTLxSiHHZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NGPwAFmzO0rmODp6RGmi55M/eakARSWMCOsCqLYkICRHkLVulFCONnguHUn2N32dZATJlYKZmJmcKPHdAj5/r32z2+IxG2Mc+q1Z3fYjHuNHa9ev1yTnvMLoey6TakVtTlB62bblOEzLuBlQVQ5159iGtvxR80qzmr+vY5RwAnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ErHzdGix; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LbjjUXPy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ErHzdGix";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LbjjUXPy"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GDJKJN2788964
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JqTCsPGnfug5X3iCX0D0UGrR50kMZM9Gey36ErTsVO0=; b=ErHzdGixubGKzp6E
	zDCaiJbQgYa51ICV2Ncv07CCsJkmp/T9lPQb6s54q5L9NAuLQH1S5aFRx6y/yoZ4
	5Cf+yQrRf5MdddxEegJkVpu/1LLpVkaENycJwqV1LvTPzi4w9zyGM1cKqqdfTWYt
	sxq5RHVhvHRA09PvgjfazIVLFpSCleFOAhofDidBKx3/oe1GFIsTwc0UqMrgv1ap
	+XN5ftJTHgvnB+816gnBSkF20bvlH2R12FIi4xfwjldzXiPdd6DCv14QduK6HHot
	TZpjsLPAUTI3u87Hh0X23m0lrw7Jc3Z3khJNrPGPvdpFZVsOKopZ3WDAz5dYABxJ
	PdHlmg==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gquw2r90w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:28:50 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-671321441d1so5735849d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789568930; x=1790173730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JqTCsPGnfug5X3iCX0D0UGrR50kMZM9Gey36ErTsVO0=;
        b=LbjjUXPyv/pureKxrFa9Ri2EzxeK0sG1d8b+SM5mOztOs+7gR+iyxWJs49zSaaoVHJ
         MNGulz/PQmoJQ4VRYyRm9vK4uaYINpzvgZKmG92R37R7iDld64quw4iSplyVvVouH/6S
         I5MlSYOq21CowOvhugeFMiM4K7AHjGgSWXUXfd+ThDIb+t+0/Jc/vLBpa5sFIGof286N
         o7TAF2indl1PoCNB9kbJq4ZFixLASR9VxVApLvGnVyem88TxUymQ3CzlWEBwpOo0poXx
         07uKCSzIYgIVtPjoXRqr+i6MNI2G8QtsPcB6ITQGVJ6b0I0GUsAc+zqRFgoe2wa0eKew
         4xXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789568930; x=1790173730;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JqTCsPGnfug5X3iCX0D0UGrR50kMZM9Gey36ErTsVO0=;
        b=nkbVttQHTJvBj8fHqDndtewamQWh7IQEx+xC+w9HH2EFbBSsrm0HAdcXaIlSUFj9mI
         +S49mDCOAZPfTS/HKaaOe+Ni3rARIlOcA8d1DShL2kI/mAJw/wBqwbCrnU9s8b9fZrUe
         OHCADLSj1LecKXBcB4BCwbRwuDNorjVCa7TRywrX7DglVXdmcL6h6JWYOIjW8hABeL1Y
         1eOBXDpNT2OMShsxXzn/2hd/Swry5h35xBMVqY9sOTKir8wNI7QVeP9KE1INX9U5HoII
         XSyiDgIWA86QFXtm28ZxC3f43kWfOcrnN3yKG+cQ1t+w5+S0YGh5AR+wYj6CdlVqzX0d
         H56w==
X-Forwarded-Encrypted: i=1; AKwUvByLOt85zzxznjORIk9DwT3Pyt8j9OgtgstBlKge3sBzUtefp+EVxTGJLz0Gez9IY8a+Sb0Iu1Y19luhDeE=@vger.kernel.org
X-Gm-Message-State: AFuF++kK5dpB2Xjifmliyb/gE/jkmVhxKla1Z/JebTleNbV5ibxl4UOR
	dMmKotRu8Ci/Ef8xBsbQ9bF0eHIWKo4u9GGHf41B3PFioOFnbaM8PnsrVUu3g4/RIqN0Ja8ep48
	5sZVcsJzOfKoSMFVs48srUSBE0f/F/Pq/o8qt3CS94z4C4oLYQkxcWinUnY9bkIgksPE=
X-Gm-Gg: AYBFou3EA+ndHZuAugY2+JEGoevvBeg+FSdECTxS2GBfuXeMhssKy/YJnCSXF/iZdPL
	fRVYSiJcoDIhYEQNsbomIP0NFLnhQaLExiHXIwrh+RArBrmveRUpeh2SWVnvERNyJkcVdsTjhbl
	MZMQFTTyuZE22Hw4C4ldtLbzl0lmka7q1XAceY6LztDcOdOhIJZF+Wgmll5wOFfSIrDIdJcNbIk
	yhpfx2G27/2VhaweWv79dtJqxMM0NOsnNTFVdeNCnP5XfMwERRNTgk0EtHYo8w4VmuQ0RQw5UEu
	vyMHSC1MKhhNUdFDJ7E4cs8ZurBq1Wa0Rhy09+N0TMRGqhzbGUaMqjSikcnx0qUEZocaiGjKF+0
	aGrALAGyhPKf4ZID7x17JgLJsxqx2g7tp2f1wzNRwXzM=
X-Received: by 2002:a05:690e:144f:b0:66c:bb59:e065 with SMTP id 956f58d0204a3-671631ddb2dmr912623d50.2.1789568929991;
        Wed, 16 Sep 2026 07:28:49 -0700 (PDT)
X-Received: by 2002:a05:690e:144f:b0:66c:bb59:e065 with SMTP id 956f58d0204a3-671631ddb2dmr912602d50.2.1789568929510;
        Wed, 16 Sep 2026 07:28:49 -0700 (PDT)
Received: from [192.168.1.9] ([122.164.83.16])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-891f0b96dc4sm8668607b3.36.2026.09.16.07.28.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 07:28:49 -0700 (PDT)
Message-ID: <e82fabea-ec09-49ce-891c-81e0445534a6@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 19:58:40 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-ipq5424: Fix TME reset register offsets
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260916-clk-qcom-gcc-ipq5424-fix-tme-bcrs-offsets-v1-1-0fa10674908a@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-gcc-ipq5424-fix-tme-bcrs-offsets-v1-1-0fa10674908a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE5NCBTYWx0ZWRfX6fwXvHBR4m1n
 eIRCkcYReXsE9r2L9XBJ7T6zuP3EGRbaLioanaSA8RGSl+jB9PFTBb4H7jKJ9z3NoX5LOuTrb9O
 6Q/uMttpDeBM5+t/B4/H0rgav8MY9x0=
X-Proofpoint-GUID: 7MrJEAfY7cEsU3Nbaj5YHCPwRbcUg0tb
X-Authority-Analysis: v=2.4 cv=N4m8hG9B c=1 sm=1 tr=0 ts=6aaaa7a2 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=OZlrBAJz/5WJp+wn98y/tA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=1YwTZjUziwFERy13GwQA:9 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-ORIG-GUID: 7MrJEAfY7cEsU3Nbaj5YHCPwRbcUg0tb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE5NCBTYWx0ZWRfX87uLL11epNbR
 GKds3SEgxJ0cAlbmDJH9XzDgVfYbQ/uA7X+9r3c5CQa1bnq8BdKqvpLk552ovSZjQXrxK2GvxmN
 OLfdcjFEC+AlyK0RCgB/cqxv4UEtIXm8Ls2EZ5Ucv44NMv0pFRRUIkwy51e62y3LCBZhPhKYitW
 l1Ce124wbzCYy2+3ABgAA5oP0kW7IUqx3ffqXA22dumgS1gXCFHXyLIek2jo3Z+Ar0U7wEMkVWK
 JuEmAnrby6hkFQhg3ZjoXVFl1J3WcgOpP8cx6DdQ/6Eq0aNYIulw+5ytTn56wIdjVT2/8W+2byi
 kRR0DBTNrZtkEAIbA9LyjxTzRsxC56rHFTUlFSNJx5YMezKoucBxoomEnNk6eVvGm24Fwqlz3W8
 aGawihoZjEvqIxEfGSCGXGiDKj0x1+gordeKb0aaUHPzQxj5NE4pbr9SpLFoULWuTWCBr7Xnrwq
 pABKgD6nt3eGpdhn91A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160194


On 9/16/2026 4:59 PM, Abel Vesa wrote:
> The GCC_TME_BCR and GCC_TME_SEC_BUS_BCR offsets exceed the regmap maximum
> of 0x3f024. Regmap therefore rejects accesses to both registers, leaving
> the resets ineffective while the reset operations report success.
>
> The offsets appear to contain typographical errors. Use 0x10000 for
> GCC_TME_BCR, matching the offset used on IPQ9574 and the surrounding
> register layout. Use 0x1a030 for GCC_TME_SEC_BUS_BCR, placing it in the
> same register block as GCC_SEC_CTRL_BCR at 0x1a000.
>
> Fixes: 21b5d5a4a311 ("clk: qcom: add Global Clock controller (GCC) driver for IPQ5424 SoC")
> Assisted-by: LLM
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> The replacement offsets are inferred from the register layout and the
> IPQ9574 driver;
>
> Sricharan, could you please confirm both offsets, particularly 0x1a030
> for GCC_TME_SEC_BUS_BCR?

Abel, I confirm that both offsets are correct and matching with HW doc. So,

Reviewed-by: Kathiravan Thirumoorthy 
<kathiravan.thirumoorthy@oss.qualcomm.com>

