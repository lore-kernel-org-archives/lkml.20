Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792810955;
	b=qkxd0tusGqHFk20ZF6m96ZqWHBbbMrvV6aSsUvipwk+7tC3oM+ki5d/gAPJkwdRV9Wff
	 MeBBYoIvHIigBOFwwAJpy97tkeGt1m9RGERtIQk9FGPhgC5eZTmRW9dIzAWWHHpp0xlbQ
	 gF8PELcsXNvIdr1lohOfOC7RjKHcIME/WARmQFKW/gMOS0GGAdCQxQJAmIMK0zEGT3r+3
	 +ZOEEgSN8vmxhDHHOjAMD40juK8cfzINpF/qgrzpvVVvVC6wztLOewjJs9rfVeT1aEekY
	 5BWPmz//gDng8a3ZB5fzWbOAJpWlMf0hdimS2C/Wes7Twd4q6g4y0BqXxPa8T0OPbHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792810955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KzYwebK8+EyE5IOADDn5pE86fQ/miF+9X0GS6d/yof0=;
	b=wzJMJulSSog6l3+6IUYKA1XEtwgM7Jf9/JMRzMYm79N1UFxC5ADRCyPUgHrfkMk9tWEw
	 GqdrY0/+6znkwSTEA1IvVbOcDt4yGaEfhl3UZGuOpiP//aRcH2jjgSyodVST5tUWL1yJc
	 T+M7IIu1QOcFBwV4CRTGF9jvqzSo2XT4VTdoVALJG095uvytcaBKIb6qlahlW8itwzlUh
	 cZRiB6fmRT1MzViRhbO2UdGPlkCox0qJR681oQpxvsy3/rW6EmdoYE596I9A97DEetCx4
	 Bzo+LDCTKlJMfc6jlmwkIOVGgh9bY4VFqD3G7l4i95xmopwFS001SarQcFg/w0vPr2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d5wAdJ+R;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F16660A2621
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 03:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F16660A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d5wAdJ+R
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-70094949641so1292704eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792810954; x=1793415754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KzYwebK8+EyE5IOADDn5pE86fQ/miF+9X0GS6d/yof0=;
        b=d5wAdJ+RfNF1EyTdmthoWEg6TVOWu02H01kjTeboWpUGczhSApApGCf/E98LyDanIX
         Ru3skHjW04y/QED6Rlca81V+Qu+GdJncH0AZPRauVMXQa48S8S1wVdKCMl1tqHUXaEjr
         dtd7LaRWSTyHeBWjY17bMKE9Zrdph/9x5/wUhTIbNPKmV1VabuD/AaY0KzIZcmtjcCxq
         zR164Remv9MO/z4w4os8wUPu2kV4ezzXAb8BMrujXP9XKoCPS/sDU8a5AEvI+OEIuiFV
         NJVDlbIDwXLcKveoj+xyYN/Za7D+7JMiNuWn1VHw8JF08H12Oj1L5yEQ6KMCUtJDc+6w
         vyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792810954; x=1793415754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KzYwebK8+EyE5IOADDn5pE86fQ/miF+9X0GS6d/yof0=;
        b=eNzEVlyDbWmv0mupTAuvVUvKc8BhZqKECWojID0AsaORBCnD9tZtQA62qbJ/K7E5sx
         K89Ey6KECTT9rf44Q/xVX2ijmOKD3YxllEmTG1XoPGpuJHxZ7fMPn/NU0pIX6JCX/WBK
         VyP2ITzpKdwnSpnNrXyuI6x0ZZ47yomG3PONTFDz0lsmFDibpPgxg1QnwVf4ENn11VdJ
         Et58Qw5P6ajMCqPzC+aoF0Dyv0a18u5gQDxZfQjwr4m3DC49Tx9rYoE/EmkoSGKWSrxV
         spXJiu0kzs1LOqigc1I+dgIYn9NrObsxTeN/AASGoqz9voZd7+A/zzGP+M9Y2ujs1twX
         4SEw==
X-Forwarded-Encrypted: i=1; AKwUvBwFnZ3nIX4qHEWjapTRJBV0sgKx/1BIoMXL5hZQdfD/hz/ewEcAqfzqoHiU+6gq8I1lQhLj0LtSma9fEOo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHFi4DW4czEgc5WlcNHDcaXwsWbbadUC9DcJZPJ4ceTOO5orkv
	p7UHrfYLpmML9SiN3YdFpIitPr+nhA1WCy4sXNke2zT3xPqu0681F+91
X-Gm-Gg: AYBFou2i7kgj/mhatioz+7K9zbSWcDDAaFx/H23bO5N7jz9JGScrPbksLMX4u5Ny/hL
	1HxV6+JsWaEK3w7W2bOezjNJo8F2Qnhhyl8hb41E/FoUtOoKfxIU7piSoSdrfT1u/cU1VGXFKUa
	SAR3+7IQkQC4Dk3Ofk+Msw/Zg/8usKJjXbOx1WOuPgwwZzQ6zwHCeaq1MfhukRgDTem7M+BqUP7
	+cFpKx0jj740kwBQ13d4un93z+Ror20/c5Gh71o/9xKGqyfEFCo1QoYMlWw3h2+xMSWqcRwnVIT
	fmj9vdozArAk5sC0cv6jmgTGgk1yDDqQib5yebiJPX2ZMUwrPh3Q5khGJGYLmIyFJXS7+1QcwaQ
	jP5Wts4YxWQp0GGpCpFAqSKyHiFEsFk1ggebkeR5azN0OFi32rA0jhzmsu/HU/ufTmz+MBXEjWh
	IOOA3mx1es/u0aVU9ajo6Ytl5vJuUmf/04I5qC5g7XNi2wiBNeYB8iD6ISsgmHeyZ6GfLq6bB2q
	OI7CjJEWOnaK/vZf2Wp02V2RWq6frALHDExx3eyzjmPJMZ6PI7q9+pp9LCa+Rs8MJ9wfg6J/1E7
	XJ9Z
X-Received: by 2002:a05:6820:5611:b0:6cd:3fdc:2669 with SMTP id 006d021491bc7-70ba14bc3bbmr133916eaf.42.1792810954300;
        Fri, 23 Oct 2026 20:02:34 -0700 (PDT)
Received: from jeffmr (63-152-17-145.cdrr.qwest.net. [63.152.17.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e1fa334sm824552eaf.9.2026.10.23.20.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 20:02:33 -0700 (PDT)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
	Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v5 10/11] phy: qualcomm: qmp-combo: Fix Glymur v8 DP PHY init and configure sequences
Date: Fri, 23 Oct 2026 22:01:35 -0500
Message-ID: <20261024030142.13643-12-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001-glymur-phy-v3-v5-10-3848c2615d5a@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-10-3848c2615d5a@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 01 Oct 2026 15:04:27 +0530, Nabige Aala wrote:
> Update qmp_v8_dp_aux_init():
> - Add CLK_FWD_CONFIG_1 initialization (0x3f) before power-down control
> - Replace PSR_PWRDN with LANE_0_1_PWRDN and LANE_2_3_PWRDN in PD_CTL
>   to correctly power down the data lanes
> - Correct BIAS_EN_CLKBUFLR_EN value from 0x1c to 0x17
> [...]

Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
