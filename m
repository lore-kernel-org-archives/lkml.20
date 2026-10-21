Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575964;
	b=bfk1vQIqvCh6KlIYK4fDk4Ky+8jtMftymbbJQ040m1GEQ2vHkJVfcffz3U4GEMHvDk4i
	 Pxa7WoYep/pX6+IC2FeMaDIAXEnD2wQB/qap+O5MLK8wOjaWa2damgeJvUQ6Gcyd+GrDd
	 uyCcmdH5eKvNvU0i2U4uI68Q2hUaPvxeWT+4Luzq7HYQkZYvMW03eaQHdk1fi7C0jS8sG
	 q47uwck7Vu3cLwgSngatvLJNN7Al5eyXGbjLlJNxaYM6e0K9GeSecEkQ59Ff58EfvznyY
	 Bl3Lql2Wpe84jsQhskXN34imk8AT7cuIWDUNx+ClCViilKvMosl01rywtiBVMvGM8Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=24F/d8Z+ERFiE118WtTUpKViM5tZiEO9H1s/ycjWi/Y=;
	b=cV0xvSACSRhDLkbAZHd8W07dJi+tQaFCcMzlmOPjWJWAw8GQ1ZLaVH1gCqjlLTDD7fBT
	 nldutVnArQboKfReeqp+en1WH/OyX8gwsBRa69l7vkYKnXwUA06zpDWrv1v5gycbdCFY6
	 TgPuXyjKNKOfKZuROOKRJgEBc5Is4HXOgL90j/1/3gu+42i1XQZrXlivMfOJNCGYbP4fM
	 bVtN05MlaEgbLQq6w+fztTl3WyZ285/VX/c6MMSCyTDkAjbMyapjVgCHz0/79v8aSbaHY
	 bLS0SjRG3SBbRBCvWS4/gcw6fuiGMqxOaP94v/IOk2f46iEm29/qdA2LsIncFbwou6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PWoutujy;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD27606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:46:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADD27606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PWoutujy
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1dec056ddso3045055e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792575962; x=1793180762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=24F/d8Z+ERFiE118WtTUpKViM5tZiEO9H1s/ycjWi/Y=;
        b=PWoutujyIoRGuofHtTRZnHId0HXYZ+TiVKa3GHuxDc34OaszjKj6r1xqRfR8s4xocf
         upF/LOGDzkzeq1/Vjd36KiK45m+8db/XqNDiKF6H/C4qkPUAwM7n/wjEa/FEPH9d71ri
         G8ryHZU3RqC0X3P925JN+AqnPMyDVIdqU4Li0v//xBG/n2oGTmsj3NFAlpN9tYs3wW37
         gpvHhUDv4Xuyf/KRijLrIjMFxHv8q4hw3CzrGJ/Yd+FuYs5NXonm6FlIXvbcgEjt844V
         Gpgcf/qc/bsd9CQ7wcvg+dsn9dmEfj8LHga+yAdrjem5qNbPNCUiNO6wk6k9gGI36XgB
         cpgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575962; x=1793180762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=24F/d8Z+ERFiE118WtTUpKViM5tZiEO9H1s/ycjWi/Y=;
        b=Yg9Ssp0S0Z2sXwOWg6WlgR/DcQZSt/BXnV/y/E0OFrbHMTYAtTBT+zEzJ3eEva8qmY
         Phy4Vq9EUcZowpixCi7rqhzvjgPBMlVXLnzdDVTZY/uvBJxrMQ3aQAISNehcb3TfranY
         VvvH7ayJkfao9ZMNlgdFn+Spkm5PjuI7SrDmjLFkXi3yBRRk2B3MRirU82xWVNWGtPdX
         VUiqrTiURRrwiMj4nzyk7dLi/KXl78zIWxeiORvSozZDMpMsuaLYIZCKDI9DcvQed2Kt
         2Z03Fe1wa1VdbtkUaNIorVQ+EKndFihZnAvtB1Uip8RcSRIMDqlUbj7RCCAwjuM2mD+l
         6sKw==
