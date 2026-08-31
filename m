Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1211539AD51
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 21:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788211363; cv=none; b=coLC5CwPgYsbhsGKa2GmcNVoVJkptpg5A+Sz4DeHRdT9vDtirnOF9M8XG80kLiBAB1/T2RdlocLkN5m6i+hdTSv/wGPqYcacfzIirG5aa1Kh4mZLq5OmnC7E4+wZsP6Th18+wgNDbQy7VhWtknYHTW6d0jRaF9zVaeNlVuElr7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788211363; c=relaxed/simple;
	bh=j+4P5I1w7yupkjtI1aHIdS2EV8F3BTV+hCLwZ4e00/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e27WTnckgurfVYtS7njrPhveMR5dF2llS3k+KfaRwb+1f62De1AVoLV2nOz/8xrD+O6+ClyT+QCwZpt9xR0/kclaC9CuP2vS15NEqCliidK1oUYpxasySJuL/+CNwhV2DU2Tqo+GFXRiYIUqP5/9qA5GGMndOizjKmR/3hKj2Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mqaRKwV7; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mqaRKwV7"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-398a5aad413so220514a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788211359; x=1788816159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tAf9E7CenHe6l5YzESk+eJosOnuoeSazKjhyH+9ql1Q=;
        b=mqaRKwV7gzP3vr0Gb29m9Q6UjUcqfOmdhGLENM3ypRBGi1cIaU42yiz+8+OE8YVqmP
         y3J+3HJ34+CZSBPDyf5v27g2z8D+S9llW+g2udUGRnCmi1gz00Z5yjOME3g4JJCjExf+
         crxYmIeDDEKN6cb9tEEEisSB8RRlzlNmyMqpJ5CnaNvQokJbZ6wDmt8TW0k3jBfZuyeN
         CjKttedYveaNoX2nh06YxKdfMLXURfLB9w54N8a73s3Mu/nqBQgrvb4xJz08giZZSWrk
         59P0Ya/GWsf/84WKACPpaKtJyeGY3Kd8IfQPtDykRK06rUViYPKC/csfJnAYEl3Y/Grm
         LiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788211359; x=1788816159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAf9E7CenHe6l5YzESk+eJosOnuoeSazKjhyH+9ql1Q=;
        b=o8H1qGdFE9YMMVELl4rNiuthnwlMsTqSF6PUa7Ud5NZstbt9NZmEr7JS21BDWqVdaU
         U2Z5lGjV9KQWQLr5yPngUnWejTeWvVvyQPCnscyynCY6u2vo2symtLWjOM3D39dVR+aM
         cqn8gMFHhRPzflXjfYE0lvuGxWXMiDZCBu5/zW+I0XRKmm2b+ol7S5i/+kAGh8FaoFL6
         FDhTWzKCBudH7MgkEqT1KoMB2QIeaJM1dQHUdJkjXiz8zEklpjqoR66KIREnW5AS8I8v
         CqiXKCYZC2kfrzlYHGUFYIHQURD3oQuU95gbiGMcuiSwlfIhJB3/vYfdZKrLX6j79nxl
         TRMA==
X-Forwarded-Encrypted: i=1; AKwUvBwtTIuxJhSmDrI7fH169sPQrq8UJRPwBtSTyJ7aiUpOD/oexb5l10how67GcEpCIs381bnE8zqwijAjki4=@vger.kernel.org
X-Gm-Message-State: AFuF++kr7+v9GK40RBviFRV5gAZRBv/SYJ7UuhLnLU1MI/m8A1wIRW9i
	h8nwm5Osmy/CXqrlNZfllF33MPGYgQNT4FwViiEkqoMR+Wa1+umFK5ol
