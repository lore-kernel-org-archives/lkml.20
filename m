Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDCB552942
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873008; cv=none; b=cGgX2KBEcpJP6K32JXytY6aEQcesMO4GuBPgCVUZQa9H3zsXo3jejWgHP6ifAWsMcFYx/sv87RMoYCZPdg2BiCrQUV/E5YeduGFnV9HFUqt0FqJtlqyKAoYcp4eXKzEyHu0JIqHgvL3p+EyCwsbHLX3on4FoX+B3Qy35pUNd/yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873008; c=relaxed/simple;
	bh=GVMTOJA1QM9ESGzfxrNqZcK8VGuiCOHUCpp7TidGujQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WrF/T33PDpTHPrYcLtE4QujPcO+mGszH0dZSifZQOil9QnVuuM2im3N3tDuMk7K2N1e7OM1X+dmPNZwqeDD+KIQ2ge+3YUIwrBMk8JHY3YIM2EXW4PIx8NyRwePjFszbuQeWtLhpcxVgnZBf7BrYw8muqurVRi4PGJjTh3dy3uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FYEEsmu9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LTeS6VVc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FYEEsmu9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LTeS6VVc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688CklRY2343499
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 13:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XtibxPQVyAZfi7GIcCdlRshMUFB6kV6tOrHbxWFRoTM=; b=FYEEsmu9Bp4RxlKr
	bdlkDU7MM956qVwX0TH40aknbPt8f8sGAAXZ569953xVF3qWYKwmqH3MRoKTZFai
	Np5YiUDQlpNmS04fiP2jqJAFyhgQSTYFXOcYrMvKa2NyfvdZNaV1oab0T7ZKD9fH
	J35pDir6rCVbmXaohQRWqfEfnOvXhRtK2lq+3M+9oby/aZFToyIGfH8NLjPAnSUM
	IETCZxEIXjKh3J6fy+Wq2QK/v8PySRCtHvQIN5iS8OtaytEq7tdZczXAM2ZOBHk0
	lfM+L1SG8GTvnYPZP0EBQTaOp3hL4bFE+G4Rv8iax5C42AHCs2SksxywO9+dIeaY
	0JKEig==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjatjj4br-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 13:10:06 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c5db8b6d03so1663650e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788873005; x=1789477805; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XtibxPQVyAZfi7GIcCdlRshMUFB6kV6tOrHbxWFRoTM=;
        b=LTeS6VVcdSdlzz6ojidkB7BsV4G+ZlKgLY5aQ8d1U7Ukfvtqmj6ZoqBwm6liDT48xy
         9Vu6HENUgTfiU854DhbnBf9T5gOrLEdARu4+NbRLK60Bar3HJxKQi2Nxwjam914TI2k/
         wffghJEydFuCGIlC9gG4R/a/DuUxS5jbUPIUc3au438Y1iHRVWII+VQreDjfznsHUDt/
         1mJQvWyQCGLzNPp9Aw1AE3QXevwHG6HEXrMZa1caIETPhrRxz/X+TMwIDCnybpEDzxcz
         IRSr5KSXqFnsjuVISKXILPZsZDR0j7cROJQyL7xyJmXjT9WptyIXpNF04Gc8yZumBTkl
         xweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788873005; x=1789477805;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XtibxPQVyAZfi7GIcCdlRshMUFB6kV6tOrHbxWFRoTM=;
        b=OomZ5chkrPqetwHThyGCuCytWJX7vpKPFXrwUnN/tk9uAhAyBBTR/LJ3SR6akI/rQA
         MbXi4EQw+tMprIPSFpxdY1FuqKBBi9I5cWAgEj25gN6ytSjMQ9GWZlHDh717zqOWFlct
         jU/pU2Vbw0I28AcHh5nLhqwq5oJvJTArfNDE/NFiPQXpjt4miFasLIg/Pe/gu+d10py4
         g3j7K9sPGRUsAj9f/jtCR5X9teuTic1m1do2PPjRQ7Xzfw+P2BeJrahPh9c44tl0arWM
         epkk3d808JgN0AzESvsT9aLMz4/Y2Kfn+4YIY9Pe1dgtbrF2ko33taqv003Gqikilt1N
         Daig==
