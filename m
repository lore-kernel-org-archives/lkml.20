Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794601902;
	b=lomkAnaVtdTysG+RMWV32yeVuPbRL4fDpUFOeuj+A7h2woAFy+botHjMWxOiUxKJvKCT
	 xOYevgmvKJMzNpMNGu6eay1y7qx+6ZJ2o1PWSniQ95CYP3jcLJvH/GJYNW1TGc/2DmwX3
	 e276cKlXHC7bT1NCYmYcLAVt1oUGGxglMHDHT7yw25I0uBrmd5BjAN38ObWmD0uw2yGq6
	 6l0f30eN5nYrL21tK5x+fOqSfguiUsMqbuDxv8VDauxS3R5oNLQdoBLATIanVgqR7L3lB
	 sXJyuIABCS798gKe6AJsKYrMK71wWznFwltesdkZmgMe6s5Qe/SEYGZxftiaQpbYDtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=YiZ77gIfuRvrG4OhaqVJrXWfgW4P+h0z/eTCC1VVgzo=;
	b=txR6+eLm1VjSx3e9dmTkcP8eV+0Tll8mkadz96GT5Buqf1oX032Aux+RQrqB/S1r8PVP
	 2O+isTnxZ8iwVa7yJ7dvnUQTHTZll3QUMCQ6917qIAde+F/VrzE1X/ZpR7oYDy8yHrYrN
	 kvaoOwNAE0ye6QSwpasNMuZ93fVdUZgXO7syePBP6K5BaRaMgmapCgfOi6qmFnZh8DNqa
	 2vjtKxyF5bnnuWb736tsUq+83D2rBPruCkOdeyqppTwXjZvDxBOa149IH0SAIRU/rd12+
	 u/CzT0muoxlgJKLKn3yTlfGwr56E+cCSFPaL+SxjEG5Tj0C9zLvTFdIgAPsOkx5+E8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0eqIt7jX;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D29606A330
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1D29606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0eqIt7jX
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ad0c2e71ebso193340a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601901; x=1795206701; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YiZ77gIfuRvrG4OhaqVJrXWfgW4P+h0z/eTCC1VVgzo=;
        b=0eqIt7jXVqDpxvabrVe0KQBlX7BnF53VF/MF1sBMtS1BWLZtZcTYCrhX9bVfHRiKQm
         z9wQpmxs2sofJeTIcAY18T6FhFvLh3qN7tC57AgNBI5drGp/OOR2e9mhM3IKgL5lRjJa
         95vB8WZsBSjGP8fnKSJrqC0uCLGMdk9PYBRFIorS3oIBol7UNRrhAuSMCKKIxRVO7R14
         N1gxW+i630qYTk91T1x8kMq4q1/GZ/gTS6qS8wtzRSNYA1Q44/Gwdo/Dx6A46e+GABFX
         FygH8wTF3JWBT/Zjhdd8yuPK+Jtay6GrY5BpNjqKb8aOAkf83KKSaMQyF1kMZeS8jt/m
         H0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601901; x=1795206701;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YiZ77gIfuRvrG4OhaqVJrXWfgW4P+h0z/eTCC1VVgzo=;
        b=k4pLIz2FIjqE1a40wR/MTWsr5U+WGjnfNkQ8oWPiJFMz1B2tn5E5QnDsmZqZLuMunC
         kb7fYeEoKflUMM/QrcnIW7uLJdwVAadkXUwNx5tED9R6EId3lQW/N4AiTdHwDCNBrdzv
         sfQRvVT5uvpYaaJWLXpS5sRgIXlHl5K6GAhlfxt38674v3TrdAtA5BpOBo7RIWPxHJ/+
         tuRJX8TIRYDPFbw7xJxKn3QBzaa0M4Nz1BjyQh6M2RF3TEqA430wHMc5h/YcR6b5TBBu
         NHMlEaa/wGKvuXVMvIbQTB7y/t/15hqYPj1S9HO2yNKqkEio5P5LYIK39DlzN11GqxOL
         iHdQ==
