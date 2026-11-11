Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794417232;
	b=p4o/J99jhXZJs9+XOlupQCFhHl1LXdBBQEJrRq5MbCohoEhTxhtIqPpszxGbP6Zh5AOD
	 KuJnPfWhDXtaXYhVIBahHyVh9wCtvNHJU3bi2UWRFOijgO3s8G3enIxS9VgBDWSoNFD+a
	 o611KgKyPf6P0Uibr/vGCw4AEi7MBi6zRsbaAIBa5fR7tp+gtbGVjeE9m7nZWCg2it/k2
	 xJs1VlbIF6QKFC/51H3buaJrGadh28EJe0A92g51cIJSCALP8/ki896KR7YeT+v39qsle
	 bP8v9lOPPpCx11Dg83g+5JsIG63zigakdgMbBenYj8I2QfNz34IDcp0V2vvsAkd9KkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417232;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EAm+hwV1E45v1JKyU4NifbxqjehcDV1sr0hUES+EoSE=;
	b=ciqAX4NZk51F+BbQiFehhnQPyvw9D1MLVKHfhB+9ssagjk8R8lkZgDbf+XlrQRkX7bEo
	 DN7+FIf8ruPNmkgfyMNhXBw6muo3zfAFOIptPHWFmao9kpIAOXTqw9l7ldwlw5PG0Jgvy
	 HlnFpgkv+A7cz+PCqqLqGEYyyQ5dhHZb15dQnXfr8caVghReVBN3m9ncc2b0T2ko+mPFd
	 zW0WePoh2bzZsz3SsVX5lrpd6RZeU0RumTvZjQT+mDdyFtqU1aeIeqTEImuLr/6RZl+1P
	 Em1R33KpuX9iYfPdBylyDivlBwtxwBUUG7XP1/sb32ZWpuvpukcEqoESLA3Q/B+zk6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YEhTcyIX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i2zaOGn9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8821A606A332
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8821A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YEhTcyIX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i2zaOGn9
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0Pa71565813
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:13:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EAm+hwV1E45v1JKyU4Nifbxq
	jehcDV1sr0hUES+EoSE=; b=YEhTcyIXlx4E9RnEGwSCphsW0AKO38AGEF9jtVSG
	EgZUQ3d+YwvmqxK4JPxFIS94kg9o+KoSw719CoL8BKNYCWJnB2+DXXrhSVTlrdyY
	tUY30HpNfcFYP/e3SZj4BgtK+lJSIDV+NvppIaNGzlbDoOqCMFlcZ1sMUo9RGbTM
	+SjUlvoxFQmSwP0e/qUUKdbt2bFMtq+c0VSEhsdnBayDbDj2dzQAVU+Z0ltTgphu
	UC1z9mumF88MQriAoJjxgnJXxQrhjVdG9YcQfIr9AZXl/55NqOeXwfg7wd57T0uU
	V/310XioTUchrP4rjokX8gtKq4P3g0zu/bm4gSRUhNnh4Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvs4m13du-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:13:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f3969a2a7so557193685a.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794417230; x=1795022030; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EAm+hwV1E45v1JKyU4NifbxqjehcDV1sr0hUES+EoSE=;
        b=i2zaOGn9PP7/CNFvp6LWAHKuKwLUbkg6/imulI9r+e0KmOqnH6rbJ990NbYvYhDlLy
         80zkw2kID8i6DiCumKZwok5sOa/GFvxQIL5cVGHigh0F98CFQq1EdpOdNSGcS47b9dhR
         tIlYnTSLBrtrPfCS6X01QUuGR8++GpVpikTD9V/n02cfm2w9nohvnUC02kpxteTIcmsQ
         jadLZOmtdqC73SfkWrdDMLF2ujBc8TEYHdB9l3lJp2CwQZuTCXGurFFYF7Vi/yFz2RdI
         31HXCAtFy8L9a+jLzQ+OOmXHFPFbD+jxvWbKBvyAu69q2VkLID1bpK3BNvfSAOFjWKMj
         CCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794417230; x=1795022030;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EAm+hwV1E45v1JKyU4NifbxqjehcDV1sr0hUES+EoSE=;
        b=m4YGVFk0MHHQdPIprvjF8Qqw+HgWvAaFq7O5zvMZ+FVXdMs3hwa0YZUPA8Jw8uzgX5
         sb0UUq9IkYGTFKA2+0b+USduqmGucPcqlRYctvSYd1qj/6XiCh5a4OlQMbTW1QJgO5vH
         ai3e6OeWqSVtFBdLF1HkzIl7QCBB2WZGHVROfLgIjT1SlbmXXa8JtazebSdbvTH9OGJn
         vV0FD9tf1B3hypfhE6WoL9QYAqXZs5o3+F/6kBi46rQsJduCdoG9IwKYI8hdRjPW6jYy
         kbEnTCUqMqRAI29RJBIvJRmgOUDcfiJ2ydXxlQVnnO8IXYcLIO6/B0Z35N1/ooUfP3ok
         JROg==
