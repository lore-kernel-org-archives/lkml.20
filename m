Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794865753;
	b=1ABVu/7bVGQ067suHMXBfzkEp13BOn0wvMbpOGOvgM5f2HpUUxdHBP0cml1k7As2UN+H
	 qXdeBuI+vOPHGoHpZojV+8dDRmovSTqz/kSVamfiA/OhxJCfcN9Smsv/PO3uQ3mwpV35M
	 00yBh1ouDIqpE1/9TnTrzIveFltKrDsR5owlbgqWU1SITQy/lPhf643CItYdyMl5t5Cz3
	 21biEmXR9Ds9oJQcVa1MQdKXrjawkG0Filn8W9UsuguLpg4sqOBBtubykcrJmSagXEF3p
	 qDrTBJ+5wBAIC0+/LQb1yRGSIL0D5qqCSwT+OOOS03SXrMSHA3bOcC/3TP/eBw82lWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794865753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MWS9HuyyNmrnPfnUOwmph9d5xBJHBzx5A67xlVtIv9M=;
	b=Kmjsl4+Lb1XlgWNcE5hvsZPHo7BsXK/zu+rN9zpXSZJcya85k8/SoNcz8pwRS9Vk8l8P
	 vLhFlNPO1meHWo5cjdkG/MLqizAfLm1nUTGYXiO2iXcbe2oVykqj0kciNNYbXGW6VnUM3
	 4lkjs8lG+eIePqGloSJvaFR1eDtKmPIPC2qVrv8inWw5j52zudu156iO3H2+sIP7I0Q3H
	 B+rXW6jf23ASoouXF2AklCyZIXdDGbpnAgzw9cJFL+JQA55gDhYVvEEuDyDIsML0zatbz
	 mtgSMJjonIlcDsCivoUMbna+0TVWNWGSqFqxzSc+Abgm6/yD4gXQ57cG53uA2Y7RnQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d7JHDbwk;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C29606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2C29606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d7JHDbwk
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso45243675e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794865751; x=1795470551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MWS9HuyyNmrnPfnUOwmph9d5xBJHBzx5A67xlVtIv9M=;
        b=d7JHDbwk9VEEBpl0ifoxlONZ+rcxz3lAMH/W2wIUaMRsM79hzjnd1QcdK3mtEVeq0p
         54gr2ZSz+kTtofnFVXmVydA09j/Eyv1JBsDTOlYKZcxFwYiz94TWnzN4rgYpe/7OlE+a
         O2rP4G0F3lyI5MRIFXt1rObFAHHn+WhS/cTK1WJJzlvkVBfi6lFajp0Tszyem3hXcsIG
         hxaj3JDAtoEXyhp7sTvMMnhtH1sBO8NPSn0HODnOHpi1qrzMjPa52+uoO2+Gq+Q0BN/Q
         gYKR4XnkDpTFS9Q0hyed8/tblKEm5WQOWJnHyztcXRVbSHvMgKZ0Yy8NuLTY2wIzgAvL
         I7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794865751; x=1795470551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MWS9HuyyNmrnPfnUOwmph9d5xBJHBzx5A67xlVtIv9M=;
        b=SiaSE27ArYivs5SCl/hqVLL4C5BrofhlGKC8gAYNVETGqpLP5L0uzHfcciUf2tLtDd
         eeUd/OasIfgmQCQpmiowhKMnnPaFUBdYZZt2KoVmPopNrF3VRVO4iCtVsYSpTggxcKpj
         1DxXB1wli5y+e+LqWx3HHsUeBHEPoBZ88FLCHniPwrF/hBYkkYIjNpOQQlYOnWfgdLEn
         snG2lPypJggTvvNpIyghkwY93RUh52hSj3+xBfOXzER2pmzUJ+sjEc68/4sQNr7b3s2H
         6m+vUq9kvZmnEPRqwj3zcreQk55sefD6OYoFpzl7zm5/FGqpfwwAj2PhZsnfjk0O1hoH
         0LPw==
X-Forwarded-Encrypted: i=1; AL+hErGa52HkiLShu2s/a50mzuBBVp9tC+jYMpCRHv2ITcRovoTT1yP5ob0ZaHTwwM4chjkhKitdPbDaTyl0JAE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CBJLQXc/2FNmrKj3m1TBPMxhhY93VkKsG9gsrx74rDeTR7YF/
	/iBYoaDAgbvj/R+Vn4mHfrh9DFk8QeR1PCeYCPfSvUDIqd4TytwM0Bmg
X-Gm-Gg: AYBFou2kDURp6ewuO3ZlJk7uj1CzsoQhwwmcL6cO+wRTbcfaE1JUQLzxHIVm754jGl8
	UFSE2UDugzc1j9vpUr0SE8Kt1sF7DJpThLZIL+c57tHDQ4AU2oTasq77taMEMuX1rWTeR9zYLV2
	TH1SpliNnOq+cVoYI/nwRby+umZ/kHIiPpBoBz2E3VN6x2RYkXrbfQpQVOaeq8sA0vWtfp9EXQ0
	1ALQYYQdSsh29ZpINbtzGaKkAdZB9Hlyw9U4dG1HYhq5R7mgnG/IzD7emmUI53VCbRoEtv4hRkc
	tJW/oPmKML8MqjGByu+RDoRihiiOO2cGu6z7SMla+5xpJPk4XT2oXPUoFk0bx2LI6X3/v46N4YL
	4WYSEeAuVmlnQ02XP6t6vbXaXacik8pbWR9RD2JJ7JA9I64R7Z1ueQ+FN5gJ65DCBcYjlMrXiTU
	WjYnx/2dWh6/G//wvwL+n00CRNaMLOOFggg5nv3h5pqxlkrzqJfol/Ph1cF8gmkcmorbEzoQcCk
	ANurEqnqOrHd77CXWf5m1wsVWtrCDxkvl+FJcOPSdibAsINJK4tUTgSAM+wmxG44YJIIRL7gmED
	Q1oqEMfi63dnzBekQ8xvXqBJuEO7ggCp6oI=
X-Received: by 2002:a05:600c:34d0:b0:4a2:133:45e1 with SMTP id 5b1f17b1804b1-4bb55a59f41mr248892725e9.24.1794865751381;
        Mon, 16 Nov 2026 13:49:11 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7843bd79sm16434045e9.14.2026.11.16.13.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:49:10 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v11 2/3] wifi: rtw88: support channel switch in AP mode
Date: Mon, 16 Nov 2026 22:49:09 +0100
Message-ID: <20261116214909.1569237-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <59C03074-784F-41CE-A27D-EF3F30773D77@linux.dev>
References: 
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

Hi Luka,

All three are right, thanks.

> Could a failed download keep that count pending for a retry before
> allowing completion?

Yes. v12 downloads the same count again at the next step and calls
ieee80211_csa_finish() only after the count of 1 reached the firmware.
With the first download of a countdown failed on purpose and a count of
2, v11 switched with no CSA beacon on the air in 5 of 5 tries. v12 sent
every count in 30 of 30 with counts 2 and 5 on an RTL8821CU, an
RTL8822BU and an RTL8822CE.

> Maybe the refresh should not depend on csa_vif still being set?

v12 refreshes the page in rtw_ops_stop_ap() whenever a station interface
stays, and the work no longer clears csa_vif, only the driver ops do.

> Could the AP be found without allocating an entry?

v12 keeps the interface of the countdown in rtw_ops_suspend() and starts
it again in rtw_ops_resume(), without iterating.

Mehmet
