Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7894FDE6C;
	Wed,  9 Sep 2026 14:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788962447; cv=none; b=ShMpnLBko9ZulnqNl/avv4R7TJd55qXDidT4h5wc/t4X6I8S4uc8R/cNVyShtB4n83W5A77dJd1/M14eeuP0xx/P7yBDR6Pednsq9lYk3yh0CJKhaT4VQkAh4Rgk5+4SlvG1mv0Rm+6QiP2N9hwxGXh3+fxMxFfRDz5uxjsEHYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788962447; c=relaxed/simple;
	bh=yCeWIIed9NUQt2wO2puHP/5fFt1rUsZBQDhgGEAVpmY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tZ/DfGJOVjhh7tIrpI7wjRSN+1VDTwjP4faa0JW3Frp+Krl9BLZg24xcu+d6/1+akqaEqHkLXhOIsF/i32jH0e+I4q6itlrsO/dBkwx/OcaJpHE6dpuBkiVz97pr/HD7bYt+mR7TzuLFrz0tMzyMkNM+nEiWDdiH4WZHvu3RJ8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=bCr1yvYu; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=X44VOQm1; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="bCr1yvYu";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="X44VOQm1"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hg2Wv55qlzMlHC;
	Wed, 09 Sep 2026 16:00:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788962443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T+vnc0fChBu8a1hJq5iRP0kdyV0RgFeG8COTLf4lByI=;
	b=bCr1yvYuAKF58ACbupCnLa4DXuGcitYVKvWQBmwYhFz9PPzPpqfd6aQk2vsmqCln8DZWIx
	CaJ5lA23i3xrVH/fipl82Oa4GTTMXCK+kY4RnKolDOmuLTNxu5CRIcLwNWaUSNNW0nIPE3
	IUgL4BO7Bg3YQ5FqynhzYmnSy4USzK+ZO+VUrf/rsiFXWAmeuwBlrsX2TTnWSsLKuH9kW1
	xzITXU+i3S1z+GoPIgF+DIFrxO/3i/5CXtxYLRcJtXk9h3ZgsNttlex2lIQgy2A0sU3w/4
	d9n/vAKfl75Pi1Fe9Zli9U622iPYrzHRO/7r7T3vDaI5ettZHmwgHEKiiyBmPw==
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788962442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T+vnc0fChBu8a1hJq5iRP0kdyV0RgFeG8COTLf4lByI=;
	b=X44VOQm1U5b0kN7PGmKk9CYf7bbsJ++NoY3Uuein6dyLCm+yvXMIb1+dxf1/6fZP7GIMiA
	jPoEvUWs0awEw0gkdUq6ReuxwmHdL1sDzTgvIdAhqprEeapuzW20SXMGV4lDPvYZ5mZuCT
	QjU9r3CZm/XBD9cJk3Ry39qfgc2TYzkxlyvvXRj4v5Qj8EK8LIdMQRT68DRPVF4qVqSaSb
	IzgoHjKnRTQceKUkvUzftmnW+iCQybSfS+yjxBZX++9RY177OYqzniInEke+io2nzw8FKJ
	uARqBsF55+WaZmAorvgsq8nNNSVxqja56v1UB7nmG+rYt1Dy3Oe/QDkKdZIKdQ==
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: docs: Fix bracket
Date: Wed,  9 Sep 2026 15:59:34 +0200
Message-ID: <20260909135934.1365544-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: tr8o5r868sk6rkj9mrsp1wys6zzn77xf
X-MBO-RS-ID: 49179fa391afa16be6d

Remove needless '('.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
 Documentation/userspace-api/media/dvb/fe-set-voltage.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/dvb/fe-set-voltage.rst b/Documentation/userspace-api/media/dvb/fe-set-voltage.rst
index 4d09ca587..d780e67d7 100644
--- a/Documentation/userspace-api/media/dvb/fe-set-voltage.rst
+++ b/Documentation/userspace-api/media/dvb/fe-set-voltage.rst
@@ -37,7 +37,7 @@ cable to 13V, 18V or off.
 Usually, a satellite antenna subsystems require that the digital TV
 device to send a DC voltage to feed power to the LNBf. Depending on the
 LNBf type, the polarization or the intermediate frequency (IF) of the
-LNBf can controlled by the voltage level. Other devices (for example,
+LNBf can controlled by the voltage level. Other devices for example,
 the ones that implement DISEqC and multipoint LNBf's don't need to
 control the voltage level, provided that either 13V or 18V is sent to
 power up the LNBf.
-- 
2.54.0

