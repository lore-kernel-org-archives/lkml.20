Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369027;
	b=REO9di5ApiuBwZY99fNRoioUVl12Y1Yq1+VH57ZFfP28CoB1yGzC/g5S6oLYVDML4g08
	 CtuUR1BElFGsNmwKfvGFCyikcdP1Ptx2b+MoLzsJx6rG6l6GHxaxU0kl/NjxGckpNsX1v
	 t7EDRaFTWhBCr0YWCbTqU6zuOG95r0PWymoaAC0X6893qACih+A2VDmhZ7sKfsNGOfUFi
	 pK2EkzSMYdMkG+Q2RMPBvb0nZWyup4odL/ONLyCJhoWMpBSLubX2A9+hUd4qQv09p9BrV
	 88K0iF7gA51h479Tp3Eyr11HNFVMh1xHuPm9r6y/xKZzngNgzkkSMFcnRnH6Hdwufxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RNi/YV07iESSp5HzRPxOu8kqkEJ5qhQDfYYkAe+T8VA=;
	b=qmUDkmHBzkRWo7lvvjcCDYCFR4XU1tkkup+q7DEIosxhshBK0rDBnjv//vQlNk3tjaRU
	 eHv/HHR9xYYAOVZCi/SCxtLhvk0CLJC6I2RoCOt9QAjK7bdXEiLdtglUoXANQX+7/wBjZ
	 u+HxQ7v7YR0DPPUpnOQioIo6Hyv27LDRRzDztH7r1nxcEb7MJm8VqW70KKJOG5cZVx7Qo
	 lrmNTqczO4wuyNo4z7ldgrBvRnodmwTG5aeVRfAr29ZsScKnJdc5eSqGUiyHPGpo3+TcY
	 GRJKYFEZr+cajX86cfEwQVpkn1j5oN6zXYfIt1ti5j4BRP6o3vWEi43btmla18suw9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=efYy8ccY;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E01606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72E01606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=efYy8ccY
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e9995ce866so6461275ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793369027; x=1793973827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RNi/YV07iESSp5HzRPxOu8kqkEJ5qhQDfYYkAe+T8VA=;
        b=efYy8ccYHATE2WA0wZRSaVlN8TOl1bJEJ/pwwKfOu7DOOKWLhFAfasds2OCArHT+Id
         84hoQgBBMImfH+kgaJN7XBxMxUbJ/yLWe3W+SogXWdXvJP6oLcEOVQCJqfDcIPqXS9gl
         QvpoaRu0KxaKcux8E+xlqIt37lfVM0gjjntcZ0uIrOJRLUOywSYqBQo4mKh66qmIAo7D
         Clnl2+00funikVLTNchh065sDyi9fuLOw80s+ibNFzdoLsIWKUgJj5J9m4yUEWxYNbVR
         srKt6BY1prlXhzgsO30teQwzpNf1yJc87KqdhVRT+vaqvzhD2OhMIWEpq35Q8ohNpm+y
         4YaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369027; x=1793973827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RNi/YV07iESSp5HzRPxOu8kqkEJ5qhQDfYYkAe+T8VA=;
        b=zpS5KtZ8W/KWlRU9OWNj0iTfgTYp3Z61ORv8BIdmUhh1umuKktkMu6gtUQLsM/yMxz
         wHZzQWA8w+S3UoL6twSYQ8t6ZagZw2hOkFkVXdnuOcN9M1BOGQuLGeJY9Mcvqr0by5jT
         vcDTjlbkp45qrkhQO/AxIoHD3qdomROpBaAIqWs1AOGRDP6zRCMAtU3cigHepRIgSKd+
         Ia4EohTkoet/SnA+wwPCCmtJpqnA1NVYZ0esHG19DbDKw8TwucZBTTclZlf1bzaClWXW
         jfYNUnJX/HlNmTHtWgD2vTfPjaGkl4i7V+CMTKOCCqcajvARVbI3ey14Gg/OYJHvSk3z
         WtNg==
X-Forwarded-Encrypted: i=1; AKwUvBwS57dbTJ82IwZunOILMoXyWZix/sAhBK+YEvgV2xzXz57HfRSsA9WA/OflgTukC2cEgK8shj9ZHh2UnPE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSuipWaXIFg550j8n3uPGCnLavBow0IBzKKCu4RmqCD16ULbOs
	RorattYnyWzdDmy/46pAzJ67sqiLh2c/MBveJVPwUWIrHAVwaOWKYhbamm/NDcZu6A==
X-Gm-Gg: AYBFou2HRQ2AVaJsOrhTF4cVG6xShdfPxmdqph0EuVlU4lXtjTAEwEXRIfEEJJI2cz7
	cmszwWIEETtE0SpB+NrK7NKbxtuZb8EpDXLqtwfz6Atm7p6H7tF683QUwCBEiUD1VCH4H+89ayD
	nm20EueYEVNOnFqrEJsOdyh7mRLMaorcUPLlFu3I/x5cUSxV/8wupEGiYTwpFfs0mTZv2nySUY+
	xDbO432BIVe1ffHEMq2tgDIFYRtqVSsFL2qIi4caKzyaM/IWVvnpCsw8/HHY3NjrHRIp7Wi1HUb
	uIy7zMvBZYwTwECPO2Xs9+hkhZ7B/cGYuTNnKlGcY8CjOj8pyRrEx/jgcGtK+8fdaIvC5gRbkgc
	v3cUIwTwnXgvqHm+gRRxaA113X9Tn9P5x3xVy4pKVx8sYU5ljHVTDUynoUs20hR7yJnYfBjOl22
	hG6kUC+7migo16KdTtMsyaj3zag0icNCsUTD3CchBHz1sOYtMiGXdbgVv17U5Qr/KhjC8+7Lubz
	wJGgx9mJxEIQMsRQHJHHLc9PExthSAAKk5G7iid4bWPDr4W/sDxvrCiL6O0Vslf9+OOCirTIk9u
	IvR25stCzxe2AfCREN+TXYjUCWxVmg4uUURKkPNDS4yCJ0N5V3Fa1o+cQg8ED8/JiYBpbTWC6Y9
	P90IDYZtbCdpMIkPd
X-Received: by 2002:a17:90b:1b02:b0:3ad:8769:8741 with SMTP id 98e67ed59e1d1-3ae8957453dmr1915084a91.4.1793369026593;
        Fri, 30 Oct 2026 07:03:46 -0700 (PDT)
Received: from cantal.lan ([58.136.77.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85f3e087sm2002137a91.1.2026.10.30.07.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:03:45 -0700 (PDT)
From: James Clark <jjc@jclark.com>
To: Johan Hovold <johan@kernel.org>
Cc: Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Ravi Chandra Sadineni <ravisadineni@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] usb: misc: onboard_usb_dev: don't defer the USB device probe
Date: Fri, 30 Oct 2026 21:03:40 +0700
Message-ID: <20261030140340.3383998-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <auSdA8MfolA8OhdM@hovoldconsulting.com>
References: <20261030114705.3159093-1-jjc@jclark.com> <auSdA8MfolA8OhdM@hovoldconsulting.com>
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

On Fri, 30 Oct 2026 14:34:59 +0100, Johan Hovold wrote:
> I guess you can look into replacing generic_subclass with having the
> onboard_usb_dev driver call usb_generic_driver_probe() itself or
> possibly adding a pre-probe callback to usb_device_driver.

Thanks for the suggestions. It looks to me like your pre-probe callback
idea will give the cleanest fix. I will try that for v2.

James
