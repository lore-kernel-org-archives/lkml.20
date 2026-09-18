Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAA43C9EF3
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789744504; cv=none; b=FfxeANnj/6eBpJDJ4+n5XeDlJZBIQ5dEm/ZX2JUOwWjWVabBN/PVeJfOXwJmwEqzTgHvQAAKzcZ1di0LxawJSbh1RjvMRqvL9L7U4Us4xDMKFfrRiaSrqJ1/gGpp1U5gBlhf6GLlfJEvaTwbrqspYs6gETLZLlkjatypkzD31PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789744504; c=relaxed/simple;
	bh=8pH0+8dNkwSaqoyWPEEKbvS/EjWssTuyZ3oG+ok9uR8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=LUzGMbxt7eXrtjjsjGPr4YIu0uvwpD8lhEvBUXOtxkPHoibhWdCk481+XsVbIz809An0X/aoIsiQhjZe7p8rWWz55YnH3ZbM31S5piHq2CaqxekpyTK9tF7dMYyREC+0ANL7Kc8L21C4vlsKAuGUCP6NnFiODtjRS1HDW8rvD60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DTqEyIFw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=goaX74Nm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DTqEyIFw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="goaX74Nm"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOS7n1711305
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:15:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	klACuV7fdAYuSy7gHXP/AwNMnEDjRFePgshatLjHrOQ=; b=DTqEyIFwhXRJLNu9
	IeYZsHOrKbXijwmdqq+ZxiPvyfet/fCUB0waQ1XFZArweh0RjYYUmoxq7nl/JEN1
	Uy5NmhOd1qusEnfpTpqRg8agzbrAvS7pZSvHR/ylobOfF2XYjSV1/YXA1xxh8us/
	0WSRuT7kO6kdLHoxx0I2EyTlfaVrjEBLOT5OPcRGUnOIkfZCR1Q/Gs7QFtUyIHF/
	pYQtElGkrqyBwxzixxweaHTo1wj2rjXG06RAMMI+IEvfVga5JiRCPKr59GAZzH1x
	JMF+HWQl287jMZVbazg42u8QTxVQ95BPg7psGMdFhgyAH+3PsFf8v+fRdN7V6mJV
	VeUpRg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrg43sx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:15:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d959904658so15126405ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789744502; x=1790349302; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=klACuV7fdAYuSy7gHXP/AwNMnEDjRFePgshatLjHrOQ=;
        b=goaX74NmVBIeOBBy647U/pRnxZy8PBw28lNrrXwpT2g9YXPV0Gzy/cf8xD3wG7UqO5
         3lwaiVyYm6zyfRsUi8D5LVVVbpp5itc1AwDm5r+XFsTaay9+vQTIIdhpJDqdCMeYHd6C
         1abx+65+Ti56XEjGVvLk777EFIx5bC9ZHZpl9Xiz9pwy28UqpK/BM2YArv3pBxrTmorR
         L6X+5SHuf5LFyk6eQ0RjiiASjn4dl2/8RFgBjTPH8czLcZR/BEK76JpBrE2YAELTDPi0
         dlapaDGryXv1jrfMH+xzqlD8NonLm2KwsjoQ3xxBGybON0Nf8mrp24qeSOrchRCKpKsn
         f9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789744502; x=1790349302;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=klACuV7fdAYuSy7gHXP/AwNMnEDjRFePgshatLjHrOQ=;
        b=uXHKBeUDSDZ3jH9oVhKKsA019LEU7/WU/gqaFckJ293o3L3zhsh5CzNA+g408Qfz70
         r+BlXME88Lch1odGoattPiwWrHaJYUJNO5LJXKyviVo6hXzz1C0Uwbb5bxjdHQf+ceqc
         nvkhm42gDZhu+xHDXNYwQNRLig36sJjg4jnL2b5+/Se373koHyH/a6Kab3LT9Dh34lJ3
         wIbbdLmkURpNgl2Q4fdgnPhK3t9lZI1UoFIFCIad1xomQLj0tU7GKFwtf2Pf2Twu3ltK
         N0/ve4wNYNYCl5pUkflqxiD5DT9i3GVQq4jXmVwhHG+UwBv00NR7PcRNfCkpau9qvWCF
         oDqw==
