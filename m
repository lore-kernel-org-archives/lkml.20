Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01521488234
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792416468; cv=none; b=jFNGYM1nK8dpRG2DtXidwrPGKQxrBsC5Q+M+3jiAPhx7oZeOrDNACttFLFrYQZ/kXQw4F21K8ogcmFv9DpG0bTQXPC1ZushDLu2d3CFLEhYcTedcu5iwGsqe9WauTtLemMg3VIs/M27bFKbS4QqwVxbQ0UJNBnZeoWhVbMpzGPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792416468; c=relaxed/simple;
	bh=US44NmlZcVMm9a08LdXXM5xwMBLepJU1swlqY5SVK/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J+ORnYXnQ3OtBvLEjDffbJCPQy11Rl/mCWa587BwRkN5w4DPqcxSapTChCIpVqr/Bd4InSjowjKxmad0q/PKwTITOMpoxY7QlqeeCnvVSBQG/j6DVDJTBya/HNsD7QdXFMo/tc9FOZRIZHkI1JjapoXtI85ZNTsgTRfJj4IrHKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Du6rHsLa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ii6g6G2H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Du6rHsLa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ii6g6G2H"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JCsZuM2483627
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VzSWM0qjlnwVL0p0Q5tt8OPvdg+HopCHeCS0win3WeQ=; b=Du6rHsLa1o+uVv4p
	avJ5ig2JCVloBqKJXUcI7LZN2UAmOs5Z9/hVLb3EY0OdtCg3r+fi7lk1QZwdkF71
	QeBQQ2UTYFWuMGPuVcm4Us8405DUS9oSO3i9s0IeSyZqar/4kxPe1VA1gxbz8rFD
	mkZFgguZ7SUc3WIpvtoiEy/R9pCtv8Sjgoejt6luPrLdExbPaOdJjQklWq9MLo5A
	oMyelj06IEX0KvKAI8q6cCuxp+bdDQhafdcMzoov3Fn8k5qRXYDWPcSOpGQtjllC
	Vrn9XfKytotRmcO1WuFYktDi/mwzdCt9Skp8635KX/odZzmBqmAoZvIjNziaB+2e
	6TQJxg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdkmfg4pt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:27:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ea8a9cfe6so83399685a.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792416465; x=1793021265; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VzSWM0qjlnwVL0p0Q5tt8OPvdg+HopCHeCS0win3WeQ=;
        b=ii6g6G2HJOWjSrVHjGMUv0i3o4NRCn1ZJuXAm/cRHMD4MXhCK1Mx5cBBrx8OY0bCTD
         hC43cpCIUYXYdroO/F55NLoPYptbOMjonMkDlCz6qeLsiJKGhj4HWjdrcKVFdu1CGEOI
         vojROBRcZPCi/lKsc77rond+nPOzAupxeGittE0bbOQOPwLcv40YDPBEdf3J7txHfItg
         JRCV7vdA/IxRpfDk7Xqvcwj0VxDzv6P6M/zmwQo64CtYSBVV0fF401qSyOaGtFbyM75/
         t/jIJ9mZBFZCc4JPpLlPY4duEgy/P0yt7DRiGHqb8oza3rpF+7txEsCxecKsxTDrZhVa
         80hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792416465; x=1793021265;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VzSWM0qjlnwVL0p0Q5tt8OPvdg+HopCHeCS0win3WeQ=;
        b=KeOsLnmcyN2Sufc+dMCyrRJKUj7YvfxKhL2i71kiK/mZqti7vt42DMXqJcfyTz2HA9
         P8EQr32Dpo2Exa8lgoBuk4yS2R9PhAwFE2agGmLDmPHwDC7thEoIhVg1LNFp3D9Mc7lo
         24/eSJj878d0i6T2VUdByueN0j57+C64m42+y/5Z3sGPNryBsg7WAakHLtC8c1qevKhp
         VUu0hu7wlbMcIaznGegdG5LhtGEhl3T4063wDq/cCeoJvGVWla7aTFHR3a/gU0zFJuj0
         ySlxET2mzBwjMRtENv5Jue+jlIipQ+kL8/FML6/6Imu/jm+N3nbDZ8ZKiygnumEUdFon
         L4Vw==
X-Forwarded-Encrypted: i=1; AKwUvBwHyt5wfUEKc1eu/LKYFJSj6nIpPXWkxaSJ70TAlUDF6YbDpULXuJUnMO9c5MzhOGvhN9FpFky6FrEoux4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAJKZCN+0C8/CSyc+Cdfv5ptGtQ0gW6b8GdtS0AugdBlxDUM0T
	367He8sEmyqxUVqigZcdLbD/jf5xj1OvsOVn9KIBPgTUBPEF+0HVnflm+52oA376z79PlwqFj6t
	N2C5DRK4PUF4mXNz1WqohsRtILttltPAzI4BKDCHZxC/kMnx6txzRUZNy5zELAHZit2U=