X-Forwarded-Encrypted: i=1; AKwUvBzqFddvfqoZqz7Wv3iiBjno19ZpHWBp2vBR697V0mN+Mr2gc5EVFAWybjg6eBCT0EgPGJZxd1SH8DICUNE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0nB723CgRbarXNeeIor/zQqQDweP1iNlAto59rIpGwi31FqCS
	80Rw4GgDSmdKDfu4KU46K+D13xAUgDmKr5piLvFsDgu8tWp4+CUnXeWw
X-Gm-Gg: AYBFou127N3bb86XQ0pVMG6Ejh8rKV0vNTXwGr4fcf378PWwE6nXInVycaXomutNsM8
	a2KT2mmsMCzoJciq5xmGEkJdTMiGFiCoY6c5wmLNfwJwqEKdEV0h4ZYxioEd+rKhnnMvvIBVx7o
	+qAoWSruYnUsOr1XNPtOYqvUbKteZD4W0MDQSGIpV+UZcbSb05ulbm4/LrNnRfqvu5OOHXrK9vK
	5g/CuBeWjkf0xnmsUZUyFK33eM9E4ierHCXdPV5nGp2lneRGmKTEHNvg33pwHos/VWtsQgoW4i4
	mgny6Zq3DbAGoa//K2qzvUHXpCIjZp+lUYTIfQGjuWsNsmaYLMkaJ0o0XZLD7D0DV/Ks1NRyFIr
	weQys+1fbE35/xcrAUKIflLbu+JxdD1b81zy4HmbtJ9zveWHzcdwtnCz5ZQlzWuBSoqcy4ZoyYb
	3rYjAxZMhTEwx15mNJvG1EkLRPJz7Il7Z6hoJRTTUzpSPX6QWqdJCXZV9BY24/QrbNbAMneOBWj
	Tc+raZbq1XCx3LM2J/e8bL9RdFjEEAlamQcA7V7DpesJDeNNEk=
X-Received: by 2002:a05:600c:1f95:b0:4a1:6c0c:ab93 with SMTP id 5b1f17b1804b1-4a1fdd109camr28889945e9.28.1792575961841;
        Wed, 21 Oct 2026 02:46:01 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258427cesm4320300f8f.52.2026.10.21.02.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:46:00 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: akkun11.open@gmail.com
Cc: angelogioacchino.delregno@collabora.com,
	bhelgaas@google.com,
	bmasney+clk@redhat.com,
	dakr@kernel.org,
	jbrunet+clk@baylibre.com,
	laura.nao@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	nicolas.frattaroli@collabora.com,
	o-takashi@sakamocchi.jp,
	sboyd@kernel.org,
	sjoerd@collabora.com,
	u.kleine-koenig@baylibre.com,
	wenst@chromium.org,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>
Subject: [PATCH 3/6] clk: mediatek: Reserve missing MT8167 clock ID
Date: Wed, 21 Oct 2026 11:45:20 +0200
Message-ID: <20261021094542.59417-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921102522.1640072-4-akkun11.open@gmail.com>
References: <20260921102522.1640072-4-akkun11.open@gmail.com>
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

I tested this patch on the Sony PlayStation Classic Mini (MT8167) and
unfortunately it breaks HDMI output.

MediaTek HDMI PHY driver registers the hdmtx_clkdig_cts clock at runtime
[1]. When this patch is applied, the following boot error appears:

10018300.hdmi-phy: error -EEXIST: failed to register clk 'hdmtx_dig_cts'
  (0xffff0000018539a0)
10018300.hdmi-phy: error -EEXIST: Failed to register PLL
10018300.hdmi-phy: probe with driver mediatek-hdmi-phy failed with error
  -17

The original problem is caused by having the HDMI PHY node disabled in the
DTS, which is usually the dtsi default, but it does not happen if the
HDMI PHY is enabled. If this is merged I think this error would show
up on all the affected SoCs.

[1] https://github.com/torvalds/linux/blob/a804c5742bff224d4cb4d25dd383554d598be32b/drivers/phy/mediatek/phy-mtk-hdmi.c#L140
--
Luca

