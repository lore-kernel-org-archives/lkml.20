Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284067;
	b=nJL+SER3lukQzZI8ypwbfpE/fLK595W1dutuhmcerX4KcJsxB0yk8dxv1FBIur5a7yDo
	 i/x7knjwoRIlGUN0eUk1ETyKKdXEnG6pXI4kNDpmw6wndOaA793/8MgRERjnuTl8Tc1Xl
	 wDQ7rAi3re0Tzqb/jIctMMiIc0OSN3NtSy8/yAr8pqQjjlaAtZLJmPe/cjwXZdju0iZL8
	 pt3FWoIPeja9hEH0rV7XCXmqaY++nGp7uiwzO5cOBAH2Qph+jkWU9S++IWp4zmPzrx877
	 CbdNhXlblPkANJqBGqWRMRycMfU+jVD4ZjeijS1fWvTi+zBvP7EhkF7qe1RuZ4PmsKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284067;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vllnIhdcYddUgpKRqNaXWbED/1ru4P1SPL9KLTf0SHE=;
	b=FQ9Uhxflf6dtqAGxcgm/5K7PH6ok3XLpOJUCno+bVAnmUB43p76pTgwd4x/5ZzHBl+Qo
	 ABlQA/UkRHo3cxMy3jlhkXKFFxgIemFdr35BmtFv7F/pCkYSvb3exvKwY4+xTbj5uW/4P
	 J9WvYbP3beuhEr90DFrdFnlqCDc1p3wwkx4b3rULzWpH2d32hdpDXa3tWYA+cgRZ9g8wk
	 94ZGbRFvPlUXYYEEq/GKpxcX+QjRivqMPgixSzna++n0tdOb5YHpqycJopL6L59heVJbZ
	 YlfBnXOw6MTtW0zS7gcHCShpty7o1mZZ77CNiVUvB+r3z/w99pxDNA0abRRsBduO7gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I0O9t7D8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kfscnI43;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29642606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:14:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29642606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I0O9t7D8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kfscnI43
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4AAPh2919669
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vllnIhdcYddUgpKRqNaXWbED/1ru4P1SPL9KLTf0SHE=; b=I0O9t7D8jKbeREzo
	ogVy45Iay7aVJZznNjGFmNWwW8JAgZFxQAbZThtWYU3ji0d/tf+mAggZyhEffgiR
	ljFoEErCP6w4+hmyIezNVvPZqZBhs78n8bjN0uKsQHoqDt8VXN/6X6wfUF23dxcz
	f53LzLYB66830wEg18oIbUNId6eYPv0JXVNYxEVbPuxB1I3OgKjQh5EKE3aTJbxg
	xgGzJt9SgNCef4PZNZk48gHw2KIkun16+b5TRdDtB+dvXy4M3i46c94Pkfw47KLH
	+fxWBSELchTPlNO3An3AY/HBKNU1Aics//Hm1a7YLAdje6OEjfD1aLuLaJByahQq
	jqlxIg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg1kyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:14:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so1407201a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794284065; x=1794888865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vllnIhdcYddUgpKRqNaXWbED/1ru4P1SPL9KLTf0SHE=;
        b=kfscnI43R6TFq1QAbfzZZ8PqWIkifzjp/sMhA2OYEpDkgUukxArjlmEUVs8/CflbMJ
         YV3h3d8KStX3vYC4qMZbj739nPmc0if18dKlNulEYHRxUhN7NKWzBIwpoFzu0GkpTknn
         T14dBPGFYFl3dHDBHFbjttu+dK5ith4LQ4k1YtM3Zh/IfDGd1A1vWWMpAG1++6OwxOur
         E/TyUxtPUvHfM3Z1Xz9I6fHeAEWGZfh4ivRltf9MAP6nDtMYByCblos6qi1CQOc+b5PJ
         foQvEsxQcolKl+XtnshqSvkh/JTh588d2wBeLE2yPawUmZgGvox8WjDY2BRNkMI8TJ9v
         AZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284065; x=1794888865;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vllnIhdcYddUgpKRqNaXWbED/1ru4P1SPL9KLTf0SHE=;
        b=XjNhg57rAis4HuF+2ls8Sk4Nei4mHveJ1WdtygeW09QzN77sm1Wo3yzMj1nE+Xr1k1
         xSwHYQg1lxJSNfP4gBpt70VrTapbQ6q4YfkontAdsW9jUW3xI/e12+IwrY4JHstyBsdP
         p2GcxKfeZtBkG2NJ13kcf8Ed2FFCRc+a+ngwaqpDhHxCzNwvtarx7Vd17NELz8v1qJTF
         DOzWBXsPa4aq+jv9NAUGB4i878r4SK6/xnkZB6u1mB33DGi0gX3glj48kj585P4G2dlM
         HEwShUSmFnNTiv+FpbS3ZUaULt9HVJtzbFtRxgHn6y5AyAnh19fM9Z2zZnWzcOlSMS0z
         mdcw==
