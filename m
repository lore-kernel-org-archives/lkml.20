Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101910;
	b=5MXqANscmgbRZ6vIk71s48YFUt05y92BSgL1QUlDdnNVvClbEcduI3hmOGccX05xU+2d
	 DUnbkZl4KeD/0KeTDltSQIGth5D95LrdJJ4swuP1TtdHRGpjzQuenCyJCf1PRl84DguDx
	 wstopxMzTABXWow/fG7yti/1efKMoRvzXGTG2I5yiCtbTtDmnoN4PKxwlm31hwJUhJVt9
	 /UJfrxBFVsr5OZxrfKfSHjyTXpvpVHDCuh1bqxVlFdk0zz66YUjw/dw7/mM66lWUMb2ck
	 Liwhxf2Vc+NuUYMF6fXsmTohP4R/3hs+yTJgF3tHYId30sRCrXnR1k/dr7ksqKe5VuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101910;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4W3OqlKiBwfz5eOJMTRV/rIcRtmzZqXVHzyrSvnxP1E=;
	b=v2nu/9sCwl33yFzwUsFjRXzyyTwpVtDq2G2CMCmv1qbZjphjj+e36DxXOXUnBXogXqq6
	 oa4d5GGFNgD2Cdf5wkJloxMSymqxOcqOebJbTTIHxNacNMmSo+CJlTQYLmNi2M0D4IZ+8
	 C7GnWxH3ZNbfB7rXb4uPeTtC65NjzKd3+LScSW/2qpNcYcffqjNLlq09VB3JNuwOEYVgn
	 hnufFb5FOmndct7IYhR3ttZGma53hqEOHSVynxy8zaXaJtSliIsVqzzZoSJYLdT9pajHK
	 jwLTYkMx20YoQlz5xSMWqQv8TkTMwef8KhFWi5K9/9lPux/u2Mt+62udGMsqKJq5pnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D1mfuL7S;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ODjG4Tp6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBD5606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FBD5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D1mfuL7S;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ODjG4Tp6
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdxPV2523926
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4W3OqlKiBwfz5eOJMTRV/rIc
	RtmzZqXVHzyrSvnxP1E=; b=D1mfuL7SsPPdywV1ReO5FFA7LhAPLjwRRqGIXf5P
	zHtT9DGm5cK7aTPGPks/P9Tp3ff5LKQNkHUi1YVw4uQZDKdHMtxyca9OI4ORMxWA
	M0qHs20gmke7Jm1Ro6H3/CpWT8JkzH30zVEyPPuQ0OswNev4I7RQ381fWXOClVRR
	kQX9ZFhdwY6v6uMd2DyCDn12HCMkp8yv0W+efd9Ulldrq7jkk9bxcvNyyaiHrIm1
	yOCyBIWEwV9qfwg1kOiGI/p/GoLgs/KhI2n87VNnAom40WMY+IqIvknE8yLyux3S
	7OOPInAJcEHMHv+WquBkag64NvySmob2o+UL6KSZatGoeQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqw20wqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:51:47 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ec17386b57so4105551e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793101907; x=1793706707; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4W3OqlKiBwfz5eOJMTRV/rIcRtmzZqXVHzyrSvnxP1E=;
        b=ODjG4Tp6sYiSpQUj1ak18Nww2EFA8xoVf4jLK4DanUOjGarjW17SW9/Bdw4Y/IYMbt
         UTTNizatXJaJs7YM0F3QMpZMTkpby4dHrLUk9ux1xLGeZvMzEZ7ehivcczSpuo8hpNED
         lpLKJZUCA1xJMNnkY+MEBjQFR5TFa0g1gSIWfq0LdmHoWKo1hS3ipCokM0PYhu+yVbmE
         e9LKIUzDl7oQOnBr8BjER4Obe1uPx5xEjmbDXi5mIk8fC7pM/UmJCxyHyzFJ+S/wmZdS
         IY9ssstHX9apHU6RjJisdqGsV0g7PMSFoe0MTCsw1vUP/MRcpl3nFeFx8uYGwc+5RK6+
         7s0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101907; x=1793706707;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4W3OqlKiBwfz5eOJMTRV/rIcRtmzZqXVHzyrSvnxP1E=;
        b=SmuhAqa//B+HGvT9Ux6h5OIyMXU+wV6JVcHD3Zc49EtRdtGMOhRmpENpBoidmb/rIX
         hP3WfGhPhx3bU+n3fEg5Yyl4z20fOf/658ducsQa9RFHCKn3PX6LFMzcQhGitRgRJ2oZ
         pz44A6S0JzlgK97pjC0j0kEotzidLIdBbmqirhIpnNGSiL9qrx3W7GVVcodIieaIsowM
         laqNLwWbeOHA4yMJVCscTARDoVYCWfC/WjE8gmWQ2UuIz++xc+JRnCFklOE3UT/ygxrj
         g3PL3nsmQPG2LhUUAaqIZh2npQQf/2yM83JJ8bygPGCHJfoe9vE87yfG4a/Awh9STr3n
         8Q1Q==
