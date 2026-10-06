Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0313A59BA
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 06:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791269708; cv=none; b=ofrKko4y1WJVXTHyWlZvTwUV7023y0oL0Oql6MEEaChjohwFnrfflrxfWFIUqaplPjGvWNsn5OFzZtiFjt8prJwT72YNe/cEc2R18JhOc+LcQgjMIkJJlq9Ymtd4FwxKYhJfVia/DRaEUkv5kBzD3vKLBFwXyAYqBes9vr+PY3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791269708; c=relaxed/simple;
	bh=Y92L98xIukpKEG/rmRg5pGerJ4lGFNQ8M1Fvuz/xVnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eh65OVYTs00cLW1LfmBSLMDOmwir9tNYbK20ze+M4GMfGRndY2ZZz9y7jb/PtcZa0kfBkf0NcrZh+bj0Lm0HKTGmbY68pAF94gyvhDZhELxHr7hAlco1oZpwarkXiDlS0g7nhIV3wI4aZWN9utKWpmpy4BeUPyRuPyMme+O3wnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fS1kbC7d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GXT8penM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fS1kbC7d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GXT8penM"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966eANn1083541
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 06:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OmidZS1P/7FLoMQ0OZhRCGR3Pz3LVuqOUkRF13HzzhU=; b=fS1kbC7dRzXWNave
	r0ZWbaKGtoGe2tVK0v7ljOcXNrRno/Sf5ZbBrnOm03LkUz9GBHjyZoT416th79GV
	2lF323f08PVkTKBULVQ8RJw1lVbpePXgVNyzaLko3JLKf7dY7KDxNZtA2dSfP75n
	21cNlzuy1q27FZ0q9vfXrFHEO6pvsBLLMXGJk3+yuVEsEEqbfFj6NtTbvszSxLGK
	Wq3MNLdAOzUTG/vCd8F3KUqt3Lhk9UJ1QWNtLd1+UTPbQOKaFpZzpQRJXFUa7nkG
	xsa1SM+zk58IHLxu0kf728LcFEgUggYxx+V4LnDkuemNgnFIYRwzJ3fdV13HT+na
	HRylPA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4cuu3gkh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 06:55:06 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7bf08dc2fc8so318760137.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 23:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791269706; x=1791874506; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OmidZS1P/7FLoMQ0OZhRCGR3Pz3LVuqOUkRF13HzzhU=;
        b=GXT8penMGcSj5CsxW0UE36UGezt+UUTUD4ZY4zubwvWvrrsoOGXy4V6gDak634dIwN
         tbYcxXFvhOlQNxpgNoIvmO9iDcLUTwZvb2NlSzDM2NNA4c1+sp5SA9KDYvoIuzLS4tl7
         jgfcacLLI9pwig5xZgWo1rWq0bH+FhxSJiEirLF63hKedSIjzIGiiZJTDRiWWqIuLVQg
         taeVTps3d423P3y2GKmB1CntI51tfs6n3C1uKLTW5rUChvCDsQTljkf1xa+7e0DTall3
         F81+qZrCWc2npD0XS6tllrkApY3iNfLLobTHjfwwAcu0XAxpFs6+mKBo90Pj+nREKgDc
         eYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791269706; x=1791874506;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OmidZS1P/7FLoMQ0OZhRCGR3Pz3LVuqOUkRF13HzzhU=;
        b=lulvdNl+1g67GgKpj/gGnUsymBrAj1YwXLPsdOL7c9oN9U6MdjAlSYlRNMNEq2mVWB
         GjC7peNJ7XmVGg11j/OsWoBjpulkJf1EbdYvkE93+vtCxlW4r5iNBDvlmFW7IahVQDuC
         FGSw/r6eQhc59Ytam6lFEtvL+jIlkCD6UFbnhecx+2IfWdUTBorb7aydlFR1PYiyYkht
         D46v7x7wPXbBMFiARs8ggDSPXHX4l9y1x9+5IFuGbndsWMsPJD6wVWw04euH1ZGqp+pt
         DRWlGoTDP9J0ECgktWH+Xmx3bWT11yXJ8nsf+InjgGFEPcYRJE/6vNPOJrK4gtuibUMV
         aKDQ==
X-Forwarded-Encrypted: i=1; AKwUvByu5KEUjSmwPfrebMMGxZqfN9yv6FHSx4JZA+Wi4IR4QN8eaJHhzLttgNU3FoYi1H24UtxrOK1EWh1j8S4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKzczM0wPERzBEgnEt5AXmjlH6QC3Ze7I5WrqMQVJTc69l/lL4
	HTlbNfI+ML68iuVbbLP+iMCazJAsO0Woam4KCSDYDezNhyzKkKHv9gs8Ns4yraocG4dnp2sUnpD
	YMYjbLJIfPzfajihzz8uPDHkw4MdF/J+xf9nM+i5CLA4RqjstlUjjBs+T5pk4vH/rJgM=