X-Forwarded-Encrypted: i=1; AL+hErEgEoxkmeeik9FYpT8lF3EolKz+NeaECoOkfkWKm2vn0Dq7ZOUWXx5b089gQIh4BbclV5ECumOruJEyZ+w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9moHbzSZ5zgBYDnGAV7EveqyQeN7pjIq4fLvwGVeXrNTVPoG3e
	9ikq9j/yngf9mo4tZL3lt3TzQnknbGVXjZbeS/PL0Ff8mJItm7ZFIei2Q4+Gfu/5wQO+Gulf2X9
	iN0EWBtgosMCQDS064dXNrfS8bBfR8aEfAdXQvjQVYmpcUJzIinp8piNojPJfhUh6ScM=
X-Gm-Gg: AYBFou1zIwy97jdgcD4oT49sp4H1R5t/3ygm0dRgJVrq8tybVzK+bk3/1S6iiEONg4d
	yNiSoS4dSa1y+fhc6fft8gYChacQ9Sdu6ZjRW5bwNZ5xlHXwa+Mnd7I3iGV1c+jx36V2cr3onYh
	8FwGN0Pnm+JqIVTxB92E7IrNbGe3N+bhmq297DLFTpVgnhSS7tuoX1zHCmgkt1gIyuSupIJCbn1
	69ZEXhIwliGnFVCkC3zyHpMnDEt/Hy6np4zmp614FqSV6nEG46AUpkc6o6uUcVHKuNcyqKGXmBt
	idq1UqkYZbCPYTXxA0KbFmCDMhVrb0IrOkKPzFUlMViRoTAPqqBYrAlzQEp/P9KfTuzBj3suPJb
	ZCRDSgS0Zhn+x0/Th3pzYv/eLsDnJjAbWqcI/OnV6KVWj32DKrIFrh5PqX9DQkVmqKFw4qJP70z
	e8
X-Received: by 2002:a17:90b:1c90:b0:3ac:9ed8:f301 with SMTP id 98e67ed59e1d1-3b1679e96cbmr1115503a91.30.1794284064635;
        Mon, 09 Nov 2026 20:14:24 -0800 (PST)
X-Received: by 2002:a17:90b:1c90:b0:3ac:9ed8:f301 with SMTP id 98e67ed59e1d1-3b1679e96cbmr1115485a91.30.1794284064054;
        Mon, 09 Nov 2026 20:14:24 -0800 (PST)
