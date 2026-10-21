Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792561753;
	b=rnhGkmiWSY3Sn6zqV9M8lAWWSlPqWf8ZD23ZBVqkiukurUuc7hkMAE/3998FRo3IfXtD
	 xSctvHWZJIB5tIqU38aOOzE5EWekf2lglfIsrMDEYFssz5XVzkPnoV9KZGNjHr0TGrUP+
	 OK0+OAcwMSr2bsftmw1uNzA0Eh0BxIB2dqNyz1MhnZJd7Lf2OGRDVz4Z1T3JuMPpH6+aI
	 ZlV0dklf0lrmMOS41CD46HPftQF3BAaga/EqWaws3xy4C76k9VXaNuo8oXUxrmxQyp4gl
	 0aTBQTWRYh/SaOMkcOUEKUplOp1wAKFKfclo0RE9jjI1e2RJ4fqdMvQRXFcw+cDx4sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792561753;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eZlxAyBevgnOZgMWqXb33BV1biF+L6ci4PbJk2Ledrw=;
	b=F+k4GfYe7q9okrqAM6yEqoPxEAwXtROeJ1qgYUfgsGrghTAKWvpKI8s8Y8F0mKWq9eUz
	 T28RxETLh/990PcWPxvIgPDK8ycZUbcWI3sZdZbxrEiDfDRs5NBDNUJZ68Ot5q6vH+f4r
	 J8eUaBSG0hl4dtgqd4JUp5+iPyoPBFhv17OGilU6g1/ldw8pzb7NodM5GllS4jKPhcpUD
	 vHXTe8y8+J4PX8ERDOXwhRr3C2vgw+ixX95t98x6BBWR2BdAxGS0z2v27tfS4d0undE5J
	 29px/oKxhoB7pmifeECyYadKUXMjbPO1sjTR5Snyl5+38DbDw8YtvL6vVJZQBs3xaqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WFKeXP7h;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PMHfKpMQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B53B606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:49:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B53B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WFKeXP7h;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PMHfKpMQ
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jMJ12848656
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eZlxAyBevgnOZgMWqXb33BV1biF+L6ci4PbJk2Ledrw=; b=WFKeXP7hTU7Qcmnx
	vSn8aoIPInIUlpFHSb6EP5or3x5IU8slSvFDU76IPfKvtA9t+VYSMTaPmc0kg123
	ruD23M9fCx01FhJ7RErYE+ij5FRr/z3GmoXZONnmGO1KfR5F+wop00b2PsyAHvSV
	4zkVK+DawGwjCJECk5+k5RjvQsdGrVO85IfhA2y0cgV0wr3GFEeGLDhBuy1eK5wY
	nx6na3l0gjNrEUgcF4JGihLMBFQSF2F5G4FO1bPcavA7JJqO8hok+p9M4fUuWb9J
	ERn9LSxq3EdKBbbXLaAg50sV4BZB3bFcVgcVMiUUFaO3xeSGHsZlmKRpupCjyXNs
	ksEiTg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb99ynb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:49:12 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a0589ff620so268863b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792561751; x=1793166551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eZlxAyBevgnOZgMWqXb33BV1biF+L6ci4PbJk2Ledrw=;
        b=PMHfKpMQY4k9oE314192rW2EYYsIadp/ow5kYA7BYqq5oGt9yzxo09bReqCF996Csp
         H3yPWFGufQCwODVGAdOhTmZG2tYQ26GjcNPXDcChwoP0h0yE+3ONuZV/M2kwNjqC1YP3
         DP+CtPOTyeku5GAAXonhCv07qTTMgRyUyk7vwvZcdF+xPbEcwSI8iiPYKUKLqj//2Fcy
         7G3/M0ArT6ALv7ZTdxNgf8n9BF9WIGbhg3UlUbgMrEdkV3jZgWOm+hcqA+ZIJYTsewOj
         24d165pmNm/U9RgHcl2AumZ/aEIcUv8plQFnCMBp3jqfIgBnwwhWJP6D2/bI3kRRrI4O
         mB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792561751; x=1793166551;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eZlxAyBevgnOZgMWqXb33BV1biF+L6ci4PbJk2Ledrw=;
        b=hN4bFKX/NTH8j8H1PyjcsR+SqoaQr1hl12jBwolmhW7EVyMPcaI4pA6jQoGcuh7/+S
         1ayWwvPvGKLpFrTgxxTX5Ou0yuv99VqQNm14m/gnjrlEURtGsAw2DwydBCFhBDE0NGJd
         waOLV3cKP0NSM3K+MsuuY0KUBKxIckApzR/Z9zjlnJtl9MDC25jJeaAYQ+WUOIQZrJBF
         70rNDwXaf7Pk4fFbt36CP/5J90ZuezzdXiTHGS6RM5w1DElW8Awvts0r7BBcsu6Sp+aA
         p5v7DvJYBMCqcu4uL1dbQ1VfJyYLR+B5Q1AFIz36bzyOyR21rFD6mtzTLAKDbKd0uZRL
         63Sg==
