Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=63.250.43.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794203357;
	b=3KAWMmB8V5RuubOvjY7pAl/U43RqdLxJ4rq7LKjKCOKA9azspRWrzz/QbKMZJg+7nm17
	 p6YZC8vW//VpioSwbp9kDoF0y+L/As9GayMi9pTSQ8itDwESQJ9C4UnDO8Awb634XPUNu
	 ZuVPO4NxU+45SkfJp01eDx17LyI1Eiw1g30av8SGVkQtxz33YGljCI1V+JZsqUgoD2OHF
	 OOAQ0Dy3HIBvWjynp8KuqKjn/JLbZOx4/SWbYki5eAEciXyJmd1kWwoegEwuLVclSDFx7
	 tNqYNp+tP/SZlwZtZEgdJoD7XjEvF+hxYasUD9XA/DvAD6NoPk2K3WDA8DsQf3Ode+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203357;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Envelope-From;
	bh=5P/K1i7VVVnenIqs0doht6kZyfp1nXPhvBPVzb0aajQ=;
	b=Y7Y3Sasm0xmFlWL6pNrz/aotEipyU3CyUaPfYMNtjVJWGxLYHp9czZ4QEHTlLwQ5rFAp
	 1TQWGftpQ3Y74RZEhRaGeDkizaeOIQTpWeMT17hv7ezHbC3LnZUOycBuAJe5aNMTTGCKw
	 d3woafBDTglFaMH57HU9GEOnafmSpgnJ70MFbGAv/viGInmLZstzx3G1xS4josrpUjeHj
	 gQ41gcq0Ilj7GV3OnfzwgI5+oC7Jwvs205B/nMT4lgt2ZUBzWocxwwOswGRPwG/fDkSrc
	 oNB1Ntxf/sVspx3/QZn7mWobE9UGcDVzgMIWMs8UdMRziM9d0d6XiNj/v7t91YI8huw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrispinetinega.com;
	spf=pass smtp.mailfrom=chrispinetinega.com;
	dkim=pass header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=SXjMARJc;
	arc=none smtp.remote-ip=63.250.43.113
Received: from out-2uec-a113.jellyfish.systems (out-2uec-a113.jellyfish.systems [63.250.43.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAE5606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CAE5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=SXjMARJc
Received: from mail.privateemail.com (unknown [62.8.90.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4jNJkG6pbwz8sWQ;
	Mon, 09 Nov 2026 05:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chrispinetinega.com;
	s=default; t=1794203337;
	bh=5P/K1i7VVVnenIqs0doht6kZyfp1nXPhvBPVzb0aajQ=;
	h=From:To:Cc:Subject:Date:From;
	b=SXjMARJcAdT/OOLzwXvhEY+8plaUNTRHjAld6KlK2HWpmuKszQ0vqnwHeyltCr2oF
	 ewXiKb1yqxd8Mcb8ZMA2cd+5gXzcJfea5mnYW4gQi9SkP1yeHSjyE9P13//wjtdqIw
	 MGgvgb79XIBYA6gGpBUHpfK+em9RPkPJRhrqE7/tUGD9wEBCQhdwi0qcIdxO/xvBTS
	 iah+gGCqVJV3hVXG6SXTsiUvPxciWw3cozkoWqxny9/tVpmcEdWq55FE7x/Gl35jsO
	 H48U5BUhzQKH7GOdxL7GqPwe9XfKKhOkC2C/ITTYZgcd6RJxI5BY0xvo+W4E8mhMm3
	 0wRWOqroDAHcQ==
From: Chrispine Tinega <dev@chrispinetinega.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chrispine Tinega <dev@chrispinetinega.com>
Subject: [PATCH 0/2] remoteproc: k3: Recover a crashed remote core
Date: Mon,  9 Nov 2026 08:48:28 +0300
Message-ID: <20261109054830.42715-1-dev@chrispinetinega.com>
X-Mailer: git-send-email 2.53.0
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
X-Envelope-From: dev@chrispinetinega.com

A K3 remote core can tell Linux it has crashed by sending RP_MBOX_CRASH,
but the K3 drivers only log it. Nothing reaches the remoteproc core, so
the crash is not counted and recovery never runs. The core stays halted
until the next boot, with its rpmsg channels dead.

Patch 1 reports the crash with rproc_report_crash(). This applies to
every K3 remote that uses the common mailbox callback.

Patch 2 leaves recovery enabled on the M4F. Its stop is a plain reset,
so recovery does not need the crashed core to answer. The R5F and DSP
drivers keep recovery disabled. A crashed core there moves to
RPROC_CRASHED, and can be stopped and started again through sysfs.

Tested on an AM625 board (BLIIoT BL350) running TI's 6.12 kernel with
the equivalent change. The M4F runs Zephyr, whose fatal-error handler
sends RP_MBOX_CRASH. After a forced fault, recovery reset and rebooted
the M4F in 71 ms, and Linux kept running. Mainline's M4F stop is the
same plain reset that this test used for a crashed core.

Chrispine Tinega (2):
  remoteproc: k3: Report a remote crash to the remoteproc core
  remoteproc: k3-m4: Leave crash recovery enabled

 drivers/remoteproc/ti_k3_common.c        | 5 +----
 drivers/remoteproc/ti_k3_m4_remoteproc.c | 1 -
 2 files changed, 1 insertion(+), 5 deletions(-)


base-commit: ec1f9ba57b02fe12a6fa5f141206d439ba3d044e
-- 
2.53.0

