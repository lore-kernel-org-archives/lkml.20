Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657105;
	b=b28kyB+4Exc6qOSHEl48zq2kURey11BKCA8TaccVoiMqQbb5l8xWBNCGnP3tpGEChDSi
	 8hFuZR7YAmIZWyWVT9FpqmyDNz9Ykup20m6KxPCXSuzgf+6ivUbdNYS/5fy7zh3ACTuUb
	 1pU7rwQ9dOYh0uud9BBwBh0TjZdVHQVJWRS3l3bd9dJVJKKlzPXCp2YX+5OMVnv3xGyt8
	 cyQeKnJUW6VwPf/V0188h9XQp3knmmgBtD/UI2CFyX+yEViWtaBzSAJ5WLZT+zEXfcoR9
	 9X97RRbzeEZdR3K+JTTe6TLaQO5TVG1earQQdNIpINJP6/ddmBrfn1PaKhOWedO/kBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=YgJaaouQ4HjkbJr/WZG70p3Wwx479oigUB8WJp3RE9g=;
	b=OORxZU949N47tKo2rXYFIR1djvPJpyCsfqCwH1hXI5I6u0x18K172vGgkCe1mLx00PcR
	 jwKL04TBwDDzifNd4/8BdbBZrp1XXvyD9yrkOKhr11AcUMgGUqYvWiDs5Ut1iz05yod+P
	 E1mfu8Yz6mjN0StXrWvmiX71MOfHK2/PkwZKZ9dDFHC8y9BcMDpi8KNXiaeRd0uXP+Pax
	 3BkPcckyVDEB0+Lz6xHCdAytpswiMIvvIX7cvpSTA8UtCNc7TRQB0wlbNp0uCE3AyeDvi
	 I1RAIt0vrrDGDGFb+O+l3zVIhOwT6CitlwoVoEoTL82/yYwDFX8RUCnjavejIi1/aCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AW4zcBfm;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB0F606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FB0F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AW4zcBfm
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35c76e9614aso4926232eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793657104; x=1794261904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YgJaaouQ4HjkbJr/WZG70p3Wwx479oigUB8WJp3RE9g=;
        b=AW4zcBfmp4FsGuGANobnF3IwGmcfPQr4x5MHyPWmd/80LlgrbBHfXgRaZw/uAqzu4o
         F/aOexAM+QCZ6vC+i7Ugtx8MYs5WWmZNUxEf008KZckZi3kCUXiiSAU2iEMEPOtbpoGq
         jd3MxANp/jTCUCIAbWa0QngMqYs8sTD+DeU88X9lzgbCs/08H9rHcTtIchs1zj+OPz4f
         Dsda4NZ7mylQ0SRJGOwVzT6YFY06i//Zv2xOX98KZnUvAdKJ90/aEZlQ0P4VVCTVRa5/
         4FyRLqZUKagOhhZ7mcganFDHV8q0vgMEaWRdY+O/NEkEyVIJCX9Fr7L7NXrE16U8wfWn
         H5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657104; x=1794261904;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YgJaaouQ4HjkbJr/WZG70p3Wwx479oigUB8WJp3RE9g=;
        b=e1Vcwa08ANwXuLYJXWLIDVTSu7vlcXMqFSJZMw9o26FzqaudE78WP3dRp3hedvsetV
         TChq0C3rZUmqP3h/ZpVajZMESUPOHuuOIzyg2oa2N1XgJSMMlEX4sTsbFDsXxY3xAbcw
         Jhc7N1VSEkT7DeVXctvSkEmbA3u4IxPN76vxmjT34RQY1Lu0yQZvRmuPnVVt8wo6S+aO
         0lcXToONaodHA0NePBYFKOYXNXVmc9gDxjnS4wVoTe1oue5v0L0QwlYMcYVYiYcZMaSw
         MNsFpZQwfJpq2Bl4F5gMLQOIITzOvtCXT0pEoivdX6T90O3TD5Jvyf1oC3uQ94NZM7DX
         hfMg==
X-Forwarded-Encrypted: i=1; AKwUvBwwHEoG8Yy+78aV9AG6AY6/LyeSKM2YqiAKJLX1GQx/ipsWCaUZXJlQp7vZxiq2YYwGSzrmrAl3acg4cvo=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/EafwPMbQ/AebkaYlZ2kcNtSkDWFYsY5cHZZdWhuuAImGLe5m
	PC/kH/MaJY+Qb6Mre1x1O1uGJ1OLfQBSgnvDuNlditm0+nOeUDz9gIlJ9ff1rZ8X0rD1jg==
