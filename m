Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5510A4CE679
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674196; cv=none; b=e5Ba5VUC75IDotRtmFqPChahFNI7VaAFtjor1e738mfcMqaxit4fdCFhdAa/jIj7f0VF5PIjFRbWFBBOagl3J6GbYaVd53F/vlMtnBIN4UuhWJCOEcpxaaAam2pMxY1dZS8UhPPRHHHKBeK9X4cbfVgEMqA/0dtu+NlFYdahgbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674196; c=relaxed/simple;
	bh=yR4c/96D5m2oYV+sIt1zs2VIhOzRkf7um58xAidzs6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aC9fFASJPrXmKOPqLigBPcSTpwm6NPTrKTJIp8f5142BvFImXp4pRcOM17vOGiLYMLgdHGQn8a4FtD2St8+fosKWNJSoEJMyKnOrWUWShU3tvaJ3vqC+QZmPOJYDUwZjDRivX6lO/6DWfAw3eD7Rb31g9L0Ht5Xkg6opxPAJQ2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rp9x3kaG; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rp9x3kaG"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8e6ec4d9bso3111087e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790674192; x=1791278992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yR4c/96D5m2oYV+sIt1zs2VIhOzRkf7um58xAidzs6Q=;
        b=Rp9x3kaGFPezog0Un7i8g0r2EtmziA+deW1YfGgSzPI9wzs8kNyF/PHzAnE3AuV9kp
         /ZXl8MQvKZxSy+3BO4cG8o361j2islCRP+ljmHnBt0qaWVLHfe62hHdmnSSs5bIncxo4
         R7jOBKQ18fgNu4+M+UnyBCPkuo8diEMsp2IgVoWldwtt5QsOesSE+D68aJSz2kPaiS1Y
         aOseOpBUNqmVohomL9ILgAk4CqcoYw76HO2eL3jiQ0IruWZOa6LX6p2PyI4STZyKtsQY
         StuJZ/eKUK5EC3jKRfqLQEZA07XcP41rwg7BtjV7SGiEyO23nKnkH9634E7jAZP5Wfva
         bP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790674192; x=1791278992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yR4c/96D5m2oYV+sIt1zs2VIhOzRkf7um58xAidzs6Q=;
        b=JskZ5I7dpB8jZVGWXyaBP0SVA4zFu4en/dlOXa/Trapivgwgd8bbF4PDTznZKOGRfd
         dQYP3mIBUmpzCjCG7rVWiWyZtupjaY1qWoZ2W7UjPXfbWdhw0GsvNCJ2+INtoQkeNj3c
         ooQXeNEZE7C5AhxG2FMn4PLNVu0s/+265uUo32bdi6ibdl5OjixI+Jcdh5TS1rMrKgnP
         JimhOPwt4W7KlZG+V5VQ6fA0JL8SiB7nI4kjcyg8Cv35ng9lguRwBuJFFIYArsWI4qR5
         sC3h6ObBRVyhUpoY2FP2pI2etFhMJueerbbCRHCjlfUb1W/VN2/Wh2XjrWyHJ+3aki83
         GWfg==
X-Forwarded-Encrypted: i=1; AKwUvBxCo/1xaMur37J3fueag5D8cQyCjx1dmYKWX0LjaFys2OxvZCyMge2KSqI1JQQEmk7LqQk1cGLP4wgIDbo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMj9bLiAlaIvMil8yFHwaOZOmFV9adEb4iarC9E3v5Zg5xNfis
	31IPwDvSX/iSBvtjGUGpvdsRdCVSSYCzRQNPChO716z7Ge0B0bC5BOkh
X-Gm-Gg: AYBFou3+HqtPFKh8AOE/sN8jB6LeQCCKqVGghuVKJZu0kPBSd/al+gLJEJB4T7Y5EAQ
	5K6wxEmPRaeOJ3dI78xdXrpdgHyxZtIXxoTtD1fhNcxaYVed8FP3yIrtCAUQAczi6dRSm7NwL6n
	G1I9/j/3bMw1lEJgacax80QkDAEOnI84jr6MS2/oLi8wn1WBlC428CzrMkpZFw7kz/g25vFJEG2
	dnR6dFeLH9Mspy59Ka07Zhllc0IOyQoNjWPoEMwydUr/HFBuvLlh3n3gkAZvjdcXcPEPoIh/YIZ
	xM9lZr7qaoOYDNVoDdeipA0iujfCMIeretVfu6oiTBuQapGGs/EVe0sBo3k7upxtFTzdKzQxX6Z
	pL+p3NFn8yk/KhBsdZI3bd8f1Ul8JF1i3Evz1BMdKIA8eflalUm/jeVsTWVEoROhEYASehw6awo
	c52gc9oKgY3XpaJ8EMSTes3NzKe/SbGhNrKYgeQT15zT/Jp50ZKFE5tcKxOQ5cE+7AcH1LH/tdY
	9oO43EcbEk=
X-Received: by 2002:a05:6512:686:b0:5b6:1a7c:59cf with SMTP id 2adb3069b0e04-5b8df0c6fb4mr5787163e87.41.1790674192165;
        Tue, 29 Sep 2026 02:29:52 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([169.40.47.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9debb906esm1219348e87.51.2026.09.29.02.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:29:51 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: rillian.grant@gmail.com
Cc: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruslan Koreev <koreev.r@gmail.com>
Subject: Re: [PATCH v2 0/4] leds: flash: LM3643 dual LED flash driver
Date: Tue, 29 Sep 2026 12:29:18 +0300
Message-ID: <20260929092917.1782754-2-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928094302.86966-1-rillian.grant@gmail.com>
References: <20260928094302.86966-1-rillian.grant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Rillian,

On Mon, Sep 28, 2026 at 10:42:33AM +0100, Rillian Grant wrote:
> This series adds a flash LED driver for the Texas Instruments
> LM3643. I wrote it to support the Windows Hello NIR illuminator on my
> ThinkPad X9-15 Gen 1, which has a single LED connected to both current
> sources. The driver has also been tested by Ruslan Koreev on a ThinkPad
> X1 Carbon Gen 14.

Thanks for folding my patches in. I retested v2 on the X1 Carbon Gen 14
(7.2.5): the DMI description is picked up, max_brightness is 71 and
writes above it are clamped, max_flash_brightness is 600000, torch off
puts the chip back in standby (ENABLE reads 0x00), and a flash strobe
times out and reports flash-timeout-exceeded as expected.

About the Sashiko comment on 2/4: led_classdev_register_ext() reads
max-brightness from the fwnode before it creates the class device, so
the window only exists when the firmware node has a max-brightness
larger than what led-max-microamp allows. The DMI nodes don't set it.
If you want to close it anyway, clamping the code in
lm3643_torch_set_brightness() against the limit derived from
led-max-microamp would make it independent of max_brightness.

For 3/4, dev_dbg() is fine with me.

Ruslan
