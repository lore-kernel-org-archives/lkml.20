Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0CF3DBD41
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791284154; cv=none; b=F25W9gETh2DX3w1n4NswesOM/YZS0uqOzcrXf0MwYYPgAciI75Tp5sgHLYOiDTIjtQ2vqmBdc2gWwjOu2d2tZJ/ZPxGOBSrmAF4EqS3kAV3bq/y2R3BQr+9WN6obFsk0kVHiNkOEfZ+JCrg7cSWb9pjRQfz5jFvgv32Krr37zCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791284154; c=relaxed/simple;
	bh=nYyVkBCg2CwXLA8eIMxYsFqjNvwtRaOOTx15eoWoIP0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FMiuyOUr1gwNi883hYn2LYRhmDdrrDtDPBLwHoe0wBFxsxSr7/oqy0JHYDQZmgaIE+PNXu59aTMV88hwy0xTP3j2qpID9hUXv0Z/fAsjdKkMqru/XA1zm0ThwrbBbKiFt/y1MhnB13aURW2t5hCw49SbgNUhjmYjm7EntVOR1r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EFYkD5Dl; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFYkD5Dl"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c4207ac26so350548f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 03:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791284151; x=1791888951; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mNd4IDSXzGuSC+ps0NxiYBeNqXRgn5dUDXtsfXpigLA=;
        b=EFYkD5Dl0RKb8UGPv6PXl2ia1ndpg1Zbmrpu8MKYwii4zvSjnDNfdbRYV8mdzHkKpR
         +gvUlufAhONVTaBw2NJtFuD2TYiUrc8Ecj7MUXOtpwYJHUi9AcGYhEId5+ZTZWOf+pmr
         dZPi/LGt8a/6srfs1XJrM64BttBh48XeKQi44Xg2tSLTtskxVry5IZPZnFhqwLWELgkL
         QrZeoXdoiDTdPXmikwNiKXfq6OLXOXDEy74SusV/1hy09E2cB6kZ+bAg/mLrfWF3er6e
         DF2/77N3d4y1hTSkUfFZ60FX1Nz8v5Dn7Zg/LSPfSeTohs6+unq5ZcUn8MHybdu2CWJa
         yQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791284151; x=1791888951;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mNd4IDSXzGuSC+ps0NxiYBeNqXRgn5dUDXtsfXpigLA=;
        b=aH4pvUWmzpI6FpTCA13dmlowCAlrd7SEUxxKKpQZ8Q+X/tpW8iCp9/dZ2Eay6fjgQL
         F7deEkmR+NJn95bV5U44A9vGChbRA/4Fi+DQ2NTuITQ0A2GOK5MEH06KYwk1MsacuVH6
         geiDaR4BOKuA96EBr9o/v8PwRsQgtrJxDwuXYqfL4pRwG8HrKZLvMJ1RnGX+2PNcWAGi
         V7jzHiN03GAk3pU5sTQk5h67H1q+9yO2yZlsNJNOBSmucTFK9iMSBHU37oIaS8o3n0P4
         fUy/jtn2OIbYrip/vrCccqBBgqaOorBs9WCtWpvXbJHLJ9b0hMEDNUyIXaa/WsNTXJYS
         xSbw==
X-Forwarded-Encrypted: i=1; AKwUvBx1PANHXwkn52GVoQBJSaIO5heiLl1JvCJ7NnjCztDyJSCdArVkSybOH6uk9W5aPi0E5nI/1ST6QJR39wE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKjJaitbZb48nPS1l9cQtmCwGw1tj+zify9zcglB1+GZIFWtx+
	/2B9hbweW6KvaMyPySrIsNdPynjRG0deQVLdVKq5kKeXh199xSbTQNcu
X-Gm-Gg: AYBFou2CWHQqoJzjwz4M8pwwe+TccWSsrrYuOXLTyoXQmJ7GjpDcwCcJwWosaGTtOTF
	Sa2U/FfTsOQZCVwxaGIRbKye1efLplT9+BtN5yJpl3ThMsBLupZ5rRLEOZDMbihHIkzZM7wLgit
	b0iS81SrIYYnng2Z/QXJAX9RkSIRS+Lix2by4jVkEVP4i+RLBVPxxOPZ5Fx+Tsr1STwL0GkthVw
	ywPqRkyz+S3xb28XFguK8OjmveAK/b46l7w9fRFoeY8fIWUET17N+yr4/xO7WJMfFJxyyXFqTP/
	u5Lyep9/XcyfRg0DXb1Os8oVmpBGENDfxPpvLvQkyTdzHchQtunkgtTvK6yWPsrP3aPiOXcDkSh
	WF0AFWSx6nq8LgriMqMUP16VXM5iXIs3ZnDXLHsF5SN1L+Uax7CyCrYMSc3p0IuD4iAevLo4xTU
	F5PtGhMOXFC6DlsZgf7WXQpVkP07wqkTkpybvuhlN8o0RVAzln06VEWUWUj5b3dNi9ydEtScM9u
	oo1Cj2UDAE/cTrUzqBC
X-Received: by 2002:a5d:5c05:0:b0:487:21be:dcc6 with SMTP id ffacd0b85a97d-48c6d1b8771mr2274850f8f.21.1791284151274;
        Tue, 06 Oct 2026 03:55:51 -0700 (PDT)
Received: from foxbook (bfj133.neoplus.adsl.tpnet.pl. [83.28.47.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6cd717f8sm2620092f8f.48.2026.10.06.03.55.50
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 06 Oct 2026 03:55:50 -0700 (PDT)
Date: Tue, 6 Oct 2026 12:55:46 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Wen Xiong <wenxiong@linux.ibm.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, wenxiong@us.ibm.com, Brian King
 <brking@linux.vnet.ibm.com>, Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] xhci: Reset controller on xhci shutdown
Message-ID: <20261006125546.10471489.michal.pecio@gmail.com>
In-Reply-To: <55a53022d1c6f671a3ed549d8cf7cd1a@linux.ibm.com>
References: <20261001222527.11742-1-wenxiong@linux.ibm.com>
	<20261002102931.3cb06009.michal.pecio@gmail.com>
	<561d22493c3d078b26f547dd8f6f6f46@linux.ibm.com>
	<20261002161828.365ff859.michal.pecio@gmail.com>
	<55a53022d1c6f671a3ed549d8cf7cd1a@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 05 Oct 2026 08:01:46 -0500, Wen Xiong wrote:
> When executing "kexec -e", saw the error:
> xhci_hcd 0005:01:00.0: Host halt failed. -110

That's interesting, because we call xhci_halt() in xhci_shutdown().
So the xHC should already be halted before the new kernel boots and
then xhci_halt() should succeed immediately.

It seems unlikely that anything restarts the xHC (or is there a FW
involved?), so either this TI chip reacts badly to trying to halt
it again or the first halt (befor kexec) already fails, or perhaps
something is broken outside xhci_hcd.

Are you able to capture the original kernel's dmesg (through serial,
netconsole, etc) and see if the same "Host halt failed" is there?

And if you enable dynamic debug before kexec,

  echo 'module xhci_hcd +p' >/proc/dynamic_debug/control

what's printed by the debug message at the end of xhci_shutdown()?

Do you also get errors from quirk_usb_handoff_xhci() by any chance?

Regards,
Michal
