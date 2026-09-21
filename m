Received: from mta0.migadu.com (out-148.mta0.migadu.com [91.218.175.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68AE4BEE3F
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005480; cv=none; b=szTUghkxAKfUjmvCVdVh28gVTsJSU/tu0KdMJzj1xGUIK3tvGG6AKFAyQlH7WzSZbioYsZ0PQm8bqQuOBnpulDf+KKHDy1YYzIZrYVj3V6pNWulqxS/XgsVNBWTGiqWnxkjmb/PNRHETb0EpBkIT+VORcuYClsiBzegGPiUnRAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005480; c=relaxed/simple;
	bh=R7UzU6DQyvfsoxVZCBY2GBq5YrEatRYVe4sPLrMait4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W1eSn3lpTGJpyYURTFGUO1127e6WUQXimLX19nCp3FVJPez3p17Lzf7ND0kIog2sC2yIknZBZbIZU4WB5toWYsI3/0djfW/4APCUpU9N5KZtsbrDFE8z8RtjN1JaoDk+y2nnfG0glEaTuPIEsdcqQKdc7oS78STjnWmG+ZqiWiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=w+/9nWSt; arc=none smtp.client-ip=91.218.175.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="w+/9nWSt"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=R7UzU6DQyvfsoxVZCBY2GBq5YrEatRYVe4sPLrMait4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790005476; v=1; x=1790610276;
 b=w+/9nWStZUywRoAlclattsNFWjP7ZwLonuv9uq9XjwpyaVRk6/5JMePpt3eyeMpyZlgsrbPE
 sKZTDZyayxxNTULknPNI1syBZ8JbFRx86wrFY/kJPwUEu0C5wHRBCvQrYaKK6N/uuOy+5hGChc2
 ylAkqaE+UnP/ErGTQLXmgoF4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 49814709df555b8e;
	Mon, 21 Sep 2026 15:44:36 +0000
X-Mizu-Trace-ID: 49814709df555b8e
X-Migadu-Flow: FLOW_OUT
From: Luka Gejak <luka.gejak@linux.dev>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v3 6/6] MAINTAINERS: add entry for the RTL8723B rtw88 driver
Date: Mon, 21 Sep 2026 17:43:47 +0200
Message-ID: <20260921154347.82317-7-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921154347.82317-1-luka.gejak@linux.dev>
References: <20260921154347.82317-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Luka Gejak as the maintainer for the RTL8723B/RTL8723BS support in
rtw88.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0b42e898f4d8..5687c846df3a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23007,6 +23007,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/dsa/realtek.yaml
 F:	drivers/net/dsa/realtek/*
 
+REALTEK RTL8723B WIRELESS DRIVER (rtw88)
+M:	Luka Gejak <luka.gejak@linux.dev>
+L:	linux-wireless@vger.kernel.org
+S:	Maintained
+F:	drivers/net/wireless/realtek/rtw88/rtw8723b*.c
+F:	drivers/net/wireless/realtek/rtw88/rtw8723b*.h
+
 REALTEK SPI-NAND
 M:	Chris Packham <chris.packham@alliedtelesis.co.nz>
 S:	Maintained
-- 
2.55.0