X-Gm-Gg: AYBFou34xhso3wsvLBjVkgHZuTU2H4KBwlZCG4fv/tcZ4aRMMSxetXwKFNpiWdxpw73
	9/WMLJypwKbC+ZS0zcuAWBlY5HdKZ5/2hqC+gL41Rw8mEgNsHZrh0dnqHsrhCZRIwSoq3ebeobe
	5q04fYQYievu3csm5oAzTX9yHcc0ONivhTE2ZwnsPXIs1fMknxtYbg3ZpIEghwgpnSWQ2+fScGb
	wnzg2gY1Zr+Sd/0zj6wAgjKw4aHGQp5eAbrFc6bIE1ENa0s+jVjUrmbFUnmtmV3aEG/s4GOTMJV
	9iHHP+hTYtOLITws+aBMxU53oHiX7WzChoZgGO5rmhqpCxyOUFoXeSb334j0HA6E3HGLIVo8e45
	geIpgHz9o50g1XKuNcOEEwA==
X-Received: by 2002:a05:620a:4402:b0:93e:508b:7800 with SMTP id af79cd13be357-93f29a21553mr1469818585a.0.1792416464340;
        Mon, 19 Oct 2026 06:27:44 -0700 (PDT)
X-Received: by 2002:a05:620a:4402:b0:93e:508b:7800 with SMTP id af79cd13be357-93f29a21553mr1469811985a.0.1792416463768;
        Mon, 19 Oct 2026 06:27:43 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b1347sm4058496a12.12.2026.10.19.06.27.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 06:27:41 -0700 (PDT)
Message-ID: <9ee7225b-588b-4253-b766-5e6ee6dffb04@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 15:27:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: keep vblank enabled when entering self
 refresh
To: =?UTF-8?B?UmFtw7NuIEplc8O6cyBNaXJhbmRh?= <ramonjesusmiranda@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261018155423.1299629-1-ramonjesusmiranda@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261018155423.1299629-1-ramonjesusmiranda@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9uEHv3Lqg94nLbCp9gUie45M60Ln238v
X-Authority-Analysis: v=2.4 cv=O+isLx9W c=1 sm=1 tr=0 ts=6ad61ad1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=v0c-XO7ZLijyoodaFGUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1MyBTYWx0ZWRfX4ZfcNBaDUZJX
 Xixbo2e7svQ8sTdw8/zY1nOIvyUvypN0ZROQKB7fpm74fq2fuquzORYDywAtbxrWLrP3NII+MsT
 HNkEkhihhoLQbe3Dc0TvuC9QPx1fUoiYbbLeSMpVaDR0mn45e4cEvVMr2P15Rh1N0cn5yojvphb
 o4d/c568Ci/fsJ7X8HO2n6aXVx/jRF13v1hyo9LSp5qvtXNzcE9ID4RvYd2a9HDfOQ50bW9zvI+
 uihuplpdiLlA+rA8epq5E7ZYMhBmrTDLcFSD/SPwsn8RCng8AItMxl4b+u7n6OuylFJJuH4dWHi
 aXRTgLpOVrz7YmM9KTRbk4vNOFZq09w/OCN0Je2S5tE1prnHagwe+4XDifEZCPuIwF/fWosccsa
 Pl9DBR5pQVjOZfpxUIWjlMF0L2j//GQWzkIew6OgmERvohxtxgTI9M2bHYrk6w1mzwvU42RBK60
 tlJ+BuTEhCCEQpprJWA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1MyBTYWx0ZWRfX5/bpD3F8qguU
 mli4Lcrcp4Nyaee/QhYTWHd4HqOroYkGfwuIzyc3U3GRmnV9qgMWwpmoNOQO34JEgT/mwNdlQ93
 66SMzF4hB1tJHCH4KPFXIxR/otGORmo=
X-Proofpoint-ORIG-GUID: 9uEHv3Lqg94nLbCp9gUie45M60Ln238v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190053

On 10/18/26 5:54 PM, Ramón Jesús Miranda wrote:
> When the CRTC is disabled to enter self refresh, dpu_crtc_disable() only
> checks old_crtc_state->self_refresh_active, which covers leaving self
> refresh, and calls drm_crtc_vblank_off() otherwise. The atomic helper
> then expects vblank to remain enabled for a self refresh "disable" and
> warns:
> 
>   driver disabled vblank in self-refresh
>   WARNING: drivers/gpu/drm/drm_atomic_helper.c:1296 at
>   drm_atomic_helper_commit_crtc_disable+0x1c0/0x1f8 [drm_kms_helper]
> 
> Skip drm_crtc_vblank_off() when the new state enters self refresh, as
> other drivers supporting self refresh do. drm_crtc_vblank_on() in the
> enable path is safe either way, it only drops the reference taken by
> drm_crtc_vblank_off().
> 
> Seen at every boot on a Microsoft Surface Pro 11 (X1E80100, Samsung OLED
> eDP panel) with eDP PSR enabled; with this change the warning is gone and
> self refresh keeps working.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Ramón Jesús Miranda <ramonjesusmiranda@gmail.com>
> ---

FWIW this is not enough to get self-refresh to work on the Glymur
Zenbook A16 and the 8280-based x13s, the screen stays black if
there's no updates (it worked on the latter in the past). Dmitry promised
to take a look one day.

Konrad
