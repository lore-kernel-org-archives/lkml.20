Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807DC31A55B
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 05:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789795702; cv=none; b=I2cLvbFGIFGExS8F+e3g29m6yVcYbLcLrN0m3rDN4JmdP60RloE0wagiknPSRkfA4h5zpYHRbJUoXEidhr9bls2I9+Xh0COSQAp0P0ucHK6zX3wBglTUygmVmwFo+mXy0yNuksjwTAcpK02miRjd50vlRc/rHw7UilDVCIdTc7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789795702; c=relaxed/simple;
	bh=XGSV+AS7zo+eJ8siol0hx4qHIx/7630SuzlQSpM+jTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hKHgUCtR4VfAUM+yeqYeSNWmObnNvlAEDLpEK/+6qreTW1kCgaJaSMPVKXamKfWFw0xBkRsYOk0EyhYG+FaySogEQeD/kGIx4bNd9cnhe0ZQM38QNKph6fys/BYPjqfWg+WQc83ThCq6+Pfw8r45WzOvqejXr95N3jcxT3UFlXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FNz0F4LA; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FNz0F4LA"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ec6185so9216125ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 22:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789795699; x=1790400499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XGSV+AS7zo+eJ8siol0hx4qHIx/7630SuzlQSpM+jTw=;
        b=FNz0F4LAv8/Otzb4JIJWhwJWjSADMcM/P3aCbQ0hMeXa98oRqpPFDg5e9pHCi3Re2l
         bp/63VvKDeEiv29uwP6yXnjlPGmYvlf6TPqbYXc7faCcLo9ZM1jtFPC8RaMMNGQ8FTFt
         kddKklIXO+AmobnlvzJPkzhc4I8xwRvRlwgOk/1M+N3YzH5mVD0sJQBQ4LQ/5fI9Tu+N
         NlD8k3McR02W6icyCrSAe46fd2+7QRfsa1wy2Tj24B9emGAfqsaoNLRo3uDlg9kYFs0l
         AzC8/S+7uhUN4yqy8zOKLIWtJO1cd91mo/877LbIHpbcVjM4ABI4VX8Y984U/Jcqc1kZ
         Nlkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789795699; x=1790400499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XGSV+AS7zo+eJ8siol0hx4qHIx/7630SuzlQSpM+jTw=;
        b=a4kNLNONmpkn/ECOlzi/yFVPRfyTjRXdEfHtpLW4ddYJokyYnc+8546fdfVVjB4yXe
         UI7JXycyXsfBboVl/WBHPXSPiKkClOis7uFmzwopEOUqNEevSLzlrLXZoYWH8XXK1b2q
         VabZBdtXDMj+ZAVAcHKy5r7ZrpZdnDi3eyPhAXKVU0vSXjvR3pH7DVottfCMbG05b5ep
         jO8fS7zGwhVCRTlqurrYkh/MIHw1cqyxIRrtz7GxjU1mZIRMk2EU7/1wMBwvyIkZv7Vg
         zsEjwggSZyMwJTh5IJcgbD4S3PbmIrmGJqiMhwlt2CiTetZjodnMuV4IEK6VgQo9SK4b
         bD2g==
X-Forwarded-Encrypted: i=1; AKwUvByUgaf/5hTwLO04Mdx0yLLYLylqn9sT7OCi6eCNJN0j2PCw+jpXBVf7CxzroxYott0yaSQCay6wpzRjyYM=@vger.kernel.org
X-Gm-Message-State: AFuF++k9zl6J1wPp2tI9wgnafIewTsFrGWQpcCMOiDPgf4EDL7OqeZNa
	qinZADvrqb41RIcLMi4ME9aeZxRPv+gOJEZxS5NaGhuaHjh4QRpXXlsn
