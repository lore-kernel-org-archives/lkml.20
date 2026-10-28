Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793164351;
	b=t9Fv4odgXUrWSrqDjamRWvFGmw5bXf5Rmpx8xxCGNClYvjsbFuDvJ31+aVzMhHwPPFkS
	 ORUZbLEEAiL1ekdM/3xuhZ7Y6wLggVBQbHsxej1NJAZqXbRnj7ZdhJl8AAvPWci+Zwwok
	 tyzeSec+/JXOcRIkorEi+RTZM11+3RMCU1p6OlLY8T3BIzC4NY0F+gApYpFGFTkgF+D1B
	 zR9KYSLQxpnbX2VybK2bWu9IPXa8XfLXc7VJCo2Gx9g9WsCYZxhndZqkHu8KyNObk2nZM
	 D+hWUpktrnpzf0Nr1oivVZJh75fZ1Var3MCJI+KywlFjPCFBYjyajayOybG758a/OIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793164351;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=gbqb4dmt0tKkH8IxdGpuvzNOPy6/YY3jqGGhTkG10tM=;
	b=EFYnQLUB2rFtLvPeUmcdhY9RsXa0MhBPjuTrLSTq1k3huMxTdphMt/913VCs0UTTumeB
	 wTT/vI8gy+VisY3G4tQXqv2Hp7FnSQUNMHges4eqzjJYTikREwSAEQZC2tEpJsBBIUmUT
	 pEXSMFzQZf+BWZbVg/9XK+FD/YH2tPbADk7RYbSE83rT1YKFQnGI/8Fm52bWAsbRNvsI4
	 6P40tudHfITBO0d3pzXdvE+eVn8FWDZ4tNmOlproDfKwSgRkrWQ4PZjoFPa7Z8F0dJUhU
	 yv8WIWMKxn7YJL2+EJCx5UpGn9NynO6w7EE5DIGRTXVXJtRiOnXSEkpi3N6nU4BrQSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=LZxICtPP;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C4B606A323
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47C4B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=LZxICtPP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=gb
	qb4dmt0tKkH8IxdGpuvzNOPy6/YY3jqGGhTkG10tM=; b=LZxICtPPNLte4GbMfY
	TVb0J0NpIINSDmos/LsnRK6FEGpPgas6L41J5PlaDBRFkhjiIanzH3a0zeTWYnVZ
	LRzLvWtfMBP5sbISH9uD5a1aHgvLz93C4VFLslJe/h6M+6pWy6Zfy9nIoRGLMsLM
	sXAuUsX+q9TCFsI29BkkNNbG8=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDX_wMghOFq5BQxDg--.58804S2;
	Wed, 28 Oct 2026 13:12:01 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Bhanu Prakash Maiya <bhanumaiya@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Mark Hasemeyer <markhas@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] platform/chrome: check ACPI companions before use
Date: Wed, 28 Oct 2026 13:11:58 +0800
Message-Id: <20261028051200.145621-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
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
X-CM-TRANSID:_____wDX_wMghOFq5BQxDg--.58804S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFWUKrW7KFW5Zr15Cr1rZwb_yoWxtwb_Cw
	4kWFn2yr4rJrn7KwnIyrn3urnIkrWUWr1UCrZFvryav343C34UXryqya47Xws7JF9xA3Z3
	Gwn8Jr4SyF1S9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbIPfJUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7wE8dmrhhCELKwAA3q

Two Chrome platform drivers assume their firmware-matched devices always
carry an ACPI companion. Driver override can bind either driver to a device
without one, leading probe to dereference a NULL companion.

Reject missing companions before passing them to ACPI resource and notify
handler APIs. Each change is independent and preserves the normal
firmware-matched probe path.

Jiale Yao (2):
  platform/chrome: cros_ec_uart: check ACPI companion before use
  platform/chrome: cros_usbpd_notify: check ACPI companion

 drivers/platform/chrome/cros_ec_uart.c      | 8 ++++++--
 drivers/platform/chrome/cros_usbpd_notify.c | 2 ++
 2 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.34.1

