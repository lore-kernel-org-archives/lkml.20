Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793450277;
	b=qrL4EUqKMx+olfgrnZlQPTR19kKTE38ttf9q+ZNpCXmSd0wUcwgdrD53nKf8MyVhYGSh
	 Ofsk0BsI6V7GmB4IHJYcbveaWB/pTkYSoyktvBTREtgWoslUUJJSsxdjZ5CwKgrHoR1ui
	 4BeiopT6EkJtfj+S+879Sizmk/Z/Pdvis18NRhZyJnb4Q8lk1ZvqxYpSXWY5vA9nNE6N5
	 8VTBNDCsHE2Gnrdv3S9xoFPKX0sAHDDp8dvKAFakdb213pODt6P/9zGDGfBtSgnxglUEW
	 9jNFQBcNWedfj6zGMnu7pR1MambvNJ8jw5e/+UftciwCfbEb2rnuYfWtD77CRpvyzmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793450277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PX/w5mj9R3qkptDA+QYolfzSb7nBXSDEWkIWU6gsyAI=;
	b=cSaccL1R/YRiOPS+tlyCP7Zq1bu47Bz/36DynMotbp2DllDfGhcMQXm716NHVoWEEvIY
	 XBj4umzzjWY5KW8BTfJFNIJon0YEpRyeZliydG5q8K31AbW/5gRozs7MXNWScE8scYUtH
	 EE+9QqJoU94hkqkKfIHd97UHgsfE9FSYYH6IvW1ngc9RWPJ1bf6RGj3YXibAzb1DXq+Ii
	 9qAqG2mWIRgx/9A017NlRkQP+4G0wPysyXfEbLBkLU/EsSED4rVzHkHc59JCvTpX8nWrE
	 usb9X8wXir1iIalUFBcrPBEsEz4rzS1YmWv+aP+3B6y3pVfdqhGXnI2CTZHysPDgkDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GIapd0vK;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D672E606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 12:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D672E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GIapd0vK
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a3c08d6928so2077018c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 05:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793450276; x=1794055076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PX/w5mj9R3qkptDA+QYolfzSb7nBXSDEWkIWU6gsyAI=;
        b=GIapd0vKx/2mPeVtvd/1JjMJO/Q3LFx62uc9QCJus5BZgc1tTNZkaOxr6LDDHwNNV1
         YB1hL3u20alf55Y+djSl/+I2Y2qZTPcZdG7LKHjGjgCFcFtlJWYNa7QKD2qk1J53FEyF
         WqE5VttFOLtyZclRbAkPporkGokYtlgigDbsYergx6yMwpF15KQfiYsnTi3itIVJQG9y
         SbyVy7c+xCpATPw6FdjjQa34SuLAVtVXf9TR4Eoobqfm1N+E97zeadtPiUYGJZdyqZow
         rpAprqVNFL2+TwRx7H24RkSGfIxbEpB1bUIjrdIihVRQkWgSANYQm+Orr7TQx5LdoXAC
         +wMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793450276; x=1794055076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PX/w5mj9R3qkptDA+QYolfzSb7nBXSDEWkIWU6gsyAI=;
        b=Eh0I2DmIOhPKHppokNb9pxSM9qN/Uxk0aY0Vw9yKnPvGV0sU+jeqN0C7+94FEtFrq3
         20jw9YXe1OMmxEacgXGsR+tRj4p3ckWvm70Xh1+IWpdI+2Sn3Ff/ZkKmbvJaVMmxjxXn
         dklaHtaRPRJZNQTyHGcgTLenL3pG+iz2WOipm+Q+zhMgwbBcLhixCibqzzP00lfkZlOQ
         fTdKSKLzTatIFV7mop9hPy+LYa0DJRbiTHYK8uwwzt34mcaAQ3Qq+qvRjySZgZPwzk9z
         UUpPee5nIxm3Si0x38LjtGo3xwIKjHQKD8z22sun5/XZPlKsVANuxEpcWPfwQCoJn3YU
         M1Wg==
X-Forwarded-Encrypted: i=1; AKwUvBxTH1QR4Walncoq7YrkkO2MYXZZrJxV+jMvzKN1vQkhJKLvbMIWneC+vFjL7t/GwSKkY5sOBY4auPmhl7E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKriP87rkdm2gJHnwkOJME5sVaNw+FIVeuFy/Xl5WundKkAXPaC
	dc9FqnnEhkXIRiZVQX1nq507WyidkuWcMXHhVUXbWt6DgNrnoDGyVke/
