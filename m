Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E3B4DDB5C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790119680; cv=none; b=YiEEYxYUzccajdK+4XFb5O+/vnzWJtyd+2tsRDkbZ/n8puBBRs1qX/x90psQBong4gaV/OpegLE5x/yoLBkAYsilLHawokEbKIydAR08IOqDhaDWoux/Pt+1uA4h6Jq0OusptaL7s2ORmw6+ufzll4iYNxX1wDdBquNkaXV60og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790119680; c=relaxed/simple;
	bh=0LGURl3KOzcIf/uzIsA7NYSodW43r248TxGYIjWU/fg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XlRP39kQ12WkBY3RJPGsEd+oowZ4hCO3HjbdRyJV2qygRaulYaH8fg04w9ZaazAxRCGtz++oVb3eoE7DVpwILAM7ohl3JvFbMjidAvr8c7cwS8Ke7eEyDtx9dri3ycr3T0wxoeatpiEZfqhEZQv7WwvXXjD7z3ytQzBvuuPpUQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ji4TKtVI; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ji4TKtVI"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c206dc8b0dso357132b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790119666; x=1790724466; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jPMMzPerF76ev1rgt9IqVi5wI7uHr29cgpQnNd/IeQk=;
        b=ji4TKtVIPZb4cE3FS42ZRO/Js8RwqPH92vYBfi8AO3yqDCg8R33oTZa1EhI2h/Ortr
         Xy7MJjqZpJY3zCkt9wuvSTfVPsIiXMAf7wQkfApbn9l9bCLtblgB+njQi9tPmfWPvgWj
         osLsObRNF0NELIwBaJJqEwrdMhIg2m9qjl06H0nSTOQmj7r2TETgCGMcHpu5b/Qeazwx
         ManpEj245xTEsPlqmL2V+nvujeDF7U8x/cSfkdvrkkBQphqcBWvfZ9Ld6Og48faQUTBC
         8IlWM9A/W8OctToHMMLjEjJC3PG5ErfPuAUCfTi+HTpbOxANUOxNrMzoc0BZIs6kYmug
         3CDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790119666; x=1790724466;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jPMMzPerF76ev1rgt9IqVi5wI7uHr29cgpQnNd/IeQk=;
        b=e1ZYhFxkwc3RDjOJVKTbXzZndt9vp3538c2FOiVZd8zgTkHDuZWSGv5WtUGl3sK6nk
         jcu1BY5/9/Qx2Yh1gEnqSikgufMy+iHapERLYqEpmJN3FejGVHANy5Vqw+OBE/62Acgz
         YLqAx3yqPGC21LhQq0yqsf2fVu60R9R+eYtoIFLUNGcZzTVAdNXyG3ytl0ewzi3qCgfN
         V67kdijH/VelQeHDzvYjVNrSAU71M24VyTKfpBIUFl07rdFkqixoLZ7IaQXqFHTPjqY9
         eDUE5d9EsgvNS9gzDDNumg+cjTgokVWsKoIQpQghlrg/N6X2DQ/P6Ue3bHYX8mKC6XDt
         VtEA==
X-Forwarded-Encrypted: i=1; AKwUvBwq39BLpXPG81hFctgSlf6hTapiJMovJGq7BCASYC0yk8bEs1FGl7vSNCneHf9Zczcg7mbdzSqtJG79DNc=@vger.kernel.org
X-Gm-Message-State: AFuF++kCBVBzHes+962GgI+qk6a+juF1G04GnnTrsBzitJ4pwYhbz0D4
	KHlCTJYN00kPRTOMu9dwmlsSpqp7uoxblRQsFElhdu6QNK6zUcnOjDGj
