Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD7651AECB
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750730; cv=none; b=ixCYMBobd/LsEa1FKbolMwULbQa6yKBVpvNUkk4WGK4d4b5BapRM8DuqU2cwRnTx4wcB3hxy0CwJD+7Qa1cHjOYXWIuAyiFuzLsi0+pn+y/5sHIzXvPmKxwxKN2q0h/PtwNZ5tosecayma+JN19JTjtjJ5/bebxOSesEVrniMLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750730; c=relaxed/simple;
	bh=bhzXgDPDFYnoR8BS3k2HeCHiAqIg6I/VcsqlSOvkj9k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=lLFivjYFzfw5hIcNYHWGZWrlSzqThZ65XJ1ltA/uHgF8cHeVVpOWuW1kCFu8ti0gT8HnxhTdxKCWKeWT3JuGwhxtUKPA1JGglYiYhyCB39tiP/p9CGAF/HnPhQRhIvWWRoHSPbqPFaws3uf11PLIeTsZr4q/SrT03ukrkv87EQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F862iJkl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jae5Ssdz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F862iJkl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jae5Ssdz"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IGo2DB2364239
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:58:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FmJ9l5QFBMMe48wI+FnvFQSDXsCaB79a0WihlyuJstA=; b=F862iJklfTEspXfc
	UjvRsNylWUiwop35P1muhLn10HTOL/M7stdoCV5Frgx1dJJyqJCtb9FvturdV8sv
	z3alBIEzMWiVlVthfKBVozYtF7rTFVwi4etMJQaCL3Xb1OMzWcr3mo94SqS0NKef
	R2spGU2cf3Z4YDgyNC0YvETba6iLNRQtX+MmCmDbez6Y2pZzcL6/1A49LPfbZR3+
	EwSgfygJ0q8qQ9GphKHYvddiZI3X3ZqEQSOuyLKfi60D+5Gm3ZpMKc/Bkp7QtCxC
	19jlA5mLGS4eEQmM2YLhernOpYqFKGMWVlTYHqEyqO4snc1SdLMMuu7ckn2KAGe8
	b6XcSg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grtdpusau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:58:44 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8710450f731so1139117b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789750724; x=1790355524; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FmJ9l5QFBMMe48wI+FnvFQSDXsCaB79a0WihlyuJstA=;
        b=jae5Ssdz0VuXbneDm6l6rcpi+mBlCe4fy2Qxkfy09dA7u6mRy8xn0rlna4FbA7jbZl
         2Lc7Hcl43KJUwt+RI7pH2f3LVh/huvP2ZKJwHndUk8fnJngiKrMVcstAEs2VDhM4YSxo
         o/vR7CWDK07qy97F9saa5PaVlKfkuOB32+Fezw3Ds1+oghAXOKqqAxHuHJw0+5io3PMd
         BMg+l20oJlRSdb0RdmP/l8jl29KfYVsWNhJGQXLDF6Nau+z3GP1RVxjXUXrduopHGpLB
         tApOHxJ59t2KjDVh5aneW4Hyfxqmxbzx95RTIoCKG3bITBYEtpZklZVancK46VC4HbAS
         0rGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750724; x=1790355524;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FmJ9l5QFBMMe48wI+FnvFQSDXsCaB79a0WihlyuJstA=;
        b=LGm656QVYXMxv9HbFlU9W93OyReqMb3cU6nKfXdHwRhELcn40FUOgBMw7Z8tq1Vv6X
         90J35R6VxhcCGWvSpXW4i+0NKb4uUsvpoVTvsSI9HHIVWVUQOJpco1H/LOqLb22HLjie
         CbLJh4YwgFXcnsgukw/S7NnbgQVU/q9Kjcz6yIrkvCD/pWxRbP3Z4xtBm8TPXLR0v4+v
         lpyVeGBaCQS28Fanbw8OjevFn0g+yyvqBtt9Z14dpavmgrctIYTYcRsqn0xN+OeH44u7
         +rurLOdk9VtJCI9zvgwhM6TgvcdV59d0+hJ08n9Dy6KVuBobwcQYz9J1WKPY64awty6d
         Vv6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzf0UVThueN6gZBS1ih0uP81cqLmWu1ejQJOWFkjdNhZfg3sFMVgmkR5X1seLAz2+HHkPnlylAzyb/So14=@vger.kernel.org
X-Gm-Message-State: AFuF++kn8SjlbQzj+Ti9Eh8VJV2srAyaYhMELynv9krQERS8fLdPmaA1
	Y4ctJY1TefIWkWz+5ZDbeMhgP3xxcZI+IUIpntUBIwu/yYUnsOdRrCUFgh5BdkWwT613yXZaBSP
	3L+YpnyTgxAkVeL35ATsbTTpyjefDghK447tzKZkgRzkD0W0XdiNEcjQQP8DhOLKjYoE=
X-Gm-Gg: AYBFou1sZRZ/SXsGtp8RvM52rpKe3anBsfzqWs5tMWJBi/rWcBpEt3Vm0ehe44Mzr8j
	iZ0atIaFhS5ddtROOV2BE3lBxAOz0H8Kn8HB85lXyHcbsCcO4uC+gaG6SQVpPaKZqWTbYuvdKDc
	PkU3j+yHvx3YVNRgDMApYYOP9Ck88Wls9MQNgLwYpi3MVu2IwZmd2b0EfQElX9yfZXZmVmWl6CX
	AfnozcirTUduQv5mAx0jfLqOu7yjDkI32XEo3zJGZzGaBNO/nENudW9PSPCIxHtNnVLVHzISvVD
	DKosIAgIpJd4ADuJlEuuuztBJKYw9tF9CVpPmHOEZUhIzX4Yf4oDYIrwlAorOh+3fFp+R+PHcvk
	XTionhA==
