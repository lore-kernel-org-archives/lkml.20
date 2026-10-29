Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283756;
	b=hOzVcvX6u6lJNc62bYB1g2KcLjzPAQtttZU5nZmBUxeeNMKxoW34YtOpmBt5lbo8PGiK
	 7QU4zWuoK1g8n9CqWSFKfGkZFo8gTDCGkfsjc2VMeGv+vkWdZqescBPZjXY0ZbGB9jvw7
	 bTqkttV6Z24jO70k0zgCMP1C91xQB/Q1hB+DEleDZeZM3h16CxfLbnlevcL6Je1Kes2N8
	 rrteZ+1wmd6YFZEZM6Athirc8/fx68ga7GJWL4xy0wKFDyXZ0chD0RpHVykdUpH6y3ac3
	 MJHPVUnIO+jc6xQ0FKzK5qe+16Uhrook5+TJNcoepwoT+WPsoFZikJAz9hzOmTUEwuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=u0K9x4xKKo7OLyxedAFnX+Mg691NejjhQmXoNihJhik=;
	b=Cx6n3LMC60Bhzw6XIz5eOKBbXQgGHgVSSnNdQZVdYVBixi1NHaqsa+bFhLSFcUYSNC2J
	 PYATxiy80de4PUoajzPFWs1vwl3wmvbk6FK9C0cbEf6U4X/OJ4dkXe5Yz4s076XZhQUpf
	 nOvmkRfz/4BgZjzuoOhIXF/ay1JhXB68Py8hJtmtsAHKxeNCSNeGA7JFLlmysfL7Rx4sa
	 bUr+HmX0WWLjdUHNLr4t6H9u1MLHw0D6d9T8Cc/YylsLIFFTABngy8f57f4+kmTePyaZw
	 SrMbw1liHb/GerV8hgQV8/hi0bYpJLkKDt4PObpss6xajHEmmfpM5euZgTmbM7EqkXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EuzFi0jk;
	arc=none smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57583606A322
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57583606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EuzFi0jk
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ab1a37faaeso2864951fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793283754; x=1793888554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u0K9x4xKKo7OLyxedAFnX+Mg691NejjhQmXoNihJhik=;
        b=EuzFi0jkbVYVr0LrRKUy+uWMKqPgS/L43tKbb/HTqUE08NVOQKvgCLZVE+6VGbL+qe
         QMLLPN2s1qoJASVPGTRSKG0+dCEIEmCUD4sQkmtym92VIo2M+mPSysBM+CdTtrYeKU1B
         iRKlKe6HQ7YpcAkRENH5YDUDUU0y3xShk/87x2JM3DjfNpBrfUkmc8B/WyBBpARyMDQP
         VFFifcKZwHOKpXh+6FHRIE2Ze1CcWsYmU3RSHxqrouRc1Os7zrcZypTU7b9JtuO8JB7K
         lrOytrwR29V+g4jhWH+gq0eJB7yo0PLp56uTQvvwwTaPqmdMEaA0X6tKoanAdGlP4pyl
         VSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283754; x=1793888554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u0K9x4xKKo7OLyxedAFnX+Mg691NejjhQmXoNihJhik=;
        b=qKnwDwzqkiyG5sK0C7jfdfwQHtydRa4D6RGDNMOaE66MXTHMliJcNSHtkdumQ1tIH7
         9EMqxmN+stkIDleLb0Yb/krUbyeVQvr3sVevhXITXrO8LpKeopcFyQ5oPl7E7v1fiGN3
         X3Ltm8tzEeShJlh1bVnxeu1cVoKQxjhHggXCNfVymHtxGj0eOAlXm3AcfHz4HAsVOVnR
         x4ZBm4DoaMffne0nsVNfEl6qhc8zlaa2ps9zOu+KXv2HsIsZH+mmoalBXxnXGZp9Ax9Y
         Hzrip0rIVs8XzS3607xCPsaCt/ozkgIKuIsqCGBWtXT0zKDkJoNoESJnSN3nyG5uQ+R5
         U9Eg==
X-Forwarded-Encrypted: i=1; AKwUvBzV5klWLWeTM3FUNzHoBUCLPZj4npkrrPCgL7fVJ8j8g0tMDy8zyucXvX/tjvipjCdYv8r7tj5PzKmWa2Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpYNWjkHMgFfL/HHelUQxBlmyPiMFwl+V9zbLDkPp19E0i+zpZ
	ByBydh+yVJ3mMa7WAQ8jT12Us9bainpxM9P/WIx1mEbhDzbsE68vOLdv
