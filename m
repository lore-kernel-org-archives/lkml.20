Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBC53D1AA6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 19:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788462170; cv=none; b=ZdVg6eUr69OCn2RrJ6DPDd64ak/y1CuytBepKE5ebtxYhtliqFrhbYcljAyDI1noXTO9bqF3dgjgdFwaYq+1JxDFG5ShWElTirfVx/aBGf77RpGmIePXY5kr0RifkRa1WQAgN8wTLUlaGaVnyE2RYLTGnsPNCxlTAtczO5gz878=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788462170; c=relaxed/simple;
	bh=dOBXc96DbwsK3E+8GXOtQMAox6ioarRVea5CugJtX4U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rLV8kPjTUDKOmirMiRSHutaA4FVvqchqNKA6JQPoC1gllXMRuBtMzWfBex2flCd+XbHzKhapk9i6WvEWgdK/qyq9UftH/4P5UsWz4p8LCGWMUX7DOJuAH/USqFh4B2vnFfzQAtQSHpPNyWJVgfbkUl2rD+wR0OvaM4sexNazB30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TrNdT6xW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ObLMNZ4P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TrNdT6xW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ObLMNZ4P"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3ABS2088809
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 19:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EJ4aMtCvn3Z4Yt7yz9sP6k2kSmRo47TFlV5RXh9nwkw=; b=TrNdT6xWJzcSw4Sy
	F3IjJLsBVs1gNPdUmItnOXL5sTgLBUjudXUKQMPimwGyhLxqvrQ1JNdRkCfHiN7k
	bAGQUtLECHf3iqqJCJOFRzdAzX13zCq/yW1Jw2NvCMUmofmY8rrpgKPV609hq423
	oKyOFX9HyljUtk9BtFN5BULRwrVrao96WNtprq5x6szWEEAlhDbsGjBLw3g6WHMc
	K9Eit8bEX6LF5wcogpjYBdAF5UKvTFJmbK5/XfnXESc5REayO6Ef+coXKaZsrxaa
	ETSGf7zOsz8M2RIXiLn0kmnyVpm82iIKpQ54yIFI3cBryZZREEnCGA+eHom9vhEg
	rJKJZA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf9b19sbk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 19:02:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398e1fafe17so183795a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 12:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788462162; x=1789066962; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EJ4aMtCvn3Z4Yt7yz9sP6k2kSmRo47TFlV5RXh9nwkw=;
        b=ObLMNZ4PlPPIfxJChEzehj+VnqMc/Qjrt3Q9+MIoC6QaFBiJmcSv4Piqt9depjV1K+
         oMmnxJM9lMZrJs/Hizyg/AHXvYNdS37TLLfTDUqep2+8qpAtMxF3ojFOk4RIIez0UFk2
         CI5ZSoO7yyH5Z5K/2AQa3tqm7ETVo7y/YQ0PlEOvuVks/TwRy/WJ5s9apkcG+cbZtiVY
         1Xp3BxsAlkcKAdPr13oFTF45q5ZxNshD9JD+8vYYewpHubd4VCIfyh6RcoBFvHgzgyrP
         N4zHnXwc4snT8e8rCpUdIJqXlOMBjNzpQDfazGYX8A34zCMo2PGSfwdfCVbEE1x1FrfP
         2HMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788462162; x=1789066962;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EJ4aMtCvn3Z4Yt7yz9sP6k2kSmRo47TFlV5RXh9nwkw=;
        b=gZAmRVtJMc3YxfDimmkACLXnVNwTzHk/IwflR3Nq8KenbcQkvj3LPS2fKrIrULc339
         XgX6UYHDXZ9HkDkZdDV/4DK6NI+JiQCuahyiUgrdBzLfEkK1G4ifiOoPT9CLYBpyGVJZ
         Ep0kCpqfIxxDtHc8p31tHkNmlLXZwTQzKg0PVIZZNRqGDBJEuxpUd8gi2rExEqkNsfft
         1h6GzKBGwliTvpSC+W6OwGMaY/dKY5s7l/W4006ec5tFa5nbQkhBg4I5GTpGQ2CYKcaO
         ZdxsAG+hgtgR94WZoki/1EU9av3ZoMcoMbsL3kW5T2wdxMts6K8pURKWgfcSQQ7AkIJ+
         c5lw==
X-Forwarded-Encrypted: i=1; AKwUvBxysUQSRdN+nxMATSykMTrzV+xPeBf+5l1sQ/bAWknuJ6HrZm5hLkCu5b0c2THNDmYM4LSiGOxLvHSdKIw=@vger.kernel.org
X-Gm-Message-State: AFuF++llM89CMJmaxp8HNU00M/VuvsBJgWAq34jst2KS3vtFURobM7Ff
	YrA5F3CLoIPLhQfFwIi+Dt582skQB1CzvjwFhfu4ND2E3LmdpMA9x7LrCVoPcbLlwwfUDlOAuFM
	yB3GF/pbcnngp6N5w8y6HBru3yA2KSMORapS9ENg1VpPtW/97mYxg/R8239z09jDxEZc=