X-Forwarded-Encrypted: i=1; AKwUvBxdboH5ilYX/7ijG4Or77UvzuXI8RocNyddOMDGRbi1JbdozWQEq8ZnvKRBshLMygGE/po4qK3gxf4zVcg=@vger.kernel.org
X-Gm-Message-State: AFuF++kH5wyUmB6TfCSWiDbrlXXn4212GDyqFWJAbX8YsEhd+QEjRyk7
	3WYSeNurwXD0scLf2dTvB/wLvgpWa7V1qEwv0KBjH5iNM1AeODxo3+/M6mU52hPiBCYKUyQ09EI
	/zIEWVo0Kp2NP9Pzymm3T+ttKsHuKphfRT95QAV9/HSWGsDts+a8/RyRg+v7qr6YRaP0=
X-Gm-Gg: AYBFou0NxzbFGVE7hXQ9wyKPlQuU2Trms9RtBYVXzkYWkaddYfwTlTlui/eoGuq3YiE
	DeJ8AVvrfiQosJJTm7aRT3vGyk5IlbP1hImjOU2mKF4at7AvpmWwLMg84ztU1WQ5EpVHZEIiSTk
	4vYVTBGTB+pdGROtCjp61/gHe6ex8U3A1fntC2t553ygPz7Ch4oODkHJ5KdyHVTOLlWN/nh14t8
	pqBAFBTSJRzAxKag3gzcSk25qcgaPoblJ0ezKV6NHiU4tQz67XalPjfkFIW2ca3epqcLhCg/HPD
	ajtaaDLXQURibeI/wSiPgj858jF2446Xq/WBDyOesGCmygsqNCl/IjnVyL64aCdlSHPZhLm810+
	gZ0ij1qf7Ec/eWCm4980UlC3/P+1VZoQM3XFfVFd+WpTl8oEy3xpPLB6YfHh738R7OdfqwxTMM0
	luNqIVa/VuFRO2
X-Received: by 2002:a05:6122:f18:b0:5bd:cb34:1b70 with SMTP id 71dfb90a1353d-5c7ed29d58bmr14694108e0c.1.1788873004870;
        Tue, 08 Sep 2026 06:10:04 -0700 (PDT)
X-Received: by 2002:a05:6122:f18:b0:5bd:cb34:1b70 with SMTP id 71dfb90a1353d-5c7ed29d58bmr14694023e0c.1.1788873004277;
        Tue, 08 Sep 2026 06:10:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a3705f37f0sm34623661fa.41.2026.09.08.06.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:10:03 -0700 (PDT)
Date: Tue, 8 Sep 2026 16:10:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
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
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 1/5] drm/bridge: allow hpd_notify() to suppress connector
 hotplug events
Message-ID: <z7a7c2pe7aqpqlh7z6ep4fhctujnwaxqxukqaywjwvt3w7ahnc@j5i5f53c4fqu>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-1-646a10256233@oss.qualcomm.com>
 <cgk2httvebzm2jnjnb437mutez66tfozzdk77mjwukfzngdioh@mu46u3pwlf2u>
 <af5f2e4f-42a2-49f3-9c6c-0f910c5f9208@oss.qualcomm.com>
 <pyqpajtjcnslk6g5ysn3ce2csrb76fhd5bif4vdb6wezomlmsg@fsl55exyufx2>
 <dd375289-0174-41ad-980f-f027fad976f6@oss.qualcomm.com>
 <fcc816d3-e3d4-4dbf-8ae5-bbbac6e2189a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fcc816d3-e3d4-4dbf-8ae5-bbbac6e2189a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE0MCBTYWx0ZWRfX5FlekWNz5mxr
 90SAwO0tp5+paZ4CmHTKDWEGSWEKIxLlMqbYHDtt0XPism/qWu8FPUCb/D7cpBXV0thLftR+Uk5
 7iVixbHpWNfhJxNkpZFXD55gfqUDWjs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE0MCBTYWx0ZWRfX/7QUmEzSbD4M
 WfcRUvfzTEakSZjt5/Z8BybU12Uf2a+UNIrAmCDFZO1H38ce7JIpaIayJg3nVcdJqwLPJx9araB
 SEt5zYxS4ybmYw1zGosoala4k4jEBAStZtXadm91zm9gCda9DLAdP3sPoYy4Mb81InESvAHOAps
 SS7Hh4Txx28B1bo1JCrk8Bs9LFmDrx4hbzyI8CsL+HYNZrpeLTHlzhkkwO782yT4CXZ5kAFE2hB
 nAvRXXaNfhg64g2JD2snl0y/ETPRLsJzhz+z57mkQogk5ZRnCR039sjARqWly1KKddRSjoZ3Pn1
 +U3YV1x3H5ffX6qrUxA3DlCjjxGtfoTZvHTiGVzZLY0JByHDGspTjstjBtJxHWKQiLsnqhZ1aVz
 KuF9Oe+KgNWpZpiUSNg6EVks/D3lmnJ25CFuU7t5mv6OR9wxck3HkoR170A7aNPcJD4DKoPhHzO
 qV/SOjkG0Hn3VLbGEjw==