X-Gm-Gg: AYBFou3el/iIGHXiUNBhuqo1FuV3NNZ2ms5RAPBY1hgK9bkgWJGdBrAr8PRScQucGWE
	Hz78HSCa3onrT93dbFBvzshgZBXCmEjxJCl7bUD236Ly8XeGZhCG4/i9VlGlolcjBNQc/WuPYyS
	u76JblSgs/YRn0tMMTYwyBh963zKCaiTFgYNzAGLgvRsx65IFXfLM0Kl3l599Ior8h/YlVyKPBe
	pWu98jI7Xy07OzTWGQXRVsF4LN5BhPywbWDY8yosjmfs5kKhPWoJ3YQpabG6tr/k1dAYpaBOx4I
	R650RdPcAE+p/vwkMP3//JlVOwH7j5oOegXQNdIsTl5gDvbXgJyzJ0mgk4ZvxNAKh/IKxmLL0Jr
	k2fJT8EasQ/IDLpnSpw4bf8un7+DTxsacIZvEdrHqiyrSA+zTW8psrkLm3w9CULtrU8MIJfVOM/
	FsCumkP90qq24fTIA3htvtDOWiLrRRxeYRNC0umfUPWd4LPa91bTywmroLK9MaypAMv5fRxJWJk
	P41+w==
X-Received: by 2002:a17:90b:588f:b0:398:bf7e:b267 with SMTP id 98e67ed59e1d1-398bf7eb378mr22481809a91.2.1788211359423;
        Mon, 31 Aug 2026 14:22:39 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::6:bac7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0bf8a13sm45871957c88.0.2026.08.31.14.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:22:38 -0700 (PDT)
From: Zinc Lim <limzhineng2@gmail.com>
To: alexanderduyck@fb.com,
	kuba@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	linux@roeck-us.net,
	horms@kernel.org,
	mohsin.bashr@gmail.com
Cc: kernel-team@meta.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	zinclim@meta.com,
	limzhineng2@gmail.com
Subject: [PATCH net-next v2 0/6] eth: fbnic: expand hwmon sensor support
Date: Mon, 31 Aug 2026 14:22:28 -0700
Message-ID: <20260831212234.1212971-1-limzhineng2@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fbnic currently exposes only the raw temperature and voltage readings
(temp1_input, in0_input) via hwmon. This series builds that out into a
complete sensor interface and hardens the read path.

The firmware capability response already carries per-board sensor
thresholds, and the firmware can asynchronously report when a sensor
crosses one of them. This series surfaces both to userspace and cleans
up the supporting plumbing:

 - Move the sensor read logic out of fbnic_mac, closer to its only
   caller in the hwmon code, and drop the now-unused get_sensor op.
 - Expose all hwmon attributes unconditionally as read-only (0444).
 - Cache the temperature and voltage readings for the current jiffy so
   a burst of attribute reads issues a single firmware round-trip.
 - Parse and expose the temperature (min/max/crit) and voltage
   (min/max) thresholds. Thresholds the firmware did not populate read
   back as -ENODATA.
 - Add the corresponding alarm attributes, computed by comparing a live
   reading against the stored thresholds.
 - Translate the firmware's sensor-threshold-exceeded message into an
   hwmon event so userspace is notified on the relevant attribute.

Changes from v1:
 - Addressed Jakub's patch 6 feedback on including a
   if (!IS_REACHABLE(CONFIG_HWMON)) return; guard.

Zinc Lim (6):
  eth: fbnic: move sensor read logic out of fbnic_mac
  eth: fbnic: expose all hwmon attributes unconditionally as read-only
  eth: fbnic: cache hwmon sensor readings
  eth: fbnic: report temperature and voltage thresholds via hwmon
  eth: fbnic: report temperature and voltage alarms via hwmon
  eth: fbnic: firmware notifies hwmon on sensor threshold events

 drivers/net/ethernet/meta/fbnic/fbnic.h       |   8 +
 drivers/net/ethernet/meta/fbnic/fbnic_fw.c    |  75 +++++
 drivers/net/ethernet/meta/fbnic/fbnic_fw.h    |  30 ++
 drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c | 263 ++++++++++++++++--
 drivers/net/ethernet/meta/fbnic/fbnic_mac.c   |  55 ----
 drivers/net/ethernet/meta/fbnic/fbnic_mac.h   |   2 -
 6 files changed, 349 insertions(+), 84 deletions(-)

--
2.53.0-Meta