X-Gm-Gg: AYBFou3C41kkYuc9J3eRDgSN9D4BIKYA5eWkxEO1M185fZPT0i7csluR53bh7pqzlBG
	3e+m+GM2IywId70iwIHYbHdscvJ27Omn4CGhydfER90S+s3T9ca/ZiQctGV73sad7FnZ9JWcFBM
	F7QYln9F15J17QVBlOmQx883FA84ql21JxaKw6LSkXVENmLvsVW4jss5SknSvD8CrFIgya+3dY9
	gtudrFM4Z+PU98MV3JY/1UCwAijOQLIBmib9BuC18ZNlo09+788hjVK7GE7p7I1ZtsGuMuRnmmG
	vUO36MxNJf4Rf41GLqPMKka0ZxjupBDqf1j/sC/fF1K/OTrO+GifX5GyKxpv4QwD/G4Y8mLfNpt
	DzsDcZkhIABSSR9oL10o8kHtBiV6eHWfNTn7G8AkiYJDRw33eh9uuiGNea2jGcNSMmVXK/wc4pa
	fSmckpuyZFgsC9y/C9VS+JZfaoYH2V4XLgyJCpi9wNUBULh2/RkQnW2kIpZB115ocUsMgOkzNpD
	awfAoV41bd19Cv7xwFx0kPUIJemX1h/213eYs5o6WsSxaxt4mR6kMhkngzeUp+GzXWkBu40Pu9k
	xDHRVMWNtxXxzs9b3eP0U7J1z9g+FpEotp+HrT7jRKi78U6N2gwLxK6mED3bgjjx96T5EKdouRP
	spH0UjPob/Ca3UF+r0oby3Q==
X-Received: by 2002:a05:6820:308d:b0:6cd:3ffc:e329 with SMTP id 006d021491bc7-6d2d2621293mr774668eaf.71.1790119665547;
        Tue, 22 Sep 2026 16:27:45 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81603fc87cdsm1243053a34.13.2026.09.22.16.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:27:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net v2 0/2] net: stmmac: fix failed MTU reopening and
 hardware resume
Date: Tue, 22 Sep 2026 17:27:39 -0600
Message-Id: <20260922-submit-stmmac-reset-fixes-v1-v2-0-d92e609be996@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OwQ6CMBBEf4Xs2TVtJUI9+R+GQy0rrLFgupVoC
 P9uwR8wmcvMTt7ODEKRSeBUzBBpYuFxyMbsCvC9GzpCbrMHo8xRWaNRXtfACSWF4DxGEkp44zc
 JThorb+urNa2xzkJGPCNtt0y4wEAJml+YIXfyaQWvtZ4ljfGzjZj0Vv7vX5bCunIllQdNpNS5C
 44fez8GaJZl+QLBbXFw3wAAAA==
X-Change-ID: 20260921-submit-stmmac-reset-fixes-v1-7c98b92d29a9
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Joakim Zhang <qiangqing.zhang@nxp.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>
Cc: Richard Genoud <richard.genoud@bootlin.com>, 
 Alastair D'Silva <alastair@d-silva.org>, Maxime Ripard <mripard@kernel.org>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Keep the stmmac datapath coherent after failed MTU reopening or hardware
resume without changing the interface's administrative state. An ordinary
down/up must release the resources still owned and open a fresh datapath,
without disabling NAPI twice or releasing already-freed allocations.

The phylink prerequisite permits an ordinary close to terminate a
suspended instance directly. Resuming phylink solely to stop it would
reconfigure and restart a MAC which has not successfully resumed.

The stmmac fix tracks running, suspended-with-resources and released
datapaths separately from IFF_UP. A failed interface stays detached until
successful resume or administrative recovery. XDP, AF_XDP and debugfs
paths which are not excluded by detach also respect resource ownership.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Drop forced netif_close() and retain the interface's administrative state,
  as requested by Maxime Chevallier.
- Separate queue quiescence from resource release and use explicit datapath
  state instead of a napi_disabled argument to the release helper.
- Handle repeated suspend/resume after failure, preserve PHY/PM ownership
  until ordinary close, and allow a fresh down/up recovery.
- Check XDP/AF_XDP cleanup, descriptor readback and asynchronous reset work
  while the netdev is administratively up but unavailable.
- Explain the generic phylink suspend-to-stop transition and why restarting
  phylink after a failed MAC resume is not a valid substitute, in response
  to Andrew Lunn.
- Combine the two stmmac error-path fixes so every user of the new state
  has consistent resource and NAPI lifetime handling in one patch.
- Link to v1: https://patch.msgid.link/20260921-submit-stmmac-reset-fixes-v1-v1-0-87a4e431ee00@gmail.com

---
James Hilliard (2):
      net: phylink: allow stopping a suspended instance
      net: stmmac: keep datapath state coherent after reinitialization failure

 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  11 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 116 ++++++++++++++++------
 drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c  |   8 +-
 drivers/net/phy/phylink.c                         |  17 ++++
 4 files changed, 120 insertions(+), 32 deletions(-)
---
base-commit: 17741334d00bf5ebd37f8c1c36bc9c146a351deb
change-id: 20260921-submit-stmmac-reset-fixes-v1-7c98b92d29a9

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

