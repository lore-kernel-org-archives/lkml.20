Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006022;
	b=exaL6dvmZQpta3XRjofHUoiFDOMd3PtXDhfGXs4hZ8yPQ6rFnot3ZrUpAdEYzXDasUfM
	 dXtT58AaZI9O+UZ/VCZhMlfKDwNqZ1bLIgZmyqHFcpIRW6ES31TUUSAOxBP2DsNvUUKz9
	 0hrCn9hMOnvHsAtiRTZwH9oALes9Fdl2jdo75uTFf9mz0LPMoEMHE1E8rHthD+rNgkmRw
	 wVTccFQJglz58pEClsZCrUogt6R5oTcFeNk/cJw89L+8x/43cwAnZzRJav7Hny3/WqVeF
	 9vgre+0DspC1P/t3EsSTy8ZBkRxxfvDCNf/AOqDfXoqX9S7hKhXV9wU9/pVivWaLFhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006022;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=504GS7G2c5HvF1fzY/p3b+yghdp3at25Pz8Gt9PufVE=;
	b=CHsN17/35vjZwKpoZNHiloLF10XcJ8cciWbxEyVvp3WSYJiQ0+CGond7awhk8dk8+3Z9
	 Pu773fKDaPa92BgldobFKiGVU1dOLfkn41FM29u/G81mB9sRixgw8tTmsjiclmn+UVbQg
	 k/lP8Nd3G+EvhD+0r0Rio8nbLqJNakEC9Bumxc0qPmv/Z3BTl1Clo+BTcqHNydBVlBeft
	 sVnktP4+MolzDJLFSPLYUWT4JSAA2O+scYl1y4NX+ApGXTRgvww3aBhdK4fKxU4RVamSh
	 w7ENFZ9CNsReebvKdm1e0QtNTMxmZ6NPPWsXzglLeIn7M9/a1wvnqtQbO/r5U3ldmUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HE5Ej9OG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fRL5AfXv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EBA606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95EBA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HE5Ej9OG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fRL5AfXv
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4asfi1181808
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	504GS7G2c5HvF1fzY/p3b+yghdp3at25Pz8Gt9PufVE=; b=HE5Ej9OGUxYGrI8N
	YKB+QS0Q8izHhB4qTjUsd1Mnr7E66NzQri9a3l5R8+cYFJHrRhgK77FsrOZvlbUw
	R32p9NpTqyhwXI1diVf635IA1Qk6+XUNiQU1p36fqcRqRRSJ7z73DtJ+wCcr2kTc
	GhaIMdBfug8bY7wCPqXmmkgTIWc/y1RwRikL2ObtwQEzrSwtFPlfVsTNqmnbrQxR
	HWsVRR5/nUjwJ+VgWEZ8bOe2fIhEb0MMkJi4cQOf2Ub1I4z4JTMWr1oGaTGKqw2k
	jR1UBzyEDgvhql3KRKQ/ovLU6aUGihyLLXO+3q119Zy/rKcrYYPNHEEHVFghPWcR
	97/0Ng==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27wn6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:13:40 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9179fb39cb4so5590096d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793006020; x=1793610820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=504GS7G2c5HvF1fzY/p3b+yghdp3at25Pz8Gt9PufVE=;
        b=fRL5AfXv401PMVZXmRPES44s51Yz2fTdod5d8DlAjB4NSog9MNBGFyiH110YSaoZpq
         axgkjFMBLbZY7m7Mk42Vw/ZkiBpxdsUyXwfEMEQgioaAazcjR5OSU9utaIheg+Eq60nT
         0qeS3Dl2YR+SGRlesJuJjchYdGs7DZXfBHwUDEnL8xqzkiCqQatYrYfPd8SYes/G0d55
         g8hnGQHYPX1o4CIA6D4bdEOD7R6T1h0YAquwed+aUV/KJI8WrtcftyMrWp/lt6KXqwBn
         J2BMiEhlKobszm8CEiG7kLpKHwqrsCZ6omSSwcSW35/dhKi5VrZlabHOgB/XuuuIajdN
         VqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006020; x=1793610820;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=504GS7G2c5HvF1fzY/p3b+yghdp3at25Pz8Gt9PufVE=;
        b=tIg7ZaigGeUQTPKNXHFjnRj9hFEXN5A24AbRCe3SAVjRBD8cbpjquu2sSSqNL6FbUY
         iwxvdm8SvT/L0DXsw+bLLQkvylmcVN7IeKEhTmeV+WqVBA32nQ//GzufRKR0InV+/DN+
         mREDBVx+CA/HQqDBMOGa48uDlrr3smeDsekHr6ALJIe5zaHW34k/VS+A0kMeJj/xpiy/
         Xd00G1MHa2KIAVZ/2CnYsxP2iM9z153aB9FgXQv6sNtztCBjm0vVbIMJEYIq8qQfPnTR
         VrYUaGVDP7kOBxFuzwbWjaEcfsI2apn+xcngykcTGfH4AQcLXgaNgwMSHqAN2WnuSqJz
         Mtpg==
