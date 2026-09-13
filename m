Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17431385D68
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789339523; cv=none; b=g0DdbGxqABeYM4Zq6a2IxiOMEotQKz1lO5inCWwA8xin9AMGXVI/pGSXwetXG8NzHZ9TeIJSc27r5OMTwJuAqAHKtgZaeMZ/3ZLn2TqTqxr4ioAGOG6Jgi5tC6QLgNv7eNX1+fWd3BTnnFbOaotXDl2XR9w4CCcqL0NOZVvwoDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789339523; c=relaxed/simple;
	bh=ZLiHa/O3s0e2tzS5Np/2fB/q1gAHbIuVT9ahwkti77c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XWP/UZYuLaznxe1mdXt7+82qm8aFSnarX/gQLkujbksbNbKqwZ4/25Jb08k7cRyVnX1SBFRUySQloogSsQfuR13tpF4ZxGa9ctXGG0AkVVFTBWQwEC90sl1On3fbNa758rdc0Iq0dNGsC87oGT78ovWp0T9ZteP4PcijlUy1/ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AQ0A262F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jMwmzCEw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AQ0A262F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jMwmzCEw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DJxjTA2686926
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:45:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=daD/zPVERLcknSPfWxaXIlNx
	QG5d4LXKc3bwm1ECFEE=; b=AQ0A262Fw++6GHCgROTUj6tMhxoioAq5mvuZGUnn
	8XI1tNaD9wyTFy2wqAXPGRlb6hZz7tvOGrHWkuiDtuopWML5oxDIZOfhR7Ddl4gT
	OYH2nMryeKw/F/IMg80NcrLGSSVjCJnBMVRf/RtrqykEoaQxVGPlnnOpiVoQt3AC
	wSlv6A+ds0w6Z8CtnRHnmGIy1Ahf4FremIh7LJbpeJekRRBnh8iUd63KtnLJY3B4
	JA/yGjRCa4JAUDHlpkpKglzOjDkVaHR8MuKq5ivHhb8XYSCX0RBAg9XpieR2ED9k
	KVLIK40OaLR0MPPOAw9MBqI5ZAMSYPFVvMdVnljj2Dm+4Q==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d4908-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:45:21 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c82c2e9761so603505e0c.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 15:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789339520; x=1789944320; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=daD/zPVERLcknSPfWxaXIlNxQG5d4LXKc3bwm1ECFEE=;
        b=jMwmzCEwkNCPLkjXac++y+IYjeWfPWaqlALnI5omJPbHeNxlX/7Eh/gNcHu7yDxOJV
         yJdQWN87aE1NiMpe5dYy/XA0ZZosUe/CgsFeFVioLGLnI2F9YIBUrajIwxDnvo2IxMZB
         5oEKB5kAfo1Z/kzeD9cefjSZILGzz5p8gPyNFmRHcXJMd5vHdtspf8z7jv3jKPsE8LS4
         kdrWSdD7S11XU1INXz1griwpIOvYSRywZYxFmYLxJXE0rdW1ir6Jt1ps6oc7jRzDEqDN
         C/s8anJa6t14DWuup7do1sQVc6gUACCgdiuOedXGBAoibWFKdNlESsZlLtRCvcq0O1Kv
         lIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789339520; x=1789944320;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=daD/zPVERLcknSPfWxaXIlNxQG5d4LXKc3bwm1ECFEE=;
        b=qGQ3Sf/1LYCmZ68XvHyOgCCHmKmbJ3lDNu/pAN4qnyIJg11GY4FJ9AcsFf78iPwjPE
         XFCPfvxmUVKI3YgqINdzYQ4AcX1OJmCA8vg/ZdT3TnG4dHx2OdCVNE6BX9ulielJwOpY
         Qz4V5vsY0IX2Zvq/1Q/+F3qVxbVFObqeygWJUo+glGAPEjwYwHnvYP9hxN3CwbkaZzZx
         jE6vnEHOjIkCr3NCNCPfXWm+Lk/0e3JEqbNu7L5iOcoMccowc+LTo4S/X8X1zzbAX8Tw
         21GJqfbvATYZaECGEDF2ebd+laGGbqz+UPPHkaQk76HXhuWs8I3ERRDAqZp5ytpH+4PT
         NR5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwK9oqBkKsfNEgvZhUhxegswf/IEzb2VwGFQcH46CstZiirf9v892Cx6LN4xvHQ2mlfFYvIdNNImbqXtqo=@vger.kernel.org
X-Gm-Message-State: AFuF++lrZJF9JaKaIXIgLhLtXerc/xzfAZAJvmiWyIicCuVIy+4gm7LY
	QghJdGlZWanOo3GOQoP762gGF+Qf2eCB7/m7E/pIixgcJ7CZ8EvZ26X+fKr8UA+bJRFuiEjpZsc
	3EERYEsZm4fN3dvlqBwvg78Hs2jgY/WLN1IFDmOvmQ6qM6672Ftt6tZT8UOlj2ioXCUA=
X-Gm-Gg: AYBFou3CUxXm8rzXLnYzOOJTr0Sx1soD1zFhKkhBvJNriVVAxAeGa7qP6E+IrDIREX2
	OBLtOgyU2EkutKWUjlIo9cwnK+QHOcDkTSbSXkt2NHz2Y2uY+xkKmlJKxlDethcMqDWuixToXUL
	of6hnandcQ18EwfF4JUDJEPL6fAaClAVCLaUUYvmSDhJMGIO9F2Ciy8NMgVf7F/Z4sKdkWKMp5d
	7qaiVAfdvLKfOVxIk187AwQFNgH2zKzi9DgtFC7V98SoXPbtnG13HG3cL4y5H1Ij9Q7FkmYAA35
	YHbbCpkGW/yHjytHPVIw4G/e3I3wFnwr+VJTvyA1M03c/P3OAOYj1kfgpXpY8qZZT6XomPSIcdF
	UNNNusJHE16wlSGus2e1PUtxj9x0sjwh6CxZxQfWjjKSsZquRSHDnpcHH4f1u1VZg3d7aqAgqlo
	XNsoYOMRTaKe1+
