Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792670500;
	b=Fj79cCvNx0nI1T5aNmXGXJwpDRu9DWUkaWFaIHYRO3U35ihG8VG5/bFL0WzEhPGptPYx
	 CsOJPllAv5reb8KPjO1omiALtSAwmIakXH4EZ/3hI0X9d65KVkJ6SjwimK9aEn4O9U8tt
	 5DyHn9rLYSSDJxqlgk7+n/zgxy/YiCodHT6LaQY4eT3Dm/ioIWLcgmJ+Gu5k3a4xXgAlx
	 tduvhT9wwmTb0HRjUao2azeTz9J/I9LfwGb6ehFi32zLtqlvm+E/LH+Y7/cATVCDpXm/e
	 Pv/HLJaDyPhXoa/sgx0i1SkN+nb0k7V1cDYIu8f8YTy8nsd46/pfqP0zz3Fyoy0ZIVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792670500;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pQIf+MPS9ZBgM7DuW4ui8ue8uuTAAxWxDd0AuH9xB3U=;
	b=qazZfIWaLgB+KDhKRvgN7wqZBqbB078XPpgNz1u+UaGMAKE6dKOi5huWADujGyPSpp5d
	 +W2KVFIf03Y/Mx0ocSS3ngSU6QW9+9UNZRGAstKXQBn4zo/zU0stCWOyWDGu5d6MnRsVt
	 apLBFgQ/MZUugfqS/f4YJGz7IVpwVaud5xotMK15PXuLSkOPdh/8yAjDw4mtTjwyEPP4W
	 vkhA2QWNEEF8s+02vmaU1Tck0C14rA8oC/uZeNc+wWkG37fYuhbntYBA5J+9uzD99GszY
	 0rxAteRpG3BH693u5No2mwL2LowCgraEKkrr8kQF452tK5ghrTyY7sjRqFmYwTQw8Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E38fEtW6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Ieqs/pkV";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151D6606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 151D6606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E38fEtW6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ieqs/pkV
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA06Cl3115553
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pQIf+MPS9ZBgM7DuW4ui8ue8
	uuTAAxWxDd0AuH9xB3U=; b=E38fEtW6rUgMIG6tTA0UfhcHk0PAIJbK6oauV0ZI
	oXEl2HtfSTi4yOQzxTR+23gcKr+3Vt6ggAXZyHqrtUwdndjUjoM8ZYx95CX5q/Is
	g7eVOwJ3lNIH1mHdgEb6iRcTPWy6Tsq7I7u5PFU/SkZg8OxqMfA4nUf/ooy8L7X2
	9VYxr+8HhE+9X9tV47N/H7VYlbjbgAllPg4eSgYSKqVhUVeum18xu4ldiwBxJxZd
	CcbqT7ouWYzPHE1dloE+7BfQKaIv0Y0lBgMWTlu3+FlMJZAksh6ZpJy918iSLDqN
	b56ty9s+BOzNV4OhTIfqJS2WMZGjdVnoqPiYCcX9VJwP0g==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bu1c2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:01:38 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9806e283b0eso1337768241.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792670498; x=1793275298; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pQIf+MPS9ZBgM7DuW4ui8ue8uuTAAxWxDd0AuH9xB3U=;
        b=Ieqs/pkVSQ51C+XinhJyqIp1oD/RCHkg4HxA+ze59NcMiNSLDorMF+uWeGdJdU6BPR
         T7GktXimlyN/WUfF+3uOu3cYEzcUPg2T/5bDr1Fsu5iUVZMVLDZ6m38WzIxRIQ7Jgbbi
         Mgl1u0dNplHs05eK+fFWFvmX4yTd8rECxAfw3MD2TcEAubqytXsF3b4PrNmJ0vBwLlJg
         6sXAxAb8VgxeGPz+lV/NYUV4NxGNyPFQc7VnJ6mJsOw/ET4aOn0iXawLApq/YNw+uDV4
         W5AwVjbaSrBHggyueowTT3l4gVD3b7fD4/Rl5j1J+RDxNSYbvQ2DqvUowlKCaviXkEWd
         wpvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792670498; x=1793275298;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pQIf+MPS9ZBgM7DuW4ui8ue8uuTAAxWxDd0AuH9xB3U=;
        b=TYROHmf4ZSaTZqMlno8xw3z2nhdj1q5C6NlgfC0laz5Ls8+zWnk6mJABfQDt/fs02/
         2+VqdRTu5Xe8Cdsnob3Hre0EgeFOtN4B+50Db1T/bMd8AXJNhf2YzFH4njZHAJHdf9qp
         sIrUsZKmBtRgH9nsHFbhrWTStCnQyLNCws1jWcFWQEzp+eX82FjdFPvdqvYAZs9xB6eh
         2HMTlxJCaTWg4BycEcBmJeHJyx4XfkS0QvG6FuTgcnDESBhm0Zkk+7Uk2HzPNdFf5H10
         aBFfINdWLeCFpbOISQQy7pAgCvuhHBnSNSOm0Il/iXv7oPjPTT2/pYpEn5zwY+vfqly/
         5SGg==
X-Forwarded-Encrypted: i=1; AKwUvBwgDtSXW4l6c5MESIjxOHLFP6qunSEv48XnP8n1/dhxJd3BE7yrbRSISQfY78fQvxM4GFRM6Zl+/OS2Sbc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLddYokXGM/S7j5l35kArvSvK/rsb5rixFnNTDLXYkBiJT+F/BW
	VQ8crRwlT4bKjWR9KnP0ZXc7PtnhtsgS+sEWcKej+kph5RSFREJ347MHDZMuTGuXJw3u51GNbBf
	fA485g8bs0kX2a8OZmohQGcdkEhZlcBDQ00EF5OS//5CMWqkbFgieCuVNcGp14df/cXI=
