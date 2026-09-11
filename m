Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0EC49E5C6
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141565; cv=none; b=ofb+etq3Ns8n8Wr3fOCRFPY9e41LtJM3yG5i9jI0ALb+SpAUZvXyreopyzaDQkgsvVZYRgh174ZbVMjuiFzSMMfPpR2q6mDSmULgOURQHt36KzXP942CtR7ChXr6MNZzQ4GE4rQawYjiR+KIlR5m8NUTpS+THG75KBhv/TJPXT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141565; c=relaxed/simple;
	bh=tSipPj5v+toT6eiLFHZfg2ay5LiIR2f7cdFg1XG63rQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CXCjhurhlfXu7nbIsD5q981v4KOBlYuJV6SYL3BtFftimWj2EIjgZsVaVjQ5Y7rz296Mx66hOmXaedgY4C2ylPWp0KNGMatanuchqnJaA/Xz5y/2FHF5p4W+Bc+wv8KL81PhmSb7l4XuWiBIedNTFwNLgDPDswDHCa8KE163RCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wd3F/Da6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WGvwmlK+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wd3F/Da6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WGvwmlK+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEm2Xc442908
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:45:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FMETwDp/3YlyYwhOs1PhYLsbVwlSu+GFV+6efISo44w=; b=Wd3F/Da6OWHvXlJs
	5MGUI8D4JBwW1f0djoIFga8S2//zfxRJ9VJp7d2UUsFiyojhZXncLnxKw+VzKLg3
	/mC04DOfa3dgnSN/ATVUe71pxrk9tk/ndiE+9OwvftI0QiSmvD4MD1UIatdcm9od
	ovNC7kaK6CX4zMTSbtTvi8kVtFFSjp8R51lRvvKxWyHBlM6Jcu0YTZjKbwBjMUOp
	t/tPPXb7c4lMp8j7YWF2UQ6HeIRJiEftgejKs/B+RzuiY59o77ErqTKhr3BfyahC
	nKrsfLdXLQe3x1JfE3uspr/sfVBfnzb+CTiY4HAQNrgGDBMmAm2VtdUqlbLAi/iH
	YW8k5Q==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmapg2pk6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:45:59 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c7d6767d06so37105e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141559; x=1789746359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FMETwDp/3YlyYwhOs1PhYLsbVwlSu+GFV+6efISo44w=;
        b=WGvwmlK+MmnODzkLv499bwOthe6QuYGjIFCAqU7NUT5lag+1Xod++rqGZ9FvFoR9y4
         LEmNGpN47/P17pvnq2tKB4zqD8fmuIvedQqzzTuvmPE4MV6j8Hh2qbVY+72d2qPlsEqW
         3JnrboFb/LDRRxt/9cWYTWhYWk7G2+W94vIbBpFumVpJokFXng8OcEufz2omOhdDQAWf
         L+GpUklTAqfZtEilUJqhdmGYeWxhGXv7lUUsnA3RsW355syxsXsKcMZa1c37y5H9zW+G
         QClW+hE4AYQq6bRIZDrEeWr/sZ/M5p//ilnKw/5dN3ZpYzSTyR0IDpWbw/qHNA/IFy7U
         e5hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141559; x=1789746359;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FMETwDp/3YlyYwhOs1PhYLsbVwlSu+GFV+6efISo44w=;
        b=ry+5igVDMWC+Nw31AMabSzb8Js6wj35BJof74r5dpxcgHR350Ci0WGch0D7EkF3Wkl
         UxyrizDBWS2Blko885N5h6LTX9A9FH3VLmHbgkSKpiPmLeACGII+PJEW3wKPI1m+AOL8
         9rZptGA6bulfnj827TYltLr/0BYPgN2yLMr239Pl/Tn5a8enzUlrBScDXNuKrWIsQivu
         XllRJCVN0Tvn4u79/EzQRXIF2w6t3wIVNsFbuFkQRJukzBs1SvSWc/x2f+qE5SvPC0V0
         tKEVWlOX96f2+WeHR/bqzAbJh1uaT12uLXgN81GG6WwIR9aYAZ18FYeMieSXnP/HztyM
         Fz7w==
