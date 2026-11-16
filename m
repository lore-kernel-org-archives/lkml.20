Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870096;
	b=iUpCgdZAz470s6icd+GZ04wAjz2HZwTJWQPx6Dw+HLdoc5PX63tngFvraXAgmKCAh/Kd
	 4Ll9vWcnTwSgiw+c40TQvYkBQdafPaTUl86qO23e5fWiv4ZEHmIPlWg8IZjMaB+n7NKnu
	 PWKJAZC5aJp+/k4JbjfBoOUXhqZLlCeEUqrBF2AFxtGudY4C78dK+fkBLMTY6Evz6v8p4
	 ICA5ExiXtZ9Fv2pHbfH3GTjyKldo6diJAz9RYD0bdU89LaMbMQ1YezaXAa0zd0ap2W6kD
	 IdGCAJ7p5R4GF3mkVVN51JoSD2BUcgIWoYo4UY0L0mujc9AjWasf4eUr0KQ+5TIniEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870096;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=i/gP54SVVmklviolBdcVwwsQRp3di1qTxKaCeiKcwAg=;
	b=gjiir+6uVT0iThlmVasviWNeIVL5XSLl5tBfF1WBAUgG6BBUhA3r3r2HvRCW95OQo1S3
	 XDECNfATMdcjHdDZT1bdF617rNt9cluZDg5UfX/YI67J9CEIvE/KIO6vYhoqzDi7O1vZP
	 1LpU2cA+V9xN3I6ENts9n7Nz7jChpt+up4h2SZgQTzsAIy+GKNyUcA4PeVGOPeIDXIMce
	 PyI28uqXDs6zOREAxhXtLFeASXQO+G/xo4QPf3Vx/uh+IiOi611EIagq3lw3ZAzk5Zs+1
	 EX9LQzs6TQjG9pNPLSzFVQAARhYEWC5RWlG1ZA1Z7+ZQ7Y4bmneeDXYUoONKcxZKrLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EGvQ+PEW;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F310606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:01:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F310606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EGvQ+PEW
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cde0daf3a2aso365438a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:01:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870096; x=1795474896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i/gP54SVVmklviolBdcVwwsQRp3di1qTxKaCeiKcwAg=;
        b=aViWwKLObwOyfy3jgy9LNoM2odKapMxFWctUWPdR4nOlCl0D2NkrzDSMKAk6bZAQax
         /N8sO72m25pjWr8LhO8k+9+TMWwNaiCSau455Uop7wneg1JniOrddNZn6Wa8mYiXAXzE
         9QWqqTD2NrVJ9BjpFL3sQiRjQ5turQ6VV+cylUWdvp1epXAUN5BUT3rzpgVczlOpXEtA
         503QbwT23FMvxKvHgT18CCloqfF0eR70rvsBww9gYxKa6NZKlOqPuEGpBGnO36I9AKnO
         n8rB8Ss1kErehSlpu4Z72A0CaMpWHeCRNny/MvnHaUQjAW0anI+IvbF/O7uDxiLR+zTf
         17ww==
X-Forwarded-Encrypted: i=1; AL+hErHzJ1ZK9VODzf9gqQBwgoTIQacQCtUhbfmHYJwEPSonk45OV9Ap9N9qL315c/5mNwEtKBW3Cl0Utb1WW10=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DH7mc2c5Oc7rRNF/6VHlFHyWwU6tGsz66qmjxml4Qq48b1XhU
	QhSadSGmp36IxGho7R6XyqHrYiARfsHe2xkhU/Ox1cdt/qd/6BO3qGyvEFs86xYPs3Jcjj8388y
	hjOUv/csRuiPFhYnC8r8zyCCHtZn7cG2CuTLxBlO9zIekTh0CeIlGSFo2iaXCE9l4EngUNXLRk3
	LwaRWmVjmF3Jt4M16f/3Mqhzs80dknPloUsGUxR0jP0RBjvSi9yMkG/tywCnw+LQMuFFi0DPl6N
	HDbDIGgoEatgDimb7Mmr8NN
