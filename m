Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792670371;
	b=1UcplK6qGlzOYKGhkZHqPiUjpiLuCCczuTPaRZBI2tI+ID3aHVyFMePb6NuTIV6wxHPn
	 CUpZBAZ+IV7JqUuqrPG5TiI836CR45KpEaJ1TIoRsG8M/FWJcNPBOwhoyjHgo46triwQt
	 oNa5d3ll2u1NbjHCIL37rNWyvxO6uWgqfyHiG6LPaJE2OplSaTOU6OXOvKMUGnmYOeM3C
	 16LHDIG3Zfjdz7sjrOb40zoBDVpt7wzvcTM53O7nIw1sid2wPldleyOFVZ/Y/FRT1CmUl
	 mKcoFfFdS5E4nZDZeHGtNE6wFu4HLn7YhsF8/EcAMtAW8AFcSBbamxhAvci5Sqz+U7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792670371;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aPE/s6P0svckbKbkPg294wPN+bCnxy9mUDtCKQb3Cvk=;
	b=sIJzHpCwL5DL/Yvbl2K7223++7nVD0YCK7Av5K8gP/uL27Sg2QGG1uJm9+Ze/b8Jn/rS
	 N3unAHOjYMaKM5nwguDvP8r+Lvsquz6sJVpDcS6kuIkPu4gOmUV3E2sMpEyaKV1pyOSSH
	 b1laJkHf/rc4e56EirDdXvSwJOPlVVobu+4cTa8OuS+Tf5zl0cTfu2z6jxI5shEH0ijuW
	 D0Z0UXzTo9/FX5ncbTQFXvy3wAO6apO9f5H305P9fPoxRmJaVxu22kFCPWzbgFsr7QVZL
	 CICCv7TXFrZSslwqtgIdhAHPAL8zMqoeZmFodACvUnAoImMw4veA8EO1roDBGkqOSUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Par7Xu1q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IkCTlfuJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D75606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:59:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81D75606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Par7Xu1q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IkCTlfuJ
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MBuJ6A3734960
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aPE/s6P0svckbKbkPg294wPN
	+bCnxy9mUDtCKQb3Cvk=; b=Par7Xu1qoevn8z3nPGjiV5KdFK0FBaEyRpwV76VE
	XGRuwy0Lu2kpYODoox0SU+jVM2P7MFEMMtiFHFZ7RkE97F+nuoWXXvfr6GtyoJPc
	vLI6afKNFzZv/os2z+ZIx3ocCUgI9uZfDaPrPpPY7jeQd+62LOD0PTq71TfSQOt9
	17QMYOMPtEnRT5ilsJrZNLa7reoASTXKljuA9EySM84j1UR5+ZSyiZW7JtCEM67i
	O8URo3Pmo6PZGp/sCiaRuxD/HDDNkVXArnLamvIYm/lUbV5bUnoy9itQuo2hgYhW
	3PCwEIz465UhVyGfBaT3boW9mBdrU5Z/aso6OnotODBdwg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93au082-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:59:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91bc57d4d11so42136296d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792670369; x=1793275169; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aPE/s6P0svckbKbkPg294wPN+bCnxy9mUDtCKQb3Cvk=;
        b=IkCTlfuJ6w2eatTw9w/zM2HMD8z9L7ZfjsBHrDOYEnMVzQvqaEvff9tmNZKeDqmNVm
         oXJ74xauQHtRvIxpmrTHNWJ1iMGaz/pIBM9wCyWzghZ3aICdMZBvEtUvAYXaRsuFK+os
         XEjgpl2N+qLYc1OA3UbLGw4v7NpIsjXRIGcspI8q+/pg/TBnMXn5OEOOaiN2JXWlQnZl
         zeESyRc3D31gf6b890uH68Xr4kLL1zU5UMoqeBphpdyxVdECzXR766iL98nVz4nzfHT7
         YDep9og8nwfQbIOhMBX6DwrNjaEy9MXm2eMP4yxZNGa3Wbw4lJD4oE+YYRs1zF7M0KTy
         m2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792670369; x=1793275169;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aPE/s6P0svckbKbkPg294wPN+bCnxy9mUDtCKQb3Cvk=;
        b=gDWNSBi1jAM9hs2SxhJtIlqmM2krmtKzPB7WMj2+3kUix46zD7BorB/DZ/y6BUUD4h
         WvsU+yjO4ZHf1+B+c5rtUmzmOC90GG6r0yzfUvzOrFGNSWfo+RPUcjGH2CDUh0wmv9rY
         OCAG2Y2w/RSrPhvQm/F95yFqEg660Vav41HCP7fDrXvz6rREeu0JhA3YW3UwKygIHlFS
         z8fxJ5SIC7dswWc6ZKgZJbJFrORkYpBgqZCbgOTT851qM4izC9rhqnll3M+vtFY4/H3R
         NMQ/7MCI0s+ipPooc9n1wQBh2ocQHOmtrtz//YSEHQZvPXiuk+nGFmGuLEHJVhjYOMyM
         J/FQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6ajMmh+0idTw/NoZtGrh6BvYaJB2nnlxmfZ3vAiWWSKhOrc1z55YL9FOBOmpGq1bSU26wq5CZ5MoFfZQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8YF/h9Uk/d4CRamcKZp+EDalW2XQAf4oy/vLaSzMvykljy7C8
	yJ5pOcvtv1qaTtJxXK2wERb23O7vXqzBwuk9L8U7W7HyYYQOLkObZXwOY6PfJC/B+JaPs1pEjVx
	sPLC4MuBEpN2LJYzzJsA8oXE1lcoXAiPbHUiVsI7ENG/s4EOFvmrUMmyFmhAA9GmA2kk=