X-Forwarded-Encrypted: i=1; AKwUvByQMNNERuIQzZX/E0ns2VaC/0VdjPWZs0mnsesFV3ZJ6/BQJ6I9b33CIoVnlZWccm8ZL40anUrG8nnS1YA=@vger.kernel.org
X-Gm-Message-State: AFuF++mAqRbzocPCBP5ZgFDkVgjb3x5hC2gsHpRZaPyUp8UH1rn87JR/
	GXv5ke8z2AY+XkYPa1PMCm4rgGyb8Ier86tiqcYymHjtAw12A1CRxaVwnvJMEPnfEilk2eMbiOs
	DMNzGLrk2THVaf4BOGrQYV4YfziU0Vra2tfR3VUaabnENav1p/xOaEAWGoLWbyBZADRA=
X-Gm-Gg: AYBFou3K1rWpd79psP4lQqcBmhSJSVNXWrgrD+9NLdQGsslikrugd1v4DhsOUF4aOkq
	XmpNb0ryXzqbeP3PI9zakEr9NKQh/YKoZgTzAC1k9Ld7miXeDfD30WTI2zfoE6l63ZN5tbsVEeb
	CN20ljH6uUc1W8ocnjkuL8hL+mwZDwLAvqggnCSjGcdit59rjiWpMjHvf+aDAh9h6/IjMzNuLKR
	SffRj2XuxTJXmgRDU9YZA/hhb4IVWhSzFeJen08DoDD5ffO771fwFJfdqDwYuNNchW5pnFRaqnT
	OdPcN1BAyRgZEpTK+R0Pimj0eGEtn9WF0VmjBliFactS3VCxBscFoVSr9EnU6ZapYxJpPWeB8KL
	ztkbK/w==
X-Received: by 2002:a17:903:906:b0:2dd:c053:e669 with SMTP id d9443c01a7336-2ddc053e6a2mr4635045ad.47.1789744501641;
        Fri, 18 Sep 2026 08:15:01 -0700 (PDT)
X-Received: by 2002:a17:903:906:b0:2dd:c053:e669 with SMTP id d9443c01a7336-2ddc053e6a2mr4634335ad.47.1789744501092;
        Fri, 18 Sep 2026 08:15:01 -0700 (PDT)