X-Gm-Gg: AYBFou38Cu67+jbFam/NJuE0mvae/xVU/Ik9sykfnoxfU+hfikovipi9DlvR0fzRNLj
	uN4mXcb6sXJzaJqUUxlrZbV/Ycn/bxYr4L2qVOzFA+gzde77TVR2wCoWqhLOZoL6Ig1Gp15TvEJ
	oENj74IsQBMevTlurSJVgQFBheVEZ897feCFJbw20sxWqaKe9g/QfWjZwhmXzVdWjsq+J/kPwpu
	13jsGkB6wRtl5z9aiOY1Mo/qoiDNNmevcRoqxK76kVu6don8U6Zc3U1aS2VmX2aJdu6WhWwvSV3
	e0DVnl4bXRryWPW+VbcK8Bjhae5zSgQc44UHYLW5liSAkWumNY3uZZlIazrOs0zV0T0ULFnwY1V
	DJIvbA3ztNT/CIDZMuc8yq6+jf5ZDlHQ/FdqQpPzOti4+Hdb26LoxHUwXhSRoiaAXcWOEuIfMxS
	/P04/ouvZOrdkRUlOh1D1Ds3emi7iaajqMvx8cT8pZw8K4rDoJnBrjZ3o4/g9b2O4PFgNqhkJX/
	zPdUBQn1NzN5avOZZmFI03QEDCdjLukfqqVrAH61+5WoVYL8rnhkRVdZ8O7kMZ+LZZeePqdjTI/
	3FSymMpyzNKK349EDEMeukmBfzU3wJv5ODpYpRMUZ63A/maKpw0260ki/dz2S54SBtnZJ1kc+qI
	enVvjg/1NmIxoypxxvU2CXj8xck6tgv7BmcruGaYjX14WlQerDsQyVUqdf8QDpopiCL1h+JPq8/
	3uIA0nxNNgH2fQP+nUiULe1Dw0cAOgfoXuId4=
X-Received: by 2002:a05:701b:2094:10b0:1a9:f3d2:6262 with SMTP id a92af1059eb24-1ac5d69f68amr7196755c88.36.1793450275760;
        Sat, 31 Oct 2026 05:37:55 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a13652csm17300763c88.17.2026.10.31.05.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:37:55 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Samarth Narang <samarth.colleges@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-serial@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] serial: keep the flushed TX buffer mapped until DMA has stopped
Date: Sat, 31 Oct 2026 12:37:47 +0000
Message-Id: <20261031123749.3783352-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261031005425.3351240-1-samarth.colleges@gmail.com>
References: <20261031005425.3351240-1-samarth.colleges@gmail.com>
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

This series addresses the DMA buffer lifetime issues in amba-pl011 and
fsl_lpuart reported in the parent thread, where flush_buffer() unmaps
the TX buffer before the terminated DMA transfer is guaranteed to have
stopped accessing it. In fsl_lpuart, the buffer is unmapped even before
termination is requested.

Since flush_buffer() runs under the port lock and cannot wait for DMA
termination, both patches request termination while holding the lock and
defer unmapping to a work item that first calls dmaengine_synchronize().
The TX completion callback leaves the cleanup of flushed transfers to
this work item, while shutdown, and suspend in the case of fsl_lpuart,
waits for the work to finish before releasing the TX DMA state.

Both patches have only been compile-tested with arm64 defconfig, the
relevant drivers enabled, and W=1, with no new warnings. I do not have
access to PL011 or LPUART hardware with DMA support, so testing by
someone with suitable hardware would be appreciated.

The imx driver also needs a fix for the issue reported in the same
thread, but requires a different approach because its TX completion
callback unmaps the scatterlist unconditionally. I will send that patch
separately.

Samarth Narang (2):
  serial: amba-pl011: keep the flushed TX buffer mapped until DMA stops
  tty: serial: fsl_lpuart: don't unmap TX buffer before DMA has stopped

 drivers/tty/serial/amba-pl011.c | 54 +++++++++++++++++++++++++++++++--
 drivers/tty/serial/fsl_lpuart.c | 53 ++++++++++++++++++++++++++++----
 2 files changed, 98 insertions(+), 9 deletions(-)


base-commit: 36aad21d50d1af3f6954bb0c988257a908202477
-- 
2.34.1