X-Gm-Gg: AYBFou1+/ewwbIAF+om0WhflZKNwmdh2YfTC3MDDwPFxgc7Hg1flgsG1PjOw01jDMDK
	4oSpNGOxLclGl50ixTm0BrrlFXGNKSYTOfhfSa23eGqG515X3wS3jg+xXuEvCrhPHJhfkkJoLzZ
	hc4H1m2JnSZGoKW69uzFHiZkmO2iTnm++XOpqqGBfZ9fJQy6zNGwebSEvTr046KHl4v0AwV8Xxp
	jRl/8q0PsTG6AltY08gevhmEMzNYWZTkN4zX8em0r6oPw3lUksyHCGi/iF8xmgMeZ8l3wqfZeeo
	f5K4QaPDT5TnD0/zJdhgpmvHTYLZ2lSvMXIN73kaJbF4i//21LohR5pLtqIf0aGlDjFX5IryFx5
	qpvtWROkcklsUDcCDJ9tiD9De4EIJTf0H4o0SsoSu2F1KP3V6f0bKd5lWcR2X+yFW/Qszi/pFH7
	RkdrOomDr0YWV1
X-Received: by 2002:a05:6102:4493:b0:7c1:c1fa:f3e9 with SMTP id ada2fe7eead31-7c87c7eaa99mr64209137.22.1791269705445;
        Mon, 05 Oct 2026 23:55:05 -0700 (PDT)
X-Received: by 2002:a05:6102:4493:b0:7c1:c1fa:f3e9 with SMTP id ada2fe7eead31-7c87c7eaa99mr64195137.22.1791269704876;
        Mon, 05 Oct 2026 23:55:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e303fabsm52162651fa.21.2026.10.05.23.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:55:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org,
        Joonhoe Kim <26rote@gmail.com>
Cc: abhinav.kumar@linux.dev, jesszhan0024@gmail.com, sean@poorly.run,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: compute the CRTC bandwidth from the state being checked
Date: Tue,  6 Oct 2026 09:55:01 +0300
Message-ID: <179126968608.1110179.13039168143439761723.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261002130656.50577-1-26rote@gmail.com>
References: <20261002130656.50577-1-26rote@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAyNyBTYWx0ZWRfX71/0NWg6vCJt
 FL68ka7X8RfvpM2JveQnNwcCIAYkYSOqQhTDxPRuGo8+NMNUx7G5JVGoRfvigBYFGEMpOGZ1WEk
 JyD5eZh6cr9tk3XOsuF5TWNYi1PJRq4=
X-Authority-Analysis: v=2.4 cv=aKRlOr9m c=1 sm=1 tr=0 ts=6ac49b4a cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=e5mUnYsNAAAA:8
 a=Vzt_8YN6H3F5x3tZ7K8A:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: BFnlfhp6ON_Qbzk408uozgC3qR6Y4Q7a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAyNyBTYWx0ZWRfX/WbgFkhfzN0y
 VqzXFyepLbgnfT7aSttunpDV5e0QX/91x9+S2OVDkhHm+rq+XZ+NOwggU+LulEghgVtq2bsXnJ2
 TJdNY+IugL8e9Ay/yGNt5zYqyHUKU6ajy1ZZXHp2Xh1xcXhNBzd9KqOi+nwvAkHII6uM9KauywA
 gvNDP57pc2x8jl1sGtoYFVrWwbp9CKgeAHyVc/jctDjl7BUunN/QE9LXXDUGHSvlG42SV9flSfG
 jPx6q+v1AwXLiDFb2nhVTgGkjglTu+AN3qzwgZyNRNcAsZbbLQmqVQ2WSeb2PpeOozdr8iXBFOu
 /8CCzPVkB+05j/I2khIGlOpOz81CqnUmyTrch1coE11yO7LAEYpmcHK+RBCtbYPOkNSjT5DVuoK
 pPpX0MaZ8fUDXv3yf0WTV8ZXtiLWHcraqn+Sxkk2ESt71IpHSDlDn7jnnG7owZFHrOkuvrnMKNx
 mLfmG/4RX5zv5h5A01w==
X-Proofpoint-GUID: BFnlfhp6ON_Qbzk408uozgC3qR6Y4Q7a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060027

On Fri, 02 Oct 2026 22:06:56 +0900, Joonhoe Kim wrote:
> _dpu_core_perf_calc_bw() is called with the new CRTC state but sums
> plane_fetch_bw over drm_atomic_crtc_for_each_plane(), i.e. the planes
> of the committed state. When the CRTC is re-enabled (DPMS on, system
> resume) the committed state has no planes attached, so the check
> computes bw_ctl = 0 and the display runs without an average bandwidth
> vote on the MDP path until some later commit changes a plane -- which
> may not happen for a long time on a static screen such as a lock
> screen.
> 
> [...]

Applied to msm-next, thanks!

[1/1] drm/msm/dpu: compute the CRTC bandwidth from the state being checked
      https://gitlab.freedesktop.org/lumag/msm/-/commit/480ba24aa340

Best regards,
-- 
With best wishes
Dmitry


