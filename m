Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584688;
	b=DzIfWK3yDbhsSn9VJ0gkXuEAlo1o8TzV/RK91a0BW0S7QVBBu3Wsj/DEfc1Cz8PXCcR7
	 fiNpyYWWDGTGYl3j/vBa/9QdXsjW4TkpBb7mbjFOqitst/JQVI80mNWaR/JQPCverPSGr
	 KRZb0KafCZzA1qxmL4PRUSicGpX5fslfqgj2bgWxncl8QSBY7VHECCpNcOixTo8GnwBOY
	 MFm2AxBv72kjXqpzo1v1RBqtvZPhJgKmQ9hOhvyP5UvF69wDTmnpw2PkY/D9fSk+QkXAn
	 KUMfoXJs4XokEgAaf/5TEHi6bMgiwxmRhgGy9OtTOLbrIWEfQ9/psvC/O3EIy9+f1RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=IlVBna1TtvWg7z53GTsHNVCmcCxandIEmUciwncBErA=;
	b=wqMk6MhiW4UmAX8XgKOch9e6xyR9DtAuZFB1sw9JhFOwKgud2q307wW1BhDBcYQA7Dh8
	 ABblV5HanefqPy/EVYFZHnzo4z4zEFVuDamAM8avC0WcGkkylD5efGLyA8IBGBM426uxI
	 N+rVW7e9qnIknIYmXQlmKATK1Nru+P6qA5AvqHJy9pOmVvVJA4/IoXtnPEBxeTgss3P5v
	 L4Z1RtYTnPAkXEDmm2ggtIeCpAbXHdK/jygm/QSNooZ+AoDkM5BRJ0MFjxvAQ/GO5oWoh
	 igq5ODvgGv56id25eMZu64fNGCnaWsoFoxGVzC3/lwltS/B2EfJc/yYOOCHQBT8T5jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="We4Cxyj/";
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2CA606A339
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:44:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD2CA606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=We4Cxyj/
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b308fca7c3so10255147b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584687; x=1795189487; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IlVBna1TtvWg7z53GTsHNVCmcCxandIEmUciwncBErA=;
        b=We4Cxyj/ZP4Z4R+b+ym4kfzRGbmZuh70esTAu3IYFmiC62P5GwbPj9Y8I9OJjZObHx
         kjVF6X2pXmwD9ZsSIONV0E3iY02Q5oHe4juHW9zEeMNet/LToaOMqVh2U4TNC0W6BMuH
         Ll/TwrZLL4stzO/6ArLu8ohs3ShQyNAND9xBmgkh+wUnpe3ll2F63MnI0qpSlYaXWfMp
         R8ICW6cq4pb6GDUuzS5cDoDR37xIBFTiFpnhVgBGi2ILHjGt1XjEMkyTExIIXaUVQRGh
         todz4GGxnZQS+JFp71uubBhoWQZFbbmKrwrtEOzXrD5AiN3/ppNLJ1d6b7eQMGlbHggW
         W3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584687; x=1795189487;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IlVBna1TtvWg7z53GTsHNVCmcCxandIEmUciwncBErA=;
        b=RZSd//LMVTSiqoR9VNdU3xtMvC3mH4IDhrpEVEadenGvnN2U3POdGWjG9ngi4/uhBu
         xqKyC6ZW65qke5zG2TDwH84sDyeiB2TlIzZ64mKTJlZ0iPU1OYArFrT70sM85g+ixYxL
         zHA1aqQtQAnSD9JfFn+utkM3vNj/kbtYpFDNLB7zMhLdF5Gd5MvigcCkINbi3Baqf7mK
         D71AAXq8sRVwjbSO2XqN5nH1z74X/2Wn/PzVPqiSX6smuP9rIMkByybM4svFa3gct/k2
         Xj0zSbQroKr6B7kbv7I4jPnzJg5KClHIQugOYcEuE4xwt1H1sCII7vWTaNUWOWsX5mWq
         IcHg==
X-Forwarded-Encrypted: i=1; AL+hErGnefYXyYCx2YTvyT/5vaJSXA0XQMdGIocN3v/N7HLw/SENFPmlfljTDOv114z91aICRYEgLNtL04Qnecw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mq2PD94e3SnNhecnFIs4QMkj9j0JKPLFf7a7KxW2ZPsnmU2Ck
	jAAr9TH5ojSCBVl6y/sGOFoaDC8nEK+eAYnUdeWX1GXkFPfsxx/H754C
