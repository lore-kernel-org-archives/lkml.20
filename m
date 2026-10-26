Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003773;
	b=h+do4+FOlNQY8bYaxFhiI5ORKwD77RqarCuHQUkOGGrAZrEdp3Zch9ydQwPIWgFMAWHy
	 FE/GTJ9hxxju/C31ylk6hiDZWyBNo1XOvB0NdJasFZhzz2RyhQ3/3CW6ZrUmww5kT++ET
	 TYPBdNzo1cO09aA6Ykg/sz2uhLDdsQaybZkvNfWdyo3zlDHjiETJzzjSIZWia9YbG+yTU
	 +BuhHlMKkS7jMHU5KikhBul7J9ly6q241+BvJEXd78+2QrC3OM7WcRML3gmioYL/YQXSd
	 pZjgcjwngMdJiccfSq0iDI4zVluHLGBS3MJof2gKo4H1MFoL5Nuqc6e4a4OS2h1nnlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RgXmha7CcSQWW68lEObtrAB+EUYAPG7XpUlj/LZ3mcs=;
	b=GZnBUMYhiFRHVxzPRwZ8GMwjdr8QQLFBh9rsmfBlV5BFZBxnRLts6iWzzDe/IhOr2Xk+
	 rDvGPaQy/5/Rh4xPt3IozjOO3uWJfBLt52FPZ3SLbPqOrZzcM0Ph72yL6qMkY3t56pMDR
	 V22C640gRsLcdH3v/+ZKpVpNwvGPv2hjyq6nrK/Iy3kMiZ+jIPp2GS+jJVFHW6iTGwpPt
	 BJKXwrAuI9YxrIIMQhsXidfidnBk7eX65oNs9EDkAAZwskfRu8Szwssec27tJTZcJnd3f
	 DX3Omjt48vqtkuo8NNTV0xZI9x7XT415J0QiZdvfASHSKuQLKfGd0/TnwAcu6G3ei9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=mGQJ5UIA;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD561606A322
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:36:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD561606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=mGQJ5UIA
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so6373765e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1793003770; x=1793608570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RgXmha7CcSQWW68lEObtrAB+EUYAPG7XpUlj/LZ3mcs=;
        b=mGQJ5UIAjeAsqYsIBhhQC0hB4fWg9EkY0mtMeaR8jnwNlB852EvDVO259FZj8wXLUU
         SubmyClKZxzskwEi/dMo4MTox7VHMrua9XESny39VGJLqeSgw9bGUN34r1L4kOTrxmoA
         k4FVc5tr3tmKrZ9SOvcmmGhR5unbpsUkmKyzjsma0OpsiBBTModDy0kyaLLpS50wNDd0
         RcA+x4QxASsVtbx7T4QEvtD3W3mAfQd4QiIm2HaXLUwlWfuEcYsjc63ORfxMahf9VzoG
         agW0415AWW/dvl4qbQgE+cPYQJI0uuKm7VIIJiifaLJsEzOSuS2n8oCiOuIiTkONfhtD
         qujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003770; x=1793608570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RgXmha7CcSQWW68lEObtrAB+EUYAPG7XpUlj/LZ3mcs=;
        b=TtPmeJ/jF+DWi2kErgX3RwPFKkp0p/LnyF/jfciH1fyJwW6mQeJiTuMQ81K9yy8dOR
         r7zDUQVFSCLE79t3qpa3o61e6o8baOSGu19bbn3h3kzQL8L5wmdFVqjr4n9KcwzYhH6o
         wzGWwjE4SbCi8MVopX4quHPNsXdk2oJ3XdHERX8Tz5IFZ7A6EpjFFYyDCzcrST8mXErZ
         3EDhYmKSIFKevrBUoAY6ab/ZiKLHMLHjtPCRoGIUAEhud0MOs7iVJdKHc9BktWCMJjSa
         O/VdfvSn+ysVo6ZcnI/JTs/n3Zmq7qksVeqq1mTkR/P66kJT6hfFHPHjcm9UuPHvG8Xm
         HIPg==