X-Gm-Gg: AYBFou0XnDf2cRQztzAL0na4n/W/FxwbVw1L+hHNP4OFG+TDRLCrHC1AbYpZ3uJci2X
	XBY6EiuW0oK+YWMv8M131Jf8ORh9tC3kW2trC0+1mHUoOB3XidtWgOR0oxtfoiNTKw2EGJcT8sK
	XcPr1hpkuML6wgZdRsIFNay6ireaeBvCYsj03JduX1BQkR4qwt1eDHQsnK8qa9Cs2fYlscBKQ9V
	fsGZjB2ITRXTJpHQy452TlxqXKCZjSiQMHxy9NfHBZoAuLgGtZ4hFTj9bHbAuif9GgHNq+n4oKa
	TNnKVvwZi3uaz7uynhUr9r/d0m7m0W3FQxZnd9n0C0+zRRm8fEqpDFJ0Wwg83ZqB87Twy+7if1X
	VXzIry1YjPgKSK4aOv3DlcvReV3q6G8kkUSZQnJaChKKR7EphxOTm7fgOWiS4Doi2ZPIS4MyMvb
	jNYmF1Fy/IWw/t
X-Received: by 2002:a05:620a:4086:b0:939:733d:cbe0 with SMTP id af79cd13be357-93f57e5e514mr788969185a.3.1792670368763;
        Thu, 22 Oct 2026 04:59:28 -0700 (PDT)
X-Received: by 2002:a05:620a:4086:b0:939:733d:cbe0 with SMTP id af79cd13be357-93f57e5e514mr788966485a.3.1792670368330;
        Thu, 22 Oct 2026 04:59:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa4adbb65sm626196e87.52.2026.10.22.04.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:59:27 -0700 (PDT)
Date: Thu, 22 Oct 2026 14:59:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: John Harrison <John.Harrison@igalia.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        Mihail Atanassov <mihail.atanassov@arm.com>,
        Eric Anholt <eric@anholt.net>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Brian Starkey <brian.starkey@arm.com>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v7 8/9] drm: writeback: clean up writeback connectors in
 drm_connector_cleanup()
