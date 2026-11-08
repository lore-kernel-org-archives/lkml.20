Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794165470;
	b=vZHhcJjDvXi2VIweypiyHPPuZvnAfRVzWJN2Rc5ewT8zZg3/qDBdcRlQHbTF1h7WdwBU
	 tFlATm2aJNzxXu4iTRUsyyyOGtgfDMN7mE3USGcIxp2IMp8TrDL/i5jMZURDLS8eELLSm
	 fk4N044omXvI0VPZjDhSaugkEhWwBiJAtuTV3uIsMsAD/Z9o5TE8plvnld3Ccn92yiO7o
	 LcwOSFdmK62GLG1UI6JJX/LM7SL4OBoRGpawtU21gNj17ZMEKqtGgUOzH5gUHvlOKZsh8
	 hl14N5Wt6B2oJ+MpJVIFTinq0OZ0UbF0QslylvEfiuIs+Ixnik6nW+UBPS+KEDaCadA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794165470;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1bB8siXgq9lNTN1p++gxRLJccSlMsOx90u5ACH+aXpw=;
	b=Hc9nvi/VA/K02VMNEQRDr2I9q0AHoc6SfnEy1DxyCgBDtJ+uS4wx8Rd2YaVRvKkC5e8r
	 Z8HmN0KcxSV2PTpBz5LQC/4Y8YoP7zDn+Co77kTDU5kJageM0AfWrtrmpBIcy/hI5QXMm
	 V1BQcOgVtynw74a+9t7pb4Nu8HsTZuxSQfzk3c0wGNa6Lm8LrVXRzLPuFtmD6uWqqU7WT
	 vpRHStJ7qeBR6iEPOH9AbZmfo/FW079stiLOwcgAZzWb/s8W9WlXSirMUIs4S5XHLMgwY
	 K+xkXWiuR8RszxX8+6jClRd9RcL6tRyYroisSctJRgSaRdKOchdDAPYwZVydv/D02eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eICtd3Gd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fP7wOeid;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B28606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 19:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06B28606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eICtd3Gd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fP7wOeid
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8HofZD1013547
	for <linux-kernel@vger.kernel.org>; Sun, 8 Nov 2026 19:17:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1bB8siXgq9lNTN1p++gxRLJc
	cSlMsOx90u5ACH+aXpw=; b=eICtd3Gd02zQuqH9cb/bdGikiCeIAX/K8IybIhGY
	IP55UGP3jmLO6ii39WmYR+87OvnszYqWdW5HecyFPstcWdRoRIIztB3TG42dHciy
	+rEUIlBNI5AHcbRaTo8NmdXOgLYXLz3povWFaN+/0Dd2StQTAJEaDOxRVJwBByfC
	JpD5pawoRlx1INY8NNMBXkvW+FqFl4/Bcmc3SVhOVRCPdXQismoOng3EjPRh+lEV
	tc9GC2i95IQmL1pCHDTm4vBOLBngCP9NRoM+y5/ZNZBqrI+JePqkSBKajLEZvN4z
	JKoiiZABJZk+vv38RW35MfMlQAXSxuzy9Ug4O68DUHN1JA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsvc6kgd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 19:17:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91ea053ef90so5432756d6.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 11:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794165468; x=1794770268; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1bB8siXgq9lNTN1p++gxRLJccSlMsOx90u5ACH+aXpw=;
        b=fP7wOeidG7WTmt87Rb5qrs2RYhZYZVeVBzHM/sKKUg1uq+EKVgZsplIB+rBgftUNOe
         UyZ8Q76sRCZo/ajCflLsH/GTSkBelYbqyraV+dszatceY1R4ScfOMsW70To2iffrevao
         bOeFVKB+Riy88qqxG9033wGoIK0yMIs+yiym8hsyu5Ez0dIeBEv9clKra7IxZDJUe9Qr
         Z2TwQZgSrhD3X3PMEEUqav2XDrkSW6/L6XwBNt53bAQsPwhS3p67raTWS/75YLbQ17Yx
         6h5jJcP/W/kbcHNM5n4YzubDv/O1GPbr44lpI7p/1jjp17qztGifH4PQM+4gAWpz2NQX
         IU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794165468; x=1794770268;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1bB8siXgq9lNTN1p++gxRLJccSlMsOx90u5ACH+aXpw=;
        b=Xq0OCWBqEW65/xLvUpcP6ODP8KwrkURUp0f/J66aEV1aRUfpnUkhCZTp8EeVpgZRBi
         gQ/TlRhswDFO+sLFtUtw4xOHKrHORGPp2rH77KzroUty5uIGp2vZsJ7p48Vw4BJogjqJ
         lttPpfXa4WP9QEmIVCv25L9yqtHQIQCQi8dONpxgrougmJxX5zJs/QaezR0Mb01QF22f
         kvfQ0uVy2r70PpaxiTJcJIfG1AER/ApN/DqmJMU3sNzQfRPmvH0XZz5gdCFB7SH3n7mt
         p72GhEO/2QuAdhj0DqY6YN7SSJV1b5Sec+waFOxiAZg8rKGqTclh7OPiJYNnyF9h2+Vh
         sofg==