X-Forwarded-Encrypted: i=1; AKwUvBxjzfg/PLdrtTcAFS/4HDV9ZZy3W3yesDU20md2kMFv6mas18A4od8DDtzb4Wl4oIVzlyMRgfeR0wyRfA4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHFqmKg0vjVBmCtBPMA6ymTQ6ZjdibsRzwxVZSoUfeMPEeIiNc
	z9u08GjjhD7+oBgDR+XI7pLcQ7u7TPe50RnKL/g5kJXUuJDWmlzGPsLCVuX+cRxiPOqeub7JLgK
	KdzRvhBM5QIUkPb9sDemYdYCWSXizkg6svTzNEGtpmcCwIbGFnY5w7C/LudQ4hH7D4sw=
X-Gm-Gg: AYBFou3OcG4ZnHmmrXXDXC2WrPrEAO/BsrF5is/7os8GFIw/pn2pHKpZw8yDugR8osA
	ULN6xRkHWM6B6uLMVeXmG0B0TOe9FcteayPmvrtoOjKFHrnA5EYSxFYCaleiUZE9eA+XtME7KpU
	zaq2U5qOA646Qtj+Q7KXXxgDhPquL2KGFWZZdZdNFXz/TzzmMWJ9btfoS2PFa4ZhCnjuyeveYiw
	9bDgHvGLXuIQQXgWlJwNPhEP18aIO4USuaPbb9nCFdpMMfk+2rp/oOX8NGhltLo6fNzJEHY1Uxd
	LG0abVhuwlLGBYyWBagTtBjKGziBQFxeE2tkIlHF+8YzstdsHJjrK9Z3WGEKFWHXvPJMZkAayzJ
	oJElC9HKfL3OYSdlY+G8v6K8b
X-Received: by 2002:a05:6a00:4287:b0:89d:a947:9d58 with SMTP id d2e1a72fcca58-8a089e3fa8dmr773635b3a.25.1792561751047;
        Tue, 20 Oct 2026 22:49:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:4287:b0:89d:a947:9d58 with SMTP id d2e1a72fcca58-8a089e3fa8dmr773611b3a.25.1792561750583;
        Tue, 20 Oct 2026 22:49:10 -0700 (PDT)
Received: from [192.168.1.13] ([106.222.228.226])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0894b49c6sm415288b3a.17.2026.10.20.22.49.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 22:49:09 -0700 (PDT)
Message-ID: <e4e2b8d6-46e7-4f59-994e-39f3d09d334d@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:19:01 +0530
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
Subject: Re: [PATCH 3/3] drm/msm/a8xx: Enable CLX feature on Adreno X2-85
To: Oleg Keri <okerixx@gmail.com>, Rob Clark <rob.clark@oss.qualcomm.com>,
        Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Bjorn Andersson <andersson@kernel.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        regressions@lists.linux.dev
References: <CACSVV00x091i7BKW+bj0RUnkd4rOrHXbhZ4zF6SuTU1NAqsFTA@mail.gmail.com>
 <179248663855.32151.9955864156939592299@gmail.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <179248663855.32151.9955864156939592299@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyMiBTYWx0ZWRfX1CLEo44c7x9w
 E5QiOsa+MCKkTL4Ts8ELwWWOuMwE0M008vr2EAbWDhQTWmWlMpnrljjywZrIoLnU2gtfuIQadUI
 lrwZMeUxJQvCU4Z8WEuBj/TYTiEw6+I=
