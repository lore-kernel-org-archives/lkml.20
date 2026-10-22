Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792641160;
	b=wiwVaFOw+8HimiCbbyL7L3yWy0Z+HWqkN8E4nUfDJyepHBGQps+LKTK8IbUlx+wWsxeI
	 CqkZ5W+PLv40+fpmnZgwSpupVwjmMrgVQX7Lm8uqR+346P+WhPul3EnmOfXMuL1zWn8+Q
	 TX4vXsjKXY+7+FTHdrYZRI8bAhWtMiFGAsc4wqQ6lqVBcklTV+QGX7suJTgOBVqvdD9dk
	 PYkMOB5MtxpZbNdxkdpjJDGCcezXmd+0gTOFIsHHpbl1bIlG+wxtKyMZLIvD7w7yAZKnf
	 J4erskbT64RphOEQB+lV2gnUzAYiw6nJ6sor9oyegGk5oeROVw/OA2BCmRxZvKmidcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792641160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=m55ckm2hWwRwlWXje/91Y/X/pTafwYoOrwnzD1J7sek=;
	b=rgcM9sV2M3x08yHE3o8i+Eu+qttwx0kYNq+0kvoYJ9SBqS+/7YRSvlN6wH3u54fMvCDK
	 gJpx8OPihEXuH3Cpa3X0Ux1R8zBcJzgtJ2bXzKopYaVOZcTXStBodxAgtxSUyfE893gTT
	 ceXP9DJsmcYTtkZkUl/DaFNRcGOaxTM+F3FQNIMPFDb0H7T9SrQhBoHOx2YNWqd2SpVcS
	 QPjZ8qbnjWs9tV3/IuT+JeNmXlVEOMW3KeiMSXwGOR/8FnquiaQYtd/KJvaxUQRuyMl9c
	 jkAFigAIQfHuiCu4offDglHvRoJ0bqFXQLcWlr1lkQNWqjXHzoqQ8K9R6D97GQO0bbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3311606A324
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:52:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3311606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ad91684554so769444a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20251104.gappssmtp.com; s=20251104; t=1792641154; x=1793245954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m55ckm2hWwRwlWXje/91Y/X/pTafwYoOrwnzD1J7sek=;
        b=o4jg0qH9RepSu7e+y05SP8CWFOwSfBHhQlE487zCf4bGf4DUd4KTlCdlvc+jsQYlJx
         +QWa0e1dnazLwmK/hO+1aYt97hIIMszuKmFqEl4YtuUI1LySb7wUyNC2QRMfefBv6VQw
         Ipmlf5A+0CFM+Lk8VlxOTV2zQujONn7z//HXM7/s9Z10y4Y1EBeXI333ziO4dD6lMZJc
         UqYDwlvcfI7OXBkp8XxxX93gH88BoA1gA2WWwexXH4pnjtrmAFiVDX6uA8h5Y09OtIhY
         OO2aExVlI5/f214dwqGz5j0aEXTFe/aabGskJZK99bBaNPV3AhzRqtsvBNHIrWw+fGqb
         mMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792641154; x=1793245954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m55ckm2hWwRwlWXje/91Y/X/pTafwYoOrwnzD1J7sek=;
        b=wh+aOj1ARraUdErJ/0XtFiyce4DLZPd7GTqugO/A7nIy/Wsf7fSqYilDFmQix7XcnO
         Br+C/HbzOFFUheDBHWfxUkKvs0cRoVUwObA2AfpEGP0AbYZ0xcrTuKqPk+dMDzw0cIKw
         IEFvntJa43ipgNYYiPdPhQtTFU3Krqc6rB2V0SYee4ren0GrsNZ6YnkdSEA9qZwh25em
         RcOtmchva8inL4onVusZgWE7uoDC/DvwoqkH8jEyJHo8YolnRpsqouDuwaOsyCibjAWh
         zU5TbeRV2dY5Qr9AjRRiB9BdQ7KonbsFBOtLfZEoivC9Il0PjWJAG4oC5ms66pIFUhTN
         OfPg==