X-Gm-Gg: AYBFou30VLh2cWzU7HoUAPO9vohDgS32aPEF5k3DVW0ZdKx7ee3ZhVCdwPft8Xo/vYB
	+9ywVGgFgu/aRjjlRgr9HT7GJKIkf4JqSQO16G3FNyp5dE3wPGJbQ9lmkVppKC6ZIsSOGLfZxlJ
	MnuOC+jGnNhNpt4/j/vHvVCu3446nW1bhj9/kMootBqxFthAXTRodGjnrr0iUN1iO5dd66iWaNl
	s/jONUCCU6MEw3IOCBzJNmzysGsOeYhPv/3+dobEOeF+7LMy6Zzf0MgUMvo2y2YogkQSCXMhzQU
	GJueClJzhPly3vAZkc+AM+8ISWW6w/MAkVkovH3jfMQex2eCZoxkGDLP0kFcopF0dI84x6u9EfO
	NLUawmF6CBLFtwMlt9+xRUtufwy+tLXOWADB+owLtOoeYPbIOf9ReKHDElcVXy3bBgmKyPLVKga
	3AN8q8SODsBUKGoIb4RdgKX73d20ZzFoaf+zPXQzRYwi3S6kCvGbDJGVq5BY32cZ2jd4oZdPjjy
	iw4ZaWD37ELkObz3xfEjuM5Dhyl9U3BqVubMsEzPTaonqlzF/1GT/ggW2YLHkcUXY3TSE/1mvhk
	HEwyd/oXcB64+VegPPS1fzJoTyN9Z7S4
X-Received: by 2002:a05:690c:c:b0:8b0:acc6:8e5c with SMTP id 00721157ae682-8b4aa0d010bmr18869707b3.9.1794584686400;
        Fri, 13 Nov 2026 07:44:46 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa98caffsm22687767b3.27.2026.11.13.07.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:44:45 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Subject: [PATCH v2 0/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex
 Capacitive Touch Display 10.1" LVDS V1 and V2
Date: Fri, 13 Nov 2026 12:44:06 -0300
Message-Id: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-0-59c45f0a0d8e@toradex.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEYw92oC/x2N0QqDMAxFf0XyvECtTmS/MvZQmrgF2irJKA7x3
 1d8u4d74BxgrMIGj+4A5Soma2ngbx3ETyhvRqHG4J2feufuWD0GzUhfw0WZLYbUnLzPecPKSlI
 wEGGqZEhiWwo/w7U913DDGAfH89hPBK2xKS+yX/3n6zz/kx2AHY8AAAA=
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794584681; l=2077;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=Q2mTJ7efr148vCErD5HWpVyB0Hsq6rr3sJWLD+6PnOo=;
 b=vwPliPd0FIeZAo0T7lJ0fzGLYLA2vrxZUR15hNJE5V8Dv3HtNT1J36I0IQnXVen2qdujDfggD
 A7g9G3o0h54BRVOY8/FFs151oqWBfQUf+LD4RD6K2r/B8BQ0hV/Z0AQ
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

This series adds device tree overlays for the Toradex Capacitive Touch
Display 10.1" LVDS V1 and V2 with the Verdin iMX8M Plus SoM.

The display addition covers two interface types:

- Native LCDIF (LVDS)
- DSI-to-LVDS adapter based on the SN65DSI84

Changes from v1:
  - Include 'tdx' in the display panel overlay names, to make it clear
    that these are Toradex products, and add 'v1' in the Toradex
    Capacitive Touch Display 10.1" LVDS overlay, similarly to how it's
    done with the V2 display.
  - Link to v1: https://lore.kernel.org/linux-devicetree/20260813133335.1941580-1-leoreis.costa@gmail.com/T/#t

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
Leonardo Costa (6):
      arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch Display 10.1" LVDS
      arm64: dts: freescale: imx8mp-verdin: Add Toradex DSI to LVDS adapter with 10.1" display
      arm64: dts: freescale: imx8mp-verdin: Add Mezzanine with Toradex Display 10.1" LVDS
      arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch Display 10.1" LVDS V2
      arm64: dts: freescale: imx8mp-verdin: Add Toradex DSI to LVDS adapter with the 10.1" V2 display
      arm64: dts: freescale: imx8mp-verdin: Add Mezzanine with Toradex Display 10.1" LVDS V2

 arch/arm64/boot/dts/freescale/Makefile             |  30 +++++
 ...zzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtso |  71 ++++++++++++
 ...zzanine-tdx-panel-cap-touch-10inch-lvds-v2.dtso | 107 +++++++++++++++++
 ...-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso |  94 +++++++++++++++
 ...-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtso | 129 +++++++++++++++++++++
 ...-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtso |  95 +++++++++++++++
 ...-verdin-tdx-panel-cap-touch-10inch-lvds-v2.dtso | 118 +++++++++++++++++++
 7 files changed, 644 insertions(+)
---
base-commit: 33adc96ac217d6e95b7c44ac383c19ca4ae2ff52
change-id: 20261005-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-034c30e8416d

Best regards,
-- 
Leonardo Costa <leonardo.costa@toradex.com>