X-Forwarded-Encrypted: i=1; AKwUvBw/gP9+PueVYe5BNgbck+wsuSDLLa/kbthh+kG7phxtVQNT6iPFywq+PwE78bRru3AsgamCoAHGDoH1nv8=@vger.kernel.org
X-Gm-Message-State: AFuF++lQHMlSLpws2ROfjsrlisBuLsJWVcWS107bEay3APW3LK8lBluv
	xzbV+hxH+JO2hSMVSxxkgdB45c/JA9Co49fIS2MP4iV2RxI2hdZYFEXPVrbbZho/pscmpPXs9TM
	agiIyMi9XGq+IMsPf1ExTn8LmZ+VGuMuRR5aTOiC2xPiSq8I/iIprBQGQAkqiXRNehrcnAbLWRB
	A=
X-Gm-Gg: AYBFou3zuPn4YEdbeQQP/+8J9xaNwTJMuYfl7O7h4Z0b7LlTuSuUP+c4ArEM0g/u/i6
	bviBeJE8WUlbheypt9xQW49QqTxYjn0JHf3lFTG1CfQPPE9GGWwRazqLI+f4deBt0FAfDo4GIyT
	6v3nDQlR+Tjh5BjYpOjLFROlho8ULfokX5ToTup9xPpmoHoWcCrftA1KWfW8w04U2q1BoF6xP7u
	VpHeKumMGTL4WyyTz7KsaR1jmE1zvnopIql33DW5W6C6TtvTxqfItvKVHbUR2thZjt0wJnkSKJe
	dZeoIdBCOn4koEvLd6eN2osrTapBGzxBGhxNNTPBQTQUOAz+pp3H301HVQquqtuukwNZes5Ryms
	sn5Cv8nq++dxcROwZSYMF1w==
X-Received: by 2002:a05:6122:6d08:b0:575:dcec:efc1 with SMTP id 71dfb90a1353d-5c845d9f78cmr2224881e0c.0.1789141558802;
        Fri, 11 Sep 2026 08:45:58 -0700 (PDT)
X-Received: by 2002:a05:6122:6d08:b0:575:dcec:efc1 with SMTP id 71dfb90a1353d-5c845d9f78cmr2224838e0c.0.1789141558370;
        Fri, 11 Sep 2026 08:45:58 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047b678sm723077e87.78.2026.09.11.08.45.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 08:45:57 -0700 (PDT)
Message-ID: <ff5806a8-ed97-4023-849e-6cbd9b88efdd@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 17:45:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] drm/msm: Properly handle msm_ioremap() without
 name
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
 <20260911-drm-msm-hdmi-fixes-before-eliza-v4-5-87bdb9f1987f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-5-87bdb9f1987f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: awchdcF99cE-Fc0EFxasMH2KnKS3hA2q
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOSBTYWx0ZWRfX0HTpQewcBOm/
 eq/K8bDqPcETQYkyX3L4tP8GMHIopbCTpoIbR3+dQrV7QyI8xpLIo6N5CECwdxOEJd4UWex1gnz
 dNVmYdC9OMxUfh9RfwMEUsyVElsVxOs=
X-Proofpoint-GUID: awchdcF99cE-Fc0EFxasMH2KnKS3hA2q
X-Authority-Analysis: v=2.4 cv=DLoacCNb c=1 sm=1 tr=0 ts=6aa42237 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=pPDQwCEtd_d-j3aiaSMA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOSBTYWx0ZWRfX4oYqVei8o7TQ
 tWu/sbPmTVkDtEqqhbvL9uiBmJeJCrww0NOjLrBSWVo4YrTUtk0WISuZZdtvxGIXsSZi2qKfbWJ
 Migm/0Tf9Ym52zzEYS6Cg1btyjCvuxU1Ge/76ht9Dufk21AaDIaHUw+JtH/AVBlz5ejrJQnj136
 mz1n7tZaYwpUz+ZcBdPvelvK1Ht0Seo/7Xq18islgLmdU9dcW1feaR+1257GOrBtnYVgX6GYOic
 vv7Zk4Y70nkwo03MEDxi0RDO+8/NYgAL+b2fGfjUG8nfilbLEA0c0Ln44hE//qUWI6c7zVUkqCG
 uWVVYp+9BscX3U8R0AlTrY900C2UEjK1vlAkPdacesDAKiP9Oh63CTAPqN86TaxwlSos/Nj1pP1
 cuOX2wwAptWCiWRbCUQHcsIAElAsrDKL+tWfssMAqEfwasKeX945eTYT0KzjVSQ6vPs9/PtpQWU
 XMo+MZQ5Ilj6Ym8bCBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110219

On 9/11/26 12:29 PM, Krzysztof Kozlowski wrote:
> msm_ioremap() accepts being called without name of the region to map and
> in such case maps by index 0.  However error paths still use the name in
> error message.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
