Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793119411;
	b=W/ZGga9gCtCDN4O794VxVKot9P1637vviL2LiGqjJhvjaO/15ofeIwCePRXhnhj78+6T
	 BlqvUeb+kp5hzXPTSIiJNfYk0kYGgP18DQ6SoO5ind47UiJ8iGgcjXLQkp8ln7bznWGQS
	 OxmauhxXjNCQkH4Bdylr2d82X/GSlrfxL2aby0nruXyHlhhwAf63VZE0Vpivs6i2KrWX8
	 zWAhGCKizsckpW1k6XjnJaybUNsVgtJwDQHsqIp1/rC5CFdzNgq5Yy0oilw7AudUZz8S9
	 KMEYJRAVxCh9e79JIRfwCPcghQSP+2ZfAQbPg9r94lOXwQSXQjpITL/uyWz2e1BZrKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119411;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=BpW1F/uJk2W7aZSi1PFxYcUGdf7bE/CFaahxMUXCViQ=;
	b=gOEswOLDxlEK0DSPk4qCEJLYRSbLNPBEflcbWqLGX17TFqydLkWiWOs7ERoCUMJFP5XY
	 7DMrW8gLz++pQxOrqMQBhDx9PJCkaDIK2SmOAofD5Geziom8s9MHO9RFV6KgEOx1NthtB
	 XCSXS/1UoJ0YpYDG0Qd7HWj8jUOiL4LreVOwjJ+Q/IL4G+fUj8g0ZrmgneXxrrOn2jtpO
	 K2Q1sR2RD4B9T6ysJ1o7TWJGN1yCmrrgnZ6jhIVoYz3Bc/P4xnuj2i17brutXW5VkbChk
	 Y+xxqorXORnMg/xJeGgNiJ4iqs+UAftFe4DTbJVnLcVO8w2GphUfDMWdi4j3VBo3gLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=HrDiOoi3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BF8606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=HrDiOoi3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A521F01825;
	Tue, 27 Oct 2026 16:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793119410;
	bh=BpW1F/uJk2W7aZSi1PFxYcUGdf7bE/CFaahxMUXCViQ=;
	h=From:Subject:Date:To:Cc;
	b=HrDiOoi3fMYuWpMuaOO6FQ0WAGQXBODeaMbINwN4FIoqzu84ESxcIebdxUATBScn0
	 Cs1sGcQ7JLFAsVN71RN15iCPmGdvqCwTyxvXwzYwgPO+SrSmCmSNPbIuNhPv3GgrKA
	 kne+UEpZn2/4WwIh4i/qVBAZxV1QrH7bWFMK9e6s=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 0/5] comedi: some small llm-found fixes
Date: Tue, 27 Oct 2026 17:43:27 +0100
Message-Id: <20261027-llm-char-misc-comedi-v1-0-1899771ee15b@linuxfoundation.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywrCMBCF4Vcps3YgiTQBX6W4iMmoI7mUTBWh9
 N1N6/LjcP4VhBqTwGVYodGHhWvp0KcBwtOXByHHbjDKWK2Mw5Qy9qVhZgkYaqbI6D05fR7HaKK
 Ffp0b3fl7ZKfr3/K+vSgsewu27QedJlRoeAAAAA==
X-Change-ID: 20261027-llm-char-misc-comedi-aae71355d2d6
To: Ian Abbott <abbotti@mev.co.uk>, 
 H Hartley Sweeten <hsweeten@visionengravers.com>, 
 Frank Mori Hess <fmhess@users.sourceforge.net>
Cc: Josef Bacik <josef@toxicpanda.com>, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable <stable@kernel.org>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=1069;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=rVE8/ymwPPGnO+VXzNe3Cj22sT2e45ZGGJOtf5kLYSQ=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPrmw4vUuv/oAT//HAnIcKVdcyti++Nfd2uFWImENU5
 NlpTCqVHbEsDIJMDLJiiixftvEc3V9xSNHL0PY0zBxWJpAhDFycAjARPyuGubIt6qzvF0vdqKmW
 NvvJ9HM+X4g0D8M8zTlzRL93VoX/47D59/ajFNc+W9tAAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

Here's a series of some small llm-found fixes that have been sent to me
recently.  Most of them are just minor bugfixes, but they are good to
have from what I can tell.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
Josef Bacik (5):
      comedi: fix endless recursion in comedi_event()
      comedi: addi_apci_1500: fix clearing of the gate enable
      comedi: ni_660x: don't poll without a DMA channel
      comedi: ni_tio: Fix overflow of the clock period
      comedi: vmk80xx: report failed transfers of the K8061

 drivers/comedi/comedi_fops.c            |  2 +-
 drivers/comedi/drivers/addi_apci_1500.c |  2 +-
 drivers/comedi/drivers/ni_660x.c        |  3 ++-
 drivers/comedi/drivers/ni_tio.c         |  2 +-
 drivers/comedi/drivers/vmk80xx.c        | 25 ++++++++++++-------------
 5 files changed, 17 insertions(+), 17 deletions(-)
---
base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
change-id: 20261027-llm-char-misc-comedi-aae71355d2d6

Best regards,
--  
Greg Kroah-Hartman <gregkh@linuxfoundation.org>

