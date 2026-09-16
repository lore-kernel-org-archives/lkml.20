Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com [34.218.115.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AEF4FDE48;
	Wed, 16 Sep 2026 13:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.218.115.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789566479; cv=none; b=Fe7jGm2zZ+FCtJ22q5Vh3XBQRIR/JMkUa5BPd1OmlVTDrK8gLKFwavOv5vVymCr2YAxCjQkBEDDKsPmuARJqDSp9UvB7Ea3vUmrqyjGdY28B4gnLOwAWK+AdcrxRJHQYQVCn5Sd7Qzn62Z0bSRiuEBFMWJ1ic1w6rz/DqbQp1XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789566479; c=relaxed/simple;
	bh=t38x6Ilod+A9TPPwTeE6A2F1He/NYDEW6J690WJNu88=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DHgkliwJeYw8sKOd4ffaNL9Y4VZvvku50aVrrSR5p5S3M2bxif8PJp/qUy4QE/OaPULjMHCjKxtddMS9NvNmNGkg+EWANDX+YX8fka00wgS28icS1qJOTQrEnkQCYtWBcuNa7x6hvN8L7eAcWfqkjWO1yXVgucGJMKY7OciAJkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=U4F7ab4Q; arc=none smtp.client-ip=34.218.115.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="U4F7ab4Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1789566475; x=1821102475;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JKVHAWC57vQp2Tay3J4KAXguT0TgfJs2JYRovTvx0qo=;
  b=U4F7ab4QSCO8qYWDnxpTLdNevyPlw8sj74zA7zp/8aJyW+WwHZk6Vvcw
   5AEr+xIIOxeEaF6vpGw9IEDKqjjNLlRqPlXovrJ4hCT/TKs2NpEO0FQAF
   4mbH4BoN5CysELTURcURK2W5pHtkg6fjGO0bSflTUAlqAMqOWxQytyuOB
   Ovsy8pKyF5ZxrWJG4CcujrpbdnsHLKxEmmFP37EM68z2LMyUkPXrZDgCN
   Q3i1Wyx1RKx30e1ooQciK91mI9q0fzeTYJvd/tFg1Iqcvtz+OgYj+5vQR
   IxIgGnt4YnZZrRM1EqWapcivPJtMUNGrObwZlf7l1JKpkVoPwwDpPcpUo
   Q==;
X-CSE-ConnectionGUID: 1rikMTuuSICK5y6Bk1nD6Q==
X-CSE-MsgGUID: euvmbbfOSKSyQSXrPK5+Kw==
X-IronPort-AV: E=Sophos;i="6.27,103,1787011200"; 
   d="scan'208";a="28616843"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 13:47:52 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:26409]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.5.10:2525] with esmtp (Farcaster)
 id 98c42118-29c4-4c54-a25d-659f05731a52; Wed, 16 Sep 2026 13:47:52 +0000 (UTC)
X-Farcaster-Flow-ID: 98c42118-29c4-4c54-a25d-659f05731a52
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Wed, 16 Sep 2026 13:47:51 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46; Wed, 16 Sep 2026
 13:47:50 +0000
From: Eliav Farber <farbere@amazon.com>
To: Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Fabio Estevam <festevam@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Eliav Farber <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] pps-gpio: restore pin mux on unbind and shutdown
Date: Wed, 16 Sep 2026 13:47:42 +0000
Message-ID: <20260916134744.46354-1-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D037UWB003.ant.amazon.com (10.13.138.115) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Some boards route the PPS input GPIO through a pin controller and mux the
pins to a different function when the pps-gpio driver is not active.

The driver core already selects the "default" pinctrl state before probe,
so the pins can be muxed for GPIO/PPS use while the driver is bound without
any driver change. Nothing, however, hands the pins back when the driver
is unbound or the system is shut down (for example before kexec), leaving
them stuck in the GPIO mux for the next kernel.

This series lets pps-gpio select an optional "idle" pinctrl state in
remove() and shutdown(), so a board can describe the alternate mux there
and have it restored. It is a no-op for boards that do not describe an
"idle" state, and depends on CONFIG_PM (which performs the idle-state
lookup).

Patch 1 documents the optional "default"/"idle" pinctrl-names in the
binding; patch 2 implements the driver side.

Tested on an AL11 K2V6 JRD10 board: binding/unbinding each pps-gpio device
toggles the corresponding PBS pin-mux register between the GPIO function
and the alternate ec_ptp_trigger_in function as expected, and re-binding
restores the GPIO function via the core-applied "default" state.

Eliav Farber (2):
  dt-bindings: pps: pps-gpio: document optional idle pinctrl state
  pps: clients: gpio: release pins to idle state on remove and shutdown

 .../devicetree/bindings/pps/pps-gpio.yaml     | 15 ++++++++++++++-
 drivers/pps/clients/pps-gpio.c                | 19 +++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)

-- 
2.47.3