X-Forwarded-Encrypted: i=1; AL+hErFIHpszXkgkTyeMCWtFHrL/6X6ChKpfdX8eFC5w1Ah/VUu4apWXa1IroY+IGrZSuPCXT5KcXcJQW1+hO9g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8y+rHp/7UvEHObOPjTI8yNmmAq6/0PT0LePIzcLw2vZZWqPnEY
	TP0Xq11tkrdL1c9PDWntzgTs7cIexPpy7rQsdofOBSWiqFkc9KwMo7ff
X-Gm-Gg: AYBFou2rJNxa4gLvOnV/r1iof5twe0bJSO9/QvFmB0c1XFSrD0OuJ7LwKPAN9JWWLZx
	WfsQncvVzjO5SYtbmwoJxUg3oGamR/aJyxWtKT9C5yEcUGVnLvVYUZWuVbf3VXHqL0bYcnIXNzA
	HKJkSMQCFWJrB2S8q5Se7JIa27XCBej9RebiArN1+7kJzoAYrGAVfvWE267kODSsiRB6BoOuySe
	nxTrgDMqi1/D1eQHlLv8jFRg5rFJaxED/MpFepGCkM5LyU07glHVf0wp7FgJYui2PaJfrTE5/KX
	UjJ8E6if9bj5udXfUtt7msmGfT2RlHwAQDs/G8osHTYDbdrBTWDw2OQerKgR1SFdt3HcglzJeB0
	Kcw/lrkolD2XCMIsxpLtguRxh9H8WLBkFjr8Anr0WFHHKwXk9S6B7tWC6pfYz3ZinYbGYMT6pzk
	5hwqYwmaDHXE3bhgxQ8BDwvDq6EjudnCRpApyUcWUE3Tcp6YfUAWeWMfibiYHXjacIUToQgQLRW
	NkhA4ITnEMTlmUx6qLzJbqQpnrpeoX229RhMlZ4RxtzW/5sQxo31LgmkCmiQyJNAT+dTdmGGivT
	KB28H5mKaazLujRDwOz0uZzW8YjE7Q+FxYUSW9+TxSCLw1r2P3/KYG/rlOCFyT7zpeMrPfitqCJ
	JUW5+Ig==
X-Received: by 2002:a17:90b:590e:b0:3a6:e1d1:e511 with SMTP id 98e67ed59e1d1-3b1b0b85d16mr5379769a91.4.1794601901202;
        Fri, 13 Nov 2026 12:31:41 -0800 (PST)
Received: from claudebox.iyengar.cloud ([50.39.139.68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d35525sm11051461a91.16.2026.11.13.12.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:31:40 -0800 (PST)
From: Arun Iyengar <aiyengar1990@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Johan Hovold <johan@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Saravana Kannan <saravanak@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Ulf Hansson <ulfh@kernel.org>, linux-pm@vger.kernel.org
Subject: Re: [PATCH] driver core: fw_devlink: Don't report refused
 sync_state-only links as errors
In-Reply-To: <20261110-fw-devlink-sync-state-v1-1-6385be961c2b@gmail.com>
References: <20261110-fw-devlink-sync-state-v1-1-6385be961c2b@gmail.com>
Date: Fri, 13 Nov 2026 20:31:39 -0000
Message-ID: <179460189995.183918.12921536578133287930@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

+Cc Saravana, Sebastian, Ulf, linux-pm.

This message was explained before, and I should have cited it:
https://lore.kernel.org/all/aixze8zFboY3huSf@venus/
Sebastian writes there that it comes from one power-controller device
providing all Rockchip power domains, and that it is not harmless: the
kernel misses dependency information. So "harmless" in my commit
message is wrong; the patch does not fix that, it only lowers the log
level. It also lowers it for every other failure to create a
sync_state-only link (found by the Sashiko review), which it should
not. One such case is being fixed at its cause: on RK3576, Sebastian's
"clk: rockchip: rk3576: create proper platform device" removes the
lines for power domains with a clock phandle:
https://lore.kernel.org/all/20261112-rk3576-clk-platform-device-v1-1-2f3ac9f09403@collabora.com/

Please drop this patch.

Arun
