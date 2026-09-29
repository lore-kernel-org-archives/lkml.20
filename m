Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B809538D8B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790700753; cv=none; b=N7ks8glsICvZCQ/Yb+LiFYMhRCupjI6PIdFgegLWGDB+CQ4UIovY3ZxKtZpFWIm01q7ZKe27IpHWV4FONuDOxhuAfwlmgRfjdWwgH4J88vlT4hv1fmY78S3Ep9OxVYd/JqzSxzsX+MX5fG2DLTV23QvFBAD3o4D975sOSqZIdU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790700753; c=relaxed/simple;
	bh=Cnfv+3Oyg0thjSFdj6bj6qA4t9kGvvD9MItwbmBEmjE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A1P4M7iFPoW7j6oexvFss2WVySUiK+GEzgr7H74Cs8ueafR105T99r9QiS5D7rQCq6BcFGTGjspOkxRYh1X7k7LWNACQH6nOV1wfAosaLslYgISz/AtRkMFQz+G6YkV4okHJdu/igGKeDJ+MwAQdYmLA+rCsev+7CnMS5qXg6Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pp4Gx75Z; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pp4Gx75Z"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b79784a6edso3998436e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790700749; x=1791305549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yjghGFxddp+hgpedfnq3QLkecvvYVf/Hl+33N5EPzS0=;
        b=pp4Gx75Z5t5rjXLgUzjcwFerW/CGlffQsbllhqqpG+24ILjwyPSYu+LjVcs0L2Ad2z
         NWIFy3kVjn8nJKIvJgS5rASHWCfeNs0Nerpw4sKDCpgonrwpbvR2UtIPensFsubeurUf
         WY5aWsKf3V5dpzydtoRGWRBtqEIN4YPos4aXV9muD3cEAReS2tew8V98TjidPBQ/3kTg
         9kgb8BD5Bn0lnW9mLgWO5ow6uL84AfDYw3/qrHOFv2p0ZkzpvERrq7oGLJJ/OZYG37yu
         jhEJOXMGJdym/G3QNTM97rTxNeAYCpUBq4fzh2Fsy5MP20v8oFiePchOAPsuEH+F/6eZ
         HbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790700749; x=1791305549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yjghGFxddp+hgpedfnq3QLkecvvYVf/Hl+33N5EPzS0=;
        b=tjT3B2WMXnO1DLN4KnDFsa5mY2mmSbzyyF09U16S+32TvRx1vMwlUyt8Kq8mlT2yQx
         s/aornJ/5toxtdcvSOCGLTtIew9Cd9BL7LN8EkBUDT8wQbhGSq3hhv87cTePiPTqefdK
         onP8tONb6u2pShl/90L8PXXl7QHPWZgfwFYHHMoK0bzQ980SSK7SoxowYc67Et5c7fRi
         wYPwbe4RT1aOSYq1QpqXgQw0AkE6fRyR/kWBP4xtCCQDaB6AyrsT6v3NJC3/fhndjck1
         KWEscS1Bso/WElwUbeeE2Jji/Yhk3gs8+l0Pj+YZu7tPFrmdejIR9EsWAm/2RhWatdZ7
         jzlA==
X-Forwarded-Encrypted: i=1; AKwUvBwz42BvzgyzZBFQI20a5Nynq9fpemdrY+1tU0r+4VfGf0tY1ZUUaUspFeJlCC2cLTWBYGnymIhY2YKNoN4=@vger.kernel.org
X-Gm-Message-State: AFq9FYICxToOF13zTI55B18+D/jqLvpIKok/FK8LekKzS3fZ+DnNed3i
	BPN0DMfvFlHzdHZZM6fT9X9hmh6KB6yisCAeZUJbwyxCjfC9mO00dXs=
X-Gm-Gg: AYBFou0OMrJ8fZgJpYXavUqp9kYeAtwyoi/oukXyjFzU0zAlu0EBbw8L+NOqytdT1Ud
	NVH7BsZoFufkVwBJfjkftL2L0GpCLQI6BoY1Bzl3YjokoRJYX2asHXz3cP40NLQC6njq4T8T41H
	o4FROrQ4UqEv2ZNBYzAOat8623W7j0wkvdF3LgWSRfCQb1xEwf8Il+b9E2jKLr+EZWeGcPlQxqJ
	G8aPGum2YX5DqKas92qtJ3Nan+sLNYU8mPKqdexVnAzNCrdwG2Gqc7/23yg9OowGhg20eqgFGiY
	z5XJVN7RL1MDqBB/G6T/s5/WOuOzk+CVtAJbl8dHYSacj63fJIfcGyy3lPc8+/mceqUyGxGqdbw
	DWdpKiN0JlVJeWvctu1LEOYNvCqSLv5RFNVFjvyqrGQmk77R8HFX28Ogb0V8BB4PoBnNIaoBkfM
	3zJ/7bfobk2A5HaN8GRpWES9tGpV8FNkmzugSoVMjitXECJBQ+TZrcoZgnFT0o
X-Received: by 2002:a05:6512:6891:10b0:5ba:3b9c:ff70 with SMTP id 2adb3069b0e04-5ba3bee0c5emr25354e87.30.1790700749263;
        Tue, 29 Sep 2026 09:52:29 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a771947b14sm137751fa.32.2026.09.29.09.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:52:28 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: [PATCH v3 0/4] thermal/drivers/airoha: Fix AN7583 mux mapping and expose all sensors
Date: Tue, 29 Sep 2026 19:52:05 +0300
Message-ID: <20260929165209.69669-1-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AN7583 support merged for 7.3-rc1 reads the wrong mux positions: the
mux field names are swapped, and v5 of the series swapped the call
arguments to match them. Patch 1 fixes the field definitions.

Patch 2 serialises mux selection and ADC sampling.

Patches 3 and 4 add one thermal sensor cell for AN7583 and a zone per
sensor.

Tested on a Nokia XG-040G-MF (AN7583) with this driver on a 6.18 kernel
in OpenWrt. Without the series the board powers off 2.6 s into boot.
With it the three zones match direct ADC reads, and concurrent readers
during CPU frequency changes gave no failed read and no shutdown. EN7581
was tested with equivalent changes on a Nokia XG-040G-MD. Build-tested
on arm64 with W=1; the binding passes dt_binding_check.

Changes in v3:
- Patch 2: say in the commit message that the race needs the zones
  added by patch 4
- Patch 3: add Reviewed-by
- Patch 4: shorten a comment
- Rebased on thermal/linux-next

v2: https://lore.kernel.org/all/20260915191131.25214-1-sochnev.v.74@gmail.com/
v1: https://lore.kernel.org/all/20260913145226.34643-1-sochnev.v.74@gmail.com/

Vitaliy Sochnev (4):
  thermal/drivers/airoha: Fix AN7583 ADC mux field mapping
  thermal/drivers/airoha: Serialise access to the shared ADC
  dt-bindings: arm: airoha: Use one thermal sensor cell for AN7583
  thermal/drivers/airoha: Register a thermal zone per AN7583 sensor

 .../bindings/arm/airoha,en7581-chip-scu.yaml  |   3 +-
 drivers/thermal/airoha_thermal.c              | 159 ++++++++++++++----
 2 files changed, 126 insertions(+), 36 deletions(-)


base-commit: e856ca3013b3074fd07cb81c90b1de332f69153c
-- 
2.55.0

