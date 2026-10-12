Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB1A440638
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791838666; cv=pass; b=PCmIjRmmSnAEd9y65psZZ1El1J2I5T4E5qzlxXeaSDKGRMLU58dvr16nqcCrhhpDCdU7eufjBnARdINU7gtiZ0jNBlV8gwX3OAZm7O5S+WqESaxsvqQDP+VWzHmx2Ise7cP1A/yxPgI2HGMNKUBBw/ibiIHe4PiRTyaSStKLNQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791838666; c=relaxed/simple;
	bh=qfhNpMKikTUE4GXuTXMhSz598q5HToAtxwd6kVZHfsk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gzYMI9TA2DWz6WrXJgNnpltaST7nik7aWqfyJ6rn7bzhtrXuvrM9CE7SEW0mxwDS1SuDRr1NZS25tQKc55yDb6jpti+DyOD/YlONZHxHLPR4acIZ/4gPvoCn8fr7pLl6DNzaYZtgRCmfv5qMqrA6Xc90mCrej1Z7Uc999MUM4E4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bbz16QiI; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bbz16QiI"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bcdab9a82bso2524551e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:57:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791838663; cv=none;
        d=google.com; s=arc-20260327;
        b=OUuurEbx2OB90lbfwqMPOFeH+NV4F9crj89o46zPVo33uogUaxfNjXvaMAq0HKmHsu
         LGwwDc8W6i9gYSiWJPBx0B8cKQT8avRaOCz9bvDi0cnsB0NNHeK6Aq4GEunCiAv97o8I
         Y+ts+LR84mSrSTTSEd1F1UNiV8CVt9NS+ytpCwTQSLfyeQ1SUENkr1RYtbW1hdjR1Rxz
         uYYn1S33WPRWyoPWKwPFUQD/vtwgRo1SHsy7/sWA7tFBH1nmOOkMlQA9yKpRIiEsDm26
         J/CnOhz459LDg3LaLUdk1XmtGyBAdpGniRrY3wfQzVFdTWJoakkRpKmg+0/8Gkob9o3m
         uacg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jLix4JrWc+gaL1YtlKdXsZNF8UYItzc7REKQDH8C5y4=;
        fh=ltGB/jql7pWFDlAWI1rA5+so1YEQXn8Yl1NDKOYkkcc=;
        b=AUytqyZDs7LxzZCwOqY+dB1qIt/3oNSSx5KImZT/8LEKVO9CoshJ/gu26p09wSLQ94
         wDeGyD5v/tM4iZTbFod4HdhlVeGO4HCT3kyYo8LzNO1ngsLOPdRDExpr86SQIwrrWkIQ
         Cin44Uyo9OxNeobRpbfKcPIYELxXTpEwL9yB2pBA88Wdl+fZMyWjdBYpVb+69hKKS/ZS
         1Rx0A4/LFVMucg8j95qTqgEsGeNnC+mAYK4SBhCDodz6VGPq7FVuAdCn/SVDoOk/ZQU1
         o4dRy40SOk1sU9bUHis/0ps2wEajMFKd5VrHdcoVlugLsoIHGr/5gwb8/rPE11VhLQMi
         1gew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791838663; x=1792443463; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jLix4JrWc+gaL1YtlKdXsZNF8UYItzc7REKQDH8C5y4=;
        b=Bbz16QiI9Ar3XCnJJS2neAbkOd1tzEK8qJMur6Va/i2SojzGri0Z/wTNMwdO0kbDDm
         JONh0CLLZJhp3l7V3dbmAhiPsSh+TfkDsuDw+tWbXGb6okvORkv5ccMQYwwTdefC1Uh5
         B8T85pvKrT3DTCkeFmw0HKAF/Kx7mqsXEw6o6nrT0XmTo+Ds/8PrDYvFI0oWA2p+l9oz
         LNtY+KPUlRTFSEbzn5dxe0YBvA5bvpRVdA3S3Mtx5k51shqQmRg4+SWmcjDJ+oZtB7cC
         E791JiFSd+XewQgw2D69Ugr1dCsZBKTw3XQMGT8rRj/PHtE18OABbAAzf6TCElUeDSyj
         Hc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791838663; x=1792443463;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jLix4JrWc+gaL1YtlKdXsZNF8UYItzc7REKQDH8C5y4=;
        b=TmzEzGlPfF+vFeW0HRdaYdKpdVUqQz3RCTtKN5Eux68mJyKGY7UPXi/rR/wOePN15V
         btlbaj5YUmT+SipEWLRowJXLrBK+PlWj2ZRSLgcm9sA1+7Ls9XjswfVzlpnUCBbQ19WD
         s9pGU/D4W3b9i9wXvIuICdIgT0aDePGWoJRJov8esyxr9OqZQn4pyfpu8tSjilXaRHBe
         q8ClpgnaHRiceGwkIK/lqKLIRXNe02fBwBD5sA4CJTwOKm+9bQTx0Hq+AXo5QScJgmCD
         3iaRwuh2xT6Dg2alMf+47ZbNNobc/568b+/7pvUoYZwXMd5Vr/9NqAtL0JXQXzdoZA5D
         xf9A==