X-Proofpoint-GUID: 9hwAe7Cku4DYSWaDsmwj_-9gD6t_BpiA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyMiBTYWx0ZWRfX4RLgRuCOwU/l
 RECbQNKC9nEpNSVXS645drBQ2K5XA90FD0g0VMj3bxlsxYSuSXB4hyJN7MnEB4+UHnLph3QGQbr
 2f5EAC3hKRrRNOBS2QlCGShJKKB3S67LHixLg2krssBMWIAt5zNM/DgvAco6dzbKS5Nc+7c2jEY
 +4uQqzwRZVLCFphdnE8dABCMDFANqSmvin84pApYWIzjUGOzfxSvfBhZHphIEvz/W88YLfIxyui
 ktLK6rvCUDc19q89nOf39sSmAe6IS+/XNsPjehX2imbs541Fu7uKcQP8suD3hn13bRT8YEv2mQr
 EN7fnXvhFR9lSg9CdkjASb9zBQbDo8HO6bmzxFsUihMjyZw5YestQh+yZaXmsr1B/VTsqFq1V/J
 +ouOFFa3BSjpc4Q6N+88EQNRsY7jmMSl8Q3r31vyK3zUMv1VrJgISLIraUz9ys66x7d4aBC7BL0
 GUMvtFRmszzmFY5jh3Q==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad85258 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ipsIN8yD8anPosRfiFfp5w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=cjh-xzagbiWEAgRDvXgA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 9hwAe7Cku4DYSWaDsmwj_-9gD6t_BpiA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210022



On 10/20/2026 2:27 PM, Oleg Keri wrote:
> I guess this should be investigated further. Yoga Slim 7x Gen 11, no modules,
> firmware built in, so the GMU comes up at 0.6 s.
> 
> It's rpmhpd. Before its sync_state, rpmhpd_aggregate_corner() pushes every
> vote to the highest corner. The gxclkctl probe does a runtime resume/suspend
> of its GFX and GMXC domains at 0.18 s (qcom_cc_probe -> pm_runtime -> genpd
> -> rpmhpd_power_on), and from that point both rails are stuck at max until
> rpmhpd syncs, which is at 2.8 s here. The GMU then does its CLX DCVS
> calibration on a rail that won't move.
> 
> The GMU log buffer (fw v5.2.38) agrees: the calibration trace of the bad
> boot matches the first good one step for step up to the ninth level. There
> it stops, and the firmware puts HFI_F2H_MSG_ERROR 0x007306c7
> "ResMgrCalibrateDcvsLvl" on the debug queue. The GX_BW_PERF_VOTE timeout is
> simply the next message we send.
> 
> With gfx and gmxc taken out of the clamp (hack below) the first GPU init at
> 0.6 s just works, CLX tables included. Three boots so far.
> 
> The wedged GMU after a failed attempt is a different story. Retries after
> rpmhpd's sync_state still die with "GMU firmware initialization timed out"
> until gpucc's sync_state (fw_devlink timeout, 13 s) collapses CX. That's
> what the gpu_cc_cx_gdsc/NO_STAY_ON thing in my earlier mail was about: the
> recovery, not the cause.
> 
> The RSC side is not it. On A8xx the GMU firmware loads the RSC sequencer
> code and TCS slots on its own; preloading them before the first boot made
> no difference.
> 
> Abel's CRD failing even with msm loaded at 90 s doesn't match this, unless
> something keeps gfx.lvl high on the CRD after sync_state. Could be a second
> problem.
> 
> --- a/drivers/pmdomain/qcom/rpmhpd.c
> +++ b/drivers/pmdomain/qcom/rpmhpd.c
> @@ -1009,7 +1009,7 @@ static int rpmhpd_aggregate_corner(struct rpmhpd *pd, unsigned int corner)
> -	if (pd->state_synced) {
> +	if (pd->state_synced || pd == &gfx || pd == &gmxc) {
>  		to_active_sleep(pd, corner, &this_active_corner, &this_sleep_corner);
>  	} else {
>  		/* Clamp to highest corner if sync_state hasn't happened */
> 

Acked-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Could you please send this out as a fix for v7.4? I will respin the gmu driver series and revert this
bit there. But that would be v7.5 stuff.

-Akhil.

> Oleg

