Received: from mta1.migadu.com (out-68.mta1.migadu.com [95.215.58.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAA73D3326
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 17:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790876196; cv=none; b=A168QuBAUQ3fp6a8Fre0dhefdFMs+0zpVK9JixGKLsma7Rv0gdtlXaXkToJtTxwervgw4do4jkrhg0RQgak14WECCnUTOzr6xGqLwr3bWdMCSjXYVUFResYaZfcKHj1P/z2jeX8f9j5AF4G39SmoSVzs0BxDZW9DciF67rUZGV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790876196; c=relaxed/simple;
	bh=1S97aZ5lqXhW4kBuXjOjGy0qBmexZE7CglrgJsyPvnY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dsZytro1GIvF7ZZapHM1NvorJdraHtmH+IQ+aLm/CI7QXTI4BLwLrqK146MZn2yq5S6QuEujk/tL4NczpFe5IbOnnAGSmF69Qwazv0/HJtalGqgLswcO4y3uSEKOiFlanNDOE+bYKPsy3PgQst6af6xyJFMDQpoRskQJsQN11Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=kf2o3eA0; arc=none smtp.client-ip=95.215.58.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="kf2o3eA0"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1S97aZ5lqXhW4kBuXjOjGy0qBmexZE7CglrgJsyPvnY=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790876190; v=1; x=1791480990;
 b=kf2o3eA0Te+Cf7CBTVHJmCciHsehn9m2bEXabIJcx8zgs87Z/JOrg4BZB0+7OdF35IgwMNKa
 6FL1GN1nIgCxYM9IpD0a1oCJCP1nVhQhW5f+vEC34NUWr/yMbGFyGd1DA2KPsDtMDQ1IyG1/p3F
 yrp8Bohu0BG/QdHJ72uEINSPL3eR3pBVcrT8QSMwWiee102QxtOoct3TEyTZ1GwCWbJ0kzDYXAL
 8+RevBVQjimrk4bUqXKoqup8q0FMkqFufq4PD2Cntu9c6tPMvDV8T4PJTtR7fth3uZ6rr3T2t0x
 aN+VEzyEBAN+SgWh+H/Zh3C2VJT1wWswXomcFzua3L+Lw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e9cad268562f180b;
	Thu, 01 Oct 2026 17:36:29 +0000
X-Mizu-Trace-ID: e9cad268562f180b
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Jacob Chen <jacob-chen@iotwrt.com>
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH 0/3] media: rockchip: Modernize PM_OPS
Date: Thu,  1 Oct 2026 19:34:50 +0200
Message-ID: <20261001173610.158931-1-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A bunch of new PM_OPS macros got introduced in commit
1a3c7bb08826 ("PM: core: Add new *_PM_OPS macros, deprecate old ones")

Straight up copied from that commit message:

    These new macros are very similar to their SET_*_PM_OPS() equivalent.
    They however differ in the fact that the callbacks they set will always
    be seen as referenced by the compiler. This means that the callback
    functions don't need to be wrapped with a #ifdef CONFIG_PM guard, or
    tagged with __maybe_unused, to prevent the compiler from complaining
    about unused static symbols. The compiler will then simply evaluate at
    compile time whether or not these symbols are dead code.

So convert the rockchip media components which used the old macros to the
new ones.

Diederik de Haas (3):
  media: rkvdec: Switch to modern PM_OPS
  media: rockchip: rga: Switch to modern PM_OPS
  media: rkisp1: Switch to modern PM_OPS

 drivers/media/platform/rockchip/rga/rga.c           |  9 ++++-----
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 11 +++++------
 drivers/media/platform/rockchip/rkvdec/rkvdec.c     |  9 +++------
 3 files changed, 12 insertions(+), 17 deletions(-)

-- 
2.55.0

