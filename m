Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6184CB8DA
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790350144; cv=none; b=ThTgDGdk3Z/gnMw4sJcbbIfuFYP1UiQahVxfHv1cUfIpUu2TrSdR/rci+u3K5Eyp7K0Habxm3ai3bNV16PXuNFjTUiaORbOLyNL6F1OJKxbZfh0R6JPadzCYVz2isCZmY4S4lGXLJC+isdNkRSb6/Tkwn6vpdb0OibFD4jV9Z8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790350144; c=relaxed/simple;
	bh=gvJtq8ZUiquv8Ua4fzzgdoLFYRoUa6vOwmahIJ1yUp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C4g5eRcwbq1fUI+uRbwobpY+cxlGKeoEb/FusIDGOlY3a+S0BVK23tTI97md9ZApTORzPIVSsZqw/nXFnqYEpiMquTmqfFFNgjPI2emW4q2lBXbGIWup0DRFX4RrsKdrGgFF8/tDmfRuE/BAj8UM56UGiyAWp93MwOjzL7dcLiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=EV4BX1i3; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="EV4BX1i3"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so6020375e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1790350141; x=1790954941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gvJtq8ZUiquv8Ua4fzzgdoLFYRoUa6vOwmahIJ1yUp4=;
        b=EV4BX1i3DeMd+uSb1Qk19FiI1Es1HcyNTLITcuPhCoyJLzMMOlFyEejI8LHcxn8tQd
         OzYBueatsE6I3kc9jUvkgKGy1s9pX1DOqO62dLpz3cXL1840g3g4CsVEPhtftLB6Xo3C
         533FE+mf3KS7l1T7QgmWYGl5e51qPwG4BXCmTfVmi6CYPl23VuI/1qlvUboMiiAfd+Os
         ATwqO7mgN/7vCX3O41gEeiK9OB2drTrwlpps4gKDwxp/GRxin+WVw1euRgYljmi1/pJo
         7LQfY4Ffm6GAJQKAE1VaPd75eVqqOEWEa/G3h82pPtVZbNdsfs7u+69oZLdViEb1QAMJ
         clVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790350141; x=1790954941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gvJtq8ZUiquv8Ua4fzzgdoLFYRoUa6vOwmahIJ1yUp4=;
        b=Jbgj2oTj6BmkvYoxApiG8TI1xnrRsYqZNGjBebfdDKQ5l781FxGvuVVjdoTxAfu55/
         GOabwcTVt/TFUDdsbtaayUicnezSexEc1/tDmCSb23dioV3K+NjIooNVsHV3uuJpKVoL
         bsTc1puOlpTzN8bEatpNpue7WXPkRDXTAy+GaJ058JEwuV+7XdthVU4id/rgiCerJa9L
         2Vwr4gdEuTfe347fOUIA8VOUwz8svgy9RDuc/mWP2AjM2uo8RuMkE9QioUrnc5qHlzNM
         fqk0wS+Q5svXa/L6zng3scPPAQY6cHJZ9DBgvqQzTWVz3meEBItVrHw96wd49U1BH9ld
         oYyg==
X-Forwarded-Encrypted: i=1; AKwUvBy48GEU1ITLDeFTUkxmvwzOM5GkJ1evNVNuDnXei461U/Y8FkWrDDz98TnWd9rzwEktwYcqjORNA1KuhpI=@vger.kernel.org
X-Gm-Message-State: AFuF++mt1oa4ueGJMA8BQuXrmZ/QyM1eq6M31GAqUDefNDfR5QGFPSbb
	OnciahnBr4QQgpIKX77Nu/BOumL0ES4KXRXVU0m5JfZOBP4XSOOmNLRjSpHAEDyPOJqnYEQ7zRV
	Z0CXefMxOhQ==
X-Gm-Gg: AYBFou03HUrmdFyPROywVx2c7H/kH0cHE1ILY6gtITMjNxrkliZbtGWXCAlax8QR73r
	CwvwaqrhykULCItpB3c1AFDGTfTqu64J08BIVVvZUVzbTT6DgCEmk0b1f7nXE80Gp5oZfSval7O
	vf+LIB86X0/gPSkdumPG1j4VL/iftTouVt0byRXlRn0NQndZmk4MUFsvH0dPMlVs/ZhzrcX+69e
	W+DDVF5T5tpoY9/jQSuXqngw1sacb/nfjdSRc91rDLEdmHVIBWKdfjOXRTYYW9VZc4AlEUUCOv4
	3g6obZTxLzCN2pDIDSgM2mR1Vc9dwjewAv+1Z2WD0YG1/OKqUpVpiK8tAdJr3YiNDYTzTL4VLsf
	UX1mdIP+CsLCdoLezJB+IsiPWOHEDUIvttiaS+7nxiFDNkVoRCI5BKkV0F7r2SjvsgZT1qWCzyZ
	0m3pXyrCP9gmE9Rs+wlUhB0dMKg70NgsItqJFRPAV3aQd2T8q1Z6sCANVtiuRPAw==
X-Received: by 2002:a05:600c:a15:b0:49f:e444:cc4c with SMTP id 5b1f17b1804b1-49ff06bdb00mr44911765e9.12.1790350140709;
        Fri, 25 Sep 2026 08:29:00 -0700 (PDT)
Received: from remote-01 ([84.17.55.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fee915f3dsm67540955e9.1.2026.09.25.08.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:29:00 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
	=?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?UTF-8?Q?Nicol=C3=B2_Veronese?= <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>,
	mwojtas@chromium.org,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
	Frank Wunderlich <frank.wunderlich@linux.dev>,
	Pietro Ameruoso <p.ameruoso@live.it>
Subject: Re: [PATCH RESEND net-next v17 09/10] net: ethtool: Introduce ethtool command to list ports
Date: Fri, 25 Sep 2026 18:28:54 +0300
Message-ID: <20260925152854.1559947-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <e95bb870-11fe-4402-ade2-994b54fbf404@bootlin.com>
References: <20260910170103.1029108-1-maxime.chevallier@bootlin.com> <20260910170103.1029108-10-maxime.chevallier@bootlin.com> <20260924220124.2129700-1-f@lex.la> <e95bb870-11fe-4402-ade2-994b54fbf404@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

My mistake, that mode only exists in an NXP vendor patch OpenWrt carries for layerscape. Thanks for pointing it out. With the patch author's agreement it is going away there:
https://github.com/openwrt/openwrt/pull/25399

Aleksei
