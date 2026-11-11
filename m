Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.81.71.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794396911;
	b=KSQoJ/XNRn8iTc3F0C8DUApqJxVCN4UJr63p7ln9aOjMdFpn6UblLk0U8RZwsJWRegKD
	 ciXvQb4/YASoXT6yzmIQLSD8ayf6BVTKgzVGWI+oyCV4ZzxHRONyTNa0lVoRXi5v6JChl
	 RKhMTG0ZI0QdcM1kmdUz1B4WyT9rIeBCcufTkj4p+KSAmLnT3bSKO9U7oImWmysDCX9J4
	 gBNpW165KKCvSDaVj+5PimZ3Io0ts+fplhdyIsDMILzX36YjL3eVhAgNUtN+8c/5PR2qd
	 9liEpgnoSBlb1z3Nw6XnfyxuVJnOT3PL51323GLPUU5wzbnBCOsJOWIE7Gigxl9waBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794396911;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:From:Subject:
	 x-ms-reactions:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Developer-Signature:X-Developer-Key;
	bh=M1EINSxaHyw1H+TMjQrZwWJ4f5dmRsJg5xz1fJV79Ko=;
	b=nyofoo0KYianS9n53XvNR5u05+idFV8LUeeNmqqqf5yCfjFou7trUUbyaHXJDwiQ2rbz
	 B7pXwXy5H/6aMJesLFsZP9s/iuNvFGLzWnsvCr88hHlnGCQsy5XmbDc05yCVBmq3hU5ys
	 v+bAQ9Oh9v0PGaLRz8voxGgfQWVRLbQUQPYOG+ZhZpPV5IDbqFUlNPggVAwEfo+reinyF
	 vo7EmL03ysWvKW+MwavQ2/gdgGZvAzkwNnKujpTZAs9nEfT/tFtLsUERGLIz0OxAldWFE
	 v4Oy+GUqBZc6hx1LC1/LDRvzdeqo/fkqjzCm+/Rrtw99LMnraAxBEBbxA6J4/OQYoCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=puzzle.ch;
	spf=pass smtp.mailfrom=puzzle.ch;
	dkim=pass header.d=puzzle.ch header.i=@puzzle.ch header.a=rsa-sha256 header.s=20211209 header.b=msfu451e;
	dkim=pass header.d=puzzle.ch header.i=@puzzle.ch header.a=rsa-sha256 header.s=20211230 header.b=fKCj+X1H;
	arc=none smtp.remote-ip=45.81.71.124