X-Forwarded-Encrypted: i=1; AL+hErEDcwq4lH2lTeP7BjqpRHool9ysroS02bfZEQetHpvy0Jj4sQGBYSb8CxVDZSPg9Vyg8YdiNAfq6qG6nGE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/J0jM2K/H9OhT117iwKtiXfkCIpKjsPlRJmu8sWVjPbFHgHW7p
	sNX8wt0Vi0DYw3MIF//0VNnF72aev8cRZeoTicPpZlY3Nv9mfRJVgQQCztK+CM/6+R9fBS/bMLR
	nSFCOK0qaySgpVc+TvgqgI443icPFo0G+PWB5lNILNPdvCH4tRawxkL0zX3CAk8E+p6M=
X-Gm-Gg: AYBFou3uoyu7dxU6qfGzxhDFBZP+5gJAwNJO1MMrUrK0RMYCuBshojDuwARwpBJ85nj
	S9Y2/bePy0QhPq2grdA3OLraVA0gIeL5at5mYIxXuhc1kv8NbMg846d0Krxc5J3yJJKxoiclyf4
	/hUyuWMuZIB6ddO740nP7zZZHrfnK0vh0xjHnJZ89XpIP4niDODwuFu9wexU303AuJQUHYk2KjB
	B4G0W2wSOsQaISnp5iuCHhH6dX/MrleZvKCQV5KGj2K25LxRivpLvucAGfrBvyOqORqPH9vbIeF
	FXMpeFm0p7Ys6VMeHKhwW/PdBo2ZxKmvQEjKRiN9+9fzZ9WDE8ZIKoVOkBelV9dRrTNKPMb6/4n
	2pyou6+9SUg1TLQ2Fed2Nvd//AmKNYnNw0/41+jkXzzhpxdWx6nYxx+UHwYlwqOmtG9EugAV166
	HeURMXZhMTg3Nc15sn+qHP2eTvUW4V8v7d/WWkKUGg+s0iELCdnBy5ReDRmcsq
X-Received: by 2002:a05:6214:2242:b0:91e:7bef:a4b4 with SMTP id 6a1803df08f44-91ed21dc9a0mr29241676d6.2.1794165467958;
        Sun, 08 Nov 2026 11:17:47 -0800 (PST)
X-Received: by 2002:a05:6214:2242:b0:91e:7bef:a4b4 with SMTP id 6a1803df08f44-91ed21dc9a0mr29241286d6.2.1794165467348;
        Sun, 08 Nov 2026 11:17:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3adf9e11efdsm4742371fa.20.2026.11.08.11.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:17:46 -0800 (PST)
Date: Sun, 8 Nov 2026 21:17:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Joonhoe Kim <26rote@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Pengyu Luo <mitltlatltl@gmail.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 7/9] drm/msm/dp: handle the IRQ_HPD events reported by
 USB-C
Message-ID: <ojxncf2ac6pt4lyo5qgxddpri33jlazkkgkcto4bnlw2ctxr5t@y2btbks37qkd>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
 <20261024-hpd-irq-events-v8-7-6ee949e7a384@oss.qualcomm.com>
 <20261108011501.4466-1-26rote@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108011501.4466-1-26rote@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA3NiBTYWx0ZWRfX8igm2NqN16r4
 O0gXVjGpVRz7wNTG1BJdTZfDmCMtB2sDqKqnVWuGWjdfHqVQ5YgJxrpdbh+zx+hipmy1l59K7en
 uWbB0Mh88/ly2ZV+vHELhx8dRIRf8EbwFAPyIhCZxJLYQSZ5M9VtbZaF3dcgKfv/kCQWBWdbiOb
 HLGFpsAU8bcOB+LWHAie2VQzUEHt32ZCAWUurWJkPMl934ED+5kClvQwMTvBty4aOLPKHHZtdB6
 pR/NDc+XacqLxuoaloJPlu5HlPuWMIoRGXXT32U88edqHsHblm1XF+kN+nZbAb9FuFgPR3/5Azp
 6rb3W1D6OfE1baMnQ6vPj4unhof0PkwwmMiR/p3E7uopaUK8bfzDvfkYScdFDv48tjy0NosfWUj
 wytJhy4SnUPIbzZEZpieD/meQS2JtwZJGnkuxz4v+vLVMDikCHa7XR752qIswFPBgoufndc60J5
 y2j7Jphs7/tZKBiZ+tA==
