Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792810950;
	b=2TEwoaQcBTH8gSrzvXweSQuQejAWShOzMITLa0U9kEAZ7DLVuzZ+nZVOQ4w6lwu34meM
	 Lu+97jx94acKoLGVynNMiUAM3UB2nOk8egAe9yH1pYYz2mCNO3AcFSizKbG3N63nD5bSU
	 G2xnnjDQcaQ/1dWvWzs7eEpmzL8cF2O62IkfDnp7ylqc1BJ/BU9kB5R9zFn1lM3CJiaGx
	 +hO81PWQG9ebP27G5hnjyJPdf9XA/llSIVuQ5PXTiMitu8wIrxYotMCal6ayjHInJdnnJ
	 4QMkPkGNBB3v+jl5SX6gM3YzeUxaGzlNjV9jpzNauORYDt8SKvSh4pyPf+cIc4t4F+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792810950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sP4ZKsXWKOirRhbwpXuRq25+zM6aYIHZ5krwTSsRttc=;
	b=mp0/dtzikqY9hjgGYz+b8FeChok9dW/asWZ7quJXM3rD+8f0iERWXm0ZrTZhqXsx3hZY
	 C0Xik35qNSEIuY34D3KTx7umv/CKqkHBYFmfFYzYuactrw/VKE7GbR7/8xOj1s0XBmf+/
	 mEIu9nmZx1F5DAGazzdv66mwXM/lC0NclD7fO0tWCFx05EWckOuOk8XPaC5SFQtuUZLJv
	 tNjmi7mQgKlnbg+qIKcqS0xfqf7a5uioRx6xO7R0RSW2gOrQyfp4JKUzGUITKhcFXneeP
	 PtqNM8ODh8BLKawdeNafxOunFNIbjTQ9jPkhIq/LC1fB4FwnMzRyWSImYMSHybQ4Iaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l60hOHWC;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E708060A260D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 03:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E708060A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l60hOHWC
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6d290b10a35so642675eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792810949; x=1793415749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sP4ZKsXWKOirRhbwpXuRq25+zM6aYIHZ5krwTSsRttc=;
        b=l60hOHWCpd8Y3qAoRl0a1aV6WSFA5+FqXW9kPHrnLLoXB2fKIOrLaf0+/+btreYayT
         NDkkL16JETWWDXu9QwGFZ2RvYXyO79jPnBgzhC2t2CeHBMuCb4cdMUHecxpQ8udxby/G
         1LKFKT2WQjrfvBdPZxfGhguGLlPYu0TU+bO1DLPY5VPH3NGwexkVEoa/qU4A/1D0t7Km
         GnAslrEEbjydG6ceVu4yQpp4UNOMzIY4KmZBPIonOsPw9reAKPFHL6oZfU1YOjv1OwbR
         GZeWKwKc9mO8Nm2K57wZlngkOUg7AkEDK6NV2Re+OWBjEW3nKj65XrIXFRW1fj2yVrBW
         SN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792810949; x=1793415749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sP4ZKsXWKOirRhbwpXuRq25+zM6aYIHZ5krwTSsRttc=;
        b=XEDyJazlew43RWesmLEhgeN094YP8jVE6IkfYRpRTxS+qr0b1aYLNRGKtTablYwALS
         tJXfTPNfDPyUOmt0Vs3MzAJaEs/XQpqO6CwNaP7UAx4WKtP7vfKodhOQOqAkDd2VybW3
         GBez7jTcvTVb9WpSgwON54AbNE9RIQlLIfInC3JFyq+lkluRFnlSrwEFxdo8LyovW6HV
         g57PGDNlPX28h7foEDTOtr5I8YdR/LQGvoLgOOrfHgmZMKT5/uzTQqGh6jKUtG4FjCO+
         dTrJ8jfY6Kk06WYMo1JSMhivzW8CgCJEWW5ZOHJwkukoZiWU1oG6Rh3uAA7uIuOnv7Sd
         l39Q==
X-Forwarded-Encrypted: i=1; AKwUvBzgsK9Wvu7PPaldCAeaUJGpCpFPFkgw/1tbL/aztsIGmG/GfbqBMuk78eVcP2XC+Yn3TyGEzrXjWJq43YA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHdnkTBLL8ElXLDQjOAujoNKwaq6uH0X77eWA2DLoOAjowUhqM
	BXwRKIjPBpmchdYc9G9hGc0b3+00hRSjpjvEWXBzCr8cnCJS2nZpyNf8
X-Gm-Gg: AYBFou0PI7hsbEpXnndd3xQR+DTiBd+JQC4wmXLiWh6df3uxil+NSPfMBbQIr1oHiuD
	atqDHcuaJfJljmjHG8UhW15wSIyu41KiklbiJsfwxJ/OUKswY9eL0KE+Vd7qHeXoSpoGlmiGFR6
	zQGJSfa+SXrHxHYyfgDtEjVB+NvsoR4k3W8HA00wM+f+hOkFRgCAJcwPJiQMq3G5mYPfgO+LCtW
	l/j8vdbLqm9BOxERIeMP1wak28/sKEo9+D1PECZDYCkn/YldyoGfFmNe7Eu7zUNwp/FZfKRtKo/
	tEDf3QHtqSNNWc/yGATQiTngg88jUzO1nIVeMS9fbJl/gzeBsrZDaXbUPxd0H/cJSD9TcD6JnFw
	HM9dmwrY4jeQpE7vtu45IzJRVYMTu9hN3cQIIUAvz/JXHARgtQlBLioFyUXcXvQQyxcxG0sK4dO
	e1E1jYgcqf7Zxv5kF2wRbr3xPvGobWt3tLAr3Lx85mRYgENo/5UjoCvcico2KbA3kcQ60Ar1Fr2
	+8uxoaYrCUbY5iS5x7j6xIlBoYT2wdTNWHVFT7f89gZdC5XDfBg5QOKl8T6A1Xoal4B5hWUSHc6
	ZLmxiA==
X-Received: by 2002:a05:6820:c2c3:20b0:70b:8916:547a with SMTP id 006d021491bc7-70ba0f090f6mr264783eaf.65.1792810948906;
        Fri, 23 Oct 2026 20:02:28 -0700 (PDT)
Received: from jeffmr (63-152-17-145.cdrr.qwest.net. [63.152.17.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e1fa334sm824552eaf.9.2026.10.23.20.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 20:02:28 -0700 (PDT)
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
Subject: Re: [PATCH v5 06/11] phy: qualcomm: qmp-combo: Add v8 PCS-level drive level tables for Glymur
Date: Fri, 23 Oct 2026 22:01:31 -0500
Message-ID: <20261024030142.13643-8-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001-glymur-phy-v3-v5-6-3848c2615d5a@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-6-3848c2615d5a@oss.qualcomm.com>
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

On Thu, 01 Oct 2026 15:04:23 +0530, Nabige Aala wrote:
> Add PCS-level drive level tables for the Glymur (V8) DP PHY:
> - qmp_dp_v8_ln_drv_lvl_hbr3_hbr2: LN0/LN1_DRV_LVL settings for HBR3/HBR2
> - qmp_dp_v8_ln_drv_lvl_hbr_rbr: LN0/LN1_DRV_LVL settings for HBR/RBR
> - qmp_dp_v8_pre_emphasis_hbr_rbr: updated TX_EMP_POST1_LVL values for
>  HBR/RBR
> [...]

Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