Received: from mx03.puzzle.ch (mx03.puzzle.ch [45.81.71.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DEA606A32A;
	Wed, 11 Nov 2026 11:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4DEA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=puzzle.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=puzzle.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=puzzle.ch header.i=@puzzle.ch header.a=rsa-sha256 header.s=20211209 header.b=msfu451e;
	dkim=pass (2048-bit key) header.d=puzzle.ch header.i=@puzzle.ch header.a=rsa-sha256 header.s=20211230 header.b=fKCj+X1H
Received: from mailstore02.cloud.puzzle.ch (mail.puzzle.ch [IPv6:2a06:c00::5086])
	by mx03.puzzle.ch (Postfix) with ESMTPS id 61114193;
	Wed, 11 Nov 2026 12:35:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=puzzle.ch; s=20211209;
	t=1794396902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=M1EINSxaHyw1H+TMjQrZwWJ4f5dmRsJg5xz1fJV79Ko=;
	b=msfu451evHrWY7AtkmoYqMxp8lQy2+i94cYA4ua2MaIs+x7E4ognQXN83fyC27WLMKrzor
	vkPNgkQKnmayi8oKKTGCFX6A0b6iYJh1hI+s18DrbrSOiwbPOEame0aTshV5tjANr2XNdv
	IzZHjdSza25nmCnzj2SX7S53VirKVyzw8G2y+fkNCOfmzcmtj38B1YWmNdUmGx0+tlZQiE
	dAtGPAl+5G3eQNr9Pvunl/ZDDFP9Ter+voG1amF2dgnxWRbz7ovkiJlg/MtvzA25AaJ6CZ
	8m5n5YqauUqx9/P9AAkdVGVkmPsx8URrje7oiBLEq61mKpsHnRUyIfBD+f6N2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=puzzle.ch; s=20211230;
	t=1794396902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=M1EINSxaHyw1H+TMjQrZwWJ4f5dmRsJg5xz1fJV79Ko=;
	b=fKCj+X1HaTq7zJ1Fir56kSTfTq9phCoZtxWn33kAY9OYSm2MqWx6U5vehp7200RgDm1sF3
	CKNrZ0+GOzySrGLL2VE/MXll9tKq3au+Ek4qS9j4vTHgiJwPmiwk+WdkQB+3QxgTBZXJsk
	zlstpXW1lIBIAVmy53nL9rmrGgoFMjlyUeYYNJ+3c/e22TarvwyYID/WxlaId45INRGGq4
	VcMrqpzDv9s1c97g3qgRPQcbPjsfR0YFvzqmEA/Gvmdcd1mvaoNmLDKqbFCzCORRqppklj
	D+MMVGqIujn1tk0I9SvupntFaoNdvg6Hdp5C5p1NCOZipt+pEMw7JRy8FNsGDQ==
From: Michael Grzeschik <grzeschik@puzzle.ch>
Subject: [PATCH 0/2] usbip: stability changes
x-ms-reactions: disallow
Date: Wed, 11 Nov 2026 12:34:52 +0100
Message-Id: <20261111-usbip-v1-0-da5217ac71d7@puzzle.ch>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDINAtLU7KLNBNS04ySzEwMjI1STRXAqotKEpNy6wAmxMdC+EXlyZlpSa
 XgDQr1dYCAMAQuWZpAAAA
X-Change-ID: 20261111-usbip-fcb6d02254a7
To: Valentina Manea <valentina.manea.m@gmail.com>, 
 Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Michael Grzeschik <grzeschik@puzzle.ch>
X-Developer-Signature: v=1; a=openpgp-sha256; l=908; i=grzeschik@puzzle.ch;
 h=from:subject:message-id; bh=p3Gb9PfSetQLF1brE+Jatwu4F0hAAwy6WhmYgARmMWo=;
 b=owEBbQKS/ZANAwAKAb9pWET5cfSrAcsmYgBq9FLjULc0sMqJWG0zkrwAVmKUzXXZN8Xnm3n/g
 VZSnUEuWKWJAjMEAAEKAB0WIQQV2+2Fpbqd6fvv0Gi/aVhE+XH0qwUCavRS4wAKCRC/aVhE+XH0
 q1waEACKPqrjYgrqsIx1tTpPpHM+/p1WaaEkwWywpf2lmWDW7XUC84RXJpcCoYHxRDDOzkMCEKd
 GvUNzskT9NSQc7Cz7paGMwnK4U+wX+oWXVE/gwBt8r27joUTGix4A5yc082bnjkjgt9xOjCnWhm
 HO+Zge00KrQWkOkk0j0kLh8GukkG33IMHCx18OYvAyke8wEhlo2JUrYY5lQkXsad4ujmjY3kxmG
 3YVFtxlFSI7c5euoRGovSJ79hvL4YH6rNr4Mhv2CROCII6P7duUGy7XTq+bsCUOgwF3+Xo8ReZA
 TZCLdwWhHMYueQWTp68o6MMFAQpJYtnIiMv+yyTI51Tk8/IDjvPRHVavOIevsoUKiXIi4OtKf0W
 UIanfDmfuBiJeMrL9BjKsc4Vnw5RQlH+LU8LLNYjoK3J83vrexK8T9w4eZJpXzjAeKUmwulzVGY
 Ip7aAEz8mHMfNfw/ZL4gp4Yxap6PTQ0nHgOfxHgvkjgK0ctrh+likU3ouS7iKEfX+3i4wVmweoD
 sAiHdDLCu2ESpSz22wxo2knv3z39wTujnYemvglOzRaWgyDmpOApWS9ZT4VXwPj6Bc41vikMdFd
 DJqImC7zImlo1iiZ2SY7tiHAl/Mc/yizDTwuBxCPm6XHFQp7GgRYK98mlR03qWCsydsX6BYKVJy
 83QpohouSmkS0Cw==
X-Developer-Key: i=grzeschik@puzzle.ch; a=openpgp;
 fpr=957BC452CE953D7EA60CF4FC0BE9E3157A1E2C64

While using usbip on kirkwood embedded machine, I came accross
some stability issues. This series is addressing the reference counting
on and usage of the event handler itself.

Signed-off-by: Michael Grzeschik <grzeschik@puzzle.ch>
---
Michael Grzeschik (2):
      usbip: stub: reference count struct stub_device
      usbip: identify the event handler with current_work()

 drivers/usb/usbip/stub.h         |  3 ++
 drivers/usb/usbip/stub_dev.c     | 69 ++++++++++++++++++++++++++++++++--------
 drivers/usb/usbip/stub_rx.c      |  3 ++
 drivers/usb/usbip/stub_tx.c      |  3 ++
 drivers/usb/usbip/usbip_common.h |  6 ++++
 drivers/usb/usbip/usbip_event.c  | 17 +++++-----
 6 files changed, 79 insertions(+), 22 deletions(-)
---
base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620
change-id: 20261111-usbip-fcb6d02254a7

Best regards,
--  
Michael Grzeschik <grzeschik@puzzle.ch>

