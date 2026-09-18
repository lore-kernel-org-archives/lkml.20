Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031DF515971
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789751142; cv=none; b=TqcxJ435SjF9tlQpbsjTVZl51RqLgRDvMDujN94TozABc9pR1t5lJ2LpqA6DHA4ELCF1GbCQIZDMFbszJl1kZTWJHuItaeBwlwRWNGyHn8YgreiYykjwltOHmKUUon0KHv3Ja0eAK1QfUmHZPePoBR2yl3tpud/MoXvlP+quBl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789751142; c=relaxed/simple;
	bh=UugoPu7L/mnXVW0/GIPJWP6Egr3wTKgKMYjHvRDh0l4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=svEd/mNPrUwl09el7rQW3jd5Of23uABGNk4+rOvjfn9BWxxzd2SXZJKPOl1dVHgjniyWFQlkI7t8Vyn6eGTqNtx49bLQS1bHAXNvSjx/FQh7Q/vOFMCJqZyzAp0QEGDavv8+E4bdEX2R9zKYr3K2w0C0YIpBAak5v5zeZ2wJk3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WMMuEWXH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GxBp9UjN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WMMuEWXH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GxBp9UjN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IGokjg1818055
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:05:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QMjXKTddFP/KRl7r6fg9f8x2YOcB9udmZHxfTy35BWA=; b=WMMuEWXHWJBv/taD
	f9QZUlE46GdUzuTjYYf/C3doWA0kR+Y5MgruXgzoDKrnaUUWblDlcnoq62X0pGZb
	/qbl9/Nh08g2JIywKdvQgqoIFODG95dmBYMwKhKE8pfH/9GV1s9uiIZ/ny0o1Ct9
	AxCx/8lN1sOSKnfJuvaS1JUg9GiNW/atd+A2FpRM9LBALe3ZTIKYfBJ7XUzkVsAm
	/0Sfv53h7nA91Txh3LNTG0XJ02vyxwLdjN4jnrj+2hSOYEPJdtabTGR3PdaWxCxi
	qwYwhp2WIMT4a5wkgjtCyWIgf1y9m/+GKe3lh+g7l4PT8AQ6cRmW8HyvIVAcaiX9
	oOwVlA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs2hv9w01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:05:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2dc7337e2a7so12882555ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789751138; x=1790355938; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QMjXKTddFP/KRl7r6fg9f8x2YOcB9udmZHxfTy35BWA=;
        b=GxBp9UjN2w6V8oF53WN9V8+nnavwuXEHMjIKMMFIeH2j3iGWiQuwXHlWgnqzZ7jE9B
         SRCf0gtiGmgEdAmQxe50GA4XTb86r/K0S7Lgv67ch2W7KG6zUKgC39awrUMgrnYLe99T
         aU79QUf7OG+GmuLnfHjBqwQ1Ser/oMCAnfKyiGufbwmCRSFHaN7xYmaWovlZlaIdiupQ
         AaNbJsh33qZkOTGlFzzPJ9VaiNPMVFxK3SXo9bs4jdzw/a7gq7gJ38zXqICzbSonQwUS
         QG4VktOSCvHLWj1XmZH8jo/M9DRzxTwQ1A5tE5yyUTtDqeKI4MU3YDJCdxXiA0xeUElV
         XAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789751138; x=1790355938;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QMjXKTddFP/KRl7r6fg9f8x2YOcB9udmZHxfTy35BWA=;
        b=SdOkQ+cQyhL1GerjUijQ8Z70c2DVENizs+vT2McQFOljjGggn9EogVV26+vo2+D6RB
         ExLovtSy1pF0S3olk/uwWC24cKsXecULqr2v8EJGC/GDertUJzjutTULZ0yFYnWdNV8L
         cApeoG75CViXudE0fOIEUMS188TDGvujwuMFiXV83cL4prmuVhxMbUX4E8pC3Kq2CXfj
         j85bG2kHpdAn8Vr5evbYKhDx9rSdkGsPpG/32wNkXfl/3gMa97Pq3XbwUiYFwKPmMA8f
         YUNrc7hON1VwLwXiiKM9do3IR6Hs+ppFN6MDvt+fEfZgUnDJ/miWkKKDWdOQ/g/sLnYa
         pX+w==
X-Forwarded-Encrypted: i=1; AKwUvBxWUJa21Jy/MCrZM75qGRWZ+dGBvcQEcf8ew1jhcjCBREPuEKnr3cDgZf3EsMvPXA3yWtD2xCkdHIvs/Go=@vger.kernel.org
X-Gm-Message-State: AFuF++nvAxGjicNzwU/Qbk5kkyOoCbA51TNKIt/nj9XO/IkCqRU+0bmI
	r4Rj6+Gmut5O/PEBnEBhIqWTuiE0nbD63Lm4JQfc9JMVpVaPUP8XDJ4EwK0SxHzufuHtiaEGlJp
	GE29X34e4Vv4KMC3Nad+eI/g5fQwqrqTSjWusB82CK/0quTAAs7GZq4FLgR0BB56hkGk=
X-Gm-Gg: AYBFou2+OSFnrQ0SiOMvF7R05csH4g8j3no85ni59tT7ONGu3BE3rTbnSTtA++iHeCb
	48ezfJunS+lPYFAZm23fPn0vC6lKbjJJf2LASroGZCQ3F2+M3kB5MXNq+tcai4scb01Uxz/w8gL
	NqG/6xaP0/DrbCxIHeSN4uzV3P7D7tgDoD3a7t+93chYqvstdEU2WqXURCpDF3aXDeL8LRKbzoc
	HttE2/eZVx05PDqDs1zLVGPDCuDYRLWBHkSSb3A0yPPt5lJyGVgBSw1NUi8zmF+DnvnSnGPwvPI
	va3aTRYrYU4mbPTqcKcyYJPNtbTwc98Rl/4NUC+8m5SALg2/xJIGnPQE8q/u5F0N/kVFFcsSqZO
	b3vuM0g==