X-Proofpoint-ORIG-GUID: IfJ8xbdBOX1U9eX663bGdy9aO5Lkqug4
X-Authority-Analysis: v=2.4 cv=QrduG1yd c=1 sm=1 tr=0 ts=6aa0092e cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=5Eng7BWHuIvqA__06hIA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: IfJ8xbdBOX1U9eX663bGdy9aO5Lkqug4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080140

On Mon, Aug 24, 2026 at 11:15:44AM +0800, Yongxing Mou wrote:
> 
> 
> On 8/21/2026 3:20 PM, Yongxing Mou wrote:
> > 
> > 
> > On 8/18/2026 11:01 AM, Dmitry Baryshkov wrote:
> > > On Mon, Aug 17, 2026 at 04:01:41PM +0800, Yongxing Mou wrote:
> > > > 
> > > > 
> > > > On 7/12/2026 6:21 PM, Dmitry Baryshkov wrote:
> > > > > On Mon, Jun 29, 2026 at 10:48:03PM +0800, Yongxing Mou wrote:
> > > > > > The bridge connector framework currently invokes all bridge
> > > > > > hpd_notify() callbacks and unconditionally emits a connector hotplug
> > > > > > event afterwards.
> > > > > > 
> > > > > > However, not every HPD notification requires a userspace
> > > > > > hotplug event.
> > > > > > 
> > > > > > In particular, DP MST bridges may use hpd_notify() to
> > > > > > propagate HPD and
> > > > > > IRQ notifications through the bridge chain while the actual hotplug
> > > > > > handling is performed by the DRM DP MST core. Connector creation,
> > > > > > removal and userspace hotplug events are already managed by the MST
> > > > > > topology framework.
> > > > > > 
> > > > > > Allow hpd_notify() implementations to suppress the bridge connector
> > > > > > hotplug event by introducing a bool *send_hotplug parameter. Drivers
> > > > > > can clear this flag when HPD processing should not result in a
> > > > > > connector hotplug notification.
> > > > > 
> > > > > Why? Worst case the kernel receives another hotplug notification which
> > > > > gets ignored by the driver.
> > > > > 
> > > > Hi, thanks for reviwing those patches.
> > > > Let me try to explain the motivation.
> > > > 
> > > > Semantically, IRQ_HPD is just an IRQ notification, not a
> > > > connection state
> > > > transition, and shouldn't be turned into a userspace hotplug in
> > > > the first
> > > > place. However, drm_bridge_connector_handle_hpd() currently calls
> > > > drm_kms_helper_connector_hotplug_event() unconditionally after
> > > > processing
> > > > the event, so every IRQ_HPD ends up reported as a hotplug.
> > > 
> > > What if the IRQ_HPD is delivered together with the first HPD event (for
> > > example because of the TCPM processing those events)? See the mechanism
> > > in the displayport.c AltMode driver.
> > > 
> > The DRM API should simply pass both long HPD IRQs and short HPD IRQs to
> > the driver as they are, and let the driver decide how to handle them.
> > Based on my review of the implementations from all three vendors, when
> > long and short HPD IRQs occur simultaneously, the long HPD IRQ is always
> > handled first, followed by the short HPD IRQ.
> > 
> > I have another thought regarding the current DRM API. Could we have the
> > DRM layer pass only the HPD event information (long IRQ and/or short
> > IRQ) instead of connector status, and leave all handling decisions to
> > the driver? The DRM core would simply report LONG_HPD | SHORT_HPD, and
> > each driver could decide how to process the event. This seems like a
> > pattern that could be shared across different drivers.
> > 
> > This is just my current understanding. Please let me know if I've missed
> > anything or got something wrong. Thanks.
> Sorry, after thinking about it again, this idea is not fundamentally
> different from your current approach. In the end, we still need to handle
> HPD state transitions in the driver. It seems my previous suggestion does
> not really simplify the problem, so I apologize if it has caused any
> confusion or misled the discussion.

