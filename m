Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACF7493D3A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954746; cv=none; b=KQeA8g6ArIjIzDPzQ+GcUwHKYy2Uuruu2p8GIlYEw9Ek/9WcquzsgZO41oI67N+SrjMnCx/2Ly5Njg7nJWd8obwQibqy57c0DV+mbKdOuhh8y8PHpcI6mvMLqgPjxXGBCj9kJ6C9p799RzfGqeWD3TF/UR0PUCfRecz0FdNPRyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954746; c=relaxed/simple;
	bh=tdwPMkur+zjQR52FF18bU65SzVwc6G71FPE/7UpJfl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hphLEr23n71OkHlAsWY3Y6xMadEuMISQENwT6JakpMGahnL/bu4dqhbvtb1hwQJdMdxGlE6YJG1r2aPRVUOhEs9P+W0ZxuCOHK8nJ/RWwGQDmoGCJV2VY4ddmcCtMSl0as7hhhiJm3UUQOnWHvTpa356IkpBBFpvqgAvOQ6NMks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=khiZ+nsb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gp2KmR7O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="khiZ+nsb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gp2KmR7O"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692FHA062121199
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 15:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r9D7+CFu3eRB8x/qjlqDxylX
	MyCw58C2x2mnI/2qAak=; b=khiZ+nsb7J/+R5GykhAtoR4Zu2+3GQ1d/AyzsQ/I
	YVKRzFd2k7sGoji4APi7o7CQGAOoqXU+qdSJ622v3mYiD6BFEauK/oWN8fU/ER0o
	GJbR9BMpQDYf3yJ+hg8lRbv07FlVg2ILlZvVmiGxNRH6t5yrtKM2Acr2FMJjKDAO
	b8lN/YXc+jky/6cWhiHaGO3HEUivgNTeG9czJzsfDlr3XR2Hxulp3+iOmRHyxIeK
	6HDTL7HuvUsZadnqeEKQyp9nFot5nB+hVJIZCA6LzigJZ8mcUb/57a4BnQpXpTul
	jx89+WwXExDfzm2YNPCfGla7QdOhBvbompEaVplxJ+pOgg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h20sh2vnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 15:25:43 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7bf853be08eso443764137.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790954743; x=1791559543; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r9D7+CFu3eRB8x/qjlqDxylXMyCw58C2x2mnI/2qAak=;
        b=Gp2KmR7OGJ5yQHQ9xtybHdhGbFtcWenCyaKH8lz4n+IlNlgcMCrRhZZVfgvECwh51Q
         ykM2s7Zwv2+a6NYHLWVPp62BLSzfJKLyZIQZj3lG5Y/5WwxvvvpeFqoayyg/RW6k7uy+
         xoeap3kBNUdeH3B5m5dZY6/K/ALhj+SdoLaV89QwXpGAxjzSJmlu9yYD1CyPBg17XZ29
         7b7bAMLGZ4vCSrlYv94odimEzxsMNIbPQ1aTINY+RFMXltEDVli0ZWnNf4j35LIdBiZz
         o35ZLKKrF1jvUF3fZ9lvah+M08sNnxCc3RZnFCs8iEmukfIvjRhtf4aQ3r6FGLlHVLmA
         KbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790954743; x=1791559543;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r9D7+CFu3eRB8x/qjlqDxylXMyCw58C2x2mnI/2qAak=;
        b=c/6QsWiHbaQKXtMf9eUDiumvv732hdF22M65awIUybp/iD2rzi/DPIigCxbmVKVk3n
         Uop/giTtQo5+r5/cbRqKIFHNIz2hzoSquo4wxLcU6g36fzc4scrVebDWThfLBoRMQNcg
         qAUmVPEZd+HxbOtPA5cB+XDFIphIgGQ4L+NHlZwWAVPS8wNxtBYiHnH89vaV5/oKtIM6
         7WT/HSph7ewg++nLKiK4lrfjYat/+Inwj9sijVx9l64Iql/IuA8ntQmIXlegeQh5mlRG
         6LlDdgsMldGqWLsug68n3FcO8+kXA6wsteRkFQbn5BdkGv2HATeqyoTGkbZRR5pGdWlf
         0kWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHAduXrKYzOZnILnMmBoIX8TiAlWWCdwQWZ7CMfJ/PcjERcAYn2RxdUKm4UihL6FVmNEBSiS5xsns4D9Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLChWKTlVqyz64f1sIh21M5we54ahGUZs3eyEn0osnptLZ2kYzB
	M2ANDwr2PV6VOutsbB/vZXLnzpYU8Xidn+Tarpj1AeMyDjpH8+envLm/kzZfyzkS95t154KelBC
	SUnr73ETrAwcpKpJFWxuNmJABjK5cOM58jcik6k8HDJ40zwANHMTvv1eZx9d1IJrkUVE=