X-Forwarded-Encrypted: i=1; AKwUvByLuTmk/KTDBSYBnUb3bbq1ujC1b4/0TRGUAYGquBVEhkWAWyhGSDTa1tHfqzGxA0HymSw5X5NQqR/FeIw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuVFF5Xc+iop2+526CBceHuAoXoeLWmKlvyyZcCOQUx78xKooQ
	WaZnSalGiEKZF3eVSUC+JBg/7PkptdXWLmYCYpI1vNjWlX4nK1UN9zwjWkL9VYOHzgbDXFj71+c
	hikog6u7ML+BIezCrs4js1FS3wJ4cfzM=
X-Gm-Gg: AYBFou0Kh88pcYqzz2XL0hzna4jhx976/IurKmU131zRwnTermgnj3c9ybRlw+4/qAJ
	GAKQcNUF71t0rUCspI3uhl3IJTvmLgoFdtUWBK+UNE6btlbcgYFAeLRDfCSe0vMPktKxMl94E2t
	AMQFCY4sRzCWGIqymIk9VSDaPg9qNY8SRtfBNiPrD0yCcLkC+ef5WlPa+ks4B5/sxRLWQ9jNm6p
	PwgPv8dh02K0E9xDQMQbZ+CIK/a+o8R7dVZQZjH44Z84tbHDSagVG8cTnu8AcZKloHsbCPJIP+R
	tkeyMZIWLwvdXkn74/XAhq8x5uj2fyhujvbLujDvgSb7bQTbZCx4eVLZYg==
X-Received: by 2002:a05:6512:12cf:b0:5bc:d0fd:8c13 with SMTP id
 2adb3069b0e04-5bcde6c99b0mr3562593e87.30.1791838662732; Mon, 12 Oct 2026
 13:57:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009-sdm660-icc-sync-state-v1-1-77b8d2501cb2@gmail.com> <0ee83fd8-dcc2-4666-a864-de52fdef1c7f@oss.qualcomm.com>
In-Reply-To: <0ee83fd8-dcc2-4666-a864-de52fdef1c7f@oss.qualcomm.com>
From: Fabricio Akio <fabricioakio@gmail.com>
Date: Mon, 12 Oct 2026 17:57:05 -0300
X-Gm-Features: AclHuK9R2roF5QsBv8_V9u4Vazf51mZ_EeLjSM2qy9Ih7_PcYXeb3AMjJuQTvEI
Message-ID: <CANxzQdH196iquX=kKFm450W63E6=v9H1N-=OQygr64z90a_11Q@mail.gmail.com>
Subject: Re: [PATCH] interconnect: qcom: sdm660: Enable keep_alive and sync_state
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexey Minnekhanov <alexeymin@postmarketos.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Martin Botka <martin.botka@somainline.org>, linux-arm-msm@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> None should be necessary on 660, except on bus_0 / RPM_CNOC_PERIPH_CLK,
> which is not associated with any interconnect master on this platform
> (so it will actually get disabled through clock cleanup!)

I tested removing the keep_alives on a Moto X4 (SDM630), on the
sdm660-mainline 7.2 tree with this patch:

  keep_alive on    result
  ---------------  ------------------------------------
  none             resets during boot
  all but bimc     resets during boot
  all but mnoc     boots, powers off in the first suspend
  bimc and mnoc    boots, 10/10 suspends
  all five         boots, 2/2 suspends

So on payton those two seem required, and the other three not.

I also checked bus_0: it isn't disabled here, its active-only clock is
CLK_IS_CRITICAL at 19.2 MHz since your commit e1cd74b6dccb ("clk: qcom:
smd-rpm: Set XO rate and CLK_IS_CRITICAL on PCNoC"), and the RPM votes
logged on the device show it held at 19.2 MHz while the CPUs run.

Would a v2 with keep_alive on bimc and mnoc only look right to you?
