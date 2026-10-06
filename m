Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB03367F58
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 05:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791266217; cv=none; b=VzKVZHUKD8t2+l4vq6yEjS2eJLYogyje8/JP1ZQJsPxt9f+rCw9jWtvhChEB4yT5z3h69iiUSgQuq8iERoIU29LVrDYIFz3zJxiAK/ptu8V4yyg/rw84eO7FM9F98ydYSLeKxyRwDNH/R0pVBr4dtV7gXpGpIoWK1MAHjKr7T0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791266217; c=relaxed/simple;
	bh=U8Y4qqk3xsk0rSY9dL6Wk1vB3O2VAT/xbg3zHD+GsKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PaJU8FLN+IIMMctCRNfff3IX4MSIWK5addyJ+GD8FBMaFStLdu9QvDkvdGtXB4ZxLHJ//o1dJBGSxY3hfGNzbfzTIg4CLyQR8g2V9JDw6mTlhhJVWhG8LE7XY7TGXeVxkQe4r+j9WbyFVzT4/b4KHwdmBwIX0Rz4BO1LHs/SNG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y61x/0ZR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BhbsqxGr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y61x/0ZR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BhbsqxGr"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6963AGwC585477
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 05:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F7B4QuK2fsk9nNke4mivA/qr
	+54QLFDs3FrqTwcKT1Y=; b=Y61x/0ZRXG/nXIIAcpxskMTNmmCWOFxX9YTMHF4X
	CgAFOl88pHZacSEDWP7jzICjRcTNjo/YouoTdBOxgY5OD5x+N3gxzWnvOG9g17mc
	72WN66mVVKjoFUfznL3iGeTZBGhyoVk9JRIl6B+1DS8tR9uoj/VNtZvbGxw2whzV
	WHjvExSXWZC9oLAvB5EJF/dOyQ6E2F2kykJbhsRYnj1rpRAT5RgP5ma2fWUUXbiC
	BTYjIT5luVRlyJsVI0Sk3MG/5tyuAxLNIYkKYrLRD1yZjuSA6QsJUx10Wisggx1j
	PU1C8Jt8Gd4DJN8emt8iZe1EcI1lUxkeC0/LTk569T7SdA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h49u441d0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 05:56:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc40759b2so526240585a.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 22:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791266214; x=1791871014; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F7B4QuK2fsk9nNke4mivA/qr+54QLFDs3FrqTwcKT1Y=;
        b=BhbsqxGrRZGuyUruumK0TNQp554jF22RlNPyy5R952M2UxSAAow+uVNMq/bmKpDatr
         /lZ5t6et7vGGAvPqW5lqje9QX33K9vyuFxt/SXQp1bBqcuXd27lZuPCtmgC3XjnTD6By
         8y4N0/sk/aaSab5bXqRO1CO9EaEw+UI+7tWoK+WngQE2rd7rppfLtb+22p645i5BBInG
         Rq4KCupVnTFldbHw6OmxAh4OBAaBOqFxYwHwRFWHF/xb7zurrwFbl52NGFpgokGN5J3c
         JwIN6GN3RUTsQbIrx936jHWfh5mKhH7tPvNGZup5T+a/PtSGQvzYa6VWCX/R8cd2Hsme
         d3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791266214; x=1791871014;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F7B4QuK2fsk9nNke4mivA/qr+54QLFDs3FrqTwcKT1Y=;
        b=udvLaF95Ojd3ZTE9A1KBPLAau3TGqk90qn5Cmf/Rhkwr5KrvniUohFq8Kc+I/+rsEy
         Bm/b1M0ITU6NCosSL0riGAub5f6hJYR7lk/OaQqBEIhzgU0qg4sWUtIt7EYb6WioSFup
         6oYU23fG6S2LFvJz1Z+iKTPY+CIxv5o0y2aXNnAw96ObKqOrHaoZOY7ELbjEylgzKVcg
         h5QKErGMb2HSa3jhM6weyaKBfPJkwopMSHwSCgnxpBIM2ZuZTB+a3883ExV2pcbiDLjq
         AsHxSqht6oLrU750GWntvkwi8LPkbb971htz9JiaWIZQvz/SpLp6O3CWZTrksePpDOrp
         pqXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFOac+AEIF1yzCOdXQrqC8J1sOUwx6uWQJx7ZaS/AHBoAd+BKBmsXABLBny39W9DYjQWQ2mgVBbDTVW3Q=@vger.kernel.org