X-Gm-Gg: AYBFou3BJRwTUmPm+FmIgkrnKGSDcfEn1/CfBvLOOLsG+AZk7wVmxmQwzilpw6zEAm+
	m6ytRcM1BQNHOb//RX8ORfcTjuFZgL/WPoWEzAq4bkQwV2KMDk9PiHo0YikbRPl99tmVlBXHpNb
	NXG6qsoN0SjW+vd/z5ea+V5roYZcGz4RNy/tjQ9kZctOZAU+9KP851elWwK71YElkP65QBQLuGy
	2lOMGSwMxMSiesLQubhOn7nKWY02YJVi2r0eRA/lbB7taaK7PK3TQwEd8D49mp46JgcJA9tYOlH
	2dJ+lhseS7kMOekqG+RHfXIjcTQ6hfcjOohaGBPR8h9zjK6yH3GTFPBu7Fon9xPpW8ERpJ19tMY
	PAhgHPr2WytK0p1KOjOHtRp4AGGG/qZF8sehlTS5JScqE9ZwgafwMVj9xuaay4M/MrZ3hiPDgmG
	x7Ex0dw0386ll9
X-Received: by 2002:a05:6102:3754:b0:7a7:c789:881 with SMTP id ada2fe7eead31-7c0f4271c17mr639296137.6.1790954742881;
        Fri, 02 Oct 2026 08:25:42 -0700 (PDT)
X-Received: by 2002:a05:6102:3754:b0:7a7:c789:881 with SMTP id ada2fe7eead31-7c0f4271c17mr639285137.6.1790954742344;
        Fri, 02 Oct 2026 08:25:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e2f7dbcsm10637261fa.12.2026.10.02.08.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:25:40 -0700 (PDT)
Date: Fri, 2 Oct 2026 18:25:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Joonhoe Kim <26rote@gmail.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/msm/dpu: disable the slave encoder before the
 master
Message-ID: <4fh64kdk36hfgbespinsa57l735mhnol7vbko52oj77xw255b5@harvnua7k2oh>
References: <20261002130712.50612-1-26rote@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002130712.50612-1-26rote@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2MSBTYWx0ZWRfX+u8NiOXK3WYX
 BKFOwNVuEDvi4ounVUBm69SB7cfyqmbV29ip167rjmc0vf6dLqci7DEio3jim2usoBOLPAKzgSF
 B24y2myA+Wgx4wQQ2eeDUyqDBckD5F8=
X-Authority-Analysis: v=2.4 cv=IpmL47/g c=1 sm=1 tr=0 ts=6abfccf7 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=e2OdPLLIgFw-C6oMEugA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2MSBTYWx0ZWRfX7QNEoRc1w08/
 1Y/n4JrS6cYZuD3ZyaKle8Ng1TYmIADydJx2FxhCkvJHSHvHVGfIL7ZkGc+CHIZ0/Ht53DrDzBL
 ziqeMh939IrSCi2Te5T5Gh5bDCmvLyot8seuAFBEUpe38COmSqQ4C41RmFSlhnIOOtKl0MjvCbs
 JHhDYqq31ueqiheFX7fy16JHtkTlN0R3eLBE875Ml3K24F7Tq5ZZ+Klh9nUtJ/EJlNdSuBFnZ/R
 jQ09kKtIplv78BXlaK0+Mp6xsc35WZtieZVcq2TAYrxLy77z6731wHlzYZ/Yocv+IZZ+T1Vlwhv
 0VCHUh8dwicYUg0ei+qQAidq0XiWEnal6C+kq+ZPyY8gpozG+rNPaVcGKFvi1TYabqR7nYzxf4M
 0A4ex9ztinL+gF4XcOcRO2ZY1a8Y+we/jvvZULj/UNCIxdZkRvfxM1Bwu2XmD8mBbXwuqSBbFp0
 PTwQHuVYB1Dx/3Pw3pA==
X-Proofpoint-GUID: M1ZzrMeZWEqxz0BfwgQUxkMqRWSVb1N8
X-Proofpoint-ORIG-GUID: M1ZzrMeZWEqxz0BfwgQUxkMqRWSVb1N8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0
 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020061

On Fri, Oct 02, 2026 at 10:07:12PM +0900, Joonhoe Kim wrote:
> dpu_encoder_virt_atomic_disable() disables the physical encoders in
> phys_encs[] order, i.e. the master first. With a split display (two
> interfaces on one CTL, e.g. bonded DSI) the master's
> dpu_encoder_helper_phys_cleanup() then resets the shared CTL while the
> slave's timing engine is still running, and the source pipe is left
> stalled half-way through the slave's next frame.
> 
> A power collapse of the MDSS core GDSC clears the stall, so it normally
> goes unnoticed. When MDSS stays powered across the disable (a full
> modeset, or an active DP controller), the next enable scans out
> nothing: black screen with the backlight on.
> 
> Disable the slave before the master, as atomic_enable() enables them in
> that order. The slave's cleanup still resets the CTL while the master is
> running, but the last reset, from the master's cleanup, now happens with
> both timing engines stopped.
> 
> Tested on a Lenovo Legion Tab Y700 gen 5 (SM8850, bonded DSI video-mode
> panel) with MDSS kept active:
> 
>   echo on > /sys/bus/platform/devices/9800000.display-subsystem/power/control
> 
> DPMS off/on: black 10/10 before, picture 10/10 after. Full modesets were
> not retested with this version. Only tested on this device.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Fixes: 22cb02bc96ff ("drm/msm/disp/dpu: reset the datapath after timing engine disable")
> Assisted-by: LLM
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
