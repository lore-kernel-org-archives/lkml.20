Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794645516;
	b=dRlbAGYFqfFO4Iz0XcG3cBhUF3vY+3BqLsSD0jdnaEDs9i8PYc1tjWcU4mfDhd87A1OG
	 mjcGQGd/893gDzKikiQQpz7HndXBGSoOZde3uqaBfxkoYrieZAJE9DKIHjZfox0BCaI5k
	 /zZEBCZuU0QZSLQ91Loq4CwqQjUwI1fmGTXnrA811yFnljYc4UREwYQjpLBYjg0vK+Rwq
	 gP/XP9J8Wc/lCYxTGZnOIjE//S/IWWmAfeSxDDesiNRHpnFZp1Esg38YsR3UziRFCtx1d
	 hxEHRTSfxO6FM5F1tn4xWg4k5s0cbP0bMHIs8uX39HZrq7R0fQtgLO1qLsbcddAGDYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794645516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YYFVJGGbyI9lOzoIR2dS97Q3Ec0TWi5IYxjDhkHBa8U=;
	b=phyovtHiWr3i4IalluTm7+lCPD/rgPpf36e+2ZYZCc5xa9RJrJ9/wOfw3ssrQEf34Fup
	 Sy/Pozd+58ERmh+q4uuYKKOnySd674R+qinRS43nuROWl4I8m5X2+epGUMlM1OspytR5F
	 dM6AKvwo1bnIu3U0IfXtCJVIXS42lWvTZ2Fo2njga9IqYTe8qe2qPKNuHA7Un8AXnev+2
	 esbi5F4mkDxFGxxITWLwLegrhgKfyBTGHexuRlFuxuDamPafQkYtLpZdDO0b71j6Sze3m
	 99iReOY3b8BJmN3yzRlIjg6BitL6Rx2aDeQ/a0Ayo7Tj9xpEHtJwHPY/PFzKa3qX+2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RJvV71qL;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68254606A330
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68254606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RJvV71qL
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be4b61fd3dso1796685e87.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794645514; x=1795250314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YYFVJGGbyI9lOzoIR2dS97Q3Ec0TWi5IYxjDhkHBa8U=;
        b=RJvV71qLB4A5+TxPVIrOLati6BchBPyqQWwB81OvQdBLtvmVhWmZbposYFQ3X0KQwQ
         ikbJOPNhi+fmRKqb8dxHA2mkFMXyRjVqBlz/6Xn5CEUJqPwXT4kf6N+R2gj4A8aBMVB6
         YrEMvRdiPrvdWeesu775bVTSSEfISf2wFjFFMecE8Ty4W7Bx1SBRCD7tB5NcLihcI0Qo
         /qxqsnsiQ+fid9GjsApiF0LJYm5u4B0MTe9zUGHecVbqVmiMZx9eYu1oKcNtk6hh94+3
         BBUlgxVn1aU1CI4P8qXE3hOc4H7extgTx6/uW4btcz6fJT/6qdTSi/rH6+gxFUmub3Tf
         69Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794645514; x=1795250314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YYFVJGGbyI9lOzoIR2dS97Q3Ec0TWi5IYxjDhkHBa8U=;
        b=YPJ7n78JLFEFtDtML1KRE2m3kHxe9L3rOLfxa5EXHe0gKYQcigwrGATpcUmsLuCWpD
         Gy0liei+LNz0AaE1TRHkcAILrHl0muVV/aep8fKLz/0APwp9TpQaXpQ8UCUl3mZi6TDN
         K65uWJbXCVOxPMtJXj2D+MMUs3CXO6ZzAjQo1BoJN4kbN0nfdT+8uN2HSokoqMCNtqUA
         Ms6dD058wK2a0rWPsgG5oGUH/0sA/ZGEKcn6vMS+glmWkvwKjSX2pcgihocBob8iNubR
         rSMYHXgle9fWuyE3kDX5mt0vQG3lKdjbjcCWafTQutcfhdJZpXK3L1EIP6kLu8pYAcry
         6GXw==
X-Forwarded-Encrypted: i=1; AL+hErGIUm4pGDx/xSj7lMnT4nlFfeVS+DEmr2zR2iImN01/qj/5ks3VW+GHSrFeNcYT2zamx2l1gPS9pi/RvP4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9w91J3yUq6KYu0AZ9/BpIVE6IdWGzDMRgiyi9ZboBDmjGEaK0
	ydGOKRSJDYxXhVdD2Je6mJ2slhYJsi9bwBC3QKM0rSa078mxdCuEe03W