Received: from localhost ([143.246.51.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb73db302sm10267015ad.2.2026.09.18.08.14.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 08:15:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Sep 2026 23:14:35 +0800
Message-Id: <DLIJGTK5M3G0.2PNROS5SMQWNF@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-aspeed@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
        <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/2] drm/imx: replace struct drm_simple_display_pipe
 with regular atomic helpers
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
        "Ze Huang"
 <ze.huang@oss.qualcomm.com>,
        "Alexey Brodkin" <abrodkin@synopsys.com>,
        "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
        "Maxime Ripard"
 <mripard@kernel.org>,
        "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>,
        "Joel Stanley" <joel@jms.id.au>,
        "Andrew Jeffery"
 <andrew@codeconstruct.com.au>,
        "Frank Li" <Frank.Li@nxp.com>,
        "Sascha
 Hauer" <s.hauer@pengutronix.de>,
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
        "Marian Cichy" <m.cichy@pengutronix.de>
X-Mailer: aerc 0.22.0.r10.g73f20125
References: <20260727-drm-simple-kms-removal-v3-0-de36e534f7a1@oss.qualcomm.com> <20260727-drm-simple-kms-removal-v3-2-de36e534f7a1@oss.qualcomm.com> <8e4c84be-5c89-4d84-adda-aad4c7de0c8a@suse.de>
In-Reply-To: <8e4c84be-5c89-4d84-adda-aad4c7de0c8a@suse.de>
X-Proofpoint-GUID: QkB1Jl2CSDoE2jP_eXmAQFENiX2FI69F
X-Authority-Analysis: v=2.4 cv=ZO9CCn7b c=1 sm=1 tr=0 ts=6aad5576 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=LNnhWNgewsfctp/cwirQdA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=nI5uWgR6GCbiVoZM8DwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: QkB1Jl2CSDoE2jP_eXmAQFENiX2FI69F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIxNyBTYWx0ZWRfX2SOU9XEJG5gU
 fR+RgA+o2sgLrCvzojUu36Fbowqx3HboRq0t6hzMErT1z5IVSMTnw5t9uNQIOYB/wGH7iHByDZ3
 8AFxLxVALnpn73nUg+umTY1glc154mMTq7QhZPO+P3fkD1zuPm8LdtnEsUQxSRY2SrRdCjbhl7w
 nSVlOptL/jDI+zwXHvVnavKn7FnTXWcdqFaWehgTECeACb4d8Os4udzzUKq/suwA+tAAZ0KRZvU
 Us+4zKJgqe3dS2OCgIO40KalfKeqHpXxc4miHLw8E6ySroa1jSm6f+ElzZIyqxcbW2zxHAA7HMi
 iLY/93fvTGyt15eVe0wF3Fh0swVtcL80ywnoPHiD5wbeNJujlOfmj2yaaYjZTYeh1xTfuih+1/3
 +ZXysqn0Mu6AjyFXEwRKGOMAhOGJ2Gm03/pL+HMgRoDuIjNOx+MF0pHkrmR3JoNqBgLFFiYyGnA
 WHeF5WToLl/AML1Ateg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIxNyBTYWx0ZWRfXxb8X3qF9yD2r
 6AQwn7pPVmQrqrjwSh8AvGqtw3AIf4CqyUtHLietscP/NO/TBckxPrGNEIq4W58zlz6tB+rg48D
 mhi5YXeBO17kYZxVQZx64e/K/3xC1IU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180217

On Wed Sep 16, 2026 at 2:50 PM CST, Thomas Zimmermann wrote:
> Hi
>
> Am 26.07.26 um 21:42 schrieb Ze Huang:
>> Convert i.MX LCDC to explicit primary plane, CRTC and encoder objects.
>> Keep no-scaling plane check and GEM framebuffer prepare callback from
>> simple-KMS path.
>>
>> Wire the vblank lifecycle explicitly with CRTC vblank callbacks and
>> drm_crtc_vblank_on()/drm_crtc_vblank_off(). Use the old CRTC state in th=
e
>> disable path for clock unwinding so the clock reference count remains
>> paired with the previous active state.
>>
>> Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
>> ---
>> +

[ ... ]

>> +static void imx_lcdc_crtc_helper_atomic_flush(struct drm_crtc *crtc,
>> +					      struct drm_atomic_commit *commit)
>> +{
>> +	struct drm_crtc_state *new_crtc_state =3D drm_atomic_get_new_crtc_stat=
e(commit, crtc);
>> +	struct drm_pending_vblank_event *event =3D new_crtc_state->event;
>> +
>> +	if (!event)
>> +		return;
>> +
>> +	new_crtc_state->event =3D NULL;
>> +
>> +	spin_lock_irq(&crtc->dev->event_lock);
>> +	if (new_crtc_state->active && drm_crtc_vblank_get(crtc) =3D=3D 0)
>> +		drm_crtc_arm_vblank_event(crtc, event);
>> +	else
>> +		drm_crtc_send_vblank_event(crtc, event);
>> +	spin_unlock_irq(&crtc->dev->event_lock);
>>   }
>
> Please use drm_crtc_vblank_atomic_flush(). [1]
>
> [1]=20
> https://elixir.bootlin.com/linux/v7.2.5/source/drivers/gpu/drm/drm_vblank=
_helper.c#L51

Thanks! will follow

>
> Best regards
> Thomas
>