X-Forwarded-Encrypted: i=1; AKwUvBzz7wWLv7vUsvqOQFAUofpYFNNFERaVZVOoaiejZw4nVNqaHxRcukQiiMaeZ2RN10BsWILQ9lHZMM5mwp0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/mZt2XyCMfS+yqr41w7iK9bgywxmKUFnHQsd6PLOaqFWOYQbg
	4gd3Z/THshyPXdRJ2KmcsfWWW0zgw3NHW5KyQdBDp6Uns4cVmu41xk2o+lFz821jwNBCxOc0Vay
	cWzX5zt4VbQDrAlXTsQStAa6UzlI+MyLZLxOuHy0oLertWeB0yw+qX4CHsxORIQSKpgM=
X-Gm-Gg: AYBFou3gU6VVNoR+1geWzmVwpEEPgts4q4AtAFD7Kh3CnRJKqh6cG4UOUKbOSTcyprX
	5YJ7oZSbS0qH+mqG63U7Ccmg7ILfXjsxQOTcNpdnoQeTb2rDxaxDkb9s/VDE4r6UC/2z/Yjqavk
	EyjsbdrDG4OZH+auVo251AvoQ//mkMZJrO4iWMsXc3ApUmadt0I2mkcUhMIsx861B1uWzOcOoBT
	iFSUmabvFrTwcZ77To0acNMC4rZtcX07uSempcydYQrGYceq2M14IdgErmZgj3ddDdKWK7+V5Ei
	DJFRkYjRexEKioJt8+4HalWbiJX/7UM/0tTkoTuJzQxx6GelpFwQDFI+grZCSwmVm2Xv8HwUTMG
	ByeU0VXrHoSIupnmoJO1Ogw==
X-Received: by 2002:a05:620a:4918:b0:93f:1fc5:f07b with SMTP id af79cd13be357-940ef7e9992mr970009985a.2.1793006019654;
        Mon, 26 Oct 2026 02:13:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4918:b0:93f:1fc5:f07b with SMTP id af79cd13be357-940ef7e9992mr970007185a.2.1793006019169;
        Mon, 26 Oct 2026 02:13:39 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66bd3asm295841466b.56.2026.10.26.02.13.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:13:38 -0700 (PDT)
Message-ID: <d9d6a2c2-545f-4b48-ae19-dc30234540e0@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:13:34 +0100
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
Subject: Re: [PATCH v5 05/10] drm/msm/dpu: clear the CWB blocks left by a
 previous reservation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
 <20261024-fd-kms-fix-smmu-v5-5-a5b0b284aead@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-fd-kms-fix-smmu-v5-5-a5b0b284aead@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6adf19c4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=xIhFS8ZktLuDZ2I-VrQA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: VgdhQ6ocfIMwQHzmTlesfI1_BEMQGm8m
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzNiBTYWx0ZWRfX6a5iIc0T9jFu
 5OEa/Pb6rxM7gqpcEJ6vk1MeBVeTau75bkHrPrAzOqsMzh0mhyKYMjzjXLqw5ep+sOEmog+xLE/
 8GTAThQ0FOcYg0f7ueu+P/XypllT4qA=
X-Proofpoint-GUID: VgdhQ6ocfIMwQHzmTlesfI1_BEMQGm8m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzNiBTYWx0ZWRfX9JThoNp79CWt
 MXiBYFHHyd3TCoyi9r0BBcHWu6dh06JZr0JQ51tVq/tL8unnHksPx1ML9z5x1sp1CkYmUG9BphA
 7MCFFCAFYNUXshPSMpaIqXx384uF6hPX6B/I4HIC/GONM0RpyijxS8ITQnOjE45zsE2BPpP/+Ja
 /poVtv/FqD+ChSpUT+Z94BNWxvUmbk+vv1b6aVvfGNIgyPOsr6ro/0PRFqifrdlTCPXqf4OYcym
 ewgCrz6y+H9XkgOZ7nzatPCE4NNUDjdG6rn+Xwykq2UGbhX5Bk7zR88B5AiXQ2txaqYYv0CMtgK
 v5t66kCYvI/fGO3BgJ9ThV09rfuFOGZLlwQxCNdyZGDcgCRoRcVuhbPKUAzor/mCQOBnb50hz72
 zRx39XRDCjSdVfTUgLyINBlbQHvoDjKjaX4F7O9r/EUeKjeOP87tfY2i0y1TfNPjMphfTNsPtoN
 WhUIUK4hC9ia5k/ldmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260036

On 10/24/26 1:25 AM, Dmitry Baryshkov wrote:
> dpu_encoder_virt_atomic_mode_set() only writes the first num_cwb entries
> of dpu_enc->hw_cwb[], and not at all when the encoder is not the
> writeback of a clone, so a modeset which drops the clone, or reserves
> fewer CWB blocks, keeps the pointers from the previous reservation.
> dpu_encoder_helper_phys_setup_cwb() then walks every non-NULL entry: it
> programs a CWB mux the crtc no longer owns, and looks its pingpong up past
> the pingpongs actually assigned, in the uninitialised part of rt_pp_list[].
> 
> Store NULL for the entries which have no CWB block, as is done for the
> pingpongs.
> 
> Fixes: 5008375443ed ("drm/msm/dpu: Reserve resources for CWB")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