X-Gm-Gg: AYBFou02ERMlYA1Kb16fs5rBQ4mxoV/EQdevY4fp6ZaAnvD6ThN2HlKHgi00D5YawU9
	2+uxc8buCbK3IZygNMmleBme0SiZ6stXfJMdmbXbNpu+svCXj/YKHuYMUtkkODu7riyMPkZZ+RH
	JLQfNS6J+mXnK/t0A4m2eGx98FWkjnc2M+DJ66vMwx0a/eUuZ/mWALfWyrIMQ2kREtgeR3qDgOu
	PXOz17X4VMTl+lO6dKJlRiI81dKsyoxYRjD3vDOcstRvkHrKAoZh7uxNxx1UMd4ikz/eJbNYfGy
	gsmhpemvHhrVtaLHP7s9zsbmL2fmj2J2OhvtkhJoX8Z3yval+QXCEU5x3S4zMqOWAcVTN+F2xi3
	hm4cE+eRy1MvHc9fy2B6qzAFkBgCGFDZBHsSoIJwbE6zax+dKsTXDMgnQJ9t5XNPyAk/TzYu6em
	0k276GDN94boTUdSqX6cQDjIKL79Md2T1XpbJlOObgbLIgcbeudctyNUlsSZW5CRgkrxvuaKhUz
	kY5TGQ9D8GZ3ThCUcKNRgFnE4ft/ujobZqZ+Mc1gGVlyvK8Wrqq+/Ep+PujnKUYYL698i/J3uNc
	70S5kHiL41l3NYKWwdCKv66f49vcd/Chupe4Fr/ys98yG/0V5hkfn1dyTc+GljH+AEFrpKH+IeP
	oWzBHadGdO87HO6CW3xBHUfCWpXuwwV4MtRsTynPJsaqwYdvf1bnJfa10f0Q=
X-Received: by 2002:a05:6512:401b:b0:5be:516e:5728 with SMTP id 2adb3069b0e04-5c170774474mr1723810e87.32.1794645513336;
        Sat, 14 Nov 2026 00:38:33 -0800 (PST)
Received: from yantra.. (nekmmqusxj170dz200l-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:b551:8edb:536d:8395])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1713565a6sm1527803e87.78.2026.11.14.00.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:38:32 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>
Subject: [PATCH v2 0/2] iio: pressure: dps310: data-ready trigger
Date: Sat, 14 Nov 2026 10:38:26 +0200
Message-ID: <20261114083828.18059-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
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

DPS310 can raise an interrupt on SDO for each new result. Document it
and use it for a data-ready trigger, so triggered captures follow the
measurements and are stamped with the interrupt time.

With pressure sampled faster than temperature, scans with pressure
need the trigger handler fix [1] to keep up. Without it they come at
the temperature rate, as with any other trigger.

Tested on a DPS310 breakout (0x77) on a BeagleBone Black with SDO to a
GPIO, level-low and falling-edge, with [1] applied: one scan per result
at 1 and 8 Hz, also with the rates at 8/1 and 1/8 Hz, stamps steady to
0.2 ms. With pressure at 1 Hz and temperature at 8 Hz, one temperature
result a second comes 2.4 ms late and the stamps show it. Without an
interrupt nothing changes. Not tested: active high, which needs SDO
strapped low (0x76), and ZTS8032.

If the chip stalls, the case the timeout reset is for, the trigger stops
firing until the buffer is disabled and a read resets the chip.

v2:
- interrupt on temperature results when pressure is not in the scan,
  so a temperature only scan no longer waits in the handler
- limit the trigger to this device, as the interrupt depends on its scan
- local regmap pointer in set_state and probe (Andy)
- rebase on iio/testing

v1: https://lore.kernel.org/linux-iio/20261110154254.39092-1-zoone.rupert@gmail.com/
[1] https://lore.kernel.org/linux-iio/20261113230241.82046-1-zoone.rupert@gmail.com/

Cc: Paulius Zaleckas <paulius.zaleckas@gmail.com>

Rupesh Majhi (2):
  dt-bindings: iio: pressure: infineon,dps310: Add interrupts
  iio: pressure: dps310: add a data-ready trigger

 .../iio/pressure/infineon,dps310.yaml         |  10 ++
 drivers/iio/pressure/dps310.c                 | 139 +++++++++++++++++-
 2 files changed, 145 insertions(+), 4 deletions(-)


base-commit: 7c054db85b5a3ce4d5465cc5cc682cc44ae9eabd
-- 
2.43.0