X-Authority-Analysis: v=2.4 cv=WOjqzXsR c=1 sm=1 tr=0 ts=6af0cadc cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=PZBFViYrEbeYNj6pPQoA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA3NiBTYWx0ZWRfX9IbE0KBLVSMn
 ayXqBh5lPiS9B0DFZhdbYbQZGgrC4Hv2nBdh3gVQKc4Ih3zGytvAAgDm4SnuM2n1W1MaAWKRHEs
 oil1rcvx+MwGMCBg6w3ny+wv3idweQQ=
X-Proofpoint-ORIG-GUID: iO3mREgqFlkYbTzr-ACAKWuGgMYP0vUG
X-Proofpoint-GUID: iO3mREgqFlkYbTzr-ACAKWuGgMYP0vUG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080076

On Sun, Nov 08, 2026 at 10:15:01AM +0900, Joonhoe Kim wrote:
> On Sat, 24 Oct 2026 03:35:23 +0300, Dmitry Baryshkov wrote:
> > +		if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT ||
> > +		    event == DRM_CONNECTOR_DP_IRQ_HPD)
> > +			msm_dp_irq_hpd_handle(dp);
> 
> With this, an IRQ_HPD that arrives while the link is down hangs the
> board. I hit it on the Lenovo Y700 Gen 5 (TB323FU, Kaanapali), DP over
> USB-C (pmic_glink altmode), when booting with a 5120x2160 SST monitor
> attached. The tree is Linux v7.3 with this series (6/9 replaced by an
> equivalent local change), the MST v7 series [1] and a few local fixes
> outside this path.
> 
> The path itself is not new: the native HPD block can reach it through
> ISR_IRQ_HPD_PULSE_COUNT. This patch makes it reachable from USB-C,
> where every IRQ_HPD now goes there.
> 
> When the boot-time mode is disabled for the first modeset from
> userspace, the monitor loses the link and sends an IRQ_HPD with
> LINK_STATUS_UPDATED (DPCD 0x204 = 0x80). From a boot with the
> active_stream_cnt check described below and drm.debug=0x100
> (msm_dp_irq_hpd_handle() is inlined into msm_dp_bridge_hpd_notify()):
> 
>  [    4.572532] [drm:msm_dp_ctrl_off_link] disable
>  [    4.573756] [drm:msm_dp_ctrl_link_clk_disable] disabled link clocks
>  [    4.608443] msm_dpu 9801000.display-controller: [drm:msm_dp_bridge_hpd_notify] type=10 link hpd_link_status=0x0, status=1
>  ...
>  [    4.823192] [drm:msm_dp_link_process_link_status_update] channel_eq_done = 0, clock_recovery_done = 0
>  [    4.823194] [drm:msm_dp_link_process_request] sink request=0x80
>  [    4.823197] msm_dpu 9801000.display-controller: [drm:msm_dp_bridge_hpd_notify] sink_request=128
>  [    4.823199] msm_dpu 9801000.display-controller: [drm:msm_dp_bridge_hpd_notify] 128
>  [    4.823201] msm_dpu 9801000.display-controller: [drm:msm_dp_bridge_hpd_notify] After, type=10, sink_count=1
> 
> Without the check, msm_dp_display_handle_irq_hpd() calls
> msm_dp_ctrl_handle_sink_request(), and msm_dp_ctrl_link_maintenance()
> starts with msm_dp_ctrl_push_idle(), which writes REG_DP_STATE_CTRL
> while the link clocks are off. The board hung on 3 of 3 boots with the
> monitor attached. On the one hung boot with drm.debug, the printk ring
> ends at the "128" line, the drm_dbg_dp() just before
> msm_dp_ctrl_handle_sink_request(). In the two RAM dumps I could
> analyse, CPU0 is still running pmic_glink_altmode_worker, which holds
> the encoder's bridge_chain_mutex taken in
> drm_bridge_connector_hpd_notify(), and ctrl->link_clks_on is false.
> 
> Locally I skip sink requests while the link is down. On this series
> alone the check would be on power_on:
> 
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -400,3 +400,6 @@ static int msm_dp_display_handle_irq_hpd(struct msm_dp_display_private *dp)
>  	drm_dbg_dp(dp->drm_dev, "%d\n", sink_request);
>  
> +	if (!dp->msm_dp_display.power_on)
> +		return 0;
> +
>  	msm_dp_ctrl_handle_sink_request(dp->ctrl, dp->panel);
> 
> This matches the !power_on check that already guards
> msm_dp_ctrl_push_idle() in msm_dp_display_atomic_disable().

This looks ok. Would you please send this change as a proper patch?

> 
> In my tree the MST series replaces power_on with active_stream_cnt.
> With the same check on active_stream_cnt, 2 of 2 boots came up on the
> monitor; the link is retrained about 1.2 s later, when the stream is
> enabled.
> 
> A check on ctrl->link_clks_on in msm_dp_ctrl_handle_sink_request()
> should also work.
> 
> [1] https://lore.kernel.org/all/20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com/
> 
> Thanks,
> Joonhoe Kim

-- 
With best wishes
Dmitry