Received: from [10.64.69.173] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b168a8de09sm995443a91.0.2026.11.09.20.14.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 20:14:23 -0800 (PST)
Message-ID: <91e543e8-3e4a-464f-86cf-a9ac95ac84c8@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:14:17 +0800
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
Subject: Re: [PATCH v7 00/35] drm/msm/dp: Add MST support for MSM chipsets
To: Joonhoe Kim <26rote@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
 <20261108011450.4428-1-26rote@gmail.com>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20261108011450.4428-1-26rote@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxNiBTYWx0ZWRfX4yMxtKkQZSpD
 gQ1+o9iXf0Px9Dse/8QNfN41tBarwkRwOakDicna6bN4lwyTcI3cbwpQGLXOYl5IFWZqjJoqRj8
 cMJtE7HGXWsM9nboQ39+WGwvpsya4BRqR9wnbS6e22i5y0EUS/mJPJa0a4LRTUhE90XxAtD5DBe
 bo/RHXaG5tiKIGuzd6RKx5lx3j6q1POjEpegnLaWZnOPk53xmMRBM0TQCVZc3buDbl3rzkCpkbW
 zEzmo9bCe9eAw4UVnkezK9S6aWKrrtQle0tMdkYVyBYGIvwPbnhArEEvNyuQNkezeayeALF8euY
 +eXhnfkBRwhRq0xsmxQ+qVxra9HUm1YQwceF6hQnhQORBu274DK5XvINR7AphZpUmzPSTfrP5A+
 RJgUK+OP/dd2BZZcGxR8dRfhSzvMF//mwEZAL2cQePCE9lpxvNfl8b4i1R1oH+tmn6NiKB2biB4
 iSIgb71JzgGbUnbbveg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxNiBTYWx0ZWRfXzT12GEkZ7CDt
 PCRAO5bazYyzbReKEZZM5eG8YSwXj7s4Iz9Z5MBjtxk5fYfPZUroU749yD3Ng9fVPvH7ItkxfoP
 se8ic5fX8+5BWMZkVEydj1/KTJSh4zI=
X-Proofpoint-GUID: kNmUgor9WXFHE7ZxSZeQkqATj5Adu2HF
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af29a21 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=xnScQCINOySfzLI4sGMA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: kNmUgor9WXFHE7ZxSZeQkqATj5Adu2HF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100016



