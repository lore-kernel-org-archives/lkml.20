Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D81511E69
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750058; cv=none; b=bidc3M8KcpTs8XqXJfsnWdRG2N6g+IPPMI5gvYmJ0eZ84MPtTAlnS+TMeEC8roNANGChWlFgp60bQoq0FQt6VUBIOuTkMrNZEpGm+SNbywaSi/H4RT7sJm3xofFXkjUS4TvrRFn/N7I5xNjbwZhbl58XRHiG2MnAbuLS3TQfQtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750058; c=relaxed/simple;
	bh=9ThTR4usKlllKQeYQGdfTkQcMVtWtvUIwI1QCDrW3UU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=izoVYbk+51SkuTfOUhq+EGMxEPyPUE/UHDRTp5jTHJhQunp+7xshPtPX03eJ7TTKhpfKezuegNicYMCj2QO82QEE0nstlKxvzTWXQ03oHS2VdiN3r6CBhqoKoif8TjxtJuOryFI0kl8iib5bzKpJhQoIL4e/ioDKZGHhYzPf6z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CtScDsP8; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CtScDsP8"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-868b2e5be4eso558803b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789750056; x=1790354856; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n6D3MKECmB1Q9b8DagSOBbCm9EGs/3yp1gtCOGWTpSk=;
        b=CtScDsP8CBrQdP5TYKsOGFtxcVy2oEFbLyoavSeRuPcrxgc/oWO1jL2jg3iAVGD25d
         FlpdaWNeYY29YDVjQ7Ph/88PjYP9m6MFdu8l9KHk83R9h7g/YFpfdXwfWwVdwFepOVJj
         aozDj4czFRxY1dm6jUH/+cg+kUuIRzdp+44mqQSh2Go1B5uinGPoTy8EojQ4eH6B5aMk
         ha2OJOJDgkhgqUXZCjEjiVo5rS+H25Va/mw6PLcFXxVR5q7HsycYVM3tV+cG/E0mnfe5
         KlJdYf12Tpk8un7kg7++TpLMwfkLudprrCSpVCwfeqNzsB5h1G82qxggula/h9FPcArb
         CSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750056; x=1790354856;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n6D3MKECmB1Q9b8DagSOBbCm9EGs/3yp1gtCOGWTpSk=;
        b=zEEovnxXNCDCB16I5OnQkuh6Uz4fbXmqDTRgDWL4cD4+TX2nlCs+VQOz96W4xvbhNi
         gHpOPiWMaIHJ8CBJ1L/ersp0bsD3FaS/yfLPKwFPqmH60hbYMQGoCqcsO/FtqC2MKu+I
         dbeeTolSC9SzLPRQYjSzC566vStPiMXQs+4PX3PPGW8pXWtX5NaVbG+P+yIcaGS6yK6N
         zViHCpIRjk29r9a56QDA1jZDZGQVAqtp0YkyOsNHtK+kiOlTCJyvmo+0fZfwEUgITOMK
         8t9GaEbYVKT9Jr0nRCvqVMXlvGpdXQxMdDxwiKY+4H7m2oi428+GYHJ5UoP7FHUhtniI
         vNDQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3z/GFVeKkABtfsKzzfa77aKqEaJV9FU63zyGIV3qeCwU64yFof6Naw52tuFlMHv8owhwouqHriMAYiho=@vger.kernel.org
X-Gm-Message-State: AFuF++ktiEaC64vE0cHiFOh3DBsSTnIoEnTjSq56ZpDbpRzo2Gh3b36a
	yRSPaGWGkBBi/7OH6Fs1Ecfog2aQPqq7LNF60WkD69lgW0suy6JSRdSN
X-Gm-Gg: AYBFou2cq7wg8Wa2ljLc1xsiVF6ZUT/fJEGgmamC2K7K9yMC/gfn19eQFbv1KBdEtTa
	IGfJtxTZl75GHJcs2nc6SBX5582ZMbdlt8cotuvO687uK1I8fFg/FRtXTLwUUcnjjAoS4zsZXNz
	8NmShAMXSK8Z96x+1ZmrfLA+Np6yLzl5FzRhVrj9I+E67xMc/sXSjkyDLsmt66rhPg5npnIDhQn
	OSJ974/YwnlQU1E04uIbvlMXjJeZ3VtvyaVsQsJugj4roYKje3WVfOV+pfosMDEuUaii+gH6TKP
	hG+IhWZHcRPzJGd3r2kHEAi1nV4/+EqfakUZAk0LhLIrdDe2CfKUXBFvpou2QkvPnzfm8s38XcZ
	09GwwhCjZRgUI4ftrtMWC3em67DMjAG+pGvMOUGmXTkIIPVs+bSGBbq8JvlpnTvhQ1vT+Io5SCD
	O7xvvosJEduX0EWYbCKkUpIlcVXTG3a3+xP/dGu874ipZjmswH/1iHdf9gQ8qHJ39kAdfUm8Joo
	0LaPtPcVko=