X-Forwarded-Encrypted: i=1; AL+hErExsLLFqzDyT2t5d+WA6sm0/XkyXe5J4cii0fDtd4jfFKdjwPDGrHvsSwTKolCV7jCYRGYzAGgqfWAa0i4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CgoG7KHkwXD+e/ryfIYNNR+wNcSDaj/S/sVkpzeSVerwDpr4w
	wS9ak0kxRL86iJCmDvCBSZiXr3fJiL7mLBr1rFT3aD07t0d43t5HMlF0hMLnnG4RKNZgZE8j59j
	gXndPuAVnxW/mOvzXRwcqWCe1dcZ6lIL9EwCvR56A3sr5aCrj3l3KVBInSXRqDaXBoFg=
X-Gm-Gg: AYBFou1nMCgPv655zb3AaO3Vno8p9X3Z0yCTmsTD4mtSXOJEMkgftSJYGVKR5EU5ezd
	TB4fhbDcZTNdasHWuCYI4G40XjF8Ea0ZYJKJuqHsn0XOpp42NGrNqowfdJw19TY/SEQTQOiHTdH
	a7c+heZU16vX801ojhpdp5g6kbl9z26LWqnac6i0gEseNzwq+rXKjea0mKAO/XAl5JF9dA8V7GL
	/9OcgmT7eCGfIZHcAnRlXlyb6U1OCVG71Yc3yCfA1Pxzwp0W5GTAObB7llRuX0meZhKZjpYdKvU
	NY8pO2ovU7G2p0dDDv64S2YJmn5I9QU6sa3KO2AM8+CLw8YLps8kHT9a0GjCg0hzXNTKn/MMnDB
	27CRNuoiecfBfuF/oxUJ2xfKMr57S3Y9vCcZkEaODBOKQDzp6rfjYdW0Q5TRCnQ9T7TywLwW0Vg
	vmpoLxmlQ0/DIAhMMho/95tNnOncq7dbE/wPHHdu+Sko2SLZqk6B6SKO7LMoV8HQ==
X-Received: by 2002:a05:620a:2725:b0:940:7e5c:7424 with SMTP id af79cd13be357-947b008a44cmr488325885a.66.1794417229480;
        Wed, 11 Nov 2026 09:13:49 -0800 (PST)
X-Received: by 2002:a05:620a:2725:b0:940:7e5c:7424 with SMTP id af79cd13be357-947b008a44cmr488319585a.66.1794417228930;
        Wed, 11 Nov 2026 09:13:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae09173b53sm11554591fa.3.2026.11.11.09.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:13:46 -0800 (PST)