X-Forwarded-Encrypted: i=1; AKwUvBz+duDQ3b8b8oiVS89povFxBww5MZKnjAhp5nle7DazuP7uj06AHFB2iOtcylEmx7E6ctiOX17iMn4gUSg=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2FdVtOzVSDrqNJ/Poa4T2ZUvXWeGsaKLL8w8IMSUF4dOUmXHW
	64n9p++fU1F66j1NyD0prbm6gb7I7o1RUWNOJMHOAG67gVvnSX5Ec2ounSkryywgaOfF7HnMvdi
	FoCEA+JJtt2GBiOMVpCBzvJHum7D18nlBcpvHlgJ6cJcG6O3YL62K4D1hIHLp/Y5Rdto=
X-Gm-Gg: AYBFou2wu3QmCCfZ5K7dtL1dClOYY+Oly9CW4Cb2j/WpClvceNSfU2vfehrnXbMz1HZ
	5C69H++MbI08bSYMoA8QrIpkXcO2NanqF0NkH/uSOLiD7sKFJ8vAhcAkhNBN3abAHZCV1K2MEGZ
	rKGq4fD5Rpai42xoiMPLo3Hu10yzS+M2jxtGX7Cf41JhIrrMS/IKCg+etJk9BJU3kRC+IKOXkqV
	g5LbZbNssAyyDKEGQT+wF25gEM4RBJPK6qq4Cl28WHehHoRY6e+NrvHq8DIAjbN85Ni+nVmJjC4
	YofkjK0rIKAEFUmO3RkSBugMS8KxzmV3DTrWs5ElZUtB5plzmljfRrPM0R2sfx0ALLAILaQ/i4C
	ydwVW68U35JN2kIkdtbmp6o8ns8r/paRa0++hGktTHrlIMtnOudS6+5d2eocvjrApFDuJA5SwRn
	F7Y5Fqci/fnmso
X-Received: by 2002:a05:6122:6990:b0:5ea:e324:7c15 with SMTP id 71dfb90a1353d-5ec232ae080mr3936881e0c.15.1793101907159;
        Tue, 27 Oct 2026 04:51:47 -0700 (PDT)
X-Received: by 2002:a05:6122:6990:b0:5ea:e324:7c15 with SMTP id 71dfb90a1353d-5ec232ae080mr3936868e0c.15.1793101906693;
        Tue, 27 Oct 2026 04:51:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac70993e89sm24077941fa.9.2026.10.27.04.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:51:45 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:51:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
Subject: Re: [PATCH 04/13] drm/msm/dcp: Add IPCC power notification
Message-ID: <t3vxg46g7jac5th3hrrs3zchss6lzmgm2ga5qkro4cepr3qmnb@ddosuavblhuy>
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
 <20261015-jshekhar-drm-msm-dcp-v1-v1-4-48aad0fe4f72@oss.qualcomm.com>
 <u7pcn75yh435vuuwqezml37bqfzdztvrywggbmkydkilwe5yzp@myijo4wd2bob>
 <db88a83c-29e6-4fb9-a874-15c0f186e14d@oss.qualcomm.com>
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
In-Reply-To: <db88a83c-29e6-4fb9-a874-15c0f186e14d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX1jYGpa95gvWK
 aS5y4kUyWbHs7vJT/9J2GPFK5uRNqXLroPEFe7PPH2prqAnNdvaAmM2v3x0tRhcCTsxH9qgFWjy
 fNflyfJI5keN0iyTkCgtKmlBnBEiEqYgNlyQq2Wn0hdVvxHv1ldWsjX6Eep+rXIo3m+wDguezSM
 nE8mb61voM/WdlH8cQ7Gou2O5229INUlqopw/Rn39aCG5jv1KMIXMIv6UIUOWpqMEwfKByKWB1q
 fLtSKT4zKR9PmHVP2WanCSWQphyi0Q/wcIf2MAQtgNvkaSEoPVfX7FuCasvv3yHMmaLKNggDEai
 9otaoLG6QloquwRbJusj/mVvzM5e6iHTkMF0SRX8sGmWwoU7dWwgwiPDOe+xfgabNNmxKBpT7FP
 PkbFeNG6tOrZLigVoUvT0T7T95z9npvDIqURCGYD47oacAlKlAK8Hc/qG8nteJ9NqLmhPatu4ru
 uv4+Bx2ipxNY7TO/abg==
