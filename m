Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562458;
	b=fPrEAVGQ63Avm0sXUtkxYzXRbIGk83mN3UEeRxVsvjyGnOV4OIZ1q9B4VOTlZtCFdhB3
	 hONiqQEcRajQ9BTOOklulKbKMKlLXF0zJnLXz+0/nMuip2MqgXc29GKXBpA3966Zopibm
	 fK2hIHq/Y1M9Kr58L2TPI8PBEATQwXD0TAbwzMbZOTan+b55T33vlI6A964Q4J0aXl5RX
	 DB1xmGVYe9EjFR96Ofn7YWW9t7hSvBfW/niL/KHm3PLjqUCSI5rAyyNPoxcBVe9bjtPeS
	 Pz6KP1eAcS7otw5LqKy9v8Hp6yU6NOBqFyQcYXbvpGu4+zPyMMmavIpugnZtM2geJcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=hZCxWGNKVDrgA8OGLPMyOoCY7CLwULXtFPHSf9AA35s=;
	b=bUCyYzptvnHIpRvI8L/bz1Pqra9oqmI2C3odM3iYE4GjIJdEoYCO+IqfAu+7FvtqlTrq
	 bdMeaLkQ1557L1g7WqeklzzifF/suZvjzJjrGEUX6Eyvx4XHO3e7cHPv/XbPro9pCuxgY
	 fxX5T9tAQPE+Xc8Mkq64/sM0I+MeM1bwtgJSHUYlnFF0D+nBm8As9R4nUBVcq5XRbGka/
	 2kF8gW3LvFft5sg3+eKUVkO4BrY9NL13NqUXGkAbdUbzNnd9WtRFbyy1/KTXN3RjTypbD
	 QNr5FuhQlFl8oT6/gdb4A8Ndgt114QiFBZrPHqbWhygF/FLEbyD1FJWy5IZi2VJKBDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Gqw1GNso;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939CE606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 939CE606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Gqw1GNso
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1ddc7c9beso1236875e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792562456; x=1793167256; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hZCxWGNKVDrgA8OGLPMyOoCY7CLwULXtFPHSf9AA35s=;
        b=Gqw1GNsoCG+9KpWkTPYZzo+UaJvUCPA1dNDXZ/0DkIGndas1vu2bJLzJJ2IGjdi1mb
         vE23Eq5mP+36c0R2qOUL2c56aDDhjSDSV8O/iOjqhzgrvjfhgjrg+punJr/auEddv8w0
         icaEOo5omAapcuEKLbeSGH4NKWfsB5vnjVwVHGsNRrDnFRPpKX5dNehplZKOlMh0Fk5I
         e8y2PJb2ao/d2LybEzsv/QXoajuhFYTD8466he41BvH4znFoeQvmIjV8Wo/ffYwq2G/O
         aXW/9MeUHo/CmPpWOq7YAg0VK4E+UNuM0EKJAq/k7JLKXmrGQaQNRNWqMadHK7UMyyat
         gQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562456; x=1793167256;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hZCxWGNKVDrgA8OGLPMyOoCY7CLwULXtFPHSf9AA35s=;
        b=k/WD3PlZUy0BAnGrIWV/crLHFjWTCP+EYBDzzW762/qz2+0IblVc1V/L4DQ3WBLDJh
         wFMNDMiFHgcjRmsxpy8TUZ4WwGjIYYzddmIu0TVXekqi4p8dHYXT0xlFEYzFunG5ZhmZ
         loTG219oe+yai0CnfiK6ANlZKr3X+8rC4ws+zS3EFrahn/gOs9sS0pOaZvs1gApovOnX
         kFCjWd6Lo7nSW2w2eHw2pHmyUX5u8ls+yi3mq2RrS7ryjSxk38OZ+SSk8GxHf+Dt75Pv
         dR9Wlcqp1qJSQChZR+cZtW7nFE8iU3vXGktx1FaIxBEcTN4Gt7jdxZ1mfrvTMGE4OEaC
         by4g==