X-Gm-Message-State: AFuF++ng6Tr2VH7wYHWPu6VsOxQzbHGaQc+r3b+PNFYKEf4tjuokBMFT
	ST0jsp2OJOPw2NtW8CFhP44h6wZ8MiJe4XtV7ntz+5rmkeZqeJ0vyrt8AEXmpbRcmo5UU9uohzX
	3aDRxInLVvhphcP83F2XbnmYrJkbLaVxwICtwhmKTDRujVXxiYY2My3+GuJKZDsqNRY8=
X-Gm-Gg: AYBFou3Otm0zALYqBvQDYyOVidhlvlAxypoamkKX6thbr2nnTxJpQfeh0STYBlAAcFg
	yM1GhS2yEz4WfX5ZxKa6BJ9tRos4o+/G6MvWmGOn/p2HACA5Cp1rHOk/SgT0TTFyhAg6LPwGXzg
	scEf8Zh/iCWpIHm2ETcn8yROgef3WhKNb5r4CVj6b2dUqfHjqhL5/4E3SuS2G81LCEMMQWt3QP8
	nx+dtptvnu3eQPwbcMShvIcAD5ijL6UaQvKDmSNFt75UoJ37OIkCWMMyZXux4+MOEbhDwV4BQCS
	LcfKMU4EfFigPjgWShcFoQh7jau8ejNjTFrv1ybHBTsho59hAajLxXlEk73WlLsRtN+oeYQRQHs
	BPvoCP3zYu6egbd8eV4UfJf4WXNWVWNqtjaFOsRMlAsnfbgHCwA5xsU4HX14GzMfW9fcG6qMAI2
	MhfIGgIQ0mbbST
X-Received: by 2002:a05:620a:c42:b0:93e:4833:82e7 with SMTP id af79cd13be357-93e8f4e77ddmr71058985a.46.1791266213612;
        Mon, 05 Oct 2026 22:56:53 -0700 (PDT)
X-Received: by 2002:a05:620a:c42:b0:93e:4833:82e7 with SMTP id af79cd13be357-93e8f4e77ddmr71041485a.46.1791266209460;
        Mon, 05 Oct 2026 22:56:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcbc7a1428sm1877753e87.32.2026.10.05.22.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 22:56:46 -0700 (PDT)
Date: Tue, 6 Oct 2026 08:56:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jean-Francois Bobier <jean-francois.bobier@laposte.net>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Saim Shujah <saimzst@gmail.com>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v2] drm/display: let a bridge configure sink audio from
 hw_params
Message-ID: <42emyzl5p3kpvq7e3b7npaaghl62r4skrpdflszk7v3jagexal@6jdg6h27eofw>
References: <20261005131545.23219-1-jean-francois.bobier@laposte.net>
 <20261005161824.36445-1-jean-francois.bobier@laposte.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005161824.36445-1-jean-francois.bobier@laposte.net>
X-Proofpoint-ORIG-GUID: hyKc7bYat85SfGNX0oZfbJ4-gSiV6xy5
X-Proofpoint-GUID: hyKc7bYat85SfGNX0oZfbJ4-gSiV6xy5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAyMyBTYWx0ZWRfX/4vLGa/lEAe6
 ncxEuqtEymaLAmqnrRa/9f8TJ1+vvuSoVjvzwrorxmeiN7yaQSxxek73RmKfLrakKr8QtBxAQxm
 41UxNysOu9GZmEjVCZIUafqLHj+Rn1k=
X-Authority-Analysis: v=2.4 cv=LuEHWXdc c=1 sm=1 tr=0 ts=6ac48da6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=AVbMHacnAAAA:8
 a=rEcrq_ABPuTkkkh6-BUA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=Z8w8RPyABVWp4NBWd0ke:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAyMyBTYWx0ZWRfX/EY2k1qX02dp
 XiSDskj4bywlG1eTTO/p/cVrwX0IpZXz3/K4ERaXrnXeXkeDecsu3pRg22H+GQu7kjM45UnD22p
 L5eouKQoW8gEXcSG/2/SjbxiIjBKr2w7o0SHvoxoxe0DDBPDTvQc3tXUqBIDAD0SjDjAjjGS0v/
 jyDT2tfOy7hX8cTagdakZcwJULJfGY5z3CJsn1qg1xPPg6I2tZnA5bJhk4fF5B10nl5bfHThQUr
 sXiv6Q7EdKkadzjxPA4DtV3O+AutVHqdu4hxJHQJTtaBO/Z2RXR0UEAMzEDaEt30HEZEcELENe8
 iYGvDfqmf/anoXKzC6WOVJXkx6oeOR1a4hylf9760BuXFqkBd2NeabvLOj//gw63Cp1udizEm2w
 lxPFSOn155GQuazWfS02tI5LLFk0uRetuXchigFjtiJ6G7MCL4bxcowAV6AqvWLeo2WwwHpFimU
 /0jXxy5P8DyoB/k9cPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_01,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060023