X-Received: by 2002:a05:6a00:4196:b0:874:708d:b637 with SMTP id d2e1a72fcca58-874df800839mr6021748b3a.35.1789750055865;
        Fri, 18 Sep 2026 09:47:35 -0700 (PDT)
Received: from [127.0.1.1] ([223.122.38.120])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-877a8dfe201sm50514b3a.18.2026.09.18.09.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:47:34 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 0/2] soc: apple: rtkit-crashlog: Add AArch32 IOP state
 parsing
Date: Sat, 19 Sep 2026 00:47:02 +0800
Message-Id: <20260919-rtkit-armv7-crashlog-v1-0-f4a671ea453c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQ5AMBBA4avIrE1CUT9XEYtiMEErUxGJuLvG8
 lu894AnYfLQRA8IXezZ2YA0jmBYjJ0JeQwGlSid1GmFcq58opH9KnEQ45fNzajGiSqdF1mvMwj
 pITTx/W/b7n0/0qGdUGYAAAA=
X-Change-ID: 20260918-rtkit-armv7-crashlog-2dfe86453b63
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=784; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=9ThTR4usKlllKQeYQGdfTkQcMVtWtvUIwI1QCDrW3UU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBqrWsfexwtBAWkKYwS3MiJyZn7cTBuRWss6Kylh
 VQ5Upp/K0WJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaq1rHwAKCRABygi3psUI
 JAnKD/9KcNtXTJThW/oYrX6AuZvPBkFL4cKG1KjGW8UZdPaOwY7mplNnesgBdScWem3kqA3it4z
 yuN10j2LV4F5X+OUWqKW8oQAKhtDnTwZhzZjPaO4H7+zw34dnDj7GVzVZ5H+uvvc02YjidfhLHu
 zKoN4hKN0706khQrDj6f6UCCBR8iNPyS4LyWnuDYzpIZvRnSAn+8cP221UA3lLJZ6ICcbw36nvY
 l6NIKpZ6L0TxRjhQhwq/RdrzLOMu8f+41XVqq/UX/Fqx9Szror5vFiMWHd14DbqtArKudSR9Yi8
 9v206cnl/BbV1IAqawlnzslkxUo19HiIZ3HqveIB69bz5WGliPAv8/JTGqpZtkjqxuJPMIBun42
 hxil79HgAUgVFUs226Agxo0IgDL7z6juaYUlRI9EdAyQ+f5E+pbWw+kiqSuoG+asR/uTZ9bsTx9
 QdvuHwR2TmuXNJck4VwJNhhpqGM4nGr32SdlJ0hRnfycXmB0F1antz3c8l+5IM5gyCJ21zfxxFo
 dMKEfTl6ONzG4OPwxFkM48OcyXRPI5PNslw7U0G/4rBZ3F+CNnibmVuqIFXNhNZfEazvveE8MRr
 OHT364iCn23+MuCoMFZdXzZ7pCP3ODotL+da0UxVMA/mMim7zYqrkDoVbRsECG1B1a2aXZyVuCU
 0E3WPsnO33qh5Lw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Some RTKit coprocessors runs on AArch32 CPUs. When they crash, a 'CrgA'
crashlog section may be reported containing their architectural state.

It is useful to get it so as to figure out what the firmware was doing,
add a decoder for them.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Nick Chan (2):
      soc: apple: rtkit-crashlog: rename 'Crg8' section from regs to aarch64
      soc: apple: rtkit-crashlog: Add support for AArch32 state 'CrgA' section

 drivers/soc/apple/rtkit-crashlog.c | 139 +++++++++++++++++++++++++++++++------
 1 file changed, 118 insertions(+), 21 deletions(-)
---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260918-rtkit-armv7-crashlog-2dfe86453b63

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>