X-Forwarded-Encrypted: i=1; AKwUvBw6z6MI4aqnEQk8H/1Yp/DBQgqP+JMA6byf49yH1rUkhVtJdXoDEPz2dFc0CsPH8MQI+PtKPCBOnBElzWU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFPJGcv4ajsGeOJLSKLG/csGPUHBEIV6CET6oEyRZ7jOiJZES5
	ZZy85MctmZYGz8S5wCy54UaI2hkaYrzwWTGl032jcN+dkjHeoMCgKGll
X-Gm-Gg: AYBFou3IwVY80EczEwWs1kiS5FuOhJeY4eNVszXPk8swUY66LVx1Nm7hCTNWRniyYWn
	d5upZUt0lbmJu9sLCql//ByNYkSL1rfOinfE2cArbjxVTM3joW0uOIKaEp+VkdS9PRe0z6xbhEZ
	5RbadpYcdBB93NUj9jFANOrj4ijcBbR0pdKu+oNBo5+tLHBRqjVO5167n/ff69wxbZLws68x92S
	X8fUSCA7j2ewg3G9XUXA9+fopMjqf9mU2lZozOXNbCzajW2Ji0pQvoOGch7uf0sr4NGqcJU96nJ
	nZKoKNuFT0mvt/cadlZVRq0bUoMX4oaL7Hd1Mh0f22PTPiXguHj3rKDgU5nYRUOYh4cxYCbiha2
	icMET5cmAxtKYMHZEoAykFBrG8mDDVYX8vueU4YIaL7C6nRiXjcVLmQPZkTwzk1yC9a/JCuYEoM
	rdoSxMIkcQWNWPJgzVgYUCGvACAP9mZfPTNmSiGJY2v/rz/59hkfP5shKxr8//tD1o5aSuNDGtL
	ZtzTdRLFFEdWGaiFZZmKfJKZ+99X/1Y4gWvnIaZ+kFXHHKN+8wyD0qQQlrFSvLuaeNhaLfoxB/k
	xBfGh6ISupOan8L9hdfu/XwW1VJoFGjUM9Z5t+0Wn7qjiJ0t
X-Received: by 2002:a05:600d:864d:10b0:49f:e941:d6e with SMTP id 5b1f17b1804b1-4a1fdd399dbmr10139275e9.21.1792562455713;
        Tue, 20 Oct 2026 23:00:55 -0700 (PDT)
Received: from john-desktop.station ([109.77.5.121])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb83ff0dsm63793845e9.7.2026.10.20.23.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:00:54 -0700 (PDT)
From: John O'Callaghan <johnocallaghan@gmail.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] clk: amlogic: Improve the issue of PLL lock failures
Date: Wed, 21 Oct 2026 06:59:25 +0100
Message-ID: <20261021060005.2947837-1-johnocallaghan@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251031-optimize_pll_driver-v3-2-92f3b2f36a83@amlogic.com>
References: <20251031-optimize_pll_driver-v3-0-92f3b2f36a83@amlogic.com> <20251031-optimize_pll_driver-v3-2-92f3b2f36a83@amlogic.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Chuan,

Jerome asked what was tested; here is a G12A data point.

On a Radxa Zero (S905Y2, G12A) running v7.3, sys_pll_dco occasionally
fails to lock on cpufreq transitions, at room temperature:

  meson_clk_pll_set_rate: pll sys_pll_dco didn't lock, trying to set old rate 6000000000

It happens with all the sys_pll OPPs (old DCO rates 3216, 3408, 3600,
4800, 5592 and 6000 MHz) but, here, only while the video decoder is
busy. Reproducer: the userspace governor, random writes of the
1200-1800 MHz OPPs to scaling_setspeed (~700 transitions/s), with a
GStreamer v4l2 decode loop (meson vdec, H.264 + VP9 1080p) running
alongside. 46 C SoC temperature.

                                       transitions   lock failures
  v7.3                                     500290        33
  v7.3, no decoder running                 250056         0
  v7.3 + this series (1-4)                 500089         0
  v7.3 + patch 2/4 only                    500066         0

So on G12A it is the 20 us delays of this patch that make the
difference.

Tested-by: John O'Callaghan <johnocallaghan@gmail.com> # Radxa Zero (G12A)

The testing was scripted with the help of an LLM coding assistant; I
ran it on my board and checked the results.

Thanks,
John
