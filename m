Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7954D353A8F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 01:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788483710; cv=none; b=JonE0H8OZAmS83KyNM1qzU5L+rEp5dyC5ijBfCzauTdpaPFo/J7DkYsyiiqfBALOqHq8wBJnMWjU9ZjEsL3wLaEI9FmB7N6PjEUUrKSdWOkhsPbSvPoXeavJaUcSwNm2P0/mrDVh5qWy3kidXZiqRoGxGNCZxrucwjIRD0Zmzz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788483710; c=relaxed/simple;
	bh=q+UHUrSDoZC5kHS2G2RJgukngNrmU7yI/gbfKtZlMXg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AdbhbyigUmGwrtyP+q25eImlUqPbJK/dhZL/j7nR/67GlZx2ic+GKQ1ZdJ3PCFdxhIMyoPiALVOx8tVKKY3MgP1B0/KRlqe4+Eg5yYr4Gi2YYv8sGvc4kDuIY1NgUm3oV7LJXNwcHy2rQkpuXw+Dj0kZcSq8CyYUPIlqNTxrd+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=nsTOHmEu; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="nsTOHmEu"
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id C213B2C0658;
	Fri,  4 Sep 2026 12:53:55 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1788483235;
	bh=J/K8/K1+Ixa47VueDg+9m0ERog2TgK5kRX/iVeVU4Vk=;
	h=From:To:Cc:Subject:Date:From;
	b=nsTOHmEuVLLKdIvWUVOli2aIHOZCGQHrf99uEN2RJKSAfOEnkq+4YFJGtcwTA2IZT
	 2sDf/tz4rHv+hMpDio5vl2yCL4QJWN9DzlrDHzzgmy/hpGtvWmyBnr9aw/VzsDO7ZC
	 a/gC2BXvlJEDZSepMSpngKIc5wwqtcGMqfXRkCwyyfg/BStTmdqtSrbxvUjhLz1bUR
	 oo5btXWZEuT/K2QhxScVQHGOI603yeZnqp2U7IAHzN/t1NFpip19sO8TwI/LvM8wxE
	 D3PjIoS/lRnx6qpM04SvWXiZr2+Hl7rpICaXkr+peI0h0HlRUcwVj2IqBhiXdnGNJ8
	 v71m/HnMY0+zw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6a9a16a30000>; Fri, 04 Sep 2026 12:53:55 +1200
Received: from aryans-dl.ws.atlnz.lc (aryans-dl.ws.atlnz.lc [10.33.12.26])
	by pat.atlnz.lc (Postfix) with ESMTP id 88A8E13EE4D;
	Fri,  4 Sep 2026 12:53:55 +1200 (NZST)
Received: by aryans-dl.ws.atlnz.lc (Postfix, from userid 1844)
	id 85CF0605E4; Fri,  4 Sep 2026 12:53:55 +1200 (NZST)
From: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Subject: [PATCH v0 0/2] Add support for tps546e25
Date: Fri,  4 Sep 2026 12:53:48 +1200
Message-ID: <20260904005351.2136374-1-aryan.srivastava@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CKmJXgrD c=1 sm=1 tr=0 ts=6a9a16a3 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=VdqzKS8jKosA:10 a=Um0FdliqR7N1uhMY-nYA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add support to existing generic pmbus driver for tps546e25.=20

Aryan Srivastava (2):
  hwmon: pmbus: Fix vout_mode parsing
  hwmon: pmbus: Add tps546e25 to generic pmbus

 drivers/hwmon/pmbus/pmbus.c      | 3 ++-
 drivers/hwmon/pmbus/pmbus_core.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

--=20
2.55.0