No worries.

I'm currently stuck between two ideas: continue pursuing the current
"single API for both events" or implement new "two API for two events".
I think that the second might sound more plausible, but in the end it
would complicate drivers much more, because now they'd need to handle
synchronisation issues on their own.

If we start from the DP AltMode, we have a single state word which
specifies exactly, 'HPD pin status' and 'was the IRQ_HPD captured'. Our
DP controller also has about the same status word: the connected status
and the IRQ_HPD pulse. Which (for me) points out that the single API is
a correct way to handle the HPD/IRQ_HPD.

Now, coming to the drivers/userspace side. Let's leave the MST story
aside for a moment. For the DP branch devices connected to the USB-C the
AltMode will always report 'connected', but the DP's detect callback
would rightfully report 'disconnected' if there is no actual monitor.
The kernel should do it's best in this case and report that the
connector is disconnected without any interim states. I think we do it
already. The compositor should do it's job and skip full scene
evaluation of the disconnected connector gets disconnected again.

Event filtering. Historically, drm_bridge_connector was trying to filter
HPD event. We had to remove it because for the DP prefiltering doesn't
work. This might have left the gap, which now needs to be filled. The
bridge_connector uses drm_kms_helper_connector_hotplug_event() which
just reports the even to the userspace. Consider reworking
drm_bridge_connector_handle_hpd() to behave more like
drm_connector_helper_hpd_irq_event(). Execute hpd_notify under the same
mutex lock, capture if the status has actually changed afterwards and
report it to userspace only if there was a change.

> > > > Second, MST IRQ_HPD is level-sticky -- as long as the ACK has not been
> > > > cleared, the IRQ keeps firing repeatedly, and MST bring-up (link
> > > > training
> > > > / MST enable handshake) itself generates a burst of IRQ_HPDs. So this is
> > > > not about "one extra hotplug", but about a burst of them within a short
> > > > window.
> > > 
> > > Ok, if it is level-sticky, it should be handled as such.
> > > 
> > > > 
> > > > Every one of those hotplugs is delivered to userspace via udev and
> > > > prompts the compositor to re-probe the connector. In the window before
> > > > mst_active is set, that re-probe walks back into msm_dp_bridge_detect()
> > > > and performs aux/DPCD accesses, racing with the MST enable flow.
> > > 
> > > If there is a race, the path needs to have a lock, preventing concurrent
> > > access. Otherwise, you are just shortening the window instead of solving
> > > the problem.
> > > 
> > > > 
> > > > The amplification also isn't limited to a single connector: on Hamoa
> > > > there are 4 connectors (3x DP + eDP), and we observe that a hotplug on
> > > > any one connector causes the compositor to re-query all 4. So this burst
> > > 
> > > Please fix the compositor, it should not need to query all 4 connectors
> > > if the HPD event came from the single one.
> > > 
> > > > of spurious IRQ_HPDs during MST enable ends up amplified across the
> > > > whole card.
> > > 
> > > How do i915, amdgpu and nouveau respond to IRQ_HPD? When do they send
> > > the HPD event to the userspace?
> > > 
> > The driver revalidates the actual connector state, and a hotplug event
> > is triggered only when an actual connector state change or a link status
> > change is detected.
> > > > > > A NULL pointer indicates that hotplug suppression is not supported by
> > > > > > the caller, such as the connector detect polling path.
> > > > > 
> > > > > And nothing in this patch makes any use of it. I'd say, it's
> > > > > questionable addition. Let me check other patches...
> > > > > 
> > > > You are right, I will reorganize the patches in next patchset.
> > > > > > 
> > > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > > ---
> > > > > >    drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
> > > > > >    drivers/gpu/drm/display/drm_bridge_connector.c | 15 +++++++++------
> > > > > >    drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
> > > > > >    drivers/gpu/drm/msm/dp/dp_display.c            |  3 ++-
> > > > > >    drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
> > > > > >    drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
> > > > > >    include/drm/drm_bridge.h                       |  3 ++-
> > > > > >    7 files changed, 21 insertions(+), 12 deletions(-)
> > > > > 
> > > > 
> > > 
> > 
> 

-- 
With best wishes
Dmitry