X-Forwarded-Encrypted: i=1; AKwUvBynpXme8mMYeW8wyF7tR4b9wxUB41O6fBjuf3IbXEWPBDhpXwQfUbEaqHNwi2WL+87ZMa5dmnf72AFfqEc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJh92f+LRt7WmpT9lUpF4AeFzKReMNF9WRFhMFJ8aPRdUR3lFAh
	VC+hrc5ZydhqCD1A14b/i0Mw4XypEGUmSBohrrfcmcFEBs0YJg1b4EDat3FID/QsH2Y=
X-Gm-Gg: AYBFou3DnR2DuWmlsgKJeDFtTLk9S4CQjfW7vJwbIkZkiEDQnh9yMzFJf+wXGNuGZRa
	gGn5vSOZi0eaIa99auhGHMbFJlPpQvWIAEjDTQqXYaB8CMnz/xRfDymDjQK3W+mKorODn49iBfd
	VhuZS2XkAlHlRBVQyy4DIMNc0mJftneKygJWmDQDFYrMQeV/6zz9U7/ERNzBQdokWAlwlHZ6LKH
	w4OfD7NGMpi+8vTiZ4W/Nsab0TpV7lVkxJtCyK54u1SGBcX9YXcEWHQngc5jSmwcjW1z+I0ZPel
	0AZozXz8ciH1/XyisyYXbSrObO5PwFq5UAr6tcGC8CalLG4OAmWEz7ee4HifS/pdIKpE99QQuhJ
	hgPan0fwdnNWxtXVVqCUx8iZmNjPNfQSB0jfI+ekLnqoMlDd4ViXCZ8Y8r1H3+Vs8DWP7NdWpx8
	b49Dno4P7oYHqyo8lW+SKLkfzrx3MmtknjGRYtcvxgXIQUh5qJ4iaDuEJgd5d90YMEGKJBNZDGD
	GZJ3+81FOmUcnMlXdQtY5X32Yby3CfEbgA2sddyvFRCuEoaVHBjmKfk2Idlk6n/8LHREz4vxZFg
	bn1c7f+CC/YBow==
X-Received: by 2002:a05:600c:3e8c:b0:4a2:392:9de2 with SMTP id 5b1f17b1804b1-4a35acab6cdmr93617695e9.28.1793003770060;
        Mon, 26 Oct 2026 01:36:10 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6dfc:5715:ead7:7540])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a59d998sm186175175e9.15.2026.10.26.01.36.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 01:36:09 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Vinod Koul <vkoul@kernel.org>,
	"H . Nikolaus Schaller" <hns@goldelico.com>
Cc: Paul Cercueil <paul@crapouillou.net>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
	Paul Boddie <paul@boddie.org.uk>,
	Andreas Kemnade <akemnade@kernel.org>,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: Re: [PATCH] phy: ingenic: fix unbalanced regulator_disable() warning
Date: Mon, 26 Oct 2026 09:34:54 +0100
Message-ID: <20261026083454.29787-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <96da5fe557f3b2501447358895bd78decc4633ef.1735482146.git.hns@goldelico.com>
References: <96da5fe557f3b2501447358895bd78decc4633ef.1735482146.git.hns@goldelico.com>
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

Hi Vinod, Nikolaus,

I sent the same one-line fix on Saturday without finding this one first,
sorry for the duplicate:
https://lore.kernel.org/all/20261024051756.79342-1-olivier@mgcrea.io/

Please drop mine and take this one, it is the same change and it came
first. It still applies to phy next.

Tested on v7.3 on a HiBy R1 (Ingenic X1600, dummy PHY supply): without
it the unbalanced disable warning comes at every dwc2 probe, with it
there is none and USB still enumerates at high speed.

Tested-by: Olivier Louvignes <olivier@mgcrea.io>

If you want a Fixes tag, mine had:

Fixes: 31de313dfdcf ("PHY: Ingenic: Add USB PHY driver using generic PHY framework.")

Thanks,
Olivier