X-Received: by 2002:a05:6102:3c82:b0:790:c7bb:43fd with SMTP id ada2fe7eead31-795aad39567mr3174405137.8.1789339520253;
        Sun, 13 Sep 2026 15:45:20 -0700 (PDT)
X-Received: by 2002:a05:6102:3c82:b0:790:c7bb:43fd with SMTP id ada2fe7eead31-795aad39567mr3174380137.8.1789339519561;
        Sun, 13 Sep 2026 15:45:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a04709b3sm1975544e87.57.2026.09.13.15.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 15:45:17 -0700 (PDT)
Date: Mon, 14 Sep 2026 01:45:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Kumar <vk092kumar@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dp: don't gate eDP on DP_SINK_COUNT
Message-ID: <eztwqufgpc3mxjeyfy2effil2my42rzl46meblopq23h2wrhwe@5jjgc7ruzlzf>
References: <20260908091708.3123735-1-vk092kumar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908091708.3123735-1-vk092kumar@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMyNiBTYWx0ZWRfXwH8CkCqyOC4Y
 f2Hfr5Xx+Aev/75K4nXsLkiGG8eD01kqcHUMTvy8uNWV0w2tUnz/5z0F/X5Ehyza5jmQqcTfgJ1
 5oYOyIGm82prLaCC18nOr1ZDuhWxa8o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMyNiBTYWx0ZWRfX2gX0lo5qFHVU
 hTT/aOWeYVQp7N9F8V8v+6ThC74q8tjwVq7/anc3GWXvPbmp9tnflV2NP1ZO07mv8pwdG5+Kd3e
 gd+E+n8DQkIZFquD4Du7KdYBO4sZDuvP85H8VL53jIlFbPLMuuiK9Vc3MtkdTWDfM0AgYR60e53
 ygCTaQfFuaTOgVO7FKbAidElN0L+cwEWXje+7vesBWS5Z+uuVoA4PeJ9A4wiYuqOoffMKwIXsRL
 h0EQbLb6gG+eo97Tm+Z0NH8+PVdEi2rYFiFXF9wG1kaDaVk8WRiiwYMz+uFT12FtlJuadWUYyur
 qnBX2O0coMy4ikC2K33otiSQyBgz8i5Mjtpdpo2sx8JEJgQau/WSMjsjRtgODPfIv+Rs8y3I+Sa
 4ePzV7kJkojuq29lRfXm1sRbyqTd+nWfX80NUvRHzk99JyEMtYw05TkGo9rVC1YYm38Mp4S5Ori
 CgmwDnlFrZZNscevzgg==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa72781 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8
 a=9Ukn3v4DKVw18m4NUkcA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: qlI2aE2DFvVDsXCt9cfbCtuu3SZlP_i5
X-Proofpoint-GUID: qlI2aE2DFvVDsXCt9cfbCtuu3SZlP_i5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130326

On Tue, Sep 08, 2026 at 02:47:08PM +0530, Vivek Kumar wrote:
> msm_dp_display_prepare_link(), msm_dp_display_disable(), and
> msm_dp_hpd_unplug_handle() all treat dp->link->sink_count == 0 as
> "nothing is connected", and in msm_dp_display_prepare_link() this
> causes probe/enable to fail outright with -ENOTCONN.
> 
> This is correct for external DisplayPort, where a compliant sink is
> required to report a valid DP_SINK_COUNT over the AUX channel. It is
> not correct for eDP: some eDP sinks -- particularly fixed-format
> eDP-to-HDMI bridge chips with no downstream AUX-capable panel
> behind them -- never populate DP_SINK_COUNT with a nonzero value,
> even while otherwise participating normally in DPCD capability
> exchange and link training.
> 
> drm_dp_read_sink_count_cap() already accounts for this by excluding
> eDP connectors from the sink-count requirement for other DPCD-derived
> checks (msm_dp_bridge_detect() takes care). Apply the same exemption
> to the raw sink_count reads in this file via a small shared
> helper, so eDP outputs with a non-AUX-capable downstream sink are
> not treated as permanently disconnected.

I think the better way would be to fix the
msm_dp_link_parse_sink_status_field() to also use
drm_dp_read_sink_count_cap() and to set link->sink_count to 1 if the cap
is not available.

As a side note, we currently read sink count both in
dp_link and in dp_display. Could you please leave just one place? If
not, it's fine, just fix the link code reading the sink count.

> Tested on a Qualcomm QCS6490-based board driving a fixed-format
> eDP-to-HDMI bridge IC (chrontel,ch7218a) with no negotiable
> DPCD-capable panel behind it; without this fix,
> msm_dp_display_prepare_link() unconditionally returns -ENOTCONN
> and the display never comes up.
> 
> Fixes: ca16db3d18cf ("drm/msm/dp: break up dp_display_enable into two parts")

I don't think it's the commit which introduced the issue. We had code
checking for sink_count being not zero even beforehand.

> 
> Signed-off-by: Vivek Kumar <vk092kumar@gmail.com>

No empty lines betwee tags, please.

> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 

-- 
With best wishes
Dmitry