X-Gm-Gg: AZFdTZdZ9/oJfjpwSc6yKYHWBtB+wubC352f+Tp0a94znzDr6gyUtAZvZGYHOVMKJeU
	FJqyf0dpK5fMk3LW8Wh1Iob63lsB0rLo489Ka75/Nfz4zVlJPYOtUu0zVhr32o2b69HU12nLVep
	74LmcYHBXh/+I/V8drTW2Bn5bYdFHHjmMzRZWzmbgFPXaZ4xwCqpJqcLk0043jLhHoAR9qID45q
	ocucPgTbukyDd8gDFfKZEP5SdH2LWZZvtN918KbGM5zAcsONUpX79+3QOtjosKZf03dD0i2Xm6Y
	R1a/icXwd4b0Fg0Rt8OQDyMZNOrnkoaIumNguJZwih72WDh/z3koVEAgqgjWyeRdpF8gGi/FkVD
	4LCei4zuCh4/HPleTEFbbj+z7j+SWQtFUOFqjCeJslTdtTTXoaH1+YuCrTFChElaxc/hQoabLL9
	jPDsbyqGQNBAR0rEHL1Pmihgy4T+Z9egYB4Oj05SUu
X-Received: by 2002:a17:90b:5403:b0:3ad:6090:a17b with SMTP id 98e67ed59e1d1-3b1b09f9ef3mr9581661a91.17.1794870095462;
        Mon, 16 Nov 2026 15:01:35 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3ab9f98bdsm584244a91.0.2026.11.16.15.01.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:01:35 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a0619b1fe5so2696620b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794870093; x=1795474893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i/gP54SVVmklviolBdcVwwsQRp3di1qTxKaCeiKcwAg=;
        b=EGvQ+PEW6KUVmi/8QjamFOyWgCq77NKd7EwnHD6ANBvVgE2WTnZz14uAZ155/MjVh0
         ue1pd+z0+Sa/53aNVuzQraBaPlYQZw4QoCXdN+3l8AV7v+HTakpSSpmoj8B5GzR7SqB1
         +ACYb8yZDjzYhUeOQgA/nnzATeWXfvAyDaMPI=
X-Forwarded-Encrypted: i=1; AL+hErGrWQFjkGWDO8A3r/ka4tmw4nrQOZGFYPwTJy4HUJKyhIcPzEIkXIHv+7M5UGE+fXYGIu1yFYMPXholdsE=@vger.kernel.org
X-Received: by 2002:a05:6a00:909e:b0:874:705d:f640 with SMTP id d2e1a72fcca58-8beb677f05fmr8399732b3a.34.1794870092586;
        Mon, 16 Nov 2026 15:01:32 -0800 (PST)
X-Received: by 2002:a05:6a00:909e:b0:874:705d:f640 with SMTP id d2e1a72fcca58-8beb677f05fmr8399694b3a.34.1794870091919;
        Mon, 16 Nov 2026 15:01:31 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2635285sm4446499b3a.44.2026.11.16.15.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:01:31 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dom Cobley <popcornmix@gmail.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Juerg Haefliger <juerg.haefliger@canonical.com>,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/2] platform/raspberrypi: vc-sm-cma: Fix get_kernel_id check, pass NULL for pointer
Date: Mon, 16 Nov 2026 15:01:29 -0800
Message-ID: <20261116230129.1469941-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116-vc-sm-cma-fix-v1-1-2b0f11aa96b9@ideasonboard.com>
References: <20261116-vc-sm-cma-fix-v1-0-2b0f11aa96b9@ideasonboard.com> <20261116-vc-sm-cma-fix-v1-1-2b0f11aa96b9@ideasonboard.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Florian Fainelli <f.fainelli@gmail.com>

On Mon, 16 Nov 2026 19:02:53 +0530, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
> Fix a couple of issues reported by sparse on the vc-sm-cma driver.
> 
> The first is around the retval of get_kernel_id(), which we check for
> negative error codes after assigning it to a u32 value. Fix it by using
> a temporary signed integer for the check. While at it, also ensure
> during error handling that we call free_kernel_id() only if we got a
> valid one earlier.
> 
> The second is a minor warning around passing 0 instead of NULL for a
> pointer argument.
> 
> Fixes: 0d6409fd70af ("platform/raspberrypi: Add VideoCore shared memory support")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202611141042.Rxt6cuNo-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202611141002.jCrJ06DU-lkp@intel.com/
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian
