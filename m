Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BB0285CAA
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792373593; cv=none; b=SrTRLWT4NyYFGlIPECUGzzPEyUrsb4ZXhNhE12yyI9uUI2pDDyuv8sq5yEzeFvKtr9bRYIp+W+0spr3LakwvcSb2vfO0dBhYT1Y0orryYkSt1OPgwK4gx3zFLfweTBRTUAxAtwajFk7qR5sAY7ViRrISABEL8JRmNAScbe7COck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792373593; c=relaxed/simple;
	bh=9Kc6q9rTpzhwVJQBrjDXbF+l2p6vieI5c5NZJWnYEqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SlogAplfZWsY9rCjlWJNM1MuqkR4P/kFlYfXU6ki3YWoHzcDoPPzhHzl7H3nVNgUFu2toVa+gzItyY0/e2AWqZZlYH59HlgzIhVJEn3sczdhFVD4G/6jI8Glc8iv+VbDna3qYoBJY17RAJ0WafDZ85tRG04I8X5Hrb6MxuyOJk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=T5LrC3a8; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="T5LrC3a8"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so11081665e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 18:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1792373590; x=1792978390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Kc6q9rTpzhwVJQBrjDXbF+l2p6vieI5c5NZJWnYEqo=;
        b=T5LrC3a880ioyxH/Bon90h87LXrfZPcBFzTJtzDwKCZj/44vlkclIDk+IwGhnQRKw3
         1tDqJXA82to0IoFMANb942HhE679CcKnfgV6ZC7Y+nzOnsvypQns2loTUmfODTfnQ3aC
         xSHrqurXtZcVFAjmmUIR4olKxG1yXmwXPd2YyHXz8XolbA+Y5yjrx6uBgzZpEVcWosPa
         VcgGVXxumOClC9d2qlI0M44FE2xO6Xdni/RrkeERQ88XrzUlN0ATHax11jglH0gwLyaY
         15zXiHo/dImLIwF16MvJKUeaVswgekU9VgLtAZ0JaKYY7hrd2rzBscNjrQWjp2MYoAew
         GKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792373590; x=1792978390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Kc6q9rTpzhwVJQBrjDXbF+l2p6vieI5c5NZJWnYEqo=;
        b=S5EfsuLEuYA5dt5uG7CrAFea6LEolQTbaFuXpRHmq8QYcLeI2axsUJBLEnuIDre3qy
         AH57Hsip+krYn07di21uM4BFc6gzcggAu17fBI3y3NFC+eyugXEMVgexy8ftudfKF5nJ
         3xseOs7PNqhMuYD8Bp9GHERgbHPxA7DATcKuS8bAxAwLI8VlaCmMBXaiaFNvx+r4ksLt
         1MAzUIH5ZFS6ykZAL7emffLo/1uzFsAK2KbtBygksc7ONbawyvHu1w+MKhuLyNXyP5e6
         lkuSWLopRvOFZb6vlDAFND6epU2o4inWwuTJRuYweHVQAy9jwTWygjGkZNdDN9Ec/F9C
         M8Ag==
X-Forwarded-Encrypted: i=1; AKwUvBxKGaJ9QfJTKfrcSYnVWz6jhMvAaRtVYKIlM9Z+f+OE/d7nYJxgl5yCCb0zDmSZcRjY+zl7g2VahPrdIro=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPLf9ni5ZMti1KW+Ch/OU8mtRF95/xx4/3MDhhaJ88kl8bicdD
	yCLkdqepfQIrnOLWI7B5qu7WrazZ8OBT8Oc8yP4HBmyq8gmOn1BfA6ZCqJNu7kWHyaA=
X-Gm-Gg: AYBFou1p904gOE2A5CPEMS2rHNW1UIJBlz3aLUeDGiC0iJRaXF1wR6xznxq/zPcsoej
	ntb2jNahNc9vVYCi7NymslI2Fz1ImnXZ9v9f/3MSimbwiSb/fnNe7JBnIOk8gyJfsOo0oOlYjzM
	AycijxXTD5nr2KVfzC0fPCEuEdnZfeEQrt4A7XxCWw7aEGS/l2ed4CAq6eg1/RwZl849met82JV
	SL/ZrRl+BqnQQhVwnSZzXQ6kw+z0WL4xlhCYt0urHer9AplUq/+Hm1KH8zIL4VzH/5nWSMGC+gV
	0dfI4ZLTusX967ff8/2DZOiIZBdiOC+b7a93Y39kVmQR5ILRInllI0pkETh24TXw1DHP7+MkY85
	abqoBVx+Kei3/V2oNT2Xr5oWwX+uJR3T9b3x/o+A+QwITaJCQoGItANEHMDNcpsTAXm/EFdogwe
	ZbNpEKP62fZXy1l3+Fs9UL2IxzKyjwdkGZh7RUGC1fQEcEvh7iUQ==
X-Received: by 2002:a05:600c:1c0f:b0:4a1:e489:f89f with SMTP id 5b1f17b1804b1-4a1e489fa4bmr64348945e9.14.1792373589447;
        Sun, 18 Oct 2026 18:33:09 -0700 (PDT)
Received: from remote-01 ([84.17.55.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b303csm321116015e9.8.2026.10.18.18.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 18:33:09 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Lucien Jheng <lucienzx159@gmail.com>,
	Albert-AL Lee <albert-al.lee@airoha.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Woudstra <ericwouds@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: phy: air_en8811h: use firmware loaded by the bootloader
Date: Mon, 19 Oct 2026 04:33:04 +0300
Message-ID: <20261019013304.1612468-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2d6df47b-2cc3-4003-85db-f72b878427d9@lunn.ch>
References: <2d6df47b-2cc3-4003-85db-f72b878427d9@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Oct 18, 2026 at 09:13:46PM +0200, Andrew Lunn wrote:
> Is it possible to figure out from the firmware blob what version it
> is?

Not reliably, as far as I can tell. The version the driver prints is
written into DM by the running MCU; the file holds zeros at that
address. In the DSP blob the halves 0x2506 and 0x2302 sit eight bytes
apart, which looks like the code that builds the word, but that is a
guess at an offset in vendor code.

Lucien, Albert, does Airoha guarantee any field in EthMD32.dm.bin or
EthMD32.DSP.bin as the firmware version, at a fixed place that will not
move in later releases? Without such a guarantee I would rather not
compare versions in the driver.

Aleksei
