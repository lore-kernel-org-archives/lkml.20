Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794638673;
	b=g4GNkMQujf7QZ22WC/33BkYxRzcphSofgYlkl+b9UrfpRDs4pF0G6JY0zc60UuVNvuY2
	 Lu+1eJA2jn/ZqdWJoA61jr0CDiwnmnnrbK6Y8I56KgK2r8oy0NIFB1teD8MfSUxWSR5Ng
	 i++M5XFfjv2f9t17ATTAw4O0q4Iw8r+2GoG9Mwh8gwfIPS26MB7vwDXjfRTToVUfZghJ1
	 WBf2p+Ny5chh7P1bCfPAzn7SrYz/sGEtJ3W3LYsBCfsp13DwU6xIByGnIGhiJQFiOLODH
	 VznQOVLOmr0Q7GEM/TJaCyC/bSE55HB+x8YR5M3HVezavD3ZGnqYxaWkiHgVEH8emfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794638673;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=aL543kydGu3Z9WJl9D/pxWL683tGWWiFwX80/nLuatE=;
	b=2vVFOerKvOn4WgDEfm73cO/KhLBmMDrUMbTFRDxCgFDndR9nbCQkuXfjAX43tc/awLfv
	 kj4Qx0jRdv3ir0n8fhzVl5tUTnKv+NgghCNl6F2JPm7fGAmY41MsV6SDMe6Jd9ADO5K3S
	 9xAkxni4zMo2lorrClzY6k8+huCZVgF8USzmSueVupItzYXMbBlzpiVuIUvCttI92wL4e
	 +6us6phAuCl4fDJuoB9ARnTWM3PTTCtyeKrrtwaISvcoBnrOqIWdQd7nQiWFVymi/1vvk
	 tumMBDQQca5LTGT8FxCTL8CBokVsvpkODjqwwzTf5HnPqliC+H37FDh1SB+Lxm+4fcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=YIjZpVUk;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8025B606A330
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8025B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=YIjZpVUk
Received: from eig-obgw-6007b.ext.cloudfilter.net ([10.0.30.166])
	by cmsmtp with ESMTPS
	id RejVx94oR4vCDS7V1xy8g0; Sat, 14 Nov 2026 06:44:31 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id S7V0x5OF13nNNS7V1xaH9l; Sat, 14 Nov 2026 06:44:31 +0000
X-Authority-Analysis: v=2.4 cv=TuLmhCXh c=1 sm=1 tr=0 ts=6af8034f
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8 a=BDRlbv-OHeEz9Lyx7CoA:9
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aL543kydGu3Z9WJl9D/pxWL683tGWWiFwX80/nLuatE=; b=YIjZpVUke8MslLUsS1TpjXa7KE
	olL0ba4Yh7r1QIXKf6Qq96ygKVX/d2bmJ9/XjtBKLIxkaPKt+7C0aDKzQbG+FUgAmE3MC9EJ++qOa
	JoH+Uls/t9V3qBBIaT0F1tbfDzEO9Vpll+KLeeV6y0W10rAGoYkJP17W6OEwxFcsmHn/XZKnWWLN3
	oycJzNjZnn8QAqoGClUV+rMmhsLYNbd0BviwAKSwn03GVm7sOx86L65eAj0dOvOfcAoK1fwRO00SW
	lzHn2wCMUYjDZ0uCT+OkkV+3ab/XLs+9914k9BlDpb8LEHhjQmwUE319CC2FbMhh2ZTHgTWNIxVvW
	WiB1OMHw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:38024 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xS7V0-000000000he-2pAy;
	Sat, 14 Nov 2026 12:14:30 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v7.4-rc3
Date: Fri, 13 Nov 2026 22:44:29 -0800
Message-ID: <20261114064430.2779677-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
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
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xS7V0-000000000he-2pAy
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:38024
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 32
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLhU8qYdv34kFrtr+N1paxTjHfBUJhr61PsSSBcMi8tCipP7zjNJ5tXguYWw9T1UFoB1UzCF3No/BbgYSlCZ6h6GfUCAib78XmblmWiwr43e5JSmJrHP
 t0zT9lkCixL5NF57+eMkwqSuhZhgFNzNVEvsczZR6txT+jpkfr0cCCpyFSTDGOy981UY82XcZpvXvS2OrHU/3iPSPDZBmIVscBit9MZRE33HdR1dKbN9bAPP

Hi Linus,

Please pull hwmon fixes for Linux v7.4-rc3 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.4-rc3

Thanks,
Guenter
------

The following changes since commit 7475ea8b58616b33c04afb976cf0fbaad9dd63fb:

  Linux 7.4-rc2 (2026-11-08 16:22:20 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v7.4-rc3

for you to fetch changes up to b5c5b67e02406fb48acf57cf2c30a570230fd6aa:

  hwmon: (aht10) Fix update_interval overflow on 64-bit (2026-11-13 12:08:12 -0800)

----------------------------------------------------------------
hwmon fixes for v7.4-rc3

* Read tracking-mode voltage fault limits dynamically in the mp2975
  PMBus driver instead of caching probe-time snapshots, avoiding false
  over-voltage alarms when CPU voltage changes at runtime.

* Fix SCMI sensor probe by enabling supported sensors via firmware IDs
  before exposing channels and checking channel config allocations.

* Fix runtime PM enable and reference count imbalances during probe and
  teardown in the gpio-fan driver.

* Fix max31760 fan controller initialization and reporting, including
  leaving standby at probe, initial 0 RPM reporting, and swapped
  temperature limit registers.

* Assorted minor sensor reading, interval clamping, and register
  handling fixes in other drivers.

----------------------------------------------------------------
Anton Lundin (1):
      hwmon: (nct6775) Handle dual use registers

Felix Radensky (1):
      hwmon: (pmbus/mp2975) Get vout fault limits dynamically

Guenter Roeck (1):
      hwmon: (gpio-fan) Fix runtime PM imbalance in probe and teardown

Pablo Mazzini (1):
      hwmon: (sy7636a) fix negative temperatures

Rupesh Majhi (1):
      hwmon: (aht10) Fix update_interval overflow on 64-bit

Stanislav Aleksandrov (3):
      hwmon: (max31760) Fix the local temperature limit registers
      hwmon: (max31760) Leave standby mode at probe
      hwmon: (max31760) Report 0 RPM before the first fan speed measurement

Sudeep Holla (2):
      hwmon: (scmi) Check channel config allocation
      hwmon: (scmi) Configure sensors before exposing channels

Xu Rao (1):
      hwmon: (scmi) Enable temperature sensors using their sensor IDs

 drivers/hwmon/aht10.c         |   2 +-
 drivers/hwmon/gpio-fan.c      |  24 +++--
 drivers/hwmon/max31760.c      |  12 ++-
 drivers/hwmon/nct6775-core.c  |   6 +-
 drivers/hwmon/pmbus/mp2975.c  | 207 +++++++++++++++++++++++-------------------
 drivers/hwmon/scmi-hwmon.c    |  25 ++---
 drivers/hwmon/sy7636a-hwmon.c |   2 +-
 7 files changed, 150 insertions(+), 128 deletions(-)
