Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE057544895
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874343; cv=none; b=g+m2gOt3ucEe9jACVKKiFFAEV217T+UevE7BmybxWu5SRflf+Ci0AcS8ae13DyG1S4LqJSKkDfm0jUEFRIuntoSsyP2Tpt0zaNk63Iqftb+bQCwJLrY/2FvO1gRSxGJxYk7QFvtnBr5HC/cx4vR2LO0uV3meaNI0ZHuqoSjY+jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874343; c=relaxed/simple;
	bh=tCih0LIPNTT45pEfh/zJWK4KvLPKxLWUzk1RehMfmTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CJTQpM6e6LFl7TTUtlx0sCtRrkHS1Cq1CqdRSRMiqg/zeYoK57WyU2M1OO7ormwf7OiS45d9PJNX8KhAxC02OE2G6Lbi1eH0lAZNfkFIvaVn4xfM66XJENct67utB7aaq5dBJr8N9reRmg/RQR4pQPNTRHZyHEPGujONqF6RNi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rvt5AmhA; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rvt5AmhA"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c25331b31e8so61061366b.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788874329; x=1789479129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c09duG40XUDjljTKKEnm8AMSUZjhNe4OtYQ1ssenbDY=;
        b=Rvt5AmhA03SX3g9aYAf/pgGuu7Qwl71l/HgBOKT0ZdOFod+Tde+Evp1XW8t/31qHZg
         YT+aLQD8xaC51OW5etQw1VFlFB/iRw2nbVNolBlKVFcl3xVEAGFWrGUyw8116iIfxj62
         3Ndt6mdIA4bWeKrrDZBv9w2Nq2/P4bGZOQ+ql3IihEWsWd+RmznwreIRC6+EsRN92VRC
         kV1VWjWzFiygM/aUr8zaNNP8/J9WA0mmAFnzUcqi1OQoP8pZuaafQRHD10JVY7qUJzix
         IZHyEqlVj83J2Nun/Q7IYk5UXO48o8hf7yhIMW2yBXd4Wx+UfuH7FBbh8qWa6ITrNreu
         WnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788874329; x=1789479129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c09duG40XUDjljTKKEnm8AMSUZjhNe4OtYQ1ssenbDY=;
        b=Mj9NFI8yRZAo0XU8121hr+StlZSxFiCDDx4/XVhnD3/esI6MBtBG6ZUevFEgXtFck8
         dDaafiH3+nhRLbDbFzCwApLb+zVfhmmo5Kp9ANaW+v47+hvcnqH1OYEulQ0vQPNWbIzW
         8hu3sc0s4pwPhr44nhhbDkIgaC5oeSSoT+1k2NfC0+AkDZUWrDF+lS9Tf6C39wKRe+p5
         3VJ7HI0hrezwBaUc7Qfl8PPi7aTIsgnAa93+nRkj3Oi0N8yjlKoF0FwJUxedsaRIUBgC
         FVdYHUa06VMWIrh2s9s+PtgyMowqSn0dHUaVIoIg4Be/9PD0K3b2byiN6OdAudTwxlqS
         QwOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgh3FyeyN9msRd6aiZZjjqRozNPnCzP86YzUzlpS7nWLmz9hWlUTK1Y1gHC5/0xMGi5Pb7ZZzL2ZlRXWk=@vger.kernel.org
X-Gm-Message-State: AFuF++lqCfaZhPW/RmjJDbxQ1H1+0ASDsdJtZGq0CK2RChmuB9GMb5dy
	jw+4ge0uKDYgjQ7N7+SSx0YvgUq6V57cGG/N8GFYS+bc0suc3xghLthH