On 11/8/2026 9:14 AM, Joonhoe Kim wrote:
> I tested this series on the Lenovo Y700 Gen 5 (TB323FU, Kaanapali):
> DP0 over USB-C (pmic_glink altmode) to a dual-screen monitor with a
> built-in Realtek MST hub (two 1920x1200@60 sinks), with the built-in
> dual-DSI 1904x3040 panel also on. The base is Linux v7.3, not
> linux-next, with Dmitry's "drm: handle IRQ_HPD events correctly" v8
> [1] (the cover letter lists v5) and this series. A few hunks were
> adapted to other patches I carry. On hpd v8 the second hunk of 34/35 is
> not needed, because msm_dp_bridge_hpd_notify() already handles the
> plug before IRQ_HPD.
> 
> With three local changes, both screens show separate desktops next to
> the built-in panel and come back after s2idle.
> 
> 1. The plugged_lock / mode_config.mutex deadlock that Sashiko reported
>     on 32/35 happens at boot with the monitor attached. The stacks are
>     in my reply there [2]. I dropped 32/35.
> 
>  From the cover letter:
> 
>> With 4x4K monitors, due to lack of layer mixers that combination will not
>> work but this can be supported as well after some rework on the DPU side.
> 
Thanks , will  dropped in the next version, same as you did locally. It 
not needed
> 2. With all three displays on, the commit for the second MST screen
>     fails:
> 
>     [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu error]LM_4, invalid DSPP_-1
>     [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu error]LM_5, invalid DSPP_-1
>     [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu error]LM_6, invalid DSPP_-1
>     [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu error]LM_7, invalid DSPP_-1
>     [drm:_dpu_rm_make_reservation] [dpu error]unable to find appropriate mixers
>     [drm:dpu_rm_reserve] [dpu error]failed to reserve hw resources: -119
> 
>     The compositor sets a CTM on every CRTC, identity when unused
>     (adding or removing a CTM later forces a modeset that reassigns
>     resources), so each CRTC asks for one DSPP per LM. Kaanapali has
>     DSPPs only on LM 0-3. The built-in panel takes LM 0-1, and the
>     first MST screen takes LM 2-3 because 1920 > MAX_HDISPLAY_SPLIT
>     (1080), which leaves no DSPP for the second MST screen.
> 
>     This is a DPU topology issue rather than an MST one; MST just makes
>     three active CRTCs easy to reach. Locally, a CRTC that needs DSPPs
>     uses one LM up to max_mixer_width (2560) instead of
>     MAX_HDISPLAY_SPLIT, and the two MST screens then get LM 2 and LM 3.
>     This touches the same decision as Mahadevan's LM rework [3], which
>     drops max_mixer_width, so I have not sent it as a patch.
> 
>     Mahadevan, should a CRTC that needs DSPPs prefer a single LM
>     whenever the mode fits in one, on top of your rework?
> 
Yes, this issue will be solved in another series.
> 3. s2idle with both MST screens active hangs in resume. The console is
>     suspended; the printk ring in the RAM dump shows devices resuming,
>     nothing from DRM, and then "watchdog0: pretimeout event". The
>     rtcwake task is stuck in an AUX transfer in resume, while the MST
>     stream is re-enabled:
> 
>      wait_for_completion_timeout
>      msm_dp_aux_cmd_fifo_tx
>      msm_dp_aux_transfer
>      drm_dp_dpcd_access
>      drm_dp_dpcd_write
>      drm_dp_dpcd_write_data
>      drm_dp_dpcd_write_payload
>      drm_dp_create_payload_at_dfp
>      drm_dp_add_payload_part1
>      msm_dp_mst_stream_enable
>      dpu_encoder_mst_atomic_enable
>      drm_atomic_helper_commit_encoder_bridge_enable
>      drm_atomic_helper_commit_modeset_enables
>      ...
>      drm_atomic_helper_resume
>      drm_mode_config_helper_resume
>      msm_kms_pm_complete
>      dpm_complete
> 
>     Several kworkers wait for a modeset lock in
>     drm_self_refresh_helper_entry_work().
> 
>     At the hang active_stream_cnt is 0 but link_ready is 1, so
>     msm_dp_display_prepare_link() returns early and the payload write
>     goes over a link that system suspend has powered down
>     (aux->retry_cnt, the count of consecutive AUX failures, was 107).
>     While mst_active is set,
>     msm_dp_mst_stream_post_disable() does not unprepare the link after
>     the last stream, so nothing tears it down for system suspend.
> 
>     The series also does not call drm_dp_mst_topology_mgr_suspend() or
>     drm_dp_mst_topology_mgr_resume(); i915, nouveau and amdgpu call
>     them around their atomic suspend and resume.
> 
>     Locally, the DP system-suspend callback calls
>     drm_dp_mst_topology_mgr_suspend() and, when MST is active, tears
>     the link down through the unprepare path (clearing link_ready)
>     before pm_runtime_force_suspend(). On resume, after
>     pm_runtime_force_resume(), it re-inits the PHY and AUX and calls
>     drm_dp_mst_topology_mgr_resume(mgr, true); if that fails, it turns
>     MST off and sends a hotplug event. With that, 3 of 3 RTC-woken
>     s2idle cycles resumed with both screens on. After the third the
>     topology was rebuilt (the MST connectors came back under new
>     names). I can send this as a patch on top of the next version of
>     this series if you want it.
> 
Please feel free to send it. I tried to add these functions, but I 
didn't have enough time to fully test the code, so I removed them before 
sending the new version.
> Unplug and replug mostly works. When it failed (3 of 6 sequences),
> the hub had dropped HPD or stopped answering AUX right after the
> plug, and one or both screens stayed dark; the stock Android kernel
> shows similar failures with this monitor.
> 
Actually, link training is not always stable. It may be related to the 
dongle, and we need to improve it further.
> Not tested: daisy chain, 4K, audio over MST (no audio sink here).
> If it helps, I can test the next version of this series on this
> device.
> 
Thank you for all the testing and feedback. These are all real issues. 
Although we may not be able to fix all of them in the next release, your 
feedback is really helpful.
> [1] https://lore.kernel.org/all/20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com/
> [2] https://lore.kernel.org/all/20261108010724.4061-1-26rote@gmail.com/
> [3] https://lore.kernel.org/all/20261008-lm_fixes_final-v4-0-fa986071c3c1@oss.qualcomm.com/
> 
> Thanks,
> Joonhoe Kim

