Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AA44508E9
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144660; cv=none; b=VtZ0HcZ9Kw/JLxDQi26wC0CSS/hr3dVO7kZL/gws4TKK46wI87ZLBUDdUHw6H5GJvaAXJmqJau2ZqUfB5AflWaFudF0A6iIxeraxLtyhn3kWI+LrDcN26vtFRiq2ZakTP3i/TdxsvUu55CtxJZUUSuGzg9vCAD/W63sx6xgHo+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144660; c=relaxed/simple;
	bh=Zcs6tKuWm2/DGMhaMXXZbLjBCcLLaptFct2ql2IHJQg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=S1kLce1KDqYVe0ako86bjozvZ8GJgExgCtB43dnHbmtBnwjcZ6FbKpazxRoqFKCGV5coD8cwncUc5p6RPMWK1jdMLHrlMRBlL4pZ/oy2EhkNF9AoWx7doqCuzPoIucn/uWrN0ni/hShIy7UFUq2YRf/Kwt5Bb9Yk+YWae3lrGCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Sx0Blv7l; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Sx0Blv7l"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48b060ec084so4044950f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792144656; x=1792749456; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ya1tsXzQ6mk3VG6jxM9Qg9qvX/WcwUYUuy//xA+G4uk=;
        b=Sx0Blv7ldbDKgnQKV9qRD98L3LxwQI8kDKMLhCu0dXRBAZPf0NJym+D/s2SvC/OMEF
         Ujp+ciHLSJaWU2+EQLOSZwQ3W+W4FykNDQxbISzDd6hGuKXUOJy/be2oGgbcvknEKcf0
         0G559yNAGlr8VC/blD5e8T76PBLgE26O5YVfHYZhuRPMQGt4eKDTVYJANzgVGsc5TT8t
         TyOBUHK4FlYfLKk4OsIp0FQyWA2b/Qo7eyp2G2qKeZzRnOSHnXSDcqS98iE7+UX9L+Ov
         2tdtqUNq/+8VUX11XA4/bwI6hlKrZlLPqtyiQeZxlwhd+XEDWJoqNk11narMVsTRTGW2
         pfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792144656; x=1792749456;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ya1tsXzQ6mk3VG6jxM9Qg9qvX/WcwUYUuy//xA+G4uk=;
        b=mGxzzhJ/bLLFUflA9OtrpqftSkWhbXZUxip7BJirr684iHK02TrvaWYTlN2y5xU5DM
         C/XdWkaktqzsh53Vxxqnf5H1ZGqh4Ix0i4UeayWcm3kr7Z6k6f/pGts/KKp8fTfqrIM/
         fdqBHdf1T/1DCBNdjA1nNA9lkDamLHY1hOaxqboa0StDpSzm8gExMuR4hFg5ZLD6nhlE
         uzEyZcsws1MhUpFQ6VVx1dbF6s2UTyG908VCPROJqeul4LsvRewVjoWCG9xn08VDhY11
         WwlAbhzHG5HjlPhXlaGosofaybwY3xv4tmkw4Z3/151hBXJYA8EBq0EZdALLDpqKohk6
         L93w==
X-Forwarded-Encrypted: i=1; AKwUvByAOYh8R4Lphz7q8SXZKKCZoIbWteqmKEBVqnMI5VNGS6krjZKPydOypkfC4oosQWk20dYtR6mFrjUoifY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBsPD4nn8UEZ8dxFGZwHhOP7hwf53YxxVaeFgKh512aFpFE8LR
	noKNw7g10Gbg6RhLGMmXjp2S++AnFgGDojw0aRuSZy0INtM7WlvKf1186VCgyL0aNvc=
