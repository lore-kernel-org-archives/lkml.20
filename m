Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6C0437861
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789912314; cv=none; b=KomBcodknv46RZ4SKgAmyoXJl/F2h3Fg3V5h8L00ughljsfCb0Jlfg56eNNzuGJUTmyuG7U5OsgL9cTKgqNmRLoOVdel4IqM16JwigIJrTRlvpmMA25ZOLseDvNGdzlFh45naMIdJvAsk8GS8gpXTKJKwONyRbUDbRF8UQLDmkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789912314; c=relaxed/simple;
	bh=KrFLy4WtI52x3tGQmudiPQj+AzMzloxY/Uf2tz5humw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=axLENbYMdRQxMTn+uaX7nA/G62b7PsR27BKr79FIl+r4TXsSysnvrZxBMmY2aUNGNElGTwm9QGLAJ0Qcn/nFWdr/IdMediHj2Fr4d5fqloPToi2pBjoavaeQzDVE85OGqvMUU2gDI5mT6s8A4tue7DD8ynPbXEbUvVgNvZw1TiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FB4OsaLX; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FB4OsaLX"
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c98dc46a95so1648271e0c.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 06:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789912312; x=1790517112; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1cZcmuhfWNSOMdpLlBrDH5176HCDVCbPGuvF5u8I7/s=;
        b=FB4OsaLXs0kF1pBHL1anSrXCMCg05N/d5H48s1i+m079H5/jpkm/AUQI9P+BDDNBaf
         tARc5EbXjFeht+/NbAtt/9k57X3HSM064KlS6t2XEmzB4ataIGlkDrVmIvhYl52RpU0d
         gjShF35W8c9LmD5/PoMFJ9kjyqTVBtNLCB1DTinXzxOAP0egGDglRzystOlW5Q5KpaTs
         vvxhdpPhAFEf6HJ5n8zoeNUY5aquYT44jESujM8WzL5WcPhCo/qIGcnrqvel70BofTWR
         5YpQnWqwW3HJOh1oqf4XZjRXJWeo3sVpqXG/QpG7IORXnm0vJcjvdHw9hWS543ZzJhTE
         yGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789912312; x=1790517112;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1cZcmuhfWNSOMdpLlBrDH5176HCDVCbPGuvF5u8I7/s=;
        b=FLaO+sBSI6C1WTsAA/0HhK8bmKpd4RhM9xKNBauTQ0AloMfLdMcMwWjCwwQ9gNXp0V
         5GAPrbcSsdgeraHUTyTiqYOHrJS1nCoEMB/5nCKYHp4wypeRHLA5gsXhfni3iFnTUW/L
         cOYTvmcgPZfd0EBj4V3SHAZtC15jIJNTnnDRTYBDGTscA33PRR2RGkJo+XB1mvrB9DXi
         Z1XALCKLRVRgIW6WtMZ6CigKlByG1MyHDW6mFDpMfKdIweu6cdNC0bVA6NK8PB4l0CXk
         YO8g6+IcuBC3cW1Pr1pTiZBIhfouArQvFaylJbpd5CXMHd7r5Zc1n0a4YqrVxiwkKD55
         5gUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtH/nbDdRtqDqITl3Bklf/njXLCgAMY3pwAQ8hyI19MZsV5PfA4BdgW54JHstoioYDg9xPLYzpV2x5hP0=@vger.kernel.org
X-Gm-Message-State: AFuF++nFfUwmaXk0D+0r4smsyjMIJasuLth+MKLqYvk00AJuZkZNyrWy
	/0lIgDcDzNGa0JBS8/lJXzOmHIZNPbVUSIdxXiaJADDcT4vbULV8QsDX
X-Gm-Gg: AYBFou11XXd/4k3hk9QdMLPAu8FTnW/iVPaXFrZGDEYJAfTnaaqPtNNMTD4F3A4Su7M
	EZfu/ZfF88F6HuZZD70VMosWdSZLWu/G1XjmA9fC5562mb28uzyV7567WqSm9VqKiuAoN6Ck4sm
	yLPJbCPg5/Pl6zZ8NxCEzBcpPygeWAWtLRYhEuaShL3ojPrDzA4fQx+GabEW4ycvc85c5qT9S5z
	AxiFHdwSZzvwwDqnb+2rYlPt858qd2l/Daoi23S3xwmd0rsyjpM/5SWGTwIjEVKSQbVl5hMzpHB
	39EKJu4k2vEY70ax8ghFR6Hi4fSk6nBjgOjZOL4OioaLWqRGF4IJHdrD+/xplqzvAfCxvaMnNxG
	yjHU1jQcvhxBgU77Fv1nRw0mAkyARpA4GPXbpyh/QutZL1R6xCDNRCZ6CdM6TaumYU1G2zVgSNv
	cJ7VhilwuhdJTnJFuHT+fFjFnyCI/jFAQv4RM+rbd0VF4PrR7jMTVOSSDEoxYvl0yzaOSc1vMns
	tWr
X-Received: by 2002:a05:6122:2214:b0:5c9:a60b:e5ab with SMTP id 71dfb90a1353d-5c9b59a2fd3mr3984408e0c.13.1789912312321;
        Sun, 20 Sep 2026 06:51:52 -0700 (PDT)
Received: from localhost ([2804:30c:96c:bf00:7844:c38c:894:4054])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9c1932ff5sm4511630e0c.12.2026.09.20.06.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 06:51:51 -0700 (PDT)
Date: Sun, 20 Sep 2026 10:52:57 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Kanak Shilledar <kanak.shilledar@axis.com>
Cc: Henrik Grimler <henrik.grimler@axis.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>, kernel@axis.com,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: Add InvenSense ICM-42370-p
 accelerometer
Message-ID: <aq_lObgrI7uAi0K1@debian-BULLSEYE-live-builder-AMD64>
References: <20260917-b4-inv_icm42370p-v4-0-fd9373f123c9@axis.com>
 <20260917-b4-inv_icm42370p-v4-1-fd9373f123c9@axis.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-b4-inv_icm42370p-v4-1-fd9373f123c9@axis.com>

Hello Kanak,

On 09/17, Kanak Shilledar wrote:
> ICM42370P is a 3-axis accelerometer. The device can support I2C, SPI
> and I3C. Add the supporting devicetree documentation for the device.
> The device supports VDD and VDDIO operating range of 1.71V to 3.6V.
> 
Patch 3 says ICM-42370-P is almost identical to the existing Invensense ICM-42607-P.
Instead of creating a new doc, could we have similar properties for ICM-42370-P
by extending Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml?
The updates on the other patches keep supporting both ICM-42370-P and
ICM-42370-P with the same device driver.


With best regards,
Marcelo