X-Gm-Gg: AYBFou39go1zhifxrJkWVF4ur9lyiOyacpAtXwZkv7jprlaIf4Wi0NVeVdQC2aGoFlr
	/FTJ18FiKo97PYickJXd4TQV035N4hDOnYIg5tHsl3zN9JS3FjXenQsq01UedBrq1Zng6mJteSn
	AH4mxgqjiYuBb7YdKu8/Zwi/x3ZzUeLCIgKQl8Wjyrsfaovg34YEsb+da8zcP2AVSaGZvJVTEGx
	1Jp8uDjTQPVdbcZLwm9x4ZC04meDjqIoTrd8M1wxSzgZops23DkBITYG1qXZR85bjBjxBpcpZWM
	ctGfbYPGmc4AmO9eELt5gORuK1FcC7TN6vFflWRkiny56N4VyY6ieIenfzgNNienGj56V2bzmbw
	0UE43o5Diiszde6eYjHVrw9oLNW8Yx/r1JEipMolJnMJ5l+inRa4hFgRzRNPmX28Yi02/h0JQqg
	j5Blt8IQxslW8f
X-Received: by 2002:a05:6102:548e:b0:7cc:2bb7:1335 with SMTP id ada2fe7eead31-7cc92740fb9mr2034391137.33.1792670498148;
        Thu, 22 Oct 2026 05:01:38 -0700 (PDT)
X-Received: by 2002:a05:6102:548e:b0:7cc:2bb7:1335 with SMTP id ada2fe7eead31-7cc92740fb9mr2034336137.33.1792670497623;
        Thu, 22 Oct 2026 05:01:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa1212183sm1044229e87.46.2026.10.22.05.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:01:36 -0700 (PDT)
Date: Thu, 22 Oct 2026 15:01:34 +0300
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
        linux-renesas-soc@vger.kernel.org,
        Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH v7 0/9] drm: writeback: clean up writeback connector
 initialization
Message-ID: <i5hyqavtg6fa5eaq34uxpv4egdydcbdqvlqzn3ctpmyguy7j3h@nrr2kcd62wuw>
References: <20261019-wb-drop-encoder-v7-0-d4288a26eb54@oss.qualcomm.com>
 <45638e6b-04a9-46b2-97c0-66f3e2f9930a@Igalia.com>
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
In-Reply-To: <45638e6b-04a9-46b2-97c0-66f3e2f9930a@Igalia.com>
X-Proofpoint-GUID: BYcNDVpDb7OfukcPblHh6LzMqTJLrLMz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0NyBTYWx0ZWRfXzjFxi3oXtqd4
 ry9PgR4FXVHB3B1YarbCYmVr0jBa23Tkkjo94Z951+jtDf2xOGKcRWbA3jxDYiWMxCs7AoHgQZ5
 +7C+q5oygcOVG7hkY1mb8ocOzQc/pWlBI9kMOSakXpKV314VFBWMq51XAmOx3FfDpgsIrLhhw9w
 sT8g7QhQQTcuY8KIVpHU3FCagF/vp7jAjK3TGjJ1R5qj/xiieljd+qbl4KCVJc++87R4gJXkUBx
 iuPzAfNbje4rjQACSKGFxKE61aHI0kya8jhdDCjpArf+C1mpYlEDa7U/qBQXkGqYRvMq4FakTZT
 CXWwthr9Z6ez8J62HfTPVeEvKd/jTRego+SLqbo25/lfSKD7sereYmbt8kEdDSPxadsY9vhLAxe
 CgDRfK1w96lYp6Xe3ZxgV4MmfGVOocUvecHJkG+hWKhJUHgqIV7RZb10KSN2Ws3V5nsHa6ZX0LI
 4FfCPEugxeUHDFjI2xg==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ad9fb22 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=IWSX7y9O8-nPMSrxZ4gA:9
 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0NyBTYWx0ZWRfX+Dm9mcbkCks/
 8s7LuLH2FskOHvzG0CqxT8Zi6RsA64YhzBKvuYvCvvH1ITxLe0qA6MWYDY86AWH55et1EKFpPAU
 1s246iP9Gfu5C9WeHExJHZtAl/7kGhY=
X-Proofpoint-ORIG-GUID: BYcNDVpDb7OfukcPblHh6LzMqTJLrLMz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220047

On Mon, Oct 19, 2026 at 12:40:58PM -0700, John Harrison wrote:
> On 10/19/26 06:12, Dmitry Baryshkov wrote:
> > Drivers using drm_writeback_connector_init() / _with_encoder() don't
> > perform cleanup in a manner similar to drmm_writeback_connector_init()
> > (see drm_writeback_connector_cleanup()). Enough of the drivers don't use
> > the encoder embedded into the drm_writeback connector.  In preparation
> > to further rework of the WB connectors (as planned to enable WB for i915
> > / xe drivers, which would move drm_writeback_connector to be a field
> > inside drm_connector instead of subclassing it) remove the drm_encoder
> > wrapped in struct drm_writeback_connector. Rename the
> > drm_writeback_connector_init_with_encoder() to
> > drm_writeback_connector_init()
> > and copy drmm_writeback_connector_init() interface. Then, with the
> > encoder being gone, handle proper cleanup of writeback data in
> > drm_connector_cleanup().
> > 
> > ---
> > Changes in v7:
> > - Significantly reworked series, no longer insisting on using drmm.
> Is there an intent to move everyone over to the drmm version in a future
> patch set? Or is the plan to give up on that as being just too complicated
> for the benefit?

I tried doing that in the previous iterations. I don't think we should
enforce that change as a part of the framework. It would complicate the
review. Individual driver maintainers might perform this change on their
own later on.

-- 
With best wishes
Dmitry