X-Forwarded-Encrypted: i=1; AKwUvByd3Rh4xjOla4f05vYi/tuKo0/bOJb8ThDw0ErphNgZ27YkNde394vcs7P1KsXrdxYtJri9e4s7Y5sgG98=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGcQZm4dUHSG3coPrZps/xpuQtb8ejK8KpMjhnEGVRcGvMSDEe
	2z5LThSrqWMhWN6qXHAhHRUE7smH1Bd6/hBylwLW0hvIPhGpWjh/TLyqNM7PUfllZQ==
X-Gm-Gg: AYBFou0zFaSuVq+TnqeZcY02jI1BKTBB4VdExeGNwO86X2Z0AW2hsawaKa5VTThc0is
	ApPMnWuQOUmU7EYNYy/EWs/z9rWTmMJ/TX0+WxtkGgKMA76Ke2qhji+uD2DX+4b8U7xYtxmSuXZ
	B0bWVHl2+0VNK5spHlOkB3tbMtD/AYY7P7n5u+2/Bn/yggKRKK7f8+j+N6KIBSkQ4EB2uPhe+c/
	/qxopdtQWBmRsRwu+4lH9SgQyKpkkmxG4RGamBtZ8NKT0PEgzZgV67MEP4Uy1aqqcy0HSfZoIao
	uV82kkbIbohxCIDkmxf49LluyoQR4bF0XvJLYJZqVlulRyqxO07Ai1srNbVTj3S423fD2u9R806
	3rugEKgoL4odWF4VlqzAwrIrEzL8hS/yNeS6ESl1cjZz9l/Dr1nxk1lIix0IXLN4wMtrqkwRTB2
	6o28XE6JuACr96W9UYxVbe99H5vG/WReFRy/cRPtoK8h7scczmTmH7BWzMjaAMHC9BcwzRmyui6
	2WaOh7MZSjAVurbPRbiBkbrb09tvXbCuRPGUAAEAWh0UauIJRvZ7RG/iPGlKKPcMeS7qaeFEG6d
	hSI9fW+8xGN3CRutElTaxR9eLIIRrZtuEUp6hGSc1+/5
X-Received: by 2002:a17:90b:2886:b0:3ad:818f:3daf with SMTP id 98e67ed59e1d1-3ad86ee2eecmr3201690a91.14.1792641153683;
        Wed, 21 Oct 2026 20:52:33 -0700 (PDT)
Received: from cantal.lan ([58.136.73.153])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6b85d56c4sm588649a12.16.2026.10.21.20.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 20:52:32 -0700 (PDT)
From: James Clark <jjc@jclark.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Richard Cochran <richardcochran@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Chintan Vankar <c-vankar@ti.com>,
	Aksh Garg <a-garg7@ti.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: ethernet: ti: am65-cpts: fix support for PTP_EXTTS_REQUEST2 ioctl
Date: Thu, 22 Oct 2026 10:52:26 +0700
Message-ID: <20261022035226.1388675-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179264023362.3135.17895429756190814680@kernel.org>
References: <20261020003525.1237742-1-jjc@jclark.com> <179264023362.3135.17895429756190814680@kernel.org>
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

On Thu, 22 Oct 2026 03:37:13 +0000, netdev-bot+sashiko@kernel.org wrote:
> Before this patch, supported_extts_flags was 0 for am65-cpts. A v1 request
> with PTP_ENABLE_FEATURE | PTP_FALLING_EDGE, or with both edges set, was
> accepted and reached am65_cpts_extts_enable(), which ignores the flags.
>
> Now the mask has PTP_STRICT_FLAGS but not PTP_FALLING_EDGE, so those same
> v1 requests return -EOPNOTSUPP before ops->enable() is ever called.
[...]
> However, the commit message says:
>
>     Only the PTP_EXTTS_REQUEST ioctl still works.
>
> This suggests v1 behaviour does not change. The patch has a Fixes: tag and
> is likely to go to stable. Could the commit message say that v1 requests
> carrying PTP_FALLING_EDGE are now rejected as well?

The sentence that Sashiko quotes is part of the paragraph describing the
state before this patch, so it has no such implication.

With this patch, PTP_EXTTS_REQUEST rejects a request for PTP_FALLING_EDGE
instead of accepting it and reporting rising edges. This is part of the
purpose of 7c571ac57d9d. The equivalent bcm-phy-ptp fix, 3200fdd4021d
("broadcom: fix support for PTP_EXTTS_REQUEST2 ioctl"), made the same
change without mentioning it.

I don't plan to do a v2 for this.