Message-ID: <gjeqgaewd5omwhdmepqcsrjq3pph722j6rjtoedot5rqsjsaht@h55ako6z42dt>
References: <20261019-wb-drop-encoder-v7-0-d4288a26eb54@oss.qualcomm.com>
 <20261019-wb-drop-encoder-v7-8-d4288a26eb54@oss.qualcomm.com>
 <d792066e-c857-4e80-8587-44a58ab75815@Igalia.com>
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
In-Reply-To: <d792066e-c857-4e80-8587-44a58ab75815@Igalia.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0NyBTYWx0ZWRfX3/et/tAeqG9h
 Gtt5MjNN4BKtiO93DJZL/hjX6Ryx/54ya3+0qhWD0ZKiArUnB44aZClDv9Lmyx28tPVWnLU9Fw2
 aTjELodXKZefU6ZP1dsh5mnB09k7qBg0UaYCP85E55DNtMcGSFC4u4RnGviRVFIq4zREuYZfAtI
 wrVxt85q460aUaakidnLbxdqG3sWXH7R9Q2x41/Sxpy8O2H8OSeA4T//JE7Tyg8m4zTb4+1jAiH
 We7Qjmv1WGgwZr/jBiaVwvZXMgXG1nqiL06isRw417Bul44PBpMqoc2553kdG/uIq0TL3lasHG3
 xzl/tpjJMNEVUtJUtsakAa6mRp3ktlJYbkilJ+I8DwCMt8mqa7wMFxoXzmJzJBFkS9DHZ1iy9zB
 BnWtC1GCb8xzCIZowfFgHHYh5jMu94s/dtM/rz8yPqSdAiZDP0XpnkRPaXDIqGz0xkkB/o23c5z
 cgeg7lb8GRiPnjeu3Ig==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0NyBTYWx0ZWRfX+NS726PK46DK
 qfkpVxzEqMtSY/sN7Lz2EZgyylY4JZxX0AVWU5+6I5P0rO5eiMIRAwW7X/bL0A0fOakCrQjf/6w
 ymlGbewag/yHES0Jz/T6L+rJh6bjae8=
X-Authority-Analysis: v=2.4 cv=QPn91QLL c=1 sm=1 tr=0 ts=6ad9faa1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=dAgu92QZlaad2esalq8A:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 4H8sU-zOEmVadgkEUeLJgwLWdBWhps2t
X-Proofpoint-ORIG-GUID: 4H8sU-zOEmVadgkEUeLJgwLWdBWhps2t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220047

On Wed, Oct 21, 2026 at 11:22:48AM -0700, John Harrison wrote:
> On 10/19/26 06:12, Dmitry Baryshkov wrote:
> > Only drmm_writeback_connector_init() registers
> > drm_writeback_connector_cleanup(). Connectors set up with
> > drm_writeback_connector_init() (amdgpu, komeda, malidp, rcar-du, vc4)
> > never drop the formats blob or free the jobs still on the queue, leaking
> > them together with their framebuffer and fence references.
> > 
> > Call drm_writeback_connector_cleanup() from drm_connector_cleanup() for
> > writeback connectors, the same way the HDMI audio and SCDC state is torn
> > down there, so it runs for both kinds of initialization. The drmm action
> > now just wraps it. Clearing the blob pointer makes the second invocation
> > a no-op and also covers drm_connector_cleanup() being called after a
> > failed __drm_writeback_connector_init().
> > 
> > Fixes: 935774cd71fe ("drm: Add writeback connector type")
> > Assisted-by: LLM
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/gpu/drm/drm_connector.c     |  3 +++
> >   drivers/gpu/drm/drm_crtc_internal.h |  3 +++
> >   drivers/gpu/drm/drm_writeback.c     | 30 +++++++++++++++++++++++-------
> >   3 files changed, 29 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > index 893716a9e489..1c2bef5e0636 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -929,6 +929,9 @@ void drm_connector_cleanup(struct drm_connector *connector)
> >   	if (connector->hdmi.scdc_work_initialized)
> >   		cancel_delayed_work_sync(&connector->hdmi.scdc_work);
> > +	if (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK)
> > +		drm_writeback_connector_cleanup(connector);
> > +
> Could this be done via a new connector->funcs->cleanup() vfunc or something?
> Set that inside the writeback init path and it is guaranteed to then only be
> called for objects that explicitly requested it. That would be more robust
> and would keep sashiko happy. It would also keep a writeback connector
> specific declaration out of the crtc_internal header.

I'd rather not do it. These are the generic properties of every
writeback connector. The answer to Sahiko would be that yes, currently
all DRM_MODE_CONNECTOR_WRITEBACK use drm_writeback_connector. Once that
is changed for the Intel driver, the condition might/would change here.


-- 
With best wishes
Dmitry