X-Gm-Gg: AYBFou2kgrT9gv7ylbcx4Cdks3n1Nz8k9Wf61NH+gi8isdQCPKUdDTbZrvsBMQX6LY3
	NSE6VyhLd1ZrWR8Tz4QNQ/mo4DoJFvEVQ8O0e/FCsLKVjTL+xp54g2xsG4mEzvgEwgOb2g3GOfE
	vRarSZp6bemPS216hOdAot3FVpwLFT/k9Bzt3x6LrNXOATmU0NLJEHMKmfXprh4QAlXgqDcvsK4
	EcI+caNPdoNVCMb//0zP9oj1iv4fvGEE6JnjcP/f5+gG/1BmSvQL0My7zX2gkQACu0371C9iTWU
	zZvx2gRi55809yoUFU7EIoPFQAVoxdCymn1ozSTzs40iAvlZg/xl6LbtDhJd944veAyYtrHNSOa
	wO0il84uub5WCCcqoUE4yllfZw+NKZVmjHEEUg4lm0QzoARvOSsOTpSW3UYv8QCenI79WDbHIYd
	KdxgZjAz/mfaeSoZdFPtwgJG/eqg4zae4ybE4tpnp7GywE/PGQXvPhNowz0YCVWDhzdQJTLvMnN
	RdfM06I3PdwB4FKysQSxDpLs6HutwN3hR6DWFIJ6o+Oa/Lwhz/Duc1Fug+527FL8jbj3BB8yuDU
	Vzh9Yo1schU9t9TUXeTS7nClU33DvH0a10oGMi3Jg3zhVevq8w==
X-Received: by 2002:a2e:888f:0:b0:3a7:812b:d11 with SMTP id 38308e7fff4ca-3ac9cedf30cmr10647271fa.1.1793283754176;
        Thu, 29 Oct 2026 07:22:34 -0700 (PDT)
Received: from L-P-ITAIH2-L-RF.rf.local ([193.169.70.108])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd47basm37558751f8f.32.2026.10.29.07.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:22:33 -0700 (PDT)
From: Itai Handler <itai.handler@gmail.com>
To: mwalle@kernel.org,
	pratyush@kernel.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	takahiro.kuwano@infineon.com,
	tudor.ambarus@linaro.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v4] mtd: spi-nor: take the flash lock in spi_nor_restore()
Date: Thu, 29 Oct 2026 16:22:14 +0200
Message-Id: <20261029142214.3701995-1-itai.handler@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261004104311.2196527-1-itai.handler@gmail.com>
References: <20261004104311.2196527-1-itai.handler@gmail.com>
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

On Sun, Oct 4, 2026 at 1:43 PM Itai Handler <itai.handler@gmail.com> wrote:
> Take the lock in spi_nor_restore(); both callers are teardown paths
> that can sleep and neither already holds it. Waiting is deliberate: a
> partially erased sector cannot be undone from here, and the wait is
> bounded by the one operation already in flight. If the lock cannot be
> taken the restore is skipped with a warning.

There are two mistakes here.

The wait is not bounded the way this suggests. spi_nor_erase() holds
the lock for the whole request, so shutdown or unbind can end up
waiting for a full chip erase.

And v4 still skips the restore when the lock cannot be taken, as v3
did. In my reply to Michael on v3 [1] I offered to do a best-effort
restore with a warning instead, but v4 only adds the warning:

> +	ret = spi_nor_prep_and_lock(nor);
> +	if (ret) {
> +		dev_warn(nor->dev,
> +			 "Failed to lock flash, skipping restore, err = %d\n",
> +			 ret);
> +		return;
> +	}

In practice that only fails on an RWW flash when the waiting task gets
a fatal signal, e.g. someone killing an unbind stuck behind a long
erase. The chip can then be left in 4-byte mode for whatever runs
next, which is exactly what this patch is meant to prevent.

Sashiko's review of v4 flagged both.

Please don't apply v4. I'll send v5 soon. It will still wait for the
request in flight, with a commit message that says how long that can
take. If the lock can't be taken it will warn and do the restore
anyway, as the code does today. That can race with the operation in
flight, but only after the waiting task has been killed.

[1] https://lore.kernel.org/r/CAFpOueRGN2TSNo+m3319qn00p-BYn8w7OQ6OPt4XTcVG63-uUA@mail.gmail.com

Thanks,
Itai