On Mon, Oct 05, 2026 at 06:18:24PM +0200, Jean-Francois Bobier wrote:
> drm_connector_hdmi_audio_ops implements .prepare and not .hw_params, so
> every bridge using the HDMI audio helper configures its sink's audio path
> from the codec DAI's prepare callback.
> 
> That is too late when the CPU side of the DAI link cannot start until the
> sink's audio clock is already running. ASoC's snd_soc_pcm_dai_prepare()
> walks CPU DAIs before codec DAIs and returns on the first error, so such
> a CPU DAI fails and aborts the loop before the bridge's prepare is
> reached -- the clock it was waiting for is enabled by a callback that the
> failure prevents from running.
> 
> Qualcomm's LPASS is one such CPU side. On an sm8250 board with the
> DisplayPort controller bound to the DISPLAY_PORT_RX AFE port, starting
> playback gives:
> 
>   qcom-q6afe: AFE enable for port 0x6020 failed -110
>   q6afe-dai: ASoC error (-110): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
> 
> and an ftrace of the attempt shows msm_dp_audio_prepare() is never
> called at all -- only msm_dp_audio_shutdown(), from the teardown path.
> 
> Add a .hw_params to the helper that runs the same configuration, and a
> drm_bridge flag to select it. hw_params runs for every DAI in the link
> before any of them is prepared, so the clock is up by the time the CPU
> DAI starts its port. Both callbacks receive identical parameters, so the
> configuration itself is unchanged.

Similar changes were proposed several times already. The IEC958 status
bits are usually set by the userspace after the .hw_params callback has
been called. With your approach the hardware will never receive correct
status bits.

If my understanding is correct, a more apropriate fix is to make the
a6afe driver to emit AFE enables at the .trigger point instead (maybe
together with other commands) or to split the DP audio init, moving the
necessary bits from the dp_audio_prepare to the dp_audio_startup
callback.

> 
> The flag defaults to off: a bridge that does not set it keeps being
> configured from prepare exactly as before. For one that does, prepare
> skips calling the sink's configuration again only for the specific call
> hw_params already did it for -- tracked per-connector, consumed on use --
> because ASoC reaches .prepare with no .hw_params ahead of it on XRUN
> recovery and on resume from suspend, and the sink still needs configuring
> then. Skipping unconditionally would have left it silently unconfigured
> after either.
> 
> Note that providing .hw_params at all means hdmi_codec_hw_params() no
> longer returns early for these connectors, so it now runs
> hdmi_codec_fill_codec_params() and the IEC958 channel status fill before
> the (inert, when nothing needs doing) callback. Both are computed into an
> on-stack hdmi_codec_params that is then discarded, and the one shared
> value written, daifmt->bit_fmt, is set by hdmi_codec_prepare() to the
> same value immediately afterwards.
> 
> One more side effect worth disclosing: hdmi_codec_fill_codec_params()
> also writes hcp->chmap_idx, which is not on-stack -- it persists on the
> hdmi-codec device and is reused by the next call to
> hdmi_codec_get_ch_alloc_table_idx(). hdmi_codec_prepare() recomputes it
> immediately afterwards from the same channel count, so the value itself
> does not go stale. But hdmi_codec_hw_params() now reaching this code at
> all means that a channel count the sink's ELD does not advertise is
> reported from hw_params() instead of prepare(), for every bridge sharing
> drm_connector_hdmi_audio_ops, not only the ones that set
> hdmi_audio_prepare_early. That changes when a bad channel count is
> reported, not whether it is, but it is a change to seven bridges this
> patch has no other reason to touch, and worth a maintainer's opinion.
> 
> Signed-off-by: Jean-Francois Bobier <jean-francois.bobier@laposte.net>

Please take a look at Documentation/process/submitting-patches.rst and
likely Documentation/process/coding-assistants.rst. For example, don't
send the new version of the patch as a response to the previous
revision.


-- 
With best wishes
Dmitry