Date: Wed, 11 Nov 2026 19:13:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Joonhoe Kim <26rote@gmail.com>, robin.clark@oss.qualcomm.com,
        lumag@kernel.org, abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, yongxing.mou@oss.qualcomm.com,
        Xilin Wu <sophon@radxa.com>
Subject: Re: drm/msm/dp: hold one runtime PM reference per plugged state
Message-ID: <2ndbj5fk7tnmexirfulh25kwx6pjzsmp7vjczbhqdxxuw3fm5u@qx5qumdw6ng3>
References: <20260929130627.959-1-26rote@gmail.com>
 <018c6fae-49d3-4f89-8212-8c6b64a2829c@packett.cool>
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
In-Reply-To: <018c6fae-49d3-4f89-8212-8c6b64a2829c@packett.cool>
X-Proofpoint-ORIG-GUID: ydu270V-c2PeF44FcFfAnJc8z0gH5R8R
X-Authority-Analysis: v=2.4 cv=OYANnRTY c=1 sm=1 tr=0 ts=6af4a24e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=P0_V0cqhvWXbucGuATgA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ydu270V-c2PeF44FcFfAnJc8z0gH5R8R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2OCBTYWx0ZWRfXxoRtpc8gMITG
 6Om8wJYYe22qn2evKmqWoy1rDPEcQCrStYSZpA5QMizWLIgJulQYiK7WC2yiike1nj9TKR8ffv9
 ReC6zKGR+U6oo8vEKQ//ZXk074U1swRqziTqmd37CYK4HYqznuEeBfA8vt78cdCl2Lju6Hx7b2e
 YNtXwM4vFJB++nsxQnxpl9uQF795FxQ1+YeCQRKzC0P3y7W0Uisbrq/OTVKN+2JiddB4Mqldmt+
 uB1aJrJUP/BXlkTEHu8q6alVEfHMYeujsucxG+U80RE7gxaBbS40pumdyo49lORJAF3WmhZyxMR
 27OXu51/afgXyPqbhHf3m/kDj7Dnh6wvEkYfWJNmhFpGF8RTIYWArx2iNxjlOdkw2kK9Nf7jA5n
 OYLlIgnRakx+Mcd67xjIXR/0k2qz9YjKDLjyewaO2xbS/rA54jcQ11wLtGQednWWJV3hded4jUI
 KggaQn5iQQfUrxuL41Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2OCBTYWx0ZWRfX70KwmMAPzFZV
 ct7QGjUd7O7JsfOseklke1iCoGOVJuRUp+nEHsgAyK0OOesQ4Q5MC6G8dN65moWQl5ZOAvn9Iv4
 Pyhrl2Kbvkm396XRKgzzv42pAbfOPuk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110068