X-Received: by 2002:a05:6a20:d707:b0:3dd:a195:fa0e with SMTP id adf61e73a8af0-3dda195fd95mr361316637.51.1789750723379;
        Fri, 18 Sep 2026 09:58:43 -0700 (PDT)
X-Received: by 2002:a05:6a20:d707:b0:3dd:a195:fa0e with SMTP id adf61e73a8af0-3dda195fd95mr361267637.51.1789750722830;
        Fri, 18 Sep 2026 09:58:42 -0700 (PDT)
Received: from localhost ([143.246.51.243])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c50e7433sm1426162a12.28.2026.09.18.09.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 09:58:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 19 Sep 2026 00:58:17 +0800
Message-Id: <DLILO7Y6WWXC.ON1PAKLWJM1Y@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-aspeed@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
        <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/2] drm/imx/lcdc: avoid duplicate clk_per enable
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
References: <20260727-drm-simple-kms-removal-v3-0-de36e534f7a1@oss.qualcomm.com> <20260727-drm-simple-kms-removal-v3-1-de36e534f7a1@oss.qualcomm.com> <bbf8fd0e-8e1c-4899-98f4-b8231800de8c@suse.de>
In-Reply-To: <bbf8fd0e-8e1c-4899-98f4-b8231800de8c@suse.de>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDI0MiBTYWx0ZWRfX23hqZ1Gp9WLq
 nbEE3sm07hB34OS8GqAlAD6g71ebF2ricQMzooUxm0LCm1cFYezYfcglKgTgrWuW/KA8TnhQ9DB
 XXMzeguVfQ4MJKLxeZljdgb0XYu168oglqW6rDXj2JAA7y0k7uB+CB57ByLv9fS9RDcBxHYpdAG
 cpcYy3hSdMdZrL0aXYf3xuEV3CI1M0xXVPMc3NfoU1f5lE/qsh29n+E6sT9fy+62RU4PSb+JDXN
 aE6Q4ZhF5zfvzZmbMNM5CwQtTf9UYyW2oEfn3r0CwgRienwA0IilxuAwKptjMpKVxVg2slIg2G5
 7yAaBBMUG09WpbxCQP7YtBgnd/oLQ8oF4Bo1TwD1jh/q5pH+tiCZb3t9Pl9mF7+6FcSdRuI86Ho
 vMB26f4gJQvtqlzYZFoMUItpYP5+8jvkVqODQrOlpAKpngrIpAVSHXmoYzr6iwa/Ye+rkchR+PI
 Nqy/vhR8tuMgNDPnGuw==
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6aad6dc4 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=LNnhWNgewsfctp/cwirQdA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=gNeoJdBQTLUQTwsD9V0A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDI0MiBTYWx0ZWRfX9rXSxioBN2p/
 7gVrFf6aLPG9/BdWCFoQPDzueWHSwHRkO5RXT41E7TItvpADGfuOVXN560FfAkJTEUQ+28IsjdH
 QR6CrVbuChwixuC5yE37x/Fd1Fz6EpY=
X-Proofpoint-ORIG-GUID: lMPmBqadChrwXXsgzoB-gyEYGoQpa2ft
X-Proofpoint-GUID: lMPmBqadChrwXXsgzoB-gyEYGoQpa2ft
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180242

On Wed Sep 16, 2026 at 2:24 PM CST, Thomas Zimmermann wrote:
> Hi
>
> Am 26.07.26 um 21:42 schrieb Ze Huang:
>> The simple-KMS helper calls the pipe update after enabling the CRTC.
>> On an enable commit, imx_lcdc_pipe_enable() already programs the
>> mode and enables clk_per. The following pipe update sees the plane move
>> from no CRTC to the active CRTC, treats it as a mode update, and calls
>> imx_lcdc_update_hw_registers() again.
>>
>> That second call has no old CRTC state to disable clk_per first, but it
>> enables clk_per again at the end. The disable path only drops one
>> reference, leaving clk_per enabled after each on/off cycle.
>>
>> Skip the register update from the pipe update path when the CRTC already
>> needs a modeset. The enable path has already programmed the hardware for
>> that commit; keep the event handling in pipe update unchanged.
>

Thanks for your review.

> That seems reasonable. Once the driver uses regular DRM helpers instead=
=20
> of simple_kms,=20

> it can all be untangled and this test won't be necessary any longer.

Yes, that's the goal.

IMO it's better to spilt the operations in imx_lcdc_update_hw_registers()
or distinguish the caller.

However, it might be risky to make big changes without hardware validation,
I think it accpetable for now.

>
>>
>> Fixes: c87e859cdeb5 ("drm/imx/lcdc: Implement DRM driver for imx25")
>> Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>
>> ---
>>   drivers/gpu/drm/imx/lcdc/imx-lcdc.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/l=
cdc/imx-lcdc.c
>> index f52832b43aca..81024f7d9e96 100644
>> --- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
>> +++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
>> @@ -311,7 +311,8 @@ static void imx_lcdc_pipe_update(struct drm_simple_d=
isplay_pipe *pipe,
>>   	else if (old_crtc !=3D crtc)
>>   		mode_changed =3D true;
>>  =20
>> -	imx_lcdc_update_hw_registers(pipe, old_state, mode_changed);
>> +	if (!drm_atomic_crtc_needs_modeset(crtc->state))
>> +		imx_lcdc_update_hw_registers(pipe, old_state, mode_changed);
>>  =20
>>   	if (event) {
>>   		crtc->state->event =3D NULL;
>>