X-Gm-Gg: AYBFou0JbRZfXpkuqmI/DR50L3gcpCjQbr/ZMmScpKrXRDjI/yOKraQ1ORhXGLQUdot
	q91X8iqEqSMiwfFbKSe5beTqodX0Row/yE+WMMN7tDGsazC1PjxkqOAzYrqg4o+ez1EoYRDtJcM
	R7sJ8/NUPoX8ynWtiQ76FMjNN1XyA6Y5mYppsw3owDKaLiTRwJAb8Lhdnbi5srmXlDf2CWZbwNY
	R31MBnVS1JTRZzcU7ARSxtNn7C2nLwv0lMmw4Az4if37Ff/CSxgQhJSJ3uqrtFLVOS39AGmIXq+
	hXw3Br0Z1mK7MigirQEEqOKHbHbl/USdUjBuGAcfrzuO3avURHbH6fmDe7cgL77prI3tPkM8CSn
	b6MdpHikrXKVt9cgiBa2Wbk0uxjWXQ4nOu0XdEftyqYJ7Ow01slRbbFfVHb/AA8dLxxIYWOXfhm
	I/9mptlN4aBfDu3fkUcxr5rXlNNwwWTusHa1c7JSA0cuqH3uxlSLgYzh0Or3UeGleOV0pNXb7Gd
	CG25MKEfrlsEAC+Mpz5wh1qZKyBc0VofUVdL8N8PWdkFgYjegKdK9Q9Mkldl7y+2VclY+7liA1H
	tVqx
X-Received: by 2002:a17:907:3f8d:b0:c25:ca8a:8e25 with SMTP id a640c23a62f3a-c2624eef698mr794013366b.1.1788874329043;
        Tue, 08 Sep 2026 06:32:09 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B825D0079B84A36A788F67A.dsl.pool.telekom.hu. [2001:4c4e:1b82:5d00:79b8:4a36:a788:f67a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485881353e8sm36163217f8f.1.2026.09.08.06.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:32:08 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vinod Koul <vkoul@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: s2idle resume hangs in ohci/ehci on RK3588: HC registers touched before the USB2 PHY is powered back on
Date: Tue,  8 Sep 2026 15:31:46 +0200
Message-ID: <20260908133147.8291-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ap__5zeUakMSLWOQ@venus>
References: <20260907190000.s2idle-usb2-resume-royalnet026@gmail.com> <ap__5zeUakMSLWOQ@venus>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Sebastian,

Thank you, that is a much better place to fix it than either of the two
options I asked about, and it matches what the board shows: the OHCI
that hung was the one whose 480 MHz clock had it as the only user, so
the clock was gated on suspend and the PHY was left in suspend when the
controller came back and touched its registers.

I read 53014abc in the rockchip-devel branch. One data point in case it
is useful for the version you send: on RK3588 the early return does not
get in the way.

    /* Limit to single port; it's unclear how multi-port should be handled */
    if (rphy->phy_cfg->num_ports > 1)
            return 0;

All four entries in rk3588_phy_cfgs[] have num_ports = 1 (0x0000 and
0x4000 as OTG, 0x8000 and 0xc000 as HOST), so the new code does run on
RK3588, including u2phy2 at 0x8000, which is the port whose controller
(fc840000, host0) hung for me. The num_ports = 2 configs are the older
SoCs, so as far as RK3588 is concerned that guard costs nothing.

I will build the patch for my test kernel and report back. My setup
should be a reasonable test case for it: with all four USB 2.0 hosts
bound, s2idle resume hung every time and needed a cold reset, and with
the four hosts unbound the same cycle completed 4 out of 4, so there is
a clear before/after to measure rather than an intermittent one. The
driver is a module in my configs, so this is a single module rebuild.
If it holds up I will send a Tested-by.

One observation on your second point. On this board s2idle is entered:
the machine goes down, the hym8563 RTC alarm wakes it ("PM: Triggering
wakeup from IRQ 52"), and only then does the resume stall in the USB2
hosts. So PCIe did not block suspend here, even though the board has
NVMe, two r8169 NICs and an rtw89 card on PCIe. I do not know why my
case differs from yours; if that is interesting for your PCIe suspend
series I can dump whatever state you want from before the suspend.

The RTC pin fix I mentioned is now v2 on the list [1], with megi's
Reviewed-by. Without it there is no wake source on this board at all,
so it is a prerequisite for anyone else trying to reproduce this.

If you would rather I wait for the version you post this week instead of
testing the branch commit, just say so and I will wait.

[1] https://lore.kernel.org/all/20260908111908.19371-1-royalnet026@gmail.com/

Igor