On Wed, Oct 07, 2026 at 01:39:00AM -0300, Val Packett wrote:
> 
> On 9/29/26 10:06 AM, Joonhoe Kim wrote:
> > The plug handler takes a runtime PM reference every time it runs and
> > sets dp->plugged; the unplug handler drops a single reference when
> > dp->plugged is set. msm_dp_bridge_detect() also takes a reference and
> > marks the sink plugged, and keeps that reference as well -- on every
> > detect while the sink stays connected. On top of that, in the current
> > tree the plug handler runs more than once per plug:
> > drm_bridge_connector_detect() calls .detect() and then .hpd_notify(),
> > and pmic_glink altmode reports an IRQ_HPD as "connected" too. Every
> > extra reference is leaked on unplug.
> > 
> > On a Lenovo TB323FU (SM8850, DP over the USB-C port via pmic_glink
> > altmode) the DP controller's usage count reached 28-34 after a few
> > plugs (rpm_usage tracepoint), so the controller never runtime-suspended
> > after the display was unplugged. It in turn kept the MDSS core GDSC on
> > while all displays were off.
> > 
> > Make the plugged state own exactly one reference: the plug handler
> > only takes it when the sink was not plugged yet, and detect() returns
> > its own reference when the plugged state already holds one, or drops
> > both when it finds the sink gone.
> > 
> > With this the count stays at 1-3 while a display is connected, the
> > controller suspends 3-4 s after unplug, MDSS suspends and its GDSC
> > powers off on DPMS off, and replugging (quickly or after 20 s) still
> > brings the picture back. Only tested on this device.
> > 
> > Fixes: 3ea2d1c3d154 ("drm/msm/dp: turn link_ready into plugged")
> > Assisted-by: LLM
> > Signed-off-by: Joonhoe Kim <26rote@gmail.com>
> > ---
> > Related pending work: "drm: handle IRQ_HPD events correctly" v5
> > (https://lore.kernel.org/all/20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com/)
> > removes the IRQ_HPD-as-plug path, and MST v7 26/35
> > (https://lore.kernel.org/all/20260929-msm-dp-mst-v7-26-4b81473185e7@oss.qualcomm.com/)
> > the detect-based hpd_notify for DP; the reference that
> > msm_dp_bridge_detect() keeps is leaked either way. MST v7 27/35 touches
> > the same lines as the first hunk; happy to rebase on top of it.
> 
> Also kinda related / touching the same places, tho not yet sent to the lists
> AFAIK:
> 
> "drm/msm/dp: Mark the link bad when an active sink is replugged"
> https://github.com/radxa/kernel/commit/eb3247f6f9a39dcb15cf4b1df6d4732b1489b410
> 
> >   drivers/gpu/drm/msm/dp/dp_display.c | 23 +++++++++++++++++++----
> >   1 file changed, 19 insertions(+), 4 deletions(-)
> > 
> > 
> > base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
> > 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index 6abe30bdff12..4e47b659c71d 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -412,10 +412,17 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
> >   	guard(mutex)(&dp->plugged_lock);
> > -	ret = pm_runtime_resume_and_get(&pdev->dev);
> > -	if (ret) {
> > -		DRM_ERROR("failed to pm_runtime_resume\n");
> > -		return ret;
> > +	/*
> > +	 * The plugged state holds one runtime PM reference, dropped by the
> > +	 * unplug handler. The Type-C side repeats "connected" notifications,
> > +	 * and detect() may have seen the sink first: take it only once.
> > +	 */
> > +	if (!dp->plugged) {
> > +		ret = pm_runtime_resume_and_get(&pdev->dev);
> > +		if (ret) {
> > +			DRM_ERROR("failed to pm_runtime_resume\n");
> > +			return ret;
> > +		}
> >   	}
> >   	msm_dp_aux_enable_xfers(dp->aux, true);
> > @@ -897,6 +904,7 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
> >   	u8 dpcd[DP_RECEIVER_CAP_SIZE];
> >   	struct drm_dp_desc desc;
> >   	bool phy_deinit;
> > +	bool was_plugged;
> >   	int ret;
> >   	dp = to_dp_bridge(bridge)->msm_dp_display;
> > @@ -910,6 +918,7 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
> >   		return status;
> >   	}
> > +	was_plugged = priv->plugged;
> >   	phy_deinit = msm_dp_display_host_phy_init(priv);
> >   	msm_dp_aux_enable_xfers(priv->aux, true);
> > @@ -960,6 +969,12 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
> >   		}
> >   		pm_runtime_put_sync(&dp->pdev->dev);
> > +		/* the sink is gone: drop the plugged state's reference too */
> > +		if (was_plugged)
> > +			pm_runtime_put_sync(&dp->pdev->dev);
> > +	} else if (was_plugged) {
> > +		/* the plugged state already holds its reference */
> > +		pm_runtime_put_sync(&dp->pdev->dev);
> >   	}
> >   	return status;
> This last chunk looks odd, is that not equivalent to just doing
> 
> if (was_plugged) pm_runtime_put_sync(&dp->pdev->dev);
> 
> on the outer level, outside of the outer if/else?

I'll fix that while applying.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
