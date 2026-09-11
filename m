Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A673D3B38AF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789091237; cv=none; b=LOwCkT16Dgs9LWMNOLk29pwNl+RierMqww1/PhwEONPndkIxxf0hMoW7ZyfmhO9fY8iTMzUAZWp9W+Rqptan4JOnlwheRWORu6V/u43RCVxI0pyAefG4Qv4nCPHe8JWPDzKGz2PXjoxSapkCK5Kv8FBVXrFPBeZk8+AdwSuVtco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789091237; c=relaxed/simple;
	bh=amircKFsQSVMD+/rRrvYgzyM8Q4jO7GtQCebWYtVYtI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KV+hY3j7yZ9+wnh2DRnYlcPk+5r0xnf+k4ODsysS+OE2s69uGeuJyiqtlYFJMjpaTaJez+EswFb9/I6iWMhLg5aELkBq9abn5LZHMtzg/JcY/ygf/sBZM5KCEvrnInZuDDrkFnpLT0XioEuVztjSimRDSYRndmofmTPynmAEw6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bqn0H4nH; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bqn0H4nH"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c294183384fso71337766b.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789091233; x=1789696033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=P/JdhZuJmGxbdPBATNQfsl32tQ2hN7o8XLbvAZezdWc=;
        b=Bqn0H4nHXydJ3mT6sbJfQvVPh5cJIAHTozsX/i7ktuGnieA9QereZsXcbEGLeVbrfl
         KZFOT80L/aVVMwIc/Jic4tNEQ4h89nSLTE88y0MDGq1tbmnHHmHzltNO5faU/TNu+Q1b
         oVIw7nhicMcRHYl3pEQ9PEevKnPAYVSAyhd6cyOsy17kJy4mzcvOYdSggjIxAql+pbRv
         7byNUKnwoA4YFPHpfti5rx9L8BurJoWjmShQGmwEqHrQKAdfp5+QsNpkIPVei3CdxXPl
         phXIX+N048RPG7oX4Q+7w+MDNbsOdU5PcsWo1KMpn5x7F0n8UHyBBrXlBliMO6cblSNI
         AeSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789091233; x=1789696033;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P/JdhZuJmGxbdPBATNQfsl32tQ2hN7o8XLbvAZezdWc=;
        b=etbGh91GnwgTypOGwxmDEU5wA+txAKFWP5QHHmvq/piKKKxTrWfqp/fy5leHLo2O/3
         MgbM5CNRTnDVBa3sGmoSv1bu2+SeyH7mP4eL4skjBBvlNA5SOorixg0yM9nUTcnXm3GE
         3X+iKNST+HWczOHaF/LSGrlK659nnga4whx+9HgOKexxoJ5XXh1fq61k3+Boi+udGgYI
         9K18splLSartqMlbb36XVDOdbSnGrOwpnmxqOgnA2l1Tju+003e1V02D0G8Mt5TFLHgz
         Tx1b4R+D0fwMd5hHZyPi6EOVNykYbKtaohFa5jW7IrX8r1bPDOih6ZBa3lblnUytVzGK
         0QgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxr5TI4orvSAI5l8fVrX4S2J0lSHu1pNVlCKi2wO8kdycaydlL0ihepRA+7hrYMccTuFRIZ7V4l9ocJ0qA=@vger.kernel.org
X-Gm-Message-State: AFuF++kNtF2qDX2j8jtbG4VWXKQpSasRinM90ZDDb1GV28eb9AR4bkEe
	HXQAZ/7YBwSgZiGVsW1uVKiQ+JmEU2PDbf37vaO/hcCGoETXAm0rkwRpYQIr
X-Gm-Gg: AYBFou1yUAKXKicoWIsR4DTmJVwFpneHXTmcERdByQ1yfoIqRqcRE+J5XjWIckkmL2T
	gK0w5m3/WcgpcrV6OnWXRWVFdE4VNZoPoIvK0WYf4fT6PFq9A0DSGUwACWWWw4fxKRbDKTL192C
	xw318H2YAjxFj0NSa2LqSGc88b1WKbvoqPBYGXJ+Q6Ppgo+MHKPpZ6ezfaY5RoHdZBAmA4t4FKU
	ncmHvHYg6cCfNfuvwEx2FMkXO5+dUOZMkEIO7ND1w02B7tf7QRJqEve7Yo4O1uJX5gykNvlXDoN
	O8p8OoxvO1Y2HCJMOHuv4lmvl4kxJ+YexSdNXCeNmv/bOZwMoMDxrXD0mBIk76xxPfGkkG7leRP
	TemHEZEHOD9cnI3Yo1MdVCPaCpdeG/iGURjaKoId/mQXiLgC6aoJuwXFddD32PTcxWzearRIy3U
	kEF4ANWk4EdJhS6V1M0wocDhTETgEPSAqZ39PvqKDcUUhd8SNJDa8/iibcX1rKzSVBdqrSk5RfE
	qnhQnp8btkjik7GrVEzO3ElP8dexelg17Eb4unJahekx1nYU3d+5p455i5OQKpgnJY0xDGm/RA3
	ndq9N4h0+tUTqBk=
X-Received: by 2002:a17:907:3cc3:b0:c12:e178:9e68 with SMTP id a640c23a62f3a-c2966668eb3mr59141366b.19.1789091232657;
        Thu, 10 Sep 2026 18:47:12 -0700 (PDT)
Received: from nn ([2001:1ab8:1003:0:5454:f357:ba89:4e22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966021ae8sm28097866b.22.2026.09.10.18.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 18:47:11 -0700 (PDT)
Sender: N B <gen.benner@gmail.com>
From: =?UTF-8?q?Nerijus=20Bend=C5=BEi=C5=ABnas?= <nerijus.bendziunas@gmail.com>
To: toke@toke.dk
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] wifi: ath9k: fix the RX filter handling around spectral scans
Date: Fri, 11 Sep 2026 04:46:51 +0300
Message-ID: <20260911014653.1566388-1-nerijus.bendziunas@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Patch 1 is v2
(https://lore.kernel.org/linux-wireless/20260904181709.788886-1-nerijus.bendziunas@gmail.com/)
with a shorter comment and message and the Assisted-by tag in the
documented form. Patch 2 is new and needs the helper from patch 1.

Tested on an AR9271 (ath9k_htc) together with the pending spectral
stats fix; ath9k is build-tested.

Nerijus Bendžiūnas (2):
  wifi: ath9k: stop a failed register read from opening the RX filter
  wifi: ath9k: clear the PHY error filter when a spectral scan is
    disabled

 .../net/wireless/ath/ath9k/common-spectral.c  | 13 ++++--
 drivers/net/wireless/ath/ath9k/hw.c           | 46 +++++++++++++++++++
 drivers/net/wireless/ath/ath9k/hw.h           |  2 +
 3 files changed, 56 insertions(+), 5 deletions(-)


base-commit: c3bace8584ca707e34ba837f65c2e9d566af4c2c
-- 
2.55.0