X-Gm-Gg: AYBFou1KJizNzxAGshdYxx4iYMCtRE8pjqqDEcU7goH7Ev/UIEBrTFhanDt56ufVYku
	fTHfM2NbSH5OZTIDqD9ql5PsiYsGek2szWk4vFvy/vugtI/Py1hDCMUGZW0RQWFtme19SKd4CKo
	70Eh63w9Jcd9sOGbf1/Upx5OYMLG5Jawx4NKO26uHmQfaOsKUG00Uya0OJvq339h5LN5I4mAOeT
	WxRwjo4RN3HmOs8PUeSnaLBsRMjgPhmB+A3Au7+OQdWEOHTEQOqSbXQbk9CpMYbZxBTtK7bXSQe
	CpXHDuGZeQAf2FsYXBsgL9P17HfI4V+dBX9gVJI6Ogs6jBzytIzplwWppO1aHrvEYe0jPy7G4pL
	FdHUq0O31GizkhOAgArTJQijhpG6/HeLlPXQSUtpuzbAFjZS7SM2pMocfA7vUx0XtA2Fr52P5ta
	u0TzPr2e86kcyEtvKD/bdCpR3qUC1P+HFk8EUETfwUd8GrZ5mzMVOMIpmUtIOU6Q8E5AcNsUD1G
	x2CYPke0rABF/32/kVucc/h5U+YNj56NXaXkWyh5nfhJobD/d8=
X-Received: by 2002:a17:903:2f8c:b0:2dd:c100:4250 with SMTP id d9443c01a7336-2ddc10044ccmr24575385ad.52.1789795698846;
        Fri, 18 Sep 2026 22:28:18 -0700 (PDT)
Received: from Inspiron5409 ([2a09:bac5:4437:2791::3f1:16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc179dc83sm5367555ad.33.2026.09.18.22.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 22:28:17 -0700 (PDT)
From: Jianhui Xu <neuromoments@gmail.com>
To: mail@birger-koblitz.de
Cc: andrew+netdev@lunn.ch,
	andrew@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	hkallweit1@gmail.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux@armlinux.org.uk,
	nb@tipi-net.de,
	netdev@vger.kernel.org,
	neuromoments@gmail.com,
	pabeni@redhat.com
Subject: Re: [PATCH v12 0/15] ax88179_178a: Add support for AX88179A-based chips
Date: Sat, 19 Sep 2026 13:28:11 +0800
Message-ID: <20260919052811.2059672-1-neuromoments@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916-ax88179a-v12-0-60c04c9924a2@birger-koblitz.de>
References: <20260916-ax88179a-v12-0-60c04c9924a2@birger-koblitz.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Birger,

I tested v12 on the same ASIX AX88179B adapter. All 15 patches applied to
the declared base 1bb784eb6e38fd73143f021608e4ef3095d0c0d7. The full
kernel/modules build and focused W=1 builds for phylink.o, phy.o,
ax88179.o, and ax88796b.o passed.

For QEMU runtime testing I again applied Chen-Yu Tsai's `usb: xhci: Fix
HCS_ERST_MAX conversion` patch. Without it, this base cannot initialize
QEMU's xHCI controller. No AX88179 or PHY source was changed.

The fresh functional run completed cold DHCP at 1000baseT/Full without
a reload and passed the 1000/100/10/1000 Mbit/s matrix, EEE
disable/restore, pause enable/restore, EEPROM read, module reload, and QEMU
USB detach/reattach. Ten additional 100/full-to-1000/full cycles passed
both endpoints with bound traffic and RX growth; I did not reproduce the
earlier carrier-loss or carrier-without-RX failures.

I also directly exercised the new phylink MII ioctl path. Read-only
SIOCGMIIPHY and SIOCGMIIREG requests both succeeded and returned PHY
address 3 and register 0 value 0x1040.

One fresh `wol d` and three independent fresh `wol g` QEMU deep-S3 cycles
all passed. Every cycle was monitor-confirmed suspended, resumed at
1000baseT/Full, and passed immediate, +10-second, and +20-second traffic/RX
checks.

Tested-by: Jianhui Xu <neuromoments@gmail.com>

Thanks,
Jianhui
