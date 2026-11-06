Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793955797;
	b=CM1puBuVQm8CQwm2eyGIdFmO0PhRIRVvBeT+K6hc4CM4Zh+AgBvT4DmxHRIA2HCy66rP
	 uKNGB+1qor3QbkByF2y8dXpfOs+Iz2NnwiIXtLiJCOKJ5CbA51hJcGZKNSYIyVYE5j5FI
	 RKEv1ucIWRQ3XXZaMOyqJJmkQmxTq+Fpk55ZviR5lnBLP8ykR1tK95zDw8BvXQl6YupNl
	 UU2T24HN86jvCRjrG803jB/LXbSUsrBfcm//Zjss52pXzAe6/L9ges5sTVCpCx7EUDNTM
	 JhRrA6HrzTDUg/lTMhzS/Z5Ta1FMV7jtLZvXE2XEJ01Z57gNANaiVO3bYEYT7FaDOGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793955797;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=Mqv/K8DUVr9IpM3Rb+n6/zt8hfdZ+2BbUXAXIg8tKGE=;
	b=T1+1H5Baj0hiSTVRPjlbi+gDloi1o6YAlsSZl3keBjSwReWQOOuoLhQgmRrGZT2BlTdO
	 eU4ko6kMIE2sBEUezJBUwBq+ZmpOh3/bHp5aNpp/XOTpavRn0QDNGEmoSwOMY1l/ZNKnM
	 nK0l4/FaqsYsOOXexQzwy+fWbRgTmNSdWDDHWVZD9skUwu5BHWB38GhP6Ho6CTWuxCJTe
	 gkWWZsPM79V69eC7OHDqt//WSyLDaLhNNdLwQIXfYioUKNUW4+ymaJYHnVTaaApSSZIMG
	 aMN03QV3E4J/mSC8I7I0Y9qL80UoEyS2+3hH3yEjSPBtKfqSkymEj0iUuGMZ/W8ynUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sk6ACDg6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBC9606A326;
	Fri,  6 Nov 2026 09:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sk6ACDg6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 379D61F008A1;
	Fri,  6 Nov 2026 09:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793955796;
	bh=Mqv/K8DUVr9IpM3Rb+n6/zt8hfdZ+2BbUXAXIg8tKGE=;
	h=From:To:Cc:Subject:Date;
	b=Sk6ACDg6zvIjYbhN3RkQadFKTLivzBxWLPZfyLIhNHsRo82wjDoaAtipssneygZXJ
	 ZyPYKTu9z/Hn7pY4XtwcRJyn7dy5hyz34CiV9ZGMHGLSPZo725Bs2gfXrTyjadIrv+
	 xXUqsieQhnITzcOVtaxbGXbMxiqzKPumjmQe3yrGgvg1jnewc7p1woien8ZuynsP7X
	 HyOOG17w0s0BSYZn9OVEwCkfEU4F6YXa4cOFiq+z7jzm0A7QsA9i6sxnf1qFNbXn6Z
	 3JnfRjgOI2lhD60fawAWSn37yqrUk82Roxrd3ju/Cqgrbg7mwZUy4pGTLu11aUI+bE
	 +mZA2CHqFFSVw==
From: Thorsten Blum <blum@kernel.org>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] USB: serial: console: use isdigit() in usb_console_setup()
Date: Fri,  6 Nov 2026 10:03:05 +0100
Message-ID: <20261106090304.2410-2-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=865; i=blum@kernel.org; h=from:subject; bh=KxbJ4wPcdKVwMNjJSVQtpG7QhliVGIr0HwmK+ZZHO5Y=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlvp59oqvPuf7MxYl3DthNPr35y0Pu2ye+tt6um95J3z FbHc4smd5SyMIhxMciKKbI8mPVjhm9pTeUmk4idMHNYmUCGMHBxCsBEfl5n+F9f+zbVTrdvzaPO SDmxbtXXdpYndkjULZicL1Dut3Gv2TGGv4IfGmbeTfdPur/+SkqlMUtV6SxdjsPZ2adub3m255U XEzMA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Use isdigit() to replace the open-coded implementation.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 drivers/usb/serial/console.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/serial/console.c b/drivers/usb/serial/console.c
index 29f09190846e..25ea57c8fd3f 100644
--- a/drivers/usb/serial/console.c
+++ b/drivers/usb/serial/console.c
@@ -15,6 +15,7 @@
 #include <linux/slab.h>
 #include <linux/tty.h>
 #include <linux/console.h>
+#include <linux/ctype.h>
 #include <linux/serial.h>
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
@@ -70,7 +71,7 @@ static int usb_console_setup(struct console *co, char *options)
 	if (options) {
 		baud = simple_strtoul(options, NULL, 10);
 		s = options;
-		while (*s >= '0' && *s <= '9')
+		while (isdigit(*s))
 			s++;
 		if (*s)
 			parity = *s++;