X-Gm-Gg: AYBFou2LZIM3Hx01ggSI+6aOpVeFqbSXaeCB0x8tS1w0cm4ypW2Z9LvgE43yOdz/yjL
	Vgh1GWMyl/Z7btyGmmKgv36oUkziF8YhJ8MudUku+3Z0k8GL9RZ6ld6e+iiY5fl+Agw4pEBfugj
	PPIfKsJM/J2xnuN/fNJjJm8H8TGWpJzCFYRsvoH92Ay2eFWlPCo6TDsSCf9SRD1Yq+k6q/lIfnb
	eIRgsf6HHuO+OCeO/IyeIV97GkaReMmj64Vhf/assE69u1X0NTTaTPhTjtq2HXfEXFOf5TiA1hc
	LkC7qslCL5s/Af2HWKcs2sGEdTGjT0hSwqzcvbDYWplDYxAyfIh4BNbvqGY2Y1cDsZ85LCvw7pl
	wGt/qs+I+54ialvsv8D7SW8Wj2EZkXrT/mgrxsWIlTNVaDaA18YgU2JymRAegjSMZscBlUMAS5R
	rfn+UAh3TQ25y4KFjj06KTp/4+xs59HQ38IXAInE9u98oqctqto0K4h3C0JMmkwm40HHQ2iN0xz
	1yeoMzHw34qTLJz78qtiJL2dptxun30Ji9ppk3BwJmWJNVvlwudXJcq5UZ2rmPd72ckUrPIIK3O
	ma8tWrvtfWQQu05jI270MZmHl0J2hfXOMgDlFcweNI8x
X-Received: by 2002:a05:7301:b01:b0:36a:20b8:ee9f with SMTP id 5a478bee46e88-36a42203f98mr15418420eec.1.1793657104432;
        Mon, 02 Nov 2026 14:05:04 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42952e1csm43006249eec.20.2026.11.02.14.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:05:03 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Antonino Maniscalco <antomani103@gmail.com>,
	Kalyan Thota <quic_kalyant@quicinc.com>,
	Federico Amedeo Izzo <federico@izzo.pro>,
	Helen Koike <helen.fornazier@gmail.com>,
	Vignesh Raman <vignesh.raman@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 09/10] drm/msm/dpu: only reassign resources when the encoder is reprogrammed
Date: Tue,  3 Nov 2026 07:05:01 +0900
Message-ID: <20261102220501.1704-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <86bf919b-5528-42bb-aa89-b518452ed7a0@oss.qualcomm.com>
References: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com> <20261024-fd-kms-fix-smmu-v5-9-a5b0b284aead@oss.qualcomm.com> <86bf919b-5528-42bb-aa89-b518452ed7a0@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/26/26 10:19 AM, Konrad Dybcio wrote:
> LLM is curious whether turning off CTM/GAMMA should trigger a modeset too.
> My hunch is "yes"

Some data for that. I tested 7/10 and this patch on v7.3, on a Lenovo
Y700 Gen 5 (TB323FU, Kaanapali, bonded DSI) with out-of-tree board
support. I counted msm_dsi_host_power_off/on with kprobes.

- A compositor faded a night light filter in and out twice through
  the legacy CTM property. These are blob -> blob updates only. No
  modesets, no visible blink.

- With no compositor running, a small client set the CTM through the
  legacy property ioctl: two rounds of NULL -> A -> B -> A -> NULL.
  No modesets. The CRTC kept its DSPPs after each A -> NULL.

So turning the CTM off does not release the DSPPs. On chips with a
single DSPP, another CRTC asking for a CTM would then fail
dpu_rm_reserve(), as I noted on v4. This run does not cover the first
NULL -> blob on a CRTC without DSPPs.

As with v4, the tree carries out-of-tree SPR (sub-pixel rendering)
support. For the test, dpu_crtc_needs_dspp() also returned true when
SPR is enabled.

Tested-by: Joonhoe Kim <26rote@gmail.com> # Kaanapali

Thanks,
Joonhoe Kim