X-Gm-Gg: AYBFou0c+YZWnaBiMeW3G/zouU1jFMplMZZ3a7CwWnb/4kCNId6Wag88VzcA7M7MCM1
	RQDYtEpLSPRHoM54v6HdoQ78A1lEZ944iWIvK9HANXffLVg1t8G62KkhBDhXvyy1x8LVQ/5InDe
	CRqkveKo9mV2HZTViTl/eFk95O0CQ533zEJjeCT8LXaKflGDFyz7V7w4Tf9FdNwit8kJ+ZHJ70x
	tpVRxgAgc88Skf1vvNtLBaYmum9ZEZhoJ5r1Vvos/bKeWRuShCrLgJSWtdmMmeMgQA/0uGkWZUu
	JOAhULtDUJFnH1CYBoCEaol22fMd/ArncnGF2zHHVjJeBJMVlC3Wvq5LHLYm3D0z/k3H8gKrdY6
	Zx75dXHE0oGK8BaihFB/AqylzqY42n4x3WcqC5Rf18Q4RvTOtUyE2LuA=
X-Received: by 2002:a17:90b:4984:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-39b26104798mr880503a91.6.1788462161733;
        Thu, 03 Sep 2026 12:02:41 -0700 (PDT)
X-Received: by 2002:a17:90b:4984:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-39b26104798mr880407a91.6.1788462161137;
        Thu, 03 Sep 2026 12:02:41 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm1230164c88.11.2026.09.03.12.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 12:02:39 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Julius Bairaktaris <julius@bairaktaris.de>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, baochen.qiang@oss.qualcomm.com,
        vasanthakumar.thiagarajan@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com
In-Reply-To: <20260726221908.104873-1-julius@bairaktaris.de>
References: <20260726221908.104873-1-julius@bairaktaris.de>
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath11k: fix SoC reboot on
 firmware crash on AHB
Message-Id: <178846215969.824911.12599048326629539586.b4-ty@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 12:02:39 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: BLFEEspzu5eo7XfOByuVzUT0a_I0h_Yy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NiBTYWx0ZWRfX2BT3O1TuNGSF
 bg37LzX7xs9urrzbFM1dTUUIVIQP8w70zb9hLEEW80qdL8DM7yu8eKJWDLl7ef7V0472Bagl1Aj
 jSbd+AScUpV2QOu2VTyaAK0eTUJQM8Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NiBTYWx0ZWRfXwtBeBzxw4E6x
 ZApk6jrifSUry2lD31zWbmqTVAWz+DT1OwFAM+Hlz7KhB0w0Ff5uzXM09ctXGvcxx/+z2iLfnJp
 bQT9q44kwXGhshaszknmOws4wHD/XWAB9dZJDRloS0n8rmCxOZENyw7hYSpil+1kaaRuyreLIfX
 +vq4mXFaKoxU7qZYWtMiePBoA8NyYQnlyoY1SNf6VAjo6zaf4QTmVzgrTVzj3MIsPVi4qXqTDhS
 3f3Qi16vXBi1HYp9YwtDZBF6p97uJuuqMrAJ/QyMi60asIoXpyOowleuVd6OZQBBf9SR3GTJm/x
 pk9PzHMDR8Hu5tOwsL4bGPTFqokc7J+ugq5ggtRmvOX4ImcjEz1CJ+wthdVx41fQjxaztGE0/n0
 cjiaGfP5iSn9wRQNjrE4JmZ4SL772DOxHo7nUuvmBjm3Ii99Ctu0XBgBNBTsAxfXf+9kLcM+kda
 cXsk1OAPH6huDgzMF2g==
X-Authority-Analysis: v=2.4 cv=NNTlPU6g c=1 sm=1 tr=0 ts=6a99c452 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=36bELOsONUWl3FBOthYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: BLFEEspzu5eo7XfOByuVzUT0a_I0h_Yy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030166


On Mon, 27 Jul 2026 00:19:06 +0200, Julius Bairaktaris wrote:
> On IPQ8074 every firmware assert takes the whole SoC down. The DP NAPI
> keeps polling while ath11k_core_reconfigure_on_crash() frees the data
> path underneath it, and dereferences a ring the teardown has already
> cleared.
> 
> The interrupts used to be disabled at the top of that function.
> commit d455e805de70 ("wifi: ath11k: rearrange IRQ enable/disable in reset path")
> moved the disable into ath11k_core_reset(), which AHB parts never reach
> on a real firmware crash: reset_work is queued only from mhi.c and from
> the debugfs hw-restart handler. Patch 2 puts the disable back on the
> crash path. Patch 1 is a prerequisite - the CE half of the quiesce is a
> no-op on AHB today because the bus never implemented the hif ops.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath11k: implement CE interrupt enable/disable for AHB
      commit: a7ab5c835e4253b6577e4137367c05bfddd79fa2
[2/2] wifi: ath11k: disable interrupts during firmware crash recovery
      commit: f7a74e131d3f0de04335dbe278bfb82bdafcdb3e

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