X-Proofpoint-GUID: eefblTWBTrZuAbS4PXd9QEycWMBW0QxE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX16P2keSyWqqY
 AZ/YGM7bxJWm0KLz/6SC7/zuT3XS0Z0CBSmbe28XDj1edbF7mrWQp7rp0bVNHV5ffU1YCUMMW2U
 iYf0HXX6ygYMxCFp+XyKRdAJGCGf9ZI=
X-Authority-Analysis: v=2.4 cv=PsYG/AM3 c=1 sm=1 tr=0 ts=6ae09053 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=75pfyCq1Idx6z_e0LXYA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: eefblTWBTrZuAbS4PXd9QEycWMBW0QxE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270047

On Fri, Oct 23, 2026 at 12:37:30PM +0530, Jayant Shekhar wrote:
> 
> On 15-10-2026 18:12, Dmitry Baryshkov wrote:
> > On Thu, Oct 15, 2026 at 01:08:24PM +0530, Jayant Shekhar wrote:
> > > DCP may be power-collapsed while the VirtIO transport remains available.
> > > The host therefore needs the platform IPCC channel to wake the firmware and
> > > to receive notification that it can service HFI queues.
> > Is it allowed per the VirtIO spec?
> > 
> 
> As we discussed, its not compatible, will address in v2.
> 
> 
> > > Add the IPCC mailbox client and power-notify interrupt handling. Wake DCP
> > > before VirtIO queue activity, wait for the firmware acknowledgment, and
> > > notify the response queue when the IPCC receive path completes.
> > Don't describe patch contents. Describe your design decisions. The
> > reasons for the flags, init/deinit functions, etc.
> > 
> > > Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> > > Assisted-by: LLM
> > > ---
> > >   drivers/gpu/drm/msm/Makefile       |   1 +
> > >   drivers/gpu/drm/msm/dcp/dcp_drv.h  |   1 +
> > >   drivers/gpu/drm/msm/dcp/dcp_ipcc.c | 212 +++++++++++++++++++++++++++++++++++++
> > >   drivers/gpu/drm/msm/dcp/dcp_ipcc.h |  56 ++++++++++
> > >   4 files changed, 270 insertions(+)
> > > 
> > > +
> > > +/**
> > > + * struct dcp_ipcc - DCP IPCC power-notification state
> > > + * @client: Mailbox client used for APSS-to-DCP notifications.
> > > + * @power_chan: Mailbox channel carrying power notifications.
> > > + * @resp_vq: VirtIO response queue notified by the IPCC receive path.
> > > + * @power_notify_done: Completion for the firmware acknowledgment.
> > > + * @power_notify_lock: Serializes power notifications and teardown.
> > > + * @power_notify_pending: Indicates an outstanding acknowledgment.
> > > + * @state_lock: Protects shutdown state and response queue access.
> > > + * @shutting_down: Prevents callbacks from accessing teardown state.
> > What is going to access it during teardown? Can we shutdown in a logical
> > way, so that there are no accessors after starting the teardown?
> > 
> 
> The access can come from dcp_ipcc_handle_rx(), which is invoked by either
> the power-notify IRQ handler or the mailbox RX callback. An RX callback may
> already be running when teardown begins. Without protection, it could
> complete power_notify_done or notify resp_vq after the queue has been
> detached.

THat's what I called correct sequencing. Make sure that events are
properly ordered. That is, disable / mask hardware event reporting, make
sure that the events are processed and completed, then teardown. See how
IRQs are being freed.

> 
> 
> > > + * @power_notify_irq_wake: Whether IRQ wake was enabled.
> > > + * @power_notify_irq: Power-notify acknowledgment IRQ number.
> > > + */
> > > +struct dcp_ipcc {
> > > +	struct mbox_client client;
> > > +	struct mbox_chan *power_chan;
> > > +	struct virtqueue *resp_vq;
> > > +	struct completion power_notify_done;
> > > +	/* Serializes power notifications and teardown. */
> > > +	struct mutex power_notify_lock;
> > > +	atomic_t power_notify_pending;
> > > +	/* Protects shutdown state and response queue access. */
> > > +	spinlock_t state_lock;
> > > +	bool shutting_down;
> > > +	bool power_notify_irq_wake;
> > > +	int power_notify_irq;
> > > +};
> > > +
> > > +int dcp_ipcc_init(struct dcp_ipcc *ipcc, struct device *dev);
> > > +void dcp_ipcc_set_resp_vq(struct dcp_ipcc *ipcc, struct virtqueue *resp_vq);
> > > +void dcp_ipcc_deinit(struct dcp_ipcc *ipcc);
> > > +int dcp_ipcc_send_power_notify(struct dcp_ipcc *ipcc);
> > > +
> > > +#endif /* __DCP_IPCC_H__ */
> > > 
> > > -- 
> > > 2.43.0
> > > 

-- 
With best wishes
Dmitry