X-Received: by 2002:a17:902:fc50:b0:2dd:c053:e0f6 with SMTP id d9443c01a7336-2ddc053e13emr7876605ad.37.1789751138499;
        Fri, 18 Sep 2026 10:05:38 -0700 (PDT)
X-Received: by 2002:a17:902:fc50:b0:2dd:c053:e0f6 with SMTP id d9443c01a7336-2ddc053e13emr7876085ad.37.1789751137947;
        Fri, 18 Sep 2026 10:05:37 -0700 (PDT)
Received: from localhost ([143.246.51.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb75ae73csm11519845ad.57.2026.09.18.10.05.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 10:05:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 19 Sep 2026 01:05:13 +0800
Message-Id: <DLILTJ12IX36.15ABZZEUMTL59@oss.qualcomm.com>
Cc: "Ze Huang" <ze.huang@oss.qualcomm.com>,
        "Alexey Brodkin"
 <abrodkin@synopsys.com>,
        "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>,
        "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
        "Joel Stanley" <joel@jms.id.au>,
        "Andrew
 Jeffery" <andrew@codeconstruct.com.au>,
        "Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>,
        "Pengutronix Kernel Team"
 <kernel@pengutronix.de>,
        "Fabio Estevam" <festevam@gmail.com>,
        "Linus
 Walleij" <linusw@kernel.org>,
        "Hans de Goede" <hansg@kernel.org>,
        "Alex
 Lanzano" <lanzano.alex@gmail.com>,
        "Oleksandr Andrushchenko"
 <oleksandr_andrushchenko@epam.com>,
        "Philipp Zabel"
 <p.zabel@pengutronix.de>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>,
        "Marian Cichy" <m.cichy@pengutronix.de>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-aspeed@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
        <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/2] drm/imx: replace struct drm_simple_display_pipe
 with regular atomic helpers
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: "Maxime Ripard" <mripard@kernel.org>,
        "Thomas Zimmermann"
 <tzimmermann@suse.de>
X-Mailer: aerc 0.22.0.r10.g73f20125
References: <20260727-drm-simple-kms-removal-v3-0-de36e534f7a1@oss.qualcomm.com> <20260727-drm-simple-kms-removal-v3-2-de36e534f7a1@oss.qualcomm.com> <8e4c84be-5c89-4d84-adda-aad4c7de0c8a@suse.de> <aqpJKSSKunElnQ3o@houat>
In-Reply-To: <aqpJKSSKunElnQ3o@houat>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDI0NSBTYWx0ZWRfX6DFbZol3F8TM
 7LMlfZFoSUM45Y4K0NSy3gYNHfxhFxihYJKaN8A7tyghDIGOQ6ifrT+QrUqu+X2Qu0W0VwzvY8B
 YQ54gx18l+oXzDXNrBhUkXk/6vi9K+Y=
X-Authority-Analysis: v=2.4 cv=IOWXmQvG c=1 sm=1 tr=0 ts=6aad6f63 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=LNnhWNgewsfctp/cwirQdA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=IqZAcGRvIuv5jEvzszIA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDI0NSBTYWx0ZWRfX0OXBeVHf3Dal
 JStMVpwWP8Fdrve4RlhsGr1Vwk7UI2qEnqcQA6uExixdXxgmRnLXILP3jtVwRJa9+c8M8JpSPxx
 294zgYOLkeTzwgNLRT/6zl5AbSFCo++o+/7qtWYnzxL0PwXJOw7128/fU6ahx+7kbW1LdUPCa9A
 iD43EBJhA8vnVwgpXaX2z6q6dqVRhFK5V5F2VdafJqzsxmDEU9x9blfLyIqAC53SKVZ0JMh88Am
 U7Qyk0m/s5Elxx4YrkCXnrfT/0nrgNczzLq2GL6UIrKisRVgPfEyDIwGaJrhJvX52xB4THLEzLv
 aMoyy9+pLpoyS3GaJnvdsKkjOz9uxDp0+sW9YCcfX/Kzj0rkaye/W6ibvKhCAfz9vmWmAJI2mZD
 pvjof0KZW8rrtNCTSqOVWGRhfG6hhtrSJ2HzU7SztBQQHcfViGK/xGY5Mc0e7MY8QYrMuvZy3bO
 tY/wqth4RxpkncY1AVw==
X-Proofpoint-ORIG-GUID: Xav1BqxADM7f0ulog29zkFfu8DFGGcdc
X-Proofpoint-GUID: Xav1BqxADM7f0ulog29zkFfu8DFGGcdc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180245

On Wed Sep 16, 2026 at 3:46 PM CST, Maxime Ripard wrote:
> On Wed, Sep 16, 2026 at 08:50:21AM +0200, Thomas Zimmermann wrote:
>> > +static const struct drm_plane_funcs imx_lcdc_plane_funcs =3D {
>> > +	.update_plane		=3D drm_atomic_helper_update_plane,
>> > +	.disable_plane		=3D drm_atomic_helper_disable_plane,
>> > +	.destroy		=3D drm_plane_cleanup,
>> > +	.reset			=3D drm_atomic_helper_plane_reset,
>
> Also, this needs to be drm_atomic_helper_plane_create_state
>
>> > +static const struct drm_crtc_funcs imx_lcdc_crtc_funcs =3D {
>> > +	.reset			=3D drm_atomic_helper_crtc_reset,
>
>  and drm_atomic_helper_crtc_create_state
>
> Maxime

Thanks for the reminder. Will do.

Ze