X-Gm-Gg: AYBFou0XHkYPxFTzIuVi/eOlrhODtTaDDK9q5yO+DakHRU+chR0WIu4FFEfPjuUiovZ
	eeE1Ke+xB+PZKETEZRYcZCRNogjzDPvwkRUWuNGiNCvNqStKdB8iLI288sGkAfCwIWahEVbq9yI
	NP1VfE+BMi1E7snYr8GHbUQLCU0sgUChxoMK/q3qYk6gz9j4WCcKk9IpkxXF8fHEKPaAsCgtIsc
	bVGoj/SQkoO1+QdAmD4fp5Rqliahkz4N/5Vr2K0Ep/ljNEhACfkfux0Y7V4tJqw9xWy3xwavC6X
	Sl2zofekPfvPLj9ZQxGFQqzGCg7o97uySFEi32j/09C5twWrHj0q/bGwWbjE8zuSn6SonUFfwWL
	Jqi/nbGqsD+FZQtBbV3We8bDPQbrLmOTEe+oxE9npHhkkcmSWvjAGzxXbqBN0+rlPMeoG0KcbWW
	ooEfFDJf5E6+nMm1GEvBELBnAcAgMLZhkXeDw3sRtdxQ25vdvVSd18vbFjnavFpBkF/as=
X-Received: by 2002:a5d:5848:0:b0:48e:390:80cf with SMTP id ffacd0b85a97d-48e03908148mr103784f8f.32.1792144656011;
        Fri, 16 Oct 2026 02:57:36 -0700 (PDT)
Received: from localhost ([2001:4090:a244:81d0:2c16:1c4d:8a04:e0bf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd510ba3sm3959893f8f.56.2026.10.16.02.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:57:35 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Subject: [PATCH v2 0/2] can: m_can: Fix suspend deinit() error path
Date: Fri, 16 Oct 2026 11:57:11 +0200
Message-Id: <20261016-v7-3-topic-mcan-suspend-fix-fix-v2-0-7efa2b172cce@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPf00WoC/4WOQQ7CIBBFr9KwdkyhaIsr72G6ADpYjEIDLbFpe
 ndpjWsXs3g/P//NQiIGi5FcioUETDZa7zKwQ0F0L90dwXaZCSvZuRSUQ6qhgtEPVsNLSwdxigO
 6Dox976cErwQTXWPQkLwyBMzxbri1X46TeqAet9mt0ds4+jDvLyS69X625q8tUaCAjBtZl7o+c
 bwqOT+tCnjU/kXadV0/RTFhOuMAAAA=
X-Change-ID: 20260914-v7-3-topic-mcan-suspend-fix-fix-b943929d8fef
To: Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol@kernel.org>, Sean Nyekjaer <sean@geanix.com>, 
 =?utf-8?q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>
Cc: Kendall Willis <k-willis@ti.com>, linux-can@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1287; i=msp@baylibre.com;
 h=from:subject:message-id; bh=Zcs6tKuWm2/DGMhaMXXZbLjBCcLLaptFct2ql2IHJQg=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqyLX348u3dT8Nuc3Qs9/vtmuH8POyamPWfH/50ccqJzq
 naX8O9p6ihlYRDjYpAVU2TpTAxN+y+/81jyomWbYeawMoEMYeDiFICJdCgxMvRM25UgIRsV4uO3
 d9WW/EkMHhXtSeG3L84Q9Onsf9Z22IeRYU/CQtbrzx79Vm2Xnu6ZN8WpRy5eL1Po6NsjHJeWFHT
 cYgUA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Hi,

this small series tries to make the suspend error path of m_can a bit
better.

Best,
Markus

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
Changes in v2:
- Add a patch for tcan suspend
- Start the hrtimer if coalescing is active and suspend is cancelled
  instead of modifying active_interrupts
- Link to v1: https://patch.msgid.link/20260918-v7-3-topic-mcan-suspend-fix-fix-v1-1-e24fa70c754e@baylibre.com

To: Markus Schneider-Pargmann <msp@baylibre.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
To: Vincent Mailhol <mailhol@kernel.org>
To: Sean Nyekjaer <sean@geanix.com>
To: Martin Hundebøll <martin@geanix.com>
Cc: linux-can@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Markus Schneider-Pargmann (1):
      can: tcan4x5x: Add suspend error handling

Markus Schneider-Pargmann (TI) (1):
      can: m_can: Fix suspend deinit() error path

 drivers/net/can/m_can/m_can.c         | 25 ++++++++++++++++++++++++-
 drivers/net/can/m_can/tcan4x5x-core.c | 11 ++++++++++-
 2 files changed, 34 insertions(+), 2 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260914-v7-3-topic-mcan-suspend-fix-fix-b943929d8fef

Best regards,
--  
Markus Schneider-Pargmann <msp@baylibre.com>

